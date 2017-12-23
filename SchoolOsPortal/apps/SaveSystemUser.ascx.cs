
using InterLinkClass.PegPaySchoolsApi;
using System;
using System.Collections.Generic;
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
        bll.LoadDataIntoDropDown("GetUserTypesForDropDown", new string[] { ddSchools.SelectedValue }, ddUserTypes);

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
            SystemUser newUser = GetSystemUser();
            Result result = schoolsApi.SaveSystemUser(newUser);

            if (result.StatusCode != Globals.SUCCESS_STATUS_CODE)
            {
                msg = "FAILED: " + result.StatusDesc;
                bll.ShowMessage(lblmsg, msg, false, Session);
                return;
            }

            msg = "SYSTEM USER DETAILS SAVED SUCCESSFULLY";
            bll.ShowMessage(lblmsg, msg, false, Session);


            Result mailResult = bll.SendCredentialsToUser(newUser);

            if (mailResult.StatusCode != Globals.SUCCESS_STATUS_CODE)
            {
                msg = msg + ", FAILED TO SEND EMAIL WITH CREDENTIALS: " + mailResult.StatusDesc;
                bll.ShowMessage(lblmsg, msg, false, Session);
                return;
            }

            msg = "SYSTEM USER DETAILS SAVED SUCCESSFULLY, EMAIL WITH CREDENTIALS SENT SUCCSSFULLY";
            bll.ShowMessage(lblmsg, msg, false, Session);

            if (SaveCompleted != null)
            {
                MyEventArgs eventArgs = new MyEventArgs();
                eventArgs.PegPayId = newUser.Username;

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

    private SystemUser GetSystemUser()
    {
        SystemUser newUser = new SystemUser();
        newUser.SchoolCode = ddSchools.SelectedValue;
        newUser.PhoneNumber = txtPhone.Text;
        newUser.FullName = txtName.Text;
        newUser.Username = newUser.PhoneNumber + "_" + newUser.SchoolCode;
        newUser.Email = txtEMail.Text;
        newUser.UserPassword = SharedCommons.SharedCommons.GeneratePassword();
        newUser.IsActive = ddIsActive.SelectedValue;
        newUser.UserType = ddUserTypes.SelectedValue;
        newUser.ModifiedBy = user.User.Username;
        return newUser;
    }


    protected void btnConfirm_Click(object sender, EventArgs e)
    {

    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {

    }

    public void ShowExternalMessage()
    {
        bll.ShowExternalMessage(lblmsg, Session);
    }
}