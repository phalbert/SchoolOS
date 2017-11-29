using SchoolOSApiLogic.Entities;
using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Services;


[WebService(Namespace = "http://pegasus.co.ug/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]

public class Service : System.Web.Services.WebService
{
    public Service()
    {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [WebMethod]
    public Result SaveSchool(School sch)
    {
        Result result = new Result();
        try
        {
            SchoolOSApiLogic.SchoolsInterfaceApi api = new SchoolOSApiLogic.SchoolsInterfaceApi();
            result = api.SaveSchool(sch);
        }
        catch (Exception ex)
        {
            string msg = "EXCEPTION:" + ex.Message;
            SchoolOSApiLogic.SchoolsInterfaceApi.LogError(msg, ex.StackTrace, sch.SchoolCode);
            result.StatusCode = Globals.FAILURE_STATUS_CODE;
            result.StatusDesc = msg;//"{0} is an {1}",0,1
        }
        return result;
    }

    [WebMethod]
    public Result SaveStudent(Student std)
    {
        Result result = new Result();
        try
        {
            SchoolOSApiLogic.SchoolsInterfaceApi api = new SchoolOSApiLogic.SchoolsInterfaceApi();
            result = api.SaveStudent(std);
        }
        catch (Exception ex)
        {
            string msg = "EXCEPTION:" + ex.Message;
            SchoolOSApiLogic.SchoolsInterfaceApi.LogError(msg, ex.StackTrace, std.SchoolCode);
            result.StatusCode = Globals.FAILURE_STATUS_CODE;
            result.StatusDesc = msg;//"{0} is an {1}",0,1
        }
        return result;
    }

    [WebMethod]
    public Result SaveSchoolClass(SchoolClass schcls)
    {
        Result result = new Result();
        try
        {
            SchoolOSApiLogic.SchoolsInterfaceApi api = new SchoolOSApiLogic.SchoolsInterfaceApi();
            result = api.SaveSchoolClass(schcls);
        }
        catch (Exception ex)
        {
            string msg = "EXCEPTION:" + ex.Message;
            SchoolOSApiLogic.SchoolsInterfaceApi.LogError(msg, ex.StackTrace, schcls.ClassCode);
            result.StatusCode = Globals.FAILURE_STATUS_CODE;
            result.StatusDesc = msg;//"{0} is an {1}",0,1
        }
        return result;
    }

    [WebMethod]
    public Result SaveSchoolSemester(SchoolSemester semester)
    {
        Result result = new Result();
        try
        {
            SchoolOSApiLogic.SchoolsInterfaceApi api = new SchoolOSApiLogic.SchoolsInterfaceApi();
            result = api.SaveSchoolSemester(semester);
        }
        catch (Exception ex)
        {
            string msg = "EXCEPTION:" + ex.Message;
            SchoolOSApiLogic.SchoolsInterfaceApi.LogError(msg, ex.StackTrace, semester.SemesterCode);
            result.StatusCode = Globals.FAILURE_STATUS_CODE;
            result.StatusDesc = msg;//"{0} is an {1}",0,1
        }
        return result;
    }

    [WebMethod]
    public Result SaveSchoolStaff(SchoolStaff staff)
    {
        Result result = new Result();
        try
        {
            SchoolOSApiLogic.SchoolsInterfaceApi api = new SchoolOSApiLogic.SchoolsInterfaceApi();
            result = api.SaveSchoolStaff(staff);
        }
        catch (Exception ex)
        {
            string msg = "EXCEPTION:" + ex.Message;
            SchoolOSApiLogic.SchoolsInterfaceApi.LogError(msg, ex.StackTrace, staff.StaffIDNumber);
            result.StatusCode = Globals.FAILURE_STATUS_CODE;
            result.StatusDesc = msg;//"{0} is an {1}",0,1
        }
        return result;
    }

    [WebMethod]
    public Result SaveClassStream(ClassStream stream)
    {
        Result result = new Result();
        try
        {
            SchoolOSApiLogic.SchoolsInterfaceApi api = new SchoolOSApiLogic.SchoolsInterfaceApi();
            result = api.SaveClassStream(stream);
        }
        catch (Exception ex)
        {
            string msg = "EXCEPTION:" + ex.Message;
            SchoolOSApiLogic.SchoolsInterfaceApi.LogError(msg, ex.StackTrace, stream.StreamCode);
            result.StatusCode = Globals.FAILURE_STATUS_CODE;
            result.StatusDesc = msg;//"{0} is an {1}",0,1
        }
        return result;
    }

    [WebMethod]
    public Result SaveSystemUser(SystemUser user)
    {
        Result result = new Result();
        try
        {
            SchoolOSApiLogic.SchoolsInterfaceApi api = new SchoolOSApiLogic.SchoolsInterfaceApi();
            result = api.SaveSystemUser(user);
        }
        catch (Exception ex)
        {
            string msg = "EXCEPTION:" + ex.Message;
            SchoolOSApiLogic.SchoolsInterfaceApi.LogError(msg, ex.StackTrace, user.Username);
            result.StatusCode = Globals.FAILURE_STATUS_CODE;
            result.StatusDesc = msg;//"{0} is an {1}",0,1
        }
        return result;
    }

    [WebMethod]
    public Result SaveSubject(Subject sub)
    {
        Result result = new Result();
        try
        {
            SchoolOSApiLogic.SchoolsInterfaceApi api = new SchoolOSApiLogic.SchoolsInterfaceApi();
            result = api.SaveSubject(sub);
        }
        catch (Exception ex)
        {
            string msg = "EXCEPTION:" + ex.Message;
            SchoolOSApiLogic.SchoolsInterfaceApi.LogError(msg, ex.StackTrace, sub.SubjectCode);
            result.StatusCode = Globals.FAILURE_STATUS_CODE;
            result.StatusDesc = msg;//"{0} is an {1}",0,1
        }
        return result;
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
    public Result SaveUserType(UserType sub)
    {
        SchoolOSApiLogic.SchoolsInterfaceApi api = new SchoolOSApiLogic.SchoolsInterfaceApi();
        return api.SaveUserType(sub);
    }

    [WebMethod]
    public Result SaveMenu(Menu sub)
    {
        SchoolOSApiLogic.SchoolsInterfaceApi api = new SchoolOSApiLogic.SchoolsInterfaceApi();
        return api.SaveMenu(sub);
    }
}