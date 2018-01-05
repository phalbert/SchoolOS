using System;
using System.Data;
using System.Configuration;
using System.Collections.Generic;

namespace CoreBankingLogic.EntityObjects
{
    public class BankAccount : BaseObject
    {
        public string AccountId = "0";
        public string AccountName = "";
        public string AccountNumber = "";
        public string AccountBalance = "";
        public string MinimumBalance = "";
        public string InterestRate = "";
        public string InterestType = "";
        public string AccountType = "";
        public string AccountCategory = "";
        public string BankCode = "";
        public string ModifiedBy = "";
        public string BranchCode = "";
        public string IsActive = "";
        public string CurrencyCode = "";
        public string Referenced = "";
        public string LiquidationType = "";
        public string LiquidationFrequency = "";
        public List<string> AccountSignatories = new List<string>();
        public string ApprovedBy = "";
        public string InterestPayOutFreq = "";
        public string UserType = "";
        public string BankLiqAccount = "";
        public string BankLiqAccountName = "";
        public string MerchantContact = "";

        public BankAccount()
        {
        }

        public BankAccount(string accountType)
        {
            this.AccountType = accountType;
        }

        public bool IsValidSaveTellerAccountRequest(string BankCode, string Password)
        {
            BaseObject valObj = new BaseObject();

            //if the one who is Approving is the same as the one modifiying 
            //Set Default Values for liquidation Type and Referencal Type.

            if (string.IsNullOrEmpty(this.Referenced))
            {
                this.Referenced = "False";
            }

            if (string.IsNullOrEmpty(this.LiquidationType))
            {
                this.LiquidationType = "NONE";
            }
            //set the Approved By to be empty
            if (this.ModifiedBy.ToUpper().Trim() == this.ApprovedBy.ToUpper().Trim())
            {
                if (this.ModifiedBy.ToUpper() == "ADMIN")
                {
                    this.ApprovedBy = "Admin";
                }
                else
                {
                    this.ApprovedBy = "";
                }
            }

            //Lets start validations
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
            else if (string.IsNullOrEmpty(this.AccountName))
            {
                StatusCode = "100";
                StatusDesc = "PLEASE SUPPLY AN ACCOUNT NAME/TITLE";
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
            else if (string.IsNullOrEmpty(this.MinimumBalance))
            {
                StatusCode = "100";
                StatusDesc = "PLEASE SUPPLY  MINIMUM BALANCE FOR THIS ACCOUNT";
                return false;
            }
            
            else if (AccountSignatories.Count == 0)
            {
                StatusCode = "100";
                StatusDesc = "PLEASE SUPPLY AN ACCOUNT SIGNATORY.i.e ID OF CUSTOMER WHO OWNS THE CUSTOMER";
                return false;
            }
            else if (!bll.IsValidBankCode(this.BankCode, out valObj))
            {
                StatusCode = "100";
                StatusDesc = valObj.StatusDesc;
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
           
            else if (!bll.IsNumeric(this.MinimumBalance))
            {
                StatusCode = "100";
                StatusDesc = valObj.StatusDesc;
                return false;
            }
            
            else if (!bll.IsValidCurrencyCode(this.CurrencyCode, BankCode, out valObj))
            {
                StatusCode = "100";
                StatusDesc = valObj.StatusDesc;
                return false;
            }
            

            
            
            return true;
        }


        public bool IsValidSaveCustomerAccountRequest(string BankCode, string Password)
        {
            BaseObject valObj = new BaseObject();

            //Liquidation Instrtuction or referencial instructions
            if (string.IsNullOrEmpty(this.Referenced))
            {
                this.Referenced = "False";
            }

            if (string.IsNullOrEmpty(this.LiquidationType))
            {
                this.LiquidationType = "NONE";
            }     

            //Lets start validations
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
           
            else if (!bll.IsValidBoolean(this.IsActive))
            {
                StatusCode = "100";
                StatusDesc = "PLEASE INDICATE WHETHER THIS ACCOUNT IS ACTIVE [TRUE OR FALSE]";
                return false;
            }
            else if (!bll.IsValidCurrencyCode(this.CurrencyCode, this.BankCode, out valObj))
            {
                StatusCode = "100";
                StatusDesc = valObj.StatusDesc;
                return false;
            }
           
            return true;
        }
    }
}
