using System;
using System.Collections.Generic;
using System.Text;

namespace SchoolOSApiLogic.Entities
{
    public class SubLink:Request
    {
        public string SubLinkName = "";
        public string SubLinkCode = "";
        public string URL = "";

        public override bool IsValid()
        {
            if (string.IsNullOrEmpty(SubLinkName))
            {
                StatusCode = Globals.FAILURE_STATUS_CODE;
                StatusDesc = "PLEASE SUPPLY A SUBLINK TEXT";
                return false;
            }
            if (string.IsNullOrEmpty(SubLinkCode))
            {
                StatusCode = Globals.FAILURE_STATUS_CODE;
                StatusDesc = "PLEASE SUPPLY A SUBLINK CODE";
                return false;
            }
            if (string.IsNullOrEmpty(URL))
            {
                StatusCode = Globals.FAILURE_STATUS_CODE;
                StatusDesc = "PLEASE SUPPLY A URL";
                return false;
            }

            return base.IsValid();
        }
    }
}
