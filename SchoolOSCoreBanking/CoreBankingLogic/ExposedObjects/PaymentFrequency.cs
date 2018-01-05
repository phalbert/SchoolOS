using System;
using System.Collections.Generic;
using System.Text;

namespace CoreBankingLogic.ExposedObjects
{
    public class PaymentFrequency:BaseObject
    {
        public string RepaymentFreqCode = "";
        public string RepayFreqName = "";
        public string DurationInDays = "";
        public string BankCode = "";
        public string ModifiedBy = "";

        public bool IsValid(string BankCode, string Password) 
        {
            return true;
        }
    }
}
