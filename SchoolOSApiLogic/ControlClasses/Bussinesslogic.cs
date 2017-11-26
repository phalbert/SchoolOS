using System;
using System.Collections.Generic;
using System.Text;
using SchoolOSApiLogic.Entities;
using System.Data;

namespace SchoolOSApiLogic.ControlClasses
{
    internal class Bussinesslogic
    {
        DatabaseHandler dh = new DatabaseHandler();

        public Result SaveSchool(School sch)
        {
            Result result = new Result();
            DataTable dt = dh.ExecuteDataSet("SaveSchool", new string[] {sch.SchoolCode, sch.SchoolName,sch.SchoolLocation,sch.SchoolEmail,sch.SchoolPhone,sch.UnebCentreNumber,sch.ModifiedBy }).Tables[0];

            if (dt.Rows.Count == 0)
            {
                result.StatusCode = Globals.FAILURE_STATUS_CODE;
                result.StatusDesc = "NO ROWS AFFECTED";
                return result;
            }

            result.StatusCode = Globals.SUCCESS_STATUS_CODE;
            result.StatusDesc = Globals.SUCCESS_STATUS_DESC;
            result.PegPayID = dt.Rows[0][0].ToString();
            result.RequestID = sch.SchoolCode;

            return result;
        }

        public Result SaveStudent(Student std)
        {
            Result result = new Result();
            DataTable dt = dh.ExecuteDataSet("SaveStudent", new string[] { std.SchoolCode,std.StudentNumber,std.PegPayStudentNumber, std.StudentName, std.ClassCode, std.StreamCode, std.DateOfBirth, std.StudentCategory,std.ModifiedBy}).Tables[0];

            if (dt.Rows.Count == 0)
            {
                result.StatusCode = Globals.FAILURE_STATUS_CODE;
                result.StatusDesc = "NO ROWS AFFECTED";
                return result;
            }

            result.StatusCode = Globals.SUCCESS_STATUS_CODE;
            result.StatusDesc = Globals.SUCCESS_STATUS_DESC;
            result.PegPayID = dt.Rows[0][0].ToString();
            result.RequestID = std.StudentNumber;

            return result;
        }

        public Result SaveSchoolClass(SchoolClass schcls)
        {
            Result result = new Result();
            DataTable dt = dh.ExecuteDataSet("saveschoolclass", new string[] { schcls.SchoolCode, schcls.ClassCode, schcls.SchoolClassName,schcls.ModifiedBy }).Tables[0];

            if (dt.Rows.Count == 0)
            {
                result.StatusCode = Globals.FAILURE_STATUS_CODE;
                result.StatusDesc = "NO ROWS AFFECTED";
                return result;
            }

            result.StatusCode = Globals.SUCCESS_STATUS_CODE;
            result.StatusDesc = Globals.SUCCESS_STATUS_DESC;
            result.PegPayID = dt.Rows[0][0].ToString();
            result.RequestID = schcls.ClassCode;

            return result;
        }

        public Result SaveSchoolSemester(SchoolSemester sem)
        {
            Result result = new Result();
            DataTable dt = dh.ExecuteDataSet("SaveSchoolSemester", new string[] { sem.SchoolCode, sem.SemesterCode, sem.StartDate,sem.Enddate,sem.ModifiedBy }).Tables[0];

            if (dt.Rows.Count == 0)
            {
                result.StatusCode = Globals.FAILURE_STATUS_CODE;
                result.StatusDesc = "NO ROWS AFFECTED";
                return result;
            }

            result.StatusCode = Globals.SUCCESS_STATUS_CODE;
            result.StatusDesc = Globals.SUCCESS_STATUS_DESC;
            result.PegPayID = dt.Rows[0][0].ToString();
            result.RequestID = sem.SemesterCode;

            return result;
        }
        public Result SaveSchoolExam(SchoolExams Exam)
        {
            Result result = new Result();
            DataTable dt = dh.ExecuteDataSet("SaveSchoolExam", new string[] { Exam.SchoolCode,Exam.SemesterCode, Exam.ClassCode,Exam.ExamCode, Exam.ExamName, Exam.ExamDate, Exam.ModifiedBy }).Tables[0];

            if (dt.Rows.Count == 0)
            {
                result.StatusCode = Globals.FAILURE_STATUS_CODE;
                result.StatusDesc = "NO ROWS AFFECTED";
                return result;
            }

            result.StatusCode = Globals.SUCCESS_STATUS_CODE;
            result.StatusDesc = Globals.SUCCESS_STATUS_DESC;
            result.PegPayID = dt.Rows[0][0].ToString();
            result.RequestID = Exam.ExamCode;

            return result;
        }
        public Result SaveSchoolResult(SchoolResults schresults)
        {
            Result result = new Result();
            DataTable dt = dh.ExecuteDataSet("SaveSchoolResults", new string[] { schresults.SchoolCode, schresults.SemesterCode, schresults.ClassCode,schresults.SubjectCode, schresults.ExamCode, schresults.ResultCode, schresults.ResultName, schresults.ModifiedBy }).Tables[0];

            if (dt.Rows.Count == 0)
            {
                result.StatusCode = Globals.FAILURE_STATUS_CODE;
                result.StatusDesc = "NO ROWS AFFECTED";
                return result;
            }

            result.StatusCode = Globals.SUCCESS_STATUS_CODE;
            result.StatusDesc = Globals.SUCCESS_STATUS_DESC;
            result.PegPayID = dt.Rows[0][0].ToString();
            result.RequestID = schresults.ResultCode;

            return result;
        }

    }
}
