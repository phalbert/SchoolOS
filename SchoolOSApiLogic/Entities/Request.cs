using System;
using System.Collections.Generic;
using System.Text;

namespace SchoolOSApiLogic.Entities
{
    public class Request:Status
    {
        public string VendorCode = "";
        public string VendorPassword = "";
        public string SchoolCode = "";
        public string ModifiedBy = "";
    }
}
