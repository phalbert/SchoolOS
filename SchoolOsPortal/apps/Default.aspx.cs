using System;
using System.Data;
using System.Drawing;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using SharedCommons;
using System.Collections.Generic;
using System.Net;
using InterLinkClass.PegasusManagementApi;

public partial class _Default : System.Web.UI.Page
{
    Bussinesslogic bll = new Bussinesslogic();
    MSystemService client = new MSystemService();
    String BankCode = "";
    string ip = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            ip = bll.getIp();
            ServicePointManager.ServerCertificateValidationCallback = SharedCommons.SharedCommons.RemoteCertificateValidation;
            if (IsPostBack)
            {
                BankCode = Request.QueryString["BankCode"];
                if (string.IsNullOrEmpty(BankCode))
                {
                    BankCode = "ALL";
                }
            }
            else
            {
                MultiView1.ActiveViewIndex = 0;
            }

        }
        catch (Exception ex)
        {
            ShowMessage(ex.Message, true);
        }
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        try
        {
            string UserId = txtEmail.Text;
            string Password = txtPassword.Text;

            if (string.IsNullOrEmpty(UserId))
            {
                ShowMessage("PLEASE SUPPLY YOUR USER ID", true);
            }
            else
            {
                SignInUser(UserId, Password);
            }
        }
        catch (Exception ex)
        {
            ShowMessage(ex.Message, true);
        }
    }

    private void SignInUser(string UserId, string Password)
    {

        String msg = "";
        SystemUser user = bll.GetSystemUserByUserId(UserId);

        if (user.StatusCode != Globals.SUCCESS_STATUS_CODE)
        {
            msg = "FAILED: " + user.StatusDesc;
            bll.InsertIntoAuditLog("LOGIN", "", user.CompanyCode, UserId, "Unsuccessfull login of User with ID :" + UserId + " Error: " + msg);
            ShowMessage(msg, true);
            return;
        }
        
        string md5HashOfPassword = SharedCommons.SharedCommons.GenerateMD5Hash(Password);

        if (user.Password.ToUpper() != md5HashOfPassword.ToUpper())
        {
            msg = "FAILED: INVALID PASSWORD SUPPLIED";
            bll.InsertIntoAuditLog("LOGIN", "", user.CompanyCode, UserId, "Unsuccessfull login of User with ID :" + UserId + " Error: " + msg);
            ShowMessage(msg, true);
            return;
        }

        Company usersCompnay = bll.GetCompanyByCompanyCode(user.CompanyCode);

        if (usersCompnay.StatusCode != Globals.SUCCESS_STATUS_CODE)
        {
            msg = "FAILED: " + user.StatusDesc;
            bll.InsertIntoAuditLog("LOGIN", "", user.CompanyCode, UserId, "Unsuccessfull login of User with ID :" + UserId + " Error: " + msg);
            ShowMessage(msg, true);
            return;
        }

        InterLinkClass.PegasusManagementApi.UserType usersRole = bll.GetUserTypeById(user.CompanyCode,user.UserType);

        if (usersCompnay.StatusCode != Globals.SUCCESS_STATUS_CODE)
        {
            msg = "FAILED: " + user.StatusDesc;
            bll.InsertIntoAuditLog("LOGIN", "", user.CompanyCode, UserId, "Unsuccessfull login of User with ID :" + UserId + " Error: " + msg);
            ShowMessage(msg, true);
            return;
        }

        AssignSessionVariables(user,usersCompnay,usersRole);

    }

    private void CallResetPassword(SystemUser user)
    {
        try
        {
            MultiView1.ActiveViewIndex = 1;
            Session["PassUser"] = user;
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    protected void btnChangenewPassword_Click(object sender, EventArgs e)
    {
        try
        {
            //string newpassword = txtnewpassword.Text;
            //string confrimPassword = txtConfirmnewpassword.Text;
            //if (newpassword.Equals(""))
            //{
            //    ShowMessage("ENTER NEW PASSWORD", true);
            //}
            //else if (confrimPassword.Equals(""))
            //{
            //    ShowMessage("CONFIRM NEW PASSWORD", true);
            //}
            //else
            //{
            //    if (newpassword.Equals(confrimPassword))
            //    {

            //        if (Session["PassUser"] != null)
            //        {
            //            BankUser user = Session["PassUser"] as BankUser;
            //            if (!user.Id.Equals(""))
            //            {
            //                if (bll.GenerateMD5Hash(newpassword) == user.Password)
            //                {
            //                    ShowMessage("YOUR NEW PASSWORD CANNOT BE THE SAME AS THE PREVIOUS ONE", true);
            //                }
            //                else if (!bll.ObeysPasswordPolicy(newpassword, user.BankCode))
            //                {
            //                    ShowMessage("Your new password should be a combination of uppercase and lowercase letters, special characters and numbers", true);
            //                }
            //                else if (bll.PasswordHasBeenUsed(user.Id, bll.GenerateMD5Hash(newpassword)))
            //                {
            //                    ShowMessage("You have used this password before, please create another one", true);
            //                }
            //                else
            //                {
            //                    string oldPassword = user.Password;
            //                    user.Password = bll.GenerateMD5Hash(newpassword);
            //                    Result result = bll.ChangeUsersPassword(user.Id, user.BankCode, user.Password, user.Usertype, false, "PASSWORD");
            //                    if (result.StatusCode == "0")
            //                    {
            //                        bll.Log("PasswordTracker_Update", new string[] { user.Id, oldPassword, user.Id, ip });
            //                        string msg = "Password Changed Successfully";
            //                        ShowMessage(msg, false);
            //                        MultiView1.ActiveViewIndex = 0;
            //                        clearControls();
            //                    }
            //                    else
            //                    {
            //                        string msg = result.StatusDesc;
            //                        ShowMessage(msg, true);
            //                    }
            //                }
            //            }
            //            else
            //            {
            //                ShowMessage("FAIED TO DETERMINE USER DETAILS", true);
            //            }
            //        }
            //        else
            //        {
            //            ShowMessage("FAIED TO DETERMINE USER DETAILS", true);
            //        }
            //    }
            //    else
            //    {
            //        ShowMessage("PASSWORD MISMATCH", true);
            //    }
            //}
        }
        catch (Exception ex)
        {
        }
    }
    private void clearControls()
    {
        txtPassword.Text = "";
    }
    private void AssignSessionVariables(SystemUser user,Company usersCompany,InterLinkClass.PegasusManagementApi.UserType usersRole)
    {
        //string LastLoginDateTime = bll.GetLastLoginDateTime(user.Id,user.BankCode);
        Session["User"] = user;
        Session["UsersCompany"] = usersCompany;
        Session["UsersRole"] = usersRole;
        
        bll.InsertIntoAuditLog("LOGIN", "", user.CompanyCode, user.UserId, "Successfull login of User with ID :" + user.UserId + " at " + DateTime.Now);
        Server.Transfer("LoggedInStartPage.aspx", false);
    }

   

    private void SetSysAdminSession(ref Company UsersBank, ref List<string> allowedAreas, SystemUser user)
    {
        //if (user.Usertype == "SYS_ADMIN")
        //{
        //    if (UsersBank.StatusCode != "0")
        //    {
        //        UsersBank = new Bank();
        //        UsersBank.BankName = "PEGASUS TECH";
        //        UsersBank.BankCode = "PEGASUS";
        //        UsersBank.BankContactEmail = "kasozi.nsobya@pegasustechnologies.co.ug";
        //        UsersBank.BankPassword = "T3rr1613";
        //        UsersBank.IsActive = "True";
        //        UsersBank.ModifiedBy = "admin";
        //        UsersBank.PathToLogoImage = "Billing.jpg";
        //        UsersBank.PathToPublicKey = "";
        //        UsersBank.BankThemeColor = "#06283D";
        //        UsersBank.TextColor = "White";
        //        UsersBank.StatusCode = "0";
        //        UsersBank.StatusDesc = "SUCCESS";
        //        allowedAreas.Add("SYS_ADMIN");
        //        allowedAreas.Add("REPORTS");
        //    }
        //}


    }

    private string EncryptPassword(string password)
    {
        return password;
    }

    private void ShowMessage(string msg, bool IsError)
    {
        lblmsg.Text = msg;
        if (IsError)
        {
            lblmsg.ForeColor = Color.Red;
        }
        else
        {
            lblmsg.ForeColor = Color.Green;
        }
    }
}
