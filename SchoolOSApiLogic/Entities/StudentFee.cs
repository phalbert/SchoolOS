using System;
using System.Collections.Generic;
using System.Text;

namespace SchoolOSApiLogic.Entities
{
    public class StudentFee : Request
    {
        public string StudentID = "";
        public string ClassCode = "";
        public string FeeID = "";
        public string Email = "";
        public string Amount = "";
        public string FeeType = "";
        public string TranID = "";
        public string PaymentChannel = "";
        public string PaymentDate = "";

        public override bool IsValid()
        {
            string propertiesThatCanBeNull = "PaymentChannel|Email|PaymentDate";
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
