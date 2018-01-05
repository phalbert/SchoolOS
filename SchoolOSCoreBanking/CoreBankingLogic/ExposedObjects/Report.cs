using System;
using System.Collections.Generic;
using System.Text;

namespace CoreBankingLogic.ExposedObjects
{
    public class Report:BaseObject
    {
        public string ReportName = "";
        public string ReportType = "";
        public string ReportCategory = "";
        public string BankCode = "";
        public string StoredProcedure = "";
        public string ModifiedBy = "";

        public bool IsValid(string BankCode, string Password) 
        {
            return true;
        }
    }
}
