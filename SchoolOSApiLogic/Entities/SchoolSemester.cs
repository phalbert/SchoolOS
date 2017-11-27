using System;
using System.Collections.Generic;
using System.Text;

namespace SchoolOSApiLogic.Entities
{
    public class SchoolSemester: Request
    {
        public string SemesterCode = "";
        public string StartDate ="" ;
        public string Enddate = "";

        public override bool IsValid()
        {
            if (string.IsNullOrEmpty(SchoolCode))
            {
                StatusCode = Globals.FAILURE_STATUS_CODE;
                StatusDesc = "PLEASE SUPPLY A SCHOOL CODE";
                return false;
            }
            if (string.IsNullOrEmpty(StartDate))
            {
                StatusCode = Globals.FAILURE_STATUS_CODE;
                StatusDesc = "PLEASE SUPPLY SCHOOL START DATE";
                return false;
            }
            if (string.IsNullOrEmpty(Enddate))
            {
                StatusCode = Globals.FAILURE_STATUS_CODE;
                StatusDesc = "PLEASE SUPPLY A CLOSE DATE ";
                return false;
            }

            return base.IsValid();
        }

    }
}
