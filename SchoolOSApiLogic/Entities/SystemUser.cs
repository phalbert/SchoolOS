using System;
using System.Collections.Generic;
using System.Text;

namespace SchoolOSApiLogic.Entities
{
    public class SystemUser:Request
    {
        public string Username = "";
        public string UserPassword = "";
        public string UserType = "";
        public string UserCategory = "";
        public string SecretKey = "";
        public string ApprovedBy = "";
        public string ProfilePic = "";
        public string FullName = "";
        public string IsActive = "";
        public string Email = "";
        public string PhoneNumber = "";

        public override bool IsValid()
        {
            ProfilePic = string.IsNullOrEmpty(ProfilePic) ? Globals.DEFAULT_PICTURE_ID : ProfilePic;

            string propertiesThatCanBeNull = "UserCategory|ApprovedBy|Email";
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
