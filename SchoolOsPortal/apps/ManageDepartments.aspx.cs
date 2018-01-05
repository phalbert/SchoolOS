using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ManageDepartments : System.Web.UI.Page
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
        if (MultiView.GetActiveView() == ListDepartmentsView)
        {
            SetActiveTab(ListDepartmentsLink);
            return;
        }
        if (MultiView.GetActiveView() == SaveDepartmentView)
        {
            SetActiveTab(SaveDepartmentLink);
            return;
        }

    }

    private void SetActiveTab(System.Web.UI.HtmlControls.HtmlGenericControl control)
    {
        SaveDepartmentLink.Attributes["class"] = "";
        ListDepartmentsLink.Attributes["class"] = "";
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

        if (link.ID == ListDepartmentsLinkButton.ID)
        {
            MultiView.SetActiveView(ListDepartmentsView);
            return;
        }
        if (link.ID == SaveDepartmentLinkButton.ID)
        {
            MultiView.SetActiveView(SaveDepartmentView);
            return;
        }
    }
}