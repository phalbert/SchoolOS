using System;
using System.Collections.Generic;
using System.Text;

namespace SchoolOSApiLogic.Entities
{
   public class SchoolClass:Request
    {
        public string ClassCode = "";
        public string ClassName = "";
        public string ClassCategory = "";

        public override bool IsValid()
        {
            if (string.IsNullOrEmpty(SchoolCode))
            {
                StatusCode = Globals.FAILURE_STATUS_CODE;
                StatusDesc = "PLEASE SUPPLY A SCHOOL CODE";
                return false;
            }
            if (string.IsNullOrEmpty(ClassCode))
            {
                StatusCode = Globals.FAILURE_STATUS_CODE;
                StatusDesc = "PLEASE SUPPLY A CLASS CODE";
                return false;
            }
            if (string.IsNullOrEmpty(ClassName))
            {
                StatusCode = Globals.FAILURE_STATUS_CODE;
                StatusDesc = "PLEASE SUPPLY A CLASS NAME ";
                return false;
            }
           
            return base.IsValid();
        }
    }
}
