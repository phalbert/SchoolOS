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
            lblmsg.Text = "";
            Session["IsError"] = null;

            if (user == null)
            {
                Response.Redirect("Default.aspx");
            }
            else if (IsPostBack)
            {

            }
            else
            {
                LoadData();
            }

        }
        catch (NullReferenceException exe)
        {
            Response.Redirect("Default.aspx?login=1", false);
        }
        catch (Exception ex)
        {
            bll.ShowMessage(lblmsg, ex.Message, true);
        }
    }

    private void LoadData()
    {

        lblmsg.Text = user.User.Username;
        UsersPic.Attributes["src"] = "ImageHandler.ashx?Id=" + user.User.ProfilePic;

    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        try
        {
            LoadReceipt();
        }
        catch (Exception ex)
        {
            string msg = "FAILED: " + ex.Message;
        }
    }
    private void LoadReceipt()
    {

    }
    protected void btnSetAsMainAccount_Click(object sender, EventArgs e)
    {

    }
}
