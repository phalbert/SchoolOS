using System;
using System.Collections.Generic;
using System.Text;
using CoreBankingLogic.ChannelControls;
using CoreBankingLogic.ChannelObjects;

namespace CoreBankingLogic.ExposedObjects.ChannelObjects
{
    public class Customer : Defaults
    {
        public string Area = "";
        public string Active = "";
        public string AccountNumber = "";
        public string CustomerType = "";
        public string DigitalSignature = "";
        public string FirstName = "";
        public string OtherNames = "";
        public string FullName = "";
        public string BusinessName = "";
        public string Username = "";
        public string Password = "";
        public string CreatedBy = "";
        public string BusinessAddress = "";
        public string BusinessEmail = "";
        public string BusinessLicence = "";
        public string BusinessTelephone = "";
        public string Gender = "";
        public string IsLoggedIn = "";
        public string MerchantId = "";
        public string OwnerTelephone = "";
        public string OwnerDateofBirth = "";
        public string OwnerImage = "";
        public string OwnerIdType = "";
        public string OwnerIdImage = "";
        public string OwnerIdNumber = "";
        public string ResetCode = "";
        public string RunningBalance = "";
        public string WrongPasswordCount = "";
        public string UserId = "";
        public string UserLevel = "";
        public string PasswordReset = "";


