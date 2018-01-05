using System;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using CoreBankingLogic.EntityObjects;
using System.Collections.Generic;
using CoreBankingLogic.ExposedObjects;
using System.Runtime.Serialization;
using System.Data;
using CoreBankingLogic.ChannelControls;
using CoreBankingLogic.ChannelObjects;
using CoreBankingLogic.ExposedObjects.ChannelObjects;
using System.Net;

[WebService(Namespace = "http://pegasus.co.ug/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
public class Service : System.Web.Services.WebService
{

    Logger logger = new Logger();

    public Service()
    {

    }

    [WebMethod]
    public Result CreditVaultAccount(TransactionRequest tranRequest)
    {
        Result result = new Result();
        try
        {
            if (tranRequest.IsValidCreditBankVaultRequest())
            {
                BussinessLogic bll = new BussinessLogic();
                result = bll.Transact(tranRequest);
            }
            else
            {
                result.StatusCode = tranRequest.StatusCode;
                result.StatusDesc = tranRequest.StatusDesc;
            }
        }
        catch (Exception ex)
        {
            result.StatusCode = "100";
            result.StatusDesc = "FAILED: " + ex.Message;
            DatabaseHandler dh = new DatabaseHandler();
            dh.LogError(tranRequest.BankTranId, tranRequest.BankCode, result.StatusDesc);
        }
        return result;
    }

    [WebMethod]
    public Result PayOutLoan(LoanRequest tranRequest, string BankCode, string Password)
    {
        Result result = new Result();
        try
        {
            if (tranRequest.IsValidPayOutRequest(BankCode, Password))
            {
                BussinessLogic bll = new BussinessLogic();
                result = bll.PayOutLoan(tranRequest);
            }
            else
            {
                result.StatusCode = tranRequest.StatusCode;
                result.StatusDesc = tranRequest.StatusDesc;
            }
        }
        catch (Exception ex)
        {
            result.StatusCode = "100";
            result.StatusDesc = "FAILED: " + ex.Message;
            DatabaseHandler dh = new DatabaseHandler();
            dh.LogError(tranRequest.LoanID, tranRequest.BankCode, result.StatusDesc);
        }
        return result;
    }


    [WebMethod]
    public Result Transact(TransactionRequest tranRequest)
    {
        Result result = new Result();
        try
        {
            BussinessLogic bll = new BussinessLogic();
            if (tranRequest.IsValidTransactRequest())
            {
                result = bll.Transact(tranRequest);
            }
            else
            {
                result.StatusCode = tranRequest.StatusCode;
                result.StatusDesc = tranRequest.StatusDesc;
                result.PegPayId = bll.GetPegPayId(tranRequest.StatusDesc);
            }
        }
        catch (Exception ex)
        {
            result.StatusCode = "100";
            result.StatusDesc = "FAILED: " + ex.Message;
            DatabaseHandler dh = new DatabaseHandler();
            dh.LogError(tranRequest.BankTranId, tranRequest.BankCode, result.StatusDesc);
        }
        return result;
    }

    [WebMethod]
    public Result PayOutInterest(TransactionRequest tranRequest)
    {
        Result result = new Result();
        try
        {
            BussinessLogic bll = new BussinessLogic();
            if (tranRequest.IsValidTransactRequest())
            {
                result = bll.PayOutInterest(tranRequest);
            }
            else
            {
                result.StatusCode = tranRequest.StatusCode;
                result.StatusDesc = tranRequest.StatusDesc;
                result.PegPayId = bll.GetPegPayId(tranRequest.StatusDesc);
            }
        }
        catch (Exception ex)
        {
            result.StatusCode = "100";
            result.StatusDesc = "FAILED: " + ex.Message;
            DatabaseHandler dh = new DatabaseHandler();
            dh.LogError(tranRequest.BankTranId, tranRequest.BankCode, result.StatusDesc);
        }
        return result;
    }

    [WebMethod]
    public Result RepayLoan(LoanRepaymentRequest tranRequest)
    {
        Result result = new Result();
        try
        {
            BussinessLogic bll = new BussinessLogic();
            if (tranRequest.IsValidLoanRepaymentRequest())
            {

                result = bll.RepayLoan(tranRequest);
            }
            else
            {
                result.StatusCode = tranRequest.StatusCode;
                result.StatusDesc = tranRequest.StatusDesc;
                result.PegPayId = bll.GetPegPayId(tranRequest.StatusDesc);
            }
        }
        catch (Exception ex)
        {
            result.StatusCode = "100";
            result.StatusDesc = "FAILED: " + ex.Message;
            DatabaseHandler dh = new DatabaseHandler();
            dh.LogError(tranRequest.BankTranId, tranRequest.BankCode, result.StatusDesc);
        }
        return result;
    }

    [WebMethod]
    public Result ReverseTransaction(TransactionRequest tranRequest)
    {
        Result result = new Result();
        try
        {
            BussinessLogic bll = new BussinessLogic();
            if (tranRequest.IsValidReversal())
            {

                result = bll.ReverseTransaction(tranRequest);
            }
            else
            {
                result.StatusCode = tranRequest.StatusCode;
                result.StatusDesc = tranRequest.StatusDesc;
                result.PegPayId = tranRequest.Status;
            }
        }
        catch (Exception ex)
        {
            result.StatusCode = "100";
            result.StatusDesc = "FAILED: " + ex.Message;
            DatabaseHandler dh = new DatabaseHandler();
            dh.LogError(tranRequest.BankTranId, tranRequest.BankCode, result.StatusDesc);
        }
        return result;
    }


    [WebMethod]
    public BankAccountStatement GetMiniStatement(string AccountNumber, string BankCode, string Password)
    {
        BankAccountStatement statement = new BankAccountStatement();
        try
        {
            BussinessLogic bll = new BussinessLogic();
            statement = bll.GenerateStatement(AccountNumber, BankCode, Password, "MINI");
        }
        catch (Exception ex)
        {
            statement.StatusCode = "100";
            statement.StatusDesc = "FAILED: " + ex.Message;
            DatabaseHandler dh = new DatabaseHandler();
            dh.LogError(AccountNumber, BankCode, statement.StatusDesc);
        }
        return statement;
    }

    [WebMethod]
    public BankAccountStatement GetFullStatement(string AccountNumber, string BankCode, string Password)
    {
        BankAccountStatement statement = new BankAccountStatement();
        try
        {
            BussinessLogic bll = new BussinessLogic();
            statement = bll.GenerateStatement(AccountNumber, BankCode, Password, "FULL");
        }
        catch (Exception ex)
        {
            statement.StatusCode = "100";
            statement.StatusDesc = "FAILED: " + ex.Message;
            DatabaseHandler dh = new DatabaseHandler();
            dh.LogError(AccountNumber, BankCode, statement.StatusDesc);
        }
        return statement;
    }

    [WebMethod]
    public Result ValidateTransactionRequest(TransactionRequest tran, string BankCode, string Password)
    {
        Result result = new Result();
        try
        {
            if (tran.IsValidTransactRequest())
            {
                result.StatusCode = "0";
                result.StatusDesc = "SUCCESS";
            }
            else
            {
                result.StatusCode = tran.StatusCode;
                result.StatusDesc = tran.StatusDesc;
            }
        }
        catch (Exception ex)
        {
            result.StatusCode = "100";
            result.StatusDesc = "FAILED: " + ex.Message;
            DatabaseHandler dh = new DatabaseHandler();
            dh.LogError(tran.BankTranId, tran.BankCode, result.StatusDesc);
        }
        return result;
    }

    [WebMethod]
    public Result ValidateLoanRepaymentRequest(LoanRepaymentRequest tran, string BankCode, string Password)
    {
        Result result = new Result();
        try
        {
            if (tran.IsValidLoanRepaymentRequest())
            {
                result.StatusCode = "0";
                result.StatusDesc = "SUCCESS";
            }
            else
            {
                result.StatusCode = tran.StatusCode;
                result.StatusDesc = tran.StatusDesc;
            }
        }
        catch (Exception ex)
        {
            result.StatusCode = "100";
            result.StatusDesc = "FAILED: " + ex.Message;
            DatabaseHandler dh = new DatabaseHandler();
            dh.LogError(tran.BankTranId, tran.BankCode, result.StatusDesc);
        }
        return result;
    }

    [WebMethod]
    public Result SaveCollateralDetails(Collateral collateral, string BankCode, string Password)
    {
        Result result = new Result();
        try
        {
            if (collateral.IsValid(BankCode, Password))
            {
                BussinessLogic bll = new BussinessLogic();
                result = bll.SaveCollateralDetails(collateral);
            }
            else
            {
                result.StatusCode = collateral.StatusCode;
                result.StatusDesc = collateral.StatusDesc;
            }
        }
        catch (Exception ex)
        {
            result.StatusCode = "100";
            result.StatusDesc = "FAILED: " + ex.Message;
            DatabaseHandler dh = new DatabaseHandler();
            dh.LogError(collateral.CollateralID, collateral.BankCode, result.StatusDesc);
        }
        return result;
    }


    [WebMethod]
    public Result SaveBankAccountDetails(BankAccount account, string BankCode, string Password)
    {
        Result result = new Result();
        try
        {
            if (account.IsValidSaveCustomerAccountRequest(BankCode, Password))
            {
                BussinessLogic bll = new BussinessLogic();
                result = bll.SaveAccountDetails(account, BankCode);
            }
            else
            {
                result.StatusCode = account.StatusCode;
                result.StatusDesc = account.StatusDesc;
            }
        }
        catch (Exception ex)
        {
            result.StatusCode = "100";
            result.StatusDesc = "FAILED: " + ex.Message;
            DatabaseHandler dh = new DatabaseHandler();
            dh.LogError(account.AccountNumber, account.BankCode, result.StatusDesc);
        }
        return result;
    }

    [WebMethod]
    public Result SaveBankCommissionAccountDetails(BankCommissionAccount account, string BankCode, string Password)
    {
        Result result = new Result();
        try
        {
            if (account.IsValid(BankCode, Password))
            {
                BussinessLogic bll = new BussinessLogic();
                result = bll.SaveCommissionAccountDetails(account, BankCode);
            }
            else
            {
                result.StatusCode = account.StatusCode;
                result.StatusDesc = account.StatusDesc;
            }
        }
        catch (Exception ex)
        {
            result.StatusCode = "100";
            result.StatusDesc = "FAILED: " + ex.Message;
            DatabaseHandler dh = new DatabaseHandler();
            dh.LogError(account.AccountNumber, account.BankCode, result.StatusDesc);
        }
        return result;
    }

    [WebMethod]
    public Result SaveGuarantorDetails(Guarantor guarantor, string BankCode, string Password)
    {
        Result result = new Result();
        try
        {
            if (guarantor.IsValid(BankCode, Password))
            {
                BussinessLogic bll = new BussinessLogic();
                result = bll.SaveGuarantorDetails(guarantor, BankCode);
            }
            else
            {
                result.StatusCode = guarantor.StatusCode;
                result.StatusDesc = guarantor.StatusDesc;
            }
        }
        catch (Exception ex)
        {
            result.StatusCode = "100";
            result.StatusDesc = "FAILED: " + ex.Message;
            DatabaseHandler dh = new DatabaseHandler();
            dh.LogError(guarantor.GuarantorPhoneNumber, guarantor.BankCode, result.StatusDesc);
        }
        return result;
    }

    [WebMethod]
    public Result SaveGuarantorTypeDetails(GuarantorType type, string BankCode, string Password)
    {
        Result result = new Result();
        try
        {
            if (type.IsValid(BankCode, Password))
            {
                BussinessLogic bll = new BussinessLogic();
                result = bll.SaveGuarantorTypeDetails(type, BankCode);
            }
            else
            {
                result.StatusCode = type.StatusCode;
                result.StatusDesc = type.StatusDesc;
            }
        }
        catch (Exception ex)
        {
            result.StatusCode = "100";
            result.StatusDesc = "FAILED: " + ex.Message;
            DatabaseHandler dh = new DatabaseHandler();
            dh.LogError(type.GurantorTypeCode, type.BankCode, result.StatusDesc);
        }
        return result;
    }

    [WebMethod]
    public Result SaveBankTellerAccountDetails(BankAccount account, string BankCode, string Password)
    {
        Result result = new Result();
        try
        {
            if (account.IsValidSaveTellerAccountRequest(BankCode, Password))
            {
                BussinessLogic bll = new BussinessLogic();
                result = bll.SaveAccountDetails(account, BankCode);
            }
            else
            {
                result.StatusCode = account.StatusCode;
                result.StatusDesc = account.StatusDesc;
            }
        }
        catch (Exception ex)
        {
            result.StatusCode = "100";
            result.StatusDesc = "FAILED: " + ex.Message;
            DatabaseHandler dh = new DatabaseHandler();
            dh.LogError(account.AccountNumber, account.BankCode, result.StatusDesc);
        }
        return result;
    }

    [WebMethod]
    public Result SaveBankDetails(Bank bank, string adminUsername, string adminPassword)
    {
        Result result = new Result();
        try
        {
            if (bank.IsValidSaveBankRequest(adminUsername, adminPassword))
            {
                BussinessLogic bll = new BussinessLogic();
                result = bll.SaveBankDetails(bank);
            }
            else
            {
                result.StatusCode = bank.StatusCode;
                result.StatusDesc = bank.StatusDesc;
            }
        }
        catch (Exception ex)
        {
            result.StatusCode = "100";
            result.StatusDesc = "FAILED: " + ex.Message;
            DatabaseHandler dh = new DatabaseHandler();
            dh.LogError(bank.BankCode, bank.BankCode, result.StatusDesc);
        }
        return result;
    }

    //[WebMethod]
    //public Result SaveCustomerInvoiceDetails(CustomerInvoice invoice)
    //{
    //    Result result = new Result();
    //    try
    //    {
    //        if (invoice.IsValid())
    //        {
    //            BussinessLogic bll = new BussinessLogic();
    //            result = bll.SaveCustomerInvoiceDetails(invoice);
    //        }
    //        else
    //        {
    //            result.StatusCode = invoice.StatusCode;
    //            result.StatusDesc = invoice.StatusDesc;
    //        }
    //    }
    //    catch (Exception ex)
    //    {
    //        result.StatusCode = "100";
    //        result.StatusDesc = "FAILED: " + ex.Message;
    //        DatabaseHandler dh = new DatabaseHandler();
    //        dh.LogError(invoice.BankCode, invoice.BankCode, result.StatusDesc);
    //    }
    //    return result;
    //}

    [WebMethod]
    public Result SaveBankChargeDetails(BankCharge charge, string BankCode, string Password)
    {
        Result result = new Result();
        try
        {
            if (charge.IsValid(BankCode, Password))
            {
                BussinessLogic bll = new BussinessLogic();
                result = bll.SaveBankChargeDetails(charge, BankCode);
            }
            else
            {
                result.StatusCode = charge.StatusCode;
                result.StatusDesc = charge.StatusDesc;
            }
        }
        catch (Exception ex)
        {
            result.StatusCode = "100";
            result.StatusDesc = "FAILED: " + ex.Message;
            DatabaseHandler dh = new DatabaseHandler();
            dh.LogError(charge.ChargeCode, charge.BankCode, result.StatusDesc);
        }
        return result;
    }

    [WebMethod]
    public Result SaveMerchantCharges(MerchantCharge charge, string BankCode, string Password)
    {
        Result result = new Result();
        try
        {
            if (charge.IsValid(BankCode, Password))
            {
                BussinessLogic bll = new BussinessLogic();
                result = bll.SaveMerchantCharges(charge);
            }
            else
            {
                result.StatusCode = charge.StatusCode;
                result.StatusDesc = charge.StatusDesc;
            }
        }
        catch (Exception ex)
        {
            result.StatusCode = "100";
            result.StatusDesc = "FAILED: " + ex.Message;
            DatabaseHandler dh = new DatabaseHandler();
            dh.LogError(charge.ChargeCode, charge.BankCode, result.StatusDesc);
        }
        return result;
    }


    [WebMethod]
    public Result SaveAccessRule(AccessRule rule, string BankCode, string Password)
    {
        Result result = new Result();
        try
        {
            if (rule.IsValid(BankCode, Password))
            {
                BussinessLogic bll = new BussinessLogic();
                result = bll.SaveAccessRule(rule, BankCode);
            }
            else
            {
                result.StatusCode = rule.StatusCode;
                result.StatusDesc = rule.StatusDesc;
            }
        }
        catch (Exception ex)
        {
            result.StatusCode = "100";
            result.StatusDesc = "FAILED: " + ex.Message;
            DatabaseHandler dh = new DatabaseHandler();
            dh.LogError(rule.RuleName, rule.BankCode, result.StatusDesc);
        }
        return result;
    }

    [WebMethod]
    public Result SaveTransactionRule(TransactionRule rule, string BankCode, string Password)
    {
        Result result = new Result();
        try
        {
            if (rule.IsValid(BankCode, Password))
            {
                BussinessLogic bll = new BussinessLogic();
                result = bll.SaveTransactionRule(rule, BankCode);
            }
            else
            {
                result.StatusCode = rule.StatusCode;
                result.StatusDesc = rule.StatusDesc;
            }
        }
        catch (Exception ex)
        {
            result.StatusCode = "100";
            result.StatusDesc = "FAILED: " + ex.Message;
            DatabaseHandler dh = new DatabaseHandler();
            dh.LogError(rule.RuleCode, rule.BankCode, result.StatusDesc);
        }
        return result;
    }

    [WebMethod]
    public Result ValidateBankUserDetails(BankUser user, string BankCode, string Password)
    {
        Result result = new Result();
        try
        {
            if (user.IsValid(BankCode, Password))
            {
                result.StatusCode = Globals.SUCCESS_STATUS_CODE;
                result.StatusDesc = Globals.SUCCESS_TEXT;
            }
            else 
            {
                result.StatusCode = user.StatusCode;
                result.StatusDesc = user.StatusDesc;
            }
        }
        catch (Exception ex)
        {
            result.StatusCode = "100";
            result.StatusDesc = "FAILED: " + ex.Message;
            DatabaseHandler dh = new DatabaseHandler();
            dh.LogError(user.Id, user.BankCode, result.StatusDesc);
        }
        return result;
    }


    [WebMethod]
    public Result SaveBankUserDetails(BankUser user, string BankCode, string Password)
    {
        Result result = new Result();
        try
        {
            if (user.IsValid(BankCode, Password))
            {
                BussinessLogic bll = new BussinessLogic();
                result = bll.SaveBankUserDetails(user, BankCode);
            }
            else
            {
                result.StatusCode = user.StatusCode;
                result.StatusDesc = user.StatusDesc;
            }
        }
        catch (Exception ex)
        {
            result.StatusCode = "100";
            result.StatusDesc = "FAILED: " + ex.Message;
            DatabaseHandler dh = new DatabaseHandler();
            dh.LogError(user.Id, user.BankCode, result.StatusDesc);
        }
        return result;
    }

    [WebMethod]
    public Result SaveCurrencyDetails(Currency currency, string BankCode, string Password)
    {
        Result result = new Result();
        try
        {
            if (currency.IsValid(BankCode, Password))
            {
                BussinessLogic bll = new BussinessLogic();
                result = bll.SaveCurrencyDetails(currency, BankCode);
            }
            else
            {
                result.StatusCode = currency.StatusCode;
                result.StatusDesc = currency.StatusDesc;
            }
        }
        catch (Exception ex)
        {
            result.StatusCode = "100";
            result.StatusDesc = "FAILED: " + ex.Message;
            DatabaseHandler dh = new DatabaseHandler();
            dh.LogError(currency.CurrencyCode, currency.BankCode, result.StatusDesc);
        }
        return result;
    }

    [WebMethod]
    public MerchantChargeResponse GetMerchantChargesForTransaction(string BankCode, string TranAmount, string TranCategory,string PaymentChannel, string accountId, string accountIdType)
    {
        MerchantChargeResponse result = new MerchantChargeResponse();
        try
        {
            BussinessLogic bll = new BussinessLogic();
            result = bll.GetMerchantChargesForTransaction(BankCode, TranAmount, TranCategory,PaymentChannel, accountId, accountIdType);
        }
        catch (Exception ex)
        {
            result.StatusCode = Globals.FAILURE_STATUS_CODE;
            result.StatusDesc = "FAILED: " + ex.Message;
            DatabaseHandler dh = new DatabaseHandler();
            dh.LogError(accountId, BankCode, result.StatusDesc);
        }
        return result;
    }

    [WebMethod]
    public MerchantChargeResponse[] GetMerchantChargesForTransactionNew(string BankCode, string TranAmount, string TranCategory, string PaymentChannel, string accountId, string accountIdType)
    {
        List<MerchantChargeResponse> result = new List<MerchantChargeResponse>();
        try
        {
            BussinessLogic bll = new BussinessLogic();
            result = bll.GetMerchantChargesForTransactionNew(BankCode, TranAmount, TranCategory, PaymentChannel, accountId, accountIdType);
        }
        catch (Exception ex)
        {
            DatabaseHandler dh = new DatabaseHandler();
            dh.LogError(accountId, BankCode, ex.Message);
            throw ex;
        }
        return result.ToArray();
    }


    [WebMethod]
    public BaseObject GetById(string className, string objectId, string bankCode, string Password)
    {
        BaseObject result = new BaseObject();
        try
        {
            BussinessLogic bll = new BussinessLogic();
            result = bll.GetById(className, objectId, bankCode, Password);
        }
        catch (Exception ex)
        {
            result.StatusCode = "100";
            result.StatusDesc = "FAILED: " + ex.Message;
            DatabaseHandler dh = new DatabaseHandler();
            dh.LogError(objectId + "-" + className, bankCode, result.StatusDesc);
        }
        return result;
    }

    [WebMethod]
    public BankAccount GetMerchantDetailsByCode(string MerchantCode, string bankCode, string Password)
    {
        BankAccount result = new BankAccount();
        try
        {
            BussinessLogic bll = new BussinessLogic();
            result = bll.GetMerchantByCode(MerchantCode, bankCode, Password);
        }
        catch (Exception ex)
        {
            result.StatusCode = "100";
            result.StatusDesc = "FAILED: " + ex.Message;
            DatabaseHandler dh = new DatabaseHandler();
            dh.LogError(MerchantCode + "-" + "Merchant", bankCode, result.StatusDesc);
        }
        return result;
    }

    [WebMethod]
    public Result SendEmail(Email email, string bankCode, string Password)
    {
        Result result = new Result();
        try
        {
            BussinessLogic bll = new BussinessLogic();
            result = bll.LogEmailToSend(email, bankCode, Password);
        }
        catch (Exception ex)
        {
            result.StatusCode = "100";
            result.StatusDesc = "FAILED: " + ex.Message;
            DatabaseHandler dh = new DatabaseHandler();
            dh.LogError("" + "-" + "Merchant", bankCode, result.StatusDesc);
        }
        return result;
    }


    [WebMethod]
    public BaseObject SendSMS(string Phone, string Message, string Mask, string bankCode, string Password)
    {
        BaseObject result = new BaseObject();
        try
        {
            BussinessLogic bll = new BussinessLogic();
            result = bll.LogSmsToSend(Phone, Message, Mask, bankCode, Password);
        }
        catch (Exception ex)
        {
            result.StatusCode = "100";
            result.StatusDesc = "FAILED: " + ex.Message;
            DatabaseHandler dh = new DatabaseHandler();
            dh.LogError("" + "-" + "Merchant", bankCode, result.StatusDesc);
        }
        return result;
    }

    [WebMethod]
    public List<BankCustomer> GetAccountSignatories(string accountNumber, string bankCode, string Password)
    {
        List<BankCustomer> all = new List<BankCustomer>();
        try
        {
            BussinessLogic bll = new BussinessLogic();
            all = bll.GetAccountSignatories(accountNumber, bankCode, Password);
        }
        catch (Exception ex)
        {
            all = new List<BankCustomer>();
            DatabaseHandler dh = new DatabaseHandler();
            dh.LogError(accountNumber, bankCode, ex.Message);
        }
        return all;
    }

    [WebMethod]
    public BaseObject[] GetAll(string className, string bankCode, string Password)
    {
        BaseObject[] result = { };
        try
        {
            BussinessLogic bll = new BussinessLogic();
            result = bll.GetAll(className, bankCode, Password);
        }
        catch (Exception ex)
        {
            result = new BaseObject[] { };
            DatabaseHandler dh = new DatabaseHandler();
            dh.LogError(className, bankCode, ex.Message);
        }
        return result;
    }

    [WebMethod]
    public Result SaveBankTellerDetails(BankTeller teller, string BankCode, string Password)
    {
        Result result = new Result();
        try
        {
            if (teller.IsValidBankTeller(BankCode, Password))
            {
                BussinessLogic bll = new BussinessLogic();
                result = bll.SaveTellerDetails(teller, BankCode);
            }
            else
            {
                result.StatusCode = teller.StatusCode;
                result.StatusDesc = teller.StatusDesc;
            }
        }
        catch (Exception ex)
        {
            result.StatusCode = "100";
            result.StatusDesc = "FAILED : " + ex.Message;
            DatabaseHandler dh = new DatabaseHandler();
            dh.LogError(teller.Id, teller.BankCode, result.StatusDesc);
        }
        return result;
    }

    [WebMethod]
    public Result SaveBankBranchDetails(BankBranch branch, string BankCode, string Password)
    {
        Result result = new Result();
        try
        {
            if (branch.IsValid(BankCode, Password))
            {
                BussinessLogic bll = new BussinessLogic();
                result = bll.SaveBankBranchDetails(branch, BankCode);
            }
            else
            {
                result.StatusCode = branch.StatusCode;
                result.StatusDesc = branch.StatusDesc;
            }
        }
        catch (Exception ex)
        {
            result.StatusCode = "100";
            result.StatusDesc = "FAILED : " + ex.Message;
            DatabaseHandler dh = new DatabaseHandler();
            dh.LogError(branch.BankCode, branch.BankCode, result.StatusDesc);
        }
        return result;
    }



    [WebMethod]
    public Result SaveUserTypeDetails(UserType userType, string BankCode, string Password)
    {
        Result result = new Result();
        try
        {
            if (userType.IsValid(BankCode, Password))
            {
                BussinessLogic bll = new BussinessLogic();
                result = bll.SaveUserTypeDetails(userType, BankCode);
            }
            else
            {
                result.StatusCode = userType.StatusCode;
                result.StatusDesc = userType.StatusDesc;
            }
        }
        catch (Exception ex)
        {
            result.StatusCode = "100";
            result.StatusDesc = "FAILED : " + ex.Message;
            DatabaseHandler dh = new DatabaseHandler();
            dh.LogError(userType.UserTypeCode, userType.BankCode, result.StatusDesc);
        }
        return result;
    }

    [WebMethod]
    public Result SaveAccountTypeDetails(AccountType accountType, string BankCode, string Password)
    {
        Result result = new Result();
        try
        {
            if (accountType.IsValid(BankCode, Password))
            {
                BussinessLogic bll = new BussinessLogic();
                result = bll.SaveAccountTypeDetails(accountType, BankCode);
            }
            else
            {
                result.StatusCode = accountType.StatusCode;
                result.StatusDesc = accountType.StatusDesc;
            }
        }
        catch (Exception ex)
        {
            result.StatusCode = "100";
            result.StatusDesc = "FAILED : " + ex.Message;
            DatabaseHandler dh = new DatabaseHandler();
            dh.LogError(accountType.AccTypeCode, accountType.BankCode, result.StatusDesc);
        }
        return result;
    }

    [WebMethod]
    public Result SaveChargeTypeDetails(ChargeType chargeType, string BankCode, string Password)
    {
        Result result = new Result();
        try
        {
            if (chargeType.IsValid(BankCode, Password))
            {
                BussinessLogic bll = new BussinessLogic();
                result = bll.SaveChargeType(chargeType, BankCode);
            }
            else
            {
                result.StatusCode = chargeType.StatusCode;
                result.StatusDesc = chargeType.StatusDesc;
            }
        }
        catch (Exception ex)
        {
            result.StatusCode = "100";
            result.StatusDesc = "FAILED : " + ex.Message;
            DatabaseHandler dh = new DatabaseHandler();
            dh.LogError(chargeType.ChargeTypeCode, chargeType.BankCode, result.StatusDesc);
        }
        return result;
    }

    [WebMethod]
    public Result SaveGroupMemberDetails(GroupMember member, string BankCode, string Password)
    {
        Result result = new Result();
        try
        {
            if (member.IsValid(BankCode, Password))
            {
                BussinessLogic bll = new BussinessLogic();
                result = bll.SaveGroupMember(member);
            }
            else
            {
                result.StatusCode = member.StatusCode;
                result.StatusDesc = member.StatusDesc;
            }
        }
        catch (Exception ex)
        {
            result.StatusCode = "100";
            result.StatusDesc = "FAILED : " + ex.Message;
            DatabaseHandler dh = new DatabaseHandler();
            dh.LogError(member.CustomerID, member.BankCode, result.StatusDesc);
        }
        return result;
    }

    [WebMethod]
    public Result SaveGroupDetails(GroupMember[] members, string BankCode, string Password)
    {
        Result result = new Result();

        try
        {
            BaseObject valObj = new BaseObject();
            BussinessLogic bll = new BussinessLogic();
            if (bll.IsValidGroup(members, BankCode, Password, out valObj))
            {
                result = bll.SaveGroupDetails(members);
            }
            else
            {
                result.StatusCode = valObj.StatusCode;
                result.StatusDesc = valObj.StatusDesc;
            }
        }
        catch (Exception ex)
        {
            result.StatusCode = "100";
            result.StatusDesc = "FAILED : " + ex.Message;
            DatabaseHandler dh = new DatabaseHandler();
            dh.LogError("GROUP CREATION ERROR", BankCode, result.StatusDesc);
        }
        return result;
    }

    [WebMethod]
    public Result SaveReportDetails(Report report, string BankCode, string Password)
    {
        Result result = new Result();
        try
        {
            if (report.IsValid(BankCode, Password))
            {
                BussinessLogic bll = new BussinessLogic();
                result = bll.SaveReportDetails(report);
            }
            else
            {
                result.StatusCode = report.StatusCode;
                result.StatusDesc = report.StatusDesc;
            }
        }
        catch (Exception ex)
        {
            result.StatusCode = "100";
            result.StatusDesc = "FAILED : " + ex.Message;
            DatabaseHandler dh = new DatabaseHandler();
            dh.LogError(report.ReportName, report.BankCode, result.StatusDesc);
        }
        return result;
    }

    [WebMethod]
    public Result SaveSystemSetting(SystemSetting setting, string BankCode, string Password)
    {
        Result result = new Result();
        try
        {
            if (setting.IsValid(BankCode, Password))
            {
                BussinessLogic bll = new BussinessLogic();
                result = bll.SaveSystemSetting(setting);
            }
            else
            {
                result.StatusCode = setting.StatusCode;
                result.StatusDesc = setting.StatusDesc;
            }
        }
        catch (Exception ex)
        {
            result.StatusCode = "100";
            result.StatusDesc = "FAILED : " + ex.Message;
            DatabaseHandler dh = new DatabaseHandler();
            dh.LogError(setting.SettingCode, setting.BankCode, result.StatusDesc);
        }
        return result;
    }


    [WebMethod]
    public Result SaveTransactionCategoryDetails(TransactionCategory tranType, string BankCode, string Password)
    {
        Result result = new Result();
        try
        {
            if (tranType.IsValid(BankCode, Password))
            {
                BussinessLogic bll = new BussinessLogic();
                result = bll.SaveTranType(tranType, BankCode);
            }
            else
            {
                result.StatusCode = tranType.StatusCode;
                result.StatusDesc = tranType.StatusDesc;
            }
        }
        catch (Exception ex)
        {
            result.StatusCode = "100";
            result.StatusDesc = "FAILED: " + ex.Message;
            DatabaseHandler dh = new DatabaseHandler();
            dh.LogError(tranType.TranCategoryCode, tranType.BankCode, result.StatusDesc);
        }
        return result;
    }

    [WebMethod]
    public Result SavePaymentTypeDetails(PaymentType type, string BankCode, string Password)
    {
        Result result = new Result();
        try
        {
            if (type.IsValid(BankCode, Password))
            {
                BussinessLogic bll = new BussinessLogic();
                result = bll.SavePaymentType(type, BankCode);
            }
            else
            {
                result.StatusCode = type.StatusCode;
                result.StatusDesc = type.StatusDesc;
            }
        }
        catch (Exception ex)
        {
            result.StatusCode = "100";
            result.StatusDesc = "FAILED: " + ex.Message;
            DatabaseHandler dh = new DatabaseHandler();
            dh.LogError(type.PaymentTypeCode, type.BankCode, result.StatusDesc);
        }
        return result;
    }

    [WebMethod]
    public Result SaveRepaymentFrequencyDetails(PaymentFrequency type, string BankCode, string Password)
    {
        Result result = new Result();
        try
        {
            if (type.IsValid(BankCode, Password))
            {
                BussinessLogic bll = new BussinessLogic();
                result = bll.SaveRepaymentFrequency(type);
            }
            else
            {
                result.StatusCode = type.StatusCode;
                result.StatusDesc = type.StatusDesc;
            }
        }
        catch (Exception ex)
        {
            result.StatusCode = "100";
            result.StatusDesc = "FAILED: " + ex.Message;
            DatabaseHandler dh = new DatabaseHandler();
            dh.LogError(type.RepaymentFreqCode, type.BankCode, result.StatusDesc);
        }
        return result;
    }

    [WebMethod]
    public Result SaveBeneficiaryDetails(Beneficiary type, string BankCode, string Password)
    {
        Result result = new Result();
        try
        {
            if (type.IsValid(BankCode, Password))
            {
                BussinessLogic bll = new BussinessLogic();
                result = bll.SaveBeneficiaryDetails(type, BankCode);
            }
            else
            {
                result.StatusCode = type.StatusCode;
                result.StatusDesc = type.StatusDesc;
            }
        }
        catch (Exception ex)
        {
            result.StatusCode = "100";
            result.StatusDesc = "FAILED: " + ex.Message;
            DatabaseHandler dh = new DatabaseHandler();
            dh.LogError(type.BeneficiaryAccountNumber, type.BankCode, result.StatusDesc);
        }
        return result;
    }

    [WebMethod]
    public Result SaveUtilityDetails(Utility utility, string BankCode, string Password)
    {
        Result result = new Result();
        try
        {
            if (utility.IsValid(BankCode, Password))
            {
                BussinessLogic bll = new BussinessLogic();
                result = bll.SaveUtilityDetails(utility, BankCode);
            }
            else
            {
                result.StatusCode = utility.StatusCode;
                result.StatusDesc = utility.StatusDesc;
            }
        }
        catch (Exception ex)
        {
            result.StatusCode = "100";
            result.StatusDesc = "FAILED: " + ex.Message;
            DatabaseHandler dh = new DatabaseHandler();
            dh.LogError(utility.UtilityCode, utility.BankCode, result.StatusDesc);
        }
        return result;
    }

    [WebMethod]
    public Result SaveBankCustomerDetails(BankCustomer cust, string BankCode, string Password)
    {
        Result result = new Result();
        try
        {
            if (cust.IsValidNewCustomer(BankCode, Password))
            {
                BussinessLogic bll = new BussinessLogic();
                result = bll.SaveBankCustomerDetails(cust, BankCode);
            }
            else
            {
                result.StatusCode = cust.StatusCode;
                result.StatusDesc = cust.StatusDesc;
            }
        }
        catch (Exception ex)
        {
            result.StatusCode = "100";
            result.StatusDesc = "FAILED: " + ex.Message;
            DatabaseHandler dh = new DatabaseHandler();
            dh.LogError(cust.Id, cust.BankCode, result.StatusDesc);
        }
        return result;
    }

    [WebMethod]
    public Result SaveCustomerTerminal(CustomerTerminal cust, string BankCode, string Password)
    {
        Result result = new Result();
        try
        {
            if (cust.IsValidCustomerTerminal(BankCode, Password))
            {
                BussinessLogic bll = new BussinessLogic();
                result = bll.SaveCustomerTerminal(cust, BankCode);
            }
            else
            {
                result.StatusCode = cust.StatusCode;
                result.StatusDesc = cust.StatusDesc;
            }
        }
        catch (Exception ex)
        {
            result.StatusCode = "100";
            result.StatusDesc = "FAILED: " + ex.Message;
            DatabaseHandler dh = new DatabaseHandler();
            dh.LogError(cust.ModifiedBy, cust.BankCode, result.StatusDesc);
        }
        return result;
    }


    [WebMethod]
    public Result SaveLoanRequestDetails(LoanRequest request, string BankCode, string Password)
    {
        Result result = new Result();
        try
        {
            if (request.IsValidLoanRequest(BankCode, Password))
            {
                BussinessLogic bll = new BussinessLogic();
                result = bll.SaveLoanRequestDetails(request, BankCode);
            }
            else
            {
                result.StatusCode = request.StatusCode;
                result.StatusDesc = request.StatusDesc;
            }
        }
        catch (Exception ex)
        {
            result.StatusCode = "100";
            result.StatusDesc = "FAILED: " + ex.Message;
            DatabaseHandler dh = new DatabaseHandler();
            dh.LogError(request.LoanID, request.BankCode, result.StatusDesc);
        }
        return result;
    }

    [WebMethod]
    public Result SaveLoanTypeDetails(LoanType type, string BankCode, string Password)
    {
        Result result = new Result();
        try
        {
            if (type.IsValid(BankCode, Password))
            {
                BussinessLogic bll = new BussinessLogic();
                result = bll.SaveLoanTypeDetails(type, BankCode);
            }
            else
            {
                result.StatusCode = type.StatusCode;
                result.StatusDesc = type.StatusDesc;
            }
        }
        catch (Exception ex)
        {
            result.StatusCode = "100";
            result.StatusDesc = "FAILED: " + ex.Message;
            DatabaseHandler dh = new DatabaseHandler();
            dh.LogError(type.LoanTypeCode, type.BankCode, result.StatusDesc);
        }
        return result;
    }

    [WebMethod]
    public Result SaveCollateralTypeDetails(CollateralType type, string BankCode, string Password)
    {
        Result result = new Result();
        try
        {
            if (type.IsValid(BankCode, Password))
            {
                BussinessLogic bll = new BussinessLogic();
                result = bll.SaveCollateralTypeDetails(type, BankCode);
            }
            else
            {
                result.StatusCode = type.StatusCode;
                result.StatusDesc = type.StatusDesc;
            }
        }
        catch (Exception ex)
        {
            result.StatusCode = "100";
            result.StatusDesc = "FAILED: " + ex.Message;
            DatabaseHandler dh = new DatabaseHandler();
            dh.LogError(type.CollateralTypeCode, type.BankCode, result.StatusDesc);
        }
        return result;
    }

    [WebMethod]
    public Result SaveCustomerTypeDetails(CustomerType custType, string BankCode, string Password)
    {
        Result result = new Result();
        try
        {
            if (custType.IsValid(BankCode, Password))
            {
                BussinessLogic bll = new BussinessLogic();
                result = bll.SaveCustomerTypeDetails(custType, BankCode);
            }
            else
            {
                result.StatusCode = custType.StatusCode;
                result.StatusDesc = custType.StatusDesc;
            }
        }
        catch (Exception ex)
        {
            result.StatusCode = "100";
            result.StatusDesc = "FAILED: " + ex.Message;
            DatabaseHandler dh = new DatabaseHandler();
            dh.LogError(custType.UserTypeCode, custType.BankCode, result.StatusDesc);
        }
        return result;
    }

    [WebMethod]
    public Result ExecuteNonQuery(string storedProcedureName, params string[] Parameters)
    {

        Result result = new Result();
        try
        {
            BussinessLogic bll = new BussinessLogic();
            result = bll.ExecuteNonQuery(storedProcedureName, Parameters);
        }
        catch (Exception e)
        {
            DatabaseHandler dh = new DatabaseHandler();
            dh.LogError(storedProcedureName, "ALL", e.Message);

            //transmit the exception back to the client
            throw new SoapException(e.Message, new System.Xml.XmlQualifiedName(e.Message), e);
        }
        return result;
    }


    [WebMethod]
    public DataSet ExecuteDataSet(string storedProcedureName, params string[] Parameters)
    {

        DataSet dataSet = new DataSet();
        try
        {
            BussinessLogic bll = new BussinessLogic();
            dataSet = bll.ExecuteDataSet(storedProcedureName, Parameters);
            return dataSet;
        }
        catch (Exception e)
        {
            DatabaseHandler dh = new DatabaseHandler();
            dh.LogError(storedProcedureName, "ALL", e.Message);

            throw new SoapException(e.Message, new System.Xml.XmlQualifiedName(e.Message), e);
        }
    }

    [WebMethod]
    public PostResponse ChangePin(Customer customer)
    {
        PostResponse resp = new PostResponse();
        ChannelLogic bll = new ChannelLogic(customer.RequestAgent, customer.Channel);
        Logger logger = new Logger();

        try
        {

            if (bll.IsValidPinChangeRequest(customer))
            {
                resp = bll.ChangePin(customer);
            }
            else
            {
                resp.StatusCode = bll.StatusCode;
                resp.StatusDesc = bll.StatusDesc;
            }
        }
        catch (WebException webex)
        {
            resp.StatusCode = "100";
            resp.StatusDesc = "UNABLE TO COMPLETE COMMUNICATION" + webex.Message;
            logger.LogSystemError(customer.Channel, webex.Message, bll.RequestAgent, "ChangePin", customer.MerchantId);
        }
        catch (Exception ee)
        {
            resp.StatusCode = "100";
            resp.StatusDesc = "FAILED TO CHANGE PIN. PLEASE TRY AGAIN LATER";
            logger.LogSystemError(customer.Channel, ee.Message, bll.RequestAgent, "ChangePin", customer.MerchantId);
        }
        return resp;
    }

    [WebMethod]
    public PostResponse GetAvailableBouquets(SearchFilters filter)
    {
        PostResponse resp = new PostResponse();
        ChannelLogic bll = new ChannelLogic(filter.RequestAgent, filter.Channel);
        try
        {
            if (filter.isValidUtilitySearch())
            {
                string request = getRowxml();
                bll.LogXmlRequest(filter.RequestAgent, filter.Channel, "GetAvailableBouquets", request);

                resp = bll.GetAvailableBouquets(filter);
            }
            else
            {
                resp.StatusCode = filter.StatusCode;
                resp.StatusDesc = filter.StatusDesc;
            }
        }
        catch (WebException webex)
        {
            resp.StatusCode = "100";
            resp.StatusDesc = "UNABLE TO COMPLETE COMMUNICATION" + webex.Message;
            logger.LogSystemError(filter.Channel, webex.Message, filter.RequestAgent, "GetAvailableBouquets", filter.MerchantId);
        }
        catch (Exception ee)
        {
            resp.StatusCode = "100";
            resp.StatusDesc = "SYSTEM HAS ENCOUNTERED AN ERROR";
            logger.LogSystemError(filter.Channel, ee.Message, bll.RequestAgent, "GetAvailableBouquets", filter.MerchantId);

        }
        return resp;
    }

    private string getRowxml()
    {
        throw new Exception("The method or operation is not implemented.");
    }

    [WebMethod]
    public PostResponse GetMerchantCustomer(SearchFilters filter)
    {
        PostResponse resp = new PostResponse();
        ChannelLogic bll = new ChannelLogic(filter.RequestAgent, filter.Channel);
        try
        {
            if (filter.IsValidSearchTransaction())
            {
                resp = bll.GetMerchantCustomer(filter);
            }
            else
            {
                resp.StatusCode = filter.StatusCode;
                resp.StatusDesc = filter.StatusDesc;
            }
        }
        catch (WebException webex)
        {
            resp.StatusCode = "100";
            resp.StatusDesc = "UNABLE TO COMPLETE COMMUNICATION" + webex.Message;
            logger.LogSystemError(filter.Channel, webex.Message, filter.RequestAgent, "GetMerchantDetails", filter.MerchantId);
        }
        catch (Exception ee)
        {
            resp.StatusCode = "100";
            resp.StatusDesc = "FAILURE: " + ee.Message;
            logger.LogSystemError(filter.Channel, ee.Message, filter.RequestAgent, "GetMerchantDetails", filter.MerchantId);
        }
        return resp;
    }

    [WebMethod]
    public PostResponse GetMerchantDetails(SearchFilters filter)
    {
        PostResponse resp = new PostResponse();
        ChannelLogic blogic = new ChannelLogic(filter.RequestAgent, filter.Channel);

        try
        {
            if (filter.IsValidSearchTransaction())
            {
                resp = blogic.GetMerchantDetails(filter.ReferenceId);
            }
            else
            {
                resp.StatusCode = filter.StatusCode;
                resp.StatusDesc = filter.StatusDesc;
            }
        }
        catch (WebException webex)
        {
            resp.StatusCode = "100";
            resp.StatusDesc = "UNABLE TO COMPLETE COMMUNICATION" + webex.Message;
            logger.LogSystemError(filter.Channel, webex.Message, filter.RequestAgent, "GetMerchantDetails", filter.MerchantId);
        }
        catch (Exception ee)
        {
            resp.StatusCode = "100";
            resp.StatusDesc = "FAILURE: " + ee.Message;
            logger.LogSystemError(filter.Channel, ee.Message, filter.RequestAgent, "GetMerchantDetails", filter.MerchantId);
        }
        return resp;
    }

    [WebMethod]
    public PostResponse GetUserDetails(Customer customer)
    {
        PostResponse resp = new PostResponse();
        ChannelLogic bll = new ChannelLogic(customer.RequestAgent, customer.Channel);
        try
        {
            if (customer.IsValidLoginRequest())
            {
                resp = bll.GetUserByPhone(customer.OwnerTelephone);
            }
            else
            {
                resp.StatusCode = customer.StatusCode;
                resp.StatusDesc = customer.StatusDesc;
            }
        }
        catch (WebException webex)
        {
            resp.StatusCode = "100";
            resp.StatusDesc = "UNABLE TO COMPLETE COMMUNICATION";
            logger.LogSystemError(customer.Channel, webex.Message, bll.RequestAgent, "GetUserDetails", customer.MerchantId);
        }
        catch (Exception ee)
        {
            resp.StatusCode = "100";
            resp.StatusDesc = "FAILED TO GET USER DETAILS DUE TO SYSTEM ERROR";
            logger.LogSystemError(customer.Channel, ee.Message, bll.RequestAgent, "GetUserDetails", customer.MerchantId);
        }
        return resp;
    }

    [WebMethod]
    public PostResponse GetUtilityCustomerDetails(SearchFilters filter)
    {
        PostResponse resp = new PostResponse();
        ChannelLogic bll = new ChannelLogic(filter.RequestAgent, filter.Channel);

        try
        {
            if (filter.isValidUtilitySearch())
            {
                resp = bll.GetCustomerDetails(filter);
            }
            else
            {
                resp.StatusCode = filter.StatusCode;
                resp.StatusDesc = filter.StatusDesc;
            }
        }
        catch (WebException webex)
        {
            resp.StatusCode = "100";
            resp.StatusDesc = "UNABLE TO COMPLETE COMMUNICATION";
            logger.LogSystemError(filter.Channel, webex.Message, filter.RequestAgent, "GetMerchantDetails", filter.MerchantId);
        }
        catch (Exception ee)
        {
            resp.StatusCode = "100";
            resp.StatusDesc = "FAILED TO GET CUSTOMER DETAILS DUE TO SYSTEM ERROR";
            logger.LogSystemError(filter.Channel, ee.Message, bll.RequestAgent, "GetUtilityCustomerDetails", filter.MerchantId);
        }
        return resp;
    }

    [WebMethod]
    public PostResponse PostChannelTransaction(MerchantTransaction transaction)
    {
        PostResponse resp = new PostResponse();
        Result result = new Result();
        try
        {
            result = LogPostRequest(transaction);
            switch (transaction.TranType)
            {
                case "TOPUP":
                    resp = MakePegPayTopUp(transaction);
                    break;
                case "PAYMERCHANT":
                    resp = PayMerchant(transaction);
                    break;
                case "SENDMONEY":
                    resp = SendMoney(transaction);
                    break;
                case "SENDMONEYW2W":
                    resp = SendMoneyW2W(transaction);
                    break;
                case "PAYBILL":
                    resp = MakeBillPayment(transaction);
                    break;
                case "AIRTIME":
                    resp = MakeAirtimePurchase(transaction);
                    break;
                default:
                    resp.StatusCode = "100";
                    resp.StatusDesc = "UNKNOWN TRANSACTION TYPE";
                    break;
            }
        }
        catch (Exception ex)
        {
            resp.StatusCode = "100";
            resp.StatusDesc = "SYSTEM ERROR";
            logger.LogSystemError(transaction.Channel, ex.Message, transaction.CustTel, transaction.Utility, transaction.MerchantId);
        }

        LogPostResponse(resp, result, transaction.RequestAgent);
        return resp;
    }

    [WebMethod]
    public PostResponse GetTransactionStatus(SearchFilters filters)
    {
        ChannelLogic cll = new ChannelLogic(filters.RequestAgent, filters.Channel);
        PostResponse resp = new PostResponse();
        if (filters.IsValidSearchTransaction())
        {
            resp = cll.GetTransactionDetails(filters);
        }
        else
        {
            resp.StatusCode = filters.StatusCode;
            resp.StatusDesc = filters.StatusDesc;
        }
        return resp;
    }

    private void LogPostResponse(PostResponse resp, Result res, string reqSender)
    {
        DataLogic dl = new DataLogic();
        dl.LogChannelResponse(resp, res, reqSender);
    }

    private Result LogPostRequest(MerchantTransaction transaction)
    {
        DataLogic dl = new DataLogic();
        return dl.LogChannelRequest(transaction);
    }

    public PostResponse MakeBillPayment(MerchantTransaction transaction)
    {
        PostResponse resp = new PostResponse();
        ChannelLogic logic = new ChannelLogic(transaction.RequestAgent, transaction.Channel);
        try
        {
            if (transaction.IsValidBillPayment())
            {
                resp = logic.LogTransaction(transaction);
            }
            else
            {
                resp.StatusCode = transaction.StatusCode;
                resp.StatusDesc = transaction.StatusDesc;
            }
        }
        catch (TimeoutException ee)
        {
            resp.StatusCode = "1";
            resp.StatusDesc = "PENDING";
            logger.LogSystemError(transaction.Channel, ee.Message, transaction.PhoneImei, transaction.Utility, transaction.MerchantId);
        }
        catch (Exception ee)
        {
            resp.StatusCode = "100";
            resp.StatusDesc = "SYSTEM ERROR";
            logger.LogSystemError(transaction.Channel, ee.Message, transaction.PhoneImei, transaction.Utility, transaction.MerchantId);
        }
        return resp;
    }

    public PostResponse MakePegPayTopUp(MerchantTransaction transaction)
    {
        PostResponse resp = new PostResponse();
        ChannelLogic logic = new ChannelLogic(transaction.RequestAgent, transaction.Channel);

        try
        {
            if (transaction.IsValidTopUpTransaction())
            {
                resp = logic.LogTransaction(transaction);
            }
            else
            {
                resp.StatusCode = transaction.StatusCode;
                resp.StatusDesc = transaction.StatusDesc;
            }
        }
        catch (TimeoutException ee)
        {
            resp.StatusCode = "1";
            resp.StatusDesc = "PENDING";
            logger.LogSystemError(transaction.Channel, ee.Message, transaction.PhoneImei, transaction.Utility, transaction.MerchantId);
        }
        catch (Exception ee)
        {
            resp.StatusCode = "100";
            resp.StatusDesc = "SYSTEM ERROR";
            logger.LogSystemError(transaction.Channel, ee.Message, transaction.PhoneImei, transaction.Utility, transaction.MerchantId);
        }
        return resp;
    }

    public PostResponse PayMerchant(MerchantTransaction transaction)
    {
        PostResponse resp = new PostResponse();
        ChannelLogic logic = new ChannelLogic(transaction.RequestAgent, transaction.Channel);

        try
        {
            if (transaction.IsValidMerchantPaymentTransaction())
            {
                resp = logic.LogTransaction(transaction);
            }
            else
            {
                resp.StatusCode = transaction.StatusCode;
                resp.StatusDesc = transaction.StatusDesc;
            }
        }
        catch (Exception ee)
        {
            resp.StatusCode = "100";
            resp.StatusDesc = "SYSTEM ERROR";
            logger.LogSystemError(transaction.Channel, ee.Message, transaction.PhoneImei, transaction.Utility, transaction.MerchantId);
        }
        return resp;
    }

    public PostResponse SendMoney(MerchantTransaction transaction)
    {
        PostResponse resp = new PostResponse();
        ChannelLogic logic = new ChannelLogic(transaction.RequestAgent, transaction.Channel);
        try
        {
            if (transaction.IsValidSendMoneyTransaction())
            {
                resp = logic.LogTransaction(transaction);
            }
            else
            {
                resp.StatusCode = transaction.StatusCode;
                resp.StatusDesc = transaction.StatusDesc;
            }
        }
        catch (Exception ee)
        {
            resp.StatusCode = "100";
            resp.StatusDesc = "SYSTEM ERROR";
            logger.LogSystemError(transaction.Channel, ee.Message, transaction.PhoneImei, transaction.Utility, transaction.MerchantId);
        }
        return resp;
    }

    public PostResponse SendMoneyW2W(MerchantTransaction transaction)
    {
        PostResponse resp = new PostResponse();
        ChannelLogic logic = new ChannelLogic(transaction.RequestAgent, transaction.Channel);
        try
        {
            if (transaction.IsValidWallet2WalletTransaction())
            {
                resp = logic.ProcessWallet2Wallet(transaction);
            }
            else
            {
                resp.StatusCode = transaction.StatusCode;
                resp.StatusDesc = transaction.StatusDesc;
            }
        }
        catch (Exception ee)
        {
            resp.StatusCode = "100";
            resp.StatusDesc = "SYSTEM ERROR";
            logger.LogSystemError(transaction.Channel, ee.Message, transaction.PhoneImei, transaction.Utility, transaction.MerchantId);
        }
        return resp;
    }

    public PostResponse MakeAirtimePurchase(MerchantTransaction transaction)
    {
        PostResponse resp = new PostResponse();
        ChannelLogic logic = new ChannelLogic(transaction.RequestAgent, transaction.Channel);
        try
        {
            if (transaction.IsValidAirtimePurchaseTransaction())
            {
                resp = logic.LogTransaction(transaction);
            }
            else
            {
                resp.StatusCode = transaction.StatusCode;
                resp.StatusDesc = transaction.StatusDesc;
            }
        }
        catch (TimeoutException ee)
        {
            resp.StatusCode = "1";
            resp.StatusDesc = "PENDING";
            logger.LogSystemError(transaction.Channel, ee.Message, transaction.PhoneImei, transaction.Utility, transaction.MerchantId);
        }
        catch (Exception ee)
        {
            resp.StatusCode = "100";
            resp.StatusDesc = "SYSTEM ERROR";
            logger.LogSystemError(transaction.Channel, ee.Message, transaction.PhoneImei, transaction.Utility, transaction.MerchantId);
        }
        return resp;
    }

    [WebMethod]
    public PostResponse UserSignIn(Customer customer)
    {
        PostResponse resp = new PostResponse();
        ChannelLogic bll = new ChannelLogic(customer.RequestAgent, customer.Channel);
        try
        {
            if (customer.IsValidLoginRequest())
            {
                resp = bll.UserLogin(customer);
            }
            else
            {
                resp.StatusCode = customer.StatusCode;
                resp.StatusDesc = customer.StatusDesc;
            }
        }
        catch (WebException webex)
        {
            resp.StatusCode = "100";
            resp.StatusDesc = "UNABLE TO COMPLETE COMMUNICATION";
            logger.LogSystemError(customer.Channel, webex.Message, bll.RequestAgent, "GetUtilityCustomerDetails", customer.MerchantId);
        }
        catch (Exception ee)
        {
            resp.StatusCode = "100";
            resp.StatusDesc = "System Error".ToUpper();
            logger.LogSystemError(customer.Channel, ee.Message, bll.RequestAgent, "GetUtilityCustomerDetails", customer.MerchantId);
        }
        return resp;
    }
}
