using InterLinkClass.PegPaySchoolsApi;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CustomUserControls_Dashboard : System.Web.UI.UserControl
{
    SystemUserDetails user;
    Bussinesslogic bll = new Bussinesslogic();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            user = Session["User"] as SystemUserDetails;
            lblmsg.Text = "";
            Session["IsError"] = null;

            if (user == null)
            {
                Response.Redirect("Default.aspx?Msg=SESSION HAS EXPIRED");
            }
            else if (IsPostBack)
            {

            }
            else
            {
                LoadData();
            }

        }
        catch (NullReferenceException exe)
        {
            Response.Redirect("Default.aspx?Msg="+exe.Message, false);
        }
        catch (Exception ex)
        {
        }
    }

    private void LoadData()
    {
        lblmsg.Text = user.User.FullName;
        UsersPic.Attributes["src"] = "../ImageHandler.ashx?Id=" + user.SchoolDetails.SchoolLogo;

        DataTable dt = bll.ExecuteDataTableOnSchoolsDB("GetDashBoardStatistics", new string[] { user.SchoolDetails.SchoolCode });

        if (dt.Rows.Count == 0)
        {
            return;
        }

        DataRow dr = dt.Rows[0];
        lblClassCount.Text = dr["ClassesCount"].ToString();
        lblStudentCount.Text = dr["StudentCount"].ToString();
        lblTeacherCount.Text = dr["TeacherCount"].ToString();
        lblTranAmount.Text = dr["TransactionCount"].ToString();
    }
}