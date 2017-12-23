﻿using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class ManageStudents : System.Web.UI.Page
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
    }

    private void SetActiveTab(HtmlGenericControl control)
    {
        SaveStudentsLink.Attributes["class"] = "";
        ListStudentsLink.Attributes["class"] = "";
        AdmitStudentsLink.Attributes["class"] = "";
        BulkStudentUploadLink.Attributes["class"] = "";
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
    }
}