using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class ManageSchoolFees : System.Web.UI.Page
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
        if (MultiView.GetActiveView() == ListFeesView)
        {
            SetActiveTab(ListFeesLink);
            return;
        }
        if (MultiView.GetActiveView() == SaveFeeView)
        {
            SetActiveTab(SaveFeeLink);
            return;
        }
        if (MultiView.GetActiveView() == ApproveFeesView)
        {
            SetActiveTab(ApproveFeesLink);
            return;
        }
    }

    private void SetActiveTab(HtmlGenericControl control)
    {
        SaveFeeLink.Attributes["class"] = "";
        ListFeesLink.Attributes["class"] = "";
        ApproveFeesLink.Attributes["class"] = "";
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

        if (link.ID == ListFeesLinkButton.ID)
        {
            MultiView.SetActiveView(ListFeesView);
            return;
        }
        if (link.ID == SaveFeeLinkButton.ID)
        {
            MultiView.SetActiveView(SaveFeeView);
            return;
        }
        if (link.ID == ApproveFeesLinkButton.ID)
        {
            MultiView.SetActiveView(ApproveFeesView);
            return;
        }
    }
}