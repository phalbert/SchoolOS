using System;
using System.Collections.Generic;
using System.Text;

namespace SchoolOSApiLogic.Entities
{
    public class SystemUserDetails:Result
    {
        public string Username = "";
        public string UserPassword = "";
        public string UserType = "";
        public string UserCategory = "";
        public string SecretKey = "";
        public Menu UserMenuOptions = null;
    }
}
