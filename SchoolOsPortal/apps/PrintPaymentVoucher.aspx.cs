using InterLinkClass.PegasusManagementApi;
using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PrintPaymentVoucher : System.Web.UI.Page
{
    MSystemService api = new MSystemService();
    Bussinesslogic bll = new Bussinesslogic();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            LoadRecieptDetails();
        }
        catch (Exception ex)
        {
            //something is wrong...show the error
            bll.ShowMessage(lblmsg, ex.Message, true, Session);
        }
    }

    private void LoadRecieptDetails()
    {
        string RecieptId = Request.QueryString["Id"];
        string CompanyCode = Request.QueryString["CompanyCode"];

        Entity result = api.GetById(CompanyCode, "PAYMENTVOUCHER", RecieptId);

        if (result.StatusCode != Globals.SUCCESS_STATUS_CODE)
        {
            throw new Exception(result.StatusDesc);
        }

        PaymentVoucher voucher = result as PaymentVoucher;

        lblInvoiceNumber.Text = voucher.InvoiceNumber;
        lblReason.Text = voucher.Reason;
        lblVoucherAmount.Text = voucher.VoucherAmount;
        lblVoucherCode.Text = voucher.VoucherCode;
        lblInvoiceNumber.Text = voucher.InvoiceNumber;
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