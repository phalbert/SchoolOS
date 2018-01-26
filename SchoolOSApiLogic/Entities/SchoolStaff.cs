﻿using System;
using System.Collections.Generic;
using System.Text;

namespace SchoolOSApiLogic.Entities
{
    public class SchoolStaff:Request
    {
        public string FullName = "";
        public string Gender = "";
        public string StaffCategory = "";//
        public string StaffType = ""; //Full time/Part time
        public string StaffIDNumber = "";
        public string PegPayStaffIDNumber = "";
        public string ProfilePic = "";
        public string PhoneNumber = "";
        public string Email = "";
        public string ApprovedBy = "";

        public override bool IsValid()
        {
            ProfilePic = string.IsNullOrEmpty(ProfilePic) ? Globals.DEFAULT_PICTURE_ID : ProfilePic;

            string propertiesThatCanBeNull = "StaffCategory|PegPayStaffIDNumber|Email|ApprovedBy";
            Result nullCheckResult = Globals.CheckForNulls(this, propertiesThatCanBeNull);

            if (nullCheckResult.StatusCode != Globals.SUCCESS_STATUS_CODE)
            {
                StatusCode = Globals.FAILURE_STATUS_CODE;
                StatusDesc = nullCheckResult.StatusDesc;
                return false;
            }

            if (!SharedCommons.SharedCommons.IsValidUgPhoneNumber(PhoneNumber))
            {
                StatusCode = Globals.FAILURE_STATUS_CODE;
                StatusDesc = $"INVALID PHONE NUMBER SUPPLIED IN field {nameof(PhoneNumber)}";
                return false;
            }

            if (!string.IsNullOrEmpty(PhoneNumber) && !SharedCommons.SharedCommons.IsValidUgPhoneNumber(PhoneNumber))
            {
                StatusCode = Globals.FAILURE_STATUS_CODE;
                StatusDesc = $"INVALID Student PHONE NUMBER SUPPLIED";
                return false;
            }

            if (!string.IsNullOrEmpty(Email) && !SharedCommons.SharedCommons.IsValidEmail(Email))
            {
                StatusCode = Globals.FAILURE_STATUS_CODE;
                StatusDesc = $"INVALID Staff EMAIL SUPPLIED";
                return false;
            }

            return base.IsValid();
        }
    }
}
