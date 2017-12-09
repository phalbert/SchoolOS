using InterLinkClass.PegasusManagementApi;
using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PrintReciept : System.Web.UI.Page
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

        Entity result = api.GetById(CompanyCode, "RECIEPT", RecieptId);

        if (result.StatusCode != Globals.SUCCESS_STATUS_CODE)
        {
            throw new Exception(result.StatusDesc);
        }

        Reciept reciept = result as Reciept;

        lblAmount.Text = reciept.RecieptAmount;
        lblBankAccountName.Text = reciept.BankAccountName;
        lblBankAccountNumber.Text = reciept.BankAccountNumber;
        lblBankName.Text = reciept.BankName;
        lblChequeNumber.Text = reciept.ChequeNumber;
        lblClientName.Text = GetClientNameByCode(reciept.CompanyCode,reciept.ClientCode);
        lblCompanyName.Text = reciept.CompanyCode;
        lblCurrency.Text = reciept.CurrencyCode;
        lblInvoiceNumber.Text = reciept.InvoiceNumber;
        lblPaymentDate.Text = reciept.PaymentDate;
        lblPaymentType.Text = reciept.PaymentType;
        lblRecieptCategory.Text = reciept.RecieptCategory;
        lblRecieptNumber.Text = reciept.RecieptNumber;
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