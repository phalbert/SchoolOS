using System;
using System.Collections.Generic;
using System.Text;

namespace CoreBankingLogic.ExposedObjects
{
    public class CollateralType:BaseObject
    {
        public string CollateralTypeCode = "";
        public string CollateralTypeName = "";
        public string ModifiedBy = "";
        public string BankCode = "";

        public bool IsValid(string BankCode, string Password) 
        {
            return true;
        }
    }
}
