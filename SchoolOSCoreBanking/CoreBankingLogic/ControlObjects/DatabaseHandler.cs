using System;
using System.Data;
using System.Configuration;
using System.Data.Common;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Globalization;
using CoreBankingLogic.ExposedObjects;
using CoreBankingLogic.EntityObjects;
using System.Collections.Generic;

/// <summary>
/// Summary description for DatabaseHandler
/// </summary>
public class DatabaseHandler
{
    private Database CbDatabase;
  //  private Database GatewayDB;
    private DbCommand command;
    public string SmsQueuePath = "";
    public string ConnectionString = "TestCbConnectionString";
    //public string ConnectionString = "PegPayConnectionString";
   // public string GatewayString = "PegPayGateway";

    public DatabaseHandler()
    {
        try
        {
            CbDatabase = DatabaseFactory.CreateDatabase(ConnectionString);
            ///GatewayDB = DatabaseFactory.CreateDatabase(GatewayString);
            SmsQueuePath = @".\private$\smsQueue";
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    public string SaveCustomer(BankCustomer cust, string BankCode)
    {
        if (!string.IsNullOrEmpty(cust.DateOfBirth))
        {
            string format = "yyyy-MM-dd";
            DateTime birthDate = DateTime.ParseExact(cust.DateOfBirth, format, CultureInfo.InvariantCulture);
        }
        try
        {
            command = CbDatabase.GetStoredProcCommand("Customers_Update",
                                                       cust.Id,
                                                       cust.Email,
                                                       cust.FirstName,
                                                       cust.LastName,
                                                       cust.OtherName,
                                                       cust.Password,
                                                       cust.Pin,
                                                       cust.IsActive,
                                                       cust.BankCode,
                                                       cust.ModifiedBy,//CreatedBy
                                                       cust.ModifiedBy,//ModifiedBY
                                                       cust.ApprovedBy,
                                                       cust.PhoneNumber,
                                                       cust.BranchCode,
                                                       cust.DateOfBirth,
                                                       cust.Gender,
                                                       cust.PathToProfilePic,
                                                       cust.PathToSignature,
                                                       cust.NextOfKinName,
                                                       cust.NextOfKinContact,
                                                       cust.MaritalStatus,
                                                       cust.Nationality,
                                                       cust.AccountCode,
                                                       cust.AccountNumber,
                                                       cust.UserCategory
                );
            DataTable datatable = CbDatabase.ExecuteDataSet(command).Tables[0];
            return datatable.Rows[0][0].ToString();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    internal string SaveBank(Bank bank)
    {
        try
        {
            if (bank.IsActive == "") { bank.IsActive = "True"; }
            command = CbDatabase.GetStoredProcCommand("Banks_Update",
                                                        bank.BankId,
                                                        bank.BankName,
                                                        bank.BankCode,
                                                        bank.BankContactEmail,
                                                        bank.BankPassword,
                                                        bank.IsActive,
                                                        bank.ModifiedBy,
                                                        bank.PathToLogoImage,
                                                        bank.PathToPublicKey,
                                                        bank.BankThemeColor,
                                                        bank.TextColor,
                                                        bank.BankVaultAccNumber,
                                                        bank.BankLoanCommissionAccount,
                                                        bank.BankInterestPayableAccount,
                                                        bank.LiquidationBankCode,
                                                        bank.LiquidationAccountName,
                                                        bank.LiquidationAccountNumber
                );
            DataSet allTables = CbDatabase.ExecuteDataSet(command);
            //get last table because it has what we need
            DataTable datatable = allTables.Tables[allTables.Tables.Count - 1];
            return datatable.Rows[0][0].ToString();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }


    internal string SaveBankBranch(BankBranch branch, string BankCode)
    {
        try
        {
            string CreateDate = DateTime.Now.ToString("yyyy-MM-dd");
            string ModifyDate = CreateDate;
            command = CbDatabase.GetStoredProcCommand("BankBranches_Update",
                                                       branch.BankBranchId,
                                                       branch.BranchName,
                                                       branch.BranchCode,
                                                       branch.Location,
                                                       branch.IsActive,
                                                       branch.BankCode,
                                                       branch.ModifiedBy,
                                                       branch.BranchVaultAccNumber,
                                                       branch.BranchTellerLimit,
                                                       branch.BranchSupervisorLimit
                );
            DataTable datatable = CbDatabase.ExecuteDataSet(command).Tables[0];
            return datatable.Rows[0][0].ToString();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    internal string SaveBankTeller(BankTeller teller, string BankCode)
    {
        try
        {
            string CreateDate = DateTime.Now.ToString("yyyy-MM-dd");
            string ModifyDate = CreateDate;
            command = CbDatabase.GetStoredProcCommand("BankTellers_Update",
                                                       teller.Email,
                                                       teller.FirstName,
                                                       teller.LastName,
                                                       teller.OtherName,
                                                       teller.Usertype,
                                                       teller.Password,
                                                       teller.IsActive,
                                                       teller.ModifiedBy,//because he who creates either also modifies
                                                       teller.ModifiedBy,
                                                       teller.ApprovedBy,
                                                       teller.BranchCode,
                                                       teller.DateOfBirth,
                                                       teller.PhoneNumber,
                                                       teller.Gender,
                                                       teller.TellerAccountNumber,
                                                       teller.BankCode);
            DataTable datatable = CbDatabase.ExecuteDataSet(command).Tables[1];
            return datatable.Rows[0][0].ToString();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    internal string SaveAccount(BankAccount account, string BankCode)
    {
        try
        {
            string AccountId = "";
            command = CbDatabase.GetStoredProcCommand("Accounts_Update",
                                                        account.AccountId,
                                                        account.AccountBalance,
                                                        "",
                                                        account.AccountNumber,
                                                        account.AccountType,
                                                        account.AccountCategory,
                                                        account.BankCode,
                                                        account.ModifiedBy,
                                                        account.BranchCode,
                                                        account.IsActive,
                                                        account.CurrencyCode,
                                                        account.ApprovedBy,
                                                        account.AccountName,
                                                        account.MinimumBalance,
                                                        account.InterestRate,
                                                        account.InterestType,
                                                        account.InterestPayOutFreq,
                                                        false,
                                                        "",
                                                        account.Referenced,
                                                        account.LiquidationType,
                                                        account.LiquidationFrequency,
                                                        account.BankLiqAccount,
                                                        account.BankLiqAccountName,
                                                        account.MerchantContact
                );
            DataTable datatable = CbDatabase.ExecuteDataSet(command).Tables[0];
            AccountId = datatable.Rows[0][1].ToString();
            //datatable.Rows[0][0].ToString() + " and AccountCode: " + datatable.Rows[0][1].ToString();
            return AccountId;
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    internal string SaveBankCommissionAccount(BankCommissionAccount account, string BankCode)
    {
        try
        {
            string AccountId = "";
            command = CbDatabase.GetStoredProcCommand("CommissionAccounts_Update",
                                                       account.CommissionAccountCode,
                                                       account.CommissionAccountName,
                                                       account.AccountNumber,
                                                       account.BankCode,
                                                       account.ModifiedBy,
                                                       account.BranchCode,
                                                       account.IsActive,
                                                       account.CurrencyCode,
                                                       account.ApprovedBy,
                                                       account.AccountName,
                                                       account.MinimumBalance,
                                                       account.InterestRate,
                                                       account.InterestType,
                                                       account.InterestPayOutFreq
                                                         );
            DataTable datatable = CbDatabase.ExecuteDataSet(command).Tables[0];
            AccountId = datatable.Rows[0][0].ToString();

            return AccountId;
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    internal DataTable GetMerchantChargesForTransaction(string bankCode, string tranAmount, string tranCategory,string PaymentChannel, string accountId, string accountIdType)
    {
        try
        {
            command = CbDatabase.GetStoredProcCommand("GetMerchantChargesForTransaction",
                                                      bankCode,
                                                      tranAmount,
                                                      tranCategory,
                                                      accountId,
                                                      accountIdType,
                                                      PaymentChannel
                                                         );
            DataTable datatable = CbDatabase.ExecuteDataSet(command).Tables[0];
            return datatable;
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    internal DataTable GetMerchantChargesForTransactionWithChargeAmount(string bankCode, string tranAmount, string tranCategory, string PaymentChannel, string accountId, string accountIdType,string ChargeAmount)
    {
        try
        {
            command = CbDatabase.GetStoredProcCommand("GetMerchantChargesForTransactionWithChargeAmount",
                                                      bankCode,
                                                      tranAmount,
                                                      tranCategory,
                                                      accountId,
                                                      accountIdType,
                                                      PaymentChannel,
                                                      ChargeAmount
                                                         );
            DataTable datatable = CbDatabase.ExecuteDataSet(command).Tables[0];
            return datatable;
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    public string Transact(TransactionRequest tranRequest, BankCharge charge1, BankCharge charge2, BankCharge charge3, BankCharge charge4)
    {
        try
        {
            DateTime payDate = DateTime.ParseExact(tranRequest.PaymentDate, "dd/MM/yyyy", CultureInfo.InvariantCulture);
            command = CbDatabase.GetStoredProcCommand("InsertReceivedTransactionWithCharges",
                                                        tranRequest.CustomerName,
                                                        tranRequest.ToAccount,
                                                        tranRequest.FromAccount,
                                                        tranRequest.TranAmount,
                                                        tranRequest.BankTranId,
                                                        payDate,
                                                        tranRequest.Teller,
                                                        tranRequest.ApprovedBy,
                                                        tranRequest.BankCode,
                                                        tranRequest.Narration,
                                                        tranRequest.TranCategory,
                                                        tranRequest.BranchCode,
                                                        tranRequest.CurrencyCode,
                                                        tranRequest.PaymentType,
                                                        tranRequest.ChequeNumber,
                                                        charge1.ChargeCode,
                                                        charge1.ChargeAmount,
                                                        charge1.CommissionAccountNumber,
                                                        charge1.SourceAccountNumber,
                                                        charge2.ChargeCode,
                                                        charge2.ChargeAmount,
                                                        charge2.CommissionAccountNumber,
                                                        charge2.SourceAccountNumber,
                                                        charge3.ChargeCode,
                                                        charge3.ChargeAmount,
                                                        charge3.CommissionAccountNumber,
                                                        charge3.SourceAccountNumber,
                                                        charge4.ChargeCode,
                                                        charge4.ChargeAmount,
                                                        charge4.CommissionAccountNumber,
                                                        charge4.SourceAccountNumber,
                                                        tranRequest.CustomerRef,
                                                        tranRequest.CustomerTel
                                                      );
            DataSet ds = CbDatabase.ExecuteDataSet(command);

            //get last table returned in result set
            int index = ds.Tables.Count - 1;
            DataTable dt = ds.Tables[index];
            //return the ID from that table as the PegPayID
            return dt.Rows[0][0].ToString();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    public string PayOutInterest(TransactionRequest tranRequest)
    {
        try
        {
            DateTime payDate = DateTime.ParseExact(tranRequest.PaymentDate, "dd/MM/yyyy", CultureInfo.InvariantCulture);
            command = CbDatabase.GetStoredProcCommand("PayOutInterest",
                                                        tranRequest.CustomerName,
                                                        tranRequest.ToAccount,
                                                        tranRequest.FromAccount,
                                                        tranRequest.TranAmount,
                                                        tranRequest.BankTranId,
                                                        payDate,
                                                        tranRequest.Teller,
                                                        tranRequest.ApprovedBy,
                                                        tranRequest.BankCode,
                                                        tranRequest.Narration,
                                                        tranRequest.TranCategory,
                                                        tranRequest.BranchCode,
                                                        tranRequest.CurrencyCode,
                                                        tranRequest.PaymentType,
                                                        tranRequest.ChequeNumber
                                                      );
            DataSet ds = CbDatabase.ExecuteDataSet(command);

            //get last table returned in result set
            int index = ds.Tables.Count - 1;
            DataTable dt = ds.Tables[index];
            //return the ID from that table as the PegPayID
            return dt.Rows[0][0].ToString();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    public string RepayLoan(LoanRepaymentRequest tranRequest, double InterestAcrued, double repayDateinDays)
    {
        try
        {
            DateTime payDate = DateTime.ParseExact(tranRequest.PaymentDate, "dd/MM/yyyy", CultureInfo.InvariantCulture);


            command = CbDatabase.GetStoredProcCommand("RepayLoan",
                                                        tranRequest.CustomerName,
                                                        tranRequest.SourceAccountNumber,
                                                        tranRequest.LoanAccountNumber,
                                                        tranRequest.BanksCommissionAccountNumber,
                                                        tranRequest.RepaymentAmount,
                                                        InterestAcrued,
                                                        tranRequest.BankTranId,
                                                        payDate,
                                                        tranRequest.Teller,
                                                        tranRequest.ApprovedBy,
                                                        tranRequest.BankCode,
                                                        tranRequest.Narration,
                                                        tranRequest.TranCategory,
                                                        tranRequest.BranchCode,
                                                        tranRequest.CurrencyCode,
                                                        tranRequest.PaymentType,
                                                        tranRequest.ChequeNumber,
                                                        repayDateinDays
                                                      );
            DataSet ds = CbDatabase.ExecuteDataSet(command);

            //get last table returned in result set
            int index = ds.Tables.Count - 1;
            DataTable dt = ds.Tables[index];
            //return the ID from that table as the PegPayID
            return dt.Rows[0][0].ToString();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    internal string SaveCustomizedBankCharge(CustomizedBankCharge charge)
    {
        try
        {
            command = CbDatabase.GetStoredProcCommand("SaveCustomizedBankCharge",
                                                       charge.BankCode,
                                                       charge.ChargeCode,
                                                       charge.MinimumAmount,
                                                       charge.MaximumAmount,
                                                       charge.ChargeAmount,
                                                       charge.ChargeType,
                                                       charge.ModifiedBy,
                                                       charge.IsActive,
                                                       charge.ChargeName,
                                                       charge.ChargeDesc
                                                      );
            DataSet ds = CbDatabase.ExecuteDataSet(command);

            //get last table returned in result set
            int index = ds.Tables.Count - 1;
            DataTable dt = ds.Tables[index];
            //return the ID from that table as the PegPayID
            return dt.Rows[0][0].ToString();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    public string PayOutLoan(LoanRequest tranRequest)
    {
        try
        {
            command = CbDatabase.GetStoredProcCommand("PayOutLoan",
                                                       tranRequest.LoanID,
                                                       tranRequest.BankCode,
                                                       tranRequest.ModifiedBy,
                                                       tranRequest.BranchCode
                                                      );
            DataSet ds = CbDatabase.ExecuteDataSet(command);

            //get last table returned in result set
            int index = ds.Tables.Count - 1;
            DataTable dt = ds.Tables[index];
            //return the ID from that table as the PegPayID
            return dt.Rows[0][0].ToString();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    internal string Reverse(string BankId, string BankCode, string Teller, string ApprovedBy,string NewBankId)
    {
        try
        {
            command = CbDatabase.GetStoredProcCommand("ReverseTransaction",
                                                        BankId,
                                                        BankCode,
                                                        Teller,
                                                        ApprovedBy,
                                                        NewBankId
                                                      );
            DataTable datatable = CbDatabase.ExecuteDataSet(command).Tables[0];
            return datatable.Rows[0][0].ToString();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

   

    internal string SaveCharge(BankCharge charge, string BankCode)
    {
        try
        {
            command = CbDatabase.GetStoredProcCommand("Charges_Update",
                                                       charge.BankCode,
                                                       charge.ChargeName,
                                                       charge.ChargeCode,
                                                       charge.ChargeAmount,
                                                       charge.CommissionAccountNumber,
                                                       charge.MinimumValue,
                                                       charge.MaximumValue,
                                                       charge.ChargeType,
                                                       charge.ModifiedBy,
                                                       charge.IsActive,
                                                       charge.SbuPercentage,
                                                       charge.PegasusPercentage,
                                                       charge.TaxPercentage
                                                     );

            DataTable datatable = CbDatabase.ExecuteDataSet(command).Tables[0];
            return datatable.Rows[0][0].ToString();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    internal string SaveMerchantCharges(MerchantCharge merchantCharge)
    {
        try
        {
            command = CbDatabase.GetStoredProcCommand("AttachChargesToMerchants",
                                                      merchantCharge.BankCode,
                                                      merchantCharge.MerchantId,
                                                      merchantCharge.ChargeCode,
                                                      merchantCharge.TranCategory,
                                                      merchantCharge.IsChargePassedOnToCustomer,
                                                      merchantCharge.IsActive,
                                                      merchantCharge.ModifiedBy,
                                                      merchantCharge.PaymentType
                                                     );

            DataTable datatable = CbDatabase.ExecuteDataSet(command).Tables[0];
            return datatable.Rows[0][0].ToString();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    internal string SaveTransactionType(TransactionCategory tranType, string BankCode)
    {
        try
        {
            command = CbDatabase.GetStoredProcCommand("TransactionTypes_Update",
                                                       tranType.Id,
                                                       tranType.TranCategoryCode,
                                                       tranType.Description,
                                                       tranType.BankCode,
                                                       tranType.ModifiedBy,
                                                       tranType.IsActive
                                                      );
            DataTable datatable = CbDatabase.ExecuteDataSet(command).Tables[0];
            return datatable.Rows[0][0].ToString();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }


    internal string SaveUserDetails(BankUser user, string BankCode)
    {
        try
        {
            command = CbDatabase.GetStoredProcCommand("Users_Update",
                                                       user.Id,
                                                       user.Email,
                                                       user.FirstName,
                                                       user.LastName,
                                                       user.OtherName,
                                                       user.Usertype,
                                                       user.Password,
                                                       user.IsActive,
                                                       user.BankCode,
                                                       user.ModifiedBy,
                                                       user.ModifiedBy,
                                                       user.ApprovedBy,
                                                       user.PhoneNumber,
                                                       user.BranchCode,
                                                       user.DateOfBirth,
                                                       user.Gender,
                                                       user.TransactionLimit
                                                      );
            DataTable datatable = CbDatabase.ExecuteDataSet(command).Tables[0];
            return datatable.Rows[0][0].ToString();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    internal string SaveUserTypeDetails(UserType userType, string BankCode)
    {
        try
        {
            command = CbDatabase.GetStoredProcCommand("UserTypes_Update",
                                                       userType.Id,
                                                       userType.UserTypeCode,
                                                       userType.Role,
                                                       userType.Description,
                                                       userType.BankCode,
                                                       userType.ModifiedBy
                                                      );
            DataTable datatable = CbDatabase.ExecuteDataSet(command).Tables[0];
            return datatable.Rows[0][0].ToString();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    internal string SaveAccountTypeDetails(AccountType accountType, string BankCode)
    {
        try
        {
            command = CbDatabase.GetStoredProcCommand("AccountTypes_Update",
                                                       accountType.Id,
                                                       accountType.AccTypeName,
                                                       accountType.AccTypeCode,
                                                       accountType.MinimumBalance,
                                                       accountType.BankCode,
                                                       accountType.Description,
                                                       accountType.ModifiedBy,
                                                       accountType.IsActive,
                                                       accountType.MinNumberOfSignatories,
                                                       accountType.MaxNumberOfSignatories,
                                                       accountType.AccountTypeCategory,
                                                       accountType.InterestRateType,
                                                       accountType.InterestRate,
                                                       accountType.InterestPayOutFreq
                                                      );
            DataTable datatable = CbDatabase.ExecuteDataSet(command).Tables[0];
            return datatable.Rows[0][0].ToString();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }



    internal DataTable GetAccountStatement(string AccountNumber, string BankCode, string StatementType)
    {
        try
        {
            command = CbDatabase.GetStoredProcCommand("GetAccountStatement",
                                                       AccountNumber,
                                                       BankCode,
                                                       StatementType
                                                      );
            DataTable datatable = CbDatabase.ExecuteDataSet(command).Tables[0];
            return datatable;
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    internal BankUser GetUserById(string objectId, string BankCode)
    {
        BankUser user = new BankUser();
        try
        {
            command = CbDatabase.GetStoredProcCommand("GetBankUserById",
                                                       objectId,
                                                       BankCode
                                                      );
            DataTable datatable = CbDatabase.ExecuteDataSet(command).Tables[0];
            if (datatable.Rows.Count > 0)
            {
                DataRow dr = datatable.Rows[0];
                string IsActive = dr["IsActive"].ToString().ToUpper();

                user.FirstName = dr["FirstName"].ToString();
                user.LastName = dr["LastName"].ToString();
                user.OtherName = dr["OtherName"].ToString();
                user.IsActive = IsActive;
                user.Password = dr["Password"].ToString();
                user.Id = dr["UserId"].ToString();
                user.Email = dr["Email"].ToString();
                user.Usertype = dr["Usertype"].ToString();
                user.PhoneNumber = dr["PhoneNumber"].ToString();
                user.BankCode = dr["BankCode"].ToString();
                user.BranchCode = dr["BranchCode"].ToString();
                user.Gender = dr["Gender"].ToString();
                user.DateOfBirth = dr["DateOfBirth"].ToString();
                user.ApprovedBy = dr["ApprovedBy"].ToString();
                user.StatusCode = "0";
                user.StatusDesc = "SUCCESS";

            }
            else
            {
                user.StatusCode = "100";
                user.StatusDesc = "FAILED: USER WITH ID: " + objectId + " NOT FOUND";
            }
        }
        catch (Exception ex)
        {
            user.StatusCode = "100";
            user.StatusDesc = "FAILED: " + ex.Message + "";
        }
        return user;
    }

    internal UserType GetUserTypeById(string objectId, string BankCode)
    {
        UserType user = new UserType();
        try
        {
            command = CbDatabase.GetStoredProcCommand("UserTypes_SelectRow",
                                                       objectId,
                                                       BankCode
                                                      );
            DataTable datatable = CbDatabase.ExecuteDataSet(command).Tables[0];
            if (datatable.Rows.Count > 0)
            {
                DataRow dr = datatable.Rows[0];
                user.Description = dr["Description"].ToString();
                user.Id = dr["UserTypeId"].ToString();
                user.Role = dr["Role"].ToString();
                user.UserTypeCode = dr["UserType"].ToString();
                user.UserTypeName = dr["UserType"].ToString();
                user.BankCode = dr["BankCode"].ToString();
                user.StatusCode = "0";
                user.StatusDesc = "SUCCESS";
            }
            else
            {
                user.StatusCode = "100";
                user.StatusDesc = "FAILED: USERTYPE NOT FOUND";
            }
        }
        catch (Exception ex)
        {
            user.StatusCode = "100";
            user.StatusDesc = "FAILED: " + ex.Message;
        }
        return user;
    }


    internal AccountType GetAccountTypeById(string objectId, string BankCode)
    {
        AccountType type = new AccountType();
        try
        {
            command = CbDatabase.GetStoredProcCommand("AccountTypes_SelectRow",
                                                       objectId,
                                                       BankCode
                                                      );
            DataTable datatable = CbDatabase.ExecuteDataSet(command).Tables[0];
            if (datatable.Rows.Count > 0)
            {
                DataRow dr = datatable.Rows[0];
                type.AccTypeCode = dr["AccTypeCode"].ToString();
                type.AccTypeName = dr["AccTypeName"].ToString();
                type.BankCode = dr["BankCode"].ToString();
                type.Description = dr["Description"].ToString();
                type.Id = dr["AccTypeId"].ToString();
                type.IsActive = dr["IsActive"].ToString();
                type.MinimumBalance = dr["MinimumBal"].ToString();
                type.ModifiedBy = dr["ModifiedBy"].ToString();
                type.MinNumberOfSignatories = ConvertToInt(dr["MinNumberOfSignatories"].ToString());
                type.MaxNumberOfSignatories = ConvertToInt(dr["MaxNumberOfSignatories"].ToString());
                type.AccountTypeCategory = dr["AccountCategory"].ToString();
                type.InterestRateType = dr["InterestRateType"].ToString();
                type.InterestRate = dr["InterestRate"].ToString();
                type.InterestPayOutFreq = dr["InterestPayOutFrequency"].ToString();
                type.StatusCode = "0";
                type.StatusDesc = "SUCCESS";
            }
            else
            {
                type.StatusCode = "100";
                type.StatusDesc = "FAILED: USERTYPE NOT FOUND";
            }
        }
        catch (Exception ex)
        {
            type.StatusCode = "100";
            type.StatusDesc = "FAILED: " + ex.Message;
        }
        return type;
    }

    public int ConvertToInt(string aString)
    {
        int result = 0;
        try
        {
            result = Convert.ToInt32(aString);
            return result;
        }
        catch (Exception)
        {
            result = 0;
            return result;
        }
    }



    internal BankAccount GetBankAccountById(string objectId, string BankCode)
    {
        BankAccount account = new BankAccount();
        try
        {
            command = CbDatabase.GetStoredProcCommand("Accounts_SelectRow3",
                                                       objectId,
                                                       BankCode
                                                      );
            DataTable datatable = CbDatabase.ExecuteDataSet(command).Tables[0];
            if (datatable.Rows.Count > 0)
            {
                DataRow dr = datatable.Rows[0];
                string IsActive = dr["IsActive"].ToString();
                account.AccountBalance = dr["AccBalance"].ToString();
                account.AccountId = dr["AccountId"].ToString();
                account.BankCode = dr["BankCode"].ToString();
                account.AccountNumber = dr["AccNumber"].ToString();
                account.AccountType = dr["AccType"].ToString();
                account.IsActive = dr["IsActive"].ToString();
                account.BranchCode = dr["BranchCode"].ToString();
                account.ModifiedBy = dr["ModifiedBy"].ToString();
                account.CurrencyCode = dr["CurrencyCode"].ToString();
                account.ApprovedBy = dr["ApprovedBy"].ToString();
                account.AccountName = dr["AccountName"].ToString();
                account.MinimumBalance = dr["MinimumBalance"].ToString();
                account.InterestRate = dr["InterestRate"].ToString();
                account.InterestType = dr["InterestType"].ToString();      
                account.StatusCode = "0";
                account.StatusDesc = "SUCCESS";

            }
            else
            {
                account.StatusCode = "100";
                account.StatusDesc = "FAILED: ACCOUNT WITH ACCOUNT_NUMBER:" + objectId + " NOT FOUND UNDER BANK: " + BankCode;
            }
        }
        catch (Exception ex)
        {
            account.StatusCode = "100";
            account.StatusDesc = "FAILED: " + ex.Message;
        }
        return account;
    }

    internal BankAccount GetBankAccountById2(string objectId, string BankCode)
    {
        BankAccount account = new BankAccount();
        try
        {
            command = CbDatabase.GetStoredProcCommand("Accounts_SelectRow2",
                                                       objectId,
                                                       BankCode
                                                      );
            DataTable datatable = CbDatabase.ExecuteDataSet(command).Tables[0];
            if (datatable.Rows.Count > 0)
            {
                DataRow dr = datatable.Rows[0];
                string IsActive = dr["IsActive"].ToString();

                account.AccountBalance = dr["AccBalance"].ToString();
                account.AccountId = dr["AccountId"].ToString();
                account.BankCode = dr["BankCode"].ToString();
                account.AccountNumber = dr["AccNumber"].ToString();
                account.AccountType = dr["AccType"].ToString();
                account.IsActive = dr["IsActive"].ToString();
                account.BranchCode = dr["BranchCode"].ToString();
                account.ModifiedBy = dr["ModifiedBy"].ToString();
                account.CurrencyCode = dr["CurrencyCode"].ToString();
                account.ApprovedBy = dr["ApprovedBy"].ToString();
                account.AccountName = dr["AccountName"].ToString();
                account.MinimumBalance = dr["MinimumBalance"].ToString();
                account.InterestRate = dr["InterestRate"].ToString();
                account.InterestType = dr["InterestType"].ToString();
                account.StatusCode = "0";
                account.StatusDesc = "SUCCESS";

            }
            else
            {
                account.StatusCode = "100";
                account.StatusDesc = "FAILED: ACCOUNT WITH ACCOUNT_NUMBER:" + objectId + " NOT FOUND UNDER BANK: " + BankCode;
            }
        }
        catch (Exception ex)
        {
            account.StatusCode = "100";
            account.StatusDesc = "FAILED: " + ex.Message;
        }
        return account;
    }


    internal BankCommissionAccount GetBankCommissionAccountById(string objectId, string BankCode)
    {
        BankCommissionAccount account = new BankCommissionAccount();
        try
        {
            command = CbDatabase.GetStoredProcCommand("CommissionAccounts_SelectRow",
                                                       objectId,
                                                       BankCode
                                                      );
            DataTable datatable = CbDatabase.ExecuteDataSet(command).Tables[0];
            if (datatable.Rows.Count > 0)
            {
                DataRow dr = datatable.Rows[0];
                //string IsActive = dr["IsActive"].ToString();

                //account.AccountBalance = dr["AccBalance"].ToString();
                //account.AccountId = dr["AccountId"].ToString();
                //account.BankCode = dr["BankCode"].ToString();
                //account.AccountNumber = dr["AccNumber"].ToString();
                //account.AccountType = dr["AccType"].ToString();
                //account.IsActive = dr["IsActive"].ToString();
                //account.BranchCode = dr["BranchCode"].ToString();
                //account.ModifiedBy = dr["ModifiedBy"].ToString();
                //account.CurrencyCode = dr["CurrencyCode"].ToString();
                //account.ApprovedBy = dr["ApprovedBy"].ToString();
                account.CommissionAccountCode = dr["CommissionAccountCode"].ToString();
                account.CommissionAccountName = dr["CommissionAccountName"].ToString();
                account.AccountNumber = dr["CommissionAccountNumber"].ToString();
                account.StatusCode = "0";
                account.StatusDesc = "SUCCESS";

            }
            else
            {
                account.StatusCode = "100";
                account.StatusDesc = "FAILED: ACCOUNT WITH ACCOUNT_NUMBER:" + objectId + " NOT FOUND UNDER BANK: " + BankCode;
            }
        }
        catch (Exception ex)
        {
            account.StatusCode = "100";
            account.StatusDesc = "FAILED: " + ex.Message;
        }
        return account;
    }

    internal BankUser[] GetAllUsers(string bankCode)
    {
        List<BankUser> allUsers = new List<BankUser>();
        try
        {
            command = CbDatabase.GetStoredProcCommand("Users_SelectAll",
                                                       bankCode
                                                      );
            DataTable datatable = CbDatabase.ExecuteDataSet(command).Tables[0];
            if (datatable.Rows.Count > 0)
            {
                foreach (DataRow dr in datatable.Rows)
                {
                    BankUser user = new BankUser();
                    user.FirstName = dr["FirstName"].ToString();
                    user.LastName = dr["LastName"].ToString();
                    user.OtherName = dr["OtherName"].ToString();
                    user.IsActive = dr["IsActive"].ToString();
                    user.Password = dr["Password"].ToString();
                    user.Id = dr["UserId"].ToString();
                    user.Email = dr["Email"].ToString();
                    user.Usertype = dr["Usertype"].ToString();
                    user.StatusCode = "0";
                    user.StatusDesc = "SUCCESS";
                    allUsers.Add(user);
                }
            }
            else
            {
                BankUser user = new BankUser();
                user.StatusCode = "100";
                user.StatusDesc = "FAILED: NO USER FOUND";
                allUsers.Add(user);
            }
        }
        catch (Exception ex)
        {
            BankUser user = new BankUser();
            user.StatusCode = "100";
            user.StatusDesc = "FAILED: " + ex.Message;
            allUsers.Add(user);
        }
        return allUsers.ToArray();
    }

    internal UserType[] GetAllUserTypes(string bankCode)
    {
        List<UserType> all = new List<UserType>();
        try
        {
            command = CbDatabase.GetStoredProcCommand("UserTypes_SelectAll",
                                                       bankCode
                                                      );
            DataTable datatable = CbDatabase.ExecuteDataSet(command).Tables[0];
            if (datatable.Rows.Count > 0)
            {
                foreach (DataRow dr in datatable.Rows)
                {
                    UserType user = new UserType();
                    user.Description = dr["Description"].ToString();
                    user.Id = dr["UserTypeId"].ToString();
                    user.Role = dr["Role"].ToString();
                    user.UserTypeCode = dr["UserType"].ToString();
                    user.BankCode = dr["BankCode"].ToString();
                    user.StatusCode = "0";
                    user.StatusDesc = "SUCCESS";
                    all.Add(user);
                }
            }
            else
            {
                UserType user = new UserType();
                user.StatusCode = "100";
                user.StatusDesc = "FAILED: NO USERTYPE FOUND";
                all.Add(user);
            }
        }
        catch (Exception ex)
        {
            UserType user = new UserType();
            user.StatusCode = "100";
            user.StatusDesc = "FAILED: " + ex.Message;
            all.Add(user);
        }
        return all.ToArray();
    }

    internal TransactionCategory[] GetAllTransactionTypes(string bankCode)
    {
        List<TransactionCategory> all = new List<TransactionCategory>();
        try
        {
            command = CbDatabase.GetStoredProcCommand("TransactionTypes_SelectAll",
                                                       bankCode
                                                      );
            DataTable datatable = CbDatabase.ExecuteDataSet(command).Tables[0];
            if (datatable.Rows.Count > 0)
            {
                foreach (DataRow dr in datatable.Rows)
                {
                    TransactionCategory tranType = new TransactionCategory();
                    tranType.BankCode = dr["BankCode"].ToString();
                    tranType.Description = dr["Description"].ToString();
                    tranType.Id = dr["TranTypeId"].ToString();
                    tranType.ModifiedBy = dr["ModifiedBy"].ToString();
                    tranType.TranCategoryCode = dr["TranType"].ToString();
                    tranType.StatusCode = "0";
                    tranType.StatusDesc = "SUCCESS";
                    all.Add(tranType);
                }
            }
            else
            {
                TransactionCategory tranType = new TransactionCategory();
                tranType.StatusCode = "100";
                tranType.StatusDesc = "FAILED: NO USERTYPE FOUND";
                all.Add(tranType);
            }
        }
        catch (Exception ex)
        {
            TransactionCategory user = new TransactionCategory();
            user.StatusCode = "100";
            user.StatusDesc = "FAILED: " + ex.Message;
            all.Add(user);
        }
        return all.ToArray();
    }




    internal DataSet ExecuteDataSet(string storedProcedureName, string[] Parameters)
    {
        try
        {
            command = CbDatabase.GetStoredProcCommand(storedProcedureName,
                                                       Parameters
                                                      );
            DataSet ds = CbDatabase.ExecuteDataSet(command);
            return ds;
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    internal Result ExecuteNonQuery(string storedProcedureName, string[] Parameters)
    {
        Result result = new Result();
        try
        {
            command = CbDatabase.GetStoredProcCommand(storedProcedureName,
                                                       Parameters
                                                      );
            int rows = CbDatabase.ExecuteNonQuery(command);
            result.PegPayId = "" + rows;
            result.RequestId = "";
            result.StatusCode = "0";
            result.StatusDesc = "SUCCESS";
        }
        catch (Exception ex)
        {
            throw ex;
        }
        return result;
    }

    internal DataTable GetDataTable(string procedures, object[] data)
    {
        DataTable table = new DataTable();
        try
        {
            command = CbDatabase.GetStoredProcCommand(procedures, data);
            table = CbDatabase.ExecuteDataSet(command).Tables[0];
        }
        catch (Exception ex)
        {
            throw ex;
        }

        return table;
    }

    internal DataSet GetDataSet(string procedures, object[] data)
    {
        DataSet dataset = new DataSet();

        try
        {
            command = CbDatabase.GetStoredProcCommand(procedures, data);
            dataset = CbDatabase.ExecuteDataSet(command);
        }
        catch (Exception ex)
        {
            throw ex;
        }
        return dataset;
    }

    internal bool ExecuteNonQuery(string procedures, object[] data)
    {
        int inserted = -1;
        bool executed = false;

        try
        {
            command = CbDatabase.GetStoredProcCommand(procedures, data);
            inserted = CbDatabase.ExecuteNonQuery(command);
            if (inserted > 0)
                executed = true;
        }
        catch (Exception ex)
        {
            throw ex;
        }
        return executed;
    }

    internal DataTable GetVendorDetails(string api)
    {
        try
        {
            string[] parameters = { api };
            command = CbDatabase.GetStoredProcCommand("GetCredentials", parameters);
            DataTable dt = CbDatabase.ExecuteDataSet(command).Tables[0];
            return dt;
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    internal List<string> GetAccountsByUserId(string userId)
    {
        List<string> all = new List<string>();
        try
        {
            command = CbDatabase.GetStoredProcCommand("GetAccountsByUserId",
                                                      userId
                                                     );
            DataTable dt = CbDatabase.ExecuteDataSet(command).Tables[0];

            if (dt.Rows.Count == 0)
            {
                all.Add("");
            }
            foreach (DataRow dr in dt.Rows)
            {
                string accNo = dr["AccNumber"].ToString();
                all.Add(accNo);
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
        return all;
    }

    internal Bank[] GetAllBanks()
    {
        List<Bank> all = new List<Bank>();
        try
        {
            command = CbDatabase.GetStoredProcCommand("Banks_SelectAll"
                                                      );
            DataTable datatable = CbDatabase.ExecuteDataSet(command).Tables[0];
            if (datatable.Rows.Count > 0)
            {
                foreach (DataRow dr in datatable.Rows)
                {
                    Bank bank = new Bank();
                    bank.BankCode = dr["BankCode"].ToString();
                    bank.BankContactEmail = dr["BankContactEmail"].ToString();
                    bank.BankId = dr["BankId"].ToString();
                    bank.BankName = dr["BankName"].ToString();
                    bank.BankPassword = dr["BankPassword"].ToString();
                    bank.IsActive = dr["IsActive"].ToString();
                    bank.ModifiedBy = dr["ModifiedBy"].ToString();
                    bank.PathToLogoImage = dr["PathToLogoImage"].ToString();
                    bank.PathToPublicKey = dr["PathToPublicKey"].ToString();
                    bank.StatusCode = "0";
                    bank.StatusDesc = "SUCCESS";
                    all.Add(bank);
                }
            }
            else
            {
                Bank bank = new Bank();
                bank.StatusCode = "100";
                bank.StatusDesc = "FAILED: NO BANKS FOUND";
                all.Add(bank);
            }
        }
        catch (Exception ex)
        {
            Bank bank = new Bank();
            bank.StatusCode = "100";
            bank.StatusDesc = "FAILED: " + ex.Message;
            all.Add(bank);
        }
        return all.ToArray();
    }

    internal BankBranch[] GetAllBankBranches(string bankCode)
    {
        List<BankBranch> all = new List<BankBranch>();
        try
        {
            command = CbDatabase.GetStoredProcCommand("BankBranches_SelectAll"
                                                      );
            DataTable datatable = CbDatabase.ExecuteDataSet(command).Tables[0];
            if (datatable.Rows.Count > 0)
            {
                foreach (DataRow dr in datatable.Rows)
                {
                    BankBranch branch = new BankBranch();
                    branch.BankCode = dr["BankCode"].ToString();
                    branch.BankBranchId = dr["BranchId"].ToString();
                    branch.BranchCode = dr["BranchCode"].ToString();
                    branch.IsActive = dr["BranchManagerId"].ToString();
                    branch.BranchName = dr["BranchName"].ToString();
                    branch.Location = dr["Location"].ToString();
                    branch.ModifiedBy = dr["ModifiedBy"].ToString();
                    branch.StatusCode = "0";
                    branch.StatusDesc = "SUCCESS";
                    all.Add(branch);
                }
            }
            else
            {
                BankBranch branch = new BankBranch();
                branch.StatusCode = "100";
                branch.StatusDesc = "FAILED: NO BRANCHES FOUND";
                all.Add(branch);
            }
        }
        catch (Exception ex)
        {
            BankBranch branch = new BankBranch();
            branch.StatusCode = "100";
            branch.StatusDesc = "FAILED: " + ex.Message;
            all.Add(branch);
        }
        return all.ToArray();
    }

    internal Bank GetBankById(string objectId)
    {
        Bank bank = new Bank();
        try
        {
            command = CbDatabase.GetStoredProcCommand("Banks_SelectRow",
                                                       objectId
                                                      );
            DataTable datatable = CbDatabase.ExecuteDataSet(command).Tables[0];
            if (datatable.Rows.Count > 0)
            {
                DataRow dr = datatable.Rows[0];
                bank.BankCode = dr["BankCode"].ToString();
                bank.BankContactEmail = dr["BankContactEmail"].ToString();
                bank.BankId = dr["BankId"].ToString();
                bank.BankName = dr["BankName"].ToString();
                bank.BankPassword = dr["BankPassword"].ToString();
                bank.IsActive = dr["IsActive"].ToString();
                bank.ModifiedBy = dr["ModifiedBy"].ToString();
                bank.PathToLogoImage = dr["PathToLogoImage"].ToString();
                bank.PathToPublicKey = dr["PathToPublicKey"].ToString();
                bank.BankThemeColor = dr["ThemeColor"].ToString();
                bank.TextColor = dr["NavbarTextColor"].ToString();
                bank.BankVaultAccNumber = dr["BankVaultAccNumber"].ToString();
                bank.BankLoanCommissionAccount = dr["BankLoanCommissionAccount"].ToString();
                bank.BankInterestPayableAccount = dr["BankInterestPayableAccount"].ToString();
                bank.StatusCode = "0";
                bank.StatusDesc = "SUCCESS";
            }
            else
            {
                bank.StatusCode = "100";
                bank.StatusDesc = "FAILED: BANK  [" + objectId + "] NOT FOUND";
            }
        }
        catch (Exception ex)
        {
            bank.StatusCode = "100";
            bank.StatusDesc = "FAILED: " + ex.Message;
        }
        return bank;
    }

    internal TransactionCategory GetTransactionCategoryById(string objectId, string bankCode)
    {
        TransactionCategory category = new TransactionCategory();
        try
        {
            command = CbDatabase.GetStoredProcCommand("TransactionTypes_SelectRow",
                                                       objectId
                                                      );
            DataTable datatable = CbDatabase.ExecuteDataSet(command).Tables[0];
            if (datatable.Rows.Count > 0)
            {
                DataRow dr = datatable.Rows[0];
                string IsActive = dr["IsActive"].ToString().ToUpper();

                category.ApprovedBy = "";
                category.BankCode = dr["BankCode"].ToString();
                category.Description = dr["Description"].ToString();
                category.Id = dr["TranTypeId"].ToString();
                category.IsActive = dr["IsActive"].ToString();
                category.ModifiedBy = dr["ModifiedBy"].ToString();
                category.TranCategoryCode = dr["TranType"].ToString();
                category.TranCategoryName = dr["TranType"].ToString();
                category.StatusCode = "0";
                category.StatusDesc = "SUCCESS";

            }
            else
            {
                category.StatusCode = "100";
                category.StatusDesc = "FAILED: TRANSACTION CATEGORY:" + objectId + " NOT FOUND UNDER BANK:" + bankCode;
            }
        }
        catch (Exception ex)
        {
            category.StatusCode = "100";
            category.StatusDesc = "FAILED: " + ex.Message;
        }
        return category;
    }

    internal AccessRule GetAccessRuleById(string objectId, string bankCode)
    {
        AccessRule rule = new AccessRule();
        try
        {
            command = CbDatabase.GetStoredProcCommand("AccessRules_SelectRow",
                                                       objectId,
                                                       bankCode
                                                      );
            DataTable datatable = CbDatabase.ExecuteDataSet(command).Tables[0];
            if (datatable.Rows.Count > 0)
            {
                DataRow dr = datatable.Rows[0];
                rule.BranchCode = dr["BranchCode"].ToString();
                rule.BankCode = dr["BankCode"].ToString();
                rule.CanAccess = dr["CanAccess"].ToString();
                rule.Id = dr["RecordId"].ToString();
                rule.IsActive = dr["IsActive"].ToString();
                rule.ModifiedBy = dr["ModifiedBy"].ToString();
                rule.UserId = dr["UserId"].ToString();
                rule.UserType = dr["UserType"].ToString();
                rule.StatusCode = "0";
                rule.StatusDesc = "SUCCESS";
            }
            else
            {
                rule.StatusCode = "100";
                rule.StatusDesc = "FAILED: BANK NOT FOUND";
            }
        }
        catch (Exception ex)
        {
            rule.StatusCode = "100";
            rule.StatusDesc = "FAILED: " + ex.Message;
        }
        return rule;
    }

    internal string SaveAccessRule(AccessRule rule, string BankCode)
    {
        try
        {
            DateTime ModifyDate = DateTime.Now;
            //string ModifyDate = CreateDate;
            command = CbDatabase.GetStoredProcCommand("AccessRules_Update",
                                                       rule.Id,
                                                       rule.RuleName,
                                                       rule.UserType,
                                                       rule.BankCode,
                                                       rule.CanAccess,
                                                       rule.UserId,
                                                       rule.BranchCode,
                                                       rule.IsActive,
                                                       ModifyDate,
                                                       rule.ModifiedBy
                                                        );
            DataTable datatable = CbDatabase.ExecuteDataSet(command).Tables[0];
            return datatable.Rows[0][0].ToString();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    internal string SaveTransactionRule(TransactionRule rule, string BankCode)
    {
        try
        {
            string CreateDate = DateTime.Now.ToString("yyyy-MM-dd");
            string ModifyDate = CreateDate;
            command = CbDatabase.GetStoredProcCommand("TransactionRules_Update",
                                                      rule.Id,
                                                      rule.RuleName,
                                                      rule.RuleCode,
                                                      rule.RuleCode,
                                                      rule.RuleName,
                                                      rule.UserId,
                                                      rule.Description,
                                                      rule.MinimumAmount,
                                                      rule.MaximumAmount,
                                                      rule.IsActive,
                                                      rule.BankCode,
                                                      rule.BranchCode,
                                                      rule.ModifiedBy,
                                                      rule.Approver
                                                     );
            DataTable datatable = CbDatabase.ExecuteDataSet(command).Tables[1];
            return datatable.Rows[0][0].ToString();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    internal DataTable GetTransactionByBankId(string bankRef, string bankCode)
    {
        try
        {
            command = CbDatabase.GetStoredProcCommand("GetTransactionByBankId",
                                                       bankRef,
                                                       bankCode
                                                      );
            DataTable datatable = CbDatabase.ExecuteDataSet(command).Tables[0];
            return datatable;
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }


    internal DataTable CheckForReversedTransaction(string chequeNumber, string bankCode)
    {
        try
        {
            command = CbDatabase.GetStoredProcCommand("CheckForReversedTransaction",
                                                       chequeNumber,
                                                       bankCode
                                                      );
            DataTable datatable = CbDatabase.ExecuteDataSet(command).Tables[0];
            return datatable;
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    internal string SaveChargeType(ChargeType chargeType, string BankCode)
    {
        try
        {
            command = CbDatabase.GetStoredProcCommand("ChargeTypes_Update",
                                                        chargeType.ChargeTypeCode,
                                                        chargeType.ChargeTypeName,
                                                        chargeType.ModifiedBy,
                                                        chargeType.BankCode,
                                                        chargeType.Description,
                                                        chargeType.IsActive
                                                      );
            DataTable datatable = CbDatabase.ExecuteDataSet(command).Tables[0];
            return datatable.Rows[0][0].ToString();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    public SystemSetting GetSystemSettingById(string Id, string bankCode)
    {
        SystemSetting setting = new SystemSetting();
        string[] parameters = { bankCode, Id };
        command = CbDatabase.GetStoredProcCommand("SystemSettings_SelectRow", parameters);
        DataTable dt = CbDatabase.ExecuteDataSet(command).Tables[0];
        if (dt.Rows.Count > 0)
        {
            setting.SettingValue = dt.Rows[0]["SettingValue"].ToString();
            setting.SettingCode = dt.Rows[0]["SettingCode"].ToString();
            setting.ModifiedBy = dt.Rows[0]["ModifiedBy"].ToString();
            setting.BankCode = dt.Rows[0]["BankCode"].ToString();
            setting.StatusCode = "0";
            setting.StatusDesc = "SUCCESS";
        }
        else
        {
            setting.StatusCode = "100";
            setting.StatusDesc = "FAILED: NO SETTING FOUND WITH ID [" + Id + "] UNDER BANK " + bankCode;
        }
        return setting;
    }

    internal string SaveSystemSetting(SystemSetting setting)
    {
        try
        {
            command = CbDatabase.GetStoredProcCommand("SystemSettings_Update",
                                                       setting.BankCode,
                                                       setting.SettingCode,
                                                       setting.SettingValue,
                                                       setting.ModifiedBy
                                                      );
            DataTable datatable = CbDatabase.ExecuteDataSet(command).Tables[0];
            return datatable.Rows[0][0].ToString();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    internal DataTable GetAccountSignatories(string accountNumber, string bankCode)
    {
        try
        {
            command = CbDatabase.GetStoredProcCommand("GetAccountSignatories",
                                                        accountNumber,
                                                        bankCode
                                                      );
            DataTable datatable = CbDatabase.ExecuteDataSet(command).Tables[0];
            return datatable;
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    internal string SaveCurrencyDetails(Currency currency)
    {
        try
        {
            command = CbDatabase.GetStoredProcCommand("Currencies_Update",
                                                        currency.CurrencyName,
                                                        currency.CurrencyCode,
                                                        currency.BankCode,
                                                        currency.ModifiedBy,
                                                        currency.ValueInLocalCurrency
                                                      );
            DataTable datatable = CbDatabase.ExecuteDataSet(command).Tables[0];
            return datatable.Rows[0][0].ToString();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    internal Currency GetCurrencyCodeById(string CurrencyCode, string BankCode)
    {
        Currency currency = new Currency();
        try
        {
            command = CbDatabase.GetStoredProcCommand("Currencies_SelectRow",
                                                        CurrencyCode,
                                                        BankCode
                                                      );
            DataTable datatable = CbDatabase.ExecuteDataSet(command).Tables[0];
            if (datatable.Rows.Count > 0)
            {
                DataRow dr = datatable.Rows[0];
                currency.BankCode = dr["BankCode"].ToString();
                currency.CurrencyCode = dr["CurrencyCode"].ToString();
                currency.CurrencyName = dr["CurrencyName"].ToString();
                currency.ModifiedBy = dr["ModifiedBy"].ToString();
                currency.ValueInLocalCurrency = dr["ValueInLocalCurrency"].ToString();
                currency.StatusCode = "0";
                currency.StatusDesc = "SUCCESS";
            }
            else
            {
                currency.StatusCode = "100";
                currency.StatusDesc = "CURRENCY CODE NOT FOUND";
            }
        }
        catch (Exception ex)
        {
            currency.StatusCode = "100";
            currency.StatusDesc = ex.Message;
        }
        return currency;
    }

    internal string SavePaymentType(PaymentType type)
    {
        try
        {
            command = CbDatabase.GetStoredProcCommand("PaymentTypes_Update",
                                                        type.PaymentTypeCode,
                                                        type.PaymentTypeName,
                                                        type.BankCode,
                                                        type.ModifiedBy,
                                                        type.IsActive
                                                      );
            DataTable datatable = CbDatabase.ExecuteDataSet(command).Tables[0];
            return datatable.Rows[0][0].ToString();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    internal PaymentType GetPaymentTypeById(string Id, string BankCode)
    {
        PaymentType type = new PaymentType();
        try
        {
            command = CbDatabase.GetStoredProcCommand("PaymentTypes_SelectRow",
                                                        Id,
                                                        BankCode
                                                      );
            DataTable datatable = CbDatabase.ExecuteDataSet(command).Tables[0];
            if (datatable.Rows.Count > 0)
            {
                DataRow dr = datatable.Rows[0];
                type.BankCode = dr["BankCode"].ToString();
                type.PaymentTypeCode = dr["PaymentTypeCode"].ToString();
                type.PaymentTypeName = dr["PaymentTypeName"].ToString();
                type.ModifiedBy = dr["ModifiedBy"].ToString();
                type.StatusCode = "0";
                type.StatusDesc = "SUCCESS";
            }
            else
            {
                type.StatusCode = "100";
                type.StatusDesc = "PAYMENT TYPE WITH ID [" + Id + "] NOT FOUND";
            }
        }
        catch (Exception ex)
        {
            type.StatusCode = "100";
            type.StatusDesc = ex.Message;
        }
        return type;
    }

    internal PaymentFrequency GetPaymentFrequencyById(string Id, string BankCode)
    {
        PaymentFrequency type = new PaymentFrequency();
        try
        {
            command = CbDatabase.GetStoredProcCommand("RepaymentFrequencies_SelectRow",
                                                        Id,
                                                        BankCode
                                                      );
            DataTable datatable = CbDatabase.ExecuteDataSet(command).Tables[0];
            if (datatable.Rows.Count > 0)
            {
                DataRow dr = datatable.Rows[0];
                type.BankCode = dr["BankCode"].ToString();
                type.RepaymentFreqCode = dr["RepaymentFreqCode"].ToString();
                type.RepayFreqName = dr["RepaymentFreqName"].ToString();
                type.DurationInDays = dr["DurationInDays"].ToString();
                type.ModifiedBy = dr["ModifiedBy"].ToString();
                type.StatusCode = "0";
                type.StatusDesc = "SUCCESS";
            }
            else
            {
                type.StatusCode = "100";
                type.StatusDesc = "REPAYMENT FREQUENCY WITH ID[" + Id + "] NOT FOUND";
            }
        }
        catch (Exception ex)
        {
            type.StatusCode = "100";
            type.StatusDesc = ex.Message;
        }
        return type;
    }

    internal LoanRequest GetLoanRequestById(string Id, string BankCode)
    {
        LoanRequest request = new LoanRequest();
        try
        {
            command = CbDatabase.GetStoredProcCommand("Loans_SelectRow",
                                                        Id,
                                                        BankCode
                                                      );
            DataTable datatable = CbDatabase.ExecuteDataSet(command).Tables[0];
            if (datatable.Rows.Count > 0)
            {
                DataRow dr = datatable.Rows[0];
                request.BankCode = dr["BankCode"].ToString();
                request.AccountNumber = dr["AccountNumber"].ToString();
                request.ApprovedBy = dr["ApprovedBy"].ToString();
                request.ModifiedBy = dr["ModifiedBy"].ToString();
                request.BranchCode = dr["BranchCode"].ToString();
                request.CustomerContactTel = dr["CustomerTel"].ToString();
                request.CustomerId = dr["CustomerId"].ToString();
                request.InterestRateInPercentage = dr["InterestRate"].ToString();
                request.IsActive = dr["IsActive"].ToString();
                request.LoanAccountNumber = dr["LoanAccountNumber"].ToString();
                request.LoanAmout = dr["LoanAmount"].ToString();
                request.LoanID = dr["LoanID"].ToString();
                request.LoanStatus = dr["Status"].ToString();
                request.LoanType = dr["LoanType"].ToString();
                request.AdditionalComments = dr["Comments"].ToString();
                request.InterestRateInPercentage = dr["InterestRate"].ToString();
                request.GracePeriodInDays = dr["GracePeriodInDays"].ToString();
                request.IsActive = dr["IsActive"].ToString();
                request.LoanApplicationFee = dr["LoanApplicationFee"].ToString();
                request.LoanProcessingFee = dr["LoanProcessingFee"].ToString();
                request.BussinessSector = dr["BussinessSector"].ToString();
                request.BussinessDescription = dr["BussinessDescription"].ToString();
                request.MonthlyInstallmentAmounts = dr["MonthlyInstallmentAmounts"].ToString();
                request.RepaymentFrequency = dr["RepaymentFrequency"].ToString();
                request.NumberOfMissedPayments = dr["NumberOfMissedPayments"].ToString();
                request.InterestRateType = dr["InterestRateType"].ToString();
                request.MapToPlaceOfResidence = dr["MapToPlaceOfResidency"].ToString();
                request.Approver = dr["Approver"].ToString();
                request.LoanAccountTitle = dr["LoanAccountTitle"].ToString();
                request.StatusCode = "0";
                request.StatusDesc = "SUCCESS";
            }
            else
            {
                request.StatusCode = "100";
                request.StatusDesc = "LOAN REQUEST NOT FOUND";
            }
        }
        catch (Exception ex)
        {
            request.StatusCode = "100";
            request.StatusDesc = ex.Message;
        }
        return request;
    }

    internal LoanType GetLoanTypeById(string Id, string BankCode)
    {
        LoanType type = new LoanType();
        try
        {
            command = CbDatabase.GetStoredProcCommand("LoanTypes_SelectRow",
                                                        Id,
                                                        BankCode
                                                      );
            DataTable datatable = CbDatabase.ExecuteDataSet(command).Tables[0];
            if (datatable.Rows.Count > 0)
            {
                DataRow dr = datatable.Rows[0];
                type.BankCode = dr["BankCode"].ToString();
                type.LoanTypeCode = dr["LoanTypeCode"].ToString();
                type.LoanTypeName = dr["LoanTypeName"].ToString();
                type.ModifiedBy = dr["ModifiedBy"].ToString();
                type.InterestRateAsPercentage = dr["InterestRateAsPercentage"].ToString();
                type.InterestRateType = dr["InterestRateType"].ToString();
                type.RequiresCollateral = dr["RequiresCollateral"].ToString();
                type.GracePeriodInDays = dr["GracePeriodInDays"].ToString();
                type.LoanApplicationFee = dr["LoanApplicationFee"].ToString();
                type.LoanProcessingFee = dr["LoanProcessingFee"].ToString();
                type.StatusCode = "0";
                type.StatusDesc = "SUCCESS";
            }
            else
            {
                type.StatusCode = "100";
                type.StatusDesc = "LOAN TYPE NOT FOUND";
            }
        }
        catch (Exception ex)
        {
            type.StatusCode = "100";
            type.StatusDesc = ex.Message;
        }
        return type;
    }


    internal string InsertIntoAuditLog(AuditLog log)
    {
        try
        {
            command = CbDatabase.GetStoredProcCommand("InsertIntoAuditTrail",
                                                       log.ActionType,
                                                       log.TableName,
                                                       log.BankCode,
                                                       log.ModifiedBy,
                                                       log.Action
                                                      );
            DataTable datatable = CbDatabase.ExecuteDataSet(command).Tables[0];
            return datatable.Rows[0][0].ToString();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    internal BankCharge GetBankChargeById(string objectId, string BankCode)
    {
        BankCharge charge = new BankCharge();
        try
        {
            command = CbDatabase.GetStoredProcCommand("Charges_SelectRow",
                                                       objectId,
                                                       BankCode
                                                      );
            DataTable datatable = CbDatabase.ExecuteDataSet(command).Tables[0];
            if (datatable.Rows.Count > 0)
            {
                DataRow dr = datatable.Rows[0];
                string IsActive = dr["IsActive"].ToString();
                
                charge.BankCode = dr["BankCode"].ToString();
                charge.BankCode = dr["BankCode"].ToString();
                charge.ChargeAmount = dr["ChargeAmount"].ToString();
                charge.ChargeCode = dr["ChargeCode"].ToString();
                charge.IsActive = dr["IsActive"].ToString();
                charge.ModifiedBy = dr["ModifiedBy"].ToString();
                charge.ChargeName = dr["ChargeName"].ToString();
                charge.ChargeType = dr["ChargeType"].ToString();
                //charge.CommissionAccountNumber = dr["CommissionAccount"].ToString();
                charge.MinimumValue = dr["MinimumValue"].ToString();
                charge.MaximumValue=dr["MaximumValue"].ToString();
                charge.StatusCode = "0";
                charge.StatusDesc = "SUCCESS";

            }
            else
            {
                charge.StatusCode = "100";
                charge.StatusDesc = "FAILED: CHARGE WITH CHARGE CODE:" + objectId + " NOT FOUND UNDER BANK: " + BankCode;
            }
        }
        catch (Exception ex)
        {
            charge.StatusCode = "100";
            charge.StatusDesc = "FAILED: " + ex.Message;
        }
        return charge;
    }

    internal ChargeType GetChargeTypeById(string objectId, string BankCode)
    {
        ChargeType type = new ChargeType();
        try
        {
            command = CbDatabase.GetStoredProcCommand("ChargeTypes_SelectRow",
                                                       objectId,
                                                       BankCode
                                                      );
            DataTable datatable = CbDatabase.ExecuteDataSet(command).Tables[0];
            if (datatable.Rows.Count > 0)
            {
                DataRow dr = datatable.Rows[0];
                string IsActive = dr["IsActive"].ToString();

                type.BankCode = dr["BankCode"].ToString();
                type.ChargeTypeCode = dr["ChargeTypeCode"].ToString();
                type.ChargeTypeName = dr["ChargeTypeName"].ToString();
                type.IsActive = dr["IsActive"].ToString();
                type.Description = dr["Description"].ToString();
                type.ModifiedBy = dr["ModifiedBy"].ToString();

                type.StatusCode = "0";
                type.StatusDesc = "SUCCESS";

            }
            else
            {
                type.StatusCode = "100";
                type.StatusDesc = "FAILED: CHARGE TYPE WITH CODE:" + objectId + " NOT FOUND UNDER BANK: " + BankCode;
            }
        }
        catch (Exception ex)
        {
            type.StatusCode = "100";
            type.StatusDesc = "FAILED: " + ex.Message;
        }
        return type;
    }

    internal BankBranch GetBankBranchById(string objectId, string BankCode)
    {
        BankBranch branch = new BankBranch();
        try
        {
            command = CbDatabase.GetStoredProcCommand("BankBranches_SelectRow",
                                                       objectId,
                                                       BankCode
                                                      );
            DataTable datatable = CbDatabase.ExecuteDataSet(command).Tables[0];
            if (datatable.Rows.Count > 0)
            {
                DataRow dr = datatable.Rows[0];
                string IsActive = dr["IsActive"].ToString();

                branch.BankCode = dr["BankCode"].ToString();
                branch.BankBranchId = dr["BranchId"].ToString();
                branch.BranchCode = dr["BranchCode"].ToString();
                branch.IsActive = dr["IsActive"].ToString();
                branch.BranchName = dr["BranchName"].ToString();
                branch.ModifiedBy = dr["ModifiedBy"].ToString();
                branch.Location = dr["Location"].ToString();
                branch.BranchVaultAccNumber = dr["BranchVaultAccNumber"].ToString();
                branch.BranchTellerLimit = dr["BranchTellerLimit"].ToString();
                branch.BranchSupervisorLimit = dr["BranchSupervisorLimit"].ToString();
                branch.StatusCode = "0";
                branch.StatusDesc = "SUCCESS";

            }
            else
            {
                branch.StatusCode = "100";
                branch.StatusDesc = "FAILED: BANK BRANCH WITH CODE:" + objectId + " NOT FOUND UNDER BANK: " + BankCode;
            }
        }
        catch (Exception ex)
        {
            branch.StatusCode = "100";
            branch.StatusDesc = "FAILED: " + ex.Message;
        }
        return branch;
    }

    internal TransactionRule GetTransactionRuleById(string objectId, string BankCode)
    {
        TransactionRule rule = new TransactionRule();
        try
        {
            command = CbDatabase.GetStoredProcCommand("TransactionRules_SelectRow",
                                                       objectId,
                                                       BankCode
                                                      );
            DataTable datatable = CbDatabase.ExecuteDataSet(command).Tables[0];
            if (datatable.Rows.Count > 0)
            {
                DataRow dr = datatable.Rows[0];
                string IsActive = dr["IsActive"].ToString();

                rule.BankCode = dr["BankCode"].ToString();
                rule.Approver = dr["Approver"].ToString();
                rule.BranchCode = dr["BranchCode"].ToString();
                rule.IsActive = dr["IsActive"].ToString();
                rule.Description = dr["Description"].ToString();
                rule.MaximumAmount = dr["MaximumAmount"].ToString();
                rule.MinimumAmount = dr["MinimumAmount"].ToString();
                rule.RuleCode = dr["RuleCode"].ToString();
                rule.RuleName = dr["RuleName"].ToString();
                rule.UserId = dr["UserId"].ToString();
                rule.ModifiedBy = dr["ModifiedBy"].ToString();

                rule.StatusCode = "0";
                rule.StatusDesc = "SUCCESS";

            }
            else
            {
                rule.StatusCode = "100";
                rule.StatusDesc = "FAILED: TRANSACTION RULE WITH CODE:" + objectId + " NOT FOUND UNDER BANK: " + BankCode;
            }
        }
        catch (Exception ex)
        {
            rule.StatusCode = "100";
            rule.StatusDesc = "FAILED: " + ex.Message;
        }
        return rule;
    }


    public void LogError(string Id, string BankCode, string msg)
    {
        try
        {
            command = CbDatabase.GetStoredProcCommand("InsertIntoErrorLogs",
                                                      Id,
                                                      BankCode,
                                                      msg
                                                     );
            CbDatabase.ExecuteNonQuery(command);
        }
        catch (Exception)
        {
            //do nothing since at this stage we are just logging an error
        }
    }

    internal BankCustomer GetCustomerById(string objectId, string BankCode)
    {
        BankCustomer user = new BankCustomer();
        try
        {
            command = CbDatabase.GetStoredProcCommand("Customers_SelectRow",
                                                       objectId
                                                      );
            DataTable datatable = CbDatabase.ExecuteDataSet(command).Tables[0];
            if (datatable.Rows.Count > 0)
            {
                DataRow dr = datatable.Rows[0];
                string IsActive = dr["IsActive"].ToString().ToUpper();
                user.FirstName = dr["FirstName"].ToString();
                user.LastName = dr["LastName"].ToString();
                user.OtherName = dr["OtherName"].ToString();
                user.IsActive = IsActive;
                user.Password = dr["Password"].ToString();
                user.Id = dr["CustomerId"].ToString();
                user.Email = dr["Email"].ToString();
                user.PhoneNumber = dr["PhoneNumber"].ToString();
                user.BankCode = dr["BankCode"].ToString();
                user.BranchCode = dr["BranchCode"].ToString();
                user.Gender = dr["Gender"].ToString();
                user.DateOfBirth = dr["DateOfBirth"].ToString();
                user.ApprovedBy = dr["ApprovedBy"].ToString();
                user.StatusCode = "0";
                user.StatusDesc = "SUCCESS";

            }
            else
            {
                user.StatusCode = "100";
                user.StatusDesc = "FAILED: CUSTOMER WITH ID: " + objectId + " NOT FOUND";
            }
        }
        catch (Exception ex)
        {
            user.StatusCode = "100";
            user.StatusDesc = "FAILED: " + ex.Message + "";
        }
        return user;
    }

    internal BankCustomer GetCustomerAccount(string objectId, string BankCode)
    {
        BankCustomer user = new BankCustomer();
        try
        {
            command = CbDatabase.GetStoredProcCommand("GetCustomerByCustomerId",
                                                       objectId
                                                      );
            DataTable datatable = CbDatabase.ExecuteDataSet(command).Tables[0];
            if (datatable.Rows.Count > 0)
            {
                DataRow dr = datatable.Rows[0];
                user.FirstName = dr["FirstName"].ToString();
                user.LastName = dr["LastName"].ToString();
                user.OtherName = dr["OtherName"].ToString();
                user.Password = dr["Pin"].ToString();
                user.Id = dr["CustomerId"].ToString();
                user.AccountCode = dr["AccountCode"].ToString();
                user.BankCode = dr["BankCode"].ToString();
                user.BranchCode = dr["BranchCode"].ToString();
                user.AccountNumber = dr["AccNumber"].ToString();
                user.StatusCode = "0";
                user.StatusDesc = "SUCCESS";

            }
            else
            {
                user.StatusCode = "100";
                user.StatusDesc = "FAILED: CUSTOMER WITH ID: " + objectId + " NOT FOUND";
            }
        }
        catch (Exception ex)
        {
            user.StatusCode = "100";
            user.StatusDesc = "FAILED: " + ex.Message + "";
        }
        return user;
    }

    internal string SaveCollateral(Collateral collateral)
    {
        try
        {
            string CreateDate = DateTime.Now.ToString("yyyy-MM-dd");
            string ModifyDate = CreateDate;
            command = CbDatabase.GetStoredProcCommand("Collaterals_Update",
                                                      collateral.CollateralID,
                                                      collateral.TypeOfCollateral,
                                                      collateral.NameOfTitleOfOwnership,
                                                      collateral.PathToPictureOfTitleOfOwnership,
                                                      collateral.OwnerID,
                                                      collateral.BankCode,
                                                      collateral.EstimatedMonetaryValue,
                                                      collateral.ModifiedBy,
                                                      collateral.LoanId
                                                      );
            DataTable datatable = CbDatabase.ExecuteDataSet(command).Tables[0];
            return datatable.Rows[0][0].ToString();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    internal string SaveLoanType(LoanType type)
    {
        try
        {
            command = CbDatabase.GetStoredProcCommand("LoanTypes_Update",
                                                     type.LoanTypeCode,
                                                     type.LoanTypeName,
                                                     type.BankCode,
                                                     type.ModifiedBy,
                                                     type.RequiresCollateral,
                                                     type.InterestRateAsPercentage,
                                                     type.InterestRateType,
                                                     type.GracePeriodInDays,
                                                     type.LoanApplicationFee,
                                                     type.LoanProcessingFee
                                                      );
            DataTable datatable = CbDatabase.ExecuteDataSet(command).Tables[0];
            return datatable.Rows[0][0].ToString();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    internal string SaveLoanRequest(LoanRequest request)
    {
        try
        {
            DateTime NextRepayDate = GetNextRepaymentDate(request);
            command = CbDatabase.GetStoredProcCommand("Loans_Insert",
                                                     request.LoanID,
                                                     request.LoanAmout,
                                                     request.CustomerId,
                                                     request.CustomerContactTel,
                                                     request.AccountNumber,
                                                     request.LoanType,
                                                     request.CustomerCreditScore,
                                                     request.MonthlyInstallmentAmounts,
                                                     request.InterestRateInPercentage,
                                                     request.BankCode,
                                                     request.ModifiedBy,
                                                     request.ApprovedBy,
                                                     request.LoanStatus,
                                                     request.IsActive,
                                                     request.LoanAccountNumber,
                                                     request.BranchCode,
                                                     request.AdditionalComments,
                                                     request.InterestRateType,
                                                     request.MapToPlaceOfResidence,
                                                     request.Approver,
                                                     request.GracePeriodInDays,
                                                     request.BussinessSector,
                                                     request.BussinessDescription,
                                                     request.LoanApplicationFee,
                                                     request.LoanProcessingFee,
                                                     request.RepaymentFrequency,
                                                     request.NumberOfInstallments,
                                                     request.InterestDeductedOnDisbursement,
                                                     NextRepayDate,
                                                     request.LoanAccountTitle
                                                      );
            DataTable datatable = CbDatabase.ExecuteDataSet(command).Tables[0];
            return datatable.Rows[0][0].ToString();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    private DateTime GetNextRepaymentDate(LoanRequest request)
    {
        DateTime nextDate = DateTime.Now;
        double GracePeriod = double.Parse(request.GracePeriodInDays);
        PaymentFrequency freq = GetPaymentFrequencyById(request.RepaymentFrequency, request.BankCode);
        if (freq.StatusCode == "0")
        {
            double freqDurationInDays = double.Parse(freq.DurationInDays);
            double totalDaysToNextDate = GracePeriod + freqDurationInDays;
            nextDate = nextDate.AddDays(totalDaysToNextDate);
            return nextDate;
        }
        else
        {
            throw new Exception(freq.StatusDesc);
        }

    }

    internal string SaveCollateralType(CollateralType type)
    {
        try
        {
            command = CbDatabase.GetStoredProcCommand("CollateralTypes_Update",
                                                      type.CollateralTypeCode,
                                                      type.CollateralTypeName,
                                                      type.BankCode,
                                                      type.ModifiedBy
                                                      );
            DataTable datatable = CbDatabase.ExecuteDataSet(command).Tables[0];
            return datatable.Rows[0][0].ToString();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    internal CollateralType GetCollateralTypeById(string Id, string BankCode)
    {
        CollateralType type = new CollateralType();
        try
        {
            command = CbDatabase.GetStoredProcCommand("CollateralTypes_SelectRow",
                                                        Id,
                                                        BankCode
                                                      );
            DataTable datatable = CbDatabase.ExecuteDataSet(command).Tables[0];
            if (datatable.Rows.Count > 0)
            {
                DataRow dr = datatable.Rows[0];
                type.BankCode = dr["BankCode"].ToString();
                type.CollateralTypeCode = dr["CollateralTypeCode"].ToString();
                type.CollateralTypeName = dr["CollateralTypeName"].ToString();
                type.ModifiedBy = dr["ModifiedBy"].ToString();
                type.StatusCode = "0";
                type.StatusDesc = "SUCCESS";
            }
            else
            {
                type.StatusCode = "100";
                type.StatusDesc = "COLLATERAL TYPE NOT FOUND";
            }
        }
        catch (Exception ex)
        {
            type.StatusCode = "100";
            type.StatusDesc = ex.Message;
        }
        return type;
    }

    internal string SaveUtilityDetails(Utility utility)
    {
        try
        {
            command = CbDatabase.GetStoredProcCommand("Utilities_Update",
                                                       utility.UtilityName,
                                                       utility.UtilityCode,
                                                       utility.CommissionAccountNumber,
                                                       utility.IsActive,
                                                       utility.BankCode,
                                                       utility.ModifiedBy
                                                      );
            DataTable datatable = CbDatabase.ExecuteDataSet(command).Tables[0];
            return datatable.Rows[0][0].ToString();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    internal InterestRateType GetInterestTypeById(string Id, string BankCode)
    {
        InterestRateType type = new InterestRateType();
        try
        {
            command = CbDatabase.GetStoredProcCommand("InterestRateTypes_SelectRow",
                                                        Id,
                                                        BankCode
                                                      );
            DataTable datatable = CbDatabase.ExecuteDataSet(command).Tables[0];
            if (datatable.Rows.Count > 0)
            {
                DataRow dr = datatable.Rows[0];
                type.InterestTypeCode = dr["InterestTypeCode"].ToString();
                type.InterestTypeName = dr["InterestTypeName"].ToString();
                type.StatusCode = "0";
                type.StatusDesc = "SUCCESS";
            }
            else
            {
                type.StatusCode = "100";
                type.StatusDesc = "INTEREST TYPE NOT FOUND";
            }
        }
        catch (Exception ex)
        {
            type.StatusCode = "100";
            type.StatusDesc = ex.Message;
        }
        return type;
    }

    internal Beneficiary GetBeneficiaryById(string Id, string BankCode)
    {
        Beneficiary type = new Beneficiary();
        try
        {
            command = CbDatabase.GetStoredProcCommand("Beneficiaries_SelectRow",
                                                        Id,
                                                        BankCode
                                                      );
            DataTable datatable = CbDatabase.ExecuteDataSet(command).Tables[0];
            if (datatable.Rows.Count > 0)
            {
                DataRow dr = datatable.Rows[0];
                type.BankCode = BankCode;
                type.BeneficiaryAccountNumber = dr["BeneficiaryAccountNumber"].ToString();
                type.BeneficiaryBankCode = dr["BeneficiaryBankCode"].ToString();
                type.BeneficiaryName = dr["BeneficiaryName"].ToString();
                type.CustomerId = dr["CustomerId"].ToString();
                type.ModifiedBy = dr["ModifiedBy"].ToString();

                type.StatusCode = "0";
                type.StatusDesc = "SUCCESS";
            }
            else
            {
                type.StatusCode = "100";
                type.StatusDesc = "BENEFICIARY NOT FOUND";
            }
        }
        catch (Exception ex)
        {
            type.StatusCode = "100";
            type.StatusDesc = ex.Message;
        }
        return type;
    }

    internal string SaveBeneficiaryDetails(Beneficiary type)
    {
        try
        {
            command = CbDatabase.GetStoredProcCommand("Beneficiaries_Update",
                                                         type.BankCode,
                                                         type.CustomerId,
                                                         type.BeneficiaryAccountNumber,
                                                         type.BeneficiaryBankCode,
                                                         type.ModifiedBy,
                                                         type.BeneficiaryName
                                                      );
            DataTable datatable = CbDatabase.ExecuteDataSet(command).Tables[0];
            return datatable.Rows[0][0].ToString();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    internal string SaveGuarantorDetails(Guarantor guarantor)
    {
        try
        {
            command = CbDatabase.GetStoredProcCommand("Guarantors_Update",
                                                       guarantor.LoanID,
                                                       guarantor.GuarantorName,
                                                       guarantor.GuarantorRefNumber,
                                                       guarantor.GuarantorType,
                                                       guarantor.BankCode,
                                                       guarantor.ModifiedBy,
                                                       guarantor.GuarantorPhoneNumber,
                                                       guarantor.PathToPicOfGuarantorID,
                                                       guarantor.IdType
                                                      );
            DataTable datatable = CbDatabase.ExecuteDataSet(command).Tables[0];
            return datatable.Rows[0][0].ToString();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    internal string SaveGuarantorTypeDetails(GuarantorType type)
    {
        try
        {
            command = CbDatabase.GetStoredProcCommand("GuarantorTypes_Update",
                                                         type.GurantorTypeCode,
                                                         type.GurantorTypeName,
                                                         type.BankCode,
                                                         type.ModifiedBy
                                                      );
            DataTable datatable = CbDatabase.ExecuteDataSet(command).Tables[0];
            return datatable.Rows[0][0].ToString();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    internal string SaveGroupMember(GroupMember member)
    {
        try
        {
            string ID = "";

            command = CbDatabase.GetStoredProcCommand("GroupMembers_Update",
                                                       member.BankCode,
                                                       member.CustomerID,
                                                       member.GroupID,
                                                       member.LoanID,
                                                       member.Amount,
                                                       member.ModifiedBy
                                                      );
            DataTable datatable = CbDatabase.ExecuteDataSet(command).Tables[0];
            ID = datatable.Rows[0][0].ToString();

            return ID;
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    internal string SaveRepaymentFrequency(PaymentFrequency freq)
    {
        try
        {
            string ID = "";

            command = CbDatabase.GetStoredProcCommand("RepaymentFrequencies",
                                                       freq.RepaymentFreqCode,
                                                       freq.RepayFreqName,
                                                       freq.DurationInDays,
                                                       freq.BankCode,
                                                       freq.ModifiedBy
                                                      );
            DataTable datatable = CbDatabase.ExecuteDataSet(command).Tables[0];
            ID = datatable.Rows[0][0].ToString();

            return ID;
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }




    internal LoanRequest GetLoanRequestByLoanAccountNumber(string AccountNumber, string BankCode)
    {
        LoanRequest request = new LoanRequest();
        try
        {
            command = CbDatabase.GetStoredProcCommand("GetLoanRequestByLoanAccountNumber",
                                                        AccountNumber,
                                                        BankCode
                                                      );
            DataTable datatable = CbDatabase.ExecuteDataSet(command).Tables[0];
            if (datatable.Rows.Count > 0)
            {
                DataRow dr = datatable.Rows[0];
                request.BankCode = dr["BankCode"].ToString();
                request.AccountNumber = dr["AccountNumber"].ToString();
                request.ApprovedBy = dr["ApprovedBy"].ToString();
                request.ModifiedBy = dr["ModifiedBy"].ToString();
                request.BranchCode = dr["BranchCode"].ToString();
                request.CustomerContactTel = dr["CustomerTel"].ToString();
                request.CustomerId = dr["CustomerId"].ToString();
                request.InterestRateInPercentage = dr["InterestRate"].ToString();
                request.IsActive = dr["IsActive"].ToString();
                request.LoanAccountNumber = dr["LoanAccountNumber"].ToString();
                request.LoanAmout = dr["LoanAmount"].ToString();
                request.LoanID = dr["LoanID"].ToString();
                request.LoanStatus = dr["Status"].ToString();
                request.LoanType = dr["LoanType"].ToString();
                request.AdditionalComments = dr["Comments"].ToString();
                request.InterestRateType = dr["InterestRateType"].ToString();
                request.MapToPlaceOfResidence = dr["MapToPlaceOfResidency"].ToString();
                request.RepaymentFrequency = dr["RepaymentFrequency"].ToString();
                request.BussinessSector = dr["BussinessSector"].ToString();
                request.Approver = dr["Approver"].ToString();
                request.StatusCode = "0";
                request.StatusDesc = "SUCCESS";
            }
            else
            {
                request.StatusCode = "100";
                request.StatusDesc = "LOAN REQUEST NOT FOUND";
            }
        }
        catch (Exception ex)
        {
            request.StatusCode = "100";
            request.StatusDesc = ex.Message;
        }
        return request;
    }

    internal BankCharge[] GetBankChargesByTranCateory(string tranCategory, string BankCode)
    {
        List<BankCharge> all = new List<BankCharge>();
        try
        {
            command = CbDatabase.GetStoredProcCommand("GetBankChargesByTranCateory",
                                                       tranCategory,
                                                       BankCode
                                                      );
            DataTable datatable = CbDatabase.ExecuteDataSet(command).Tables[0];
            foreach (DataRow dr in datatable.Rows)
            {
                string IsActive = dr["IsActive"].ToString().ToUpper();
                if (IsActive == "TRUE")
                {
                    BankCharge charge = new BankCharge();
                    charge.BankCode = dr["BankCode"].ToString();
                    charge.BankCode = dr["BankCode"].ToString();
                    charge.ChargeAmount = dr["ChargeAmount"].ToString();
                    charge.ChargeCode = dr["ChargeCode"].ToString();
                    charge.IsActive = dr["IsActive"].ToString();
                    charge.ModifiedBy = dr["ModifiedBy"].ToString();
                    charge.ChargeName = dr["ChargeName"].ToString();
                    charge.ChargeType = dr["ChargeType"].ToString();
                    charge.CommissionAccountNumber = dr["CommissionAccount"].ToString();
                    charge.StatusCode = "0";
                    charge.StatusDesc = "SUCCESS";
                    all.Add(charge);
                }
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
        return all.ToArray();
    }

    internal BankCharge[] GetMerchantChargesByTranCateory(string MerchantId, string tranCategory, string BankCode)
    {
        List<BankCharge> all = new List<BankCharge>();
        try
        {
            command = CbDatabase.GetStoredProcCommand("GetBankChargesForMerchantsByTranCateory",
                                                       tranCategory,
                                                       BankCode
                                                      );
            DataTable datatable = CbDatabase.ExecuteDataSet(command).Tables[0];
            foreach (DataRow dr in datatable.Rows)
            {
                string IsActive = dr["IsActive"].ToString().ToUpper();
                if (IsActive == "TRUE")
                {
                    BankCharge charge = new BankCharge();
                    charge.BankCode = dr["BankCode"].ToString();
                    charge.ChargeAmount = dr["ChargeAmount"].ToString();
                    charge.ChargeCode = dr["ChargeCode"].ToString();
                    charge.IsActive = dr["IsActive"].ToString();
                    charge.ModifiedBy = dr["ModifiedBy"].ToString();
                    charge.ChargeName = dr["ChargeName"].ToString();
                    charge.ChargeType = dr["ChargeType"].ToString();
                    charge.CommissionAccountNumber = dr["CommissionAccount"].ToString();
                    charge.StatusCode = "0";
                    charge.StatusDesc = "SUCCESS";
                    all.Add(charge);
                }
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
        return all.ToArray();
    }

    internal BankAccount GetMerchantDetails(string MerchantCode)
    {
        try
        {
            BankAccount account = new BankAccount();
            command = CbDatabase.GetStoredProcCommand("GetAccountDetailsByCode",
                                                       MerchantCode
                                                      );
            DataSet ds = CbDatabase.ExecuteDataSet(command);
            DataTable dt = ds.Tables[0];
            DataTable userTable = ds.Tables[1];
            if (dt.Rows.Count > 0)
            {
                account.Referenced = dt.Rows[0]["Referenced"].ToString();
                account.AccountId = dt.Rows[0]["AccountCode"].ToString();
                account.AccountName = dt.Rows[0]["AccountName"].ToString();
                account.AccountNumber = dt.Rows[0]["AccNumber"].ToString();
                account.AccountCategory = dt.Rows[0]["AccountCategory"].ToString();
                account.MerchantContact = dt.Rows[0]["MerchantContact"].ToString();
                account.AccountType = dt.Rows[0]["AccType"].ToString();
                account.LiquidationFrequency = dt.Rows[0]["LiquidationFrequency"].ToString();
                account.LiquidationType = dt.Rows[0]["LiquidationType"].ToString();
                account.LiquidationFrequency = dt.Rows[0]["AccType"].ToString();
                account.BankLiqAccount = dt.Rows[0]["LiquidationAccount"].ToString();
                account.BankLiqAccountName = dt.Rows[0]["LiquidationAccountName"].ToString();
                string active = dt.Rows[0]["IsActive"].ToString();
                account.IsActive = active.ToLower();// == "true") ? true : false;
                account.BankCode = dt.Rows[0]["BankCode"].ToString();
                account.BranchCode = dt.Rows[0]["BranchCode"].ToString();
                account.ApprovedBy = dt.Rows[0]["ApprovedBy"].ToString();
                account.CurrencyCode = "UGX";
                account.StatusCode = "0";
                account.StatusDesc = "SUCCESS";
                List<string> AccountSignatory = new List<string>();
                if (userTable.Rows.Count > 0)
                {
                    foreach (DataRow dr in userTable.Rows)
                    {
                        string user = dr["CustomerId"].ToString();
                        AccountSignatory.Add(user);
                    }
                }

                account.AccountSignatories = AccountSignatory;
            }
            else
            {
                account.StatusCode = "100";
                account.StatusDesc = "MERCHANT NOT FOUND";
            }
            return account;
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    internal BankCustomer GetMerchant(string MerchantCode, string bankCode)
    {
        try
        {
            BankCustomer customer = new BankCustomer();
            command = CbDatabase.GetStoredProcCommand("GetMerchant",
                                                       MerchantCode, bankCode
                                                      );
            DataTable dt = CbDatabase.ExecuteDataSet(command).Tables[0];
            if (dt.Rows.Count > 0)
            {
                customer.Id = dt.Rows[0]["CustomerId"].ToString();
                customer.AccountCode = dt.Rows[0]["MerchantId"].ToString();
                customer.FirstName = dt.Rows[0]["FirstName"].ToString();
                customer.LastName = dt.Rows[0]["LastName"].ToString();
                customer.AccountNumber = dt.Rows[0]["AccNumber"].ToString();
                customer.PhoneNumber = dt.Rows[0]["PhoneNumber"].ToString();
                string active = dt.Rows[0]["Active"].ToString();
                customer.IsActive = active.ToLower();// == "true") ? true : false;
                customer.BankCode = dt.Rows[0]["BankCode"].ToString();
                customer.BranchCode = dt.Rows[0]["BranchCode"].ToString();
                customer.Password = dt.Rows[0]["Password"].ToString();
                customer.StatusCode = "0";
                customer.StatusDesc = "SUCCESS";
            }
            else
            {
                customer.StatusCode = "100";
                customer.StatusDesc = "MERCHANT NOT FOUND";
            }
            return customer;
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    internal void LogMailMessage(Email em)
    {
        object[] data = { em.Address, em.Message, em.Subject, em.From, em.ReceipientName };
        command = CbDatabase.GetStoredProcCommand("LogMail", data);
        CbDatabase.ExecuteNonQuery(command);
    }

    internal string SaveCustomerTerminal(CustomerTerminal terminal, string BankCode)
    {
        try
        {
            string deviceId = "";
            command = CbDatabase.GetStoredProcCommand("Device_Update",
                                                        terminal.CustomerId,
                                                        terminal.AccountCode,
                                                        terminal.DeviceId,
                                                        terminal.DeviceType,
                                                        terminal.SIMCard,
                                                        terminal.Passcode,
                                                        terminal.TerminalName,
                                                        terminal.AcquiredBy,
                                                        terminal.Location,
                                                        terminal.PhoneNumber,
                                                        terminal.BankCode,
                                                        terminal.BranchCode,
                                                        terminal.IsActive,
                                                        terminal.ModifiedBy,
                                                        terminal.ApprovedBy
                );
            DataTable datatable = CbDatabase.ExecuteDataSet(command).Tables[0];
            deviceId = datatable.Rows[0]["InsertedId"].ToString();
            return deviceId;
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    //internal string SaveInvoiceDetails(CustomerInvoice invoice)
    //{
    //    try
    //    {
    //        string insertionID = "";
    //        command = CbDatabase.GetStoredProcCommand("Invoices_Update",
    //                                                   invoice.BankCode,
    //                                                   invoice.CustomerName,
    //                                                   invoice.CustomerEmail,
    //                                                   invoice.ItemDesc,
    //                                                   invoice.ItemPrice,
    //                                                   invoice.ChargeAmount,
    //                                                   invoice.TaxAmount,
    //                                                   invoice.TotalInvoiceAmount,
    //                                                   invoice.MerchantId,
    //                                                   invoice.MerchantName,
    //                                                   invoice.Message,
    //                                                   invoice.ModifiedBy,
    //                                                   invoice.InvoiceId
    //            );
    //        DataTable datatable = CbDatabase.ExecuteDataSet(command).Tables[0];
    //        insertionID = datatable.Rows[0]["InsertedId"].ToString();
    //        return insertionID;
    //    }
    //    catch (Exception ex)
    //    {
    //        throw ex;
    //    }
    //}
}
