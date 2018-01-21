using InterLinkClass.PegPaySchoolsApi;
using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ApproveSchools : System.Web.UI.UserControl
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
        //bll.LoadCompaniesIntoDropDown(user, ddCompanies);
        //SearchDB();
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
        DataTable dt = bll.SearchSchoolsTableForUnapprovedSchools();
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
        string SchoolCode = row.Cells[1].Text.Trim();
        string ApprovedBy = user.User.Username;
        string[] parameters = {  SchoolCode, ApprovedBy,"APPROVED" };

        DataTable dt = schoolsApi.ExecuteDataSet("ApproveSchool", parameters).Tables[0];
        if (dt.Rows.Count != 0)
        {
            SearchDB();
            string msg = "School(s) Approved Successfully";
            bll.ShowMessage(lblmsg, msg, false, Session);
        }
        else
        {
            string msg = "No Rows Affected";
            bll.ShowMessage(lblmsg, msg, true, Session);
        }
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
        string[] parameters = { SchoolCode, ApprovedBy,"REJECTED" };

        DataTable dt = schoolsApi.ExecuteDataSet("ApproveSchool", parameters).Tables[0];
        if (dt.Rows.Count != 0)
        {
            SearchDB();
            string msg = "School(s) Rejected Successfully";
            bll.ShowMessage(lblmsg, msg, false, Session);
        }
        else
        {
            string msg = "No Rows Affected";
            bll.ShowMessage(lblmsg, msg, true, Session);
        }
    }
}