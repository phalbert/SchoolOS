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
using InterLinkClass.PegasusManagementApi;
using InterLinkClass.PegPaySchoolsApi;

public partial class Admin : System.Web.UI.Page
{
    SystemUserDetails user;
    Bussinesslogic bll = new Bussinesslogic();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            user = Session["User"] as SystemUserDetails;
            Session["IsError"] = null;

            if (user == null)
            {
                Response.Redirect("Default.aspx?Msg=SESSION HAS EXPIRED");
            }
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

        }
    }

    private void LoadData()
    {
        if (user.User.UserType == "SCHOOL_STUDENT")
        {
            MultiView.SetActiveView(StudentProfileVew);
            return;
        }

        MultiView.SetActiveView(DashboardView);
        return;
    }

  
}
