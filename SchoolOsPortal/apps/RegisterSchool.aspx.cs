using InterLinkClass.PegPaySchoolsApi;
using System;
using System.Collections.Generic;

public partial class RegisterSchool : System.Web.UI.Page
{
    Service schoolsApi = new Service();
    Bussinesslogic bll = new Bussinesslogic();
    SystemUser user;

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
            bll.ShowMessage(lblmsg, ex.Message, true, Session);
        }
    }

    private void LoadData()
    {
        Session["IsError"] = null;
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            //Confirm that terms and conditions have been read
            if (!chkTerms.Checked)
            {
                string msg = "PLEASE CONFIRM ACCEPTANCE OF THE TERMS AND CONDITIONS";
                bll.ShowMessage(lblmsg, msg, true, Session);
                return;
            }

            //save school
            Result result = SaveSchool();
            if (result.StatusCode != Globals.SUCCESS_STATUS_CODE)
            {
                string msg = "FAILED: " + result.StatusDesc;
                bll.ShowMessage(lblmsg, msg, true, Session);
                return;
            }

            //save system User
            result = SaveSystemUser();
            if (result.StatusCode != Globals.SUCCESS_STATUS_CODE)
            {
                string msg = "FAILED: " + result.StatusDesc;
                bll.ShowMessage(lblmsg, msg, true, Session);
                return;
            }

            //success
            string successMsg = "SUCCESS!! SCHOOL SAVED SUCCESSFULLY";
            bll.ShowMessage(lblmsg, successMsg, false, Session);

        }
        catch (Exception ex)
        {
            string msg = "FAILED: " + ex.Message;
            bll.ShowMessage(lblmsg, msg, true, Session);
        }
    }

    private Result SaveSystemUser()
    {
        Result result = new Result();
        SystemUser user = GetSystemUser();
        result = schoolsApi.SaveSystemUser(user);
        return result;
    }

    private SystemUser GetSystemUser()
    {
        SystemUser user = new SystemUser();
        user.ModifiedBy = txtFullName.Text;
        user.Password = Globals.SCHOOL_PASSWORD;
        user.SchoolCode = txtSchoolCode.Text;
        user.SecretKey = SharedCommons.SharedCommons.GenerateUniqueId("");
        user.UserCategory = "ADMIN";
        user.UserType = "ADMIN";
        user.Username = txtPrincipalEmail.Text;
        user.UserPassword = SharedCommons.SharedCommons.GenearetHMACSha256Hash(user.SecretKey,SharedCommons.SharedCommons.GeneratePassword());
        user.VendorCode = Globals.SCHOOL_VENDOR_CODE;
        return user;
    }

    private Result SaveSchoolStaff()
    {
        Result result = new Result();
        SchoolStaff staff = GetSchoolStaff();
        result = schoolsApi.SaveSchoolStaff(staff);
        return result;
    }

    private SchoolStaff GetSchoolStaff()
    {
        SchoolStaff staff = new SchoolStaff();
        staff.Email = txtPrincipalEmail.Text;
        staff.FullName = txtFullName.Text;
        staff.Gender = "";
        staff.ModifiedBy = txtFullName.Text;
        staff.Password = Globals.SCHOOL_PASSWORD;
        staff.PegPayStaffIDNumber = "";
        staff.PhoneNumber = txtPrincipalPhone.Text;
        staff.SchoolCode = txtSchoolCode.Text;
        staff.StaffCategory = "TEACHER";
        staff.StaffIDNumber = "";
        staff.StaffType = "FULL_TIME";
        staff.VendorCode = Globals.SCHOOL_VENDOR_CODE;
        return staff;
    }

    private Result SaveSchool()
    {
        Result result = new Result();
        School school = GetSchool();
        result = schoolsApi.SaveSchool(school);
        return result;
    }

    private School GetSchool()
    {
        School sch = new School();
        sch.ModifiedBy = txtSchoolName.Text;
        sch.Password = Globals.SCHOOL_PASSWORD;
        sch.VendorCode = Globals.SCHOOL_VENDOR_CODE;
        sch.SchoolName = txtSchoolName.Text;
        sch.SchoolCode = txtSchoolCode.Text;
        sch.SchoolEmail = txtSchoolEmail.Text;
        sch.SubCounty = txtSubCounty.Text;
        sch.UnebCentreNumber = txtUnebNumber.Text;
        sch.SchoolPhone = txtOfficePhone.Text;
        sch.PlotNo = txtPlotNumber.Text;
        sch.PostOfficeBox = txtPostOfficeNumber.Text;
        sch.RoadName = txtRoadName.Text;
        sch.District = txtDistrict.Text;
        sch.SchoolType = GetSchoolTypes();
        sch.SchoolCategories= GetSchoolCategories();
        sch.LiquidationAccount = txtAccountNumber.Text;
        sch.LiquidationAccountName = txtAccountName.Text;
        sch.LiquidationBankName = txtSchoolBank.Text;
        return sch;
    }

    private string[] GetSchoolCategories()
    {
        List<string> types = new List<string>();
        if (chkNusery.Checked)
        {
            types.Add("NUSERY");
        }
        if (chkPrimary.Checked)
        {
            types.Add("PRIMARY");
        }
        if (chkSecondary.Checked)
        {
            types.Add("SECONDARY");
        }
        if (chkTertiary.Checked)
        {
            types.Add("TERTIARY");
        }
        return types.ToArray();
    }

    private string[] GetSchoolTypes()
    {
        List<string> types = new List<string>();
        if (chkDay.Checked)
        {
            types.Add("DAY");
        }
        if (chkBoarding.Checked)
        {
            types.Add("BOARDING");
        }
        if (chkEvening.Checked)
        {
            types.Add("EVENING");
        }
        if (chkSingle.Checked)
        {
            types.Add("SINGLE");
        }
        if (chkMixed.Checked)
        {
            types.Add("MIXED");
        }
        return types.ToArray();
    }

    protected void btnReset_Click(object sender, EventArgs e)
    {
        try
        {
            Response.Redirect("~/RegisterSchool.aspx");
        }
        catch (Exception ex)
        {
            string msg = "FAILED: " + ex.Message;
            bll.ShowMessage(lblmsg, msg, true, Session);
        }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        try
        {
            Response.Redirect("~/RegisterSchool.aspx");
        }
        catch (Exception ex)
        {
            string msg = "FAILED: " + ex.Message;
            bll.ShowMessage(lblmsg, msg, true, Session);
        }
    }
}