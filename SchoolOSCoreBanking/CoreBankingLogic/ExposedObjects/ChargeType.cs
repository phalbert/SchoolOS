using System;
using System.Collections.Generic;
using System.Text;

namespace CoreBankingLogic.ExposedObjects
{
    public class ChargeType : BaseObject
    {
        public string ChargeTypeCode = "";
        public string ChargeTypeName = "";
        public string Description = "";
        public string IsActive = "";
        public string BankCode = "";
        public string ModifiedBy = "";

        public bool IsValid(string BankCode, string Password)
        {
            BaseObject valObj = new BaseObject();

            //validations to be done here
            if (string.IsNullOrEmpty(this.BankCode))
            {
                StatusCode = "100";
                StatusDesc = "PLEASE SUPPLY A BANK CODE";
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
            return true;
        }
    }
}
