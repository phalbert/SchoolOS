using System;
using System.Collections.Generic;
using System.Text;

namespace CoreBankingLogic.ExposedObjects
{
    public class SystemSetting:BaseObject
    {
        public string SettingCode = "";
        public string SettingValue = "";
        public string ModifiedBy = "";
        public string BankCode = "";

        public bool IsValid(string BankCode, string Password)
        {
            return true;
        }
    }
}
