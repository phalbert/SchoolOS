using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class CustomUserControls_ManageStudentPayments : System.Web.UI.UserControl
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
        AssignFeesUserControl.LoadData();
        HighLightCorrectTab();
    }


    private void HighLightCorrectTab()
    {
        if (MultiView.GetActiveView() == BulkStudentPaymentsView)
        {
            SetActiveTab(BulkStudentPaymentsLink);
            return;
        }
        if (MultiView.GetActiveView() == AssignFeesView)
        {
            SetActiveTab(AssignFeesLink);
            return;
        }
        if (MultiView.GetActiveView() == SaveStudentCreditView)
        {
            SetActiveTab(SaveStudentCreditLink);
            return;
        }
        if (MultiView.GetActiveView() == ListStudentFeesView)
        {
            SetActiveTab(ListStudentFeesLink);
            return;
        }
        if (MultiView.GetActiveView() == ApproveStudentFeesView)
        {
            SetActiveTab(ApproveStudentFeesLink);
            return;
        }

        if (MultiView.GetActiveView() == ListPaymentLogsView)
        {
            SetActiveTab(ListPaymentLogsLink);
            return;
        }
    }

    private void SetActiveTab(HtmlGenericControl control)
    {
        AssignFeesLink.Attributes["class"] = "";
        SaveStudentCreditLink.Attributes["class"] = "";
        ListStudentFeesLink.Attributes["class"] = "";
        ApproveStudentFeesLink.Attributes["class"] = "";
        ListPaymentLogsLink.Attributes["class"] = "";
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

        if (link.ID == BulkStudentPaymentsLinkBytton.ID)
        {
            MultiView.SetActiveView(BulkStudentPaymentsView);
            return;
        }
        if (link.ID == AssignFeesLinkButton.ID)
        {
            MultiView.SetActiveView(AssignFeesView);
            return;
        }
        if (link.ID == SaveStudentCreditLinkButton.ID)
        {
            MultiView.SetActiveView(SaveStudentCreditView);
            return;
        }
        if (link.ID == ListStudentFeesLinkButton.ID)
        {
            MultiView.SetActiveView(ListStudentFeesView);
            return;
        }
        if (link.ID == ApproveStudentFeesLinkButton.ID)
        {
            MultiView.SetActiveView(ApproveStudentFeesView);
            return;
        }
        if (link.ID == ListPaymentLogsLinkButton.ID)
        {
            MultiView.SetActiveView(ListPaymentLogsView);
            return;
        }
    }
}