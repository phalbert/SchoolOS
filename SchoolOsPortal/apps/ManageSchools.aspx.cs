using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class ManageSchools : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {


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
        if (MultiView.GetActiveView() == ListSchoolsView)
        {
            SetActiveTab(ListSchoolsLink);
            return;
        }
        if (MultiView.GetActiveView() == SaveSchoolsView)
        {
            SetActiveTab(SaveSchoolsLink);
            return;
        }
        if (MultiView.GetActiveView() == ApproveSchoolsView)
        {
            SetActiveTab(ApproveSchoolsLink);
            return;
        }

    }

    private void SetActiveTab(HtmlGenericControl control)
    {
        SaveSchoolsLink.Attributes["class"] = "";
        ListSchoolsLink.Attributes["class"] = "";
        ApproveSchoolsLink.Attributes["class"] = "";
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
        if (link.ID == ListSchoolsLinkButton.ID)
        {
            MultiView.SetActiveView(ListSchoolsView);
            return;
        }
        if (link.ID == SaveSchoolsLinkButton.ID)
        {
            MultiView.SetActiveView(SaveSchoolsView);
            return;
        }
        if (link.ID == ApproveSchoolsLinkButton.ID)
        {
            MultiView.SetActiveView(ApproveSchoolsView);
            return;
        }
    }
}