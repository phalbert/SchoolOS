using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Services;


[WebService(Namespace = "http://pegasus.co.ug/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]

public class Service : System.Web.Services.WebService
{
    public Service () {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [WebMethod]
    public SchoolOSApiLogic.Entities.Result SaveSchool(SchoolOSApiLogic.Entities.School sch)
    {
        SchoolOSApiLogic.Entities.Result result = new SchoolOSApiLogic.Entities.Result();
        try
        {
            SchoolOSApiLogic.SchoolsInterfaceApi api = new SchoolOSApiLogic.SchoolsInterfaceApi();
            result= api.SaveSchool(sch);
        }
        catch(Exception ex)
        {
            string msg = "EXCEPTION:"+ ex.Message;
            SchoolOSApiLogic.SchoolsInterfaceApi.LogError(msg, ex.StackTrace, sch.SchoolCode);
            result.StatusCode = Globals.FAILURE_STATUS_CODE;
            result.StatusDesc = msg;//"{0} is an {1}",0,1
        }
        return result;
    }
    [WebMethod]
    public SchoolOSApiLogic.Entities.Result SaveStudent(SchoolOSApiLogic.Entities.Student std)
    {
        SchoolOSApiLogic.Entities.Result result = new SchoolOSApiLogic.Entities.Result();
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
    public SchoolOSApiLogic.Entities.Result SaveSchoolClass(SchoolOSApiLogic.Entities.SchoolClass schcls)
    {
        SchoolOSApiLogic.Entities.Result result = new SchoolOSApiLogic.Entities.Result();
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
    public SchoolOSApiLogic.Entities.Result SaveSchoolSemester(SchoolOSApiLogic.Entities.SchoolSemester semester)
    {
        SchoolOSApiLogic.Entities.Result result = new SchoolOSApiLogic.Entities.Result();
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
    public SchoolOSApiLogic.Entities.Result SaveSchoolExam(SchoolOSApiLogic.Entities.SchoolExams exam)
    {
        SchoolOSApiLogic.Entities.Result result = new SchoolOSApiLogic.Entities.Result();
        try
        {
            SchoolOSApiLogic.SchoolsInterfaceApi api = new SchoolOSApiLogic.SchoolsInterfaceApi();
            result = api.SaveSchoolExam(exam);
        }
        catch (Exception ex)
        {
            string msg = "EXCEPTION:" + ex.Message;
            SchoolOSApiLogic.SchoolsInterfaceApi.LogError(msg, ex.StackTrace, exam.ExamCode);
            result.StatusCode = Globals.FAILURE_STATUS_CODE;
            result.StatusDesc = msg;//"{0} is an {1}",0,1
        }
        return result;
    }

    [WebMethod]
    public SchoolOSApiLogic.Entities.Result SaveSchoolResults(SchoolOSApiLogic.Entities.SchoolResults schresults)
    {
        SchoolOSApiLogic.Entities.Result result = new SchoolOSApiLogic.Entities.Result();
        try
        {
            SchoolOSApiLogic.SchoolsInterfaceApi api = new SchoolOSApiLogic.SchoolsInterfaceApi();
            result = api.SaveSchoolResult(schresults);
        }
        catch (Exception ex)
        {
            string msg = "EXCEPTION:" + ex.Message;
            SchoolOSApiLogic.SchoolsInterfaceApi.LogError(msg, ex.StackTrace, schresults.ResultCode);
            result.StatusCode = Globals.FAILURE_STATUS_CODE;
            result.StatusDesc = msg;//"{0} is an {1}",0,1
        }
        return result;
    }

}