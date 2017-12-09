using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ManagePurchases : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            //subscripe to events from user controls
            ListPurchasesUserControl.GeneratePaymentVoucherEvent += new EventHandler(GeneratePaymentVoucherEventRaised);
            //SavePaymentVoucherUserControl.SaveCompleted += new EventHandler(SavePaymentVoucherCompleted);

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

    }

    private void GeneratePaymentVoucherEventRaised(object sender, EventArgs e)
    {
        MyEventArgs eventArgs = e as MyEventArgs;
        string invoiceNumber = eventArgs.PegPayId;
        MultiView.SetActiveView(SavePaymentVoucherView);
        SavePaymentVoucherUserControl.SetInvoiceSelected(invoiceNumber);
        SavePaymentVoucherUserControl.ShowExternalMessage();
    }

    private void SavePaymentVoucherCompleted(object sender, EventArgs e)
    {
    }
}