using SchoolOSApiLogic.ControlClasses;
using System;
using System.Collections.Generic;
using System.Text;

namespace SchoolOSApiLogic.Entities
{
    public class School:Request
    {
        public string SchoolID = "";
        public string SchoolName = "";
        public string UnebCentreNumber = "";
        public string SchoolLocation = "";
        public string SchoolEmail = "";
        public string SchoolPhone = "";
        public string[] SchoolType = { };
        public string[] SchoolCategories = { };
        public string PlotNo = "";
        public string RoadName = "";
        public string SubCounty = "";
        public string District = "";
        public string PostOfficeBox = "";
        public string LiquidationBankName = "";
        public string LiquidationAccountName = "";
        public string LiquidationAccountNumber = "";
        public string SchoolLogo = "";
        internal string ApprovedBy = "";
       



        public override bool IsValid()
        {
            SchoolLogo = string.IsNullOrEmpty(SchoolLogo) ? Globals.DEFAULT_PICTURE_ID : SchoolLogo;

            string propertiesThatCanBeNull = "ApprovedBy|SchoolLocation|UnebCentreNumber|SchoolID";
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
