using InterLinkClass.PegPaySchoolsApi;
using System;
using System.Collections.Generic;
using System.Data;
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
                LoadSchoolDetailsForEdit(Id);
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
        bll.LoadDataIntoDropDown("GetSupportedBanksForDropDown", new string[] { }, ddBanks);
    }

    public Result LoadSchoolDetailsForEdit(string id)
    {
        Result result = new Result();
        School sch = bll.GetSchoolById(id);

        if (sch.StatusCode != Globals.SUCCESS_STATUS_CODE)
        {
            result.StatusCode = sch.StatusCode;
            result.StatusDesc = sch.StatusDesc;
            return result;
        }

        txtSchoolCode.Text = sch.SchoolCode;
        txtAccountName.Text = sch.LiquidationAccountName;
        txtAccountNumber.Text = sch.LiquidationAccountNumber;
        txtDistrict.Text = sch.District;
        txtOfficePhone.Text = sch.SchoolPhone;
        txtPlotNumber.Text = sch.PlotNo;
        txtPostOfficeNumber.Text = sch.PostOfficeBox;
        txtRoadName.Text = sch.RoadName;
        ddBanks.SelectedValue = sch.LiquidationBankName;
        txtSchoolEmail.Text = sch.SchoolEmail;
        txtSchoolName.Text = sch.SchoolName;
        txtSubCounty.Text = sch.SubCounty;
        txtUnebNumber.Text = sch.UnebCentreNumber;
        SchoolLogo.ImageUrl = "../ImageHandler.ashx?Id=" + sch.SchoolLogo;

        btnSubmit.Visible = false;
        btnEdit.Visible = true;
        result.StatusCode = Globals.SUCCESS_STATUS_CODE;
        result.StatusDesc = Globals.SUCCESS_STATUS_TEXT;
        return result;
    }



    protected void btnEdit_Click(object sender, EventArgs e)
    {
        try
        {
            Save();


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
            DataTable dt = bll.ExecuteDataTableOnSchoolsDB("GetSchoolById", new string[] { txtSchoolCode.Text });

            if (dt.Rows.Count != 0)
            {
                string msg = "FAILED: SCHOOL CODE ALREADY IN USE. PLEASE PICK ANOTHER ONE";
                bll.ShowMessage(lblmsg, msg, false, Session);
                return;
            }

            Save();
        }
        catch (Exception ex)
        {
            bll.LogError("SAVE-CLIENT", ex.StackTrace, "", ex.Message, "EXCEPTION");
            bll.ShowMessage(lblmsg, ex.Message, true, Session);
        }
    }

    private void Save()
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



        msg = "DETAILS SAVED SUCCESSFULLY";
        bll.ShowMessage(lblmsg, msg, false, Session);
        MultiView1.SetActiveView(UploadPicView);

        if (SaveCompleted != null)
        {
            MyEventArgs eventArgs = new MyEventArgs();
            eventArgs.PegPayId = newUser.SchoolCode;

            //Pass on msg
            Session["ExternalMsg"] = msg;

            SaveCompleted(null, eventArgs);
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
        sch.LiquidationBankName = ddBanks.SelectedValue;
        sch.SchoolLogo = "";//bll.GetBase64StringOfUploadedFile(fuSchoolLogo);
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
        try
        {
            string msg = "";
            string ProfilePic = bll.GetBase64StringOfUploadedFile(fuSchoolLogo);
            DataTable dt = schoolsApi.ExecuteDataSet("UploadImage", new object[] { "", txtSchoolCode.Text, "SCHOOL", ProfilePic }).Tables[0];

            if (dt.Rows.Count == 0)
            {
                msg = "FAILED TO SAVE UPLOAD IMAGE";
                bll.ShowMessage(lblmsg, msg, true, Session);
                return;
            }

            String Id = dt.Rows[0][0].ToString();
            string url = "../ImageHandler.ashx?Id=" + Id;
            SchoolLogo.ImageUrl = url;

            if (user.SchoolDetails.SchoolCode == txtSchoolCode.Text)
            {
                user.SchoolDetails.SchoolLogo = Id;
            }

            MultiView1.SetActiveView(CaptureDetailsView);
        }
        catch (Exception ex)
        {
            bll.LogError("SAVE-CLIENT", ex.StackTrace, "", ex.Message, "EXCEPTION");
            bll.ShowMessage(lblmsg, ex.Message, true, Session);
        }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 0;
    }

    public void ShowExternalMessage()
    {
        bll.ShowExternalMessage(lblmsg, Session);
    }

    protected void SchoolLogo_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            if (!btnEdit.Visible) { return; }
            LoadUploadPicView();
        }
        catch (Exception ex)
        {
            bll.LogError("SAVE-CLIENT", ex.StackTrace, "", ex.Message, "EXCEPTION");
            bll.ShowMessage(lblmsg, ex.Message, true, Session);
        }
    }

    private void LoadUploadPicView()
    {
        MultiView1.SetActiveView(UploadPicView);
    }
}