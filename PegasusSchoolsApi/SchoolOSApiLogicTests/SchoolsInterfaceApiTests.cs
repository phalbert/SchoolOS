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

    }
}