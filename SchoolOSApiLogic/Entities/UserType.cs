using System;
using System.Collections.Generic;
using System.Text;

namespace SchoolOSApiLogic.Entities
{
    public class UserType:Request
    {
        public string UserTypeCode = "";
        public string UserTypeName = "";

        public override bool IsValid()
        {
            if (string.IsNullOrEmpty(UserTypeName))
            {
                StatusCode = Globals.FAILURE_STATUS_CODE;
                StatusDesc = "PLEASE SUPPLY A USERTYPE NAME";
                return false;
            }
            if (string.IsNullOrEmpty(UserTypeCode))
            {
                StatusCode = Globals.FAILURE_STATUS_CODE;
                StatusDesc = "PLEASE SUPPLY A USERTYPE CODE";
                return false;
            }

            return base.IsValid();
        }
    }
}
