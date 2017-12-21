using InterLinkClass.PegPaySchoolsApi;
using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SaveClass : System.Web.UI.UserControl
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

        bll.LoadSchoolsIntoDropDown(user, ddSchools);
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
            SchoolClass aclient = GetClient();
            Result result = schoolApi.SaveSchoolClass(aclient);

            if (result.StatusCode != Globals.SUCCESS_STATUS_CODE)
            {
                msg = "FAILED: " + result.StatusDesc;
                bll.ShowMessage(lblmsg, msg, false, Session);
                return;
            }

            msg = "STUDENT SAVED SUCCESSFULLY";
            bll.ShowMessage(lblmsg, msg, false, Session);

            if (SaveCompleted != null)
            {
                MyEventArgs eventArgs = new MyEventArgs();

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

    private SchoolClass GetClient()
    {
        SchoolClass std = new SchoolClass();
        std.ClassCode = SharedCommons.SharedCommons.GenerateUniqueId("CLASS");
        std.SchoolClassName = txtClassName.Text;
        std.SchoolCode = ddSchools.SelectedValue;
        std.ModifiedBy = user.User.Username;
        return std;
    }
    

    protected void btnConfirm_Click(object sender, EventArgs e)
    {

    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {

    }
}