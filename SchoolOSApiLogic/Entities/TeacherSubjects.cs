using System;
using System.Collections.Generic;
using System.Text;

namespace SchoolOSApiLogic.Entities
{
    public class TeacherSubject : Request
    {
        public string TeacherId = "";
        public string ClassCode = "";
        public string StreamCode = "";
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
            if (string.IsNullOrEmpty(ClassCode))
            {
                StatusCode = Globals.FAILURE_STATUS_CODE;
                StatusDesc = "PLEASE SUPPLY A CLASS CODE";
                return false;
            }
            if (string.IsNullOrEmpty(StreamCode))
            {
                StatusCode = Globals.FAILURE_STATUS_CODE;
                StatusDesc = "PLEASE SUPPLY A STREAM CODE ";
                return false;
            }
            if (string.IsNullOrEmpty(SubjectCode))
            {
                StatusCode = Globals.FAILURE_STATUS_CODE;
                StatusDesc = "PLEASE SUPPLY A SUBJECT CODE ";
                return false;
            }
            if (string.IsNullOrEmpty(TermCode))
            {
                StatusCode = Globals.FAILURE_STATUS_CODE;
                StatusDesc = "PLEASE SUPPLY A TERM CODE ";
                return false;
            }

            return base.IsValid();
        }
    }
}
