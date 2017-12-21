using System;
using System.Data;
using System.Drawing;
using System.IO;
using System.Web;
using System.Web.UI.WebControls;
using InterLinkClass.PegasusManagementApi;

public class Bussinesslogic
{
    MSystemService client = new MSystemService();
    InterLinkClass.PegPaySchoolsApi.Service SchoolsApi = new InterLinkClass.PegPaySchoolsApi.Service();

    public string GetImageById(string Id)
    {
        string base64String = "";
        DataSet ds = SchoolsApi.ExecuteDataSet("GetImageById", new string[] { Id });
        DataTable dt = ds.Tables[0];
        if (dt.Rows.Count == 0)
        {
            return "";
        }

        DataRow dr = dt.Rows[0];
        base64String = dr["Image"].ToString();
        base64String = base64String.Replace(" ", string.Empty);
        return base64String;
    }

    public void ShowMessage(Label lblmsg, string msg, bool IsError, System.Web.SessionState.HttpSessionState Session)
    {
        lblmsg.Text = msg;
        if (IsError)
        {
            Session["IsError"] = "True";
            lblmsg.ForeColor = Color.White;
        }
        else
        {
            Session["IsError"] = "False";
            lblmsg.ForeColor = Color.White;
        }
    }

    public string GetVATValueElseZero(string CompanyCode, string TranAmount, Label lblVAT)
    {

        try
        {
            SystemSetting vatSetting = new SystemSetting();
            Entity result = client.GetById(CompanyCode, "SYSTEMSETTING", "VAT");

            if (result.StatusCode != Globals.SUCCESS_STATUS_CODE)
            {
                vatSetting.SettingValue = "0";
            }

            if (string.IsNullOrEmpty(TranAmount))
            {
                TranAmount = "0";
            }

            vatSetting = result as SystemSetting;
            decimal vat = decimal.Parse(vatSetting.SettingValue);
            if (lblVAT != null)
            {
                lblVAT.Text = vatSetting.SettingValue;
            }
            decimal vatAmount = ((vat / 100) * (decimal.Parse(TranAmount)));
            return vatAmount.ToString();
        }
        catch (Exception)
        {
            return "0";
        }
    }


    public void LoadSupplierCatgoriesIntoDropDown(string CompanyCode, SystemUser user, DropDownList ddlst)
    {
        string[] parameters = { CompanyCode };
        DataSet ds = client.ExecuteDataSet("GetSupplierCatgoriesForDropDown", parameters);
        DataTable dt = ds.Tables[0];

        ddlst.Items.Clear();
        foreach (DataRow dr in dt.Rows)
        {
            string Text = dr["CategoryName"].ToString();
            string Value = dr["CategoryCode"].ToString();
            ddlst.Items.Add(new ListItem(Text, Value));
        }
    }

    public void LoadEmployeesIntoDropDown(string CompanyCode, SystemUser user, DropDownList ddlst)
    {
        string[] parameters = { CompanyCode };
        DataSet ds = client.ExecuteDataSet("GetEmployeesForDropDown", parameters);
        DataTable dt = ds.Tables[0];

        ddlst.Items.Clear();
        foreach (DataRow dr in dt.Rows)
        {
            string Text = dr["SupplierName"].ToString();
            string Value = dr["SupplierCode"].ToString();
            ddlst.Items.Add(new ListItem(Text, Value));
        }
    }

    public void LoadDepartmentsIntoDropDown(string CompanyCode, SystemUser user, DropDownList ddlst)
    {
        string[] parameters = { CompanyCode };
        DataSet ds = client.ExecuteDataSet("GetDepartmentsForDropDown", parameters);
        DataTable dt = ds.Tables[0];

        ddlst.Items.Clear();
        foreach (DataRow dr in dt.Rows)
        {
            string Text = dr["DepartmentName"].ToString();
            string Value = dr["DepartmentCode"].ToString();
            ddlst.Items.Add(new ListItem(Text, Value));
        }
    }

