using InterLinkClass.PegasusManagementApi;
using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SaveReciept : System.Web.UI.UserControl, ExternalMessageInterface
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
        bll.LoadCurrenciesIntoDropDown(ddCompanies.SelectedValue, user, ddCurrency);
        bll.LoadPaymentTypesIntoDropDown(ddCompanies.SelectedValue, user, ddPaymentTypes);
        bll.LoadClientsAndSuppliersIntoDropDown(ddCompanies.SelectedValue, user, ddClients);
        bll.LoadRecieptCatgoriesIntoDropDown(ddCompanies.SelectedValue, user, ddRecieptCategory);
        bll.LoadInvoicesForClient(ddCompanies.SelectedValue, user, ddInvoices, ddClients.SelectedValue);
        ddPaymentTypes_SelectedIndexChanged(null, null);
        ddClientName_SelectedIndexChanged(null, null);
        ddInvoices_SelectedIndexChanged(null, null);
        ddRecieptCategory.Enabled = false;
    }

    protected void ddClientName_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            Entity result = client.GetById(ddCompanies.SelectedValue, "CLIENTORSUPPLIER", ddClients.SelectedValue);
            if (result.StatusCode != Globals.SUCCESS_STATUS_CODE)
            {
                return;
            }
            Client theClient = result as Client;
            if (theClient.ClientCategory == "SUPPLIER")
            {
                ddRecieptCategory.SelectedValue = "SUPPLIER_RECIEPT";
            }
            else if (theClient.ClientCategory == "CLIENT")
            {
                ddRecieptCategory.SelectedValue = "CLIENT_RECIEPT";
            }
            bll.LoadInvoicesForClient(ddCompanies.SelectedValue, user, ddInvoices, ddClients.SelectedValue);

        }
        catch (Exception ex)
        {
            bll.LogError("SAVE-CLIENT", ex.StackTrace, "", ex.Message, "EXCEPTION");
            bll.ShowMessage(lblmsg, ex.Message, true, Session);
        }
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
            Reciept reciept = GetReciept();
            Result result = client.SaveReciept(reciept);

            if (result.StatusCode != Globals.SUCCESS_STATUS_CODE)
            {
                msg = "FAILED: " + result.StatusDesc;
                bll.ShowMessage(lblmsg, msg, false, Session);
                return;
            }

            msg = "RECIEPT SAVED SUCCESSFULLY";
            bll.ShowMessage(lblmsg, msg, false, Session);

            //raise save completed event so any subscribers can do their thing
            if (this.SaveCompleted != null)
            {
                //data to pass to subscribers of event
                MyEventArgs eventArgs = new MyEventArgs();
                eventArgs.PegPayId = result.PegPayID;
                eventArgs.ThirdPartyId = result.ThirdPartYID;

                //Pass on msg
                Session["ExternalMsg"] = msg;

                //raise the event
                this.SaveCompleted(this, eventArgs);
            }

            if (ddRecieptCategory.SelectedValue == "CLIENT_RECIEPT")
            {
                Server.Transfer("~/PrintReciept.aspx?CompanyCode=" + reciept.CompanyCode + "&Id=" + reciept.RecieptNumber);
            }
        }
        catch (Exception ex)
        {
            bll.LogError("SAVE-CLIENT", ex.StackTrace, "", ex.Message, "EXCEPTION");
            bll.ShowMessage(lblmsg, ex.Message, true, Session);
        }
    }

    private Reciept GetReciept()
    {
        Reciept reciept = new Reciept();
        reciept.CompanyCode = ddCompanies.SelectedValue;
        reciept.InvoiceNumber = ddInvoices.SelectedValue;
        reciept.BankAccountName = txtBankAccountNames.Text;
        reciept.BankAccountNumber = txtBankAccountNumber.Text;
        reciept.BankName = txtBankName.Text;
        reciept.ChequeNumber = txtChequeNumber.Text;
        reciept.PaymentDate = txtPaymentDate.Text;
        reciept.PaymentType = ddPaymentTypes.Text;
        reciept.RecieptNumber = txtRecieptNumber.Text;
        reciept.ModifiedBy = user.UserId;
        reciept.RecieptCategory = ddRecieptCategory.SelectedValue;
        reciept.ImageOfReciept = bll.GetImageUploadedInBase64String(fuRecieptImage);
        reciept.CurrencyCode = ddCurrency.SelectedValue;
        reciept.ClientCode = ddClients.SelectedValue;
        reciept.RecieptAmount = txtRecieptAmount.Text;
        return reciept;
    }

    protected void btnConfirm_Click(object sender, EventArgs e)
    {

    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {

    }

    public void LoadDataSpecificForPurchase(MyEventArgs eventArgs)
    {
        try
        {
            string InvoiceNumber = eventArgs.RequestID;
            Entity result = client.GetById(ddCompanies.SelectedValue, "INVOICE", InvoiceNumber);
            if (result.StatusCode != Globals.SUCCESS_STATUS_CODE)
            {
                throw new Exception("FAILED: " + result.StatusDesc);
            }
            Invoice invoice = result as Invoice;
            ddClients.SelectedValue = invoice.ClientCode;
            ddClients.Enabled = false;
            ddClientName_SelectedIndexChanged(null, null);
            ddInvoices.SelectedValue = InvoiceNumber;
            ddInvoices_SelectedIndexChanged(null, null);
            txtPaymentDate.Text = DateTime.Now.ToString("yyyy-MM-dd");
            ddInvoices.Enabled = false;
            ddRecieptCategory.SelectedValue = "SUPPLIER_RECIEPT";
            ddRecieptCategory.Enabled = false;
            ddPaymentTypes_SelectedIndexChanged(null, null);
            ShowExternalMessage();
        }
        catch (Exception ex)
        {
            bll.LogError("SAVE-CLIENT", ex.StackTrace, "", ex.Message, "EXCEPTION");
            bll.ShowMessage(lblmsg, ex.Message, true, Session);
        }
    }

    public void LoadDataSpecificForSale(string InvoiceNumber)
    {
        try
        {
            Entity result = client.GetById(ddCompanies.SelectedValue, "INVOICE", InvoiceNumber);
            if (result.StatusCode != Globals.SUCCESS_STATUS_CODE)
            {
                return;
            }
            Invoice invoice = result as Invoice;
            ddClients.SelectedValue = invoice.ClientCode;
            ddClients.Enabled = false;
            ddClientName_SelectedIndexChanged(null, null);
            ddInvoices.SelectedValue = InvoiceNumber;
            ddInvoices_SelectedIndexChanged(null, null);
            txtRecieptNumber.Text = SharedCommons.SharedCommons.GenerateUniqueId("RCPT");
            txtPaymentDate.Text = DateTime.Now.ToString("yyyy-MM-dd");
            ddInvoices.Enabled = false;
            txtRecieptNumber.Enabled = false;
            ddRecieptCategory.SelectedValue = "CLIENT_RECIEPT";
            ddRecieptCategory.Enabled = false;
            ddPaymentTypes_SelectedIndexChanged(null, null);
            fuRecieptImage.Enabled = false;
            ShowExternalMessage();
        }
        catch (Exception ex)
        {
            bll.LogError("SAVE-CLIENT", ex.StackTrace, "", ex.Message, "EXCEPTION");
            bll.ShowMessage(lblmsg, ex.Message, true, Session);
        }
    }

    public void ShowExternalMessage()
    {
        bll.ShowExternalMessage(lblmsg, Session);
    }

    protected void ddPaymentTypes_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            if (ddPaymentTypes.SelectedValue != "CASH")
            {
                BankDetails1.Visible = true;
                BankDetails2.Visible = true;
                return;
            }

            BankDetails1.Visible = false;
            BankDetails2.Visible = false;
            return;

        }
        catch (Exception ex)
        {
            bll.LogError("SAVE-CLIENT", ex.StackTrace, "", ex.Message, "EXCEPTION");
            bll.ShowMessage(lblmsg, ex.Message, true, Session);
        }
    }



    protected void ddInvoices_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            Entity result = client.GetById(ddCompanies.SelectedValue, "INVOICE", ddInvoices.SelectedValue);
            if (result.StatusCode != Globals.SUCCESS_STATUS_CODE)
            {
                return;
            }
            Invoice invoice = result as Invoice;
            txtRecieptAmount.Text = invoice.TotalInvoiceAmount;
        }
        catch (Exception ex)
        {
            bll.LogError("SAVE-CLIENT", ex.StackTrace, "", ex.Message, "EXCEPTION");
            bll.ShowMessage(lblmsg, ex.Message, true, Session);
        }
    }
}