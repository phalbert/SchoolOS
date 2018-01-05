using System;
using System.Collections.Generic;
using System.Text;
using System.Security.Cryptography;
using System.Security.Cryptography.X509Certificates;
using CoreBankingLogic.Utilities;
using CoreBankingLogic.ChannelObjects;
using System.Net.Security;
using CoreBankingLogic.ExposedObjects.ChannelObjects;
using System.Data;

namespace CoreBankingLogic.ChannelControls
{
    public class UtilityHandler
    {
        PegPay pegpay = new PegPay();
        string apiUname = "";
        string apiPword = "";

        public string EncryptString(string ClearText)
        {
            string ret = "";
            ret = Encryption.encrypt.EncryptString(ClearText, "Umeme2501PegPay");
            return ret;
        }

        public string DecryptString(string Encrypted)
        {
            string ret = "";
            string pword = EncryptString("stan_counter");
            ret = Encryption.encrypt.DecryptString(Encrypted, "Umeme2501PegPay");
            return ret;
        }

        public PostResponse QueryCustomerDetails(string utilityCode, string custRef, string area)
        {
            PostResponse response = new PostResponse();
            try
            {
                DatabaseHandler dh = new DatabaseHandler();
                DataTable vendor = dh.GetVendorDetails("UTILITY");

                if (vendor.Rows.Count != 0)
                {
                    string encVendorPassword = vendor.Rows[0]["ApiPassword"].ToString();
                    apiUname = vendor.Rows[0]["ApiUsername"].ToString();
                    apiPword = DecryptString(encVendorPassword);
                }

                QueryRequest request = new QueryRequest();

                request.QueryField1 = custRef;
                request.QueryField2 = area;
                request.QueryField4 = utilityCode;
                request.QueryField5 = apiUname;
                request.QueryField6 = apiPword;

                System.Net.ServicePointManager.ServerCertificateValidationCallback = RemoteCertificateValidation;
                Utilities.Response resp = pegpay.QueryCustomerDetails(request);

                if (resp == null)
                {
                    response.StatusCode = "100";
                    response.StatusDesc = "ERROR IN COMMUNICATION COMPLETION";
                }
                else if (resp.ResponseField6 == "0")
                {
                    Customer customer = new Customer();
                    customer.UserId = resp.ResponseField1;
                    customer.FullName = resp.ResponseField2;
                    customer.RunningBalance = resp.ResponseField4;
                    customer.CustomerType = resp.ResponseField5;
                    customer.Area = resp.ResponseField8;
                    

                    response.Customer = customer;
                    response.StatusCode = "0";
                    response.StatusDesc = "SUCCESS";
                }
                else
                {
                    response.StatusCode = resp.ResponseField6;
                    response.StatusDesc = resp.ResponseField7;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return response;
        }

        internal PostResponse GetAvailablePayTvBouquets(string utilityCode)
        {
            PostResponse response = new PostResponse();
            try
            {
                QueryRequest request = new QueryRequest();
                request.QueryField1 = "";
                request.QueryField4 = utilityCode;
                request.QueryField5 = apiUname;
                request.QueryField6 = apiPword;

                System.Net.ServicePointManager.ServerCertificateValidationCallback = RemoteCertificateValidation;
                Utilities.BouquetDetails[] boqDetails = pegpay.GetPayTVBouquetDetails(request);
                if (boqDetails == null)
                {
                    response.StatusCode = "100";
                    response.StatusDesc = "ERROR IN COMMUNICATION COMPLETION";
                }
                if (boqDetails.Length > 0)
                {
                    List<KeyValuePair> merchList = new List<KeyValuePair>();
                    foreach (BouquetDetails resp in boqDetails)
                    {
                        KeyValuePair mresp = new KeyValuePair();
                        mresp.Key = resp.BouquetCode;
                        mresp.Value = resp.BouquetName;
                        merchList.Add(mresp);
                    }
                    response.StatusCode = "0";
                    response.StatusDesc = "SUCCESS";
                    response.ValuePair = merchList;
                }
                else
                {
                    response.StatusCode = "100";
                    response.StatusDesc = "SYSTEM NOT MATCHING BOUQUETS";
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return response;
        }

        internal PostResponse PostUtilityTransaction(MerchantTransaction request)
        {
            PostResponse response = new PostResponse();
            Utilities.TransactionRequest trans = new Utilities.TransactionRequest();
            try
            {
                trans.PostField1 = request.CustRef;//"2017607397";
                trans.PostField2 = request.CustName;//"DISON";
                trans.PostField3 = request.Area;
                trans.PostField4 = request.Utility;
                trans.PostField5 = DateTime.Today.ToString("dd/MM/yyyy"); ;
                trans.PostField7 = request.Amount;
                trans.PostField8 = request.TranType;
                trans.PostField9 = request.Channel;
                trans.PostField10 = request.Password;
                trans.PostField11 = request.CustTel;
                trans.PostField12 = "0";
                trans.PostField13 = "";
                trans.PostField14 = request.CreatedBy;
                trans.PostField15 = "0";
                trans.PostField17 = "";
                trans.PostField18 = "Merchant Payment";
                trans.PostField19 = "";

                string dataToSign = trans.PostField1 +
                    trans.PostField2 +
                        trans.PostField11 +
                        trans.PostField20 +
                        trans.PostField9 +
                        trans.PostField10 +
                        trans.PostField5 +
                        trans.PostField14 +
                        trans.PostField7 +
                        trans.PostField18 +
                        trans.PostField8;

                trans.PostField16 = SignCertificate2(dataToSign);

                System.Net.ServicePointManager.ServerCertificateValidationCallback = RemoteCertificateValidation;
                Utilities.Response resp = pegpay.PrepaidVendorPostTransaction(trans);
                if (resp == null)
                {
                    response.StatusCode = "100";
                    response.StatusDesc = "ERROR IN COMMUNICATION COMPLETION";
                }
                else if (resp.ResponseField6 == "0")
                {
                    response.RequestId = resp.ResponseField8;
                    response.StatusCode = "0";
                    response.StatusDesc = resp.ResponseField8;
                }
                else if (resp.ResponseField6 == "1000")
                {
                    response.RequestId = resp.ResponseField8;
                    response.StatusCode = "10";
                    response.StatusDesc = "PENDING";
                }
                else
                {
                    response.StatusCode = resp.ResponseField6;
                    response.StatusDesc = resp.ResponseField7;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return response;
        }

        private string SignCertificate(string text)
        {
            string certificate = @"E:\Certificates\Pegpay-AirtelMoney.pfx";
            X509Certificate2 cert = new X509Certificate2(certificate, "Tingate710", X509KeyStorageFlags.MachineKeySet);
            RSACryptoServiceProvider rsa = (RSACryptoServiceProvider)cert.PrivateKey;

            // Hash the data
            MD5 sha1 = MD5.Create();
            ASCIIEncoding encoding = new ASCIIEncoding();
            byte[] data = encoding.GetBytes(text);
            byte[] hash = sha1.ComputeHash(data);

            // Sign the hash
            byte[] digitalCert = rsa.SignHash(hash, CryptoConfig.MapNameToOID("SHA1"));
            string s = hash.ToString();

            string strDigCert = Convert.ToBase64String(digitalCert);
            return strDigCert;
        }

        public PostResponse GetPhoneNumberDetails(string number)
        {
            PostResponse resp = new PostResponse();
            try
            {
                DatabaseHandler dh = new DatabaseHandler();
                DataTable vendor = dh.GetVendorDetails("MOMO");
                string vendorCode = "TEST";
                string password = "47N73TI461";
                if (vendor.Rows.Count != 0)
                {
                    string encVendorPassword = vendor.Rows[0]["ApiPassword"].ToString();
                    vendorCode = vendor.Rows[0]["ApiUsername"].ToString();
                    password = DecryptString(encVendorPassword);
                }

                Telecoms.PegPayTelecomsApi api = new CoreBankingLogic.Telecoms.PegPayTelecomsApi();
                Telecoms.TelephoneNumberDetails details = new CoreBankingLogic.Telecoms.TelephoneNumberDetails();
                string signature = "1234";

                System.Net.ServicePointManager.ServerCertificateValidationCallback = RemoteCertificateValidation;
                details = api.ValidatePhoneNumber(number, vendorCode, password, signature);

                resp.StatusCode = details.Status;
                resp.StatusDesc = details.StatusDescription;
                if (resp.StatusCode == "0")
                {
                    resp.Customer = new Customer();
                    resp.Customer.FullName = details.Name.ToUpper();
                    resp.Customer.OwnerTelephone = details.Telephonenumber;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return resp;
        }

        private static bool RemoteCertificateValidation(Object sender, X509Certificate certificate, X509Chain chain, SslPolicyErrors sslPolicyErrors)
        {
            return true;
        }

        private string SignCertificate2(string text)
        {
            string certificate = @"E:\Certificates\Pegpay-AirtelMoney.pfx";
            X509Certificate2 cert = new X509Certificate2(certificate, "Tingate710", X509KeyStorageFlags.UserKeySet);
            RSACryptoServiceProvider rsa = (RSACryptoServiceProvider)cert.PrivateKey;

            // compute sha1 hash of concatenated string
            SHA1Managed sha1 = new SHA1Managed();
            ASCIIEncoding encoding = new ASCIIEncoding();
            byte[] data = encoding.GetBytes(text);
            byte[] hash = sha1.ComputeHash(data);

            // use RSA to encrypt hash
            byte[] digitalCert = rsa.SignHash(hash, CryptoConfig.MapNameToOID("SHA1"));

            //convert encrypted text into base64 string
            string strDigCert = Convert.ToBase64String(digitalCert);
            return strDigCert;
        }

    }
}
