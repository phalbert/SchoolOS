using System;
using System.Collections.Generic;
using System.Text;

namespace CoreBankingLogic.ExposedObjects
{
    public class CustomizedBankCharge:BaseObject
    {
        public string BankCode = "";
        public string ChargeCode = "";
        public string ChargeName = "";
        public string ChargeAmount = "";
        public string ChargeType = "";
        public string ModifiedBy = "";
        public string MinimumAmount = "";
        public string MaximumAmount = "";
        public string IsActive = "";
        public string ChargeDesc = "";
        public string CommissionAccountNumber = "";


        public bool IsValid(string BankCode,string Password)
        {
            BussinessLogic bll = new BussinessLogic();
            BaseObject valObj;
            if (string.IsNullOrEmpty(ChargeCode))
            {
                StatusCode = Globals.FAILURE_STATUS_CODE;
                StatusDesc = "Please Supply a Charge Code";
                return false;
            }
            if (string.IsNullOrEmpty(ChargeName))
            {
                StatusCode = Globals.FAILURE_STATUS_CODE;
                StatusDesc = "Please Supply a Charge Name";
                return false;
            }
            if (string.IsNullOrEmpty(IsActive))
            {
                StatusCode = Globals.FAILURE_STATUS_CODE;
                StatusDesc = "Please Indicate if charge is Activated";
                return false;
            }
            if (string.IsNullOrEmpty(ChargeDesc))
            {
                StatusCode = Globals.FAILURE_STATUS_CODE;
                StatusDesc = "Please Supply a Charge Description";
                return false;
            }
            if (!bll.IsValidBoolean(this.IsActive))
            {
                StatusCode = Globals.FAILURE_STATUS_CODE;
                StatusDesc = "Please Indicate if charge is Activated ie True Or False";
                return false;
            }
            if (string.IsNullOrEmpty(ChargeType))
            {
                StatusCode = Globals.FAILURE_STATUS_CODE;
                StatusDesc = "Please Supply a Charge Type";
                return false;
            }
            if (string.IsNullOrEmpty(ModifiedBy))
            {
                StatusCode = Globals.FAILURE_STATUS_CODE;
                StatusDesc = "Please Supply the Id of the user performing this Operation";
                return false;
            }
            if (string.IsNullOrEmpty(MinimumAmount))
            {
                StatusCode = Globals.FAILURE_STATUS_CODE;
                StatusDesc = "Please Supply a Minimum Amount";
                return false;
            }
            if (string.IsNullOrEmpty(MaximumAmount))
            {
                StatusCode = Globals.FAILURE_STATUS_CODE;
                StatusDesc = "Please Supply a Maximum Amount";
                return false;
            }
            if (!bll.IsValidBankCredentials(BankCode, Password))
            {
                StatusCode = Globals.FAILURE_STATUS_CODE;
                StatusDesc = "Invalid Credentials Supplied";
                return false;
            }
            if (string.IsNullOrEmpty(ChargeAmount))
            {
                StatusCode = Globals.FAILURE_STATUS_CODE;
                StatusDesc = "Please Supply a Charge Amount";
                return false;
            }
            if (!bll.IsValidChargeType(this.ChargeType,out valObj))
            {
                StatusCode = Globals.FAILURE_STATUS_CODE;
                StatusDesc = valObj.StatusDesc;
                return false;
            }

            StatusCode = Globals.SUCCESS_STATUS_CODE;
            StatusDesc = Globals.SUCCESS_TEXT;
            return true;
        }
    }
}
