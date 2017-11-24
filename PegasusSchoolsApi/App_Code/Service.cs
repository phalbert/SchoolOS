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

}