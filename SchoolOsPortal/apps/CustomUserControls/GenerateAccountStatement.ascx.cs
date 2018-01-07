using InterLinkClass.PegPaySchoolsApi;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CustomUserControls_GenerateAccountStatement : System.Web.UI.UserControl
{
    SystemUserDetails user;
    Service client = new Service();
    Bussinesslogic bll = new Bussinesslogic();

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {

            user = Session["User"] as SystemUserDetails;
            Session["IsError"] = null;

            //----------------------------------
            //Check If this is an Edit Request
            string Id = Request.QueryString["Id"];
            string BankCode = Request.QueryString["BankCode"];
            MultiView1.ActiveViewIndex = 0;
            //Session is invalid
            if (user == null)
            {
                Response.Redirect("Default.aspx");
            }
            else if (IsPostBack)
            {

            }
            //this is an edit request
            else if (Id != null)
            {
                LoadData();
                LoadAccountStatement(Id, BankCode);
                MultiView1.ActiveViewIndex = 0;

            }
            else
            {
                LoadData();
                MultiView1.ActiveViewIndex = 0;
                Multiview2.ActiveViewIndex = 1;
            }
        }
        catch (Exception ex)
        {
            bll.ShowMessage(lblmsg, ex.Message, true, Session);
        }
    }

    private void LoadAccountStatement(string Id, string BankCode)
    {
        //this.txtAccount.Text = Id;
        this.ddBank.SelectedValue = BankCode;
        this.ddBank.Enabled = false;
        //this.txtAccount.Enabled = false;
        SearchDb();
    }

    private void LoadData()
    {
        bll.LoadSchoolsIntoDropDown(user, ddBank);
        bll.LoadDataIntoDropDown("GetStudentsUsingPegPayStdNumberForDropDown", new string[] { ddBank.SelectedValue,"ALL"}, ddStudent);

        if (user.User.UserType == "SCHOOL_STUDENT")
        {
            ddStudent.SelectedValue = user.User.Username;
            ddStudent.Enabled = false;
            return;
        }
    }

    protected void btnConvert_Click(object sender, EventArgs e)
    {
        try
        {
            if (txtFromDate.Text.Equals(""))
            {
                string msg = "Select Start Date";
                bll.ShowMessage(lblmsg, msg, true, Session);
            }
            else if (txtToDate.Equals(""))
            {
                string msg = "Select End Date";
                bll.ShowMessage(lblmsg, msg, true, Session);
            }
            else if (ddBank.SelectedValue.Equals("0"))
            {
                string msg = "Specify Account Number";
                bll.ShowMessage(lblmsg, msg, true, Session);
            }
            else
            {
                string[] searchParams = GetSearchParameters();
                DataTable dt = bll.SearchGeneralLedgerTableForStatement(searchParams);
                if (dt.Rows.Count > 0)
                {
                    SetSessionVariables(dt);
                    string msg = "Found " + dt.Rows.Count + " Records Matching Search Criteria";
                    Response.Redirect("Statement.aspx");
                }
                else
                {
                    string msg = "No Records Found Matching Search Criteria";
                    bll.ShowMessage(lblmsg, msg, true, Session);
                }
            }
        }
        catch (Exception ex)
        {
            string msg = "FAILED: " + ex.Message;
            bll.ShowMessage(lblmsg, msg, true, Session);
        }
    }

    private void SetSessionVariables(DataTable dt)
    {
        Session["StatementDataTable"] = dt;
        if (string.IsNullOrEmpty(txtFromDate.Text) || string.IsNullOrEmpty(txtToDate.Text))
        {
            Session["fromDate"] = "THE START";
            Session["toDate"] = "TO TODAY";
        }
        else
        {
            Session["fromDate"] = txtFromDate.Text;
            Session["toDate"] = txtToDate.Text;
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
        if (txtFromDate.Text.Equals(""))
        {
            string msg = "Select Start Date";
            bll.ShowMessage(lblmsg, msg, true, Session);
        }
        else if (txtToDate.Equals(""))
        {
            string msg = "Select End Date";
            bll.ShowMessage(lblmsg, msg, true, Session);
        }
        
        else if (ddBank.SelectedValue.Equals("0"))
        {
            string msg = "Specify Account Number";
            bll.ShowMessage(lblmsg, msg, true, Session);
        }
        else
        {
            string[] searchParams = GetSearchParameters();
            DataTable dt = bll.SearchGeneralLedgerTableForStatement(searchParams);
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
    }

    private string[] GetSearchParameters()
    {
        List<string> searchCriteria = new List<string>();
        string BankCode = ddBank.SelectedValue;
        string BranchCode = "ALL";
        string Teller = "";
        string AccountNumber = ddStudent.SelectedValue;
        string CustomerName = "";
        string TransCategory = "ALL";
        string BankId = "";
        string PegPayId = "";
        string Format = "yyyy-MM-dd";
        DateTime startDate = DateTime.ParseExact(txtFromDate.Text, Format, System.Globalization.CultureInfo.InvariantCulture);
        DateTime EndDate = DateTime.ParseExact(txtToDate.Text, Format, System.Globalization.CultureInfo.InvariantCulture);
        string FromDate = startDate.ToString("yyyyMMdd");//txtFromDate.Text;
        string ToDate = EndDate.ToString("yyyyMMdd"); //txtToDate.Text;
        searchCriteria.Add(BankCode);
        searchCriteria.Add(BranchCode);
        searchCriteria.Add(Teller);
        searchCriteria.Add(AccountNumber);
        searchCriteria.Add(CustomerName);
        searchCriteria.Add(TransCategory);
        searchCriteria.Add(BankId);
        searchCriteria.Add(PegPayId);
        searchCriteria.Add(FromDate);
        searchCriteria.Add(ToDate);
        return searchCriteria.ToArray();
    }

    protected void ddBank_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {

            btnSubmit.Enabled = true;
        }
        catch (Exception ex)
        {
            string msg = "FAILED: " + ex.Message;
            bll.ShowMessage(lblmsg, msg, true, Session);
        }
    }

    protected void OnPageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        dataGridResults.PageIndex = e.NewPageIndex;
        SearchDb();
    }
}
