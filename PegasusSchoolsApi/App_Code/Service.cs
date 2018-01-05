using SchoolOSApiLogic.Entities;
using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.Services;


[WebService(Namespace = "http://pegasus.co.ug/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]

public class Service : System.Web.Services.WebService
{
    public Service()
    {
        
    }

    [WebMethod]
    public DataSet ExecuteDataSet(string storedProc, params Object[] parameters)
    {
        SchoolOSApiLogic.SchoolsInterfaceApi api = new SchoolOSApiLogic.SchoolsInterfaceApi();
        DataSet ds = api.ExecuteDataSet(storedProc, parameters);
        return ds;
    }

    [WebMethod]
    public DataSet ExecuteDataSetOnCB(string storedProc, params string[] parameters)
    {
        SchoolOSApiLogic.SchoolsInterfaceApi api = new SchoolOSApiLogic.SchoolsInterfaceApi();
        DataSet ds = api.ExecuteDataSetOnCB(storedProc, parameters);
        return ds;
    }

    [WebMethod]
    public int ExecuteNonQuery(string storedProc, params Object[] parameters)
    {
        SchoolOSApiLogic.SchoolsInterfaceApi api = new SchoolOSApiLogic.SchoolsInterfaceApi();
        return api.ExecuteNonQuery(storedProc,parameters);
    }

    [WebMethod]
    public Result ExecuteNonQueryOnCB(string storedProc, params string[] parameters)
    {
        SchoolOSApiLogic.SchoolsInterfaceApi api = new SchoolOSApiLogic.SchoolsInterfaceApi();
        return api.ExecuteNonQueryOnCB(storedProc, parameters);
    }

    [WebMethod]
    public Result SaveSchool(School sch)
    {
        SchoolOSApiLogic.SchoolsInterfaceApi api = new SchoolOSApiLogic.SchoolsInterfaceApi();
        return api.SaveSchool(sch);
    }

    [WebMethod]
    public Result SaveStudent(Student std)
    {
        SchoolOSApiLogic.SchoolsInterfaceApi api = new SchoolOSApiLogic.SchoolsInterfaceApi();
        return api.SaveStudent(std);
    }

    [WebMethod]
    public SystemUserDetails Login(string Username, string Password)
    {
        SchoolOSApiLogic.SchoolsInterfaceApi api = new SchoolOSApiLogic.SchoolsInterfaceApi();
        return api.Login(Username, Password);
    }

    [WebMethod]
    public Result SaveSchoolClass(SchoolClass schcls)
    {

        SchoolOSApiLogic.SchoolsInterfaceApi api = new SchoolOSApiLogic.SchoolsInterfaceApi();
        return api.SaveSchoolClass(schcls);

    }

    [WebMethod]
    public Result SaveDepartment(Department dept)
    {
        SchoolOSApiLogic.SchoolsInterfaceApi api = new SchoolOSApiLogic.SchoolsInterfaceApi();
        return api.SaveDepartment(dept);

    }

    [WebMethod]
    public Result SaveSchoolSemester(SchoolSemester semester)
    {

        SchoolOSApiLogic.SchoolsInterfaceApi api = new SchoolOSApiLogic.SchoolsInterfaceApi();
        return api.SaveSchoolSemester(semester);

    }

    [WebMethod]
    public Result SaveSubjectResult(SubjectResults semester)
    {
        SchoolOSApiLogic.SchoolsInterfaceApi api = new SchoolOSApiLogic.SchoolsInterfaceApi();
        return api.SaveSubjectResult(semester);
    }

    [WebMethod]
    public Result SaveUploadedFile(UploadedFile semester)
    {
        SchoolOSApiLogic.SchoolsInterfaceApi api = new SchoolOSApiLogic.SchoolsInterfaceApi();
        return api.SaveUploadedFile(semester);
    }

    [WebMethod]
    public Result SaveStudentSubject(StudentSubject semester)
    {
        SchoolOSApiLogic.SchoolsInterfaceApi api = new SchoolOSApiLogic.SchoolsInterfaceApi();
        return api.SaveStudentSubject(semester);
    }

    [WebMethod]
    public Result SaveSchoolStaff(SchoolStaff staff)
    {
        SchoolOSApiLogic.SchoolsInterfaceApi api = new SchoolOSApiLogic.SchoolsInterfaceApi();
        return api.SaveSchoolStaff(staff);
    }

    [WebMethod]
    public Result SaveClassStream(ClassStream stream)
    {
        SchoolOSApiLogic.SchoolsInterfaceApi api = new SchoolOSApiLogic.SchoolsInterfaceApi();
        return api.SaveClassStream(stream);
    }

    [WebMethod]
    public Result SaveSystemUser(SystemUser user)
    {
        SchoolOSApiLogic.SchoolsInterfaceApi api = new SchoolOSApiLogic.SchoolsInterfaceApi();
        return api.SaveSystemUser(user);
    }

    [WebMethod]
    public Result SaveSubject(Subject sub)
    {
        SchoolOSApiLogic.SchoolsInterfaceApi api = new SchoolOSApiLogic.SchoolsInterfaceApi();
        return api.SaveSubject(sub);
    }

    [WebMethod]
    public Result SaveSchoolFees(SchoolFee fee)
    {
        SchoolOSApiLogic.SchoolsInterfaceApi api = new SchoolOSApiLogic.SchoolsInterfaceApi();
        return api.SaveSchoolFees(fee);
    }

    [WebMethod]
    public Result SaveStudentFees(StudentFee fee)
    {
        SchoolOSApiLogic.SchoolsInterfaceApi api = new SchoolOSApiLogic.SchoolsInterfaceApi();
        return api.SaveStudentFees(fee);
    }

    [WebMethod]
    public Result SaveMainLink(MainLink mainLink)
    {
        SchoolOSApiLogic.SchoolsInterfaceApi api = new SchoolOSApiLogic.SchoolsInterfaceApi();
        return api.SaveMainLink(mainLink);
    }

    [WebMethod]
    public Result SaveSubLink(SubLink sub)
    {
        SchoolOSApiLogic.SchoolsInterfaceApi api = new SchoolOSApiLogic.SchoolsInterfaceApi();
        return api.SaveSubLink(sub);
    }

    [WebMethod]
    public Result SaveSchoolTerm(SchoolTerm sub)
    {
        SchoolOSApiLogic.SchoolsInterfaceApi api = new SchoolOSApiLogic.SchoolsInterfaceApi();
        return api.SaveSchoolTerm(sub);
    }

    [WebMethod]
    public Result SaveUserType(UserType sub)
    {
        SchoolOSApiLogic.SchoolsInterfaceApi api = new SchoolOSApiLogic.SchoolsInterfaceApi();
        return api.SaveUserType(sub);
    }

    [WebMethod]
    public Result SaveMenu(MenuItem sub)
    {
        SchoolOSApiLogic.SchoolsInterfaceApi api = new SchoolOSApiLogic.SchoolsInterfaceApi();
        return api.SaveMenu(sub);
    }
}