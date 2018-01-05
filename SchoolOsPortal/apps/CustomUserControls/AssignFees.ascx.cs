﻿using InterLinkClass.PegPaySchoolsApi;
using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AssignFees : System.Web.UI.UserControl
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
        bll.LoadDataIntoDropDown("GetClassesForDropDown", new string[] { ddSchools.SelectedValue }, ddClasses);
        bll.LoadDataIntoDropDown("GetFeesForDropDown", new string[] { ddSchools.SelectedValue }, ddFees);
        bll.LoadDataIntoDropDownALL("GetStudentsForDropDown", new string[] { ddSchools.SelectedValue,ddClasses.SelectedValue }, ddStudents);
        ddFees_SelectedIndexChanged(null, null);
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
            StudentFee aclient = GetClient();
            Result result = schoolApi.SaveStudentFees(aclient);

            if (result.StatusCode != Globals.SUCCESS_STATUS_CODE)
            {
                msg = "FAILED: " + result.StatusDesc;
                bll.ShowMessage(lblmsg, msg, false, Session);
                return;
            }

            msg = "FEES ASSIGNED SUCCESSFULLY";
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

    private StudentFee GetClient()
    {
        StudentFee std = new StudentFee();
        std.StudentID = ddStudents.SelectedValue;
        std.ClassCode = ddClasses.SelectedValue;
        std.FeeID = ddFees.SelectedValue;
        std.Email = user.User.Email;
        std.SchoolCode = ddSchools.SelectedValue;
        std.Amount = txtAmount.Text;
        std.FeeType = txtTranType.Text;
        std.ModifiedBy = user.User.Username;
        std.TranID = SharedCommons.SharedCommons.GenerateUniqueId("PAY");
        std.PaymentChannel = Globals.SCHOOLS_WEB_PORTAL;
        return std;
    }


    protected void btnConfirm_Click(object sender, EventArgs e)
    {

    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {

    }

    protected void ddSchools_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            bll.LoadDataIntoDropDownALL("GetClassesForDropDown", new string[] { ddSchools.SelectedValue }, ddClasses);
            bll.LoadDataIntoDropDown("GetFeesForDropDown", new string[] { ddSchools.SelectedValue }, ddFees);
            bll.LoadDataIntoDropDownALL("GetStudentsForDropDown", new string[] { ddSchools.SelectedValue, ddClasses.SelectedValue }, ddStudents);
            ddFees_SelectedIndexChanged(null, null);
        }
        catch (Exception ex)
        {
            bll.LogError("SAVE-CLIENT", ex.StackTrace, "", ex.Message, "EXCEPTION");
            bll.ShowMessage(lblmsg, ex.Message, true, Session);
        }
    }

    protected void ddFees_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            DataTable dt = bll.ExecuteDataTableOnSchoolsDB("GetFeeById", new string[] { ddFees.SelectedValue,ddSchools.SelectedValue });
            if (dt.Rows.Count == 0)
            {
                string msg = "UNABLE TO GET FEE DETAILS";
                bll.ShowMessage(lblmsg, msg, true, Session);
                return;
            }
            DataRow dr = dt.Rows[0];
            txtTranType.Text = dr["FeeType"].ToString();
            txtAmount.Text = dr["Amount"].ToString();
        }
        catch (Exception ex)
        {
            bll.LogError("SAVE-CLIENT", ex.StackTrace, "", ex.Message, "EXCEPTION");
            bll.ShowMessage(lblmsg, ex.Message, true, Session);
        }
    }

    protected void ddClasses_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            bll.LoadDataIntoDropDownALL("GetStudentsForDropDown", new string[] { ddSchools.SelectedValue, ddClasses.SelectedValue }, ddStudents);
        }
        catch (Exception ex)
        {
            bll.LogError("SAVE-CLIENT", ex.StackTrace, "", ex.Message, "EXCEPTION");
            bll.ShowMessage(lblmsg, ex.Message, true, Session);
        }
    }
}