using System;
using System.Collections.Generic;
using System.Text;

namespace CoreBankingLogic.ExposedObjects
{
    public class CustomerTerminal : BaseObject
    {
        public string CustomerId = "";
        public string AccountCode = "";
        public string PhoneNumber = "";
        public string CustomerAccount = "";
        public string DeviceId = "";
        public string DeviceType = "";
        public string SIMCard = "";
        public string AcquiredBy = "";
        public string Location = "";
        public string Passcode = "";
        public string BankCode = "";
        public string BranchCode = "";
        public string IsActive = "";
        public string ModifiedBy = "";
        public string ApprovedBy = "";
        public string TerminalName = "";
        public string Usertype = "";

        public bool IsValidCustomerTerminal(string BankCode, string Password)
        {
            BussinessLogic bll = new BussinessLogic();
            BaseObject valObj = new BaseObject();
            BankCustomer cust = new BankCustomer();

            if (string.IsNullOrEmpty(this.AccountCode))
            {
                StatusCode = "100";
                StatusDesc = "PROVIDE MERCHANT CODE";
                return false;
            }

            if (bll.IsMerchant(this.ModifiedBy, this.AccountCode, this.BankCode, out cust))
            {
                this.ApprovedBy = this.ModifiedBy;
            }
            else
            {
                this.ApprovedBy = "";
            }

            //Lets start validations
            if (string.IsNullOrEmpty(this.BankCode))
            {
                StatusCode = "100";
                StatusDesc = "PLEASE SUPPLY A BANK CODE TO WHICH CUSTOMER BELONGS";
                return false;
            }
            if (string.IsNullOrEmpty(this.BranchCode))
            {
                StatusCode = "100";
                StatusDesc = "PLEASE SUPPLY A BRANCH CODE OF BRANCH TO WHICH CUSTOMER BELONGS";
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
            if (string.IsNullOrEmpty(this.DeviceId))
            {
                StatusCode = "100";
                StatusDesc = "PLEASE SUPPLY AN ID FOR THIS TERMINAL";
                return false;
            }
            if (string.IsNullOrEmpty(this.DeviceType))
            {
                StatusCode = "100";
                StatusDesc = "PLEASE SUPPLY THE TYPE OF THE DEVICE/TERMINAL`";
                return false;
            }
            if (!bll.IsValidDevice(ref this.DeviceId, ref this.SIMCard, this.DeviceType, out valObj))
            {
                StatusCode = valObj.StatusCode;
                StatusDesc = valObj.StatusDesc;
                return false;
            }
            if (string.IsNullOrEmpty(this.AcquiredBy))
            {
                StatusCode = "100";
                StatusDesc = "PLEASE INDICATE THE TILL USER'S NAME";
                return false;
            }
            if (string.IsNullOrEmpty(this.Location))
            {
                StatusCode = "100";
                StatusDesc = "PLEASE SUPPLY THE TILL LOCATION";
                return false;
            }
            if (string.IsNullOrEmpty(this.Usertype))
            {
                StatusCode = "100";
                StatusDesc = "PLEASE SUPPLY THE USER TYPE.";
                return false;
            }
            if (!bll.IsValidBoolean(this.IsActive))
            {
                StatusCode = "100";
                StatusDesc = "PLEASE INDICATE WHETHER TILL IS ACTIVE. [TRUE OR FALSE]";
                return false;
            }
            if (string.IsNullOrEmpty(this.Passcode))
            {
                StatusCode = "100";
                StatusDesc = "PLEASE SUPPLY A MD5 HASHED PASSWORD FOR THIS TILL";
                return false;
            }
            if (string.IsNullOrEmpty(this.PhoneNumber))
            {
                StatusCode = "100";
                StatusDesc = "PLEASE SUPPLY THE TILL'S PHONE NUMBER";
                return false;
            }
            if (string.IsNullOrEmpty(this.ModifiedBy))
            {
                StatusCode = "100";
                StatusDesc = "PLEASE SUPPLY USER ID OF MODIFIER IN MODIFIED BY FIELD";
                return false;
            }
            if (!bll.IsValidTelephone(ref this.PhoneNumber, out valObj))
            {
                StatusCode = "100";
                StatusDesc = "PLEASE SUPPLY A VALID PHONE NUMBER";
                return false;
            }
            if (!bll.IsAlreadyRegistered(this.PhoneNumber,this.CustomerId,"CUSTOMERTERMINAL",out valObj))
            {
                StatusCode = valObj.StatusCode;
                StatusDesc = valObj.StatusDesc;
                return false;
            }
            if (!bll.IsValidUser(this.ModifiedBy, BankCode, "BUSSINESS_ADMIN|MANAGER|CUSTOMER_SERVICE|CUSTOMER", out valObj) && this.Usertype != "NONE")
            {
                string statusDesc = valObj.StatusDesc.ToUpper();
                if (statusDesc.Contains("NOT ACTIVATED") || statusDesc.Contains("NOT YET APPROVED"))
                {
                    StatusCode = "0";
                    statusDesc = "SUCCESS";
                }
                else
                {

                    StatusCode = "100";
                    StatusDesc = valObj.StatusDesc;
                    return false;
                }
            }

            if (string.IsNullOrEmpty(this.CustomerId))
            {
                this.CustomerId = bll.GenerateTillCode(this.AccountCode, this.BankCode);
            }
            
            StatusCode = "0";
            StatusDesc = "SUCCESS";
            return true;
        }

    }
}
