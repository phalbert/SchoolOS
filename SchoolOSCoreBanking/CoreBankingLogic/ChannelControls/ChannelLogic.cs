using System;
using System.Collections.Generic;
using System.Text;
using System.Security.Cryptography.X509Certificates;
using System.Net.Security;
using CoreBankingLogic.ExposedObjects.ChannelObjects;
using CoreBankingLogic.ChannelObjects;
using System.Data;
using System.Security.Cryptography;
using System.Web;
using System.Globalization;
using System.IO;
using System.Runtime.Serialization.Formatters.Binary;

namespace CoreBankingLogic.ChannelControls
{
    public class ChannelLogic : Defaults
    {
        DataLogic dataLogic = new DataLogic();
        Logger logger = new Logger();
        DatabaseHandler dhandler = new DatabaseHandler();

        public ChannelLogic(string reqSender, string channel)
        {
            Channel = channel;

            if (Channel == "MOBILE_APP" || !string.IsNullOrEmpty(reqSender))
            {
                RequestAgent = reqSender;
            }
            else
            {
                RequestAgent = HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"];
            }
        }

        #region VALIDATIONS

        internal bool CustomerExists(string email, string phone)
        {
            bool exists = true;
            try
            {
                PostResponse resp = new PostResponse();
                resp = GetUserByPhone(phone);
                if (resp.StatusCode.Equals("0"))
                {
                    StatusDesc = "USER ALREADY EXISTS";
                }
                else
                {
                    exists = false;
                }
            }
            catch (Exception ee)
            {
                logger.LogSystemExceptions("CustomerExists", ee.Message, RequestAgent);
            }
            return exists;
        }

        internal bool IsDuplicateTransaction(string merchantId, string tranId)
        {
            bool isDuplicate = true;
            try
            {
                List<MerchantTransaction> transList = GetTransactions(merchantId, tranId);
                if (transList.Count <= 0)
                    isDuplicate = false;
                else
                {
                    string transNo = transList[0].VisaExpiryMonth;
                    string token = transList[0].VisaExpiryYear;
                    string pegPayId = transList[0].VisaCVC;
                    StatusDesc = "TRANSACTION ALREADY EXISTS: Tran no: " + transNo + " | UtilityId: " + token + " | PegPayId: " + pegPayId;
                    isDuplicate = true;
                }
            }
            catch (Exception ee)
            {
                logger.LogSystemExceptions("IsDuplicateTransaction", ee.Message, RequestAgent);
            }
            return isDuplicate;
        }

        internal bool IsNumeric(string Amount)
        {
            bool isNumeric = false;

            try
            {
                long amount = Int64.Parse(Amount.Split('.')[0]);
                return true;
            }
            catch (Exception ee)
            {
                logger.LogSystemExceptions("IsNumeric", ee.Message, RequestAgent);
            }
            return isNumeric;
        }

        internal bool IsUserLoggedOn(string userId)
        {
            bool isLoggedOn = false;

            try
            {
                Customer customer = GetCustomerByUserId(userId);
                if (customer.StatusCode == "0")
                {
                    if (customer.IsLoggedIn == "1")
                    {
                        isLoggedOn = true;
                    }
                    else
                    {
                        isLoggedOn = false;
                        StatusCode = "100";
                        StatusDesc = "USER IS NOT LOGGED IN";
                    }
                }
                else
                {
                    StatusCode = customer.StatusCode;
                    StatusDesc = customer.StatusDesc;
                }
            }
            catch (Exception ee)
            {
                logger.LogSystemExceptions("IsUserLoggedOn", ee.Message, RequestAgent);
            }

            return isLoggedOn;
        }

        internal bool IsValidLogOutRequest(string userId, string userPhone)
        {
            bool isValid = false;
            try
            {
                if (string.IsNullOrEmpty(userId))
                {
                    StatusCode = "100";
                    StatusDesc = "PLEASE PROVIDE A USER ID";
                }
                else if (string.IsNullOrEmpty(userPhone))
                {
                    StatusCode = "100";
                    StatusDesc = "PLEASE PROVIDE THE USER PHONE NUMBER";
                }
                else if (IsUserLoggedOn(userId))
                {
                    isValid = true;
                }

            }
            catch (Exception ee)
            {
            }
            return isValid;
        }

        internal bool IsValidChannel(string channel)
        {
            bool channelExists = false;
            try
            {
                List<string> channels = GetChannels(channel, RequestAgent);
                if (channels.Count == 1)
                {
                    channelExists = true;
                }
            }
            catch (Exception ee)
            {
                logger.LogSystemExceptions("IsValidChannel", ee.Message, RequestAgent);
            }
            return channelExists;
        }

        internal bool IsValidChannelCredentials(string apiUsername, string apiPassword, string channel)
        {
            bool isValid = false;
            try
            {
                DataTable table = new DataTable();
                table = dataLogic.GetChannelCredentials(channel);

                if (table.Rows.Count == 1)
                {
                    string ApiUsername = table.Rows[0]["ApiUsername"].ToString();
                    string ApiPassword = table.Rows[0]["ApiPassword"].ToString();

                    if (ApiUsername.Trim() == apiUsername && ApiPassword.Trim() == apiPassword)
                    {
                        isValid = true;
                    }
                    else
                    {
                        StatusDesc = "INVALID CHANNEL CREDENTIALS";
                    }
                }
                else
                {
                    isValid = false;
                    StatusDesc = "UNKNOWN CHANNEL";
                }
            }
            catch (Exception ee)
            {
                logger.LogSystemExceptions("ValidChannelCredentials", ee.Message, RequestAgent);
            }
            return isValid;
        }

