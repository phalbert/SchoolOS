﻿using System;
using System.Collections.Generic;
using System.Text;

namespace SchoolOSApiLogic.Entities
{
    public class School:Request
    {
        public string SchoolID = "";
        public string SchoolCode = "";
        public string SchoolName = "";
        public string UnebCentreNumber = "";
        public string SchoolLocation = "";
        public string SchoolEmail = "";
        public string SchoolPhone = "";

        public override bool IsValid()
        {
            if (string.IsNullOrEmpty(SchoolCode))
            {
                StatusCode = Globals.FAILURE_STATUS_CODE;
                StatusDesc = "PLEASE SUPPLY A SCHOOL CODE";
                return false;
            }
            if (string.IsNullOrEmpty(SchoolName))
            {
                StatusCode = Globals.FAILURE_STATUS_CODE;
                StatusDesc = "PLEASE SUPPLY A SCHOOL NAME";
                return false;
            }
            return base.IsValid();
        }

    }
}
