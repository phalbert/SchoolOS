using InterLinkClass.PegPaySchoolsApi;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class ManageUserProfile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {

            Session["IsError"] = null;
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
        HighLightCorrectTab();
    }


    private void HighLightCorrectTab()
    {
        if (MultiView.GetActiveView() == ChangePasswordView)
        {
            SetActiveTab(ChangePasswordLink);
            return;
        }
        if (MultiView.GetActiveView() == SaveSystemUsersView)
        {
            SetActiveTab(SaveSystemUsersLink);
            return;
        }
        

    }

    private void SetActiveTab(HtmlGenericControl control)
    {
        SaveSystemUsersLink.Attributes["class"] = "";
        ChangePasswordLink.Attributes["class"] = "";
        control.Attributes["class"] = "active";
    }



    protected void btnTabPane_Click(object sender, EventArgs e)
    {
        try
        {
            LinkButton link = sender as LinkButton;
            ChangeViews(link);

            HighLightCorrectTab();
        }
        catch (Exception ex)
        {
            string msg = "FAILED: " + ex.Message;
        }
    }

    private void ChangeViews(LinkButton link)
    {

        if (link.ID == ChangePasswordLinkButton.ID)
        {
            MultiView.SetActiveView(ChangePasswordView);
            return;
        }
        if (link.ID == SaveSystemUsersLinkButton.ID)
        {
            SystemUserDetails user = Session["User"] as SystemUserDetails;

            if (user == null)
            {
                Response.Redirect("~/Default.aspx?Msg=SESSION HAS EXPIRED");
                return;
            }

            SaveSystemUsersControl.LoadEntityDataForEdit(user.User.Username);
            MultiView.SetActiveView(SaveSystemUsersView);
            return;
        }
    }
}