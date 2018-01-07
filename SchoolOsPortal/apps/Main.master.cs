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

    public int GET_BAL_TIMEOUT = 1000 * 3;

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
            if ((details== null))
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

        try
        {
            if (details.User.UserType != "SCHOOL_STUDENT")
            {
                divStudentBal.Visible = false;
                return;
            }

            InterLinkClass.CbAPI.Service service = new InterLinkClass.CbAPI.Service();
            service.Timeout = GET_BAL_TIMEOUT;
            InterLinkClass.CbAPI.BankAccount account = service.GetById("BANKACCOUNT", details.User.Username, details.User.SchoolCode, Globals.SCHOOL_PASSWORD) as InterLinkClass.CbAPI.BankAccount;

            if (account.StatusCode != Globals.SUCCESS_STATUS_CODE)
            {
                divStudentBal.Visible = false;
                return;
            }

            divStudentBal.Visible = true;
            lblStudentBal.Text = account.AccountBalance.Split('.')[0];
        }
        catch(Exception ex)
        {
            divStudentBal.Visible = true;
            lblStudentBal.Text = "N/A";
        }     
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
