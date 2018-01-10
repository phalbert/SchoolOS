using InterLinkClass.PegPaySchoolsApi;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CustomUserControls_ChangePassword : System.Web.UI.UserControl
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
            ////Load Old details
            //else if (!string.IsNullOrEmpty(Id))
            //{
            //    LoadEntityData(Id);
            //}
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
        bll.LoadDataIntoDropDown("GetSystemUsersForDropDown", new string[] { user.SchoolDetails.SchoolCode }, ddSystemUsers);
        ddSystemUsers.SelectedValue = user.User.Username;
        ddSystemUsers.Enabled = false;
    }

    public Result LoadEntityData(string id)
    {
        Result result = new Result();
        btnSubmit.Visible = false;
        ddSystemUsers.SelectedValue = id;
        ddSystemUsers.Enabled = false;
        result.StatusCode = Globals.SUCCESS_STATUS_CODE;
        result.StatusDesc = Globals.SUCCESS_STATUS_TEXT;
        return result;
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
            string OldPassword = txtOldPassword.Text;
            string NewPassword = txtNewPassword.Text;
            string ConfirmedPassword = txtConfirmPassword.Text;

            if (string.IsNullOrEmpty(OldPassword))
            {
                msg = "FAILED: PLEASE SUPPLY YOUR OLD PASSWORD";
                bll.ShowMessage(lblmsg, msg, false, Session);
                return;
            }
            if (string.IsNullOrEmpty(NewPassword))
            {
                msg = "FAILED: PLEASE SUPPLY YOUR NEW PASSWORD";
                bll.ShowMessage(lblmsg, msg, false, Session);
                return;
            }
            if (string.IsNullOrEmpty(ConfirmedPassword))
            {
                msg = "FAILED: PLEASE CONFIRM YOUR NEW PASSWORD";
                bll.ShowMessage(lblmsg, msg, false, Session);
                return;
            }

            if (NewPassword != ConfirmedPassword)
            {
                msg = "FAILED: YOUR NEW AND CONFIRMED PASSWORDS DONT MATCH";
                bll.ShowMessage(lblmsg, msg, false, Session);
                return;
            }

            SystemUser oldUser = bll.GetSystemUserById2(ddSystemUsers.SelectedValue);

            if (oldUser.StatusCode != Globals.SUCCESS_STATUS_CODE)
            {

                msg = "FAILED: " + oldUser.StatusDesc;
                bll.ShowMessage(lblmsg, msg, false, Session);
                return;
            }

            if (SharedCommons.SharedCommons.GenearetHMACSha256Hash(oldUser.SecretKey, OldPassword) != oldUser.UserPassword)
            {
                msg = "INCORRECT OLD PASSWORD SUPPLIED";
                bll.ShowMessage(lblmsg, msg, false, Session);
                return;
            }

            string hashedNewPassword = SharedCommons.SharedCommons.GenearetHMACSha256Hash(oldUser.SecretKey, NewPassword);
            int rowsAffected = schoolApi.ExecuteNonQuery("ChangePassword", new string[] { user.User.Username, hashedNewPassword });

            msg = "PASSWORD CHANGED SUCCESSFULLY";
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


    protected void btnConfirm_Click(object sender, EventArgs e)
    {

    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {

    }
}