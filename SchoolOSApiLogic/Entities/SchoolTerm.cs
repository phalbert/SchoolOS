using System;
using System.Collections.Generic;
using System.Text;

namespace SchoolOSApiLogic.Entities
{
   public class SchoolTerm:Request
    {
        public string TermCode = "";
        public string TermName = "";
        public string StartDate = "";
        public string EndDate = "";

        public override bool IsValid()
        {
            if (string.IsNullOrEmpty(TermName))
            {
                StatusCode = Globals.FAILURE_STATUS_CODE;
                StatusDesc = "PLEASE SUPPLY A SCHOOL TERM NAME";
                return false;
            }
            if (string.IsNullOrEmpty(TermCode))
            {
                StatusCode = Globals.FAILURE_STATUS_CODE;
                StatusDesc = "PLEASE SUPPLY A SCHOOL TERM CODE";
                return false;
            }

            return base.IsValid();
        }
    }
}
