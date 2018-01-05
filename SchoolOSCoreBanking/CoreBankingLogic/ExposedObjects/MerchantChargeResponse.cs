using System;
using System.Collections.Generic;
using System.Text;

namespace CoreBankingLogic.ExposedObjects
{
    public class MerchantChargeResponse : MerchantCharge
    {
        public string CalculatedChargeAmount = "";
        public string CalculationMethod = "";
        public string OriginalTransactionAmount = "";
        public string FinalTransactionAmount = "";
        public string ChargeName = "";
        public string PegasusCommissionAmount = "";
        public string SbuCommissionAmount = "";
        public string TaxCommissionAmount = "";

        public string PegasusCommissionAccountNumber = "";
        public string SbuCommissionAccountNumber = "";
        public string TaxCommissionAccountNumber = "";
        public string PegasusPercentage = "";
        public string SbuPercentage = "";
        public string TaxPercentage = "";
        public string IsSplit = "";

    }
}
