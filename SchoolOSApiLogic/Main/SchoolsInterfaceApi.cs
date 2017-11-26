using SchoolOSApiLogic.ControlClasses;
using SchoolOSApiLogic.Entities;
using System;
using System.Collections.Generic;
using System.Text;

namespace SchoolOSApiLogic
{
    public class SchoolsInterfaceApi
    {
        public Result SaveSchool(School sch)
        {
            Result result = new Result();
            try
            {
                if (!sch.IsValid())
                {
                    result.StatusCode = sch.StatusCode;
                    result.StatusDesc = sch.StatusDesc;
                    return result;
                }

                Bussinesslogic bll = new Bussinesslogic();
                result = bll.SaveSchool(sch);
            }
            catch (Exception ex)
            {
                string msg = $"EXCEPTION: {ex.Message}";
                DatabaseHandler.LogError(msg, ex.StackTrace, sch.SchoolCode);
                result.StatusCode = Globals.FAILURE_STATUS_CODE;
                result.StatusDesc = msg;//"{0} is an {1}",0,1
            }
            return result;
        }
        public Result SaveStudent(Student std)
        {
            Result result = new Result();
            try
            {
                if (!std.IsValid())
                {
                    result.StatusCode = std.StatusCode;
                    result.StatusDesc = std.StatusDesc;
                    return result;
                }

                Bussinesslogic bll = new Bussinesslogic();
                result = bll.SaveStudent(std);
            }
            catch (Exception ex)
            {
                string msg = $"EXCEPTION: {ex.Message}";
                DatabaseHandler.LogError(msg, ex.StackTrace, std.SchoolCode);
                result.StatusCode = Globals.FAILURE_STATUS_CODE;
                result.StatusDesc = msg;//"{0} is an {1}",0,1
            }
            return result;
        }

        public Result SaveSchoolClass(SchoolClass schcls)
        {
            Result result = new Result();
            try
            {
                if (!schcls.IsValid())
                {
                    result.StatusCode = schcls.StatusCode;
                    result.StatusDesc = schcls.StatusDesc;
                    return result;
                }

                Bussinesslogic bll = new Bussinesslogic();
                result = bll.SaveSchoolClass(schcls);
            }
            catch (Exception ex)
            {
                string msg = $"EXCEPTION: {ex.Message}";
                DatabaseHandler.LogError(msg, ex.StackTrace, schcls.ClassCode);
                result.StatusCode = Globals.FAILURE_STATUS_CODE;
                result.StatusDesc = msg;//"{0} is an {1}",0,1
            }
            return result;
        }

        public Result SaveSchoolSemester(SchoolSemester sem)
        {
            Result result = new Result();
            try
            {
                if (!sem.IsValid())
                {
                    result.StatusCode = sem.StatusCode;
                    result.StatusDesc = sem.StatusDesc;
                    return result;
                }

                Bussinesslogic bll = new Bussinesslogic();
                result = bll.SaveSchoolSemester(sem);
            }
            catch (Exception ex)
            {
                string msg = $"EXCEPTION: {ex.Message}";
                DatabaseHandler.LogError(msg, ex.StackTrace, sem.SemesterCode);
                result.StatusCode = Globals.FAILURE_STATUS_CODE;
                result.StatusDesc = msg;//"{0} is an {1}",0,1
            }
            return result;
        }

        public Result SaveSchoolExam(SchoolExams exam)
        {
            Result result = new Result();
            try
            {
                if (!exam.IsValid())
                {
                    result.StatusCode = exam.StatusCode;
                    result.StatusDesc = exam.StatusDesc;
                    return result;
                }

                Bussinesslogic bll = new Bussinesslogic();
                result = bll.SaveSchoolExam(exam);
            }
            catch (Exception ex)
            {
                string msg = $"EXCEPTION: {ex.Message}";
                DatabaseHandler.LogError(msg, ex.StackTrace, exam.ExamCode);
                result.StatusCode = Globals.FAILURE_STATUS_CODE;
                result.StatusDesc = msg;//"{0} is an {1}",0,1
            }
            return result;
        }

        public Result SaveSchoolResult(SchoolResults schresult)
        {
            Result result = new Result();
            try
            {
                if (!schresult.IsValid())
                {
                    result.StatusCode = schresult.StatusCode;
                    result.StatusDesc = schresult.StatusDesc;
                    return result;
                }

                Bussinesslogic bll = new Bussinesslogic();
                result = bll.SaveSchoolResult(schresult);
            }
            catch (Exception ex)
            {
                string msg = $"EXCEPTION: {ex.Message}";
                DatabaseHandler.LogError(msg, ex.StackTrace, schresult.ExamCode);
                result.StatusCode = Globals.FAILURE_STATUS_CODE;
                result.StatusDesc = msg;//"{0} is an {1}",0,1
            }
            return result;
        }
        public static void LogError(string message, string stackTrace, string Identifier)
        {
            DatabaseHandler.LogError(message, stackTrace, Identifier);
        }
    }
}
