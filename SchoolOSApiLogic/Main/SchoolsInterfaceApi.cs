using SchoolOSApiLogic.ControlClasses;
using SchoolOSApiLogic.Entities;
using System;
using System.Collections.Generic;
using System.Data;
using System.Text;

namespace SchoolOSApiLogic
{
    public class SchoolsInterfaceApi
    {
        //Do not declare global variables in here
        //Globals may prevent external initialization of this interface (if exception happens in Global variable initialization)
        //remember main API has no try catch

        public SystemUserDetails Login(string Username, string Password)
        {
            SystemUserDetails result = new SystemUserDetails();
            try
            {
                Bussinesslogic bll = new Bussinesslogic();
                result = bll.Login(Username, Password);
            }
            catch (Exception ex)
            {
                string msg = $"EXCEPTION: {ex.Message}";
                DatabaseHandler.LogError(msg, ex.StackTrace, Username);
                result.StatusCode = Globals.FAILURE_STATUS_CODE;
                result.StatusDesc = msg;//"{0} is an {1}",0,1
            }
            return result;
        }

        public DataSet ExecuteDataSet(string StoredProc, params object[] Parameters)
        {
            Bussinesslogic bll = new Bussinesslogic();
            return bll.ExecuteDataSet(StoredProc, Parameters);
        }

        public int ExecuteNonQuery(string StoredProc, params string[] Parameters)
        {
            Bussinesslogic bll = new Bussinesslogic();
            return bll.ExecuteNonQuery(StoredProc, Parameters);
        }

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

        public Result SaveSchoolFees(SchoolFee fee)
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

        public Result SaveStudentFees(StudentFee fee)
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
                result = bll.SaveStudentFees(fee);
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

        public Result SaveUserType(UserType type)
        {
            Result result = new Result();
            try
            {
                if (!type.IsValid())
                {
                    result.StatusCode = type.StatusCode;
                    result.StatusDesc = type.StatusDesc;
                    return result;
                }

                Bussinesslogic bll = new Bussinesslogic();
                result = bll.SaveUserType(type);
            }
            catch (Exception ex)
            {
                string msg = $"EXCEPTION: {ex.Message}";
                DatabaseHandler.LogError(msg, ex.StackTrace, type.SchoolCode);
                result.StatusCode = Globals.FAILURE_STATUS_CODE;
                result.StatusDesc = msg;//"{0} is an {1}",0,1
            }
            return result;
        }

        public Result SaveMainLink(MainLink link)
        {
            Result result = new Result();
            try
            {
                if (!link.IsValid())
                {
                    result.StatusCode = link.StatusCode;
                    result.StatusDesc = link.StatusDesc;
                    return result;
                }

                Bussinesslogic bll = new Bussinesslogic();
                result = bll.SaveMainLink(link);
            }
            catch (Exception ex)
            {
                string msg = $"EXCEPTION: {ex.Message}";
                DatabaseHandler.LogError(msg, ex.StackTrace, link.SchoolCode);
                result.StatusCode = Globals.FAILURE_STATUS_CODE;
                result.StatusDesc = msg;//"{0} is an {1}",0,1
            }
            return result;
        }

        public Result SaveSchoolTerm(SchoolTerm link)
        {
            Result result = new Result();
            try
            {
                if (!link.IsValid())
                {
                    result.StatusCode = link.StatusCode;
                    result.StatusDesc = link.StatusDesc;
                    return result;
                }

                Bussinesslogic bll = new Bussinesslogic();
                result = bll.SaveSchoolTerm(link);
            }
            catch (Exception ex)
            {
                string msg = $"EXCEPTION: {ex.Message}";
                DatabaseHandler.LogError(msg, ex.StackTrace, link.SchoolCode);
                result.StatusCode = Globals.FAILURE_STATUS_CODE;
                result.StatusDesc = msg;//"{0} is an {1}",0,1
            }
            return result;
        }

        public Result SaveSubLink(SubLink link)
        {

            Result result = new Result();
            try
            {
                if (!link.IsValid())
                {
                    result.StatusCode = link.StatusCode;
                    result.StatusDesc = link.StatusDesc;
                    return result;
                }

                Bussinesslogic bll = new Bussinesslogic();
                result = bll.SaveSubLink(link);
            }
            catch (Exception ex)
            {
                string msg = $"EXCEPTION: {ex.Message}";
                DatabaseHandler.LogError(msg, ex.StackTrace, link.SchoolCode);
                result.StatusCode = Globals.FAILURE_STATUS_CODE;
                result.StatusDesc = msg;//"{0} is an {1}",0,1
            }
            return result;
        }

        public Result SaveMenu(MenuItem menu)
        {

            Result result = new Result();
            try
            {
                if (!menu.IsValid())
                {
                    result.StatusCode = menu.StatusCode;
                    result.StatusDesc = menu.StatusDesc;
                    return result;
                }

                Bussinesslogic bll = new Bussinesslogic();
                result = bll.SaveMenuItem(menu);
            }
            catch (Exception ex)
            {
                string msg = $"EXCEPTION: {ex.Message}";
                DatabaseHandler.LogError(msg, ex.StackTrace, menu.SchoolCode);
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