    public void ShowExternalMessage(Label lblmsg, System.Web.SessionState.HttpSessionState Session)
    {
        //no external Msg
        if (Session["ExternalMsg"] == null)
        {
            return;
        }

        lblmsg.Text = Session["ExternalMsg"] as string;
        bool IsError = false;

        if (IsError)
        {
            Session["IsError"] = "True";
            lblmsg.ForeColor = Color.Red;
        }
        else
        {
            Session["IsError"] = "False";
            lblmsg.ForeColor = Color.Green;
        }

        //make this null since it has been read / consumed / acted upon
        Session["ExternalMsg"] = null;
    }

    public void ShowMessage(Label lblmsg, string msg, bool IsError)
    {
        lblmsg.Text = msg;
        if (IsError)
        {
            lblmsg.ForeColor = Color.Red;
        }
        else
        {
            lblmsg.ForeColor = Color.Green;
        }
    }

    public string InsertIntoAuditLog(string ActionType, string TableName, string BankCode, string ModifiedBy, string Action)
    {
        try
        {
            DataTable datatable = client.ExecuteDataSet("InsertIntoAuditTrail",
                                                           new string[]
                                                           {
                                                             ActionType,
                                                             TableName,
                                                             BankCode,
                                                             ModifiedBy,
                                                             Action
                                                           }).Tables[0];
            return datatable.Rows[0][0].ToString();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }


    public Result SendCredentialsToUser(SystemUser user)
    {
        Result result = new Result();
        try
        {
            InterLinkClass.MailApi.Messenger mailApi = new InterLinkClass.MailApi.Messenger();
            InterLinkClass.MailApi.Email email = new InterLinkClass.MailApi.Email();
            email.From = "notifications@pegasustechnologies.co.ug";
            email.Message = "Hi<br/>" +
                            "Your Credentials for The Pegasus Bussiness Management Portal are Below<br/>" +
                            "UserId: " + user.UserId + "<br/>" +
                            "Password: " + user.Password + "<br/>" +
                            "Role: " + user.UserType + "<br/>" +
                            "Thank you. <br/>";
            InterLinkClass.MailApi.EmailAddress address = new InterLinkClass.MailApi.EmailAddress();
            address.Address = user.UserId;
            address.AddressType = InterLinkClass.MailApi.EmailAddressType.To;
            address.Name = user.Name;

            email.MailAddresses = new InterLinkClass.MailApi.EmailAddress[] { address };
            InterLinkClass.MailApi.Result resp = mailApi.PostEmail(email);
            result.StatusCode = resp.StatusCode;
            result.StatusDesc = resp.StatusDesc;
        }
        catch (Exception ex)
        {
            result.StatusCode = Globals.FAILURE_STATUS_CODE;
            result.StatusDesc = "EXCEPTION: " + ex.Message;
        }
        return result;
    }

    public bool ObeysPasswordPolicy(string newPassword, string bankCode)
    {
        return true;
    }

    public string getIp()
    {
        string _custIP = null;
        try
        {

            _custIP = HttpContext.Current.Request.ServerVariables["HTTP_CLIENT_IP"];

            if (String.IsNullOrEmpty(_custIP))
            {
                _custIP = HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];

            }
            if (String.IsNullOrEmpty(_custIP))
            {
                _custIP = HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"];
            }
        }
        catch (Exception ex)
        {
            _custIP = "";
        }
        return _custIP;

    }

    public string GetImageUploadedInBase64String(FileUpload fuInvoiceImage)
    {
        if (fuInvoiceImage.HasFile)
        {
            string fileName = fuInvoiceImage.FileName.ToUpper();
            string extension = Path.GetExtension(fileName);
            if (SharedCommons.SharedCommons.AllowedImageExtensions.Contains(extension.ToUpper()))
            {
                System.IO.Stream fs = fuInvoiceImage.PostedFile.InputStream;
                System.IO.BinaryReader br = new System.IO.BinaryReader(fs);
                Byte[] bytes = br.ReadBytes((Int32)fs.Length);
                string base64String = Convert.ToBase64String(bytes, 0, bytes.Length);
                base64String = "data:image/" + extension.ToLower().Replace(".", string.Empty) + ";base64," + base64String;
                return base64String;
            }
            else
            {
                return null;
            }
        }
        return null;
    }

