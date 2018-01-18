using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CustomUserControls_ManageStaff : System.Web.UI.UserControl
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
        if (MultiView.GetActiveView() == ListStaffMembersView)
        {
            SetActiveTab(ListStaffMembersLink);
            return;
        }
        if (MultiView.GetActiveView() == SaveStaffMembersView)
        {
            SetActiveTab(SaveStaffMembersLink);
            return;
        }
        if (MultiView.GetActiveView() == ApproveStaffMembersView)
        {
            SetActiveTab(ApproveStaffMembersLink);
            return;
        }
    }

    private void SetActiveTab(System.Web.UI.HtmlControls.HtmlGenericControl control)
    {
        SaveStaffMembersLink.Attributes["class"] = "";
        ListStaffMembersLink.Attributes["class"] = "";
        ApproveStaffMembersLink.Attributes["class"] = "";
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

        if (link.ID == ListStaffMembersLinkButton.ID)
        {
            MultiView.SetActiveView(ListStaffMembersView);
            return;
        }
        if (link.ID == SaveStaffMembersLinkButton.ID)
        {
            MultiView.SetActiveView(SaveStaffMembersView);
            return;
        }
        if (link.ID == ApproveStaffMembersLinkButton.ID)
        {
            MultiView.SetActiveView(ApproveStaffMembersView);
            return;
        }
    }
}