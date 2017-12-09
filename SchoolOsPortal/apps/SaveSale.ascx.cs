using InterLinkClass.PegasusManagementApi;
using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SaveSale : System.Web.UI.UserControl, ExternalMessageInterface
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
        bll.LoadClientsIntoDropDown(ddCompanies.SelectedValue, user, ddClients);
        bll.LoadCurrenciesIntoDropDown(ddCompanies.SelectedValue, user, ddCurrencies);
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
            Sale aclient = GetSale();
            Result result = client.SaveInSalesLedger(aclient);

            if (result.StatusCode != Globals.SUCCESS_STATUS_CODE)
            {
                msg = "FAILED: " + result.StatusDesc;
                bll.ShowMessage(lblmsg, msg, false, Session);
                return;
            }

            msg = result.StatusDesc;
            bll.ShowMessage(lblmsg, msg, false, Session);

            if (SaveCompleted != null)
            {
                MyEventArgs eventArgs = new MyEventArgs();
                eventArgs.PegPayId = txtSaleID.Text;

                //Pass on msg
                Session["ExternalMsg"] = msg;

                SaveCompleted(sender, eventArgs);
            }
        }
        catch (Exception ex)
        {
            bll.LogError("SAVE-CLIENT", ex.StackTrace, "", ex.Message, "EXCEPTION");
            bll.ShowMessage(lblmsg, ex.Message, true, Session);
        }
    }

    private Sale GetSale()
    {
        Sale invoice = new Sale();
        invoice.CompanyCode = ddCompanies.SelectedValue;
        invoice.AnyOtherTaxAmount = txtAnyOtherTax.Text;
        invoice.ClientCode = ddClients.SelectedValue;
        invoice.CurrencyCode = ddCurrencies.SelectedValue;
        invoice.DiscountAmount = txtDiscountAmount.Text;
        invoice.SaleID = txtSaleID.Text;
        invoice.TaxAmount = txtTaxAmount.Text;
        invoice.TotalSaleAmount = txtTotalSaleAmount.Text;
        invoice.TotalSubTotalAmount = txtTotalSubtotalAmount.Text;
        invoice.ModifiedBy = user.UserId;
        return invoice;
    }

    protected void btnConfirm_Click(object sender, EventArgs e)
    {

    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {

    }

    public void LoadDataSpecificForSale(MyEventArgs eventArgs)
    {
        try
        {
            string SaleID = eventArgs.PegPayId;
            string clientCode = eventArgs.ThirdPartyId;
            Sale sale = CalculateSaleValues(SaleID);
            if (sale.StatusCode != Globals.SUCCESS_STATUS_CODE)
            {
                return;
            }

            txtSaleID.Text = SaleID;
            txtTotalSubtotalAmount.Text = sale.TotalSubTotalAmount;
            txtSaleID.Enabled = false;
            txtTotalSubtotalAmount.Enabled = false;
            ddClients.SelectedValue = clientCode;
            ddClients.Enabled = false;
            txtTaxAmount.Text = bll.GetVATValueElseZero(ddCompanies.SelectedValue, sale.TotalSubTotalAmount, lblVAT);
            txtTaxAmount.Enabled = false;
            txtTotalSaleAmount.Text = GetToTalSaleAmount(sale.TotalSubTotalAmount, txtTaxAmount.Text);
            txtTotalSaleAmount.Enabled = false;
            ShowExternalMessage();
            //TotalsDiv.Visible = false;
        }
        catch (Exception ex)
        {
            bll.LogError("SAVE-CLIENT", ex.StackTrace, "", ex.Message, "EXCEPTION");
            bll.ShowMessage(lblmsg, ex.Message, true, Session);
        }
    }

    private string GetToTalSaleAmount(string totalSubTotalAmount, string taxAmount)
    {
        try
        {
            return "" + (int.Parse(totalSubTotalAmount) + int.Parse(taxAmount));
        }
        catch (Exception)
        {

            return "0.0";
        }
    }

    private Sale CalculateSaleValues(string saleID)
    {
        Sale sale = new Sale();
        string[] param = { saleID };
        DataTable dt = client.ExecuteDataSet("GetTotalSubtotalOfSale", param).Tables[0];

        if (dt.Rows.Count == 0)
        {
            sale.StatusCode = Globals.FAILURE_STATUS_CODE;
            sale.StatusDesc = "ORIGINAL SALE NOT FOUND";
            return sale;
        }

        sale.TotalSubTotalAmount = dt.Rows[0]["TotalSubTotalAmount"].ToString();
        sale.StatusCode = Globals.SUCCESS_STATUS_CODE;
        sale.StatusDesc = Globals.SUCCESS_STATUS_TEXT;
        return sale;
    }

    public void ShowExternalMessage()
    {
        bll.ShowExternalMessage(lblmsg, Session);
    }
}