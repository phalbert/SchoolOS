using System;
using System.Collections.Generic;
using System.Text;

namespace CoreBankingLogic.ExposedObjects
{
    public class MerchantCharge : BaseObject
    {
        public string BankCode = "";
        public string MerchantId = "";
        public string ChargeCode = "";
        public string PaymentType = "";
        public string TranCategory = "";
        public string IsChargePassedOnToCustomer = "";
        public string IsActive = "";
        public string ModifiedBy = "";

        

        public bool IsValid(string bankCode, string password)
        {
            BussinessLogic bll = new BussinessLogic();
            BaseObject valObj;
            if (string.IsNullOrEmpty(ChargeCode))
            {
                StatusCode = Globals.FAILURE_STATUS_CODE;
                StatusDesc = "Please Supply a Charge Code";
                return false;
            }
            if (string.IsNullOrEmpty(TranCategory))
            {
                StatusCode = Globals.FAILURE_STATUS_CODE;
                StatusDesc = "Please Supply a transaction category";
                return false;
            }
            if (string.IsNullOrEmpty(BankCode))
            {
                StatusCode = Globals.FAILURE_STATUS_CODE;
                StatusDesc = "Please Selet a Bank";
                return false;
            }
            if (string.IsNullOrEmpty(IsActive))
            {
                StatusCode = Globals.FAILURE_STATUS_CODE;
                StatusDesc = "Please Indicate if charge is Activated";
                return false;
            }

            if (!bll.IsValidBoolean(this.IsActive))
            {
                StatusCode = Globals.FAILURE_STATUS_CODE;
                StatusDesc = "Please Indicate if charge is Activated ie True Or False";
                return false;
            }
            if (!bll.IsValidBankCode(this.BankCode, out valObj))
            {
                StatusCode = Globals.FAILURE_STATUS_CODE;
                StatusDesc = valObj.StatusDesc;
                return false;
            }
            if (!bll.IsValidTransactionCategory(this.TranCategory, this.BankCode, out valObj))
            {
                StatusCode = Globals.FAILURE_STATUS_CODE;
                StatusDesc = valObj.StatusDesc;
                return false;
            }
            if (!bll.IsValidPaymentType(this.PaymentType, this.BankCode, out valObj))
            {
                StatusCode = Globals.FAILURE_STATUS_CODE;
                StatusDesc = valObj.StatusDesc;
                return false;
            }
            if (string.IsNullOrEmpty(MerchantId))
            {
                StatusCode = Globals.FAILURE_STATUS_CODE;
                StatusDesc = "Please Supply Id of Merchant to whom Charge Belongs";
                return false;
            }
            if (string.IsNullOrEmpty(ModifiedBy))
            {
                StatusCode = Globals.FAILURE_STATUS_CODE;
                StatusDesc = "Please Supply the Id of the user performing this Operation";
                return false;
            }
            if (string.IsNullOrEmpty(IsChargePassedOnToCustomer))
            {
                StatusCode = Globals.FAILURE_STATUS_CODE;
                StatusDesc = "Please Indicate whether this charge is Passed on to the customer or Not";
                return false;
            }

            


            StatusCode = Globals.SUCCESS_STATUS_CODE;
            StatusDesc = Globals.SUCCESS_TEXT;
            return true;
        }
    }
}
