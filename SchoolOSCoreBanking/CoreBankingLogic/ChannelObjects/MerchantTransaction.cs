using System;
using System.Collections.Generic;
using System.Text;
using CoreBankingLogic.ChannelControls;
using CoreBankingLogic.ExposedObjects.ChannelObjects;
using System.Globalization;
using System.Text.RegularExpressions;

namespace CoreBankingLogic.ChannelObjects
{
    public class MerchantTransaction : Defaults
    {
        Logger logger = new Logger();

        public string AccountFrom = "";
        public string AccountTo = "";
        public string Amount = "";
        public string Area = "";
        public string CustRef = "";
        public string CustName = "";
        public string CustType = "";
        public string CustTel = "";
        public string Charge = "";
        public string CreatedBy = "";
        public string CurrencyCode = "";
        public string DigitalSignature = "";
        public string MerchantId = "";
        public string Narration = "";
        public string Password = "";
        public string TranType = "";
        public string TranId = "";
        public string PaymentDate = "";
        public string PaymentType = "";
        public string PhoneImei = "";
        public string UserLevel = "";
        public string Utility = "";
        public string UserPhone = "";
        public string CoreMerchantId = ""; 

        int BillAmount;
        string activeTranType = "";

        //VISA
        public string VisaExpiryMonth = "";
        public string VisaExpiryYear = "";
        public string VisaCVC = "";
        public string Field4 = "";
        public string Field5 = "";


        private bool TransactionIsValid()
        {
            ChannelLogic bll = new ChannelLogic(RequestAgent, Channel);
            RequestAgent = bll.RequestAgent;

            bool isValid = false;

            if (string.IsNullOrEmpty(RequestAgent))
            {
                StatusCode = "100";
                StatusDesc = "UNKNOWN REQUEST AGENT";
            }
            else if (string.IsNullOrEmpty(DigitalSignature))
            {
                StatusCode = "100";
                StatusDesc = "PROVIDE A DIGITAL SIGNATURE";
            }
            else if (string.IsNullOrEmpty(Channel))
            {
                StatusCode = "100";
                StatusDesc = "PROVIDE A TRANSACTION CHANNEL";
            }
            else if (string.IsNullOrEmpty(ApiUsername))
            {
                StatusCode = "100";
                StatusDesc = "PLEASE PROVIDE A CHANNEL USERNAME";
            }
            else if (string.IsNullOrEmpty(ApiPassword))
            {
                StatusCode = "100";
                StatusDesc = "PLEASE PROVIDE A CHANNEL PASSWORD";
            }
            else if (string.IsNullOrEmpty(TranType))
            {
                StatusCode = "100";
                StatusDesc = "PLEASE PROVIDE A PAYMENT TYPE";
            }
            else if (string.IsNullOrEmpty(PaymentDate))
            {
                StatusCode = "100";
                StatusDesc = "PLEASE PROVIDE A PAYMENT DATE";
            }
            else if (string.IsNullOrEmpty(Amount))
            {
                StatusCode = "100";
                StatusDesc = "PROVIDE A TRANSACTION AMOUNT";
            }
            else if (!Int32.TryParse(Amount, out BillAmount))
            {
                StatusCode = "100";
                StatusDesc = "TRANSACTION AMOUNT IS INVALID";
            }
            else if (BillAmount < 499)
            {
                StatusCode = "100";
                StatusDesc = "MINIMUM REQUIRED AMOUNT IS 500 UGX";
            }
            else if (string.IsNullOrEmpty(TranId))
            {
                StatusCode = "100";
                StatusDesc = "PROVIDE A TRANSACTION ID";
            }
            else if (!bll.IsValidChannel(Channel))
            {
                StatusCode = "100";
                StatusDesc = "UNKNOWN TRANSACTION CHANNEL";
            }
            else if (!bll.IsValidRequestAgent(CustTel, RequestAgent, out PhoneImei))
            {
                StatusCode = "100";
                StatusDesc = bll.StatusDesc;
            }
            else if (!bll.IsValidMerchant(MerchantId))
            {
                StatusCode = "100";
                StatusDesc = bll.StatusDesc;
            }
            else if (!bll.IsValidChannelCredentials(ApiUsername, ApiPassword, Channel))
            {
                StatusCode = "100";
                StatusDesc = bll.StatusDesc;
            }
            //else if (bll.IsDuplicateTransaction(MerchantId, TranId))
            //{
            //    StatusCode = "100";
            //    StatusDesc = bll.StatusDesc;
            //}
            else if (IsValidPaymentType())
            {
                string[] formats = { "dd/MM/yyyy" };
                DateTime date;
                if (DateTime.TryParseExact(PaymentDate, formats, new CultureInfo("en-US"), DateTimeStyles.None, out date))
                {
                    PaymentDate = date.ToString("yyyy-MM-dd");
                }
                if (!bll.HasSufficientFunds(CustTel, Amount) && PaymentType == "PEGPAY")
                {
                    StatusCode = "100";
                    StatusDesc = "INSUFFICIENT FUNDS TO COMPLETE TRANSACTION";
                }
                else
                {
                    isValid = true;
                }
            }
            else
            {
                isValid = false;
                StatusCode = "100";
            }

            return isValid;
        }

