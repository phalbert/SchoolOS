using InterLinkClass.PegasusManagementApi;
using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SaveEmployeeDetails : System.Web.UI.UserControl
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
        bll.LoadDepartmentsIntoDropDown(user.CompanyCode,user, ddDepartments);
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
            Employee aclient = GetEmployee();
            Result result = client.SaveEmployee(aclient);

            if (result.StatusCode != Globals.SUCCESS_STATUS_CODE)
            {
                msg = "FAILED: " + result.StatusDesc;
                bll.ShowMessage(lblmsg, msg, false, Session);
                return;
            }

            msg = "EMPLOYEE SAVED SUCCESSFULLY! ID ["+result.PegPayID+"]";
            bll.ShowMessage(lblmsg, msg, false, Session);

            if (SaveCompleted != null)
            {
                MyEventArgs eventArgs = new MyEventArgs();
                eventArgs.PegPayId = txtClientCode.Text;

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

    private Employee GetEmployee()
    {
        Employee client = new Employee();
        client.CompanyCode = ddCompanies.SelectedValue;
        client.BankAccountName = txtBankAccountName.Text;
        client.BankAccountNumber = txtBankAccountNumber.Text;
        client.BankName = txtBankName.Text;
        client.SupplierAddress = Globals.PEGASUS_EMPLOYEE_ADDRESS;
        client.SupplierCode = txtClientCode.Text;
        client.EmployeeID = txtClientCode.Text;
        client.DepartmentID = SharedCommons.SharedCommons.GenerateUniqueId("EMP-");
        client.SupplierName = txtClientName.Text;
        client.ContactPersonName = client.SupplierName;
        client.Email = txtEmail.Text;
        client.MobileNumber = txtMobileNumber.Text;
        client.ModifiedBy = user.UserId;
        client.TelephoneNumber = txtMobileNumber.Text;
        client.SupplierCategory = Globals.EMPLOYEE_SUPPLIER_CATEGORY;
        
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