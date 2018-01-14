using InterLinkClass.PegPaySchoolsApi;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PrintStudentId : System.Web.UI.Page
{
    Bussinesslogic bll = new Bussinesslogic();
    protected void Page_Load(object sender, EventArgs e)
    {
        
        try
        {
            Session["IsError"] = null;
            List<Student> IdsToPrint = Session["IdsToPrint"] as List<Student>;

            if (IdsToPrint == null)
            {
                string msg = "FAILED: NO IDS SUPPLIED. CANNOT PRINT";
                bll.ShowMessage(lblmsg, msg, true, Session);
                return;
            }

            controlsDiv.Controls.Clear();

            foreach (Student std in IdsToPrint)
            {
                CustomUserControls_GenerateStudentId d = LoadControl("~/CustomUserControls/GenerateStudentId.ascx") as CustomUserControls_GenerateStudentId;
                Result result = d.LoadStudentDetails(std.StudentNumber,std.SchoolCode);

                if (result.StatusCode != Globals.SUCCESS_STATUS_CODE)
                {
                    string msg = "FAILED: " + result.StatusDesc;
                    bll.ShowMessage(lblmsg, msg, true, Session);
                    return;
                }

                controlsDiv.Controls.Add(d);
            }
        }
        catch (Exception ex)
        {
            string msg = "FAILED: " + ex.Message;
            bll.ShowMessage(lblmsg, msg, true, Session);
        }
    }

    protected void btnHome_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/LoggedInStartPage.aspx");
    }
}