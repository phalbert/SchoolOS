using System;
using System.Collections.Generic;
using System.Text;

namespace SchoolOSApiLogic.Entities
{
    public class StudentSubject:Request
    {
        public string ClassCode = "";
        public string StudentId = "";
        public string SubjectCode = "";
        public string TermCode = "";

        public override bool IsValid()
        {
            if (string.IsNullOrEmpty(SchoolCode))
            {
                StatusCode = Globals.FAILURE_STATUS_CODE;
                StatusDesc = "PLEASE SUPPLY A SCHOOL CODE";
                return false;
            }
            if (string.IsNullOrEmpty(StudentId))
            {
                StatusCode = Globals.FAILURE_STATUS_CODE;
                StatusDesc = "PLEASE SUPPLY A DEPT CODE";
                return false;
            }
            if (string.IsNullOrEmpty(SubjectCode))
            {
                StatusCode = Globals.FAILURE_STATUS_CODE;
                StatusDesc = "PLEASE SUPPLY A DEPT NAME ";
                return false;
            }

            return base.IsValid();
        }
    }
}
