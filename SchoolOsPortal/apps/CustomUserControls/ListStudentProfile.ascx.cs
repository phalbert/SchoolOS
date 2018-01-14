using InterLinkClass.PegPaySchoolsApi;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CustomUserControls_ListStudentProfile : System.Web.UI.UserControl
{
    SystemUserDetails user;
    Bussinesslogic bll = new Bussinesslogic();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            user = Session["User"] as SystemUserDetails;
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
        Student std = bll.GetStudentById(user.User.Username, user.User.SchoolCode);

        if (std.StatusCode != Globals.SUCCESS_STATUS_CODE)
        {
            return;
        }

        lblClass.Text = std.ClassCode;
        lblDateOfBirth.Text = std.DateOfBirth;
        lblGender.Text = std.Gender;
        lblParentsName1.Text = std.ParentsName1;
        lblParentsName2.Text = std.ParentsName2;
        lblParentsPhone1.Text = std.ParentsPhoneNumber1;
        lblParentsPhone2.Text = std.ParentsPhoneNumber2;
        lblPegPayStudentNumber.Text = std.PegPayStudentNumber;
        lblSchool.Text = user.SchoolDetails.SchoolName;
        lblStream.Text = std.StreamCode;
        lblStudentName.Text = std.StudentName;
        lblStudentNumber.Text = std.StudentNumber;
        ProfilePic.Attributes["src"] = "../ImageHandler.ashx?Id=" + user.SchoolDetails.SchoolLogo;
    }
}