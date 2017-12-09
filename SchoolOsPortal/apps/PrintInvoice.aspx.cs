using InterLinkClass.PegasusManagementApi;
using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PrintInvoice : System.Web.UI.Page
{
    MSystemService api = new MSystemService();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            LoadRecieptDetails();
        }
        catch (Exception)
        {

            throw;
        }
    }

    private void LoadRecieptDetails()
    {
        string RecieptId = Request.QueryString["Id"];
        string CompanyCode = Request.QueryString["CompanyCode"];

        Entity result = api.GetById(CompanyCode, "INVOICE", RecieptId);

        if (result.StatusCode != Globals.SUCCESS_STATUS_CODE)
        {
            throw new Exception(result.StatusDesc);
        }

        Invoice invoice = result as Invoice;

        lblAnyOtherTax.Text = invoice.AnyOtherTax;
        lblClientCode.Text = invoice.ClientCode;
        lblDiscountAmount.Text = invoice.DiscountAmount;
        lblInvoiceAmount.Text = invoice.InvoiceAmount;
        lblInvoiceNumber.Text = invoice.InvoiceNumber;
        lblReason.Text = invoice.Narration;
        lblTaxAmount.Text = invoice.TaxAmount;
        lblTotalInvoiceAmount.Text = invoice.TotalInvoiceAmount;
        lblClientName.Text = GetClientNameByCode(CompanyCode, invoice.ClientCode);
        lblCompanyName.Text = invoice.CompanyCode;
        lblCurrencyCode.Text = invoice.CurrencyCode;
        lblInvoiceNumber.Text = invoice.InvoiceNumber;
        lblInvoiceDate.Text = invoice.InvoiceDate;
    }

    private string GetClientNameByCode(string CompanyCode, string clientCode)
    {
        Entity result = api.GetById(CompanyCode, "CLIENTORSUPPLIER", clientCode);
        if (result.StatusCode != Globals.SUCCESS_STATUS_CODE)
        {
            return "N/A";
        }

        Client client = result as Client;
        return client.ClientName;
    }
}