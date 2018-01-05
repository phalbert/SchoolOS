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
        StudentBalDiv.Visible = false;

        bll.LoadSchoolsIntoDropDown(user, ddSchools);
        bll.LoadDataIntoDropDown("GetClassesForDropDown", new string[] { ddSchools.SelectedValue }, ddClass);
        bll.LoadDataIntoDropDown("GetStreamsForDropDown2", new string[] { ddSchools.SelectedValue, ddClass.SelectedValue }, ddStream);
        bll.LoadDataIntoDropDown("GetStudentCategoriesForDropDown", new string[] { ddSchools.SelectedValue }, ddStdCategory);
    }

    public Result LoadEntityDataForEdit(string studentId, string schoolCode)
    {
        btnSubmit.Visible = false;
        btnEdit.Visible = true;
        StudentBalDiv.Visible = true;
        Result result = new Result();
        Student std = bll.GetStudentById(studentId, schoolCode);

        if (std.StatusCode != Globals.SUCCESS_STATUS_CODE)
        {
            result.StatusCode = std.StatusCode;
            result.StatusDesc = std.StatusDesc;
            return result;
        }

        txtDateOfBirth.Text = std.DateOfBirth;
        txtEmail.Text = std.Email;
        txtPhone.Text = std.PhoneNumber;
        txtStdName.Text = std.StudentName;
        txtStdNumber.Text = std.StudentNumber;

        ddSchools.SelectedValue = std.SchoolCode;
        ddSchools_SelectedIndexChanged(null, null);
        ddClass.SelectedValue = std.ClassCode;
        ddGender.SelectedValue = std.Gender;
        ddStdCategory.SelectedValue = std.StudentCategory;
        ddStream.SelectedValue = std.StreamCode;
        StudentPic.Attributes["src"] = "../ImageHandler.ashx?Id=" + std.ProfilePic;

        InterLinkClass.CbAPI.Service service = new InterLinkClass.CbAPI.Service();
        InterLinkClass.CbAPI.BankAccount account = service.GetById("BANKACCOUNT", std.PegPayStudentNumber, std.SchoolCode, Globals.SCHOOL_PASSWORD) as InterLinkClass.CbAPI.BankAccount;
        if (account.StatusCode == (Globals.SUCCESS_STATUS_CODE))
        {
            lblStudentBalance.Text = account.AccountBalance.Split('.')[0]+" "+account.CurrencyCode;
        }
        else
        {
            StudentBalDiv.Visible = false;
        }

        btnSubmit.Visible = false;
        btnEdit.Visible = true;
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
            DataTable dt = bll.ExecuteDataTableOnSchoolsDB("GetStudentById", new string[] { txtStdNumber.Text, ddSchools.SelectedValue });

            if (dt.Rows.Count != 0)
            {
                string msg = "FAILED: SCHOOL CODE ALREADY IN USE. PLEASE PICK ANOTHER ONE";
                bll.ShowMessage(lblmsg, msg, false, Session);
                return;
            }

            Save();

            LoadUploadPicView();

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
        Student std = GetObject();
        Result result = schoolApi.SaveStudent(std);

        if (result.StatusCode != Globals.SUCCESS_STATUS_CODE)
        {
            msg = "FAILED: " + result.StatusDesc;
            throw new Exception(msg);
        }

        msg = "STUDENT SAVED SUCCESSFULLY. STUDENT NUMBER IS [" + result.PegPayID + "]";
        bll.ShowMessage(lblmsg, msg, false, Session);
        //StudentPic.Attributes["src"] = "../ImageHandler.ashx?Id=" + result.ThirdPartyID;

        if (SaveCompleted != null)
        {
            MyEventArgs eventArgs = new MyEventArgs();

            //Pass on msg
            Session["ExternalMsg"] = msg;

            SaveCompleted(null, eventArgs);
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
        std.ProfilePic = "";
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
        try
        {
            string msg = "";
            string ProfilePic= bll.GetBase64StringOfUploadedFile(fuStudentPic);
            DataTable dt = schoolApi.ExecuteDataSet("UploadImage", new object[] {txtStdNumber.Text,ddSchools.SelectedValue,"STUDENT", ProfilePic }).Tables[0];

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
            bll.LoadDataIntoDropDown("GetClassesForDropDown", new string[] { ddSchools.SelectedValue }, ddClass);
            bll.LoadDataIntoDropDown("GetStreamsForDropDown2", new string[] { ddSchools.SelectedValue, ddClass.SelectedValue }, ddStream);
            bll.LoadDataIntoDropDown("GetStudentCategoriesForDropDown", new string[] { ddSchools.SelectedValue }, ddStdCategory);
        }
        catch (Exception ex)
        {
            bll.LogError("SAVE-CLIENT", ex.StackTrace, "", ex.Message, "EXCEPTION");
            bll.ShowMessage(lblmsg, ex.Message, true, Session);
        }
    }

    protected void ddClass_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            bll.LoadDataIntoDropDown("GetStreamsForDropDown2", new string[] { ddSchools.SelectedValue, ddClass.SelectedValue }, ddStream);
        }
        catch (Exception ex)
        {
            bll.LogError("SAVE-CLIENT", ex.StackTrace, "", ex.Message, "EXCEPTION");
            bll.ShowMessage(lblmsg, ex.Message, true, Session);
        }
    }

    protected void StudentPic_Click(object sender, ImageClickEventArgs e)
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