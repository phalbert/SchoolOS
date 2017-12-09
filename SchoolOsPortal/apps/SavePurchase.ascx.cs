using InterLinkClass.PegasusManagementApi;
using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SavePurchase : System.Web.UI.UserControl, ExternalMessageInterface
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
        bll.LoadSuppliersIntoDropDown(ddCompanies.SelectedValue, user, ddSuppliers);
        bll.LoadUnpaidInvoicesForSupplierIntoDropDown(ddCompanies.SelectedValue, user, ddInvoices, ddSuppliers.SelectedValue);
        bll.LoadCurrenciesIntoDropDown(ddCompanies.SelectedValue, user, ddCurrencies);
        bll.ShowExternalMessage(lblmsg, Session);
        txtPurchaseID.Text = SharedCommons.SharedCommons.GenerateUniqueId("PCH");
        txtPurchaseID.Enabled = false;
    }

    private void LoadEntityData(string id)
    {
        btnSubmit.Visible = false;
        btnEdit.Visible = true;
        ddIsPaid.Enabled = true;
    }

    public void LoadDataSpecificForSupplier(MyEventArgs eventArgs)
    {
        try
        {
            bll.LoadUnpaidInvoicesForSupplierIntoDropDown(ddCompanies.SelectedValue, user, ddInvoices, ddSuppliers.SelectedValue);
            ddSuppliers.SelectedValue = eventArgs.RequestID;
            ddSuppliers.Enabled = false;
            txtPurchaseID.Text = eventArgs.ThirdPartyId;
            txtPurchaseID.Enabled = false;
            ddInvoices.SelectedValue = eventArgs.PegPayId;
            ddInvoices.Enabled = false;
            LoadInvoiceDetailsById(ddInvoices.SelectedValue);
            ShowExternalMessage();
            btnSubmit_Click(null, null);
        }
        catch (Exception ex)
        {
            bll.LogError("SAVE-CLIENT", ex.StackTrace, "", ex.Message, "EXCEPTION");
            bll.ShowMessage(lblmsg, ex.Message, true, Session);
        }
    }

    private void LoadInvoiceDetailsById(string selectedValue)
    {
        Entity result = client.GetById(ddCompanies.SelectedValue, "INVOICE", selectedValue);
        if (result.StatusCode != Globals.SUCCESS_STATUS_CODE)
        {
            //handle failure
            return;
        }

        Invoice invoice = result as Invoice;
        txtInvoiceAmount.Text = invoice.InvoiceAmount;
        txtInvoiceDate.Text = invoice.InvoiceDate;
        txtTaxAmount.Text = invoice.TaxAmount;
        txtAnyOtherTax.Text = invoice.AnyOtherTax;
        txtDiscountAmount.Text = invoice.DiscountAmount;
        txtToTalInvoiceAmount.Text = invoice.TotalInvoiceAmount;
        ddCurrencies.SelectedValue = invoice.CurrencyCode;
        ddCurrencies.Enabled = false;
        txtInvoiceAmount.Enabled = false;
        txtInvoiceDate.Enabled = false;
        txtTaxAmount.Enabled = false;
        txtAnyOtherTax.Enabled = false;
        txtDiscountAmount.Enabled = false;
        txtToTalInvoiceAmount.Enabled = false;
    }

    protected void btnEdit_Click(object sender, EventArgs e)
    {
        try
        {

        }
        catch (Exception ex)
        {
            bll.LogError("SAVE-CLIENT", ex.StackTrace, "", ex.Message, "EXCEPTION");
            bll.ShowMessage(lblmsg, ex.Message, true, Session);
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            string msg = "";
            Purchase aclient = GetPurchase();
            Result result = client.SaveInPurchasesLedger(aclient);

            if (result.StatusCode != Globals.SUCCESS_STATUS_CODE)
            {
                msg = "FAILED: " + result.StatusDesc;
                bll.ShowMessage(lblmsg, msg, false, Session);
                return;
            }

            msg = "PURCHASE SAVED SUCCESSFULLY";
            bll.ShowMessage(lblmsg, msg, false, Session);

            //raise save completed event so any subscribers can do their thing
            if (this.SaveCompleted != null)
            {
                //data to pass to subscribers of event
                MyEventArgs eventArgs = new MyEventArgs();
                eventArgs.PegPayId = result.PegPayID;
                eventArgs.ThirdPartyId = ddInvoices.SelectedValue;

                //Pass on msg
                Session["ExternalMsg"] = msg;

                //raise the event
                this.SaveCompleted(this, eventArgs);
            }
        }
        catch (Exception ex)
        {
            bll.LogError("SAVE-CLIENT", ex.StackTrace, "", ex.Message, "EXCEPTION");
            bll.ShowMessage(lblmsg, ex.Message, true, Session);
        }
    }

    private void RaiseEvent(object sender, EventArgs e)
    {
        if (this.SaveCompleted != null)
        {
            this.SaveCompleted(this, e);
        }
    }

    private Purchase GetPurchase()
    {
        Purchase client = new Purchase();
        client.CompanyCode = ddCompanies.SelectedValue;
        client.InvoiceNumber = ddInvoices.SelectedValue;
        client.AnyOtherTax = txtAnyOtherTax.Text;
        client.CurrencyCode = ddCurrencies.SelectedValue;
        client.DiscountAmount = txtInvoiceAmount.Text;
        client.InvoiceAmount = txtInvoiceAmount.Text;
        client.InvoiceDate = txtInvoiceDate.Text;
        client.SupplierCode = ddSuppliers.SelectedValue;
        client.SupplierName = ddSuppliers.Text;
        client.TaxAmount = txtTaxAmount.Text;
        client.TotalInvoiceAmount = txtToTalInvoiceAmount.Text;
        client.ModifiedBy = user.UserId;
        client.IsPaid = ddIsPaid.SelectedValue;
        client.PurchaseID = txtPurchaseID.Text;
        return client;
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

    protected void ddInvoices_SelectedIndexChanged(object sender, EventArgs e)
    {
        LoadInvoiceDetailsById(ddInvoices.SelectedValue);
    }
}