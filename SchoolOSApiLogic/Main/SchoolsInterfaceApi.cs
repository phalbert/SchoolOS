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


        public static void LogError(string message, string stackTrace, string Identifier)
        {
            DatabaseHandler.LogError(message, stackTrace, Identifier);
        }
    }
}
