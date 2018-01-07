using InterLinkClass.PegPaySchoolsApi;
using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ListSchools : System.Web.UI.UserControl
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
        if (user.User.UserType != "ADMIN")
        {
            txtSchoolName.Text = user.SchoolDetails.SchoolName;
            txtDistrict.Text = user.SchoolDetails.District;
            txtSchoolName.Enabled = false;
        }
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
        DataTable dt = bll.SearchSchoolsTable(searchParams);
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
        string name = txtSchoolName.Text;
        string district = txtDistrict.Text;
        all.Add(name);
        all.Add(district);
        return all.ToArray();
    }

    protected void dataGridResults_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            
            GridView grid = sender as GridView;
            int index = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = grid.Rows[index];
            string ID = row.Cells[1].Text;

            Result result = SaveSchoolsUserControl.LoadSchoolDetailsForEdit(ID);

            if (result.StatusCode != Globals.SUCCESS_STATUS_CODE)
            {
                string msg = "FAILED: " + result.StatusDesc;
                bll.ShowMessage(lblmsg, msg, true);
                return;
            }

            MultiView1.SetActiveView(EditSchoolView);

        }
        catch (Exception ex)
        {
            string msg = "FAILED: " + ex.Message;
            bll.ShowMessage(lblmsg, msg, true);
        }
    }
}