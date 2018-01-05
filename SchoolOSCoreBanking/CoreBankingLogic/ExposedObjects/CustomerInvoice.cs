using System;
using System.Collections.Generic;
using System.Text;

namespace CoreBankingLogic.ExposedObjects
{
    public class CustomerInvoice:BaseObject
    {
        public string CustomerName = "";
        public string CustomerEmail = "";
        public string ItemPrice = "";
        public string ItemDesc = "";
        public string TaxAmount = "";
        public string ChargeAmount = "";
        public string TotalInvoiceAmount = "";
        public string Message = "";
        public string BankCode = "";
        public string MerchantId = "";
        public string MerchantName = "";
        public string InvoiceId = "";
        public string ModifiedBy = "";

        public bool IsValid() 
        {
            StatusCode = "0";
            StatusDesc = "SUCCESS";
            return true;
        }
    }
}
