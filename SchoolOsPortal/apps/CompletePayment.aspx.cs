using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class CompletePayment : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            //subscripe to events from user controls
            ListPaymentVoucherUserControl.CompleteVoucherPaymentEvent += new EventHandler(CompleteVoucherPaymentEventRaised);
            SaveRecieptUserControl.SaveCompleted += new EventHandler(SaveRecieptCompleted);

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
        ListPaymentVoucherUserControl.SetSearchParametersForUnpaidVouchers();
    }

    private void HighLightCorrectTab()
    {
        if (MultiView.GetActiveView() == ListPaymentVouchersView)
        {
            SetActiveTab(ListPaymentVouchersLink);
            return;
        }
        if (MultiView.GetActiveView() == SaveRecieptView)
        {
            SetActiveTab(SaveRecieptDetailslink);
            return;
        }
    }

    private void SetActiveTab(HtmlGenericControl control)
    {
        ListPaymentVouchersLink.Attributes["class"] = "";
        SaveRecieptDetailslink.Attributes["class"] = "";
        control.Attributes["class"] = "active";
    }

    private void CompleteVoucherPaymentEventRaised(object sender, EventArgs e)
    {
        MyEventArgs eventArgs = e as MyEventArgs;
        MultiView.SetActiveView(SaveRecieptView);
        SaveRecieptUserControl.LoadDataSpecificForPurchase(eventArgs);
        HighLightCorrectTab();
    }

    private void SaveRecieptCompleted(object sender, EventArgs e)
    {
        HighLightCorrectTab();
    }
    
    protected void btnTabPane_Click(object sender, EventArgs e)
    {
        try
        {
        }
        catch (Exception ex)
        {
            string msg = "FAILED: " + ex.Message;
        }
    }
}