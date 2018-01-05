using System;
using System.Collections.Generic;
using System.Text;

namespace CoreBankingLogic.ExposedObjects
{
    public class Beneficiary:BaseObject
    {
        public string BankCode = "";
        public string CustomerId = "";
        public string BeneficiaryAccountNumber = "";
        public string BeneficiaryBankCode = "";
        public string ModifiedBy = "";
        public string BeneficiaryName = "";

        public bool IsValid(string BankCode, string Password) 
        {
            //validations to be done here
            return true;
        }
    }
}
