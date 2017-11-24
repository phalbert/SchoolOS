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

        public Result SaveSchoolFee(Fee fee)
        {
            Result result = new Result();
            DataTable dt = dh.ExecuteDataSet("SaveSchoolFee", new string[] { fee.ModifiedBy }).Tables[0];

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
            DataTable dt = dh.ExecuteDataSet("SaveSubject", new string[] {sub.SchoolCode,sub.SubjectName,sub.SubjectCode, sub.ModifiedBy }).Tables[0];

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
            DataTable dt = dh.ExecuteDataSet("SaveSchoolStaff", new string[] {staff.SchoolCode,staff.FullName,staff.Gender,staff.StaffType,staff.StaffCategory,staff.StaffIDNumber,staff.PegPayStaffIDNumber,staff.ProfilePic, staff.ModifiedBy,staff.Email,staff.PhoneNumber }).Tables[0];

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
            DataTable dt = dh.ExecuteDataSet("SaveClassStream", new string[] {stream.SchoolCode,stream.StreamName,stream.StreamCode,stream.ClassCode,stream.ModifiedBy }).Tables[0];

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
            DataTable dt = dh.ExecuteDataSet("SaveSystemUser", new string[] { user.Username,user.Password,user.UserType,user.UserCategory,user.SecretKey, user.ModifiedBy }).Tables[0];

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
    }
}