        public bool IsValidBillPayment()
        {
            bool isValid = false;
            try
            {
                activeTranType = "PAYBILL";

                if (!TransactionIsValid())
                {
                    StatusCode = "100";
                }
                else if (string.IsNullOrEmpty(CustRef))
                {
                    StatusCode = "100";
                    StatusDesc = "PROVIDE A CUSTOMER REFERENCE";
                }
                else if (TranType != activeTranType)
                {
                    StatusCode = "100";
                    StatusDesc = "INVALID TRANSACTION TYPE";
                }
                else
                {
                    isValid = true;
                }

            }
            catch (Exception ee)
            {
                logger.LogSystemExceptions("IsValidBillPayment", ee.Message, RequestAgent);
            }
            return isValid;
        }

        private bool IsValidPaymentInformation()
        {
            ChannelLogic bll = new ChannelLogic(Channel, RequestAgent);
            RequestAgent = bll.RequestAgent;

            bool isValid = false;
            int month, year, cvc;
            long visaNumber;
            int expDate = DateTime.Now.Year;

            if (PaymentType == "VISA")
            {
                #region VISA VALIDATION
                if (string.IsNullOrEmpty(VisaExpiryMonth))
                {
                    StatusCode = "100";
                    StatusDesc = "PLEASE PROVIDE THE EXPIRY MONTH";
                }
                else if (!Int32.TryParse(VisaExpiryMonth, out month))
                {
                    StatusCode = "100";
                    StatusDesc = "INVALID ENTRY FOR MONTH OF EXPIRY";
                }
                else if (string.IsNullOrEmpty(VisaExpiryYear))
                {
                    StatusCode = "100";
                    StatusDesc = "PLEASE PROVIDE THE EXPIRY YEAR";
                }
                else if (!Int32.TryParse(VisaExpiryYear, out year))
                {
                    StatusCode = "100";
                    StatusDesc = "INVALID ENTRY FOR YEAR OF EXPIRY";
                }
                else if ((month < 1 || month > 12))
                {
                    StatusCode = "100";
                    StatusDesc = "INVALID EXPIRY MONTH";
                }
                else if (year < expDate)
                {
                    StatusCode = "100";
                    StatusDesc = "INVALID EXPIRY DATE";
                }
                else if (string.IsNullOrEmpty(VisaCVC))
                {
                    StatusCode = "100";
                    StatusDesc = "PLEASE PROVIDE THE VISA CARD NUMBER";
                }
                else if (!Int32.TryParse(VisaCVC, out cvc))
                {
                    StatusCode = "100";
                    StatusDesc = "INVALID CARD CVC NUMBER";
                }
                else if (!IsValidCVC(VisaCVC))
                {
                    StatusCode = "100";
                    StatusDesc = "CVC NUMBER SHOULD BE 3 or 4 DIGITS LONG";
                }
                else if (string.IsNullOrEmpty(AccountFrom))
                {
                    StatusCode = "100";
                    StatusDesc = "PLEASE PROVIDE THE VISA ACCOUNT NUMBER";
                }
                else if (!Int64.TryParse(AccountFrom, out visaNumber))
                {
                    StatusCode = "100";
                    StatusDesc = "VISA NUMBER SHOULD CONTAIN ONLY DIGITS";
                }
                else if (!CardValidator.IsValidCardNumber(AccountFrom))
                {
                    StatusCode = "100";
                    StatusDesc = "INVALID CARD NUMBER";
                }
                else
                {
                    isValid = true;
                }
                #endregion
            }
            else if (PaymentType == "PEGPAY")
            {
                #region PEGPAY VALIDATION
                PostResponse resp = new PostResponse();
                string acctNumber = bll.GetMerchantAccount(MerchantId);

                if (!string.IsNullOrEmpty(acctNumber))
                {
                    isValid = true;
                    AccountFrom = acctNumber;
                }
                else
                {
                    isValid = false;
                    VisaCVC = "";
                    StatusCode = "100";
                    StatusDesc = "MERCHANT ACCOUNT COULD NOT BE FOUND FOR " + MerchantId; ;
                }
                #endregion
            }
            else
            {
                #region MOBILE MONEY VALIDATION
                if (string.IsNullOrEmpty(AccountFrom))
                {
                    StatusCode = "100";
                    StatusDesc = "PROVIDE PAYING PHONE NUMBER";
                }
                else
                {
                    PhoneValidator pv = new PhoneValidator();
                    bool phoneOk = pv.PhoneNumbersOk(AccountFrom);
                    string network = pv.GetNetwork(AccountFrom);

                    if (!phoneOk)
                    {
                        StatusCode = "100";
                        StatusDesc = "INVALID PAYING PHONE NUMBER";
                    }
                    else if (!PaymentType.Contains(network))
                    {
                        StatusCode = "100";
                        StatusDesc = "PHONE NUMBER DOES NOT MATCH SELECTED PAYMENT TYPE";
                    }
                    else
                    {
                        isValid = true;
                        AccountFrom = PhoneValidator.GetIntlFormat(AccountFrom);
                    }
                }
                #endregion
            }
            return isValid;
        }

