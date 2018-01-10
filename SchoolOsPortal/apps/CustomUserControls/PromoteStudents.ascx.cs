using InterLinkClass.PegPaySchoolsApi;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CustomUserControls_PromoteStudents : System.Web.UI.UserControl
{
    public event EventHandler EditEvent;
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
        //bll.LoadDataIntoDropDownALL("GetClassesForDropDown", new string[] { ddSchools.SelectedValue }, ddClasses);
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
        DataTable dt = bll.SearchTable("SearchStudentsTable", searchParams);
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
        all.Add(ddClasses.SelectedValue);
        all.Add(StudentId);
        return all.ToArray();
    }

    protected void dataGridResults_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {

        }
        catch (Exception ex)
        {
            string msg = "FAILED: " + ex.Message;
            bll.ShowMessage(lblmsg, msg, true);
        }
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
        string confirmMsg = GetCountOfSelected("promotion");
        lblConfirmMsg.Text = confirmMsg;
        MultiView1.SetActiveView(ConfirmView);
        ViewState["Op"] = "PROMOTION";
    }

    private string GetCountOfSelected(string op)
    {
        string msg = "";
        int i = 0;
        foreach (GridViewRow row in dataGridResults.Rows)
        {
            i++;
        }
        msg = op == "promotion" ? "PLEASE,CONFIRM PROMOTION OF [" + i + "] STUDENT(S)" : "PLEASE,CONFIRM DEMOTION OF [" + i + "] STUDENT(S)";
        return msg;
    }

    private void DoOneByOnePromotion()
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
        string[] parameters = { SchoolCode, Id, };

        //approve student
        DataTable dt = schoolsApi.ExecuteDataSet("PromoteStudents", parameters).Tables[0];
        if (dt.Rows.Count == 0)
        {
            string msg = "No Rows Affected";
            bll.ShowMessage(lblmsg, msg, true, Session);
            return;
        }

        SearchDB();
        string msg1 = "Student(s) Promoted Successfully";
        bll.ShowMessage(lblmsg, msg1, false, Session);
    }

    protected void btnReject_Click(object sender, EventArgs e)
    {
        string confirmMsg = GetCountOfSelected("demotion");
        lblConfirmMsg.Text = confirmMsg;
        MultiView1.SetActiveView(ConfirmView);
        ViewState["Op"] = "DEMOTION";
    }

    private void DoOnebyOneDemotion()
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
        string Id = row.Cells[1].Text.Trim();
        string SchoolCode = ddSchools.SelectedValue;
        string ApprovedBy = user.User.Username;
        string[] parameters = { SchoolCode, Id, };

        //approve student
        DataTable dt = schoolsApi.ExecuteDataSet("DemoteStudents", parameters).Tables[0];
        if (dt.Rows.Count == 0)
        {
            string msg = "No Rows Affected";
            bll.ShowMessage(lblmsg, msg, true, Session);
            return;
        }

        SearchDB();
        string msg1 = "Student(s) Demoted Successfully";
        bll.ShowMessage(lblmsg, msg1, false, Session);

    }

    protected void btnConfirm_Click(object sender, EventArgs e)
    {
        try
        {
            MultiView1.SetActiveView(SearchView);
            string Op = ViewState["Op"] as string;
            if (string.IsNullOrEmpty(Op))
            {
                string msg = "FAILED: NOT ABLE TO PERFORM OPERATION AT THE TIME,PLEASE TRY AGAIN";
                bll.ShowMessage(lblmsg, msg, true, Session);
                return;
            }

            if (Op.ToUpper() == "PROMOTION")
            {
                PromoteStudents();
                return;
            }

            DemoteStudents();
        }
        catch (Exception ex)
        {
            string msg = "FAILED: " + ex.Message;
            bll.ShowMessage(lblmsg, msg, true, Session);
        }
    }

    private void DemoteStudents()
    {
        CheckBox ChkBoxHeader = (CheckBox)dataGridResults.HeaderRow.FindControl("chkboxSelectAll");
        if (ChkBoxHeader.Checked)
        {
            DoBulkDemotion();
            return;
        }

        DoOnebyOneDemotion();
    }

    private void PromoteStudents()
    {
        CheckBox ChkBoxHeader = (CheckBox)dataGridResults.HeaderRow.FindControl("chkboxSelectAll");
        if (ChkBoxHeader.Checked)
        {
            DoBulkPromotion();
            return;
        }

        DoOneByOnePromotion();
    }

    private void DoBulkDemotion()
    {
        string Id = "ALL";
        string SchoolCode = ddSchools.SelectedValue;
        string[] parameters = { SchoolCode, Id, };

        //approve student
        DataTable dt = schoolsApi.ExecuteDataSet("DemoteStudents", parameters).Tables[0];
        if (dt.Rows.Count == 0)
        {
            string msg = "No Rows Affected";
            bll.ShowMessage(lblmsg, msg, true, Session);
            return;
        }

        SearchDB();
        string msg1 = "Student(s) Demoted Successfully";
        bll.ShowMessage(lblmsg, msg1, false, Session);
    }

    private void DoBulkPromotion()
    {
        string Id = "ALL";
        string SchoolCode = ddSchools.SelectedValue;
        string[] parameters = { SchoolCode, Id, };

        //approve student
        DataTable dt = schoolsApi.ExecuteDataSet("PromoteStudents", parameters).Tables[0];
        if (dt.Rows.Count == 0)
        {
            string msg = "No Rows Affected";
            bll.ShowMessage(lblmsg, msg, true, Session);
            return;
        }

        SearchDB();
        string msg1 = "Student(s) Promoted Successfully";
        bll.ShowMessage(lblmsg, msg1, false, Session);
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        MultiView1.SetActiveView(SearchView);
    }
}