using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class ViewFileUploadLogs : System.Web.UI.Page
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
        //ListClassesUserControl.LoadDataForStudent();
        MultiView.SetActiveView(ListClassesUserView);
        return;

    }


    private void HighLightCorrectTab()
    {
        if (MultiView.GetActiveView() == ListClassesUserView)
        {
            SetActiveTab(ListClassesLink);
            return;
        }

    }

    private void SetActiveTab(HtmlGenericControl control)
    {
        ListClassesLink.Attributes["class"] = "";
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

        if (link.ID == ListClassesLinkButton.ID)
        {
           // ListClassesUserControl.LoadDataForStudent();
            MultiView.SetActiveView(ListClassesUserView);
            return;
        }
    }
}