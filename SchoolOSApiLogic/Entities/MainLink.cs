using System;
using System.Collections.Generic;
using System.Text;

namespace SchoolOSApiLogic.Entities
{
    public class MainLink:Request
    {
        public string MainLinkText = "";
        public string MainLinkCode = "";

        public override bool IsValid()
        {
            if (string.IsNullOrEmpty(MainLinkText))
            {
                StatusCode = Globals.FAILURE_STATUS_CODE;
                StatusDesc = "PLEASE SUPPLY A MAIN LINK TEXT";
                return false;
            }
            if (string.IsNullOrEmpty(MainLinkCode))
            {
                StatusCode = Globals.FAILURE_STATUS_CODE;
                StatusDesc = "PLEASE SUPPLY A MAIN LINK CODE";
                return false;
            }

            return base.IsValid();
        }
    }
}
