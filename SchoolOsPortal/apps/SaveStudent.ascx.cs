using InterLinkClass.PegPaySchoolsApi;
using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SaveStudent : System.Web.UI.UserControl
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

    private void LoadData()
    {
        btnSubmit.Visible = true;
        btnEdit.Visible = false;
       
        bll.LoadSchoolsIntoDropDown(user, ddSchools);
        bll.LoadDataIntoDropDown("GetClassesForDropDown", new string[] {ddSchools.SelectedValue }, ddClass);
        bll.LoadDataIntoDropDown("GetStreamsForDropDown", new string[] { ddSchools.SelectedValue }, ddStream);
        bll.LoadDataIntoDropDown("GetStudentCategoriesForDropDown", new string[] { ddSchools.SelectedValue }, ddStdCategory);
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
            Student aclient = GetClient();
            Result result = schoolApi.SaveStudent(aclient);

            if (result.StatusCode != Globals.SUCCESS_STATUS_CODE)
            {
                msg = "FAILED: " + result.StatusDesc;
                bll.ShowMessage(lblmsg, msg, false, Session);
                return;
            }

            msg = "STUDENT SAVED SUCCESSFULLY";
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

    private Student GetClient()
    {
        Student std = new Student();
        std.ClassCode = ddClass.SelectedValue;
        std.DateOfBirth = txtDateOfBirth.Text;
        std.Email = txtEmail.Text;
        std.Gender = ddGender.Text;
        std.PegPayStudentNumber = SharedCommons.SharedCommons.GenerateUniqueId("STD");
        std.PhoneNumber = txtPhone.Text;
        std.ProfilePic = GetProfilePic();
        std.SchoolCode = ddSchools.SelectedValue;
        std.StreamCode = ddStream.SelectedValue;
        std.StudentCategory = ddStdCategory.SelectedValue;
        std.StudentName = txtStdName.Text;
        std.StudentNumber = txtStdNumber.Text;
        std.ModifiedBy = user.User.Username;
        return std;
    }

    private string GetProfilePic()
    {
        string base64string = "";
        if (profilePicFileUpload.PostedFile.ContentLength != 0)
        {
            byte[] b = new byte[profilePicFileUpload.PostedFile.ContentLength];
            profilePicFileUpload.PostedFile.InputStream.Read(b, 0, b.Length);
            string base64String = System.Convert.ToBase64String(b, 0, b.Length);
            Response.Write(base64String);
        }
        return base64string;
    }

    protected void btnConfirm_Click(object sender, EventArgs e)
    {

    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {

    }
}