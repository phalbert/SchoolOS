using InterLinkClass.PegPaySchoolsApi;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CustomUserControls_PrintStudentReport : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public Result LoadStudentReport(string StudentId, string SchoolCode, string TermCode,string ClassCode)
    {
        Result result = new Result();
        try
        {
            Bussinesslogic bll = new Bussinesslogic();

            Student std = bll.GetStudentById(StudentId, SchoolCode);

            if (std.StatusCode != Globals.SUCCESS_STATUS_CODE)
            {
                result.StatusCode = Globals.FAILURE_STATUS_CODE;
                result.StatusDesc = "FAILED: " + std.StatusDesc;
                return result;
            }

            School school = bll.GetSchoolById(SchoolCode);

            if (school.StatusCode != Globals.SUCCESS_STATUS_CODE)
            {
                result.StatusCode = Globals.FAILURE_STATUS_CODE;
                result.StatusDesc = "FAILED: " + school.StatusDesc;
                return result;
            }

            SchoolLogo.Attributes["src"] = "../ImageHandler.ashx?Id=" + school.SchoolLogo;
            StudentsPic.Attributes["src"] = "../ImageHandler.ashx?Id=" + std.ProfilePic;
            lblSchoolName.Text = school.SchoolName;
            lblSchoolMoto.Text = school.SchoolMoto;
            lblBoxOffice.Text = school.PostOfficeBox;
            lblContact.Text = school.SchoolPhone + ",<br>" + school.SchoolEmail;
            lblDate.Text = DateTime.Now.ToString("dd-MM-yyyy");
            lblTermName.Text = TermCode;
            lblStudentName.Text = std.StudentName;

            DataTable dt = bll.ExecuteDataTableOnSchoolsDB("GetStudentClassDetails", new string[] { SchoolCode, std.StudentNumber });
            string className = dt.Rows[0][0].ToString();
            string StreamName= dt.Rows[0][1].ToString();
            lblStream.Text = className + " / " + StreamName;
            dt = bll.ExecuteDataTableOnSchoolsDB("GetStudentGradingScheme", new string[] { SchoolCode, std.ClassCode });
            dt = GenerateTransposedTable(dt);
            dataGridResults.DataSource = dt;
            dataGridResults.DataBind();

            MySubjectResults[] SubjectResults = bll.GetStudentSubjectResults(StudentId, SchoolCode, TermCode,ClassCode);
            resultsTable.InnerHtml = "";
            foreach (MySubjectResults subjectResult in SubjectResults)
            {
                resultsTable.InnerHtml += "<tr>" +
                                         "<td> " + subjectResult.SubjectCode + " </td>" +
                                         "<td> " + subjectResult.SubjectName + " </td>" +
                                         "<td>" + subjectResult.BOT + "</td>" +
                                         "<td>" + subjectResult.MOT + "</td>" +
                                         "<td>" + subjectResult.EOT + "</td>" +
                                         "<td>" + subjectResult.Average + "</td>" +
                                         "<td>" + subjectResult.Grade + "</td>" +
                                         "<td>" + subjectResult.Comments + "</td>" +
                                         "</tr>";
            }

            double averageMark = GetAverageMark(SubjectResults);
            double aggregate = GetAggregate(SubjectResults);
            lblAverage.Text = averageMark.ToString();
            lblAggregate.Text = aggregate.ToString();
            result.StatusCode = Globals.SUCCESS_STATUS_CODE;
            result.StatusDesc = Globals.SUCCESS_STATUS_TEXT;

        }
        catch (Exception ex)
        {
            result.StatusCode = Globals.FAILURE_STATUS_CODE;
            result.StatusDesc = "FAILED: " + ex.Message;
        }
        return result;
    }

    private double GetAggregate(MySubjectResults[] subjectResults)
    {
        double total = 0;
        foreach (MySubjectResults result in subjectResults)
        {
            total += SharedCommons.SharedCommons.GetDoubleFromStringDefaultsToZero(result.GradePoints);
        }
        
        return total;
    }

    private double GetAverageMark(MySubjectResults[] subjectResults)
    {
        double total = 0;
        foreach(MySubjectResults result in subjectResults)
        {
            total += SharedCommons.SharedCommons.GetDoubleFromStringDefaultsToZero(result.Average);
        }

        double average = total / subjectResults.Length;
        return average;
    }

    private DataTable GenerateTransposedTable(DataTable inputTable)
    {
        DataTable outputTable = new DataTable();

        // Add columns by looping rows

        // Header row's first column is same as in inputTable
        outputTable.Columns.Add(inputTable.Columns[0].ColumnName.ToString());

        // Header row's second column onwards, 'inputTable's first column taken
        foreach (DataRow inRow in inputTable.Rows)
        {
            string newColName = inRow[0].ToString();
            outputTable.Columns.Add(newColName);
        }

        // Add rows by looping columns        
        for (int rCount = 1; rCount <= inputTable.Columns.Count - 1; rCount++)
        {
            DataRow newRow = outputTable.NewRow();

            // First column is inputTable's Header row's second column
            newRow[0] = inputTable.Columns[rCount].ColumnName.ToString();
            for (int cCount = 0; cCount <= inputTable.Rows.Count - 1; cCount++)
            {
                string colValue = inputTable.Rows[cCount][rCount].ToString();
                newRow[cCount + 1] = colValue;
            }
            outputTable.Rows.Add(newRow);
        }

        return outputTable;
    }

    private string GetSubjectName(string subjectCode)
    {
        throw new NotImplementedException();
    }
}