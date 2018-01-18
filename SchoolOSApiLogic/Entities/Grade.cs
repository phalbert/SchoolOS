using System;
using System.Collections.Generic;
using System.Text;

namespace SchoolOSApiLogic.Entities
{
    public class Grade : Request
    {
        public string GradeCode = "";
        public string GradeName = "";
        public string MinimumMark = "";
        public string MaximumMark = "";

        public override bool IsValid()
        {
            string propertiesThatCanBeNull = "";
            Result nullCheckResult = Globals.CheckForNulls(this, propertiesThatCanBeNull);

            if (nullCheckResult.StatusCode != Globals.SUCCESS_STATUS_CODE)
            {
                StatusCode = Globals.FAILURE_STATUS_CODE;
                StatusDesc = nullCheckResult.StatusDesc;
                return false;
            }

            if (!(SharedCommons.SharedCommons.GetIntFromStringDefaultsToZero(MinimumMark) < (SharedCommons.SharedCommons.GetIntFromStringDefaultsToZero(MaximumMark))))
            {
                StatusCode = Globals.FAILURE_STATUS_CODE;
                StatusDesc = "MINIMUM MARK MUST BE LESS THAN THE MAXIMUM MARK";
                return false;
            }

            return base.IsValid();
        }
    }
}
