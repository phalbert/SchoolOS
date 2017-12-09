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
using InterLinkClass.PegasusManagementApi;

public partial class Main : System.Web.UI.MasterPage
{
    Bussinesslogic bll = new Bussinesslogic();
    SystemUser user;
    Company usersCompany;
    UserType usersRole;
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            ServicePointManager.ServerCertificateValidationCallback = SharedCommons.SharedCommons.RemoteCertificateValidation;

            if ((Session["User"] == null))
            {
                Response.Redirect("Default.aspx");
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
        user = (SystemUser)Session["User"];
        usersCompany = (Company)Session["UsersCompany"];
        usersRole = (UserType)Session["UsersRole"];
        //string lastLogin = Session["LastLogin"] as string;

        TitleLbl.InnerHtml = "<i class=\"fa fa-bank\"></i> " + usersCompany.CompanyName.ToUpper() + "  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Date:" + DateTime.Now;
        lblName.Text = user.Name;
        lblUsersName.Text = user.Name;
        lblUsersRole.Text = usersRole.UserTypeName;
        lblCompnay.Text = usersCompany.CompanyName;
        //lblLastLogin.Text = lastLogin;
    }

    private void Logout()
    {
        Session.Clear();
        Session.Abandon();
        bll.InsertIntoAuditLog("LOGOUT", "", user.CompanyCode, user.UserId, "Successfull Logout of User with ID :" + user.UserId);
        Response.Redirect("Default.aspx");
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Logout();
    }
    protected void btnCallSystemTool_Click(object sender, EventArgs e)
    {
        Response.Redirect("Admin.aspx");
    }
    protected void btnCallAccountDetails_Click(object sender, EventArgs e)
    {
        Response.Redirect("SystemPassword.aspx");
    }
    protected void btnCalRecon_Click(object sender, EventArgs e)
    {
        Response.Redirect("Accountant.aspx");
    }
    protected void btnCalReports_Click(object sender, EventArgs e)
    {
        Response.Redirect("Reports.aspx");
    }
    protected void btnCallBatching_Click(object sender, EventArgs e)
    {
        Response.Redirect("Batching.aspx");
    }
    protected void btnCallPayments_Click(object sender, EventArgs e)
    {
        Response.Redirect("Payment.aspx");
    }
    protected void btnCallBatching_Click1(object sender, EventArgs e)
    {
        Response.Redirect("Billing.aspx");
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {

    }
    protected void Ftransfer_Click(object sender, EventArgs e)
    {

    }
}
