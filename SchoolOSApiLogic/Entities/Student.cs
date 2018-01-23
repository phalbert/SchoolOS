using System;
using System.Collections.Generic;
using System.Text;

namespace SchoolOSApiLogic.Entities
{
    public class Student : Request
    {
        public string StudentNumber = "";
        public string PegPayStudentNumber = "";
        public string StudentName = "";
        public string DateOfBirth = "";
        public string ClassCode = "";
        public string StreamCode = "";
        public string StudentCategory = "";
        public string ProfilePic = "";
        public string Gender = "";
        public string Email = "";
        public string PhoneNumber = "";
        public string ParentsName1 = "";
        public string ParentsName2 = "";
        public string ParentsPhoneNumber1 = "";
        public string ParentsPhoneNumber2 = "";
        public string IsActive = "";
        public string Password = "";
        public string SecretKey = "";

        public override bool IsValid()
        {
            ParentsName1 = string.IsNullOrEmpty(ParentsName1) ? Globals.NOT_AVAILABLE_STRING : ParentsName1;
            ParentsName2 = string.IsNullOrEmpty(ParentsName2) ? Globals.NOT_AVAILABLE_STRING : ParentsName2;
            ParentsPhoneNumber1 = string.IsNullOrEmpty(ParentsPhoneNumber1) ? Globals.NOT_AVAILABLE_STRING : ParentsPhoneNumber1;
            ParentsPhoneNumber2 = string.IsNullOrEmpty(ParentsPhoneNumber2) ? Globals.NOT_AVAILABLE_STRING : ParentsPhoneNumber2;
          
            ProfilePic = string.IsNullOrEmpty(ProfilePic) ? Globals.DEFAULT_PICTURE_ID : ProfilePic;

            string propertiesThatCanBeNull = "PegPayStudentNumber|StudentCategory|StreamCode|Email|PhoneNumber";
            Result nullCheckResult = Globals.CheckForNulls(this, propertiesThatCanBeNull);

            if (nullCheckResult.StatusCode != Globals.SUCCESS_STATUS_CODE)
            {
                StatusCode = Globals.FAILURE_STATUS_CODE;
                StatusDesc = nullCheckResult.StatusDesc;
                return false;
            }

            if(ParentsPhoneNumber1!=Globals.NOT_AVAILABLE_STRING && !SharedCommons.SharedCommons.IsValidUgPhoneNumber(ParentsPhoneNumber1))
            {
                StatusCode = Globals.FAILURE_STATUS_CODE;
                StatusDesc = $"INVALID PHONE NUMBER SUPPLIED IN {nameof(ParentsPhoneNumber1)}";
                return false;
            }

            if (ParentsPhoneNumber2 != Globals.NOT_AVAILABLE_STRING && !SharedCommons.SharedCommons.IsValidUgPhoneNumber(ParentsPhoneNumber2))
            {
                StatusCode = Globals.FAILURE_STATUS_CODE;
                StatusDesc = $"INVALID PHONE NUMBER SUPPLIED IN field {nameof(ParentsPhoneNumber1)}";
                return false;
            }
            return base.IsValid();
        }


    }
}
