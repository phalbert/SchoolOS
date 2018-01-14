using InterLinkClass.PegPaySchoolsApi;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CustomUserControls_GenerateStudentId : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public Result LoadStudentDetails(string Id,string schoolCode)
    {
        
        Result result = new Result();
        try
        {
            Bussinesslogic bll = new Bussinesslogic();
            Student std = bll.GetStudentById(Id, schoolCode);

            if (std.StatusCode != Globals.SUCCESS_STATUS_CODE)
            {
                result.StatusCode = std.StatusCode;
                result.StatusDesc = std.StatusDesc;
                return result;
            }

            School school = bll.GetSchoolById(std.SchoolCode);

            if (school.StatusCode != Globals.SUCCESS_STATUS_CODE)
            {
                result.StatusCode = school.StatusCode;
                result.StatusDesc = school.StatusDesc;
                return result;
            }

            SchoolLogoPic.Attributes["src"] = "../ImageHandler.ashx?Id=" + school.SchoolLogo;
            StudentPic.Attributes["src"] = "../ImageHandler.ashx?Id=" + std.ProfilePic;
            lblPegPayStudentId.Text = std.PegPayStudentNumber;
            lblSchoolName.Text = school.SchoolName;
            lblSchoolCode.Text = std.SchoolCode;
            lblStudentId.Text = std.StudentNumber;
            lblStudentName.Text = std.StudentName;
            result.StatusCode = Globals.SUCCESS_STATUS_CODE;
            result.StatusDesc = Globals.SUCCESS_STATUS_TEXT;
        }
        catch(Exception ex)
        {

        }
        return result;
    }
}