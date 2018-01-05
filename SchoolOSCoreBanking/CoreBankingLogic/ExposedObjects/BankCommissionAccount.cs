using System;
using System.Collections.Generic;
using System.Text;
using CoreBankingLogic.EntityObjects;

namespace CoreBankingLogic.ExposedObjects
{
    public class BankCommissionAccount : BankAccount
    {
        public string CommissionAccountName = "";
        public string CommissionAccountCode = "";

        public bool IsValid(string BankCode, string Password)
        {
            BaseObject valObj = new BaseObject();

            if (string.IsNullOrEmpty(this.AccountNumber))
            {
                StatusCode = "100";
                StatusDesc = "PLEASE SUPPLY AN ACCOUNT NUMBER";
                return false;
            }
            else if (string.IsNullOrEmpty(this.AccountType))
            {
                StatusCode = "100";
                StatusDesc = "PLEASE SUPPLY AN ACCOUNT TYPE";
                return false;
            }
            else if (string.IsNullOrEmpty(this.BankCode))
            {
                StatusCode = "100";
                StatusDesc = "PLEASE SUPPLY A BANKCODE FOR BANK TO WHICH THIS ACCOUNT BELONGS";
                return false;
            }
            else if (string.IsNullOrEmpty(this.CurrencyCode))
            {
                StatusCode = "100";
                StatusDesc = "PLEASE INDICATE THE CURRENCY THAT THE ACCOUNT BALANCE IS STORED IN.";
                return false;
            }
            else if (string.IsNullOrEmpty(this.BranchCode))
            {
                StatusCode = "100";
                StatusDesc = "PLEASE SUPPLY THE BRANCHCODE WHERE THIS ACCOUNT WAS CREATED";
                return false;
            }
            else if (string.IsNullOrEmpty(this.IsActive))
            {
                StatusCode = "100";
                StatusDesc = "PLEASE INDICATE WHETHER THIS ACCOUNT IS ACTIVE [TRUE OR FALSE]";
                return false;
            }
            else if (string.IsNullOrEmpty(this.ModifiedBy))
            {
                StatusCode = "100";
                StatusDesc = "PLEASE SUPPLY  ID of USER WHO IS MODIFYING THIS ACCOUNT";
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
            else if (!bll.IsValidAccountType(this.AccountType, this.BankCode, AccountSignatories, out valObj))
            {
                StatusCode = "100";
                StatusDesc = valObj.StatusDesc;
                return false;
            }
            else if (!bll.IsValidBoolean(this.IsActive))
            {
                StatusCode = "100";
                StatusDesc = "PLEASE INDICATE WHETHER THIS ACCOUNT IS ACTIVE [TRUE OR FALSE]";
                return false;
            }
            else if (!bll.IsValidCurrencyCode(this.CurrencyCode, BankCode, out valObj))
            {
                StatusCode = "100";
                StatusDesc = valObj.StatusDesc;
                return false;
            }
            else if (!bll.IsValidUser(this.ModifiedBy, BankCode, "MANAGER|BUSSINESS_ADMIN", out valObj))
            {
                StatusCode = "100";
                StatusDesc = valObj.StatusDesc;
                return false;
            }
            return true;
        }
    }
}
