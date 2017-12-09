using System;
using System.Collections.Generic;
using System.Text;

namespace SchoolOSApiLogic.Entities
{
    public class MenuItem : Request
    {
        public MainLink mainLink = new MainLink();
        public List<SubLink> subLinks = new List<SubLink>();
        public string UserType = "";
        public string UserCategory = "";

        public override bool IsValid()
        {
            if (string.IsNullOrEmpty(UserType))
            {
                StatusCode = Globals.FAILURE_STATUS_CODE;
                StatusDesc = "PLEASE SUPPLY A SUBLINK TEXT";
                return false;
            }
            

            return base.IsValid();
        }
    }
}
