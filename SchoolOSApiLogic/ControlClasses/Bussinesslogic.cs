﻿using System;
using System.Collections.Generic;
using System.Text;
using SchoolOSApiLogic.Entities;
using System.Data;
using System.Security.Cryptography;

namespace SchoolOSApiLogic.ControlClasses
{
    internal class Bussinesslogic
    {
        DatabaseHandler dh = new DatabaseHandler();
        SharedCommonsAPI.SharedCommonsAPI sharedCommons = new SharedCommonsAPI.SharedCommonsAPI();

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
            DataTable dt = dh.ExecuteDataSet("SaveSystemUser", new string[] { user.Username, user.VendorPassword, user.UserType, user.UserCategory, user.SecretKey, user.ModifiedBy }).Tables[0];

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
            DataTable dt = dh.ExecuteDataSet("SaveMainLink", new string[] { mainLink.SchoolCode, mainLink.MainLinkCode, mainLink.MainLinkName, mainLink.ModifiedBy }).Tables[0];

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

            SystemUser user = AuthenticateSystemUser(UserId, Password);

            if (user.StatusCode != Globals.SUCCESS_STATUS_CODE)
            {
                result.StatusCode = user.StatusCode;
                result.StatusDesc = user.StatusDesc;
                return result;
            }

            List<MenuItem> usersMenuOptions = GetUsersMenuItems(user);
            
            result.User = user;
            result.UserMenuOptions = usersMenuOptions;
            result.StatusCode = Globals.SUCCESS_STATUS_CODE;
            result.StatusDesc = Globals.SUCCESS_STATUS_DESC;
            result.PegPayID = UserId;
            result.RequestID = UserId;

            return result;
        }

        private List<MenuItem> GetUsersMenuItems(SystemUser user)
        {
            List<MenuItem> menuItems = new List<MenuItem>();
            DataTable dt = dh.ExecuteDataSet("GetUserMenuItems", user.UserCategory, user.UserType).Tables[0];

            if (dt.Rows.Count == 0)
            {
                return menuItems;
            }

            foreach(DataRow dr in dt.Rows)
            {
                MainLink mainLink = new MainLink();
                mainLink.MainLinkCode = dr["MainLinkCode"].ToString();
                mainLink.MainLinkName = dr["MainLinkName"].ToString();

                SubLink subLink = new SubLink();
                subLink.SubLinkCode = dr["SubLinkCode"].ToString();
                subLink.SubLinkName = dr["SubLinkName"].ToString();
                subLink.URL = dr["URL"].ToString();

                //check to see if we have already added this menu item link
                MenuItem menuItem = menuItems.Find(i => i.mainLink.MainLinkCode == mainLink.MainLinkCode);
                if (menuItem != null)
                {
                    //set values of menu item
                    menuItem.subLinks.Add(subLink);
                    menuItem.UserType = user.UserType;
                    menuItem.UserCategory = user.UserCategory;
                    continue;
                }


                menuItem = new MenuItem();
                menuItem.mainLink = mainLink;

                //set values of menu item
                menuItem.subLinks.Add(subLink);
                menuItem.UserType = user.UserType;
                menuItem.UserCategory = user.UserCategory;

                menuItems.Add(menuItem);

            }

            

            return menuItems;
        }

        private SystemUser AuthenticateSystemUser(string userId, string password)
        {
            SystemUser user = GetSystemUserById(userId);

            if (user.StatusCode != Globals.SUCCESS_STATUS_CODE)
            {
                user.StatusCode = Globals.FAILURE_STATUS_CODE;
                user.StatusDesc = "INVALID USERNAME/PASSWORD!!";
                return user;
            }
            
            string hashedPassword = GenearetHMACSha256Hash(user.SecretKey, password);

            if (user.UserPassword != hashedPassword)
            {
                user.StatusCode = Globals.FAILURE_STATUS_CODE;
                user.StatusDesc = "INVALID USERNAME/PASSWORD!";
                return user;
            }

            if (string.IsNullOrEmpty(user.ApprovedBy))
            {
                user.StatusCode = Globals.FAILURE_STATUS_CODE;
                user.StatusDesc = "YOUR ACCOUNT HAS NOT YET BEEN APPROVED. PLEASE CONTACT ADMINISTRATOR";
                return user;
            }

            return user;
        }

