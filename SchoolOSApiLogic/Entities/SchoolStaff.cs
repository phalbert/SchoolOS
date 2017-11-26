using System;
using System.Collections.Generic;
using System.Text;

namespace SchoolOSApiLogic.Entities
{
    public class SchoolStaff:Request
    {
        public string FullName = "";
        public string Gender = "";
        public string StaffCategory = "";//
        public string StaffType = ""; //Full time/Part time
        public string StaffIDNumber = "";
        public string PegPayStaffIDNumber = "";
        public string ProfilePic = "";
        public string PhoneNumber = "";
        public string Email = "";

        public override bool IsValid()
        {
            if (string.IsNullOrEmpty(SchoolCode))
            {
                StatusCode = Globals.FAILURE_STATUS_CODE;
                StatusDesc = "PLEASE SUPPLY A SCHOOL CODE";
                return false;
            }
            if (string.IsNullOrEmpty(StaffIDNumber))
            {
                StatusCode = Globals.FAILURE_STATUS_CODE;
                StatusDesc = "PLEASE SUPPLY AN ID NUMBER";
                return false;
            }
           
            return base.IsValid();
        }
    }
}
