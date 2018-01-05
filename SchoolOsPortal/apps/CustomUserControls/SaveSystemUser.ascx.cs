
using InterLinkClass.PegPaySchoolsApi;
using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SaveSystemUser : System.Web.UI.UserControl
{
    public event EventHandler SaveCompleted;
    Bussinesslogic bll = new Bussinesslogic();
    SystemUserDetails user = new SystemUserDetails();
    Service schoolsApi = new Service();

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
                LoadEntityDataForEdit(Id);
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
        bll.LoadDataIntoDropDown("GetUserTypesForDropDown", new string[] { ddSchools.SelectedValue }, ddUserTypes);

    }

    public Result LoadEntityDataForEdit(string id)
    {
        btnSubmit.Visible = false;
        btnEdit.Visible = true;

        Result result = new Result();
        SystemUser std = bll.GetSystemUserById2(id);

        if (std.StatusCode != Globals.SUCCESS_STATUS_CODE)
        {
            result.StatusCode = std.StatusCode;
            result.StatusDesc = std.StatusDesc;
            return result;
        }

        txtEMail.Text = std.Email;
        txtName.Text = std.FullName;
        txtUserId.Text = std.Username;
        txtUserId.Enabled = false;
        ddIsActive.SelectedValue = std.IsActive;
        ddSchools.SelectedValue = std.SchoolCode;
        ddUserTypes.SelectedValue = std.UserType;
        txtPhone.Text = std.PhoneNumber;
        UserPic.Attributes["src"] = "../ImageHandler.ashx?Id=" + std.ProfilePic;
        
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
            DataTable dt = bll.ExecuteDataTableOnSchoolsDB("GetSystemUserById", new string[] { txtUserId.Text });

            if (dt.Rows.Count != 0)
            {
                msg = "FAILED: USER ID ALREADY IN USE. PLEASE PICK ANOTHER ONE";
                bll.ShowMessage(lblmsg, msg, false, Session);
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
        SystemUser newUser = GetSystemUser();
        Result result = schoolsApi.SaveSystemUser(newUser);

        if (result.StatusCode != Globals.SUCCESS_STATUS_CODE)
        {
            msg = "FAILED: " + result.StatusDesc;
            bll.ShowMessage(lblmsg, msg, false, Session);
            return;
        }

        //UserPic.Attributes["src"] = "../ImageHandler.ashx?Id=" + result.ThirdPartyID;
        msg = "SYSTEM USER DETAILS SAVED SUCCESSFULLY";
        bll.ShowMessage(lblmsg, msg, false, Session);
        MultiView1.SetActiveView(UploadPicView);

        if (SaveCompleted != null)
        {
            MyEventArgs eventArgs = new MyEventArgs();
            eventArgs.PegPayId = newUser.Username;

            //Pass on msg
            Session["ExternalMsg"] = msg;

            SaveCompleted(null, eventArgs);
        }
    }

    private SystemUser GetSystemUser()
    {
        SystemUser newUser = new SystemUser();
        newUser.SchoolCode = ddSchools.SelectedValue;
        newUser.PhoneNumber = txtPhone.Text;
        newUser.FullName = txtName.Text;
        newUser.Username = txtUserId.Text;
        newUser.Email = txtEMail.Text;
        newUser.UserPassword = SharedCommons.SharedCommons.GeneratePassword();
        newUser.SecretKey = "T3rr16132016";//SharedCommons.SharedCommons.GenerateUniqueId("");
        newUser.UserCategory = ddUserTypes.SelectedValue;
        newUser.IsActive = ddIsActive.SelectedValue;
        newUser.UserType = ddUserTypes.SelectedValue;
        newUser.ModifiedBy = user.User.Username;
        newUser.ProfilePic = "";//bll.GetBase64StringOfUploadedFile(fuProfilePic);
        return newUser;
    }


    protected void btnConfirm_Click(object sender, EventArgs e)
    {
        try
        {
            string msg = "";
            string ProfilePic = bll.GetBase64StringOfUploadedFile(fuProfilePic);
            DataTable dt = schoolsApi.ExecuteDataSet("UploadImage", new object[] { txtUserId.Text, ddSchools.SelectedValue, "SYSTEM_USER", ProfilePic }).Tables[0];

            if (dt.Rows.Count == 0)
            {
                msg = "FAILED TO SAVE UPLOAD IMAGE";
                bll.ShowMessage(lblmsg, msg, true, Session);
                return;
            }

            String Id = dt.Rows[0][0].ToString();
            UserPic.Attributes["src"] = "../ImageHandler.ashx?Id=" + Id;
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

    public void ShowExternalMessage()
    {
        bll.ShowExternalMessage(lblmsg, Session);
    }

    protected void UserPic_Click(object sender, ImageClickEventArgs e)
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