using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using CoreBankingLogic.ExposedObjects;
using CoreBankingLogic.ChannelObjects;
using System.Security.Cryptography.X509Certificates;
using System.Net.Security;
using System.Net;
using CoreBankingLogic.ExposedObjects.ChannelObjects;

namespace CoreBankingLogic.ChannelControls
{
    public class DataLogic : Result
    {
        DataTable table = new DataTable();
        DatabaseHandler dhandler = new DatabaseHandler();
        Logger logger = new Logger();

        internal DataTable GetApiCredentials(string channel, string merchantId)
        {
            table = new DataTable();
            try
            {
                object[] data = { channel, merchantId };
                table = dhandler.GetDataTable("GetApiCredentials", data);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return table;
        }

        internal DataTable GetChannelCredentials(string Channel)
        {
            table = new DataTable();
            try
            {
                object[] data = { Channel };
                table = dhandler.GetDataTable("GetChannelCredentials", data);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return table;
        }

        internal List<Customer> GetMerchant(string MerchantId)
        {
            List<Customer> customers = new List<Customer>();
            try
            {
                string[] parameters ={ MerchantId };
                DataTable dt = dhandler.ExecuteDataSet("GetMerchantDetails", parameters).Tables[0];
                Customer customer = new Customer();
                if (dt.Rows.Count > 0)
                {
                    customer.CustomerType = dt.Rows[0]["IsReferenced"].ToString();
                    customer.MerchantId = dt.Rows[0]["MerchantId"].ToString();
                    customer.FirstName = dt.Rows[0]["FirstName"].ToString();
                    customer.FullName = dt.Rows[0]["FirstName"].ToString() + ' ' + dt.Rows[0]["LastName"].ToString(); ;
                    customer.OtherNames = dt.Rows[0]["OtherName"].ToString();
                    customer.Gender = dt.Rows[0]["Gender"].ToString(); ;
                    customer.AccountNumber = dt.Rows[0]["AccNumber"].ToString();
                    string active = dt.Rows[0]["Active"].ToString(); ;
                    customer.Active = active.ToLower();// == "true") ? true : false;
                    customer.UserLevel = dt.Rows[0]["UserLevel"].ToString();
                    customer.OwnerTelephone = dt.Rows[0]["PhoneNumber"].ToString();
                    customer.UserId = dt.Rows[0]["CustomerId"].ToString();
                    customer.Password = dt.Rows[0]["Pin"].ToString();
                    customer.RunningBalance = dt.Rows[0]["AccBalance"].ToString();
                    customer.StatusCode = "0";
                    customer.StatusDesc = "SUCCESS";
                    customers.Add(customer);
                }
                else
                {
                    customer.StatusCode = "100";
                    customer.StatusDesc = "MERCHANT NOT FOUND";
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return customers;
        }

        internal DataTable GetMerchantTransactions(SearchFilters request)
        {
            table = new DataTable();
            try
            {
                object[] data = { request.MerchantId, request.StatusCode, request.StartDate, request.EndDate };
                table = dhandler.GetDataTable("GetChannelMerchantTransactions", data);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return table;
        }

        internal DataTable GetMerchantMiniTransactions(SearchFilters request)
        {
            table = new DataTable();
            try
            {
                object[] data = { request.MerchantId, request.StatusCode, request.StartDate, request.EndDate };
                table = dhandler.GetDataTable("GetMerchantMiniTransactions", data);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return table;
        }

        internal DataTable GetRequestAgents(string paymentAgent)
        {
            table = new DataTable();
            try
            {
                object[] data = { paymentAgent };
                table = dhandler.GetDataTable("GetRequestAgents", data);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return table;
        }

        internal DataTable GetPaymentTypes(string paymentType)
        {
            table = new DataTable();
            try
            {
                object[] data = { paymentType };
                table = dhandler.GetDataTable("GetPaymentTypes", data);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return table;
        }

        internal DataTable GetTransactionChannels(string Channel, string requestSender)
        {
            table = new DataTable();
            try
            {
                object[] data = { Channel };
                table = dhandler.GetDataTable("GetTransactionChannels", data);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return table;
        }

        internal DataTable GetTransactionTypes(string tranType)
        {
            table = new DataTable();

            try
            {
                object[] data = { tranType };
                table = dhandler.GetDataTable("GetTransactionTypes", data);

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return table;
        }

        internal DataTable GetTransactionsById(string merchantId, string tranId)
        {
            table = new DataTable();

            try
            {
                object[] data = { merchantId, tranId };
                table = dhandler.GetDataTable("GetTransactionsById", data);

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return table;
        }

        internal DataTable GetUserbyId(string userId)
        {
            table = new DataTable();

            try
            {
                object[] data = { userId };
                table = dhandler.GetDataTable("GetUserbyId", data);

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return table;
        }

        internal Customer GetUserByPhone(string[] parameters)
        {
            Customer customer = new Customer();
            try
            {
                DataTable dt = dhandler.ExecuteDataSet("GetUserByCustomerTel", parameters).Tables[0];
                if (dt.Rows.Count > 0)
                {
                    customer.MerchantId = dt.Rows[0]["MerchantId"].ToString();
                    customer.FirstName = dt.Rows[0]["FirstName"].ToString();
                    customer.FullName = dt.Rows[0]["FirstName"].ToString() + ' ' + dt.Rows[0]["LastName"].ToString(); ;
                    customer.OtherNames = dt.Rows[0]["OtherName"].ToString();
                    customer.Gender = dt.Rows[0]["Gender"].ToString(); ;
                    customer.AccountNumber = dt.Rows[0]["AccNumber"].ToString();
                    string active = dt.Rows[0]["Active"].ToString(); ;
                    customer.Active = active.ToLower();// == "true") ? true : false;
                    customer.UserLevel = dt.Rows[0]["UserLevel"].ToString();
                    customer.OwnerTelephone = dt.Rows[0]["PhoneNumber"].ToString();
                    customer.UserId = dt.Rows[0]["CustomerId"].ToString();
                    customer.Password = dt.Rows[0]["Pin"].ToString();
                    customer.RunningBalance = dt.Rows[0]["AccBalance"].ToString();
                    customer.CustomerType = dt.Rows[0]["IsReferenced"].ToString();
                    customer.StatusCode = "0";
                    customer.StatusDesc = "SUCCESS";
                }
                else
                {
                    customer.StatusCode = "100";
                    customer.StatusDesc = "USER NOT FOUND";
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return customer;
        }

        internal DataTable GetAccountUsers(string merchantId)
        {
            DataTable dt = new DataTable();
            try
            {
                string[] parameters = { merchantId };
                dt = dhandler.ExecuteDataSet("GetAccountSignatories", parameters).Tables[0];
                if (dt.Rows.Count > 0)
                {
                    StatusCode = "0";
                    StatusDesc = "SUCCESS";
                }
                else
                {
                    StatusCode = "100";
                    StatusDesc = "NO USERS FOUND";
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return dt;
        }

        internal DataTable LogMerchantTransaction(MerchantTransaction trans)
        {
            table = new DataTable();
            try
            {
                object[] data = { trans.CustRef,
                    trans.CustName,
                    trans.CustType,
                    trans.CustTel,
                    trans.Area,
                    trans.Amount,
                    trans.PaymentDate,
                    trans.TranType,
                    trans.PaymentType,
                    trans.AccountFrom,
                    trans.AccountTo,
                    trans.Utility,
                    trans.MerchantId,
                    trans.CreatedBy,
                    trans.Channel,
                    trans.TranId,
                    "PENDING",
                    0,
                    trans.Narration,
                    trans.PhoneImei,
                    "test transaction",
                    trans.VisaCVC,
                    trans.VisaExpiryMonth,
                    trans.VisaExpiryYear};
                table = dhandler.GetDataTable("InsertReceivedTransactions", data);

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return table;
        }

        internal DataTable RegisterMerchant(string UserName, string Password, string FirstName, string OtherNames, string UserLevel, string BussinessName, string OwnerTelephone, string BusinessTelephone, string BusinessEmail, string PhoneImei, string BusinnesAddress, string BusinessLicence, string OwnerImage, string OwnerIdType, string OwnerIdImage, string OwnerIdNumber, string Gender, string CustomerType, string MerchantId, string accountTime)
        {
            table = new DataTable();
            try
            {
                object[] data = { UserName, Password, FirstName, OtherNames, UserLevel, BussinessName.ToUpper(), OwnerTelephone, BusinessTelephone, BusinessEmail, PhoneImei, BusinnesAddress, BusinessLicence, OwnerImage, OwnerIdType, OwnerIdImage, OwnerIdNumber, Gender, CustomerType, MerchantId, accountTime };
                table = dhandler.GetDataTable("RegisterMerchant", data);
            }
            catch (Exception ee)
            {
                logger.LogSystemExceptions("RegisterMerchant", ee.Message, PhoneImei);
            }
            return table;
        }


        internal bool LogUserInOrOut(string userId, string loginValue)
        {
            // login value: => 1 for log in : 2 for log out
            bool loggedinorout = false;
            try
            {
                object[] data = { userId, loginValue };
                loggedinorout = dhandler.ExecuteNonQuery("LogUserInOrOut", data);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return loggedinorout;
        }

        internal bool MarkTransactionAsNotified(string tranId, string value)
        {
            bool updated;
            try
            {
                object[] data = { tranId, value };
                updated = dhandler.ExecuteNonQuery("MarkTransactionAsNotified", data);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return updated;
        }

        internal void MoveTransactionToFailedTransactionIfExists(string pegpayId)
        {
            try
            {
                object[] data = { pegpayId };
                dhandler.ExecuteNonQuery("MoveTransactionToFailedTransaction", data);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        internal bool UpdateRequestAgent(object[] parameters)
        {
            bool executed = false;
            try
            {
                executed = dhandler.ExecuteNonQuery("UpdateRequestAgents", parameters);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return executed;
        }

        internal Customer UpdatePin(string[] parameters)
        {
            Customer customer = new Customer();
            try
            {
                DataTable dt = dhandler.ExecuteDataSet("UpdateUserPin", parameters).Tables[0];

                if (dt.Rows.Count == 1)
                {
                    bool Isactive = Convert.ToBoolean(dt.Rows[0]["Active"].ToString());
                    if (Isactive)
                    {
                        customer.Password = dt.Rows[0]["Pin"].ToString();
                        customer.FirstName = dt.Rows[0]["FirstName"].ToString();
                        customer.FullName = dt.Rows[0]["LastName"].ToString() + ' ' + dt.Rows[0]["FirstName"].ToString(); ;
                        customer.OtherNames = dt.Rows[0]["OtherName"].ToString();
                        string active = dt.Rows[0]["Active"].ToString();
                        customer.OwnerTelephone = dt.Rows[0]["PhoneNumber"].ToString();
                        customer.Active = active.ToLower();
                        customer.StatusCode = "0";
                        customer.StatusDesc = "SUCCESS";
                    }
                    else
                    {
                        customer.StatusCode = "100";
                        customer.StatusDesc = "USER ACCOUNT NOT ACTIVE";
                    }
                }
                else if (dt.Rows.Count > 1)
                {
                    customer.StatusCode = "100";
                    customer.StatusDesc = "FAILED TO CHANGE PIN";
                }
                else
                {
                    customer.StatusCode = "1";
                    customer.StatusDesc = "NO USER FOUND";
                    customer.UserLevel = "NONE";
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return customer;
        }

        private static bool RemoteCertificateValidation(Object sender, X509Certificate certificate, X509Chain chain, SslPolicyErrors sslPolicyErrors)
        {
            return true;
        }

        internal string GetUserBank(string merchantId)
        {
            string bankCode = "";
            try
            {
                string[] parameters = { merchantId };
                DataTable dt = dhandler.ExecuteDataSet("GetMerchantBankCode", parameters).Tables[0];

                if (dt.Rows.Count == 1)
                {
                    bankCode = dt.Rows[0]["BankCode"].ToString();
                    StatusCode = "0";
                }
                else
                {
                    StatusCode = "1";
                    StatusDesc = "NO USER FOUND";
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return bankCode;
        }

        public Result LogChannelRequest(MerchantTransaction trans)
        {
            Result res = new Result();
            try
            {
                object[] data = {
                    trans.CustRef,
                    trans.CustName,
                    trans.CustType,
                    trans.CustTel,
                    trans.UserPhone,
                    trans.Area,
                    trans.AccountFrom,
                    trans.AccountTo,
                    trans.Amount,
                    trans.TranType,
                    trans.PaymentType,
                    trans.Utility,
                    trans.MerchantId,
                    trans.Channel,
                    trans.TranId,
                    trans.Narration,
                    trans.RequestAgent,
                    trans.VisaCVC,
                    trans.VisaExpiryMonth,
                    trans.VisaExpiryYear};
                table = dhandler.GetDataTable("LogChannelRequest", data);
                res.RequestId = table.Rows[0]["recordid"].ToString();
                res.StatusCode = "0";
            }
            catch (Exception ex)
            {
                throw ex;          
            }
            return res;
        }

        public void LogChannelResponse(PostResponse resp, Result res, string requestAgent)
        {
            try
            {
                object[] data = { res.RequestId, resp.StatusCode, resp.StatusDesc };
                dhandler.ExecuteNonQuery("LogChannelResponse", data);
            }
            catch (Exception ex)
            {
                logger.LogSystemExceptions("LogChannelResponse", ex.Message, requestAgent);
            }
        }

        internal DataTable GetTranDetails(string tranid, string merchantid, string reqAgent)
        {
            table = new DataTable();
            try
            {
                object[] data = { tranid, merchantid };
                table = dhandler.GetDataTable("GetChannelTranById", data);
            }
            catch (Exception ee)
            {
                logger.LogSystemExceptions("GetChannelTranById", ee.Message, reqAgent);
            }
            return table;
        }
    }
}
