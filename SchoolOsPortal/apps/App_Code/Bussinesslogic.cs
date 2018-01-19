using System;
using System.Data;
using System.Drawing;
using System.IO;
using System.Web;
using System.Web.UI.WebControls;
using InterLinkClass.PegPaySchoolsApi;
using System.Web.UI;
using System.Text;

public class Bussinesslogic
{
    InterLinkClass.PegPaySchoolsApi.Service SchoolsApi = new InterLinkClass.PegPaySchoolsApi.Service();

    public string GetImageById(string Id)
    {
        string base64String = "";
        DataSet ds = SchoolsApi.ExecuteDataSet("GetImageById", new string[] { Id });
        DataTable dt = ds.Tables[0];
        
        //no image found
        if (dt.Rows.Count == 0)
        {
            ds = SchoolsApi.ExecuteDataSet("GetImageById", new string[] { "Default" });
            dt = ds.Tables[0];
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

    public TeacherSubject GetTeacherSubjectById(string id)
    {
        TeacherSubject tch = new TeacherSubject();

        InterLinkClass.PegPaySchoolsApi.SystemUser user = new InterLinkClass.PegPaySchoolsApi.SystemUser();
        DataTable dt = SchoolsApi.ExecuteDataSet("GetTeacherSubjectById", new string[] { id }).Tables[0];
        if (dt.Rows.Count == 0)
        {
            tch.StatusCode = Globals.FAILURE_STATUS_CODE;
            tch.StatusDesc = "NOT FOUND";
            return tch;
        }
        DataRow row = dt.Rows[0];
        tch.ClassCode = row["ClassCode"].ToString();
        tch.SchoolCode= row["SchoolCode"].ToString();
        tch.StreamCode= row["StreamCode"].ToString();
        tch.SubjectCode= row["SubjectCode"].ToString();
        tch.TeacherId= row["TeacherId"].ToString();
        tch.TermCode= row["TermCode"].ToString();
        
        tch.StatusCode = Globals.SUCCESS_STATUS_CODE;
        tch.StatusDesc = Globals.SUCCESS_STATUS_TEXT;
        return tch;
    }

    public string InsertIntoAuditLog(string ActionType, string TableName, string schoolCode, string ModifiedBy, string Action)
    {
        try
        {
            DataTable datatable = SchoolsApi.ExecuteDataSet("InsertIntoAuditTrail",
                                                           new string[]
                                                           {
                                                             ActionType,
                                                             TableName,
                                                             schoolCode,
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

    public Result LogError(string Identifier, string StackTrace, string CompanyCode, string Message, string ErrorType)
    {
        Result result = new Result();
        try
        {
            int rowsAffected = SchoolsApi.ExecuteNonQuery("LogError",new string[] { Identifier, StackTrace, CompanyCode, Message, ErrorType });
            result.StatusCode = Globals.SUCCESS_STATUS_CODE;
            result.StatusDesc = Globals.SUCCESS_STATUS_TEXT;
        }
        catch (Exception ex)
        {
            result.StatusCode = Globals.FAILURE_STATUS_CODE;
            result.StatusDesc = "EXCPTION: " + ex.Message;
        }
        return result;
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

    public void ExportToCSV(DataTable dt, HttpResponse Response)
    {
        Response.Clear();
        Response.Buffer = true;
        Response.AddHeader("content-disposition", "attachment;filename=SearchResults.csv");
        Response.Charset = "";
        Response.ContentType = "application/text";

        StringBuilder sb = new StringBuilder();

        for (int k = 0; k < dt.Columns.Count; k++)
        {
            //add separator
            sb.Append(dt.Columns[k].ColumnName + ',');

        }

        //append new line
        sb.Append("\r\n");
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            for (int k = 0; k < dt.Columns.Count; k++)
            {
                //add separator
                sb.Append(dt.Rows[i][k].ToString().Replace(",", ";") + ',');
            }
            //append new line
            sb.Append("\r\n");
        }
        Response.Output.Write(sb.ToString());
        Response.Flush();
        Response.End();
    }

    public DataTable ConvertGridViewToDataTable(GridView GridView1)
    {
        DataTable dt = new DataTable();

        // add the columns to the datatable            
        if (GridView1.HeaderRow != null)
        {

            for (int i = 0; i < GridView1.HeaderRow.Cells.Count; i++)
            {
                dt.Columns.Add(GridView1.HeaderRow.Cells[i].Text);
            }
        }

        //  add each of the data rows to the table
        foreach (GridViewRow row in GridView1.Rows)
        {
            DataRow dr;
            dr = dt.NewRow();

            for (int i = 0; i < row.Cells.Count; i++)
            {
                dr[i] = row.Cells[i].Text.Replace("&nbsp;", "");
            }
            dt.Rows.Add(dr);
        }

        //  add the footer row to the table
        if (GridView1.FooterRow != null)
        {
            DataRow dr;
            dr = dt.NewRow();

            for (int i = 0; i < GridView1.FooterRow.Cells.Count; i++)
            {
                dr[i] = GridView1.FooterRow.Cells[i].Text.Replace("&nbsp;", "");
            }
            dt.Rows.Add(dr);
        }

        return dt;
    }

    public void ExportToWord(DataTable dt, HttpResponse Response)
    {
        //Create a dummy GridView
        GridView GridView1 = new GridView();
        GridView1.AllowPaging = false;
        GridView1.DataSource = dt;
        GridView1.DataBind();

        Response.Clear();
        Response.Buffer = true;
        Response.AddHeader("content-disposition","attachment;filename=DataTable.doc");
        Response.Charset = "";
        Response.ContentType = "application/vnd.ms-word ";

        StringWriter sw = new StringWriter();
        HtmlTextWriter hw = new HtmlTextWriter(sw);
        GridView1.RenderControl(hw);
   
        Response.Output.Write(sw.ToString());
        Response.Flush();
        Response.End();
    }

    public void ExportToExcel(DataTable dt, HttpResponse Response)
    {
        //Create a dummy GridView

        GridView GridView1 = new GridView();
        GridView1.AllowPaging = false;
        GridView1.DataSource = dt;
        GridView1.DataBind();

        Response.Clear();
        Response.Buffer = true;
        Response.AddHeader("content-disposition","attachment;filename=DataTable.xls");
        Response.Charset = "";
        Response.ContentType = "application/vnd.ms-excel";

        StringWriter sw = new StringWriter();
        HtmlTextWriter hw = new HtmlTextWriter(sw);

        for (int i = 0; i < GridView1.Rows.Count; i++)
        {
            //Apply text style to each Row
            GridView1.Rows[i].Attributes.Add("class", "textmode");
        }

        GridView1.RenderControl(hw);
        //style to format numbers to string
        string style = @"<style> .textmode { mso-number-format:\@; } </style>";

        Response.Write(style);
        Response.Output.Write(sw.ToString());
        Response.Flush();
        Response.End();
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
        DataTable dt = SchoolsApi.ExecuteDataSet("GetUserTypeByUserTypeCode", new string[] { companyCode, userType }).Tables[0];


        if (dt.Rows.Count == 0)
        {
            user.StatusCode = Globals.FAILURE_STATUS_CODE;
            user.StatusDesc = "USER TYPE WITH ID [" + userType + "] NOT FOUND";
            return user;
        }

        DataRow dr = dt.Rows[0];
        user.UserTypeCode = dr["UserTypeCode"].ToString();
        user.UserTypeName = dr["UserTypeName"].ToString();
        user.ModifiedBy = dr["ModifiedBy"].ToString();

        user.StatusCode = Globals.SUCCESS_STATUS_CODE;
        user.StatusDesc = Globals.SUCCESS_STATUS_TEXT;
        return user;
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

        if (user == null) { return; }

        if (user.User.UserType != "ADMIN")
        {
            ddlst.SelectedValue = user.SchoolDetails.SchoolCode;
            ddlst.Enabled = false;
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

    public DataTable SearchGeneralLedgerTable(string[] searchParams)
    {
        InterLinkClass.CbAPI.Service cbAPI = new InterLinkClass.CbAPI.Service();
        DataSet ds = cbAPI.ExecuteDataSet("SearchGeneralLedgerTable", searchParams);
        DataTable dt = ds.Tables[0];
        return dt;
    }

    public DataTable SearchAuditlogsTable(string[] parameters)
    {
        throw new NotImplementedException();
    }
}