        private bool IsValidCVC(string VisaCVC)
        {
            string pattern = @"^[0-9]{3,4}$";
            bool result = Regex.IsMatch(VisaCVC, pattern);
            return result;
        }

        internal bool IsValidPaymentType()
        {
            ChannelLogic bll = new ChannelLogic(Channel, RequestAgent);
            RequestAgent = bll.RequestAgent;

            bool isValid = false;
            try
            {
                List<KeyValuePair> paymentTypes = bll.GetPaymentTypes(PaymentType);
                if (paymentTypes.Count > 0)
                {
                    isValid = IsValidPaymentInformation();
                }
                else
                {
                    StatusCode = "100";
                    StatusDesc = "UNKNOWN PAYMENT TYPE";
                }
            }
            catch (Exception ee)
            {
                StatusDesc = "GENERAL ERROR AT PEGPAY";
                logger.LogSystemExceptions("IsValidPaymentType", ee.Message, RequestAgent);
            }
            return isValid;
        }

        internal bool IsValidMomoTransaction(string tranType)
        {
            bool isValid = false;
            activeTranType = tranType;

            if (TransactionIsValid())
            {
                PhoneValidator pv = new PhoneValidator();

                if (string.IsNullOrEmpty(CustRef))
                {
                    StatusCode = "100";
                    StatusDesc = "PLEASE PROVIDE A REFERENCE NUMBER";
                }
                else if (string.IsNullOrEmpty(CustTel))
                {
                    StatusCode = "100";
                    StatusDesc = "PLEASE PROVIDE MERCHANT PHONE NUMBER";
                }
                else if (string.IsNullOrEmpty(AccountTo))
                {
                    StatusCode = "100";
                    StatusDesc = "PLEASE PROVIDE RECIEPIENT'S PHONE NUMBER";
                }
                else if (!pv.PhoneNumbersOk(AccountTo))
                {
                    StatusCode = "100";
                    StatusDesc = "INVALID RECEIPIENT PHONE NUMBER";
                }
                else if (!pv.PhoneNumbersOk(CustTel))
                {
                    StatusCode = "100";
                    StatusDesc = "INVALID MERCHANT PHONE NUMBER";
                }
                else if (TranType != activeTranType)
                {
                    StatusCode = "100";
                    StatusDesc = "INVALID TRANSACTION TYPE";
                }
                else if (TranType == "SENDMONEYW2W" && !pv.PhoneNumbersOk(AccountFrom))
                {
                    StatusCode = "100";
                    StatusDesc = "INVALID SENDING NUMBER";
                }
                else
                {
                    isValid = true;
                    AccountTo = PhoneValidator.GetIntlFormat(AccountTo);
                    if (TranType == "SENDMONEYW2W")
                    {
                        AccountFrom = PhoneValidator.GetIntlFormat(AccountFrom);
                    }
                }
            }
            else
            {
                isValid = false;
            }
            return isValid;

        }

