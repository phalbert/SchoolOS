using System;
using System.Data;
using System.Configuration;
using CoreBankingLogic.EntityObjects;
using System.Collections.Generic;

/// <summary>
/// Summary description for Customer
/// </summary>
public class BankCustomer : BankUser
{
    public string PathToProfilePic = "";
    public string PathToSignature = "";
    public string PathToIdentityDocPic = "";
    public string TypeOfID = "";
    public string NextOfKinName = "";
    public string NextOfKinContact = "";
    public string MaritalStatus = "";
    public string Nationality = "";
    public string AccountNumber = "";
    public string AccountCode = "";
    public string AccountCategory = "";

    public BankCustomer()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public bool IsValidNewCustomer(string BankCode, string Password)
    {
        BaseObject valObj = new BaseObject();

        //if the one who is Approving is the same as the one modifiying 
        //set the Approved By to be empty
        if (this.ModifiedBy.ToUpper().Trim() == this.ApprovedBy.ToUpper().Trim())
        {
            if (this.ModifiedBy.ToUpper() == "ADMIN")
            {
                this.ApprovedBy = "Admin";
            }
            else if (this.Usertype.Equals("CUSTOMER"))
            {
                this.ApprovedBy = this.ModifiedBy;
            }
            else
            {
                this.ApprovedBy = "";
            }
        }

        //Lets start validations
        if (string.IsNullOrEmpty(this.BankCode))
        {
            StatusCode = "100";
            StatusDesc = "PLEASE SUPPLY A BANK CODE TO WHICH CUSTOMER BELONGS";
            return false;
        }
        if (string.IsNullOrEmpty(this.AccountCode))
        {
            StatusCode = "100";
            StatusDesc = "FAILED TO DETERMINE MERCHANT TILL NUMBER";
            return false;
        }
        if (string.IsNullOrEmpty(this.AccountNumber))
        {
            StatusCode = "100";
            StatusDesc = "FAILED TO DETERMINE MERCHANT TILL NUMBER";
            return false;
        }
        if (string.IsNullOrEmpty(this.BranchCode))
        {
            StatusCode = "100";
            StatusDesc = "PLEASE SUPPLY A BRANCH CODE OF BRANCH TO WHICH CUSTOMER BELONGS";
            return false;
        }
        if (string.IsNullOrEmpty(this.FirstName))
        {
            StatusCode = "100";
            StatusDesc = "PLEASE SUPPLY THE FIRST NAME OF THIS INDIVIDUAL";
            return false;
        }
        if (string.IsNullOrEmpty(this.PhoneNumber))
        {
            StatusCode = "100";
            StatusDesc = "PLEASE SUPPLY THE CUSTOMERS PHONE NUMBER CONTACT";
            return false;
        }
        if (this.AccountCategory != "BANKCUSTOMER")
        {
            if (string.IsNullOrEmpty(this.DateOfBirth))
            {
                StatusCode = "100";
                StatusDesc = "PLEASE SUPPLY A DATE OF BIRTH FOR THIS INDIVIDUAL";
                return false;
            }
            if (!bll.IsValidGender(this.Gender))
            {
                StatusCode = "100";
                StatusDesc = "PLEASE INDICATE GENDER OF INDIVIDUAL. [MALE OR FEMALE]";
                return false;
            }
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
        if (!bll.IsValidBoolean(this.IsActive))
        {
            StatusCode = "100";
            StatusDesc = "PLEASE INDICATE WHETHER CUSTOMER IS ACTIVE. [TRUE OR FALSE]";
            return false;
        }

        if (string.IsNullOrEmpty(this.Password))
        {
            StatusCode = "100";
            StatusDesc = "PLEASE SUPPLY A MD5 HASHED PASSWORD FOR THIS CUSTOMER";
            return false;
        }
        if (string.IsNullOrEmpty(this.Id))
        {
            StatusCode = "100";
            StatusDesc = "PLEASE SUPPLY A UNIQUE ID FOR THIS INDIVIDUAL. It can be Email or Phone Number of CUSTOMER";
            return false;
        }
        //if they have supplied the email check if its valid
        if ((!string.IsNullOrEmpty(this.Email)) && (!bll.IsValidEmail(this.Email)))
        {
            StatusCode = "100";
            StatusDesc = "FAILED: EMAIL SUPPLIED IS INVALID.";
            return false;
        }
        if (string.IsNullOrEmpty(this.ModifiedBy))
        {
            StatusCode = "100";
            StatusDesc = "PLEASE SUPPLY USER ID OF MODIFIER IN MODIFIED BY FIELD";
            return false;
        }
        if (!bll.IsValidTelephone(ref this.PhoneNumber, out valObj))
        {
            StatusCode = "100";
            StatusDesc = "PLEASE SUPPLY A VALID PHONE NUMBER";
            return false;
        }
        //if (bll.PhoneExistsInSystem(this.PhoneNumber, out StatusDesc))
        //{
        //    StatusCode = "100";
        //    return false;
        //}
        if (!bll.IsValidUser(this.ModifiedBy, BankCode, "BUSSINESS_ADMIN|CUSTOMER_SERVICE|CUSTOMER", out valObj) && this.Usertype != "NONE")
        {
            string statusDesc = valObj.StatusDesc.ToUpper();
            if (statusDesc.Contains("NOT ACTIVATED") || statusDesc.Contains("NOT YET APPROVED"))
            {
                StatusCode = "0";
                statusDesc = "SUCCESS";
            }
            else
            {

                StatusCode = "100";
                StatusDesc = valObj.StatusDesc;
                return false;
            }
        }
        //if (string.IsNullOrEmpty(this.PathToProfilePic))
        //{
        //    StatusCode = "100";
        //    StatusDesc = "PLEASE SUPPLY A PROFILE PICTURE FOR THIS CUSTOMER";
        //    return false;
        //}
        //if (string.IsNullOrEmpty(this.PathToIdentityDocPic))
        //{
        //    StatusCode = "100";
        //    StatusDesc = "PLEASE SUPPLY AN IMAGE OF THE CUSTOMERS ID";
        //    return false;
        //}

        //if (string.IsNullOrEmpty(this.PathToSignature))
        //{
        //    StatusCode = "100";
        //    StatusDesc = "PLEASE SUPPLY AN IMAGE OF THE CUSTOMERS SIGNATURE.";
        //    return false;
        //}

        StatusCode = "0";
        StatusDesc = "SUCCESS";
        return true;


    }

}

