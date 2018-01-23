using InterLinkClass.PegPaySchoolsApi;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CustomUserControls_SaveStaffMembers : System.Web.UI.UserControl
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
        bll.LoadDataIntoDropDown("GetStaffTypesForDropDown", new string[] { ddSchools.SelectedValue }, ddStaffType);
    }

    public Result LoadEntityDataForEdit(string studentId, string schoolCode)
    {
        btnSubmit.Visible = false;
        btnEdit.Visible = true;

        Result result = new Result();
        SchoolStaff std = bll.GetStaffById(studentId, schoolCode);

        if (std.StatusCode != Globals.SUCCESS_STATUS_CODE)
        {
            result.StatusCode = std.StatusCode;
            result.StatusDesc = std.StatusDesc;
            return result;
        }

        txtEmail.Text = std.Email;
        txtFullName.Text = std.FullName;
        txtIDNumber.Text = std.StaffIDNumber;
        txtPhone.Text = std.PhoneNumber;
        ddGender.SelectedValue = std.Gender;
        ddSchools.SelectedValue = std.SchoolCode;
        ddStaffType.SelectedValue = std.StaffType;
        result.StatusCode = Globals.SUCCESS_STATUS_CODE;
        result.StatusDesc = Globals.SUCCESS_STATUS_TEXT;
        return result;
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
            string msg = "";
            
            DataTable dt = bll.ExecuteDataTableOnSchoolsDB("GetStaffById", new string[] { txtIDNumber.Text, ddSchools.SelectedValue });

            if (dt.Rows.Count != 0)
            {
                msg = "FAILED: STAFF ID ALREADY IN USE. PLEASE PICK ANOTHER ONE";
                bll.ShowMessage(lblmsg, msg, false, Session);
                return;
            }

            //see if the username is taken
            SystemUser oldUser = bll.GetSystemUserById2(txtPhone.Text);

            if (oldUser.StatusCode == Globals.SUCCESS_STATUS_CODE)
            {
                msg = "FAILED: PHONE NUMBER IS ALREADY ATTACHED TO EXISTING STAFF MEMBER";
                bll.ShowMessage(lblmsg, msg, true, Session);
                return;
            }

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
        SchoolStaff std = GetObject();

        Result result = schoolApi.SaveSchoolStaff(std);

        if (result.StatusCode != Globals.SUCCESS_STATUS_CODE)
        {
            msg = "FAILED: " + result.StatusDesc;
            bll.ShowMessage(lblmsg, msg, false, Session);
            return;
        }

        msg = "STAFF MEMBER SAVED SUCCESSFULLY";
        bll.ShowMessage(lblmsg, msg, false, Session);

        if (SaveCompleted != null)
        {
            MyEventArgs eventArgs = new MyEventArgs();

            //Pass on msg
            Session["ExternalMsg"] = msg;

            SaveCompleted(null, eventArgs);
        }
    }

    private SchoolStaff GetObject()
    {
        SchoolStaff std = new SchoolStaff();
        std.FullName = txtFullName.Text;
        std.StaffType = ddStaffType.SelectedValue;
        std.StaffCategory= ddStaffType.SelectedValue;
        std.Email = txtEmail.Text;
        std.Gender = ddGender.Text;
        std.StaffIDNumber = txtIDNumber.Text;
        std.PegPayStaffIDNumber = SharedCommons.SharedCommons.GenerateUniqueId("STAFF");
        std.PhoneNumber = txtPhone.Text;
        std.ProfilePic = "";
        std.SchoolCode = ddSchools.SelectedValue;
        std.ModifiedBy = user.User.Username;
        return std;
    }



    protected void btnConfirm_Click(object sender, EventArgs e)
    {
        try
        {
            string msg = "";
            string ProfilePic = bll.GetBase64StringOfUploadedFile(fuStudentPic);
            DataTable dt = schoolApi.ExecuteDataSet("UploadImage", new object[] { txtIDNumber.Text, ddSchools.SelectedValue, "STUDENT", ProfilePic }).Tables[0];

            if (dt.Rows.Count == 0)
            {
                msg = "FAILED TO SAVE UPLOAD IMAGE";
                bll.ShowMessage(lblmsg, msg, true, Session);
                return;
            }

            String Id = dt.Rows[0][0].ToString();
            StudentPic.Attributes["src"] = "../ImageHandler.ashx?Id=" + Id;
            MultiView1.SetActiveView(CaptureDetailsView);
        }
        catch (Exception ex)
        {
            bll.LogError("SAVE-CLIENT", ex.StackTrace, "", ex.Message, "EXCEPTION");
            bll.ShowMessage(lblmsg, ex.Message, true, Session);
        }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 0;
    }

    protected void ddSchools_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {

            bll.LoadDataIntoDropDown("GetStaffTypesForDropDown", new string[] { ddSchools.SelectedValue }, ddStaffType);
        }
        catch (Exception ex)
        {
            bll.LogError("SAVE-CLIENT", ex.StackTrace, "", ex.Message, "EXCEPTION");
            bll.ShowMessage(lblmsg, ex.Message, true, Session);
        }
    }

    protected void ProfilePic_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            if (!btnEdit.Visible) { return; }
            LoadUploadPicView();
        }
        catch (Exception ex)
        {
            bll.LogError("SAVE-CLIENT", ex.StackTrace, "", ex.Message, "EXCEPTION");
            bll.ShowMessage(lblmsg, ex.Message, true, Session);
        }
    }

    private void LoadUploadPicView()
    {
        MultiView1.SetActiveView(UploadPicView);
    }
}