using System;
using System.Collections.Generic;
using System.Text;

namespace SchoolOSApiLogic.Entities
{
    public class Menu : Request
    {
        public Dictionary<MainLink, SubLink[]> menuItems = new Dictionary<MainLink, SubLink[]>();
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
