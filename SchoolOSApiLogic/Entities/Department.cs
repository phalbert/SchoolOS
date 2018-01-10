using System;
using System.Collections.Generic;
using System.Text;

namespace SchoolOSApiLogic.Entities
{
    public class Department:Request
    {
        public string DepartmentCode = "";
        public string DepartmentName = "";
        public String DepartmentCategory = "";

        public override bool IsValid()
        {
            string propertiesThatCanBeNull = "DepartmentCategory";
            Result nullCheckResult = Globals.CheckForNulls(this, propertiesThatCanBeNull);

            if (nullCheckResult.StatusCode != Globals.SUCCESS_STATUS_CODE)
            {
                StatusCode = Globals.FAILURE_STATUS_CODE;
                StatusDesc = nullCheckResult.StatusDesc;
                return false;
            }

            return base.IsValid();
        }
    }
}
