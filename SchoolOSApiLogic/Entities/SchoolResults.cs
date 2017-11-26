using System;
using System.Collections.Generic;
using System.Text;

namespace SchoolOSApiLogic.Entities
{
   public class SchoolResults:Result
    {

        public string SchoolCode = "";
        public string SemesterCode = "";
        public string ClassCode = "";
        public string SubjectCode = "";
        public string ExamCode = "";
        public string ResultCode = "";
        public string ResultName = "";

        public override bool IsValid()
        {
            if (string.IsNullOrEmpty(SchoolCode))
            {
                StatusCode = Globals.FAILURE_STATUS_CODE;
                StatusDesc = "PLEASE SUPPLY A SCHOOL CODE";
                return false;
            }
            if (string.IsNullOrEmpty(SemesterCode))
            {
                StatusCode = Globals.FAILURE_STATUS_CODE;
                StatusDesc = "PLEASE SUPPLY SCHOOL SEMESTER CODE";
                return false;
            }
            if (string.IsNullOrEmpty(ClassCode))
            {
                StatusCode = Globals.FAILURE_STATUS_CODE;
                StatusDesc = "PLEASE SUPPLY A CLASS CODE ";
                return false;
            }
            if (string.IsNullOrEmpty(SubjectCode))
            {
                StatusCode = Globals.FAILURE_STATUS_CODE;
                StatusDesc = "PLEASE SUPPLY A SUBJECT CODE ";
                return false;
            }
            if (string.IsNullOrEmpty(ExamCode))
            {
                StatusCode = Globals.FAILURE_STATUS_CODE;
                StatusDesc = "PLEASE SUPPLY AN EXAM CODE ";
                return false;
            }
            if (string.IsNullOrEmpty(ResultCode))
            {
                StatusCode = Globals.FAILURE_STATUS_CODE;
                StatusDesc = "PLEASE SUPPLY RESULT CODE ";
                return false;
            }

            return base.IsValid();
        }
    }
}
