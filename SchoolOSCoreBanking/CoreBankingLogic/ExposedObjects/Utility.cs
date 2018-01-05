using System;
using System.Collections.Generic;
using System.Text;

namespace CoreBankingLogic.ExposedObjects
{
    public class Utility:BaseObject
    {
        public string UtilityName = "";
        public string UtilityCode = "";
        public string CommissionAccountNumber = "";
        public string BankCode = "";
        public string ModifiedBy = "";
        public string IsActive = "";

        public bool IsValid(string BankCode, string Password) 
        {
            return true;
        }
    }
}
