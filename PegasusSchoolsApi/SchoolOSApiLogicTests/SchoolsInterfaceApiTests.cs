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
        public void SaveSchoolExamTest()
        {
            SchoolsInterfaceApi schclsapi = new SchoolsInterfaceApi();

            SchoolExams exams = new SchoolExams();

            exams.SchoolCode = "TEST_SCHOOL";
            exams.SemesterCode = "2017_Term3";
            exams.ClassCode = "s41";
            exams.ExamCode = "2017EOT3";
            exams.ExamName = "End of Term2";
            exams.ExamDate = "2017-12-16";
            exams.ModifiedBy = "Pe.K";


            Result result = schclsapi.SaveSchoolExam(exams);
            Assert.AreEqual(result.StatusCode, Globals.SUCCESS_STATUS_CODE);


        }
        [TestMethod()]
        public void SaveSchoolExamTestInvalidData()
        {
            SchoolsInterfaceApi schApi = new SchoolsInterfaceApi();
            SchoolExams exams = new SchoolExams();
            Result result = schApi.SaveSchoolExam(exams);
            Assert.AreEqual(result.StatusCode, Globals.FAILURE_STATUS_CODE);
        }

        [TestMethod()]
        public void SaveSchoolResultsTest()
        {
            SchoolsInterfaceApi schclsapi = new SchoolsInterfaceApi();

            SchoolResults schresults = new SchoolResults();

            schresults.SchoolCode = "TEST_SCHOOL";
            schresults.SemesterCode = "2017_Term3";
            schresults.ClassCode = "s41";
            schresults.ExamCode = "2017EOT3";
            schresults.SubjectCode = "ENG10023";
            schresults.ResultCode = "End of Term2";
            schresults.ResultName = "2017-12-16";
            schresults.ModifiedBy = "Pe.K";


            Result result = schclsapi.SaveSchoolResult(schresults);
            Assert.AreEqual(result.StatusCode, Globals.SUCCESS_STATUS_CODE);


        }

        [TestMethod()]
        public void SaveSchoolResultsTestInvalidData()
        {
            SchoolsInterfaceApi schApi = new SchoolsInterfaceApi();
            SchoolResults schresults = new SchoolResults();
            Result result = schApi.SaveSchoolResult(schresults);
            Assert.AreEqual(result.StatusCode, Globals.FAILURE_STATUS_CODE);
        }
    }
}