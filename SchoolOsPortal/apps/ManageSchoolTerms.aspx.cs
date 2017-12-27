using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class ManageSchoolTerms : System.Web.UI.Page
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
        if (MultiView.GetActiveView() == ListTermsView)
        {
            SetActiveTab(ListTermsLink);
            return;
        }
        if (MultiView.GetActiveView() == SaveTermView)
        {
            SetActiveTab(SaveTermLink);
            return;
        }
      
    }

    private void SetActiveTab(HtmlGenericControl control)
    {
        SaveTermLink.Attributes["class"] = "";
        ListTermsLink.Attributes["class"] = "";
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

        if (link.ID == ListTermsLinkButton.ID)
        {
            MultiView.SetActiveView(ListTermsView);
            return;
        }
        if (link.ID == SaveTermLinkButton.ID)
        {
            MultiView.SetActiveView(SaveTermView);
            return;
        }
    }
}