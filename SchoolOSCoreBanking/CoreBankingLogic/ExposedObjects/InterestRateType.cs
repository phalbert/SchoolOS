using System;
using System.Collections.Generic;
using System.Text;

namespace CoreBankingLogic.ExposedObjects
{
    public class InterestRateType:BaseObject
    {
        public string InterestTypeName = "";
        public string InterestTypeCode = "";

        public bool IsValid(string BankCode, string Password) 
        {
            return true;
        }
    }
}
