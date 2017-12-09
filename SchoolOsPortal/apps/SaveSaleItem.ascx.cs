using InterLinkClass.PegasusManagementApi;
using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SaveSaleItem : System.Web.UI.UserControl, ExternalMessageInterface
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
            SaleItem aclient = GetSaleItem();
            Result result = client.SaveSaleItem(aclient);

            if (result.StatusCode != Globals.SUCCESS_STATUS_CODE)
            {
                msg = "FAILED: " + result.StatusDesc;
                bll.ShowMessage(lblmsg, msg, false, Session);
                return;
            }

            msg = "SALE ITEM SAVED SUCCESSFULLY";
            bll.ShowMessage(lblmsg, msg, false, Session);

            ListSaleItemsUserControl.ExternalSearchBySaleID(txtSaleID.Text);
            MultiView1.SetActiveView(ConfirmView);
        }
        catch (Exception ex)
        {
            bll.LogError("SAVE-CLIENT", ex.StackTrace, "", ex.Message, "EXCEPTION");
            bll.ShowMessage(lblmsg, ex.Message, true, Session);
        }
    }

    private SaleItem GetSaleItem()
    {
        SaleItem client = new SaleItem();
        client.CompanyCode = ddCompanies.SelectedValue;
        client.ClientCode = ddClients.SelectedValue;
        client.ItemDesc = txtItemDesc.Text;
        client.ItemQuantity = txtItemQty.Text;
        client.SaleID = txtSaleID.Text;
        client.UnitPrice = txtUnitPrice.Text;
        client.SubTotal = txtSubTotal.Text;
        client.ModifiedBy = user.UserId;
        return client;
    }


    protected void btnConfirm_Click(object sender, EventArgs e)
    {
        MultiView1.SetActiveView(CaptureDetailsView);
    }

    protected void btnDone_Click(object sender, EventArgs e)
    {
        if (SaveCompleted != null)
        {
            MyEventArgs eventArgs = new MyEventArgs();
            eventArgs.PegPayId = txtSaleID.Text;
            eventArgs.ThirdPartyId = ddClients.SelectedValue;

            //Pass on msg
            Session["ExternalMsg"] = "SALE ITEMS SAVED SUCCESSFULLY";

            SaveCompleted(sender, eventArgs);
        }
    }

    public void LoadDataSpecificForSaleItem(MyEventArgs eventArgs)
    {
        try
        {
            string SaleID = eventArgs.PegPayId;
            Entity result = client.GetById(user.CompanyCode, "SALE", SaleID);
            if (result.StatusCode != Globals.SUCCESS_STATUS_CODE)
            {
                return;
            }

            Sale sale = result as Sale;
            ddClients.SelectedValue = sale.ClientCode;
            ddCompanies.SelectedValue = sale.CompanyCode;
            ddClients.Enabled = false;
            ddCompanies.Enabled = false;
            ListSaleItemsUserControl.ExternalSearchBySaleID(sale.SaleID);
            MultiView1.SetActiveView(ConfirmView);
            txtSaleID.Text = sale.SaleID;
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
            string clientCode = eventArgs.PegPayId;
            ddClients.SelectedValue = clientCode;
            ddClients.Enabled = false;
            txtSaleID.Text = SharedCommons.SharedCommons.GenerateUniqueId("SALE");
            txtSaleID.Enabled = false;
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