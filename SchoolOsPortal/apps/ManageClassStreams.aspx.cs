using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class ManageClassStreams : System.Web.UI.Page
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
        if (MultiView.GetActiveView() == ListStreamsUserView)
        {
            SetActiveTab(ListClassStreamLink);
            return;
        }
        if (MultiView.GetActiveView() == SaveStreamView)
        {
            SetActiveTab(SaveStreamLink);
            return;
        }

    }

    private void SetActiveTab(HtmlGenericControl control)
    {
        SaveStreamLink.Attributes["class"] = "";
        ListClassStreamLink.Attributes["class"] = "";
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

        if (link.ID == ListClassStreamLinkButton.ID)
        {
            MultiView.SetActiveView(ListStreamsUserView);
            return;
        }
        if (link.ID == SaveStreamLinkButton.ID)
        {
            MultiView.SetActiveView(SaveStreamView);
            return;
        }
    }
}