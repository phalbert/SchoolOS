using InterLinkClass.PegPaySchoolsApi;
using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SaveSchool : System.Web.UI.UserControl
{
    public event EventHandler SaveCompleted;
    Bussinesslogic bll = new Bussinesslogic();
    SystemUserDetails user = new SystemUserDetails();
    Service schoolsApi = new Service();

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {

            user = Session["User"] as SystemUserDetails;
            Session["IsError"] = null;
            string Id = Request.QueryString["BankCode"];

            //Session is invalid
            if (user == null)
            {
                Response.Redirect("Default.aspx?Msg=SESSION HAS EXPIRED");
            }
            //Page posting back user request
            else if (IsPostBack)
            {

            }
            //Load Old details
            else if (!string.IsNullOrEmpty(Id))
            {
                LoadEntityData(Id);
            }
            //First time Request
            else
            {
                LoadData();
            }
        }
        catch (Exception ex)
        {
            //something is wrong...show the error
            bll.ShowMessage(lblmsg, ex.Message, true, Session);
        }
    }

    private void LoadData()
    {
        btnSubmit.Visible = true;
        btnEdit.Visible = false;

    }

    private void LoadEntityData(string id)
    {
        btnSubmit.Visible = false;
        btnEdit.Visible = true;

    }

    protected void btnEdit_Click(object sender, EventArgs e)
    {
        try
        {

        }
        catch (Exception ex)
        {
            bll.ShowMessage(lblmsg, ex.Message, true, Session);
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            string msg = "";
            School newUser = GetSchool();
            Result result = schoolsApi.SaveSchool(newUser);

            if (result.StatusCode != Globals.SUCCESS_STATUS_CODE)
            {
                msg = "FAILED: " + result.StatusDesc;
                bll.ShowMessage(lblmsg, msg, false, Session);
                return;
            }

            SchoolLogo.Attributes["src"] = "../ImageHandler.ashx?Id=" + result.ThirdPartyID;
            msg = "DETAILS SAVED SUCCESSFULLY";
            bll.ShowMessage(lblmsg, msg, false, Session);


           

            if (SaveCompleted != null)
            {
                MyEventArgs eventArgs = new MyEventArgs();
                eventArgs.PegPayId = newUser.SchoolCode;

                //Pass on msg
                Session["ExternalMsg"] = msg;

                SaveCompleted(sender, eventArgs);
            }
        }
        catch (Exception ex)
        {
            bll.LogError("SAVE-CLIENT", ex.StackTrace, "", ex.Message, "EXCEPTION");
            bll.ShowMessage(lblmsg, ex.Message, true, Session);
        }
    }

    private School GetSchool()
    {
        School sch = new School();
        sch.ModifiedBy = txtSchoolName.Text;
        sch.VendorPassword = Globals.SCHOOL_PASSWORD;
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
        sch.SchoolCategories = GetSchoolCategories();
        sch.LiquidationAccountNumber = txtAccountNumber.Text;
        sch.LiquidationAccountName = txtAccountName.Text;
        sch.LiquidationBankName = txtSchoolBank.Text;
        sch.SchoolLogo= bll.GetBase64StringOfUploadedFile(fuSchoolLogo);
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


    protected void btnConfirm_Click(object sender, EventArgs e)
    {

    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {

    }

    public void ShowExternalMessage()
    {
        bll.ShowExternalMessage(lblmsg, Session);
    }
}