using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ManageSaleItems : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            //subscripe to events from user controls
            ListSaleItemsUserControl.GoToTheSaleEvent += new EventHandler(GoToSaleEventRaised);
            //SavePaymentVoucherUserControl.SaveCompleted += new EventHandler(SavePaymentVoucherCompleted);

            if (IsPostBack)
            {

            }
            else
            {
                //LoadData();
            }
        }
        catch (Exception ex)
        {

        }
    }

    private void GoToSaleEventRaised(object sender, EventArgs e)
    {
        MyEventArgs eventArgs = e as MyEventArgs;
        string saleId = eventArgs.PegPayId;
        MultiView.SetActiveView(SaveSaleIteView);
        SaveSaleItemUserControl.LoadDataSpecificForSaleItem(eventArgs);
        SaveSaleItemUserControl.ShowExternalMessage();
    }
}