        public bool IsValidMerchantPaymentTransaction()
        {
            ChannelLogic bll = new ChannelLogic(Channel, RequestAgent);

            bool isValid = false;
            try
            {
                string merchantBeingPaid = CustRef;

                activeTranType = "PAYMERCHANT";

                if (!TransactionIsValid())
                {
                    StatusCode = "100";
                }
                else if (bll.GetMerchant(merchantBeingPaid).Count != 1)
                {
                    StatusCode = "100";
                    StatusDesc = "UNKNOWN PAYEE MERCHANT ID";
                }
                else if (!bll.IsValidInternalTransfer(MerchantId, merchantBeingPaid))
                {
                    StatusCode = "100";
                    StatusDesc = "INTER BANK TRANSFER NOT ALLOWED";
                }
                else
                {
                    Utility = "";
                    CustTel = PhoneValidator.GetIntlFormat(CustTel);
                    isValid = true;
                }

            }
            catch (Exception ee)
            {
                throw ee;
            }
            return isValid;
        }

        public bool IsValidSendMoneyTransaction()
        {
            bool isValid = false;
            try
            {
                if (IsValidMomoTransaction("SENDMONEY"))
                {
                    Utility = "SENDMONEY";
                    isValid = true;
                }
                else
                {
                    isValid = false;
                }
            }
            catch (Exception ee)
            {

            }
            return isValid;
        }

        public bool IsValidWallet2WalletTransaction()
        {
            bool isValid = false;
            try
            {
                if (IsValidMomoTransaction("SENDMONEYW2W"))
                {
                    Utility = "WALLET2WALLET";
                    isValid = true;
                }
                else
                {
                    isValid = false;
                }
            }
            catch (Exception ee)
            {

            }
            return isValid;
        }

        public bool IsValidAirtimePurchaseTransaction()
        {
            bool isValid = false;
            try
            {
                if (IsValidMomoTransaction("AIRTIME"))
                {
                    Utility = "AIRTIME";
                    AccountTo = PhoneValidator.GetIntlFormat(AccountTo);
                    isValid = true;
                }
                else
                {
                    isValid = false;
                }
            }
            catch (Exception ee)
            {

            }
            return isValid;
        }

        public bool IsValidTopUpTransaction()
        {
            ChannelLogic bll = new ChannelLogic(Channel, RequestAgent);
            PhoneValidator pv = new PhoneValidator ();
            bool isValid = false;
            activeTranType = "TOPUP";

            if (PaymentType == "PEGPAY")
            {
                StatusCode = "100";
                StatusDesc = "YOU CAN'T TOPUP YOUR ACCOUNT USING THIS PAYMENT TYPE";
            }
            else if (PaymentType == "MTN MOBILE MONEY" && !pv.PhoneNumbersOk(AccountFrom))
            {
                StatusCode = "100";
                StatusDesc = "INVALID FROM ACCOUNT : " + AccountFrom + " FOR THIS PAYMENT TYPE";
            }
            else if (PaymentType == "AIRTEL MONEY" && !pv.PhoneNumbersOk(AccountFrom))
            {
                StatusCode = "100";
                StatusDesc = "INVALID FROM ACCOUNT : " + AccountFrom + " FOR THIS PAYMENT TYPE";
            }
            else if (!TransactionIsValid())
            {
                StatusCode = "100";
            }
            else if (TranType != activeTranType)
            {
                StatusCode = "100";
                StatusDesc = "INVALID TRANSACTION TYPE";
            }
            else
            {
                string merchantAccount = bll.GetMerchantAccount(MerchantId);
                if (string.IsNullOrEmpty(merchantAccount))
                {
                    isValid = false;
                }
                else
                {
                    isValid = true;
                    AccountTo = merchantAccount;
                }
            }
            return isValid;
        }
    }
}
