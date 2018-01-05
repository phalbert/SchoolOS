using System;
using System.Collections.Generic;
using System.Text;

namespace CoreBankingLogic.ExposedObjects
{
    public class Guarantor : BaseObject
    {
        public string LoanID = "";
        public string GuarantorName = "";
        public string GuarantorRefNumber = "";
        public string GuarantorType = "";
        public string BankCode = "";
        public string ModifiedBy = "";
        public string GuarantorPhoneNumber = "";
        public string PathToPicOfGuarantorID = "";
        public string IdType = "";

        public bool IsValid(string BankCode, string Password)
        {
            return true;
        }
    }
}
