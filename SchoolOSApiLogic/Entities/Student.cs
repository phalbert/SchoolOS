using System;
using System.Collections.Generic;
using System.Text;

namespace SchoolOSApiLogic.Entities
{
    public class Student:Request
    {
        public string StudentNumber = "";
        public string PegPayStudentNumber = "";
        public string SchoolCode = "";
        public string StudentName = "";
        public string DateOfBirth = "";
        public string ClassCode = "";
        public string StreamCode = "";
        public string StudentCategory = "";




        public override bool IsValid()
        {
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
            return base.IsValid();
        }


    }
}
