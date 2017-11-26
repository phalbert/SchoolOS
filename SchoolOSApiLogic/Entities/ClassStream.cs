using System;
using System.Collections.Generic;
using System.Text;

namespace SchoolOSApiLogic.Entities
{
    public class ClassStream:Request
    {
        public string ClassCode = "";
        public string StreamCode = "";
        public string StreamName = "";

        public override bool IsValid()
        {
            if (string.IsNullOrEmpty(SchoolCode))
            {
                StatusCode = Globals.FAILURE_STATUS_CODE;
                StatusDesc = "PLEASE SUPPLY A SCHOOL CODE";
                return false;
            }
            if (string.IsNullOrEmpty(StreamCode))
            {
                StatusCode = Globals.FAILURE_STATUS_CODE;
                StatusDesc = "PLEASE SUPPLY AN STREAM CODE";
                return false;
            }

            return base.IsValid();
        }
    }
}
