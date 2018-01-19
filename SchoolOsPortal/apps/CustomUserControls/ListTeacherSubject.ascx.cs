using InterLinkClass.PegPaySchoolsApi;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CustomUserControls_ListTeacherSubject : System.Web.UI.UserControl
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
        bll.LoadDataIntoDropDownALL("GetTeachersForDropDown", new string[] { ddSchools.SelectedValue }, ddTeachers);
        bll.LoadDataIntoDropDownALL("GetTermsForDropDown", new string[] { ddSchools.SelectedValue }, ddSemester);
       
    }

    protected void btnExport_Click(object sender, EventArgs e)
    {
        try
        {
            string ExportType = ddExportType.SelectedValue.ToUpper();
            DataTable dt = bll.ConvertGridViewToDataTable(dataGridResults);

            if (ExportType == "EXCEL")
            {
                bll.ExportToCSV(dt, Response);
                return;
            }
            if (ExportType == "WORD")
            {
                bll.ExportToWord(dt, Response);
                return;
            }
        }
        catch (Exception ex)
        {
            string msg = "FAILED: " + ex.Message;
            bll.ShowMessage(lblmsg, msg, true);
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
        DataTable dt = bll.SearchTable("SearchTeacherSubjectsTable", searchParams);
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
        string school = ddSchools.SelectedValue;
        string Class = ddTeachers.SelectedValue;
        string Sem = ddSemester.SelectedValue;
        all.Add(school);
        all.Add(Sem);
        all.Add(Class);
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

            Result result = SaveStudentResults.LoadDataUsingTeacherSubjectID(ID);

            if (result.StatusCode != Globals.SUCCESS_STATUS_CODE)
            {
                string msg = "FAILED: " + result.StatusDesc;
                bll.ShowMessage(lblmsg, msg, true);
                return;
            }

            MultiView1.SetActiveView(EditStudentsView);

        }
        catch (Exception ex)
        {
            string msg = "FAILED: " + ex.Message;
            bll.ShowMessage(lblmsg, msg, true);
        }
    }
}