using System;
using System.Collections.Generic;
using System.Text;

namespace SchoolOSApiLogic.Entities
{
    public class AuditLog:Request
    {
        public string AuditLogId = "";
        public string BankCode = "";
        public string Action = "";
        public string TableName = "";
        public string ActionType = "";
        public string ModifiedBy = "";
    }
}
