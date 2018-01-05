using System;
using System.Data;
using System.Configuration;
using CoreBankingLogic.EntityObjects;

/// <summary>
/// Summary description for Charge
/// </summary>
public class BankCharge : BaseObject
{
    public string BankCode = "";
    public string ChargeCode = "";
    public string ChargeName = "";
    public string ChargeAmount = "";
    public string ChargeType = "";
    public string ModifiedBy = "";
    public string MinimumValue = "";
    public string MaximumValue = "";
    public string IsActive = "";
    public string CommissionAccountNumber = "";
    internal string SourceAccountNumber = "";
    public string PegasusCommissionAccountNumber = "";
    public string SbuCommissionAccountNumber = "";
    public string TaxCommissionAccountNumber = "";
    public string PegasusPercentage = "";
    public string SbuPercentage = "";
    public string TaxPercentage = "";


    public bool IsValid(string BankCode, string Password)
    {
        BussinessLogic bll = new BussinessLogic();
        BaseObject valObj;
        if (string.IsNullOrEmpty(ChargeCode))
        {
            StatusCode = Globals.FAILURE_STATUS_CODE;
            StatusDesc = "Please Supply a Charge Code";
            return false;
        }
        if (string.IsNullOrEmpty(ChargeName))
        {
            StatusCode = Globals.FAILURE_STATUS_CODE;
            StatusDesc = "Please Supply a Charge Name";
            return false;
        }
        if (string.IsNullOrEmpty(IsActive))
        {
            StatusCode = Globals.FAILURE_STATUS_CODE;
            StatusDesc = "Please Indicate if charge is Activated";
            return false;
        }

        if (!bll.IsValidBoolean(this.IsActive))
        {
            StatusCode = Globals.FAILURE_STATUS_CODE;
            StatusDesc = "Please Indicate if charge is Activated ie True Or False";
            return false;
        }
        if (string.IsNullOrEmpty(ChargeType))
        {
            StatusCode = Globals.FAILURE_STATUS_CODE;
            StatusDesc = "Please Supply a Charge Type";
            return false;
        }
        if (string.IsNullOrEmpty(ModifiedBy))
        {
            StatusCode = Globals.FAILURE_STATUS_CODE;
            StatusDesc = "Please Supply the Id of the user performing this Operation";
            return false;
        }
        if (string.IsNullOrEmpty(MinimumValue))
        {
            StatusCode = Globals.FAILURE_STATUS_CODE;
            StatusDesc = "Please Supply a Minimum Amount";
            return false;
        }
        if (string.IsNullOrEmpty(MaximumValue))
        {
            StatusCode = Globals.FAILURE_STATUS_CODE;
            StatusDesc = "Please Supply a Maximum Amount";
            return false;
        }
        
        if (!bll.IsValidBankCredentials(BankCode, Password))
        {
            StatusCode = Globals.FAILURE_STATUS_CODE;
            StatusDesc = "Invalid Credentials Supplied";
            return false;
        }
        if (string.IsNullOrEmpty(ChargeAmount))
        {
            StatusCode = Globals.FAILURE_STATUS_CODE;
            StatusDesc = "Please Supply a Charge Amount";
            return false;
        }
        
        if (string.IsNullOrEmpty(PegasusPercentage))
        {
            StatusCode = Globals.FAILURE_STATUS_CODE;
            StatusDesc = "Please Supply the Pegasus Percentage of this Charge";
            return false;
        }
        if (string.IsNullOrEmpty(SbuPercentage))
        {
            StatusCode = Globals.FAILURE_STATUS_CODE;
            StatusDesc = "Please Supply the Bank Percentage of this Charge";
            return false;
        }
        if (string.IsNullOrEmpty(TaxPercentage))
        {
            StatusCode = Globals.FAILURE_STATUS_CODE;
            StatusDesc = "Please Supply the Tax Percentage of this Charge";
            return false;
        }
        if (!bll.IsNumeric(PegasusPercentage))
        {
            StatusCode = Globals.FAILURE_STATUS_CODE;
            StatusDesc = "Please Supply A Valid Pegasus Percentage";
            return false;
        }
        if (!bll.IsNumeric(SbuPercentage))
        {
            StatusCode = Globals.FAILURE_STATUS_CODE;
            StatusDesc = "Please Supply A Valid Bank Percentage";
            return false;
        }
        if (!bll.IsNumeric(TaxPercentage))
        {
            StatusCode = Globals.FAILURE_STATUS_CODE;
            StatusDesc = "Please Supply A Valid Tax Percentage";
            return false;
        }
        if (!bll.IsValidChargeType(this.ChargeType, out valObj))
        {
            StatusCode = Globals.FAILURE_STATUS_CODE;
            StatusDesc = valObj.StatusDesc;
            return false;
        }

        //if(((SharedCommons.GetNumericValueElseZero(PegasusPercentage)+SharedCommons.GetNumericValueElseZero(SbuPercentage)+SharedCommons.GetNumericValueElseZero(TaxPercentage))!=100))
        //{
        //    StatusCode = Globals.FAILURE_STATUS_CODE;
        //    StatusDesc = "(Pegasus Percentage + Bank Percentage + Tax Percentage) must be equal to 100";
        //    return false;
        //}

        StatusCode = Globals.SUCCESS_STATUS_CODE;
        StatusDesc = Globals.SUCCESS_TEXT;
        return true;
    }
}
