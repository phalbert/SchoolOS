using System;
using System.Collections.Generic;
using System.Text;
using SchoolOSWebPortalBgService.SchoolsAPI;
using System.Data;
using System.IO;

namespace SchoolOSWebPortalBgService
{
    public class BussinessLogic
    {
        Service schoolsAPI = new Service();

        internal UploadedFile[] GetUnprocessedStudentPaymentFiles()
        {
            List<UploadedFile> all = new List<UploadedFile>();
            try
            {
                DataTable dt = schoolsAPI.ExecuteDataSet("GetUnprocessedStudentPaymentFiles", new object[] { }).Tables[0];
                foreach (DataRow dr in dt.Rows)
                {
                    UploadedFile file = new UploadedFile();
                    file.Email = dr["Email"].ToString();
                    file.FileContents = Convert.ToBase64String((byte[])dr["FileContents"]);
                    file.FileName = dr["FileName"].ToString();
                    file.ModifiedBy = dr["ModifiedBy"].ToString();
                    file.SchoolCode = dr["SchoolCode"].ToString();
                    file.OperationCode = dr["OperationCode"].ToString();
                    file.ID = dr["RecordId"].ToString();
                    file.SPCode = dr["SPCode"].ToString();
                    file.StatusDesc = ((DateTime)dr["CreatedOn"]).ToString("yyyy-MM-dd");
                    all.Add(file);
                }
            }
            catch (Exception ex)
            {
            }
            return all.ToArray();
        }

        internal UploadedFile[] GetUnprocessedUploadedFiles(string OperationCode)
        {
            List<UploadedFile> all = new List<UploadedFile>();
            try
            {
                DataTable dt = schoolsAPI.ExecuteDataSet("GetUnprocessedUploadedFiles", new object[] { OperationCode }).Tables[0];
                foreach (DataRow dr in dt.Rows)
                {
                    UploadedFile file = new UploadedFile();
                    file.Email = dr["Email"].ToString();
                    file.FileContents = Convert.ToBase64String((byte[])dr["FileContents"]);
                    file.FileName = dr["FileName"].ToString();
                    file.ModifiedBy = dr["ModifiedBy"].ToString();
                    file.SchoolCode = dr["SchoolCode"].ToString();
                    file.OperationCode = dr["OperationCode"].ToString();
                    file.ID = dr["RecordId"].ToString();
                    file.SPCode = dr["SPCode"].ToString();
                    file.StatusDesc = ((DateTime)dr["CreatedOn"]).ToString("yyyy-MM-dd");
                    all.Add(file);
                }
            }
            catch (Exception ex)
            {
            }
            return all.ToArray();
        }

        internal Student[] GetStudentsInUploadedFile(UploadedFile file)
        {
            List<Student> all = new List<Student>();

            string filePath = Globals.UPLOAD_FILE_PATH + DateTime.Now.Ticks + "_" + file.FileName;
            byte[] fileBytes = Convert.FromBase64String(file.FileContents);
            File.WriteAllBytes(filePath, fileBytes);
            string[] allLinesInFile = File.ReadAllLines(filePath);

            foreach (string line in allLinesInFile)
            {
                ReadStudentsFromFile(file, all, line);
            }

            return all.ToArray();
        }

        private void ReadStudentsFromFile(UploadedFile file, List<Student> all, string line)
        {
            Student std = new Student();
            try
            {
                string[] parts = line.Split(',');
                std.ClassCode = Globals.NOT_AVAILABLE_TEXT;
                std.DateOfBirth = DateTime.Now.ToString("dd/MM/yyyy");
                std.Email = Globals.NOT_AVAILABLE_TEXT;
                std.Gender = Globals.NOT_AVAILABLE_TEXT;
                std.ModifiedBy = file.ModifiedBy;
                std.ParentsName1 = Globals.NOT_AVAILABLE_TEXT;
                std.ParentsName2 = Globals.NOT_AVAILABLE_TEXT;
                std.ParentsPhoneNumber1 = Globals.NOT_AVAILABLE_TEXT;
                std.ParentsPhoneNumber2 = Globals.NOT_AVAILABLE_TEXT;
                std.PhoneNumber = Globals.NOT_AVAILABLE_TEXT;
                std.ProfilePic = Globals.NOT_AVAILABLE_TEXT;
                std.StreamCode = Globals.NOT_AVAILABLE_TEXT;
                std.StudentCategory = Globals.NOT_AVAILABLE_TEXT;
                std.StudentName = Globals.NOT_AVAILABLE_TEXT;
                std.StudentNumber = Globals.NOT_AVAILABLE_TEXT;

                std.StatusCode = Globals.SUCCESS_STATUS_CODE;
                std.StatusDesc = Globals.SUCCESS_STATUS_TEXT;
            }
            catch (Exception ex)
            {
                std.StatusCode = Globals.FAILURE_STATUS_CODE;
                std.StatusDesc = "ERROR PROCESSING LINE [" + line + "] IN FILE";
            }
            all.Add(std);
        }

