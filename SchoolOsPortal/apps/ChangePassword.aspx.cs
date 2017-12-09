using InterLinkClass.PegasusManagementApi;
using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ChangePassword : System.Web.UI.Page
{
    Bussinesslogic bll = new Bussinesslogic();
    SystemUser user;
    MSystemService client = new MSystemService();

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            user = Session["User"] as SystemUser;
            if (user != null)
            {
                LoadData();
            }
            else
            {
                Response.Redirect("Default.aspx");
            }
        }
        catch (Exception ex)
        {
            string msg = "FAILED: " + ex.Message;
            bll.ShowMessage(lblMsg, msg, true);
        }
    }

    private void LoadData()
    {
        if (user.UserType == "CUSTOMER_SERVICE" || user.UserType == "BANK_ADMIN")
        {
            resetPanel.Visible = true;
        }
        else
        {
            resetPanel.Visible = false;
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
            string OldPassword = txtOldPassword.Text;
            string NewPassword = txtNewPassword.Text;
            string ConfirmedPassword = txtConfirmPassword.Text;

            if (NewPassword != ConfirmedPassword)
            {
                string msg = "Msg: Your New Password Doesnt match the confirmed Password";
                bll.ShowMessage(lblMsg, msg, true);
            }
            else if (SharedCommons.SharedCommons.GenerateMD5Hash(OldPassword)!=user.Password)
            {
                string msg = "Msg: Your Old Password Is Incorrect";
                bll.ShowMessage(lblMsg, msg, true);
            }
            else
            {
                if (SharedCommons.SharedCommons.GenerateMD5Hash(NewPassword) == SharedCommons.SharedCommons.GenerateMD5Hash(OldPassword))
                {
                    string msg = "Your new password can't be similar to the old one";
                    bll.ShowMessage(lblMsg, msg, true);
                }
                else if (!bll.ObeysPasswordPolicy(NewPassword, user.CompanyCode))
                {
                    string msg = "Your new password should have a mixture of uppercase & lowercase letters, special characters i.e ?,$ and numbers";
                    bll.ShowMessage(lblMsg, msg, true);
                }
                else
                {
                    user.Password = SharedCommons.SharedCommons.GenerateMD5Hash(NewPassword);
                    user.ModifiedBy = user.UserId;
                    Result result = bll.ChangeUsersPassword(user.UserId, user.CompanyCode, user.Password, user.UserType, false, "PASSWORD");
                    if (result.StatusCode == "0")
                    {
                        string msg = "Password Changed Successfully";
                        bll.ShowMessage(lblMsg, msg, false);
                    }
                    else
                    {
                        string msg = result.StatusDesc;
                        bll.ShowMessage(lblMsg, msg, true);
                    }
                }            
            }
        }
        catch (Exception ex)
        {

            string msg="FAILED: "+ ex.Message;
            bll.ShowMessage(lblMsg, msg, true);
        }
    }

    protected void btnChange_Click(object sender, EventArgs e)
    {
        //try
        //{
        //    string msg = "";
        //    BankUser userValues = Session["UserValues"] as BankUser;

        //    //generate password/pin
        //    string credential = (ddCredType.SelectedValue.Equals("PASSWORD")) ? SharedCommons.SharedCommons.GeneratePassword() : SharedCommons.SharedCommons.GeneratePin();
        //    //hash it
        //    userValues.Password = SharedCommons.SharedCommons.GenerateMD5Hash(credential);

        //    Result result = bll.ChangeUsersPassword(userValues.Id, userValues.BankCode, userValues.Password, userValues.Usertype, true, ddCredType.SelectedValue);
        //    if (result.StatusCode == "0")
        //    {
        //        bll.Log("PasswordTracker_Update", new string[] { userValues.Id, "", user.Id, bll.getIp() });
        //        bll.ResendCredentials(userValues, ddCredType.SelectedValue, credential);
        //        msg = "The " + ddCredType.SelectedItem.Text + " has been reset and a notification sent to the user";
        //        txtMerchant.Text = "";
        //        txtName.Text = "";
        //        txtUserValue.Text = "";
        //        txtType.Text = "";
        //        bll.ShowMessage(otherLbl, msg, false);
        //    }
        //    else
        //    {
        //        msg = result.StatusDesc;
        //        bll.ShowMessage(otherLbl, msg, true);
        //    }
        //}
        //catch (Exception ex)
        //{
        //    bll.InsertIntoAuditLog("UPDATE", "Merchant Users", user.BankCode, user.Id, "Operation failed :" + ex.Message);
        //    bll.ShowMessage(otherLbl, "OPERATION FAILED. PLEASE CONTACT SYSTEM ADMINISTRATOR", true);
        //}        
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        //try
        //{
        //    string UserId = txtUserValue.Text;
        //    string msg = otherLbl.Text = "";
        //    BankUser userResp = bll.GetBankUser(UserId);
        //    if (userResp.StatusCode == "0")
        //    {
        //        if (userResp.BankCode == user.BankCode)
        //        {
        //            UserType UsersRole = bll.GetUserTypeById(userResp.Usertype, userResp.BankCode);

        //            if ((user.Usertype == "CUSTOMER_SERVICE" && userResp.Usertype == "CUSTOMER") || (user.Usertype == "BANK_ADMIN" && userResp.Usertype != "CUSTOMER"))
        //            {
        //                Session["UserValues"] = userResp;
        //                if (userResp.BankCode == user.BankCode)
        //                {
        //                    txtName.Text = userResp.FirstName + " " + userResp.LastName;
        //                    txtType.Text = UsersRole.Role;
        //                }
        //                if (userResp.Usertype == "CUSTOMER")
        //                {
        //                    txtType.Text = "Merchant User";
        //                    txtMerchant.Text = bll.GetAccountNamesByCustomerId(userResp.Id)[0];
        //                    customersBlock.Visible = true;
        //                    ddCredType.Enabled = IsMerchantContact(userResp);
        //                }
        //                else
        //                {
        //                    ddCredType.Enabled = false;
        //                    customersBlock.Visible = true;
        //                }
        //            }
        //            else
        //            {
        //                msg = "You cannot reset credentials for a " + UsersRole.Role;
        //                bll.ShowMessage(otherLbl, msg, true);
        //            }
        //        }
        //        else
        //        {
        //            msg = "No user found";
        //            bll.ShowMessage(otherLbl, msg, true);
        //        }
        //    }
        //    else
        //    {
        //        msg = userResp.StatusDesc;
        //        bll.ShowMessage(otherLbl, msg, true);
        //    }
        //}
        //catch (Exception ex)
        //{
        //    BankUser editedUser = Session["UserValues"] as BankUser;
        //    bll.InsertIntoAuditLog("UPDATE", "Merchant Users", user.BankCode, user.Id, "Password change of " + editedUser.Id + " failed. Reason :" + ex.Message);
        //    bll.ShowMessage(otherLbl, "OPERATION FAILED. PLEASE CONTACT SYSTEM ADMINISTRATOR", true);
        //}
    }

    private bool IsMerchantContact(SystemUser theUser)
    {
        //try
        //{
        //    string AccountCode = bll.GetAccountCodesByCustomerId(theUser.Id)[0];
        //    BankAccount acct = bll.VerifyAccount(AccountCode, theUser.BankCode);
        //    if (acct.MerchantContact == theUser.PhoneNumber)
        //    {
        //        return true;
        //    }
        //    else
        //    {
        //        return true;
        //    }
        //}
        //catch (Exception ex)
        //{
        //    bll.InsertIntoAuditLog("UPDATE", "Merchant Users", user.BankCode, user.Id, "Password change of " + theUser.Id + " failed. Reason :" + ex.Message);
        //    bll.ShowMessage(otherLbl, "OPERATION FAILED. PLEASE CONTACT SYSTEM ADMINISTRATOR", true);
           return false;
        //}
    }
}