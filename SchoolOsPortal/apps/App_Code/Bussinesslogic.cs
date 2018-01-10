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

    public InterLinkClass.PegPaySchoolsApi.SystemUser GetSystemUserById2(string userId)
    {
        InterLinkClass.PegPaySchoolsApi.SystemUser user = new InterLinkClass.PegPaySchoolsApi.SystemUser();
        DataTable dt = SchoolsApi.ExecuteDataSet("GetSystemUserById", new string[] { userId }).Tables[0];
        if (dt.Rows.Count == 0)
        {
            user.StatusCode = Globals.FAILURE_STATUS_CODE;
            user.StatusDesc = "USER [" + userId + "] NOT FOUND";
            return user;
        }
        DataRow row = dt.Rows[0];
        user.ApprovedBy = row["ApprovedBy"].ToString();
        user.SchoolCode = row["SchoolCode"].ToString();
        user.SecretKey = row["SecretKey"].ToString();
        user.UserCategory = row["UserCategory"].ToString();
        user.Username = userId;
        user.UserPassword = row["Password"].ToString();
        user.UserType = row["UserType"].ToString();
        user.ProfilePic = row["ProfilePic"].ToString();
        user.FullName = row["FullName"].ToString();
        user.Email = row["Email"].ToString();
        user.PhoneNumber = row["PhoneNumber"].ToString();
        user.StatusCode = Globals.SUCCESS_STATUS_CODE;
        user.StatusDesc = "SUCCESS";
        return user;
    }

    public InterLinkClass.PegPaySchoolsApi.SchoolStaff GetStaffById(string studentId, string schoolCode)
    {
        InterLinkClass.PegPaySchoolsApi.SchoolStaff user = new InterLinkClass.PegPaySchoolsApi.SchoolStaff();
        DataTable dt = SchoolsApi.ExecuteDataSet("GetStaffById", new string[] { studentId, schoolCode }).Tables[0];
        if (dt.Rows.Count == 0)
        {
            user.StatusCode = Globals.FAILURE_STATUS_CODE;
            user.StatusDesc = "STAFF [" + studentId + "] NOT FOUND";
            return user;
        }
        DataRow row = dt.Rows[0];
        user.Email = row["Email"].ToString();
        user.SchoolCode = row["SchoolCode"].ToString();
        user.Gender = row["Gender"].ToString();
        user.PegPayStaffIDNumber = row["PegPayStaffIDNumber"].ToString();
        user.PhoneNumber = row["PhoneNumber"].ToString();
        user.StaffIDNumber = row["StaffIDNumber"].ToString();
        user.StaffType = row["StaffType"].ToString();
        user.ProfilePic = row["ProfilePic"].ToString();
        user.FullName = row["FullName"].ToString();
        user.StatusCode = Globals.SUCCESS_STATUS_CODE;
        user.StatusDesc = "SUCCESS";
        return user;
    }

    public InterLinkClass.PegPaySchoolsApi.School GetSchoolById(string Id)
    {
        InterLinkClass.PegPaySchoolsApi.School sch = new InterLinkClass.PegPaySchoolsApi.School();
        DataTable dt = SchoolsApi.ExecuteDataSet("GetSchoolById", new string[] { Id }).Tables[0];
        if (dt.Rows.Count == 0)
        {
            sch.StatusCode = Globals.FAILURE_STATUS_CODE;
            sch.StatusDesc = "SCHOOL [" + Id + "] NOT FOUND";
            return sch;
        }

        DataRow row = dt.Rows[0];
        sch.SchoolCode = row["SchoolCode"].ToString();
        sch.District = row["District"].ToString();
        sch.LiquidationAccountName = row["LiquidationAccountName"].ToString();
        sch.LiquidationAccountNumber = row["LiquidationAccountNumber"].ToString();
        sch.LiquidationBankName = row["LiquidationBankName"].ToString();
        sch.ModifiedBy = row["ModifiedBy"].ToString();
        sch.PlotNo = row["PlotNo"].ToString();
        sch.PostOfficeBox = row["PostOfficeBox"].ToString();
        sch.RoadName = row["RoadName"].ToString();
        sch.SchoolEmail = row["SchoolEmail"].ToString();
        sch.SchoolLocation = row["SchoolLocation"].ToString();
        sch.SchoolLogo = row["SchoolLogo"].ToString();
        sch.SchoolName = row["SchoolName"].ToString();
        sch.SchoolPhone = row["SchoolPhone"].ToString();
        sch.SubCounty = row["SubCounty"].ToString();
        sch.UnebCentreNumber = row["UnebCenterNumber"].ToString();
        sch.SchoolCategories = row["SchoolCategory"].ToString().Split('_');
        sch.SchoolType = row["SchoolType"].ToString().Split('_');
        sch.StatusCode = Globals.SUCCESS_STATUS_CODE;
        sch.StatusDesc = "SUCCESS";
        return sch;
    }

    public InterLinkClass.PegPaySchoolsApi.Student GetStudentById(string studentId, string schoolCode)
    {
        InterLinkClass.PegPaySchoolsApi.Student sch = new InterLinkClass.PegPaySchoolsApi.Student();
        DataTable dt = SchoolsApi.ExecuteDataSet("GetStudentById", new string[] { studentId, schoolCode }).Tables[0];
        if (dt.Rows.Count == 0)
        {
            sch.StatusCode = Globals.FAILURE_STATUS_CODE;
            sch.StatusDesc = "STUDENT [" + studentId + "] NOT FOUND";
            return sch;
        }

        DataRow row = dt.Rows[0];
        sch.SchoolCode = row["SchoolCode"].ToString();
        sch.ClassCode = row["ClassCode"].ToString();
        sch.DateOfBirth = row["DateOfBirth"].ToString();
        sch.Email = row["Email"].ToString();
        sch.Gender = row["Gender"].ToString();
        sch.ModifiedBy = row["ModifiedBy"].ToString();
        sch.PegPayStudentNumber = row["PegPayStudentNumber"].ToString();
        sch.PhoneNumber = row["PhoneNumber"].ToString();
        sch.ProfilePic = row["StudentPic"].ToString();
        sch.StreamCode = row["StreamCode"].ToString();
        sch.StudentCategory = row["StudentCategory"].ToString();
        sch.StudentName = row["StudentName"].ToString();
        sch.StudentNumber = row["StudentNumber"].ToString();
        sch.ParentsName1 = row["ParentsName1"].ToString();
        sch.ParentsName2 = row["ParentsName2"].ToString();
        sch.ParentsPhoneNumber1 = row["ParentsPhoneNumber1"].ToString();
        sch.ParentsPhoneNumber2 = row["ParentsPhoneNumber2"].ToString();
        sch.StatusCode = Globals.SUCCESS_STATUS_CODE;
        sch.StatusDesc = "SUCCESS";
        return sch;
    }

    public DataTable SearchGeneralLedgerTableForStatement(string[] searchParams)
    {
        InterLinkClass.CbAPI.Service cbAPI = new InterLinkClass.CbAPI.Service();
        DataSet ds = cbAPI.ExecuteDataSet("SearchGeneralLedgerTableForStatement", searchParams);
        DataTable dt = ds.Tables[0];
        return dt;
    }

    public string GetBase64StringOfUploadedFile(FileUpload fileUpload)
    {
        string base64string = "";
        if (fileUpload.PostedFile.ContentLength != 0)
        {
            byte[] b = new byte[fileUpload.PostedFile.ContentLength];
            fileUpload.PostedFile.InputStream.Read(b, 0, b.Length);
            base64string = System.Convert.ToBase64String(b, 0, b.Length);
            base64string = "data:" + fileUpload.PostedFile.ContentType + ";base64," + base64string;
        }
        return base64string;
    }

    public DataTable ExecuteDataTableOnSchoolsDB(string storedProc, string[] args)
    {
        return SchoolsApi.ExecuteDataSet(storedProc, args).Tables[0];
    }

    public void ShowMessage2(Label lblmsg, string msg, bool IsError, System.Web.SessionState.HttpSessionState Session)
    {
        lblmsg.Text = msg;
        if (IsError)
        {
            Session["IsError"] = "True";
            lblmsg.ForeColor = Color.Black;
        }
        else
        {
            Session["IsError"] = "False";
            lblmsg.ForeColor = Color.Black;
        }
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
            return "";
            //DataTable datatable = client.ExecuteDataSet("InsertIntoAuditTrail",
            //                                               new string[]
            //                                               {
            //                                                 ActionType,
            //                                                 TableName,
            //                                                 BankCode,
            //                                                 ModifiedBy,
            //                                                 Action
            //                                               }).Tables[0];
            //return datatable.Rows[0][0].ToString();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }


    public InterLinkClass.PegPaySchoolsApi.Result SendCredentialsToUser(InterLinkClass.PegPaySchoolsApi.SystemUser user)
    {
        InterLinkClass.PegPaySchoolsApi.Result result = new InterLinkClass.PegPaySchoolsApi.Result();
        try
        {
            InterLinkClass.MailApi.Result resp = new InterLinkClass.MailApi.Result();
            if (SharedCommons.SharedCommons.IsValidEmail(user.Email))
            {
                resp = SendEmailToUser(user);
            }
            if (!string.IsNullOrEmpty(user.PhoneNumber))
            {
                resp = SendSMSToUser(user);
            }

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

    private static InterLinkClass.MailApi.Result SendSMSToUser(InterLinkClass.PegPaySchoolsApi.SystemUser user)
    {
        InterLinkClass.MailApi.Result resp = new InterLinkClass.MailApi.Result();
        try
        {
            string msg = string.Format("Your Credentials for The Flexi-Schools Web Portal are" +
                           "UserId:{0}, Password:{1}, Role: {2}", user.Username, user.UserPassword, user.UserType);


            InterLinkClass.MailApi.SMS sms = new InterLinkClass.MailApi.SMS();
            sms.Mask = "Flexipay";
            sms.Message = msg;
            sms.Phone = user.PhoneNumber;
            sms.Reference = SharedCommons.SharedCommons.GenerateUniqueId("SMS");
            sms.Sender = "Flexipay";
            sms.VendorTranId = sms.Reference;

            InterLinkClass.MailApi.Messenger mapi = new InterLinkClass.MailApi.Messenger();
            resp = mapi.SendSMS(sms);
        }
        catch (Exception ex)
        {
            resp.StatusCode = Globals.FAILURE_STATUS_CODE;
            resp.StatusDesc = "FAILED: " + ex.Message;
        }
        return resp;
    }

    private static InterLinkClass.MailApi.Result SendEmailToUser(InterLinkClass.PegPaySchoolsApi.SystemUser user)
    {
        InterLinkClass.MailApi.Result resp = new InterLinkClass.MailApi.Result();
        try
        {
            InterLinkClass.MailApi.Messenger mailApi = new InterLinkClass.MailApi.Messenger();
            InterLinkClass.MailApi.Email email = new InterLinkClass.MailApi.Email();
            email.From = "Flexi-Schools";
            email.Message = string.Format("Hi<br/>" +
                            "Your Credentials for The Flexi-Schools Web Portal are Below<br/>" +
                            "UserId: {0}<br/>" +
                            "Password: {1}<br/>" +
                            "Role: {2}<br/>" +
                            "Thank you. <br/>", user.Username, user.UserPassword, user.UserType);
            email.Subject = "Flexi-Schools Web Portal Credentials";
            InterLinkClass.MailApi.EmailAddress addr = new InterLinkClass.MailApi.EmailAddress();
            addr.Address = user.Email;
            addr.Name = user.FullName;
            addr.AddressType = InterLinkClass.MailApi.EmailAddressType.To;

            InterLinkClass.MailApi.EmailAddress[] addresses = { addr };
            email.MailAddresses = addresses;
            resp = mailApi.PostEmail(email);
        }
        catch (Exception ex)
        {
            resp.StatusCode = Globals.FAILURE_STATUS_CODE;
            resp.StatusDesc = "FAILED: " + ex.Message;
        }
        return resp;
    }

    public InterLinkClass.MailApi.Result SendEmailMsg(string Msg, string Subject, string toEmail)
    {
        InterLinkClass.MailApi.Result resp = new InterLinkClass.MailApi.Result();
        try
        {
            InterLinkClass.MailApi.Messenger mailApi = new InterLinkClass.MailApi.Messenger();
            InterLinkClass.MailApi.Email email = new InterLinkClass.MailApi.Email();
            email.From = "Flexi-Schools";
            email.Message = Msg;
            email.Subject = Subject;
            InterLinkClass.MailApi.EmailAddress addr = new InterLinkClass.MailApi.EmailAddress();
            addr.Address = toEmail;
            addr.Name = toEmail;
            addr.AddressType = InterLinkClass.MailApi.EmailAddressType.To;

            InterLinkClass.MailApi.EmailAddress[] addresses = { addr };
            email.MailAddresses = addresses;
            resp = mailApi.PostEmail(email);
        }
        catch (Exception ex)
        {
            resp.StatusCode = Globals.FAILURE_STATUS_CODE;
            resp.StatusDesc = "FAILED: " + ex.Message;
        }
        return resp;
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

        if (user.User.UserType != "ADMIN")
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

    public void LoadCbDataIntoDropDown(string storedProcName, string[] parameters, DropDownList ddlst)
    {
        InterLinkClass.CbAPI.Service cbAPI = new InterLinkClass.CbAPI.Service();
        DataSet ds = cbAPI.ExecuteDataSet(storedProcName, parameters);
        DataTable dt = ds.Tables[0];

        ddlst.Items.Clear();
        foreach (DataRow dr in dt.Rows)
        {
            string Text = dr["Name"].ToString();
            string Value = dr["Code"].ToString();
            ddlst.Items.Add(new ListItem(Text, Value));
        }
    }

    public void LoadDataIntoDropDownALL(string storedProcName, string[] parameters, DropDownList ddlst)
    {
        DataSet ds = SchoolsApi.ExecuteDataSet(storedProcName, parameters);
        DataTable dt = ds.Tables[0];

        ddlst.Items.Clear();
        ddlst.Items.Add("ALL");
        foreach (DataRow dr in dt.Rows)
        {
            string Text = dr["Name"].ToString();
            string Value = dr["Code"].ToString();
            ddlst.Items.Add(new ListItem(Text, Value));
        }
    }

    public void LoadCbDataIntoDropDownALL(string storedProcName, string[] parameters, DropDownList ddlst)
    {
        InterLinkClass.CbAPI.Service cbAPI = new InterLinkClass.CbAPI.Service();
        DataSet ds = cbAPI.ExecuteDataSet(storedProcName, parameters);
        DataTable dt = ds.Tables[0];

        ddlst.Items.Clear();
        ddlst.Items.Add("ALL");
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
        InterLinkClass.CbAPI.Service cbAPI = new InterLinkClass.CbAPI.Service();
        DataSet ds = cbAPI.ExecuteDataSet("SearchGeneralLedgerTable", searchParams);
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