        internal bool IsValidDate(string datetime)
        {
            string[] formats = { "dd/MM/yyyy" };

            DateTime expectedDate;
            if (!DateTime.TryParseExact(datetime, formats, new CultureInfo("en-US"), DateTimeStyles.None, out expectedDate))
            {
                return false;
            }
            return true;
        }

        internal bool IsValidDigitalSignature(string signature)
        {
            bool isValid = false;
            try
            {
                isValid = true;
            }
            catch (Exception ee)
            {
                logger.LogSystemExceptions("IsValidDigitalSignature", ee.Message, RequestAgent);
            }
            return isValid;
        }

        internal bool IsValidMerchant(string merchantId)
        {
            bool isValid = false;
            try
            {
                List<Customer> customers = GetMerchant(merchantId);
                if (customers.Count == 1)
                {
                    isValid = true;
                }
                else
                {
                    StatusDesc = "UNKNOWN MERCHANT";
                }
            }
            catch (Exception ee)
            {
                throw ee;
            }
            return isValid;
        }

        internal bool IsValidMerchantAccount(string merchantId, string specifiedAccount, out string accountTo)
        {
            bool isOk = false;
            string account = "";

            try
            {
                string realAccount = GetMerchantAccount(merchantId);
                if (specifiedAccount == realAccount)
                {
                    account = realAccount;
                    isOk = true;
                }
                else
                {
                    isOk = false;
                }
            }
            catch (Exception ee)
            {
                logger.LogSystemExceptions("IsValidMerchantAccount", ee.Message, RequestAgent);
            }
            accountTo = account;
            return isOk;
        }

        internal bool HasSufficientFunds(string userPhone, string amount)
        {
            bool hasFunds = false;
            try
            {
                PostResponse resp = new PostResponse();
                resp = GetUserByPhone(userPhone);

                if (resp.StatusCode.Equals("0"))
                {
                    Customer customer = resp.Customer;
                    double amountTopay = 0;
                    if (Double.TryParse(amount, out amountTopay))
                    {
                        double accountFunds = 0;
                        Double.TryParse(customer.RunningBalance, out accountFunds);
                        if (accountFunds >= amountTopay)
                        {
                            hasFunds = true;
                        }
                    }
                }
            }
            catch (Exception ee)
            {
                logger.LogSystemExceptions("HasSufficientFunds", ee.Message, RequestAgent);
            }
            return hasFunds;
        }

