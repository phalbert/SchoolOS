using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class ManageSchool : System.Web.UI.UserControl
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

    }

    private void SetActiveTab(HtmlGenericControl control)
    {
        ListSchoolsLink.Attributes["class"] = "";
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
    }
}