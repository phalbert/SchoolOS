using InterLinkClass.PegPaySchoolsApi;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CustomUserControls_PrintStudentReport : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public Result LoadStudentReport(string StudentId, string SchoolCode)
    {
        Result result = new Result();
        try
        {
            Bussinesslogic bll = new Bussinesslogic();
            MySubjectResults[] SubjectResults = bll.GetStudentSubjectResults(StudentId, SchoolCode);
            foreach (MySubjectResults subjectResult in SubjectResults)
            {
                resultsTable.InnerHtml += "<tr>" +
                                         "<td> " + subjectResult.SubjectCode + " </td>" +
                                         "<td> " + GetSubjectName(subjectResult.SubjectCode) + " </td>" +
                                         "<td>" + subjectResult.BOT + "</td>" +
                                         "<td>" + subjectResult.MOT + "</td>" +
                                          "<td>" + subjectResult.EOT + "</td>" +
                                         "<td>" + subjectResult.Average + "</td>" +
                                          "<td>" + subjectResult.Grade + "</td>" +
                                         "</tr>";
            }

        }
        catch (Exception ex)
        {
            result.StatusCode = Globals.FAILURE_STATUS_CODE;
            result.StatusDesc = "FAILED: " + ex.Message;
        }
        return result;
    }

    private string GetSubjectName(string subjectCode)
    {
        throw new NotImplementedException();
    }
}