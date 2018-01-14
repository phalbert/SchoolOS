using System;
using System.Collections.Generic;
using System.Text;

namespace CoreBankingLogic.ExposedObjects
{
    public class TransactionCategory : BaseObject
    {
        public string Id = "";
        public string TranCategoryCode = "";
        public string TranCategoryName = "";
        public string Description = "";
        public string ModifiedBy = "";
        public string ApprovedBy = "";
        public string BankCode = "";
        public string IsActive = "";




        public bool IsValid(string BankCode, string Password)
        {
            BaseObject valobj = new BaseObject();

            if (string.IsNullOrEmpty(this.BankCode))
            {
                StatusCode = "100";
                StatusDesc = "PLEASE SUPPLY A BANK CODE";
                return false;
            }
            else if (string.IsNullOrEmpty(this.Description))
            {
                StatusCode = "100";
                StatusDesc = "PLEASE SUPPLY A DESCRIPTION FOR THIS TRANSACTION CATEGORY";
                return false;
            }
            else if (string.IsNullOrEmpty(this.ModifiedBy))
            {
                StatusCode = "100";
                StatusDesc = "PLEASE SUPPLY ID OF USER MODIFYING THIS CATEGORY";
                return false;
            }
            else if (string.IsNullOrEmpty(this.TranCategoryCode))
            {
                StatusCode = "100";
                StatusDesc = "PLEASE SUPPLY THE TRANSACTION CATEGORY CODE";
                return false;
            }
            else if (string.IsNullOrEmpty(this.TranCategoryName))
            {
                StatusCode = "100";
                StatusDesc = "PLEASE SUPPLY THE TRANSACTION CATEGORY NAME";
                return false;
            }
            else if (!bll.IsValidBoolean(this.IsActive))
            {
                StatusCode = "100";
                StatusDesc = "PLEASE SUPPLY INDICATE WHETHER THIS CATEGORY IS ACTIVE.[TRUE OR FALSE]";
                return false;
            }
            else if (!bll.IsValidBankCode(this.BankCode, out valobj))
            {
                StatusCode = "100";
                StatusDesc = valobj.StatusDesc;
                return false;
            }
            else if (!bll.IsValidBankCredentials(BankCode, Password))
            {
                StatusCode = "100";
                StatusDesc = "INVALID BANK CREDENTIALS AT PEGPAY.";
                return false;
            }
            else if (!bll.IsValidUser(ModifiedBy, BankCode, "BUSSINESS_ADMIN", out valobj))
            {
                StatusCode = "100";
                StatusDesc = valobj.StatusDesc;
                return false;
            }
            else if (!bll.IsValidUser(ApprovedBy, BankCode, "BANK_ADMIN|SYS_ADMIN|BUSSINESS_ADMIN", out valobj))
            {
                StatusCode = "100";
                StatusDesc = valobj.StatusDesc;
                return false;
            }
            else
            {
                StatusCode = "0";
                StatusDesc = "SUCCESS";
                return true;
            }
        }
    }
}