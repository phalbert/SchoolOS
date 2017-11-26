using System;
using System.Collections.Generic;
using System.Text;

namespace SchoolOSApiLogic.Entities
{
   public class SchoolExams:Result
    {

        public string SchoolCode = "";
        public string ClassCode = "";
        public string SemesterCode = "";
        public string ExamName = "";
        public string ExamCode = "";
        public string ExamDate = "";

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
                StatusDesc = "PLEASE SUPPLY SCHOOL CLASS CODE";
                return false;
            }
            if (string.IsNullOrEmpty(SemesterCode))
            {
                StatusCode = Globals.FAILURE_STATUS_CODE;
                StatusDesc = "PLEASE SUPPLY A SEMESTER/TERM CODE";
                return false;
            }
            if (string.IsNullOrEmpty(ExamCode))
            {
                StatusCode = Globals.FAILURE_STATUS_CODE;
                StatusDesc = "PLEASE SUPPLY A EXAM CODE";
                return false;
            }
            if (string.IsNullOrEmpty(ExamName))
            {
                StatusCode = Globals.FAILURE_STATUS_CODE;
                StatusDesc = "PLEASE SUPPLY A EXAM NAME";
                return false;
            }

            return base.IsValid();
        }


    }
}
