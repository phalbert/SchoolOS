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
        Response.Redirect("~/Start/Index.html");
    }

    private void LoadData()
    {
        Session["IsError"] = null;
    }


   
}
