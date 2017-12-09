using System;
using System.Collections.Generic;
using System.Text;

namespace SchoolOSApiLogic.Entities
{
    public class SystemUserDetails:Result
    {
        public SystemUser User = null;
        public List<MenuItem> UserMenuOptions = null;
    }
}