    public InterLinkClass.PegasusManagementApi.Result ChangeUsersPassword(string id, string bankCode, string password, string usertype, bool v1, string v2)
    {
        throw new NotImplementedException();
    }

    public UserType GetUserTypeById(string companyCode, string userType)
    {
        UserType user = new UserType();
        MSystemService mSystem = new MSystemService();
        DataTable dt = mSystem.ExecuteDataSet("GetUserTypeByUserTypeCode", new string[] { companyCode, userType }).Tables[0];


        if (dt.Rows.Count == 0)
        {
            user.StatusCode = Globals.FAILURE_STATUS_CODE;
            user.StatusDesc = "USER TYPE WITH ID [" + userType + "] NOT FOUND";
            return user;
        }

        DataRow dr = dt.Rows[0];
        user.UserTypeCode = dr["UserTypeCode"].ToString();
        user.UserTypeName = dr["UserTypeName"].ToString();
        user.IsActive = dr["IsActive"].ToString();
        user.ModifiedBy = dr["ModifiedBy"].ToString();
        user.CreatedBy = dr["CreatedBy"].ToString();
        user.CompanyCode = dr["CompanyCode"].ToString();

        if (user.IsActive.ToUpper() != "TRUE")
        {
            user.StatusCode = Globals.FAILURE_STATUS_CODE;
            user.StatusDesc = "USERTYPES WITH ID [" + userType + "] ARE DEACTIVATED. ie Role Has Been Deactived. PLEASE CONTACT SYSTEM ADMINISTRATORS";
            return user;
        }

        user.StatusCode = Globals.SUCCESS_STATUS_CODE;
        user.StatusDesc = Globals.SUCCESS_STATUS_TEXT;
        return user;
    }

    public void LoadCompaniesIntoDropDownALL(SystemUser user, DropDownList ddlst)
    {
        string[] parameters = { };
        DataSet ds = client.ExecuteDataSet("GetCompaniesForDropDown", parameters);
        DataTable dt = ds.Tables[0];

        ddlst.Items.Clear();
        ddlst.Items.Add(new ListItem("-- ALL --", ""));
        foreach (DataRow dr in dt.Rows)
        {
            string Text = dr["CompanyName"].ToString();
            string Value = dr["CompanyCode"].ToString();
            ddlst.Items.Add(new ListItem(Value, Text));
        }

        if (user.UserType != "SYS_ADMIN")
        {
            ddlst.SelectedValue = user.CompanyCode;
            ddlst.Enabled = false;
        }
    }

    public void LoadCompaniesIntoDropDown(SystemUser user, DropDownList ddlst)
    {
        string[] parameters = { };
        DataSet ds = client.ExecuteDataSet("GetCompaniesForDropDown", parameters);
        DataTable dt = ds.Tables[0];

        ddlst.Items.Clear();
        foreach (DataRow dr in dt.Rows)
        {
            string Text = dr["CompanyName"].ToString();
            string Value = dr["CompanyCode"].ToString();
            ddlst.Items.Add(new ListItem(Text, Value));
        }

        if (user.UserType != "SYS_ADMIN")
        {
            ddlst.SelectedValue = user.CompanyCode;
            ddlst.Enabled = false;
        }
    }

    public void LoadSchoolsIntoDropDown(InterLinkClass.PegPaySchoolsApi.SystemUserDetails user, DropDownList ddlst)
    {
        string[] parameters = { };
        DataSet ds = SchoolsApi.ExecuteDataSet("GetSchoolsForDropDown", parameters);
        DataTable dt = ds.Tables[0];

        ddlst.Items.Clear();
        foreach (DataRow dr in dt.Rows)
        {
            string Text = dr["Name"].ToString();
            string Value = dr["Code"].ToString();
            ddlst.Items.Add(new ListItem(Text, Value));
        }

        if (user.User.UserType != "SYS_ADMIN")
        {
            ddlst.SelectedValue = user.SchoolDetails.SchoolCode;
            ddlst.Enabled = false;
        }
    }

