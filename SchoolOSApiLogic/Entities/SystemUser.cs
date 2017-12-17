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

        public override bool IsValid()
        {
            
            if (string.IsNullOrEmpty(Username))
            {
                StatusCode = Globals.FAILURE_STATUS_CODE;
                StatusDesc = "PLEASE SUPPLY A USERNAME";
                return false;
            }

            return base.IsValid();
        }
    }
}
