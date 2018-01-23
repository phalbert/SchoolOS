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
            //lblmsg.Text = "";
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
            Response.Redirect("Default.aspx?Msg=" + exe.Message, false);
        }
        catch (Exception ex)
        {
        }
    }

    private void LoadData()
    {
        //lblmsg.Text = user.User.FullName;
        lblBoxNumber.Text = string.IsNullOrEmpty(user.SchoolDetails.PostOfficeBox) ? "N/A" : user.SchoolDetails.PostOfficeBox;
        lblDistrict.Text = string.IsNullOrEmpty(user.SchoolDetails.District) ? "N/A" : user.SchoolDetails.District;
        lblEmail.Text = string.IsNullOrEmpty(user.SchoolDetails.SchoolEmail) ? "N/A" : user.SchoolDetails.SchoolEmail;
        lblMoto.Text = string.IsNullOrEmpty(user.SchoolDetails.SchoolMoto) ? "N/A" : user.SchoolDetails.SchoolMoto;
        lblPlotNumber.Text = string.IsNullOrEmpty(user.SchoolDetails.PlotNo) ? "N/A" : user.SchoolDetails.PlotNo;
        lblRoad.Text = string.IsNullOrEmpty(user.SchoolDetails.RoadName) ? "N/A" : user.SchoolDetails.RoadName;
        lblSchoolName.Text = string.IsNullOrEmpty(user.SchoolDetails.SchoolName) ? "N/A" : user.SchoolDetails.SchoolName;
        lblUnebNumber.Text = string.IsNullOrEmpty(user.SchoolDetails.UnebCentreNumber)?"N/A": user.SchoolDetails.UnebCentreNumber;
        lblPhoneNumber.Text= string.IsNullOrEmpty(user.SchoolDetails.SchoolPhone) ? "N/A" : user.SchoolDetails.SchoolPhone;
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

        InterLinkClass.CbAPI.Service cbAPI = new InterLinkClass.CbAPI.Service();

        dt = cbAPI.ExecuteDataSet("GetDashBoardStatistics", new string[] { user.SchoolDetails.SchoolCode }).Tables[0];

        if (dt.Rows.Count == 0)
        {
            lblTranAmount.Text = "N/A";
            return;
        }

        string amount = dt.Rows[0][0].ToString();
        amount = string.IsNullOrEmpty(amount) ? "0" : amount;
        lblTranAmount.Text = SharedCommons.SharedCommons.PutCommaInMoneyString(amount);
        if (!user.User.UserType.Contains("ADMIN"))
        {
            btnFirstTime.Visible = false;
            btnFirstTime.Enabled = false;
        }
    }

    protected void btnFirstTime_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/FirstTime.aspx");
    }
}