using System;
using System.Collections.Generic;
using System.Text;

namespace CoreBankingLogic.ExposedObjects
{
    public class AccountType : BaseObject
    {
        public string Id = "";
        public string AccTypeName = "";
        public string AccTypeCode = "";
        public string Description = "";
        public string MinimumBalance = "";
        public string ModifiedBy = "";
        public string BankCode = "";
        public string IsActive = "";
        public int MinNumberOfSignatories = 1;
        public int MaxNumberOfSignatories = 4;
        public string AccountTypeCategory = "";
        public string InterestRate = "";
        public string InterestRateType = "";
        public string InterestPayOutFreq = "";

        public bool IsValid(string BankCode, string Password)
        {
            BaseObject valObj = new BaseObject();
            this.MinimumBalance = bll.RemoveCommasFromMoneyString(this.MinimumBalance);


            if (string.IsNullOrEmpty(this.AccTypeCode))
            {
                StatusCode = "100";
                StatusDesc = "PLEASE SUPPLY THE ACCOUNT TYPE CODE";
                return false;
            }
            else if (string.IsNullOrEmpty(this.AccTypeName))
            {
                StatusCode = "100";
                StatusDesc = "PLEASE SUPPLY THE ACCOUNT TYPE NAME";
                return false;
            }
            else if (string.IsNullOrEmpty(this.BankCode))
            {
                StatusCode = "100";
                StatusDesc = "PLEASE SUPPLY THE BANK CODE";
                return false;
            }
            else if (string.IsNullOrEmpty(this.Description))
            {
                StatusCode = "100";
                StatusDesc = "PLEASE PROVIDE A BRIEF DESCRIPTION ABOUT THIS ACCOUNT TYPE";
                return false;
            }
            else if (!bll.IsValidBankCode(this.BankCode, out valObj))
            {
                StatusCode = "100";
                StatusDesc = valObj.StatusDesc;
                return false;
            }
            else if (!bll.IsValidBankCredentials(BankCode, Password))
            {
                StatusCode = "100";
                StatusDesc = "INVALID BANK CREDENTIALS AT PEGPAY.";
                return false;
            }
            else if (!bll.IsValidBoolean(this.IsActive))
            {
                StatusCode = "100";
                StatusDesc = "PLEASE INDICATE WHETHER THIS ACCOUNT TYPE IS ACTIVE.[TRUE OR FALSE]";
                return false;
            }
            else if (string.IsNullOrEmpty(this.MinimumBalance))
            {
                StatusCode = "100";
                StatusDesc = "PLEASE SUPPLY THE MINIMUM BALANCE FOR AN ACCOUNT OF THIS TYPE";
                return false;
            }
            else if (!bll.IsNumeric(this.MinimumBalance))
            {
                StatusCode = "100";
                StatusDesc = "PLEASE SUPPLY A VALID MINIMUM BALANCE";
                return false;
            }
            else if (string.IsNullOrEmpty(this.ModifiedBy))
            {
                StatusCode = "100";
                StatusDesc = "PLEASE SUPPLY THE ID OF USER MODIFYING THIS ACCOUNT TYPE";
                return false;
            }
            else if (MinNumberOfSignatories <= 0)
            {
                StatusCode = "100";
                StatusDesc = "ACCOUNT TYPE MUST ACCEPT AT LEAST ONE SIGNATORY.";
                return false;
            }
            else if (MaxNumberOfSignatories < MinNumberOfSignatories)
            {
                StatusCode = "100";
                StatusDesc = "THE MAXIMUM NUMBER OF SIGNATORIES CANNOT BE LESS THAN THE MINIMUM NUMBER.";
                return false;
            }
            else if ((AccountTypeCategory == "NON-INDIVIDUAL") && (MinNumberOfSignatories < 2))
            {
                StatusCode = "100";
                StatusDesc = "A NON-INDIVIDUAL ACCOUNT TYPE MUST HAVE A MINIMUM OF 2 SIGNATORIES";
                return false;
            }
            else if (!bll.IsValidUser(this.ModifiedBy, this.BankCode, "BANK_ADMIN|SYS_ADMIN|BUSSINESS_ADMIN", out valObj))
            {
                StatusCode = "100";
                StatusDesc = valObj.StatusDesc;
                return false;
            }
            return true;
        }
    }
}