    public void LoadContractTypesIntoDropDown(string CompanyCode, SystemUser user, DropDownList ddlst)
    {
        string[] parameters = { CompanyCode };
        DataSet ds = client.ExecuteDataSet("GetContractTypesForDropDown", parameters);
        DataTable dt = ds.Tables[0];

        ddlst.Items.Clear();
        foreach (DataRow dr in dt.Rows)
        {
            string Text = dr["ContractTypeName"].ToString();
            string Value = dr["ContractTypeCode"].ToString();
            ddlst.Items.Add(new ListItem(Text, Value));
        }
    }

    public void LoadUnpaidInvoicesIntoDropDown(string CompanyCode, SystemUser user, DropDownList ddlst)
    {
        string[] parameters = { CompanyCode };
        DataSet ds = client.ExecuteDataSet("GetUnpaidInvoicesForDropDown", parameters);
        DataTable dt = ds.Tables[0];

        ddlst.Items.Clear();
        foreach (DataRow dr in dt.Rows)
        {
            string Value = dr["InvoiceNumber"].ToString();
            string Text = Value + " for " + dr["ClientCode"].ToString();
            ddlst.Items.Add(new ListItem(Text, Value));
        }
    }

    public void LoadUnpaidInvoicesForSupplierIntoDropDown(string CompanyCode, SystemUser user, DropDownList ddlst, string SupplierCode)
    {
        string[] parameters = { CompanyCode, SupplierCode };
        DataSet ds = client.ExecuteDataSet("GetUnpaidInvoicesOfSupplierForDropDown", parameters);
        DataTable dt = ds.Tables[0];

        ddlst.Items.Clear();
        foreach (DataRow dr in dt.Rows)
        {
            string Value = dr["InvoiceNumber"].ToString();
            string Text = Value + " for " + dr["ClientCode"].ToString();
            ddlst.Items.Add(new ListItem(Text, Value));
        }
    }

    public void LoadSuppliersIntoDropDown(string CompanyCode, SystemUser user, DropDownList ddlst)
    {
        string[] parameters = { CompanyCode };
        DataSet ds = client.ExecuteDataSet("GetSuppliersForDropDown", parameters);
        DataTable dt = ds.Tables[0];

        ddlst.Items.Clear();
        foreach (DataRow dr in dt.Rows)
        {
            string Text = dr["SupplierName"].ToString();
            string Value = dr["SupplierCode"].ToString();
            ddlst.Items.Add(new ListItem(Text, Value));
        }
    }

    public void LoadCurrenciesIntoDropDown(string CompanyCode, SystemUser user, DropDownList ddlst)
    {
        string[] parameters = { CompanyCode };
        DataSet ds = client.ExecuteDataSet("GetCurrenciesForDropDown", parameters);
        DataTable dt = ds.Tables[0];

        ddlst.Items.Clear();
        foreach (DataRow dr in dt.Rows)
        {
            string Text = dr["CurrencyName"].ToString();
            string Value = dr["CurrencyCode"].ToString();
            ddlst.Items.Add(new ListItem(Text, Value));
        }
    }

    public void LoadDataIntoDropDown(string storedProcName, string[] parameters, DropDownList ddlst)
    {
        DataSet ds = SchoolsApi.ExecuteDataSet(storedProcName, parameters);
        DataTable dt = ds.Tables[0];

        ddlst.Items.Clear();
        foreach (DataRow dr in dt.Rows)
        {
            string Text = dr["Name"].ToString();
            string Value = dr["Code"].ToString();
            ddlst.Items.Add(new ListItem(Text, Value));
        }
    }

    public void LoadClientsIntoDropDown(string CompanyCode, SystemUser user, DropDownList ddlst)
    {
        string[] parameters = { CompanyCode };
        DataSet ds = client.ExecuteDataSet("GetClientsForDropDown", parameters);
        DataTable dt = ds.Tables[0];

        ddlst.Items.Clear();
        foreach (DataRow dr in dt.Rows)
        {
            string Text = dr["ClientName"].ToString();
            string Value = dr["ClientCode"].ToString();
            ddlst.Items.Add(new ListItem(Text, Value));
        }
    }