        internal Result SaveStudentPayment(StudentFee payment)
        {
            Result result = new Result();
            try
            {
                result = schoolsAPI.SaveStudentFees(payment);
            }
            catch (Exception ex)
            {
                result.StatusCode = Globals.FAILURE_STATUS_CODE;
                result.StatusDesc = "EXCEPTION:" + ex.Message;
            }
            return result;
        }

        internal void UpdateFileProcessedStatus(UploadedFile file)
        {
            try
            {
                int rowsAffected = schoolsAPI.ExecuteNonQuery("UpdateFileProcessedStatus", new object[] { file.ID });
            }
            catch (Exception ex)
            {
            }
        }

        internal void SavePaymentLog(string TranID, string FeeID, string StudentID, string Status, string Reason, string ModifiedBy)
        {
            try
            {
                int rowsAffected = schoolsAPI.ExecuteNonQuery("SavePaymentLog", new object[] {  TranID,  FeeID,  StudentID,  Status,  Reason,  ModifiedBy });
            }
            catch (Exception ex)
            {
            }
        }

        internal void LogFileUploadStatus(string fileID,string status,string Reason,string ModifiedBy,string rowId="N/A")
        {
            try
            {
                int rowsAffected = schoolsAPI.ExecuteNonQuery("LogFileUploadStatus", new object[] { fileID,rowId,status,Reason,ModifiedBy });
            }
            catch (Exception ex)
            {
            }
        }

        internal StudentFee[] GetUnprocessedStudentPayments()
        {
            List<StudentFee> all = new List<StudentFee>();
            try
            {
                DataTable dt = schoolsAPI.ExecuteDataSet("GetUnprocessedStudentFees", new object[] { }).Tables[0];
                foreach (DataRow dr in dt.Rows)
                {
                    StudentFee file = new StudentFee();
                    file.Amount = dr["Amount"].ToString();
                    file.ClassCode = dr["ClassCode"].ToString();
                    file.FeeID = dr["FeeID"].ToString();
                    file.FeeType = dr["TranType"].ToString();
                    file.Email = dr["Email"].ToString();
                    file.PaymentChannel = dr["PaymentChannel"].ToString();
                    file.PaymentDate = ((DateTime)dr["CreatedOn"]).ToString("dd/MM/yyyy");
                    file.TranID = dr["TranID"].ToString();
                    file.StudentID = dr["StudentId"].ToString();
                    file.ModifiedBy = dr["ModifiedBy"].ToString();
                    file.SchoolCode = dr["SchoolCode"].ToString();
                    all.Add(file);
                }
            }
            catch (Exception ex)
            {
            }
            return all.ToArray();
        }

        internal void UpdateFeesProcessedStatus(StudentFee payment)
        {
            try
            {
                int rowsAffected = schoolsAPI.ExecuteNonQuery("UpdateFeesProcessedStatus", new object[] { payment.TranID });
            }
            catch (Exception ex)
            {
            }
        }

        internal StudentFee[] GetPaymentsFromFile(UploadedFile file)
        {
            List<StudentFee> all = new List<StudentFee>();

            string filePath = Globals.UPLOAD_FILE_PATH + DateTime.Now.Ticks + "_" + file.FileName;
            byte[] fileBytes = Convert.FromBase64String(file.FileContents);
            File.WriteAllBytes(filePath, fileBytes);
            string[] allLinesInFile = File.ReadAllLines(filePath);

            foreach (string line in allLinesInFile)
            {
                ReadLineInFile(file, all, line);
            }

            return all.ToArray();
        }

