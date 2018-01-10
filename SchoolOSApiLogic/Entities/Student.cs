using System;
using System.Collections.Generic;
using System.Text;

namespace SchoolOSApiLogic.Entities
{
    public class Student:Request
    {
        public string StudentNumber = "";
        public string PegPayStudentNumber = "";
        public string StudentName = "";
        public string DateOfBirth = "";
        public string ClassCode = "";
        public string StreamCode = "";
        public string StudentCategory = "";
        public string ProfilePic = "";
        public string Gender = "";
        public string Email = "";
        public string PhoneNumber = "";
        public string ParentsName1= "";
        public string ParentsName2 = "";
        public string ParentsPhoneNumber1 = "";
        public string ParentsPhoneNumber2 = "";

        public override bool IsValid()
        {
            ProfilePic = string.IsNullOrEmpty(ProfilePic) ? Globals.DEFAULT_PICTURE_ID : ProfilePic;

            if (string.IsNullOrEmpty(SchoolCode))
            {
                StatusCode = Globals.FAILURE_STATUS_CODE;
                StatusDesc = "PLEASE SUPPLY A SCHOOL CODE";
                return false;
            }
            if (string.IsNullOrEmpty(StudentName))
            {
                StatusCode = Globals.FAILURE_STATUS_CODE;
                StatusDesc = "PLEASE SUPPLY A STUDENT NAME";
                return false;
            }
            if (string.IsNullOrEmpty(DateOfBirth))
            {
                StatusCode = Globals.FAILURE_STATUS_CODE;
                StatusDesc = "PLEASE SUPPLY A STUDENT DATE OF BIRTH ";
                return false;
            }
            if (string.IsNullOrEmpty(ClassCode))
            {
                StatusCode = Globals.FAILURE_STATUS_CODE;
                StatusDesc = "PLEASE SUPPLY CLASS CODE ";
                return false;
            }
            if (string.IsNullOrEmpty(StreamCode))
            {
                StatusCode = Globals.FAILURE_STATUS_CODE;
                StatusDesc = "PLEASE SUPPLY A STREAM ";
                return false;
            }
            if (string.IsNullOrEmpty(StudentCategory))
            {
                StatusCode = Globals.FAILURE_STATUS_CODE;
                StatusDesc = "PLEASE SUPPLY STUDENT CATEGORY ";
                return false;
            }
            if (string.IsNullOrEmpty(PhoneNumber))
            {
                StatusCode = Globals.FAILURE_STATUS_CODE;
                StatusDesc = "PLEASE SUPPLY STUDENT's PHONE NUMBER. YOU CAN REUSE THE PARENTS NUMBER INCASE STUDENT HAS NO PHONE";
                return false;
            }
            if (string.IsNullOrEmpty(ParentsName1)&& string.IsNullOrEmpty(ParentsName2))
            {
                StatusCode = Globals.FAILURE_STATUS_CODE;
                StatusDesc = "PLEASE SUPPLY ATLEAST ONE PARENTS NAME ";
                return false;
            }
            if (string.IsNullOrEmpty(ParentsPhoneNumber1)&& string.IsNullOrEmpty(ParentsPhoneNumber2))
            {
                StatusCode = Globals.FAILURE_STATUS_CODE;
                StatusDesc = "PLEASE SUPPLY AT LEAST ONE PARENTS PHONE NUMBER. ";
                return false;
            }
            return base.IsValid();
        }


    }
}
