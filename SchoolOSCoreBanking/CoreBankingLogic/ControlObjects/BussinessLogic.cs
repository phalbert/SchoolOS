using System;
using System.Data;
using System.Configuration;
using CoreBankingLogic.EntityObjects;
using CoreBankingLogic.ExposedObjects;
using System.Collections.Generic;
using System.Reflection;
using System.Text.RegularExpressions;
using System.Security.Cryptography.X509Certificates;
using System.Security.Cryptography;
using System.Text;
using System.Messaging;
using CoreBankingLogic.ControlObjects;

/// <summary>
/// Summary description for BussinessLogic
/// </summary>
public class BussinessLogic
{
    public DatabaseHandler dh = new DatabaseHandler();
    public string SmsQueuePath = @".\private$\smsQueue";
    public BussinessLogic()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public Result SaveAccountDetails(BankAccount account, string BankCode)
    {
        Result result = new Result();
        LogChangesInAuditLog(account, account.AccountNumber, account.BankCode, account.ModifiedBy);
        string accountId = dh.SaveAccount(account, BankCode);
        result.PegPayId = accountId;
        result.StatusCode = "0";
        result.StatusDesc = "SUCCESS";
        return result;
    }

    internal string GetCommissionAccountByCode(string Code, string BankCode)
    {
        try
        {
            string CommAccount = "";
            string[] parameters = { Code, BankCode };
            DataTable dt = dh.ExecuteDataSet("GetUtilityAccount", parameters).Tables[0];
            CommAccount = dt.Rows[0]["CommissionAccountNumber"].ToString();
            return CommAccount;
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    public BankCharge[] GetMerchantCharges(TransactionRequest req)
    {
        List<BankCharge> all = new List<BankCharge>();
        if (string.IsNullOrEmpty(req.ChargeAmount)||req.ChargeAmount=="0") 
        {
            return PadOutChargesArrayWithEmptyCharges(all);
        }

        MerchantChargeResponse merchantCharge = new MerchantChargeResponse();


        if (req.TranCategory == "C2M" || req.TranCategory == "M2M")
        {
            merchantCharge = GetMerchantChargesForTransactionWithChargeAmount(req.BankCode, req.TranAmount, req.TranCategory, req.PaymentType, req.ToAccount, "ACCOUNTNUMBER", req.ChargeAmount);
        }
        else if (req.TranCategory == "M2B")
        {
            //this must be an M2B
            merchantCharge = GetMerchantChargesForTransactionWithChargeAmount(req.BankCode, req.TranAmount, req.TranCategory, req.PaymentType, req.FromAccount, "ACCOUNTNUMBER", req.ChargeAmount);
        }
        else
        {
            throw new Exception("UNABLE TO DETERMINE CHARGES FOR TRANSACTION CATEGORY [" + req.TranCategory + "]");
        }

        //Exception when trying to get merchant Charges
        if (merchantCharge.StatusCode == Globals.FAILURE_BY_EXCEPTION_STATUS_CODE)
        {
            throw new Exception("UNABLE TO DETERMINE CHARGES FOR TRANSACTION CATEGORY [" + req.TranCategory + "]");
        }

        //No Charges Found for this merchant
        if (merchantCharge.StatusCode != Globals.SUCCESS_STATUS_CODE)
        {
            return PadOutChargesArrayWithEmptyCharges(all);
        }

        BankCharge sbuCharge = new BankCharge();
        BankCharge pegasusCharge = new BankCharge();
        BankCharge taxCharge = new BankCharge();

        if (merchantCharge.IsChargePassedOnToCustomer.ToUpper() == "TRUE" && (req.TranCategory == "C2M" || req.TranCategory == "M2M"))
        {
            //charge is to bourne by the customer
            //So Suspense Account is configured for charges (suspense account is debited for charge)

            //Get Sbu Share of charge
            sbuCharge.BankCode = req.BankCode;
            sbuCharge.ChargeAmount = merchantCharge.SbuCommissionAmount;
            sbuCharge.ChargeCode = merchantCharge.ChargeCode;
            sbuCharge.ChargeName = merchantCharge.ChargeName;
            sbuCharge.ChargeType = merchantCharge.CalculationMethod;
            sbuCharge.CommissionAccountNumber = req.PaymentType == "CARD_WEB" ? GetCommissionAccountByCode(Globals.SBU_CARD_COMMISSION_ACCOUNT, req.BankCode) : GetCommissionAccountByCode(Globals.SBU_MOBILE_MONEY_COMMISSION_ACCOUNT, req.BankCode);
            sbuCharge.IsActive = merchantCharge.IsActive;
            sbuCharge.SourceAccountNumber = req.FromAccount;

            //Get Pegasus Share of charge
            pegasusCharge.BankCode = req.BankCode;
            pegasusCharge.ChargeAmount = merchantCharge.PegasusCommissionAmount;
            pegasusCharge.ChargeCode = merchantCharge.ChargeCode;
            pegasusCharge.ChargeName = merchantCharge.ChargeName;
            pegasusCharge.ChargeType = merchantCharge.CalculationMethod;
            pegasusCharge.CommissionAccountNumber = req.PaymentType == "CARD_WEB" ? GetCommissionAccountByCode(Globals.PEGASUS_CARD_COMMISSION_ACCOUNT, req.BankCode) : GetCommissionAccountByCode(Globals.PEGASUS_MOBILE_MONEY_COMMISSION_ACCOUNT, req.BankCode);
            pegasusCharge.IsActive = merchantCharge.IsActive;
            pegasusCharge.SourceAccountNumber = req.FromAccount;

            //Get Tax Share of charge
            taxCharge.BankCode = req.BankCode;
            taxCharge.ChargeAmount = merchantCharge.TaxCommissionAmount;
            taxCharge.ChargeCode = merchantCharge.ChargeCode;
            taxCharge.ChargeName = merchantCharge.ChargeName;
            taxCharge.ChargeType = merchantCharge.CalculationMethod;
            taxCharge.CommissionAccountNumber = GetCommissionAccountByCode(Globals.TAX_COMMISSION_ACCOUNT, req.BankCode);
            taxCharge.IsActive = merchantCharge.IsActive;
            taxCharge.SourceAccountNumber = req.FromAccount;
        }
        else if (merchantCharge.IsChargePassedOnToCustomer.ToUpper() == "FALSE" && (req.TranCategory == "C2M" || req.TranCategory == "M2M"))
        {
            //merchants is bearing all charges
            //So merchants is configured as Source account for charges (debit merchant account for charges)

            //get Sbu share of charge
            sbuCharge.BankCode = req.BankCode;
            sbuCharge.ChargeAmount = merchantCharge.SbuCommissionAmount;
            sbuCharge.ChargeCode = merchantCharge.ChargeCode;
            sbuCharge.ChargeName = merchantCharge.ChargeName;
            sbuCharge.ChargeType = merchantCharge.CalculationMethod;
            sbuCharge.CommissionAccountNumber = req.PaymentType == "CARD_WEB" ? GetCommissionAccountByCode(Globals.SBU_CARD_COMMISSION_ACCOUNT, req.BankCode) : GetCommissionAccountByCode(Globals.SBU_MOBILE_MONEY_COMMISSION_ACCOUNT, req.BankCode);
            sbuCharge.ChargeType = merchantCharge.CalculationMethod;
            sbuCharge.IsActive = merchantCharge.IsActive;
            sbuCharge.SourceAccountNumber = req.ToAccount;

            //get Pegasus share of charge
            pegasusCharge.BankCode = req.BankCode;
            pegasusCharge.ChargeAmount = merchantCharge.PegasusCommissionAmount;
            pegasusCharge.ChargeCode = merchantCharge.ChargeCode;
            pegasusCharge.ChargeName = merchantCharge.ChargeName;
            pegasusCharge.ChargeType = merchantCharge.CalculationMethod;
            pegasusCharge.CommissionAccountNumber = req.PaymentType == "CARD_WEB" ? GetCommissionAccountByCode(Globals.PEGASUS_CARD_COMMISSION_ACCOUNT, req.BankCode) : GetCommissionAccountByCode(Globals.PEGASUS_MOBILE_MONEY_COMMISSION_ACCOUNT, req.BankCode);
            pegasusCharge.ChargeType = merchantCharge.CalculationMethod;
            pegasusCharge.IsActive = merchantCharge.IsActive;
            pegasusCharge.SourceAccountNumber = req.ToAccount;

            //get Tax share of charge
            taxCharge.BankCode = req.BankCode;
            taxCharge.ChargeAmount = merchantCharge.TaxCommissionAmount;
            taxCharge.ChargeCode = merchantCharge.ChargeCode;
            taxCharge.ChargeName = merchantCharge.ChargeName;
            taxCharge.ChargeType = merchantCharge.CalculationMethod;
            taxCharge.CommissionAccountNumber = GetCommissionAccountByCode(Globals.TAX_COMMISSION_ACCOUNT, req.BankCode);
            taxCharge.ChargeType = merchantCharge.CalculationMethod;
            taxCharge.IsActive = merchantCharge.IsActive;
            taxCharge.SourceAccountNumber = req.ToAccount;
        }
        else
        {
            //charge is to bourne by the whoevers account is the source account
            //So Suspense Account is configured for charges (suspense account is debited for charge)

            //Get Sbu Share of charge
            sbuCharge.BankCode = req.BankCode;
            sbuCharge.ChargeAmount = merchantCharge.SbuCommissionAmount;
            sbuCharge.ChargeCode = merchantCharge.ChargeCode;
            sbuCharge.ChargeName = merchantCharge.ChargeName;
            sbuCharge.ChargeType = merchantCharge.CalculationMethod;
            sbuCharge.CommissionAccountNumber = GetCommissionAccountByCode(Globals.SBU_LIQUIDATION_COMMISSION_ACCOUNT, req.BankCode);
            sbuCharge.IsActive = merchantCharge.IsActive;
            sbuCharge.SourceAccountNumber = req.FromAccount;

            //Get Pegasus Share of charge
            pegasusCharge.BankCode = req.BankCode;
            pegasusCharge.ChargeAmount = merchantCharge.PegasusCommissionAmount;
            pegasusCharge.ChargeCode = merchantCharge.ChargeCode;
            pegasusCharge.ChargeName = merchantCharge.ChargeName;
            pegasusCharge.ChargeType = merchantCharge.CalculationMethod;
            pegasusCharge.CommissionAccountNumber = GetCommissionAccountByCode(Globals.PEGASUS_LIQUIDATION_COMMISSION_ACCOUNT, req.BankCode);

            pegasusCharge.IsActive = merchantCharge.IsActive;
            pegasusCharge.SourceAccountNumber = req.FromAccount;

            //Get Tax Share of charge
            taxCharge.BankCode = req.BankCode;
            taxCharge.ChargeAmount = merchantCharge.TaxCommissionAmount;
            taxCharge.ChargeCode = merchantCharge.ChargeCode;
            taxCharge.ChargeName = merchantCharge.ChargeName;
            taxCharge.ChargeType = merchantCharge.CalculationMethod;
            taxCharge.CommissionAccountNumber = GetCommissionAccountByCode(Globals.TAX_COMMISSION_ACCOUNT, req.BankCode);
            taxCharge.IsActive = merchantCharge.IsActive;
            taxCharge.SourceAccountNumber = req.FromAccount;
        }

        all.Add(sbuCharge);
        all.Add(pegasusCharge);
        all.Add(taxCharge);

        return PadOutChargesArrayWithEmptyCharges(all);
    }

    private BankCharge[] PadOutChargesArrayWithEmptyCharges(List<BankCharge> all)
    {
        //we normally expect a minimum of 4 charges 
        if (all.Count < 4)
        {
            //since we now have less than 4 charges
            //lets pad the remaining charges with 0 amounts and empty commission accounts
            int missingCharges = 4 - all.Count;
            for (int i = 0; i <= missingCharges; i++)
            {
                BankCharge charge = new BankCharge();
                charge.ChargeAmount = "0";
                charge.ChargeCode = "";
                charge.ChargeName = "";
                charge.CommissionAccountNumber = "";
                charge.StatusCode = "0";
                charge.StatusDesc = "SUCCESS";
                all.Add(charge);
            }
        }

        return all.ToArray();
    }

    private string GetFinalTransactionAmount(string tranAmount, MerchantChargeResponse merchantCharge)
    {
        try
        {
            double tranAmountDouble = double.Parse(tranAmount);
            double merchantChargeAmount = double.Parse(merchantCharge.CalculatedChargeAmount);
            double difference = tranAmountDouble - merchantChargeAmount;
            return difference.ToString().Split('.')[0];
        }
        catch (Exception ex)
        {
            throw new Exception("FAILED TO CALCULATE TRANSACTION AMOUNT GIVEN CHARGES");
        }
    }

    internal bool IsValidChargeType(string chargeType, out BaseObject valObj)
    {
        valObj = new BaseObject();
        valObj.StatusCode = Globals.SUCCESS_STATUS_CODE;
        valObj.StatusDesc = Globals.SUCCESS_TEXT;
        return true;
    }

    public Result SaveBankChargeTier()
    {
        Result result = new Result();
        return result;
    }

    public Result SaveCommissionAccountDetails(BankCommissionAccount account, string BankCode)
    {
        Result result = new Result();
        LogChangesInAuditLog(account, account.AccountNumber, account.BankCode, account.ModifiedBy);
        string accountId = dh.SaveBankCommissionAccount(account, BankCode);
        result.PegPayId = accountId;
        result.StatusCode = "0";
        result.StatusDesc = "SUCCESS";
        return result;
    }


    public Result SaveChargeType(ChargeType chargeType, string BankCode)
    {
        Result result = new Result();
        LogChangesInAuditLog(chargeType, chargeType.ChargeTypeCode, chargeType.BankCode, chargeType.ModifiedBy);
        string Id = dh.SaveChargeType(chargeType, BankCode);
        result.PegPayId = Id;
        result.StatusCode = "0";
        result.StatusDesc = "SUCCESS";
        return result;
    }

    public Result SaveSystemSetting(SystemSetting setting)
    {
        Result result = new Result();
        LogChangesInAuditLog(setting, setting.SettingCode, setting.BankCode, setting.ModifiedBy);
        string Id = dh.SaveSystemSetting(setting);
        result.PegPayId = Id;
        result.StatusCode = "0";
        result.StatusDesc = "SUCCESS";
        return result;
    }

    public Result SaveBankDetails(Bank bank)
    {
        Result result = new Result();
        LogChangesInAuditLog(bank, bank.BankCode, bank.BankCode, bank.ModifiedBy);
        string bankId = dh.SaveBank(bank);
        result.PegPayId = bankId;
        result.StatusCode = "0";
        result.StatusDesc = "SUCCESS";
        return result;
    }

    public Result Transact(TransactionRequest tranRequest)
    {
        Result result = new Result();
        
        BankCharge[] charges = GetMerchantCharges(tranRequest);
        string TransactId = dh.Transact(tranRequest, charges[0], charges[1], charges[2], charges[3]);
        result.PegPayId = TransactId;
        result.RequestId = tranRequest.BankTranId;
        result.StatusCode = "0";
        result.StatusDesc = "SUCCESS";
        return result;
    }

    public Result PayOutInterest(TransactionRequest tranRequest)
    {
        Result result = new Result();
        string TransactId = dh.PayOutInterest(tranRequest);
        result.PegPayId = TransactId;
        result.RequestId = tranRequest.BankTranId;
        result.StatusCode = "0";
        result.StatusDesc = "SUCCESS";
        return result;
    }

    public Result PayOutLoan(LoanRequest tranRequest)
    {
        Result result = new Result();
        string TransactId = dh.PayOutLoan(tranRequest);
        result.PegPayId = TransactId;
        result.RequestId = tranRequest.LoanID;
        result.StatusCode = "0";
        result.StatusDesc = "SUCCESS";
        return result;
    }

    public double CalculateInterestAcrued(string InterestType, double Principle, double PrincipleBal, double Amount, double InterestRate)
    {
        List<double> results = new List<double>();
        InterestType = InterestType.ToUpper();
        double interestAcrued = 0;

        if (InterestType == "SIMPLE")
        {
            interestAcrued = Principle * (InterestRate / 100);
        }
        else if (InterestType == "COMPOUND")
        {
            interestAcrued = PrincipleBal * (InterestRate / 100);
        }
        else
        {
            throw new Exception("FAILED: UNKNOWN INTEREST RATE TYPE PASSED");
        }
        double AmountAfterDeductingInterest = Amount - interestAcrued;
        return interestAcrued;
    }

    public Result RepayLoan(LoanRepaymentRequest tran)
    {
        Result result = new Result();
        LoanRequest req = dh.GetLoanRequestByLoanAccountNumber(tran.LoanAccountNumber, tran.BankCode);
        PaymentFrequency freq = dh.GetPaymentFrequencyById(req.RepaymentFrequency, tran.BankCode);
        BankAccount loanAccount = dh.GetBankAccountById(tran.LoanAccountNumber, tran.BankCode);

        if (req.StatusCode != "0")
        {
            result.StatusCode = "100";
            result.StatusDesc = req.StatusDesc;
        }
        else if (loanAccount.StatusCode != "0")
        {
            result.StatusCode = "100";
            result.StatusDesc = loanAccount.StatusDesc;
        }
        else if (freq.StatusCode != "0")
        {
            result.StatusCode = "100";
            result.StatusDesc = freq.StatusDesc;
        }
        else
        {
            double originalPrincipal = double.Parse(req.LoanAmout);
            double yearlyInterestRate = double.Parse(req.InterestRateInPercentage.Replace("%", string.Empty));
            double repayDurationInDays = double.Parse(freq.DurationInDays);
            string InterestType = req.InterestRateType;
            double actualInterestRate = (yearlyInterestRate / (365 / repayDurationInDays));
            double remainingBal = double.Parse(loanAccount.AccountBalance);
            double repayAmount = double.Parse(tran.RepaymentAmount);
            double InterestAcrued = CalculateInterestAcrued(InterestType, originalPrincipal, remainingBal, repayAmount, actualInterestRate);


            string TransactId = dh.RepayLoan(tran, InterestAcrued, repayDurationInDays);
            result.PegPayId = TransactId;
            result.RequestId = tran.BankTranId;
            result.StatusCode = "0";
            result.StatusDesc = "SUCCESS";

        }
        return result;
    }

    public Result ReverseTransaction(TransactionRequest tranRequest)
    {
        Result result = new Result();
        string TransactId = dh.Reverse(tranRequest.BankTranId, tranRequest.BankCode, tranRequest.Teller, tranRequest.ApprovedBy, tranRequest.ChequeNumber);
        result.PegPayId = TransactId;
        result.RequestId = tranRequest.BankTranId;
        result.StatusCode = "0";
        result.StatusDesc = "SUCCESS";
        return result;
    }

    public Result SaveBankChargeDetails(BankCharge charge, string BankCode)
    {
        Result result = new Result();
        result.RequestId = charge.ChargeCode;
        LogChangesInAuditLog(charge, charge.ChargeCode, charge.BankCode, charge.ModifiedBy);
        string Id = dh.SaveCharge(charge, BankCode);
        result.StatusCode = "0";
        result.StatusDesc = "SUCCESS";
        result.PegPayId = Id;
        return result;
    }

    public MerchantChargeResponse CalculateTransactionCharges(string BankCode, string TranAmount, string TranCategory, string PaymentChannel, string accountId, string accountIdType, string ChargeAmount)
    {
        MerchantChargeResponse result = new MerchantChargeResponse();
        try
        {
            DataTable dt = dh.GetMerchantChargesForTransaction(BankCode, TranAmount, TranCategory, PaymentChannel, accountId, accountIdType);

            if (dt.Rows.Count > 0)
            {
                DataRow dr = dt.Rows[0];
                result.CalculatedChargeAmount = dr["CalculatedChargeAmount"].ToString().Split('.')[0];
                result.CalculationMethod = dr["CalculationMethod"].ToString().Split('.')[0];
                result.IsChargePassedOnToCustomer = dr["IsChargePassedOntotheCustomer"].ToString();
                result.OriginalTransactionAmount = dr["OriginalTransactionAmount"].ToString().Split('.')[0];
                result.FinalTransactionAmount = dr["FinalTransactionAmount"].ToString().Split('.')[0];
                result.ChargeCode = dr["ChargeCode"].ToString();
                result.MerchantId = dr["MerchantId"].ToString();
                result.TranCategory = dr["TranCategory"].ToString();
                result.TaxCommissionAmount = dr["TaxCommissionAmount"].ToString();
                result.SbuCommissionAmount = dr["SbuCommissionAmount"].ToString();
                result.PegasusCommissionAmount = dr["PegasusCommissionAmount"].ToString();
                result.ChargeName = dr["ChargeName"].ToString();
                result.BankCode = BankCode;
                result.StatusCode = Globals.SUCCESS_STATUS_CODE;
                result.StatusDesc = Globals.SUCCESS_TEXT;

            }
            else
            {
                result.StatusCode = Globals.FAILURE_STATUS_CODE;
                result.StatusDesc = "NO Charges Found For Transactions of Category [" + TranCategory + "] and Merchant [" + accountId + "]";
                result.CalculatedChargeAmount = "0";
                result.CalculationMethod = "N/A";
                result.FinalTransactionAmount = TranAmount;
                result.OriginalTransactionAmount = TranAmount;
                result.IsChargePassedOnToCustomer = "FALSE";
            }
        }
        catch (Exception ex)
        {
            result.StatusCode = Globals.FAILURE_STATUS_CODE;
            result.StatusDesc = "FAILED: " + ex.Message;
            result.CalculatedChargeAmount = "0";
            result.FinalTransactionAmount = TranAmount;
            result.OriginalTransactionAmount = TranAmount;
            result.CalculationMethod = "N/A";
            result.IsChargePassedOnToCustomer = "FALSE";
        }
        return result;
    }

    //the aim of this method is simple
    //given a merchant id and the transaction amount plus the transaction category
    //it will return to you the transaction charges and whether the should be passed
    //on to the customer or not. 
    // Assumption.That programmer passes a merchant id in the account id field plus
    //the value 'merchantId' in account id type field or else he passes account number in
    // account id field and anything else (but 'merchantid') in account id type field
    public List<MerchantChargeResponse> GetMerchantChargesForTransactionNew(string BankCode, string TranAmount, string TranCategory, string PaymentChannel, string accountId, string accountIdType)
    {
        List<MerchantChargeResponse> all = new List<MerchantChargeResponse>();
        try
        {
            
            DataTable dt = dh.GetMerchantChargesForTransaction(BankCode, TranAmount, TranCategory, PaymentChannel, accountId, accountIdType);

            foreach(DataRow dr in dt.Rows)
            {
                MerchantChargeResponse charge = new MerchantChargeResponse();
                charge.CalculatedChargeAmount = dr["CalculatedChargeAmount"].ToString().Split('.')[0];
                charge.CalculationMethod = dr["CalculationMethod"].ToString().Split('.')[0];
                charge.IsChargePassedOnToCustomer = dr["IsChargePassedOntotheCustomer"].ToString();
                charge.OriginalTransactionAmount = dr["OriginalTransactionAmount"].ToString().Split('.')[0];
                charge.FinalTransactionAmount = dr["FinalTransactionAmount"].ToString().Split('.')[0];
                charge.ChargeCode = dr["ChargeCode"].ToString();
                charge.MerchantId = dr["MerchantId"].ToString();
                charge.TranCategory = dr["TranCategory"].ToString();
                charge.TaxCommissionAmount = dr["TaxCommissionAmount"].ToString();
                charge.SbuCommissionAmount = dr["SbuCommissionAmount"].ToString();
                charge.PegasusCommissionAmount = dr["PegasusCommissionAmount"].ToString();
                charge.ChargeName = dr["ChargeName"].ToString();
                charge.IsSplit = dr["IsSplit"].ToString();
                charge.BankCode = BankCode;
                charge.StatusCode = Globals.SUCCESS_STATUS_CODE;
                charge.StatusDesc = Globals.SUCCESS_TEXT;
                all.Add(charge);
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
        return all;
    }

    //the aim of this method is simple
    //given a merchant id and the transaction amount plus the transaction category
    //it will return to you the transaction charges and whether the should be passed
    //on to the customer or not. 
    // Assumption.That programmer passes a merchant id in the account id field plus
    //the value 'merchantId' in account id type field or else he passes account number in
    // account id field and anything else (but 'merchantid') in account id type field
    public MerchantChargeResponse GetMerchantChargesForTransaction(string BankCode, string TranAmount, string TranCategory, string PaymentChannel, string accountId, string accountIdType)
    {
        MerchantChargeResponse result = new MerchantChargeResponse();
        try
        {
            DataTable dt = dh.GetMerchantChargesForTransaction(BankCode, TranAmount, TranCategory, PaymentChannel, accountId, accountIdType);

            if (dt.Rows.Count > 0)
            {
                DataRow dr = dt.Rows[0];
                result.CalculatedChargeAmount = dr["CalculatedChargeAmount"].ToString().Split('.')[0];
                result.CalculationMethod = dr["CalculationMethod"].ToString().Split('.')[0];
                result.IsChargePassedOnToCustomer = dr["IsChargePassedOntotheCustomer"].ToString();
                result.OriginalTransactionAmount = dr["OriginalTransactionAmount"].ToString().Split('.')[0];
                result.FinalTransactionAmount = dr["FinalTransactionAmount"].ToString().Split('.')[0];
                result.ChargeCode = dr["ChargeCode"].ToString();
                result.MerchantId = dr["MerchantId"].ToString();
                result.TranCategory = dr["TranCategory"].ToString();
                result.TaxCommissionAmount = dr["TaxCommissionAmount"].ToString();
                result.SbuCommissionAmount = dr["SbuCommissionAmount"].ToString();
                result.PegasusCommissionAmount = dr["PegasusCommissionAmount"].ToString();
                result.ChargeName = dr["ChargeName"].ToString();
                result.BankCode = BankCode;
                result.StatusCode = Globals.SUCCESS_STATUS_CODE;
                result.StatusDesc = Globals.SUCCESS_TEXT;

            }
            else
            {
                result.StatusCode = Globals.FAILURE_STATUS_CODE;
                result.StatusDesc = "NO Charges Found For Transactions of Category [" + TranCategory + "] and Merchant [" + accountId + "]";
                result.CalculatedChargeAmount = "0";
                result.CalculationMethod = "N/A";
                result.FinalTransactionAmount = TranAmount;
                result.OriginalTransactionAmount = TranAmount;
                result.IsChargePassedOnToCustomer = "FALSE";
            }
        }
        catch (Exception ex)
        {
            result.StatusCode = Globals.FAILURE_BY_EXCEPTION_STATUS_CODE;
            result.StatusDesc = "FAILED: " + ex.Message;
            result.CalculatedChargeAmount = "0";
            result.FinalTransactionAmount = TranAmount;
            result.OriginalTransactionAmount = TranAmount;
            result.CalculationMethod = "N/A";
            result.IsChargePassedOnToCustomer = "FALSE";
        }
        return result;
    }

    //the aim of this method is simple
    //given a merchant id and the transaction amount plus the transaction category
    //it will return to you the transaction charges and whether the should be passed
    //on to the customer or not. 
    // Assumption.That programmer passes a merchant id in the account id field plus
    //the value 'merchantId' in account id type field or else he passes account number in
    // account id field and anything else (but 'merchantid') in account id type field
    public MerchantChargeResponse GetMerchantChargesForTransactionWithChargeAmount(string BankCode, string TranAmount, string TranCategory, string PaymentChannel, string accountId, string accountIdType, string ChargeAmount)
    {
        MerchantChargeResponse result = new MerchantChargeResponse();
        try
        {
            DataTable dt = dh.GetMerchantChargesForTransactionWithChargeAmount(BankCode, TranAmount, TranCategory, PaymentChannel, accountId, accountIdType, ChargeAmount);

            if (dt.Rows.Count > 0)
            {
                DataRow dr = dt.Rows[0];
                result.CalculatedChargeAmount = dr["CalculatedChargeAmount"].ToString().Split('.')[0];
                result.CalculationMethod = dr["CalculationMethod"].ToString().Split('.')[0];
                result.IsChargePassedOnToCustomer = dr["IsChargePassedOntotheCustomer"].ToString();
                result.OriginalTransactionAmount = dr["OriginalTransactionAmount"].ToString().Split('.')[0];
                result.FinalTransactionAmount = dr["FinalTransactionAmount"].ToString().Split('.')[0];
                result.ChargeCode = dr["ChargeCode"].ToString();
                result.MerchantId = dr["MerchantId"].ToString();
                result.TranCategory = dr["TranCategory"].ToString();
                result.TaxCommissionAmount = dr["TaxCommissionAmount"].ToString();
                result.SbuCommissionAmount = dr["SbuCommissionAmount"].ToString();
                result.PegasusCommissionAmount = dr["PegasusCommissionAmount"].ToString();
                result.ChargeName = dr["ChargeName"].ToString();
                result.BankCode = BankCode;
                result.StatusCode = Globals.SUCCESS_STATUS_CODE;
                result.StatusDesc = Globals.SUCCESS_TEXT;

            }
            else
            {
                result.StatusCode = Globals.FAILURE_STATUS_CODE;
                result.StatusDesc = "NO Charges Found For Transactions of Category [" + TranCategory + "] and Merchant [" + accountId + "]";
                result.CalculatedChargeAmount = "0";
                result.CalculationMethod = "N/A";
                result.FinalTransactionAmount = TranAmount;
                result.OriginalTransactionAmount = TranAmount;
                result.IsChargePassedOnToCustomer = "FALSE";
            }
        }
        catch (Exception ex)
        {
            result.StatusCode = Globals.FAILURE_BY_EXCEPTION_STATUS_CODE;
            result.StatusDesc = "FAILED: " + ex.Message;
            result.CalculatedChargeAmount = "0";
            result.FinalTransactionAmount = TranAmount;
            result.OriginalTransactionAmount = TranAmount;
            result.CalculationMethod = "N/A";
            result.IsChargePassedOnToCustomer = "FALSE";
        }
        return result;
    }

    private string GetTranAmountAfterApplyingCharges(string tranAmount, string calculatedChargeAmount, string isChargePassedOnToCustomer)
    {
        if (isChargePassedOnToCustomer.ToUpper() == "TRUE")
        {
            double tranAmountDouble = double.Parse(tranAmount);
            double calculatedChargeAmountDouble = double.Parse(calculatedChargeAmount);
            return (tranAmount + calculatedChargeAmountDouble).ToString();
        }
        else
        {
            return tranAmount;
        }
    }

    public Result SaveMerchantCharges(MerchantCharge charge)
    {
        Result result = new Result();
        result.RequestId = charge.ChargeCode;
        LogChangesInAuditLog(charge, charge.ChargeCode, charge.BankCode, charge.ModifiedBy);
        string Id = dh.SaveMerchantCharges(charge);
        result.StatusCode = "0";
        result.StatusDesc = "SUCCESS";
        result.PegPayId = Id;
        return result;
    }

    public Result SaveBankCustomerDetails(BankCustomer cust, string BankCode)
    {
        Result result = new Result();
        result.RequestId = cust.Id;
        LogChangesInAuditLog(cust, cust.Id, cust.BankCode, cust.ModifiedBy);
        string CustId = dh.SaveCustomer(cust, BankCode);
        result.StatusCode = "0";
        result.StatusDesc = "SUCCESS";
        result.PegPayId = CustId;
        return result;
    }

    public Result SaveCustomerTerminal(CustomerTerminal terminal, string BankCode)
    {
        Result result = new Result();
        LogChangesInAuditLog(terminal, terminal.CustomerId, terminal.BankCode, terminal.ModifiedBy);
        string CustId = dh.SaveCustomerTerminal(terminal, BankCode);
        if (string.IsNullOrEmpty(CustId))
        {
            result.StatusCode = "100";
            result.StatusDesc = "OPERATION FAILED";
        }
        else
        {
            result.PegPayId = CustId;
            result.RequestId = CustId;
            result.StatusCode = "0";
            result.StatusDesc = "SUCCESS";
        }
        return result;
    }

    public Result SaveTranType(TransactionCategory tranType, string BankCode)
    {
        Result result = new Result();
        result.RequestId = tranType.Id;
        LogChangesInAuditLog(tranType, tranType.TranCategoryCode, tranType.BankCode, tranType.ModifiedBy);
        string Id = dh.SaveTransactionType(tranType, BankCode);
        result.StatusCode = "0";
        result.StatusDesc = "SUCCESS";
        result.PegPayId = Id;
        return result;
    }

    public BankAccountStatement GenerateStatement(string AccountNumber, string BankCode, string Password, string StatementType)
    {
        BankAccountStatement statement = new BankAccountStatement();
        DataTable dt = dh.GetAccountStatement(AccountNumber, BankCode, StatementType);
        if (dt.Rows.Count > 0)
        {
            List<string> allTransactions = new List<string>();
            foreach (DataRow dr in dt.Rows)
            {
                string BankId = dr["BankTranId"].ToString();
                string Amount = dr["TranAmount"].ToString();
                string PaymentDate = DateTime.Parse(dr["PaymentDate"].ToString()).ToString("ddMMyyyy");
                string TranType = dr["TranType"].ToString();
                string line = BankId + "," +
                              Amount + "," +
                              TranType + "," +
                              PaymentDate;
                allTransactions.Add(line);
            }
            statement.statement = allTransactions;
            statement.StatusCode = "0";
            statement.StatusDesc = "SUCCESS";
        }
        else
        {
            statement.StatusCode = "100";
            statement.StatusDesc = "NO TRANSACTIONS FOUND DONE AGAINIST " + AccountNumber;
        }
        return statement;
    }

    public Result SaveCustomerTypeDetails(CustomerType custType, string BankCode)
    {
        Result result = new Result();
        result.RequestId = custType.Id;
        LogChangesInAuditLog(custType, custType.UserTypeCode, custType.BankCode, custType.ModifiedBy);
        string Id = dh.SaveUserTypeDetails(custType, BankCode);
        result.StatusCode = "0";
        result.StatusDesc = "SUCCESS";
        result.PegPayId = Id;
        return result;
    }

    public bool AreValidBankCredentials(string BankCode, string Password, out BaseObject valObj)
    {
        valObj = new BaseObject();
        Bank bank = dh.GetBankById(BankCode);
        valObj = bank;
        if (valObj.StatusCode == "0")
        {
            return true;
        }
        else
        {
            return false;
        }
    }

    public bool IsDuplicateAccount(string AccountNumber, string BankCode)
    {
        return true;
    }

    public bool IsValidBankRef(string BankId, string BankCode, string toAccount, string fromAccount, string Amount, out BaseObject obj)
    {
        obj = new BaseObject();
        string[] parameters = { BankId, BankCode, toAccount, fromAccount, Amount };
        DataSet ds = dh.ExecuteDataSet("IsValidBankRef", parameters);
        DataTable dt = ds.Tables[0];

        //something has been found
        if (dt.Rows.Count > 0)
        {
            DataRow dr = dt.Rows[0];
            string BankRef = dr["BankTranId"].ToString().ToUpper().Trim();
            string PegPayId = dr["PegPayTranId"].ToString();
            if (BankId.ToUpper().Trim() == BankRef)
            {
                //Indicate succes to Vendor
                obj.StatusCode = "0";
                obj.StatusDesc = "DUPLICATE BANK TRANSACTION ID[" + BankRef + "], ORIGINAL RECIEPT NUMBER =" + PegPayId;
                return false;
            }
            else
            {
                obj.StatusCode = "100";
                obj.StatusDesc = "FAILED:SUSPECTED DOUBLE POSTING,SAME AMOUNT TO SAME ACCOUNT NUMBER WITHIN 10 min, ORIGINAL RECIEPT NUMBER =" + PegPayId;
                return true;
            }
        }
        //no record of Id found
        else
        {
            obj.StatusCode = "0";
            obj.StatusDesc = "SUCCESS";
            return true;
        }

    }



    internal bool IsValidUser(string UserId, string BankCode, string UserType, out BaseObject obj)
    {
        List<string> allowedUserTypes = new List<string>();
        allowedUserTypes.AddRange(UserType.Split('|'));
        obj = new BaseObject();
        BankUser user = dh.GetUserById(UserId, BankCode);
        if (user.StatusCode == "0")
        {
            if (string.IsNullOrEmpty(user.ApprovedBy))
            {
                obj.StatusCode = "100";
                obj.StatusDesc = "USER [" + user.Id + "] HAS NOT YET BEEN APPROVED";
                return false;
            }
            else if (user.IsActive.ToUpper() == "FALSE")
            {
                obj.StatusCode = "100";
                obj.StatusDesc = "FAILED: USER [" + UserId + "] IS NOT ACTIVATED.";
                return false;

            }
            else
            {
                //is user allowed to perform this operation
                if (allowedUserTypes.Contains(user.Usertype.ToUpper()))
                {
                    obj = user;
                    return true;
                }
                else
                {
                    obj.StatusCode = "100";
                    obj.StatusDesc = "ACCESS DENIED: BANK USER: [" + UserId + "] WITH ROLE: [" + user.Usertype + "] IS NOT PERMITTED TO PERFORM THIS OPERATION";

                    //log error for audit purposes
                    dh.LogError(UserId, BankCode, obj.StatusDesc);
                    return false;
                }
            }
        }
        else
        {
            obj = user;
            return false;
        }
    }

    internal bool IsValidCustomer(string CustomerId, string BankCode, out BaseObject obj)
    {
        List<string> allowedUserTypes = new List<string>();
        obj = new BaseObject();
        BankCustomer user = dh.GetCustomerById(CustomerId, BankCode);
        if (user.StatusCode == "0")
        {
            if (string.IsNullOrEmpty(user.ApprovedBy))
            {
                obj.StatusCode = "100";
                obj.StatusDesc = "CUSTOMER [" + user.Id + " HAS NOT YET BEEN APPROVED";
                return false;
            }
            else if (user.IsActive.ToUpper() == "TRUE")
            {
                obj.StatusCode = "0";
                obj.StatusDesc = "SUCCESS";
                return true;
            }
            else
            {
                obj.StatusCode = "100";
                obj.StatusDesc = "FAILED: CUSTOMER PROFILE [" + CustomerId + "] DE-ACTIVATED.";
                return false;
            }
        }
        else
        {
            obj = user;
            return false;
        }
    }


    public Result SaveBankUserDetails(BankUser user, string BankCode)
    {
        Result result = new Result();
        result.RequestId = user.Id;
        LogChangesInAuditLog(user, user.Id, user.BankCode, user.ModifiedBy);
        string Id = dh.SaveUserDetails(user, BankCode);
        result.StatusCode = "0";
        result.StatusDesc = "SUCCESS";
        result.PegPayId = Id;
        return result;
    }

    public Result SaveUserTypeDetails(UserType userType, string BankCode)
    {
        Result result = new Result();
        result.RequestId = userType.Id;
        LogChangesInAuditLog(userType, userType.UserTypeCode, userType.BankCode, userType.ModifiedBy);
        string Id = dh.SaveUserTypeDetails(userType, BankCode);
        result.StatusCode = "0";
        result.StatusDesc = "SUCCESS";
        result.PegPayId = Id;
        return result;
    }

    public Result SaveAccountTypeDetails(AccountType accountType, string BankCode)
    {
        Result result = new Result();
        result.RequestId = accountType.Id;
        LogChangesInAuditLog(accountType, accountType.AccTypeCode, accountType.BankCode, accountType.ModifiedBy);
        string Id = dh.SaveAccountTypeDetails(accountType, BankCode);
        result.StatusCode = "0";
        result.StatusDesc = "SUCCESS";
        result.PegPayId = Id;
        return result;
    }

    private void LogChangesInAuditLog(BaseObject baseObj, string objectId, string BankCode, string modifiedBy)
    {
        try
        {
            //we use reflection to 
            //1. get the class of object passed
            //2.loop thru all properties of that class and get changes made
            AuditLog log = new AuditLog();
            BaseObject type = GetById(baseObj.GetType().Name, objectId, BankCode, "");
            string changesMade = "";

            //this is an Update
            if (type.StatusCode == "0")
            {
                log.ActionType = "UPDATE";
                changesMade += "Updated " + baseObj.GetType().Name + ",";
                FieldInfo[] oldFields = type.GetType().GetFields();
                FieldInfo[] newFields = baseObj.GetType().GetFields();
                foreach (FieldInfo oldField in oldFields)
                {
                    string oldFieldName = oldField.Name;
                    foreach (FieldInfo newField in newFields)
                    {
                        string newFieldName = newField.Name;

                        //when we find the matching field in the new object
                        if (oldFieldName == newFieldName)
                        {
                            //we compare the values in those fields

                            object oldFieldValue = type.GetType().GetField(oldFieldName).GetValue(type);
                            object newFieldValue = baseObj.GetType().GetField(newFieldName).GetValue(baseObj);

                            //if values have changed, we log that as a change in the audit logs
                            if (oldFieldValue != null && newFieldValue != null)
                            {
                                if (oldFieldValue.ToString() != newFieldValue.ToString())
                                {
                                    changesMade += " Changed " + oldFieldName + " From " + oldFieldValue + " To " + newFieldValue + ",";
                                }
                            }
                            break;
                        }
                    }
                }

            }
            //this is a new object. i.e an Insert
            else
            {
                changesMade += "Created new " + baseObj.GetType().Name + " with ";
                log.ActionType = "CREATE";
                FieldInfo[] newFields = baseObj.GetType().GetFields();

                foreach (FieldInfo newField in newFields)
                {
                    string newFieldName = newField.Name;
                    object obj = baseObj.GetType().GetField(newFieldName).GetValue(baseObj);
                    if (obj != null)
                    {
                        string newFieldValue =
                        changesMade += newFieldName + " = " + obj.ToString() + ", ";
                    }
                }
            }


            log.BankCode = BankCode;
            log.Action = changesMade;
            log.ModifiedBy = modifiedBy;
            log.TableName = baseObj.GetType().Name;
            dh.InsertIntoAuditLog(log);
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    public string RemoveCommasFromMoneyString(string money)
    {
        if (!string.IsNullOrEmpty(money))
        {
            money = money.Replace(",", string.Empty);
        }
        return money;
    }

    public BaseObject GetById(string className, string objectId, string bankCode, string Password)
    {
        BaseObject result = new BaseObject();
        if (string.IsNullOrEmpty(className))
        {
            result.StatusCode = "100";
            result.StatusDesc = "PLEASE SUPPLY THE CLASS NAME";
            return result;
        }
        else if (string.IsNullOrEmpty(objectId))
        {
            result.StatusCode = "100";
            result.StatusDesc = "PLEASE SUPPLY THE OBJECT ID. i.e THE UNIQUE IDENTIFIER OF THIS OBJECT";
            return result;
        }
        else if (className.ToUpper() == "BANKUSER" || className.ToUpper() == "BANKTELLER")
        {
            result = GetBankUser(objectId, bankCode, Password);
            return result;
        }
        else if (className.ToUpper() == "BANKCUSTOMER")
        {
            result = GetBankCustomer(objectId, bankCode, Password);
            return result;
        }
        else if (className.ToUpper() == "BANK")
        {
            result = dh.GetBankById(objectId);
            return result;
        }
        else if (className.ToUpper() == "BANKBRANCH")
        {
            BankBranch branch = dh.GetBankBranchById(objectId, bankCode);
            result = branch;
            return result;
        }
        else if (className.ToUpper() == "BANKCOMMISSIONACCOUNT")
        {
            BankCommissionAccount account = dh.GetBankCommissionAccountById(objectId, bankCode);
            result = account;
            return result;
        }
        else if (className.ToUpper() == "USERTYPE")
        {
            UserType user = dh.GetUserTypeById(objectId, bankCode);
            result = user;
            return result;
        }
        else if (className.ToUpper() == "CUSTOMERTYPE")
        {
            UserType user = dh.GetUserTypeById(objectId, bankCode);
            result = user;
            return result;
        }
        else if (className.ToUpper() == "TRANSACTIONCATEGORY")
        {
            TransactionCategory category = dh.GetTransactionCategoryById(objectId, bankCode);
            result = category;
            return result;
        }
        else if (className.ToUpper() == "REPAYMENTFREQUENCY")
        {
            PaymentFrequency freq = dh.GetPaymentFrequencyById(objectId, bankCode);
            result = freq;
            return result;
        }
        else if (className.ToUpper() == "PAYMENTFREQUENCY")
        {
            PaymentFrequency freq = dh.GetPaymentFrequencyById(objectId, bankCode);
            result = freq;
            return result;
        }
        else if (className.ToUpper() == "BANKACCOUNT")
        {
            BankAccount category = dh.GetBankAccountById(objectId, bankCode);
            result = category;
            return result;
        }
        else if (className.ToUpper() == "ACCOUNTTYPE")
        {
            AccountType category = dh.GetAccountTypeById(objectId, bankCode);
            result = category;
            return result;
        }
        else if (className.ToUpper() == "PAYMENTTYPE")
        {
            PaymentType category = dh.GetPaymentTypeById(objectId, bankCode);
            result = category;
            return result;
        }
        else if (className.ToUpper() == "BENEFICIARY")
        {
            Beneficiary beneficiary = dh.GetBeneficiaryById(objectId, bankCode);
            result = beneficiary;
            return result;
        }
        else if (className.ToUpper() == "INTERESTRATETYPE")
        {
            InterestRateType type = dh.GetInterestTypeById(objectId, bankCode);
            result = type;
            return result;
        }
        else if (className.ToUpper() == "SYSTEMSETTING")
        {
            SystemSetting setting = dh.GetSystemSettingById(objectId, bankCode);
            result = setting;
            return result;
        }
        else if (className.ToUpper() == "BANKCHARGE")
        {
            BankCharge category = dh.GetBankChargeById(objectId, bankCode);
            result = category;
            return result;
        }
        else if (className.ToUpper() == "CHARGETYPE")
        {
            ChargeType category = dh.GetChargeTypeById(objectId, bankCode);
            result = category;
            return result;
        }
        else if (className.ToUpper() == "CURRENCY")
        {
            Currency category = dh.GetCurrencyCodeById(objectId, bankCode);
            result = category;
            return result;
        }
        else if (className.ToUpper() == "LOANTYPE")
        {
            LoanType category = dh.GetLoanTypeById(objectId, bankCode);
            result = category;
            return result;
        }
        else if (className.ToUpper() == "LOANREQUEST")
        {
            LoanRequest request = dh.GetLoanRequestById(objectId, bankCode);
            result = request;
            return result;
        }
        else if (className.ToUpper() == "COLLATERALTYPE")
        {
            CollateralType type = dh.GetCollateralTypeById(objectId, bankCode);
            result = type;
            return result;
        }
        else if (className.ToUpper() == "ACCESSRULE")
        {
            AccessRule rule = dh.GetAccessRuleById(objectId, bankCode);
            result = rule;
            return result;
        }
        else if (className.ToUpper() == "TRANSACTIONRULE")
        {
            TransactionRule rule = dh.GetTransactionRuleById(objectId, bankCode);
            result = rule;
            return result;
        }
        else
        {
            result.StatusCode = "100";
            result.StatusDesc = "OBJECT NOT FOUND";
            return result;
        }
    }

    private BaseObject GetBankCustomer(string objectId, string bankCode, string Password)
    {
        BaseObject result = new BaseObject();
        BankCustomer user = dh.GetCustomerById(objectId, bankCode);
        result = user;
        return result;
    }

    private BaseObject GetBankUser(string objectId, string bankCode, string Password)
    {
        BaseObject result = new BaseObject();
        BankUser user = dh.GetUserById(objectId, bankCode);
        if (user.Usertype == "TELLER")
        {
            BankTeller teller = new BankTeller(user);
            teller.TellerAccountNumber = dh.GetAccountsByUserId(user.Id)[0];
            result = teller;
        }
        else
        {
            result = user;
        }

        return result;
    }

    public BaseObject[] GetAll(string className, string bankCode, string Password)
    {
        BaseObject[] result = { };
        if (string.IsNullOrEmpty(className))
        {
            return result;
        }
        else if (className.ToUpper() == "BANKUSER")
        {
            BankUser[] all = dh.GetAllUsers(bankCode);
            result = all;
            return result;
        }
        else if (className.ToUpper() == "USERTYPE")
        {
            UserType[] all = dh.GetAllUserTypes(bankCode);
            result = all;
            return result;
        }
        else if (className.ToUpper() == "BANK")
        {
            Bank[] all = dh.GetAllBanks();
            result = all;
            return result;
        }
        else if (className.ToUpper() == "BANKBRANCH")
        {
            BankBranch[] all = dh.GetAllBankBranches(bankCode);
            result = all;
            return result;
        }
        else
        {
            return result;
        }
    }

    public Result SaveTellerDetails(BankTeller teller, string BankCode)
    {
        Result result = new Result();
        result.RequestId = teller.Id;
        LogChangesInAuditLog(teller, teller.Id, teller.BankCode, teller.ModifiedBy);
        string Id = dh.SaveBankTeller(teller, BankCode);
        result.StatusCode = "0";
        result.StatusDesc = "SUCCESS";
        result.PegPayId = Id;
        return result;
    }

    public Result SaveBankBranchDetails(BankBranch branch, string BankCode)
    {
        Result result = new Result();
        result.RequestId = branch.BankBranchId;
        LogChangesInAuditLog(branch, branch.BranchCode, branch.BankCode, branch.ModifiedBy);
        string Id = dh.SaveBankBranch(branch, BankCode);
        result.StatusCode = "0";
        result.StatusDesc = "SUCCESS";
        result.PegPayId = Id;
        return result;
    }

    public DataSet ExecuteDataSet(string storedProcedureName, string[] Parameters)
    {
        DataSet ds = dh.ExecuteDataSet(storedProcedureName, Parameters);
        return ds;
    }

    public Result ExecuteNonQuery(string storedProcedureName, string[] Parameters)
    {
        Result ds = dh.ExecuteNonQuery(storedProcedureName, Parameters);
        return ds;
    }

    public Result SaveAccessRule(AccessRule rule, string BankCode)
    {
        Result result = new Result();
        result.RequestId = rule.Id;
        LogChangesInAuditLog(rule, rule.RuleName, rule.BankCode, rule.ModifiedBy);
        string Id = dh.SaveAccessRule(rule, BankCode);
        result.StatusCode = "0";
        result.StatusDesc = "SUCCESS";
        result.PegPayId = Id;
        return result;
    }

    public Result SaveTransactionRule(TransactionRule rule, string BankCode)
    {
        Result result = new Result();
        result.RequestId = rule.Id;
        LogChangesInAuditLog(rule, rule.RuleCode, rule.BankCode, rule.ModifiedBy);
        string Id = dh.SaveTransactionRule(rule, BankCode);
        result.StatusCode = "0";
        result.StatusDesc = "SUCCESS";
        result.PegPayId = Id;
        return result;
    }

    internal bool IsValidBankCredentials(string BankCode, string Password)
    {
        Bank bank = dh.GetBankById(BankCode);

        if (bank.StatusCode == "0")
        {

            //if(Password !=bank.BankPassword)

            //for now...this is how i verify the password..has to change backt to above on production
            if (Password != "T3rr1613" && Password != "TEST")
            {
                return false;
            }
            else
            {
                return true;
            }
        }
        else
        {
            return false;
        }
    }

    internal bool IsValidBankCode(string BankCode, out BaseObject obj)
    {
        obj = new BaseObject();
        Bank bank = dh.GetBankById(BankCode);
        if (bank.StatusCode == "0")
        {
            if (bank.IsActive.ToUpper() == "TRUE")
            {
                obj = bank;
                return true;
            }
            else
            {
                obj.StatusCode = "100";
                obj.StatusDesc = "BANK WITH BANK CODE [" + BankCode + "] IS NOT ACTIVATED";
                return false;
            }
        }
        else
        {
            obj = bank;
            return false;
        }
    }

    internal bool IsValidBankBranchCode(string BranchCode, string BankCode, out BaseObject obj)
    {
        obj = new BaseObject();
        BankBranch branch = dh.GetBankBranchById(BranchCode, BankCode);
        if (branch.StatusCode == "0")
        {
            if (branch.IsActive.ToUpper() == "TRUE")
            {
                obj = branch;
                return true;
            }
            else
            {
                obj.StatusCode = "100";
                obj.StatusDesc = "FAILED: BANK BRANCH [" + BranchCode + "] IS NOT ACTIVE AT PEGPAY";
                return false;
            }
        }
        else
        {
            obj = branch;
            return false;
        }
    }

    internal bool IsValidTransactAccountNumber(string AccountNumber, string BankCode, out BaseObject valObj)
    {
        valObj = new BaseObject();
        BankAccount account = dh.GetBankAccountById2(AccountNumber, BankCode);

        if (account.StatusCode == "0")
        {
            if (account.IsActive.ToUpper() == "FALSE")
            {
                valObj.StatusCode = "100";
                valObj.StatusDesc = "FAILED: ACCOUNT WITH ACCOUNTNUMBER [" + AccountNumber + "] IS NOT ACTIVATED";
                return false;
            }
            else if (account.AccountType.ToUpper() == "LOAN_ACCOUNT")
            {
                valObj.StatusCode = "100";
                valObj.StatusDesc = "FAILED: THIS OPERATION IS NOT ALLOWED ON LOAN ACCOUNT WITH ACCOUNTNUMBER [" + AccountNumber + "]. USE REPAY LOAN OPTION TO REPAY A LOAN";
                return false;
            }
            else if (string.IsNullOrEmpty(account.ApprovedBy))
            {
                valObj.StatusCode = "100";
                valObj.StatusDesc = "FAILED: ACCOUNT WITH ACCOUNTNUMBER [" + AccountNumber + "] HAS NOT YET BEEN APPROVED";
                return false;
            }
            else
            {
                valObj.StatusCode = "0";
                valObj.StatusDesc = "SUCCESS";
                return true;
            }
        }
        else
        {
            valObj = account;
            return false;
        }
    }

    internal bool IsValidLoanAccountNumber(string AccountNumber, string Amount, string BankCode, out BaseObject valObj)
    {
        valObj = new BaseObject();
        BankAccount account = dh.GetBankAccountById(AccountNumber, BankCode);

        //get loan account balance, ignore the negative so that we make sure 
        //that the customer pays <= money than the account balance
        //this is to prevent having to return change in case he pays more than the loan balance
        double loanAccBal = double.Parse(account.AccountBalance.Replace("-", string.Empty));
        double repayAmount = double.Parse(Amount);
        if (account.StatusCode == "0")
        {
            if (account.IsActive.ToUpper() == "FALSE")
            {
                valObj.StatusCode = "100";
                valObj.StatusDesc = "FAILED: ACCOUNT WITH ACCOUNTNUMBER [" + AccountNumber + "] IS NOT ACTIVATED";
                return false;
            }
            else if (string.IsNullOrEmpty(account.ApprovedBy))
            {
                valObj.StatusCode = "100";
                valObj.StatusDesc = "FAILED: ACCOUNT WITH ACCOUNTNUMBER [" + AccountNumber + "] HAS NOT YET BEEN APPROVED";
                return false;
            }
            else if (account.AccountType != "LOAN_ACCOUNT")
            {
                valObj.StatusCode = "100";
                valObj.StatusDesc = "FAILED: ACCOUNT WITH ACCOUNTNUMBER [" + AccountNumber + "] IS NOT A LOAN ACCOUNT";
                return false;
            }
            else if (repayAmount > loanAccBal)
            {
                valObj.StatusCode = "100";
                valObj.StatusDesc = "FAILED: CUSTOMER IS ATTEMPTING TO PAY MORE THAN THE REMAINING LOAN BALANCE";
                return false;
            }
            else
            {
                valObj.StatusCode = "0";
                valObj.StatusDesc = "SUCCESS";
                return true;
            }
        }
        else
        {
            valObj = account;
            return false;
        }
    }

    internal bool IsValidLoanAccountNumber(string AccountNumber, string BankCode, out BaseObject valObj)
    {
        valObj = new BaseObject();
        BankAccount account = dh.GetBankAccountById(AccountNumber, BankCode);

        if (account.StatusCode == "0")
        {
            if (account.IsActive.ToUpper() == "FALSE")
            {
                valObj.StatusCode = "100";
                valObj.StatusDesc = "FAILED: ACCOUNT WITH ACCOUNTNUMBER [" + AccountNumber + "] IS NOT ACTIVATED";
                return false;
            }
            else if (string.IsNullOrEmpty(account.ApprovedBy))
            {
                valObj.StatusCode = "100";
                valObj.StatusDesc = "FAILED: ACCOUNT WITH ACCOUNTNUMBER [" + AccountNumber + "] HAS NOT YET BEEN APPROVED";
                return false;
            }
            else if (account.AccountType != "LOAN_ACCOUNT")
            {
                valObj.StatusCode = "100";
                valObj.StatusDesc = "FAILED: ACCOUNT WITH ACCOUNTNUMBER [" + AccountNumber + "] IS NOT A LOAN ACCOUNT";
                return false;
            }
            else
            {
                valObj.StatusCode = "0";
                valObj.StatusDesc = "SUCCESS";
                return true;
            }
        }
        else
        {
            valObj = account;
            return false;
        }
    }

    internal bool IsValidTransactionAmount(string Amount, out BaseObject valObj)
    {
        valObj = new BaseObject();
        return true;
    }

    internal bool IsValidTransactionCategory(string tranCategory, string BankCode, out BaseObject valObj)
    {
        valObj = new BaseObject();
        TransactionCategory category = dh.GetTransactionCategoryById(tranCategory, BankCode);


        if (category.StatusCode == "0")
        {
            if (category.IsActive.ToUpper() == "TRUE")
            {
                valObj.StatusCode = "0";
                valObj.StatusDesc = "SUCCESS";
                return true;
            }
            else
            {
                valObj.StatusCode = "100";
                valObj.StatusDesc = "FAILED: TRANSACTION CATEGORY  [" + tranCategory + "] IS NOT ACTIVATED";
                return false;
            }
        }
        else
        {
            valObj = category;
            return false;
        }
    }

    internal bool IsValidReversal(string bankRef, string bankCode, string OriginalTransactionId, out BaseObject valObject)
    {
        valObject = new BaseObject();
        DataTable dt = dh.GetTransactionByBankId(bankRef, bankCode);

        if (dt.Rows.Count == 0)
        {
            valObject.StatusCode = "100";
            valObject.StatusDesc = "TRANSACTION WITH BANK ID:" + bankRef + " NOT FOUND: REVERSAL NOT POSSIBLE";
            return false;
        }

        dt = dh.CheckForReversedTransaction(OriginalTransactionId, bankCode);


        if (dt.Rows.Count > 0)
        {
            DataRow dr = dt.Rows[0];
            string PegPayId = dr["PegPayTranId"].ToString();
            valObject.StatusCode = "0";
            valObject.StatusDesc = "DUPLICATE REVERSAL REQUEST FOR [" + bankRef + "]. ORIGINAL RECIEPT NUMBER FOR REVERSAL = " + PegPayId;
            valObject.Status = PegPayId;
            return false;
        }

        valObject.StatusCode = "0";
        valObject.StatusDesc = "SUCCESS";
        return true;
    }

    internal bool IsValidBoolean(string p)
    {
        if (String.IsNullOrEmpty(p))
        {
            return false;
        }
        else if (p.ToUpper() == "TRUE" || p.ToUpper() == "FALSE")
        {
            return true;
        }

        return false;
    }

    internal bool IsValidAccountType(string accountType, string BankCode, List<string> AccountSignatories, out BaseObject valObj)
    {
        valObj = new BaseObject();
        AccountType accType = dh.GetAccountTypeById(accountType, BankCode);
        if (accType.StatusCode == "0")
        {
            if (accType.IsActive.ToUpper() == "FALSE")
            {
                valObj.StatusCode = "100";
                valObj.StatusDesc = "FAILED: ACCOUNT TYPE [" + accountType + "] IS NOT ACTIVATED.";
                return false;
            }
            else
            {
                return true;
            }
            ////account must have less signatories(Owners) than those specified by the account type
            //if (AccountSignatories.Count >= accType.MinNumberOfSignatories && AccountSignatories.Count <= accType.MaxNumberOfSignatories)
            //{
            //    valObj = accType;
            //    return true;
            //}
            //else
            //{
            //    valObj.StatusCode = "100";
            //    valObj.StatusDesc = "THIS ACCOUNT REQUIRES AT LEAST " + accType.MinNumberOfSignatories +
            //                        " SIGNATORIES AND " + accType.MaxNumberOfSignatories + " MAXIMUM";
            //    return false;
            //}
        }
        else
        {
            valObj = accType;
            return false;
        }
    }

    internal bool IsValidInterestType(string interestType, string BankCode, out BaseObject valObj)
    {
        valObj = new BaseObject();
        InterestRateType type = dh.GetInterestTypeById(interestType, BankCode);
        if (type.StatusCode == "0")
        {
            valObj = type;
            return true;
        }
        else
        {
            valObj = type;
            return false;
        }
    }


    internal bool IsNumeric(string Amount)
    {
        try
        {
            int amount = int.Parse(Amount.Split('.')[0]);
            return true;
        }
        catch (Exception)
        {
            return false;
        }
    }


    internal bool IsNumericAndAboveZero(string Amount)
    {
        try
        {

            Int64 amount = Int64.Parse(Amount.Split('.')[0]);
            if (amount <= 0)
            {
                return false;
            }
            else
            {
                return true;
            }
        }
        catch (Exception ex)
        {
            return false;
        }
    }

    internal bool IsValidGender(string Gender)
    {
        if (string.IsNullOrEmpty(Gender))
        {
            return false;
        }
        else if (Gender.ToUpper() == "MALE" || Gender.ToUpper() == "FEMALE")
        {
            return true;
        }
        else if (Gender.ToUpper() == "N/A")
        {
            return true;
        }
        return false;
    }

    public List<BankCustomer> GetAccountSignatories(string accountNumber, string bankCode, string Password)
    {
        List<BankCustomer> all = new List<BankCustomer>();
        DataTable dt = dh.GetAccountSignatories(accountNumber, bankCode);
        foreach (DataRow dr in dt.Rows)
        {
            BankCustomer cust = new BankCustomer();
            cust.BankCode = dr["BankCode"].ToString();
            cust.BranchCode = dr["BranchCode"].ToString();
            cust.ApprovedBy = dr["ApprovedBy"].ToString();
            cust.DateOfBirth = dr["DateOfBirth"].ToString();
            cust.Email = dr["Email"].ToString();
            cust.FirstName = dr["FirstName"].ToString();
            cust.LastName = dr["LastName"].ToString();
            cust.OtherName = dr["OtherName"].ToString();
            cust.Gender = dr["Gender"].ToString();
            cust.Id = dr["CustomerId"].ToString();
            cust.ModifiedBy = dr["ModifiedBy"].ToString();
            cust.PathToProfilePic = dr["PathToProfilePic"].ToString();
            cust.PathToSignature = dr["PathToSignature"].ToString();
            cust.PhoneNumber = dr["PhoneNumber"].ToString();
            all.Add(cust);
        }
        return all;
    }

    public Result SaveCurrencyDetails(Currency currency, string BankCode)
    {
        Result result = new Result();
        result.RequestId = currency.CurrencyCode;
        LogChangesInAuditLog(currency, currency.CurrencyCode, currency.BankCode, currency.ModifiedBy);
        string Id = dh.SaveCurrencyDetails(currency);
        result.StatusCode = "0";
        result.StatusDesc = "SUCCESS";
        result.PegPayId = Id;
        return result;
    }


    internal bool IsValidCurrencyCode(string CurrencyCode, string BankCode, out BaseObject valObj)
    {
        valObj = new BaseObject();
        Currency code = dh.GetCurrencyCodeById(CurrencyCode, BankCode);
        if (code.StatusCode == "0")
        {
            valObj = code;
            return true;
        }
        else
        {
            valObj.StatusCode = "100";
            valObj.StatusDesc = code.StatusDesc;
            return false;
        }
    }

    internal bool IsValidPaymentType(string type, string BankCode, out BaseObject valObj)
    {
        valObj = new BaseObject();
        PaymentType result = dh.GetPaymentTypeById(type, BankCode);
        if (result.StatusCode == "0")
        {
            valObj = result;
            return true;
        }
        else
        {
            valObj.StatusCode = "100";
            valObj.StatusDesc = result.StatusDesc;
            return false;
        }
    }

    public Result SavePaymentType(PaymentType type, string BankCode)
    {
        Result result = new Result();
        result.RequestId = type.PaymentTypeCode;
        LogChangesInAuditLog(type, type.PaymentTypeCode, type.BankCode, type.ModifiedBy);
        string Id = dh.SavePaymentType(type);
        result.StatusCode = "0";
        result.StatusDesc = "SUCCESS";
        result.PegPayId = Id;
        return result;
    }

    public bool IsValidEmail(string email)
    {
        try
        {
            if (email == "N/A") { return true; }
            System.Net.Mail.MailAddress addr = new System.Net.Mail.MailAddress(email);
            return addr.Address == email;
        }
        catch
        {
            return false;
        }
    }

    public bool IsValidTelephone(ref string telephone, out BaseObject valObj)
    {
        valObj = new BaseObject();
        if (telephone == null || telephone == "N/A" || telephone == "")
        {
            return true;
        }
        if (telephone.StartsWith("0"))
        {
            telephone = "256" + telephone.Substring(1);
        }
        if (telephone.Length < 12)
        {
            valObj.StatusCode = "100";
            valObj.StatusDesc = "FAILED: PHONE NUMBER IS INCOMPLETE. FEW DIGITS";
            return false;
        }
        if (telephone.Length > 12)
        {
            valObj.StatusCode = "100";
            valObj.StatusDesc = "FAILED: PHONE NUMBER HAS TOO MANY DIGITS";
            return false;
        }
        if (!IsNumericAndAboveZero(telephone))
        {
            valObj.StatusCode = "100";
            valObj.StatusDesc = "FAILED: PHONE NUMBER HAS INVALID CHARACTERS. ALLOWED CHARACTERS ARE [0-9]";
            return false;
        }


        return true;
    }

    public string GetPegPayId(string statusDesc)
    {
        try
        {
            string[] parts = statusDesc.Split('=');
            return parts[1];
        }
        catch (Exception)
        {
            return "";
        }
    }

    public Result SaveCollateralDetails(Collateral collateral)
    {
        Result result = new Result();
        LogChangesInAuditLog(collateral, collateral.CollateralID, collateral.BankCode, collateral.ModifiedBy);
        string InsertID = dh.SaveCollateral(collateral);
        result.PegPayId = InsertID;
        result.StatusCode = "0";
        result.StatusDesc = "SUCCESS";
        return result;
    }

    public Result SaveLoanRequestDetails(LoanRequest request, string BankCode)
    {
        Result result = new Result();
        LogChangesInAuditLog(request, request.LoanID, request.BankCode, request.ModifiedBy);
        string InsertID = dh.SaveLoanRequest(request);
        result.PegPayId = InsertID;
        result.StatusCode = "0";
        result.StatusDesc = "SUCCESS";
        return result;
    }

    public Result SaveLoanTypeDetails(LoanType type, string BankCode)
    {
        Result result = new Result();
        LogChangesInAuditLog(type, type.LoanTypeCode, type.BankCode, type.ModifiedBy);
        string InsertID = dh.SaveLoanType(type);
        result.PegPayId = InsertID;
        result.StatusCode = "0";
        result.StatusDesc = "SUCCESS";
        return result;
    }

    public Result SaveCollateralTypeDetails(CollateralType type, string BankCode)
    {
        Result result = new Result();
        LogChangesInAuditLog(type, type.CollateralTypeCode, type.BankCode, type.ModifiedBy);
        string InsertID = dh.SaveCollateralType(type);
        result.PegPayId = InsertID;
        result.StatusCode = "0";
        result.StatusDesc = "SUCCESS";
        return result;
    }

    //internal bool IsValidAccountOperation(string AccountNumber, string BankCode,string OperationType, out BaseObject valObj)
    //{
    //    valObj = new BaseObject();
    //    BankAccount account = dh.GetBankAccountById(AccountNumber, BankCode);

    //    if (account.StatusCode == "0")
    //    {
    //        if (account.AccountType == "LOAN_ACCOUNT") 
    //        {

    //        }
    //        else
    //        {
    //            valObj.StatusCode = "0";
    //            valObj.StatusDesc = "SUCCESS";
    //            return true;
    //        }
    //    }
    //    else
    //    {
    //        valObj = account;
    //        return false;
    //    }
    //}

    internal bool IsValidAccountOperation(string AccountNumber, string BankCode, out BaseObject valObj)
    {
        valObj = new BaseObject();
        BankAccount account = dh.GetBankAccountById2(AccountNumber, BankCode);

        if (account.StatusCode == "0")
        {
            if (account.IsActive.ToUpper() == "FALSE")
            {
                valObj.StatusCode = "100";
                valObj.StatusDesc = "FAILED: ACCOUNT WITH ACCOUNTNUMBER [" + AccountNumber + "] IS NOT ACTIVATED";
                return false;
            }
            else if (account.AccountType.ToUpper() == "LOAN_ACCOUNT")
            {
                valObj.StatusCode = "100";
                valObj.StatusDesc = "FAILED: WITHDRAWS ARE NOT ALLOWED ON LOAN ACCOUNT WITH ACCOUNTNUMBER [" + AccountNumber + "] ";
                return false;
            }
            else if (account.AccountType.ToUpper() == "FIXED_DEPOSIT")
            {
                valObj.StatusCode = "100";
                valObj.StatusDesc = "FAILED: WITHDRAWS ARE NOT ALLOWED ON FIXED DEPOSIT ACCOUNT WITH ACCOUNTNUMBER [" + AccountNumber + "]. IF CUSTOMER WISHES TO BREAK HIS FIXED DEPOSIT TERM, PLEASE USE PAYOUT FIXED DEPOSIT OPTION. ";
                return false;
            }
            else if (string.IsNullOrEmpty(account.ApprovedBy))
            {
                valObj.StatusCode = "100";
                valObj.StatusDesc = "FAILED: ACCOUNT WITH ACCOUNTNUMBER [" + AccountNumber + "] HAS NOT YET BEEN APPROVED";
                return false;
            }
            else
            {
                valObj.StatusCode = "0";
                valObj.StatusDesc = "SUCCESS";
                return true;
            }
        }
        else
        {
            valObj = account;
            return false;
        }
    }

    public Result SaveUtilityDetails(Utility utility, string BankCode)
    {
        Result result = new Result();
        result.RequestId = utility.UtilityCode;
        LogChangesInAuditLog(utility, utility.UtilityCode, utility.BankCode, utility.ModifiedBy);
        string Id = dh.SaveUtilityDetails(utility);
        result.StatusCode = "0";
        result.StatusDesc = "SUCCESS";
        result.PegPayId = Id;
        return result;
    }

    internal bool ViolatesBranchTransactionLimits(BankUser user, out BaseObject valObj)
    {
        string userType = user.Usertype.ToUpper();
        valObj = new BaseObject();
        if (userType == "TELLER" || userType == "SUPERVISOR")
        {
            double tranLimit = double.Parse(user.TransactionLimit);
            BankBranch branch = dh.GetBankBranchById(user.BranchCode, user.BankCode);
            if (branch.StatusCode == "0")
            {
                if (userType == "TELLER")
                {
                    double tellerLimit = double.Parse(branch.BranchTellerLimit);
                    if (tranLimit > tellerLimit)
                    {
                        valObj.StatusCode = "100";
                        valObj.StatusDesc = "FAILED: THE TELLER TRANSACTION LIMIT [" + tranLimit + "] YOU HAVE SET EXCEEDS THE BRANCH TELLER LIMIT [" + tellerLimit + "]";
                        return true;
                    }
                    else
                    {
                        return false;
                    }
                }
                else if (userType == "SUPERVISOR")
                {
                    double supervisorLimit = double.Parse(branch.BranchSupervisorLimit);
                    if (tranLimit > supervisorLimit)
                    {
                        valObj.StatusCode = "100";
                        valObj.StatusDesc = "FAILED: THE SUPERVISOR TRANSACTION LIMIT [" + tranLimit + "] YOU HAVE SET EXCEEDS THE BRANCH SUPERVISOR LIMIT [" + supervisorLimit + "]";
                        return true;
                    }
                    else
                    {
                        return false;
                    }
                }
                else
                {
                    return false;
                }
            }
            //we cant find the branch
            else
            {
                throw new Exception(branch.StatusDesc);
            }
        }
        else
        {
            return false;
        }
    }

    public Result SaveBeneficiaryDetails(Beneficiary type, string BankCode)
    {
        Result result = new Result();
        result.RequestId = type.BeneficiaryAccountNumber;
        LogChangesInAuditLog(type, type.BeneficiaryAccountNumber, type.BankCode, type.ModifiedBy);
        string Id = dh.SaveBeneficiaryDetails(type);
        result.StatusCode = "0";
        result.StatusDesc = "SUCCESS";
        result.PegPayId = Id;
        return result;
    }

    public Result SaveGuarantorDetails(Guarantor guarantor, string BankCode)
    {
        Result result = new Result();
        result.RequestId = guarantor.GuarantorRefNumber;
        LogChangesInAuditLog(guarantor, guarantor.GuarantorRefNumber, guarantor.BankCode, guarantor.ModifiedBy);
        string Id = dh.SaveGuarantorDetails(guarantor);
        result.StatusCode = "0";
        result.StatusDesc = "SUCCESS";
        result.PegPayId = Id;
        return result;
    }

    public Result SaveGuarantorTypeDetails(GuarantorType type, string BankCode)
    {
        Result result = new Result();
        result.RequestId = type.GurantorTypeCode;
        LogChangesInAuditLog(type, type.GurantorTypeCode, type.BankCode, type.ModifiedBy);
        string Id = dh.SaveGuarantorTypeDetails(type);
        result.StatusCode = "0";
        result.StatusDesc = "SUCCESS";
        result.PegPayId = Id;
        return result;
    }

    public bool IsValidGroup(GroupMember[] members, string BankCode, string Password, out BaseObject valObj)
    {
        valObj = new BaseObject();
        if (members.Length < 2)
        {
            valObj.StatusCode = "100";
            valObj.StatusDesc = "FAILED: PLEASE SUPPLY ATLEAST 2 GROUP MEMBERS";
            return false;
        }
        string loanID = members[0].LoanID;
        LoanRequest request = dh.GetLoanRequestById(loanID, BankCode);
        if (request.StatusCode == "0")
        {
            double LoanAmount = double.Parse(request.LoanAmout);
            double total = 0;
            foreach (GroupMember member in members)
            {
                if (member.IsValid(BankCode, Password))
                {
                    double memberAmount = double.Parse(member.Amount);
                    total += memberAmount;
                }
                else
                {
                    valObj.StatusCode = "100";
                    valObj.StatusDesc = member.StatusDesc;
                    return false;
                }
            }

            if (total != LoanAmount)
            {
                valObj.StatusCode = "100";
                valObj.StatusDesc = "FAILED: THE TOTAL AMOUNT [" + total + "] GIVEN TO EACH MEMBER DOES NOT EQUAL ORIGINAL LOAN AMOUNT[" + LoanAmount + "]";
                return false;
            }
        }
        else
        {
            valObj.StatusCode = "100";
            valObj.StatusDesc = request.StatusDesc;
            return false;
        }

        return true;
    }

    public Result SaveGroupDetails(GroupMember[] members)
    {
        Result result = new Result();
        foreach (GroupMember member in members)
        {
            result = SaveGroupMember(member);
        }
        return result;
    }

    public Result SaveGroupMember(GroupMember member)
    {
        Result result = new Result();
        result.RequestId = member.GroupID;
        LogChangesInAuditLog(member, member.GroupID, member.BankCode, member.ModifiedBy);
        string Id = dh.SaveGroupMember(member);
        result.StatusCode = "0";
        result.StatusDesc = "SUCCESS";
        result.PegPayId = Id;
        return result;
    }

    public Result SaveRepaymentFrequency(PaymentFrequency freq)
    {
        Result result = new Result();
        result.RequestId = freq.RepaymentFreqCode;
        LogChangesInAuditLog(freq, freq.RepaymentFreqCode, freq.BankCode, freq.ModifiedBy);
        string Id = dh.SaveRepaymentFrequency(freq);
        result.StatusCode = "0";
        result.StatusDesc = "SUCCESS";
        result.PegPayId = Id;
        return result;
    }

    public Result SaveReportDetails(Report report)
    {
        Result result = new Result();
        result.StatusCode = "0";
        result.StatusDesc = "SUCCESS";
        result.PegPayId = "1234";
        result.RequestId = report.ReportType;
        return result;
    }

    internal bool IsValidLoanID(string BankCode, string LoanID, out BaseObject valObj)
    {
        valObj = new BaseObject();
        LoanRequest req = dh.GetLoanRequestById(LoanID, BankCode);
        if (req.StatusCode == "0")
        {
            valObj.StatusCode = "0";
            valObj.StatusDesc = "SUCCESS";
            return true;
        }
        else
        {
            valObj.StatusCode = req.StatusCode;
            valObj.StatusDesc = req.StatusDesc;
            return false;
        }
    }

    internal bool IsValidLoanType(string loanType, string BankCode, out BaseObject valObj)
    {
        valObj = new BaseObject();
        LoanType type = dh.GetLoanTypeById(loanType, BankCode);
        if (type.StatusCode == "0")
        {
            return true;
        }
        else
        {
            valObj.StatusCode = type.StatusCode;
            valObj.StatusDesc = type.StatusDesc;
            return false;
        }
    }

    internal bool IsValidInterestRateType(string InterestType, string BankCode, out BaseObject valObj)
    {
        valObj = new BaseObject();
        InterestRateType type = dh.GetInterestTypeById(InterestType, BankCode);
        if (type.StatusCode == "0")
        {
            return true;
        }
        else
        {
            valObj.StatusCode = type.StatusCode;
            valObj.StatusDesc = type.StatusDesc;
            return false;
        }
    }


    internal bool IsValidPaymentFrequency(string Frequency, string BankCode, out BaseObject valObj)
    {
        valObj = new BaseObject();
        PaymentFrequency type = dh.GetPaymentFrequencyById(Frequency, BankCode);
        if (type.StatusCode == "0")
        {
            return true;
        }
        else
        {
            valObj.StatusCode = type.StatusCode;
            valObj.StatusDesc = type.StatusDesc;
            return false;
        }
    }

    internal bool IsValidDigitalSignature(TransactionRequest trans)
    {
        bool IsValid = false;
        //try
        //{
        //    DatabaseHandler dp = new DatabaseHandler();

        //    //still debating what parameters to sign
        //    string text = trans.FromAccount +
        //                  trans.ToAccount +
        //                  trans.CustomerName +
        //                  trans.CustomerTel +
        //                  trans.BankTranId +
        //                  trans.BankCode +
        //                  trans.Password +
        //                  trans.PaymentDate +
        //                  trans.Teller +
        //                  trans.TranAmount +
        //                  trans.Narration +
        //                  trans.TranCategory;

        //    Bank bank = dp.GetBankById(trans.BankCode);
        //    string filePath = bank.PathToPublicKey;
        //    X509Certificate2 cert = new X509Certificate2(filePath);
        //    RSACryptoServiceProvider csp = (RSACryptoServiceProvider)cert.PublicKey.Key;
        //    SHA1Managed sha1 = new SHA1Managed();
        //    ASCIIEncoding encoding = new ASCIIEncoding();
        //    byte[] data = encoding.GetBytes(text);
        //    byte[] hash = sha1.ComputeHash(data);
        //    byte[] sig = Convert.FromBase64String(trans.DigitalSignature);
        //    IsValid = csp.VerifyHash(hash, CryptoConfig.MapNameToOID("SHA1"), sig);
        //}
        //catch (Exception ex)
        //{
        //    DatabaseHandler dp = new DatabaseHandler();
        //    dp.LogError(trans.BankTranId, trans.BankCode, "Error Validating Signature: " + ex.Message);
        //}
        //for now..testing purposes...has to change on production
        return true;
    }

    internal bool IsValidBankAccount(string BankAccount, string LiquidaionType, out BaseObject valObj)
    {
        valObj = new BaseObject();
        if (LiquidaionType == "NONE")
        {
            return true;
        }
        else
        {
            if (!BankAccount.Equals(""))
            {
                return true;
            }
            else
            {
                valObj.StatusCode = "100";
                valObj.StatusDesc = "BANK LIQUIDATION ACCOUNT NOT SUPPLIED";
                return false;
            }
        }
    }

    public BankAccount GetMerchantByCode(string MerchantCode, string bankCode, string Password)
    {
        try
        {
            BankAccount Account = new BankAccount();
            if (String.IsNullOrEmpty(MerchantCode))
            {
                Account.StatusCode = "100";
                Account.StatusDesc = "MERCHANT CODE NOT SUPPLIED";
            }
            else
            {
                Account = dh.GetMerchantDetails(MerchantCode);
            }
            return Account;
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    public BaseObject LogSmsToSend(string Phone, string Message, string Mask, string bankCode, string Password)
    {
        BaseObject res = new BaseObject();
        try
        {
            BaseObject valObj;
            if (IsValidTelephone(ref Phone, out valObj))
            {
                SMS sms = new SMS();
                sms.Phone = Phone;
                sms.Message = Message;
                sms.Reference = "USSD";
                sms.Sender = "PEGASUS";
                Random rand = new Random();
                int randnumber = rand.Next(1000000, 9999999);
                sms.VendorTranId = "MUSSD_" + randnumber.ToString() + "_" + Phone;
                sms.Mask = "PEGPAY";
                SendToSmsMSQ(sms);
                res.StatusCode = "0";
                res.StatusDesc = "SUCCESS";
            }
            else
            {
                res.StatusCode = valObj.StatusCode;
                res.StatusDesc = valObj.StatusDesc;
            }
            return res;

        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    private void SendToSmsMSQ(SMS sms)
    {
        try
        {
            MessageQueue smsqueue;
            if (MessageQueue.Exists(SmsQueuePath))
            {
                smsqueue = new MessageQueue(SmsQueuePath);
            }
            else
            {
                smsqueue = MessageQueue.Create(SmsQueuePath);
            }
            Message smsmsg = new Message(sms);
            smsmsg.Label = sms.VendorTranId;
            smsmsg.Recoverable = true;
            smsqueue.Send(smsmsg);
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    public Result LogEmailToSend(Email email, string bankCode, string Password)
    {
        Result res = new Result();
        try
        {
            if (IsValidSendEmailRequest(email, ref res))
            {
                dh.LogMailMessage(email);
                res.StatusCode = "0";
                res.StatusDesc = "SUCCESS";
            }
            return res;

        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    private bool IsValidSendEmailRequest(Email email, ref Result res)
    {
        if (string.IsNullOrEmpty(email.Address))
        {
            res.StatusCode = "100";
            res.StatusDesc = "SUPPLY THE RECEIPIENT'S ADDRESS";
            return false;
        }
        if (string.IsNullOrEmpty(email.ReceipientName))
        {
            res.StatusCode = "100";
            res.StatusDesc = "SUPPLY THE RECEIPIENT'S NAME";
            return false;
        }
        if (string.IsNullOrEmpty(email.Message))
        {
            res.StatusCode = "100";
            res.StatusDesc = "SUPPLY THE MESSAGE";
            return false;
        }
        if (string.IsNullOrEmpty(email.Subject))
        {
            res.StatusCode = "100";
            res.StatusDesc = "PROVIDE THE MAIL SUBJECT";
            return false;
        }
        if (string.IsNullOrEmpty(email.From))
        {
            res.StatusCode = "100";
            res.StatusDesc = "PROVIDE THE SENDING ENTITY NAME";
            return false;
        }
        if (!IsValidEmail(email.Address))
        {
            res.StatusCode = "100";
            res.StatusDesc = "INVALID EMAIL ADDRESS";
            return false;
        }
        return true;
    }

    internal bool IsMerchant(string customerId, string MerchantCode, string bankCode, out BankCustomer valObj)
    {
        valObj = new BankCustomer();
        try
        {
            if (String.IsNullOrEmpty(customerId))
            {
                valObj.StatusCode = "100";
                valObj.StatusDesc = "CUSTOMER ID NOT SUPPLIED";
                return false;
            }
            else
            {
                BankCustomer cust = dh.GetMerchant(MerchantCode, bankCode);
                if (cust.StatusCode == "0")
                {
                    if (cust.Id == customerId)
                    {
                        valObj = cust;
                        return true;
                    }
                    else
                    {
                        valObj = cust;
                        valObj.StatusCode = "100";
                        valObj.StatusDesc = "THIS CUSTOMER IS NOT THE ACCOUNT HOLDER";
                        return false;
                    }
                }
                else
                {
                    valObj = cust;
                    return false;
                }
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    internal bool IsValidAccountSignatory(string CustomerId, string AccountCode, string UserType, string BankCode, out BaseObject obj)
    {
        obj = new BaseObject();
        BankCustomer user = dh.GetCustomerAccount(CustomerId, BankCode);
        if (user.StatusCode == "0")
        {
            if (user.AccountCode == AccountCode && UserType == "CUSTOMER")
            {
                obj.StatusCode = "0";
                obj.StatusDesc = "SUCCESS";
                return true;
            }
            else
            {
                obj.StatusCode = "100";
                obj.StatusDesc = "FAILED: THE CUSTOMER [" + CustomerId + "] DOES NOT BELONG TO MERCHANT PROFILE[" + AccountCode + "]";
                return false;
            }
        }
        else
        {
            obj = user;
            return false;
        }
    }

    internal bool IsValidDevice(ref string deviceId, ref string simcard, string deviceType, out BaseObject valObj)
    {
        valObj = new BaseObject();
        PhoneValidator pv = new PhoneValidator();
        if (string.IsNullOrEmpty(deviceId))
        {
            valObj.StatusCode = "100";
            valObj.StatusDesc = "SUPPLY A DEVICE ID";
            return false;
        }
        else if (string.IsNullOrEmpty(deviceType))
        {
            valObj.StatusCode = "100";
            valObj.StatusDesc = "SUPPLY A DEVICE TYPE";
            return false;
        }
        else if (!IsValidDeviceType(deviceType))
        {
            valObj.StatusCode = "100";
            valObj.StatusDesc = "INVALID DEVICE TYPE";
            return false;
        }
        else if (deviceType.ToUpper().Equals("PHONE") && !pv.PhoneNumbersOk(deviceId))
        {
            valObj.StatusCode = "100";
            valObj.StatusDesc = "INVALID [PHONE] NUMBER";
            return false;
        }
        else if (string.IsNullOrEmpty(simcard) && deviceType.ToUpper().Equals("POS"))
        {
            valObj.StatusCode = "100";
            valObj.StatusDesc = "SUPPLY THE DEVICE SIMCARD NUMBER";
            return false;
        }
        else if (!pv.PhoneNumbersOk(simcard) && deviceType.ToUpper().Equals("POS"))
        {
            valObj.StatusCode = "100";
            valObj.StatusDesc = "INVALID [SIMCARD] NUMBER";
            return false;
        }
        else if (deviceType.ToUpper().Equals("POS") && !IsValidIMEI(deviceId))
        {
            valObj.StatusCode = "100";
            valObj.StatusDesc = "INVALID [IMEI] NUMBER";
            return false;
        }
        else
        {
            if (deviceType == "PHONE")
            {
                deviceId = PhoneValidator.GetIntlFormat(deviceId);
                simcard = PhoneValidator.GetIntlFormat(simcard);
            }
            valObj.StatusCode = "0";
            valObj.StatusDesc = "SUCCESS";
            return true;
        }
    }


    private bool IsValidDeviceType(string deviceType)
    {
        if (deviceType == "POS")
        {
            return true;
        }
        else if (deviceType == "PHONE")
        {
            return true;
        }
        else
        {
            return false;
        }
    }

    static bool IsValidIMEI(string imei)
    {
        //luhn algorithm:  a simple checksum formula used to validate a variety of identification numbers
        //1. Start from the right double every second digit.
        //2. Add the second digit if it gives double digit on multiply
        //3. Now add all number and modulus with 10 ,
        //If remaining present other than 0 minus with 10 result value 
        //is check digit otherwise 0 is check digit.

        int[] n = new int[imei.Length];
        for (int i = 0; i < imei.Length; i++)
        {
            n[i] = int.Parse(imei[i].ToString());
        }

        for (int i = 0; i < imei.Length - 1; i++)
        {
            if (i % 2 == 1)
            {
                n[i] = n[i] * 2;
            }
        }

        for (int i = 0; i < imei.Length - 1; i++)
        {
            if (i % 2 == 1)
            {
                if (n[i].ToString().Length > 1)
                    n[i] = int.Parse(n[i].ToString()[0].ToString()) + int.Parse(n[i].ToString()[1].ToString());
            }
        }

        int total = 0;
        for (int i = 0; i < imei.Length - 1; i++)
        {
            total += n[i];
        }

        int mod = total % 10;

        if (mod > 0)
        {
            mod = 10 - mod;
        }

        return (n[imei.Length - 1] == mod);
    }

    internal string GenerateTillCode(string accountCode, string bankCode)
    {
        try
        {
            double number = 0;
            string[] parameters = { bankCode, accountCode };
            DataSet ds = ExecuteDataSet("GetAllCustomerTills", parameters);
            DataTable dt = ds.Tables[0];
            if (dt.Rows.Count > 0)
            {
                string till = dt.Rows[0]["CustomerId"].ToString();
                number = Double.Parse(till);
                number = number + 1;
            }
            else
            {
                accountCode = accountCode + "01";
                number = Double.Parse(accountCode);
            }
            return number.ToString();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }


    internal bool IsAlreadyRegistered(string phone, string id, string classtype, out BaseObject valObj)
    {
        valObj = new BaseObject();
        try
        {
            string merchant = "";
            if (String.IsNullOrEmpty(phone))
            {
                valObj.StatusCode = "100";
                valObj.StatusDesc = "PLEASE SUPPLY A PHONE NUMBER";
                return false;
            }
            else
            {
                DataTable dt = new DataTable();
                string[] data = { phone };
                dt = dh.ExecuteDataSet("GetTillByPhone", data).Tables[0];

                if (dt.Rows.Count > 0)
                {
                    string tillcode = dt.Rows[0]["CustomerId"].ToString();
                    if (tillcode == id)
                    {
                        valObj.StatusCode = "0";
                        valObj.StatusDesc = "SUCCESS";
                        return true;
                    }
                    else
                    {
                        merchant = dt.Rows[0]["AccountName"].ToString();

                        valObj.StatusCode = "100";
                        valObj.StatusDesc = "The phone number is already attached to a till belonging to " + merchant;

                        return false;
                    }
                }
                else
                {
                    string[] values = { phone };
                    dt = dh.ExecuteDataSet("GetCustomerByPhone", values).Tables[0];

                    if (dt.Rows.Count > 0)
                    {
                        merchant = dt.Rows[0]["AccountName"].ToString();

                        valObj.StatusCode = "100";
                        valObj.StatusDesc = "The phone number is already attached to a merchant user belonging to " + merchant;

                        return false;
                    }
                    else
                    {
                        valObj.StatusCode = "0";
                        valObj.StatusDesc = "SUCCESS";
                        return true;
                    }
                }
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    //public Result SaveCustomerInvoiceDetails(CustomerInvoice invoice)
    //{
    //    Result result = new Result();
    //    LogChangesInAuditLog(invoice, invoice.InvoiceId, invoice.BankCode, invoice.ModifiedBy);
    //    string InsertID = dh.SaveInvoiceDetails(invoice);
    //    result.PegPayId = InsertID;
    //    result.StatusCode = "0";
    //    result.StatusDesc = "SUCCESS";
    //    return result;
    //}
}
