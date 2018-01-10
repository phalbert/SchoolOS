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
        public string FeeType = "";
        public string ApprovedBy = "";


        public override bool IsValid()
        {
            string propertiesThatCanBeNull = "ApprovedBy";
            Result nullCheckResult = Globals.CheckForNulls(this, propertiesThatCanBeNull);

            if (nullCheckResult.StatusCode != Globals.SUCCESS_STATUS_CODE)
            {
                StatusCode = Globals.FAILURE_STATUS_CODE;
                StatusDesc = nullCheckResult.StatusDesc;
                return false;
            }

            return base.IsValid();
        }

    }
}
