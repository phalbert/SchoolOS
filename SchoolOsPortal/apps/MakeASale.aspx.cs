using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class MakeASale : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            //subscripe to events from user controls
            ListClientsControl.MakeASaleEvent += new EventHandler(MakeASaleEventRaised);
            SaveSaleItemsControl.SaveCompleted += new EventHandler(SaveSaleItemsCompleted);
            SaveSaleControl.SaveCompleted += new EventHandler(SaveSaleCompleted);
            SaveInvoiceControl.SaveCompleted += new EventHandler(SaveInvoiceCompleted);

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

    private void SaveSaleItemsCompleted(object sender, EventArgs e)
    {
        MyEventArgs eventArgs = e as MyEventArgs;
        SaveSaleControl.LoadDataSpecificForSale(eventArgs);
        MultiView.SetActiveView(SaveSaleView);
        HighLightCorrectTab();
    }

    private void HighLightCorrectTab()
    {
        if (MultiView.GetActiveView() == ListClientsView)
        {
            SetActiveTab(ListClientsLink);
            return;
        }
        if (MultiView.GetActiveView() == SaveSaleItemsView)
        {
            SetActiveTab(SaveSaleItemsLink);
            return;
        }
        if (MultiView.GetActiveView() == SaveSaleView)
        {
            SetActiveTab(SaveSaleLink);
            return;
        }
        if (MultiView.GetActiveView() == SaveInvoiceView)
        {
            SetActiveTab(SaveInvoiceLink);
            return;
        }
    }

    private void SetActiveTab(HtmlGenericControl control)
    {
        ListClientsLink.Attributes["class"] = "";
        SaveSaleItemsLink.Attributes["class"] = "";
        SaveSaleLink.Attributes["class"] = "";
        SaveInvoiceLink.Attributes["class"] = "";
        control.Attributes["class"] = "active";
    }

    private void MakeASaleEventRaised(object sender, EventArgs e)
    {
        MyEventArgs eventArgs = e as MyEventArgs;
        MultiView.SetActiveView(SaveSaleItemsView);
        SaveSaleItemsControl.LoadDataSpecificForSale(eventArgs);
        HighLightCorrectTab();
    }

    private void SaveSaleCompleted(object sender, EventArgs e)
    {
        MyEventArgs eventArgs = e as MyEventArgs;
        SaveInvoiceControl.LoadDataSpecificForSale(eventArgs);
        MultiView.SetActiveView(SaveInvoiceView);
        HighLightCorrectTab();
    }

    private void SaveInvoiceCompleted(object sender, EventArgs e)
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