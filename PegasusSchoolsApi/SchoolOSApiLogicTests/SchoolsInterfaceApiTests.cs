using Microsoft.VisualStudio.TestTools.UnitTesting;
using SchoolOSApiLogic;
using SchoolOSApiLogic.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SchoolOSApiLogic.Tests
{
    [TestClass()]
    public class SchoolsInterfaceApiTests
    {

        [TestMethod()]
        public void SaveSchoolTest()
        {
            SchoolsInterfaceApi schApi = new SchoolsInterfaceApi();
            School sch = new School();
            sch.SchoolName = "TEST SCHOOl";
            sch.ModifiedBy = "admin";
            sch.VendorPassword = "TEST";
            sch.SchoolCode = "TEST_SCHOOL";
            sch.SchoolEmail = "nsubugak@yahoo.com";
            sch.SchoolID = "";
            sch.SchoolLocation = "pegasus tech";
            sch.SchoolPhone = "0785975800";
            sch.UnebCentreNumber = "123444";
            sch.VendorCode = "TEST";
            Result result = schApi.SaveSchool(sch);
          Assert.AreEqual(Globals.SUCCESS_STATUS_CODE,result.StatusCode);
        }

        [TestMethod()]
        public void SaveSchoolTestInvalidData()
        {
            SchoolsInterfaceApi schApi = new SchoolsInterfaceApi();
            School sch = new School();
            Result result = schApi.SaveSchool(sch);
             Assert.AreEqual(Globals.FAILURE_STATUS_CODE,result.StatusCode);
        }

        [TestMethod]
        public void SaveStudentTest()
        {
            SchoolsInterfaceApi stdApi = new SchoolsInterfaceApi();

            Student std = new Student();
            std.SchoolCode = "TEST_SCHOOL";
            std.StudentName = "John";
            std.StudentNumber = "1002";
            std.ClassCode = "s3";
            std.StreamCode = "3c";
            std.DateOfBirth = "1999-10-02";
            std.StudentCategory = "day";
            std.PegPayStudentNumber = "s1000";
            std.VendorCode = "TEST";
            std.ModifiedBy = "Peter";

            Result result = stdApi.SaveStudent(std);
          Assert.AreEqual(Globals.SUCCESS_STATUS_CODE,result.StatusCode);


        }


        [TestMethod()]
        public void SaveStudentTestInvalidData()
        {
            SchoolsInterfaceApi stdApi = new SchoolsInterfaceApi();
            Student std = new Student();
            Result result = stdApi.SaveStudent(std);
             Assert.AreEqual(Globals.FAILURE_STATUS_CODE,result.StatusCode);
        }



        [TestMethod]
        public void SaveSchoolClassTest()
        {
            SchoolsInterfaceApi schclsapi = new SchoolsInterfaceApi();

            SchoolClass schcls = new SchoolClass();

            schcls.SchoolCode = "TEST_SCHOOL";
            schcls.ClassCode = "S4";
            schcls.SchoolClassName = "senior Four";
            schcls.ModifiedBy = "Peter";


            Result result = schclsapi.SaveSchoolClass(schcls);
          Assert.AreEqual(Globals.SUCCESS_STATUS_CODE,result.StatusCode);


        }

        [TestMethod()]
        public void SaveSchoolClassTestInvalidData()
        {
            SchoolsInterfaceApi schApi = new SchoolsInterfaceApi();
            SchoolClass cls = new SchoolClass();
            Result result = schApi.SaveSchoolClass(cls);
             Assert.AreEqual(Globals.FAILURE_STATUS_CODE,result.StatusCode);
        }
        [TestMethod()]
        public void SaveSchoolSemesterTest()
        {
            SchoolsInterfaceApi schclsapi = new SchoolsInterfaceApi();

            SchoolSemester sem = new SchoolSemester();

            sem.SchoolCode = "TEST_SCHOOL";
            sem.SemesterCode = "2017_Term3";
            sem.StartDate = "2017-10-08";
            sem.Enddate = "2017-12-16";
            sem.ModifiedBy = "Peter.K";


            Result result = schclsapi.SaveSchoolSemester(sem);
          Assert.AreEqual(Globals.SUCCESS_STATUS_CODE,result.StatusCode);


        }
        [TestMethod()]
        public void SaveSchoolSemesterTestInvalidData()
        {
            SchoolsInterfaceApi schApi = new SchoolsInterfaceApi();
            SchoolSemester schsem = new SchoolSemester();
            Result result = schApi.SaveSchoolSemester(schsem);
             Assert.AreEqual(Globals.FAILURE_STATUS_CODE,result.StatusCode);
        }

        [TestMethod()]
        public void SaveSubjectTestInvalidData()
        {
            SchoolsInterfaceApi stdApi = new SchoolsInterfaceApi();
            Subject sub = new Subject();
            Result result = stdApi.SaveSubject(sub);
             Assert.AreEqual(Globals.FAILURE_STATUS_CODE,result.StatusCode);
        }

        [TestMethod()]
        public void SaveSystemUserTestInvalidData()
        {
            SchoolsInterfaceApi stdApi = new SchoolsInterfaceApi();
            SystemUser user = new SystemUser();
            Result result = stdApi.SaveSystemUser(user);
             Assert.AreEqual(Globals.FAILURE_STATUS_CODE,result.StatusCode);
        }

        [TestMethod()]
        public void SaveClassStreamTestInvalidData()
        {
            SchoolsInterfaceApi stdApi = new SchoolsInterfaceApi();
            ClassStream stream = new ClassStream();
            Result result = stdApi.SaveClassStream(stream);
             Assert.AreEqual(Globals.FAILURE_STATUS_CODE,result.StatusCode);
        }

        [TestMethod()]
        public void SaveSchoolStaffTestInvalidData()
        {
            SchoolsInterfaceApi stdApi = new SchoolsInterfaceApi();
            SchoolStaff staff = new SchoolStaff();
            Result result = stdApi.SaveSchoolStaff(staff);
             Assert.AreEqual(Globals.FAILURE_STATUS_CODE,result.StatusCode);
        }

        [TestMethod()]
        public void SaveSubjectTest()
        {
            SchoolsInterfaceApi stdApi = new SchoolsInterfaceApi();
            Subject sub = new Subject();
            sub.ModifiedBy = "admin";
            sub.SchoolCode = "TEST_SCHOOL";
            sub.SubjectCode = "TEST_SUBJECT";
            sub.SubjectName = "Test Subject";

            Result result = stdApi.SaveSubject(sub);
          Assert.AreEqual(Globals.SUCCESS_STATUS_CODE,result.StatusCode);
        }

        [TestMethod()]
        public void SaveSystemUserTest()
        {
            SchoolsInterfaceApi stdApi = new SchoolsInterfaceApi();
            SystemUser user = new SystemUser();
            user.Username = "nsubugak@yahoo.com";
            user.UserPassword = "T3rr1613";
            user.UserType = "ADMIN";
            user.UserCategory = "ADMIN";

            Result result = stdApi.SaveSystemUser(user);
          Assert.AreEqual(Globals.SUCCESS_STATUS_CODE,result.StatusCode);
        }

        [TestMethod()]
        public void SaveClassStreamTest()
        {
            SchoolsInterfaceApi stdApi = new SchoolsInterfaceApi();
            ClassStream stream = new ClassStream();
            stream.ModifiedBy = "admin";
            stream.SchoolCode = "TEST_SCHOOL";
            stream.StreamCode = "TEST_STREAM";
            stream.StreamName = "test stream";
            stream.ClassCode = "TEST_CLASS";
            Result result = stdApi.SaveClassStream(stream);
          Assert.AreEqual(Globals.SUCCESS_STATUS_CODE,result.StatusCode);
        }

        [TestMethod()]
        public void SaveSchoolStaffTest()
        {
            SchoolsInterfaceApi stdApi = new SchoolsInterfaceApi();
            SchoolStaff staff = new SchoolStaff();
            staff.Email = "nsubugak@yahoo.com";
            staff.FullName = "Test Staff";
            staff.Gender = "MALE";
            staff.ModifiedBy = "admin";
            staff.PegPayStaffIDNumber = "12345";
            staff.PhoneNumber = "0785975800";
            staff.ProfilePic = "";
            staff.SchoolCode = "TEST_SCHOOL";
            staff.StaffCategory = "TEACHING_STAFF";
            staff.StaffIDNumber = "12345";
            staff.StaffType = "FULL_TIME";

            Result result = stdApi.SaveSchoolStaff(staff);
          Assert.AreEqual(Globals.SUCCESS_STATUS_CODE,result.StatusCode);
        }

        [TestMethod()]
        public void SaveUserTypeTest()
        {
            SchoolsInterfaceApi stdApi = new SchoolsInterfaceApi();
            UserType std = new UserType();
            std.SchoolCode = "TEST_SCHOOL";
            std.UserTypeCode = "ADMIN";
            std.UserTypeName = "Administrator";
            Result result = stdApi.SaveUserType(std);
          Assert.AreEqual(Globals.SUCCESS_STATUS_CODE,result.StatusCode);
        }

        [TestMethod()]
        public void SaveUserTypeTestInvalidData()
        {
            SchoolsInterfaceApi stdApi = new SchoolsInterfaceApi();
            UserType std = new UserType();
            Result result = stdApi.SaveUserType(std);
             Assert.AreEqual(Globals.FAILURE_STATUS_CODE,result.StatusCode);
        }

        [TestMethod()]
        public void SaveMainLinkTest()
        {
            SchoolsInterfaceApi stdApi = new SchoolsInterfaceApi();
            MainLink std = new MainLink();
            std.SchoolCode = "TEST_SCHOOL";
            std.MainLinkCode = "ADMIN";
            std.MainLinkName = "Administrator";
            Result result = stdApi.SaveMainLink(std);
          Assert.AreEqual(Globals.SUCCESS_STATUS_CODE,result.StatusCode);
        }

        [TestMethod()]
        public void SaveMainLinkTestInvalidData()
        {
            SchoolsInterfaceApi stdApi = new SchoolsInterfaceApi();
            MainLink std = new MainLink();
            Result result = stdApi.SaveMainLink(std);
            Assert.AreEqual(Globals.FAILURE_STATUS_CODE,result.StatusCode);
        }

        [TestMethod()]
        public void SaveSubLinkTest()
        {
            SchoolsInterfaceApi stdApi = new SchoolsInterfaceApi();
            SubLink std = new SubLink();
            std.SchoolCode = "TEST_SCHOOL";
            std.SubLinkCode = "ADMIN";
            std.SubLinkName = "Administrator";
            std.URL = "https://google.com";
            Result result = stdApi.SaveSubLink(std);
            Assert.AreEqual(Globals.SUCCESS_STATUS_CODE,result.StatusCode);
        }

        [TestMethod()]
        public void SaveSubLinkTestInvalidData()
        {
            SchoolsInterfaceApi stdApi = new SchoolsInterfaceApi();
            SubLink std = new SubLink();
            Result result = stdApi.SaveSubLink(std);
            Assert.AreEqual(Globals.FAILURE_STATUS_CODE,result.StatusCode);
        }

        [TestMethod()]
        public void SaveMenuTest()
        {
            SchoolsInterfaceApi stdApi = new SchoolsInterfaceApi();
            MenuItem std = new MenuItem();
            std.SchoolCode = "TEST_SCHOOL";
            std.UserType = "ADMIN";
            Result result = stdApi.SaveMenu(std);
            Assert.AreEqual(Globals.SUCCESS_STATUS_CODE,result.StatusCode);
        }

        [TestMethod()]
        public void SaveMenuTestInvalidData()
        {
            SchoolsInterfaceApi stdApi = new SchoolsInterfaceApi();
            MenuItem std = new MenuItem();
            Result result = stdApi.SaveMenu(std);
            Assert.AreEqual(Globals.FAILURE_STATUS_CODE,result.StatusCode);
        }

        [TestMethod()]
        public void SaveSchoolFeeTest()
        {
            SchoolsInterfaceApi stdApi = new SchoolsInterfaceApi();
            SchoolFee std = new SchoolFee();
            std.SchoolCode = "TEST_SCHOOL";
            std.CurrencyCode = "UGX";
            std.FeeAmount = "1000";
            std.FeeCategory = "TUITION";
            std.FeeID = "1234";
            std.FeeName = "Tuition Fees";
            std.FeeType = "";
            std.ModifiedBy = "admin";
            Result result = stdApi.SaveSchoolFees(std);
            Assert.AreEqual(Globals.SUCCESS_STATUS_CODE,result.StatusCode);
        }

        [TestMethod()]
        public void SaveSchoolFeeTestInvalidData()
        {
            SchoolsInterfaceApi stdApi = new SchoolsInterfaceApi();
            SchoolFee std = new SchoolFee();
            Result result = stdApi.SaveSchoolFees(std);
             Assert.AreEqual(Globals.FAILURE_STATUS_CODE,result.StatusCode);
        }

        [TestMethod()]
        public void SaveStudentFeeTest()
        {
            SchoolsInterfaceApi stdApi = new SchoolsInterfaceApi();
            StudentFee std = new StudentFee();
            std.SchoolCode = "TEST_SCHOOL";
            std.FeeID = "1234";
            std.ModifiedBy = "admin";
            std.StudentID = "21000000261";
            Result result = stdApi.SaveStudentFees(std);
            Assert.AreEqual(Globals.SUCCESS_STATUS_CODE,result.StatusCode);
        }

        [TestMethod()]
        public void SaveStudentFeeTestInvalidData()
        {
            SchoolsInterfaceApi stdApi = new SchoolsInterfaceApi();
            StudentFee std = new StudentFee();
            Result result = stdApi.SaveStudentFees(std);
            Assert.AreEqual(Globals.FAILURE_STATUS_CODE,result.StatusCode);
        }

    }
}