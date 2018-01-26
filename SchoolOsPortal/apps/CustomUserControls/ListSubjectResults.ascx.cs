using InterLinkClass.PegPaySchoolsApi;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CustomUserControls_ListSubjectResults : System.Web.UI.UserControl
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

        bll.LoadDataIntoDropDownALL("GetTermsForDropDown", new string[] { ddSchools.SelectedValue }, ddSemester);
        bll.LoadDataIntoDropDownALL("GetStudentsForDropDown", new string[] { ddSchools.SelectedValue,"ALL" }, ddStudents);
        bll.LoadDataIntoDropDown("GetExamsForDropDown", new string[] { ddSchools.SelectedValue }, ddExams);

        if (user.User.UserType == "SCHOOL_STUDENT")
        {
            ddStudents.SelectedValue = user.User.Username;
            ddStudents.Enabled = false;
            bll.RemoveFirstColumn(dataGridResults);
        }
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

    public void LoadDataForStudent()
    {
        bll.LoadSchoolsIntoDropDown(user, ddSchools);
        bll.LoadDataIntoDropDownALL("GetTermsForDropDown", new string[] { ddSchools.SelectedValue }, ddSemester);
        bll.LoadDataIntoDropDownALL("GetStudentsForDropDown", new string[] { ddSchools.SelectedValue, "ALL" }, ddStudents);
        bll.LoadDataIntoDropDown("GetExamsForDropDown", new string[] { ddSchools.SelectedValue }, ddExams);
        dataGridResults.Columns.RemoveAt(0);
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
        DataTable dt = bll.SearchTable("SearchSubjectResultsTable", searchParams);
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
        string StudentId = ddStudents.SelectedValue;
        string Semester = ddSemester.SelectedValue;
        string Exam = ddExams.SelectedValue;
        all.Add(name);
        all.Add(StudentId);
        all.Add(Semester);
        all.Add(Exam);
        return all.ToArray();
    }

    protected void dataGridResults_RowCommand(object sender, GridViewCommandEventArgs e)
    {

    }
}