using InterLinkClass.PegasusManagementApi;
using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ListClients : System.Web.UI.UserControl
{
    public event EventHandler MakeASaleEvent;
    SystemUser user;
    MSystemService client = new MSystemService();
    Bussinesslogic bll = new Bussinesslogic();

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {

            user = Session["User"] as SystemUser;
            Session["IsError"] = null;

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

    public void SetUpForEdit()
    {
        Multiview2.SetActiveView(EditView);
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

        if (e.CommandName.Equals("EditEntity"))
        {
            //Server.Transfer("~/AddOrEditClient.aspx?Id=" + Id + "&BankCode=" + BankCode);
            return;
        }
        if (e.CommandName.Equals("MakeASale"))
        {
            MyEventArgs eventArgs = new MyEventArgs();
            eventArgs.PegPayId = Id;
            if (MakeASaleEvent != null)
            {
                MakeASaleEvent(sender, eventArgs);
            }
        }
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
        DataTable dt = bll.SearchClientsTable(searchParams);
        if (dt.Rows.Count > 0)
        {
            dataGridResults.DataSource = dt;
            dataGridResults.DataBind();
            string msg = "Found " + dt.Rows.Count + " Records Matching Search Criteria";
            Multiview2.SetActiveView(resultView);
            bll.ShowMessage(lblmsg, msg, false, Session);
        }
        else
        {
            dataGridResults.DataSource = null;
            dataGridResults.DataBind();
            Multiview2.SetActiveView(EmptyView);
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
}