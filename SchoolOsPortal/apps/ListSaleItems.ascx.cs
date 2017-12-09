using InterLinkClass.PegasusManagementApi;
using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ListSaleItems : System.Web.UI.UserControl
{
    public event EventHandler GoToTheSaleEvent;
    SystemUser user;
    MSystemService client = new MSystemService();
    Bussinesslogic bll = new Bussinesslogic();

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {

            user = Session["User"] as SystemUser;
            Session["IsError"] = null;

            //----------------------------------
            //Check If this is an Edit Request
            string Id = Request.QueryString["Id"];
            string BankCode = Request.QueryString["BankCode"];

            //Session is invalid
            if (user == null)
            {
                Response.Redirect("Default.aspx?MSG=SESSION HAS EXPIRED");
            }
            else if (IsPostBack)
            {

            }
            else
            {
                LoadData();
            }
        }
        catch (Exception ex)
        {
            bll.ShowMessage(lblmsg, ex.Message, true, Session);
        }
    }

    private void LoadData()
    {
        bll.LoadCompaniesIntoDropDown(user, ddCompanies);
        //SearchDb();
    }

    protected void dataGridResults_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int index = 0;
        GridViewRow row;
        GridView grid = sender as GridView;
        index = Convert.ToInt32(e.CommandArgument);
        row = grid.Rows[index];
        string Id = row.Cells[1].Text;
        string BankCode = row.Cells[1].Text;

        if (e.CommandName == "EditEntity")
        {

            //Server.Transfer("~/AddOrEditPurchase.aspx?Id=" + Id + "&BankCode=" + BankCode);
            return;
        }
        if (e.CommandName == "GoToSale")
        {
            if (GoToTheSaleEvent != null)
            {
                MyEventArgs eventAgrs = new MyEventArgs();
                eventAgrs.PegPayId = Id;
                eventAgrs.ThirdPartyId = BankCode;
                GoToTheSaleEvent(sender, eventAgrs);
            }
        }
    }

    public void ExternalSearchBySaleID(string SaleId)
    {
        txtName.Text = SaleId;
        txtName.Enabled = false;
        foreach (DataControlField dcfColumn in dataGridResults.Columns)
        {
            if (dcfColumn.HeaderText == "Details")
            {
                dcfColumn.Visible = false;
            }
        }
        SearchDb();
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            SearchDb();
        }
        catch (Exception ex)
        {
            string msg = "FAILED: " + ex.Message;
            bll.ShowMessage(lblmsg, msg, true, Session);
        }
    }

    private void SearchDb()
    {
        string[] searchParams = GetSearchParameters();
        DataTable dt = bll.SearchSaleItemsTable(searchParams);
        if (dt.Rows.Count > 0)
        {
            dataGridResults.DataSource = dt;
            dataGridResults.DataBind();
            string msg = "Found " + dt.Rows.Count + " Records Matching Search Criteria";
            Multiview2.ActiveViewIndex = 0;
            bll.ShowMessage(lblmsg, msg, false, Session);
        }
        else
        {
            dataGridResults.DataSource = null;
            dataGridResults.DataBind();
            Multiview2.ActiveViewIndex = -1;
            string msg = "No Records Found Matching Search Criteria";
            bll.ShowMessage(lblmsg, msg, true, Session);
        }
    }

    private string[] GetSearchParameters()
    {
        List<string> searchCriteria = new List<string>();
        string BankCode = ddCompanies.SelectedValue;
        string merchantCode = txtName.Text;
        string isPaid = "";
        searchCriteria.Add(BankCode);
        searchCriteria.Add(merchantCode);
        searchCriteria.Add(isPaid);
        return searchCriteria.ToArray();
    }

    public void ShowExternalMessage()
    {
        bll.ShowExternalMessage(lblmsg, Session);
    }
}