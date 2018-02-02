using InterLinkClass.PegPaySchoolsApi;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PrintStudentsReport : System.Web.UI.Page
{
    Bussinesslogic bll = new Bussinesslogic();
    protected void Page_Load(object sender, EventArgs e)
    {
       
        try
        {
            if (IsPostBack)
            {

            }
            else
            {
                LoadData();
            }
        }
        catch (Exception ex)
        {
            string msg = "FAILED: " + ex.Message;
            bll.ShowMessage(lblmsg, msg, true);
        }
    }

    private void LoadData()
    {
        string studentId = Session["StudentId"] as string;
        string SchoolCode = Session["SchoolCode"] as string;
        string classCode = Session["ClassCode"] as string;
        string TermCode = Session["TermCode"] as string;

        Result result = ChangePasswordUserControl.LoadStudentReport(studentId, SchoolCode, TermCode, classCode);

        if (result.StatusCode != Globals.SUCCESS_STATUS_CODE)
        {
            string msg = "FAILED: " + result.StatusDesc;
            bll.ShowMessage(lblmsg, msg, true);
        }
    }
}