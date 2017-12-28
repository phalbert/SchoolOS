using InterLinkClass.PegPaySchoolsApi;
using System;
using System.Collections.Generic;
using System.Data;
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
            Student std = GetObject();

            DataTable dt = bll.ExecuteDataTableOnSchoolsDB("GetStudentById", new string[] { std.StudentNumber,std.SchoolCode });

            if (dt.Rows.Count != 0)
            {
                msg = "FAILED: SCHOOL CODE ALREADY IN USE. PLEASE PICK ANOTHER ONE";
                bll.ShowMessage(lblmsg, msg, false, Session);
                return;
            }

            Result result = schoolApi.SaveStudent(std);

            if (result.StatusCode != Globals.SUCCESS_STATUS_CODE)
            {
                msg = "FAILED: " + result.StatusDesc;
                bll.ShowMessage(lblmsg, msg, false, Session);
                return;
            }

            msg = "STUDENT SAVED SUCCESSFULLY";
            bll.ShowMessage(lblmsg, msg, false, Session);
            StudentPic.Attributes["src"] = "../ImageHandler.ashx?Id=" + result.ThirdPartyID;

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

    private Student GetObject()
    {
        Student std = new Student();
        std.ClassCode = ddClass.SelectedValue;
        std.DateOfBirth = txtDateOfBirth.Text;
        std.Email = txtEmail.Text;
        std.Gender = ddGender.Text;
        std.PegPayStudentNumber = SharedCommons.SharedCommons.GenerateUniqueId("STD");
        std.PhoneNumber = txtPhone.Text;
        std.ProfilePic = bll.GetBase64StringOfUploadedFile(fuStudentPic);
        std.SchoolCode = ddSchools.SelectedValue;
        std.StreamCode = ddStream.SelectedValue;
        std.StudentCategory = ddStdCategory.SelectedValue;
        std.StudentName = txtStdName.Text;
        std.StudentNumber = txtStdNumber.Text;
        std.ModifiedBy = user.User.Username;
        return std;
    }

    

    protected void btnConfirm_Click(object sender, EventArgs e)
    {

    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {

    }

    protected void ddSchools_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            bll.LoadDataIntoDropDown("GetClassesForDropDown", new string[] { ddSchools.SelectedValue }, ddClass);
            bll.LoadDataIntoDropDown("GetStreamsForDropDown", new string[] { ddSchools.SelectedValue }, ddStream);
            bll.LoadDataIntoDropDown("GetStudentCategoriesForDropDown", new string[] { ddSchools.SelectedValue }, ddStdCategory);
        }
        catch (Exception ex)
        {
            bll.LogError("SAVE-CLIENT", ex.StackTrace, "", ex.Message, "EXCEPTION");
            bll.ShowMessage(lblmsg, ex.Message, true, Session);
        }
    }
}