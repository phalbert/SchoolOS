using InterLinkClass.PegasusManagementApi;
using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SavePaymentVoucher : System.Web.UI.UserControl, ExternalMessageInterface
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
        ddIsPaid.Enabled = false;
        bll.LoadCompaniesIntoDropDown(user, ddCompanies);
        bll.LoadCurrenciesIntoDropDown(ddCompanies.SelectedValue, user, ddCurrencies);
        bll.LoadUnpaidInvoicesIntoDropDown(ddCompanies.SelectedValue, user, ddInvoices);
        bll.ShowExternalMessage(lblmsg, Session);
    }

    private void LoadEntityData(string id)
    {
        btnSubmit.Visible = false;
        btnEdit.Visible = true;
        ddIsPaid.Enabled = true;
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
            PaymentVoucher voucher = GetPaymentVoucher();
            Result result = client.SavePaymentVoucher(voucher);

            if (result.StatusCode != Globals.SUCCESS_STATUS_CODE)
            {
                msg = "FAILED: " + result.StatusDesc;
                bll.ShowMessage(lblmsg, msg, false, Session);
                return;
            }

            msg = "PAYMENT VOUCHER WITH ID [" + voucher.VoucherCode + "] SAVED SUCCESSFULLY";
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

            Server.Transfer("~/PrintPaymentVoucher.aspx?CompanyCode=" + voucher.CompanyCode + "&Id=" + voucher.VoucherCode);
        }
        catch (Exception ex)
        {
            bll.LogError("SAVE-CLIENT", ex.StackTrace, "", ex.Message, "EXCEPTION");
            bll.ShowMessage(lblmsg, ex.Message, true, Session);
        }
    }

    private PaymentVoucher GetPaymentVoucher()
    {
        PaymentVoucher invoice = new PaymentVoucher();
        invoice.CompanyCode = ddCompanies.SelectedValue;
        invoice.InvoiceNumber = ddInvoices.SelectedValue;
        invoice.Reason = txtReason.Text;
        invoice.VoucherAmount = txtVoucherAmount.Text;
        invoice.VoucherCode = txtVoucherCode.Text;
        invoice.ModifiedBy = user.UserId;
        invoice.IsUsed = ddIsPaid.SelectedValue;
        return invoice;
    }

    protected void btnConfirm_Click(object sender, EventArgs e)
    {

    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {

    }

    public void SetInvoiceSelected(string InvoiceNumber)
    {
        try
        {
            bll.LoadUnpaidInvoicesIntoDropDown(ddCompanies.SelectedValue, user, ddInvoices);
            ddInvoices.SelectedValue = InvoiceNumber;
            ddInvoices.Enabled = false;
           
            //get the invoice
            Entity result = client.GetById(ddCompanies.SelectedValue, "INVOICE", InvoiceNumber);

            //error on retrieving the invoice
            if (result.StatusCode != Globals.SUCCESS_STATUS_CODE)
            {
                throw new Exception("FAILED: " + result.StatusDesc);
            }

            //set the voucher amount to default to invoice amount
            Invoice invoice = result as Invoice;
            txtVoucherAmount.Text = invoice.TotalInvoiceAmount;
            txtVoucherCode.Text = SharedCommons.SharedCommons.GenerateUniqueId("VCH");
            txtReason.Text = invoice.Narration;
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
}