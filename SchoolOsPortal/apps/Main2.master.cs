using InterLinkClass.PegPaySchoolsApi;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Main2 : System.Web.UI.MasterPage
{
    Bussinesslogic bll = new Bussinesslogic();
    SystemUserDetails details;
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            ServicePointManager.ServerCertificateValidationCallback = SharedCommons.SharedCommons.RemoteCertificateValidation;
            details = Session["User"] as SystemUserDetails;
            string Logout = Request.QueryString["Logout"];
            if (!string.IsNullOrEmpty(Logout))
            {
                LogoutLinkButton_Click(null, null);
                return;
            }
            if ((details == null))
            {
                Response.Redirect("Default.aspx?MSG=SESSION EXPIRED");
            }
            else
            {
                LoadData();
            }
        }
        catch (NullReferenceException exe)
        {
            string Msg = exe.Message;
            Response.Redirect("Default.aspx?Msg=" + Msg, false);
        }
        catch (Exception ex)
        {
            string Msg = ex.Message;
            Response.Redirect("Default.aspx?Msg=" + Msg, false);
        }
    }

    private void LoadData()
    {
        //   LogoutLinkButton.Text = " Hi," + details.User.FullName;

    }

    private void Logout()
    {
        Session.Clear();
        Session.Abandon();
        bll.InsertIntoAuditLog("LOGOUT", "", details.User.SchoolCode, details.User.Username, "Successfull Logout of User with ID :" + details.User.Username);
        Response.Redirect("Default.aspx");
    }


    protected void LogoutLinkButton_Click(object sender, EventArgs e)
    {
        try
        {
            Logout();
        }
        catch (Exception ex)
        {
            string Msg = ex.Message;
            Response.Redirect("Default.aspx?Msg=" + Msg, false);
        }
    }
}
