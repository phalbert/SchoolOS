using System;
using System.Collections.Generic;
using System.Text;

namespace SchoolOSApiLogic.Entities
{
    public class SchoolFee : Request
    {
        public string FeeName = "";
        public string FeeID = "";
        public string FeeAmount = "";
        public string CurrencyCode = "";
        public string FeeCategory = "";
        public string FeeType = "";


        public override bool IsValid()
        {
            if (string.IsNullOrEmpty(SchoolCode))
            {
                StatusCode = Globals.FAILURE_STATUS_CODE;
                StatusDesc = "PLEASE SUPPLY A SCHOOL CODE";
                return false;
            }
            if (string.IsNullOrEmpty(FeeID))
            {
                StatusCode = Globals.FAILURE_STATUS_CODE;
                StatusDesc = "PLEASE SUPPLY A FEE ID";
                return false;
            }

            return base.IsValid();
        }

    }
}
