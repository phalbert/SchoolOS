using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class ManageSystemUsers : System.Web.UI.Page
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
        if (MultiView.GetActiveView() == ListSystemUsersView)
        {
            SetActiveTab(ListSystemUsersLink);
            return;
        }
        if (MultiView.GetActiveView() == SaveSystemUsersView)
        {
            SetActiveTab(SaveSystemUsersLink);
            return;
        }
        if (MultiView.GetActiveView() == ApproveSystemUsersView)
        {
            SetActiveTab(ApproveSystemUsersLink);
            return;
        }

    }

    private void SetActiveTab(HtmlGenericControl control)
    {
        SaveSystemUsersLink.Attributes["class"] = "";
        ListSystemUsersLink.Attributes["class"] = "";
        ApproveSystemUsersLink.Attributes["class"] = "";
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

        if (link.ID == ListSystemUsersLinkButton.ID)
        {
            MultiView.SetActiveView(ListSystemUsersView);
            return;
        }
        if (link.ID == SaveSystemUsersLinkButton.ID)
        {
            MultiView.SetActiveView(SaveSystemUsersView);
            return;
        }
        if (link.ID == ApproveSystemUsersLinkButton.ID)
        {
            MultiView.SetActiveView(ApproveSystemUsersView);
            return;
        }
    }
}