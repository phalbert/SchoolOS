using InterLinkClass.PegasusManagementApi;
using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SaveQuickPurchase : System.Web.UI.UserControl
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
        bll.LoadEmployeesIntoDropDown(ddCompanies.SelectedValue, user, ddSuppliers);
        txtPurchaseID.Text = SharedCommons.SharedCommons.GenerateUniqueId("PCH");
        txtInvoiceNumber.Text = SharedCommons.SharedCommons.GenerateUniqueId("INV-EMP");
        txtPurchaseID.Enabled = false;
        txtInvoiceNumber.Enabled = false;
        Complex.Visible = false;
    }

    private void LoadEntityData(string id)
    {
        btnSubmit.Visible = false;
        btnEdit.Visible = true;
    }

    public void LoadDataSpecificForSupplier(MyEventArgs eventArgs)
    {
        try
        {
            ddSuppliers.SelectedValue = eventArgs.RequestID;
            ddSuppliers.Enabled = false;
            txtPurchaseID.Text = eventArgs.ThirdPartyId;
            txtPurchaseID.Enabled = false;
            ShowExternalMessage();
            btnSubmit_Click(null, null);
        }
        catch (Exception ex)
        {
            bll.LogError("SAVE-CLIENT", ex.StackTrace, "", ex.Message, "EXCEPTION");
            bll.ShowMessage(lblmsg, ex.Message, true, Session);
        }
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

            Result result = Save();

            if (result.StatusCode != Globals.SUCCESS_STATUS_CODE)
            {
                return;
            }

            //raise save completed event so any subscribers can do their thing
            if (this.SaveCompleted != null)
            {
                //data to pass to subscribers of event
                MyEventArgs eventArgs = new MyEventArgs();
                eventArgs.PegPayId = result.PegPayID;

                //Pass on msg
                Session["ExternalMsg"] = "SUCCESSFULLY SAVED PURCHASE DETAILS";

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

    private Result Save()
    {
        Purchase purchase = GetPurchase();
        Result result = SavePurchase();

        if (result.StatusCode != Globals.SUCCESS_STATUS_CODE)
        {
            return result;
        }

        result = SaveReciept(purchase);
        return result;
    }

    private Result SavePurchase()
    {
        string msg = "";
        Purchase aclient = GetPurchase();
        Result result = client.SaveInPurchasesLedger(aclient);

        if (result.StatusCode != Globals.SUCCESS_STATUS_CODE)
        {
            msg = "FAILED: " + result.StatusDesc;
            bll.ShowMessage(lblmsg, msg, false, Session);
            return result;
        }

        msg = "PURCHASE SAVED SUCCESSFULLY";
        bll.ShowMessage(lblmsg, msg, false, Session);
        return result;
    }

    private Result SaveReciept(Purchase purchase)
    {
        string msg = "";
        Reciept reciept = GetReciept(purchase);
        Result result = client.SaveReciept(reciept);

        if (result.StatusCode != Globals.SUCCESS_STATUS_CODE)
        {
            msg = "FAILED: " + result.StatusDesc;
            bll.ShowMessage(lblmsg, msg, false, Session);
            return result;
        }

        msg = "PURCHASE SAVED SUCCESSFULLY! ID ["+result.PegPayID+"]";
        bll.ShowMessage(lblmsg, msg, false, Session);
        return result;
    }

    private Reciept GetReciept(Purchase purch)
    {
        Reciept reciept = new Reciept();
        reciept.CompanyCode = ddCompanies.SelectedValue;
        reciept.InvoiceNumber = purch.InvoiceNumber;
        reciept.BankAccountName = "N/A";
        reciept.BankAccountNumber = "N/A";
        reciept.BankName = "N/A";
        reciept.ChequeNumber = "";
        reciept.PaymentDate = DateTime.Now.ToString("yyyy-MM-dd");
        reciept.PaymentType = "CASH";
        reciept.RecieptNumber = SharedCommons.SharedCommons.GenerateUniqueId("RCPT");
        reciept.ModifiedBy = user.UserId;
        reciept.RecieptCategory = "SUPPLIER";
        reciept.ImageOfReciept = "";
        reciept.CurrencyCode = Globals.UGX_CURRENCY_CODE;
        reciept.ClientCode = ddSuppliers.SelectedValue;
        reciept.RecieptAmount = txtInvoiceAmount.Text;
        return reciept;
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
        client.InvoiceNumber = txtInvoiceNumber.Text;
        client.AnyOtherTax = "0";
        client.CurrencyCode = Globals.UGX_CURRENCY_CODE;
        client.DiscountAmount = "0";
        client.InvoiceAmount = txtInvoiceAmount.Text;
        client.InvoiceDate = DateTime.Now.ToString("yyyy-MM-dd");
        client.SupplierCode = ddSuppliers.SelectedValue;
        client.SupplierName = ddSuppliers.SelectedItem.Text;
        client.TaxAmount = "0";
        client.TotalInvoiceAmount = txtInvoiceAmount.Text;
        client.ModifiedBy = user.UserId;
        client.IsPaid = "FALSE";
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
    
}