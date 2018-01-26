using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class CustomUserControls_ManageStudents : System.Web.UI.UserControl
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

  

    public void LoadData()
    {
        
        HighLightCorrectTab();
    }


    private void HighLightCorrectTab()
    {
        if (MultiView.GetActiveView() == ListStudentsView)
        {
            SetActiveTab(ListStudentsLink);
            return;
        }
        if (MultiView.GetActiveView() == SaveStudentsView)
        {
            SetActiveTab(SaveStudentsLink);
            return;
        }
        if (MultiView.GetActiveView() == AdmitStudentsView)
        {
            SetActiveTab(AdmitStudentsLink);
            return;
        }
        if (MultiView.GetActiveView() == BulkStudentUploadView)
        {
            SetActiveTab(BulkStudentUploadLink);
            return;
        }
        if (MultiView.GetActiveView() == PromoteStudentsView)
        {
            SetActiveTab(PromoteStudentsLink);
            return;
        }
        if (MultiView.GetActiveView() == ListAlumniUserView)
        {
            SetActiveTab(ListAlumniUserLink);
            return;
        }
    }

    private void SetActiveTab(HtmlGenericControl control)
    {
        SaveStudentsLink.Attributes["class"] = "";
        ListStudentsLink.Attributes["class"] = "";
        AdmitStudentsLink.Attributes["class"] = "";
        BulkStudentUploadLink.Attributes["class"] = "";
        ListAlumniUserLink.Attributes["class"] = "";
        PromoteStudentsLink.Attributes["class"] = "";
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

        if (link.ID == ListStudentsLinkButton.ID)
        {
            MultiView.SetActiveView(ListStudentsView);
            return;
        }
        if (link.ID == SaveStudentsLinkButton.ID)
        {
            MultiView.SetActiveView(SaveStudentsView);
            return;
        }
        if (link.ID == AdmitStudentsLinkButton.ID)
        {
            MultiView.SetActiveView(AdmitStudentsView);
            return;
        }
        if (link.ID == BulkStudentUploadLinkButton.ID)
        {
            MultiView.SetActiveView(BulkStudentUploadView);
            return;
        }
        if (link.ID == PromoteStudentsLinkButton.ID)
        {
            MultiView.SetActiveView(PromoteStudentsView);
            return;
        }
        if (link.ID == ListAlumniUserLinkButton.ID)
        {
            MultiView.SetActiveView(ListAlumniUserView);
            return;
        }
    }
}