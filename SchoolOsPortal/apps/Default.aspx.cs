using System;
using System.Data;
using System.Drawing;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using SharedCommons;
using System.Collections.Generic;
using System.Net;
using InterLinkClass.PegPaySchoolsApi;

public partial class _Default : System.Web.UI.Page
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
            bll.ShowMessage(lblmsg, ex.Message, true, Session);
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
            string Username = txtUsername.Text;
            string Password = txtPassword.Text;
            SystemUserDetails userDetails = schoolsApi.Login(Username, Password);

            if (userDetails.StatusCode != Globals.SUCCESS_STATUS_CODE)
            {
                string msg = "FAILED: " + userDetails.StatusDesc;
                bll.ShowMessage(lblmsg, msg, true, Session);
                return;
            }

            Session["User"] = userDetails;
            Response.Redirect("LoggedInStartPage.aspx");
        }
        catch (Exception ex)
        {
            string msg = "FAILED: " + ex.Message;
            bll.ShowMessage(lblmsg, msg, true, Session);
        }
    }
}
