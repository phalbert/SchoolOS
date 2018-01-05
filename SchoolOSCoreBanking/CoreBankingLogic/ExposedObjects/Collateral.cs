using System;
using System.Collections.Generic;
using System.Text;

namespace CoreBankingLogic.ExposedObjects
{
    public class Collateral:BaseObject
    {
        public string NameOfTitleOfOwnership = "";
        public string PathToPictureOfTitleOfOwnership = "";
        public string DescriptionOfCollateral = "";
        public string TypeOfCollateral = "";
        public string OwnerID = "";
        public string CollateralID = "";
        public string EstimatedMonetaryValue = "";
        public string BankCode = "";
        public string ModifiedBy = "";
        public string LoanId = "";


        public bool IsValid(string BankCode, string Password)
        {
            BaseObject valObj = new BaseObject();
            this.EstimatedMonetaryValue = bll.RemoveCommasFromMoneyString(this.EstimatedMonetaryValue);

            if (string.IsNullOrEmpty(this.ModifiedBy))
            {
                StatusCode = "100";
                StatusDesc = "PLEASE SUPPLY MODIFIER USER ID IN MODIFIEDBY FIELD";
                return false;
            }
            else if (string.IsNullOrEmpty(this.BankCode))
            {
                StatusCode = "100";
                StatusDesc = "PLEASE SUPPLY A BANK CODE";
                return false;
            }
            else if (string.IsNullOrEmpty(this.CollateralID))
            {
                StatusCode = "100";
                StatusDesc = "PLEASE SUPPLY THE ID NUMBER OF THE COLLATERAL AS SEEN ON THE TITLE OF OWNERSHIP DOCUMENT";
                return false;
            }
            else if (string.IsNullOrEmpty(this.LoanId))
            {
                StatusCode = "100";
                StatusDesc = "PLEASE SUPPLY THE LOAN ID OF LOAN TO WHICH COLLATERAL BELONGS";
                return false;
            }
            else if (string.IsNullOrEmpty(this.DescriptionOfCollateral))
            {
                StatusCode = "100";
                StatusDesc = "PLEASE SUPPLY A BRIEF DESCRIPTION OF THIS ITEM SUBMITTED AS COLLATERAL";
                return false;
            }
            else if (string.IsNullOrEmpty(this.EstimatedMonetaryValue))
            {
                StatusCode = "100";
                StatusDesc = "PLEASE SUPPLY AN ESTIMATE OF THE MONETARY VALUE OF THIS ITEM";
                return false;
            }
            else if (string.IsNullOrEmpty(this.NameOfTitleOfOwnership))
            {
                StatusCode = "100";
                StatusDesc = "PLEASE SUPPLY THE NAME OF THIS COLLATERAL e.g LAND TITLE,CAR etc";
                return false;
            }
            else if (string.IsNullOrEmpty(this.OwnerID))
            {
                StatusCode = "100";
                StatusDesc = "PLEASE THE CUSTOMERS ID.";
                return false;
            }
            else if (string.IsNullOrEmpty(this.PathToPictureOfTitleOfOwnership))
            {
                StatusCode = "100";
                StatusDesc = "PLEASE UPLOAD A PICTURE OF DOCUMENT PROVIDING PROOF OF OWNERSHIP(TITLE OF OWNERSHIP). e.g LAND TITLE";
                return false;
            }
            else if (string.IsNullOrEmpty(this.TypeOfCollateral))
            {
                StatusCode = "100";
                StatusDesc = "PLEASE SPECIFY THE TYPE OF COLLATERAL THIS ITEM IS.";
                return false;
            }
            else if (string.IsNullOrEmpty(this.PathToPictureOfTitleOfOwnership))
            {
                StatusCode = "100";
                StatusDesc = "PLEASE UPLOAD A PICTURE OF DOCUMENT PROVIDING PROOF OF OWNERSHIP(TITLE OF OWNERSHIP). e.g LAND TITLE";
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
            else if (!bll.IsValidLoanID(this.BankCode,this.LoanId,out valObj))
            {
                StatusCode = "100";
                StatusDesc = valObj.StatusDesc;
                return false;
            }
            else if (!bll.IsValidUser(this.ModifiedBy, this.BankCode,"CUSTOMER_SERVICE|BUSSINESS_ADMIN|MANAGER", out valObj))
            {
                StatusCode = "100";
                StatusDesc = valObj.StatusDesc;
                return false;
            }
            else if (!bll.IsNumericAndAboveZero(this.EstimatedMonetaryValue))
            {
                StatusCode = "100";
                StatusDesc = "PLEASE SUPPLY A VALID MONETARY VALUE";
                return false;
            }
            else if (!bll.IsValidBankCode(this.BankCode,out valObj))
            {
                StatusCode = "100";
                StatusDesc = valObj.StatusDesc;
                return false;
            }


            return true;
        }
    }
}
