
using InterLinkClass.PegPaySchoolsApi;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ForgotPassword : System.Web.UI.Page
{
    Bussinesslogic bll = new Bussinesslogic();
    Service schoolsAPI = new Service();
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnReset_Click(object sender, EventArgs e)
    {
        try
        {
            String userID = txtUserID.Text;
            SystemUser user = bll.GetSystemUserById2(userID);

            if (user.StatusCode!=Globals.SUCCESS_STATUS_CODE)
            {
                string msg = "FAILED: " + user.StatusDesc;
                lblmsg.Text = msg;
                return;
            }

            string newPassword = SharedCommons.SharedCommons.GeneratePassword();
            user.UserPassword = SharedCommons.SharedCommons.GenearetHMACSha256Hash(user.SecretKey,newPassword);

            DataTable dt = schoolsAPI.ExecuteDataSet("UpdateSystemUserPassword", new object[] { }).Tables[0];

            if (dt.Rows.Count == 0)
            {
                string msg = "FAILED TO RESET PASSWORD. CONTACT SYSTEM ADMINISTRATORS";
                lblmsg.Text = msg;
                return;
            }

            user.UserPassword = newPassword;
            Result result = bll.SendCredentialsToUser(user);

            if (result.StatusCode != Globals.SUCCESS_STATUS_CODE)
            {
                string msg = "FAILED TO SEND CREDENTIALS TO EMAIL ["+user.Email+"]";
                lblmsg.Text = msg;
                return;
            }


            string msg1 = "CREDENTIALS HAVE BEEN RESET AND SENT TO EMAIL [" + user.Email + "]";
            lblmsg.Text = msg1;
            return;

        }
        catch (Exception ex)
        {
            string msg = "FAILED: " + ex.Message;
            lblmsg.Text = msg;
        }
    }
}