using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Net;
using System.Globalization;
using InterLinkClass.PegPaySchoolsApi;

public partial class Main : System.Web.UI.MasterPage
{
    Bussinesslogic bll = new Bussinesslogic();
    SystemUserDetails details;
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            ServicePointManager.ServerCertificateValidationCallback = SharedCommons.SharedCommons.RemoteCertificateValidation;

            if ((Session["User"] == null))
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
    }

    private void Logout()
    {
        Session.Clear();
        Session.Abandon();
        bll.InsertIntoAuditLog("LOGOUT", "", details.User.SchoolCode, details.User.Username, "Successfull Logout of User with ID :" + details.User.Username);
        Response.Redirect("Default.aspx");
    }
    
}
