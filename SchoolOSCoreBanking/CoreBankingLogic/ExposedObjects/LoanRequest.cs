using System;
using System.Collections.Generic;
using System.Text;

namespace CoreBankingLogic.ExposedObjects
{
    public class LoanRequest : BaseObject
    {
        public string LoanID = "";
        public string LoanAmout = "";
        public string CustomerId = "";
        public string CustomerContactTel = "";
        public string LoanType = "";
        public string GracePeriodInDays = "";
        public string BussinessSector = "";
        public string BussinessDescription = "";
        public string LoanApplicationFee = "";
        public string LoanProcessingFee = "";
        public string RepaymentFrequency = "";
        public string NumberOfInstallments = "";
        public string InterestDeductedOnDisbursement = "";
        public string AccountNumber = "";
        public string LoanAccountNumber = "";
        public string InterestRateInPercentage = "";
        public string MonthlyInstallmentAmounts = "";
        public string LoanStatus = "";
        public string BankCode = "";
        public string BranchCode = "";
        public string ModifiedBy = "";
        public string ApprovedBy = "";
        public string IsActive = "";
        public string AdditionalComments = "";
        public string InterestRateType = "";
        public string MapToPlaceOfResidence = "";
        public string Approver = "";
        public string CustomerCreditScore = "";
        public string NumberOfMissedPayments = "";
        public string LoanAccountTitle = "";



