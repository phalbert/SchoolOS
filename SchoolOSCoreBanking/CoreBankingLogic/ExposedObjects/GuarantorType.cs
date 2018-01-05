using System;
using System.Collections.Generic;
using System.Text;

namespace CoreBankingLogic.ExposedObjects
{
    public class GuarantorType:BaseObject
    {
        public string GurantorTypeCode = "";
        public string GurantorTypeName = "";
        public string BankCode = "";
        public string ModifiedBy = "";

        public bool IsValid(string BankCode, string Password)
        {
            return true;
        }
    }
}
