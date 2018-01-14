using InterLinkClass.PegPaySchoolsApi;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CustomUserControls_SaveStudentResults : System.Web.UI.UserControl
{
    public event EventHandler SaveCompleted;
    Bussinesslogic bll = new Bussinesslogic();
    SystemUserDetails user = new SystemUserDetails();
    Service schoolApi = new Service();

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {

            user = Session["User"] as SystemUserDetails;
            Session["IsError"] = null;
            string Id = Request.QueryString["BankCode"];

            //Session is invalid
            if (user == null)
            {
                Response.Redirect("Default.aspx?Msg=SESSION HAS EXPIRED");
            }
            //Page posting back user request
            else if (IsPostBack)
            {

            }
            //Load Old details
            else if (!string.IsNullOrEmpty(Id))
            {
                LoadEntityData(Id);
            }
            //First time Request
            else
            {
                LoadData();
            }
        }
        catch (Exception ex)
        {
            //something is wrong...show the error
            bll.ShowMessage(lblmsg, ex.Message, true, Session);
        }
    }

    public void LoadData()
    {
        btnSubmit.Visible = true;
        btnEdit.Visible = false;

        bll.LoadSchoolsIntoDropDown(user, ddSchools);
        bll.LoadDataIntoDropDown("GetTermsForDropDown", new string[] { ddSchools.SelectedValue }, ddSemester);
        ddSemester_SelectedIndexChanged(null, null);
        ddTeacher_SelectedIndexChanged(null, null);
        ddClasses_SelectedIndexChanged(null, null);
        ddSubjects_SelectedIndexChanged(null, null);
    }

    public Result LoadDataUsingTeacherSubjectID(string Id)
    {
        Result result = new Result();
        try
        {
            TeacherSubject subject = bll.GetTeacherSubjectById(Id);
            ddSemester.SelectedValue = subject.TermCode;
            ddTeacher.SelectedValue = subject.TeacherId;
            ddClasses.SelectedValue = subject.ClassCode;
            ddSubjects.SelectedValue = subject.SubjectCode;
            ddSemester_SelectedIndexChanged(null, null);
            ddTeacher_SelectedIndexChanged(null, null);
            ddClasses_SelectedIndexChanged(null, null);
            ddSubjects_SelectedIndexChanged(null, null);
            ddTeacher.Enabled = false;
            result.StatusCode = Globals.SUCCESS_STATUS_CODE;
            result.StatusDesc = Globals.SUCCESS_STATUS_TEXT;
        }
        catch(Exception ex)
        {
            result.StatusCode = Globals.FAILURE_STATUS_CODE;
            result.StatusDesc = "FAILED: " + ex.Message;
        }
        return result;
    }

    private void LoadEntityData(string id)
    {
        btnSubmit.Visible = false;
        btnEdit.Visible = true;
    }

    protected void btnEdit_Click(object sender, EventArgs e)
    {
        try
        {

        }
        catch (Exception ex)
        {
            bll.ShowMessage(lblmsg, ex.Message, true, Session);
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            string msg = "";
            SubjectResults aclient = GetClient();
            Result result = schoolApi.SaveSubjectResult(aclient);

            if (result.StatusCode != Globals.SUCCESS_STATUS_CODE)
            {
                msg = "FAILED: " + result.StatusDesc;
                bll.ShowMessage(lblmsg, msg, false, Session);
                return;
            }

            msg = "RESULTS SAVED SUCCESSFULLY";
            bll.ShowMessage(lblmsg, msg, false, Session);

            if (SaveCompleted != null)
            {
                MyEventArgs eventArgs = new MyEventArgs();

                //Pass on msg
                Session["ExternalMsg"] = msg;

                SaveCompleted(sender, eventArgs);
            }
        }
        catch (Exception ex)
        {
            bll.LogError("SAVE-CLIENT", ex.StackTrace, "", ex.Message, "EXCEPTION");
            bll.ShowMessage(lblmsg, ex.Message, true, Session);
        }
    }

    private SubjectResults GetClient()
    {
        SubjectResults std = new SubjectResults();
        std.Grade = txtGrade.Text;
        std.Mark = txtMark.Text;
        std.StudentId = ddStudents.SelectedValue;
        std.SubjectCode = ddSubjects.SelectedValue;
        std.TermCode = ddSemester.SelectedValue;
        std.SchoolCode = ddSchools.SelectedValue;
        std.ModifiedBy = user.User.Username;
        return std;
    }


    protected void btnConfirm_Click(object sender, EventArgs e)
    {

    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {

    }

   

    protected void ddSemester_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            bll.LoadDataIntoDropDown("GetTeachersWhoEnrolledForSemester", new string[] { ddSchools.SelectedValue,ddSemester.SelectedValue }, ddTeacher);
        }
        catch (Exception ex)
        {
            bll.LogError("SAVE-CLIENT", ex.StackTrace, "", ex.Message, "EXCEPTION");
            bll.ShowMessage(lblmsg, ex.Message, true, Session);
        }
    }

    protected void ddTeacher_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            bll.LoadDataIntoDropDown("GetClassesTaughtByTeacher", new string[] { ddSchools.SelectedValue, ddSemester.SelectedValue,ddTeacher.SelectedValue }, ddClasses);
        }
        catch (Exception ex)
        {
            bll.LogError("SAVE-CLIENT", ex.StackTrace, "", ex.Message, "EXCEPTION");
            bll.ShowMessage(lblmsg, ex.Message, true, Session);
        }
    }

    protected void ddClasses_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            bll.LoadDataIntoDropDown("GetSubjectsTaughtByTeacherInClass", new string[] { ddSchools.SelectedValue, ddSemester.SelectedValue,ddTeacher.SelectedValue,ddClasses.SelectedValue }, ddSubjects);
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
            bll.LoadDataIntoDropDown("GetStudentsInClassWhoEnrolledForSubject", new string[] { ddSchools.SelectedValue, ddSemester.SelectedValue, ddSubjects.SelectedValue }, ddStudents);
        }
        catch (Exception ex)
        {
            bll.LogError("SAVE-CLIENT", ex.StackTrace, "", ex.Message, "EXCEPTION");
            bll.ShowMessage(lblmsg, ex.Message, true, Session);
        }
    }
}