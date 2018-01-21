using SchoolOSApiLogic.ControlClasses;
using System;
using System.Collections.Generic;
using System.Text;

namespace SchoolOSApiLogic.Entities
{
    public class SubjectResults:Request
    {
        public string StudentId = "";
        public string SubjectCode = "";
        public string TermCode = "";
        public string ExamCode = "";
        public string Mark = "";
        public string Grade= "";

        public override bool IsValid()
        {
            
            string propertiesThatCanBeNull = "Grade";
            Result nullCheckResult = Globals.CheckForNulls(this, propertiesThatCanBeNull);

            if (nullCheckResult.StatusCode != Globals.SUCCESS_STATUS_CODE)
            {
                StatusCode = Globals.FAILURE_STATUS_CODE;
                StatusDesc = nullCheckResult.StatusDesc;
                return false;
            }

            if (!SharedCommons.SharedCommons.IsNumeric(Mark))
            {
                StatusCode = Globals.FAILURE_STATUS_CODE;
                StatusDesc = $"PLEASE SUPPLY A MARK FOR STUDENT [{StudentId}]";
                return false;
            }

            Bussinesslogic bll = new Bussinesslogic();
            Result result = bll.GetStudentGrade(StudentId, SchoolCode, Mark);

            if (result.StatusCode != Globals.SUCCESS_STATUS_CODE)
            {
                StatusCode = Globals.FAILURE_STATUS_CODE;
                StatusDesc = result.StatusDesc;
                return false;
            }

            Grade = result.ThirdPartyID;
            return base.IsValid();
        }

    }
}
