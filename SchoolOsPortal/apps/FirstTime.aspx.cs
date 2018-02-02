using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class FirstTime : System.Web.UI.Page
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
        if (MultiView.GetActiveView() == ManageSchoolView)
        {
            SetActiveTab(ManageSchoolLink);
            return;
        }
        if (MultiView.GetActiveView() == ManageStreamsView)
        {
            SetActiveTab(ManageStreamsLink);
            return;
        }
        if (MultiView.GetActiveView() == ManageSubjectsView)
        {
            SetActiveTab(ManageSubjectsLink);
            return;
        }
        if (MultiView.GetActiveView() == ManageStudentsView)
        {
            SetActiveTab(ManageStudentsLink);
            return;
        }
        if (MultiView.GetActiveView() == ManageStaffView)
        {
            SetActiveTab(ManageStaffLink);
            return;
        }
        if (MultiView.GetActiveView() == ManageSchoolFeesView)
        {
            SetActiveTab(ManageSchoolFeesLink);
            return;
        }
        if (MultiView.GetActiveView() == ManageStudentPaymentsView)
        {
            
            SetActiveTab(ManageStudentPaymentsLink);
            return;
        }
    }

    private void SetActiveTab(HtmlGenericControl control)
    {
        ManageSchoolLink.Attributes["class"] = "";
        ManageStreamsLink.Attributes["class"] = "";
        ManageSubjectsLink.Attributes["class"] = "";
        ManageStudentsLink.Attributes["class"] = "";
        ManageStaffLink.Attributes["class"] = "";
        ManageSchoolFeesLink.Attributes["class"] = "";
        ManageStudentPaymentsLink.Attributes["class"] = "";
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

        if (link.ID == ManageSchoolLinkButton.ID)
        {
            MultiView.SetActiveView(ManageSchoolView);
            return;
        }
        if (link.ID == ManageStreamsLinkButton.ID)
        {
            MultiView.SetActiveView(ManageStreamsView);
            return;
        }
        if (link.ID == ManageSubjectsLinkButton.ID)
        {
            MultiView.SetActiveView(ManageSubjectsView);
            return;
        }
        if (link.ID == ManageStudentsLinkButton.ID)
        {
            MultiView.SetActiveView(ManageStudentsView);
            return;
        }
        if (link.ID == ManageStaffLinkButton.ID)
        {
            MultiView.SetActiveView(ManageStaffView);
            return;
        }
        if (link.ID == ManageSchoolFeesLinkButton.ID)
        {
            MultiView.SetActiveView(ManageSchoolFeesView);
            return;
        }
        if (link.ID == ManageStudentPaymentsLinkButton.ID)
        {
            ManageStudentPaymentsUserControl.ReloadData();
            MultiView.SetActiveView(ManageStudentPaymentsView);
            return;
        }
    }
}