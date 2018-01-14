using InterLinkClass.PegPaySchoolsApi;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TestPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        controlsDiv.Controls.Clear();
        for (int i = 0; i < 10; i++)
        {
            CustomUserControls_GenerateStudentId d = LoadControl("~/CustomUserControls/GenerateStudentId.ascx") as CustomUserControls_GenerateStudentId;
            Result result= d.LoadStudentDetails("210000263", "SMACK");

            controlsDiv.Controls.Add(d);
        }
    }
}