        public static string GenearetHMACSha256Hash(string secretPresharedKey, string message)
        {
            ASCIIEncoding encoding = new System.Text.ASCIIEncoding();
            byte[] keyByte = encoding.GetBytes(secretPresharedKey);
            byte[] messageBytes = encoding.GetBytes(message);
            using (var hmacsha256 = new HMACSHA256(keyByte))
            {
                byte[] hashmessage = hmacsha256.ComputeHash(messageBytes);
                string base64string = Convert.ToBase64String(hashmessage);
                string HmacHash = ByteArrayToString(hashmessage);
                return HmacHash;
            }
        }

        public static string ByteArrayToString(byte[] ba)
        {
            StringBuilder hex = new StringBuilder(ba.Length * 2);
            foreach (byte b in ba)
                hex.AppendFormat("{0:x2}", b);
            return hex.ToString();
        }

        private SystemUser GetSystemUserById(string userId)
        {
            SystemUser user = new SystemUser();
            DataTable dt = dh.ExecuteDataSet("GetSystemUserById", userId).Tables[0];
            if (dt.Rows.Count == 0)
            {
                user.StatusCode = Globals.FAILURE_STATUS_CODE;
                user.StatusDesc = $"USER [{userId}] NOT FOUND";
                return user;
            }
            DataRow row = dt.Rows[0];
            user.ApprovedBy = row["ApprovedBy"].ToString();
            user.SchoolCode= row["SchoolCode"].ToString();
            user.SecretKey= row["SecretKey"].ToString();
            user.UserCategory= row["UserCategory"].ToString();
            user.Username = userId;
            user.UserPassword= row["Password"].ToString();
            user.UserType= row["UserType"].ToString();
            user.StatusCode = Globals.SUCCESS_STATUS_CODE;
            user.StatusDesc = Globals.SUCCESS_STATUS_DESC;
            return user;
        }

        public Result SaveSubLink(SubLink sublink)
        {
            Result result = new Result();
            DataTable dt = dh.ExecuteDataSet("SaveSubLink", new string[] { sublink.SchoolCode, sublink.SubLinkCode, sublink.SubLinkName, sublink.ModifiedBy,sublink.URL }).Tables[0];

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

        public Result SaveMenu(MenuItem menu)
        {
            Result result = new Result();

            //foreach (var menuItem in menu.MenuItems)
            //{
            //    foreach (var sublink in menuItem.Value)
            //    {
            //        DataTable dt = dh.ExecuteDataSet("SaveMenuItem", new string[] { menu.SchoolCode, menuItem.Key.MainLinkCode, sublink.SubLinkCode, menu.ModifiedBy }).Tables[0];

            //        if (dt.Rows.Count == 0)
            //        {
            //            result.StatusCode = Globals.FAILURE_STATUS_CODE;
            //            result.StatusDesc = "NO ROWS AFFECTED";
            //            return result;
            //        }
            //    }
            //}

            result.StatusCode = Globals.SUCCESS_STATUS_CODE;
            result.StatusDesc = Globals.SUCCESS_STATUS_DESC;
            result.PegPayID = "";
            result.RequestID = menu.SchoolCode;

            return result;
        }

        public DataSet ExecuteDataSet(string StoredProc,params string[] Parameters)
        {
            return dh.ExecuteDataSet(StoredProc, Parameters);
        }

        public int ExecuteNonQuery(string StoredProc, params string[] Parameters)
        {
            return dh.ExecuteNonQuery(StoredProc, Parameters);
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
