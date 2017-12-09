using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class CompleteSale : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            //subscripe to events from user controls
            ListInvoicesUserControl.GenerateRecieptEvent += new EventHandler(GenerateRecieptEventRaised);
            SaveRecieptUserControl.SaveCompleted += new EventHandler(SaveRecieptCompleted);

            if (IsPostBack)
            {

            }
            else
            {
                
            }
        }
        catch (Exception ex)
        {

        }
    }

    protected void Page_LoadComplete(object sender, EventArgs e)
    {
        try
        {
           
            if (IsPostBack)
            {

            }
            else
            {
                LoadDataAfterPageLoad();
            }
        }
        catch (Exception ex)
        {

        }
    }


    private void LoadDataAfterPageLoad()
    {
        HighLightCorrectTab();
        ListInvoicesUserControl.SetSearchParametersForUnpaidInvoices();
    }

    private void HighLightCorrectTab()
    {
        if (MultiView.GetActiveView() == ListInvoicesView)
        {
            SetActiveTab(ListInvoicesLink);
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
        ListInvoicesLink.Attributes["class"] = "";
        SaveRecieptDetailslink.Attributes["class"] = "";
        control.Attributes["class"] = "active";
    }

    private void GenerateRecieptEventRaised(object sender, EventArgs e)
    {
        MyEventArgs eventArgs = e as MyEventArgs;
        string invoiceNumber = eventArgs.PegPayId;
        MultiView.SetActiveView(SaveRecieptView);
        SaveRecieptUserControl.LoadDataSpecificForSale(invoiceNumber);
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