using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class FindStudent : System.Web.UI.Page
{
    Bussinesslogic bll = new Bussinesslogic();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (IsPostBack)
            {

            }
            else
            {
                LoadData();
            }
        }
        catch (Exception ex)
        {
            string msg = "FAILED: " + ex.Message;
            bll.ShowMessageNoColorChange(lblmsg, msg, true);
        }
    }

    private void LoadData()
    {
        bll.LoadDataIntoDropDown("GetSchoolsForDropDown", new string[] { }, ddSchools);
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
            bll.ShowMessageNoColorChange(lblmsg, msg, true);
        }
    }

    private void SearchDB()
    {
        if (string.IsNullOrEmpty(txtName.Text))
        {
            string msg = "FAILED: PLEASE SUPPLY A STUDENT NAME";
            bll.ShowMessageNoColorChange(lblmsg, msg, true);
            return;
        }

        if (string.IsNullOrEmpty(txtDOB.Text))
        {
            string msg = "FAILED: PLEASE SUPPLY A STUDENT DATE OF BIRTH";
            bll.ShowMessageNoColorChange(lblmsg, msg, true);
            return;
        }

        string[] searchParams = GetSearchParameters();
        DataTable dt = bll.SearchTable("SearchForStudentExternal", searchParams);
        if (dt.Rows.Count > 0)
        {
            dataGridResults.DataSource = dt;
            dataGridResults.DataBind();
            string msg = "Found " + dt.Rows.Count + " Records Matching Search Criteria";
            Multiview2.SetActiveView(resultView);
            bll.ShowMessageNoColorChange(lblmsg, msg, false);
        }
        else
        {
            dataGridResults.DataSource = null;
            dataGridResults.DataBind();
            Multiview2.SetActiveView(EmptyView);
            string msg = "No Records Found Matching Search Criteria";
            bll.ShowMessageNoColorChange(lblmsg, msg, true);
        }
    }

    private string[] GetSearchParameters()
    {
        List<string> all = new List<string>();
        string name = ddSchools.SelectedValue;
        string StudentId = txtName.Text;
        string DateOfBirth = txtDOB.Text;
        all.Add(name);
        all.Add(StudentId);
        all.Add(DateOfBirth);
        return all.ToArray();
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Start/Index.html");
    }
}