using InterLinkClass.PegPaySchoolsApi;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CustomUserControls_SaveStudentSubjects : System.Web.UI.UserControl
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

    private void LoadData()
    {
        btnSubmit.Visible = true;
        btnEdit.Visible = false;

        bll.LoadSchoolsIntoDropDown(user, ddSchools);
        bll.LoadDataIntoDropDown("GetClassesForDropDown", new string[] { ddSchools.SelectedValue }, ddClasses);
        bll.LoadDataIntoDropDown("GetTermsForDropDown", new string[] { ddSchools.SelectedValue }, ddTerms);
        bll.LoadDataIntoDropDown("GetSubjectsForDropDown", new string[] { ddSchools.SelectedValue }, ddSubjects);
        bll.LoadDataIntoDropDown("GetStudentsForDropDown", new string[] { ddSchools.SelectedValue,ddClasses.SelectedValue }, ddStudents);

        if (user.User.UserType == "SCHOOL_STUDENT")
        {
            LoadStudentDetails();
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

        ddStudents.SelectedValue = std.StudentNumber;
        ddStudents.Enabled = false;
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
            Save();
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
            Save();
        }
        catch (Exception ex)
        {
            bll.LogError("SAVE-CLIENT", ex.StackTrace, "", ex.Message, "EXCEPTION");
            bll.ShowMessage(lblmsg, ex.Message, true, Session);
        }
    }

    private void Save()
    {
        string msg = "";
        StudentSubject aclient = GetClient();
        Result result = schoolApi.SaveStudentSubject(aclient);

        if (result.StatusCode != Globals.SUCCESS_STATUS_CODE)
        {
            msg = "FAILED: " + result.StatusDesc;
            bll.ShowMessage(lblmsg, msg, false, Session);
            return;
        }

        msg = "SUBJECT CHOICE SAVED SUCCESSFULLY";
        bll.ShowMessage(lblmsg, msg, false, Session);

        if (SaveCompleted != null)
        {
            MyEventArgs eventArgs = new MyEventArgs();

            //Pass on msg
            Session["ExternalMsg"] = msg;

            SaveCompleted(null, eventArgs);
        }
    }

    private StudentSubject GetClient()
    {
        StudentSubject std = new StudentSubject();
        std.ClassCode = ddClasses.SelectedValue;
        std.StudentId = ddStudents.SelectedValue;
        std.SubjectCode = ddSubjects.SelectedValue;
        std.TermCode = ddTerms.SelectedValue;
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
}