        internal bool IsValidInternalTransfer(string MerchantId, string merchantBeingPaid)
        {
            try
            {
                string payerBank = GetMerchantBank(MerchantId);
                string payeeBank = GetMerchantBank(merchantBeingPaid);

                if (payerBank.Equals(payeeBank))
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (Exception ex)
            {
                logger.LogSystemExceptions("IsValidInternalTransfer", ex.Message, RequestAgent);
                StatusCode = "100";
                StatusDesc = "INTERNAL FAILURE";
                return false;
            }
        }

        private string GetMerchantBank(string merchantId)
        {
            try
            {
                string bank = dataLogic.GetUserBank(merchantId);
                return bank;
            }
            catch (Exception ex)
            {
                logger.LogSystemExceptions("GetMerchantBank", ex.Message, RequestAgent);
                return "";
            }
        }

        internal bool IsValidRequestAgent(string senderPhone, string reqAgent, out string imei)
        {
            bool isValid = false;
            try
            {
                PhoneValidator pv = new PhoneValidator();

                if (Channel == "MOBILE_APP")
                {
                    if (string.IsNullOrEmpty(senderPhone))
                    {
                        StatusDesc = "PROVIDE A MERCHANT TELEPHONE";
                    }
                    else if (!pv.PhoneNumbersOk(senderPhone))
                    {
                        StatusDesc = "PROVIDE A VALID MERCHANT TELEPHONE";
                    }
                    else
                    {
                        senderPhone = PhoneValidator.GetIntlFormat(senderPhone);
                        List<KeyValuePair> valuePair = GetRequestAgents(senderPhone);
                        if (valuePair.Count != 0)
                        {
                            if (RequestAgent == valuePair[0].Value)
                            {
                                isValid = true;
                            }
                            else
                            {
                                StatusDesc = "AGENT DETAIL MISMATCH " + RequestAgent + "#" + valuePair[0].Key.ToUpper();
                            }
                        }
                        else
                        {
                            PostResponse resp = new PostResponse();
                            resp = GetUserByPhone(senderPhone);

                            if (resp.StatusCode.Equals("0"))
                            {
                                bool saved = SaveNewRequesAgent(senderPhone, reqAgent, resp.Customer.MerchantId);
                                if (saved)
                                {
                                    isValid = true;
                                }
                                else
                                {
                                    StatusDesc = "UNABLE TO COMPLETE INTERNAL OPERATION. PLEASE TRY AGAIN LATER";
                                }

                            }
                            else
                            {
                                StatusDesc = "ACCESS DENIED FOR:" + senderPhone;
                            }
                        }
                    }
                }
                else
                {
                    isValid = true;
                }
            }
            catch (Exception ee)
            {
                logger.LogSystemExceptions("ValidChannelCredentials", ee.Message, RequestAgent);
            }
            imei = RequestAgent;
            return isValid;
        }

        internal bool IsValidTransactionType(string tranType)
        {
            bool isValid = false;
            try
            {
                List<KeyValuePair> transactionTypes = GetTransactionTypes(tranType);
                if (transactionTypes.Count == 1)
                {
                    if (tranType == transactionTypes[0].Value)
                        isValid = true;
                }
                else
                {
                    StatusDesc = "SPECIFIED TRANSACTION TYPE NOT SUPPORTED";
                }
            }
            catch (Exception ee)
            {
                StatusDesc = "GENERAL ERROR AT PEGPAY";
                logger.LogSystemExceptions("IsValidTransactionType", ee.Message, RequestAgent);
            }
            return isValid;
        }

        #endregion

        #region GET DATA

        internal List<KeyValuePair> GetIdTypes(string OwnerIdType)
        {
            List<KeyValuePair> idTypes = new List<KeyValuePair>();

            return idTypes;
        }

        internal Customer GetCustomerByUserId(string UserId)
        {
            Customer customer = new Customer();
            try
            {
                DataTable table = dataLogic.GetUserbyId(UserId);
                if (table.Rows.Count == 1)
                {
                    customer = GetCustomer(table.Rows[0]);
                    customer.StatusCode = "0";
                }
                else
                {
                    customer.StatusCode = "100";
                    customer.StatusDesc = "USER NOT FOUND";
                }
            }
            catch (Exception ee)
            {
                logger.LogSystemExceptions("GetCustomerByUserId", ee.Message, RequestAgent);
            }
            return customer;
        }

        private Customer GetCustomer(DataRow drow)
        {
            Customer customer = new Customer();

            customer.MerchantId = getRowValue(drow, "MerchantId");
            customer.FirstName = getRowValue(drow, "FirstName");
            customer.OtherNames = getRowValue(drow, "OtherName") + " " + getRowValue(drow, "LastName");
            customer.FullName = customer.FirstName + " " + customer.OtherNames;
            customer.Gender = getRowValue(drow, "Gender");
            customer.AccountNumber = getRowValue(drow, "AccNumber");
            string active = getRowValue(drow, "Active");
            customer.Active = active.ToLower();// == "true") ? true : false;
            customer.UserLevel = getRowValue(drow, "UserLevel");
            customer.OwnerTelephone = getRowValue(drow, "PhoneNumber");
            customer.UserId = getRowValue(drow, "CustomerId");
            customer.Password = getRowValue(drow, "Pin");
            customer.RunningBalance = getRowValue(drow, "AccBalance");
            customer.CustomerType = getRowValue(drow, "IsReferenced");

            return customer;
        }

        internal List<Customer> GetAccountUsers(string merchantId)
        {
            List<Customer> customerList = new List<Customer>();
            try
            {
                DataTable table = dataLogic.GetAccountUsers(merchantId);
                if (dataLogic.StatusCode.Equals("0"))
                {
                    foreach (DataRow drow in table.Rows)
                    {
                        Customer customer = new Customer();
                        customer = GetCustomer(drow);

                        customerList.Add(customer);
                    }
                }
                else
                {
                    StatusCode = dataLogic.StatusCode;
                    StatusDesc = dataLogic.StatusDesc;
                }
            }
            catch (Exception ee)
            {
                logger.LogSystemExceptions("GetAccountUsers", ee.Message, RequestAgent);
            }
            return customerList;
        }

        internal string GetMerchantAccount(string merchantId)
        {
            string accountNumber = "";
            try
            {
                List<Customer> cust = GetMerchant(merchantId);
                if (cust.Count == 1)
                {
                    StatusCode = "0";
                    accountNumber = cust[0].AccountNumber;
                }
                else
                {
                    StatusCode = "100";
                    StatusDesc = "COULD NOT FIND MERCHANT ACCOUNT. DO CONTACT PEGASUS FOR ASSISTANCE";
                }
            }
            catch (Exception ex)
            {
                logger.LogSystemExceptions("GetMerchantAccount", ex.Message, RequestAgent);
                throw ex;
            }
            return accountNumber;
        }

        public PostResponse GetMerchantMiniStatement(SearchFilters request)
        {
            PostResponse resp = new PostResponse();
            try
            {
                DataTable table = dataLogic.GetMerchantMiniTransactions(request);
                List<MerchantTransaction> merchantTransactions = new List<MerchantTransaction>();
                foreach (DataRow drow in table.Rows)
                {
                    MerchantTransaction trans = new MerchantTransaction();
                    trans = GetMerchantTransaction(drow);

                    merchantTransactions.Add(trans);
                }

                if (merchantTransactions.Count > 0)
                {
                    resp.StatusCode = "0";
                    resp.StatusDesc = "Success";
                    resp.MerchantTrans = merchantTransactions;
                    resp.MerchantTrans = merchantTransactions;
                }
                else
                {
                    resp.StatusCode = "100";
                    resp.StatusDesc = "NO DATA FOUND";
                }
                PostResponse respo = GetMerchantDetails(request.MerchantId);
                if (respo.StatusCode == "0")
                {
                    resp.RunningBalance = respo.Customer.RunningBalance;
                }
                else
                {
                    resp.RunningBalance = "0";
                }
            }
            catch (Exception ee)
            {
            }
            return resp;
        }

        public PostResponse GetMerchantStatement(SearchFilters request)
        {
            PostResponse resp = new PostResponse();
            try
            {

                DataTable table = dataLogic.GetMerchantTransactions(request);
                List<MerchantTransaction> merchantTransactions = new List<MerchantTransaction>();
                foreach (DataRow drow in table.Rows)
                {
                    MerchantTransaction trans = new MerchantTransaction();
                    trans = GetMerchantTransaction(drow);

                    merchantTransactions.Add(trans);
                }

                if (merchantTransactions.Count > 0)
                {
                    resp.StatusCode = "0";
                    resp.StatusDesc = "Success";
                    resp.MerchantTrans = merchantTransactions;
                    resp.MerchantTrans = merchantTransactions;
                }
                else
                {
                    resp.StatusCode = "100";
                    resp.StatusDesc = "No data found";
                }
                PostResponse respo = GetMerchantDetails(request.MerchantId);
                if (respo.StatusCode == "0")
                {
                    resp.RunningBalance = respo.Customer.RunningBalance;
                }
                else
                {
                    resp.RunningBalance = "0";
                }

            }
            catch (Exception ee)
            {
            }
            return resp;
        }

        public PostResponse GetAvailableBouquets(SearchFilters filter)
        {
            PostResponse resp = new PostResponse();
            try
            {
                UtilityHandler uhandler = new UtilityHandler();
                resp = uhandler.GetAvailablePayTvBouquets(filter.Utility);
            }
            catch (Exception ex)
            {
                logger.LogSystemExceptions("GetAvailableBouquets", ex.Message, RequestAgent);
            }
            return resp;
        }

        public PostResponse GetCustomerDetails(SearchFilters request)
        {
            PostResponse resp = new PostResponse();
            try
            {
                UtilityHandler uhandler = new UtilityHandler();
                if (request.Utility.Contains("SENDMONEY"))
                {
                    resp = uhandler.GetPhoneNumberDetails(request.ReferenceId);
                }
                else
                {
                    resp = uhandler.QueryCustomerDetails(request.Utility,
                        request.ReferenceId, request.Medium);
                }              
            }
            catch (Exception ee)
            {
                logger.LogSystemExceptions("GetCustomerDetails", ee.Message, RequestAgent);
            }
            return resp;
        }

        internal List<string> GetChannels(string Channel, string requestSender)
        {
            List<string> channels = new List<string>();
            try
            {
                DataTable table = dataLogic.GetTransactionChannels(Channel, requestSender);
                foreach (DataRow drow in table.Rows)
                {
                    channels.Add(drow["channel"].ToString());
                }
            }
            catch (Exception ee)
            {
                logger.LogSystemExceptions("GetChannels", ee.Message, requestSender);
                throw ee;
            }
            return channels;
        }

        public PostResponse GetMerchantDetails(string MerchantId)
        {
            PostResponse resp = new PostResponse();
            try
            {
                List<Customer> customerList = GetMerchant(MerchantId);
                if (customerList.Count == 1)
                {
                    resp.Customer = customerList[0];
                }
                resp.StatusCode = customerList[0].StatusCode;
                resp.StatusDesc = customerList[0].StatusDesc;
            }
            catch (Exception ee)
            {
                resp.StatusCode = "100";
                resp.StatusDesc = "GENERAL ERROR AT PEGPAY";
                logger.LogSystemExceptions("IsValidTransactionType", ee.Message, RequestAgent);
            }
            return resp;
        }

        internal List<Customer> GetMerchant(string merchantId)
        {
            Customer customer = new Customer();
            List<Customer> customers = new List<Customer>();
            try
            {
                string[] parameters ={ merchantId };
                DataTable dt = dhandler.ExecuteDataSet("GetMerchantDetails", parameters).Tables[0];
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
            catch (Exception ee)
            {
                throw ee;
            }
            return customers;
        }

        private string getRowValue(DataRow drow, string columnName)
        {
            string value = "";
            try
            {
                value = drow[columnName].ToString();
            }
            catch (Exception ee)
            {
                logger.LogSystemExceptions("getRowValue", ee.Message, RequestAgent);
            }
            return value;
        }

        private MerchantTransaction GetMerchantTransaction(DataRow drow)
        {
            MerchantTransaction trans = new MerchantTransaction();
            trans.TranId = getRowValue(drow, "TransNo");
            trans.CoreMerchantId = getRowValue(drow, "CoreBankingId");
            trans.ThirdPartyId = getRowValue(drow, "Token");
            trans.PegPayId = getRowValue(drow, "PegpaySystemId");
            trans.AccountFrom = getRowValue(drow, "AccountFrom");
            trans.AccountTo = getRowValue(drow, "AccountTo");
            trans.Amount = getRowValue(drow, "TranAmount");
            trans.Area = getRowValue(drow, "Area");
            trans.Channel = getRowValue(drow, "Channel");
            trans.Charge = getRowValue(drow, "Charge");
            trans.CreatedBy = getRowValue(drow, "CreatedBy");
            trans.PaymentType = getRowValue(drow, "PaymentType");
            trans.TranType = getRowValue(drow, "TranType");
            trans.CustName = getRowValue(drow, "CustomerName");
            trans.CustRef = getRowValue(drow, "CustomerRef");
            trans.CustTel = getRowValue(drow, "CustomerTel");
            trans.MerchantId = getRowValue(drow, "MerchantId");
            trans.Narration = getRowValue(drow, "TranNarration");
            trans.PaymentDate = getRowValue(drow, "PaymentDate");
            trans.PhoneImei = getRowValue(drow, "PhoneImei");
            trans.StatusCode = getRowValue(drow, "Status");
            trans.StatusDesc = getRowValue(drow, "Reason");

            if (trans.StatusCode == "S" || trans.StatusCode.ToUpper() == "SUCCESS")
            {
                trans.StatusDesc = "SUCCESS";
            }
            else
            {
                trans.StatusDesc = trans.StatusDesc.ToUpper();
            }
            trans.TranType = getRowValue(drow, "TranType");
            trans.Utility = getRowValue(drow, "UtilityCode");
            return trans;
        }

        internal List<MerchantTransaction> GetTransactions(string MerchantId, string TransactionId)
        {
            List<MerchantTransaction> tranList = new List<MerchantTransaction>();
            try
            {
                DataTable table = dataLogic.GetTransactionsById(MerchantId, TransactionId);
                if (table.Rows.Count > 0)
                {
                    foreach (DataRow drow in table.Rows)
                    {
                        MerchantTransaction trans = new MerchantTransaction();
                        trans = GetMerchantTransaction(drow);
                        tranList.Add(trans);
                    }
                }
            }
            catch (Exception ee)
            {
                logger.LogSystemExceptions("GetTransactions", ee.Message, RequestAgent);
            }
            return tranList;
        }

        internal List<KeyValuePair> GetTransactionChannels(string TranType, string data)
        {
            List<KeyValuePair> tranTypes = new List<KeyValuePair>();
            try
            {
                DataTable table = dataLogic.GetTransactionChannels(TranType, RequestAgent);
                foreach (DataRow drow in table.Rows)
                {
                    KeyValuePair pair = new KeyValuePair();
                    pair.Key = getRowValue(drow, "transactionCode");
                    pair.Value = getRowValue(drow, "transactionDescription");

                    tranTypes.Add(pair);
                }
            }
            catch (Exception ee)
            {
                logger.LogSystemExceptions("GetTransactionChannels", ee.Message, RequestAgent);
                throw ee;
            }
            return tranTypes;
        }

        internal List<KeyValuePair> GetTransactionTypes(string TranType)
        {
            List<KeyValuePair> tranTypes = new List<KeyValuePair>();
            try
            {
                DataTable table = dataLogic.GetTransactionTypes(TranType);
                foreach (DataRow drow in table.Rows)
                {
                    KeyValuePair pair = new KeyValuePair();
                    pair.Key = getRowValue(drow, "id");
                    pair.Value = getRowValue(drow, "TransactionType");

                    tranTypes.Add(pair);
                }
            }
            catch (Exception ee)
            {
                logger.LogSystemExceptions("GetTransactionTypes", ee.Message, RequestAgent);
                throw ee;
            }
            return tranTypes;
        }

        public static string GetPassword(string password)
        {
            using (MD5 md5Hash = MD5.Create())
            {
                Random ran = new Random();
                password = GetMd5Hash(md5Hash, password);
            }
            return password;
        }

        internal List<KeyValuePair> GetPaymentTypes(string paymentType)
        {
            List<KeyValuePair> tranTypes = new List<KeyValuePair>();
            try
            {
                DataTable table = dataLogic.GetPaymentTypes(paymentType);
                foreach (DataRow drow in table.Rows)
                {
                    KeyValuePair pair = new KeyValuePair();
                    pair.Key = getRowValue(drow, "PaymentCode");
                    pair.Value = getRowValue(drow, "PaymentType");

                    tranTypes.Add(pair);
                }
            }
            catch (Exception ee)
            {
                logger.LogSystemExceptions("GetPaymentTypes", ee.Message, RequestAgent);
                throw ee;
            }
            return tranTypes;
        }

        internal List<KeyValuePair> GetRequestAgents(string requestAgent)
        {
            List<KeyValuePair> requestAgents = new List<KeyValuePair>();
            try
            {
                DataTable table = dataLogic.GetRequestAgents(requestAgent);
                foreach (DataRow drow in table.Rows)
                {
                    KeyValuePair pairs = new KeyValuePair();
                    pairs.Key = getRowValue(drow, "Phone");
                    pairs.Value = getRowValue(drow, "PhoneImei");
                    requestAgents.Add(pairs);
                }
            }
            catch (Exception ee)
            {
                logger.LogSystemExceptions("GetRequestAgents", ee.Message, requestAgent);
            }
            return requestAgents;
        }

        private static string GetMd5Hash(MD5 md5Hash, string input)
        {
            byte[] data = md5Hash.ComputeHash(Encoding.UTF8.GetBytes(input));
            StringBuilder sBuilder = new StringBuilder();
            for (int i = 0; i < data.Length; i++)
            {
                sBuilder.Append(data[i].ToString("x2"));
            }
            return sBuilder.ToString();
        }

        public PostResponse GetUserByPhone(string userPhone)
        {
            PostResponse resp = new PostResponse();
            try
            {
                Customer cust = new Customer();

                string phone = userPhone;
                if (Channel != "POS")
                {
                    phone = PhoneValidator.GetIntlFormat(phone);
                }

                string[] parameters ={ phone };

                cust = dataLogic.GetUserByPhone(parameters);
                resp.Customer = cust;
                resp.StatusCode = cust.StatusCode;
                resp.StatusDesc = cust.StatusDesc;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return resp;
        }

        #endregion

        #region SOME OPERATION BEING DONE

        internal bool AlreadyHasAUser(string merchantId)
        {
            int number = 0;
            bool isvalid = true;
            ChannelLogic logic = new ChannelLogic(RequestAgent, Channel);
            try
            {
                number = GetAccountUsers(merchantId).Count;
                if (number <= 0)
                {
                    isvalid = false;
                }
                else
                {
                    isvalid = true;
                }
            }
            catch (Exception e)
            {
                logger.LogSystemExceptions("AlreadyHasAUser", e.Message, RequestAgent);
            }
            return isvalid;
        }

        public PostResponse ChangePin(Customer request)
        {
            Customer customer = new Customer();
            PostResponse resp = new PostResponse();
            try
            {
                resp = GetUserByPhone(request.OwnerTelephone);

                string oldPin = resp.Customer.Password;
                request.UserId = resp.Customer.UserId;

                if (oldPin.ToUpper() == request.Password.ToUpper())
                {
                    customer = InitiatePinChange(request);
                    if (customer.StatusCode.Equals("0"))
                    {
                        request.ResetCode = GetPassword(request.ResetCode);
                        if (request.ResetCode.ToUpper() == customer.Password.ToUpper())
                        {
                            resp.StatusCode = "0";
                            resp.StatusDesc = "PIN CHANGE SUCCESSFUL";
                        }
                        else
                        {
                            resp.StatusCode = "100";
                            resp.StatusDesc = "UNABLE TO CHANGE PIN";
                        }
                    }
                    else
                    {
                        resp.StatusCode = customer.StatusCode;
                        resp.StatusDesc = customer.StatusDesc;
                    }
                }
                else
                {
                    resp.StatusCode = "100";
                    resp.StatusDesc = "OLD PIN ENTERED IS INCORRECT";
                }
            }
            catch (Exception e)
            {
                logger.LogSystemExceptions("ChangePin", e.Message, RequestAgent);
                resp.StatusCode = customer.StatusCode;
                resp.StatusDesc = customer.StatusDesc;
            }
            return resp;
        }

        public bool IsValidPinChangeRequest(Customer customer)
        {
            if (!IsValidPinFormat(customer.Password))
            {
                StatusCode = "100";
                StatusDesc = "INVALID CURRENT PIN FORMAT";
                return false;
            }
            else if (!IsValidUser(customer))
            {
                return false;
            }
            else if (!IsValidPinFormat(customer.ResetCode))
            {
                StatusCode = "100";
                return false;
            }
            else
            {
                return true;
            }
        }

        private bool IsValidUser(Customer customer)
        {
            PostResponse resp = new PostResponse();
            resp = UserLogin(customer);
            if (resp.StatusCode == "0")
            {
                return true;
            }
            else
            {
                StatusCode = resp.StatusCode;
                StatusDesc = resp.StatusDesc;
                return false;
            }
        }

        private bool IsValidPinFormat(string pin)
        {
            if (string.IsNullOrEmpty(pin))
            {
                StatusCode = "100";
                StatusDesc = "NO PIN SUPPLIED";
                return false;
            }
            else if (!isDigitOnly(pin) || pin.Length != 4)
            {
                StatusCode = "100";
                StatusDesc = "PIN SHOULD BE A 4 DIGIT NUMBER";
                return false;
            }
            else
            {
                return true;
            }
        }

        private bool isDigitOnly(string value)
        {
            try
            {
                foreach (char c in value)
                {
                    if (c < '0' || c > '9')
                        return false;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return true;
        }

        internal Customer InitiatePinChange(Customer request)
        {
            Customer customer = new Customer();
            try
            {
                PhoneValidator pv = new PhoneValidator();
                string phone = pv.FormatNumber(request.OwnerTelephone);
                request.OwnerTelephone = "256" + phone;

                string hashedPin = GetPassword(request.ResetCode);
                string[] data ={ request.UserId, request.Password, hashedPin.ToUpper(), request.OwnerTelephone };

                customer = dataLogic.UpdatePin(data);
            }
            catch (Exception e)
            {
                logger.LogSystemExceptions("InitiatePinChange", e.Message, RequestAgent);
                customer.StatusCode = "100";
                customer.StatusDesc = "PIN CHANGE FAILED";
            }
            return customer;
        }

        private bool SaveNewRequesAgent(string senderPhone, string requestAgent, string merchantid)
        {
            bool isSaved = false;
            try
            {
                object[] data = { senderPhone, requestAgent, merchantid };
                isSaved = dataLogic.UpdateRequestAgent(data);
            }
            catch (Exception ex)
            {
                logger.LogSystemExceptions("SaveNewRequesAgent", ex.Message, RequestAgent);
                throw ex;
            }
            return isSaved;
        }

        public PostResponse LogTransaction(MerchantTransaction transaction)
        {
            PostResponse resp = new PostResponse();
            try
            {
                DataTable table = new DataTable();
                table = dataLogic.LogMerchantTransaction(transaction);
                if (table.Rows.Count == 1)
                {
                    resp = GetLogResponse(table);
                }
                else
                {
                    resp.StatusCode = "100";
                    resp.StatusDesc = "FAILED";
                }
            }
            catch (Exception ee)
            {
                resp.StatusCode = "100";
                resp.StatusDesc = "System Error " + transaction.PaymentDate;
                logger.LogSystemExceptions("LogTransaction", ee.Message, RequestAgent);
            }
            return resp;
        }

        private PostResponse GetLogResponse(DataTable table)
        {
            PostResponse resp = new PostResponse();
            try
            {
                DataRow drow = table.Rows[0];
                string dateDiff = getRowValue(drow, "TimeDiff");
                string pegpayId = getRowValue(drow, "PegpayId");
                int minutes = 0;
                Int32.TryParse(dateDiff, out minutes);
                if (minutes >= 10)
                {
                    resp.StatusCode = "0";
                    resp.StatusDesc = "PENDING";
                    resp.RequestId = pegpayId;
                }
                else
                {
                    resp.StatusCode = "0";
                    resp.StatusDesc = "SUSPECTED DOUBLE POSTING";
                    dataLogic.MoveTransactionToFailedTransactionIfExists(pegpayId);
                }
            }
            catch (Exception ex)
            {    
                throw ex;
            }
            return resp;
        }

        public int LogXmlRequest(string requestAgent, string channel, string transactionId, string request)
        {
            int requestId = -1;
            try
            {
                requestId = logger.LogSystemRequest(requestAgent, channel, transactionId, request);
            }
            catch (Exception ee)
            {
                logger.LogSystemExceptions("LogXmlRequest", ee.Message, RequestAgent);
            }
            return requestId;
        }

        internal PostResponse RegisterMerchantUser(Customer request)
        {
            PostResponse resp = new PostResponse();
            try
            {
                request.Password = GetPassword(request.Password);

                string accountTime = DateTime.Now.ToString("yyyyMMddHHmm");
                DataTable table = dataLogic.RegisterMerchant(request.BusinessEmail, request.Password, request.FirstName, request.OtherNames, request.UserLevel, request.BusinessName, request.OwnerTelephone, request.BusinessTelephone, request.BusinessEmail, request.RequestAgent, request.BusinessAddress, request.BusinessLicence, request.OwnerImage, request.OwnerIdType, request.OwnerIdImage, request.OwnerIdNumber, request.Gender, request.CustomerType, request.MerchantId, accountTime);
                if (table.Rows.Count > 0)
                {
                    DataRow drow = table.Rows[0];
                    resp.StatusCode = "0";
                    resp.StatusDesc = "SUCCESS";
                    resp.MerchantId = getRowValue(drow, "MerchantId");
                    resp.RequestId = getRowValue(drow, "PegpayId");
                }
                else
                {
                    resp.StatusCode = "100";
                    resp.StatusDesc = "FAILED TO REGISTER CUSTOMER";
                }
            }

            catch (Exception ee)
            {
                resp.StatusCode = "100";
                resp.StatusDesc = "INTERNAL ERROR" + ee.Message;
            }
            return resp;
        }

        internal PostResponse UpdateNotificationStatus(SearchFilters request)
        {
            PostResponse resp = new PostResponse();
            try
            {
                string[] tranIds = request.ReferenceId.Split(new string[] { "#" }, StringSplitOptions.None);
                int count = 0;
                string value = "NOTIFIED";

                foreach (string pegpayId in tranIds)
                {
                    try
                    {
                        bool updated = dataLogic.MarkTransactionAsNotified(pegpayId.Trim(), value);
                        if (updated)
                            count++;
                    }
                    catch (Exception ee)
                    {
                        resp.StatusCode = "0";
                        resp.StatusDesc = "Error " + ee.Message;
                        return resp;
                    }
                }
                if (count > 0)
                {
                    resp.StatusCode = "0";
                    resp.StatusDesc = "SUCCESS " + request.ReferenceId;
                }
                else
                {
                    resp.StatusCode = "100";
                    resp.StatusDesc = "OPERATION FAILED. PLEASE TRY AGAIN # " + request.ReferenceId;
                }
            }
            catch (Exception ee)
            {
                logger.LogSystemExceptions("UpdateNotificationStatus", ee.Message, RequestAgent);
            }
            return resp;
        }

        public PostResponse UserLogin(Customer access)
        {
            PostResponse resp = new PostResponse();
            try
            {
                if (Channel.Equals("MOBILE_APP"))
                {
                    resp = GetUserByPhone(access.Username);
                }
                else
                {
                    resp = GetUserByPhone(access.OwnerTelephone);
                }

                if (resp.StatusCode == "0")
                {
                    Customer customer = resp.Customer;
                    access.Password = GetPassword(access.Password);
                    if (access.Password.ToUpper() == resp.Customer.Password.ToUpper())
                    {
                        resp.StatusCode = "0";
                        resp.StatusDesc = "SUCCESS";
                    }
                    else
                    {
                        resp.StatusCode = "100";
                        resp.StatusDesc = "INVALID CREDENTIALS".ToUpper();
                    }
                }
                else
                {
                    resp.StatusCode = "100";
                    resp.StatusDesc = "USER NOT FOUND";
                }
            }
            catch (Exception ee)
            {
                resp.StatusCode = "100";
                resp.StatusDesc = ee.Message;
                logger.LogSystemExceptions("UserLogin", ee.Message, RequestAgent);
            }
            return resp;
        }

        internal PostResponse LogUserOut(Customer customer)
        {
            PostResponse resp = new PostResponse();
            try
            {
                bool loggedOut = dataLogic.LogUserInOrOut(customer.UserId, "0");
                if (loggedOut)
                {
                    resp.StatusCode = "0";
                    resp.StatusDesc = "SUCCESS";
                }
                else
                {
                    resp.StatusCode = "100";
                    resp.StatusDesc = "USER LOGOUT FAILED";
                }
            }
            catch (Exception ee)
            {
                logger.LogSystemExceptions("LogUserOut", ee.Message, RequestAgent);
            }
            return resp;
        }

        #endregion

        private static bool RemoteCertificateValidation(Object sender, X509Certificate certificate, X509Chain chain, SslPolicyErrors sslPolicyErrors)
        {
            return true;
        }

        public PostResponse GetMerchantCustomer(SearchFilters filter)
        {
            PostResponse resp = new PostResponse();
            try
            {
                if (filter.MerchantId == "100058" || filter.MerchantId == "100060")
                {
                    UtilityHandler uh = new UtilityHandler();
                    resp = uh.QueryCustomerDetails("TUCKSEE", filter.ReferenceId, "");
                }
                else
                {
                    List<Customer> customerList = GetMerchantCustomerDetails(filter.ReferenceId, filter.MerchantId);
                    if (customerList.Count == 1)
                    {
                        resp.Customer = customerList[0];
                    }
                    resp.StatusCode = customerList[0].StatusCode;
                    resp.StatusDesc = customerList[0].StatusDesc;
                }
            }
            catch (Exception ee)
            {
                resp.StatusCode = "100";
                resp.StatusDesc = "GENERAL ERROR AT PEGPAY";
                logger.LogSystemExceptions("IsValidTransactionType", ee.Message, RequestAgent);
            }
            return resp;
        }

        private List<Customer> GetMerchantCustomerDetails(string reference, string merchantid)
        {
            Customer customer = new Customer();
            List<Customer> customers = new List<Customer>();
            try
            {
                string[] parameters ={ merchantid, reference };
                DataTable dt = dhandler.ExecuteDataSet("GetMerchantUSSDCustomerDetails", parameters).Tables[0];
                if (dt.Rows.Count > 0)
                {
                    string status = dt.Rows[0]["IsActive"].ToString();
                    bool active = bool.Parse(status);
                    if (active)
                    {
                        customer.MerchantId = dt.Rows[0]["AccountCode"].ToString();
                        customer.FullName = dt.Rows[0]["CustomerName"].ToString();
                        customer.UserId = dt.Rows[0]["CustomerRef"].ToString();
                        customer.Active = status.ToLower();
                        customer.OwnerTelephone = dt.Rows[0]["CustomerTel"].ToString();
                        customer.StatusCode = "0";
                        customer.StatusDesc = "SUCCESS";
                    }
                    else
                    {
                        customer.StatusCode = "100";
                        customer.StatusDesc = "INACTIVE CUSTOMER";
                    }

                    customers.Add(customer);
                }
                else
                {
                    customer.StatusCode = "100";
                    customer.StatusDesc = "CUSTOMER NOT FOUND";
                    customers.Add(customer);
                }

            }
            catch (Exception ee)
            {
                throw ee;
            }
            return customers;
        }

        public PostResponse GetTransactionDetails(SearchFilters filters)
        {
            PostResponse resp = new PostResponse();
            DataTable table = dataLogic.GetTranDetails(filters.ReferenceId, filters.MerchantId, filters.RequestAgent);
            if (table.Rows.Count > 0)
            {
                MerchantTransaction trans = GetMerchantTransaction(table.Rows[0]);
                resp.MerchantTransaction = trans;
                resp.StatusCode = "0";
                resp.StatusDesc = "SUCCESS";
                
            }
            else
            {
                resp.StatusCode = "100";
                resp.StatusDesc = "TRANSACTION NOT FOUND";
            }
            return resp;
        }


        public PostResponse ProcessWallet2Wallet(MerchantTransaction transaction)
        {
            PostResponse resp = new PostResponse();
            try
            {
                MerchantTransaction wallet2bank = new MerchantTransaction();
                MerchantTransaction bank2wallet = new MerchantTransaction();
                wallet2bank = GetWallet2WalletInstance(transaction, "W2B");
                bank2wallet = GetWallet2WalletInstance(transaction, "B2W");

                DataTable table = new DataTable();
                table = dataLogic.LogMerchantTransaction(wallet2bank);
                if (table.Rows.Count == 1)
                {
                    resp = GetLogResponse(table);
                    bank2wallet.TranId = resp.RequestId;
                    table = dataLogic.LogMerchantTransaction(bank2wallet);
                    if (table.Rows.Count == 1)
                    {
                        resp = GetLogResponse(table);
                    }
                }
                else
                {
                    resp.StatusCode = "100";
                    resp.StatusDesc = "FAILED";
                }
            }
            catch (Exception ee)
            {
                resp.StatusCode = "100";
                resp.StatusDesc = "System Error " + transaction.PaymentDate;
                logger.LogSystemExceptions("LogTransaction", ee.Message, RequestAgent);
            }
            return resp;
        }

        private MerchantTransaction GetWallet2WalletInstance(MerchantTransaction txn, string type)
        {
            MerchantTransaction tran = new MerchantTransaction();
            tran = GetTranValues(txn);
            
            if (type.ToUpper().Equals("W2B"))
            {
                tran.AccountTo = GetMerchantAccount(tran.MerchantId);
                tran.TranType = "TOPUP";
                tran.Narration = tran.TranType + "-(W2W)-" + tran.AccountFrom;
                tran.Utility = txn.TranType;
            }
            else if (type.ToUpper().Equals("B2W"))
            {
                tran.AccountFrom = GetMerchantAccount(tran.MerchantId);
                tran.TranType = "SENDMONEY";
                tran.Narration = tran.TranType + "-(W2W)-" + tran.AccountTo;
                tran.PaymentType = "PEGPAY";
                tran.Utility = txn.TranType;
            }
            else
            {
                //unknown
            }
            return tran;
        }

        private static MerchantTransaction GetTranValues(MerchantTransaction txn)
        {
            MerchantTransaction trans = new MerchantTransaction();
            trans.CustRef = txn.CustRef;
            trans.CustName = txn.CustName;
            trans.CustTel = txn.CustTel;
            trans.Area = txn.Area;
            trans.Channel = txn.Channel;
            trans.RequestAgent = txn.RequestAgent;
            trans.Amount = txn.Amount;
            trans.Charge = txn.Charge;
            trans.AccountFrom = txn.AccountFrom;
            trans.AccountTo = txn.AccountTo;
            trans.PaymentType = txn.PaymentType;
            trans.VisaCVC = txn.VisaCVC;
            trans.VisaExpiryMonth = txn.VisaExpiryMonth;
            trans.VisaExpiryYear = txn.VisaExpiryYear;
            trans.TranType = txn.TranType;
            trans.Utility = txn.Utility;
            trans.Narration = txn.Narration;
            trans.PaymentDate = txn.PaymentDate;
            trans.RequestAgent = txn.RequestAgent;
            trans.DigitalSignature = txn.DigitalSignature;
            trans.MerchantId = txn.MerchantId;
            return trans;
        }

        private static T Clone<T>(T obj)
        {
            using (MemoryStream stream = new MemoryStream())
            {
                BinaryFormatter formatter = new BinaryFormatter ();
                formatter.Serialize(stream, obj);
                stream.Position = 0;

                return (T)formatter.Deserialize(stream);
            }
        }
    }
}
