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
            if (string.IsNullOrEmpty(SchoolCode))
            {
                StatusCode = Globals.FAILURE_STATUS_CODE;
                StatusDesc = "PLEASE SUPPLY A SCHOOL CODE";
                return false;
            }
            if (string.IsNullOrEmpty(DepartmentCode))
            {
                StatusCode = Globals.FAILURE_STATUS_CODE;
                StatusDesc = "PLEASE SUPPLY A DEPT CODE";
                return false;
            }
            if (string.IsNullOrEmpty(DepartmentName))
            {
                StatusCode = Globals.FAILURE_STATUS_CODE;
                StatusDesc = "PLEASE SUPPLY A DEPT NAME ";
                return false;
            }

            return base.IsValid();
        }
    }
}