        public bool IsValidLoginRequest()
        {
            bool isValid = false;
            ChannelLogic logic = new ChannelLogic(RequestAgent, Channel);

            try
            {
                if (string.IsNullOrEmpty(OwnerTelephone))
                {
                    StatusCode = "100";
                    StatusDesc = "PROVIDE THE PHONE NUMBER";
                }
                else if (string.IsNullOrEmpty(Password))
                {
                    StatusCode = "100";
                    StatusDesc = "PROVIDE A VALID PASSWORD";
                }
                else if (!logic.IsValidChannelCredentials(ApiUsername, ApiPassword, Channel))
                {
                    StatusCode = "100";
                    StatusDesc = logic.StatusDesc;
                }
                else
                {
                    isValid = true;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return isValid;
        }

        internal bool IsValidDateOfBirth()
        {
            return true;
        }

        internal bool IsValidBusinessIdentificationInformation()
        {
            bool isValid = false;
            PhoneValidator pv = new PhoneValidator();

            if (string.IsNullOrEmpty(BusinessTelephone))
            {
                StatusCode = "100";
                StatusDesc = "PLEASE ENTER A PHONE NUMBER";
            }
            else if (!pv.PhoneNumbersOk(BusinessTelephone))
            {
                StatusCode = "100";
                StatusDesc = "INVALID BUSINESS TELEPHONE NUMBER";
            }
            else if (string.IsNullOrEmpty(BusinessAddress))
            {
                StatusCode = "100";
                StatusDesc = "PLEASE PROVIDE A BUSINESS ADDRESS";
            }
            else if (string.IsNullOrEmpty(OwnerIdImage))
            {
                StatusCode = "100";
                StatusDesc = "PROVIDE YOUR ID PHOTO";
            }
            else if (string.IsNullOrEmpty(BusinessLicence))
            {
                StatusCode = "100";
                StatusDesc = "PLEASE SUPPLY A BUSINESS LICENSE";
            }
            else if (IsValidPersonalIdentificationInformation())
            {
                isValid = true;
            }
            else
            {
                StatusCode = "100";
                StatusDesc = "REQUEST REJECTED. INSUFFICIENT CUSTOMER INFORMATION SUPPLIED";
            }
            return isValid;
        }

        internal bool IsValidPersonalIdentificationInformation()
        {
            bool isValid = false;
            double idNumber;
            ChannelLogic logic = new ChannelLogic(RequestAgent, Channel);
            PhoneValidator pv = new PhoneValidator();

            if (string.IsNullOrEmpty(OwnerTelephone))
            {
                StatusCode = "100";
                StatusDesc = "PLEASE ENTER YOUR PHONE NUMBER";
            }
            else if (!pv.PhoneNumbersOk(OwnerTelephone))
            {
                StatusCode = "100";
                StatusDesc = "PROVIDE A VALID PHONE NUMBER";
            }
            else if (!IsValidIdType())
            {
                StatusCode = "100";
                StatusDesc = "PLEASE ENTER A VALID ID TYPE";
            }
            else if (string.IsNullOrEmpty(OwnerIdImage))
            {
                StatusCode = "100";
                StatusDesc = "PLEASE SUPPLY YOUR ID PHOTO";
            }
            else if (string.IsNullOrEmpty(OwnerIdNumber))
            {
                StatusCode = "100";
                StatusDesc = "PLEASE SUPPLY YOUR ID NUMBER";
            }
            else if (!Double.TryParse(OwnerIdNumber, out idNumber))
            {
                StatusCode = "100";
                StatusDesc = "INVALID ID NUMBER. ONLY DIGITS EXPECTED";
            }
            else if (string.IsNullOrEmpty(ApiUsername))
            {
                StatusCode = "100";
                StatusDesc = "PROVIDE A GATEWAY USERNAME";
            }
            else if (string.IsNullOrEmpty(ApiPassword))
            {
                StatusCode = "100";
                StatusDesc = "PROVIDE A GATEWAY PASSWORD";
            }
            else if (!logic.IsValidChannelCredentials(ApiUsername, ApiPassword, Channel))
            {
                StatusCode = "100";
                StatusDesc = logic.StatusDesc;
            }
            else if (logic.CustomerExists(BusinessEmail, OwnerTelephone))
            {
                StatusCode = "100";
                StatusDesc = logic.StatusDesc;
            }
            else
            {
                isValid = true;
            }
            return isValid;
        }

        internal bool IsValidIndividualCustomer()
        {
            bool isValid = false;
            ChannelLogic logic = new ChannelLogic(RequestAgent, Channel);
            try
            {
                if (string.IsNullOrEmpty(FirstName))
                {
                    StatusCode = "100";
                    StatusDesc = "PROVIDE FIRST NAME";
                }
                else if (string.IsNullOrEmpty(OtherNames))
                {
                    StatusCode = "100";
                    StatusDesc = "PROVIDE ANOTHER NAME";
                }
                else if (string.IsNullOrEmpty(Gender))
                {
                    StatusCode = "100";
                    StatusDesc = "PROVIDE USER'S GENDER";
                }
                else if (string.IsNullOrEmpty(OwnerDateofBirth))
                {
                    StatusCode = "100";
                    StatusDesc = "PROVIDE A DATE  OF BIRTH";
                }
                else if (!IsValidDateOfBirth())
                {
                    StatusCode = "100";
                    StatusDesc = "INVALID DATE OF BIRTH";
                }
                else if (logic.AlreadyHasAUser(MerchantId))
                {
                    StatusCode = "100";
                    StatusDesc = "THIS CUSTOMER TYPE ALLOWS ONLY ONE USER ON ACCOUNT";
                }
                else if (IsValidPersonalIdentificationInformation())
                {
                    isValid = true;
                    StatusCode = "0";
                }
                else
                {
                    isValid = false;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return isValid;
        }

        internal bool IsValidIdType()
        {
            Logger logger = new Logger();

            bool isValid = false;
            ChannelLogic logic = new ChannelLogic(RequestAgent, Channel);
            try
            {
                List<KeyValuePair> idTypes = logic.GetIdTypes(OwnerIdType);
                if (idTypes.Count == 1)
                {
                    isValid = true;
                }
                else
                {
                    isValid = true;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return isValid;
        }

        internal bool ValidRequest()
        {
            bool isValid = false;
            if (string.IsNullOrEmpty(CustomerType))
            {
                StatusCode = "100";
                StatusDesc = "PLEASE PROVIDE A CUSTOMER TYPE";
            }
            else
            {
                if (CustomerType.ToUpper() == "INDIVIDUAL")
                {
                    isValid = IsValidIndividualCustomer();
                }
                else if (CustomerType == "NON INDIVIDUAL")
                {
                    CustomerType = "BUSINESS";
                    isValid = false;
                    StatusCode = "100";
                    StatusDesc = "SUPPORT FOR " + CustomerType + " CUSTOMERS COMING SOON!";
                }
                else
                {
                    isValid = false;
                    StatusCode = "100";
                    StatusDesc = "UNKNOWN CUSTOMER TYPE";
                }
            }
            return isValid;
        }

        internal bool IsValidLogOutRequest()
        {
            ChannelLogic bll = new ChannelLogic(RequestAgent, Channel);

            bool isValid = false;
            try
            {
                if (string.IsNullOrEmpty(UserId))
                {
                    StatusCode = "100";
                    StatusDesc = "PLEASE PROVIDE USER ID";
                }
                else if (string.IsNullOrEmpty(MerchantId))
                {
                    StatusCode = "100";
                    StatusDesc = "PLEASE PROVIDE YOUR MERCHANT ID";
                }
                else if (bll.IsUserLoggedOn(UserId))
                {
                    isValid = true;
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
            return isValid;
        }
    }
}