    public void LoadClientsAndSuppliersIntoDropDown(string CompanyCode, SystemUser user, DropDownList ddlst)
    {
        string[] parameters = { CompanyCode };
        DataSet ds = client.ExecuteDataSet("GetClientsAndSuppliersForDropDown", parameters);
        DataTable dt = ds.Tables[0];

        ddlst.Items.Clear();
        foreach (DataRow dr in dt.Rows)
        {
            string Text = dr["Name"].ToString();
            string Value = dr["Code"].ToString();
            ddlst.Items.Add(new ListItem(Text, Value));
        }
    }

    public void LoadContractCatgoriesIntoDropDown(string CompanyCode, SystemUser user, DropDownList ddlst)
    {
        string[] parameters = { CompanyCode };
        DataSet ds = client.ExecuteDataSet("GetContractCatgoriesForDropDown", parameters);
        DataTable dt = ds.Tables[0];

        ddlst.Items.Clear();
        foreach (DataRow dr in dt.Rows)
        {
            string Text = dr["CategoryName"].ToString();
            string Value = dr["CategoryCode"].ToString();
            ddlst.Items.Add(new ListItem(Text, Value));
        }
    }

    public void LoadTranCatgoriesIntoDropDown(string CompanyCode, SystemUser user, DropDownList ddlst)
    {
        string[] parameters = { CompanyCode };
        DataSet ds = client.ExecuteDataSet("GetTranCatgoriesForDropDown", parameters);
        DataTable dt = ds.Tables[0];

        ddlst.Items.Clear();
        foreach (DataRow dr in dt.Rows)
        {
            string Text = dr["CategoryName"].ToString();
            string Value = dr["CategoryCode"].ToString();
            ddlst.Items.Add(new ListItem(Text, Value));
        }
    }

    public void LoadTranCatgoriesIntoDropDownALL(string CompanyCode, SystemUser user, DropDownList ddlst)
    {
        string[] parameters = { CompanyCode };
        DataSet ds = client.ExecuteDataSet("GetTranCatgoriesForDropDown", parameters);
        DataTable dt = ds.Tables[0];

        ddlst.Items.Clear();
        ddlst.Items.Add(new ListItem("ALL", "ALL"));
        foreach (DataRow dr in dt.Rows)
        {
            string Text = dr["CategoryName"].ToString();
            string Value = dr["CategoryCode"].ToString();
            ddlst.Items.Add(new ListItem(Text, Value));
        }
    }

    public void LoadInvoiceCatgoriesIntoDropDown(string CompanyCode, SystemUser user, DropDownList ddlst)
    {
        string[] parameters = { CompanyCode };
        DataSet ds = client.ExecuteDataSet("GetInvoiceCategoriesForDropDown", parameters);
        DataTable dt = ds.Tables[0];

        ddlst.Items.Clear();
        foreach (DataRow dr in dt.Rows)
        {
            string Text = dr["CategoryName"].ToString();
            string Value = dr["CategoryCode"].ToString();
            ddlst.Items.Add(new ListItem(Text, Value));
        }
    }

    public void LoadPaymentTypesIntoDropDown(string CompanyCode, SystemUser user, DropDownList ddlst)
    {
        string[] parameters = { CompanyCode };
        DataSet ds = client.ExecuteDataSet("GetPaymentTypesForDropDown", parameters);
        DataTable dt = ds.Tables[0];

        ddlst.Items.Clear();
        foreach (DataRow dr in dt.Rows)
        {
            string Text = dr["PaymentTypeName"].ToString();
            string Value = dr["PaymentTypeCode"].ToString();
            ddlst.Items.Add(new ListItem(Text, Value));
        }
    }

    public void LoadRecieptCatgoriesIntoDropDown(string CompanyCode, SystemUser user, DropDownList ddlst)
    {
        string[] parameters = { CompanyCode };
        DataSet ds = client.ExecuteDataSet("GetRecieptCategoriesForDropDown", parameters);
        DataTable dt = ds.Tables[0];

        ddlst.Items.Clear();
        foreach (DataRow dr in dt.Rows)
        {
            string Text = dr["CategoryName"].ToString();
            string Value = dr["CategoryCode"].ToString();
            ddlst.Items.Add(new ListItem(Text, Value));
        }
    }

