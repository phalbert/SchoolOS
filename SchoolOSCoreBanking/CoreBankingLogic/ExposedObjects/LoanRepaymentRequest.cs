using System;
using System.Collections.Generic;
using System.Text;

namespace CoreBankingLogic.ExposedObjects
{
    public class LoanRepaymentRequest:BaseObject
    {
        public string CustomerName = "";
        public string CustomerTel = "";
        public string SourceAccountNumber = "";
        public string LoanAccountNumber = "";
        public string LoanID = "";
        public string RepaymentAmount = "";
        public string BanksCommissionAccountNumber = "";
        public string BankTranId = "";
        public string PaymentDate = "";
        public string Teller = "";
        public string ApprovedBy = "";
        public string BankCode = "";
        public string Narration = "";
        public string Password = "";
        public string DigitalSignature = "";
        public string TranCategory = "";
        public string BranchCode = "";
        public string CurrencyCode = "";
        public string PaymentType = "";
        public string ChequeNumber = "";


        public bool IsValidLoanRepaymentRequest()
        {
            BaseObject valObj = new BaseObject();

            if (!string.IsNullOrEmpty(this.RepaymentAmount)) 
            { 
                this.RepaymentAmount = this.RepaymentAmount.Replace(",", string.Empty); 
            }
            if (string.IsNullOrEmpty(this.ApprovedBy))
            {
                StatusCode = "100";
                StatusDesc = "PLEASE SUPPLY APPROVER USER ID IN APPROVEDBY FIELD";
                return false;
            }
            else if (string.IsNullOrEmpty(this.BankCode))
            {
                StatusCode = "100";
                StatusDesc = "PLEASE SUPPLY A BANKCODE";
                return false;
            }
            else if (string.IsNullOrEmpty(this.BankTranId))
            {
                StatusCode = "100";
                StatusDesc = "PLEASE SUPPLY A BANK TRANSACTION ID";
                return false;
            }
            else if (string.IsNullOrEmpty(this.BranchCode))
            {
                StatusCode = "100";
                StatusDesc = "PLEASE SUPPLY A BRANCH CODE";
                return false;
            }
            else if (string.IsNullOrEmpty(this.CustomerTel))
            {
                StatusCode = "100";
                StatusDesc = "PLEASE SUPPLY A CUSTOMER TEL";
                return false;
            }
            else if (string.IsNullOrEmpty(this.PaymentType))
            {
                StatusCode = "100";
                StatusDesc = "PLEASE SUPPLY A PAYMENT TYPE";
                return false;
            }

            else if (string.IsNullOrEmpty(this.CustomerName))
            {
                StatusCode = "100";
                StatusDesc = "PLEASE SUPPLY A CUSTOMER NAME";
                return false;
            }
            else if (string.IsNullOrEmpty(this.SourceAccountNumber))
            {
                StatusCode = "100";
                StatusDesc = "PLEASE SUPPLY THE CUSTOMERS ACCOUNT NUMBER";
                return false;
            }
            else if (string.IsNullOrEmpty(this.LoanAccountNumber))
            {
                StatusCode = "100";
                StatusDesc = "PLEASE SUPPLY THE CUSTOMERS LOAN ACCOUNT NUMBER";
                return false;
            }
            else if (string.IsNullOrEmpty(this.BanksCommissionAccountNumber))
            {
                StatusCode = "100";
                StatusDesc = "PLEASE SUPPLY THE BANKS COMMISSION ACCOUNT FOR LOAN COMMISSIONS";
                return false;
            }
            else if (string.IsNullOrEmpty(this.RepaymentAmount))
            {
                StatusCode = "100";
                StatusDesc = "PLEASE SUPPLY THE AMOUNT TO BE TRANSFERED";
                return false;
            }
            else if (string.IsNullOrEmpty(this.Narration))
            {
                StatusCode = "100";
                StatusDesc = "PLEASE SUPPLY A NARRATION/REASON FOR THIS TRANSACTION";
                return false;
            }
            else if (string.IsNullOrEmpty(this.Password))
            {
                StatusCode = "100";
                StatusDesc = "PLEASE SUPPLY A BANK PASSWORD";
                return false;
            }
            else if (string.IsNullOrEmpty(this.PaymentDate))
            {
                StatusCode = "100";
                StatusDesc = "PLEASE SUPPLY A PAYMENT DATE";
                return false;
            }
            else if (string.IsNullOrEmpty(this.Teller))
            {
                StatusCode = "100";
                StatusDesc = "PLEASE SUPPLY A TELLER ID";
                return false;
            }
            else if (string.IsNullOrEmpty(this.TranCategory))
            {
                StatusCode = "100";
                StatusDesc = "PLEASE SUPPLY A TRANSACTION CATEGORY";
                return false;
            }
            else if (string.IsNullOrEmpty(this.CurrencyCode))
            {
                StatusCode = "100";
                StatusDesc = "PLEASE SUPPLY THE CURRENCY CODE.";
                return false;
            }
            else if (this.PaymentType.ToUpper().Contains("CHEQUE") && string.IsNullOrEmpty(this.ChequeNumber))
            {
                StatusCode = "100";
                StatusDesc = "PLEASE SUPPLY THE CHEQUE NUMBER";
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
            else if (!bll.IsNumericAndAboveZero(this.RepaymentAmount))
            {
                StatusCode = "100";
                StatusDesc = "FAILED: PLEASE SUPPLY A VALID MONTHLY INSTALLMENT";
                return false;
            }
            else if (!bll.IsValidTelephone(ref this.CustomerTel, out valObj))
            {
                StatusCode = "100";
                StatusDesc = "PLEASE SUPPLY A VALID BANKCODE. BANK NOT FOUND";
                return false;
            }
            else if (!bll.IsValidBankCode(this.BankCode, out valObj))
            {
                StatusCode = "100";
                StatusDesc = "PLEASE SUPPLY A VALID BANKCODE. BANK NOT FOUND";
                return false;
            }
            else if (!bll.IsValidBankRef(this.BankTranId, this.BankCode, this.LoanAccountNumber, this.SourceAccountNumber, this.RepaymentAmount, out valObj))
            {
                StatusCode = valObj.StatusCode;
                StatusDesc = valObj.StatusDesc;
                return false;
            }
            else if (!bll.IsValidBankBranchCode(this.BranchCode, this.BankCode, out valObj))
            {
                StatusCode = "100";
                StatusDesc = valObj.StatusDesc;
                return false;
            }
            else if (!bll.IsValidTransactAccountNumber(this.SourceAccountNumber, this.BankCode, out valObj))
            {
                StatusCode = "100";
                StatusDesc = valObj.StatusDesc;
                return false;
            }
            else if (!bll.IsValidLoanAccountNumber(this.LoanAccountNumber,this.RepaymentAmount, this.BankCode, out valObj))
            {
                StatusCode = "100";
                StatusDesc = valObj.StatusDesc;
                return false;
            }
            else if (!bll.IsValidTransactAccountNumber(this.BanksCommissionAccountNumber, this.BankCode, out valObj))
            {
                StatusCode = "100";
                StatusDesc = valObj.StatusDesc;
                return false;
            }
            else if (!bll.IsValidTransactionCategory(this.TranCategory, this.BankCode, out valObj))
            {
                StatusCode = "100";
                StatusDesc = valObj.StatusDesc;
                return false;
            }
            else if (!bll.IsValidCurrencyCode(this.CurrencyCode, this.BankCode, out valObj))
            {
                StatusCode = "100";
                StatusDesc = valObj.StatusDesc;
                return false;
            }
            else if (!bll.IsValidPaymentType(this.PaymentType, this.BankCode, out valObj))
            {
                StatusCode = "100";
                StatusDesc = valObj.StatusDesc;
                return false;
            }
            return true;
        }
    }
}
