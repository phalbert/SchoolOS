using System;
using System.Collections.Generic;
using System.Text;
using SchoolOSApiLogic.Entities;
using System.Data;
using System.Security.Cryptography;
using System.Reflection;

namespace SchoolOSApiLogic.ControlClasses
{
    internal class Bussinesslogic
    {
        DatabaseHandler dh = new DatabaseHandler();
        SharedCommonsAPI.SharedCommonsAPI sharedCommons = new SharedCommonsAPI.SharedCommonsAPI();



        public Result SaveSchool(School sch)
        {
            Result result = new Result();
            LogChangesInAuditLog(sch, sch.SchoolCode, sch.SchoolCode, sch.ModifiedBy);
            string schoolType = GetArrayString(sch.SchoolType);
            string schoolCategory = GetArrayString(sch.SchoolCategories);
            DataTable dt = dh.ExecuteDataSet("SaveSchool", new string[] { sch.SchoolCode, sch.SchoolName, sch.SchoolMoto, sch.SchoolEmail, sch.SchoolPhone, sch.UnebCentreNumber, sch.ModifiedBy, sch.District, sch.SubCounty, sch.SchoolLogo, sch.RoadName, sch.PlotNo, sch.PostOfficeBox, sch.LiquidationBankName, sch.LiquidationAccountName, sch.LiquidationAccountNumber, schoolType, schoolCategory }).Tables[0];

            if (dt.Rows.Count == 0)
            {
                result.StatusCode = Globals.FAILURE_STATUS_CODE;
                result.StatusDesc = "NO ROWS AFFECTED";
                return result;
            }

            CB_BussinessLogic cbApi = new CB_BussinessLogic();
            Result cbResult = cbApi.CreateSchoolBankIfNotExists(sch);

            if (cbResult.StatusCode != Globals.SUCCESS_STATUS_CODE)
            {
                result.StatusCode = Globals.FAILURE_STATUS_CODE;
                result.StatusDesc = cbResult.StatusDesc;
                return result;
            }

            result.StatusCode = Globals.SUCCESS_STATUS_CODE;
            result.StatusDesc = Globals.SUCCESS_STATUS_DESC;
            result.PegPayID = sch.SchoolCode;//dt.Rows[dt.Rows.Count-1][0].ToString();
            result.ThirdPartyID = dt.Rows[dt.Rows.Count - 1][1].ToString();
            result.RequestID = sch.SchoolCode;

            return result;
        }

        internal Result GetStudentGrade(string studentId, string schoolCode, string mark)
        {
            Result result = new Result();
            DataTable dt = dh.ExecuteDataSet("GetStudentGrade", new string[] { studentId, schoolCode, mark }).Tables[0];

            if (dt.Rows.Count == 0)
            {
                result.StatusCode = Globals.FAILURE_STATUS_CODE;
                result.StatusDesc = $"UNABLE TO DETERMINE GRADE FOR MARK [{mark}] GIVEN TO STUDENT [{studentId}]";
                return result;
            }

            result.ThirdPartyID = dt.Rows[0][0].ToString();
            result.StatusCode = Globals.SUCCESS_STATUS_CODE;
            result.StatusDesc = Globals.SUCCESS_STATUS_DESC;
            return result;
        }

        public Result SaveGrade(Grade sch)
        {
            Result result = new Result();
            LogChangesInAuditLog(sch, sch.GradeCode, sch.SchoolCode, sch.ModifiedBy);
            DataTable dt = dh.ExecuteDataSet("SaveGrade", new string[] { sch.SchoolCode, sch.GradeName, sch.GradeCode, sch.MinimumMark, sch.MaximumMark, sch.ModifiedBy }).Tables[0];

            if (dt.Rows.Count == 0)
            {
                result.StatusCode = Globals.FAILURE_STATUS_CODE;
                result.StatusDesc = "NO ROWS AFFECTED";
                return result;
            }

            result.StatusCode = Globals.SUCCESS_STATUS_CODE;
            result.StatusDesc = Globals.SUCCESS_STATUS_DESC;
            result.PegPayID = dt.Rows[0][0].ToString();
            result.ThirdPartyID = "";
            result.RequestID = sch.GradeCode;

            return result;
        }

        private string GetArrayString(string[] list)
        {
            Array.Sort(list, (x, y) => String.Compare(x, y));
            string returnString = "";
            foreach (string item in list)
            {
                returnString += " " + item;
            }
            returnString = returnString.Trim();
            returnString = returnString.Replace(' ', '_');
            return returnString;
        }

