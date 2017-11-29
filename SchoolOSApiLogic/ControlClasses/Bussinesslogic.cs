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
            DataTable dt = dh.ExecuteDataSet("SaveSchool", new string[] { sch.SchoolCode, sch.SchoolName, sch.SchoolLocation, sch.SchoolEmail, sch.SchoolPhone, sch.UnebCentreNumber, sch.ModifiedBy }).Tables[0];

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

        public Result SaveSchoolFee(SchoolFee fee)
        {
            Result result = new Result();
            DataTable dt = dh.ExecuteDataSet("SaveSchoolFees", new string[] {fee.FeeID,fee.FeeName,fee.FeeAmount,fee.CurrencyCode,fee.SchoolCode, fee.ModifiedBy }).Tables[0];

            if (dt.Rows.Count == 0)
            {
                result.StatusCode = Globals.FAILURE_STATUS_CODE;
                result.StatusDesc = "NO ROWS AFFECTED";
                return result;
            }

            result.StatusCode = Globals.SUCCESS_STATUS_CODE;
            result.StatusDesc = Globals.SUCCESS_STATUS_DESC;
            result.PegPayID = dt.Rows[0][0].ToString();
            result.RequestID = fee.SchoolCode;

            return result;
        }

        public Result SaveSubject(Subject sub)
        {
            Result result = new Result();
            DataTable dt = dh.ExecuteDataSet("SaveSubject", new string[] { sub.SchoolCode, sub.SubjectName, sub.SubjectCode, sub.ModifiedBy }).Tables[0];

            if (dt.Rows.Count == 0)
            {
                result.StatusCode = Globals.FAILURE_STATUS_CODE;
                result.StatusDesc = "NO ROWS AFFECTED";
                return result;
            }

            result.StatusCode = Globals.SUCCESS_STATUS_CODE;
            result.StatusDesc = Globals.SUCCESS_STATUS_DESC;
            result.PegPayID = dt.Rows[0][0].ToString();
            result.RequestID = sub.SchoolCode;

            return result;
        }

        public Result SaveSchoolStaff(SchoolStaff staff)
        {
            Result result = new Result();
            DataTable dt = dh.ExecuteDataSet("SaveSchoolStaff", new string[] { staff.SchoolCode, staff.FullName, staff.Gender, staff.StaffType, staff.StaffCategory, staff.StaffIDNumber, staff.PegPayStaffIDNumber, staff.ProfilePic, staff.ModifiedBy, staff.Email, staff.PhoneNumber }).Tables[0];

            if (dt.Rows.Count == 0)
            {
                result.StatusCode = Globals.FAILURE_STATUS_CODE;
                result.StatusDesc = "NO ROWS AFFECTED";
                return result;
            }

            result.StatusCode = Globals.SUCCESS_STATUS_CODE;
            result.StatusDesc = Globals.SUCCESS_STATUS_DESC;
            result.PegPayID = dt.Rows[0][0].ToString();
            result.RequestID = staff.SchoolCode;

            return result;
        }

        public Result SaveClassStream(ClassStream stream)
        {
            Result result = new Result();
            DataTable dt = dh.ExecuteDataSet("SaveClassStream", new string[] { stream.SchoolCode, stream.StreamName, stream.StreamCode, stream.ClassCode, stream.ModifiedBy }).Tables[0];

            if (dt.Rows.Count == 0)
            {
                result.StatusCode = Globals.FAILURE_STATUS_CODE;
                result.StatusDesc = "NO ROWS AFFECTED";
                return result;
            }

            result.StatusCode = Globals.SUCCESS_STATUS_CODE;
            result.StatusDesc = Globals.SUCCESS_STATUS_DESC;
            result.PegPayID = dt.Rows[0][0].ToString();
            result.RequestID = stream.SchoolCode;

            return result;
        }

        public Result SaveSystemUser(SystemUser user)
        {
            Result result = new Result();
            DataTable dt = dh.ExecuteDataSet("SaveSystemUser", new string[] { user.Username, user.Password, user.UserType, user.UserCategory, user.SecretKey, user.ModifiedBy }).Tables[0];

            if (dt.Rows.Count == 0)
            {
                result.StatusCode = Globals.FAILURE_STATUS_CODE;
                result.StatusDesc = "NO ROWS AFFECTED";
                return result;
            }

            result.StatusCode = Globals.SUCCESS_STATUS_CODE;
            result.StatusDesc = Globals.SUCCESS_STATUS_DESC;
            result.PegPayID = dt.Rows[0][0].ToString();
            result.RequestID = user.SchoolCode;

            return result;
        }

        public Result SaveStudent(Student std)
        {
            Result result = new Result();
            DataTable dt = dh.ExecuteDataSet("SaveStudent", new string[] { std.SchoolCode, std.StudentNumber, std.PegPayStudentNumber, std.StudentName, std.ClassCode, std.StreamCode, std.DateOfBirth, std.StudentCategory, std.ModifiedBy }).Tables[0];

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
            DataTable dt = dh.ExecuteDataSet("saveschoolclass", new string[] { schcls.SchoolCode, schcls.ClassCode, schcls.SchoolClassName, schcls.ModifiedBy }).Tables[0];

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
            DataTable dt = dh.ExecuteDataSet("SaveSchoolSemester", new string[] { sem.SchoolCode, sem.SemesterCode, sem.StartDate, sem.Enddate, sem.ModifiedBy }).Tables[0];

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

        public Result SaveUserType(UserType type)
        {
            Result result = new Result();
            DataTable dt = dh.ExecuteDataSet("SaveUserType", new string[] { type.SchoolCode, type.UserTypeCode, type.UserTypeName, type.ModifiedBy }).Tables[0];

            if (dt.Rows.Count == 0)
            {
                result.StatusCode = Globals.FAILURE_STATUS_CODE;
                result.StatusDesc = "NO ROWS AFFECTED";
                return result;
            }

            result.StatusCode = Globals.SUCCESS_STATUS_CODE;
            result.StatusDesc = Globals.SUCCESS_STATUS_DESC;
            result.PegPayID = dt.Rows[0][0].ToString();
            result.RequestID = type.SchoolCode;

            return result;
        }

        public Result SaveMainLink(MainLink mainLink)
        {
            Result result = new Result();
            DataTable dt = dh.ExecuteDataSet("SaveMainLink", new string[] { mainLink.SchoolCode, mainLink.MainLinkCode, mainLink.MainLinkText, mainLink.ModifiedBy }).Tables[0];

            if (dt.Rows.Count == 0)
            {
                result.StatusCode = Globals.FAILURE_STATUS_CODE;
                result.StatusDesc = "NO ROWS AFFECTED";
                return result;
            }

            result.StatusCode = Globals.SUCCESS_STATUS_CODE;
            result.StatusDesc = Globals.SUCCESS_STATUS_DESC;
            result.PegPayID = dt.Rows[0][0].ToString();
            result.RequestID = mainLink.SchoolCode;

            return result;
        }

        public SystemUserDetails Login(string UserId,string Password)
        {
            SystemUserDetails result = new SystemUserDetails();
            
            result.StatusCode = Globals.SUCCESS_STATUS_CODE;
            result.StatusDesc = Globals.SUCCESS_STATUS_DESC;
            result.PegPayID = "";
            result.RequestID = UserId;

            return result;
        }

        public Result SaveSubLink(SubLink sublink)
        {
            Result result = new Result();
            DataTable dt = dh.ExecuteDataSet("SaveSubLink", new string[] { sublink.SchoolCode, sublink.SubLinkCode, sublink.SubLinkText, sublink.ModifiedBy,sublink.URL }).Tables[0];

            if (dt.Rows.Count == 0)
            {
                result.StatusCode = Globals.FAILURE_STATUS_CODE;
                result.StatusDesc = "NO ROWS AFFECTED";
                return result;
            }

            result.StatusCode = Globals.SUCCESS_STATUS_CODE;
            result.StatusDesc = Globals.SUCCESS_STATUS_DESC;
            result.PegPayID = dt.Rows[0][0].ToString();
            result.RequestID = sublink.SchoolCode;

            return result;
        }

        public Result SaveMenu(Menu menu)
        {
            Result result = new Result();

            foreach (var menuItem in menu.menuItems)
            {
                foreach (var sublink in menuItem.Value)
                {
                    DataTable dt = dh.ExecuteDataSet("SaveMenuItem", new string[] { menu.SchoolCode, menuItem.Key.MainLinkCode, sublink.SubLinkCode, menu.ModifiedBy }).Tables[0];

                    if (dt.Rows.Count == 0)
                    {
                        result.StatusCode = Globals.FAILURE_STATUS_CODE;
                        result.StatusDesc = "NO ROWS AFFECTED";
                        return result;
                    }
                }
            }

            result.StatusCode = Globals.SUCCESS_STATUS_CODE;
            result.StatusDesc = Globals.SUCCESS_STATUS_DESC;
            result.PegPayID = "";
            result.RequestID = menu.SchoolCode;

            return result;
        }

        public Result SaveSchoolFees(SchoolFee fee)
        {
            Result result = new Result();
            DataTable dt = dh.ExecuteDataSet("SaveSchoolFees", new string[] { fee.FeeID, fee.FeeName, fee.FeeAmount,fee.CurrencyCode,fee.SchoolCode, fee.ModifiedBy }).Tables[0];

            if (dt.Rows.Count == 0)
            {
                result.StatusCode = Globals.FAILURE_STATUS_CODE;
                result.StatusDesc = "NO ROWS AFFECTED";
                return result;
            }

            result.StatusCode = Globals.SUCCESS_STATUS_CODE;
            result.StatusDesc = Globals.SUCCESS_STATUS_DESC;
            result.PegPayID = dt.Rows[0][0].ToString();
            result.RequestID = fee.FeeID;
            return result;
        }

        public Result SaveStudentFees(StudentFee fee)
        {
            Result result = new Result();
            DataTable dt = dh.ExecuteDataSet("SaveStudentFees", new string[] { fee.StudentID, fee.FeeID, fee.SchoolCode, fee.ModifiedBy }).Tables[0];

            if (dt.Rows.Count == 0)
            {
                result.StatusCode = Globals.FAILURE_STATUS_CODE;
                result.StatusDesc = "NO ROWS AFFECTED";
                return result;
            }

            result.StatusCode = Globals.SUCCESS_STATUS_CODE;
            result.StatusDesc = Globals.SUCCESS_STATUS_DESC;
            result.PegPayID = dt.Rows[0][0].ToString();
            result.RequestID = fee.FeeID;
            return result;
        }

    }
}
