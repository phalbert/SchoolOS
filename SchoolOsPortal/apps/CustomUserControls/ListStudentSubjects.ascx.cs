using InterLinkClass.PegPaySchoolsApi;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CustomUserControls_ListStudentSubjects : System.Web.UI.UserControl
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
        bll.LoadDataIntoDropDownALL("GetTermsForDropDown", new string[] { ddSchools.SelectedValue }, ddSemesters);
        bll.LoadDataIntoDropDownALL("GetStudentsForDropDown", new string[] { ddSchools.SelectedValue, "ALL" }, ddStudents);
        bll.LoadDataIntoDropDown("GetClassesForDropDown", new string[] { ddSchools.SelectedValue }, ddClasses);

        if (user.User.UserType == "SCHOOL_STUDENT")
        {
            LoadStudentDetails();
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

    private void LoadStudentDetails()
    {
        Student std = bll.GetStudentById(user.User.Username, user.User.SchoolCode);

        if (std.StatusCode != Globals.SUCCESS_STATUS_CODE)
        {
            ddStudents.Items.Clear();
            throw new Exception("FAILED: " + std.StatusDesc);
        }

        ddStudents.ClearSelection();
        ddStudents.SelectedValue = std.StudentNumber;
        ddStudents.Enabled = false;
        ddClasses.SelectedValue = std.ClassCode;
        ddClasses.Enabled = false;
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
        DataTable dt = bll.SearchTable("SearchStudentSubjectsTable2", searchParams);
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
        string Semester = ddSemesters.SelectedValue;
        string Class = ddClasses.SelectedValue;
        all.Add(name);
        all.Add(StudentId);
        all.Add(Semester);
        all.Add(Class);
        return all.ToArray();
    }

    protected void dataGridResults_RowCommand(object sender, GridViewCommandEventArgs e)
    {

    }
}