        public bool IsValidPayOutRequest(string BankCode, string Password)
        {
            BaseObject valObj = new BaseObject();
            BaseObject obj = bll.GetById("LOANREQUEST", this.LoanID, this.BankCode, Password);
            LoanRequest req = obj as LoanRequest;

            if (req.StatusCode != "0")
            {
                StatusCode = "100";
                StatusDesc = req.StatusDesc;
                return false;
            }
            if (string.IsNullOrEmpty(this.LoanID))
            {
                StatusCode = "100";
                StatusDesc = "PLEASE ID OF LOAN TO PAY OUT";
                return false;
            }
            else if (string.IsNullOrEmpty(this.BankCode))
            {
                StatusCode = "100";
                StatusDesc = "PLEASE SUPPLY BANK CODE OF BANK TO WHICH LOAN BELONGS";
                return false;
            }
            else if (string.IsNullOrEmpty(this.BranchCode))
            {
                StatusCode = "100";
                StatusDesc = "PLEASE SUPPLY BRANCH CODE OF BRANCH WHERE LOAN IS BEING PAYED OUT FROM";
                return false;
            }
            else if (string.IsNullOrEmpty(this.ModifiedBy))
            {
                StatusCode = "100";
                StatusDesc = "PLEASE ID OF USER WHO IS MODIFYING THIS";
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
            else if (!bll.IsValidBankRef(this.LoanID, this.BankCode, this.AccountNumber, this.LoanAccountNumber, this.LoanAmout, out valObj))
            {
                StatusCode = "100";
                StatusDesc = valObj.StatusDesc;
                return false;
            }
            else if (!bll.IsValidBankBranchCode(this.BranchCode, this.BankCode, out valObj))
            {
                StatusCode = "100";
                StatusDesc = valObj.StatusDesc;
                return false;
            }
            else if (!bll.IsValidUser(this.ModifiedBy, this.BankCode, "BUSSINESS_ADMIN|MANAGER", out valObj))
            {
                StatusCode = "100";
                StatusDesc = valObj.StatusDesc;
                return false;
            }
            else if (!bll.IsValidLoanID(this.BankCode, this.LoanID, out valObj))
            {
                StatusCode = "100";
                StatusDesc = valObj.StatusDesc;
                return false;
            }
            return true;
        }

        public bool IsValidLoanRequest(string BankCode, string Password)
        {
            BaseObject valObj = new BaseObject();
            this.MonthlyInstallmentAmounts = bll.RemoveCommasFromMoneyString(this.MonthlyInstallmentAmounts);
            this.LoanApplicationFee = bll.RemoveCommasFromMoneyString(this.LoanApplicationFee);
            this.LoanProcessingFee = bll.RemoveCommasFromMoneyString(this.LoanProcessingFee);

            if (string.IsNullOrEmpty(this.AccountNumber))
            {
                StatusCode = "100";
                StatusDesc = "PLEASE SUPPLY THE CUSTOMER ACCOUNT NUMBER TO WHICH LOAN FUNDS WILL BE DEPOSITED";
                return false;
            }
            else if (string.IsNullOrEmpty(this.LoanAccountTitle))
            {
                StatusCode = "100";
                StatusDesc = "PLEASE SUPPLY A LOAN ACCOUNT NAME/TITLE";
                return false;
            }
            else if (string.IsNullOrEmpty(this.Approver))
            {
                StatusCode = "100";
                StatusDesc = "PLEASE SUPPLY THE APPROVER OF THIS LOAN REQUEST";
                return false;
            }
            else if (string.IsNullOrEmpty(this.BankCode))
            {
                StatusCode = "100";
                StatusDesc = "PLEASE SUPPLY THE BANK CODE OF THE BANK";
                return false;
            }
            else if (string.IsNullOrEmpty(this.BranchCode))
            {
                StatusCode = "100";
                StatusDesc = "PLEASE SUPPLY THE BRANCH CODE OF THE BANK BRANCH";
                return false;
            }
            else if (string.IsNullOrEmpty(this.BussinessDescription))
            {
                StatusCode = "100";
                StatusDesc = "PLEASE SUPPLY A BRIEF DESCRIPTION OF THE BUSSINESS";
                return false;
            }
            else if (string.IsNullOrEmpty(this.BussinessSector))
            {
                StatusCode = "100";
                StatusDesc = "PLEASE SUPPLY THE BUSSINESS SECTOR THAT MOST CLOSELY RESEMBLES THE CUSTOMERS BUSSINESS";
                return false;
            }
            else if (string.IsNullOrEmpty(this.CustomerContactTel))
            {
                StatusCode = "100";
                StatusDesc = "PLEASE SUPPLY THE CUSTOMERS CONTACT TELEPHONE NUMBER";
                return false;
            }
            else if (string.IsNullOrEmpty(this.CustomerId))
            {
                StatusCode = "100";
                StatusDesc = "PLEASE SUPPLY THE ID OF THE CUSTOMER APPLYING FOR THIS LOAN";
                return false;
            }
            else if (string.IsNullOrEmpty(this.GracePeriodInDays))
            {
                StatusCode = "100";
                StatusDesc = "PLEASE SUPPLY THE GRACE PERIOD DAYS";
                return false;
            }
            else if (string.IsNullOrEmpty(this.InterestDeductedOnDisbursement))
            {
                StatusCode = "100";
                StatusDesc = "PLEASE INDICATE WHETHER THE INTEREST SHOULD BE DEDUCTED ON LOAN DISBURSEMENT";
                return false;
            }
            else if (string.IsNullOrEmpty(this.InterestRateInPercentage))
            {
                StatusCode = "100";
                StatusDesc = "PLEASE SUPPLY THE INTEREST RATE IN PERCENTAGE";
                return false;
            }
            else if (string.IsNullOrEmpty(this.InterestRateType))
            {
                StatusCode = "100";
                StatusDesc = "PLEASE SUPPLY THE INTEREST RATE CALCULATION METHOD. SIMPLE OR COMPOUND";
                return false;
            }
            else if (string.IsNullOrEmpty(this.IsActive))
            {
                StatusCode = "100";
                StatusDesc = "PLEASE INDICATE WHETHER THIS LOAN REQUEST IS ACTIVATED.";
                return false;
            }
            else if (string.IsNullOrEmpty(this.LoanAccountNumber))
            {
                StatusCode = "100";
                StatusDesc = "PLEASE SUPPLY THE LOAN ACCOUNT NUMBER";
                return false;
            }
            else if (string.IsNullOrEmpty(this.LoanAmout))
            {
                StatusCode = "100";
                StatusDesc = "PLEASE SUPPLY THE LOAN AMOUNT";
                return false;
            }
            else if (string.IsNullOrEmpty(this.LoanApplicationFee))
            {
                StatusCode = "100";
                StatusDesc = "PLEASE SUPPLY THE LOAN APPLICATION FEE";
                return false;
            }
            else if (string.IsNullOrEmpty(this.LoanID))
            {
                StatusCode = "100";
                StatusDesc = "PLEASE SUPPLY A LOAN ID";
                return false;
            }
            else if (string.IsNullOrEmpty(this.LoanProcessingFee))
            {
                StatusCode = "100";
                StatusDesc = "PLEASE SUPPLY THE LOAN PROCESSING FEE";
                return false;
            }
            else if (string.IsNullOrEmpty(this.LoanType))
            {
                StatusCode = "100";
                StatusDesc = "PLEASE INDICATE THE LOAN TYPE. e.g SECURED LOAN";
                return false;
            }
            else if (string.IsNullOrEmpty(this.ModifiedBy))
            {
                StatusCode = "100";
                StatusDesc = "PLEASE SUPPLY ID OF USER SUBMITTING THIS LOAN REQUEST";
                return false;
            }
            else if (string.IsNullOrEmpty(this.MonthlyInstallmentAmounts))
            {
                StatusCode = "100";
                StatusDesc = "PLEASE SUPPLY AMOUNT OF MONEY TO BE PAID BACK IN INSTALLMENTS";
                return false;
            }
            else if (string.IsNullOrEmpty(this.NumberOfInstallments))
            {
                StatusCode = "100";
                StatusDesc = "PLEASE SUPPLY THE APPROVER OF THIS LOAN REQUEST";
                return false;
            }
            else if (string.IsNullOrEmpty(this.RepaymentFrequency))
            {
                StatusCode = "100";
                StatusDesc = "PLEASE SUPPLY THE REPAYMENT FREQUENCY FOR THIS LOAN.";
                return false;
            }
            else if (!bll.IsValidBankCode(this.BankCode, out valObj))
            {
                StatusCode = "100";
                StatusDesc = valObj.StatusDesc;
                return false;
            }
            else if (!bll.IsValidBankBranchCode(this.BranchCode, this.BankCode, out valObj))
            {
                StatusCode = "100";
                StatusDesc = valObj.StatusDesc;
                return false;
            }
            else if (!bll.IsNumericAndAboveZero(this.MonthlyInstallmentAmounts))
            {
                StatusCode = "100";
                StatusDesc = "PLEASE SUPPLY A VALID MINIMUM REPAYMENT INSTALLMET AMOUNT";
                return false;
            }
            else if (!bll.IsNumericAndAboveZero(this.InterestRateInPercentage.Replace("%", string.Empty)))
            {
                StatusCode = "100";
                StatusDesc = "PLEASE SUPPLY A VALID INTEREST RATE";
                return false;
            }
            else if (!bll.IsValidInterestRateType(this.InterestRateType, this.BankCode, out valObj))
            {
                StatusCode = "100";
                StatusDesc = valObj.StatusDesc;
                return false;
            }
            else if (!bll.IsNumeric(this.LoanApplicationFee))
            {
                StatusCode = "100";
                StatusDesc = "PLEASE SUPPLY A VALID LOAN APPLICATION FEE";
                return false;
            }
            else if (!bll.IsNumeric(this.LoanProcessingFee))
            {
                StatusCode = "100";
                StatusDesc = "PLEASE SUPPLY A VALID LOAN PROCESSING FEE";
                return false;
            }
            else if (!bll.IsValidUser(this.ModifiedBy, this.BankCode, "CUSTOMER_SERVICE|LOAN_OFFICER", out valObj))
            {
                StatusCode = "100";
                StatusDesc = "PLEASE SUPPLY THE APPROVER OF THIS LOAN REQUEST";
                return false;
            }
            else if (!bll.IsNumeric(this.GracePeriodInDays))
            {
                StatusCode = "100";
                StatusDesc = "PLEASE SUPPLY A VALID GRACE PERIOD";
                return false;
            }
            else if (!bll.IsValidLoanType(this.LoanType, this.BankCode, out valObj))
            {
                StatusCode = "100";
                StatusDesc = valObj.StatusDesc;
                return false;
            }
            return true;
        }
    }
}
