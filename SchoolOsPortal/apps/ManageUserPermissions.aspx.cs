using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class ManageUserPermissions : System.Web.UI.Page
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
        if (MultiView.GetActiveView() == ListUserTypesView)
        {
            SetActiveTab(ListUserTypesLink);
            return;
        }
        if (MultiView.GetActiveView() == SaveUserTypeView)
        {
            SetActiveTab(SaveUserTypeLink);
            return;
        }
        if (MultiView.GetActiveView() == SaveSublinkView)
        {
            SetActiveTab(SaveSublink);
            return;
        }
        if (MultiView.GetActiveView() == SaveMainLinkView)
        {
            SetActiveTab(SaveMainLink);
            return;
        }
        if (MultiView.GetActiveView() == SaveMenuItemView)
        {
            SetActiveTab(SaveMenuItemLink);
            return;
        }
    }

    private void SetActiveTab(HtmlGenericControl control)
    {
        ListUserTypesLink.Attributes["class"] = "";
        SaveUserTypeLink.Attributes["class"] = "";
        SaveSublink.Attributes["class"] = "";
        SaveMainLink.Attributes["class"] = "";
        SaveMenuItemLink.Attributes["class"] = "";
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

        if (link.ID == ListUserTypesLinkButton.ID)
        {
            MultiView.SetActiveView(ListUserTypesView);
            return;
        }
        if (link.ID == SaveUserTypeLinkButton.ID)
        {
            MultiView.SetActiveView(SaveUserTypeView);
            return;
        }
        if (link.ID == SaveSublinkButton.ID)
        {
            MultiView.SetActiveView(SaveSublinkView);
            return;
        }
        if (link.ID == SaveMainLinkButton.ID)
        {
            MultiView.SetActiveView(SaveMainLinkView);
            return;
        }
        if (link.ID == SaveMenuItemLinkButton.ID)
        {
            MultiView.SetActiveView(SaveMenuItemView);
            return;
        }
    }
}