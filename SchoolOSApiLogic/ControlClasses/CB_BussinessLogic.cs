using SchoolOSApiLogic.CBApi;
using System;
using System.Collections.Generic;
using System.Data;
using System.Text;

namespace SchoolOSApiLogic.ControlClasses
{
    public class CB_BussinessLogic
    {
        Service CbApi = new Service();
        string USERNAME = "TEST";
        string PASSWORD = "TEST";
        SharedCommonsAPI.SharedCommonsAPI sharedCommons = new SharedCommonsAPI.SharedCommonsAPI();

        public Entities.Result CreateSchoolBankIfNotExists(Entities.School school)
        {
            Entities.Result result = new Entities.Result();

            Bank bank = new Bank();
            bank.BankCode = school.SchoolCode;
            bank.BankContactEmail = school.SchoolEmail;
            bank.BankName = school.SchoolName;
            bank.BankPassword = PASSWORD;
            bank.IsActive = "TRUE";
            bank.ModifiedBy = school.ModifiedBy;
            bank.PathToLogoImage = school.SchoolLogo;
            bank.BankVaultAccNumber = "VAULT-" + DateTime.Now.Ticks.ToString();
            bank.LiquidationBankCode = school.LiquidationBankName;
            bank.LiquidationAccountName = school.LiquidationAccountName;
            bank.LiquidationAccountNumber = school.LiquidationAccountNumber;

            Result saveBankResult = CbApi.SaveBankDetails(bank, USERNAME, PASSWORD);
            result.StatusCode = saveBankResult.StatusCode;
            result.StatusDesc = saveBankResult.StatusDesc;
            result.PegPayID = saveBankResult.PegPayId;

            return result;
        }

        public Entities.Result CreateStudentBankAccountIfNotExists(Entities.Student student)
        {
            Entities.Result result = new Entities.Result();

            BankAccount account = new BankAccount();
            account.AccountBalance = "0";
            account.AccountCategory = "";
            account.AccountName = student.StudentName;
            account.AccountNumber = student.PegPayStudentNumber;
            account.AccountType = "CURRENT_ACCOUNT";
            account.ApprovedBy = "admin";
            account.BankCode = student.SchoolCode;
            account.BranchCode = "HQ";
            account.CurrencyCode = "UGX";
            account.IsActive = "TRUE";
            account.MerchantContact = student.Email;
            account.MinimumBalance = "0";
            account.InterestRate = "0";
            account.ModifiedBy = student.ModifiedBy;
            account.Referenced = "FALSE";

            Result saveBankResult = CbApi.SaveBankAccountDetails(account, account.BankCode, PASSWORD);
            result.StatusCode = saveBankResult.StatusCode;
            result.StatusDesc = saveBankResult.StatusDesc;
            result.PegPayID = saveBankResult.PegPayId;

            return result;
        }

        public DataSet ExecuteDataSetOnCB(string StoredProc, params string[] Parameters)
        {
            return CbApi.ExecuteDataSet(StoredProc, Parameters);
        }

        public Result ExecuteNonQueryOnCB(string StoredProc, params string[] Parameters)
        {
            return CbApi.ExecuteNonQuery(StoredProc, Parameters);
        }
    }
}
