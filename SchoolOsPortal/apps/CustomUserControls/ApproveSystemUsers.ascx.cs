using InterLinkClass.PegPaySchoolsApi;
using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ApproveSystemUsers : System.Web.UI.UserControl
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
        string UserId = row.Cells[1].Text.Trim();
        string SchoolCode = ddSchools.SelectedValue;
        string ApprovedBy = user.User.Username;
        string[] parameters = { UserId, SchoolCode, ApprovedBy,"APPROVED" };
        string msg = "User(s) Approved Successfully";

        //set the users password to something we know
        SystemUser newUser = bll.GetSystemUserById2(UserId);
        newUser.UserPassword = SharedCommons.SharedCommons.GeneratePassword();

        string hashedNewPassword = SharedCommons.SharedCommons.GenearetHMACSha256Hash(newUser.SecretKey, newUser.UserPassword);
        int rowsAffected = schoolsApi.ExecuteNonQuery("ChangePassword", new string[] { newUser.Username, hashedNewPassword });

        //password update failed
        if (rowsAffected == 0)
        {
            msg = "FAILED TO APPROVE SYSTEM USER";
            bll.ShowMessage(lblmsg, msg, false, Session);
            return;
        }

        //send and email with credentials to user
        Result mailResult = bll.SendCredentialsToUser(newUser);

        //failed to send email
        if (mailResult.StatusCode != Globals.SUCCESS_STATUS_CODE)
        {
            msg = msg + ", FAILED TO SEND EMAIL FOR USER [" + newUser.Username + "] WITH CREDENTIALS: " + mailResult.StatusDesc;
            bll.ShowMessage(lblmsg, msg, false, Session);
            return;
        }

        //finally approve the user
        DataTable dt = schoolsApi.ExecuteDataSet("ApproveSystemUser", parameters).Tables[0];

        //failed to approve
        if (dt.Rows.Count == 0)
        {
            string msg1 = "FAILED TO APPROVE SYSTEM USER, No Rows Affected";
            bll.ShowMessage(lblmsg, msg1, true, Session);
            return;
        }

        //display success message
        SearchDB();        
        msg = "SYSTEM USER APPROVED SUCCESSFULLY, EMAIL WITH CREDENTIALS SENT SUCCSSFULLY";
        bll.ShowMessage(lblmsg, msg, false, Session);
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
        string UserId = row.Cells[1].Text.Trim();
        string SchoolCode = ddSchools.SelectedValue;
        string RejectedBy = user.User.Username;
        string msg = "";
        string[] parameters = { UserId, SchoolCode, RejectedBy, "REJECTED" };

        //finally approve the user
        DataTable dt = schoolsApi.ExecuteDataSet("ApproveSystemUser", parameters).Tables[0];

        //failed to approve
        if (dt.Rows.Count == 0)
        {
            string msg1 = "FAILED TO APPROVE SYSTEM USER, No Rows Affected";
            bll.ShowMessage(lblmsg, msg1, true, Session);
            return;
        }

        //display success message
        SearchDB();
        msg = "SYSTEM USER APPROVED SUCCESSFULLY, EMAIL WITH CREDENTIALS SENT SUCCSSFULLY";
        bll.ShowMessage(lblmsg, msg, false, Session);
    }

    private void SearchDB()
    {
        string[] searchParams = GetSearchParameters();
        DataTable dt = bll.SearchTable("SearchSystemUsersTableForUnapproved", searchParams);
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
        string StudentId = txtName.Text;
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

}