        public Result SaveSchoolFee(SchoolFee fee)
        {
            Result result = new Result();
            LogChangesInAuditLog(fee, fee.FeeID, fee.SchoolCode, fee.ModifiedBy);
            DataTable dt = dh.ExecuteDataSet("SaveSchoolFees", new string[] { fee.FeeID, fee.FeeName, fee.FeeAmount, fee.CurrencyCode, fee.SchoolCode, fee.ModifiedBy }).Tables[0];

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
            LogChangesInAuditLog(sub, sub.SubjectCode, sub.SchoolCode, sub.ModifiedBy);
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
            LogChangesInAuditLog(staff, staff.StaffIDNumber, staff.SchoolCode, staff.ModifiedBy);
            DataTable dt = dh.ExecuteDataSet("SaveSchoolStaff", new string[] { staff.SchoolCode, staff.FullName, staff.Gender, staff.StaffType, staff.StaffCategory, staff.StaffIDNumber, staff.PegPayStaffIDNumber, staff.ProfilePic, staff.ModifiedBy, staff.Email, staff.PhoneNumber, staff.ApprovedBy }).Tables[0];

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
            LogChangesInAuditLog(stream, stream.StreamCode, stream.SchoolCode, stream.ModifiedBy);
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
            LogChangesInAuditLog(user, user.Username, user.SchoolCode, user.ModifiedBy);
            user.UserPassword = GenearetHMACSha256Hash(user.SecretKey, user.UserPassword);
            DataTable dt = dh.ExecuteDataSet("SaveSystemUser", new string[] { user.Username, user.UserPassword, user.UserType, user.UserCategory, user.SecretKey, user.ModifiedBy, user.ProfilePic, user.SchoolCode, user.FullName, user.IsActive, user.Email, user.PhoneNumber, user.ApprovedBy }).Tables[0];

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
            result.ThirdPartyID = dt.Rows[0][1].ToString();
            return result;
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

        public Result SaveStudent(Student std)
        {
            Result result = new Result();
            LogChangesInAuditLog(std, std.StudentNumber, std.SchoolCode, std.ModifiedBy);
            DataTable dt = dh.ExecuteDataSet("SaveStudent", new string[] { std.SchoolCode, std.StudentNumber, std.PegPayStudentNumber, std.StudentName, std.ClassCode, std.StreamCode, std.DateOfBirth, std.StudentCategory, std.ModifiedBy, std.ProfilePic, std.Email, std.Gender, std.PhoneNumber, std.ParentsName1, std.ParentsName2, std.ParentsPhoneNumber1, std.ParentsPhoneNumber2 }).Tables[0];

            if (dt.Rows.Count == 0)
            {
                result.StatusCode = Globals.FAILURE_STATUS_CODE;
                result.StatusDesc = "NO ROWS AFFECTED";
                return result;
            }

            std.PegPayStudentNumber = dt.Rows[0][2].ToString();
            CB_BussinessLogic cbApi = new CB_BussinessLogic();
            Result cbResult = cbApi.CreateStudentBankAccountIfNotExists(std);

            if (cbResult.StatusCode != Globals.SUCCESS_STATUS_CODE)
            {
                result.StatusCode = Globals.FAILURE_STATUS_CODE;
                result.StatusDesc = cbResult.StatusDesc;
                return result;
            }

            result.StatusCode = Globals.SUCCESS_STATUS_CODE;
            result.StatusDesc = Globals.SUCCESS_STATUS_DESC;
            result.PegPayID = dt.Rows[0][0].ToString();
            result.ThirdPartyID = dt.Rows[0][1].ToString();
            result.RequestID = std.StudentNumber;

            return result;
        }

        public Result SaveSchoolClass(SchoolClass schcls)
        {
            Result result = new Result();
            LogChangesInAuditLog(schcls, schcls.ClassCode, schcls.SchoolCode, schcls.ModifiedBy);
            DataTable dt = dh.ExecuteDataSet("saveschoolclass", new string[] { schcls.SchoolCode, schcls.ClassCode, schcls.ClassName, schcls.ModifiedBy }).Tables[0];

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

        public Result SaveDepartment(Department dept)
        {
            Result result = new Result();
            LogChangesInAuditLog(dept, dept.DepartmentCode, dept.SchoolCode, dept.ModifiedBy);
            DataTable dt = dh.ExecuteDataSet("SaveDepartment", new string[] { dept.SchoolCode, dept.DepartmentCode, dept.DepartmentName, dept.DepartmentCategory, dept.ModifiedBy }).Tables[0];

            if (dt.Rows.Count == 0)
            {
                result.StatusCode = Globals.FAILURE_STATUS_CODE;
                result.StatusDesc = "NO ROWS AFFECTED";
                return result;
            }

            result.StatusCode = Globals.SUCCESS_STATUS_CODE;
            result.StatusDesc = Globals.SUCCESS_STATUS_DESC;
            result.PegPayID = dt.Rows[0][0].ToString();
            result.RequestID = dept.DepartmentCode;

            return result;
        }

        public Result SaveExams(Exam dept)
        {
            Result result = new Result();
            LogChangesInAuditLog(dept, dept.ExamCode, dept.SchoolCode, dept.ModifiedBy);
            DataTable dt = dh.ExecuteDataSet("SaveExam", new string[] { dept.SchoolCode, dept.ExamCode, dept.ExamName, dept.ModifiedBy }).Tables[0];

            if (dt.Rows.Count == 0)
            {
                result.StatusCode = Globals.FAILURE_STATUS_CODE;
                result.StatusDesc = "NO ROWS AFFECTED";
                return result;
            }

            result.StatusCode = Globals.SUCCESS_STATUS_CODE;
            result.StatusDesc = Globals.SUCCESS_STATUS_DESC;
            result.PegPayID = dt.Rows[0][0].ToString();
            result.RequestID = dept.ExamCode;

            return result;
        }

        private void LogChangesInAuditLog(Request baseObj, string objectId, string BankCode, string modifiedBy)
        {
            try
            {
                //we use reflection to 
                //1. get the class of object passed
                //2.loop thru all properties of that class and get changes made
                AuditLog log = new AuditLog();
                //BaseObject type = GetById(baseObj.GetType().Name, objectId, BankCode, "");
                string changesMade = "";

                //this is an Update

                changesMade += "Saved " + baseObj.GetType().Name + " with ";
                log.ActionType = "UPDATE";
                FieldInfo[] newFields = baseObj.GetType().GetFields();

                foreach (FieldInfo newField in newFields)
                {
                    string newFieldName = newField.Name;
                    object obj = baseObj.GetType().GetField(newFieldName).GetValue(baseObj);
                    if (obj != null)
                    {
                        string newFieldValue =
                        changesMade += newFieldName + " = " + obj.ToString() + ", ";
                    }
                }



                log.BankCode = BankCode;
                log.Action = changesMade;
                log.ModifiedBy = modifiedBy;
                log.TableName = baseObj.GetType().Name;
                dh.InsertIntoAuditLog(log);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public Result SaveStudentSubject(StudentSubject dept)
        {
            Result result = new Result();
            LogChangesInAuditLog(dept, dept.StudentId, dept.SchoolCode, dept.ModifiedBy);
            DataTable dt = dh.ExecuteDataSet("SaveStudentSubject", new string[] { dept.StudentId, dept.SubjectCode, dept.TermCode, dept.SchoolCode, dept.ModifiedBy, dept.ClassCode }).Tables[0];

            if (dt.Rows.Count == 0)
            {
                result.StatusCode = Globals.FAILURE_STATUS_CODE;
                result.StatusDesc = "NO ROWS AFFECTED";
                return result;
            }

            result.StatusCode = Globals.SUCCESS_STATUS_CODE;
            result.StatusDesc = Globals.SUCCESS_STATUS_DESC;
            result.PegPayID = dt.Rows[0][0].ToString();
            result.RequestID = dept.StudentId;

            return result;
        }

        public Result SaveUploadedFile(UploadedFile file)
        {
            Result result = new Result();
            LogChangesInAuditLog(file, file.FileName, file.SchoolCode, file.ModifiedBy);
            Byte[] array = Convert.FromBase64String(file.FileContents);
            DataTable dt = dh.ExecuteDataSet("SaveUploadedFile", new object[] { file.SchoolCode, file.OperationCode, array, file.ModifiedBy, file.FileName, file.Email, file.Channel, file.SPCode }).Tables[0];

            if (dt.Rows.Count == 0)
            {
                result.StatusCode = Globals.FAILURE_STATUS_CODE;
                result.StatusDesc = "NO ROWS AFFECTED";
                return result;
            }

            result.StatusCode = Globals.SUCCESS_STATUS_CODE;
            result.StatusDesc = Globals.SUCCESS_STATUS_DESC;
            result.PegPayID = dt.Rows[0][0].ToString();
            result.RequestID = file.ModifiedBy;

            return result;
        }

        public Result SaveTeacherSubject(TeacherSubject tch)
        {
            Result result = new Result();
            LogChangesInAuditLog(tch, tch.TeacherId, tch.SchoolCode, tch.ModifiedBy);
            DataTable dt = dh.ExecuteDataSet("SaveTeacherSubject", new object[] { tch.TeacherId, tch.ClassCode, tch.StreamCode, tch.SubjectCode, tch.TermCode, tch.SchoolCode, tch.ModifiedBy }).Tables[0];

            if (dt.Rows.Count == 0)
            {
                result.StatusCode = Globals.FAILURE_STATUS_CODE;
                result.StatusDesc = "NO ROWS AFFECTED";
                return result;
            }

            result.StatusCode = Globals.SUCCESS_STATUS_CODE;
            result.StatusDesc = Globals.SUCCESS_STATUS_DESC;
            result.PegPayID = dt.Rows[0][0].ToString();
            result.RequestID = tch.ModifiedBy;

            return result;
        }



        public Result SaveSubjectResult(SubjectResults dept)
        {
            Result result = new Result();
            LogChangesInAuditLog(dept, dept.SubjectCode, dept.SchoolCode, dept.ModifiedBy);
            DataTable dt = dh.ExecuteDataSet("SaveSubjectResults", new string[] { dept.SchoolCode, dept.SubjectCode, dept.StudentId, dept.TermCode, dept.Mark, dept.Grade, dept.ModifiedBy, dept.ExamCode }).Tables[0];

            if (dt.Rows.Count == 0)
            {
                result.StatusCode = Globals.FAILURE_STATUS_CODE;
                result.StatusDesc = "NO ROWS AFFECTED";
                return result;
            }

            result.StatusCode = Globals.SUCCESS_STATUS_CODE;
            result.StatusDesc = Globals.SUCCESS_STATUS_DESC;
            result.PegPayID = dt.Rows[0][0].ToString();
            result.RequestID = dept.StudentId;

            return result;
        }



        public Result SaveUserType(UserType type)
        {
            Result result = new Result();
            LogChangesInAuditLog(type, type.UserTypeCode, type.SchoolCode, type.ModifiedBy);
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
            LogChangesInAuditLog(mainLink, mainLink.MainLinkCode, mainLink.SchoolCode, mainLink.ModifiedBy);
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
            result.RequestID = mainLink.MainLinkCode;

            return result;
        }

        public Result SaveSchoolTerm(SchoolTerm term)
        {
            Result result = new Result();
            LogChangesInAuditLog(term, term.TermCode, term.SchoolCode, term.ModifiedBy);
            DataTable dt = dh.ExecuteDataSet("SaveSchoolTerm", new string[] { term.TermName, term.TermCode, term.StartDate, term.EndDate, term.SchoolCode, term.ModifiedBy }).Tables[0];

            if (dt.Rows.Count == 0)
            {
                result.StatusCode = Globals.FAILURE_STATUS_CODE;
                result.StatusDesc = "NO ROWS AFFECTED";
                return result;
            }

            result.StatusCode = Globals.SUCCESS_STATUS_CODE;
            result.StatusDesc = Globals.SUCCESS_STATUS_DESC;
            result.PegPayID = dt.Rows[0][0].ToString();
            result.RequestID = term.TermCode;

            return result;
        }

        public Result LogError(string Identifier, string StackTrace, string schoolCode, string Message, string ErrorType)
        {
            Result result = new Result();
            try
            {
                int rowsAffected = dh.ExecuteNonQuery("LogError", new string[] { Identifier, StackTrace, schoolCode, Message, ErrorType });
                result.StatusCode = Globals.SUCCESS_STATUS_CODE;
                result.StatusDesc = Globals.SUCCESS_STATUS_DESC;
            }
            catch (Exception ex)
            {
                result.StatusCode = Globals.FAILURE_STATUS_CODE;
                result.StatusDesc = "EXCPTION: " + ex.Message;
            }
            return result;
        }

        public SystemUserDetails Login(string UserId, string Password)
        {
            SystemUserDetails result = new SystemUserDetails();
            SaveInAuditlog("LOGIN", "", "ALL", UserId, "Login Attempt");
            SystemUser user = AuthenticateSystemUser(UserId, Password);

            if (user.StatusCode != Globals.SUCCESS_STATUS_CODE)
            {
                result.StatusCode = user.StatusCode;
                result.StatusDesc = user.StatusDesc;
                return result;
            }

            string currentSchoolTerm = dh.ExecuteDataSet("GetCurrentSchoolTerm", user.SchoolCode).Tables[0].Rows[0][0].ToString();
            List<MenuItem> usersMenuOptions = GetUsersMenuItems(user);
            School sch = AuthenticateSchool(user.SchoolCode);

            if (sch.StatusCode != Globals.SUCCESS_STATUS_CODE)
            {
                result.StatusCode = sch.StatusCode;
                result.StatusDesc = sch.StatusDesc;
                return result;
            }

            result.CurrentSemesterCode = currentSchoolTerm;
            result.SchoolDetails = sch;
            result.User = user;
            result.UserMenuOptions = usersMenuOptions;
            result.StatusCode = Globals.SUCCESS_STATUS_CODE;
            result.StatusDesc = Globals.SUCCESS_STATUS_DESC;
            result.PegPayID = UserId;
            result.RequestID = UserId;
            SaveInAuditlog("LOGIN", "", "ALL", UserId, "Successfull Login");
            return result;
        }

        private void SaveInAuditlog(string ActionType, string TableName, string BankCode, string ModifiedBy, string Action)
        {

            try
            {
                DataTable datatable = dh.ExecuteDataSet("InsertIntoAuditTrail",
                                                               new string[]
                                                       {
                                                             ActionType,
                                                             TableName,
                                                             BankCode,
                                                             ModifiedBy,
                                                             Action
                                                       }).Tables[0];
                //return datatable.Rows[0][0].ToString();
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }

        public SystemUserDetails StudentLogin(string UserId, string Password, string SchoolCode)
        {
            SystemUserDetails result = new SystemUserDetails();

            SystemUser user = AuthenticateStudent(UserId, Password, SchoolCode);

            if (user.StatusCode != Globals.SUCCESS_STATUS_CODE)
            {
                result.StatusCode = user.StatusCode;
                result.StatusDesc = user.StatusDesc;
                return result;
            }

            string currentSchoolTerm = dh.ExecuteDataSet("GetCurrentSchoolTerm", user.SchoolCode).Tables[0].Rows[0][0].ToString();
            List<MenuItem> usersMenuOptions = GetUsersMenuItems(user);
            School sch = AuthenticateSchool(user.SchoolCode);

            if (sch.StatusCode != Globals.SUCCESS_STATUS_CODE)
            {
                result.StatusCode = sch.StatusCode;
                result.StatusDesc = sch.StatusDesc;
                return result;
            }

            result.CurrentSemesterCode = currentSchoolTerm;
            result.SchoolDetails = sch;
            result.User = user;
            result.UserMenuOptions = usersMenuOptions;
            result.StatusCode = Globals.SUCCESS_STATUS_CODE;
            result.StatusDesc = Globals.SUCCESS_STATUS_DESC;
            result.PegPayID = UserId;
            result.RequestID = UserId;

            return result;
        }

        private SystemUser AuthenticateStudent(string userId, string password, string schoolCode)
        {
            SystemUser user = new SystemUser();

            if (string.IsNullOrEmpty(userId))
            {
                user.StatusCode = Globals.FAILURE_STATUS_CODE;
                user.StatusDesc = "PLEASE SUPPLY A USER NAME";
                SaveInAuditlog("LOGIN", "", schoolCode, userId, "Failed Login Attempt:" + user.StatusDesc);
                return user;
            }


            if (string.IsNullOrEmpty(password))
            {
                user.StatusCode = Globals.FAILURE_STATUS_CODE;
                user.StatusDesc = "PLEASE SUPPLY A PASSWORD";
                SaveInAuditlog("LOGIN", "", schoolCode, userId, "Failed Login Attempt:" + user.StatusDesc);
                return user;
            }

            Student std = GetStudentById(userId, schoolCode);
            user = GetSystemUserFromStudent(std);

            if (user.StatusCode != Globals.SUCCESS_STATUS_CODE)
            {
                SaveInAuditlog("LOGIN", "", schoolCode, userId, "Failed Login Attempt:" + user.StatusDesc);
                user.StatusCode = Globals.FAILURE_STATUS_CODE;
                user.StatusDesc = "INVALID USERNAME/PASSWORD!!";
                return user;
            }

            string hashedPassword = GenearetHMACSha256Hash(user.SecretKey, password);

            if (user.UserPassword != hashedPassword)
            {
                user.StatusCode = Globals.FAILURE_STATUS_CODE;
                user.StatusDesc = "INVALID USERNAME/PASSWORD!";
                SaveInAuditlog("LOGIN", "", schoolCode, userId, "Failed Login Attempt:INVALID PASSWORD SUPPLIED");
                return user;
            }

            return user;
        }

        private SystemUser GetSystemUserFromStudent(Student std)
        {
            SystemUser user = new SystemUser();
            user.ApprovedBy = "";
            user.SchoolCode = std.SchoolCode;
            user.SecretKey = std.SecretKey;
            user.UserCategory = "SCHOOL_STUDENT";
            user.Username = std.StudentNumber;
            user.UserPassword = std.Password;
            user.UserType = "SCHOOL_STUDENT";
            user.ProfilePic = std.ProfilePic;
            user.FullName = std.StudentName;
            user.Email = std.Email;
            user.PhoneNumber = std.PhoneNumber;
            user.StatusCode = Globals.SUCCESS_STATUS_CODE;
            user.StatusDesc = Globals.SUCCESS_STATUS_DESC;
            return user;
        }

        public Student GetStudentById(string studentId, string schoolCode)
        {
            Student sch = new Student();
            DataTable dt = dh.ExecuteDataSet("GetStudentById", new string[] { studentId, schoolCode }).Tables[0];
            if (dt.Rows.Count == 0)
            {
                sch.StatusCode = Globals.FAILURE_STATUS_CODE;
                sch.StatusDesc = "STUDENT [" + studentId + "] NOT FOUND";
                return sch;
            }

            DataRow row = dt.Rows[0];
            sch.SchoolCode = row["SchoolCode"].ToString();
            sch.ClassCode = row["ClassCode"].ToString();
            sch.DateOfBirth = row["DateOfBirth"].ToString();
            sch.Email = row["Email"].ToString();
            sch.Gender = row["Gender"].ToString();
            sch.ModifiedBy = row["ModifiedBy"].ToString();
            sch.PegPayStudentNumber = row["PegPayStudentNumber"].ToString();
            sch.PhoneNumber = row["PhoneNumber"].ToString();
            sch.ProfilePic = row["StudentPic"].ToString();
            sch.StreamCode = row["StreamCode"].ToString();
            sch.StudentCategory = row["StudentCategory"].ToString();
            sch.StudentName = row["StudentName"].ToString();
            sch.StudentNumber = row["StudentNumber"].ToString();
            sch.ParentsName1 = row["ParentsName1"].ToString();
            sch.ParentsName2 = row["ParentsName2"].ToString();
            sch.ParentsPhoneNumber1 = row["ParentsPhoneNumber1"].ToString();
            sch.ParentsPhoneNumber2 = row["ParentsPhoneNumber2"].ToString();
            sch.Password = row["Password"].ToString();
            sch.SecretKey = row["SecretKey"].ToString();
            sch.IsActive = row["IsActive"].ToString();
            sch.StatusCode = Globals.SUCCESS_STATUS_CODE;
            sch.StatusDesc = "SUCCESS";
            return sch;
        }

        private School GetSchoolById(string Id)
        {
            School sch = new School();
            DataTable dt = dh.ExecuteDataSet("GetSchoolById", Id).Tables[0];

            if (dt.Rows.Count == 0)
            {
                sch.StatusCode = Globals.FAILURE_STATUS_CODE;
                sch.StatusDesc = $"NOT FOUND";
                return sch;
            }

            DataRow row = dt.Rows[0];
            sch.ApprovedBy = row["ApprovedBy"].ToString();
            sch.SchoolCode = row["SchoolCode"].ToString();
            sch.District = row["District"].ToString();
            sch.LiquidationAccountName = row["LiquidationAccountName"].ToString();
            sch.LiquidationAccountNumber = row["LiquidationAccountNumber"].ToString();
            sch.LiquidationBankName = row["LiquidationBankName"].ToString();
            sch.ModifiedBy = row["ModifiedBy"].ToString();
            sch.PlotNo = row["PlotNo"].ToString();
            sch.PostOfficeBox = row["PostOfficeBox"].ToString();
            sch.RoadName = row["RoadName"].ToString();
            sch.SchoolEmail = row["SchoolEmail"].ToString();
            sch.SchoolMoto = row["SchoolMoto"].ToString();
            sch.SchoolLogo = row["SchoolLogo"].ToString();
            sch.SchoolName = row["SchoolName"].ToString();
            sch.SchoolPhone = row["SchoolPhone"].ToString();
            sch.SubCounty = row["SubCounty"].ToString();
            sch.UnebCentreNumber = row["UnebCenterNumber"].ToString();
            sch.SchoolCategories = row["SchoolCategory"].ToString().Split('_');
            sch.SchoolType = row["SchoolType"].ToString().Split('_');
            sch.StatusCode = Globals.SUCCESS_STATUS_CODE;
            sch.StatusDesc = Globals.SUCCESS_STATUS_DESC;
            return sch;
        }

        private List<MenuItem> GetUsersMenuItems(SystemUser user)
        {
            List<MenuItem> menuItems = new List<MenuItem>();
            DataTable dt = dh.ExecuteDataSet("GetUserMenuItems", user.UserType, user.UserType, user.SchoolCode).Tables[0];

            if (dt.Rows.Count == 0)
            {
                return menuItems;
            }

            foreach (DataRow dr in dt.Rows)
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

        private School AuthenticateSchool(string schoolId)
        {
            School sch = new School();

            if (string.IsNullOrEmpty(schoolId))
            {
                sch.StatusCode = Globals.FAILURE_STATUS_CODE;
                sch.StatusDesc = "NO SCHOOL ID FOUND";
                SaveInAuditlog("LOGIN", "", "ALL", schoolId, "Failed Login Attempt:" + sch.StatusDesc);
                return sch;
            }

            sch = GetSchoolById(schoolId);

            //not found
            if (sch.StatusCode != Globals.SUCCESS_STATUS_CODE)
            {
                SaveInAuditlog("LOGIN", "", "ALL", schoolId, "Failed Login Attempt:" + sch.StatusDesc);
                return sch;
            }

            //not approved
            if (string.IsNullOrEmpty(sch.ApprovedBy))
            {
                sch.StatusCode = Globals.FAILURE_STATUS_CODE;
                sch.StatusDesc = $"SCHOOL [{sch.SchoolCode}] HAS NOT YET BEEN APPROVED";
                SaveInAuditlog("LOGIN", "", "ALL", schoolId, "Failed Login Attempt:" + sch.StatusDesc);
                return sch;
            }

            return sch;
        }

        private SystemUser AuthenticateSystemUser(string userId, string password)
        {
            SystemUser user = new SystemUser();

            if (string.IsNullOrEmpty(userId))
            {
                user.StatusCode = Globals.FAILURE_STATUS_CODE;
                user.StatusDesc = "PLEASE SUPPLY A USER NAME";
                return user;
            }


            if (string.IsNullOrEmpty(password))
            {
                user.StatusCode = Globals.FAILURE_STATUS_CODE;
                user.StatusDesc = "PLEASE SUPPLY A PASSWORD";
                return user;
            }

            user = GetSystemUserById(userId);

            if (user.StatusCode != Globals.SUCCESS_STATUS_CODE)
            {
                SaveInAuditlog("LOGIN", "", "ALL", userId, "Failed Login Attempt:"+user.StatusDesc);
                user.StatusCode = Globals.FAILURE_STATUS_CODE;
                user.StatusDesc = "INVALID USERNAME/PASSWORD!!";
                return user;
            }

            string hashedPassword = GenearetHMACSha256Hash(user.SecretKey, password);

            if (user.UserPassword != hashedPassword)
            {
                SaveInAuditlog("LOGIN", "", "ALL", userId, "Failed Login Attempt:INVALID PASSWORD SUPPLIED");
                user.StatusCode = Globals.FAILURE_STATUS_CODE;
                user.StatusDesc = "INVALID USERNAME/PASSWORD!";
                return user;
            }

            if (string.IsNullOrEmpty(user.ApprovedBy))
            {
                user.StatusCode = Globals.FAILURE_STATUS_CODE;
                user.StatusDesc = "YOUR ACCOUNT HAS NOT YET BEEN APPROVED. PLEASE CONTACT ADMINISTRATOR";
                SaveInAuditlog("LOGIN", "", "ALL", userId, "Failed Login Attempt:" + user.StatusDesc);
                return user;
            }

            return user;
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
            user.SchoolCode = row["SchoolCode"].ToString();
            user.SecretKey = row["SecretKey"].ToString();
            user.UserCategory = row["UserCategory"].ToString();
            user.Username = userId;
            user.UserPassword = row["Password"].ToString();
            user.UserType = row["UserType"].ToString();
            user.ProfilePic = row["ProfilePic"].ToString();
            user.FullName = row["FullName"].ToString();
            user.Email = row["Email"].ToString();
            user.PhoneNumber = row["PhoneNumber"].ToString();
            user.StatusCode = Globals.SUCCESS_STATUS_CODE;
            user.StatusDesc = Globals.SUCCESS_STATUS_DESC;
            return user;
        }

        public Result SaveSubLink(SubLink sublink)
        {
            Result result = new Result();
            LogChangesInAuditLog(sublink, sublink.SubLinkCode, sublink.SchoolCode, sublink.ModifiedBy);
            DataTable dt = dh.ExecuteDataSet("SaveSubLink", new string[] { sublink.SchoolCode, sublink.SubLinkCode, sublink.SubLinkName, sublink.ModifiedBy, sublink.URL }).Tables[0];

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

        public Result SaveMenuItem(MenuItem menu)
        {
            Result result = new Result();

            foreach (var sublink in menu.subLinks)
            {
                DataTable dt = dh.ExecuteDataSet("SaveMenuItem", new string[] { menu.SchoolCode, sublink.SubLinkCode, menu.mainLink.MainLinkCode, menu.ModifiedBy }).Tables[0];

                if (dt.Rows.Count == 0)
                {
                    result.StatusCode = Globals.FAILURE_STATUS_CODE;
                    result.StatusDesc = "NO ROWS AFFECTED";
                    return result;
                }
            }


            result.StatusCode = Globals.SUCCESS_STATUS_CODE;
            result.StatusDesc = Globals.SUCCESS_STATUS_DESC;
            result.PegPayID = "";
            result.RequestID = menu.mainLink.MainLinkCode;

            return result;
        }

        public DataSet ExecuteDataSet(string StoredProc, params object[] Parameters)
        {
            return dh.ExecuteDataSet(StoredProc, Parameters);
        }

        public DataSet ExecuteDataSetOnCB(string StoredProc, params string[] Parameters)
        {
            CB_BussinessLogic bll = new CB_BussinessLogic();
            return bll.ExecuteDataSetOnCB(StoredProc, Parameters);
        }

        public int ExecuteNonQuery(string StoredProc, params object[] Parameters)
        {
            return dh.ExecuteNonQuery(StoredProc, Parameters);
        }

        public Result ExecuteNonQueryOnCB(string StoredProc, params string[] Parameters)
        {
            Result result = new Result();
            CB_BussinessLogic bll = new CB_BussinessLogic();
            CBApi.Result cbResult = bll.ExecuteNonQueryOnCB(StoredProc, Parameters);
            result.StatusCode = cbResult.StatusCode;
            result.StatusDesc = cbResult.StatusDesc;
            result.ThirdPartyID = cbResult.ThirdPartyId;
            result.PegPayID = cbResult.PegPayId;
            result.RequestID = cbResult.RequestId;
            return result;
        }


        public Result SaveSchoolFees(SchoolFee fee)
        {
            Result result = new Result();
            LogChangesInAuditLog(fee, fee.FeeID, fee.SchoolCode, fee.ModifiedBy);
            DataTable dt = dh.ExecuteDataSet("SaveSchoolFees", new string[] { fee.FeeID, fee.FeeName, fee.FeeAmount, fee.CurrencyCode, fee.SchoolCode, fee.ModifiedBy }).Tables[0];

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
            LogChangesInAuditLog(fee, fee.TranID, fee.SchoolCode, fee.ModifiedBy);
            DataTable dt = dh.ExecuteDataSet("SaveStudentFees", new string[] { fee.StudentID, fee.FeeID, fee.SchoolCode, fee.ModifiedBy, fee.ClassCode, fee.FeeType, fee.Amount, fee.Email, fee.TranID, fee.PaymentChannel }).Tables[0];

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
