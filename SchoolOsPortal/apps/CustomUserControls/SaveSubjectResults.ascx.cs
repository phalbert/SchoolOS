using InterLinkClass.PegPaySchoolsApi;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CustomUserControls_SaveSubjectResults : System.Web.UI.UserControl
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

    public void LoadData()
    {
        bll.LoadSchoolsIntoDropDown(user, ddSchools);
        bll.LoadDataIntoDropDown("GetTermsForDropDown", new string[] { ddSchools.SelectedValue }, ddSemesters);
        ddSemesters.SelectedValue = user.CurrentSemesterCode;
        bll.LoadDataIntoDropDown("GetExamsForDropDown", new string[] { ddSchools.SelectedValue }, ddExams);
        bll.LoadDataIntoDropDownNoSelect("GetTeachersForDropDown", new string[] { ddSchools.SelectedValue }, ddTeachers);
    }

    protected void ddTeacher_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            bll.LoadDataIntoDropDownNoSelect("GetClassesTaughtByTeacher", new string[] { ddSchools.SelectedValue, ddSemesters.SelectedValue, ddTeachers.SelectedValue }, ddClasses);
            //Reload();
        }
        catch (Exception ex)
        {
            bll.LogError("SAVE-CLIENT", ex.StackTrace, "", ex.Message, "EXCEPTION");
            bll.ShowMessage(lblmsg, ex.Message, true, Session);
        }
    }

    public void Reload()
    {
        ddSemester_SelectedIndexChanged(null, null);
        ddTeacher_SelectedIndexChanged(null, null);
        ddClasses_SelectedIndexChanged(null, null);
        ddSubjects_SelectedIndexChanged(null, null);
    }

    protected void ddClasses_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            bll.LoadDataIntoDropDownNoSelect("GetSubjectsTaughtByTeacherInClass", new string[] { ddSchools.SelectedValue, ddSemesters.SelectedValue, ddTeachers.SelectedValue, ddClasses.SelectedValue }, ddSubjects);
            //Reload();
        }
        catch (Exception ex)
        {
            bll.LogError("SAVE-CLIENT", ex.StackTrace, "", ex.Message, "EXCEPTION");
            bll.ShowMessage(lblmsg, ex.Message, true, Session);
        }
    }

    protected void ddSemester_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            bll.LoadDataIntoDropDownNoSelect("GetTeachersWhoEnrolledForSemester", new string[] { ddSchools.SelectedValue, ddSemesters.SelectedValue }, ddTeachers);
            //Reload();
        }
        catch (Exception ex)
        {
            bll.LogError("SAVE-CLIENT", ex.StackTrace, "", ex.Message, "EXCEPTION");
            bll.ShowMessage(lblmsg, ex.Message, true, Session);
        }
    }

    protected void ddSubjects_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            //Reload();
        }
        catch (Exception ex)
        {
            bll.LogError("SAVE-CLIENT", ex.StackTrace, "", ex.Message, "EXCEPTION");
            bll.ShowMessage(lblmsg, ex.Message, true, Session);
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
        DataTable dt = bll.SearchTable("SearchForStudentsInClassWhoEnrolledForSubject", new string[] { ddSchools.SelectedValue, ddSemesters.SelectedValue, ddSubjects.SelectedValue });
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
        all.Add(name);
        return all.ToArray();
    }

    protected void dataGridResults_RowCommand(object sender, GridViewCommandEventArgs e)
    {

    }

    protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
    {
        GridViewRow row = e.Row;
        List<TableCell> columns = new List<TableCell>();
        foreach (DataControlField column in dataGridResults.Columns)
        {
            TableCell cell = row.Cells[0];
            row.Cells.Remove(cell);
            columns.Add(cell);
        }
        row.Cells.AddRange(columns.ToArray());
    }


    protected void btnSaveMarks_Click(object sender, EventArgs e)
    {
        try
        {
            //loop thru the rows
            foreach (GridViewRow row in dataGridResults.Rows)
            {
                //for each row get the checkbox attached
                TextBox txtMark = (TextBox)row.FindControl("txtMark");
                string StudentNumber = row.Cells[1].Text.Trim();

                SubjectResults result = new SubjectResults();
                result.ExamCode = ddExams.SelectedValue;
                result.Mark = txtMark.Text;
                result.ModifiedBy = user.User.Username;
                result.SchoolCode = ddSchools.SelectedValue;
                result.StudentId = StudentNumber;
                result.SubjectCode = ddSubjects.SelectedValue;
                result.TermCode = ddSemesters.SelectedValue;
                Result saveResult = schoolsApi.SaveSubjectResult(result);

                if (saveResult.StatusCode != Globals.SUCCESS_STATUS_CODE)
                {
                    string msg = "FAILED: " + saveResult.StatusDesc;
                    bll.ShowMessage(lblmsg, msg, true);
                    return;
                }
            }

            string msg1 = "RESULTS SAVED SUCCESSFULLY";
            bll.ShowMessage(lblmsg, msg1, false);
        }
        catch (Exception ex)
        {
            string msg = "FAILED: " + ex.Message;
            bll.ShowMessage(lblmsg, msg, true);
        }
    }
}