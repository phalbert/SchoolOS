using InterLinkClass.PegPaySchoolsApi;
using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ApproveStudents : System.Web.UI.UserControl
{
    public event EventHandler EditSchoolEvent;
    SystemUserDetails user;
    Service schoolsApi = new Service();
    Bussinesslogic bll = new Bussinesslogic();

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {

            user = Session["User"] as SystemUserDetails;
            Session["IsError"] = null;

            //Session is invalid
            if (user == null)
            {
                Response.Redirect("Default.aspx?MSG=SESSION HAS EXPIRED");
            }
            else if (IsPostBack)
            {

            }
            else
            {
                LoadData();
            }
        }
        catch (Exception ex)
        {
            bll.ShowMessage(lblmsg, ex.Message, true, Session);
        }
    }

    private void LoadData()
    {
        bll.LoadSchoolsIntoDropDown(user, ddSchools);
        //SearchDb();
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            SearchDB();
        }
        catch (Exception ex)
        {
            string msg = "FAILED: " + ex.Message;
            bll.ShowMessage(lblmsg, msg, true);
        }
    }

    private void SearchDB()
    {
        string[] searchParams = GetSearchParameters();
        DataTable dt = bll.SearchTable("SearchStudentsTableForUnapprovedStudents", searchParams);
        if (dt.Rows.Count > 0)
        {
            dataGridResults.DataSource = dt;
            dataGridResults.DataBind();
            string msg = "Found " + dt.Rows.Count + " Records Matching Search Criteria";
            Multiview2.SetActiveView(resultView);
            bll.ShowMessage(lblmsg, msg, false, Session);
        }
        else
        {
            dataGridResults.DataSource = null;
            dataGridResults.DataBind();
            Multiview2.SetActiveView(EmptyView);
            string msg = "No Records Found Matching Search Criteria";
            bll.ShowMessage(lblmsg, msg, true, Session);
        }
    }

    private string[] GetSearchParameters()
    {
        List<string> all = new List<string>();
        string name = ddSchools.SelectedValue;
        string StudentId = txtStudentId.Text;
        all.Add(name);
        all.Add(StudentId);
        return all.ToArray();
    }

    protected void dataGridResults_RowCommand(object sender, GridViewCommandEventArgs e)
    {

    }

    protected void dataGridResults_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            CheckBox ChkBoxHeader = (CheckBox)dataGridResults.HeaderRow.FindControl("chkboxSelectAll");
            foreach (GridViewRow row in dataGridResults.Rows)
            {
                CheckBox ChkBoxRows = (CheckBox)row.FindControl("CheckBox");
                if (ChkBoxHeader.Checked == true)
                {
                    ChkBoxRows.Checked = true;
                }
                else
                {
                    ChkBoxRows.Checked = false;
                }
            }
        }
        catch (Exception ex)
        {
            string msg = "FAILED: " + ex.Message;
            bll.ShowMessage(lblmsg, msg, true, Session);
        }
    }

    protected void btnApprove_Click(object sender, EventArgs e)
    {
        //loop thru the rows
        foreach (GridViewRow row in dataGridResults.Rows)
        {
            //for each row get the checkbox attached
            CheckBox ChkBox = (CheckBox)row.FindControl("CheckBox");

            //has user ticked the box
            if (ChkBox.Checked)
            {
                //if this row is not the header row
                if (row.RowType != DataControlRowType.Header)
                {
                    try
                    {
                        //approve
                        Approve(row);
                    }
                    catch (Exception ex)
                    {
                        string msg = "FAILED: " + ex.Message;
                        bll.ShowMessage(lblmsg, msg, true, Session);
                    }
                }
            }
        }
    }

    private void Approve(GridViewRow row)
    {
        //get the Bank User Id and the bank code
        string Id = row.Cells[1].Text.Trim();
        string SchoolCode = ddSchools.SelectedValue;
        string ApprovedBy = user.User.Username;
        string[] parameters = { Id, SchoolCode, ApprovedBy };

        //save student as system user
        SystemUser newUser = GetSystemUser(Id, SchoolCode);
        Result result = schoolsApi.SaveSystemUser(newUser);

        //saving student as system user has failed
        if (result.StatusCode != Globals.SUCCESS_STATUS_CODE)
        {
            string msg = "FAILED: " + result.StatusDesc;
            bll.ShowMessage(lblmsg, msg, true, Session);
            return;
        }

        //send creds via email
        Result sendResult = bll.SendCredentialsToUser(newUser);

        //sending credentials email has failed
        if (sendResult.StatusCode != Globals.SUCCESS_STATUS_CODE)
        {
            string msg = "FAILED: " + sendResult.StatusDesc;
            bll.ShowMessage(lblmsg, msg, true, Session);
            return;
        }

        //approve student
        DataTable dt = schoolsApi.ExecuteDataSet("ApproveStudent", parameters).Tables[0];
        if (dt.Rows.Count == 0)
        {
            string msg = "No Rows Affected";
            bll.ShowMessage(lblmsg, msg, true, Session);
            return;
        }

        SearchDB();
        string msg1 = "Student(s) Approved Successfully";
        bll.ShowMessage(lblmsg, msg1, false, Session);
    }

    private SystemUser GetSystemUser(string studentId, string schoolCode)
    {
        Student std = bll.GetStudentById(studentId, schoolCode);
        SystemUser newUser = new SystemUser();
        newUser.ApprovedBy = user.User.Username;
        newUser.Email = std.Email;
        newUser.FullName = std.StudentName;
        newUser.IsActive = "TRUE";
        newUser.ModifiedBy = user.User.Username;
        newUser.Username = std.PegPayStudentNumber;
        newUser.UserPassword = "T3rr1613";
        newUser.UserType = "SCHOOL_STUDENT";
        newUser.SchoolCode = schoolCode;
        newUser.PhoneNumber = std.PhoneNumber;
        newUser.SecretKey = "T3rr16132016";
        newUser.UserCategory = newUser.UserType;
        newUser.ProfilePic = std.ProfilePic;
        return newUser;
    }

    protected void btnReject_Click(object sender, EventArgs e)
    {
        //loop thru the rows
        foreach (GridViewRow row in dataGridResults.Rows)
        {
            //for each row get the checkbox attached
            CheckBox ChkBox = (CheckBox)row.FindControl("CheckBox");

            //has user ticked the box
            if (ChkBox.Checked)
            {
                //if this row is not the header row
                if (row.RowType != DataControlRowType.Header)
                {
                    try
                    {
                        //send reversal request
                        Reject(row);
                    }
                    catch (Exception ex)
                    {
                        string msg = "FAILED: " + ex.Message;
                        bll.ShowMessage(lblmsg, msg, true, Session);
                    }
                }
            }
        }
    }

    private void Reject(GridViewRow row)
    {
        //get the Bank Transaction Id and the bank code
        string SchoolCode = row.Cells[1].Text.Trim();
        string ApprovedBy = user.User.Username;
        string[] parameters = { SchoolCode, ApprovedBy };


    }

    protected void chkboxSelectAll_CheckedChanged(object sender, EventArgs e)
    {

    }
}