        internal CbApi.TransactionRequest[] GetTransactionRequests(StudentFee payment)
        {
            List<CbApi.TransactionRequest> all = new List<CbApi.TransactionRequest>();
            try
            {
                if (payment.StudentID != "ALL")
                {
                    CbApi.TransactionRequest req = GetTransactionRequestForStudent(payment);
                    all.Add(req);
                    return all.ToArray(); ;
                }

                CbApi.TransactionRequest[] classReq = GetTransactionRequestForClass(payment);
                all.AddRange(classReq);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return all.ToArray();
        }

        private CbApi.TransactionRequest GetTransactionRequestForStudent(StudentFee payment)
        {
            CbApi.TransactionRequest req = new CbApi.TransactionRequest();
            DataTable dt = schoolsAPI.ExecuteDataSet("GetStudentById", new object[] { payment.StudentID, payment.SchoolCode }).Tables[0];
            if (dt.Rows.Count == 0)
            {
                req.StatusCode = Globals.FAILURE_STATUS_CODE;
                req.StatusDesc = $"STUDENT WITH ID [{payment.StudentID}] NOT FOUND IN SCHOOL [{payment.SchoolCode}]";
                return req;
            }

            DataRow dr = dt.Rows[0];
            Student std = GetStudent(dr);
            req = GetTransactionRequest(payment, std);
            return req;
        }

        private CbApi.TransactionRequest[] GetTransactionRequestForClass(StudentFee payment)
        {
            List<CbApi.TransactionRequest> all = new List<CbApi.TransactionRequest>();
            DataTable dt = schoolsAPI.ExecuteDataSet("GetStudentsInClass", new object[] { payment.ClassCode, payment.SchoolCode }).Tables[0];
            foreach (DataRow dr in dt.Rows)
            {
                CbApi.TransactionRequest req = new CbApi.TransactionRequest();
                Student std = GetStudent(dr);
                req = GetTransactionRequest(payment, std);
                all.Add(req);
            }
            return all.ToArray();
        }

        private CbApi.TransactionRequest GetTransactionRequest(StudentFee payment, Student std)
        {
            CbApi.TransactionRequest req = new CbApi.TransactionRequest();
            req.ApprovedBy = payment.ModifiedBy;
            req.BankCode = payment.SchoolCode;
            req.BankTranId = payment.TranID + "_" + std.StudentNumber;
            req.BranchCode = "HQ";
            req.ChargeAmount = "0";
            req.CurrencyCode = "UGX";
            req.CustomerName = std.StudentName;
            req.CustomerRef = std.StudentNumber;
            req.CustomerTel = std.PhoneNumber;
            req.Password = Globals.SCHOOL_PASSWORD;
            req.DigitalSignature = "TEST";
            req.Teller = payment.ModifiedBy;
            req.ChequeNumber = "";
            req.FromAccount = GetFromAccount(payment, std);
            req.ToAccount = GetToAccount(payment, std);
            req.TranAmount = payment.Amount;
            req.TranCategory = GetTransactionCategory(payment);
            req.Narration = payment.PaymentChannel;
            req.PaymentDate = payment.PaymentDate;
            req.PaymentType = GetPaymentType(payment);
            return req;
        }

        private string GetTransactionCategory(StudentFee payment)
        {
            if (payment.FeeType == "Debit")
            {
                return "S2C_Debit";
            }
            return "S2C_Credit";
        }

        private string GetToAccount(StudentFee payment, Student std)
        {
            if (payment.FeeType == "Debit")
            {
                return GetAccountByName("SCHOOL_FEES_SUSPENSE_ACCOUNT", payment.SchoolCode);
            }
            return std.PegPayStudentNumber;
        }

        private string GetPaymentType(StudentFee payment)
        {
            if (payment.FeeType == "Debit")
            {
                return "SCHOOLS_WEB_PORTAL_PAYMENT";
            }
            return "SCHOOLS_WEB_PORTAL_PAYMENT";
        }

        private string GetAccountByName(string Name, string schoolCode)
        {
            string AccountNumber = "";
            try
            {
                CbApi.Service cbAPI = new CbApi.Service();
                CbApi.SystemSetting setting = cbAPI.GetById("SYSTEMSETTING", Name, schoolCode, Globals.SCHOOL_PASSWORD) as CbApi.SystemSetting;
                return setting.SettingValue;
            }
            catch (Exception ex)
            {
            }
            return AccountNumber;
        }

        private Student GetStudent(DataRow row)
        {
            Student std = new Student();
            std.SchoolCode = row["SchoolCode"].ToString();
            std.ClassCode = row["ClassCode"].ToString();
            std.DateOfBirth = row["DateOfBirth"].ToString();
            std.Email = row["Email"].ToString();
            std.Gender = row["Gender"].ToString();
            std.ModifiedBy = row["ModifiedBy"].ToString();
            std.PegPayStudentNumber = row["PegPayStudentNumber"].ToString();
            std.PhoneNumber = row["PhoneNumber"].ToString();
            std.ProfilePic = row["StudentPic"].ToString();
            std.StreamCode = row["StreamCode"].ToString();
            std.StudentCategory = row["StudentCategory"].ToString();
            std.StudentName = row["StudentName"].ToString();
            std.StudentNumber = row["StudentNumber"].ToString();
            std.StatusCode = Globals.SUCCESS_STATUS_CODE;
            std.StatusDesc = "SUCCESS";
            return std;
        }

        private string GetFromAccount(StudentFee payment, Student std)
        {
            if (payment.FeeType == "Debit")
            {
                return std.PegPayStudentNumber;
            }
            return GetAccountByName("SCHOOL_FEES_SUSPENSE_ACCOUNT", payment.SchoolCode);
        }

        private static void ReadLineInFile(UploadedFile file, List<StudentFee> all, string line)
        {
            StudentFee fee = new StudentFee();
            try
            {
                string[] parts = line.Split(',');
                fee.Amount = parts[1];
                fee.TranID = parts[2];
                fee.FeeID = "FILE-UPLOAD-" + fee.TranID;
                fee.FeeType = "Debit";
                fee.ModifiedBy = file.ModifiedBy;
                fee.PaymentChannel = parts[2];
                fee.SchoolCode = file.SchoolCode;
                fee.StudentID = parts[0];
                fee.Email = file.Email;

                fee.ClassCode = "N/A";
                fee.PaymentDate = file.StatusDesc;
                fee.StatusCode = Globals.SUCCESS_STATUS_CODE;
                fee.StatusDesc = Globals.SUCCESS_STATUS_TEXT;
            }
            catch (Exception ex)
            {
                fee.StatusCode = Globals.FAILURE_STATUS_CODE;
                fee.StatusDesc = "ERROR PROCESSING LINE [" + line + "] IN FILE";
            }
            all.Add(fee);
        }

        internal void SendResultsToTheUploader(string toEmail, List<StudentFee> successfullPayments, List<StudentFee> failedPayments)
        {
            string msg = string.Format("Hi {0} <br/>" +
                        "File Uploaded had {1} Records. <br/>" +
                        "SuccessFully Processed Payments = {2} <br/>" +
                        "Failed Payments = {3} <br/>" +
                        "Check the Flexi-Schools Web Portal for more information <br/>" +
                        "Thank you. <br/>" +
                        "Flexi-Schools Team", toEmail, "" + (successfullPayments.Count + failedPayments.Count), "" + successfullPayments.Count, "" + failedPayments.Count);

            SendResultsToUser(msg, toEmail);
        }

        public Result SendResultsToUser(string msg, string contact)
        {
            Result result = new Result();
            try
            {
                MailApi.Result resp = new MailApi.Result();
                if (SharedCommons.SharedCommons.IsValidEmail(contact))
                {
                    resp = SendEmailToUser(msg, contact);
                    result.StatusCode = resp.StatusCode;
                    result.StatusDesc = resp.StatusDesc;
                    return result;
                }
                if (!string.IsNullOrEmpty(contact))
                {
                    resp = SendSMSToUser(msg, contact);
                    result.StatusCode = resp.StatusCode;
                    result.StatusDesc = resp.StatusDesc;
                    return result;
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

        private static MailApi.Result SendSMSToUser(string msg, string toPhoneNumber)
        {

            MailApi.SMS sms = new MailApi.SMS();
            sms.Mask = "Flexipay";
            sms.Message = msg;
            sms.Phone = toPhoneNumber;
            sms.Reference = SharedCommons.SharedCommons.GenerateUniqueId("SMS");
            sms.Sender = "Flexipay";
            sms.VendorTranId = sms.Reference;

            MailApi.MessengerSoapClient mapi = new MailApi.MessengerSoapClient();
            MailApi.Result resp = mapi.SendSMS(sms);
            return resp;
        }

        private static MailApi.Result SendEmailToUser(string msg, string toEmail)
        {
            MailApi.MessengerSoapClient mailApi = new MailApi.MessengerSoapClient();
            MailApi.Email email = new MailApi.Email();
            email.From = "Flexi-Schools";
            email.Message = msg;
            email.Subject = "Flexi-Schools Web Portal Credentials";

            MailApi.EmailAddress addr = new MailApi.EmailAddress();
            addr.Address = toEmail;
            addr.Name = toEmail.Split('@')[0];
            addr.AddressType = MailApi.EmailAddressType.To;

            MailApi.EmailAddress techSupport = new MailApi.EmailAddress();
            techSupport.Address = "techsupport@pegasustechnologies.co.ug";
            techSupport.Name = "techsupport";
            techSupport.AddressType = MailApi.EmailAddressType.CarbonCopy;

            MailApi.EmailAddress[] addresses = { addr, techSupport };
            email.MailAddresses = addresses;
            MailApi.Result resp = mailApi.PostEmail(email);
            return resp;
        }
    }
}