    public void LoadUserTypesIntoDropDown(string CompanyCode, SystemUser user, DropDownList ddlst)
    {
        string[] parameters = { CompanyCode };
        DataSet ds = client.ExecuteDataSet("GetUserTypesForDropDown", parameters);
        DataTable dt = ds.Tables[0];

        ddlst.Items.Clear();
        foreach (DataRow dr in dt.Rows)
        {
            string Text = dr["UserTypeName"].ToString();
            string Value = dr["UserTypeCode"].ToString();
            ddlst.Items.Add(new ListItem(Text, Value));
        }
    }

    public void LoadInvoicesForClient(string CompanyCode, SystemUser user, DropDownList ddlst, string ClientCode)
    {
        string[] parameters = { CompanyCode, ClientCode };
        DataSet ds = client.ExecuteDataSet("GetInvoiceByClientCodeForDropDown", parameters);
        DataTable dt = ds.Tables[0];

        ddlst.Items.Clear();
        foreach (DataRow dr in dt.Rows)
        {
            string Text = dr["Narration"].ToString();
            string Value = dr["InvoiceNumber"].ToString();
            ddlst.Items.Add(new ListItem(Text, Value));
        }
    }

    public Result LogError(string Identifier, string StackTrace, string CompanyCode, string Message, string ErrorType)
    {
        Result result = new Result();
        try
        {
            result = client.LogError(Identifier, StackTrace, CompanyCode, Message, ErrorType);
        }
        catch (Exception ex)
        {
            result.StatusCode = Globals.FAILURE_STATUS_CODE;
            result.StatusDesc = "EXCPTION: " + ex.Message;
        }
        return result;
    }

    public SystemUser GetSystemUserByUserId(string UserId)
    {
        SystemUser user = new SystemUser();

        DataTable dt = client.ExecuteDataSet("GetSystemUserByUserId", new string[] { UserId }).Tables[0];


        if (dt.Rows.Count == 0)
        {
            user.StatusCode = Globals.FAILURE_STATUS_CODE;
            user.StatusDesc = "USER WITH ID [" + UserId + "] NOT FOUND";
            return user;
        }

        DataRow dr = dt.Rows[0];
        user.Name = dr["Name"].ToString();
        user.Password = dr["Password"].ToString();
        user.IsActive = dr["IsActive"].ToString();
        user.ModifiedBy = dr["ModifiedBy"].ToString();
        user.CreatedBy = dr["CreatedBy"].ToString();
        user.UserType = dr["UserType"].ToString();
        user.CompanyCode = dr["CompanyCode"].ToString();
        user.UserId = dr["UserId"].ToString();
        user.Email = dr["Email"].ToString();

        if (user.IsActive.ToUpper() != "TRUE")
        {
            user.StatusCode = Globals.FAILURE_STATUS_CODE;
            user.StatusDesc = "USER WITH ID [" + UserId + "] IS DEACTIVATED. PLEASE CONTACT SYSTEM ADMINISTRATORS";
            return user;
        }

        user.StatusCode = Globals.SUCCESS_STATUS_CODE;
        user.StatusDesc = Globals.SUCCESS_STATUS_TEXT;
        return user;

    }

    public Company GetCompanyByCompanyCode(string CompanyCode)
    {
        Company company = new Company();
        MSystemService mSystem = new MSystemService();
        DataTable dt = mSystem.ExecuteDataSet("GetCompanyByCompanyCode", new string[] { CompanyCode }).Tables[0];


        if (dt.Rows.Count == 0)
        {
            company.StatusCode = Globals.FAILURE_STATUS_CODE;
            company.StatusDesc = "COMPANY WITH ID [" + CompanyCode + "] NOT FOUND";
            return company;
        }

        DataRow dr = dt.Rows[0];
        company.CompanyName = dr["CompanyName"].ToString();
        company.CompanyContactEmail = dr["CompanyContactEmail"].ToString();
        company.IsActive = dr["IsActive"].ToString();
        company.ModifiedBy = dr["ModifiedBy"].ToString();
        company.CreatedBy = dr["CreatedBy"].ToString();
        company.NavBarTextColor = dr["NavBarTextColor"].ToString();
        company.PathToLogoImage = dr["PathToLogoImage"].ToString();
        company.ThemeColor = dr["ThemeColor"].ToString();
        company.CompanyCode = dr["CompanyCode"].ToString();

        if (company.IsActive.ToUpper() != "TRUE")
        {
            company.StatusCode = Globals.FAILURE_STATUS_CODE;
            company.StatusDesc = "COMPANY WITH ID [" + CompanyCode + "] IS DEACTIVATED. PLEASE CONTACT SYSTEM ADMINISTRATORS";
            return company;
        }

        company.StatusCode = Globals.SUCCESS_STATUS_CODE;
        company.StatusDesc = Globals.SUCCESS_STATUS_TEXT;
        return company;

    }

