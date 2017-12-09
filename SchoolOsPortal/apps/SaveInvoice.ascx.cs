using InterLinkClass.PegasusManagementApi;
using System;
using System.Collections.Generic;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SaveInvoice : System.Web.UI.UserControl, ExternalMessageInterface
{
    public event EventHandler SaveCompleted;
    Bussinesslogic bll = new Bussinesslogic();
    SystemUser user = new SystemUser();
    MSystemService client = new MSystemService();

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {

            user = Session["User"] as SystemUser;
            Session["IsError"] = null;
            string Id = Request.QueryString["BankCode"];

            //Session is invalid
            if (user == null)
            {
                Response.Redirect("Default.aspx?Msg=SESSION HAS EXPIRED");
            }
            //Page posting back user request
            else if (IsPostBack)
            {

            }
            //Load Old details
            else if (!string.IsNullOrEmpty(Id))
            {
                LoadEntityData(Id);
            }
            //First time Request
            else
            {
                LoadData();
            }
        }
        catch (Exception ex)
        {
            //something is wrong...show the error
            bll.ShowMessage(lblmsg, ex.Message, true, Session);
        }
    }

    private void LoadData()
    {
        btnSubmit.Visible = true;
        btnEdit.Visible = false;
        bll.LoadCompaniesIntoDropDown(user, ddCompanies);
        bll.LoadCurrenciesIntoDropDown(ddCompanies.SelectedValue, user, ddCurrencies);
        bll.LoadSuppliersIntoDropDown(ddCompanies.SelectedValue, user, ddClientName);
        bll.LoadInvoiceCatgoriesIntoDropDown(ddCompanies.SelectedValue, user, ddInvoiceType);
        txtCorrelationID.Text = SharedCommons.SharedCommons.GenerateUniqueId("PCH");
        txtCorrelationID.Enabled = false;
        ddIsPaid.Enabled = false;
        ddInvoiceType.Enabled = false;
        ddClientName_SelectedIndexChanged(null, null);
    }

    private void LoadEntityData(string id)
    {
        btnSubmit.Visible = false;
        btnEdit.Visible = true;

    }

    protected void btnEdit_Click(object sender, EventArgs e)
    {
        try
        {

        }
        catch (Exception ex)
        {
            bll.ShowMessage(lblmsg, ex.Message, true, Session);
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            string msg = "";
            Invoice invoice = GetInvoice();
            Result result = client.SaveInvoice(invoice);

            if (result.StatusCode != Globals.SUCCESS_STATUS_CODE)
            {
                msg = "FAILED: " + result.StatusDesc;
                bll.ShowMessage(lblmsg, msg, false, Session);
                return;
            }

            msg = "INVOICE SAVED SUCCESSFULLY";
            bll.ShowMessage(lblmsg, msg, false, Session);

            if (SaveCompleted != null)
            {
                MyEventArgs eventArgs = new MyEventArgs();
                eventArgs.PegPayId = txtInvoiceNumber.Text;
                eventArgs.RequestID = ddClientName.SelectedValue;
                eventArgs.ThirdPartyId = txtCorrelationID.Text;

                //Pass on msg
                Session["ExternalMsg"] = msg;

                SaveCompleted(sender, eventArgs);
            }

            if (ddInvoiceType.SelectedValue == "CLIENT_INVOICE")
            {
                Server.Transfer("~/PrintInvoice.aspx?CompanyCode=" + invoice.CompanyCode + "&Id=" + invoice.InvoiceNumber);
            }
        }
        catch (Exception ex)
        {
            bll.LogError("SAVE-CLIENT", ex.StackTrace, "", ex.Message, "EXCEPTION");
            bll.ShowMessage(lblmsg, ex.Message, true, Session);
        }
    }

    private Invoice GetInvoice()
    {
        Invoice invoice = new Invoice();
        invoice.CompanyCode = ddCompanies.SelectedValue;
        invoice.AnyOtherTax = txtAnyotherTax.Text;
        invoice.CurrencyCode = ddCurrencies.SelectedValue;
        invoice.DiscountAmount = txtDiscountAmount.Text;
        invoice.InvoiceAmount = txtInvoiceAmount.Text;
        invoice.InvoiceDate = txtxInvoiceDate.Text;
        invoice.InvoiceNumber = txtInvoiceNumber.Text;
        invoice.Narration = txtReason.Text;
        invoice.TaxAmount = txtTaxAmount.Text;
        invoice.TotalInvoiceAmount = txtTotalInvoiceAmount.Text;
        invoice.ModifiedBy = user.UserId;
        invoice.ClientCode = ddClientName.SelectedValue;
        invoice.IsPaid = ddIsPaid.SelectedValue;
        invoice.InvoiceCategory = ddInvoiceType.SelectedValue;
        invoice.ImageOfInvoice = bll.GetImageUploadedInBase64String(fuInvoiceImage);
        invoice.ModifiedBy = this.user.UserId;
        invoice.CorrelationId = txtCorrelationID.Text;
        return invoice;
    }



    protected void btnConfirm_Click(object sender, EventArgs e)
    {

    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {

    }

    public void ShowExternalMessage()
    {
        bll.ShowExternalMessage(lblmsg, Session);
    }

    public void LoadDataSpecificForPurchase(MyEventArgs eventArgs)
    {
        try
        {
            string supplierCode = eventArgs.PegPayId;
            ddClientName.SelectedValue = supplierCode;
            ddClientName.Enabled = false;
            ShowExternalMessage();
            txtInvoiceNumber.Text = SharedCommons.SharedCommons.GenerateUniqueId("INV");
        }
        catch (Exception ex)
        {
            bll.LogError("SAVE-CLIENT", ex.StackTrace, "", ex.Message, "EXCEPTION");
            bll.ShowMessage(lblmsg, ex.Message, true, Session);
        }
    }

    public void LoadDataSpecificForSale(MyEventArgs eventArgs)
    {
        try
        {
            string saleID = eventArgs.PegPayId;
            string clientCode = eventArgs.ThirdPartyId;
            Entity result = client.GetById(user.CompanyCode, "SALE", saleID);
            if (result.StatusCode != Globals.SUCCESS_STATUS_CODE)
            {
                return;
            }

            Sale sale = result as Sale;
            txtAnyotherTax.Text = sale.AnyOtherTaxAmount;
            txtDiscountAmount.Text = sale.DiscountAmount;
            txtInvoiceAmount.Text = sale.TotalSubTotalAmount;
            txtInvoiceAmount.Enabled = false;
            txtInvoiceNumber.Text = SharedCommons.SharedCommons.GenerateUniqueId("INV");
            txtInvoiceNumber.Enabled = false;
            txtxInvoiceDate.Text = DateTime.Now.ToString("yyyy-MM-dd");
            txtTotalInvoiceAmount.Text = sale.TotalSaleAmount;
            txtTaxAmount.Text = sale.TaxAmount;
            txtReason.Text = bll.GetSaleItemsForNarration(saleID);
            txtCorrelationID.Text = saleID;
            txtCorrelationID.Enabled = false;
            ddCompanies.SelectedValue = sale.CompanyCode;
            ddCurrencies.SelectedValue = sale.CurrencyCode;
            bll.LoadClientsIntoDropDown(ddCompanies.SelectedValue, user, ddClientName);
            ddIsPaid.SelectedValue = "FALSE";
            ddIsPaid.Enabled = false;
            ddInvoiceType.SelectedValue = "CLIENT_INVOICE";
            ddClientName.SelectedValue = sale.ClientCode;
            ddClientName_SelectedIndexChanged(null, null);
            ddInvoiceType.Enabled = false;
            fuInvoiceImage.Enabled = false;
            ShowExternalMessage();
        }
        catch (Exception ex)
        {
            bll.LogError("SAVE-CLIENT", ex.StackTrace, "", ex.Message, "EXCEPTION");
            bll.ShowMessage(lblmsg, ex.Message, true, Session);
        }
    }

    protected void ddClientName_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            Entity result = client.GetById(ddCompanies.SelectedValue, "CLIENTORSUPPLIER", ddClientName.SelectedValue);
            if (result.StatusCode != Globals.SUCCESS_STATUS_CODE)
            {
                return;
            }
            Client theClient = result as Client;
            if (theClient.ClientCategory == "SUPPLIER")
            {
                ddInvoiceType.SelectedValue = "SUPPLIER_INVOICE";
            }
            else if (theClient.ClientCategory == "CLIENT")
            {
                ddInvoiceType.SelectedValue = "CLIENT_INVOICE";
            }
        }
        catch (Exception ex)
        {
            bll.LogError("SAVE-CLIENT", ex.StackTrace, "", ex.Message, "EXCEPTION");
            bll.ShowMessage(lblmsg, ex.Message, true, Session);
        }
    }
}