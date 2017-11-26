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
            sch.Password = "TEST";
            sch.SchoolCode = "TEST_SCHOOL";
            sch.SchoolEmail = "nsubugak@yahoo.com";
            sch.SchoolID = "";
            sch.SchoolLocation = "pegasus tech";
            sch.SchoolPhone = "0785975800";
            sch.UnebCentreNumber = "123444";
            sch.VendorCode = "TEST";
            Result result = schApi.SaveSchool(sch);
            Assert.AreEqual(result.StatusCode,Globals.SUCCESS_STATUS_CODE);
        }

        [TestMethod()]
        public void SaveSchoolTestInvalidData()
        {
            SchoolsInterfaceApi schApi = new SchoolsInterfaceApi();
            School sch = new School();
            Result result = schApi.SaveSchool(sch);
            Assert.AreEqual(result.StatusCode, Globals.FAILURE_STATUS_CODE);
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
            Assert.AreEqual(result.StatusCode, Globals.SUCCESS_STATUS_CODE);


        }


        [TestMethod()]
        public void SaveStudentTestInvalidData()
        {
            SchoolsInterfaceApi stdApi = new SchoolsInterfaceApi();
            Student std = new Student();
            Result result = stdApi.SaveStudent(std);
            Assert.AreEqual(result.StatusCode, Globals.FAILURE_STATUS_CODE);
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
            Assert.AreEqual(result.StatusCode, Globals.SUCCESS_STATUS_CODE);


        }

        [TestMethod()]
        public void SaveSchoolClassTestInvalidData()
        {
            SchoolsInterfaceApi schApi = new SchoolsInterfaceApi();
            SchoolClass cls = new SchoolClass();
            Result result = schApi.SaveSchoolClass(cls);
            Assert.AreEqual(result.StatusCode, Globals.FAILURE_STATUS_CODE);
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
            Assert.AreEqual(result.StatusCode, Globals.SUCCESS_STATUS_CODE);


        }
        [TestMethod()]
        public void SaveSchoolSemesterTestInvalidData()
        {
            SchoolsInterfaceApi schApi = new SchoolsInterfaceApi();
            SchoolSemester schsem = new SchoolSemester();
            Result result = schApi.SaveSchoolSemester(schsem);
            Assert.AreEqual(result.StatusCode, Globals.FAILURE_STATUS_CODE);
        }

        [TestMethod()]
        public void SaveSubjectTestInvalidData()
        {
            SchoolsInterfaceApi stdApi = new SchoolsInterfaceApi();
            Subject sub = new Subject();
            Result result = stdApi.SaveSubject(sub);
            Assert.AreEqual(result.StatusCode, Globals.FAILURE_STATUS_CODE);
        }

        [TestMethod()]
        public void SaveSystemUserTestInvalidData()
        {
            SchoolsInterfaceApi stdApi = new SchoolsInterfaceApi();
            SystemUser user = new SystemUser();
            Result result = stdApi.SaveSystemUser(user);
            Assert.AreEqual(result.StatusCode, Globals.FAILURE_STATUS_CODE);
        }

        [TestMethod()]
        public void SaveClassStreamTestInvalidData()
        {
            SchoolsInterfaceApi stdApi = new SchoolsInterfaceApi();
            ClassStream stream = new ClassStream();
            Result result = stdApi.SaveClassStream(stream);
            Assert.AreEqual(result.StatusCode, Globals.FAILURE_STATUS_CODE);
        }

        [TestMethod()]
        public void SaveSchoolStaffTestInvalidData()
        {
            SchoolsInterfaceApi stdApi = new SchoolsInterfaceApi();
            SchoolStaff staff = new SchoolStaff();
            Result result = stdApi.SaveSchoolStaff(staff);
            Assert.AreEqual(result.StatusCode, Globals.FAILURE_STATUS_CODE);
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
            Assert.AreEqual(result.StatusCode, Globals.SUCCESS_STATUS_CODE);
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
            Assert.AreEqual(result.StatusCode, Globals.SUCCESS_STATUS_CODE);
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
            Assert.AreEqual(result.StatusCode, Globals.SUCCESS_STATUS_CODE);
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
            Assert.AreEqual(result.StatusCode, Globals.SUCCESS_STATUS_CODE);
        }
    }
}