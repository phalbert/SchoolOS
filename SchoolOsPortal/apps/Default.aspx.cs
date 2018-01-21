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
            string Msg = Request.QueryString["Msg"];

            if (!string.IsNullOrEmpty(Msg))
            {
                Msg = Msg.ToUpper().Contains("THREAD") ? "You Have Been Logged Out" : Msg;
                bll.ShowMessage2(lblmsg, Msg, true, Session);
                return;
            }

            Response.Redirect("~/Start/Index.html");
            return;
        }
        catch (Exception)
        {
        }
    }

    private void LoadData()
    {
        Session["IsError"] = null;
    }




    protected void btnHome_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Start/Index.html");
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Login.aspx");
    }

    protected void btnStudentLogin_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/StudentLogin.aspx");
    }
}
