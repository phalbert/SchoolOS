using InterLinkClass.PegPaySchoolsApi;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CustomUserControls_BulkStudentPayments : System.Web.UI.UserControl
{
    public event EventHandler SaveCompleted;
    Bussinesslogic bll = new Bussinesslogic();
    SystemUserDetails user = new SystemUserDetails();
    Service schoolApi = new Service();

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

        bll.LoadSchoolsIntoDropDown(user, ddSchools);
        bll.LoadDataIntoDropDown("GetServiceProvidersForDropDown", new string[] { }, ddServiceProvider);
        bll.LoadDataIntoDropDown("GetIncommingChannelsForDropDown", new string[] { }, ddChannels);
    }

    protected void btnConfirm_Click(object sender, EventArgs e)
    {
        try
        {
            string msg = "";
            if (!fuStudentsFile.HasFile)
            {
                msg = "PLEASE UPLOAD A CSV FILE";
                bll.ShowMessage(lblmsg, msg, true, Session);
                return;
            }

            string fileType = Path.GetExtension(fuStudentsFile.PostedFile.FileName);
            if (fileType.ToUpper() != "CSV")
            {
                msg = "PLEASE UPLOAD A VALID CSV FILE";
                bll.ShowMessage(lblmsg, msg, true, Session);
                return;
            }

            Result validationResult = ValidateUploadedFile();
            if (validationResult.StatusCode != Globals.SUCCESS_STATUS_CODE)
            {
                msg = "PLEASE UPLOAD A VALID CSV FILE";
                bll.ShowMessage(lblmsg, msg, true, Session);
                return;
            }

            UploadedFile uploadedFile = ReadUploadedFile();

            Result result = schoolApi.SaveUploadedFile(uploadedFile);
            if (result.StatusCode != Globals.SUCCESS_STATUS_CODE)
            {
                msg = result.StatusDesc;
                bll.ShowMessage(lblmsg, msg, true, Session);
                return;
            }

            msg = "FILE UPLOADED SUCCESSFULLY! EMAIL WILL BE SENT WITH RESULTS";
            bll.ShowMessage(lblmsg, msg, true, Session);
            return;
        }
        catch (Exception ex)
        {
            //something is wrong...show the error
            bll.ShowMessage(lblmsg, ex.Message, true, Session);
        }
    }

    private Result ValidateUploadedFile()
    {
        Result result = new Result();

        string filePath = "";
        fuStudentsFile.SaveAs(filePath);
        IEnumerable<string> allLinesInFile = File.ReadLines(filePath);

        foreach (string line in allLinesInFile)
        {
            string[] parts = line.Split(',');

            if (parts.Length > 4)
            {
                result.StatusCode = Globals.FAILURE_STATUS_CODE;
                result.StatusDesc = "INVALID FILE FORMAT, TOO MANY COLUMNS [" + parts.Length + "] IN FILE, ERROR STARTING ON LINE [" + line + "]";
                return result;
            }

            if (parts.Length < 4)
            {
                result.StatusCode = Globals.FAILURE_STATUS_CODE;
                result.StatusDesc = "INVALID FILE FORMAT, FEW COLUMNS [" + parts.Length + "] IN FILE, ERROR STARTING ON LINE [" + line + "]";
                return result;
            }

            if (parts.Length != 4)
            {
                result.StatusCode = Globals.FAILURE_STATUS_CODE;
                result.StatusDesc = "INVALID FILE FORMAT, ERROR STARTING ON LINE [" + line + "]";
                return result;
            }

            string amount = parts[1];

            if (!SharedCommons.SharedCommons.IsNumericAndAboveZero(amount))
            {
                result.StatusCode = Globals.FAILURE_STATUS_CODE;
                result.StatusDesc = "INVALID AMOUNT [" + amount + "], ERROR STARTING ON LINE [" + line + "]";
                return result;
            }
        }

        result.StatusCode = Globals.SUCCESS_STATUS_CODE;
        result.StatusDesc = Globals.SUCCESS_STATUS_TEXT;
        return result;
    }

    private UploadedFile ReadUploadedFile()
    {
        BinaryReader br = new BinaryReader(fuStudentsFile.PostedFile.InputStream);
        Byte[] bytes = br.ReadBytes((int)fuStudentsFile.PostedFile.InputStream.Length);
        br.Close();
        fuStudentsFile.PostedFile.InputStream.Close();
        string base64String = Convert.ToBase64String(bytes);

        UploadedFile uploadedFile = new UploadedFile();
        uploadedFile.OperationCode = "STUDENT_PAYMENTS";
        uploadedFile.SchoolCode = ddSchools.SelectedValue;
        uploadedFile.ModifiedBy = user.User.Username;
        uploadedFile.FileContents = base64String;
        uploadedFile.Email = user.User.Email;
        uploadedFile.Channel = GetChannelUsed();
        return uploadedFile;
    }

    private string GetChannelUsed()
    {
        string ChannelUsed = ddServiceProvider.SelectedValue + "_" + ddChannels.SelectedValue;
        InterLinkClass.CbAPI.Service cbAPI = new InterLinkClass.CbAPI.Service();
        InterLinkClass.CbAPI.PaymentType type = new InterLinkClass.CbAPI.PaymentType();
        type.BankCode = ddSchools.SelectedValue;
        type.IsActive = "TRUE";
        type.ModifiedBy = user.User.ModifiedBy;
        type.PaymentTypeCode = ChannelUsed;
        type.PaymentTypeName = ddChannels.Text + " From " + ddServiceProvider.Text;
        InterLinkClass.CbAPI.Result result = cbAPI.SavePaymentTypeDetails(type, ddSchools.SelectedValue, Globals.SCHOOL_PASSWORD);

        if (result.StatusCode != "0")
        {
            throw new Exception("FAILED:" + result.StatusDesc);
        }

        return ChannelUsed;
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/LoggedInStartPage.aspx");
    }
}