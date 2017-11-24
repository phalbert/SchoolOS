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

        public Result SaveSchoolFee(Fee fee)
        {
            Result result = new Result();
            try
            {
                if (!fee.IsValid())
                {
                    result.StatusCode = fee.StatusCode;
                    result.StatusDesc = fee.StatusDesc;
                    return result;
                }

                Bussinesslogic bll = new Bussinesslogic();
                result = bll.SaveSchoolFee(fee);
            }
            catch (Exception ex)
            {
                string msg = $"EXCEPTION: {ex.Message}";
                DatabaseHandler.LogError(msg, ex.StackTrace, fee.SchoolCode);
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

        public Result SaveSchoolStaff(SchoolStaff staff)
        {
            Result result = new Result();
            try
            {
                if (!staff.IsValid())
                {
                    result.StatusCode = staff.StatusCode;
                    result.StatusDesc = staff.StatusDesc;
                    return result;
                }

                Bussinesslogic bll = new Bussinesslogic();
                result = bll.SaveSchoolStaff(staff);
            }
            catch (Exception ex)
            {
                string msg = $"EXCEPTION: {ex.Message}";
                DatabaseHandler.LogError(msg, ex.StackTrace, staff.SchoolCode);
                result.StatusCode = Globals.FAILURE_STATUS_CODE;
                result.StatusDesc = msg;//"{0} is an {1}",0,1
            }
            return result;
        }

        public Result SaveClassStream(ClassStream stream)
        {
            Result result = new Result();
            try
            {
                if (!stream.IsValid())
                {
                    result.StatusCode = stream.StatusCode;
                    result.StatusDesc = stream.StatusDesc;
                    return result;
                }

                Bussinesslogic bll = new Bussinesslogic();
                result = bll.SaveClassStream(stream);
            }
            catch (Exception ex)
            {
                string msg = $"EXCEPTION: {ex.Message}";
                DatabaseHandler.LogError(msg, ex.StackTrace, stream.SchoolCode);
                result.StatusCode = Globals.FAILURE_STATUS_CODE;
                result.StatusDesc = msg;//"{0} is an {1}",0,1
            }
            return result;
        }

        public Result SaveSystemUser(SystemUser user)
        {
            Result result = new Result();
            try
            {
                if (!user.IsValid())
                {
                    result.StatusCode = user.StatusCode;
                    result.StatusDesc = user.StatusDesc;
                    return result;
                }

                Bussinesslogic bll = new Bussinesslogic();
                result = bll.SaveSystemUser(user);
            }
            catch (Exception ex)
            {
                string msg = $"EXCEPTION: {ex.Message}";
                DatabaseHandler.LogError(msg, ex.StackTrace, user.SchoolCode);
                result.StatusCode = Globals.FAILURE_STATUS_CODE;
                result.StatusDesc = msg;//"{0} is an {1}",0,1
            }
            return result;
        }

        public Result SaveSubject(Subject sub)
        {
            Result result = new Result();
            try
            {
                if (!sub.IsValid())
                {
                    result.StatusCode = sub.StatusCode;
                    result.StatusDesc = sub.StatusDesc;
                    return result;
                }

                Bussinesslogic bll = new Bussinesslogic();
                result = bll.SaveSubject(sub);
            }
            catch (Exception ex)
            {
                string msg = $"EXCEPTION: {ex.Message}";
                DatabaseHandler.LogError(msg, ex.StackTrace, sub.SchoolCode);
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
