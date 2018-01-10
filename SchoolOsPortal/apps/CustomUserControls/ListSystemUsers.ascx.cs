using InterLinkClass.PegPaySchoolsApi;
using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ListSystemUsers : System.Web.UI.UserControl
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

    private void SearchDB()
    {
        string[] searchParams = GetSearchParameters();
        DataTable dt = bll.SearchTable("SearchSystemUsersTable", searchParams);
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
        try
        {
            if (e.CommandName == "EditEntity")
            {
                EditEntity(sender,e);
                return;
            }
            if (e.CommandName == "ChangePassword")
            {
                ChangePassword(sender, e);
                return;
            }
        }
        catch (Exception ex)
        {
            string msg = "FAILED: " + ex.Message;
            bll.ShowMessage(lblmsg, msg, true);
        }
    }

    private void ChangePassword(object sender, GridViewCommandEventArgs e)
    {
        GridView grid = sender as GridView;
        int index = Convert.ToInt32(e.CommandArgument);
        GridViewRow row = grid.Rows[index];
        string userID = row.Cells[1].Text;
       

        Result result = ChangePasswordUserControl.LoadEntityData(userID);

        if (result.StatusCode != Globals.SUCCESS_STATUS_CODE)
        {
            string msg = "FAILED: " + result.StatusDesc;
            bll.ShowMessage(lblmsg, msg, true);
            return;
        }

        MultiView1.SetActiveView(ChangePasswordView);
    }

    private void EditEntity(object sender, GridViewCommandEventArgs e)
    {
        GridView grid = sender as GridView;
        int index = Convert.ToInt32(e.CommandArgument);
        GridViewRow row = grid.Rows[index];
        string studentID = row.Cells[1].Text;
        string schoolCode = ddSchools.SelectedValue;

        Result result = SaveSystemUsersControl.LoadEntityDataForEdit(studentID);

        if (result.StatusCode != Globals.SUCCESS_STATUS_CODE)
        {
            string msg = "FAILED: " + result.StatusDesc;
            bll.ShowMessage(lblmsg, msg, true);
            return;
        }

        MultiView1.SetActiveView(EditView);
    }
}