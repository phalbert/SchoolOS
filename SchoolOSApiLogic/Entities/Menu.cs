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
    }
}
