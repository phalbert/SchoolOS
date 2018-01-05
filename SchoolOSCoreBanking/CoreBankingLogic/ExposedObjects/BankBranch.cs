using System;
using System.Collections.Generic;
using System.Text;


public class BankBranch : BaseObject
{
    public string BankBranchId = "";
    public string BranchName = "";
    public string BranchCode = "";
    public string Location = "";
    public string BankCode = "";
    public string ModifiedBy = "";
    public string IsActive = "";
    public string BranchVaultAccNumber = "";
    public string BranchTellerLimit = "";
    public string BranchSupervisorLimit = "";


    public bool IsValid(string BankCode, string Password)
    {
        BaseObject valObj = new BaseObject();
        this.BranchTellerLimit = bll.RemoveCommasFromMoneyString(this.BranchTellerLimit);
        this.BranchSupervisorLimit = bll.RemoveCommasFromMoneyString(this.BranchSupervisorLimit);

        if (string.IsNullOrEmpty(this.BankCode))
        {
            StatusCode = "100";
            StatusDesc = "PLEASE SUPPLY A BANK CODE";
            return false;
        }
        else if (string.IsNullOrEmpty(this.BranchCode))
        {
            StatusCode = "100";
            StatusDesc = "PLEASE SUPPLY A BRANCH CODE";
            return false;
        }
        else if (string.IsNullOrEmpty(this.BranchName))
        {
            StatusCode = "100";
            StatusDesc = "PLEASE SUPPLY A BRANCH NAME";
            return false;
        }
        else if (string.IsNullOrEmpty(this.Location))
        {
            StatusCode = "100";
            StatusDesc = "PLEASE SUPPLY THE LOCATION OF THIS BRANCH";
            return false;
        }
        else if (string.IsNullOrEmpty(this.ModifiedBy))
        {
            StatusCode = "100";
            StatusDesc = "PLEASE SUPPLY ID OF USER MODIFYING THIS BRANCH";
            return false;
        }
        else if (string.IsNullOrEmpty(this.BranchTellerLimit))
        {
            StatusCode = "100";
            StatusDesc = "PLEASE SUPPLY THE TELLER TRANSACTION LIMIT FOR TELLERS OF THIS BRANCH";
            return false;
        }
        else if (string.IsNullOrEmpty(this.BranchSupervisorLimit))
        {
            StatusCode = "100";
            StatusDesc = "PLEASE SUPPLY THE SUPERVISOR TRANSACTION LIMIT FOR TELLER SUPERVISORS OF THIS BRANCH";
            return false;
        }
        else if (!bll.IsValidBankCode(this.BankCode, out valObj))
        {
            StatusCode = "100";
            StatusDesc = valObj.StatusDesc;
            return false;
        }
        else if (!bll.IsValidBankCredentials(BankCode, Password))
        {
            StatusCode = "100";
            StatusDesc = "INVALID BANK CREDENTIALS AT PEGPAY.";
            return false;
        }
        else if (!bll.IsNumericAndAboveZero(this.BranchTellerLimit))
        {
            StatusCode = "100";
            StatusDesc = "PLEASE SUPPLY A VAILD TELLER TRANSACTION LIMIT FOR TELLERS OF THIS BRANCH. i.e IT MUST AN INTEGER";
            return false;
        }
        else if (!bll.IsNumericAndAboveZero(this.BranchSupervisorLimit))
        {
            StatusCode = "100";
            StatusDesc = "PLEASE SUPPLY A VAILD SUPERVISOR TRANSACTION LIMIT FOR SUPERVISORS OF THIS BRANCH. i.e IT MUST AN INTEGER";
            return false;
        }
        //is the branch teller limit equal to the branch supervisor limit
        else if ((double.Parse(this.BranchTellerLimit) == double.Parse(this.BranchSupervisorLimit)))
        {
            StatusCode = "100";
            StatusDesc = "THE BRANCH SUPERVISOR LIMIT [" + this.BranchSupervisorLimit + "] CANNOT BE THE SAME AS THE BRANCH TELLER LIMIT [" + this.BranchTellerLimit + "]";
            return false;
        }
        //is the branch teller limit greater than the supervisor limit
        else if ((double.Parse(this.BranchTellerLimit) >= double.Parse(this.BranchSupervisorLimit)))
        {
            StatusCode = "100";
            StatusDesc = "THE BRANCH SUPERVISOR LIMIT ["+this.BranchSupervisorLimit+"] MUST BE GREATER THAN THE BRANCH TELLER LIMIT ["+this.BranchTellerLimit+"]";
            return false;
        }
        else if (!bll.IsValidBoolean(this.IsActive))
        {
            StatusCode = "100";
            StatusDesc = "PLEASE INDICATE WHETHER THIS BRANCH IS ACTIVATED.[TRUE OR FALSE]";
            return false;
        }
        else
        {
            StatusCode = "0";
            StatusDesc = "SUCCESS";
            return true;
        }
    }
}

