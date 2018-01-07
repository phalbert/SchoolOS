using InterLinkClass.PegPaySchoolsApi;
using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    Service schoolsApi = new Service();
    Bussinesslogic bll = new Bussinesslogic();
    SystemUser user;

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {

            if (IsPostBack)
            {

            }
            else
            {
                LoadData();
            }
        }
        catch (Exception ex)
        {
            bll.ShowMessage2(lblmsg, ex.Message, true, Session);
        }
    }

    private void LoadData()
    {
        Session["IsError"] = null;
    }


    protected void btnLogin_Click(object sender, EventArgs e)
    {
        try
        {
            if (!ctrlGoogleReCaptcha.Validate())
            {
                //captcha challenge failed
                string msg = "FAILED: CAPTCHA CHALLENGE FAILED. PLEASE TRY AGAIN";
                bll.ShowMessage2(lblmsg, msg, true, Session);
                return;
            }

            string Username = txtUsername.Text;
            string Password = txtPassword.Text;
            SystemUserDetails userDetails = schoolsApi.Login(Username, Password);

            if (userDetails.StatusCode != Globals.SUCCESS_STATUS_CODE)
            {
                string msg = "FAILED: " + userDetails.StatusDesc;
                bll.ShowMessage2(lblmsg, msg, true, Session);
                return;
            }

            Session["User"] = userDetails;
            Response.Redirect("LoggedInStartPage.aspx");
        }
        catch (Exception ex)
        {
            string msg = "FAILED: " + ex.Message;
            bll.ShowMessage2(lblmsg, msg, true, Session);
        }
    }
}