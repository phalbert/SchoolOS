using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ManageSales : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            //subscripe to events from user controls
            ListSalesUserControl.GenerateInvoiceEvent += new EventHandler(GenerateInvoiceEventRaised);
            SaveInvoiceUserControl.SaveCompleted += new EventHandler(SaveInvoiceCompleted);

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

    private void GenerateInvoiceEventRaised(object sender, EventArgs e)
    {
        MyEventArgs eventArgs = e as MyEventArgs;
        string invoiceNumber = eventArgs.PegPayId;
        MultiView.SetActiveView(SaveInvoiceView);
        SaveInvoiceUserControl.LoadDataSpecificForSale(eventArgs);
        SaveInvoiceUserControl.ShowExternalMessage();
    }

    private void SaveInvoiceCompleted(object sender, EventArgs e)
    {
    }
}