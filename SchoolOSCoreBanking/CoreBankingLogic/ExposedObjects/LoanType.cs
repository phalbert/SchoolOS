using System;
using System.Collections.Generic;
using System.Text;

namespace CoreBankingLogic.ExposedObjects
{
    public class LoanType:BaseObject
    {
        public string LoanTypeName = "";
        public string LoanTypeCode = "";
        public string RequiresCollateral = "";
        public string InterestRateAsPercentage = "";
        public string InterestRateType = "";
        public string BankCode = "";
        public string ModifiedBy = "";
        public string GracePeriodInDays = "";
        public string LoanApplicationFee = "";
        public string LoanProcessingFee = "";

        public bool IsValid() 
        {
            return true;
        }

        public bool IsValid(string BankCode, string Password)
        {
            return true;
        }
    }
}
