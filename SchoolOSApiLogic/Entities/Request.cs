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

        public override bool IsValid()
        {
            Request anEntity = GetEntity();
            
            string propertiesThatCanBeNull = "VendorCode|VendorPassword|StatusCode|StatusDesc";
            Result nullCheckResult = Globals.CheckForNulls(anEntity, propertiesThatCanBeNull);

            if (nullCheckResult.StatusCode != Globals.SUCCESS_STATUS_CODE)
            {
                StatusCode = Globals.FAILURE_STATUS_CODE;
                StatusDesc = nullCheckResult.StatusDesc;
                return false;
            }

            StatusCode = Globals.SUCCESS_STATUS_CODE;
            StatusDesc = Globals.SUCCESS_STATUS_DESC;
            return true;
        }

        private Request GetEntity()
        {
            Request req = new Request();
            req.VendorCode = VendorCode;
            req.ModifiedBy = ModifiedBy;
            req.SchoolCode = SchoolCode;
            req.VendorPassword = VendorPassword;
            return req;
        }
    }
}