    public string GetSaleItemsForNarration(string SaleID)
    {
        Company company = new Company();
        MSystemService mSystem = new MSystemService();
        DataTable dt = mSystem.ExecuteDataSet("GetSaleItemsBySaleId", new string[] { SaleID }).Tables[0];
        string result = "";
        foreach (DataRow dr in dt.Rows)
        {
            result += dr["ItemDesc"].ToString() + " - " + dr["SubTotal"].ToString() + "\n";
        }
        return result;

    }

    public DataTable SearchSuppliersTable(string[] searchParams)
    {
        DataSet ds = client.ExecuteDataSet("SearchSuppliersTable", searchParams);
        DataTable dt = ds.Tables[0];
        return dt;
    }

    public DataTable SearchClientsTable(string[] searchParams)
    {
        DataSet ds = client.ExecuteDataSet("SearchClientsTable", searchParams);
        DataTable dt = ds.Tables[0];
        return dt;
    }

    public DataTable SearchSchoolsTable(string[] searchParams)
    {
        DataSet ds = SchoolsApi.ExecuteDataSet("SearchSchoolsTable", searchParams);
        DataTable dt = ds.Tables[0];
        return dt;
    }

    public DataTable SearchSchoolsTableForUnapprovedSchools()
    {
        DataSet ds = SchoolsApi.ExecuteDataSet("SearchSchoolsTableForUnapprovedSchools2", new object[] { });
        DataTable dt = ds.Tables[0];
        return dt;
    }



    public DataTable SearchTable(string storedProc, string[] searchParams)
    {
        DataSet ds = SchoolsApi.ExecuteDataSet(storedProc, searchParams);
        DataTable dt = ds.Tables[0];
        return dt;
    }

    public DataTable SearchPurchasesTable(string[] searchParams)
    {
        DataSet ds = client.ExecuteDataSet("SearchPurchasesTable", searchParams);
        DataTable dt = ds.Tables[0];
        return dt;
    }

    public DataTable SearchPaymentVouchersTable(string[] searchParams)
    {
        DataSet ds = client.ExecuteDataSet("SearchPaymentVouchersTable", searchParams);
        DataTable dt = ds.Tables[0];
        return dt;
    }

    public DataTable SearchInvoicesTable(string[] searchParams)
    {
        DataSet ds = client.ExecuteDataSet("SearchInvoicesTable", searchParams);
        DataTable dt = ds.Tables[0];
        return dt;
    }

    public DataTable SearchSalesTable(string[] searchParams)
    {
        DataSet ds = client.ExecuteDataSet("SearchSalesTable", searchParams);
        DataTable dt = ds.Tables[0];
        return dt;
    }


    public DataTable SearchGeneralLedgerTable(string[] searchParams)
    {
        DataSet ds = client.ExecuteDataSet("SearchGeneralLedgerTable", searchParams);
        DataTable dt = ds.Tables[0];
        return dt;
    }

    public DataTable SearchContractsTable(string[] searchParams)
    {
        DataSet ds = client.ExecuteDataSet("SearchContractsTable", searchParams);
        DataTable dt = ds.Tables[0];
        return dt;
    }

    public DataTable SearchSaleItemsTable(string[] searchParams)
    {
        DataSet ds = client.ExecuteDataSet("SearchSaleItemsTable", searchParams);
        DataTable dt = ds.Tables[0];
        return dt;
    }



    public DataTable SearchAuditlogsTable(string[] parameters)
    {
        throw new NotImplementedException();
    }
}