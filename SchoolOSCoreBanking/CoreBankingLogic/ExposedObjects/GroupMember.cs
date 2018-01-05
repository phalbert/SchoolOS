using System;
using System.Collections.Generic;
using System.Text;

namespace CoreBankingLogic.ExposedObjects
{
    public class GroupMember : BaseObject
    {
        public string BankCode = "";
        public string CustomerID = "";
        public string GroupID = "";
        public string LoanID = "";
        public string Amount = "";
        public string ModifiedBy = "";

        public bool IsValid(string BankCode, string Password) 
        {
            BaseObject valObj = new BaseObject();

            if (string.IsNullOrEmpty(this.Amount))
            {
                StatusCode = "100";
                StatusDesc = "FAILED: PLEASE SUPPLY THE AMOUNT THIS MEMBER ["+CustomerID+"] IS ENTITLED TO";
                return false;
            }
            else if (string.IsNullOrEmpty(this.BankCode))
            {
                StatusCode = "100";
                StatusDesc = "FAILED: PLEASE SUPPLY THE BANKCODE OF BANK TO WHICH THIS MEMBER BELONGS";
                return false;
            }
            else if (string.IsNullOrEmpty(this.CustomerID))
            {
                StatusCode = "100";
                StatusDesc = "FAILED: PLEASE SUPPLY THE ID REFERENCE OF THIS MEMBER";
                return false;
            }
            else if (string.IsNullOrEmpty(this.GroupID))
            {
                StatusCode = "100";
                StatusDesc = "FAILED: PLEASE SUPPLY THE GROUP REFERENCE OF GROUP TO WHICH THIS MEMBER BELONGS";
                return false;
            }
            else if (string.IsNullOrEmpty(this.LoanID))
            {
                StatusCode = "100";
                StatusDesc = "FAILED: PLEASE SUPPLY THE LOAN ID FOR THIS GROUP LOAN";
                return false;
            }
            else if (string.IsNullOrEmpty(this.ModifiedBy))
            {
                StatusCode = "100";
                StatusDesc = "FAILED: PLEASE SUPPLY ID OF USER WHO IS PERFORMING THIS MODIFICATION";
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
            else if (!bll.IsNumericAndAboveZero(this.Amount))
            {
                StatusCode = "100";
                StatusDesc = "FAILED: PLEASE SUPPLY A VALID AMOUNT THE MEMBER WITH ID [" + CustomerID + "] IS ENTITLED TO";
                return false;
            }
            else if (!bll.IsValidBankCode(this.BankCode,out valObj))
            {
                StatusCode = "100";
                StatusDesc = valObj.StatusDesc;
                return false;
            }
            return true;
        }
    }
}
