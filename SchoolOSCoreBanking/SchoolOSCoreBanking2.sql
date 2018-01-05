USE [master]
GO
/****** Object:  Database [TestMerchantCoreDB]    Script Date: 12/29/2017 09:13:00 ******/
CREATE DATABASE [TestMerchantCoreDB] ON  PRIMARY 
( NAME = N'TestCoreBankingDB', FILENAME = N'E:\Databases\LiveMerchantCoreDB.mdf' , SIZE = 2792448KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'TestCoreBankingDB_log', FILENAME = N'E:\Databases\LiveMerchantCoreDB_1.ldf' , SIZE = 74048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [TestMerchantCoreDB] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TestMerchantCoreDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TestMerchantCoreDB] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [TestMerchantCoreDB] SET ANSI_NULLS OFF
GO
ALTER DATABASE [TestMerchantCoreDB] SET ANSI_PADDING OFF
GO
ALTER DATABASE [TestMerchantCoreDB] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [TestMerchantCoreDB] SET ARITHABORT OFF
GO
ALTER DATABASE [TestMerchantCoreDB] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [TestMerchantCoreDB] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [TestMerchantCoreDB] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [TestMerchantCoreDB] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [TestMerchantCoreDB] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [TestMerchantCoreDB] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [TestMerchantCoreDB] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [TestMerchantCoreDB] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [TestMerchantCoreDB] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [TestMerchantCoreDB] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [TestMerchantCoreDB] SET  DISABLE_BROKER
GO
ALTER DATABASE [TestMerchantCoreDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [TestMerchantCoreDB] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [TestMerchantCoreDB] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [TestMerchantCoreDB] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [TestMerchantCoreDB] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [TestMerchantCoreDB] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [TestMerchantCoreDB] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [TestMerchantCoreDB] SET  READ_WRITE
GO
ALTER DATABASE [TestMerchantCoreDB] SET RECOVERY SIMPLE
GO
ALTER DATABASE [TestMerchantCoreDB] SET  MULTI_USER
GO
ALTER DATABASE [TestMerchantCoreDB] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [TestMerchantCoreDB] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'TestMerchantCoreDB', N'ON'
GO
USE [TestMerchantCoreDB]
GO
/****** Object:  User [TESTSVR\PaulK]    Script Date: 12/29/2017 09:13:00 ******/
CREATE USER [TESTSVR\PaulK] FOR LOGIN [TESTSVR\PaulK] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [TESTSVR\ApplicationsAccount]    Script Date: 12/29/2017 09:13:00 ******/
CREATE USER [TESTSVR\ApplicationsAccount] FOR LOGIN [TESTSVR\ApplicationsAccount] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [QueryBD]    Script Date: 12/29/2017 09:13:00 ******/
CREATE USER [QueryBD] FOR LOGIN [QueryBD] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [PGSS\admin-deo]    Script Date: 12/29/2017 09:13:00 ******/
CREATE USER [PGSS\admin-deo] FOR LOGIN [PGSS\admin-deo] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [DatabaseViewer]    Script Date: 12/29/2017 09:13:00 ******/
CREATE USER [DatabaseViewer] FOR LOGIN [DatabaseViewer] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[CustomerDeviceMappingsDeleted]    Script Date: 12/29/2017 09:13:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CustomerDeviceMappingsDeleted](
	[RecordId] [bigint] NULL,
	[CustomerId] [varchar](50) NOT NULL,
	[DeviceId] [varchar](50) NOT NULL,
	[DeviceType] [varchar](50) NOT NULL,
	[Pin] [varchar](50) NOT NULL,
	[CustomerTel] [varchar](50) NOT NULL,
	[TerminalName] [varchar](250) NOT NULL,
	[CustomerAccount] [varchar](50) NOT NULL,
	[BankCode] [varchar](50) NOT NULL,
	[BranchCode] [varchar](50) NOT NULL,
	[Active] [bit] NOT NULL,
	[SIMCard] [varchar](50) NULL,
	[AquiredBy] [varchar](100) NULL,
	[Location] [varchar](50) NULL,
	[RecordDate] [datetime] NOT NULL,
	[CreatedBy] [varchar](250) NOT NULL,
	[ApprovalDate] [datetime] NULL,
	[ApprovedBy] [varchar](250) NULL,
	[AccountCode] [varchar](50) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Currencies]    Script Date: 12/29/2017 09:13:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Currencies](
	[RecordId] [int] IDENTITY(1,1) NOT NULL,
	[CurrencyName] [varchar](50) NULL,
	[CurrencyCode] [varchar](50) NULL,
	[BankCode] [varchar](50) NULL,
	[ModifiedBy] [varchar](50) NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedOn] [datetime] NULL,
	[CreatedOn] [datetime] NULL,
	[ValueInLocalCurrency] [money] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[IdentificationDocumentTypes]    Script Date: 12/29/2017 09:13:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[IdentificationDocumentTypes](
	[RecordId] [int] IDENTITY(1,1) NOT NULL,
	[IDTypeCode] [varchar](50) NULL,
	[IDTypeName] [varchar](50) NULL,
	[ModifiedBy] [varchar](50) NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedOn] [datetime] NULL,
	[CreatedOn] [datetime] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HimaBalances]    Script Date: 12/29/2017 09:13:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HimaBalances](
	[RecordId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerRef] [nvarchar](50) NOT NULL,
	[Amount] [decimal](18, 2) NULL,
	[IsActive] [bit] NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedOn] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PasswordChangeLog]    Script Date: 12/29/2017 09:13:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[PasswordChangeLog](
	[RecordId] [bigint] IDENTITY(1,1) NOT NULL,
	[OldPassword] [varchar](100) NULL,
	[UserId] [varchar](100) NULL,
	[InitiatedBy] [varchar](50) NULL,
	[IP] [varchar](100) NULL,
	[RecordDate] [datetime] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MerchantTillBranches]    Script Date: 12/29/2017 09:13:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MerchantTillBranches](
	[RecordID] [bigint] IDENTITY(1,1) NOT NULL,
	[AccountCode] [varchar](50) NULL,
	[TillBranchCode] [varchar](50) NULL,
	[TillBranchName] [varchar](50) NULL,
	[BankCode] [varchar](50) NULL,
	[CreatedBy] [varchar](50) NULL,
	[CreatedOn] [datetime] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MerchantNotificatonPhones]    Script Date: 12/29/2017 09:13:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MerchantNotificatonPhones](
	[PhoneId] [bigint] IDENTITY(1,1) NOT NULL,
	[BankCode] [varchar](50) NULL,
	[MerchantId] [varchar](50) NULL,
	[Phone] [varchar](50) NULL,
	[Name] [varchar](50) NULL,
	[CreatedBy] [varchar](50) NULL,
	[CreatedOn] [datetime] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MerchantExtras]    Script Date: 12/29/2017 09:13:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MerchantExtras](
	[ValueID] [bigint] IDENTITY(1,1) NOT NULL,
	[BankCode] [varchar](50) NULL,
	[MerchantId] [varchar](50) NULL,
	[ExtraNo] [varchar](50) NULL,
	[ExtraValue] [varchar](50) NULL,
	[CreatedBy] [varchar](50) NULL,
	[CreatedOn] [datetime] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RejectedMerchantCustomers]    Script Date: 12/29/2017 09:13:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[RejectedMerchantCustomers](
	[RecordId] [int] NOT NULL,
	[CustomerRef] [nvarchar](50) NOT NULL,
	[CustomerName] [varchar](50) NULL,
	[CustomerTel] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[AccountCode] [varchar](50) NOT NULL,
	[IsActive] [bit] NULL,
	[BankCode] [varchar](50) NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedOn] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedBy] [varchar](50) NULL,
	[Extra1] [varchar](50) NULL,
	[Extra2] [varchar](50) NULL,
	[Extra3] [varchar](50) NULL,
	[RejectedBy] [varchar](50) NULL,
	[RejectedOn] [datetime] NULL,
 CONSTRAINT [PK_RejectedMerchantCustomers] PRIMARY KEY CLUSTERED 
(
	[CustomerRef] ASC,
	[AccountCode] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RejectedBankSystemUsers]    Script Date: 12/29/2017 09:13:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RejectedBankSystemUsers](
	[RecordId] [int] NOT NULL,
	[UserId] [nvarchar](50) NULL,
	[Email] [varchar](50) NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[OtherName] [varchar](50) NULL,
	[Usertype] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[IsActive] [bit] NULL,
	[BankCode] [varchar](50) NULL,
	[DateOfBirth] [varchar](50) NULL,
	[RecordDate] [datetime] NULL,
	[ModifiedOn] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedBy] [varchar](50) NULL,
	[PhoneNumber] [varchar](50) NULL,
	[BranchCode] [varchar](50) NULL,
	[Gender] [varchar](50) NULL,
	[ApprovedBy] [varchar](50) NULL,
	[TranAmountLimit] [varchar](50) NULL,
	[ResetPassword] [bit] NULL,
	[ResetPin] [bit] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RejectedBankCustomers]    Script Date: 12/29/2017 09:13:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RejectedBankCustomers](
	[RecordId] [int] NOT NULL,
	[CustomerId] [nvarchar](50) NULL,
	[Email] [varchar](50) NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[OtherName] [varchar](50) NULL,
	[Pin] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[IsActive] [bit] NULL,
	[BankCode] [varchar](50) NULL,
	[DateOfBirth] [varchar](50) NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedOn] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedBy] [varchar](50) NULL,
	[PhoneNumber] [varchar](50) NULL,
	[BranchCode] [varchar](50) NULL,
	[Gender] [varchar](50) NULL,
	[ApprovedBy] [varchar](50) NULL,
	[PathToProfilePic] [varchar](8000) NULL,
	[PathToSignature] [varchar](8000) NULL,
	[NextOfKinName] [varchar](50) NULL,
	[NextOfKinContact] [varchar](50) NULL,
	[Nationality] [varchar](50) NULL,
	[PlaceOfBirth] [varchar](50) NULL,
	[Salutation] [varchar](50) NULL,
	[MaritalStatus] [varchar](50) NULL,
	[MerchantId] [varchar](50) NULL,
	[UserCategory] [varchar](50) NULL,
	[ResetPassword] [bit] NULL,
	[ResetPin] [bit] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RejectedBankAccounts]    Script Date: 12/29/2017 09:13:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RejectedBankAccounts](
	[AccountId] [int] NOT NULL,
	[AccNumber] [varchar](50) NULL,
	[AccType] [varchar](50) NULL,
	[BankCode] [varchar](50) NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedOn] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[CreatedBy] [varchar](50) NULL,
	[IsActive] [bit] NULL,
	[ApprovedBy] [varchar](50) NULL,
	[BranchCode] [varchar](50) NULL,
	[CurrencyCode] [varchar](50) NULL,
	[AccountName] [varchar](50) NULL,
	[MinimumBalance] [decimal](18, 2) NULL,
	[InterestRate] [decimal](18, 2) NULL,
	[InterestType] [varchar](50) NULL,
	[NextMaturityDate] [datetime] NULL,
	[LastEodDate] [datetime] NULL,
	[InterestPayOutFrequency] [varchar](50) NULL,
	[Reason] [varchar](7050) NULL,
	[LastRunAccountDate] [bigint] NULL,
	[IsproductAccount] [bit] NULL,
	[ProductType] [varchar](100) NULL,
	[IsReferenced] [bit] NULL,
	[LiquidationType] [varchar](50) NULL,
	[AccountCode] [varchar](50) NULL,
	[AccountCategory] [varchar](100) NULL,
	[LiquidationFrequency] [varchar](50) NULL,
	[LiquidationAccount] [varchar](100) NULL,
	[SentToBank] [bit] NOT NULL,
	[LiquidationAccountName] [varchar](max) NULL,
	[Status] [varchar](50) NULL,
	[MerchantContact] [varchar](50) NULL,
	[NumberOfAuthorisers] [varchar](50) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RegisterationLogs]    Script Date: 12/29/2017 09:13:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RegisterationLogs](
	[RecordId] [int] IDENTITY(1,1) NOT NULL,
	[AccountCode] [varchar](50) NULL,
	[MerchantName] [varchar](50) NULL,
	[LiquidationAccount] [varchar](50) NULL,
	[TranDate] [datetime] NULL,
	[LogDate] [datetime] NULL,
	[StatusCode] [varchar](50) NULL,
	[StatusDescription] [varchar](50) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CustomerDeviceMappings]    Script Date: 12/29/2017 09:13:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CustomerDeviceMappings](
	[RecordId] [bigint] IDENTITY(1,1) NOT NULL,
	[CustomerId] [varchar](50) NOT NULL,
	[DeviceId] [varchar](50) NOT NULL,
	[DeviceType] [varchar](50) NOT NULL,
	[Pin] [varchar](50) NOT NULL,
	[CustomerTel] [varchar](50) NOT NULL,
	[TerminalName] [varchar](250) NOT NULL,
	[CustomerAccount] [varchar](50) NOT NULL,
	[BankCode] [varchar](50) NOT NULL,
	[BranchCode] [varchar](50) NOT NULL,
	[Active] [bit] NOT NULL,
	[SIMCard] [varchar](50) NULL,
	[AquiredBy] [varchar](100) NULL,
	[Location] [varchar](50) NULL,
	[RecordDate] [datetime] NOT NULL,
	[CreatedBy] [varchar](250) NOT NULL,
	[ApprovalDate] [datetime] NULL,
	[ApprovedBy] [varchar](250) NULL,
	[AccountCode] [varchar](50) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TransactionRules]    Script Date: 12/29/2017 09:13:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TransactionRules](
	[RecordId] [int] IDENTITY(1,1) NOT NULL,
	[RuleName] [varchar](50) NULL,
	[RuleCode] [varchar](50) NULL,
	[UserId] [varchar](50) NULL,
	[Description] [varchar](150) NULL,
	[MinimumAmount] [money] NULL,
	[MaximumAmount] [money] NULL,
	[IsActive] [bit] NULL,
	[BankCode] [varchar](50) NULL,
	[BranchCode] [varchar](50) NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedOn] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedBy] [varchar](50) NULL,
	[Approver] [varchar](50) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[BankTellers_DeleteRow]    Script Date: 12/29/2017 09:13:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	BankTellers_DeleteRow
-- Author:	Nsubuga Kasozi
-- Create date:	12/27/2015 9:32:04 PM
-- Description:	This stored procedure is intended for deleting a specific row from BankTellers table
-- ==========================================================================================
Create Procedure [dbo].[BankTellers_DeleteRow]
	@TellerId int
As
Begin
	Delete BankTellers
	Where
		[TellerId] = @TellerId

End
GO
/****** Object:  Table [dbo].[PendingBankAccountApprovals]    Script Date: 12/29/2017 09:13:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PendingBankAccountApprovals](
	[AccountId] [int] IDENTITY(1,1) NOT NULL,
	[AccNumber] [varchar](50) NULL,
	[AccType] [varchar](50) NULL,
	[BankCode] [varchar](50) NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedOn] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[CreatedBy] [varchar](50) NULL,
	[IsActive] [bit] NULL,
	[ApprovedBy] [varchar](50) NULL,
	[BranchCode] [varchar](50) NULL,
	[CurrencyCode] [varchar](50) NULL,
	[AccountName] [varchar](50) NULL,
	[MinimumBalance] [decimal](18, 2) NULL,
	[InterestRate] [decimal](18, 2) NULL,
	[InterestType] [varchar](50) NULL,
	[NextMaturityDate] [datetime] NULL,
	[LastEodDate] [datetime] NULL,
	[InterestPayOutFrequency] [varchar](50) NULL,
	[Reason] [varchar](7050) NULL,
	[LastRunAccountDate] [bigint] NULL,
	[IsproductAccount] [bit] NULL,
	[ProductType] [varchar](100) NULL,
	[IsReferenced] [bit] NULL,
	[LiquidationType] [varchar](50) NULL,
	[AccountCode] [varchar](50) NULL,
	[AccountCategory] [varchar](100) NULL,
	[LiquidationFrequency] [varchar](50) NULL,
	[LiquidationAccount] [varchar](100) NULL,
	[SentToBank] [bit] NOT NULL,
	[LiquidationAccountName] [varchar](max) NULL,
	[Status] [varchar](max) NULL,
	[Comments] [varchar](max) NULL,
	[MerchantContact] [varchar](50) NULL,
	[NumberOfAuthorisers] [varchar](50) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Reports]    Script Date: 12/29/2017 09:13:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Reports](
	[RecordID] [int] IDENTITY(1,1) NOT NULL,
	[ReportType] [varchar](50) NULL,
	[ReportName] [varchar](50) NULL,
	[ReportCategory] [varchar](50) NULL,
	[StoredProcedure] [varchar](50) NULL,
	[BankCode] [varchar](50) NULL,
	[ModifiedBy] [varchar](50) NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedOn] [datetime] NULL,
	[CreatedOn] [datetime] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TransactionRequests]    Script Date: 12/29/2017 09:13:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TransactionRequests](
	[RecordId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerName] [varchar](50) NULL,
	[AccountNumber] [varchar](50) NULL,
	[ToAccount] [varchar](50) NULL,
	[FromAccount] [varchar](50) NULL,
	[TranAmount] [decimal](18, 2) NULL,
	[TranCategory] [varchar](50) NULL,
	[PaymentDate] [datetime] NULL,
	[RecordDate] [datetime] NULL,
	[Teller] [varchar](50) NULL,
	[ApprovedBy] [varchar](50) NULL,
	[BankCode] [varchar](50) NULL,
	[BranchCode] [varchar](50) NULL,
	[Narration] [varchar](50) NULL,
	[RequiresApproval] [bit] NULL,
	[Approver] [varchar](50) NULL,
	[Status] [varchar](50) NULL,
	[Reason] [varchar](8000) NULL,
	[CurrencyCode] [varchar](50) NULL,
	[PaymentType] [varchar](50) NULL,
	[ChequeNumber] [varchar](50) NULL,
	[CustomerTel] [varchar](50) NULL,
	[SentToBank] [bit] NULL,
	[BankTranId] [varchar](100) NULL,
	[AccountCode] [varchar](50) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [BankIdIndex] ON [dbo].[TransactionRequests] 
(
	[BankTranId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoanTypes]    Script Date: 12/29/2017 09:13:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LoanTypes](
	[RecordId] [int] IDENTITY(1,1) NOT NULL,
	[LoanTypeCode] [varchar](50) NULL,
	[LoanTypeName] [varchar](50) NULL,
	[MaximumRepaymentPeriodInMonths] [int] NULL,
	[InterestRateAsPercentage] [decimal](18, 2) NULL,
	[BankCode] [varchar](50) NULL,
	[ModifiedOn] [datetime] NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[CreatedBy] [varchar](50) NULL,
	[RequiresCollateral] [bit] NULL,
	[InterestRateType] [varchar](50) NULL,
	[GracePeriodInDays] [varchar](50) NULL,
	[LoanApplicationFee] [decimal](18, 2) NULL,
	[LoanProcessingFee] [decimal](18, 2) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LocalGovernmentSettings]    Script Date: 12/29/2017 09:13:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LocalGovernmentSettings](
	[RecordId] [int] NULL,
	[DistrictName] [varchar](100) NULL,
	[DistrictCode] [varchar](50) NULL,
	[Spid] [varchar](50) NULL,
	[Password] [varchar](100) NULL,
	[RecordDate] [datetime] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetAgentTotal]    Script Date: 12/29/2017 09:13:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[fn_GetAgentTotal](@AgentCode varchar(50),@fromDate datetime, @toDate datetime,@Status varchar(50))
  RETURNS Money
  AS
    BEGIN
		DECLARE @ret money
        --if(@Status = '0')
        SET @ret = (Select SUM(TranAmount) from Transactions 
                     Where VendorCode = @AgentCode AND Status=@Status AND TranType='2'
                      AND Convert(varchar(12),RecordDate,102) >= Convert(varchar(12),@fromDate,102)
                      AND Convert(varchar(12),RecordDate,102) <= Convert(varchar(12),@toDate,102))
       -- else if(@Status = '1')
       --  SET @ret = (Select SUM(TranAmount) from Received 
       --              Where VendorCode = @AgentCode 
       --               AND Convert(varchar(12),RecordDate,102) >= Convert(varchar(12),@fromDate,102)
       --               AND Convert(varchar(12),RecordDate,102) <= Convert(varchar(12),@toDate,102))
       --else if(@Status = '2')
       --  SET @ret = (Select SUM(TranAmount) from Reconciled 
       --              Where VendorCode = @AgentCode 
       --               AND Convert(varchar(12),RecordDate,102) >= Convert(varchar(12),@fromDate,102)
       --               AND Convert(varchar(12),RecordDate,102) <= Convert(varchar(12),@toDate,102)
       --               AND BSUpdated = 0)
       -- else if(@Status = '3')
       --  SET @ret = (Select SUM(TranAmount) from Reconciled 
       --              Where VendorCode = @AgentCode 
       --               AND Convert(varchar(12),RecordDate,102) >= Convert(varchar(12),@fromDate,102)
       --               AND Convert(varchar(12),RecordDate,102) <= Convert(varchar(12),@toDate,102)
       --               AND BSUpdated = 1)
       --  else 
       --  SET @ret = (Select SUM(TranAmount) from Posted 
       --              Where VendorCode = @AgentCode 
       --               AND Convert(varchar(12),RecordDate,102) >= Convert(varchar(12),@fromDate,102)
       --               AND Convert(varchar(12),RecordDate,102) <= Convert(varchar(12),@toDate,102))
     
         	return @ret
    END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetAccountNumber]    Script Date: 12/29/2017 09:13:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[fn_GetAccountNumber](@CurrentDateTime datetime)
  RETURNS varchar(50)
      AS
    BEGIN
		DECLARE @ret varchar(50)
		DECLARE @res varchar(50)
		DECLARE @Rand varchar(20)
		--SELECT @Rand=ROUND(((999999 - 1 -1) * RAND() + 1), 0)
		--select @ret=convert(varchar(50),(cast(convert(varchar(8),GETDATE(),112) as int)))+''+@Rand 
		select @ret=convert(varchar(50),(cast(convert(varchar(8),GETDATE(),112) as int)))
	    SET @res = @ret
		return @res
    END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetAccountNo]    Script Date: 12/29/2017 09:13:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[fn_GetAccountNo](@CurrentDateTime datetime)
  RETURNS varchar(50)
      AS
    BEGIN
		DECLARE @ret varchar(50)
		DECLARE @res varchar(50)
		
		SET @ret = DATEPART(YEAR,@CurrentDateTime)+DATEPART(MONTH,@CurrentDateTime)+DATEPART(DAY,@CurrentDateTime)+
				   DATEPART(HOUR,@CurrentDateTime)+DATEPART(MINUTE,@CurrentDateTime)+DATEPART(SECOND,@CurrentDateTime)+
				   DATEPART(MICROSECOND,@CurrentDateTime)
		   
	    SET @res = @ret
		return @res
    END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetAccountCode]    Script Date: 12/29/2017 09:13:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[fn_GetAccountCode](@TransID bigint)
  RETURNS varchar(50)
      AS
    BEGIN
		DECLARE @ret varchar(50)
		DECLARE @res varchar(50)
		DECLARE @tranCode varchar(50)
		SET @tranCode = (CONVERT( varchar(50),@TransID))
		IF(LEN(@TransID) = 1)
		  SET @ret = '10000'+@tranCode
		ELSE IF (LEN(@TransID) = 2)
		  SET @ret = '1000'+@tranCode
		ELSE IF (LEN(@TransID) = 3)
	      SET @ret = '100'+@tranCode
	    ELSE IF (LEN(@TransID) = 3)
	      SET @ret = '10'+@tranCode
	    ELSE IF (LEN(@TransID) = 3)
	      SET @ret = '1'+@tranCode
		ELSE
		  SET @ret = @tranCode	
		   
		   SET @res = @ret
		return @res
    END
GO
/****** Object:  Table [dbo].[RestorationLogs]    Script Date: 12/29/2017 09:13:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[RestorationLogs](
	[RecordId] [bigint] IDENTITY(1,1) NOT NULL,
	[AccountCode] [varchar](50) NOT NULL,
	[BankCode] [varchar](50) NOT NULL,
	[RestoredBy] [varchar](50) NOT NULL,
	[RecordDate] [datetime] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PaymentTypes]    Script Date: 12/29/2017 09:13:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PaymentTypes](
	[PaymentTypeId] [int] IDENTITY(1,1) NOT NULL,
	[PaymentTypeCode] [varchar](50) NULL,
	[PaymentTypeName] [varchar](50) NULL,
	[BankCode] [varchar](50) NULL,
	[ModifiedBy] [varchar](50) NULL,
	[CreatedBy] [varchar](50) NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedOn] [datetime] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UtilityTransactions]    Script Date: 12/29/2017 09:13:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UtilityTransactions](
	[TranId] [bigint] IDENTITY(1,1) NOT NULL,
	[CustomerRef] [varchar](50) NOT NULL,
	[CustomerName] [varchar](100) NOT NULL,
	[CustomerType] [varchar](50) NOT NULL,
	[CustomerTel] [varchar](50) NOT NULL,
	[Area] [varchar](50) NOT NULL,
	[Tin] [varchar](50) NOT NULL,
	[TranAmount] [money] NOT NULL,
	[PaymentDate] [datetime] NOT NULL,
	[RecordDate] [datetime] NOT NULL,
	[TranType] [varchar](50) NOT NULL,
	[PaymentType] [varchar](50) NOT NULL,
	[BankTranId] [varchar](100) NOT NULL,
	[TranNarration] [varchar](max) NULL,
	[BankCode] [varchar](50) NOT NULL,
	[BranchCode] [varchar](50) NOT NULL,
	[Teller] [varchar](50) NOT NULL,
	[Reversal] [bit] NULL,
	[UtilityCode] [varchar](50) NOT NULL,
	[SentToUtility] [bit] NOT NULL,
	[Status] [varchar](50) NULL,
	[UtilitySentDate] [datetime] NULL,
	[Reason] [varchar](1000) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SystemSettings]    Script Date: 12/29/2017 09:13:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SystemSettings](
	[ValueID] [bigint] IDENTITY(1,1) NOT NULL,
	[BankCode] [varchar](50) NULL,
	[SettingCode] [varchar](50) NULL,
	[SettingValue] [varchar](50) NULL,
	[ModifiedBy] [varchar](50) NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedOn] [datetime] NULL,
	[CreatedOn] [datetime] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[Vw_CompanyTypes]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Vw_CompanyTypes]
AS
SELECT     UtilityCode AS CompanyCode, Utility AS Company, 2 AS CompanyType, Active,'True' AS SignatureRequired,'Pass' AS VendorPassword, UtilityCode AS VendorCode, CreationDate,'0' AS InvalidLoginCount ,0 as IsAsync
FROM         dbo.UtilityCompanies
UNION
SELECT     VendorCode AS CompanyCode, Vendor AS Company, 3 AS CompanyType, Active, IsRequiredCert AS SignatureRequired, VendorPassword, VendorCode, CreateDate as CreationDate, InvalidLoginCount, IsAsync
FROM         dbo.Vendors
UNION
SELECT  PegasusCode AS CompanyCode,Name AS Company ,1 AS CompanyType ,Active,'False' AS SignatureRequired,'Pass' AS VendorPassword,PegasusCode AS VendorCode, '2013-01-01'as CreationDate,'0' AS InvalidLoginCount,0 as IsAsync
FROM dbo.PegasusDetails
UNION
SELECT  CustomerCode AS CompanyCode,(Lname+' '+Fname) AS Company ,4 AS CompanyType ,Active, 'False' AS SignatureRequired,[Password] AS VendorPassword,CustomerCode AS VendorCode,RecordDate AS CreationDate,'0' AS InvalidLoginCount,0 as IsAsync
FROM Customers
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4[30] 2[40] 3) )"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 3
   End
   Begin DiagramPane = 
      PaneHidden = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 5
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Vw_CompanyTypes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Vw_CompanyTypes'
GO
/****** Object:  Table [dbo].[DeletedMerchantCustomers]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DeletedMerchantCustomers](
	[RecordId] [int] NOT NULL,
	[CustomerRef] [nvarchar](50) NOT NULL,
	[CustomerName] [varchar](50) NULL,
	[CustomerTel] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[AccountCode] [varchar](50) NOT NULL,
	[IsActive] [bit] NULL,
	[BankCode] [varchar](50) NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedOn] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedBy] [varchar](50) NULL,
	[Extra1] [varchar](50) NULL,
	[Extra2] [varchar](50) NULL,
	[Extra3] [varchar](50) NULL,
	[ApprovedBy] [varchar](50) NULL,
	[MarkedForDeletion] [bit] NULL,
	[MarkedForDeletionBy] [varchar](50) NULL,
	[MarkedForDeletionOn] [datetime] NULL,
	[DeletedBy] [varchar](50) NOT NULL,
	[DeletedOn] [datetime] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DeletedBankCustomers]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DeletedBankCustomers](
	[RecordId] [int] NULL,
	[CustomerId] [nvarchar](50) NULL,
	[Email] [varchar](50) NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[OtherName] [varchar](50) NULL,
	[Pin] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[IsActive] [bit] NULL,
	[BankCode] [varchar](50) NULL,
	[DateOfBirth] [varchar](50) NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedOn] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedBy] [varchar](50) NULL,
	[PhoneNumber] [varchar](50) NULL,
	[BranchCode] [varchar](50) NULL,
	[Gender] [varchar](50) NULL,
	[ApprovedBy] [varchar](50) NULL,
	[PathToProfilePic] [varchar](8000) NULL,
	[PathToSignature] [varchar](8000) NULL,
	[NextOfKinName] [varchar](50) NULL,
	[NextOfKinContact] [varchar](50) NULL,
	[Nationality] [varchar](50) NULL,
	[PlaceOfBirth] [varchar](50) NULL,
	[Salutation] [varchar](50) NULL,
	[MaritalStatus] [varchar](50) NULL,
	[MerchantId] [varchar](50) NULL,
	[UserCategory] [varchar](50) NULL,
	[ResetPassword] [bit] NULL,
	[ResetPin] [bit] NULL,
	[DeletedBy] [varchar](50) NOT NULL,
	[DeletedOn] [datetime] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DeletedBankCharges]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DeletedBankCharges](
	[ChargeId] [int] NULL,
	[ChargeCode] [varchar](50) NULL,
	[ChargeName] [varchar](50) NULL,
	[MinimumValue] [varchar](50) NULL,
	[MaximumValue] [varchar](50) NULL,
	[ChargeAmount] [decimal](18, 2) NULL,
	[CommissionAccount] [varchar](50) NULL,
	[BankCode] [varchar](50) NULL,
	[ChargeType] [varchar](50) NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedBy] [varchar](50) NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedOn] [datetime] NULL,
	[IsActive] [varchar](50) NULL,
	[DeletedBy] [varchar](50) NOT NULL,
	[DeletedOn] [datetime] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DeletedBankAccounts]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DeletedBankAccounts](
	[AccountId] [int] NULL,
	[AccNumber] [varchar](50) NULL,
	[AccType] [varchar](50) NULL,
	[BankCode] [varchar](50) NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedOn] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[CreatedBy] [varchar](50) NULL,
	[IsActive] [bit] NULL,
	[ApprovedBy] [varchar](50) NULL,
	[BranchCode] [varchar](50) NULL,
	[CurrencyCode] [varchar](50) NULL,
	[AccountName] [varchar](50) NULL,
	[MinimumBalance] [decimal](18, 2) NULL,
	[InterestRate] [decimal](18, 2) NULL,
	[InterestType] [varchar](50) NULL,
	[NextMaturityDate] [datetime] NULL,
	[LastEodDate] [datetime] NULL,
	[InterestPayOutFrequency] [varchar](50) NULL,
	[Reason] [varchar](7050) NULL,
	[LastRunAccountDate] [bigint] NULL,
	[IsproductAccount] [bit] NULL,
	[ProductType] [varchar](100) NULL,
	[IsReferenced] [bit] NULL,
	[LiquidationType] [varchar](50) NULL,
	[AccountCode] [varchar](50) NULL,
	[AccountCategory] [varchar](100) NULL,
	[LiquidationFrequency] [varchar](50) NULL,
	[LiquidationAccount] [varchar](100) NULL,
	[SentToBank] [bit] NOT NULL,
	[LiquidationAccountName] [varchar](max) NULL,
	[MerchantContact] [varchar](50) NULL,
	[ReferenceType] [varchar](50) NULL,
	[NumberOfAuthorisers] [varchar](50) NULL,
	[DeletedBy] [varchar](50) NULL,
	[DeletedOn] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TransactionCategories]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TransactionCategories](
	[TranTypeId] [int] IDENTITY(1,1) NOT NULL,
	[TranType] [varchar](50) NULL,
	[Description] [varchar](150) NULL,
	[BankCode] [varchar](50) NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedOn] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[CreatedBy] [varchar](50) NULL,
	[IsActive] [bit] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Guarantors]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Guarantors](
	[RecordID] [int] IDENTITY(1,1) NOT NULL,
	[LoanID] [varchar](50) NULL,
	[GuarantorName] [varchar](50) NULL,
	[GuarantorId] [varchar](50) NULL,
	[GuarantorType] [varchar](50) NULL,
	[BankCode] [varchar](50) NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedOn] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[GuarantorPhoneNumber] [varchar](50) NULL,
	[PathToPicOfGuarantorID] [varchar](250) NULL,
	[IdType] [varchar](50) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GuarantorTypes]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GuarantorTypes](
	[RecordId] [int] IDENTITY(1,1) NOT NULL,
	[GuarantorTypeCode] [varchar](50) NULL,
	[GuarantorTypeName] [varchar](50) NULL,
	[BankCode] [varchar](50) NULL,
	[ModifiedBy] [varchar](50) NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedOn] [datetime] NULL,
	[CreatedOn] [datetime] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BankBranches]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BankBranches](
	[BranchId] [int] IDENTITY(1,1) NOT NULL,
	[BranchName] [nvarchar](50) NULL,
	[BranchCode] [nvarchar](50) NULL,
	[Location] [nvarchar](100) NULL,
	[IsActive] [bit] NULL,
	[BankCode] [nvarchar](50) NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedOn] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedBy] [varchar](50) NULL,
	[BranchVaultAccNumber] [varchar](50) NULL,
	[BranchTellerLimit] [varchar](50) NULL,
	[BranchSupervisorLimit] [varchar](50) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BankAccountsHistory]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BankAccountsHistory](
	[AccountId] [int] NULL,
	[AccNumber] [varchar](50) NULL,
	[AccType] [varchar](50) NULL,
	[BankCode] [varchar](50) NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedOn] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[CreatedBy] [varchar](50) NULL,
	[IsActive] [bit] NULL,
	[ApprovedBy] [varchar](50) NULL,
	[BranchCode] [varchar](50) NULL,
	[CurrencyCode] [varchar](50) NULL,
	[AccountName] [varchar](50) NULL,
	[MinimumBalance] [decimal](18, 2) NULL,
	[InterestRate] [decimal](18, 2) NULL,
	[InterestType] [varchar](50) NULL,
	[NextMaturityDate] [datetime] NULL,
	[LastEodDate] [datetime] NULL,
	[InterestPayOutFrequency] [varchar](50) NULL,
	[Reason] [varchar](7050) NULL,
	[LastRunAccountDate] [bigint] NULL,
	[IsproductAccount] [bit] NULL,
	[ProductType] [varchar](100) NULL,
	[IsReferenced] [bit] NULL,
	[LiquidationType] [varchar](50) NULL,
	[AccountCode] [varchar](50) NULL,
	[AccountCategory] [varchar](100) NULL,
	[LiquidationFrequency] [varchar](50) NULL,
	[LiquidationAccount] [varchar](100) NULL,
	[SentToBank] [bit] NOT NULL,
	[LiquidationAccountName] [varchar](max) NULL,
	[MerchantContact] [varchar](50) NULL,
	[ReferenceType] [varchar](50) NULL,
	[NumberOfAuthorisers] [varchar](50) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BankAccountsDeleted]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BankAccountsDeleted](
	[AccountId] [int] NOT NULL,
	[AccNumber] [varchar](50) NULL,
	[AccType] [varchar](50) NULL,
	[BankCode] [varchar](50) NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedOn] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[CreatedBy] [varchar](50) NULL,
	[IsActive] [bit] NULL,
	[ApprovedBy] [varchar](50) NULL,
	[BranchCode] [varchar](50) NULL,
	[CurrencyCode] [varchar](50) NULL,
	[AccountName] [varchar](50) NULL,
	[MinimumBalance] [decimal](18, 2) NULL,
	[InterestRate] [decimal](18, 2) NULL,
	[InterestType] [varchar](50) NULL,
	[NextMaturityDate] [datetime] NULL,
	[LastEodDate] [datetime] NULL,
	[InterestPayOutFrequency] [varchar](50) NULL,
	[Reason] [varchar](7050) NULL,
	[LastRunAccountDate] [bigint] NULL,
	[IsproductAccount] [bit] NULL,
	[ProductType] [varchar](100) NULL,
	[IsReferenced] [bit] NULL,
	[LiquidationType] [varchar](50) NULL,
	[AccountCode] [varchar](50) NULL,
	[DeletedBy] [varchar](50) NULL,
	[DeleteReason] [varchar](50) NULL,
	[NumberOfAuthorisers] [varchar](50) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GeneralLedgerTable]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GeneralLedgerTable](
	[RecordId] [int] IDENTITY(1,1) NOT NULL,
	[PegPayTranId] [varchar](50) NULL,
	[CustomerRef] [varchar](50) NULL,
	[CustomerName] [varchar](50) NULL,
	[CustomerTel] [varchar](50) NULL,
	[AccountNumber] [varchar](50) NOT NULL,
	[ToAccount] [varchar](50) NULL,
	[FromAccount] [varchar](50) NULL,
	[TranAmount] [decimal](18, 2) NOT NULL,
	[TranAmountInAccountCurrency] [decimal](18, 10) NULL,
	[BankTranId] [varchar](50) NOT NULL,
	[TranType] [varchar](50) NOT NULL,
	[TranCategory] [varchar](50) NOT NULL,
	[PaymentDate] [datetime] NULL,
	[RecordDate] [datetime] NULL,
	[Teller] [varchar](50) NULL,
	[ApprovedBy] [varchar](50) NULL,
	[BankCode] [varchar](50) NOT NULL,
	[BranchCode] [varchar](50) NULL,
	[Narration] [varchar](7060) NULL,
	[CurrencyCode] [varchar](50) NULL,
	[ValueInLocalCurrencyFromAccount] [decimal](18, 2) NULL,
	[ValueInLocalCurrencyToAccount] [decimal](18, 2) NULL,
	[ValueInLocalCurrencyTranAmount] [decimal](18, 2) NULL,
	[PaymentType] [varchar](50) NULL,
	[ChequeNumber] [varchar](50) NULL,
	[AccountingDate] [bigint] NOT NULL,
	[AccountingPeriod] [bigint] NOT NULL,
	[SentToBank] [int] NOT NULL,
	[BankReference] [varchar](100) NULL,
	[BankSentDate] [datetime] NULL,
	[BankStatus] [varchar](50) NULL,
	[Processed] [bit] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetTelecomId]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[fn_GetTelecomId](@TransID varchar(50))
  RETURNS varchar(50)
      AS
    BEGIN
		DECLARE @ret varchar(50)
		DECLARE @res varchar(50)
		
		set @ret = (select top 1 TelecomId from Vw_AllReceived where PegPayTranId=@TransID)
		   
		   SET @res = @ret
		return @res
    END
GO
/****** Object:  Table [dbo].[Banks]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Banks](
	[BankId] [int] IDENTITY(1,1) NOT NULL,
	[BankName] [varchar](50) NULL,
	[BankCode] [varchar](50) NOT NULL,
	[BankContactEmail] [varchar](50) NULL,
	[BankPassword] [varchar](50) NULL,
	[IsActive] [varchar](50) NULL,
	[CreatedOn] [datetime] NULL,
	[LastUpdateDate] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedBy] [varchar](50) NULL,
	[PathToLogoImage] [varchar](1300) NULL,
	[PathToPublicKey] [varchar](1300) NULL,
	[ThemeColor] [varchar](50) NULL,
	[NavbarTextColor] [varchar](50) NULL,
	[BankVaultAccNumber] [varchar](50) NULL,
	[BankInterestPayableAccount] [varchar](50) NULL,
	[BankLoanCommissionAccount] [varchar](50) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BankSystemUserChanges]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BankSystemUserChanges](
	[RecordId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](50) NULL,
	[Email] [varchar](50) NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[OtherName] [varchar](50) NULL,
	[Usertype] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[IsActive] [bit] NULL,
	[BankCode] [varchar](50) NULL,
	[DateOfBirth] [varchar](50) NULL,
	[RecordDate] [datetime] NULL,
	[ModifiedOn] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedBy] [varchar](50) NULL,
	[PhoneNumber] [varchar](50) NULL,
	[BranchCode] [varchar](50) NULL,
	[Gender] [varchar](50) NULL,
	[ApprovedBy] [varchar](50) NULL,
	[TranAmountLimit] [varchar](50) NULL,
	[ResetPassword] [bit] NULL,
	[ResetPin] [bit] NULL,
	[Status] [varchar](50) NULL,
	[RejectedBy] [varchar](50) NULL,
	[RejectedOn] [datetime] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DeactivationLog]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[DeactivationLog](
	[RecordId] [bigint] IDENTITY(1,1) NOT NULL,
	[Channel] [varchar](100) NULL,
	[AccountCode] [varchar](100) NULL,
	[UserId] [varchar](50) NULL,
	[RequestAgent] [varchar](200) NULL,
	[IP] [varchar](200) NULL,
	[RecordDate] [datetime] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AccountCategories]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AccountCategories](
	[RecordId] [bigint] IDENTITY(1,1) NOT NULL,
	[AccountCategory] [varchar](100) NOT NULL,
	[AccountCategoryCode] [varchar](50) NOT NULL,
	[BankCode] [varchar](50) NOT NULL,
	[MaxNumberofSignatories] [bigint] NULL,
	[MinNumberofSignatories] [bigint] NULL,
	[IsBankCustomer] [bit] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BankRoles]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BankRoles](
	[RecordId] [int] IDENTITY(1,1) NOT NULL,
	[BankCode] [varchar](50) NULL,
	[RoleCode] [varchar](50) NULL,
	[CreatedOn] [datetime] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BankResponseLog]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BankResponseLog](
	[RecordId] [int] IDENTITY(1,1) NOT NULL,
	[PegPayId] [varchar](50) NOT NULL,
	[BeneficiaryId] [varchar](50) NULL,
	[Msisdn] [varchar](50) NULL,
	[Channel] [varchar](50) NULL,
	[Network] [varchar](50) NULL,
	[OriginatorId] [varchar](50) NULL,
	[TranAmount] [decimal](18, 2) NULL,
	[TranType] [varchar](50) NULL,
	[TranDate] [datetime] NULL,
	[LogDate] [datetime] NULL,
	[StatusCode] [varchar](50) NULL,
	[StatusDescription] [varchar](max) NULL,
	[BankRef] [varchar](50) NULL,
	[RetryDate] [datetime] NULL,
	[CRNarrative] [varchar](100) NULL,
	[DRNarrative] [varchar](100) NULL,
 CONSTRAINT [PK_BankResponseLog] PRIMARY KEY CLUSTERED 
(
	[RecordId] ASC,
	[PegPayId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BankCustomersHistory]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BankCustomersHistory](
	[RecordId] [int] NULL,
	[CustomerId] [nvarchar](50) NULL,
	[Email] [varchar](50) NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[OtherName] [varchar](50) NULL,
	[Pin] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[IsActive] [bit] NULL,
	[BankCode] [varchar](50) NULL,
	[DateOfBirth] [varchar](50) NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedOn] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedBy] [varchar](50) NULL,
	[PhoneNumber] [varchar](50) NULL,
	[BranchCode] [varchar](50) NULL,
	[Gender] [varchar](50) NULL,
	[ApprovedBy] [varchar](50) NULL,
	[PathToProfilePic] [varchar](8000) NULL,
	[PathToSignature] [varchar](8000) NULL,
	[NextOfKinName] [varchar](50) NULL,
	[NextOfKinContact] [varchar](50) NULL,
	[Nationality] [varchar](50) NULL,
	[PlaceOfBirth] [varchar](50) NULL,
	[Salutation] [varchar](50) NULL,
	[MaritalStatus] [varchar](50) NULL,
	[MerchantId] [varchar](50) NULL,
	[UserCategory] [varchar](50) NULL,
	[ResetPassword] [bit] NULL,
	[ResetPin] [bit] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BankCustomersDeleted]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BankCustomersDeleted](
	[RecordId] [int] NOT NULL,
	[CustomerId] [nvarchar](50) NULL,
	[Email] [varchar](50) NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[OtherName] [varchar](50) NULL,
	[Pin] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[IsActive] [bit] NULL,
	[BankCode] [varchar](50) NULL,
	[DateOfBirth] [varchar](50) NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedOn] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedBy] [varchar](50) NULL,
	[PhoneNumber] [varchar](50) NULL,
	[BranchCode] [varchar](50) NULL,
	[Gender] [varchar](50) NULL,
	[ApprovedBy] [varchar](50) NULL,
	[PathToProfilePic] [varchar](max) NULL,
	[PathToSignature] [varchar](max) NULL,
	[NextOfKinName] [varchar](50) NULL,
	[NextOfKinContact] [varchar](50) NULL,
	[Nationality] [varchar](50) NULL,
	[PlaceOfBirth] [varchar](50) NULL,
	[Salutation] [varchar](50) NULL,
	[MaritalStatus] [varchar](50) NULL,
	[MerchantId] [varchar](50) NULL,
	[UserCategory] [varchar](50) NULL,
	[ResetPassword] [bit] NULL,
	[ResetPin] [bit] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[Banks_DeleteRow]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Banks_DeleteRow]	@BankId intASSET NOCOUNT ON
GO
/****** Object:  Table [dbo].[Loans]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Loans](
	[RecordId] [int] IDENTITY(1,1) NOT NULL,
	[LoanID] [varchar](500) NULL,
	[LoanAmount] [decimal](20, 2) NULL,
	[CustomerId] [varchar](50) NULL,
	[CustomerTel] [varchar](50) NULL,
	[AccountNumber] [varchar](50) NULL,
	[LoanAccountNumber] [varchar](50) NULL,
	[LoanType] [varchar](50) NULL,
	[CustomerCreditScore] [decimal](20, 2) NULL,
	[MonthlyInstallmentAmounts] [varchar](50) NULL,
	[InterestRate] [varchar](50) NULL,
	[InterestRateType] [varchar](50) NULL,
	[GracePeriodInDays] [varchar](50) NULL,
	[BussinessSector] [varchar](50) NULL,
	[BussinessDescription] [varchar](50) NULL,
	[LoanApplicationFee] [decimal](18, 2) NULL,
	[LoanProcessingFee] [decimal](18, 2) NULL,
	[RepaymentFrequency] [varchar](50) NULL,
	[NumberInstallments] [int] NULL,
	[InterestDeductedOnDisbursement] [bit] NULL,
	[Comments] [varchar](2250) NULL,
	[BranchCode] [varchar](50) NULL,
	[BankCode] [varchar](50) NULL,
	[ModifiedBy] [varchar](50) NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedOn] [datetime] NULL,
	[CreatedOn] [datetime] NULL,
	[ApprovedBy] [varchar](50) NULL,
	[IsActive] [bit] NULL,
	[Status] [varchar](50) NULL,
	[Reason] [varchar](50) NULL,
	[LastRepaymentDate] [datetime] NULL,
	[MapToPlaceOfResidency] [varchar](50) NULL,
	[Approver] [varchar](50) NULL,
	[RemainingAmount] [decimal](18, 2) NULL,
	[NextRepaymentDate] [datetime] NULL,
	[InterestAcrued] [decimal](18, 2) NULL,
	[NumberOfMissedPayments] [int] NULL,
	[LoanAccountTitle] [varchar](50) NULL,
	[Comments2] [varchar](5050) NULL,
	[Comments3] [varchar](5050) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LiquidationTypes]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LiquidationTypes](
	[RecordId] [bigint] IDENTITY(1,1) NOT NULL,
	[LiquidationCode] [varchar](50) NOT NULL,
	[LiquidationName] [varchar](100) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LiquidationInstructions]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LiquidationInstructions](
	[RecordId] [bigint] IDENTITY(1,1) NOT NULL,
	[AccountNumber] [varchar](50) NOT NULL,
	[BankAccount] [varchar](50) NULL,
	[MerchantCode] [varchar](50) NULL,
	[BankCode] [varchar](50) NOT NULL,
	[BranchCode] [varchar](50) NOT NULL,
	[LiquidationId] [varchar](50) NOT NULL,
	[TransAmount] [money] NOT NULL,
	[RecordDate] [varchar](50) NOT NULL,
	[BankRef] [varchar](50) NULL,
	[BankSentDate] [varchar](50) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CustomerTypes]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CustomerTypes](
	[RecordId] [bigint] IDENTITY(1,1) NOT NULL,
	[CustomerType] [varchar](100) NOT NULL,
	[CustomerTypeCode] [varchar](50) NOT NULL,
	[BankCode] [varchar](50) NULL,
	[Description] [varchar](100) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ReceivedTransactions]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ReceivedTransactions](
	[TranId] [bigint] IDENTITY(1,1) NOT NULL,
	[TransNo] [varchar](50) NULL,
	[CustomerRef] [varchar](50) NULL,
	[CustomerName] [varchar](100) NULL,
	[CustomerType] [varchar](50) NULL,
	[CustomerTel] [varchar](50) NULL,
	[Area] [varchar](50) NULL,
	[TranAmount] [money] NULL,
	[Charge] [money] NULL,
	[PaymentDate] [datetime] NULL,
	[RecordDate] [datetime] NULL,
	[TranType] [varchar](50) NULL,
	[PaymentType] [varchar](50) NULL,
	[UtilityCode] [varchar](50) NULL,
	[MerchantId] [varchar](100) NULL,
	[TranNarration] [varchar](800) NULL,
	[DeviceId] [varchar](100) NULL,
	[BankCode] [varchar](100) NULL,
	[CreatedBy] [varchar](50) NULL,
	[Channel] [varchar](50) NULL,
	[ChannelId] [varchar](50) NULL,
	[Status] [varchar](50) NULL,
	[Reason] [varchar](max) NULL,
	[PaymentId] [varchar](50) NULL,
	[Processed] [varchar](50) NULL,
	[ProcessReason] [nvarchar](4000) NULL,
	[SentToUtility] [varchar](50) NULL,
	[UtilityRef] [varchar](50) NULL,
	[StatusAtUtility] [varchar](50) NULL,
	[ReasonAtUtility] [varchar](50) NULL,
	[UtilitySentDate] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ReceivedPaymentsGatewayRequests]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ReceivedPaymentsGatewayRequests](
	[RecordId] [int] IDENTITY(1,1) NOT NULL,
	[CustRef] [varchar](50) NULL,
	[TranAmount] [varchar](50) NOT NULL,
	[CustomerTel] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[PaymentOptionSelected] [varchar](50) NULL,
	[VendorCode] [varchar](50) NOT NULL,
	[VendorTranId] [varchar](50) NULL,
	[DigitalSignature] [varchar](7050) NULL,
	[ItemDesc] [varchar](50) NULL,
	[ItemTotal] [varchar](50) NULL,
	[ReturnUrl] [varchar](650) NULL,
	[RecordDate] [datetime] NULL,
	[Status] [varchar](50) NULL,
	[Reason] [varchar](50) NULL,
	[CustName] [varchar](50) NULL,
	[SourceIP] [varchar](50) NOT NULL,
	[SourceMachineName] [varchar](50) NOT NULL,
	[RequestDetails] [varchar](max) NULL,
	[Processed] [bit] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[RandomValueView]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[RandomValueView]
AS
SELECT  RAND() AS Value
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetBatchTotal]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[fn_GetBatchTotal](@BatchCode varchar(50),@Confirmed bit)
 RETURNS Money
  AS
    BEGIN
		DECLARE @ret money
		if(@Confirmed = 0)
		SET @ret = (Select ROUND(SUM(TranAmount),0) AS Amount from Reconciled
		Where BatchNo = @BatchCode)
		else
		SET @ret = (Select ROUND(SUM(TranAmount),0) AS Amount from Posted
		Where BatchNo = @BatchCode)
		return @ret
    END
GO
/****** Object:  Table [dbo].[PendingBankCustomerApprovals]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PendingBankCustomerApprovals](
	[RecordId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [nvarchar](50) NULL,
	[Email] [varchar](50) NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[OtherName] [varchar](50) NULL,
	[Pin] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[IsActive] [bit] NULL,
	[BankCode] [varchar](50) NULL,
	[DateOfBirth] [varchar](50) NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedOn] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedBy] [varchar](50) NULL,
	[PhoneNumber] [varchar](50) NULL,
	[BranchCode] [varchar](50) NULL,
	[Gender] [varchar](50) NULL,
	[ApprovedBy] [varchar](50) NULL,
	[PathToProfilePic] [varchar](max) NULL,
	[PathToSignature] [varchar](max) NULL,
	[NextOfKinName] [varchar](50) NULL,
	[NextOfKinContact] [varchar](50) NULL,
	[Nationality] [varchar](50) NULL,
	[PlaceOfBirth] [varchar](50) NULL,
	[Salutation] [varchar](50) NULL,
	[MaritalStatus] [varchar](50) NULL,
	[MerchantId] [varchar](50) NULL,
	[UserCategory] [varchar](50) NULL,
	[ResetPassword] [bit] NULL,
	[ResetPin] [bit] NULL,
	[Comment] [varchar](50) NULL,
	[Action] [varchar](50) NULL,
	[Reason] [varchar](max) NULL,
	[Status] [varchar](50) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AccountEODBalances]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AccountEODBalances](
	[RecordId] [int] IDENTITY(1,1) NOT NULL,
	[BankCode] [varchar](50) NULL,
	[AccountNumber] [varchar](50) NULL,
	[AccountType] [varchar](50) NULL,
	[OpeningBalance] [decimal](18, 2) NULL,
	[ClosingBalance] [decimal](18, 2) NULL,
	[TotalCredits] [money] NULL,
	[TotalDebits] [money] NULL,
	[RecordDate] [datetime] NULL,
	[BalancesDate] [datetime] NULL,
	[InterestAcrued] [decimal](18, 10) NULL,
	[AccountDate] [varchar](50) NULL,
	[AccountingDate] [bigint] NOT NULL,
	[AccountingPeriod] [bigint] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[RollPosted]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[RollPosted]
@VendorCode varchar(60),
@Noted varchar(50)
AS
INSERT INTO Reconciled
                      (TranId, TransNo, CustomerRef, CustomerName, CustomerType, CustomerTel, TranAmount, PaymentDate, RecordDate, TranType, PaymentType, VendorTranId, 
                      ReceiptNo, TranNarration, SmsSent, VendorCode, Teller, VendorToken, RegionCode, DistrictCode, Tariff, Reversal, Cancelled, ReconciledDate, ReconciledBy, 
                      ReconciliationCode, BatchNo, BatchDate, BSUpdated, Source, ReconType)
-------------------------------
SELECT                TranId, TransNo, CustomerRef, CustomerName, CustomerType, CustomerTel, TranAmount, PaymentDate, RecordDate, TranType, PaymentType, VendorTranId, 
                      ReceiptNo, TranNarration, SmsSent, VendorCode, Teller, VendorToken, RegionCode, DistrictCode, Tariff, Reversal, Cancelled,ReconciledDate, ReconciledBy,
                      ReconciliationCode,BatchNo,BatchDate,1, 'RECIEVED','AR'
                      FROM         Posted
WHERE     (VendorCode = 'Airtel Money')
GO
/****** Object:  StoredProcedure [dbo].[RollBackBusupdate]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[RollBackBusupdate]
@BatchCode varchar(50)
AS
UPDATE Reconciled SET BSUpdated = 0
,BatchNo = null
WHERE BatchNo = @BatchCode
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Roles](
	[RecordId] [int] IDENTITY(1,1) NOT NULL,
	[RoleCode] [varchar](50) NULL,
	[RoleName] [varchar](50) NULL,
	[CreatedOn] [datetime] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TellersToAccountsMapping]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TellersToAccountsMapping](
	[RecordId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [varchar](50) NULL,
	[AccountNumber] [varchar](50) NULL,
	[BankCode] [varchar](50) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetNumbersOnly]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[fn_GetNumbersOnly](@pn varchar(100))
Returns varchar(max)
AS
BEGIN
  Declare @r varchar(max) ='', @len int ,@c char(1), @x int = 0

  Select @len = len(@pn)
  while @x <= @len 
  begin
    Select @c = SUBSTRING(@pn,@x,1)
    if ISNUMERIC(@c) = 1 and @c <> '-'
     Select @r = @r + @c

   Select @x = @x +1
  end
return @r
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetNewAccountBalance]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[fn_GetNewAccountBalance] (@initSum bigint, @opValue bigint, @operation varchar(50))
  RETURNS bigint
     AS
      BEGIN
		DECLARE @returnvalue bigint
        if(@operation='DB')
			SET @returnvalue=CONVERT(bigint,@initSum)-CONVERT(bigint,@opValue)
		else if(@operation='CR')
			SET @returnvalue=CONVERT(bigint,@initSum)+CONVERT(bigint,@opValue)
		else if(@operation='CM')
			SET @returnvalue=CONVERT(bigint,@initSum)+CONVERT(bigint,@opValue)
		return CONVERT(bigint,@returnvalue)
      END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetStringAfterCharacter]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[fn_GetStringAfterCharacter] (@string varchar(max),@character varchar(50))
  RETURNS varchar(50)
     AS
      BEGIN
        DECLARE @ret varchar(50)
        
        DECLARE @st1 varchar(max)
		SET @st1 = SUBSTRING(@string, CHARINDEX(':', @string) + 1, LEN(@string))
        SET @ret=@st1 
        return @ret
      END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetReceiptnumber]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[fn_GetReceiptnumber](@TransID bigint)
  RETURNS varchar(50)
      AS
    BEGIN
		DECLARE @ret varchar(50)
		DECLARE @res varchar(50)
		DECLARE @tranCode varchar(50)
		SET @tranCode = (CONVERT( varchar(50),@TransID))
		IF (LEN(@TransID) = 1)
		  SET @ret = '000000'+@tranCode
		ELSE IF (LEN(@TransID) = 2)
		  SET @ret = '00000'+@tranCode
		ELSE IF (LEN(@TransID) = 3)
		  SET @ret = '0000'+@tranCode
		ELSE IF(LEN(@TransID) = 4)
		  SET @ret = '000'+@tranCode
		ELSE IF (LEN(@TransID) = 5)
		  SET @ret = '00'+@tranCode
		ELSE IF (LEN(@TransID) = 6)
		  SET @ret = '0'+@tranCode
		ELSE
		   SET @ret = @tranCode	
		   
		   SET @res = '7'+@ret
		return @res
    END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetReceiptno]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[fn_GetReceiptno](@TransID bigint)
  RETURNS varchar(50)
      AS
    BEGIN
		DECLARE @ret varchar(50)
		DECLARE @res varchar(50)
		DECLARE @tranCode varchar(50)
		SET @tranCode = (CONVERT( varchar(50),@TransID))
		IF (LEN(@TransID) = 1)
		  SET @ret = '000000'+@tranCode
		ELSE IF (LEN(@TransID) = 2)
		  SET @ret = '00000'+@tranCode
		ELSE IF (LEN(@TransID) = 3)
		  SET @ret = '0000'+@tranCode
		ELSE IF(LEN(@TransID) = 4)
		  SET @ret = '000'+@tranCode
		ELSE IF (LEN(@TransID) = 5)
		  SET @ret = '00'+@tranCode
		ELSE IF (LEN(@TransID) = 6)
		  SET @ret = '0'+@tranCode
		ELSE
		   SET @ret = @tranCode	
		   
		   SET @res = '1'+@ret
		return @res
    END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetQueryId]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[fn_GetQueryId](@TransID bigint)
  RETURNS varchar(50)
      AS
    BEGIN
		DECLARE @ret varchar(50)
		DECLARE @res varchar(50)
		DECLARE @tranCode varchar(50)
		SET @tranCode = (CONVERT( varchar(50),@TransID))
		IF (LEN(@TransID) = 1)
		  SET @ret = 'Q000000000000'+@tranCode
		ELSE IF (LEN(@TransID) = 2)
		  SET @ret = 'Q00000000000'+@tranCode
		ELSE IF (LEN(@TransID) = 3)
		  SET @ret = 'Q0000000000'+@tranCode
		ELSE IF(LEN(@TransID) = 4)
		  SET @ret = 'Q000000000'+@tranCode
		ELSE IF (LEN(@TransID) = 5)
		  SET @ret = 'Q00000000'+@tranCode
		ELSE IF (LEN(@TransID) = 6)
		  SET @ret = 'Q0000000'+@tranCode
		ELSE IF (LEN(@TransID) = 7)
		  SET @ret = 'Q000000'+@tranCode
		ELSE IF (LEN(@TransID) = 8)
		  SET @ret = 'Q00000'+@tranCode
		ELSE IF (LEN(@TransID) = 9)
		  SET @ret = 'Q0000'+@tranCode
		ELSE IF(LEN(@TransID) = 10)
		  SET @ret = 'Q000'+@tranCode
		ELSE IF (LEN(@TransID) = 11)
		  SET @ret = 'Q00'+@tranCode
		ELSE IF (LEN(@TransID) = 12)
		  SET @ret = 'Q0'+@tranCode
		ELSE IF (LEN(@TransID) = 13)
		  SET @ret = 'Q'+@tranCode
		ELSE
		   SET @ret = 'Q'+@tranCode	
		   
		   SET @res = @ret
		return @res
    END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetPaymentno]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[fn_GetPaymentno](@TransID bigint)
  RETURNS varchar(50)
      AS
    BEGIN
		DECLARE @ret varchar(50)
		DECLARE @res varchar(50)
		DECLARE @tranCode varchar(50)
		SET @tranCode = (CONVERT( varchar(50),@TransID))
		IF (LEN(@TransID) = 1)
		  SET @ret = '000000'+@tranCode
		ELSE IF (LEN(@TransID) = 2)
		  SET @ret = '00000'+@tranCode
		ELSE IF (LEN(@TransID) = 3)
		  SET @ret = '0000'+@tranCode
		ELSE IF(LEN(@TransID) = 4)
		  SET @ret = '000'+@tranCode
		ELSE IF (LEN(@TransID) = 5)
		  SET @ret = '00'+@tranCode
		ELSE IF (LEN(@TransID) = 6)
		  SET @ret = '0'+@tranCode
		ELSE
		   SET @ret = @tranCode	
		   
		   SET @res = 'P'+@ret
		return @res
    END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetCustomerCode]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[fn_GetCustomerCode] (@Ident bigint)
  RETURNS varchar(50)
     AS
      BEGIN
        DECLARE @ret varchar(50)
        
        if(len(@ident) = 1)
          SET @ret = 'P'+'0000'+Convert(varchar,@Ident)
        else if(len(@ident) = 2)
          SET @ret = 'P'+'000'+Convert(varchar,@Ident)
        else if(len(@ident) = 3)
          SET @ret = 'P'+'00'+Convert(varchar,@Ident)
        else if(len(@ident) = 4)
          SET @ret = 'P'+'0'+Convert(varchar,@Ident)
        else
           SET @ret = 'P'+Convert(varchar,@Ident)
  
        return @ret
      END
GO
/****** Object:  Table [dbo].[CustomersToAccountsMapping]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CustomersToAccountsMapping](
	[RecordId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [varchar](50) NULL,
	[AccountNumber] [varchar](50) NULL,
	[BankCode] [varchar](50) NULL,
	[CreatedOn] [datetime] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ChargeTypes]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ChargeTypes](
	[ChargeTypeId] [int] IDENTITY(1,1) NOT NULL,
	[ChargeTypeCode] [varchar](50) NULL,
	[ChargeTypeName] [varchar](50) NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedOn] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedBy] [varchar](50) NULL,
	[BankCode] [varchar](50) NULL,
	[Description] [varchar](50) NULL,
	[IsActive] [bit] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Collaterals]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Collaterals](
	[RecordId] [int] IDENTITY(1,1) NOT NULL,
	[CollateralId] [varchar](50) NULL,
	[CollateralType] [varchar](50) NULL,
	[TitleOfOwnershipName] [varchar](50) NULL,
	[PathToTitleOfOwnershipPic] [varchar](50) NULL,
	[OwnerId] [varchar](50) NULL,
	[BankCode] [varchar](50) NULL,
	[ValueOfCollateral] [money] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[ModifiedOn] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[CreatedOn] [datetime] NULL,
	[LoanID] [varchar](50) NULL,
	[DescriptionOfCollateral] [varchar](7050) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CollateralTypes]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CollateralTypes](
	[RecordID] [int] IDENTITY(1,1) NOT NULL,
	[CollateralTypeCode] [varchar](50) NULL,
	[CollateralTypeName] [varchar](50) NULL,
	[BankCode] [varchar](50) NULL,
	[ModifiedBy] [varchar](50) NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedOn] [datetime] NULL,
	[CreatedOn] [datetime] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetinternetworkReceiptno]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create function [dbo].[fn_GetinternetworkReceiptno](@TransID bigint)
  RETURNS varchar(50)
      AS
    BEGIN
		DECLARE @ret varchar(50)
		DECLARE @res varchar(50)
		DECLARE @tranCode varchar(50)
		SET @tranCode = (CONVERT( varchar(50),@TransID))
		IF (LEN(@TransID) = 1)
		  SET @ret = '00000'+@tranCode
		ELSE IF (LEN(@TransID) = 2)
		  SET @ret = '0000'+@tranCode
		ELSE IF (LEN(@TransID) = 3)
		  SET @ret = '000'+@tranCode
		ELSE IF(LEN(@TransID) = 4)
		  SET @ret = '00'+@tranCode
		ELSE IF (LEN(@TransID) = 5)
		  SET @ret = '0'+@tranCode
		ELSE
		   SET @ret = @tranCode	
		return @ret
    END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetDistrictTotal]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[fn_GetDistrictTotal](@DistrictCode varchar(50),@fromDate datetime, @toDate datetime,@Status varchar(50))
  RETURNS Money
  AS
    BEGIN
		DECLARE @ret money
        if(@Status = '0')
        SET @ret = (Select SUM(TranAmount) from Transactions 
                     Where DistrictCode = @DistrictCode 
                      AND Convert(varchar(12),RecordDate,102) >= Convert(varchar(12),@fromDate,102)
                      AND Convert(varchar(12),RecordDate,102) <= Convert(varchar(12),@toDate,102))
        else if(@Status = '1')
         SET @ret = (Select SUM(TranAmount) from Received 
                     Where DistrictCode = @DistrictCode 
                      AND Convert(varchar(12),RecordDate,102) >= Convert(varchar(12),@fromDate,102)
                      AND Convert(varchar(12),RecordDate,102) <= Convert(varchar(12),@toDate,102))
       else if(@Status = '2')
         SET @ret = (Select SUM(TranAmount) from Reconciled 
                     Where DistrictCode = @DistrictCode 
                      AND Convert(varchar(12),RecordDate,102) >= Convert(varchar(12),@fromDate,102)
                      AND Convert(varchar(12),RecordDate,102) <= Convert(varchar(12),@toDate,102)
                      AND BSUpdated = 0)
        else if(@Status = '3')
         SET @ret = (Select SUM(TranAmount) from Reconciled 
                     Where DistrictCode = @DistrictCode 
                      AND Convert(varchar(12),RecordDate,102) >= Convert(varchar(12),@fromDate,102)
                      AND Convert(varchar(12),RecordDate,102) <= Convert(varchar(12),@toDate,102)
                      AND BSUpdated = 1)
         else 
         SET @ret = (Select SUM(TranAmount) from Posted 
                     Where DistrictCode = @DistrictCode 
                      AND Convert(varchar(12),RecordDate,102) >= Convert(varchar(12),@fromDate,102)
                      AND Convert(varchar(12),RecordDate,102) <= Convert(varchar(12),@toDate,102))
     
         	return @ret
    END
GO
/****** Object:  Table [dbo].[BankChargesForMerchants]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BankChargesForMerchants](
	[ChargeId] [int] IDENTITY(1,1) NOT NULL,
	[MerchantId] [varchar](50) NOT NULL,
	[TransCategory] [varchar](50) NOT NULL,
	[BankCode] [varchar](50) NOT NULL,
	[ChargeCode] [varchar](50) NOT NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedBy] [varchar](50) NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedOn] [datetime] NULL,
	[IsActive] [varchar](50) NULL,
	[IsChargePassedOnToTheCustomer] [bit] NULL,
	[PaymentType] [varchar](50) NOT NULL,
 CONSTRAINT [PK_BankChargesForMerchants] PRIMARY KEY CLUSTERED 
(
	[MerchantId] ASC,
	[TransCategory] ASC,
	[BankCode] ASC,
	[ChargeCode] ASC,
	[PaymentType] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BankCharges]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BankCharges](
	[ChargeId] [int] IDENTITY(1,1) NOT NULL,
	[ChargeCode] [varchar](50) NULL,
	[ChargeName] [varchar](50) NULL,
	[MinimumValue] [bigint] NULL,
	[MaximumValue] [bigint] NULL,
	[ChargeAmount] [decimal](18, 2) NULL,
	[BankCode] [varchar](50) NULL,
	[ChargeType] [varchar](50) NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedBy] [varchar](50) NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedOn] [datetime] NULL,
	[IsActive] [varchar](50) NULL,
	[TaxPercentage] [decimal](18, 2) NOT NULL,
	[PegasusPercentage] [decimal](18, 2) NOT NULL,
	[SbuPercentage] [decimal](18, 2) NOT NULL,
	[IsSplit] [bit] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Utilities]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Utilities](
	[RecordId] [int] IDENTITY(1,1) NOT NULL,
	[UtilityName] [varchar](50) NULL,
	[UtilityCode] [varchar](50) NULL,
	[CommissionAccount] [varchar](50) NULL,
	[IsActive] [bit] NULL,
	[BankCode] [varchar](50) NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedBy] [varchar](50) NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedOn] [datetime] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PaymentsGatewayRequests]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PaymentsGatewayRequests](
	[RecordId] [int] IDENTITY(1,1) NOT NULL,
	[CustRef] [varchar](50) NULL,
	[TranAmount] [varchar](50) NOT NULL,
	[CustomerTel] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[PaymentOptionSelected] [varchar](50) NULL,
	[VendorCode] [varchar](50) NOT NULL,
	[VendorTranId] [varchar](50) NULL,
	[DigitalSignature] [varchar](7050) NULL,
	[ItemDesc] [varchar](50) NULL,
	[ItemTotal] [varchar](50) NULL,
	[ReturnUrl] [varchar](650) NULL,
	[RecordDate] [datetime] NULL,
	[Status] [varchar](50) NULL,
	[Reason] [varchar](50) NULL,
	[CustName] [varchar](50) NULL,
	[SourceIP] [varchar](50) NOT NULL,
	[SourceMachineName] [varchar](50) NOT NULL,
	[MerchantCode] [varchar](50) NULL,
	[StatusCode] [varchar](50) NULL,
	[StatusDescription] [varchar](max) NULL,
	[TransactionRef] [varchar](10) NULL,
	[Processed] [bit] NULL,
	[CurrencyCode] [varchar](50) NULL,
	[ChargeAmount] [decimal](18, 2) NULL,
	[SentToUtility] [bit] NULL,
	[UtilityRef] [varchar](50) NULL,
	[StatusAtUtility] [varchar](50) NULL,
	[ReasonAtUtility] [varchar](50) NULL,
	[UtilitySentDate] [datetime] NULL,
	[SmsSent] [bit] NULL,
	[Teller] [varchar](50) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[UpdatePayment]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[UpdatePayment]
@Recieptno varchar(100),
@VendorRef varchar(100),
@mReceiptno varchar(100)
AS
BEGIN
	UPDATE    Payments
	SET              RecieptNo = @Recieptno, Sent = 1
	WHERE VendorRef = @VendorRef
END

BEGIN
    UPDATE Received SET ReceiptNo = @mReceiptno
    WHERE VendorTranId = @VendorRef
END
GO
/****** Object:  Table [dbo].[AccountEODBalances2]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AccountEODBalances2](
	[RecordId] [int] NULL,
	[BankCode] [varchar](50) NULL,
	[AccountNumber] [varchar](50) NULL,
	[AccountType] [varchar](50) NULL,
	[OpeningBalance] [decimal](18, 2) NULL,
	[ClosingBalance] [decimal](18, 2) NULL,
	[TotalCredits] [money] NULL,
	[TotalDebits] [money] NULL,
	[RecordDate] [datetime] NULL,
	[BalancesDate] [datetime] NULL,
	[InterestAcrued] [decimal](18, 10) NULL,
	[AccountDate] [varchar](50) NULL,
	[AccountingDate] [bigint] NOT NULL,
	[AccountingPeriod] [bigint] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AccountTypes]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AccountTypes](
	[AccTypeId] [int] IDENTITY(1,1) NOT NULL,
	[AccTypeName] [varchar](50) NULL,
	[AccTypeCode] [varchar](50) NULL,
	[MinimumBal] [money] NULL,
	[BankCode] [varchar](50) NULL,
	[IsDebitable] [bit] NULL,
	[Description] [varchar](150) NULL,
	[ModifiedBy] [varchar](50) NULL,
	[CreatedBy] [varchar](50) NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedOn] [datetime] NULL,
	[IsActive] [bit] NULL,
	[MinNumberOfSignatories] [int] NULL,
	[MaxNumberOfSignatories] [int] NULL,
	[AccountCategory] [varchar](50) NULL,
	[InterestRate] [decimal](18, 2) NULL,
	[InterestRateType] [varchar](50) NULL,
	[InterestPayOutFrequency] [varchar](50) NULL,
 CONSTRAINT [PK_AccountTypes] PRIMARY KEY CLUSTERED 
(
	[AccTypeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[GetActivePayTypes]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[GetActivePayTypes]
AS
SELECT     PaymentCode, ShortName, PaymentType
FROM         PayTypes
WHERE Active = 1 AND Referenced = 0
GO
/****** Object:  Table [dbo].[UsersToAccounts]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UsersToAccounts](
	[RecordId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [varchar](50) NULL,
	[AccountNumber] [varchar](50) NULL,
	[BankCode] [varchar](50) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserLoginLog]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[UserLoginLog](
	[RecordId] [bigint] IDENTITY(1,1) NOT NULL,
	[Channel] [varchar](100) NULL,
	[RequestAgent] [varchar](200) NULL,
	[IP] [varchar](50) NULL,
	[userId] [varchar](50) NULL,
	[SessionKey] [varchar](200) NULL,
	[status] [varchar](50) NULL,
	[category] [varchar](50) NULL,
	[description] [nvarchar](4000) NULL,
	[CreationDate] [datetime] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserAccessRules]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserAccessRules](
	[RecordId] [int] IDENTITY(1,1) NOT NULL,
	[UserType] [varchar](50) NULL,
	[Page] [varchar](50) NULL,
	[BankCode] [varchar](50) NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedOn] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UrlRedirects]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UrlRedirects](
	[RecordId] [int] IDENTITY(1,1) NOT NULL,
	[EditType] [varchar](50) NULL,
	[Url] [varchar](850) NULL,
	[UserTypeWhoCanView] [varchar](850) NULL,
	[Name] [varchar](50) NULL,
	[StoredProc] [varchar](50) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[Vw_Transactions1]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Vw_Transactions1]
AS
SELECT     RecordId, FromAccount, CustName,VendorTranId,PegPayTranId, TranAmount, TranCharge, MNOCharge, CashOutCharge, PaymentDate, RecordDate, Status, ToAccount, TranType, PaymentType, 
                      FromNetwork, ToNetwork, VendorCode, SentToVendor, SentDate, TelecomId, Reason, StatusCode,TransCategory,ReversedTrans,Phone,Narration,ReconciledDate,ReconciliationCode,ReconType, 'NO' AS Reconciled, 'NONE' AS ReconciledBy, 1 AS Status2 
                      
FROM         ReceivedTransaction
UNION
SELECT      RecordId, FromAccount, CustName,VendorTranId,PegPayTranId, TranAmount, TranCharge, MNOCharge, CashOutCharge, PaymentDate, RecordDate, Status, ToAccount, TranType, PaymentType, 
                      FromNetwork, ToNetwork, VendorCode, SentToVendor, SentDate, TelecomId, Reason, StatusCode,TransCategory,ReversedTrans,Phone,Narration,ReconciledDate,ReconciliationCode,ReconType, 'YES' AS Reconciled,ReconciledBy, 1 AS Status2 
FROM         ReconciledTransactions
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetTotalCommission]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[fn_GetTotalCommission](@AgentCode varchar(50),@fromDate datetime, @toDate datetime,@TranCategory varchar(50))
  RETURNS Money
  AS
    BEGIN
		DECLARE @ret money
        if(@TranCategory = '02')
        SET @ret = (Select SUM(TranAmount) from Vw_Transactions 
                     Where VendorCode = @AgentCode and TransCategory=@TranCategory
                      AND Convert(varchar(12),RecordDate,102) >= Convert(varchar(12),@fromDate,102)
                      AND Convert(varchar(12),RecordDate,102) <= Convert(varchar(12),@toDate,102))
        else if(@TranCategory = '03')
         SET @ret = (Select SUM(TranAmount) from Vw_Transactions 
                     Where VendorCode = @AgentCode and TransCategory=@TranCategory
                      AND Convert(varchar(12),RecordDate,102) >= Convert(varchar(12),@fromDate,102)
                      AND Convert(varchar(12),RecordDate,102) <= Convert(varchar(12),@toDate,102))
     
         	return @ret
    END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetDebitSum]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[fn_GetDebitSum](@AccountNumber varchar(50),@Date date)
  RETURNS money
      AS
    BEGIN
    Declare @SumOfDebits money
    select @SumOfDebits = Isnull(SUM(TranAmount),0)
		from Vw_Transactions with(NOLOCK)
		where FromAccount = @AccountNumber and CONVERT(date,RecordDate)= CONVERT(date,@Date)
    return @SumOfDebits
    END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetDebitCount]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[fn_GetDebitCount](@AccountNumber varchar(50),@Date date)
  RETURNS bigint
      AS
    BEGIN
    Declare @CountOfDebits bigint
    select @CountOfDebits = Isnull(count(RecordId),0)
		from Vw_Transactions with(NOLOCK)
		where FromAccount = @AccountNumber and CONVERT(date,RecordDate)= CONVERT(date,@Date)
    return @CountOfDebits
    END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetCreditSum]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[fn_GetCreditSum](@AccountNumber varchar(50),@Date date)
  RETURNS money
      AS
    BEGIN
    Declare @SumOfCredits money
		select @SumOfCredits = Isnull(SUM(TranAmount),0)
		from Vw_Transactions with(NOLOCK)
		where ToAccount = @AccountNumber and CONVERT(date,RecordDate)= CONVERT(date,@Date)
    return @SumOfCredits
    END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetCreditCount]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[fn_GetCreditCount](@AccountNumber varchar(50),@Date date)
  RETURNS bigint
      AS
    BEGIN
    Declare @CountOfCredits bigint
		select @CountOfCredits = Isnull(count(RecordId),0)
		from Vw_Transactions with(NOLOCK)
		where (TransCategory='01' or TransCategory='05')  and ToAccount = @AccountNumber and CONVERT(date,RecordDate)= CONVERT(date,@Date)
    return @CountOfCredits
    END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetAgentShares]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[fn_GetAgentShares](@AgentCode varchar(50),@fromDate datetime, @toDate datetime,@percentage money)
  RETURNS Money
  AS
    BEGIN
		DECLARE @ret money
		DECLARE @ret1 money
		DECLARE @ret2 money
		DECLARE @ret3 money
		DECLARE @ret4 money
		DECLARE @ret5 money
		DECLARE @ret6 money
		DECLARE @ret7 money
        DECLARE @ret8 money
        DECLARE @ret9 money
        DECLARE @ret10 money
        DECLARE @ret11 money
        DECLARE @ret12 money
        
        --if(@Status = '0')
        SET @ret1 = (select (((190-110 )*@percentage)*COUNT(*)) from Vw_Transactions 
where  PaymentDate between @fromDate and @toDate
and VendorCode = @AgentCode and  TransCategory='01' and TranType='1'  and TranAmount between 0 and 499)

 SET @ret2 = (select (((190-110 )*@percentage)*COUNT(*)) from Vw_Transactions 
where  PaymentDate between @fromDate and @toDate
and VendorCode = @AgentCode and  TransCategory='01' and TranType='1'  and TranAmount between 500 and 2500)

 SET @ret3 = (select (((330-140 )*@percentage)*COUNT(*))  
from Vw_Transactions 
where  PaymentDate between @fromDate and @toDate
and VendorCode = @AgentCode and  TransCategory='01' and TranType='1'  and TranAmount between 2501 and 5000)

 SET @ret4 = (select (((1000-500 )*@percentage)*COUNT(*))
from Vw_Transactions 
where  PaymentDate between @fromDate and @toDate
and VendorCode = @AgentCode and  TransCategory='01' and TranType='1'  and TranAmount between 5001 and 15000)

 SET @ret5 = (select (((1600-500 )*@percentage)*COUNT(*))
from Vw_Transactions 
where  PaymentDate between @fromDate and @toDate
and VendorCode = @AgentCode and  TransCategory='01' and TranType='1'  and TranAmount between 15001 and 30000)

 SET @ret6 = (select (((2000-500 )*@percentage)*COUNT(*)) 
from Vw_Transactions 
where  PaymentDate between @fromDate and @toDate
and VendorCode = @AgentCode and  TransCategory='01' and TranType='1'  and TranAmount between 30001 and 45000)

 SET @ret6 = (select (((2650-550 )*@percentage)*COUNT(*))
from Vw_Transactions 
where  PaymentDate between @fromDate and @toDate
and VendorCode = @AgentCode and  TransCategory='01' and TranType='1'  and TranAmount between 45001 and 60000)

 SET @ret7 = (select (((3500-660 )*@percentage)*COUNT(*))
from Vw_Transactions 
where  PaymentDate between @fromDate and @toDate
and VendorCode = @AgentCode and  TransCategory='01' and TranType='1'  and TranAmount between 60001 and 125000)

 SET @ret8 = (select (((3950-950 )*@percentage)*COUNT(*)) 
from Vw_Transactions 
where  PaymentDate between @fromDate and @toDate
and VendorCode = @AgentCode and  TransCategory='01' and TranType='1'  and TranAmount between 125001 and 250000)

 SET @ret9 = (select (((5050-1250 )*@percentage)*COUNT(*))
from Vw_Transactions 
where  PaymentDate between @fromDate and @toDate
and VendorCode = @AgentCode and  TransCategory='01' and TranType='1'  and TranAmount between 250001 and 500000)

 SET @ret10 = (select (((10700-3200 )*@percentage)*COUNT(*))  
from Vw_Transactions 
where  PaymentDate between @fromDate and @toDate
and VendorCode = @AgentCode and  TransCategory='01' and TranType='1'  and TranAmount between 500001 and 1000000)

 SET @ret11 = (select (((20500-5500 )*@percentage)*COUNT(*))
from Vw_Transactions 
where  PaymentDate between @fromDate and @toDate
and VendorCode = @AgentCode and  TransCategory='01' and TranType='1'  and TranAmount between 1000001 and 2000000)

 SET @ret12 = (select (((40000-10000 )*@percentage)*COUNT(*))
from Vw_Transactions 
where  PaymentDate between @fromDate and @toDate
and VendorCode = @AgentCode and  TransCategory='01' and TranType='1'  and TranAmount between 2000001 and 4000000)
      
     SET @ret=@ret1+@ret2+@ret3+@ret4+@ret5+@ret6+@ret7+@ret8+@ret9+@ret10+@ret11+@ret12
     
         	return @ret
    END
GO
/****** Object:  Table [dbo].[UserTypes]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserTypes](
	[UserTypeId] [int] IDENTITY(1,1) NOT NULL,
	[UserType] [varchar](50) NULL,
	[Role] [varchar](50) NULL,
	[Description] [varchar](50) NULL,
	[BankCode] [varchar](50) NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedOn] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedBy] [varchar](50) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetBatchTransferTotal]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[fn_GetBatchTransferTotal](@BatchCode varchar(50))
  RETURNS money
     AS
      BEGIN
         DECLARE @return money
         SET @return = (Select sum(isnull(Amount,0)) AS Amount from TransferBatchDetails 
              Where BatchNo = @BatchCode and Excluded = 0)
          return @return
      END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetBatchAmountTotal]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[fn_GetBatchAmountTotal](@BatchCode varchar(50),@Status Varchar(50),@Type varchar(50))
 RETURNS Money
  AS
    BEGIN
		DECLARE @ret money
		if(@Status = 'ALL')
			BEGIN
			if(@Type='MAIN')
				BEGIN
				SET @ret = (Select ISNULL( ROUND(SUM(TranAmount),0),0 )AS Amount from Vw_ALLTransactions
				Where
				TransCategory='01'
				and VendorTranId in(Select PaymentNo from TransferBatchDetails where BatchNo = @BatchCode))
				END
			else
				BEGIN
				SET @ret = (Select ISNULL( ROUND(SUM(TranAmount),0),0 )AS Amount from Vw_ALLTransactions
				Where
				TransCategory<>'01'
				and VendorTranId in(Select PaymentNo from TransferBatchDetails where BatchNo = @BatchCode))
				END	
			END
		else
		BEGIN
			if(@Type='MAIN')
				BEGIN
				SET @ret = (Select ISNULL( ROUND(SUM(TranAmount),0),0 ) AS Amount from DeletedTransaction
				Where
				TransCategory='01'
				and VendorTranId in(Select PaymentNo from TransferBatchDetails where BatchNo = @BatchCode))
				END
			else
				BEGIN
				SET @ret = (Select ISNULL( ROUND(SUM(TranAmount),0),0 ) AS Amount from DeletedTransaction
				Where
				TransCategory<>'01'
				and VendorTranId in(Select PaymentNo from TransferBatchDetails where BatchNo = @BatchCode))
				END	
			END
			return @ret
    END
GO
/****** Object:  Table [dbo].[TranSets]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TranSets](
	[RecordId] [int] IDENTITY(1,1) NOT NULL,
	[TranType] [varchar](50) NULL,
	[PaymentType] [varchar](50) NULL,
	[TranSet] [datetime] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[TXTXPosted]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[TXTXPosted]
@VendorCode varchar(60),
@Noted varchar(50)
AS

bEGIN

	INSERT INTO Reconciled
						  (TranId, TransNo, CustomerRef, CustomerName, CustomerType, CustomerTel, TranAmount, PaymentDate, RecordDate, TranType, PaymentType, VendorTranId, 
						  ReceiptNo, TranNarration, SmsSent, VendorCode, Teller, VendorToken, RegionCode, DistrictCode, Tariff, Reversal, Cancelled, ReconciledDate, ReconciledBy, 
						  ReconciliationCode, BatchNo, BatchDate, BSUpdated, Source, ReconType)
	-------------------------------
	SELECT                TranId, TransNo, CustomerRef, CustomerName, CustomerType, CustomerTel, TranAmount, PaymentDate, RecordDate, TranType, PaymentType, VendorTranId, 
						  ReceiptNo, TranNarration, SmsSent, VendorCode, Teller, VendorToken, RegionCode, DistrictCode, Tariff, Reversal, Cancelled,ReconciledDate, ReconciledBy,
						  ReconciliationCode,BatchNo,BatchDate,1, 'RECIEVED','AR'
						  FROM         Posted
	WHERE     (BatchNo = @VendorCode)
END

BEGIN
    INSERT INTO PostedTransBin
                      (Id, TranId, TransNo, CustomerRef, CustomerName, CustomerType, CustomerTel, TranAmount, PaymentDate, RecordDate, TranType, PaymentType, VendorTranId, 
                      ReceiptNo, TranNarration, SmsSent, VendorCode, Teller, VendorToken, RegionCode, DistrictCode, Tariff, Reversal, Cancelled, ReconciledDate, ReconciledBy, 
                      ReconciliationCode, BatchNo, BatchDate, PostDate, PostedBy,Reason)

    SELECT     Id, TranId, TransNo, CustomerRef, CustomerName, CustomerType, CustomerTel, TranAmount, PaymentDate, RecordDate, TranType, PaymentType, VendorTranId, 
                      ReceiptNo, TranNarration, SmsSent, VendorCode, Teller, VendorToken, RegionCode, DistrictCode, Tariff, Reversal, Cancelled, ReconciledDate, ReconciledBy, 
                      ReconciliationCode, BatchNo, BatchDate, PostDate, PostedBy,'BATCH FAILURE'
    FROM         Posted
   WHERE     (BatchNo = @VendorCode)
END

BEGIN
    DELETE FROM Posted WHERE BatchNo = @VendorCode
END
GO
/****** Object:  View [dbo].[Vw_CorporateUsers]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Vw_CorporateUsers]
AS
SELECT     dbo.SystemUsers.Userid, dbo.SystemUsers.FirstName, dbo.SystemUsers.SurName, dbo.SystemUsers.Username, dbo.SystemUsers.UserPassword, 
                      dbo.SystemUsers.RoleCode, dbo.SystemUsers.UserBranch, dbo.SystemRoles.RoleName, 
                      dbo.Customers.Fname AS Company,dbo.SystemUsers.Active, dbo.SystemUsers.CreateDate
FROM         dbo.SystemUsers INNER JOIN
                      dbo.SystemRoles ON dbo.SystemUsers.RoleCode = dbo.SystemRoles.RoleCode INNER JOIN
                      dbo.Customers ON dbo.Customers.CustomerCode = dbo.SystemUsers.UserBranch
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "SystemUsers"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 114
               Right = 211
            End
            DisplayFlags = 280
            TopColumn = 8
         End
         Begin Table = "SystemRoles"
            Begin Extent = 
               Top = 6
               Left = 249
               Bottom = 114
               Right = 400
            End
            DisplayFlags = 280
            TopColumn = 3
         End
         Begin Table = "Customers"
            Begin Extent = 
               Top = 6
               Left = 438
               Bottom = 114
               Right = 630
            End
            DisplayFlags = 280
            TopColumn = 2
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Vw_CorporateUsers'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Vw_CorporateUsers'
GO
/****** Object:  Table [dbo].[SystemDateSettings]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SystemDateSettings](
	[RecordId] [bigint] IDENTITY(1,1) NOT NULL,
	[AccountingDate] [bigint] NOT NULL,
	[AccountingPeriod] [bigint] NOT NULL,
	[IsClosed] [bit] NOT NULL,
	[RecordDate] [datetime] NOT NULL,
	[BankCode] [varchar](50) NOT NULL,
 CONSTRAINT [PK_SystemDateSettings] PRIMARY KEY CLUSTERED 
(
	[AccountingDate] ASC,
	[BankCode] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[InterestRateTypes]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[InterestRateTypes](
	[RecordId] [int] IDENTITY(1,1) NOT NULL,
	[InterestTypeName] [varchar](50) NULL,
	[InterestTypeCode] [varchar](50) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[SpGenerateRandomString]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SpGenerateRandomString]
@sLength tinyint = 10
AS
BEGIN
SET NOCOUNT ON
DECLARE @counter tinyint
DECLARE @nextChar char(1)
DECLARE @randomString varchar(50)
SET @counter = 1
SET @randomString =''

WHILE @counter <= @sLength
BEGIN
	SELECT @nextChar = CHAR(48 + CONVERT(INT, (122-48+1)*RAND()))

	IF ASCII(@nextChar) not in (58,59,60,61,62,63,64,91,92,93,94,95,96)
	BEGIN
		SELECT @randomString = @randomString + @nextChar
		SET @counter = @counter + 1
	END
END
SELECT @randomString
END
GO
/****** Object:  StoredProcedure [dbo].[SearchNotificationsTables]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SearchNotificationsTables]
@BankCode varchar(50),
@Phone varchar(50),
@StartDate varchar(50),
@EndDate varchar(50)
as
select top 100 Address as EmailOrPhone,MailMessage as Message,MailDate as RecordDate,Status,Status as Reference
from TestCoreBankingDB.dbo.Email A
inner join TestCoreBankingDB.dbo.EmailAddresses B on A.MailId=B.MailId 
where 
(Address like '%'+@Phone+'%') and
(@StartDate='' or MailDate>=@StartDate) and
(@EndDate='' or MailDate<=@EndDate) and
MailFrom like '%Stanbic%'
union
select top 500 Phone as EmailOrPhone,Message,RecordDate,case when Reference='' then 'PENDING' else 'SUCCESS' End as Status,Reference
from LiveGenericPegPayApi.dbo.SMSOutbox where
(Phone = @Phone) and
(@StartDate='' or RecordDate>=@StartDate) and
(@EndDate='' or RecordDate<=@EndDate) and 
Mask='FLEXIPAY'
order by RecordDate desc
GO
/****** Object:  Table [dbo].[SessionLog]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SessionLog](
	[RecordId] [bigint] IDENTITY(1,1) NOT NULL,
	[SessionKey] [varchar](200) NULL,
	[Status] [varchar](50) NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedOn] [datetime] NULL,
 CONSTRAINT [PK_SessionLog] PRIMARY KEY CLUSTERED 
(
	[RecordId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RepaymentFrequencies]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RepaymentFrequencies](
	[RecordId] [int] IDENTITY(1,1) NOT NULL,
	[RepaymentFreqCode] [varchar](50) NULL,
	[RepaymentFreqName] [varchar](50) NULL,
	[DurationInDays] [decimal](18, 2) NULL,
	[BankCode] [varchar](50) NULL,
	[ModifiedBy] [varchar](50) NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedOn] [datetime] NULL,
	[CreatedOn] [datetime] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RejectLoans]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RejectLoans](
	[RecordId] [int] IDENTITY(1,1) NOT NULL,
	[LoanID] [varchar](500) NULL,
	[LoanAmount] [decimal](20, 2) NULL,
	[CustomerId] [varchar](50) NULL,
	[CustomerTel] [varchar](50) NULL,
	[AccountNumber] [varchar](50) NULL,
	[LoanAccountNumber] [varchar](50) NULL,
	[LoanType] [varchar](50) NULL,
	[CustomerCreditScore] [decimal](20, 2) NULL,
	[RepaymentPeriod] [varchar](50) NULL,
	[InterestRate] [varchar](50) NULL,
	[BankCode] [varchar](50) NULL,
	[ModifiedBy] [varchar](50) NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedOn] [datetime] NULL,
	[CreatedOn] [datetime] NULL,
	[ApprovedBy] [varchar](50) NULL,
	[IsActive] [bit] NULL,
	[Status] [varchar](50) NULL,
	[Reason] [varchar](50) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RejectionLogs]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RejectionLogs](
	[RecordId] [bigint] IDENTITY(1,1) NOT NULL,
	[AccountCode] [varchar](50) NOT NULL,
	[BankCode] [varchar](50) NOT NULL,
	[Comment] [varchar](max) NOT NULL,
	[CommentBy] [varchar](100) NULL,
	[RecordDate] [datetime] NULL,
	[IsActive] [bit] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RejectedTransactionRequests]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RejectedTransactionRequests](
	[RecordId] [int] NOT NULL,
	[CustomerName] [varchar](50) NULL,
	[AccountNumber] [varchar](50) NULL,
	[ToAccount] [varchar](50) NULL,
	[FromAccount] [varchar](50) NULL,
	[TranAmount] [money] NULL,
	[TranCategory] [varchar](50) NULL,
	[PaymentDate] [datetime] NULL,
	[RecordDate] [datetime] NULL,
	[Teller] [varchar](50) NULL,
	[ApprovedBy] [varchar](50) NULL,
	[BankCode] [varchar](50) NULL,
	[BranchCode] [varchar](50) NULL,
	[Narration] [varchar](50) NULL,
	[RequiresApproval] [bit] NULL,
	[Approver] [varchar](50) NULL,
	[Status] [varchar](50) NULL,
	[Reason] [varchar](8000) NULL,
	[CurrencyCode] [varchar](50) NULL,
	[PaymentType] [varchar](50) NULL,
	[ChequeNumber] [varchar](50) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MerchantCustomers]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MerchantCustomers](
	[RecordId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerRef] [nvarchar](50) NOT NULL,
	[CustomerName] [varchar](50) NULL,
	[CustomerTel] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[AccountCode] [varchar](50) NOT NULL,
	[IsActive] [bit] NULL,
	[BankCode] [varchar](50) NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedOn] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedBy] [varchar](50) NULL,
	[Extra1] [varchar](50) NULL,
	[Extra2] [varchar](50) NULL,
	[Extra3] [varchar](50) NULL,
	[ApprovedBy] [varchar](50) NULL,
	[MarkedForDeletion] [bit] NULL,
	[MarkedForDeletionBy] [varchar](50) NULL,
	[MarkedForDeletionOn] [datetime] NULL,
	[Amount] [decimal](18, 2) NULL,
 CONSTRAINT [PK_MerchantCustomers] PRIMARY KEY CLUSTERED 
(
	[CustomerRef] ASC,
	[AccountCode] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MenuMerchants]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MenuMerchants](
	[RecordId] [int] IDENTITY(1,1) NOT NULL,
	[MerchantId] [varchar](100) NULL,
	[Category] [varchar](50) NULL,
	[BankCode] [varchar](50) NULL,
	[Active] [bit] NULL,
	[RecordDate] [datetime] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GroupMembers]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GroupMembers](
	[RecordId] [int] IDENTITY(1,1) NOT NULL,
	[BankCode] [varchar](50) NULL,
	[CustomerID] [varchar](50) NULL,
	[GroupID] [varchar](50) NULL,
	[LoanID] [varchar](50) NULL,
	[Amount] [decimal](18, 2) NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedBy] [varchar](50) NULL,
	[ModifiedOn] [datetime] NULL,
	[CreatedOn] [datetime] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MarketPlaceRequests]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MarketPlaceRequests](
	[RecordId] [int] IDENTITY(1,1) NOT NULL,
	[VendorId] [varchar](50) NOT NULL,
	[CustomerRef] [varchar](50) NULL,
	[CustomerTel] [varchar](50) NULL,
	[ServiceCode] [varchar](50) NULL,
	[Amount] [varchar](50) NULL,
	[RecordDate] [datetime] NULL,
	[Status] [varchar](50) NULL,
	[Area] [varchar](50) NULL,
	[MerchantCode] [varchar](50) NULL,
 CONSTRAINT [PK_MarketPlaceRequests] PRIMARY KEY CLUSTERED 
(
	[VendorId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MarketPlaceBillers]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MarketPlaceBillers](
	[RecordId] [int] IDENTITY(1,1) NOT NULL,
	[MerchantCode] [varchar](50) NOT NULL,
	[UtilityCode] [varchar](50) NULL,
	[ApiCode] [varchar](50) NULL,
 CONSTRAINT [PK_MarketPlaceBillers] PRIMARY KEY CLUSTERED 
(
	[MerchantCode] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[GetPayTypeCodeByShortName]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[GetPayTypeCodeByShortName]
@ShortName varchar(50)
AS
SELECT     PaymentCode, ShortName, PaymentType,
 Amount, Vatable, Referenced, Active
FROM         PayTypes
WHERE ShortName = @ShortName
GO
/****** Object:  StoredProcedure [dbo].[GetBatchTotal]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[GetBatchTotal]
@BatchCode varchar(50)
AS
SELECT Isnull(SUM(TranAmount),0) AS Total
FROM         Reconciled
WHERE BatchNo = @BatchCode
GO
/****** Object:  StoredProcedure [dbo].[GetDuplicateCustPayment]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[GetDuplicateCustPayment]
@VendorCode varchar(50),
@CustRef varchar(50),
@TranAmount money,
@PostDate datetime
AS
SELECT TOP 1 CustomerRef, RecordDate, TranAmount
FROM         Received
WHERE VendorCode = @VendorCode
AND CustomerRef = @CustRef
AND TranAmount = @TranAmount
AND Convert(varchar(12),RecordDate,102) = Convert(varchar(12),@PostDate,102)
ORDER By TranId
GO
/****** Object:  StoredProcedure [dbo].[GetNonTransToBatchByAgent]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[GetNonTransToBatchByAgent]
@AgentCode varchar(50)
AS
SELECT     TranId, CustomerRef, TranAmount, PaymentDate
FROM         Reconciled
WHERE VendorCode = @AgentCode
AND BSUpdated = 0
AND Cancelled = 0
AND isnumeric(CustomerRef) = 0
GO
/****** Object:  UserDefinedFunction [dbo].[GetTariffCode]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[GetTariffCode](@Tariff varchar(50))
 RETURNS varchar(50)
  AS
    BEGIN
		DECLARE @ret varchar(50)
		SET @ret = (Select TOP 1 isnull(TariffCode,'NONE') AS TariffCode from Tariff
		Where UPPER(TariffName) = UPPER(@Tariff))
		return @ret
    END
GO
/****** Object:  StoredProcedure [dbo].[GetRevTransToBatchByAgent]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[GetRevTransToBatchByAgent]
@AgentCode varchar(50)
AS
SELECT     TranId,isnull(TransNo,TranId) AS TranNo, CustomerRef, TranAmount, PaymentDate
FROM         Reconciled
WHERE VendorCode = @AgentCode
AND BSUpdated = 0
AND Cancelled = 0
AND Reversal = 1
AND UPPER(CustomerType) = 'POSTPAID'
GO
/****** Object:  StoredProcedure [dbo].[GetRevTransforBatching]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[GetRevTransforBatching]
@VendorCode varchar(50),
@VendorRef varchar(100),
@Teller varchar(50),
@AccountNo varchar(50),
@CustName varchar(100),
@PaymentCode varchar(50),
@fromDate datetime,
@toDate datetime
AS
SELECT rank() OVER (ORDER BY ( T.TranId )) as [No.], T.TranId, T.VendorTranId, T.CustomerRef, T.CustomerName,
 PARSENAME(CONVERT(VarChar(50), ISNULL(T.TranAmount, 0), 1), 2) AS TranAmount, 
                      TranAmount AS Amount,CONVERT(varchar(12), T.PaymentDate, 102) AS PayDate,
 CONVERT(varchar(12), T.RecordDate, 102) AS PostDate, T.TranType, P.PaymentType, T.Teller,
                       CAST(0 AS bit) AS Approved, V.Vendor,T.ReconciledBy
FROM         Reconciled AS T INNER JOIN
                      PayTypes AS P ON T.PaymentType = P.PaymentCode INNER JOIN
                      VendorDetails AS V ON T.VendorCode = V.VendorCode
WHERE ((T.VendorCode = @VendorCode) or (@VendorCode = '0'))
AND ((T.VendorTranId = @VendorRef) or (@VendorRef = ''))
AND ((T.CustomerRef = @AccountNo) or (@AccountNo = ''))
AND ((T.Teller = @Teller) or (@Teller = ''))
AND ((T.PaymentType = @PaymentCode) or (@PaymentCode = '0'))
AND ((lower((T.CustomerName)) like '%' + lower(@CustName) + '%') or 
(@CustName = '')) 
AND Convert(varchar(12),T.RecordDate,102) >= Convert(varchar(12),@fromDate,102)
AND Convert(varchar(12),T.RecordDate,102) <= Convert(varchar(12),@toDate,102)
AND T.BSUpdated = 0
AND T.Cancelled = 0
AND T.Reversal = 1
GO
/****** Object:  StoredProcedure [dbo].[GetReconciledTransToBin]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[GetReconciledTransToBin]
@VendorCode varchar(50),
@VendorRef varchar(100),
@Teller varchar(50),
@AccountNo varchar(50),
@CustName varchar(100),
@PaymentCode varchar(50),
@fromDate datetime,
@toDate datetime
AS
SELECT rank() OVER (ORDER BY ( T.TranId )) as [No.], T.TranId,Isnull(T.TransNo,T.TranId) AS Str1, T.VendorTranId, T.CustomerRef, T.CustomerName, PARSENAME(CONVERT(VarChar(50), ISNULL(T.TranAmount, 0), 1), 2) AS TranAmount, 
                      TranAmount AS Amount,CONVERT(varchar(12), T.PaymentDate, 102) AS PayDate, CONVERT(varchar(12), T.RecordDate, 102) AS PostDate, T.TranType, P.PaymentType, T.Teller,
                       CAST(0 AS bit) AS Approved, V.Vendor
FROM         Reconciled AS T INNER JOIN
                      PayTypes AS P ON T.PaymentType = P.PaymentCode INNER JOIN
                      VendorDetails AS V ON T.VendorCode = V.VendorCode
WHERE ((T.VendorCode = @VendorCode) or (@VendorCode = '0'))
AND ((T.VendorTranId = @VendorRef) or (@VendorRef = ''))
AND ((T.CustomerRef = @AccountNo) or (@AccountNo = ''))
AND ((T.Teller = @Teller) or (@Teller = ''))
AND ((T.PaymentType = @PaymentCode) or (@PaymentCode = '0'))
AND ((lower((T.CustomerName)) like '%' + lower(@CustName) + '%') or 
(@CustName = '')) 
AND Convert(varchar(12),T.PaymentDate,102) >= Convert(varchar(12),@fromDate,102)
AND Convert(varchar(12),T.PaymentDate,102) <= Convert(varchar(12),@toDate,102)
AND  Convert(varchar(12),T.RecordDate,102) <= Convert(varchar(12),GETDATE() - 15,102)
AND BSUpdated = 0
GO
/****** Object:  StoredProcedure [dbo].[GetTransforBatching]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[GetTransforBatching]
@VendorCode varchar(50),
@VendorRef varchar(100),
@Teller varchar(50),
@AccountNo varchar(50),
@CustName varchar(100),
@PaymentCode varchar(50),
@fromDate datetime,
@toDate datetime
AS
SELECT rank() OVER (ORDER BY ( T.TranId )) as [No.], T.TranId, T.VendorTranId, T.CustomerRef, T.CustomerName,
 PARSENAME(CONVERT(VarChar(50), ISNULL(T.TranAmount, 0), 1), 2) AS TranAmount, 
                      TranAmount AS Amount,CONVERT(varchar(12), T.PaymentDate, 102) AS PayDate,
 CONVERT(varchar(12), T.RecordDate, 102) AS PostDate, T.TranType, P.PaymentType, T.Teller,
                       CAST(0 AS bit) AS Approved, V.Vendor,T.ReconciledBy
FROM         Reconciled AS T INNER JOIN
                      PayTypes AS P ON T.PaymentType = P.PaymentCode INNER JOIN
                      VendorDetails AS V ON T.VendorCode = V.VendorCode
WHERE ((T.VendorCode = @VendorCode) or (@VendorCode = '0'))
AND ((T.VendorTranId = @VendorRef) or (@VendorRef = ''))
AND ((T.CustomerRef = @AccountNo) or (@AccountNo = ''))
AND ((T.Teller = @Teller) or (@Teller = ''))
AND ((T.PaymentType = @PaymentCode) or (@PaymentCode = '0'))
AND ((lower((T.CustomerName)) like '%' + lower(@CustName) + '%') or 
(@CustName = '')) 
AND Convert(varchar(12),T.RecordDate,102) >= Convert(varchar(12),@fromDate,102)
AND Convert(varchar(12),T.RecordDate,102) <= Convert(varchar(12),@toDate,102)
AND T.BSUpdated = 0
AND T.Cancelled = 0
AND T.Reversal = 0
GO
/****** Object:  StoredProcedure [dbo].[GetTransDetailsByReceipt]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[GetTransDetailsByReceipt]
@ReceiptNo varchar(50)
AS
SELECT     TranId, TranAmount, PaymentDate
FROM         Received
WHERE TransNo = @ReceiptNo
GO
/****** Object:  StoredProcedure [dbo].[GetTransToBin]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[GetTransToBin]
@VendorCode varchar(50),
@VendorRef varchar(100),
@Teller varchar(50),
@AccountNo varchar(50),
@CustName varchar(100),
@PaymentCode varchar(50),
@fromDate datetime,
@toDate datetime
AS
SELECT rank() OVER (ORDER BY ( T.TranId )) as [No.], T.TranId,Isnull(T.TransNo,T.TranId) AS Str1, T.VendorTranId, T.CustomerRef, T.CustomerName, PARSENAME(CONVERT(VarChar(50), ISNULL(T.TranAmount, 0), 1), 2) AS TranAmount, 
                      TranAmount AS Amount,CONVERT(varchar(12), T.PaymentDate, 102) AS PayDate, CONVERT(varchar(12), T.RecordDate, 102) AS PostDate, T.TranType, P.PaymentType, T.Teller,
                       CAST(0 AS bit) AS Approved, VendorDetails.Vendor
FROM         Received AS T INNER JOIN
                      PayTypes AS P ON T.PaymentType = P.PaymentCode INNER JOIN
                      VendorDetails ON T.VendorCode = VendorDetails.VendorCode
WHERE ((T.VendorCode = @VendorCode) or (@VendorCode = '0'))
AND ((T.VendorTranId = @VendorRef) or (@VendorRef = ''))
AND ((T.CustomerRef = @AccountNo) or (@AccountNo = ''))
AND ((T.Teller = @Teller) or (@Teller = ''))
AND ((T.PaymentType = @PaymentCode) or (@PaymentCode = '0'))
AND ((lower((T.CustomerName)) like '%' + lower(@CustName) + '%') or 
(@CustName = '')) 
AND Convert(varchar(12),T.PaymentDate,102) >= Convert(varchar(12),@fromDate,102)
AND Convert(varchar(12),T.PaymentDate,102) <= Convert(varchar(12),@toDate,102)
--AND  Convert(varchar(12),T.RecordDate,102) <= Convert(varchar(12),GETDATE() - 15,102)
GO
/****** Object:  StoredProcedure [dbo].[GetTransToBatchByBillCode]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[GetTransToBatchByBillCode]
@BillCode varchar(50)
AS
SELECT     TranId, CustomerRef, TranAmount, PaymentDate
FROM         Reconciled
WHERE VendorCode = (Select VendorCode  from Vendors Where BillSystemCode = @BillCode)
AND BSUpdated = 0
AND Cancelled = 0
AND UPPER(CustomerType) = 'POSTPAID'
GO
/****** Object:  StoredProcedure [dbo].[GetTransToBatchByAgent]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[GetTransToBatchByAgent]
@AgentCode varchar(50)
AS
SELECT     TranId,isnull(TransNo,TranId) AS TranNo, CustomerRef, TranAmount, PaymentDate
FROM         Reconciled
WHERE VendorCode = @AgentCode
AND BSUpdated = 0
AND Cancelled = 0
AND Reversal = 0
AND UPPER(CustomerType) = 'POSTPAID'
GO
/****** Object:  StoredProcedure [dbo].[GetTransactionToFile]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[GetTransactionToFile]
@UtilityCode varchar(50),
@VendorCode varchar(50),
@EndDate datetime
AS
SELECT    VendorTranId,CustomerRef, TranAmount,PaymentDate,TransNo
FROM    Received 
WHERE UtilityCode = @UtilityCode AND VendorCode = @VendorCode and RecordDate <= @EndDate and ReconFileProcessed = 0
GO
/****** Object:  StoredProcedure [dbo].[GetTransactionToCancel]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[GetTransactionToCancel]
@VendorRef varchar(50),
@VendorCode varchar(50)
AS
SELECT     TranId, VendorTranId, TranAmount, PaymentDate
FROM         Received
WHERE VendorTranId = @VendorRef
AND VendorCode = @VendorCode
GO
/****** Object:  UserDefinedFunction [dbo].[GenerateMerchantId]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[GenerateMerchantId](@id varchar(50))
returns varchar(50)
begin
	--declare @number int = convert(int, @id)
	declare @userId  varchar(50)
	if(LEN(@id) = 1)
	begin
		set @userid = 'MHT00'+@id
	end
	else 
	begin
		if(LEN(@id) = 2)
		begin
			set @userid = 'MHT0'+@id
		end
		set @userId = 'MHT'+@id
	end
	
	
	
	return @userid
end
GO
/****** Object:  Table [dbo].[Errorlogs]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Errorlogs](
	[RecordId] [int] IDENTITY(1,1) NOT NULL,
	[BankId] [varchar](50) NULL,
	[BankCode] [varchar](50) NULL,
	[MerchantCode] [varchar](max) NULL,
	[MerchantId] [varchar](max) NULL,
	[Message] [varchar](950) NULL,
	[RecordDate] [datetime] NULL,
	[ErrorType] [varchar](100) NULL,
	[Method] [varchar](100) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EODErrors]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EODErrors](
	[RecordId] [bigint] IDENTITY(1,1) NOT NULL,
	[Method] [varchar](max) NULL,
	[Error] [varchar](max) NULL,
	[TranId] [varchar](max) NULL,
	[RecordDate] [datetime] NULL,
 CONSTRAINT [PK_Errorlogs] PRIMARY KEY CLUSTERED 
(
	[RecordId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EndOfDayStatus]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EndOfDayStatus](
	[RecordId] [int] NULL,
	[BankCode] [varchar](50) NULL,
	[AccountingPeriod] [varchar](50) NULL,
	[Status] [varchar](50) NULL,
	[RecordDate] [datetime] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Countries]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Countries](
	[Id] [smallint] NOT NULL,
	[ISO] [char](2) NULL,
	[Name] [varchar](80) NULL,
	[NiceName] [varchar](80) NULL,
	[ISO3] [char](3) NULL,
	[NumCode] [smallint] NULL,
	[PhoneCode] [smallint] NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[ConfirmBatchUpdate]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[ConfirmBatchUpdate]
@BatchCode varchar(50),
@ConfirmedBy varchar(50)
AS
BEGIN
  Begin
	  INSERT INTO Posted
						  (TranId,TransNo, CustomerRef, CustomerName, CustomerType, CustomerTel, TranAmount, PaymentDate, RecordDate,
						   TranType, PaymentType, VendorTranId,ReceiptNo, 
						  TranNarration, SmsSent, VendorCode, Teller, VendorToken, RegionCode, DistrictCode, Tariff, Reversal,
							  Cancelled, ReconciledDate, ReconciledBy, 
						  ReconciliationCode, BatchNo, BatchDate, PostedBy)
	   SELECT             TranId,TransNo, CustomerRef, CustomerName, CustomerType, CustomerTel, TranAmount, PaymentDate, RecordDate,
						   TranType, PaymentType, VendorTranId,ReceiptNo, 
						  TranNarration, SmsSent, VendorCode, Teller, VendorToken, RegionCode, DistrictCode, Tariff, Reversal,
							 Cancelled, ReconciledDate, ReconciledBy, 
						  ReconciliationCode, BatchNo, BatchDate,@ConfirmedBy
	  FROM         Reconciled
	  WHERE BatchNo = @BatchCode
  End
  Begin
     DELETE FROM Reconciled WHERE BatchNo = @BatchCode
  End
END
BEGIN
UPDATE    PayBatches
SET              UpdateConfirmed =1, ConfirmDate =GetDate(), ConfirmedBy =@ConfirmedBy
WHERE BatchNo = @BatchCode
END
GO
/****** Object:  Table [dbo].[ChannelRequestAgents]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[ChannelRequestAgents](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Phone] [varchar](100) NULL,
	[PhoneImei] [varchar](100) NULL,
	[MerchantId] [varchar](50) NULL,
	[Active] [bit] NULL,
	[CreationDate] [datetime] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetAccount]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[fn_GetAccount] (@Ident bigint)
  RETURNS varchar(50)
     AS
      BEGIN
        DECLARE @ret varchar(50)
        
        if(len(@ident) = 1)
          SET @ret = Replace(convert(varchar(12),GetDate(),102),'.','')+'0000'+Convert(varchar,@Ident)
        else if(len(@ident) = 2)
          SET @ret = Replace(convert(varchar(12),GetDate(),102),'.','')+'000'+Convert(varchar,@Ident)
        else if(len(@ident) = 3)
          SET @ret = Replace(convert(varchar(12),GetDate(),102),'.','')+'00'+Convert(varchar,@Ident)
        else if(len(@ident) = 4)
          SET @ret = Replace(convert(varchar(12),GetDate(),102),'.','')+'0'+Convert(varchar,@Ident)
        else
           SET @ret = Replace(convert(varchar(12),GetDate(),102),'.','')+Convert(varchar,@Ident)
  
        return @ret
      END
GO
/****** Object:  UserDefinedFunction [dbo].[GenerateId]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[GenerateId](@TransID bigint)
  RETURNS varchar(50)
      AS
    BEGIN
		DECLARE @ret varchar(50)
		DECLARE @res varchar(50)
		DECLARE @tranCode varchar(50)
		SET @tranCode = (CONVERT( varchar(50),@TransID))
		IF (LEN(@TransID) = 1)
		  SET @ret = '000000'+@tranCode
		ELSE IF (LEN(@TransID) = 2)
		  SET @ret = '00000'+@tranCode
		ELSE IF (LEN(@TransID) = 3)
		  SET @ret = '0000'+@tranCode
		ELSE IF(LEN(@TransID) = 4)
		  SET @ret = '000'+@tranCode
		ELSE IF (LEN(@TransID) = 5)
		  SET @ret = '00'+@tranCode
		ELSE IF (LEN(@TransID) = 6)
		  SET @ret = '0'+@tranCode
		ELSE
		   SET @ret = @tranCode	
		   
		   SET @res = '1'+@ret
		return @res
    END
GO
/****** Object:  Table [dbo].[GeneralLedgerTableArchive]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GeneralLedgerTableArchive](
	[RecordId] [int] NOT NULL,
	[PegPayTranId] [varchar](50) NULL,
	[CustomerRef] [varchar](50) NULL,
	[CustomerName] [varchar](50) NULL,
	[CustomerTel] [varchar](50) NULL,
	[AccountNumber] [varchar](50) NOT NULL,
	[ToAccount] [varchar](50) NULL,
	[FromAccount] [varchar](50) NULL,
	[TranAmount] [decimal](18, 2) NOT NULL,
	[TranAmountInAccountCurrency] [decimal](18, 10) NULL,
	[BankTranId] [varchar](50) NOT NULL,
	[TranType] [varchar](50) NOT NULL,
	[TranCategory] [varchar](50) NOT NULL,
	[PaymentDate] [datetime] NULL,
	[RecordDate] [datetime] NULL,
	[Teller] [varchar](50) NULL,
	[ApprovedBy] [varchar](50) NULL,
	[BankCode] [varchar](50) NOT NULL,
	[BranchCode] [varchar](50) NULL,
	[Narration] [varchar](7060) NULL,
	[CurrencyCode] [varchar](50) NULL,
	[ValueInLocalCurrencyFromAccount] [decimal](18, 2) NULL,
	[ValueInLocalCurrencyToAccount] [decimal](18, 2) NULL,
	[ValueInLocalCurrencyTranAmount] [decimal](18, 2) NULL,
	[PaymentType] [varchar](50) NULL,
	[ChequeNumber] [varchar](50) NULL,
	[AccountingDate] [bigint] NOT NULL,
	[AccountingPeriod] [bigint] NOT NULL,
	[SentToBank] [int] NOT NULL,
	[BankReference] [varchar](100) NULL,
	[BankSentDate] [datetime] NULL,
	[BankStatus] [varchar](50) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  UserDefinedFunction [dbo].[GetRegionCode]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[GetRegionCode](@Region varchar(50))
 RETURNS varchar(50)
  AS
    BEGIN
		DECLARE @ret varchar(50)
		SET @ret = (Select isnull(AreaCode,'NONE') AS Region from Areas
		Where UPPER(AreaName) = UPPER(@Region))
		return @ret
    END
GO
/****** Object:  Table [dbo].[CommissionAccounts]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CommissionAccounts](
	[RecordID] [int] IDENTITY(1,1) NOT NULL,
	[CommissionAccountCode] [varchar](50) NULL,
	[CommissionAccountName] [varchar](50) NULL,
	[CommissionAccountNumber] [varchar](50) NULL,
	[BankCode] [varchar](50) NULL,
	[ModifiedBy] [varchar](50) NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedOn] [datetime] NULL,
	[CreatedOn] [datetime] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Beneficiaries]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Beneficiaries](
	[RecordId] [int] IDENTITY(1,1) NOT NULL,
	[BankCode] [varchar](50) NULL,
	[CustomerId] [varchar](50) NULL,
	[BeneficiaryAccountNumber] [varchar](50) NULL,
	[BeneficiaryBankCode] [varchar](50) NULL,
	[ModifiedBy] [varchar](50) NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedOn] [datetime] NULL,
	[CreatedOn] [datetime] NULL,
	[BeneficiaryName] [varchar](50) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[BatchPayment]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[BatchPayment]
@TransId bigint,
@BatchNo varchar(50)
AS
UPDATE    Reconciled
SET              BatchNo =@BatchNo, BatchDate = GetDate(),BSUpdated = 1
WHERE TranId = @TransId
GO
/****** Object:  StoredProcedure [dbo].[CancelReversedTrans]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[CancelReversedTrans]
@VendorCode varchar(50),
@OriginalTranId varchar(50),
@ReversingTranId varchar(50)
AS
UPDATE    Received
SET              Cancelled = 1
WHERE VendorTranId IN(@OriginalTranId,@ReversingTranId)
AND VendorCode = @VendorCode
GO
/****** Object:  Table [dbo].[BussinessTypes]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BussinessTypes](
	[RecordId] [int] IDENTITY(1,1) NOT NULL,
	[BussinessTypeCode] [varchar](50) NULL,
	[BussinessTypeName] [varchar](50) NULL,
	[BankCode] [varchar](50) NULL,
	[ModifiedBy] [varchar](50) NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedOn] [datetime] NULL,
	[CreatedOn] [datetime] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  UserDefinedFunction [dbo].[GetDistrictRegionCode]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[GetDistrictRegionCode](@DistrictCode varchar(50))
 RETURNS varchar(50)
  AS
    BEGIN
		DECLARE @ret varchar(50)
		SET @ret = (SELECT TOP 1 R.AreaCode FROM Areas AS R INNER JOIN
                      Branches AS D ON R.AreaID = D.RegionID
		Where D.DistrictCode = @DistrictCode)
		return @ret
    END
GO
/****** Object:  UserDefinedFunction [dbo].[GetDistrictCode]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[GetDistrictCode](@District varchar(50))
 RETURNS varchar(50)
  AS
    BEGIN
		DECLARE @ret varchar(50)
		SET @ret = (Select TOP 1 isnull(DistrictCode,'NONE') AS District from Branches
		Where UPPER(DistrictName) = UPPER(@District))
		return @ret
    END
GO
/****** Object:  StoredProcedure [dbo].[GetCustomerFile]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[GetCustomerFile]
@Accountno varchar(50),
@Custname varchar(100)

AS
SELECT TOP 10 rank() OVER (ORDER BY ( C.CustomerName )) as [No.],C.CustomerRef, C.CustomerName, C.CustomerType, PARSENAME(CONVERT(VarChar(50), ISNULL(C.AccountBal, 0), 1), 2) AS Balance, 
  ISNULL(C.CustomerTel, 'NONE') AS Phone, ISNULL(R.AreaName,'NONE') AS Region,ISNULL(D.DistrictName,'NONE') AS District,
 ISNULL(T.TariffName,'NONE') AS Tariff, C.LastUpdateDate
FROM         Customers AS C LEFT OUTER JOIN
                      Branches AS D ON C.DistrictCode = D.DistrictCode LEFT OUTER JOIN
                      Tariff AS T ON C.Tariff = T.TariffCode LEFT OUTER JOIN
                      Areas AS R ON C.RegionCode = R.AreaCode
WHERE ((C.CustomerRef = @Accountno) or (@Accountno = ''))
AND ((lower((C.CustomerName)) like '%' + lower(@CustName) + '%') or 
(@CustName = '')) 
ORDER BY C.CustomerName
GO
/****** Object:  StoredProcedure [dbo].[BinReconciledTransaction]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[BinReconciledTransaction]
@Transid bigint,
@Reconciled bit,
@User varchar(50)
AS
   BEGIN
		INSERT INTO Bin
							  (TranId,TransNo,CustomerRef, CustomerName, CustomerType,Area,TIN, CustomerTel, TranAmount, PaymentDate,
							   RecordDate, TranType, PaymentType, VendorTranId,ReceiptNo, 
							  TranNarration, SmsSent, VendorCode, Teller,RegionCode,DistrictCode,Tariff, VendorToken,Reversal,Cancelled,
							  Reconciled,ReconciledDate, ReconciledBy,PostedBy,UtilityCode,UtilityTranRef,SentToUtility)
		SELECT     TranId,TransNo,CustomerRef, CustomerName, CustomerType,Area,TIN, CustomerTel, TranAmount, PaymentDate, RecordDate, TranType, PaymentType, VendorTranId,ReceiptNo, 
							  TranNarration, SmsSent, VendorCode, Teller,RegionCode,DistrictCode,Tariff, VendorToken,Reversal,Cancelled,
							  @Reconciled,ReconciledDate,ReconciledBy,@User,UtilityCode,UtilityTranRef,SentToUtility
							  FROM         Reconciled
		WHERE TranId = @Transid
	END

	BEGIN
	   DELETE FROM Reconciled WHERE TranId = @Transid
	END
GO
/****** Object:  StoredProcedure [dbo].[BankTellers_SelectRow]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	BankTellers_SelectRow
-- Author:	Nsubuga Kasozi
-- Create date:	12/27/2015 9:32:04 PM
-- Description:	This stored procedure is intended for selecting a specific row from BankTellers table
-- ==========================================================================================
Create Procedure [dbo].[BankTellers_SelectRow]
	@TellerId int
As
Begin
	Select 
	*
	From BankTellers
	Where
		[TellerId] = @TellerId
End
GO
/****** Object:  StoredProcedure [dbo].[BankTellers_SelectAll]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	BankTellers_SelectAll
-- Author:	Nsubuga Kasozi
-- Create date:	12/27/2015 9:32:04 PM
-- Description:	This stored procedure is intended for selecting all rows from BankTellers table
-- ==========================================================================================
Create Procedure [dbo].[BankTellers_SelectAll]
As
Begin
	Select 
		*
	From BankTellers
End
GO
/****** Object:  StoredProcedure [dbo].[BankTellers_Insert]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	BankTellers_Insert
-- Author:	Nsubuga Kasozi
-- Create date:	12/27/2015 9:32:04 PM
-- Description:	This stored procedure is intended for inserting values to BankTellers table
-- ==========================================================================================
Create Procedure [dbo].[BankTellers_Insert]
	@UserId varchar(50),
	@AccountNumber varchar(50),
	@BranchCode varchar(50),
	@BankCode varchar(50)
As
Begin
	Insert Into BankTellers
		([UserId],[AccountNumber],[BranchCode],[BankCode])
	Values
		(@UserId,@AccountNumber,@BranchCode,@BankCode)

	Declare @ReferenceID int
	Select @ReferenceID = @@IDENTITY

	Return @ReferenceID

End
GO
/****** Object:  Table [dbo].[BankAccounts]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BankAccounts](
	[AccountId] [int] IDENTITY(1,1) NOT NULL,
	[AccNumber] [varchar](50) NULL,
	[AccType] [varchar](50) NULL,
	[BankCode] [varchar](50) NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedOn] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[CreatedBy] [varchar](50) NULL,
	[IsActive] [bit] NULL,
	[ApprovedBy] [varchar](50) NULL,
	[BranchCode] [varchar](50) NULL,
	[CurrencyCode] [varchar](50) NULL,
	[AccountName] [varchar](50) NULL,
	[MinimumBalance] [decimal](18, 2) NULL,
	[InterestRate] [decimal](18, 2) NULL,
	[InterestType] [varchar](50) NULL,
	[NextMaturityDate] [datetime] NULL,
	[LastEodDate] [datetime] NULL,
	[InterestPayOutFrequency] [varchar](50) NULL,
	[Reason] [varchar](7050) NULL,
	[LastRunAccountDate] [bigint] NULL,
	[IsproductAccount] [bit] NULL,
	[ProductType] [varchar](100) NULL,
	[IsReferenced] [bit] NULL,
	[LiquidationType] [varchar](50) NULL,
	[AccountCode] [varchar](50) NULL,
	[AccountCategory] [varchar](100) NULL,
	[LiquidationFrequency] [varchar](50) NULL,
	[LiquidationAccount] [varchar](100) NULL,
	[SentToBank] [bit] NOT NULL,
	[LiquidationAccountName] [varchar](max) NULL,
	[MerchantContact] [varchar](50) NULL,
	[ReferenceType] [varchar](50) NULL,
	[NumberOfAuthorisers] [varchar](50) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AuditTrail]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AuditTrail](
	[RecordId] [int] IDENTITY(1,1) NOT NULL,
	[ActionType] [varchar](50) NULL,
	[TableName] [varchar](50) NULL,
	[BankCode] [nvarchar](50) NULL,
	[ModifiedOn] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[Action] [nvarchar](4000) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AccessAreas]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AccessAreas](
	[RecordId] [int] IDENTITY(1,1) NOT NULL,
	[AreaName] [varchar](50) NULL,
	[AreaCode] [varchar](50) NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedBy] [varchar](50) NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedOn] [datetime] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ApiAccessChannels]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ApiAccessChannels](
	[RecordId] [bigint] IDENTITY(1,1) NOT NULL,
	[MerchantId] [varchar](50) NULL,
	[Channel] [varchar](50) NULL,
	[ApiUsername] [varchar](50) NULL,
	[ApiPassword] [varchar](50) NULL,
	[CreationDate] [varchar](50) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AccessRules]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AccessRules](
	[RecordId] [int] IDENTITY(1,1) NOT NULL,
	[RuleName] [varchar](50) NULL,
	[UserType] [varchar](50) NULL,
	[BankCode] [varchar](50) NULL,
	[CanAccess] [varchar](8000) NULL,
	[UserId] [varchar](50) NULL,
	[BranchCode] [varchar](50) NULL,
	[IsActive] [bit] NULL,
	[ModifiedOn] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[CreatedOn] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AccessCredentials]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AccessCredentials](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AccessId] [varchar](50) NOT NULL,
	[AccessName] [varchar](50) NULL,
	[Banks] [varchar](8000) NULL,
	[Contact] [varchar](50) NULL,
	[ContactEmail] [varchar](50) NULL,
	[Password] [varchar](200) NULL,
	[IsActive] [bit] NULL,
	[CreatedOn] [datetime] NULL,
	[LastUpdateDate] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
 CONSTRAINT [PK_AccessCredentials] PRIMARY KEY CLUSTERED 
(
	[AccessId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[AccessAreas_Update]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	AccessAreas_Update
-- Author:	Nsubuga Kasozi
-- Create date:	1/5/2016 4:20:40 PM
-- Description:	This stored procedure is intended for updating AccessAreas table
-- ==========================================================================================
Create Procedure [dbo].[AccessAreas_Update]
	@RecordId int,
	@AreaName varchar(50),
	@AreaCode varchar(50)
As
Begin
	Update AccessAreas
	Set
		[AreaName] = @AreaName,
		[AreaCode] = @AreaCode
	Where		
		[RecordId] = @RecordId

End
GO
/****** Object:  StoredProcedure [dbo].[AccessAreas_SelectRow]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	AccessAreas_SelectRow
-- Author:	Nsubuga Kasozi
-- Create date:	1/5/2016 4:20:40 PM
-- Description:	This stored procedure is intended for selecting a specific row from AccessAreas table
-- ==========================================================================================
Create Procedure [dbo].[AccessAreas_SelectRow]
	@RecordId int
As
Begin
	Select *
	From AccessAreas
	Where
		[RecordId] = @RecordId
End
GO
/****** Object:  StoredProcedure [dbo].[AccessAreas_SelectAll]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	AccessAreas_SelectAll
-- Author:	Nsubuga Kasozi
-- Create date:	1/5/2016 4:20:40 PM
-- Description:	This stored procedure is intended for selecting all rows from AccessAreas table
-- ==========================================================================================
Create Procedure [dbo].[AccessAreas_SelectAll]
As
Begin
	Select *
	From AccessAreas
End
GO
/****** Object:  StoredProcedure [dbo].[AccessAreas_Insert]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	AccessAreas_Insert
-- Author:	Nsubuga Kasozi
-- Create date:	1/5/2016 4:20:40 PM
-- Description:	This stored procedure is intended for inserting values to AccessAreas table
-- ==========================================================================================
Create Procedure [dbo].[AccessAreas_Insert]
	@AreaName varchar(50),
	@AreaCode varchar(50)
As
Begin
	Insert Into AccessAreas
		([AreaName],[AreaCode])
	Values
		(@AreaName,@AreaCode)

	Declare @ReferenceID int
	Select @ReferenceID = @@IDENTITY

	Return @ReferenceID

End
GO
/****** Object:  StoredProcedure [dbo].[AccessAreas_DeleteRow]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	AccessAreas_DeleteRow
-- Author:	Nsubuga Kasozi
-- Create date:	1/5/2016 4:20:40 PM
-- Description:	This stored procedure is intended for deleting a specific row from AccessAreas table
-- ==========================================================================================
Create Procedure [dbo].[AccessAreas_DeleteRow]
	@RecordId int
As
Begin
	Delete AccessAreas
	Where
		[RecordId] = @RecordId

End
GO
/****** Object:  StoredProcedure [dbo].[AttachChargesToMerchants]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[AttachChargesToMerchants]
@BankCode varchar(50),
@MerchantId varchar(50),
@ChargeCode varchar(50),
@TranCategory varchar(50),
@IsChargePassedOnToCustomer bit,
@IsActive bit,
@ModifiedBy varchar(50),
@PaymentType varchar(50)
as
Begin Transaction Updater
If exists(select * from BankChargesForMerchants where BankCode=@BankCode and MerchantId=@MerchantId and TransCategory=@TranCategory and PaymentType=@PaymentType)
Begin
	Update BankChargesForMerchants set ChargeCode=@ChargeCode,IsActive=@isActive,IsChargePassedOnToTheCustomer=@IsChargePassedOnToCustomer,ModifiedBy=@ModifiedBy,ModifiedOn=GETDATE()
	where BankCode=@BankCode and MerchantId=@MerchantId and TransCategory=@TranCategory and PaymentType=@PaymentType
	select ChargeId as InsertedId from BankChargesForMerchants where BankCode=@BankCode and MerchantId=@MerchantId and TransCategory=@TranCategory and PaymentType=@PaymentType
End
Else
Begin
	Insert into BankChargesForMerchants
	(MerchantId,TransCategory,BankCode,ChargeCode,CreatedBy,ModifiedBy,CreatedOn,ModifiedOn,IsActive,IsChargePassedOnToTheCustomer,PaymentType)
	values
	(@MerchantId,@TranCategory,@BankCode,@ChargeCode,@ModifiedBy,@ModifiedBy,GETDATE(),GETDATE(),@IsActive,@IsChargePassedOnToCustomer,@PaymentType);
	Select @@IDENTITY as InsertedId
End
Commit Transaction Updater
GO
/****** Object:  StoredProcedure [dbo].[ApproveOrRejectBankAccount2]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[ApproveOrRejectBankAccount2]
@BankCode varchar(50),
@AccountNumber varchar(50),
@Status varchar(50),
@ApprovedBy varchar(50),
@Comment varchar(max)
as
Begin transaction trans
Begin try
Declare @AcctNumber varchar(50)
Select top 1 @AcctNumber= AccNumber from BankAccounts where AccountCode=@AccountNumber and BankCode=@BankCode
if(upper(@Status)='TRUE')
Begin
	Update BankAccounts set IsActive=@status,ApprovedBy=@ApprovedBy 
	where AccountCode=@AccountNumber and BankCode=@BankCode
End
Else
Begin
	Insert into RejectedBankAccounts
	SELECT *
	FROM BankAccounts
	where AccountCode=@AccountNumber and BankCode=@BankCode
	
	INSERT INTO RejectionLogs(AccountCode,BankCode,Comment,CommentBy,RecordDate,IsActive)
    VALUES(@AccountNumber,@BankCode,@Comment,@ApprovedBy,GETDATE(),1)
    	 
	--given it may be a small change required on account, we should delete
	Delete from BankAccounts where AccountCode=@AccountNumber and BankCode=@BankCode
End
Commit transaction trans
End try
Begin Catch
Rollback transaction trans

  DECLARE
   @ErMessage NVARCHAR(2048),
   @ErSeverity INT,
   @ErState INT
 
 SELECT
   @ErMessage = ERROR_MESSAGE(),
   @ErSeverity = ERROR_SEVERITY(),
   @ErState = ERROR_STATE()
 
 RAISERROR (@ErMessage,
             @ErSeverity,
             @ErState )
End Catch
GO
/****** Object:  StoredProcedure [dbo].[ApproveOrRejectBankAccount]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[ApproveOrRejectBankAccount]
@BankCode varchar(50),
@AccountNumber varchar(50),
@Status varchar(50),
@ApprovedBy varchar(50),
@Comment varchar(max)
as
Begin transaction trans
Begin try
Declare @AcctNumber varchar(50)
Select top 1 @AcctNumber= AccNumber from BankAccounts where AccountCode=@AccountNumber and BankCode=@BankCode
if(@Status='true')
Begin

	Update BankAccounts set IsActive=@status,ApprovedBy=@ApprovedBy 
	where AccountCode=@AccountNumber and BankCode=@BankCode
	
	--approve the account signatories automatically as well
	--Update BankCustomers set ApprovedBy=@ApprovedBy where BankCode=@BankCode and  CustomerId in
	--(Select CustomerID from CustomersToAccountsMapping where AccountNumber=@AcctNumber and BankCode=@BankCode)
	
	
End
Else
Begin
	Insert into RejectedBankAccounts
	([AccountId],[AccNumber],[AccType] ,[BankCode] ,[CreatedOn],[ModifiedOn],[ModifiedBy],[CreatedBy],[IsActive]
      ,[ApprovedBy],[BranchCode],[CurrencyCode],[AccountName],[MinimumBalance],[InterestRate],[InterestType]
      ,[NextMaturityDate],[LastEodDate],[InterestPayOutFrequency],[Reason],[LastRunAccountDate],[IsproductAccount]
      ,[ProductType],[IsReferenced],[LiquidationType],[AccountCode],[AccountCategory],[LiquidationFrequency]
      ,[LiquidationAccount],[SentToBank] ,[LiquidationAccountName])
	SELECT [AccountId],[AccNumber],[AccType] ,[BankCode] ,[CreatedOn],[ModifiedOn],[ModifiedBy],[CreatedBy],[IsActive]
      ,[ApprovedBy],[BranchCode],[CurrencyCode],[AccountName],[MinimumBalance],[InterestRate],[InterestType]
      ,[NextMaturityDate],[LastEodDate],[InterestPayOutFrequency],[Reason],[LastRunAccountDate],[IsproductAccount]
      ,[ProductType],[IsReferenced],[LiquidationType],[AccountCode],[AccountCategory],[LiquidationFrequency]
      ,[LiquidationAccount],[SentToBank] ,[LiquidationAccountName]
  FROM BankAccounts
	 where AccountCode=@AcctNumber and BankCode=@BankCode
  INSERT INTO RejectionLogs(AccountCode,BankCode,Comment,CommentBy,RecordDate,IsActive)
  VALUES(@AccountNumber,@BankCode,@Comment,@ApprovedBy,GETDATE(),1)	 
	--Delete from BankAccounts where AccountCode=@AcctNumber and BankCode=@BankCode
End
Commit transaction trans
End try
Begin Catch
Rollback transaction trans

  DECLARE
   @ErMessage NVARCHAR(2048),
   @ErSeverity INT,
   @ErState INT
 
 SELECT
   @ErMessage = ERROR_MESSAGE(),
   @ErSeverity = ERROR_SEVERITY(),
   @ErState = ERROR_STATE()
 
 RAISERROR (@ErMessage,
             @ErSeverity,
             @ErState )
End Catch
GO
/****** Object:  StoredProcedure [dbo].[AccessRules_Insert]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	AccessRules_Insert
-- Author:	Nsubuga Kasozi
-- Create date:	1/7/2016 4:47:57 PM
-- Description:	This stored procedure is intended for inserting values to AccessRules table
-- ==========================================================================================
Create Procedure [dbo].[AccessRules_Insert]
	@RuleName varchar(50),
	@UserType varchar(50),
	@BankCode varchar(50),
	@CanAccess varchar(8000),
	@UserId varchar(50),
	@BranchCode varchar(50),
	@IsActive bit,
	@ModifiedOn datetime,
	@ModifiedBy datetime,
	@CreatedOn datetime,
	@CreatedBy datetime
As
Begin
	Insert Into AccessRules
		([RuleName],[UserType],[BankCode],[CanAccess],[UserId],[BranchCode],[IsActive],[ModifiedOn],[ModifiedBy],[CreatedOn],[CreatedBy])
	Values
		(@RuleName,@UserType,@BankCode,@CanAccess,@UserId,@BranchCode,@IsActive,@ModifiedOn,@ModifiedBy,@CreatedOn,@CreatedBy)

	Declare @ReferenceID int
	Select @ReferenceID = @@IDENTITY

	Return @ReferenceID

End
GO
/****** Object:  StoredProcedure [dbo].[AccessRules_DeleteRow]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	AccessRules_DeleteRow
-- Author:	Nsubuga Kasozi
-- Create date:	1/7/2016 4:47:57 PM
-- Description:	This stored procedure is intended for deleting a specific row from AccessRules table
-- ==========================================================================================
Create Procedure [dbo].[AccessRules_DeleteRow]
	@RecordId int
As
Begin
	Delete AccessRules
	Where
		[RecordId] = @RecordId

End
GO
/****** Object:  StoredProcedure [dbo].[ApproveOrRejectTransactionOnUssd]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[ApproveOrRejectTransactionOnUssd]
@RecordId int,
@action varchar(10),
@approver varchar(50)
as
begin
  if @action = '1'
    update TransactionRequests set Status='APPROVED',Approver=@approver
    where RecordId=@RecordId
  else if @action = '2'
    update TransactionRequests set Status='FAILED',Approver=@approver,Reason='REJECTED'
    where RecordId=@RecordId
end
GO
/****** Object:  StoredProcedure [dbo].[Beneficiaries_Update]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	Beneficiaries_Update
-- Author:	Nsubuga Kasozi
-- Create date:	4/14/2016 10:35:53 AM
-- Description:	This stored procedure is intended for updating Beneficiaries table
-- ==========================================================================================
CREATE Procedure [dbo].[Beneficiaries_Update]
	@BankCode varchar(50),
	@CustomerId varchar(50),
	@BeneficiaryAccountNumber varchar(50),
	@BeneficiaryBankCode varchar(50),
	@ModifiedBy varchar(50),
	@BeneficiaryName varchar(50)
As
If exists(select * from Beneficiaries where BeneficiaryAccountNumber=@BeneficiaryAccountNumber and CustomerId=@CustomerId and BankCode=@BankCode)
Begin
	Update Beneficiaries
	Set
		[BeneficiaryAccountNumber] = @BeneficiaryAccountNumber,
		[BeneficiaryBankCode] = @BeneficiaryBankCode,
		[ModifiedBy] = @ModifiedBy,
		[ModifiedOn] = GETDATE(),
		BeneficiaryName=@BeneficiaryName
	Where		
		BeneficiaryAccountNumber=@BeneficiaryAccountNumber and BankCode=@BankCode and CustomerId=@CustomerId
		
	Select @BeneficiaryAccountNumber as InsertedID
End
Else
Begin
	Insert Into Beneficiaries
		([BankCode],[CustomerId],[BeneficiaryAccountNumber],BeneficiaryName,[BeneficiaryBankCode],[ModifiedBy],[CreatedBy],[ModifiedOn],[CreatedOn])
	Values
		(@BankCode,@CustomerId,@BeneficiaryAccountNumber,@BeneficiaryName,@BeneficiaryBankCode,@ModifiedBy,@ModifiedBy,GETDATE(),GETDATE())
	Select @BeneficiaryAccountNumber as InsertedID
End
GO
/****** Object:  StoredProcedure [dbo].[Beneficiaries_SelectRow]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	Beneficiaries_SelectRow
-- Author:	Nsubuga Kasozi
-- Create date:	4/14/2016 10:35:53 AM
-- Description:	This stored procedure is intended for selecting a specific row from Beneficiaries table
-- ==========================================================================================
Create Procedure [dbo].[Beneficiaries_SelectRow]
	@RecordId int
As
Begin
	Select *
	From Beneficiaries
	Where
		[RecordId] = @RecordId
End
GO
/****** Object:  StoredProcedure [dbo].[Beneficiaries_SelectAll]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	Beneficiaries_SelectAll
-- Author:	Nsubuga Kasozi
-- Create date:	4/14/2016 10:35:53 AM
-- Description:	This stored procedure is intended for selecting all rows from Beneficiaries table
-- ==========================================================================================
Create Procedure [dbo].[Beneficiaries_SelectAll]
As
Begin
	Select *
	From Beneficiaries
End
GO
/****** Object:  StoredProcedure [dbo].[Beneficiaries_Insert]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	Beneficiaries_Insert
-- Author:	Nsubuga Kasozi
-- Create date:	4/14/2016 10:35:53 AM
-- Description:	This stored procedure is intended for inserting values to Beneficiaries table
-- ==========================================================================================
Create Procedure [dbo].[Beneficiaries_Insert]
	@BankCode varchar(50),
	@CustomerId varchar(50),
	@BeneficiaryAccountNumber varchar(50),
	@BeneficiaryBankCode varchar(50),
	@ModifiedBy varchar(50),
	@CreatedBy varchar(50),
	@ModifiedOn datetime,
	@CreatedOn datetime
As
Begin
	Insert Into Beneficiaries
		([BankCode],[CustomerId],[BeneficiaryAccountNumber],[BeneficiaryBankCode],[ModifiedBy],[CreatedBy],[ModifiedOn],[CreatedOn])
	Values
		(@BankCode,@CustomerId,@BeneficiaryAccountNumber,@BeneficiaryBankCode,@ModifiedBy,@CreatedBy,@ModifiedOn,@CreatedOn)

	Declare @ReferenceID int
	Select @ReferenceID = @@IDENTITY

	Return @ReferenceID

End
GO
/****** Object:  StoredProcedure [dbo].[Beneficiaries_DeleteRow]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	Beneficiaries_DeleteRow
-- Author:	Nsubuga Kasozi
-- Create date:	4/14/2016 10:35:53 AM
-- Description:	This stored procedure is intended for deleting a specific row from Beneficiaries table
-- ==========================================================================================
Create Procedure [dbo].[Beneficiaries_DeleteRow]
	@RecordId int
As
Begin
	Delete Beneficiaries
	Where
		[RecordId] = @RecordId

End
GO
/****** Object:  StoredProcedure [dbo].[Charges_SelectAll]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	Charges_SelectAll
-- Author:	Nsubuga Kasozi
-- Create date:	12/21/2015 8:37:16 AM
-- Description:	This stored procedure is intended for selecting all rows from Charges table
-- ==========================================================================================
CREATE Procedure [dbo].[Charges_SelectAll]
As
Begin
	Select 
	*
	From BankCharges
End
GO
/****** Object:  StoredProcedure [dbo].[Charges_DeleteRow]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	Charges_DeleteRow
-- Author:	Nsubuga Kasozi
-- Create date:	12/21/2015 8:37:16 AM
-- Description:	This stored procedure is intended for deleting a specific row from Charges table
-- ==========================================================================================
CREATE Procedure [dbo].[Charges_DeleteRow]
	@ChargeId int
As
Begin
	Delete from BankCharges
	Where
		[ChargeId] = @ChargeId

End
GO
/****** Object:  StoredProcedure [dbo].[CommissionAccounts_SelectRow]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	CommissionAccounts_SelectRow
-- Author:	Nsubuga Kasozi
-- Create date:	5/2/2016 1:43:53 PM
-- Description:	This stored procedure is intended for selecting a specific row from CommissionAccounts table
-- ==========================================================================================
CREATE Procedure [dbo].[CommissionAccounts_SelectRow]
	@CommissionAccountCode varchar(50),
	@BankCode varchar(50)
As
Begin
	Select *
	From CommissionAccounts
	Where BankCode=@BankCode and CommissionAccountCode=@CommissionAccountCode
End
GO
/****** Object:  StoredProcedure [dbo].[CommissionAccounts_SelectAll]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	CommissionAccounts_SelectAll
-- Author:	Nsubuga Kasozi
-- Create date:	5/2/2016 1:43:53 PM
-- Description:	This stored procedure is intended for selecting all rows from CommissionAccounts table
-- ==========================================================================================
Create Procedure [dbo].[CommissionAccounts_SelectAll]
As
Begin
	Select 
	*
	From CommissionAccounts
End
GO
/****** Object:  StoredProcedure [dbo].[CommissionAccounts_Insert]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	CommissionAccounts_Insert
-- Author:	Nsubuga Kasozi
-- Create date:	5/2/2016 1:43:53 PM
-- Description:	This stored procedure is intended for inserting values to CommissionAccounts table
-- ==========================================================================================
Create Procedure [dbo].[CommissionAccounts_Insert]
	@CommissionAccountCode varchar(50),
	@CommissionAccountName varchar(50),
	@CommissionAccountNumber varchar(50),
	@BankCode varchar(50),
	@ModifiedBy varchar(50),
	@CreatedBy varchar(50),
	@ModifiedOn datetime,
	@CreatedOn datetime
As
Begin
	Insert Into CommissionAccounts
		([CommissionAccountCode],[CommissionAccountName],[CommissionAccountNumber],[BankCode],[ModifiedBy],[CreatedBy],[ModifiedOn],[CreatedOn])
	Values
		(@CommissionAccountCode,@CommissionAccountName,@CommissionAccountNumber,@BankCode,@ModifiedBy,@CreatedBy,@ModifiedOn,@CreatedOn)

	Declare @ReferenceID int
	Select @ReferenceID = @@IDENTITY

	Return @ReferenceID

End
GO
/****** Object:  StoredProcedure [dbo].[CommissionAccounts_DeleteRow]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	CommissionAccounts_DeleteRow
-- Author:	Nsubuga Kasozi
-- Create date:	5/2/2016 1:43:53 PM
-- Description:	This stored procedure is intended for deleting a specific row from CommissionAccounts table
-- ==========================================================================================
Create Procedure [dbo].[CommissionAccounts_DeleteRow]
	@RecordID int
As
Begin
	Delete CommissionAccounts
	Where
		[RecordID] = @RecordID

End
GO
/****** Object:  StoredProcedure [dbo].[GenerateCustomerRefReport]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GenerateCustomerRefReport]
@BankCode varchar(50),
@MerchantCode varchar(50),
@FromDate varchar(50),
@ToDate varchar(50),
@CustomerRef varchar(50),
@TranId varchar(50)
as
--select * from GeneralLedgerTable where Teller='10002201'

Select
	   G.PegPayTranId as 'Transaction Id',G.CustomerRef, B.AccountCode as 'Merchant Code',B.AccountName as Merchant,
       G.TranAmount as 'Transaction Amount',
	   G.TranType as 'Transaction Type',G.RecordDate as 'Payment Date',G.Narration,G.Teller as 'Teller'
	   
from GeneralLedgerTable AS G with(nolock) 
inner Join 
BankAccounts AS B on B.AccNumber=G.AccountNumber
where
        (G.TranType='Credit') and
		(G.BankCode=@BankCode or @BankCode='ALL') and
		(B.AccountCode=@MerchantCode or @MerchantCode='') and 
		((G.CustomerName like '%'+@CustomerRef+'%') or CustomerRef=@CustomerRef or @CustomerRef='') and
		(G.BankTranId=@TranId or @TranId='') and 
		(G.PaymentDate>=@FromDate or @FromDate='') and 
		(G.PaymentDate<=@ToDate or @ToDate='')
order by RecordDate desc
GO
/****** Object:  StoredProcedure [dbo].[GenerateCommissionAccountReport]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GenerateCommissionAccountReport]
@BankCode varchar(50),
@CommissionAccount varchar(50),
@FromDate varchar(50),
@ToDate varchar(50)
as
Select
	   G.PegPayTranId as 'Transaction Id', G.AccountNumber as 'AccountAffected',B.AccountName as CommissionAccountName,
       G.TranAmount as 'Transaction Amount',
	   G.TranType as 'Transaction Type',G.RecordDate as 'Payment Date',G.Narration,G.Teller as 'Teller'
	   
from GeneralLedgerTable G
inner Join 
BankAccounts AS B on B.AccNumber=G.AccountNumber
where
        --(G.TranType='Credit') and
		(G.BankCode=@BankCode or @BankCode='ALL') and
		(@CommissionAccount='ALL' or G.AccountNumber=@CommissionAccount) and  
		(G.AccountNumber in (Select AccNumber From BankAccounts A Where AccType like '%COMMISSION%')) and
		(G.PaymentDate>=@FromDate or @FromDate='') and 
		(G.PaymentDate<=@ToDate or @ToDate='')
order by RecordDate desc
GO
/****** Object:  StoredProcedure [dbo].[GenerateArrearsReport]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GenerateArrearsReport]
@BankCode varchar(50),
@BranchCode varchar(50),
@ID varchar(50),
@FromDate datetime,
@ToDate datetime,
@Filter varchar(50)
as
Select LoanID,LoanAccountNumber,LoanAmount,RemainingAmount,LastRepaymentDate,NextRepaymentDate as PaymentWasExpectedOn,Status from Loans A
inner join LoanTypes B on (A.LoanType=B.LoanTypeCode) and (A.BankCode=B.BankCode or B.BankCode='ALL')
inner join BankBranches C on (A.BranchCode=C.BranchCode and A.BankCode=C.BankCode)
where 
(A.BankCode=@BankCode or @BankCode='ALL' or A.BankCode='ALL') and 
(A.BranchCode=@BranchCode or @BranchCode='ALL') and
(LoanID=@ID or CustomerTel=@ID or AccountNumber=@ID or @ID='') and
(Status='APPROVED') and 
A.NextRepaymentDate<GETDATE()
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GeCustomerBalance]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[fn_GeCustomerBalance](@acctCode varchar(50),@bankCode varchar(50),@ref varchar(50),@startdate varchar(50),@enddate varchar(50))
  RETURNS money
      AS
    BEGIN
		DECLARE @res varchar(50)
		DECLARE @total varchar(50)=(select Extra3 from MerchantCustomers where CustomerRef=@ref)
		declare @moneytotal money = cast(@total as money)
		DECLARE @paymentTotal money
		
		
		SET @paymentTotal= (
		select sum(G.TranAmount)
		 from GeneralLedgerTable G inner join BankAccounts B on G.AccountNumber=b.AccNumber
		inner join MerchantCustomers M on M.CustomerRef=G.CustomerName
	      where M.AccountCode=@acctCode and G.BankCode=@bankCode and G.CustomerName=@ref
	  and PaymentDate between @startdate and @enddate and TranType='Credit' and TranCategory<>'WEB_LIQUIDATION_PAYMENT'
		)
	    if(@paymentTotal is null)
		begin
		 set @paymentTotal=0.00
		end
		
		SET @res=(@moneytotal - @paymentTotal)
	    
		return @res
    END
GO
/****** Object:  StoredProcedure [dbo].[Errorlogs_Insert]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	Errorlogs_Insert
-- Author:	Nsubuga Kasozi
-- Create date:	4/7/2016 10:31:48 AM
-- Description:	This stored procedure is intended for inserting values to Errorlogs table
-- ==========================================================================================
Create Procedure [dbo].[Errorlogs_Insert]
	@BankId varchar(50),
	@BankCode varchar(50),
	@Message varchar(950)
As
Begin
	Insert Into Errorlogs
		([BankId],[BankCode],[Message],[RecordDate])
	Values
		(@BankId,@BankCode,@Message,GETDATE())

	Declare @ReferenceID int
	Select @ReferenceID = @@IDENTITY

	Return @ReferenceID

End
GO
/****** Object:  StoredProcedure [dbo].[GetAllRolesForBanks]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetAllRolesForBanks]
as
Select RoleCode,RoleName
 from Roles
GO
/****** Object:  StoredProcedure [dbo].[GetAllRedirectUrls]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetAllRedirectUrls]
@EditType varchar(50)
as
Select * from UrlRedirects
GO
/****** Object:  StoredProcedure [dbo].[GetAllPendingRefunds]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetAllPendingRefunds]
as
Select * from PaymentsGatewayRequests where PaymentOptionSelected='REFUND' and Processed=0 and Status='PENDING'
GO
/****** Object:  StoredProcedure [dbo].[GetAllMerchantsByCode]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetAllMerchantsByCode]
@bankCode varchar(50)
as
Select AccountId,AccountCode,AccountName,IsReferenced from BankAccounts
where AccountCode is not null and BankCode=@bankCode and IsActive=1 and IsReferenced=1
order by AccountCode desc
GO
/****** Object:  StoredProcedure [dbo].[GetAllMerchants]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetAllMerchants]
@bankCode varchar(50)
as
select B.AccountCode,B.AccountName,A.AccTypeName, CASE WHEN IsReferenced=0 THEN 'NO' ELSE 'YES' END AS IsReferenced,
 LiquidationType,B.CreatedOn,B.CreatedBy,LiquidationAccount
from BankAccounts AS B
inner join
AccountTypes AS A on B.AccType=A.AccTypeCode
where 
(B.BankCode=@bankCode or @bankCode='ALL') and
A.AccountCategory = 'MERCHANT'
and A.BankCode=B.BankCode
order by CreatedOn desc
GO
/****** Object:  StoredProcedure [dbo].[GetAllMerchantCustomerPayments]    Script Date: 12/29/2017 09:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetAllMerchantCustomerPayments]
@bankCode varchar(50),
@customerRef varchar(50),
@payRef varchar(50),
@startdate varchar(50),
@enddate varchar(50)
as

     declare @name varchar(50)
	 set @name  = (select CustomerName from MerchantCustomers where CustomerRef = @customerRef)
	 
if (LEN(@customerRef) > 0 and LEN(@payRef) > 0)
  begin 
    select G.RecordId,M.CustomerRef,G.CustomerName,G.TranAmount as 'Amount',G.Narration,G.RecordDate AS 'PayDate',G.PegPayTranId as 'PaymentReference'
     from GeneralLedgerTable G inner join BankAccounts B on G.AccountNumber=b.AccNumber
	inner join MerchantCustomers M on M.CustomerName=G.CustomerName
	where G.BankCode=@bankCode and G.CustomerName=@name and G.PegPayTranId=@payRef
	  and PaymentDate between @startdate and @enddate and TranType='Credit'
	order by RecordDate desc
  end 
else  if LEN(@customerRef) > 0 
    begin
    select G.RecordId,M.CustomerRef,G.CustomerName,G.TranAmount as 'Amount',G.Narration,G.RecordDate AS 'PayDate',G.PegPayTranId as 'PaymentReference'
     from GeneralLedgerTable G inner join BankAccounts B on G.AccountNumber=b.AccNumber
	inner join MerchantCustomers M on M.CustomerName=G.CustomerName
	where G.BankCode=@bankCode and G.CustomerName=@name
	  and PaymentDate between @startdate and @enddate and TranType='Credit'
	order by RecordDate desc
   end
else if LEN(@payRef) > 0 
   begin
    select G.RecordId,M.CustomerRef,G.CustomerName,G.TranAmount as 'Amount',G.Narration,G.RecordDate AS 'PayDate',G.PegPayTranId as 'PaymentReference'
     from GeneralLedgerTable G inner join BankAccounts B on G.AccountNumber=b.AccNumber
	inner join MerchantCustomers M on M.CustomerName=G.CustomerName
	where G.BankCode=@bankCode and G.PegPayTranId=@payRef and TranType='Credit'
	and PaymentDate between @startdate and @enddate
	order by RecordDate desc
   end  
else 
   begin
    select G.RecordId,M.CustomerRef,G.CustomerName,G.TranAmount as 'Amount',G.Narration,
    G.RecordDate AS 'PayDate',G.PegPayTranId as 'PaymentReference',B.AccountCode,B.BankCode
     from GeneralLedgerTable G inner join BankAccounts B on G.AccountNumber=b.AccNumber
	 inner join MerchantCustomers M on M.CustomerName=G.CustomerName
	 where  TranType='Credit' and G.BankCode=@bankCode
   end
GO
/****** Object:  StoredProcedure [dbo].[GetAllInterestAccountsThatHaveMatured]    Script Date: 12/29/2017 09:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetAllInterestAccountsThatHaveMatured]
as
Select * from BankAccounts where NextMaturityDate<GETDATE()
GO
/****** Object:  StoredProcedure [dbo].[GetAllExpiredLoans]    Script Date: 12/29/2017 09:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetAllExpiredLoans]
as
Select * from Loans where NextRepaymentDate<GETDATE() and Status='APPROVED' and 
IsActive=1
GO
/****** Object:  StoredProcedure [dbo].[GetAccessCredentialsByID]    Script Date: 12/29/2017 09:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetAccessCredentialsByID]
@AccessId varchar(50)
as

Select * from AccessCredentials 
where AccessId=@AccessId
GO
/****** Object:  StoredProcedure [dbo].[GenerateTrialBalanceReport]    Script Date: 12/29/2017 09:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GenerateTrialBalanceReport]
@BankCode varchar(50),
@BranchCode varchar(50),
@StartDate varchar(50),
@EndDate varchar(50)
as
Select 'CREDITS' as TranType,SUM(TranAmount) as SUM,Count(TranAmount) as TotalNumberFound 
from GeneralLedgerTable 
where TranType='CREDIT' 
and CONVERT(char(10),RecordDate,121)>=@StartDate 
and CONVERT(char(10),RecordDate,121)>=@EndDate  
and(BankCode=@BankCode or @BankCode='ALL') 
and (BranchCode=@BranchCode or @BranchCode='ALL')
UNION
Select 'DEBITS' as TranType,SUM(TranAmount) as SUM,Count(TranAmount) as TotalNumberFound 
from GeneralLedgerTable 
where TranType='DEBIT'  
and CONVERT(char(10),RecordDate,121)>=@StartDate 
and CONVERT(char(10),RecordDate,121)>=@EndDate  
and(BankCode=@BankCode or @BankCode='ALL') 
and (BranchCode=@BranchCode or @BranchCode='ALL')
UNION
Select 'TOTALS' as TranType,SUM(TranAmount) as SUM,Count(TranAmount) as TotalNumberFound 
from GeneralLedgerTable 
where (TranType='DEBIT' or TranType='CREDIT')
and CONVERT(char(10),RecordDate,121)>=@StartDate 
and CONVERT(char(10),RecordDate,121)>=@EndDate  
and(BankCode=@BankCode or @BankCode='ALL') 
and (BranchCode=@BranchCode or @BranchCode='ALL')
GO
/****** Object:  StoredProcedure [dbo].[GenerateTrialBalance]    Script Date: 12/29/2017 09:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GenerateTrialBalance](@StartDate varchar(50),@EndtDate varchar(50), @BankCode varchar(50))
as begin
	select AccountNumber as Account,
	(select upper(AccountName) from BankAccounts where AccNumber = eod.AccountNumber and BankCode = eod.BankCode) as VendorCode,
	OpeningBalance as OpeningBal,
	eod.TotalDebits,
	eod.TotalCredits,
	eod.ClosingBalance as ClosingBal from AccountEODBalances eod where (eod.AccountDate between @StartDate and @EndtDate) and
	AccountNumber in (select AccNumber from BankAccounts where BankCode = @BankCode and AccountCategory = 'SYSTEM') 
end
GO
/****** Object:  StoredProcedure [dbo].[GenerateTillBranchReport]    Script Date: 12/29/2017 09:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GenerateTillBranchReport]
@BankCode varchar(50),
@MerchantCode varchar(50),
@FromDate varchar(50),
@ToDate varchar(50),
@TillBranchCode varchar(50),
@TillCode varchar(50)
as
--select * from GeneralLedgerTable where Teller='10002201'

Select
	   G.PegPayTranId as 'Transaction Id',B.AccountCode as 'Merchant Code',B.AccountName as Merchant,
       G.TranAmount as 'Transaction Amount',
	   G.TranType as 'Transaction Type',G.RecordDate as 'Payment Date',G.Narration,G.Teller as 'Teller'	   
from GeneralLedgerTable AS G with(nolock) 
inner join BankAccounts B on B.AccNumber=G.AccountNumber
inner join CustomerDeviceMappings C on (C.BankCode=@BankCode and C.AccountCode=@MerchantCode and 
(@TillBranchCode='ALL' or C.Location=@TillBranchCode) and (@TillCode='' or C.CustomerId=@TillCode))
Where 
(G.TranType='Credit') and
(G.PaymentDate>=@FromDate or @FromDate='') and 
(G.PaymentDate<=@ToDate or @ToDate='') 
order by G.RecordDate desc
GO
/****** Object:  UserDefinedFunction [dbo].[GenerateRandomString]    Script Date: 12/29/2017 09:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[GenerateRandomString](@sLength INT)
RETURNS VARCHAR(100)
AS BEGIN
DECLARE @counter tinyint
DECLARE @nextChar char(1)
DECLARE @randomString varchar(50)
SET @counter = 1
SET @randomString =''
Declare @randomInt int
WHILE @counter <= @sLength
BEGIN
	--select @randomInt=Value from RandomValueView
	SELECT @nextChar = CHAR(48 + CONVERT(INT, (122-48+1)*(select value from randomValueView)))

	IF ASCII(@nextChar) not in (58,59,60,61,62,63,64,91,92,93,94,95,96)
	BEGIN
		SELECT @randomString = @randomString + @nextChar
		SET @counter = @counter + 1
	END
END
return @randomString
END
GO
/****** Object:  StoredProcedure [dbo].[GeneratePaymentDueReport]    Script Date: 12/29/2017 09:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GeneratePaymentDueReport]
@BankCode varchar(50),
@BranchCode varchar(50),
@ID varchar(50),
@FromDate datetime,
@ToDate datetime,
@Filter varchar(50)
as
Select LoanID,LoanAccountNumber,LoanAmount,NextRepaymentDate,LastRepaymentDate,Status from Loans A
inner join LoanTypes B on (A.LoanType=B.LoanTypeCode) and (A.BankCode=B.BankCode or B.BankCode='ALL')
inner join BankBranches C on (A.BranchCode=C.BranchCode and A.BankCode=C.BankCode)
where 
(A.BankCode=@BankCode or @BankCode='ALL' or A.BankCode='ALL') and 
(A.BranchCode=@BranchCode or @BranchCode='ALL') and
(LoanID=@ID or CustomerTel=@ID or AccountNumber=@ID or @ID='') and
A.CreatedOn>=@FromDate and 
A.CreatedOn<=@ToDate and
(Status=@Filter or @Filter='ALL')
GO
/****** Object:  StoredProcedure [dbo].[GenerateOutstandingBalanceReport]    Script Date: 12/29/2017 09:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GenerateOutstandingBalanceReport]
@BankCode varchar(50),
@BranchCode varchar(50),
@ID varchar(50),
@FromDate datetime,
@ToDate datetime,
@Filter varchar(50)
as
Select LoanID,LoanAccountNumber,LoanAmount,RemainingAmount,LastRepaymentDate,NextRepaymentDate,Status from Loans A
inner join LoanTypes B on (A.LoanType=B.LoanTypeCode) and (A.BankCode=B.BankCode or B.BankCode='ALL')
inner join BankBranches C on (A.BranchCode=C.BranchCode and A.BankCode=C.BankCode)
where 
(A.BankCode=@BankCode or @BankCode='ALL' or A.BankCode='ALL') and 
(A.BranchCode=@BranchCode or @BranchCode='ALL') and
(LoanID=@ID or CustomerTel=@ID or AccountNumber=@ID or @ID='') and
A.CreatedOn>=@FromDate and 
A.CreatedOn<=@ToDate and
(Status=@Filter or @Filter='ALL')
GO
/****** Object:  StoredProcedure [dbo].[GetBanksLoanCommissionAccount]    Script Date: 12/29/2017 09:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetBanksLoanCommissionAccount]
@bankCode varchar(50)
as
Select * from utilities where utilitycode='LOAN_ACCOUNT' and BankCode=@bankCode
GO
/****** Object:  StoredProcedure [dbo].[GetBankRoles]    Script Date: 12/29/2017 09:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetBankRoles]
@BankCode varchar(50)
as
Select R.RoleName
 from BankRoles B
 inner join Roles R on B.RoleCode=R.RoleCode
 where B.BankCode=@BankCode
GO
/****** Object:  StoredProcedure [dbo].[GetBankOpenAccountingDate]    Script Date: 12/29/2017 09:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetBankOpenAccountingDate]
@Bankcode varchar(50)
AS

BEGIN
SELECT top 1 AccountingDate,AccountingPeriod FROM dbo.SystemDateSettings where IsClosed=0
and BankCode=@Bankcode
order by AccountingDate desc
END
GO
/****** Object:  StoredProcedure [dbo].[GetBankChargesByBankCode]    Script Date: 12/29/2017 09:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetBankChargesByBankCode]
@BankCode varchar(50)
as
--Select distinct(ChargeCode),ChargeName from BankCharges where BankCode=@bankcode

SELECT 
    ChargeCode, ChargeName 
FROM (
    SELECT *, ROW_NUMBER() OVER (PARTITION BY chargecode ORDER BY chargeid) As rn
    FROM BankCharges) t
WHERE rn = 1
GO
/****** Object:  StoredProcedure [dbo].[GetBankChargeById]    Script Date: 12/29/2017 09:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetBankChargeById]
@ChargeId varchar(50)
as
Select * from BankCharges where ChargeId=@ChargeId
GO
/****** Object:  StoredProcedure [dbo].[GetBankBranchesByBankCode]    Script Date: 12/29/2017 09:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetBankBranchesByBankCode]
@bankCode varchar(50)
as
Select * from BankBranches where BankCode=@bankCode
GO
/****** Object:  StoredProcedure [dbo].[GetBankAccountsPendingEOD]    Script Date: 12/29/2017 09:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetBankAccountsPendingEOD]
@BankCode varchar(50)
as
Select * from BankAccounts 
where 
(LastEodDate is NULL or ( DATEDIFF(day,LastEodDate,GetDate())!=1))  and 
(BankCode=@BankCode or @BankCode='ALL') order by
LastEodDate desc
GO
/****** Object:  StoredProcedure [dbo].[GenerateLoanDisbursementReport]    Script Date: 12/29/2017 09:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GenerateLoanDisbursementReport]
@BankCode varchar(50),
@BranchCode varchar(50),
@ID varchar(50),
@FromDate datetime,
@ToDate datetime,
@Filter varchar(50)
as
Select LoanID,LoanAmount,AccountNumber,LoanAccountNumber,B.LoanTypeName,RepaymentFrequency,
InterestRate,A.InterestRateType as InterestType,C.BranchName,Status from Loans A
inner join LoanTypes B on (A.LoanType=B.LoanTypeCode) and (A.BankCode=B.BankCode or B.BankCode='ALL')
inner join BankBranches C on (A.BranchCode=C.BranchCode and A.BankCode=C.BankCode)
where 
(A.BankCode=@BankCode or @BankCode='ALL' or A.BankCode='ALL') and 
(A.BranchCode=@BranchCode or @BranchCode='ALL') and
(LoanID=@ID or CustomerTel=@ID or AccountNumber=@ID or @ID='') and
A.CreatedOn>=@FromDate and 
A.CreatedOn<=@ToDate and
(Status=@Filter or @Filter='ALL')
GO
/****** Object:  StoredProcedure [dbo].[GenerateInterestAcruedReport]    Script Date: 12/29/2017 09:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GenerateInterestAcruedReport]
@BankCode varchar(50),
@BranchCode varchar(50),
@ID varchar(50),
@FromDate datetime,
@ToDate datetime,
@Filter varchar(50)
as
Select * from GeneralLedgerTable A
inner join BankBranches C on (A.BranchCode=C.BranchCode and A.BankCode=C.BankCode)
where 
(A.BankCode=@BankCode or @BankCode='ALL' or A.BankCode='ALL') and 
(A.BranchCode=@BranchCode or @BranchCode='ALL') and
A.RecordDate>=@FromDate and 
A.RecordDate<=@ToDate and
TranCategory='INTEREST_ACRUED'
GO
/****** Object:  StoredProcedure [dbo].[GetBankAccountsByBankCode]    Script Date: 12/29/2017 09:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetBankAccountsByBankCode]
@BankCode varchar(50)
as
Select  AccountCode,AccNumber,AccountName,AccType,A.BranchCode,A.IsActive,A.CreatedBy,A.CreatedOn,
case A.LiquidationType when 'REALTIME' then 'RT' when 'ONDEMAND' then 'OD' when 'SCHEDULED' then 'SC' else A.LiquidationType end as LiquidationType,
case A.IsReferenced when 1 then 'Y' else 'N' end as Referenced,
A.SentToBank,A.LiquidationAccount from BankAccounts A
where 
(A.BankCode=@BankCode) and A.IsActive=1
 and A.LiquidationType !='NONE' 
 and SentToBank=0 and ISNUMERIC(A.LiquidationAccount)= 1
 --and LEN(A.LiquidationAccount) = 13
 and LiquidationAccount not in (select R.LiquidationAccount from RegisterationLogs R)
 and CreatedOn>'2017-03-15'
GO
/****** Object:  StoredProcedure [dbo].[GetBankAccountCategoryDetails]    Script Date: 12/29/2017 09:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetBankAccountCategoryDetails]
@CategoryCode varchar(50),
@BankCode varchar(50)

AS

Select * from dbo.AccountCategories
where 
AccountCategoryCode=@CategoryCode
and
BankCode=@BankCode
GO
/****** Object:  StoredProcedure [dbo].[GetTransactionStatus]    Script Date: 12/29/2017 09:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetTransactionStatus]
@BankTranId varchar(50),
@BankCode varchar(50)
as 
Select * from TransactionRequests where RecordId=@BankTranId and @BankCode=@BankCode
GO
/****** Object:  StoredProcedure [dbo].[GetTransactionsDoneAgainistAccount]    Script Date: 12/29/2017 09:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetTransactionsDoneAgainistAccount]
@BankCode varchar(50),
@AccountNumber varchar(50),
@StartDate varchar(50),
@EndDate varchar(50)
as
Select * from GeneralLedgerTable 
where AccountNumber=@AccountNumber 
and BankCode=@BankCode 
and CONVERT(char(10),RecordDate,121)>=@StartDate
and CONVERT(char(10),RecordDate,121)<=@EndDate
GO
/****** Object:  StoredProcedure [dbo].[GetTransactionRequestDetails]    Script Date: 12/29/2017 09:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetTransactionRequestDetails]
@BankId varchar(50),
@BankCode varchar(50)
as
Select * from TransactionRequests A 
inner join BankBranches B on (A.BranchCode=B.BranchCode and A.BankCode=B.BankCode)
where RecordId=@BankId and A.BankCode=@BankCode
GO
/****** Object:  StoredProcedure [dbo].[GetTransactionRequestByBankTranId]    Script Date: 12/29/2017 09:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetTransactionRequestByBankTranId]
@BankTranId varchar(50),
@BankCode varchar(50)
as 
Select * from TransactionRequests where BankTranId=@BankTranId and @BankCode=@BankCode
GO
/****** Object:  StoredProcedure [dbo].[GetTransactionRequest]    Script Date: 12/29/2017 09:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetTransactionRequest]
@BankTranId varchar(50),
@BankCode varchar(50)
as 
Select * from TransactionRequests where RecordId=@BankTranId and @BankCode=@BankCode
GO
/****** Object:  StoredProcedure [dbo].[GetTransactionDetailsById]    Script Date: 12/29/2017 09:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetTransactionDetailsById]
@PegPayId varchar(50),
@BankCode varchar(50)
as
Select * from GeneralLedgerTable A 
inner join BankBranches B on (A.BranchCode=B.BranchCode and A.BankCode=B.BankCode)
inner Join BankAccounts AS C on A.AccountNumber=c.AccNumber
where PegPayTranId=@PegPayId and A.BankCode=@BankCode
and TranType='Credit'
GO
/****** Object:  StoredProcedure [dbo].[GetTransactionChannels]    Script Date: 12/29/2017 09:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetTransactionChannels](@channel varchar(50))
as begin
	select * from ApiAccessChannels where (Channel = @channel or @channel = '0')
	order by recordid desc
	end
GO
/****** Object:  StoredProcedure [dbo].[GetTransactionByTransactionId2]    Script Date: 12/29/2017 09:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetTransactionByTransactionId2]
@MerchantId varchar(50),
@VendorTranID varchar(50)
as
Select * from PaymentsGatewayRequests 
where RecordId=@VendorTranID
and MerchantCode=@MerchantId
GO
/****** Object:  StoredProcedure [dbo].[GetTransactionByTransactionId]    Script Date: 12/29/2017 09:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetTransactionByTransactionId]
@MerchantId varchar(50),
@VendorTranID varchar(50)
as
Select * from PaymentsGatewayRequests 
where VendorTranId=@VendorTranID
and MerchantCode=@MerchantId
GO
/****** Object:  StoredProcedure [dbo].[GetTransactionByBankId]    Script Date: 12/29/2017 09:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetTransactionByBankId]
@Bankref varchar(50),
@BankCode varchar(50)
as 
Select * from GeneralLedgerTable with(nolock) where 
BankTranId=@Bankref and BankCode=@BankCode
GO
/****** Object:  StoredProcedure [dbo].[GetTranRequest]    Script Date: 12/29/2017 09:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Proc [dbo].[GetTranRequest]
@TransactionId varchar(50)
AS

Select * from TransactionRequests
Where RecordId=@TransactionId
GO
/****** Object:  StoredProcedure [dbo].[GetTillByPhone]    Script Date: 12/29/2017 09:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetTillByPhone]
@phone varchar(50)
as
select * from CustomerDeviceMappings C
inner join BankAccounts A on A.AccountCode=C.AccountCode
where (DeviceId=@phone or DeviceId like '%'+Substring(@phone, 2, (len(@phone)))+'%')
GO
/****** Object:  StoredProcedure [dbo].[GetTillBranchesForDropDown]    Script Date: 12/29/2017 09:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[GetTillBranchesForDropDown]
	@BankCode varchar(50),
	@AccountCode varchar(50),
	@TillBranch varchar(50)
As
Begin
	Select AccountCode, TillBranchCode, TillBranchName
	From MerchantTillBranches
	Where
		BankCode = @BankCode and
		AccountCode=@AccountCode and
		(TillBranchCode = @TillBranch or @TillBranch='') 
End
GO
/****** Object:  StoredProcedure [dbo].[GetTranStatusById]    Script Date: 12/29/2017 09:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[GetTranStatusById]
	@pegpayid varchar(50)
As
Begin
	select * from GeneralLedgerTable where PegPayTranId=@pegpayid
	and SentToBank=1
End
GO
/****** Object:  StoredProcedure [dbo].[GetTransRequestDetails]    Script Date: 12/29/2017 09:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetTransRequestDetails]
@TranId varchar(50)
AS


Select * from TransactionRequests
where RecordId=@TranId
GO
/****** Object:  StoredProcedure [dbo].[GetTransByBatch]    Script Date: 12/29/2017 09:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[GetTransByBatch]
@BatchNo varchar(50)
AS
SELECT     TranId, BatchNo, CustomerRef,CASE WHEN TransNo is null THEN dbo.fn_GetReceiptno(TranId) ELSE TransNo END AS Receiptno, 
CONVERT(varchar(12), PaymentDate, 102) AS PayDate,
 CONVERT(varchar(12), RecordDate, 102) AS PostDate, 
                      ROUND(TranAmount, 0) AS TranAmount, PaymentType
FROM         Reconciled
Where BatchNo = @BatchNo
GO
/****** Object:  StoredProcedure [dbo].[GetTransactionTypesByBankCode]    Script Date: 12/29/2017 09:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[GetTransactionTypesByBankCode]
	@bankcode varchar(50)
As
Begin
	Select *
	From TransactionCategories
	Where
		BankCode=@bankcode
End
GO
/****** Object:  StoredProcedure [dbo].[GetUnprocessedReversals]    Script Date: 12/29/2017 09:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetUnprocessedReversals]
@AccountNumber varchar(50),
@BankCode varchar(50)
As
select * from GeneralLedgerTable G with(nolock)
where 
AccountNumber=@AccountNumber
and TranCategory='REVERSAL'
and G.BankCode=@BankCode
and G.Processed=0
and TranType = 'Credit'
and PaymentDate>'2017-04-09 23:20:58.000'
GO
/****** Object:  StoredProcedure [dbo].[GetUnporcessedC2MLiquidations]    Script Date: 12/29/2017 09:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetUnporcessedC2MLiquidations]
@AccountNumber varchar(50),
@BankCode varchar(50)
As
select * from GeneralLedgerTable G with(nolock)
where 
AccountNumber=@AccountNumber
and TranCategory in ('C2M')
and G.BankCode=@BankCode
and G.Processed=0
and TranType = 'Credit'
and PaymentDate>'2017-04-09 23:20:58.000'
GO
/****** Object:  StoredProcedure [dbo].[GetUnCompleteLiquidations]    Script Date: 12/29/2017 09:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetUnCompleteLiquidations]
@BankCode varchar(50)
As
select *
from GeneralLedgerTable T 
where
TranCategory in ('WEB_LIQUIDATION_PAYMENT','INTERNAL_TRANSFER','DEPOSIT')
and BankCode=@BankCode
and SentToBank=1
and BankStatus !='COMPLETED'
GO
/****** Object:  StoredProcedure [dbo].[GetPendingBillPayments]    Script Date: 12/29/2017 09:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetPendingBillPayments]
as
Select C.CustomerRef,A.CustName as CustomerName,C.Area,B.UtilityCode,Convert(varchar(10),Convert(Date,A.RecordDate)) as PaymentDate,A.TranAmount,C.CustomerTel,A.ItemDesc as Narration,A.VendorTranId as VendorTranId,C.Area as CustomerType from PaymentsGatewayRequests A
inner join MarketPlaceBillers B on A.MerchantCode=B.MerchantCode and B.ApiCode='UTILITIES'
inner join MarketPlaceRequests C on C.VendorId=A.VendorTranId
where --A.Processed=1 and 
A.SentToUtility=0 and A.Status='SUCCESS' 
--and no reversals
and PaymentOptionSelected not like '%REVERSAL'
GO
/****** Object:  StoredProcedure [dbo].[GetPegPaygatewayTransToProcess]    Script Date: 12/29/2017 09:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetPegPaygatewayTransToProcess]
AS

SELECT * FROM PaymentsGatewayRequests 
WHERE Status='SUCCESS' and Processed=0 
--and no reversals
and PaymentOptionSelected not like '%REVERSAL'
GO
/****** Object:  StoredProcedure [dbo].[GetPegPaygatewayTransToNotify]    Script Date: 12/29/2017 09:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetPegPaygatewayTransToNotify]
@merchantId varchar(50)
AS
SELECT * FROM PaymentsGatewayRequests 
WHERE Status='SUCCESS' and SentToUtility=0 and
( (MerchantCode=@merchantId and Processed=1)
  or MerchantCode = '100019')
GO
/****** Object:  StoredProcedure [dbo].[GetPegasusMerchantLiquidationAccount]    Script Date: 12/29/2017 09:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetPegasusMerchantLiquidationAccount]
@AccountName varchar(50),
@BankCode varchar(50)

AS

select LiquidationAccount from BankAccounts  
where BankCode = 'SBU' and LiquidationAccountName='PegasusMerchantTest'
GO
/****** Object:  StoredProcedure [dbo].[GetHeadAccountNumber]    Script Date: 12/29/2017 09:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetHeadAccountNumber](@bankCode varchar(50))
as begin
	select AccountName,AccNumber,AccType, AccountCode,
	(Select top 1 OpeningBalance from AccountEODBalances where AccountNumber=ba.AccNumber order by AccountingDate desc) as OpeningBal,
	(Select top 1 ClosingBalance from AccountEODBalances where AccountNumber=ba.AccNumber order by AccountingDate desc) as ClosingBal,
	(Select top 1 AccountDate from AccountEODBalances where AccountNumber=ba.AccNumber order by RecordId desc) as LastEodDate
	from BankAccounts ba where AccType = 'HEADER_ACCOUNT' and (BankCode = @bankCode or @bankCode = '0')

end 

--select * from BankAccounts where AccType = 'HEADER_ACCOUNT' and (BankCode = @bankCode or @bankCode = '0')
--Select top 1 OpeningBalance , AccountDate from AccountEODBalances where AccountNumber='90000325144559867' order by AccountingDate desc

-- select * from AccountEODBalances where accountnumber= '90000325144559867' 
--select * from AccountTypes where BankCode  ='sbu'
--select * from BankAccounts where BankCode = 'sbu'
GO
/****** Object:  StoredProcedure [dbo].[GetGuarantorTypesByBankCode]    Script Date: 12/29/2017 09:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetGuarantorTypesByBankCode]
@BankCode varchar(50)
as
Select * from GuarantorTypes where (BankCode=@BankCode or BankCode='ALL' or @BankCode='ALL')
GO
/****** Object:  StoredProcedure [dbo].[GetGuarantorsByLoanID]    Script Date: 12/29/2017 09:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetGuarantorsByLoanID]
@LoanID varchar(50),
@BankCode varchar(50)
as
Select * from Guarantors where LoanID=@LoanID and BankCode=@BankCode
GO
/****** Object:  StoredProcedure [dbo].[GetGatewayTransactionDetails]    Script Date: 12/29/2017 09:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetGatewayTransactionDetails]
@VendorId varchar(50)
as
Select * from PaymentsGatewayRequests 
where VendorTranId=@VendorId
order by RecordDate desc
GO
/****** Object:  StoredProcedure [dbo].[GetExtras]    Script Date: 12/29/2017 09:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetExtras]
@merchantid varchar(50)
AS
select * from MerchantExtras
where MerchantId=@merchantid
GO
/****** Object:  StoredProcedure [dbo].[GetPrnPayment]    Script Date: 12/29/2017 09:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetPrnPayment]
@Prn varchar(50),
@MerchantCode varchar(50)
as
Select * from PaymentsGatewayRequests where MerchantCode=@MerchantCode and CustRef=@Prn and Status='SUCCESS'
GO
/****** Object:  StoredProcedure [dbo].[GetpendingTransactionstoReverse]    Script Date: 12/29/2017 09:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetpendingTransactionstoReverse]
AS

SELECT * FROM PaymentsGatewayRequests 
WHERE Status='SUCCESS' and Processed=0 
and PaymentOptionSelected like '%REVERSAL'
GO
/****** Object:  StoredProcedure [dbo].[GetPendingMomoPayments]    Script Date: 12/29/2017 09:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetPendingMomoPayments]
as
Select C.CustomerRef,A.CustName as CustomerName,C.Area,B.UtilityCode,Convert(varchar(10),Convert(Date,A.RecordDate)) as PaymentDate,
A.TranAmount,C.CustomerTel,A.ItemDesc as Narration,A.VendorTranId as VendorTranId,C.Area as CustomerType,TransactionRef 
from PaymentsGatewayRequests A
inner join MarketPlaceBillers B on A.MerchantCode=B.MerchantCode and B.ApiCode='MOBILE_MONEY'
inner join MarketPlaceRequests C on C.VendorId=A.VendorTranId
where --A.Processed=1 and 
A.SentToUtility=0 and A.Status='SUCCESS' 
--and no reversals
and PaymentOptionSelected not like '%REVERSAL'
GO
/****** Object:  StoredProcedure [dbo].[GetPendingLiquidationsToBank]    Script Date: 12/29/2017 09:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetPendingLiquidationsToBank]
@BankCode varchar(50)
As
select B.AccountCode,T.CustomerTel,T.TranAmount,T.RecordId,T.BankCode,T.Narration,T.TranCategory from TransactionRequests T inner join BankAccounts B on B.AccNumber=T.FromAccount
where
T.TranCategory in ('WEB_LIQUIDATION_PAYMENT','INTERNAL_TRANSFER','DEPOSIT')
and T.BankCode=@BankCode
and B.SentToBank=1
and T.Status='SUCCESS'
and T.SentToBank=0
GO
/****** Object:  StoredProcedure [dbo].[GetPendingLiquidationsM2B]    Script Date: 12/29/2017 09:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetPendingLiquidationsM2B]
@AccountNumber varchar(50),
@BankCode varchar(50)

As
--the tranRef for liquidations is the Payment Id i.e Telecom or MiGs ID
Select G.CustomerRef,G.CustomerTel, G.PegPayTranId,R.ChequeNumber as TranRef,TranAmountInAccountCurrency,G.FromAccount,G.AccountNumber,G.TranCategory,
        G.SentToBank,BankSentDate,G.BankCode,G.Narration,G.BankTranId,G.PaymentDate,G.CustomerName,G.PaymentType
from GeneralLedgerTable G inner join TransactionRequests R on R.RecordId=G.BankTranId where 
G.AccountNumber=@AccountNumber
and G.TranCategory='M2B'
and G.BankCode=@BankCode
and ((G.SentToBank=0) or (G.SentToBank=1 and BankStatus in ('PENDING','QUEUED')))
--and G.RecordDate>'2017-08-27 16:50:00.000' --did this to isolate previous transactions of the 27/08/2017
--premise a transaction to the bank is 2 part i.e. a notification and then a liquidation
-- the notification should be sent with the PegPayId
--whereas the liquidation should be sent with telecom/migs id
--however for the most part of 27/08/17 i.e 6am - 5pm, both trantypes were sent with the same id (telecom)
--and since the notification is sent first in most instances, the liquidations were failing
--let us deal with the backlog on 28/07/17
---for now isoalation is what i'll do

--10055595 upwards

and G.PaymentDate>'2017-07-08 09:20:58.000'
--and G.PaymentDate < '2017-07-08 00:00:00.000'

--excluded local gov accounts, rolled back changes
GO
/****** Object:  StoredProcedure [dbo].[GetPendingLiquidationsC2M]    Script Date: 12/29/2017 09:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetPendingLiquidationsC2M]
@AccountNumber varchar(50),
@BankCode varchar(50)

As
--the tranRef for notifications(C2M) should be the pegpay Id since Telecom or MiGs ID are used for liquidations(M2B)
Select CustomerRef,CustomerTel,PegPayTranId,PegPayTranId as TranRef,TranAmountInAccountCurrency,FromAccount,AccountNumber,TranCategory,
        SentToBank,BankSentDate,BankCode,Narration,BankTranId,PaymentDate,CustomerName,PaymentType
 from GeneralLedgerTable 
 where
 RecordDate>'2017-08-27 16:50:00.000' --did this to isolate previous transactions of the 27/08/2017
--premise: a transaction to the bank is 2 part i.e. a notification and then a liquidation
-- the notification should be sent with the PegPayId
--whereas the liquidation should be sent with telecom/migs id
--however for the most part of 27/08/17 i.e 6am - 5pm, both trantypes were sent with the same id (telecom)
--and since the notification is sent first in most instances, the liquidations were failing
--let us deal with the backlog on 28/07/17
---for now isoalation is what i'll do

--4193098281 downwards are  banktranids with the problem
and 
AccountNumber=@AccountNumber
and TranCategory = 'C2M'
and BankCode = @BankCode
and SentToBank=0
--and PaymentDate>'2017-05-08 09:20:58.000'
GO
/****** Object:  StoredProcedure [dbo].[GetPendingLiquidations]    Script Date: 12/29/2017 09:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetPendingLiquidations]
@AccountNumber varchar(50),
@BankCode varchar(50)

As
Select  PegPayTranId,PegPayTranId as TranRef,TranAmountInAccountCurrency,FromAccount,AccountNumber,TranCategory,
        SentToBank,BankSentDate,BankCode,Narration,BankTranId,CustomerName
 from GeneralLedgerTable where 
AccountNumber=@AccountNumber
and TranCategory in ('C2M')
and BankCode=@BankCode
and SentToBank=0
and PaymentDate>'2017-05-08 09:20:58.000'
union
Select  G.PegPayTranId,R.BankTranId as TranRef,TranAmountInAccountCurrency,G.FromAccount,G.AccountNumber,G.TranCategory,
        G.SentToBank,BankSentDate,G.BankCode,G.Narration,G.BankTranId,G.CustomerName
from GeneralLedgerTable G inner join TransactionRequests R on R.RecordId=G.BankTranId where 
G.AccountNumber=@AccountNumber
and G.TranCategory='M2B'
and G.BankCode=@BankCode
and ((G.SentToBank=0) or (G.SentToBank=1 and BankStatus in ('PENDING','QUEUED')))
and G.PaymentDate>'2017-05-08 09:20:58.000'
GO
/****** Object:  StoredProcedure [dbo].[GetReversalAmount]    Script Date: 12/29/2017 09:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetReversalAmount]
@BankTranId varchar(50),
@BankCode varchar(50)
as
Select TranAmount From GeneralLedgerTable where 
chequenumber=@BankTranId and TranCategory='M2B' and
BankCode=@BankCode and TranType='CREDIT' --order by RecordDate desc
GO
/****** Object:  StoredProcedure [dbo].[GetRevBatchDetails]    Script Date: 12/29/2017 09:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[GetRevBatchDetails]
@BatchNo varchar(50)
AS
SELECT     T.TranId, T.BatchNo, T.CustomerRef, dbo.fn_GetReceiptno(T.TranId) AS Str1, CONVERT(varchar(12),
 T.PaymentDate, 102) AS PaymentDate, CONVERT(varchar(12), 
                      T.RecordDate, 102) AS PostDate, ROUND(T.TranAmount, 0) AS Amount, B.CreatedBy
FROM         Reconciled AS T INNER JOIN
                      PayBatches AS B ON T.BatchNo = B.BatchNo
Where T.BatchNo = @BatchNo
GO
/****** Object:  StoredProcedure [dbo].[GetReportsByBankCode]    Script Date: 12/29/2017 09:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetReportsByBankCode]
@BankCode varchar(50),
@ReportCategory varchar(50)
as
Select * from Reports 
where (BankCode=@BankCode or BankCode='ALL' or @BankCode='ALL') 
and (ReportCategory=@ReportCategory or @ReportCategory='')
GO
/****** Object:  StoredProcedure [dbo].[GetRejectedAccountById]    Script Date: 12/29/2017 09:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetRejectedAccountById]
@AccountId varchar(50),
@BankCode varchar(50)
as
select * from RejectedBankAccounts where AccountCode=@AccountId and BankCode=@BankCode
GO
/****** Object:  StoredProcedure [dbo].[GetRegisteredBankAccountsByBankCode_PS]    Script Date: 12/29/2017 09:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetRegisteredBankAccountsByBankCode_PS] 
	-- Add the parameters for the stored procedure here
	@BankCode varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
Select  AccountCode,AccNumber,AccType,BranchCode,BankCode,AccountName,IsReferenced,MerchantContact,
IsActive,CreatedBy,CreatedOn,LiquidationType,SentToBank,LiquidationAccount from BankAccounts 
where 
(BankCode=@BankCode)
and LiquidationType ='REALTIME' and AccountCode='100115' 
and SentToBank=1 --and A.Crea
END
GO
/****** Object:  StoredProcedure [dbo].[GetRegisteredBankAccountsByBankCode]    Script Date: 12/29/2017 09:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetRegisteredBankAccountsByBankCode]
@BankCode varchar(50)
as
Select  AccountCode,AccNumber,AccType,BranchCode,BankCode,AccountName,IsReferenced,MerchantContact,
IsActive,CreatedBy,CreatedOn,LiquidationType,SentToBank,LiquidationAccount from BankAccounts 
where 
(BankCode=@BankCode)
and LiquidationType ='REALTIME' and AccountCode='100041' 
and SentToBank=1 --and A.Crea
GO
/****** Object:  StoredProcedure [dbo].[GetSuspenseAccount]    Script Date: 12/29/2017 09:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetSuspenseAccount]
@BankCode varchar(50)

AS

select * from BankAccounts  
where BankCode = @BankCode and AccType='SUSPENSE_ACCOUNT'
GO
/****** Object:  StoredProcedure [dbo].[GetSumOfAllOfTransactionsDoneTodayHeaderAccount]    Script Date: 12/29/2017 09:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[GetSumOfAllOfTransactionsDoneTodayHeaderAccount](@dateTime varchar(50), @openingBalance varchar(50), @BankCode varchar(50))
as begin

	 declare @TotalDebit money, @TotalCredits money, @openingBal money = convert(money, convert(int, @openingBalance)), @closingBal money
		
	select @TotalCredits = IsNull(SUM(TotalCredits),0) from AccountEODBalances where
	AccountNumber in (select AccNumber from BankAccounts where BankCode = @BankCode and AccountCategory != 'SYSTEM')
	and CONVERT(varchar(10), AccountDate,126) =  @dateTime and BankCode = @bankCode

	select @TotalDebit =IsNull(SUM(TotalDebits),0) from AccountEODBalances where
	AccountNumber in (select AccNumber from BankAccounts where BankCode = @BankCode and AccountCategory != 'SYSTEM')
	and CONVERT(varchar(10), AccountDate,126) =  @dateTime and BankCode = @bankCode
	
	set @closingBal = ((@openingBal+@TotalCredits) + @TotalDebit)
		
	select @TotalDebit as TotalDebits, @TotalCredits as TotalCredits, @closingBal as ClosingBal, @openingBal as OpeningBal


end
GO
/****** Object:  StoredProcedure [dbo].[GetSumOfAllOfTransactionsDoneToday]    Script Date: 12/29/2017 09:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetSumOfAllOfTransactionsDoneToday](@accountNumber varchar(50), @openingBalance varchar(50),
 @date varchar(50), @bankCode varchar(50))
as begin

	Begin try
	Begin Transaction trans
		--select @accountNumber as AccNumber, @openingBalance as OpenBal, @date as DateTimes, @bankCode as BankCode
		--select TranCategory,* from GeneralLedgerTable order by RecordDate desc

	    declare @TotalDebit money, @TotalCredits money, @openingBal money = convert(money, convert(int, @openingBalance)), @closingBal money
		
		select @TotalCredits = IsNull(SUM(TranAmount),0) from GeneralLedgerTable where TranType = 'Credit' and AccountNumber = @accountNumber
		and CONVERT(varchar(10), recorddate,126) =  @date and BankCode = @bankCode

		select @TotalDebit =IsNull(SUM(TranAmount),0) from GeneralLedgerTable where TranType = 'Debit' and AccountNumber = @accountNumber
		and CONVERT(varchar(10), recorddate,126) =  @date and BankCode = @bankCode
	
		set @closingBal = ((@openingBal+@TotalCredits) + @TotalDebit)
		
		select @TotalDebit as TotalDebits, @TotalCredits as TotalCredits,   @closingBal as ClosingBal, @openingBal as OpeningBal
	
		--select '2030'
		Commit Transaction trans
		
	End Try
	Begin Catch
		Rollback Transaction trans

		DECLARE
		@ErMessage NVARCHAR(2048),
		@ErSeverity INT,
		@ErState INT

		SELECT
		@ErMessage = ERROR_MESSAGE(),
		@ErSeverity = ERROR_SEVERITY(),
		@ErState = ERROR_STATE()

		RAISERROR (@ErMessage,
				 @ErSeverity,
				 @ErState )
				 
	End Catch
		
end
GO
/****** Object:  StoredProcedure [dbo].[GetStatusFromLogs]    Script Date: 12/29/2017 09:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetStatusFromLogs]
@pegpayid varchar(50)
AS
select * from BankResponseLog
where PegPayId=@pegpayid
GO
/****** Object:  StoredProcedure [dbo].[GetRefundAmount]    Script Date: 12/29/2017 09:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetRefundAmount]
@TelecomId varchar(50)
as
Select top 1 TranAmount from GeneralLedgerTable where ChequeNumber=@TelecomId and TranCategory='M2B' and TranType='credit'
GO
/****** Object:  StoredProcedure [dbo].[GetRedirectUrl]    Script Date: 12/29/2017 09:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetRedirectUrl]
@EditType varchar(50)
as
Select * from UrlRedirects where EditType=@EditType
GO
/****** Object:  StoredProcedure [dbo].[GetNationalitiesByBankCode]    Script Date: 12/29/2017 09:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetNationalitiesByBankCode]
@BankCode varchar(50)
as
Select * from Countries
GO
/****** Object:  StoredProcedure [dbo].[GetCustomerTypes]    Script Date: 12/29/2017 09:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetCustomerTypes]
AS
Select * from dbo.CustomerTypes
GO
/****** Object:  StoredProcedure [dbo].[GetCustomerRefForTransaction]    Script Date: 12/29/2017 09:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetCustomerRefForTransaction]
@VendorTranId varchar(50)
as
Select * from PaymentsGatewayRequests where VendorTranId=@VendorTranId
GO
/****** Object:  StoredProcedure [dbo].[GetCustomerDetailsByCustomerRef]    Script Date: 12/29/2017 09:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetCustomerDetailsByCustomerRef]
@CustomerRef varchar(50),
@MerchantCode varchar(50)
as
Select * from MerchantCustomers where CustomerRef=@CustomerRef and AccountCode=@MerchantCode
GO
/****** Object:  StoredProcedure [dbo].[GetCustomerAccounts]    Script Date: 12/29/2017 09:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetCustomerAccounts]
@accNumber varchar(50),
@bankCode varchar(50)
as
Select * from BankAccounts A
inner join TellersToAccountsMapping B on A.AccNumber=B.AccountNumber
where (a.AccType = 'CURRENT_ACCOUNT' or a.AccType = 'SAVINGS_ACCOUNT') and (a.AccNumber = @accNumber or @accNumber = '') and a.BankCode = @bankCode


--select * from AccountTypes
GO
/****** Object:  StoredProcedure [dbo].[GetCustomerAccountsUsingAccountNumber]    Script Date: 12/29/2017 09:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetCustomerAccountsUsingAccountNumber]
@AccountNumber varchar(50),
@BankCode varchar(50),
@AccType varchar(50)
as
Declare @CustomerId varchar(50);
Select @CustomerId=CustomerId from CustomersToAccountsMapping 
where  AccountNumber=@AccountNumber and BankCode=@BankCode

Select distinct(t1.AccNumber),t1.* from 
(
	Select B.CustomerId,A.* from BankAccounts A
	inner join CustomersToAccountsMapping B on (B.CustomerId=@CustomerId and B.BankCode=A.BankCode)
	inner join AccountTypes C on (C.AccTypeCode=A.AccType and B.BankCode=A.BankCode)
	where (A.AccType=@AccType or @AccType='' or @AccType='ALL') and A.BankCode=@BankCode
	and C.AccountCategory='INDIVIDUAL'
)t1
GO
/****** Object:  StoredProcedure [dbo].[GetBankUserChangesPendingDetailsById]    Script Date: 12/29/2017 09:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetBankUserChangesPendingDetailsById]
@ApprovalId varchar(50)
as
Select * from BankSystemUserChanges where RecordId=@ApprovalId
GO
/****** Object:  StoredProcedure [dbo].[GetBankUserChangesPendingApproval]    Script Date: 12/29/2017 09:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetBankUserChangesPendingApproval]
@BankCode varchar(50),
@BranchCode varchar(50),
@UserId varchar(50)
as
Select RecordId as ApprovalId,UserId,Email,UserType,ModifiedOn,ModifiedBy,IsActive from BankSystemUserChanges where BankCode=@BankCode
and (@BranchCode='ALL' or BranchCode=@BranchCode) and 
(@UserId='' or UserId=@UserId or FirstName like '%'+@UserId+'%' or LastName like '%'+@UserId+'%' or OtherName like '%'+@UserId+'%')
and (Status='' or Status is NULL)
GO
/****** Object:  StoredProcedure [dbo].[GenerateNewAccountsReports]    Script Date: 12/29/2017 09:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GenerateNewAccountsReports]
@BankCode varchar(50),
@BranchCode varchar(50),
@StartDate varchar(50),
@EndDate varchar(50)
as
Select AccountName,AccNumber as AccountNumber,AccType as AccountType,BranchCode,CreatedOn,CreatedBy,IsActive,CurrencyCode from BankAccounts where 
(BankCode=@BankCode or @BankCode='ALL') 
and (BranchCode=@BranchCode or @BranchCode='ALL')
and (CONVERT(char(10),CreatedOn,121)>=@StartDate or @StartDate='')
and (CONVERT(char(10),CreatedOn,121)<=@EndDate or @EndDate='')
GO
/****** Object:  StoredProcedure [dbo].[GetBatchedTransToUpload]    Script Date: 12/29/2017 09:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[GetBatchedTransToUpload]
@BillCode varchar(50)
AS
SELECT dbo.fn_GetReceiptnumber(TranId) AS TranId,
--isnull(TransNo,TranId) AS TranNo,
 T.CustomerRef, T.TranAmount,
PaymentDate,
--REPLACE(convert(varchar(12),T.PaymentDate,102),'.','') AS PaymentDate,
B.BatchNo
--,B.RecordID AS BatchID,T.TranType,
--Isnull(T.TranNarration,'NONE') AS ChequeDetails
FROM         Reconciled AS T INNER JOIN
                      PayBatches AS B ON T.BatchNo = B.BatchNo
WHERE VendorCode = (Select VendorCode  from Vendors Where BillSystemCode = @BillCode)
AND BSUpdated = 1
AND Cancelled = 0
AND T.TranAmount > 0
AND B.BatchNo is not null
AND B.BatchType = 'P'
AND UPPER(CustomerType) = 'POSTPAID'
GO
/****** Object:  StoredProcedure [dbo].[GetCollateralTypesByBankCode]    Script Date: 12/29/2017 09:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetCollateralTypesByBankCode]
@bankCode varchar(50)
as
Select * from CollateralTypes where BankCode=@bankCode
GO
/****** Object:  StoredProcedure [dbo].[GetCollateralsByLoanID]    Script Date: 12/29/2017 09:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetCollateralsByLoanID]
@LoanID varchar(50),
@BankCode varchar(50)
as
Select * from Collaterals where LoanID=@LoanID and BankCode=@BankCode
GO
/****** Object:  StoredProcedure [dbo].[GetChargeTypesByBankCode]    Script Date: 12/29/2017 09:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetChargeTypesByBankCode]
@bankCode varchar(50)
as
Select * from ChargeTypes where BankCode=@bankCode
GO
/****** Object:  StoredProcedure [dbo].[GetChannelTranId]    Script Date: 12/29/2017 09:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetChannelTranId]
@bankId varchar(50)

As
Select BankTranId from TransactionRequests where 
RecordId=@bankId
GO
/****** Object:  StoredProcedure [dbo].[GetChannelCredentials]    Script Date: 12/29/2017 09:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetChannelCredentials](@channel varchar(50))
as begin
	select * from ApiAccessChannels where Channel = @channel
end
GO
/****** Object:  StoredProcedure [dbo].[GetBussinessTypesByBankCode]    Script Date: 12/29/2017 09:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetBussinessTypesByBankCode]
@BankCode varchar(50)
as
Select * from BussinessTypes 
where (BankCode=@BankCode or @BankCode='ALL' or BankCode='ALL')
GO
/****** Object:  StoredProcedure [dbo].[GetBeneficiariesByCustomerId]    Script Date: 12/29/2017 09:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetBeneficiariesByCustomerId]
@BankCode varchar(50),
@CustomerId varchar(50)
as
Select * from Beneficiaries where BankCode=@BankCode and CustomerId=@CustomerId
GO
/****** Object:  StoredProcedure [dbo].[GetCurrentOpenAccountingDate]    Script Date: 12/29/2017 09:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetCurrentOpenAccountingDate]
@BankCode varchar(50)

AS

BEGIN

SELECT distinct AccountingDate,AccountingPeriod,BankCode FROM dbo.SystemDateSettings where IsClosed=0 and BankCode=@BankCode
order by AccountingDate desc

END
GO
/****** Object:  StoredProcedure [dbo].[GetCurrenciesByBankCode]    Script Date: 12/29/2017 09:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetCurrenciesByBankCode]
@BankCode varchar(50)
as
Select * from Currencies where BankCode=@BankCode
GO
/****** Object:  StoredProcedure [dbo].[GetCredentials]    Script Date: 12/29/2017 09:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetCredentials]( @api varchar(50))
as begin
	select * from AccessCredentials where API = @api;
	end
GO
/****** Object:  StoredProcedure [dbo].[GetCommissionsByTranId2]    Script Date: 12/29/2017 09:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetCommissionsByTranId2]
@TranId varchar(50),
@TranType varchar(50)
as
Declare @OrginalBankId varchar(50);
if(@TranType='LIQUIDATION')
begin
	Select top 1 @OrginalBankId = BankTranId from GeneralLedgerTable where PegPayTranId=@TranId
	Select 
	(Select top 1 TranAmount from GeneralLedgerTable with(nolock) where BankTranId=@OrginalBankId and TranCategory='CHARGE-1' and TranType='Credit') as Charge1,
	(Select top 1 TranAmount from GeneralLedgerTable with(nolock) where BankTranId=@OrginalBankId and TranCategory='CHARGE-2' and TranType='Credit') as Charge2,
	(Select top 1 TranAmount from GeneralLedgerTable with(nolock) where BankTranId=@OrginalBankId and TranCategory='CHARGE-3' and TranType='Credit') as Charge3
End
Else
Begin
	Select top 1 @OrginalBankId = BankTranId from GeneralLedgerTable where PegPayTranId=@TranId
	Select 
	(Select top 1 TranAmount from GeneralLedgerTable with(nolock) where BankTranId=@OrginalBankId and TranCategory='CHARGE-1' and TranType='Credit') as Charge1,
	(Select top 1 TranAmount from GeneralLedgerTable with(nolock) where BankTranId=@OrginalBankId and TranCategory='CHARGE-2' and TranType='Credit') as Charge2,
	(Select top 1 TranAmount from GeneralLedgerTable with(nolock) where BankTranId=@OrginalBankId and TranCategory='CHARGE-3' and TranType='Credit') as Charge3
End
GO
/****** Object:  StoredProcedure [dbo].[GetCommissionsByTranId]    Script Date: 12/29/2017 09:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetCommissionsByTranId]
@TranId varchar(50)
as
Declare @OrginalBankId varchar(50);
Select top 1 @OrginalBankId = ChequeNumber from GeneralLedgerTable where PegPayTranId=@TranId
Select 
(Select top 1 TranAmount from GeneralLedgerTable with(nolock) where BankTranId=@OrginalBankId and TranCategory='CHARGE-1') as Charge1,
(Select top 1 TranAmount from GeneralLedgerTable with(nolock) where BankTranId=@OrginalBankId and TranCategory='CHARGE-2') as Charge2,
(Select top 1 TranAmount from GeneralLedgerTable with(nolock) where BankTranId=@OrginalBankId and TranCategory='CHARGE-3') as Charge3
GO
/****** Object:  StoredProcedure [dbo].[GetCommissionAccountsByBankCode2]    Script Date: 12/29/2017 09:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[GetCommissionAccountsByBankCode2]
	@bankcode varchar(50)
As
Begin
	Select *
	From BankAccounts A
	Where
		A.BankCode=@bankcode and AccType like '%COMMISSION%'
End
GO
/****** Object:  StoredProcedure [dbo].[GetPaymentTypesByBankCode]    Script Date: 12/29/2017 09:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[GetPaymentTypesByBankCode]
	@bankcode varchar(50)
As
Begin
	Select *
	From PaymentTypes
	Where
		BankCode=@bankcode
End
GO
/****** Object:  StoredProcedure [dbo].[GetPaymentTypeByTranRef]    Script Date: 12/29/2017 09:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetPaymentTypeByTranRef]
@TranRef varchar(50)
as
if exists (select top 1 * from GeneralLedgerTable where PegPayTranId=@TranRef)
Begin
	Select top 1 PaymentType from GeneralLedgerTable where PegPayTranId=@TranRef and TranType='Credit' and (TranCategory='C2M' or TranCategory='M2M')
End
Else 
Begin
	Select top 1 PaymentType from GeneralLedgerTable where BankTranId=@TranRef and TranType='Credit' --and TranCategory='M2B'
End
GO
/****** Object:  StoredProcedure [dbo].[GetPaymentTransactionByVendorId]    Script Date: 12/29/2017 09:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetPaymentTransactionByVendorId]
@VendorCode varchar(50),
@VendorTranID varchar(50)
as
Select * from PaymentsGatewayRequests where VendorCode=@VendorCode and VendorTranId=@VendorTranID
GO
/****** Object:  StoredProcedure [dbo].[GetPaymentTransactionByPayGateId]    Script Date: 12/29/2017 09:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetPaymentTransactionByPayGateId]
@VendorTranID varchar(50)
as
Select * from PaymentsGatewayRequests where Reason=@VendorTranID
GO
/****** Object:  StoredProcedure [dbo].[GetPaymentTransactionByMerchantId]    Script Date: 12/29/2017 09:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetPaymentTransactionByMerchantId]
@VendorTranID varchar(50)
as
Select * from PaymentsGatewayRequests where convert(varchar(50),RecordId)=@VendorTranID
GO
/****** Object:  StoredProcedure [dbo].[GetPaymentGatewayTransactionDetails]    Script Date: 12/29/2017 09:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetPaymentGatewayTransactionDetails]
@VendorId varchar(50),
@VendorCode varchar(50)
as
Select * from PaymentsGatewayRequests A
inner join BankAccounts B on A.MerchantCode=B.AccountCode
where --VendorCode=@VendorCode and 
VendorTranId=@VendorId
order by RecordDate desc
GO
/****** Object:  StoredProcedure [dbo].[GetPaymentGatewayTransaction]    Script Date: 12/29/2017 09:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetPaymentGatewayTransaction]
@VendorId varchar(50)
as
Select * from PaymentsGatewayRequests 
where 
TransactionRef=@VendorId
GO
/****** Object:  StoredProcedure [dbo].[GetPaymentGatewayTranById]    Script Date: 12/29/2017 09:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetPaymentGatewayTranById]
@Id varchar(50)
as
Select * from PaymentsGatewayRequests where RecordId=@Id
GO
/****** Object:  StoredProcedure [dbo].[GetPaymentFrequenciesByBankCode]    Script Date: 12/29/2017 09:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetPaymentFrequenciesByBankCode]
@BankCode varchar(50)
as
Select * from RepaymentFrequencies where (BankCode=@BankCode or BankCode='ALL')
GO
/****** Object:  StoredProcedure [dbo].[GetMerchantTransactions]    Script Date: 12/29/2017 09:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetMerchantTransactions]
@MerchantId varchar(50),
@Type varchar(10)
as
if @Type = 'MINI'
	Select top 20 * from PaymentsGatewayRequests with (nolock)
	where MerchantCode=@MerchantId
	order by RecordDate desc
else 
    Select * from PaymentsGatewayRequests with (nolock)
	where MerchantCode=@MerchantId
	order by RecordDate desc
GO
/****** Object:  StoredProcedure [dbo].[GetMerchantTranRequest2]    Script Date: 12/29/2017 09:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[GetMerchantTranRequest2]
(
@BanksCode varchar(50),
@TransactionId varchar(50),
@startDate varchar(50),
@endate varchar(50)
)
AS begin

Select * from TransactionRequests
Where 
(BankCode = @BanksCode or @BanksCode = '0') 
and (RecordId=@TransactionId or @TransactionId = '0') 
and (CONVERT(varchar(50),paymentdate,126) between @startDate and @endate) order by RecordDate desc

end
--EXEC GETMERCHANTTRANREQUEST '0','2016-10-01','2016-11-06'
GO
/****** Object:  StoredProcedure [dbo].[GetMerchantTranRequest]    Script Date: 12/29/2017 09:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[GetMerchantTranRequest]
(
@BanksCode varchar(50),
@TransactionId varchar(50),
@startDate varchar(50),
@endate varchar(50)
)
AS begin

Select * from TransactionRequests
Where 
(BankCode = @BanksCode or @BanksCode = '0') 
and (RecordId=@TransactionId or @TransactionId = '0') 
and (CONVERT(varchar(50),paymentdate,126) between @startDate and @endate) order by RecordDate desc

end
--EXEC GETMERCHANTTRANREQUEST '0','2016-10-01','2016-11-06'
GO
/****** Object:  StoredProcedure [dbo].[GetMerchantTills]    Script Date: 12/29/2017 09:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetMerchantTills]
@accountCode varchar(50),
@device varchar(50)
as
    Select AccountCode,DeviceId,TerminalName,
	AquiredBy,Location,CustomerTel 
	from CustomerDeviceMappings 
	where AccountCode=@accountCode  and DeviceType='PHONE'
	and (DeviceId=@device or TerminalName=@device or @device='')
GO
/****** Object:  StoredProcedure [dbo].[GetMerchantsToRegisterInGateway]    Script Date: 12/29/2017 09:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetMerchantsToRegisterInGateway]
as
Select *
 from BankAccounts
where AccountCode is not null and IsActive=1 
and AccType not in ('COMMISSION_ACCOUNT','SUSPENSE_ACCOUNT','BUSSINESS_ACCOUNT')
and ApprovedBy<>''
order by AccountCode desc
GO
/****** Object:  StoredProcedure [dbo].[GetMerchantStatement]    Script Date: 12/29/2017 09:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetMerchantStatement]
@accountCode varchar(50),
@tillcode varchar(50),
@phone varchar(50)
as

Begin
	Select top 4 * from PaymentsGatewayRequests where 
	(MerchantCode=@accountCode) and 
	(Teller=@tillCode or ItemDesc=@tillCode or @tillCode='') and
	(CustomerTel=@phone or CustomerTel like '%'+Substring(@phone, 2, (len(@phone)))+'%' or  @phone='') 
	order by RecordDate desc
End
GO
/****** Object:  StoredProcedure [dbo].[GetMerchantsByCategory]    Script Date: 12/29/2017 09:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetMerchantsByCategory]
@category varchar(50),
@bankCode varchar(50)
as
Select AccountId,AccountCode,AccountName,IsReferenced,AccountCategory,AccType,BankCode,BranchCode,
LiquidationType,LiquidationAccount,LiquidationAccountName,MerchantContact
 from BankAccounts
where AccountCategory=@category and BankCode=@bankCode and IsActive=1 
and AccType not in ('COMMISSION_ACCOUNT','SUSPENSE_ACCOUNT') and LEN(AccountCategory)>0
order by AccountId asc
GO
/****** Object:  StoredProcedure [dbo].[GetMerchants]    Script Date: 12/29/2017 09:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetMerchants]
@bankCode varchar(50)
as
Select AccountId,AccountCode,AccountName,IsReferenced,AccountCategory,AccType,BankCode,BranchCode,
LiquidationType,LiquidationAccount,LiquidationAccountName,MerchantContact
 from BankAccounts
where AccountCode is not null and BankCode=@bankCode and IsActive=1 
and AccType not in ('COMMISSION_ACCOUNT','SUSPENSE_ACCOUNT','BUSSINESS_ACCOUNT')
and ApprovedBy<>''
order by AccountCode desc
GO
/****** Object:  StoredProcedure [dbo].[GetMerchantBankCode]    Script Date: 12/29/2017 09:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetMerchantBankCode]
@merchantId varchar(50)
as
Select BankCode from BankAccounts A
where 
AccountCode=@merchantId
GO
/****** Object:  StoredProcedure [dbo].[GetMerchangeChargesWithChargeAmount]    Script Date: 12/29/2017 09:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetMerchangeChargesWithChargeAmount]
@bankCode varchar(50),
@tranAmount money,
@tranCategory varchar(50),
@accountId varchar(50),
@PaymentChannel varchar(50),
@ChargeAmount money
as

--Let me explain what happens below
--first we go to a table that maps a trancategory and charge to a merchant
--We pick the first charge code that applies for the merchant id and trancategory passed
--We then go pick the charge details using the charge code
--We then calculate the final charge amount,final transaction amount, pegasus commission amount,
--sbu commission amount, tax commission amount
--We return all these results in a table 

Declare @Charges TABLE
 (		
	CalculationMethod varchar(50),
	FinalTransactionAmount money,
	CalculatedChargeAmount money,
	PegasusCommissionAmount money,
	SbuCommissionAmount money,
	TaxCommissionAmount money,
	OriginalTransactionAmount money,
	ChargeCode varchar(50),
	MerchantId varchar(50),
	TranCategory varchar(50),
	PaymentChannel varchar(50),
	IsChargePassedOntotheCustomer bit,
	ChargeName varchar(50)
)

Declare @MerchantId varchar(50);
Declare @CalculationMethod varchar(50);
Declare @ChargeCode varchar(50);
Declare @OriginalTransactionAmount money;
Declare @PegasusCommissionAmount money;
Declare @SbuCommissionAmount money;
Declare @TaxCommissionAmount money;
Declare @ChargeType varchar(50);
Declare @FinalTransactionAmount money;
Declare @CalculatedChargeAmount money;
Declare @IsChargePassedOntotheCustomer bit;
Declare @ErrorMsg varchar(3000);
Declare @ChargeName varchar(50);
Declare @PegasusPercentage decimal(18,2);
Declare @SbuPercentage decimal(18,2);
Declare @TaxPercentage decimal (18,2);
	
Select @ChargeCode = ChargeCode, @IsChargePassedOntotheCustomer = IsChargePassedOnToTheCustomer 
from BankChargesForMerchants where BankCode = @bankCode and MerchantId = @accountId and TransCategory = @tranCategory and PaymentType = @PaymentChannel
	
--try to get the default charge for this transaction category	
if(@ChargeCode = '' or @ChargeCode is NULL)BEGIN	Declare @SettingCode varchar(50)= @tranCategory+'_DEFAULT_CHARGE';	Select top 1 @ChargeCode=SettingValue,@IsChargePassedOntotheCustomer=1 from SystemSettings where Bankcode=@bankCode and SettingCode=@SettingCode;END

if(@ChargeCode = '' or @ChargeCode is NULL)BEGIN	Insert into @Charges 
		(
			CalculationMethod,
			FinalTransactionAmount,
			CalculatedChargeAmount,
			PegasusCommissionAmount,
			SbuCommissionAmount,
			TaxCommissionAmount,
			OriginalTransactionAmount,
			ChargeCode,
			MerchantId,
			TranCategory,
			PaymentChannel,
			IsChargePassedOntotheCustomer,
			ChargeName
		)
		Values 
		(
			'FLAT_FEE',
			@tranAmount,
			0,
			0,
			0,
			0,
			@tranAmount,
			'',
			@accountId,
			@tranCategory,
			@PaymentChannel,
			'TRUE',
			''
		)

	Select * from @Charges	RETURNEND
	
if(@IsChargePassedOntotheCustomer = '' or @IsChargePassedOntotheCustomer is NULL)BEGIN	set @IsChargePassedOntotheCustomer = 0;END
	
Select top 1 @PegasusPercentage = PegasusPercentage,@SbuPercentage = SbuPercentage,@TaxPercentage = TaxPercentage,@ChargeType = ChargeType,
@ChargeName = ChargeName 
from BankCharges 
where BankCode=@bankcode and ChargeCode=@chargeCode and 
((MinimumValue<=convert(bigint,@Tranamount)) and (MaximumValue>=Convert(bigint,@Tranamount)))
	
if(@PegasusPercentage = 0 or @PegasusPercentage is NULL)BEGIN	set @PegasusPercentage=0;END

if(@SbuPercentage = 0 or @SbuPercentage is NULL)BEGIN	set @SbuPercentage=0;END

if(@TaxPercentage = 0 or @TaxPercentage is NULL)BEGIN	set @TaxPercentage=0;END
	
if(@ChargeType='' or @ChargeType is NULL)BEGIN	set @ErrorMsg = 'The Charge Type is not defined for merchant ['+@accountid+'] and TranCategory ['+@tranCategory+'] In Bank ['+@Bankcode+']';
	RAISERROR (@ErrorMsg, -- Message text.
					   16,    -- Severity.
					   1      -- State.
					   );	RETURNEND

Set @CalculationMethod = @ChargeType;
Set @OriginalTransactionAmount = @tranAmount;
Set @MerchantId = @accountId;
	
if(@ChargeType='FLAT_FEE' and @IsChargePassedOntotheCustomer=1)
Begin
	Set @FinalTransactionAmount = CEILING((@tranAmount + @ChargeAmount));
	Set @CalculatedChargeAmount = CEILING(@ChargeAmount);
End
		
if(@ChargeType='FLAT_FEE' and @IsChargePassedOntotheCustomer=0)
Begin
	Set @FinalTransactionAmount = CEILING((@tranAmount));
	Set @CalculatedChargeAmount = CEILING(@ChargeAmount);
End

if(@ChargeType='PERCENTAGE' and @IsChargePassedOntotheCustomer=1)
Begin
	Set @FinalTransactionAmount = CEILING((@ChargeAmount + @tranAmount)) ;
	Set @CalculatedChargeAmount = CEILING(@ChargeAmount);
	
End

if(@ChargeType='PERCENTAGE' and @IsChargePassedOntotheCustomer=0)
Begin
	Set @FinalTransactionAmount = CEILING((@tranAmount));
	Set @CalculatedChargeAmount = CEILING(@ChargeAmount);
End

--Set @PegasusCommissionAmount = ((@PegasusPercentage/100) * @CalculatedChargeAmount);
--Set @SbuCommissionAmount = ((@SbuPercentage/100) * @CalculatedChargeAmount);
--Set @TaxCommissionAmount = ((@TaxPercentage/100) * @CalculatedChargeAmount);
--Set @TaxCommissionAmount = CEILING(@TaxCommissionAmount);
--Set @PegasusCommissionAmount = FLOOR((@CalculatedChargeAmount-@TaxCommissionAmount)/2);
--Set @SbuCommissionAmount = CEILING((@CalculatedChargeAmount-@TaxCommissionAmount)/2);

Set @TaxCommissionAmount = ((@TaxPercentage/100) * @CalculatedChargeAmount);
Set @TaxCommissionAmount = CEILING(@TaxCommissionAmount);
Set @PegasusCommissionAmount = FLOOR((@PegasusPercentage/100)*(@CalculatedChargeAmount-@TaxCommissionAmount));
Set @SbuCommissionAmount = CEILING((@SbuPercentage/100)*(@CalculatedChargeAmount-@TaxCommissionAmount));


Insert into @Charges 
(
	CalculationMethod,
	FinalTransactionAmount,
	CalculatedChargeAmount,
	PegasusCommissionAmount,
	SbuCommissionAmount,
	TaxCommissionAmount,
	OriginalTransactionAmount,
	ChargeCode,
	MerchantId,
	TranCategory,
	PaymentChannel,
	IsChargePassedOntotheCustomer,
	ChargeName
)
Values 
(
	@CalculationMethod,
	@FinalTransactionAmount,
	@CalculatedChargeAmount,
	@PegasusCommissionAmount,
	@SbuCommissionAmount,
	@TaxCommissionAmount,
	@OriginalTransactionAmount,
	@ChargeCode,
	@MerchantId,
	@TranCategory,
	@PaymentChannel,
	@IsChargePassedOntotheCustomer,
	@ChargeName
)

Select * from @Charges
GO
/****** Object:  StoredProcedure [dbo].[GetMerchangeCharges]    Script Date: 12/29/2017 09:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetMerchangeCharges]
@bankCode varchar(50),
@tranAmount money,
@tranCategory varchar(50),
@accountId varchar(50),
@PaymentChannel varchar(50)
as

--Let me explain what happens below
--first we go to a table that maps a trancategory and charge to a merchant
--We pick the first charge code that applies for the merchant id and trancategory passed
--We then go pick the charge details using the charge code
--We then calculate the final charge amount,final transaction amount, pegasus commission amount,
--sbu commission amount, tax commission amount
--We return all these results in a table 

Declare @Charges TABLE
 (		
	CalculationMethod varchar(50),
	FinalTransactionAmount money,
	CalculatedChargeAmount money,
	PegasusCommissionAmount money,
	SbuCommissionAmount money,
	TaxCommissionAmount money,
	OriginalTransactionAmount money,
	ChargeCode varchar(50),
	MerchantId varchar(50),
	TranCategory varchar(50),
	PaymentChannel varchar(50),
	IsChargePassedOntotheCustomer bit,
	ChargeName varchar(50),
	IsSplit bit,
	Processed bit
)

Declare @MerchantId varchar(50);
Declare @CalculationMethod varchar(50);
Declare @ChargeCode varchar(50);
Declare @ChargeAmount decimal(18,2);
Declare @OriginalTransactionAmount money;
Declare @PegasusCommissionAmount money;
Declare @SbuCommissionAmount money;
Declare @TaxCommissionAmount money;
Declare @ChargeType varchar(50);
Declare @FinalTransactionAmount money;
Declare @CalculatedChargeAmount money;
Declare @IsChargePassedOntotheCustomer bit;
Declare @ErrorMsg varchar(3000);
Declare @ChargeName varchar(50);
Declare @PegasusPercentage decimal(18,2);
Declare @SbuPercentage decimal(18,2);
Declare @TaxPercentage decimal (18,2);
Declare @IsSplit bit;

Insert into @Charges 
(
	CalculationMethod,
	FinalTransactionAmount,
	CalculatedChargeAmount,
	PegasusCommissionAmount,
	SbuCommissionAmount,
	TaxCommissionAmount,
	OriginalTransactionAmount,
	ChargeCode,
	MerchantId,
	TranCategory,
	PaymentChannel,
	IsChargePassedOntotheCustomer,
	ChargeName,
	IsSplit,
	Processed
)
Select 
	0,
	0,
	0,
	0,
	0,
	0,
	@tranAmount,
	A.ChargeCode,
	@accountId,
	@tranCategory,
	@PaymentChannel,
	A.IsChargePassedOnToTheCustomer,
	B.ChargeName,
	B.IsSplit,
	0
from Bankchargesformerchants A
inner join BankCharges B on A.ChargeCode=B.ChargeCode
where A.BankCode = @bankCode and 
MerchantId = @accountId and
TransCategory = @tranCategory and 
PaymentType = @PaymentChannel and
((MinimumValue<=convert(bigint,@Tranamount)) and (MaximumValue>=convert(bigint,@Tranamount)))


if not exists (Select * From @Charges)
Begin
	Declare @SettingCode varchar(50)= @tranCategory+'_DEFAULT_CHARGE';	Select top 1 @ChargeCode=SettingValue,@IsChargePassedOntotheCustomer=1 from SystemSettings where Bankcode=@bankCode and SettingCode=@SettingCode;
	
	Insert into @Charges 
	(
		CalculationMethod,
		FinalTransactionAmount,
		CalculatedChargeAmount,
		PegasusCommissionAmount,
		SbuCommissionAmount,
		TaxCommissionAmount,
		OriginalTransactionAmount,
		ChargeCode,
		MerchantId,
		TranCategory,
		PaymentChannel,
		IsChargePassedOntotheCustomer,
		ChargeName,
		IsSplit,
		Processed
	)
	Select 
		0,
		0,
		0,
		0,
		0,
		0,
		@tranAmount,
		ChargeCode,
		@accountId,
		@tranCategory,
		@PaymentChannel,
		@IsChargePassedOnToTheCustomer,
		ChargeName,
		IsSplit,
		0
	from BankCharges
	where 
	BankCode=@BankCode and
	ChargeCode=@chargecode and
	((MinimumValue<=convert(bigint,@Tranamount)) and (MaximumValue>=convert(bigint,@Tranamount)))
End

While (Select Count(*) From @Charges Where Processed = 0) > 0
Begin
    Select top 1 @ChargeCode=ChargeCode,@IsChargePassedOntotheCustomer = IsChargePassedOnToTheCustomer
    From @Charges Where Processed = 0

    --Do some processing here
    if(@IsChargePassedOntotheCustomer = '' or @IsChargePassedOntotheCustomer is NULL)	BEGIN		set @IsChargePassedOntotheCustomer = 0;	END
	
	Select top 1 @ChargeAmount = ChargeAmount,@PegasusPercentage = PegasusPercentage,@SbuPercentage = SbuPercentage,@TaxPercentage = TaxPercentage,@ChargeType = ChargeType,
	@ChargeName = ChargeName,@IsSplit=IsSplit 
	from BankCharges 
	where BankCode=@bankcode and ChargeCode=@chargeCode and 
	((MinimumValue<=convert(bigint,@Tranamount)) and (MaximumValue>=convert(bigint,@Tranamount)))
	
	if(@PegasusPercentage = 0 or @PegasusPercentage is NULL or @IsSplit = 0)	BEGIN		set @PegasusPercentage=0;	END

	if(@SbuPercentage = 0 or @SbuPercentage is NULL or @IsSplit = 0)	BEGIN		set @SbuPercentage=0;	END

	if(@TaxPercentage = 0 or @TaxPercentage is NULL or @IsSplit = 0)	BEGIN		set @TaxPercentage=0;	END
		
	if(@ChargeType='' or @ChargeType is NULL)	BEGIN		set @ErrorMsg = 'The Charge Type is not defined for merchant ['+@accountid+'] and TranCategory ['+@tranCategory+'] In Bank ['+@Bankcode+']';
		RAISERROR (@ErrorMsg, -- Message text.
						   16,    -- Severity.
						   1      -- State.
						   );		RETURN	END
	
	Set @CalculationMethod = @ChargeType;
	Set @OriginalTransactionAmount = @tranAmount;
	Set @MerchantId = @accountId;
		
	if(@ChargeType='FLAT_FEE' and @IsChargePassedOntotheCustomer=1)
	Begin
		Set @FinalTransactionAmount = CEILING((@tranAmount + @ChargeAmount));
		Set @CalculatedChargeAmount = CEILING(@ChargeAmount);
	End
			
	if(@ChargeType='FLAT_FEE' and @IsChargePassedOntotheCustomer=0)
	Begin
		Set @FinalTransactionAmount = CEILING((@tranAmount));
		Set @CalculatedChargeAmount = CEILING(@ChargeAmount);
	End

	if(@ChargeType='PERCENTAGE' and @IsChargePassedOntotheCustomer=1)
	Begin
		Set @FinalTransactionAmount = CEILING((((@ChargeAmount/100) *(@tranAmount)) + @tranAmount)) ;
		Set @CalculatedChargeAmount = CEILING(((@ChargeAmount/100) * (@tranAmount)));
		
	End

	if(@ChargeType='PERCENTAGE' and @IsChargePassedOntotheCustomer=0)
	Begin
		Set @FinalTransactionAmount = CEILING((@tranAmount));
		Set @CalculatedChargeAmount = CEILING(((@ChargeAmount/100) * (@tranAmount)));
	End

	Set @TaxCommissionAmount = ((@TaxPercentage/100) * @CalculatedChargeAmount);
	Set @TaxCommissionAmount = CEILING(@TaxCommissionAmount);
	Set @PegasusCommissionAmount = FLOOR((@PegasusPercentage/100)*(@CalculatedChargeAmount-@TaxCommissionAmount));
	Set @SbuCommissionAmount = CEILING((@SbuPercentage/100)*(@CalculatedChargeAmount-@TaxCommissionAmount));
		

    Update @Charges Set 
    Processed = 1,
    CalculationMethod = @CalculationMethod,
	FinalTransactionAmount = @FinalTransactionAmount,
	CalculatedChargeAmount = @CalculatedChargeAmount,
	PegasusCommissionAmount = @PegasusCommissionAmount,
	SbuCommissionAmount = @SbuCommissionAmount,
	TaxCommissionAmount = @TaxCommissionAmount
    Where ChargeCode = @ChargeCode 

End

Select * from @Charges
GO
/****** Object:  StoredProcedure [dbo].[GetMenuCategories]    Script Date: 12/29/2017 09:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetMenuCategories]
@bankCode varchar(50)
as
Select *  from MenuMerchants M inner join
BankAccounts A on M.MerchantId=A.AccountCode
where M.BankCode=@bankCode and Active=1
order by RecordId desc
GO
/****** Object:  StoredProcedure [dbo].[GetMarketPlacePaymentRequest]    Script Date: 12/29/2017 09:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetMarketPlacePaymentRequest]
@VendorId varchar(50)
as
Select * from MarketPlaceRequests where VendorId=@VendorId
GO
/****** Object:  StoredProcedure [dbo].[GetLocalGovernmentSettings]    Script Date: 12/29/2017 09:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetLocalGovernmentSettings](@disctrictCode varchar(50))
as begin
	select * from LocalGovernmentSettings where districtcode = @disctrictCode
end
GO
/****** Object:  StoredProcedure [dbo].[GetLoanTypesByBankCode]    Script Date: 12/29/2017 09:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetLoanTypesByBankCode]
@bankCode varchar(50)
as
Select * from LoanTypes where BankCode=@bankCode
GO
/****** Object:  StoredProcedure [dbo].[GetLoanRequestByLoanAccountNumber]    Script Date: 12/29/2017 09:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetLoanRequestByLoanAccountNumber]
@AccNumber varchar(50),
@Bankcode varchar(50)
as
Select * from Loans where LoanAccountNumber=@AccNumber and BankCode=@Bankcode
GO
/****** Object:  StoredProcedure [dbo].[GetLiquidStatus]    Script Date: 12/29/2017 09:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetLiquidStatus]
@BankTranId varchar(50)
As
Select top 1 * from TransactionRequests where 
BankTranId=@BankTranId
and Status='SUCCESS'
GO
/****** Object:  StoredProcedure [dbo].[GetLiquidations]    Script Date: 12/29/2017 09:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetLiquidations]
@AccountNumber varchar(50),
@BankCode varchar(50)
As
select * from GeneralLedgerTable G with(nolock)
where 
AccountNumber=@AccountNumber
and TranCategory in ('C2M')
and G.BankCode=@BankCode
and G.BankTranId not in (select BankTranId from TransactionRequests with(nolock) where Status='SUCCESS' and BankTranId is not NULL)
and TranType = 'Credit'
and PaymentDate>'2017-04-09 23:20:58.000'
GO
/****** Object:  StoredProcedure [dbo].[GetLastLoginDateTime]    Script Date: 12/29/2017 09:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetLastLoginDateTime]
@UserId varchar(50),
@BankCode varchar(50)
as
Select Top 1 ModifiedOn from AuditTrail 
where ModifiedBy=@UserId and BankCode=@BankCode and ActionType='Login' and Action like 'Successfull%'
order by ModifiedOn desc
GO
/****** Object:  StoredProcedure [dbo].[GetInterestTypesByBankCode]    Script Date: 12/29/2017 09:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[GetInterestTypesByBankCode]
	@bankcode varchar(50)
As
Begin
	Select *
	From InterestRateTypes
	--Where
	--	BankCode=@bankcode
End
GO
/****** Object:  StoredProcedure [dbo].[GetInterestAcruedSinceLastPayOut]    Script Date: 12/29/2017 09:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetInterestAcruedSinceLastPayOut]
@AccNumber varchar(50),
@BankCode varchar(50),
@LastPayOutDate datetime
as
Select SUM(InterestAcrued) from AccountEODBalances 
where
AccountNumber=@AccNumber and 
BankCode=@BankCode and 
BalancesDate>@LastPayOutDate
GO
/****** Object:  StoredProcedure [dbo].[GetInterestAccounts]    Script Date: 12/29/2017 09:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetInterestAccounts]
@BankCode varchar(50)
AS

Select AccNumber,BankCode,AccType,LastEOD=(select top 1 AccountingDate from AccountEODBalances AS E 
	where AccountNumber =AccNumber and BankCode=@BAnkCode order by AccountingDate desc)
	, LastAccountPeriod=(select top 1 AccountingPeriod from AccountEODBalances AS E 
	where AccountNumber =AccNumber and BankCode=@BAnkCode order by AccountingDate desc)
	from BankAccounts AS A
	WHERE BankCode=@BAnkCode and AccType in ('INT_PAY_ACC','FX_INT_PAY_ACC','INT_EXP_ACC','FX_INT_EXP_ACC')
GO
/****** Object:  StoredProcedure [dbo].[LogUserLogin]    Script Date: 12/29/2017 09:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[LogUserLogin]
@Channel varchar(50),
@RequestAgent varchar(50),
@IP varchar(50),
@userId varchar(50),
@SessionKey varchar(50),
@status varchar(50),
@description nvarchar(4000),
@category varchar(50)
AS

  begin
   INSERT INTO UserLoginLog
           (Channel,RequestAgent,IP,userId,SessionKey,status,description,category,CreationDate) 
   VALUES(@Channel,@RequestAgent,@IP,@userId,@SessionKey,@status,@description,@category,GETDATE())
   --EXEC Activation_Update @userId,@Channel,@IP,@RequestAgent,''
  end
GO
/****** Object:  StoredProcedure [dbo].[LogTransaction]    Script Date: 12/29/2017 09:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[LogTransaction]
@CustomerRef varchar(50),@CustomerName varchar(50),@CustomerTel varchar(50),@MerchantId varchar(50),@Amount varchar(50),@Charge varchar(50),@PaymentDate datetime,@TranType varchar(50),@Utility varchar(50),@Area varchar(50),@Channel varchar(50),@ChannelId varchar(50),@PaymentType varchar(50),@DeviceId varchar(50)as
---------------------------------------------------------------------
-- Lets start
BEGIN Transaction Trans
BEGIN TRY
Declare @PegPayId int

   BEGIN
	  INSERT INTO ReceivedTransactions  
	  (
	     CustomerRef,
	     CustomerName,
	     CustomerTel,
	     Area,
	     TranAmount,
	     Charge,
	     PaymentDate,
	     RecordDate,
	     TranType,
	     PaymentType,  
	     UtilityCode, 
	     MerchantId,
	     Channel,
	     ChannelId,
	     Status,
	     DeviceId
	  )  
	  VALUES  
	  (
	     @CustomerRef,
	     @CustomerName,
	     @CustomerTel,
	     @Area,
	     @Amount,
	     @Charge,
	     @PaymentDate,
	     GETDATE(),
	     @TranType,
	     @PaymentType,  
	     @Utility,
	     @MerchantId,
	     @Channel,
	     @ChannelId,
	     'PENDING',
	     @DeviceId
	  )  
	    
	  declare @insertedRow int = @@identity  
	  set @pegpayId = dbo.GenerateId(@insertedRow)  
	  update ReceivedTransactions set TransNo = @pegpayId where TranId =  @insertedRow  
   END

---------------------------------------------------------------------
Select @pegpayId as PegPayId 
---------------------------------------------------------------------
Commit Transaction Trans

END TRY
BEGIN CATCH

ROLLBACK Transaction Trans

  DECLARE
   @ErMessage NVARCHAR(2048),
   @ErSeverity INT,
   @ErState INT
 
 SELECT
   @ErMessage = ERROR_MESSAGE(),
   @ErSeverity = ERROR_SEVERITY(),
   @ErState = ERROR_STATE()
 
 RAISERROR (@ErMessage,
             @ErSeverity,
             @ErState )
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[LogRegistrationRequestAndResponse]    Script Date: 12/29/2017 09:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[LogRegistrationRequestAndResponse]
@merchantId varchar(50),
@merchantName varchar(50),
@accNum varchar(50),
@response varchar(50),
@description varchar(50)
AS

INSERT INTO RegisterationLogs(AccountCode,MerchantName,LiquidationAccount,TranDate,LogDate,StatusCode,StatusDescription) 
VALUES(@merchantId,@merchantName,@accNum,GETDATE(),GETDATE(),@response,@description)
GO
/****** Object:  StoredProcedure [dbo].[LogReceivedPaymentGatewayRequest]    Script Date: 12/29/2017 09:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[LogReceivedPaymentGatewayRequest]
@CustRef varchar(50),
@TranAmount varchar(50),
@CustomerTel varchar(50),
@Email varchar(50),
@CVV varchar(50),
@ExpiryDate varchar(50),
@PaymentOptionSelected varchar(50),
@VendorCode varchar(50),
@VendorTranId varchar(50),
@DigitalSignature varchar(7050),
@ItemDesc varchar(50),
@ItemTotal varchar(50),
@ReturnUrl varchar(650),
@Status varchar(50),
@Reason varchar(50),
@CustName varchar(50),
@IpAddress varchar(50),
@SourceMachineName varchar(50),
@RequestDetails varchar(max)
as

Begin 
INSERT INTO [ReceivedPaymentsGatewayRequests]
           (
            [CustRef]
           ,[TranAmount]
           ,[CustomerTel]
           ,[Email]
           ,[PaymentOptionSelected]
           ,[VendorCode]
           ,[VendorTranId]
           ,[DigitalSignature]
           ,[ItemDesc]
           ,[ItemTotal]
           ,[ReturnUrl]
           ,[RecordDate]
           ,[Status]
           ,[Reason]
           ,CustName
           ,SourceIP
           ,SourceMachineName
           ,RequestDetails)
     VALUES
           (
            @CustRef,
            @TranAmount,
            @CustomerTel,
            @Email,
            @PaymentOptionSelected,
            @VendorCode,
            @VendorTranId,
            @DigitalSignature,
            @ItemDesc,
            @ItemTotal,
            @ReturnUrl,
            GETDATE(),
            @Status,
            @Reason
            ,@CustName
            ,@IpAddress
            ,@SourceMachineName
            ,@RequestDetails)
End
GO
/****** Object:  StoredProcedure [dbo].[LogNewAccountDate]    Script Date: 12/29/2017 09:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[LogNewAccountDate]
@NewAccountingDate bigint,
@NewAccountingPeriod bigint,
@BankCode varchar(50)
AS

BEGIN Transaction AccDay
BEGIN try
IF NOT EXISTS(SELECT  AccountingDate FROM SystemDateSettings WHERE AccountingDate=@NewAccountingDate and BankCode=@BankCode)
BEGIN
INSERT INTO dbo.SystemDateSettings(AccountingDate,AccountingPeriod,BankCode,IsClosed,RecordDate) 
VALUES(@NewAccountingDate,@NewAccountingPeriod,@BankCode,0,GETDATE())
END
UPDATE SystemDateSettings set IsClosed=1 where BankCode=@BankCode and IsClosed=0 and AccountingDate<>@NewAccountingDate
COMMIT Transaction AccDay
END Try
BEGIN Catch
ROLLBACK Transaction AccDay

  DECLARE
   @ErMessage NVARCHAR(2048),
   @ErSeverity INT,
   @ErState INT
 
 SELECT
   @ErMessage = ERROR_MESSAGE(),
   @ErSeverity = ERROR_SEVERITY(),
   @ErState = ERROR_STATE()
 
 RAISERROR (@ErMessage,
             @ErSeverity,
             @ErState )
END Catch
GO
/****** Object:  StoredProcedure [dbo].[InterestRateTypes_SelectRow]    Script Date: 12/29/2017 09:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[InterestRateTypes_SelectRow]
@Id varchar(50),
@BankCode varchar(50)
as
Select * from InterestRateTypes where InterestTypeCode=@Id
GO
/****** Object:  StoredProcedure [dbo].[GetUtilityTransactionStatus]    Script Date: 12/29/2017 09:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetUtilityTransactionStatus]
@VendorTranId varchar(50)
as
if not exists (select * from MarketPlaceRequests A
inner join MarketPlaceBillers B on A.MerchantCode=B.MerchantCode
where VendorId=@VendorTranId)
Begin
	Select top 1 TransactionRef as UtilityRef
	 from PaymentsGatewayRequests where VendorTranId=@VendorTranId
	RETURN
End

Declare @timeDiff int = 0;
Select top 1 @timeDiff=DATEDIFF(SECOND,UtilitySentDate,GETDATE())
from PaymentsGatewayRequests where VendorTranId=@VendorTranId

--are we still within the max wait time
if(@timeDiff<=10) 
 Begin
	Select top 1 'PENDING' as UtilityRef
	 from PaymentsGatewayRequests where VendorTranId=@VendorTranId
 End
--max wait time has elapsed
Else
 Begin
	Select top 1 UtilityRef
	 from PaymentsGatewayRequests where VendorTranId=@VendorTranId
 End
GO
/****** Object:  StoredProcedure [dbo].[GetUtilityAccount]    Script Date: 12/29/2017 09:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[GetUtilityAccount]
@Utility varchar(50),
@BankCode varchar(50)

AS

select CommissionAccountNumber from CommissionAccounts  
where BankCode = @BankCode and CommissionAccountCode=@Utility
GO
/****** Object:  StoredProcedure [dbo].[GetUserTypesByBankCode]    Script Date: 12/29/2017 09:13:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetUserTypesByBankCode]
@bankCode varchar(50)
as
Select * from UserTypes where BankCode=@bankCode
GO
/****** Object:  StoredProcedure [dbo].[InitializeSystemDate_Update]    Script Date: 12/29/2017 09:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[InitializeSystemDate_Update]
@BankCode varchar(50)

AS

IF(not exists (Select BankCode from SystemDateSettings where BankCode=@BankCode))
BEGIN
	Declare @PreviousAccountingDate bigint
	Declare @PreviousAccountingPeriod bigint
	Declare @CurrentAccountingDate bigint
	Declare @CurrentAccountingPeriod bigint

	SET @CurrentAccountingDate=(SELECT CONVERT(VARCHAR(10), GetDate(), 112))
	SET @CurrentAccountingPeriod=(SELECT LEFT(CONVERT(varchar, DATEADD(day, -1, GETDATE()),112),6))
	
	SET @PreviousAccountingPeriod=(SELECT LEFT(CONVERT(varchar, GetDate(),112),6))
	SET @PreviousAccountingDate=(SELECT CONVERT(VARCHAR(10), DATEADD(day, -1, GETDATE()), 112))
	
	INSERT INTO SystemDateSettings(AccountingDate,AccountingPeriod,BankCode,IsClosed,RecordDate)
	VALUES(@PreviousAccountingDate,@PreviousAccountingPeriod,@BankCode,1,GETDATE())

	INSERT INTO SystemDateSettings(AccountingDate,AccountingPeriod,BankCode,IsClosed,RecordDate)
	VALUES(@CurrentAccountingDate,@CurrentAccountingPeriod,@BankCode,0,GETDATE())

END
GO
/****** Object:  StoredProcedure [dbo].[IdentificationDocumentTypes_Update]    Script Date: 12/29/2017 09:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	IdentificationDocumentTypes_Update
-- Author:	Nsubuga Kasozi
-- Create date:	3/29/2016 7:41:08 PM
-- Description:	This stored procedure is intended for updating IdentificationDocumentTypes table
-- ==========================================================================================
Create Procedure [dbo].[IdentificationDocumentTypes_Update]
	@RecordId int,
	@IDTypeCode varchar(50),
	@IDTypeName varchar(50),
	@ModifiedBy varchar(50),
	@CreatedBy varchar(50),
	@ModifiedOn varchar(50),
	@CreatedOn varchar(50)
As
Begin
	Update IdentificationDocumentTypes
	Set
		[IDTypeCode] = @IDTypeCode,
		[IDTypeName] = @IDTypeName,
		[ModifiedBy] = @ModifiedBy,
		[CreatedBy] = @CreatedBy,
		[ModifiedOn] = @ModifiedOn,
		[CreatedOn] = @CreatedOn
	Where		
		[RecordId] = @RecordId

End
GO
/****** Object:  StoredProcedure [dbo].[IdentificationDocumentTypes_SelectRow]    Script Date: 12/29/2017 09:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	IdentificationDocumentTypes_SelectRow
-- Author:	Nsubuga Kasozi
-- Create date:	3/29/2016 7:41:08 PM
-- Description:	This stored procedure is intended for selecting a specific row from IdentificationDocumentTypes table
-- ==========================================================================================
Create Procedure [dbo].[IdentificationDocumentTypes_SelectRow]
	@RecordId int
As
Begin
	Select *
	From IdentificationDocumentTypes
	Where
		[RecordId] = @RecordId
End
GO
/****** Object:  StoredProcedure [dbo].[IdentificationDocumentTypes_SelectAll]    Script Date: 12/29/2017 09:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	IdentificationDocumentTypes_SelectAll
-- Author:	Nsubuga Kasozi
-- Create date:	3/29/2016 7:41:08 PM
-- Description:	This stored procedure is intended for selecting all rows from IdentificationDocumentTypes table
-- ==========================================================================================
Create Procedure [dbo].[IdentificationDocumentTypes_SelectAll]
As
Begin
	Select *
	From IdentificationDocumentTypes
End
GO
/****** Object:  StoredProcedure [dbo].[IdentificationDocumentTypes_Insert]    Script Date: 12/29/2017 09:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	IdentificationDocumentTypes_Insert
-- Author:	Nsubuga Kasozi
-- Create date:	3/29/2016 7:41:08 PM
-- Description:	This stored procedure is intended for inserting values to IdentificationDocumentTypes table
-- ==========================================================================================
Create Procedure [dbo].[IdentificationDocumentTypes_Insert]
	@IDTypeCode varchar(50),
	@IDTypeName varchar(50),
	@ModifiedBy varchar(50),
	@CreatedBy varchar(50),
	@ModifiedOn varchar(50),
	@CreatedOn varchar(50)
As
Begin
	Insert Into IdentificationDocumentTypes
		([IDTypeCode],[IDTypeName],[ModifiedBy],[CreatedBy],[ModifiedOn],[CreatedOn])
	Values
		(@IDTypeCode,@IDTypeName,@ModifiedBy,@CreatedBy,@ModifiedOn,@CreatedOn)

	Declare @ReferenceID int
	Select @ReferenceID = @@IDENTITY

	Return @ReferenceID

End
GO
/****** Object:  StoredProcedure [dbo].[InsertIntoPaymentGatewayRequestsTable2]    Script Date: 12/29/2017 09:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[InsertIntoPaymentGatewayRequestsTable2]
@CustRef varchar(50),
@TranAmount varchar(50),
@CustomerTel varchar(50),
@Email varchar(50),
@CVV varchar(50),
@ExpiryDate varchar(50),
@PaymentOptionSelected varchar(50),
@VendorCode varchar(50),
@VendorTranId varchar(50),
@DigitalSignature varchar(7050),
@ItemDesc varchar(50),
@ItemTotal varchar(50),
@ReturnUrl varchar(650),
@Status varchar(50),
@Reason varchar(50),
@CustName varchar(50),
@MerchantCode varchar(50),
@IpAddress varchar(50),
@SourceMachineName varchar(50),
@ChargeAmount decimal(18,2),
@Teller varchar(50)
as
Begin Transaction Updater
Begin try
If exists(Select * from PaymentsGatewayRequests where VendorCode=@VendorCode and VendorTranId=@VendorTranId)
Begin
Select RecordId as InsertedID from PaymentsGatewayRequests where VendorCode=@VendorCode and VendorTranId=@VendorTranId
End
Else
Begin
INSERT INTO [PaymentsGatewayRequests]
           (
            [CustRef]
           ,[TranAmount]
           ,[CustomerTel]
           ,[Email]
           ,[PaymentOptionSelected]
           ,[VendorCode]
           ,[VendorTranId]
           ,[DigitalSignature]
           ,[ItemDesc]
           ,[ItemTotal]
           ,[ReturnUrl]
           ,[RecordDate]
           ,[Status]
           ,[Reason]
           ,CustName
           ,MerchantCode
           ,SourceIP
           ,SourceMachineName
           ,CurrencyCode
           ,ChargeAmount
           ,Teller)
     VALUES
           (
            @CustRef,
            @TranAmount,
            @CustomerTel,
            @Email,
            @PaymentOptionSelected,
            @VendorCode,
            @VendorTranId,
            @DigitalSignature,
            @ItemDesc,
            @ItemTotal,
            @ReturnUrl,
            GETDATE(),
            @Status,
            @Reason
            ,@CustName
            ,@MerchantCode
            ,@IpAddress
            ,@SourceMachineName
            ,'UGX'
            ,@ChargeAmount
            ,@Teller)
            
    Select SCOPE_IDENTITY() as InsertedID
End
Commit Transaction Updater
End try
Begin Catch
Rollback Transaction Updater

DECLARE
   @ErMessage NVARCHAR(2048),
   @ErSeverity INT,
   @ErState INT
 
 SELECT
   @ErMessage = ERROR_MESSAGE(),
   @ErSeverity = ERROR_SEVERITY(),
   @ErState = ERROR_STATE()
 
 RAISERROR (@ErMessage,
             @ErSeverity,
             @ErState )
End Catch
GO
/****** Object:  StoredProcedure [dbo].[InsertIntoPaymentGatewayRequestsTable]    Script Date: 12/29/2017 09:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[InsertIntoPaymentGatewayRequestsTable]
@CustRef varchar(50),
@TranAmount varchar(50),
@CustomerTel varchar(50),
@Email varchar(50),
@CVV varchar(50),
@ExpiryDate varchar(50),
@PaymentOptionSelected varchar(50),
@VendorCode varchar(50),
@VendorTranId varchar(50),
@DigitalSignature varchar(7050),
@ItemDesc varchar(50),
@ItemTotal varchar(50),
@ReturnUrl varchar(650),
@Status varchar(50),
@Reason varchar(50),
@CustName varchar(50),
@MerchantCode varchar(50),
@IpAddress varchar(50),
@SourceMachineName varchar(50),
@ChargeAmount decimal(18,2)
as
Begin Transaction Updater
Begin try
If exists(Select * from PaymentsGatewayRequests where VendorCode=@VendorCode and VendorTranId=@VendorTranId)
Begin
Select RecordId as InsertedID from PaymentsGatewayRequests where VendorCode=@VendorCode and VendorTranId=@VendorTranId
End
Else
Begin
INSERT INTO [PaymentsGatewayRequests]
           (
            [CustRef]
           ,[TranAmount]
           ,[CustomerTel]
           ,[Email]
           ,[PaymentOptionSelected]
           ,[VendorCode]
           ,[VendorTranId]
           ,[DigitalSignature]
           ,[ItemDesc]
           ,[ItemTotal]
           ,[ReturnUrl]
           ,[RecordDate]
           ,[Status]
           ,[Reason]
           ,CustName
           ,MerchantCode
           ,SourceIP
           ,SourceMachineName
           ,CurrencyCode
           ,ChargeAmount)
     VALUES
           (
            @CustRef,
            @TranAmount,
            @CustomerTel,
            @Email,
            @PaymentOptionSelected,
            @VendorCode,
            @VendorTranId,
            @DigitalSignature,
            @ItemDesc,
            @ItemTotal,
            @ReturnUrl,
            GETDATE(),
            @Status,
            @Reason
            ,@CustName
            ,@MerchantCode
            ,@IpAddress
            ,@SourceMachineName
            ,'UGX'
            ,@ChargeAmount)
            
    Select SCOPE_IDENTITY() as InsertedID
End
Commit Transaction Updater
End try
Begin Catch
Rollback Transaction Updater

DECLARE
   @ErMessage NVARCHAR(2048),
   @ErSeverity INT,
   @ErState INT
 
 SELECT
   @ErMessage = ERROR_MESSAGE(),
   @ErSeverity = ERROR_SEVERITY(),
   @ErState = ERROR_STATE()
 
 RAISERROR (@ErMessage,
             @ErSeverity,
             @ErState )
End Catch
GO
/****** Object:  StoredProcedure [dbo].[InsertIntoAuditTrail]    Script Date: 12/29/2017 09:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[InsertIntoAuditTrail]
@ActionType varchar(50),
@TableName varchar(50),
@BankCode varchar(50),
@ModifiedBy varchar(50),
@Action nvarchar(4000)
as
Insert into AuditTrail([Action],ActionType,BankCode,ModifiedBy,ModifiedOn,TableName)
values(@Action,@ActionType,@BankCode,@ModifiedBy,GETDATE(),@TableName)

Select SCOPE_IDENTITY() as InsertedId
GO
/****** Object:  StoredProcedure [dbo].[MarkTransactionAsSUCCESSFULL]    Script Date: 12/29/2017 09:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[MarkTransactionAsSUCCESSFULL]
@BankId varchar(50),
@BankCode varchar(50),
@UtilityRef varchar(50)
as
Update UtilityTransactions set Reason=@UtilityRef,Status='SUCCESS',SentToUtility=1,UtilitySentDate=GETDATE() 
where BankTranId=@BankId and BankCode=@BankCode
GO
/****** Object:  StoredProcedure [dbo].[MarkTransactionAsFAILED]    Script Date: 12/29/2017 09:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[MarkTransactionAsFAILED]
@BankId varchar(50),
@BankCode varchar(50),
@Reason varchar(50)
as
Update UtilityTransactions set Reason=@Reason,Status='FAILED',SentToUtility=1,UtilitySentDate=GETDATE() 
where BankTranId=@BankId and BankCode=@BankCode
GO
/****** Object:  StoredProcedure [dbo].[MarkMerchantCustomerForDeletion]    Script Date: 12/29/2017 09:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[MarkMerchantCustomerForDeletion]
@CustRef varchar(50),
@MerchantCode varchar(50),
@BankCode varchar(50),
@MarkedBy varchar(50)
as
Update MerchantCustomers set MarkedForDeletion=1,MarkedForDeletionBy=@MarkedBy,MarkedForDeletionOn=GETDATE()
 where CustomerRef=@CustRef and AccountCode=@MerchantCode and BankCode=@BankCode
GO
/****** Object:  StoredProcedure [dbo].[InsertTranIntoGeneralLedger]    Script Date: 12/29/2017 09:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[InsertTranIntoGeneralLedger]@CustomerName varchar(50),@toAccount varchar(50),@fromAccount varchar(50),@TranAmount decimal(18,2),@VendorTranId varchar(50),@PaymentDate datetime,@Teller varchar(50),@ApprovedBy varchar(50),@BankCode varchar(50),@Narration varchar(850),@TranCategory varchar(50),@BranchCode varchar(50),@CurrecnyTranAmount varchar(50),@PaymentType varchar(50),@ChequeNumber varchar(50),@CustomerRef varchar(50),@CustomerTel varchar(50)as--This Stored Procedure will move money between any 2 accounts--NB: This stored Procedure has no try cacth(Intentionally) because its not meant to be called directly by code--Stored proc with the try catch is InsertReceivedTransactionWithCharges and its the one meant--to be called to do the work--this procedure was separated from the one above mainly for readability and maintainability--NB: this stored procedure is LONG so lets do this--UPDATE: This stored procedure simply does insertion with no locking for transfers between system accounts --Trying to implement algorithm as explained by Mr RonaldDeclare @ErrorMsg varchar(8000);DECLARE @ReturnValue int;DECLARE @RecordId1 varchar(50);DECLARE @RecordId2 varchar(50);DECLARE @PegPayTranId varchar(50);DECLARE @TranAmountInToAccountCurrency decimal(18,2);DECLARE @TranAmountInFromAccountCurrency decimal(18,2);Declare @CurrecnyOfFromAcc varchar(50);
Declare @CurrencyOfToAcc varchar(50);
Declare @ValueInLocalCurrencyFromAccount decimal(18,2);
Declare @ValueInLocalCurrencytoAccount decimal(18,2);
Declare @ValueInLocalCurrencyTranAmount decimal(18,2);Declare @AccountingDate bigint;Declare @AccountingPeriod bigint;Declare @CurrencyCode varchar(50);--------------------------------------------set some globals--check for from accountSelect @FromAccount=AccNumber from BankAccounts with(nolock)where AccNumber=@FromAccount and BankCode=@BankCode--check for to accountSelect @ToAccount=AccNumber from BankAccounts with(nolock)where AccNumber=@ToAccount and BankCode=@BankCode--Get currency of from account
Select @CurrecnyOfFromAcc = CurrencyCode from BankAccounts with(nolock)
where AccNumber=@FromAccount and BankCode=@BankCode

--Get currency of to account
Select @CurrencyOfToAcc = CurrencyCode from BankAccounts with(nolock)
where AccNumber=@ToAccount and BankCode=@BankCode

--Get Value in local currency of the from account cuurency(e.g value of 1 Us dollar in Ugshs is around 3500)
Select @ValueInLocalCurrencyFromAccount=ValueInLocalCurrency from Currencies with(nolock)
where CurrencyCode=@CurrecnyOfFromAcc and BankCode=@BankCode

---get Bank Currency---
SELECT @CurrencyCode=CurrencyCode from dbo.Currencies 
where CurrencyCode=@CurrecnyTranAmount and BankCode=@BankCode

--Get Value in local currency of the to account cuurency(e.g value of 1 Us dollar in Ugshs is around 3500)
Select @ValueInLocalCurrencyToAccount=ValueInLocalCurrency from Currencies with(nolock)
where CurrencyCode = @CurrencyOfToAcc and BankCode=@BankCode

--Get Value in local currency of the transaction amount currency(e.g value of 1 Us dollar in Ugshs is around 3500)
Select @ValueInLocalCurrencyTranAmount=ValueInLocalCurrency from Currencies with(nolock)
where CurrencyCode = @CurrecnyTranAmount and BankCode=@BankCode
----Set AccountingDate and AccountingPeriod
--Select @AccountingDate=AccountingDate, @AccountingPeriod=AccountingPeriod from dbo.SystemDateSettings
--Where BankCode=@BankCode and IsClosed=0SET @AccountingDate=convert(bigint,convert(VARCHAR(8),GETDATE(),112))SET @AccountingPeriod=convert(bigint,convert(VARCHAR(6),GETDATE(),112))--------------------------------------------------------Validate the data--Is to account same as from accountif(@AccountingDate is NULL)BEGIN	set @ErrorMsg = 'ACCOUNTING DATE NOT SET FOR '+@BankCode;
	RAISERROR (@ErrorMsg, -- Message text.
				   16,    -- Severity.
				   1      -- State.
				   );	RETURNENDelse if(@toAccount=@fromAccount)BEGIN	set @ErrorMsg='DESTINATION ACCOUNT ['+@toAccount+'] AND SOURCE ['+@fromAccount+'] ACCOUNT CANNOT BE THE SAME';
	RAISERROR (@ErrorMsg, -- Message text.
				   16,    -- Severity.
				   1      -- State.
				   );	RETURNEND--does to account exist              else if((LEN(@toAccount) <= 0) or @toAccount is NULL)BEGIN	set @ErrorMsg='UNABLE TO FIND DESTINATION ACCOUNT:'+@toAccount+' FOR SPECIFIED BANK';
	RAISERROR (@ErrorMsg, -- Message text.
				   16,    -- Severity.
				   1      -- State.
				   );	RETURNEND--does from account existELSE IF((LEN(@fromAccount) <= 0) or @fromAccount is NULL)BEGIN	set @ErrorMsg='UNABLE TO FIND SOURCE ACCOUNT:'+@fromAccount+' FOR SPECIFIED BANK';
	RAISERROR (@ErrorMsg, -- Message text.
				   16,    -- Severity.
				   1      -- State.
				   );	RETURNEND--do we have the currency code for fromAccountELSE IF((LEN(@CurrecnyOfFromAcc) <= 0) or @CurrecnyOfFromAcc is NULL)BEGIN	set @ErrorMsg='UNABLE TO DETERMINE CURRENCY OF SOURCE ACCOUNT:'+@fromAccount;
	RAISERROR (@ErrorMsg, -- Message text.
				   16,    -- Severity.
				   1      -- State.
				   );	RETURNEND--do we have the currency code for toAccountELSE IF((LEN(@CurrencyOfToAcc) <= 0) or @CurrencyOfToAcc is NULL)BEGIN	set @ErrorMsg='UNABLE TO DETERMINE CURRENCY OF DESTINATION ACCOUNT:'+@toAccount;
	RAISERROR (@ErrorMsg, -- Message text.
				   16,    -- Severity.
				   1      -- State.
				   );	RETURNEND----do we have the currency code for tranAmountELSE IF((LEN(@CurrecnyTranAmount) <= 0) or @CurrecnyTranAmount is NULL)BEGIN	set @ErrorMsg='UNABLE TO DETERMINE CURRENCY OF THE TRANSACTION AMOUNT';
	RAISERROR (@ErrorMsg, -- Message text.
				   16,    -- Severity.
				   1      -- State.
				   );	RETURNEND----Is Passed Currency code okELSE IF((LEN(@CurrencyCode) <= 0) or @CurrencyCode is NULL)BEGIN	set @ErrorMsg = 'UNABLE TO DETERMINE CURRENCY OF THE TRANSACTION AMOUNT';
	RAISERROR (@ErrorMsg, -- Message text.
				   16,    -- Severity.
				   1      -- State.
				   );	RETURNEND--====================================================================------AT THIS STAGE ALL DATA SHOULD BE VALID--if the account on the from account is --less than the total transaction amount---------------------------------------------------Change Amounts into local currency
--Change Tran Amount into local currency
Set @tranAmount = @tranAmount * @ValueInLocalCurrencyTranAmount 

--Change from Acc BalanceBefore into local currency
Set @TranAmountInFromAccountCurrency = (@tranAmount / @ValueInLocalCurrencyFromAccount)

--Get value of tran Amount in the currency of the from acount
Set @TranAmountInToAccountCurrency = (@tranAmount / @ValueInLocalCurrencyToAccount)-----------------------------------------------------BEGIN	--Insert Credit	Declare @CreditTranAmount decimal(18,2) = @TranAmount;	INSERT INTO GeneralLedgerTable 	(			[PegPayTranId],			[CustomerName],			[AccountNumber],			[ToAccount],			[FromAccount],			[TranAmount],			[TranAmountInAccountCurrency],			[BankTranId],			[TranType],			[TranCategory],			[PaymentDate],			[RecordDate],			[Teller],			[ApprovedBy],			[BankCode],			[BranchCode],			[Narration],			[CurrencyCode],			[ValueInLocalCurrencyFromAccount],			[ValueInLocalCurrencyToAccount],			[ValueInLocalCurrencyTranAmount],			[PaymentType],			[ChequeNumber],			[AccountingDate],			[AccountingPeriod],			[CustomerRef],			[CustomerTel]			)	VALUES (			'',			@CustomerName,			@toAccount,			'',			@fromAccount,			@CreditTranAmount,			@TranAmountInToAccountCurrency,			@VendorTranId,			'Credit',			@TranCategory,			@PaymentDate,			GETDATE(),			@Teller,			@ApprovedBy,			@BankCode,			@BranchCode,			@Narration,			@CurrecnyTranAmount,			@ValueInLocalCurrencyFromAccount,			@ValueInLocalCurrencytoAccount,			@ValueInLocalCurrencyTranAmount,			@PaymentType,			@ChequeNumber,			@AccountingDate,			@AccountingPeriod,			@CustomerRef,			@CustomerTel	)		Set @RecordId1=SCOPE_IDENTITY()		--Insert Debit	Declare @DeditTranAmount decimal(18,2) = @TranAmount * -1;	Declare @DebitAmountInAccountCurrency decimal(18,2) = @TranAmountInFromAccountCurrency*-1;		INSERT INTO GeneralLedgerTable (		    [PegPayTranId],			[CustomerName],			[AccountNumber],			[ToAccount],			[FromAccount],			[TranAmount],			[TranAmountInAccountCurrency],			[BankTranId],			[TranType],			[TranCategory],			[PaymentDate],			[RecordDate],			[Teller],			[ApprovedBy],			[BankCode],			[BranchCode],			[Narration],			[CurrencyCode],			[ValueInLocalCurrencyFromAccount],			[ValueInLocalCurrencyToAccount],			[ValueInLocalCurrencyTranAmount],			[PaymentType],			[ChequeNumber],			[AccountingDate],			[AccountingPeriod],			[CustomerRef],			[CustomerTel]	)	VALUES (			'',			@CustomerName,			@fromAccount,			@toAccount,			'',			@DeditTranAmount,			@DebitAmountInAccountCurrency,			@VendorTranId,			'Debit',			@TranCategory,			@PaymentDate,			GETDATE(),			@Teller,			@ApprovedBy,			@BankCode,			@BranchCode,			@Narration,			@CurrecnyTranAmount,			@ValueInLocalCurrencyFromAccount,			@ValueInLocalCurrencytoAccount,			@ValueInLocalCurrencyTranAmount,			@PaymentType,			@ChequeNumber,			@AccountingDate,			@AccountingPeriod,			@CustomerRef,			@CustomerTel	)			--Generate PegPayId	Set @RecordId2=SCOPE_IDENTITY()	SET @PegPayTranId=dbo.fn_GetReceiptno(@RecordId1)		Update GeneralLedgerTable set PegPayTranId=@PegPayTranId where RecordId=@RecordId1 or RecordId=@RecordId2		--return core banking transaction ID	Select @PegPayTranId as InsertedIdEND---------------------------------------------
GO
/****** Object:  StoredProcedure [dbo].[InsertReversedTransaction]    Script Date: 12/29/2017 09:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[InsertReversedTransaction]
@BankRef varchar(50),
@BankCode varchar(50),
@Approver varchar(50)
as
--if not exists(select * from TransactionRequests where BankCode=@bankcode and RecordId=@BankRef)
BEGIN

INSERT INTO [TransactionRequests]
           ([CustomerName]
           ,[AccountNumber]
           ,[ToAccount]
           ,[FromAccount]
           ,[TranAmount]
           ,[TranCategory]
           ,[PaymentDate]
           ,[RecordDate]
           ,[Teller]
           ,[ApprovedBy]
           ,[BankCode]
           ,[BranchCode]
           ,[Narration]
           ,[RequiresApproval]
           ,[Approver]
           ,[Status]
           ,[Reason])
    SELECT
           [CustomerName]
           ,[AccountNumber]
           ,[ToAccount]
           ,[FromAccount]
           ,[TranAmount]
           ,'REVERSAL'
           ,[PaymentDate]
           ,GETDATE()
           ,[Teller]
           ,@Approver
           ,[BankCode]
           ,[BranchCode]
           ,[Narration]
           ,[RequiresApproval]
           ,@Approver
           ,[Status]
           ,[Reason]
   FROM
		   TransactionRequests where RecordId=@BankRef and BankCode=@BankCode
END
GO
/****** Object:  StoredProcedure [dbo].[SessionKey_Update]    Script Date: 12/29/2017 09:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SessionKey_Update]
@sessionKey varchar(200),
@status varchar(50)
AS
begin
  update SessionLog set Status='expired',ModifiedOn=GETDATE()
  where DATEDIFF(MINUTE,getdate(),CreatedOn) < -15
end
begin
 if not exists (select RecordId from SessionLog with(nolock) where SessionKey=@sessionKey)
  begin
	INSERT INTO SessionLog
	       (SessionKey,Status)
	VALUES(@sessionKey,@status)
  end
else
    update SessionLog set Status=@status,ModifiedOn=GETDATE() where SessionKey=@sessionKey
end
GO
/****** Object:  StoredProcedure [dbo].[SessionKey_SelectRow]    Script Date: 12/29/2017 09:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SessionKey_SelectRow]
@key varchar(200)
AS
BEGIN
	select * from SessionLog where SessionKey = @key
END
GO
/****** Object:  StoredProcedure [dbo].[SearchUserTypesTable]    Script Date: 12/29/2017 09:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SearchUserTypesTable]
@bankCode varchar(50),
@Id varchar(50)
as
Select UserType as Id,UserType,Role,Description,BankCode from UserTypes where 
(BankCode=@bankCode or @bankCode='ALL') and
(UserTypeId=@Id or UserType=@Id or @Id='')
GO
/****** Object:  StoredProcedure [dbo].[SearchTransactionsToApprove]    Script Date: 12/29/2017 09:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SearchTransactionsToApprove]
@AccountNumber varchar(50),
@TransCategory varchar(50),
@Status varchar(50)
as
Select top 4 *
from TransactionRequests with(nolock) where
AccountNumber=@AccountNumber and 
TranCategory=@TransCategory and
Status=@Status
order by RecordDate asc
GO
/****** Object:  StoredProcedure [dbo].[SearchTransactionRequestsTable]    Script Date: 12/29/2017 09:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SearchTransactionRequestsTable]
@BankCode varchar(50),
@BranchCode varchar(50),
@Teller varchar(50),
@AccountNumber varchar(50),
@CustomerName varchar(50),
@TransCategory varchar(50),
@BankId varchar(50),
@FromDate varchar(50),
@ToDate varchar(50),
@Approver varchar(50),
@Status varchar(50)
as
Select RecordId as BankTranId,Teller,CustomerName,ToAccount,FromAccount,TranAmount,TranCategory,RecordDate
from TransactionRequests with(nolock) where
(BankCode=@BankCode or @BankCode='ALL') and
(BranchCode=@BranchCode or @BranchCode='ALL') and
(Teller=@Teller or @Teller='') and
( 
   (ToAccount=@AccountNumber or @AccountNumber='') or
   (fromAccount=@AccountNumber or @AccountNumber='')
   ) and
((CustomerName like '%'+@CustomerName+'%') or @CustomerName='') and
(TranCategory=@TransCategory or @TransCategory='ALL') and 
(PaymentDate>=@FromDate or @FromDate='') and 
(PaymentDate<=@ToDate or @ToDate='')
and (status=@Status or @Status='')
--and (Approver=@Approver or @Approver='')
order by RecordDate desc
GO
/****** Object:  StoredProcedure [dbo].[SearchTransactionCategoriesTable]    Script Date: 12/29/2017 09:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SearchTransactionCategoriesTable]
@bankCode varchar(50),
@Id varchar(50)
as
Select TranType as Id,TranType,Description,BankCode,CreatedOn from TransactionCategories where 
BankCode=@bankCode or @bankCode='ALL' and
(TranTypeId=@Id or TranType=@Id or @Id='')
GO
/****** Object:  StoredProcedure [dbo].[SearchTieredChargesTable]    Script Date: 12/29/2017 09:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SearchTieredChargesTable]
@BankCode varchar(50),
@ChargeCode varchar(50)
as
Select ChargeId, MinimumValue as StartValueOfTier,MaximumValue as EndValueOfTier,ChargeAmount as TierChargeAmount, ChargeType as TierChargeType,IsActive
from BankCharges where ChargeCode=@ChargeCode and BankCode=@BankCode
GO
/****** Object:  StoredProcedure [dbo].[SearchRejectedBankAccountsTable]    Script Date: 12/29/2017 09:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SearchRejectedBankAccountsTable]
@bankCode varchar(50),
@Id varchar(50)
as


select B.AccountCode,B.AccountName,A.AccTypeName, CASE WHEN IsReferenced=0 THEN 'NO' ELSE 'YES' END AS IsReferenced, LiquidationType,B.CreatedOn,LiquidationAccount,R.Comment  from RejectedBankAccounts AS B
inner join
AccountTypes AS A on B.AccType=A.AccTypeCode
left join
dbo.RejectionLogs AS R on R.AccountCode=B.AccountCode
where 
(B.BankCode=@bankCode or @bankCode='ALL') and
(B.AccountCode=@Id or @Id='' or AccType=@Id)
and A.BankCode=B.BankCode
and B.Status='PENDING'
GO
/****** Object:  StoredProcedure [dbo].[SearchPaymentTypesTable]    Script Date: 12/29/2017 09:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SearchPaymentTypesTable]
@BankCode varchar(50),
@Id varchar(50)
as
Select PaymentTypeCode as Id,PaymentTypeCode,BankCode,ModifiedBy from PaymentTypes where 
(BankCode=@BankCode or @BankCode='ALL') and 
(PaymentTypeCode=@Id or @Id='')
GO
/****** Object:  StoredProcedure [dbo].[SearchPaymentsGatewayTable2]    Script Date: 12/29/2017 09:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SearchPaymentsGatewayTable2]
@vendorCode varchar(50),
@email varchar(50),
@status varchar(50),
@fromdate varchar(50),
@endDate varchar(50)
as
select CustomerTel,CustName,TranAmount,PaymentOptionSelected,RecordDate,Status,StatusDescription as Reason,VendorTranId as TranId,TransactionRef as ExternalTranID from PaymentsGatewayRequests A 
inner join BankAccounts B on A.MerchantCode = B.AccountCode
where 
(Status=@status or @status='ALL')
and 
((CONVERT(Date,RecordDate)>=@fromdate or @fromdate='') and (CONVERT(Date,RecordDate)<=@endDate or @endDate=''))
and
(@email='' or Email like '%'+@email+'%' or CustomerTel like '%'+@email+'%' or CustName like '%'+@email+'%')
and 
(@vendorCode='' or A.MerchantCode=@vendorCode)
order by RecordDate desc
GO
/****** Object:  StoredProcedure [dbo].[SearchPaymentsGatewayTable_External2]    Script Date: 12/29/2017 09:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SearchPaymentsGatewayTable_External2]
@email varchar(50),
@tranId varchar(50),
@fromdate varchar(50),
@endDate varchar(50)
as
select VendorTranId as TranId, TranAmount,PaymentOptionSelected,RecordDate,Status,TransactionRef as ExternalTranID from PaymentsGatewayRequests 
where 
(@tranId='' or TransactionRef=@tranId)
and 
((CONVERT(Date,RecordDate)>=@fromdate or @fromdate='') and (CONVERT(Date,RecordDate)<=@endDate or @endDate=''))
and
(@email='' or Email like '%'+@email+'%' or CustomerTel like '%'+@email+'%')
order by RecordDate desc
GO
/****** Object:  StoredProcedure [dbo].[SearchChargeTypesTable]    Script Date: 12/29/2017 09:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SearchChargeTypesTable]
@BankCode varchar(50),
@Id varchar(50)
as
Select ChargeTypeCode as Id,ChargeTypeCode,BankCode,ModifiedBy from ChargeTypes where 
(BankCode=@BankCode or @BankCode='ALL') and 
(ChargeTypeCode=@Id or @Id='')
GO
/****** Object:  StoredProcedure [dbo].[SearchBankChargesTable]    Script Date: 12/29/2017 09:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SearchBankChargesTable]
@bankCode varchar(50),
@Id varchar(50)
as
Select ChargeCode as Id,ChargeName,ChargeAmount,ChargeType,BankCode,IsActive from BankCharges where 
(BankCode=@bankCode or @bankCode='ALL') and
(ChargeId=@Id or ChargeCode=@Id or ChargeName like '%'+@Id+'%' or @Id='')
GO
/****** Object:  StoredProcedure [dbo].[SearchBankBranchesTable]    Script Date: 12/29/2017 09:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SearchBankBranchesTable]
@bankCode varchar(50),
@Id varchar(50)
as
Select BranchCode as Id,BranchName,Location,IsActive,BankCode,CreatedOn from BankBranches where 
(BankCode=@bankCode or @bankCode='ALL') and
(BranchId=@Id or BranchCode=@Id or BranchName like '%'+@Id+'%' or @Id='')
GO
/****** Object:  StoredProcedure [dbo].[SearchBankAccountsTable2]    Script Date: 12/29/2017 09:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SearchBankAccountsTable2]
@bankCode varchar(50),
@Id varchar(50)
as


select B.AccountCode as Id,B.AccountName,A.AccTypeName, CASE WHEN IsReferenced=0 THEN 'NO' ELSE 'YES' END AS IsReferenced,
 LiquidationType,B.CreatedOn,LiquidationAccount,CASE WHEN ApprovedBy='' THEN 'PENDING' ELSE 'APPROVED' END AS 'Approval Status'
 from BankAccounts AS B
inner join
AccountTypes AS A on B.AccType=A.AccTypeCode
where 
(B.BankCode=@bankCode or @bankCode='ALL') and
(B.AccountCode=@Id or @Id='' or AccType=@Id)
and A.BankCode=B.BankCode
and B.AccType not in ('COMMISSION_ACCOUNT','SUSPENSE_ACCOUNT')
GO
/****** Object:  StoredProcedure [dbo].[SearchBankAccountsTable]    Script Date: 12/29/2017 09:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SearchBankAccountsTable]
@bankCode varchar(50),
@Id varchar(50)
as


select B.AccountCode as Id,B.AccountName,A.AccTypeName, CASE WHEN IsReferenced=0 THEN 'NO' ELSE 'YES' END AS IsReferenced,
 LiquidationType,B.CreatedOn,LiquidationAccount,CASE WHEN ApprovedBy='' THEN 'PENDING' ELSE 'APPROVED' END AS 'Approval Status'
 from BankAccounts AS B
inner join
AccountTypes AS A on B.AccType=A.AccTypeCode
where 
(B.BankCode=@bankCode or @bankCode='ALL') and
(B.AccountCode=@Id or @Id='' or AccType=@Id)
and A.BankCode=B.BankCode
and B.AccType not in ('COMMISSION_ACCOUNT','SUSPENSE_ACCOUNT')

select * from BankAccounts

--Select AccNumber as Id,AccNumber,dbo.fn_GetAccountBalance(BankCode,AccNumber) AS AccBalance,AccType,BankCode,IsActive,CreatedOn from BankAccounts where 
--(BankCode=@bankCode or @bankCode='ALL') and
--(AccNumber=@Id or @Id='' or AccType=@Id)
GO
/****** Object:  StoredProcedure [dbo].[SearchAuditlogsTable]    Script Date: 12/29/2017 09:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SearchAuditlogsTable]
@UserId varchar(50),
@BankCode varchar(50),
@ActionType varchar(50)
as
Select ActionType,ModifiedBy as 'User Perfoming Action',ModifiedOn as RecordDateTime,TableName as 'Entity',Action from AuditTrail where 
(BankCode=@BankCode or BankCode='ALL') and 
(ModifiedBy=@UserId or @UserId='') and
(ActionType=@ActionType or @ActionType='ALL')
order by ModifiedOn desc

select * from AuditTrail
GO
/****** Object:  StoredProcedure [dbo].[SearchAccountTypesTable]    Script Date: 12/29/2017 09:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SearchAccountTypesTable]
@bankCode varchar(50),
@Id varchar(50)
as
Select AccTypeCode as Id,AccTypeName,MinimumBal,BankCode,IsActive,Description from AccountTypes where 
(BankCode=@bankCode or @bankCode='ALL') and
(AccTypeCode=@Id or AccTypeName=@Id or @Id='')
GO
/****** Object:  StoredProcedure [dbo].[SearchAccessControlTable]    Script Date: 12/29/2017 09:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SearchAccessControlTable]
@BankCode varchar(50),
@Id varchar(50)
as
Select RecordId as Id,RuleName,UserType,BankCode,CanAccess,IsActive,ModifiedBy from AccessRules where 
(BankCode=@BankCode or @BankCode='ALL') and 
((RuleName like '%'+@Id+'%') or (RuleName=''))
GO
/****** Object:  StoredProcedure [dbo].[SaveUserAccessRule]    Script Date: 12/29/2017 09:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SaveUserAccessRule]
@UserType varchar(50),
@Page varchar(50),
@BankCode varchar(50),
@CreatedBy varchar(50)
as
if not exists (select * from [UserAccessRules] where UserType=@UserType and Page=@Page)
Begin
INSERT INTO [dbo].[UserAccessRules]
           ([UserType]
           ,[Page]
           ,[BankCode]
           ,[ModifiedOn]
           ,[ModifiedBy]
           ,[CreatedOn]
           ,[CreatedBy])
     VALUES
           (
           @UserType,
           @Page,
           @BankCode,
           GETDATE(),
           @CreatedBy,
           GETDATE(),
           @CreatedBy
           )
End
GO
/****** Object:  StoredProcedure [dbo].[SaveTranRequestLiq2]    Script Date: 12/29/2017 09:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SaveTranRequestLiq2]
@CustomerName varchar(50),
@AccountNumber varchar(50),
@ToAccount varchar(50),
@FromAccount varchar(50),
@TranAmount money,
@TranCategory varchar(50),
@PaymentDate datetime,
@Teller varchar(50),
@ApprovedBy varchar(50),
@BankCode varchar(50),
@BranchCode varchar(50),
@Narration varchar(50),
@CurrencyCode varchar(50),
@PaymentType varchar(50),
@ChequeNumber varchar(50),
@CustomerTel varchar(50),
@BankTranId varchar(50)
as
Begin transaction trans
Begin try
if exists (Select top 1 BankTranId from GeneralLedgerTable where ChequeNumber=@BankTranId and TranCategory='M2B' and TranType='debit')
Begin
	Select top 1 BankTranId from GeneralLedgerTable where ChequeNumber=@BankTranId and TranCategory='M2B' and TranType='debit'
End
Else
Begin
INSERT INTO [TransactionRequests]
           ([CustomerName],
           [AccountNumber]
           ,[ToAccount]
           ,[FromAccount]
           ,[TranAmount]
           ,[TranCategory]
           ,[PaymentDate]
           ,[RecordDate]
           ,[Teller]
           ,[ApprovedBy]
           ,[BankCode]
           ,[BranchCode]
           ,[Narration]
           ,CurrencyCode
           ,PaymentType
           ,ChequeNumber
           ,CustomerTel,
           BankTranId)
     VALUES
           (@CustomerName,
           @AccountNumber,
           @ToAccount,
           @FromAccount,
           @TranAmount,
           @TranCategory,
           @PaymentDate,
           GETDATE(),
           @Teller,
           @ApprovedBy,
           @BankCode,
           @BranchCode,
           @Narration,
           @CurrencyCode,
           @PaymentType,
           @ChequeNumber,
           @CustomerTel,
           @BankTranId)
           
 Select SCOPE_IDENTITY() as InsertedId
 End
 ---------------------------------------------------------------------
Commit Transaction Trans

END TRY
BEGIN CATCH

ROLLBACK Transaction Trans

  DECLARE
   @ErMessage NVARCHAR(2048),
   @ErSeverity INT,
   @ErState INT
 
 SELECT
   @ErMessage = ERROR_MESSAGE(),
   @ErSeverity = ERROR_SEVERITY(),
   @ErState = ERROR_STATE()
 
 RAISERROR (@ErMessage,
             @ErSeverity,
             @ErState )
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[SaveTranRequest]    Script Date: 12/29/2017 09:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SaveTranRequest]
@CustomerName varchar(50),
@AccountNumber varchar(50),
@ToAccount varchar(50),
@FromAccount varchar(50),
@TranAmount money,
@TranCategory varchar(50),
@PaymentDate datetime,
@Teller varchar(50),
@ApprovedBy varchar(50),
@BankCode varchar(50),
@BranchCode varchar(50),
@Narration varchar(50),
@CurrencyCode varchar(50),
@PaymentType varchar(50),
@ChequeNumber varchar(50),
@CustomerTel varchar(50)
as
Begin transaction trans
Begin try
INSERT INTO [TransactionRequests]
           ([CustomerName],
           [AccountNumber]
           ,[ToAccount]
           ,[FromAccount]
           ,[TranAmount]
           ,[TranCategory]
           ,[PaymentDate]
           ,[RecordDate]
           ,[Teller]
           ,[ApprovedBy]
           ,[BankCode]
           ,[BranchCode]
           ,[Narration]
           ,CurrencyCode
           ,PaymentType
           ,ChequeNumber
           ,CustomerTel)
     VALUES
           (@CustomerName,
           @AccountNumber,
           @ToAccount,
           @FromAccount,
           @TranAmount,
           @TranCategory,
           @PaymentDate,
           GETDATE(),
           @Teller,
           @ApprovedBy,
           @BankCode,
           @BranchCode,
           @Narration,
           @CurrencyCode,
           @PaymentType,
           @ChequeNumber,
           @CustomerTel)
           
 Select SCOPE_IDENTITY() as InsertedId
 ---------------------------------------------------------------------
Commit Transaction Trans

END TRY
BEGIN CATCH

ROLLBACK Transaction Trans

  DECLARE
   @ErMessage NVARCHAR(2048),
   @ErSeverity INT,
   @ErState INT
 
 SELECT
   @ErMessage = ERROR_MESSAGE(),
   @ErSeverity = ERROR_SEVERITY(),
   @ErState = ERROR_STATE()
 
 RAISERROR (@ErMessage,
             @ErSeverity,
             @ErState )
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[TransactionTypes_Update]    Script Date: 12/29/2017 09:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[TransactionTypes_Update]
	@TranTypeId varchar(50),
	@TranType varchar(50),
	@Description varchar(150),
	@BankCode varchar(50),
	@ModifiedBy varchar(50),
	@IsActive bit
As
Begin Transaction trans
Begin Try
IF not exists(select * from TransactionCategories where TranType=@TranType and BankCode=@BankCode)
Begin
   Insert Into TransactionCategories
		([TranType],[Description],BankCode,CreatedOn,ModifiedOn,CreatedBy,ModifiedBy,IsActive)
	Values
		(@TranType,@Description,@BankCode,GETDATE(),GETDATE(),@ModifiedBy,@ModifiedBy,@IsActive)
	Select @TranType as InsertedId
End
ELSE
Begin
	Update TransactionCategories
	Set
		[TranType] = @TranType,
		[Description] = @Description,
		BankCode=@BankCode,
		ModifiedOn=GETDATE(),
		ModifiedBy=@ModifiedBy,
		IsActive=@IsActive
	Where		
		TranType=@TranType and BankCode=@BankCode
	Select @TranType as InsertedId

End
---------------------------------------------------------------------
Commit Transaction Trans

END TRY
BEGIN CATCH

ROLLBACK Transaction Trans

  DECLARE
   @ErMessage NVARCHAR(2048),
   @ErSeverity INT,
   @ErState INT
 
 SELECT
   @ErMessage = ERROR_MESSAGE(),
   @ErSeverity = ERROR_SEVERITY(),
   @ErState = ERROR_STATE()
 
 RAISERROR (@ErMessage,
             @ErSeverity,
             @ErState )
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[TransactionTypes_SelectRow]    Script Date: 12/29/2017 09:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	sp_TransactionTypes_SelectRow
-- Author:	Mehdi Keramati
-- Create date:	12/19/2015 10:45:02 PM
-- Description:	This stored procedure is intended for selecting a specific row from TransactionTypes table
-- ==========================================================================================
CREATE Procedure [dbo].[TransactionTypes_SelectRow]
	@TranTypeCode varchar(50)
As
Begin
	Select *
	From TransactionCategories
	Where
		TranType=@TranTypeCode
End
GO
/****** Object:  StoredProcedure [dbo].[TransactionTypes_SelectAll]    Script Date: 12/29/2017 09:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	sp_TransactionTypes_SelectAll
-- Author:	Mehdi Keramati
-- Create date:	12/19/2015 10:45:02 PM
-- Description:	This stored procedure is intended for selecting all rows from TransactionTypes table
-- ==========================================================================================
CREATE Procedure [dbo].[TransactionTypes_SelectAll]
As
Begin
	Select *
	From TransactionCategories
End
GO
/****** Object:  StoredProcedure [dbo].[TransactionTypes_Insert]    Script Date: 12/29/2017 09:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	sp_TransactionTypes_Insert
-- Author:	Mehdi Keramati
-- Create date:	12/19/2015 10:45:02 PM
-- Description:	This stored procedure is intended for inserting values to TransactionTypes table
-- ==========================================================================================
CREATE Procedure [dbo].[TransactionTypes_Insert]
	@TranType varchar(50),
	@Description varchar(150)
As
Begin
	Insert Into TransactionCategories
		([TranType],[Description])
	Values
		(@TranType,@Description)

	Declare @ReferenceID int
	Select @ReferenceID = @@IDENTITY

	Return @ReferenceID

End
GO
/****** Object:  StoredProcedure [dbo].[SearchBanksTable]    Script Date: 12/29/2017 09:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SearchBanksTable]
@bankCode varchar(50),
@Id varchar(50)
as
Select BankCode as id,BankName,BankCode,BankContactEmail,IsActive 
from Banks where 
(BankCode=@bankCode or @bankCode='ALL') and 
(BankName=@Id or @Id='')
GO
/****** Object:  StoredProcedure [dbo].[RemoveAccountDetails]    Script Date: 12/29/2017 09:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[RemoveAccountDetails](@pegpayId varchar(50))
as begin
	begin transaction
	begin try
		insert into BankAccountsHistory select * from BankAccounts where AccNumber = @pegpayId
		delete from BankAccounts where AccNumber = @pegpayId
		commit
	end try
	begin catch
		rollback
	end catch
end
GO
/****** Object:  StoredProcedure [dbo].[UpdateTransacttionApprovalStatus]    Script Date: 12/29/2017 09:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[UpdateTransacttionApprovalStatus]
@BankTranId varchar(50),
@Status varchar(50),
@RequiresApproval bit,
@Approver varchar(50)
as
Update TransactionRequests set RequiresApproval=@RequiresApproval,Status=@Status,Approver=@Approver where RecordId=@BankTranId
GO
/****** Object:  StoredProcedure [dbo].[UpdateTransactionStatus]    Script Date: 12/29/2017 09:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[UpdateTransactionStatus]
@PegPayId varchar(50),
@Status varchar(50),
@Reason varchar(50)
as
if(@Status='SUCCESS')
Begin
Update PaymentsGatewayRequests set Status=@Status,TransactionRef=@Reason where RecordId=@PegPayId
End
Else if(@Status='FAILED')
Begin
 Update PaymentsGatewayRequests set Status=@Status,StatusDescription=@Reason where RecordId=@PegPayId
End
GO
/****** Object:  StoredProcedure [dbo].[UpdateTelecomStatus]    Script Date: 12/29/2017 09:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UpdateTelecomStatus] 
@pegpayId varchar(50),
@status varchar(50),
@date varchar(50),
@sent varchar(50)

as
--declare @sent bit 
declare @BankCode varchar(50)
declare @BankTranId varchar(50)
Select  top 1 @BankCode=BankCode,@BankTranId=BankTranId,@sent=SentToBank from GeneralLedgerTable where PegPayTranId=@pegpayId
if @sent=0
begin
   Update GeneralLedgerTable set SentToBank=1, BankSentDate=@date, BankStatus=@status,Processed=1
	where BankCode=@BankCode and BankTranId=@BankTranId
end
else
  Update GeneralLedgerTable set  BankStatus=@status,Processed=1
  where  BankCode=@BankCode and BankTranId=@BankTranId
GO
/****** Object:  StoredProcedure [dbo].[UpdateSentMerchantTransaction]    Script Date: 12/29/2017 09:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[UpdateSentMerchantTransaction]
@transNo int,
@merchantId varchar(50),
@merchantTranId varchar(50),
@status varchar(50),
@reason varchar(50),
@sent bit
as
update PaymentsGatewayRequests
 set SentToUtility=1,
     UtilityRef=@merchantTranId,
     StatusAtUtility=@status,
     ReasonAtUtility=@reason,
     UtilitySentDate=GETDATE()
 where  RecordId=@transNo
GO
/****** Object:  StoredProcedure [dbo].[UpdateReversalTransactionStatus2]    Script Date: 12/29/2017 09:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[UpdateReversalTransactionStatus2]
@PegPayId varchar(50),
@processed bit,
@TransactionRef varchar(50),
@MerchantCode varchar(50)
AS

UPDATE PaymentsGatewayRequests set Processed=@processed,TransactionRef=@TransactionRef
Where VendorTranId=@PegPayId and MerchantCode=@MerchantCode
GO
/****** Object:  StoredProcedure [dbo].[UpdateBankTransactionStatus2]    Script Date: 12/29/2017 09:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[UpdateBankTransactionStatus2]
@BankId varchar(50),
@BankCode varchar(50),
@PegPayId varchar(50),
@Status varchar(50)
as
Begin Transaction updater
Begin Try
if(@Status='SUCCESS')
Begin
Declare @RecordId varchar(50)
--Update TransactionRequests set Status=@Status,Reason=@PegPayId where RecordId=@BankId and BankCode=@BankCode
Update GeneralLedgerTable set Processed=1 where BankTranId=@BankId
Select top 1 @RecordId=BankTranId from GeneralLedgerTable where BankTranId=@BankId
Update TransactionRequests set Status=@Status,Reason=@PegPayId where RecordId=@RecordId and BankCode=@BankCode

End
Else
Begin
Update TransactionRequests set Status=@Status,Reason=@PegPayId where RecordId=@BankId and BankCode=@BankCode
End
Commit Transaction updater
End try
Begin Catch
RollBack Transaction updater
 DECLARE
   @ErMessage NVARCHAR(2048),
   @ErSeverity INT,
   @ErState INT
 
 SELECT
   @ErMessage = ERROR_MESSAGE(),
   @ErSeverity = ERROR_SEVERITY(),
   @ErState = ERROR_STATE()
 
 RAISERROR (@ErMessage,
             @ErSeverity,
             @ErState )
End Catch
GO
/****** Object:  StoredProcedure [dbo].[UpdateBankTransactionStatus]    Script Date: 12/29/2017 09:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[UpdateBankTransactionStatus]
@BankId varchar(50),
@BankCode varchar(50),
@PegPayId varchar(50),
@Status varchar(50)
as
Begin Transaction updater
Begin Try
if(@Status='SUCCESS')
Begin
Update TransactionRequests set Status=@Status,Reason=@PegPayId where BankTranId=@BankId and BankCode=@BankCode
Update GeneralLedgerTable set Processed=1 where BankTranId=@BankId
End
Else
Begin
Update TransactionRequests set Status=@Status,Reason=@PegPayId where RecordId=@BankId and BankCode=@BankCode
End
Commit Transaction updater
End try
Begin Catch
RollBack Transaction updater
 DECLARE
   @ErMessage NVARCHAR(2048),
   @ErSeverity INT,
   @ErState INT
 
 SELECT
   @ErMessage = ERROR_MESSAGE(),
   @ErSeverity = ERROR_SEVERITY(),
   @ErState = ERROR_STATE()
 
 RAISERROR (@ErMessage,
             @ErSeverity,
             @ErState )
End Catch
GO
/****** Object:  StoredProcedure [dbo].[UpdateBankStatusAndReference]    Script Date: 12/29/2017 09:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[UpdateBankStatusAndReference]
@pegpayId varchar(50),
@bankRef varchar(50),
@status varchar(50),
@date varchar(50)
as
declare @sent bit 
set @sent=(select top 1 SentToBank from GeneralLedgerTable where PegPayTranId=@pegpayId)
if @sent=0
begin
   Update GeneralLedgerTable set SentToBank=1, BankSentDate=@date, BankStatus=@status,BankReference=@bankRef
 where PegPayTranId=@pegpayId 
end
else
  Update GeneralLedgerTable set  BankStatus=@status
 where PegPayTranId=@pegpayId
GO
/****** Object:  StoredProcedure [dbo].[UpdateBankStatus]    Script Date: 12/29/2017 09:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[UpdateBankStatus]
@pegpayId varchar(50),
@status varchar(50),
@date varchar(50)
as
declare @sent bit 
declare @BankCode varchar(50)
declare @BankTranId varchar(50)
Select  top 1 @BankCode=BankCode,@BankTranId=BankTranId,@sent=SentToBank from GeneralLedgerTable where PegPayTranId=@pegpayId
if @sent=0
begin
   Update GeneralLedgerTable set SentToBank=1, BankSentDate=@date, BankStatus=@status,Processed=1
	where BankCode=@BankCode and BankTranId=@BankTranId
end
else
  Update GeneralLedgerTable set  BankStatus=@status,Processed=1
  where  BankCode=@BankCode and BankTranId=@BankTranId
GO
/****** Object:  StoredProcedure [dbo].[UpdateBankSentStatus]    Script Date: 12/29/2017 09:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[UpdateBankSentStatus]
@pegpayId varchar(50),
@status varchar(50)
as
Update GeneralLedgerTable set SentToBank=1, BankSentDate=GETDATE(), BankStatus=@status
 where PegPayTranId=@pegpayId
GO
/****** Object:  StoredProcedure [dbo].[UpdateBankAccountsIsActiveStatus]    Script Date: 12/29/2017 09:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[UpdateBankAccountsIsActiveStatus]
@BankCode varchar(50),
@AccountNumber varchar(50),
@Status varchar(50),
@ApprovedBy varchar(50)
as
Update BankAccounts set IsActive=@status,ApprovedBy=@ApprovedBy 
where AccNumber=@AccountNumber and BankCode=@BankCode
GO
/****** Object:  StoredProcedure [dbo].[UpdateApprovalStatusOfMerchantCustomer]    Script Date: 12/29/2017 09:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[UpdateApprovalStatusOfMerchantCustomer]
@ApprovalId varchar(50),
@ModifiedBy varchar(50),
@Status varchar(50)
as
Begin Transaction Updater
Begin try
If(@Status='SUCCESS')
Begin
	Update MerchantCustomers set ApprovedBy=@ModifiedBy where RecordId=@ApprovalId
End
Else
Begin
	Insert into RejectedMerchantCustomers
	(		[RecordId]
           ,[CustomerRef]
           ,[CustomerName]
           ,[CustomerTel]
           ,[Email]
           ,[AccountCode]
           ,[IsActive]
           ,[BankCode]
           ,[CreatedOn]
           ,[ModifiedOn]
           ,[CreatedBy]
           ,[ModifiedBy]
           ,[Extra1]
           ,[Extra2]
           ,[Extra3]
           ,[RejectedBy]
           ,[RejectedOn])
	Select 
	[RecordId]
           ,[CustomerRef]
           ,[CustomerName]
           ,[CustomerTel]
           ,[Email]
           ,[AccountCode]
           ,[IsActive]
           ,[BankCode]
           ,[CreatedOn]
           ,[ModifiedOn]
           ,[CreatedBy]
           ,[ModifiedBy]
           ,[Extra1]
           ,[Extra2]
           ,[Extra3],
			@ModifiedBy as RejectedBy,
			GETDATE() as RejectedOn 
	from MerchantCustomers where RecordId=@ApprovalId
	
	Delete from MerchantCustomers where RecordId=@ApprovalId
	
End
Commit Transaction Updater
End try

Begin catch
ROLLBACK Transaction Updater

  DECLARE
   @ErMessage NVARCHAR(2048),
   @ErSeverity INT,
   @ErState INT
 SELECT
   @ErMessage = ERROR_MESSAGE(),
   @ErSeverity = ERROR_SEVERITY(),
   @ErState = ERROR_STATE()
 
 RAISERROR (@ErMessage,
             @ErSeverity,
             @ErState )
End Catch
GO
/****** Object:  StoredProcedure [dbo].[UpdateAccountRegistrationStatus]    Script Date: 12/29/2017 09:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[UpdateAccountRegistrationStatus]
@AccountCode varchar(50),
@AccountNumber varchar(50)
as
Update BankAccounts set SentToBank=1
where AccountCode = @AccountCode and LiquidationAccount=@AccountNumber and BankCode='SBU'
GO
/****** Object:  StoredProcedure [dbo].[UndoEndOfDayProcess]    Script Date: 12/29/2017 09:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[UndoEndOfDayProcess](@datetime varchar(50))
as begin
	delete from AccountEODBalances where AccountDate  >= @datetime
end
GO
/****** Object:  StoredProcedure [dbo].[TransferToGeneralLedgerArchive]    Script Date: 12/29/2017 09:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[TransferToGeneralLedgerArchive]
as
Begin Transaction transferer
Begin try
Declare @CurrentDateTime datetime = GETDATE();
Insert into GeneralLedgerTableArchive
select * from GeneralLedgerTable where RecordDate<=@CurrentDateTime
delete from GeneralLedgerTable where RecordDate<=@CurrentDateTime
Commit Transaction transferer
End Try
Begin Catch
Rollback Transaction transferer
End Catch
GO
/****** Object:  StoredProcedure [dbo].[UsersToAccounts_Insert]    Script Date: 12/29/2017 09:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[UsersToAccounts_Insert]
@UserId varchar(50),
@AccountNumber varchar(50),
@BankCode varchar(50)
as
if not exists(select * from UsersToAccounts where UserId=@UserId and AccountNumber=@AccountNumber and BankCode=@BankCode)
Begin
INSERT INTO [dbo].[UsersToAccounts]
           ([UserId]
           ,[AccountNumber]
           ,[BankCode])
     VALUES
           (@UserId
           ,@AccountNumber
           ,@BankCode)
End
GO
/****** Object:  StoredProcedure [dbo].[GetAccountsByUserId]    Script Date: 12/29/2017 09:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetAccountsByUserId]
@UserId varchar(50)
as
Select * from BankAccounts A
inner join TellersToAccountsMapping B on A.AccNumber=B.AccountNumber
where 
UserId=@UserId
GO
/****** Object:  StoredProcedure [dbo].[GetAccountsById]    Script Date: 12/29/2017 09:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetAccountsById]
@acctNumber varchar(50)
as
Select * from BankAccounts 
where 
AccNumber=@acctNumber
GO
/****** Object:  StoredProcedure [dbo].[GetAccountsByCustomerId]    Script Date: 12/29/2017 09:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetAccountsByCustomerId]
@UserId varchar(50)
as
Select * from BankAccounts A
inner join CustomersToAccountsMapping B on A.AccNumber=B.AccountNumber
where 
(CustomerId=@UserId or @UserId='')
and A.ApprovedBy<>''
GO
/****** Object:  StoredProcedure [dbo].[GetAccountPendingDetailsById]    Script Date: 12/29/2017 09:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetAccountPendingDetailsById]
@Id varchar(50)
AS

SELECT A.AccountCode, A.AccountName,A.AccNumber,A.LiquidationAccount,A.AccType,B.BankName,L.BranchName,A.CreatedOn,A.CreatedBy,T.LiquidationName,case when A.IsReferenced=0 then 'NO' Else 'YES' end as Referenced ,A.BankCode,A.BranchCode,A.MerchantContact  
FROM PendingBankAccountApprovals AS A
 inner join
 Banks AS B on B.BankCode=A.BankCode
 inner join 
 BankBranches AS L on L.BranchCode=A.BranchCode
 Left Join
 LiquidationTypes  As T on T.LiquidationCode=A.LiquidationType
WHERE
AccountId=@Id

--select A.CustomerId from CustomersToAccountsMapping AS A
--inner Join
--BankAccounts AS B on B.AccNumber=A.AccountNumber
--Where
--B.AccountCode=@AccountCode
GO
/****** Object:  StoredProcedure [dbo].[GetAccountTypesByBankCode]    Script Date: 12/29/2017 09:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetAccountTypesByBankCode]
@bankCode varchar(50),
@AccountCategory varchar(50)
as
Select * from AccountTypes where BankCode=@bankCode and
(AccountCategory=@AccountCategory or @AccountCategory='')


--select * from AccountTypes where AccTypeCode='G_CURRENT_ACCOUNT'

--Update AccountTypes set AccountCategory='NON_INDIVIDUAL' where AccTypeCode='G_CURRENT_ACCOUNT'
GO
/****** Object:  StoredProcedure [dbo].[GetAccountStatement]    Script Date: 12/29/2017 09:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetAccountStatement]
@AccountNumber varchar(50),
@BankCode varchar(50),
@StatementType varchar(50)
as
if(@StatementType='MINI')
Begin
Select top 5 * from GeneralLedgerTable where 
(AccountNumber=@AccountNumber) and 
BankCode=@BankCode order by RecordDate desc
End
Else if ISNUMERIC(@StatementType) = 1
Begin
 declare @number int = cast(@StatementType as int)
Select top (@number) * from GeneralLedgerTable where 
(AccountNumber=@AccountNumber) and 
BankCode=@BankCode order by RecordDate desc
End
Else
Begin
Select * from GeneralLedgerTable where 
(AccountNumber=@AccountNumber) and 
BankCode=@BankCode order by RecordDate desc
End
GO
/****** Object:  StoredProcedure [dbo].[GetAccountCategories]    Script Date: 12/29/2017 09:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetAccountCategories]
@bankCode varchar(50)
as
Select *  from AccountCategories
where BankCode=@bankCode and IsBankCustomer=0
order by RecordId desc
GO
/****** Object:  StoredProcedure [dbo].[GetAccountByPhone]    Script Date: 12/29/2017 09:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetAccountByPhone]
@CustomerTel varchar(50)
as

Select * from BankAccounts
where (MerchantContact=@CustomerTel or MerchantContact like '%'+Substring(@CustomerTel, 2, (len(@CustomerTel)))+'%')
GO
/****** Object:  StoredProcedure [dbo].[Accounts_UpdateReturnAccountId]    Script Date: 12/29/2017 09:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Accounts_UpdateReturnAccountId]	@AccountId int,	@AccBalance money,	@UserId varchar(50),	@AccNumber varchar(50),	@AccType varchar(50),	@BankCode varchar(50)ASDeclare @Ret int;IF not exists(select * from BankAccounts where AccNumber=@AccNumber and BankCode=@BankCode)BEGIN	SET @AccNumber = dbo.fn_GetAccountNo(GETDATE())	INSERT INTO BankAccounts (		[AccNumber],		[AccType],		BankCode	)	VALUES (		@AccNumber,		@AccType,		@BankCode	)			SELECT @Ret = SCOPE_IDENTITY() 	return @RetENDELSE BEGIN	UPDATE BankAccounts SET		[AccType] = @AccType,		BankCode = @BankCode	WHERE AccNumber = @AccNumber		SELECT @Ret=AccountId from BankAccounts where AccNumber= @AccNumber	return @RetEND
GO
/****** Object:  StoredProcedure [dbo].[GetAllBanks2]    Script Date: 12/29/2017 09:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetAllBanks2]
@bankcode varchar(50)
as
Select BankName,BankCode,BankContactEmail,IsActive,BankVaultAccNumber
 from Banks where (BankCode=@bankcode)
GO
/****** Object:  StoredProcedure [dbo].[GetAllBanks]    Script Date: 12/29/2017 09:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetAllBanks]
as
Select BankName,BankCode,BankContactEmail,IsActive,BankVaultAccNumber
 from Banks
GO
/****** Object:  StoredProcedure [dbo].[GetAllBankAcounts]    Script Date: 12/29/2017 09:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetAllBankAcounts]
@Bankcode varchar(50)
AS

BEGIN TRY
BEGIN TRANSACTION Accounts
	Select A.AccountId,A.ProductType,A.BankCode,A.CurrencyCode,A.BranchCode,A.IsproductAccount,A.InterestRate ,A.AccNumber,A.AccType,A.IsActive,LastRunAccountDate
	from BankAccounts AS A
	WHERE A.BankCode=@Bankcode
COMMIT TRANSACTION Accounts
END TRY
BEGIN CATCH
ROLLBACK Transaction Accounts
  DECLARE
   @ErMessage NVARCHAR(2048),
   @ErSeverity INT,
   @ErState INT
 
 SELECT
   @ErMessage = ERROR_MESSAGE(),
   @ErSeverity = ERROR_SEVERITY(),
   @ErState = ERROR_STATE()
 
 RAISERROR (@ErMessage,
             @ErSeverity,
             @ErState )
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[GetAllActiveLoans]    Script Date: 12/29/2017 09:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetAllActiveLoans]
as
Select * from Loans where IsActive=1 and Status='APPROVED' and DATEDIFF(MINUTE,LastRepaymentDate,GETDATE())>=1
GO
/****** Object:  StoredProcedure [dbo].[GetAllAcount]    Script Date: 12/29/2017 09:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetAllAcount]
@BAnkCode varchar(50)
AS

BEGIN TRY
BEGIN TRANSACTION DAILYINTEREST
	Select AccNumber,BankCode,AccType,LastEOD=(select top 1 AccountingDate from AccountEODBalances AS E 
	where AccountNumber =AccNumber and BankCode=@BAnkCode order by AccountingDate desc)
	, LastAccountPeriod=(select top 1 AccountingPeriod from AccountEODBalances AS E 
	where AccountNumber =AccNumber and BankCode=@BAnkCode order by AccountingDate desc)
	from BankAccounts AS A
	WHERE BankCode=@BAnkCode and AccType not in ('INT_PAY_ACC','FX_INT_PAY_ACC','INT_EXP_ACC','FX_INT_EXP_ACC')
	Select AccNumber,BankCode,AccType,LastEOD=(select top 1 AccountingDate from AccountEODBalances AS E 
	where AccountNumber =AccNumber and BankCode=@BAnkCode order by AccountingDate desc)
	, LastAccountPeriod=(select top 1 AccountingPeriod from AccountEODBalances AS E 
	where AccountNumber =AccNumber and BankCode=@BAnkCode order by AccountingDate desc)
	from BankAccounts AS A
	WHERE BankCode=@BAnkCode and AccType in ('INT_PAY_ACC','FX_INT_PAY_ACC','INT_EXP_ACC','FX_INT_EXP_ACC')
COMMIT TRANSACTION DAILYINTEREST
END TRY
BEGIN CATCH
ROLLBACK Transaction DAILYINTEREST
  DECLARE
   @ErMessage NVARCHAR(2048),
   @ErSeverity INT,
   @ErState INT
 
 SELECT
   @ErMessage = ERROR_MESSAGE(),
   @ErSeverity = ERROR_SEVERITY(),
   @ErState = ERROR_STATE()
 
 RAISERROR (@ErMessage,
             @ErSeverity,
             @ErState )
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[GetAllAccountsPendingEODUsing]    Script Date: 12/29/2017 09:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetAllAccountsPendingEODUsing](@bankCode varchar(50))
as begin
	select AccountName,AccNumber,AccType, AccountCode,
	(Select top 1 OpeningBalance from AccountEODBalances where AccountNumber=ba.AccNumber order by AccountingDate desc) as OpeningBal,
	(Select top 1 ClosingBalance from AccountEODBalances where AccountNumber=ba.AccNumber order by AccountingDate desc) as ClosingBal,
	(Select top 1 AccountDate from AccountEODBalances where AccountNumber=ba.AccNumber order by RecordId desc) as LastEodDate
	from BankAccounts ba where AccType != 'HEADER_ACCOUNT' and (BankCode = @bankCode or @bankCode = '0')



end
GO
/****** Object:  StoredProcedure [dbo].[AccountEODBalances_SelectRow]    Script Date: 12/29/2017 09:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	AccountEODBalances_SelectRow
-- Author:	Nsubuga Kasozi
-- Create date:	5/12/2016 8:35:37 PM
-- Description:	This stored procedure is intended for selecting a specific row from AccountEODBalances table
-- ==========================================================================================
Create Procedure [dbo].[AccountEODBalances_SelectRow]
	@RecordId int
As
Begin
	Select *
	From AccountEODBalances
	Where
		[RecordId] = @RecordId
End
GO
/****** Object:  StoredProcedure [dbo].[AccountEODBalances_SelectAll]    Script Date: 12/29/2017 09:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	AccountEODBalances_SelectAll
-- Author:	Nsubuga Kasozi
-- Create date:	5/12/2016 8:35:36 PM
-- Description:	This stored procedure is intended for selecting all rows from AccountEODBalances table
-- ==========================================================================================
Create Procedure [dbo].[AccountEODBalances_SelectAll]
As
Begin
	Select *
	From AccountEODBalances
End
GO
/****** Object:  StoredProcedure [dbo].[Accounts_SelectAll]    Script Date: 12/29/2017 09:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Accounts_SelectAll]ASSET NOCOUNT ONSELECT * FROM BankAccounts Ainner join UsersToAccounts B on A.AccNumber=B.AccountNumberSET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[Accounts_Insert]    Script Date: 12/29/2017 09:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Accounts_Insert]
@AccountId varchar(50),	@AccBalance money,	@AccNumber varchar(50),	@AccType varchar(50),	@BankCode varchar(50),	@ModifiedBy varchar(50),	@BranchCode varchar(50),	@IsActive bit,	@CurrencyCode varchar(50),	@ApprovedBy varchar(50)ASBEGIN TRANSACTION CreateAccountBEGIN TRYIF not exists(select * from BankAccounts where AccNumber=@AccNumber and BankCode=@BankCode)BEGIN	INSERT INTO BankAccounts (		[AccNumber],		[AccType],		BankCode,		CreatedOn,		ModifiedOn,		CreatedBy,		ModifiedBy,		BranchCode,		IsActive,		CurrencyCode,		ApprovedBy	)	VALUES (		@AccNumber,		@AccType,		@BankCode,		GETDATE(),		GETDATE(),		@ModifiedBy,		@ModifiedBy,		@BranchCode,		@IsActive,		@CurrencyCode,		@ApprovedBy	)		SELECT @AccNumber As InsertedID	ENDCOMMIT TRANSACTION CreateAccountEND TRYBEGIN CATCH
ROLLBACK Transaction CreateAccount

  DECLARE
   @ErMessage NVARCHAR(2048),
   @ErSeverity INT,
   @ErState INT
 
 SELECT
   @ErMessage = ERROR_MESSAGE(),
   @ErSeverity = ERROR_SEVERITY(),
   @ErState = ERROR_STATE()
 
 RAISERROR (@ErMessage,
             @ErSeverity,
             @ErState )END CATCH
GO
/****** Object:  StoredProcedure [dbo].[Accounts_DeleteRow]    Script Date: 12/29/2017 09:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Accounts_DeleteRow]	@AccountId intASSET NOCOUNT ONDELETE FROM BankAccountsWHERE [AccountId] = @AccountIdSET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[PasswordTracker_Update]    Script Date: 12/29/2017 09:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	PasswordTrack_Update
-- Author:	Albert Luganga
-- Create date:	03/29/2017 17:49:01 PM
-- Description:	This stored procedure is intended for logging every password change
-- ==========================================================================================
CREATE Procedure [dbo].[PasswordTracker_Update]
	@UserId varchar(50),
	@Password varchar(50),
	@Initiator varchar(50),
	@IP varchar(50)
As
Begin
	insert into PasswordChangeLog
	      (OldPassword,UserId,IP,InitiatedBy,RecordDate)
	values(@Password,@UserId,@IP,@Initiator,GETDATE())
End
GO
/****** Object:  StoredProcedure [dbo].[PasswordTrack_Update]    Script Date: 12/29/2017 09:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	PasswordTrack_Update
-- Author:	Albert Luganga
-- Create date:	03/27/2017 15:57:20 PM
-- Description:	This stored procedure is intended for logging every password change
-- ==========================================================================================
CREATE Procedure [dbo].[PasswordTrack_Update]
	@UserId varchar(50),
	@Password varchar(50),
	@Initiator varchar(50),
	@IP varchar(50)
As
Begin
	insert into PasswordChangeLog
	      (OldPassword,UserId,IP,InitiatedBy,RecordDate)
	values(@Password,@UserId,@IP,@Initiator,GETDATE())
End
GO
/****** Object:  StoredProcedure [dbo].[PasswordTrack_SelectRow]    Script Date: 12/29/2017 09:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	PasswordTrack_Update
-- Author:	Albert Luganga
-- Create date:	03/27/2017 15:57:20 PM
-- Description:	This stored procedure is intended for getting last password change
-- ==========================================================================================
CREATE Procedure [dbo].[PasswordTrack_SelectRow]
	@UserId varchar(50),
	@Password varchar(50)
As
Begin
    select top 1 RecordDate from PasswordChangeLog	
    where UserId=@UserId and OldPassword=@Password
    order by RecordDate desc
End
GO
/****** Object:  StoredProcedure [dbo].[UserTypes_Update]    Script Date: 12/29/2017 09:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	UserTypes_Update
-- Author:	Nsubuga Kasozi
-- Create date:	12/21/2015 3:55:14 PM
-- Description:	This stored procedure is intended for updating UserTypes table
-- ==========================================================================================
CREATE Procedure [dbo].[UserTypes_Update]
	@UserTypeId varchar(50),
	@UserType varchar(50),
	@Role varchar(50),
	@Description varchar(50),
	@BankCode varchar(50),
	@ModifiedBy varchar(50)
As
Begin transaction trans
Begin try
IF not exists(Select * from UserTypes where UserType=@UserType and BankCode=@BankCode)
Begin
	Insert Into UserTypes
		([UserType],[Role],[Description],BankCode,CreatedBy,ModifiedBy,CreatedOn,ModifiedOn)
	Values
		(@UserType,@Role,@Description,@BankCode,@ModifiedBy,@ModifiedBy,GETDATE(),GETDATE())
	Select @UserType as InsertedId
End
Begin
	Update UserTypes
	Set
		[UserType] = @UserType,
		[Role] = @Role,
		[Description] = @Description,
		BankCode=@BankCode,
		ModifiedOn=GETDATE(),
		ModifiedBy=@ModifiedBy
	Where		
		 UserType=@UserType and BankCode=@BankCode
	Select @UserType as InsertedId

End
---------------------------------------------------------------------
Commit Transaction Trans

END TRY
BEGIN CATCH

ROLLBACK Transaction Trans

  DECLARE
   @ErMessage NVARCHAR(2048),
   @ErSeverity INT,
   @ErState INT
 
 SELECT
   @ErMessage = ERROR_MESSAGE(),
   @ErSeverity = ERROR_SEVERITY(),
   @ErState = ERROR_STATE()
 
 RAISERROR (@ErMessage,
             @ErSeverity,
             @ErState )
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[UserTypes_SelectRow]    Script Date: 12/29/2017 09:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	UserTypes_SelectRow
-- Author:	Nsubuga Kasozi
-- Create date:	12/21/2015 3:55:13 PM
-- Description:	This stored procedure is intended for selecting a specific row from UserTypes table
-- ==========================================================================================
CREATE Procedure [dbo].[UserTypes_SelectRow]
	@UserType varchar(50),
	@BankCode varchar(50)
	as
Begin
	Select 
	*
	From UserTypes
	Where UserType=@UserType and BankCode=@BankCode
		
End
GO
/****** Object:  StoredProcedure [dbo].[UserTypes_SelectAll]    Script Date: 12/29/2017 09:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	UserTypes_SelectAll
-- Author:	Nsubuga Kasozi
-- Create date:	12/21/2015 3:55:13 PM
-- Description:	This stored procedure is intended for selecting all rows from UserTypes table
-- ==========================================================================================
CREATE Procedure [dbo].[UserTypes_SelectAll]
@BankCode varchar(50)
As
Begin
	Select 
		*
	From UserTypes where BankCode=@BankCode
End
GO
/****** Object:  StoredProcedure [dbo].[UserTypes_Insert]    Script Date: 12/29/2017 09:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	UserTypes_Insert
-- Author:	Nsubuga Kasozi
-- Create date:	12/21/2015 3:55:13 PM
-- Description:	This stored procedure is intended for inserting values to UserTypes table
-- ==========================================================================================
Create Procedure [dbo].[UserTypes_Insert]
	@UserType varchar(50),
	@Role varchar(50),
	@Description varchar(50)
As
Begin
	Insert Into UserTypes
		([UserType],[Role],[Description])
	Values
		(@UserType,@Role,@Description)

	Declare @ReferenceID int
	Select @ReferenceID = @@IDENTITY

	Return @ReferenceID

End
GO
/****** Object:  StoredProcedure [dbo].[UserTypes_DeleteRow]    Script Date: 12/29/2017 09:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	UserTypes_DeleteRow
-- Author:	Nsubuga Kasozi
-- Create date:	12/21/2015 3:55:14 PM
-- Description:	This stored procedure is intended for deleting a specific row from UserTypes table
-- ==========================================================================================
Create Procedure [dbo].[UserTypes_DeleteRow]
	@UserTypeId int
As
Begin
	Delete UserTypes
	Where
		[UserTypeId] = @UserTypeId

End
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetCustRef]    Script Date: 12/29/2017 09:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[fn_GetCustRef](@TranID varchar(50))
  RETURNS varchar(50)
      AS
    BEGIN
		DECLARE @res varchar(50)
		Select top 1 @res=CustRef from PaymentsGatewayRequests where TransactionRef=@TranID
		return @res
    END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetCustomerName]    Script Date: 12/29/2017 09:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[fn_GetCustomerName](@reference varchar(50),@acctCode varchar(50))
  RETURNS varchar(50)
      AS
    BEGIN
		DECLARE @res varchar(50)
		
		
		SET @res=(
				select CustomerName  from MerchantCustomers 
				where CustomerRef=@reference and AccountCode=@acctCode
			)
		if @res=''
		   set @res=@reference
	    
		return @res
    END
GO
/****** Object:  StoredProcedure [dbo].[Collaterals_Update]    Script Date: 12/29/2017 09:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[Collaterals_Update]
	@CollateralId varchar(50),
	@CollateralType varchar(50),
	@TitleOfOwnershipName varchar(50),
	@PathToTitleOfOwnershipPic varchar(50),
	@OwnerId varchar(50),
	@BankCode varchar(50),
	@ValueOfCollateral money,
	@ModifiedBy varchar(50),
	@LoanID varchar(50)
As
BEGIN TRANSACTION UpdaterBEGIN TRY
if exists(Select * from Collaterals where CollateralId=@CollateralId and BankCode=@BankCode and LoanID=@LoanID)
Begin
	Update Collaterals
	Set
		[CollateralType] = @CollateralType,
		[TitleOfOwnershipName] = @TitleOfOwnershipName,
		[PathToTitleOfOwnershipPic] = @PathToTitleOfOwnershipPic,
		[OwnerId] = @OwnerId,
		[ValueOfCollateral] = @ValueOfCollateral,
		[ModifiedBy] = @ModifiedBy,
		[ModifiedOn] = GETDATE()
	Where		
		[CollateralId] = @CollateralId and [BankCode] = @BankCode and LoanID=@LoanID
		
		Select @CollateralId as InsertedID
End

Else
Begin
	Insert Into Collaterals
		([CollateralId],
		[CollateralType],
		[TitleOfOwnershipName],
		[PathToTitleOfOwnershipPic],
		[OwnerId],
		[BankCode],
		[ValueOfCollateral],
		[ModifiedBy],
		[ModifiedOn],
		[CreatedBy],
		[CreatedOn],
		LoanID)
	Values
		(@CollateralId,
		@CollateralType,
		@TitleOfOwnershipName,
		@PathToTitleOfOwnershipPic,
		@OwnerId,
		@BankCode,
		@ValueOfCollateral,
		@ModifiedBy,
		GETDATE(),
		@ModifiedBy,
		GETDATE(),
		@LoanID)

	Select @CollateralId as InsertedID
EndCOMMIT TRANSACTION UpdaterEND TRYBEGIN CATCH
ROLLBACK Transaction Updater

  DECLARE
   @ErMessage NVARCHAR(2048),
   @ErSeverity INT,
   @ErState INT
 
 SELECT
   @ErMessage = ERROR_MESSAGE(),
   @ErSeverity = ERROR_SEVERITY(),
   @ErState = ERROR_STATE()
 
 RAISERROR (@ErMessage,
             @ErSeverity,
             @ErState )END CATCH
GO
/****** Object:  StoredProcedure [dbo].[Collaterals_SelectAll]    Script Date: 12/29/2017 09:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	Collaterals_SelectAll
-- Author:	Nsubuga Kasozi
-- Create date:	3/30/2016 9:04:22 AM
-- Description:	This stored procedure is intended for selecting all rows from Collaterals table
-- ==========================================================================================
Create Procedure [dbo].[Collaterals_SelectAll]
As
Begin
	Select *
	From Collaterals
End
GO
/****** Object:  StoredProcedure [dbo].[CheckIfItViolatesRules]    Script Date: 12/29/2017 09:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[CheckIfItViolatesRules]
@BankCode varchar(50),
@BranchCode varchar(50),
@UserId varchar(50),
@Amount varchar(50)
As
Begin
	Select 
		*
	From TransactionRules
	Where
		BankCode=@BankCode and 
		(BranchCode=@BranchCode or BranchCode='ALL') and 
		(UserId=@UserId or UserId='ALL') and
		(MinimumAmount>@Amount or MaximumAmount<@Amount)
End
GO
/****** Object:  StoredProcedure [dbo].[CheckIfChargeLiesWithinOtherTierRange]    Script Date: 12/29/2017 09:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[CheckIfChargeLiesWithinOtherTierRange]
@BankCode varchar(50),
@Chargecode varchar(50),
@MinValue varchar(50),
@MaxValue varchar(50)
as
if(@MaxValue!='INFINITY')
Begin
Select * from BankCharges where
BankCode=@BankCode and 
ChargeCode=@Chargecode and 
(
((@MinValue between MinimumValue And MaximumValue))
or
((@MaxValue between MinimumValue And MaximumValue))
)
End
Else
Begin
	Select * from BankCharges where
	BankCode=@BankCode and 
	ChargeCode=@Chargecode and 
	MaximumValue='INIFINITY'
End
GO
/****** Object:  StoredProcedure [dbo].[CheckForValidUserAccessToPage]    Script Date: 12/29/2017 09:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[CheckForValidUserAccessToPage]
@usertype varchar(50),
@page varchar(50),
@bankcode varchar(50)
as
Select * from UserAccessRules where 
(UserType=@usertype or UserType='ALL') and 
Page=@page and 
(BankCode='ALL' or BankCode=@bankcode)
GO
/****** Object:  StoredProcedure [dbo].[CheckForReversedTransaction]    Script Date: 12/29/2017 09:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[CheckForReversedTransaction]
@Bankref varchar(50),
@BankCode varchar(50)
as 
Select top 1 * from GeneralLedgerTable with(nolock) where 
ChequeNumber=@Bankref and BankCode=@BankCode and TranCategory='REVERSAL'
GO
/****** Object:  StoredProcedure [dbo].[CheckForReversedPaymentGatewayTransaction]    Script Date: 12/29/2017 09:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[CheckForReversedPaymentGatewayTransaction]
@OriginalVendorId  varchar(50),
@MerchantId varchar(50)
as
Select top 1 * from PaymentsGatewayRequests where MerchantCode=@MerchantId and ItemDesc=@OriginalVendorId
and Status!='FAILED'
GO
/****** Object:  StoredProcedure [dbo].[ChargeTypes_Update]    Script Date: 12/29/2017 09:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[ChargeTypes_Update]
@ChargeTypeCode varchar(50),
@ChargeTypeName varchar(50),
@ModifiedBy varchar(50),
@BankCode varchar(50),
@Description varchar(50),
@IsActive bit
as
Begin Transaction trans
Begin try
If exists(select * from ChargeTypes where ChargeTypeCode=@ChargeTypeCode and BankCode=@BankCode)
	Begin
		Update ChargeTypes set ChargeTypeName=@ChargeTypeName,ModifiedOn=GETDATE(),
		ModifiedBy=@ModifiedBy,Description=@Description,IsActive=@IsActive
		where ChargeTypeCode=@ChargeTypeCode and BankCode=@BankCode
		Select @ChargeTypeCode as InsertedId
	End
Else
	Begin
		INSERT INTO [ChargeTypes]
				   ([ChargeTypeCode]
				   ,[ChargeTypeName]
				   ,[CreatedOn]
				   ,[ModifiedOn]
				   ,[CreatedBy]
				   ,[ModifiedBy]
				   ,[BankCode]
				   ,Description
				   ,IsActive)
			 VALUES
				   (@ChargeTypeCode,
					@ChargeTypeName,
					GETDATE(),
					GETDATE(),
					@ModifiedBy,
					@ModifiedBy,
					@BankCode,
					@Description,
					@IsActive)
		Select @ChargeTypeCode as InsertedId
	End
---------------------------------------------------------------------
Commit Transaction Trans

END TRY
BEGIN CATCH

ROLLBACK Transaction Trans

  DECLARE
   @ErMessage NVARCHAR(2048),
   @ErSeverity INT,
   @ErState INT
 
 SELECT
   @ErMessage = ERROR_MESSAGE(),
   @ErSeverity = ERROR_SEVERITY(),
   @ErState = ERROR_STATE()
 
 RAISERROR (@ErMessage,
             @ErSeverity,
             @ErState )
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[ChargeTypes_SelectRow]    Script Date: 12/29/2017 09:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	Charges_SelectRow
-- Author:	Nsubuga Kasozi
-- Create date:	12/21/2015 8:37:16 AM
-- Description:	This stored procedure is intended for selecting a specific row from Charges table
-- ==========================================================================================
create Procedure [dbo].[ChargeTypes_SelectRow]
	@ChargeType varchar(50),
	@BankCode varchar(50)
As
Begin
	Select 
	*
	From ChargeTypes
	Where
		ChargeTypeCode=@ChargeType and BankCode=@BankCode
End
GO
/****** Object:  StoredProcedure [dbo].[Charges_Update]    Script Date: 12/29/2017 09:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	Charges_Update
-- Author:	Nsubuga Kasozi
-- Create date:	12/21/2015 8:37:16 AM
-- Description:	This stored procedure is intended for updating Charges table
-- ==========================================================================================
CREATE Procedure [dbo].[Charges_Update]
	@BankCode varchar(50),
	@ChargeName varchar(50),
    @ChargeCode varchar(50),
	@ChargeAmount decimal(18,2),
	@CommissionAccount varchar(50),
	@MinimumAmount varchar(50),
	@MaximumAmount varchar(50),
    @ChargeType varchar(50),
    @ModifiedBy varchar(50),
    @IsActive bit,
    @SbuPercentage decimal(18,2),
    @PegasusPercentage decimal(18,2),
    @TaxPercentage decimal(18,2)
As
Begin Transaction trans
Begin try
if not exists(Select * from BankCharges where BankCode=@BankCode and ChargeCode=@ChargeCode and MinimumValue=@MinimumAmount and MaximumValue=@MaximumAmount)
	Begin
		Insert Into BankCharges
				([ChargeAmount],BankCode,ModifiedBy,ModifiedOn,ChargeName,ChargeCode,CreatedOn,CreatedBy,IsActive,MinimumValue,MaximumValue,ChargeType,SbuPercentage,PegasusPercentage,TaxPercentage)
			Values
				(@ChargeAmount,@BankCode,@ModifiedBy,GETDATE(),@ChargeName,@ChargeCode,GETDATE(),@ModifiedBy,@IsActive,@MinimumAmount,@MaximumAmount,@ChargeType,@SbuPercentage,@PegasusPercentage,@TaxPercentage)
				
		Select  @ChargeCode as InsertedId
		
	End
Else
	Begin
		Update BankCharges
		Set
			[ChargeAmount] = @ChargeAmount,
			[BankCode] = @BankCode,
			ModifiedBy=@ModifiedBy,
			ModifiedOn=GETDATE(),
			ChargeName=@ChargeName,
			ChargeCode=@ChargeCode,
			IsActive=@IsActive,
			ChargeType=@ChargeType,
			SbuPercentage=@SbuPercentage,
			PegasusPercentage=@PegasusPercentage,
			TaxPercentage=@TaxPercentage
		Where		
			ChargeCode=@ChargeCode and BankCode=@BankCode and MinimumValue=@MinimumAmount and MaximumValue=@MaximumAmount
			
			Select  @ChargeCode as InsertedId

	End
---------------------------------------------------------------------
Commit Transaction Trans

END TRY
BEGIN CATCH

ROLLBACK Transaction Trans

  DECLARE
   @ErMessage NVARCHAR(2048),
   @ErSeverity INT,
   @ErState INT
 
 SELECT
   @ErMessage = ERROR_MESSAGE(),
   @ErSeverity = ERROR_SEVERITY(),
   @ErState = ERROR_STATE()
 
 RAISERROR (@ErMessage,
             @ErSeverity,
             @ErState )
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[Charges_SelectRow]    Script Date: 12/29/2017 09:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	Charges_SelectRow
-- Author:	Nsubuga Kasozi
-- Create date:	12/21/2015 8:37:16 AM
-- Description:	This stored procedure is intended for selecting a specific row from Charges table
-- ==========================================================================================
CREATE Procedure [dbo].[Charges_SelectRow]
	@ChargeCode varchar(50),
	@BankCode varchar(50)
As
Begin
	Select 
	*
	From BankCharges
	Where
		ChargeCode = @ChargeCode and BankCode=@BankCode
End
GO
/****** Object:  StoredProcedure [dbo].[AccountTypes_Update]    Script Date: 12/29/2017 09:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	AccountTypes_Update
-- Author:	Nsubuga Kasozi
-- Create date:	1/3/2016 8:59:16 PM
-- Description:	This stored procedure is intended for updating AccountTypes table
-- ==========================================================================================
CREATE Procedure [dbo].[AccountTypes_Update]
	@AccTypeId varchar(50),
	@AccTypeName varchar(50),
	@AccTypeCode varchar(50),
	@MinimumBal money,
	@BankCode varchar(50),
	@Description varchar(150),
	@ModifiedBy varchar(50),
	@IsActive bit,
	@MinSignatories int,
	@MaxSignatories int,
	@AccountCategory varchar(50),
	@InterestRateType varchar(50),
	@InterestRate decimal(18,2),
	@InterestPayOutFreq varchar(50)
As
Begin Transaction Trans
Begin try
if exists(Select * from AccountTypes where BankCode=@BankCode and AccTypeCode=@AccTypeCode)
Begin
	Update AccountTypes
	Set
		[AccTypeName] = @AccTypeName,
		[AccTypeCode] = @AccTypeCode,
		[MinimumBal] = @MinimumBal,
		AccountCategory=@AccountCategory,
		[BankCode] = @BankCode,
		Description=@Description,
		ModifiedBy=@ModifiedBy,
		ModifiedOn=GETDATE(),
		IsActive=@IsActive,
		MinNumberOfSignatories=@MinSignatories,
		MaxNumberOfSignatories=@MaxSignatories,
		InterestRateType=@InterestRateType,
		InterestRate=@InterestRate,
		InterestPayOutFrequency=@InterestPayOutFreq
	Where		
		BankCode=@BankCode and AccTypeCode=@AccTypeCode
		
		Select @AccTypeCode as InseretedId
End
Else
Begin
	Insert Into AccountTypes
		([AccTypeName],[AccTypeCode],[MinimumBal],[BankCode],
		 Description,ModifiedBy,CreatedBy,ModifiedOn,CreatedOn,
		 IsActive,MinNumberOfSignatories,MaxNumberOfSignatories,
		 AccountCategory,InterestRateType,InterestRate,InterestPayOutFrequency)
	Values
		(@AccTypeName,@AccTypeCode,@MinimumBal,@BankCode,
		 @Description,@ModifiedBy,@ModifiedBy,GETDATE(),GETDATE(),
		 @IsActive,@MinSignatories,@MaxSignatories,
		 @AccountCategory,@InterestRateType,@InterestRate,@InterestPayOutFreq)

	select @AccTypeCode as InsertedId
End
---------------------------------------------------------------------
Commit Transaction Trans

END TRY
BEGIN CATCH

ROLLBACK Transaction Trans

  DECLARE
   @ErMessage NVARCHAR(2048),
   @ErSeverity INT,
   @ErState INT
 
 SELECT
   @ErMessage = ERROR_MESSAGE(),
   @ErSeverity = ERROR_SEVERITY(),
   @ErState = ERROR_STATE()
 
 RAISERROR (@ErMessage,
             @ErSeverity,
             @ErState )
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[AccountTypes_SelectRow]    Script Date: 12/29/2017 09:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	AccountTypes_SelectRow
-- Author:	Nsubuga Kasozi
-- Create date:	1/3/2016 8:59:16 PM
-- Description:	This stored procedure is intended for selecting a specific row from AccountTypes table
-- ==========================================================================================
CREATE Procedure [dbo].[AccountTypes_SelectRow]
	@AccTypeCode varchar(50),
	@BankCode varchar(50)
As
Begin
	Select 
		*
	From AccountTypes
	Where AccTypeCode=@AccTypeCode and BankCode=@BankCode
	 
End
GO
/****** Object:  StoredProcedure [dbo].[AccountTypes_SelectAll]    Script Date: 12/29/2017 09:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	AccountTypes_SelectAll
-- Author:	Nsubuga Kasozi
-- Create date:	1/3/2016 8:59:16 PM
-- Description:	This stored procedure is intended for selecting all rows from AccountTypes table
-- ==========================================================================================
Create Procedure [dbo].[AccountTypes_SelectAll]
As
Begin
	Select *
	From AccountTypes
End
GO
/****** Object:  StoredProcedure [dbo].[AccountTypes_Insert]    Script Date: 12/29/2017 09:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	AccountTypes_Insert
-- Author:	Nsubuga Kasozi
-- Create date:	1/3/2016 8:59:16 PM
-- Description:	This stored procedure is intended for inserting values to AccountTypes table
-- ==========================================================================================
Create Procedure [dbo].[AccountTypes_Insert]
	@AccTypeName varchar(50),
	@AccTypeCode varchar(50),
	@MinimumBal money,
	@BankCode varchar(50),
	@IsDebitable bit
As
Begin
	Insert Into AccountTypes
		([AccTypeName],[AccTypeCode],[MinimumBal],[BankCode],[IsDebitable])
	Values
		(@AccTypeName,@AccTypeCode,@MinimumBal,@BankCode,@IsDebitable)

	Declare @ReferenceID int
	Select @ReferenceID = @@IDENTITY

	Return @ReferenceID

End
GO
/****** Object:  StoredProcedure [dbo].[AccountTypes_DeleteRow]    Script Date: 12/29/2017 09:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	AccountTypes_DeleteRow
-- Author:	Nsubuga Kasozi
-- Create date:	1/3/2016 8:59:16 PM
-- Description:	This stored procedure is intended for deleting a specific row from AccountTypes table
-- ==========================================================================================
Create Procedure [dbo].[AccountTypes_DeleteRow]
	@AccTypeId int
As
Begin
	Delete AccountTypes
	Where
		[AccTypeId] = @AccTypeId

End
GO
/****** Object:  StoredProcedure [dbo].[CustomersToAccounts_Insert]    Script Date: 12/29/2017 09:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[CustomersToAccounts_Insert]
@UserId varchar(50),
@AccountNumber varchar(50),
@BankCode varchar(50)
as
if not exists(select * from CustomersToAccountsMapping where CustomerId=@UserId and AccountNumber=@AccountNumber and BankCode=@BankCode)
Begin
INSERT INTO CustomersToAccountsMapping
           (CustomerId
           ,[AccountNumber]
           ,[BankCode]
           ,CreatedOn)
     VALUES
           (@UserId
           ,@AccountNumber
           ,@BankCode
           ,GETDATE())
End
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetOpeningBalance]    Script Date: 12/29/2017 09:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[fn_GetOpeningBalance](@BankCode varchar(50),@AccountNumber varchar(50),@BalDate varchar(50))
  RETURNS varchar(50)
      AS
    BEGIN
		DECLARE @Balance varchar(50)
		declare @AccDate bigInt
		declare @ClosingBalance varchar(50)
		declare @OpeningBalance varchar(50)
		declare @DateDiff int

		select top 1 @AccDate = ISNULL((AccountingDate),'0'), @OpeningBalance = OpeningBalance, @ClosingBalance = ClosingBalance
		from AccountEODBalances 
		where AccountNumber = @AccountNumber and BankCode=@BankCode
		and AccountingDate<=@BalDate
		order by AccountingDate desc
		
		if (exists(select top 1 RecordId from AccountEODBalances where BankCode=@BankCode and AccountNumber = @AccountNumber and AccountingDate<=@BalDate))
		BEGIN
			if(@AccDate<@BalDate)
					--select 'YES'
			BEGIN
			SET @OpeningBalance=(select ISNULL( @ClosingBalance,0)+ ISNULL( SUM(TranAmountInAccountCurrency),0)
		from GeneralLedgerTable 
		where BankCode=@BankCode and AccountNumber = @AccountNumber and AccountingDate < @BalDate)
			END
			else
			BEGIN
				select @OpeningBalance = OpeningBalance
				from AccountEODBalances 
				where BankCode=@BankCode and AccountNumber = @AccountNumber and AccountingDate = @AccDate
				order by AccountingDate desc
			END
		END
		ELSE
		BEGIN
			SET @OpeningBalance ='0'
		END
		return @OpeningBalance
    END
GO
/****** Object:  StoredProcedure [dbo].[SystemSettings_Update]    Script Date: 12/29/2017 09:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	SystemSettings_Update
-- Author:	Nsubuga Kasozi
-- Create date:	4/14/2016 12:41:16 AM
-- Description:	This stored procedure is intended for updating SystemSettings table
-- ==========================================================================================
CREATE Procedure [dbo].[SystemSettings_Update]
	@BankCode varchar(50),
	@SettingCode varchar(50),
	@SettingValue varchar(50),
	@ModifiedBy varchar(50)
As
If exists(select * from SystemSettings where BankCode=@BankCode and SettingCode=@SettingCode)
Begin
	Update SystemSettings
	Set
		[SettingValue] = @SettingValue,
		[ModifiedBy] = @ModifiedBy,
		[CreatedBy] = @ModifiedBy,
		[ModifiedOn] = GETDATE()
	Where		
		BankCode=@BankCode and SettingCode=@SettingCode
		
		Select @SettingCode as InsertedID
End
Else
Begin
	Insert Into SystemSettings
		([BankCode],[SettingCode],[SettingValue],[ModifiedBy],[CreatedBy],[ModifiedOn],[CreatedOn])
	Values
		(@BankCode,@SettingCode,@SettingValue,@ModifiedBy,@ModifiedBy,GETDATE(),GETDATE())

	Select @SettingCode as InsertedID
End
GO
/****** Object:  StoredProcedure [dbo].[SystemSettings_SelectRow2]    Script Date: 12/29/2017 09:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[SystemSettings_SelectRow2]
@BankCode varchar(50),
@SettingCode varchar(50)
	
As
Begin
	Select 
	SettingCode as Id,SettingValue,BankCode,CreatedBy,ModifiedOn,CreatedOn
	From SystemSettings
	Where BankCode=@BankCode and 
	(SettingCode=@SettingCode or @SettingCode='')
End
GO
/****** Object:  StoredProcedure [dbo].[SystemSettings_SelectRow]    Script Date: 12/29/2017 09:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	SystemSettings_SelectRow
-- Author:	Nsubuga Kasozi
-- Create date:	4/14/2016 12:41:16 AM
-- Description:	This stored procedure is intended for selecting a specific row from SystemSettings table
-- ==========================================================================================
CREATE Procedure [dbo].[SystemSettings_SelectRow]
@BankCode varchar(50),
@SettingCode varchar(50)
	
As
Begin
	Select 
	*
	From SystemSettings
	Where (BankCode=@BankCode or BankCode='ALL') and 
	(SettingCode=@SettingCode or @SettingCode='')
End
GO
/****** Object:  StoredProcedure [dbo].[SystemSettings_SelectAll]    Script Date: 12/29/2017 09:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	SystemSettings_SelectAll
-- Author:	Nsubuga Kasozi
-- Create date:	4/14/2016 12:41:16 AM
-- Description:	This stored procedure is intended for selecting all rows from SystemSettings table
-- ==========================================================================================
Create Procedure [dbo].[SystemSettings_SelectAll]
As
Begin
	Select 
	*
	From SystemSettings
End
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetStatement]    Script Date: 12/29/2017 09:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[fn_GetStatement](@BankCode varchar(50),@AccountNumber varchar(50),@StartDate varchar(50), @EndDate varchar(50),@OpeningBal money)
  RETURNS @Statement TABLE
  (
		RecordId BigInt,
		AccountCode varchar(50),
		AccountNumber varchar(50),
		CustomerRef varchar(50),
		VendorTranId varchar(50),
		AccountType varchar(50),
		TranAmount money,
		TranType varchar(50),
		PaymentDate date,
		Description varchar(50),
		Credit varchar(50),
		Debit varchar(50),
		Balance money
  )
      AS
    BEGIN
		INSERT @Statement
		SELECT A.* FROM ((SELECT 0 AS RecordId,'' AS AccountCode, '' AS AccountNumber,'' as CustomerRef,'' as VendorTranId,'' AS AccountType,@OpeningBal AS TranAmount, '' AS TranType,@StartDate AS PaymentDate,'Opening Balance' AS Description,'' AS Credit, '' AS Debit,@OpeningBal AS balance )
		UNION
		(SELECT V.RecordId,B.AccountCode, V.AccountNumber,V.CustomerRef,V.PegPayTranId, V.CurrencyCode,V.TranAmountInAccountCurrency,V.TranType, V.PaymentDate,V.Narration AS Description
		,CASE WHEN V.TranType= 'Credit' THEN PARSENAME(CONVERT(VarChar(50), ISNULL(V.TranAmount, 0), 1), 2) ELSE '' END AS Credit
		,CASE WHEN V.TranType= 'Debit' THEN PARSENAME(CONVERT(VarChar(50), ISNULL(V.TranAmount, 0), 1), 2) ELSE '' END AS Debit,0 AS Balance
		FROM GeneralLedgerTable AS V 
		--INNER JOIN
		--AccountDetails AS AD on AD.Account=V.AccountNumber 
		--INNER JOIN
		--AccountTypes AS A on AD.AccountType=A.AccountType
		--INNER JOIN
		--TranType AS T ON V.PaymentType=T.TypeCode
		inner Join 
		BankAccounts AS B on B.AccNumber=V.AccountNumber
		WHERE V.BankCode=@BankCode and V.AccountNumber = @AccountNumber and V.AccountingDate >= @StartDate and V.AccountingDate <= @EndDate)) A
		RETURN 
    END
GO
/****** Object:  StoredProcedure [dbo].[CollateralTypes_Update]    Script Date: 12/29/2017 09:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	CollateralTypes_Update
-- Author:	Nsubuga Kasozi
-- Create date:	4/1/2016 2:41:54 PM
-- Description:	This stored procedure is intended for updating CollateralTypes table
-- ==========================================================================================
CREATE Procedure [dbo].[CollateralTypes_Update]
	@CollateralTypeCode varchar(50),
	@CollateralTypeName varchar(50),
	@BankCode varchar(50),
	@ModifiedBy varchar(50)
As
If exists(Select * from CollateralTypes where CollateralTypeCode=@CollateralTypeCode and BankCode=@BankCode)
Begin
	Update CollateralTypes
	Set
		[CollateralTypeName] = @CollateralTypeName,
		[ModifiedBy] = @ModifiedBy,
		[ModifiedOn] = GETDATE()
	Where		
		 CollateralTypeCode=@CollateralTypeCode and BankCode=@BankCode
		 
    Select @CollateralTypeCode as InsertedID
End
Else
Begin
	Insert Into CollateralTypes
		([CollateralTypeCode],[CollateralTypeName],[BankCode],[ModifiedBy],[CreatedBy],[ModifiedOn],[CreatedOn])
	Values
		(@CollateralTypeCode,@CollateralTypeName,@BankCode,@ModifiedBy,@ModifiedBy,GETDATE(),GETDATE())

	Select @CollateralTypeCode as InsertedID
End
GO
/****** Object:  StoredProcedure [dbo].[CollateralTypes_SelectRow]    Script Date: 12/29/2017 09:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	CollateralTypes_SelectRow
-- Author:	Nsubuga Kasozi
-- Create date:	4/1/2016 2:41:54 PM
-- Description:	This stored procedure is intended for selecting a specific row from CollateralTypes table
-- ==========================================================================================
Create Procedure [dbo].[CollateralTypes_SelectRow]
	@typeCode varchar(50),
	@BankCode varchar(50)
As
Begin
	Select 
		*
	From CollateralTypes
	Where
		CollateralTypeCode=@typeCode and BankCode=@BankCode
End
GO
/****** Object:  StoredProcedure [dbo].[CollateralTypes_SelectAll]    Script Date: 12/29/2017 09:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	CollateralTypes_SelectAll
-- Author:	Nsubuga Kasozi
-- Create date:	4/1/2016 2:41:54 PM
-- Description:	This stored procedure is intended for selecting all rows from CollateralTypes table
-- ==========================================================================================
Create Procedure [dbo].[CollateralTypes_SelectAll]
As
Begin
	Select 
		*
	From CollateralTypes
End
GO
/****** Object:  StoredProcedure [dbo].[CollateralTypes_Insert]    Script Date: 12/29/2017 09:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	CollateralTypes_Insert
-- Author:	Nsubuga Kasozi
-- Create date:	4/1/2016 2:41:54 PM
-- Description:	This stored procedure is intended for inserting values to CollateralTypes table
-- ==========================================================================================
Create Procedure [dbo].[CollateralTypes_Insert]
	@CollateralTypeCode varchar(50),
	@CollateralTypeName varchar(50),
	@BankCode varchar(50),
	@ModifiedBy varchar(50),
	@CreatedBy varchar(50),
	@ModifiedOn varchar(50),
	@CreatedOn varchar(50)
As
Begin
	Insert Into CollateralTypes
		([CollateralTypeCode],[CollateralTypeName],[BankCode],[ModifiedBy],[CreatedBy],[ModifiedOn],[CreatedOn])
	Values
		(@CollateralTypeCode,@CollateralTypeName,@BankCode,@ModifiedBy,@CreatedBy,@ModifiedOn,@CreatedOn)

	Declare @ReferenceID int
	Select @ReferenceID = @@IDENTITY

	Return @ReferenceID

End
GO
/****** Object:  StoredProcedure [dbo].[CollateralTypes_DeleteRow]    Script Date: 12/29/2017 09:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	CollateralTypes_DeleteRow
-- Author:	Nsubuga Kasozi
-- Create date:	4/1/2016 2:41:54 PM
-- Description:	This stored procedure is intended for deleting a specific row from CollateralTypes table
-- ==========================================================================================
Create Procedure [dbo].[CollateralTypes_DeleteRow]
	@RecordID int
As
Begin
	Delete CollateralTypes
	Where
		[RecordID] = @RecordID

End
GO
/****** Object:  StoredProcedure [dbo].[RestoreToReconciled]    Script Date: 12/29/2017 09:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[RestoreToReconciled]
@TranId bigint,
@User varchar(50)
AS

BEGIN
	INSERT INTO Reconciled
						  (TransNo, CustomerRef, CustomerName, CustomerType, CustomerTel,Area,TIN, TranAmount, PaymentDate,
						   RecordDate, TranType, PaymentType, VendorTranId, ReceiptNo, 
						  TranNarration, SmsSent, VendorCode, Teller, VendorToken, RegionCode, DistrictCode,
						   Tariff, Reversal, Cancelled, ReconciledDate, ReconciledBy,Source,UtilityCode,UtilityTranRef,SentToUtility)
	SELECT     Isnull(TransNo,dbo.fn_GetReceiptno(TranId)) AS TransNo, CustomerRef, CustomerName, CustomerType,Area,TIN, CustomerTel, TranAmount, PaymentDate,
	           RecordDate, TranType, PaymentType, VendorTranId, ReceiptNo, 
                      TranNarration, SmsSent, VendorCode, Teller, VendorToken, RegionCode, DistrictCode,
                       Tariff, Reversal, Cancelled, ReconciledDate, ReconciledBy,'UNMATCHED',UtilityCode,UtilityTranRef,SentToUtility
    FROM         Bin 
    WHERE TranId = @TranId
END

BEGIN
    DELETE FROM Bin WHERE TranId = @TranId
END
GO
/****** Object:  StoredProcedure [dbo].[RestoreToRecieved]    Script Date: 12/29/2017 09:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[RestoreToRecieved]
@TranId bigint,
@User varchar(50)
AS

BEGIN
	INSERT INTO Received
						  (TransNo, CustomerRef, CustomerName, CustomerType,Area,TIN, CustomerTel, TranAmount, PaymentDate,
						   RecordDate, TranType, PaymentType, VendorTranId, ReceiptNo, 
						  TranNarration, SmsSent, VendorCode, Teller, VendorToken, RegionCode, DistrictCode,
						    Reversal, Cancelled,UtilityCode,UtilityTranRef,SentToUtility)
	SELECT     Isnull(TransNo,dbo.fn_GetReceiptno(TranId)) AS TransNo, CustomerRef, CustomerName, CustomerType,Area,TIN, CustomerTel, TranAmount, PaymentDate,
						   RecordDate, TranType, PaymentType, VendorTranId,ReceiptNo, 
						   TranNarration, SmsSent, VendorCode, Teller, VendorToken, RegionCode,DistrictCode,
							 Reversal, Cancelled,UtilityCode,UtilityTranRef,SentToUtility
	FROM         Bin
	WHERE TranId = @TranId
END

BEGIN
    DELETE FROM Bin WHERE TranId = @TranId
END

BEGIN
 INSERT INTO Restores
                      (TranId, Reconciled,CreatedBy)
  VALUES     (@TranId,0,@User)
END
GO
/****** Object:  StoredProcedure [dbo].[BankBranches_SelectRow]    Script Date: 12/29/2017 09:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	BankBranches_SelectRow
-- Author:	Nsubuga Kasozi
-- Create date:	12/27/2015 7:57:44 PM
-- Description:	This stored procedure is intended for selecting a specific row from BankBranches table
-- ==========================================================================================
CREATE Procedure [dbo].[BankBranches_SelectRow]
	@BranchCode varchar(50),
	@BankCode varchar(50)
As
Begin
	Select 
		*
	From BankBranches
	Where
		BranchCode=@BranchCode and BankCode=@BankCode
End
GO
/****** Object:  StoredProcedure [dbo].[BankBranches_SelectAll]    Script Date: 12/29/2017 09:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	BankBranches_SelectAll
-- Author:	Nsubuga Kasozi
-- Create date:	12/27/2015 7:57:44 PM
-- Description:	This stored procedure is intended for selecting all rows from BankBranches table
-- ==========================================================================================
Create Procedure [dbo].[BankBranches_SelectAll]
As
Begin
	Select 
		*
	From BankBranches
End
GO
/****** Object:  StoredProcedure [dbo].[TellersToAccounts_Insert]    Script Date: 12/29/2017 09:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[TellersToAccounts_Insert]
@UserId varchar(50),
@AccountNumber varchar(50),
@BankCode varchar(50)
as
if not exists(select * from TellersToAccountsMapping where UserId=@UserId and AccountNumber=@AccountNumber and BankCode=@BankCode)
Begin
INSERT INTO TellersToAccountsMapping
           ([UserId]
           ,[AccountNumber]
           ,[BankCode])
     VALUES
           (@UserId
           ,@AccountNumber
           ,@BankCode)
End
GO
/****** Object:  StoredProcedure [dbo].[SaveMarketPlaceRequest1]    Script Date: 12/29/2017 09:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SaveMarketPlaceRequest1]
@VendorId varchar(50),
@CustomerRef varchar(50),
@CustomerTel varchar(50),
@ServiceCode varchar(50),
@Amount varchar(50),
@Status varchar(50),
@Area varchar(50),
@MerchantCode varchar(50)
as
If exists(select top 1 * from MarketPlaceRequests where VendorId=@VendorId)
Begin
	Update MarketPlaceRequests 
	set CustomerRef=@CustomerRef,CustomerTel=@CustomerTel,ServiceCode=@ServiceCode,Amount=@Amount,Status=@Status,Area=@Area,MerchantCode=@MerchantCode
	where VendorId=@VendorId
End
Else
Begin
	Insert into MarketPlaceRequests
	(VendorId,CustomerRef,CustomerTel,ServiceCode,Amount,RecordDate,Status,Area,MerchantCode)
	values(@VendorId,@CustomerRef,@CustomerTel,@ServiceCode,@Amount,GETDATE(),@Status,@Area,@MerchantCode)
End
GO
/****** Object:  StoredProcedure [dbo].[SaveMarketPlaceRequest]    Script Date: 12/29/2017 09:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SaveMarketPlaceRequest]
@VendorId varchar(50),
@CustomerRef varchar(50),
@CustomerTel varchar(50),
@ServiceCode varchar(50),
@Amount varchar(50),
@Status varchar(50),
@Area varchar(50),
@MerchantCode varchar(50)
as
If exists(select top 1 * from MarketPlaceRequests where VendorId=@VendorId)
Begin
	Update MarketPlaceRequests 
	set CustomerRef=@CustomerRef,CustomerTel=@CustomerTel,ServiceCode=@ServiceCode,Amount=@Amount,Status=@Status,Area=@Area,MerchantCode=@MerchantCode
	where VendorId=@VendorId
End
Else
Begin
	Insert into MarketPlaceRequests
	(VendorId,CustomerRef,CustomerTel,ServiceCode,Amount,RecordDate,Status,Area,MerchantCode)
	values(@VendorId,@CustomerRef,@CustomerTel,@ServiceCode,@Amount,GETDATE(),@Status,@Area,@MerchantCode)
End
GO
/****** Object:  StoredProcedure [dbo].[SaveEodAccountDetails_Insert]    Script Date: 12/29/2017 09:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SaveEodAccountDetails_Insert]
@BankCode varchar(50),
@AccountNumber varchar(50),
@OpeningBal money,
@ClosingBal money,
@TotalDebits money,
@TotalCredits money,
@AccountingDate date,
@AccountingPeriod varchar(50)
as
Begin try
Begin Transaction trans
IF exists(select * from AccountEODBalances where AccountNumber=@AccountNumber and AccountDate=@AccountingDate)
BEGIN
	select RecordId from AccountEODBalances where AccountNumber=@AccountNumber and AccountDate=@AccountingDate
END
ELSE
BEGIN
	
	declare @accType varchar(50), @accName varchar(50)
	--select * from AccountEODBalances
	select @accType =AccType from BankAccounts where AccNumber = @AccountNumber and BankCode = @BankCode;
	
	-- select convert(varchar(6), getdate(),112)
	-- select convert

	insert into AccountEODBalances(
	BankCode, 
	AccountNumber, 
	AccountType, 
	OpeningBalance, 
	ClosingBalance,
	TotalDebits, 
	TotalCredits,
	RecordDate, 
	BalancesDate, 
	AccountDate, 
	AccountingDate, 
	AccountingPeriod)
	values(
	@BankCode, 
	@AccountNumber, 
	@accType, 
	@OpeningBal, 
	@ClosingBal, 
	@TotalDebits, 
	@TotalCredits, 
	GETDATE(), 
	GETDATE(), 
	convert(varchar(10),@AccountingDate,126), 
	convert(varchar(10), @AccountingDate,112),  
	convert(varchar(6), @AccountingDate,112))
	
	
END
Commit Transaction trans
End Try
Begin Catch
Rollback Transaction trans

 DECLARE
   @ErMessage NVARCHAR(2048),
   @ErSeverity INT,
   @ErState INT
 
 SELECT
   @ErMessage = ERROR_MESSAGE(),
   @ErSeverity = ERROR_SEVERITY(),
   @ErState = ERROR_STATE()
   
 RAISERROR (@ErMessage,
             @ErSeverity,
             @ErState )
End Catch
GO
/****** Object:  StoredProcedure [dbo].[SaveEndOfDayBalanceStatus]    Script Date: 12/29/2017 09:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SaveEndOfDayBalanceStatus](@datetime varchar(50), @status varchar(50), @BankCode varchar(50))
as begin
	insert into  endofdaystatus (bankcode, accountingperiod, status, recorddate) values(@bankCode, @datetime, @status, getdate())
end
GO
/****** Object:  StoredProcedure [dbo].[SaveBankUserChanges]    Script Date: 12/29/2017 09:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[SaveBankUserChanges]
	@UserId varchar(50),
	@Email varchar(50),
	@FirstName varchar(50),
	@LastName varchar(50),
	@OtherName varchar(50),
	@Usertype varchar(50),
	@Password varchar(50),
	@IsActive bit,
	@BankCode varchar(50),
	@ModifiedBy varchar(50),
	@PhoneNumber varchar(50),
	@BranchCode varchar(50),
	@DateOfBirth varchar(50),
	@Gender varchar(50),
	@TranAmountLimit varchar(50)
As
Begin transaction trans
Begin try
Begin
	Insert Into BankSystemUserChanges
		(UserId,Email,FirstName,LastName,OtherName,[Usertype],
		[Password],[IsActive],BankCode,RecordDate,
		ModifiedOn,CreatedBy,ModifiedBy,ApprovedBy,
		PhoneNumber,BranchCode,DateOfBirth,Gender,TranAmountLimit,Status,RejectedBy)
	Values
		(@UserId,@Email,@FirstName,@LastName,@OtherName,@Usertype,
		 @Password,@IsActive,@BankCode,GETDATE(),
		 GETDATE(),@ModifiedBy,@ModifiedBy,'',
		 @PhoneNumber,@BranchCode,@DateOfBirth,@Gender,@TranAmountLimit,'','')
	Select @UserId as InsertedId
End

---------------------------------------------------------------------
Commit Transaction Trans

END TRY
BEGIN CATCH

ROLLBACK Transaction Trans

  DECLARE
   @ErMessage NVARCHAR(2048),
   @ErSeverity INT,
   @ErState INT
 
 SELECT
   @ErMessage = ERROR_MESSAGE(),
   @ErSeverity = ERROR_SEVERITY(),
   @ErState = ERROR_STATE()
 
 RAISERROR (@ErMessage,
             @ErSeverity,
             @ErState )
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[AccountCategories_SelectRow]    Script Date: 12/29/2017 09:13:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[AccountCategories_SelectRow]

@BankCode varchar(50)
AS
Select * from dbo.AccountCategories
where Bankcode=@BankCode
GO
/****** Object:  StoredProcedure [dbo].[IsValidBankRef]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[IsValidBankRef]
@BankTranId varchar(50),
@BankCode varchar(50),
@AccountNumber varchar(50),
@fromAccount varchar(50),
@Amount money
as 
Select * from GeneralLedgerTable
where BankTranId=@BankTranId and 
BankCode=@BankCode
UNION
Select * from GeneralLedgerTable
where AccountNumber=@AccountNumber and FromAccount=@fromAccount and 
TranAmount=@Amount and BankCode=@BankCode
and DATEDIFF(SECOND,RecordDate,GETDATE())<10
GO
/****** Object:  StoredProcedure [dbo].[UpdateReversalTransactionStatus]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[UpdateReversalTransactionStatus]
@PegPayId varchar(50),
@processed bit,
@TransactionRef varchar(50)
AS

UPDATE PaymentsGatewayRequests set Processed=@processed,TransactionRef=@TransactionRef
Where TransactionRef=@PegPayId
GO
/****** Object:  StoredProcedure [dbo].[UpdatePegPayGatewayTranStatusByVendorId]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[UpdatePegPayGatewayTranStatusByVendorId]
@Vendorcode varchar(50),
@VendorId varchar(50),
@thirdPartyId varchar(50),
@status varchar(50),
@StatusDesc varchar(max),
@statusCode varchar(50)

AS

UPDATE PaymentsGatewayRequests set Status=@status,StatusCode=@statusCode,StatusDescription=@StatusDesc,TransactionRef=@thirdPartyId
Where VendorCode=@Vendorcode and VendorTranId=@VendorId
GO
/****** Object:  StoredProcedure [dbo].[UpdatePegPayGatewayTranStatus]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[UpdatePegPayGatewayTranStatus]
@PegPayId varchar(50),
@transactionID varchar(50),
@status varchar(50),
@StatusDesc varchar(max),
@statusCode varchar(50)

AS

UPDATE PaymentsGatewayRequests set Status=@status,StatusCode=@statusCode,StatusDescription=@StatusDesc,TransactionRef=@transactionID,UtilitySentDate=GETDATE()
Where RecordId=@PegPayId
GO
/****** Object:  StoredProcedure [dbo].[UpdatePaymentRequestWithPayGateID]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[UpdatePaymentRequestWithPayGateID]
@VendorTranID varchar(50),
@VendorCode varchar(50),
@PayGateID varchar(50)
as
Update PaymentsGatewayRequests set Reason=@PayGateID where VendorCode=@VendorCode and VendorTranId=@VendorTranID
GO
/****** Object:  StoredProcedure [dbo].[UpdateBankTransactionStatusWithReason]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[UpdateBankTransactionStatusWithReason]
@BankId varchar(50),
@BankCode varchar(50),
@PegPayId varchar(50),
@Status varchar(50),
@Reason varchar(max)
as
Update TransactionRequests set Status=@Status,Reason=@Reason where RecordId=@BankId and BankCode=@BankCode
GO
/****** Object:  StoredProcedure [dbo].[UpdateNumberOfMissedLoanPayments]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc  [dbo].[UpdateNumberOfMissedLoanPayments]
@LoanID varchar(50),
@BankCode varchar(50)
as
Begin Transaction trans
Begin Try
	Declare @LoanAccountNumber varchar(50);
	Declare @NumOfMissedpayments decimal(18,2);
	Declare @NextRepaymentDate datetime;
	Declare @LastRepaymentDate datetime;
	Declare @RepayFreq varchar(50);
	Declare @RepayFreqInDays decimal(18,2);

	Select 
	@LoanAccountNumber=LoanAccountNumber,
	@NumOfMissedpayments=NumberOfMissedPayments,
	@LastRepaymentDate=NextRepaymentDate,
	@RepayFreq=RepaymentFrequency
	from Loans
	where 
	LoanID=@LoanID and
	BankCode=@BankCode

	-- Get the actual days in the repayment frequency period
	Select @RepayFreqInDays=DurationInDays from RepaymentFrequencies where 
	(BankCode=@BankCode or BankCode='ALL') and
	(RepaymentFreqCode=@RepayFreq)

	--increment missed payments
	Set @NumOfMissedpayments=@NumOfMissedpayments+1;

	--set next repayment Date
	Set @NextRepaymentDate=DATEADD(day,@RepayFreqInDays,@LastRepaymentDate);

	--Update the Loan with the new information
	Update Loans set NumberOfMissedPayments=@NumOfMissedpayments,NextRepaymentDate=@NextRepaymentDate where
	LoanID=@LoanID and
	BankCode=@BankCode
	------------------------------------
	Commit Transaction trans
End try
Begin Catch

 Rollback Transaction trans

 DECLARE
   @ErMessage NVARCHAR(2048),
   @ErSeverity INT,
   @ErState INT
 
 SELECT
   @ErMessage = ERROR_MESSAGE(),
   @ErSeverity = ERROR_SEVERITY(),
   @ErState = ERROR_STATE()
 
 RAISERROR (@ErMessage,
             @ErSeverity,
             @ErState )
End Catch
GO
/****** Object:  StoredProcedure [dbo].[UpdateLoanRequestStatus]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[UpdateLoanRequestStatus]
@LoanId varchar(50),
@BankCode varchar(50),
@Reason varchar(50),
@Status varchar(50),
@ModifiedBy varchar(50),
@Approver varchar(50)
as
Update Loans set Status=@Status,Reason=@Reason,IsActive=1,ModifiedBy=@ModifiedBy,ApprovedBy=@ModifiedBy,Approver=@Approver
where LoanID=@LoanId and BankCode=@BankCode
GO
/****** Object:  StoredProcedure [dbo].[UpdateLiquidationStatus]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[UpdateLiquidationStatus]
@BankId varchar(50),
@BankCode varchar(50)
as
Update TransactionRequests set SentToBank=1 where RecordId=@BankId and BankCode=@BankCode
GO
/****** Object:  StoredProcedure [dbo].[UpdateHimaTransferStatus]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[UpdateHimaTransferStatus]
@VendorId varchar(50),
@Status varchar(50),
@UtilityRef varchar(50)
as

Begin
	Update GeneralLedgerTable set SentToBank=1,BankStatus=@Status,BankReference=@Status where BankTranId=@VendorId;
End
GO
/****** Object:  StoredProcedure [dbo].[UpdateGatewayTranStatus3]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[UpdateGatewayTranStatus3]
@PegPayId varchar(50),
@processed bit

AS

UPDATE PaymentsGatewayRequests set Processed=@processed
Where TransactionRef=@PegPayId
GO
/****** Object:  StoredProcedure [dbo].[UpdateGatewayTranStatus2]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[UpdateGatewayTranStatus2]
@PegPayId varchar(50),
@processed bit

AS

UPDATE PaymentsGatewayRequests set Processed=@processed
Where VendorTranId=@PegPayId
GO
/****** Object:  StoredProcedure [dbo].[UpdateGatewayTranStatus]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[UpdateGatewayTranStatus]
@PegPayId varchar(50),
@processed bit

AS

UPDATE PaymentsGatewayRequests set Processed=@processed
Where RecordId=@PegPayId
GO
/****** Object:  StoredProcedure [dbo].[UpdateDeletionStatusOfMerchantCustomer]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[UpdateDeletionStatusOfMerchantCustomer]
@ApprovalId varchar(50),
@ModifiedBy varchar(50),
@Status varchar(50)
as
Begin Transaction Updater
Begin try
If(@Status='SUCCESS')
Begin
	Update MerchantCustomers set MarkedForDeletionBy='',MarkedForDeletion=0 where RecordId=@ApprovalId
End
Else
Begin
	Insert into DeletedMerchantCustomers
	Select *,@ModifiedBy as DeletedBy,GETDATE() as DeletedOn
	from MerchantCustomers where RecordId=@ApprovalId
	
	Delete from MerchantCustomers where RecordId=@ApprovalId
	
End
Commit Transaction Updater
End try

Begin catch
ROLLBACK Transaction Updater

  DECLARE
   @ErMessage NVARCHAR(2048),
   @ErSeverity INT,
   @ErState INT
 SELECT
   @ErMessage = ERROR_MESSAGE(),
   @ErSeverity = ERROR_SEVERITY(),
   @ErState = ERROR_STATE()
 
 RAISERROR (@ErMessage,
             @ErSeverity,
             @ErState )
End Catch
GO
/****** Object:  StoredProcedure [dbo].[UpdateBillTransactionStatus]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[UpdateBillTransactionStatus]
@VendorId varchar(50),
@Status varchar(50),
@UtilityRef varchar(50),
@Reason varchar(50)
as
if (@Status='SUCCESS')
Begin
	Update PaymentsGatewayRequests set SentToUtility=1,StatusAtUtility=@Status,ReasonAtUtility=@Reason,UtilityRef=@UtilityRef where TransactionRef=@VendorId;
End
Else
Begin
	Update PaymentsGatewayRequests set StatusAtUtility=@Status,ReasonAtUtility=@Reason,UtilityRef=@UtilityRef where TransactionRef=@VendorId;
End
GO
/****** Object:  StoredProcedure [dbo].[Banks_SelectRow]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Banks_SelectRow]	@BankCode varchar(50)ASSET NOCOUNT ON SELECT * FROM BanksWHERE ((BankCode=@BankCode) or (@BankCode='ALL'))SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[Banks_SelectAll]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Banks_SelectAll]ASSET NOCOUNT ONSELECT * FROM BanksSET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[SaveReversePaymentRequest]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SaveReversePaymentRequest]
@RecordId varchar(50),
@Teller varchar(50),
@Channel varchar(50),
@merchantcode varchar(50)
as
BEGIN Transaction Trans
BEGIN TRY

--If payment has never been reversed
--log reversal request

Declare 
@VendorTranId varchar(50),
@VendorCode varchar(50),
@TelecomId varchar(50),
@ErrorMsg varchar(5000),
@ReversalString varchar(50);
Set @ReversalString='_REV';


--does original transaction exist
if not exists (select top 1 * from PaymentsGatewayRequests where VendorTranId=@RecordId and Merchantcode=@merchantcode)
Begin
set @ErrorMsg = 'ORIGINAL TRANSACTION WAS NOT FOUND';
	RAISERROR (@ErrorMsg, -- Message text.
				   16,    -- Severity.
				   1      -- State.
				   );	RETURN
End
--did original transaction succeed
if not exists (select top 1 * from PaymentsGatewayRequests where VendorTranId=@RecordId and Merchantcode=@merchantcode and Status='SUCCESS')
Begin
set @ErrorMsg = 'ORIGINAL TRANSACTION WAS FOUND BUT IT DID NOT SUCCEED';
	RAISERROR (@ErrorMsg, -- Message text.
				   16,    -- Severity.
				   1      -- State.
				   );	RETURN
End

--look for a reversal of this same transaction
select top 1 @VendorCode=VendorCode,@VendorTranId=VendorTranId,@TelecomId=TransactionRef from PaymentsGatewayRequests where VendorTranId=@RecordId and Merchantcode=@merchantcode

--a reversal request has been found
if exists (select top 1 * from PaymentsGatewayRequests where VendorCode=@VendorCode and VendorTranId=@VendorTranId+@ReversalString and PaymentOptionSelected='REVERSAL')
Begin
	set @ErrorMsg = 'A REVERSAL REQUEST FOR THIS TRANSACTION ALREADY EXISTS';
	RAISERROR (@ErrorMsg, -- Message text.
				   16,    -- Severity.
				   1      -- State.
				   );	RETURN
End

--by this stage everything should be ok
--log reversal request
INSERT INTO [dbo].[PaymentsGatewayRequests]
           ([CustRef]
           ,[TranAmount]
           ,[CustomerTel]
           ,[Email]
           ,[PaymentOptionSelected]
           ,[VendorCode]
           ,[VendorTranId]
           ,[DigitalSignature] 
           ,[ItemDesc]
           ,[ItemTotal]
           ,[ReturnUrl]
           ,[RecordDate]
           ,[Status]
           ,[Reason]
           ,[CustName]
           ,[SourceIP]
           ,[SourceMachineName]
           ,[MerchantCode]
           ,[StatusCode]
           ,[StatusDescription]
           ,[TransactionRef]
           ,[Processed]
           ,[CurrencyCode]
           ,[ChargeAmount]
           ,[SentToUtility]
           ,[UtilityRef]
           ,[StatusAtUtility]
           ,[ReasonAtUtility]
           ,[UtilitySentDate]
           ,[SmsSent]
           ,[Teller])
           Select 
			[CustRef]
           ,[TranAmount]
           ,[CustomerTel]
           ,[Email]
           ,PaymentOptionSelected + '_REVERSAL'
           ,[VendorCode]
           ,[VendorTranId]+@ReversalString
           ,RecordId as [DigitalSignature]
           ,VendorTranId as [ItemDesc]
           ,[ItemTotal]
           ,TransactionRef as ReturnUrl
           ,GETDATE() as RecordDate
           ,[Status]
           ,[Reason]
           ,[CustName]
           ,[SourceIP]
           ,[SourceMachineName]
           ,[MerchantCode]
           ,[StatusCode]
           ,[StatusDescription]
           ,''
           ,[Processed]
           ,[CurrencyCode]
           ,[ChargeAmount]
           ,[SentToUtility]
           ,[UtilityRef]
           ,[StatusAtUtility]
           ,[ReasonAtUtility]
           ,[UtilitySentDate]
           ,[SmsSent]
           ,@Teller 
           from PaymentsGatewayRequests where VendorTranId=@RecordId and Merchantcode=@merchantcode
		   Select SCOPE_IDENTITY() as InsertedId
Commit Transaction Trans
END TRY
BEGIN CATCH

ROLLBACK Transaction Trans

  DECLARE
   @ErMessage NVARCHAR(2048),
   @ErSeverity INT,
   @ErState INT
 
 SELECT
   @ErMessage = ERROR_MESSAGE(),
   @ErSeverity = ERROR_SEVERITY(),
   @ErState = ERROR_STATE()
 
 RAISERROR (@ErMessage,
             @ErSeverity,
             @ErState )
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[SaveReasonForLoanApprover3]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SaveReasonForLoanApprover3]
@LoanID varchar(50),
@BankCode varchar(50),
@Reason varchar(5050)
as
Update Loans set Comments3=@Reason where BankCode=@BankCode and LoanID=@LoanID
GO
/****** Object:  StoredProcedure [dbo].[SaveReasonForLoanApprover2]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SaveReasonForLoanApprover2]
@LoanID varchar(50),
@BankCode varchar(50),
@Reason varchar(5050)
as
Update Loans set Comments2=@Reason where BankCode=@BankCode and LoanID=@LoanID
GO
/****** Object:  StoredProcedure [dbo].[SaveReasonForLoanApprover1]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SaveReasonForLoanApprover1]
@LoanID varchar(50),
@BankCode varchar(50),
@Reason varchar(5050)
as
Update Loans set Comments=@Reason where BankCode=@BankCode and LoanID=@LoanID
GO
/****** Object:  StoredProcedure [dbo].[Account_Update_Approval]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Account_Update_Approval]	@AccountId varchar(50),	@AccBalance money,	@UserId varchar(50),	@AccNumber varchar(50),	@AccType varchar(50),	@AccountCat varchar(100),	@BankCode varchar(50),	@ModifiedBy varchar(50),	@BranchCode varchar(50),	@IsActive bit,	@CurrencyCode varchar(50),	@ApprovedBy varchar(50),	@AccountName varchar(50),	@MinimumBal decimal(18,2),	@InterestRate decimal(18,2),	@InterestType varchar(50),	@InterestPayOutFreq varchar(50),	@IsProductAccount bit,	@ProductType varchar(50),	@Referenced bit,	@LiquidationType varchar(50),	@LiquidationFrequency varchar(100),	@BankLiqAccount varchar(100),	@BankAccountName varchar(100),	@MerchantContact varchar(50)ASBEGIN TRANSACTION CreateAccountBEGIN TRYDeclare @AccountingDate bigintDeclare @AccountingPeriod bigintBEGINSET @AccountingDate=(SELECT CONVERT(VARCHAR(10), DATEADD(day, -1, GETDATE()), 112))
SET @AccountingPeriod=(SELECT LEFT(CONVERT(varchar, DATEADD(day, -1, GETDATE()),112),6))END  Begin	 INSERT INTO PendingBankAccountApprovals (		[AccNumber],		[AccType],		BankCode,		CreatedOn,		ModifiedOn,		CreatedBy,		ModifiedBy,		BranchCode,		IsActive,		CurrencyCode,		ApprovedBy,		AccountName,		MinimumBalance,		InterestRate,		InterestType,		LastEodDate,		LastRunAccountDate,		InterestPayOutFrequency,		IsproductAccount,		ProductType,		IsReferenced,		LiquidationType,		AccountCategory,		LiquidationFrequency,		LiquidationAccount,		LiquidationAccountName,		AccountCode,		SentToBank,		MerchantContact	)	VALUES (		@AccNumber,		@AccType,		@BankCode,		GETDATE(),		GETDATE(),		@ModifiedBy,		@ModifiedBy,		@BranchCode,		@IsActive,		@CurrencyCode,		@ApprovedBy,		@AccountName,		@MinimumBal,		@InterestRate,		@InterestType,		GETDATE(),		@AccountingDate,		@InterestPayOutFreq,		@IsProductAccount,		@ProductType,		@Referenced,		@LiquidationType,		@AccountCat,		@LiquidationFrequency,		@BankLiqAccount,		@BankAccountName,		@AccountId,		0,		@MerchantContact	)			EndCOMMIT TRANSACTION CreateAccountEND TRYBEGIN CATCH
ROLLBACK Transaction CreateAccount

  DECLARE
   @ErMessage NVARCHAR(2048),
   @ErSeverity INT,
   @ErState INT
 
 SELECT
   @ErMessage = ERROR_MESSAGE(),
   @ErSeverity = ERROR_SEVERITY(),
   @ErState = ERROR_STATE()
 
 RAISERROR (@ErMessage,
             @ErSeverity,
             @ErState )END CATCH
GO
/****** Object:  StoredProcedure [dbo].[AccessRules_Update]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	AccessRules_Update
-- Author:	Nsubuga Kasozi
-- Create date:	1/7/2016 4:47:57 PM
-- Description:	This stored procedure is intended for updating AccessRules table
-- ==========================================================================================
CREATE Procedure [dbo].[AccessRules_Update]
	@RecordId varchar(50),
	@RuleName varchar(50),
	@UserType varchar(50),
	@BankCode varchar(50),
	@CanAccess varchar(8000),
	@UserId varchar(50),
	@BranchCode varchar(50),
	@IsActive bit,
	@ModifiedOn varchar(50),
	@ModifiedBy varchar(50)
As
Begin Transaction trans
Begin Try
if exists (Select * from AccessRules where BankCode=@BankCode and RuleName=@RuleName)
Begin
	Update AccessRules
	Set
		[RuleName] = @RuleName,
		[UserType] = @UserType,
		[BankCode] = @BankCode,
		[CanAccess] = @CanAccess,
		[UserId] = @UserId,
		[BranchCode] = @BranchCode,
		[IsActive] = @IsActive,
		[ModifiedOn] = GETDATE(),
		[ModifiedBy] = @ModifiedBy,
		[CreatedOn] = GETDATE(),
		[CreatedBy] = @modifiedBy
	Where		
		BankCode=@BankCode and RuleName=@RuleName
		
		Select @RuleName as InsertedId
End
Else 
Begin
	Insert Into AccessRules
		([RuleName],[UserType],[BankCode],[CanAccess],[UserId],[BranchCode],[IsActive],[ModifiedOn],[ModifiedBy],[CreatedOn],[CreatedBy])
	Values
		(@RuleName,@UserType,@BankCode,@CanAccess,@UserId,@BranchCode,@IsActive,GETDATE(),@ModifiedBy,GETDATE(),@ModifiedBy)
    
    Select @RuleName as InsertedId
End
---------------------------------------------------------------------
Commit Transaction Trans

END TRY
BEGIN CATCH

ROLLBACK Transaction Trans

  DECLARE
   @ErMessage NVARCHAR(2048),
   @ErSeverity INT,
   @ErState INT
 
 SELECT
   @ErMessage = ERROR_MESSAGE(),
   @ErSeverity = ERROR_SEVERITY(),
   @ErState = ERROR_STATE()
 
 RAISERROR (@ErMessage,
             @ErSeverity,
             @ErState )
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[AccessRules_SelectRow]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	AccessRules_SelectRow
-- Author:	Nsubuga Kasozi
-- Create date:	1/7/2016 4:47:57 PM
-- Description:	This stored procedure is intended for selecting a specific row from AccessRules table
-- ==========================================================================================
CREATE Procedure [dbo].[AccessRules_SelectRow]
	@Id varchar(50),
	@BankCode varchar(50)
As
Begin
	Select 
		*
	From AccessRules
	Where (UserType=@Id) and (BankCode=@BankCode or BankCode='ALL') 
		
End
GO
/****** Object:  StoredProcedure [dbo].[AccessRules_SelectAll]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	AccessRules_SelectAll
-- Author:	Nsubuga Kasozi
-- Create date:	1/7/2016 4:47:57 PM
-- Description:	This stored procedure is intended for selecting all rows from AccessRules table
-- ==========================================================================================
Create Procedure [dbo].[AccessRules_SelectAll]
As
Begin
	Select *
	From AccessRules
End
GO
/****** Object:  StoredProcedure [dbo].[BankRoles_Update]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	BankRoles_Update
-- Author:	Albert Luganga
-- Create date:	09/29/2016 13:44:41 PM
-- Description:	This stored procedure is intended for updating BankRoles table, only if a bank exists
-- ==========================================================================================
CREATE Procedure [dbo].[BankRoles_Update]
	@BankCode varchar(50),
	@RoleCode varchar(50)
As
if exists (Select * from Banks where BankCode=@BankCode and LEN(ISNULL(@RoleCode, '')) = 0)
Begin
		Insert Into BankRoles
			([BankCode],[RoleCode],[CreatedOn])
		Values
			(@BankCode,@RoleCode,GETDATE())  
End


---------------------------------------------------------------------
GO
/****** Object:  StoredProcedure [dbo].[IdentificationDocumentTypes_DeleteRow]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	IdentificationDocumentTypes_DeleteRow
-- Author:	Nsubuga Kasozi
-- Create date:	3/29/2016 7:41:08 PM
-- Description:	This stored procedure is intended for deleting a specific row from IdentificationDocumentTypes table
-- ==========================================================================================
Create Procedure [dbo].[IdentificationDocumentTypes_DeleteRow]
	@RecordId int
As
Begin
	Delete IdentificationDocumentTypes
	Where
		[RecordId] = @RecordId

End
GO
/****** Object:  StoredProcedure [dbo].[GetMerchantByTpGoRef]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetMerchantByTpGoRef]
@tpgoRef varchar(100)
AS

SELECT *
FROM BankAccounts
WHERE
ReferenceType=@tpgoRef
GO
/****** Object:  StoredProcedure [dbo].[GetMerchantByMerchantCode]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetMerchantByMerchantCode]
@merchnantcode varchar(50)
as
Select * from BankAccounts where AccountCode=@merchnantcode
GO
/****** Object:  StoredProcedure [dbo].[Device_Update]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Device_Update]
    @CustomerId varchar(50),
	@AccountCode varchar(50),
	@DeviceId varchar(50),
	@DeviceType varchar(50),
	@SIMCard varchar(50),
	@Passcode varchar(50),
	@TerminalName varchar(50),
	@AcquiredBy varchar(50),
	@Location varchar(50),
    @PhoneNumber varchar(50),
    @BankCode varchar(50),
    @BranchCode varchar(50),
	@IsActive bit,
	@CreatedBy varchar(50),
	@ApprovedBy varchar(50)
As
Begin transaction trans
Begin try
  begin
     declare @CustomerAccount varchar(50)
     set @CustomerAccount = (select AccNumber from BankAccounts where AccountCode=@AccountCode)
  end
if not exists(Select * from CustomerDeviceMappings where CustomerId=@CustomerId)
Begin
	Insert Into CustomerDeviceMappings
		(CustomerId,CustomerAccount,DeviceId,DeviceType,SIMCard,Pin,TerminalName,AccountCode,
		  AquiredBy,Location,CustomerTel,BankCode,BranchCode,[Active],RecordDate,CreatedBy
		)
	Values
		(@CustomerId,@CustomerAccount,@DeviceId,@DeviceType,@SIMCard,@Passcode,@TerminalName,@AccountCode,
		 @AcquiredBy,@Location,@PhoneNumber,@BankCode,@BranchCode,@IsActive,GETDATE(),@CreatedBy
		)
	Select @CustomerId as InsertedId
End
Else
Begin
	if(@ApprovedBy='')
	Begin
		Update CustomerDeviceMappings
		Set
			DeviceId=@DeviceId,
			--DeviceType = @DeviceType,
			SIMCard=@SIMCard,
			TerminalName=@TerminalName,
			AquiredBy=@AcquiredBy,
			Location=@Location,
			CustomerTel=@PhoneNumber,
			Active=@IsActive
		Where		
			CustomerId=@CustomerId and BankCode=@BankCode
		Select @CustomerId as InsertedId
	End
	Else
	Begin
		Update CustomerDeviceMappings
		Set
			DeviceId=@DeviceId,
			--DeviceType = @DeviceType,
			SIMCard=@SIMCard,
			TerminalName=@TerminalName,
			AquiredBy=@AcquiredBy,
			Location=@Location,
			CustomerTel=@PhoneNumber,
			Active=@IsActive,
			ApprovedBy=@ApprovedBy
		Where		
			CustomerId=@CustomerId and BankCode=@BankCode
			if (select ApprovalDate from CustomerDeviceMappings where DeviceId=@DeviceId) is null
			begin
			  Update CustomerDeviceMappings
		      Set ApprovalDate=GETDATE()
			end
		Select @CustomerId as InsertedId
	End
End
---------------------------------------------------------------------
Commit Transaction Trans

END TRY
BEGIN CATCH

ROLLBACK Transaction Trans

  DECLARE
   @ErMessage NVARCHAR(2048),
   @ErSeverity INT,
   @ErState INT
 
 SELECT
   @ErMessage = ERROR_MESSAGE(),
   @ErSeverity = ERROR_SEVERITY(),
   @ErState = ERROR_STATE()
 
 RAISERROR (@ErMessage,
             @ErSeverity,
             @ErState )
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[Guarantors_Update]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	Guarantors_Update
-- Author:	Nsubuga Kasozi
-- Create date:	4/19/2016 12:44:45 AM
-- Description:	This stored procedure is intended for updating Guarantors table
-- ==========================================================================================
CREATE Procedure [dbo].[Guarantors_Update]
	@LoanID varchar(50),
	@GuarantorName varchar(50),
	@GuarantorId varchar(50),
	@GuarantorType varchar(50),
	@BankCode varchar(50),
	@ModifiedBy varchar(50),
	@GuarantorPhoneNumber varchar(50),
	@PathToPicOfGuarantorID varchar(50),
	@IdType  varchar(50)
As
If exists(select * from Guarantors where BankCode=@BankCode and LoanID=@LoanID and GuarantorName=@GuarantorName)
Begin
	Update Guarantors
	Set
		[GuarantorName] = @GuarantorName,
		[GuarantorId] = @GuarantorId,
		[GuarantorType] = @GuarantorType,
		[GuarantorPhoneNumber]=@GuarantorPhoneNumber,
		[PathToPicOfGuarantorID]=@PathToPicOfGuarantorID,
		[IdType]=@IdType,
		[ModifiedOn] = GETDATE(),
		[ModifiedBy] = @ModifiedBy
	Where		
		BankCode=@BankCode and LoanID=@LoanID and GuarantorName=@GuarantorName
		
	Select @GuarantorName as InsertedID
End
Else
Begin
	Insert Into Guarantors
		([LoanID],[GuarantorName],
		[GuarantorId],[GuarantorType],
		[BankCode],[CreatedOn],
		[CreatedBy],[ModifiedOn],[ModifiedBy],
		[GuarantorPhoneNumber],[PathToPicOfGuarantorID],[IdType])
	Values
		(@LoanID,@GuarantorName,
		@GuarantorId,@GuarantorType,
		@BankCode,GETDATE(),@ModifiedBy,GETDATE(),@ModifiedBy,
		@GuarantorPhoneNumber,@PathToPicOfGuarantorID,@IdType)
	
	Select @GuarantorName as InsertedID
End
GO
/****** Object:  StoredProcedure [dbo].[Guarantors_SelectRow]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	Guarantors_SelectRow
-- Author:	Nsubuga Kasozi
-- Create date:	4/19/2016 12:44:45 AM
-- Description:	This stored procedure is intended for selecting a specific row from Guarantors table
-- ==========================================================================================
Create Procedure [dbo].[Guarantors_SelectRow]
	@RecordID int
As
Begin
	Select *
	From Guarantors
	Where
		[RecordID] = @RecordID
End
GO
/****** Object:  StoredProcedure [dbo].[Guarantors_SelectAll]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	Guarantors_SelectAll
-- Author:	Nsubuga Kasozi
-- Create date:	4/19/2016 12:44:45 AM
-- Description:	This stored procedure is intended for selecting all rows from Guarantors table
-- ==========================================================================================
Create Procedure [dbo].[Guarantors_SelectAll]
As
Begin
	Select *
	From Guarantors
End
GO
/****** Object:  StoredProcedure [dbo].[Guarantors_Insert]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	Guarantors_Insert
-- Author:	Nsubuga Kasozi
-- Create date:	4/19/2016 12:44:45 AM
-- Description:	This stored procedure is intended for inserting values to Guarantors table
-- ==========================================================================================
Create Procedure [dbo].[Guarantors_Insert]
	@LoanID varchar(50),
	@GuarantorName varchar(50),
	@GuarantorId varchar(50),
	@GuarantorType varchar(50),
	@BankCode varchar(50),
	@CreatedOn datetime,
	@CreatedBy varchar(50),
	@ModifiedOn datetime,
	@ModifiedBy varchar(50)
As
Begin
	Insert Into Guarantors
		([LoanID],[GuarantorName],[GuarantorId],[GuarantorType],[BankCode],[CreatedOn],[CreatedBy],[ModifiedOn],[ModifiedBy])
	Values
		(@LoanID,@GuarantorName,@GuarantorId,@GuarantorType,@BankCode,@CreatedOn,@CreatedBy,@ModifiedOn,@ModifiedBy)

	Declare @ReferenceID int
	Select @ReferenceID = @@IDENTITY

	Return @ReferenceID

End
GO
/****** Object:  StoredProcedure [dbo].[Guarantors_DeleteRow]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	Guarantors_DeleteRow
-- Author:	Nsubuga Kasozi
-- Create date:	4/19/2016 12:44:45 AM
-- Description:	This stored procedure is intended for deleting a specific row from Guarantors table
-- ==========================================================================================
Create Procedure [dbo].[Guarantors_DeleteRow]
	@RecordID int
As
Begin
	Delete Guarantors
	Where
		[RecordID] = @RecordID

End
GO
/****** Object:  StoredProcedure [dbo].[GroupMembers_Update]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	GroupMembers_Update
-- Author:	Nsubuga Kasozi
-- Create date:	4/24/2016 1:07:13 PM
-- Description:	This stored procedure is intended for updating GroupMembers table
-- ==========================================================================================
CREATE Procedure [dbo].[GroupMembers_Update]
	@BankCode varchar(50),
	@CustomerID varchar(50),
	@GroupID varchar(50),
	@LoanID varchar(50),
	@Amount decimal,
	@ModifiedBy varchar(50)
As
if exists(select * from GroupMembers where BankCode=@BankCode and CustomerID=@CustomerID and GroupID=@GroupID and LoanID=@LoanID)
Begin
	Update GroupMembers
	Set
		[BankCode] = @BankCode,
		[CustomerID] = @CustomerID,
		[GroupID] = @GroupID,
		[LoanID] = @LoanID,
		[Amount] = @Amount,
		[ModifiedBy] = @ModifiedBy,
		[ModifiedOn] = GETDATE()
	Where		
		BankCode=@BankCode and CustomerID=@CustomerID and GroupID=@GroupID and LoanID=@LoanID
		
		Select @LoanID+'_'+@GroupID as InsertedID
End
Else 
Begin
	Insert Into GroupMembers
		([BankCode],[CustomerID],
	     [GroupID],[LoanID],
	     [Amount],[CreatedBy],
	     [ModifiedBy],[ModifiedOn],[CreatedOn])
	Values
		(@BankCode,@CustomerID,
		@GroupID,@LoanID,
		@Amount,@ModifiedBy,
		@ModifiedBy,GETDATE(),GETDATE())
		
		Select @LoanID+'_'+@GroupID as InsertedID
End
GO
/****** Object:  StoredProcedure [dbo].[GroupMembers_SelectRow]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	GroupMembers_SelectRow
-- Author:	Nsubuga Kasozi
-- Create date:	4/24/2016 1:07:13 PM
-- Description:	This stored procedure is intended for selecting a specific row from GroupMembers table
-- ==========================================================================================
Create Procedure [dbo].[GroupMembers_SelectRow]
	@RecordId int
As
Begin
	Select *
	From GroupMembers
	Where
		[RecordId] = @RecordId
End
GO
/****** Object:  StoredProcedure [dbo].[GroupMembers_SelectAll]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	GroupMembers_SelectAll
-- Author:	Nsubuga Kasozi
-- Create date:	4/24/2016 1:07:13 PM
-- Description:	This stored procedure is intended for selecting all rows from GroupMembers table
-- ==========================================================================================
Create Procedure [dbo].[GroupMembers_SelectAll]
As
Begin
	Select 
	*
	From GroupMembers
End
GO
/****** Object:  StoredProcedure [dbo].[GroupMembers_Insert]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	GroupMembers_Insert
-- Author:	Nsubuga Kasozi
-- Create date:	4/24/2016 1:07:13 PM
-- Description:	This stored procedure is intended for inserting values to GroupMembers table
-- ==========================================================================================
Create Procedure [dbo].[GroupMembers_Insert]
	@BankCode varchar(50),
	@CustomerID varchar(50),
	@GroupID varchar(50),
	@LoanID varchar(50),
	@Amount decimal,
	@CreatedBy varchar(50),
	@ModifiedBy varchar(50),
	@ModifiedOn datetime,
	@CreatedOn datetime
As
Begin
	Insert Into GroupMembers
		([BankCode],[CustomerID],[GroupID],[LoanID],[Amount],[CreatedBy],[ModifiedBy],[ModifiedOn],[CreatedOn])
	Values
		(@BankCode,@CustomerID,@GroupID,@LoanID,@Amount,@CreatedBy,@ModifiedBy,@ModifiedOn,@CreatedOn)

	Declare @ReferenceID int
	Select @ReferenceID = @@IDENTITY

	Return @ReferenceID

End
GO
/****** Object:  StoredProcedure [dbo].[GroupMembers_DeleteRow]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	GroupMembers_DeleteRow
-- Author:	Nsubuga Kasozi
-- Create date:	4/24/2016 1:07:13 PM
-- Description:	This stored procedure is intended for deleting a specific row from GroupMembers table
-- ==========================================================================================
Create Procedure [dbo].[GroupMembers_DeleteRow]
	@RecordId int
As
Begin
	Delete GroupMembers
	Where
		[RecordId] = @RecordId

End
GO
/****** Object:  StoredProcedure [dbo].[TillBranch_Update]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[TillBranch_Update]
	@AccountCode varchar(50),
	@TillBranchCode varchar(50),
	@TillBranchName varchar(50),
	@CreatedBy varchar(100),
	@BankCode varchar(50)
As
if not exists(Select * from MerchantTillBranches where AccountCode=@AccountCode and TillBranchCode=@TillBranchCode)
Begin
	Insert Into MerchantTillBranches
			(AccountCode,TillBranchCode,TillBranchName,BankCode,CreatedBy,CreatedOn)
	Values
			(@AccountCode,@TillBranchCode,@TillBranchName,@BankCode,@CreatedBy,getdate())
    
	select 'You have successfully added a till branch' as Operation
			
End
Else
Begin
	Update MerchantTillBranches
	Set
		TillBranchName = @TillBranchName
	Where		
		AccountCode=@AccountCode and TillBranchCode=@TillBranchCode
    
	select 'You have successfully updated a till branch' as Operation
End
GO
/****** Object:  StoredProcedure [dbo].[DeleteBankChargesById]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[DeleteBankChargesById]
@ChargeId varchar(50),
@deletedby varchar(50),
@Bankcode varchar(50)
as
BEGIN TRANSACTION deleteChargeBEGIN TRY--transfer charge to deleted tableInsert into DeletedBankChargesSelect *,@deletedby,GETDATE() from BankCharges where ChargeId=@ChargeId and Bankcode=@bankcode--Log in Audit TrailInsert into AuditTrail (ActionType,TableName,Bankcode,Modifiedon,ModifiedBy,[Action])values('Delete','BankCharges',@BankCode,GETDATE(),@deletedBy,'Deleted Charge With Id '+@ChargeId)--delete from original tableDelete from BankCharges where ChargeId=@ChargeIdCOMMIT TRANSACTION deleteChargeEND TRYBEGIN CATCH
ROLLBACK Transaction deleteCharge

  DECLARE
   @ErMessage NVARCHAR(2048),
   @ErSeverity INT,
   @ErState INT
 
 SELECT
   @ErMessage = ERROR_MESSAGE(),
   @ErSeverity = ERROR_SEVERITY(),
   @ErState = ERROR_STATE()
 
 RAISERROR (@ErMessage,
             @ErSeverity,
             @ErState )END CATCH
GO
/****** Object:  View [dbo].[View_AllTransactions]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_AllTransactions]
AS
SELECT     dbo.GeneralLedgerTable.PegPayTranId, dbo.GeneralLedgerTable.BankTranId,dbo.GeneralLedgerTable.CustomerRef,dbo.GeneralLedgerTable.CustomerTel,dbo.GeneralLedgerTable.CustomerName,
           dbo.GeneralLedgerTable.TranAmount,dbo.BankAccounts.AccountCode,dbo.BankAccounts.AccountName,dbo.GeneralLedgerTable.Processed,dbo.GeneralLedgerTable.ChequeNumber,
           dbo.GeneralLedgerTable.SentToBank,dbo.GeneralLedgerTable.BankReference,dbo.GeneralLedgerTable.PaymentDate,
		    dbo.GeneralLedgerTable.BankStatus, dbo.GeneralLedgerTable.BankSentDate, dbo.BankAccounts.LiquidationAccount,
			dbo.GeneralLedgerTable.FromAccount,dbo.GeneralLedgerTable.ToAccount,dbo.GeneralLedgerTable.BankCode,
           dbo.GeneralLedgerTable.TranCategory,dbo.GeneralLedgerTable.TranType, dbo.GeneralLedgerTable.RecordDate,dbo.GeneralLedgerTable.AccountNumber   
           
FROM         dbo.GeneralLedgerTable INNER JOIN
                      dbo.BankAccounts ON dbo.GeneralLedgerTable.AccountNumber = dbo.BankAccounts.AccNumber
GO
/****** Object:  View [dbo].[View_AllLiquidations]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_AllLiquidations]
AS
SELECT     dbo.BankAccounts.AccountCode,dbo.GeneralLedgerTable.PegPayTranId, dbo.GeneralLedgerTable.CustomerName, 
           dbo.GeneralLedgerTable.TranAmount, dbo.GeneralLedgerTable.BankTranId,dbo.GeneralLedgerTable.SentToBank,dbo.GeneralLedgerTable.BankReference, dbo.GeneralLedgerTable.BankSentDate, dbo.GeneralLedgerTable.BankStatus,
           dbo.GeneralLedgerTable.TranCategory, dbo.GeneralLedgerTable.RecordDate,dbo.GeneralLedgerTable.AccountNumber, dbo.BankAccounts.LiquidationAccount, dbo.BankAccounts.LiquidationType,
           dbo.GeneralLedgerTable.BankCode, dbo.GeneralLedgerTable.BranchCode, dbo.GeneralLedgerTable.Narration,dbo.GeneralLedgerTable.FromAccount, dbo.GeneralLedgerTable.ToAccount,       
           dbo.BankAccounts.LiquidationFrequency
           
FROM         dbo.GeneralLedgerTable INNER JOIN
                      dbo.BankAccounts ON dbo.GeneralLedgerTable.AccountNumber = dbo.BankAccounts.AccNumber
WHERE     (dbo.BankAccounts.SentToBank = 1)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "GeneralLedgerTable"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 126
               Right = 294
            End
            DisplayFlags = 280
            TopColumn = 3
         End
         Begin Table = "BankAccounts"
            Begin Extent = 
               Top = 6
               Left = 360
               Bottom = 126
               Right = 575
            End
            DisplayFlags = 280
            TopColumn = 27
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_AllLiquidations'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_AllLiquidations'
GO
/****** Object:  StoredProcedure [dbo].[Utilities_Update]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	Utilities_Update
-- Author:	Nsubuga Kasozi
-- Create date:	4/7/2016 6:28:40 PM
-- Description:	This stored procedure is intended for updating Utilities table
-- ==========================================================================================
CREATE Procedure [dbo].[Utilities_Update]
	@UtilityName varchar(50),
	@UtilityCode varchar(50),
	@CommissionAccount varchar(50),
	@IsActive bit,
	@BankCode varchar(50),
	@ModifiedBy varchar(50)
As
if exists(select * from Utilities where UtilityCode=@UtilityCode and BankCode=@BankCode)
Begin
	Update Utilities
	Set
		[UtilityName] = @UtilityName,
		[UtilityCode] = @UtilityCode,
		[CommissionAccount] = @CommissionAccount,
		[BankCode] = @BankCode,
		[ModifiedBy] = @ModifiedBy,
		IsActive=@IsActive,
		[CreatedOn] = GETDATE(),
		[ModifiedOn] = GETDATE()
	Where		
		UtilityCode=@UtilityCode and BankCode=@BankCode
	Select @UtilityCode as InsertedID
End
Else
Begin
	Insert Into Utilities
		([UtilityName],[UtilityCode],
		[CommissionAccount],[BankCode],
		IsActive,
		[CreatedBy],[ModifiedBy],
		[CreatedOn],[ModifiedOn])
	Values
		(@UtilityName,@UtilityCode,
		@CommissionAccount,@BankCode,
		@IsActive,
		@ModifiedBy,@ModifiedBy,
		GETDATE(),GETDATE())
		Select @UtilityCode as InsertedID
End
GO
/****** Object:  StoredProcedure [dbo].[Utilities_SelectRow]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	Utilities_SelectRow
-- Author:	Nsubuga Kasozi
-- Create date:	4/7/2016 6:28:40 PM
-- Description:	This stored procedure is intended for selecting a specific row from Utilities table
-- ==========================================================================================
CREATE Procedure [dbo].[Utilities_SelectRow]
	@UtilityCode varchar(50),
	@BankCode varchar(50)
As
Begin
	Select *
	From Utilities
	Where UtilityCode=@UtilityCode and BankCode=@BankCode
End
GO
/****** Object:  StoredProcedure [dbo].[Utilities_SelectAll]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	Utilities_SelectAll
-- Author:	Nsubuga Kasozi
-- Create date:	4/7/2016 6:28:40 PM
-- Description:	This stored procedure is intended for selecting all rows from Utilities table
-- ==========================================================================================
Create Procedure [dbo].[Utilities_SelectAll]
As
Begin
	Select 
		[RecordId],
		[UtilityName],
		[UtilityCode],
		[CommissionAccount],
		[BankCode],
		[CreatedBy],
		[ModifiedBy],
		[CreatedOn],
		[ModifiedOn]
	From Utilities
End
GO
/****** Object:  StoredProcedure [dbo].[Utilities_Insert]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	Utilities_Insert
-- Author:	Nsubuga Kasozi
-- Create date:	4/7/2016 6:28:40 PM
-- Description:	This stored procedure is intended for inserting values to Utilities table
-- ==========================================================================================
Create Procedure [dbo].[Utilities_Insert]
	@UtilityName varchar(50),
	@UtilityCode varchar(50),
	@CommissionAccount varchar(50),
	@BankCode varchar(50),
	@CreatedBy varchar(50),
	@ModifiedBy varchar(50),
	@CreatedOn datetime,
	@ModifiedOn datetime
As
Begin
	Insert Into Utilities
		([UtilityName],[UtilityCode],[CommissionAccount],[BankCode],[CreatedBy],[ModifiedBy],[CreatedOn],[ModifiedOn])
	Values
		(@UtilityName,@UtilityCode,@CommissionAccount,@BankCode,@CreatedBy,@ModifiedBy,@CreatedOn,@ModifiedOn)

	Declare @ReferenceID int
	Select @ReferenceID = @@IDENTITY

	Return @ReferenceID

End
GO
/****** Object:  StoredProcedure [dbo].[Utilities_DeleteRow]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	Utilities_DeleteRow
-- Author:	Nsubuga Kasozi
-- Create date:	4/7/2016 6:28:41 PM
-- Description:	This stored procedure is intended for deleting a specific row from Utilities table
-- ==========================================================================================
Create Procedure [dbo].[Utilities_DeleteRow]
	@RecordId int
As
Begin
	Delete Utilities
	Where
		[RecordId] = @RecordId

End
GO
/****** Object:  StoredProcedure [dbo].[RestoreRejectedAccount]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[RestoreRejectedAccount]
@BankCode varchar(50),
@Id varchar(50),
@ModifiedBy varchar(50)
as
Begin Try
Begin Transaction Deleter
Insert into dbo.BankAccounts
([AccNumber]
           ,[AccType]
           ,[BankCode]
           ,[CreatedOn]
           ,[ModifiedOn]
           ,[ModifiedBy]
           ,[CreatedBy]
           ,[IsActive]
           ,[ApprovedBy]
           ,[BranchCode]
           ,[CurrencyCode]
           ,[AccountName]
           ,[MinimumBalance]
           ,[InterestRate]
           ,[InterestType]
           ,[NextMaturityDate]
           ,[LastEodDate]
           ,[InterestPayOutFrequency]
           ,[Reason]
           ,[LastRunAccountDate]
           ,[IsproductAccount]
           ,[ProductType]
           ,[IsReferenced]
           ,[LiquidationType]
           ,[AccountCode]
           ,[AccountCategory]
           ,[LiquidationFrequency]
           ,[LiquidationAccount]
           ,[SentToBank]
           ,[LiquidationAccountName]
           ,[MerchantContact]
           ,[ReferenceType]
           ,[NumberOfAuthorisers])
Select 
			[AccNumber]
           ,[AccType]
           ,[BankCode]
           ,[CreatedOn]
           ,GETDATE()
           ,@ModifiedBy
           ,[CreatedBy]
           ,[IsActive]
           ,''
           ,[BranchCode]
           ,[CurrencyCode]
           ,[AccountName]
           ,[MinimumBalance]
           ,[InterestRate]
           ,[InterestType]
           ,[NextMaturityDate]
           ,[LastEodDate]
           ,[InterestPayOutFrequency]
           ,[Reason]
           ,[LastRunAccountDate]
           ,[IsproductAccount]
           ,[ProductType]
           ,[IsReferenced]
           ,[LiquidationType]
           ,[AccountCode]
           ,[AccountCategory]
           ,[LiquidationFrequency]
           ,[LiquidationAccount]
           ,[SentToBank]
           ,[LiquidationAccountName]
           ,[MerchantContact]
           ,''
           ,[NumberOfAuthorisers]
 from RejectedBankAccounts
 where AccountCode=@Id 
 
 --insert into a log table
 INSERT INTO [dbo].[RestorationLogs]
           (AccountCode
           ,[BankCode]
           ,[RestoredBy]
           ,[RecordDate])
     VALUES
           (@Id
           ,@BankCode
           ,@ModifiedBy
           ,GETDATE())
 
 --delete restored merchant from Rejected table
 Delete from RejectedBankAccounts where AccountCode=@Id
 Commit Transaction Deleter
END try
BEGIN Catch
Rollback Transaction Deleter
DECLARE
   @ErMessage NVARCHAR(2048),
   @ErSeverity INT,
   @ErState INT
 
 SELECT
   @ErMessage = ERROR_MESSAGE(),
   @ErSeverity = ERROR_SEVERITY(),
   @ErState = ERROR_STATE()
 
 RAISERROR (@ErMessage,
             @ErSeverity,
             @ErState )
END Catch
GO
/****** Object:  StoredProcedure [dbo].[Reports_Update]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	Reports_Update
-- Author:	Nsubuga Kasozi
-- Create date:	4/26/2016 6:34:07 AM
-- Description:	This stored procedure is intended for updating Reports table
-- ==========================================================================================
Create Procedure [dbo].[Reports_Update]
	@RecordID int,
	@ReportType varchar(50),
	@ReportName varchar(50),
	@ReportCategory varchar(50),
	@StoredProcedure varchar(50),
	@BankCode varchar(50),
	@ModifiedBy varchar(50),
	@CreatedBy varchar(50),
	@ModifiedOn datetime,
	@CreatedOn datetime
As
Begin
	Update Reports
	Set
		[ReportType] = @ReportType,
		[ReportName] = @ReportName,
		[ReportCategory] = @ReportCategory,
		[StoredProcedure] = @StoredProcedure,
		[BankCode] = @BankCode,
		[ModifiedBy] = @ModifiedBy,
		[CreatedBy] = @CreatedBy,
		[ModifiedOn] = @ModifiedOn,
		[CreatedOn] = @CreatedOn
	Where		
		[RecordID] = @RecordID

End
GO
/****** Object:  StoredProcedure [dbo].[Reports_SelectRow]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	Reports_SelectRow
-- Author:	Nsubuga Kasozi
-- Create date:	4/26/2016 6:34:07 AM
-- Description:	This stored procedure is intended for selecting a specific row from Reports table
-- ==========================================================================================
CREATE Procedure [dbo].[Reports_SelectRow]
	@ReportType varchar(50),
	@BankCode varchar(50)
As
Begin
	Select *
	From Reports
	Where
		ReportType=@ReportType and
		(BankCode=@BankCode or @BankCode='ALL' or BankCode='ALL') 
End
GO
/****** Object:  StoredProcedure [dbo].[Reports_SelectAll]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	Reports_SelectAll
-- Author:	Nsubuga Kasozi
-- Create date:	4/26/2016 6:34:06 AM
-- Description:	This stored procedure is intended for selecting all rows from Reports table
-- ==========================================================================================
Create Procedure [dbo].[Reports_SelectAll]
As
Begin
	Select *
	From Reports
End
GO
/****** Object:  StoredProcedure [dbo].[Reports_Insert]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	Reports_Insert
-- Author:	Nsubuga Kasozi
-- Create date:	4/26/2016 6:34:07 AM
-- Description:	This stored procedure is intended for inserting values to Reports table
-- ==========================================================================================
Create Procedure [dbo].[Reports_Insert]
	@ReportType varchar(50),
	@ReportName varchar(50),
	@ReportCategory varchar(50),
	@StoredProcedure varchar(50),
	@BankCode varchar(50),
	@ModifiedBy varchar(50),
	@CreatedBy varchar(50),
	@ModifiedOn datetime,
	@CreatedOn datetime
As
Begin
	Insert Into Reports
		([ReportType],[ReportName],[ReportCategory],[StoredProcedure],[BankCode],[ModifiedBy],[CreatedBy],[ModifiedOn],[CreatedOn])
	Values
		(@ReportType,@ReportName,@ReportCategory,@StoredProcedure,@BankCode,@ModifiedBy,@CreatedBy,@ModifiedOn,@CreatedOn)

	Declare @ReferenceID int
	Select @ReferenceID = @@IDENTITY

	Return @ReferenceID

End
GO
/****** Object:  StoredProcedure [dbo].[Reports_DeleteRow]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	Reports_DeleteRow
-- Author:	Nsubuga Kasozi
-- Create date:	4/26/2016 6:34:07 AM
-- Description:	This stored procedure is intended for deleting a specific row from Reports table
-- ==========================================================================================
Create Procedure [dbo].[Reports_DeleteRow]
	@RecordID int
As
Begin
	Delete Reports
	Where
		[RecordID] = @RecordID

End
GO
/****** Object:  StoredProcedure [dbo].[UtilityTransactions_SelectRow]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	UtilityTransactions_SelectRow
-- Author:	Nsubuga Kasozi
-- Create date:	3/20/2016 1:06:57 AM
-- Description:	This stored procedure is intended for selecting a specific row from UtilityTransactions table
-- ==========================================================================================
Create Procedure [dbo].[UtilityTransactions_SelectRow]
	@TranId bigint
As
Begin
	Select 
		*
	From UtilityTransactions
	Where
		[TranId] = @TranId
End
GO
/****** Object:  StoredProcedure [dbo].[UtilityTransactions_SelectAll]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	UtilityTransactions_SelectAll
-- Author:	Nsubuga Kasozi
-- Create date:	3/20/2016 1:06:57 AM
-- Description:	This stored procedure is intended for selecting all rows from UtilityTransactions table
-- ==========================================================================================
Create Procedure [dbo].[UtilityTransactions_SelectAll]
As
Begin
	Select 
	*
	From UtilityTransactions
End
GO
/****** Object:  StoredProcedure [dbo].[UtilityTransactions_Insert]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	UtilityTransactions_Insert
-- Author:	Nsubuga Kasozi
-- Create date:	3/20/2016 1:06:57 AM
-- Description:	This stored procedure is intended for inserting values to UtilityTransactions table
-- ==========================================================================================
CREATE Procedure [dbo].[UtilityTransactions_Insert]
	@CustomerRef varchar(50),
	@CustomerName varchar(100),
	@CustomerType varchar(50),
	@CustomerTel varchar(50),
	@Area varchar(50),
	@Tin varchar(50),
	@TranAmount money,
	@PaymentDate datetime,
	@TranType varchar(50),
	@PaymentType varchar(50),
	@BankTranId varchar(100),
	@TranNarration varchar(MAX),
	@BankCode varchar(50),
	@Teller varchar(50),
	@Reversal bit,
	@UtilityCode varchar(50),
	@BranchCode varchar(50)
As
if not exists(select * from UtilityTransactions where BankCode=@BankCode and BanktranId=@BankTranId)
Begin
	Insert Into UtilityTransactions
		([CustomerRef],[CustomerName],
		[CustomerType],[CustomerTel],
		[Area],[Tin],[TranAmount],
		[PaymentDate],[RecordDate],
		[TranType],[PaymentType],
		[BankTranId],[TranNarration],
		[BankCode],[Teller],
		[Reversal],[UtilityCode],
		[SentToUtility],[Status],BranchCode)
	Values
		(@CustomerRef,@CustomerName,
		@CustomerType,@CustomerTel,
		@Area,@Tin,@TranAmount,
		@PaymentDate,GETDATE(),
		@TranType,@PaymentType,
		@BankTranId,@TranNarration,
		@BankCode,@Teller,
		@Reversal,@UtilityCode,
		0,'PENDING',@BranchCode)
	Select @@IDENTITY as InsertedID

End
Else
Begin
	Select TranId as InsertedID from UtilityTransactions where BankCode=@BankCode and BanktranId=@BankTranId
End
GO
/****** Object:  StoredProcedure [dbo].[UtilityTransactions_DeleteRow]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	UtilityTransactions_DeleteRow
-- Author:	Nsubuga Kasozi
-- Create date:	3/20/2016 1:06:57 AM
-- Description:	This stored procedure is intended for deleting a specific row from UtilityTransactions table
-- ==========================================================================================
Create Procedure [dbo].[UtilityTransactions_DeleteRow]
	@TranId bigint
As
Begin
	Delete UtilityTransactions
	Where
		[TranId] = @TranId

End
GO
/****** Object:  StoredProcedure [dbo].[DeleteMerchantById]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[DeleteMerchantById]
@BankCode varchar(50),
@Id varchar(50),
@ModifiedBy varchar(50)
as
Begin Transaction Deleter
Begin Try
Declare @accNumber varchar(100);
Declare @ErrorMsg varchar(max);

--pick the account number
Select top 1 @accNumber=AccNumber from BankAccounts where AccountCode=@Id

-- we should not delete a merchant who has transactions in the general table
--it will lead to a problem with End of Day service and reporting on such
--transactions
if exists (select top 1 * from GeneralLedgerTable where AccountNumber=@accNumber)
Begin
	--throw an exception inorder to roll back
	set @ErrorMsg = 'This Merchant has some transactions done Againist His Profile. You can only Deactivate them';
	RAISERROR (@ErrorMsg, -- Message text.
					   16,    -- Severity.
					   1      -- State.
					   );	RETURN
End
Else
Begin
	--transfer to the deleted accounts table
	Insert into dbo.DeletedBankAccounts
	Select *,@ModifiedBy as DeletedBy,GETDATE() as DeletedOn from BankAccounts
	where AccountCode=@Id
	Delete from BankAccounts where AccountCode=@Id
End
Commit Transaction Deleter
END try
BEGIN Catch
Rollback Transaction Deleter
DECLARE
   @ErMessage NVARCHAR(2048),
   @ErSeverity INT,
   @ErState INT
 
 SELECT
   @ErMessage = ERROR_MESSAGE(),
   @ErSeverity = ERROR_SEVERITY(),
   @ErState = ERROR_STATE()
 
 RAISERROR (@ErMessage,
             @ErSeverity,
             @ErState )
END Catch
GO
/****** Object:  StoredProcedure [dbo].[SystemSettings_Insert]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	SystemSettings_Insert
-- Author:	Nsubuga Kasozi
-- Create date:	4/14/2016 12:41:16 AM
-- Description:	This stored procedure is intended for inserting values to SystemSettings table
-- ==========================================================================================
Create Procedure [dbo].[SystemSettings_Insert]
	@BankCode varchar(50),
	@SettingCode varchar(50),
	@SettingValue varchar(50),
	@ModifiedBy varchar(50),
	@CreatedBy varchar(50),
	@ModifiedOn datetime,
	@CreatedOn datetime
As
Begin
	Insert Into SystemSettings
		([BankCode],[SettingCode],[SettingValue],[ModifiedBy],[CreatedBy],[ModifiedOn],[CreatedOn])
	Values
		(@BankCode,@SettingCode,@SettingValue,@ModifiedBy,@CreatedBy,@ModifiedOn,@CreatedOn)

	Declare @ReferenceID int
	Select @ReferenceID = @@IDENTITY

	Return @ReferenceID

End
GO
/****** Object:  StoredProcedure [dbo].[SystemSettings_DeleteRow]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	SystemSettings_DeleteRow
-- Author:	Nsubuga Kasozi
-- Create date:	4/14/2016 12:41:16 AM
-- Description:	This stored procedure is intended for deleting a specific row from SystemSettings table
-- ==========================================================================================
Create Procedure [dbo].[SystemSettings_DeleteRow]
	@ValueID bigint
As
Begin
	Delete SystemSettings
	Where
		[ValueID] = @ValueID

End
GO
/****** Object:  StoredProcedure [dbo].[PaymentTypes_Update]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[PaymentTypes_Update]
@PaymentTypeCode varchar(50),
@PaymentTypeName varchar(50),
@BankCode varchar(50),
@ModifiedBy varchar(50),
@IsActive varchar(50)
as
Begin Transaction trans
Begin try
If exists(Select * from PaymentTypes where PaymentTypeCode=@PaymentTypeCode and BankCode=@BankCode)
Begin
	Update PaymentTypes set 
	PaymentTypeName=@PaymentTypeName,
	ModifiedBy=@ModifiedBy,
	ModifiedOn=GETDATE()
	where PaymentTypeCode=@PaymentTypeCode and BankCode=@BankCode

	Select @PaymentTypeCode as InsertedId
End
Else
Begin
	Insert into PaymentTypes(PaymentTypeCode,PaymentTypeName,BankCode,ModifiedBy,CreatedBy,ModifiedOn,CreatedOn)
	values(@PaymentTypeCode,@PaymentTypeName,@BankCode,@ModifiedBy,@ModifiedBy,GETDATE(),GETDATE())
	
	Select @PaymentTypeCode as InsertedId
End
---------------------------------------------------------------------
Commit Transaction Trans

END TRY
BEGIN CATCH

ROLLBACK Transaction Trans

  DECLARE
   @ErMessage NVARCHAR(2048),
   @ErSeverity INT,
   @ErState INT
 
 SELECT
   @ErMessage = ERROR_MESSAGE(),
   @ErSeverity = ERROR_SEVERITY(),
   @ErState = ERROR_STATE()
 
 RAISERROR (@ErMessage,
             @ErSeverity,
             @ErState )
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[PaymentTypes_SelectRow]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[PaymentTypes_SelectRow]
	@PaymentTypeCode varchar(50),
	@bankcode varchar(50)
As
Begin
	Select *
	From PaymentTypes
	Where
		BankCode=@bankcode and PaymentTypeCode=@PaymentTypeCode
End
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetAccountBalance]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[fn_GetAccountBalance](@BankCode varchar(50),@AccountNumber varchar(50))
  RETURNS money
      AS
    BEGIN
		DECLARE @res varchar(50)
		
		DECLARE @ClosingBalance money
		DECLARE @AccountingDate bigint

		select top 1 @AccountingDate = AccountingDate,@ClosingBalance = ClosingBalance from  dbo.AccountEODBalances
		where AccountNumber = @AccountNumber
		and BankCode=@BankCode
		order by AccountingDate desc

		--SET @res=(
		--select ISNULL( @ClosingBalance,0)+ ISNULL( SUM(case when TranType = 'DEBIT' then TranAmountInAccountCurrency*-1 else TranAmountInAccountCurrency end),0)
		--from GeneralLedgerTable 
		--where AccountNumber = @AccountNumber and AccountingDate > @AccountingDate
		--)
		
		SET @res=(
		select ISNULL( @ClosingBalance,0)+ ISNULL( SUM(TranAmountInAccountCurrency),0)
		from GeneralLedgerTable 
		where BankCode=@BankCode and AccountNumber = @AccountNumber and AccountingDate > @AccountingDate
		)

	    
		return @res
    END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetAccountStatus]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[fn_GetAccountStatus](@accNumber varchar(50))
  RETURNS varchar(50)
      AS
    BEGIN
		DECLARE @res varchar(50)
		
		 declare @today date = (select(CONVERT(date,GETDATE(),105)))
		declare @lastDate datetime = (select top 1 RecordDate from GeneralLedgerTable where AccountNumber=@accNumber order by RecordDate desc)
		if @lastDate is null set @lastDate =(select CreatedOn from BankAccounts where AccNumber=@accNumber)
		declare @active bit = (select IsActive from BankAccounts where AccNumber=@accNumber)
		
		if @active=0
		  set @res = 'INACTIVE'
		else
	      begin
	        if DATEDIFF(day, @lastDate, GETDATE())>30
	          
	          set @res = 'DORMANT'
	        else
	          set @res = 'ACTIVE'
	      end
	      
		return @res
    END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetAccountPeriodSum]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[fn_GetAccountPeriodSum](@BankCode varchar(50),@BranchCode varchar(50),@AccountNumber varchar(50),@StartDate bigint,@EndDate bigint, @AccountType varchar(50),@TranType varchar(50),@isProductAccount bit)
  RETURNS money
      AS
    BEGIN
		declare @AmountSum money
		if(@isProductAccount=1)
		BEGIN
				select @AmountSum=ISNULL((SUM(case when upper(V.TranType) = @TranType then V.TranAmount else 0 end)),0)
				from GeneralLedgerTable AS V 
				inner join
				BankAccounts AS A on A.AccNumber= V.AccountNumber
				where A.AccType = @AccountType and A.BankCode=@BankCode and A.BranchCode=@BranchCode and (AccountingDate>=@StartDate and AccountingDate <=@EndDate)
		END
		ELSE
		BEGIN
				select @AmountSum=ISNULL((SUM(case when upper(V.TranType) = @TranType then V.TranAmount else 0 end)),0)
				from GeneralLedgerTable AS V 
				inner join
				BankAccounts AS A on A.AccNumber= V.AccountNumber
				where V.AccountNumber=@AccountNumber and A.BankCode=@BankCode and A.BranchCode=@BranchCode and (AccountingDate>=@StartDate and AccountingDate <=@EndDate)
		END
		return @AmountSum
    END
GO
/****** Object:  StoredProcedure [dbo].[TransactionRules_Update]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	TransactionRules_Update
-- Author:	Nsubuga Kasozi
-- Create date:	1/3/2016 10:19:17 PM
-- Description:	This stored procedure is intended for updating TransactionRules table
-- ==========================================================================================
CREATE Procedure [dbo].[TransactionRules_Update]
	@RecordId varchar(50),
	@RuleName varchar(50),
	@RuleCode varchar(50),
	@UserId varchar(50),
	@Description varchar(150),
	@MinimumAmount money,
	@MaximumAmount money,
	@IsActive bit,
	@BankCode varchar(50),
	@BranchCode varchar(50),
	@ModifiedBy varchar(50),
	@Approver varchar(50)
As
Begin Transaction trans
Begin try
if exists(select * from TransactionRules where BankCode=@BankCode and RuleCode=@RuleCode)
Begin
	Update TransactionRules
	Set
		[RuleName] = @RuleName,
		[RuleCode] = @RuleCode,
		[UserId] = @UserId,
		[Description] = @Description,
		[MinimumAmount] = @MinimumAmount,
		[MaximumAmount] = @MaximumAmount,
		[IsActive] = @IsActive,
		[BankCode] = @BankCode,
		[BranchCode] = @BranchCode,
		[ModifiedOn] = GETDATE(),
		[ModifiedBy] = @ModifiedBy,
		Approver=@Approver
	Where		
		BankCode=@BankCode and RuleCode=@RuleCode
	Select @RuleCode as InsertedId

End
Else
Begin
    Insert Into TransactionRules
		([RuleName],[RuleCode],[UserId],[Description],[MinimumAmount],[MaximumAmount],[IsActive],[BankCode],[BranchCode],[CreatedOn],[ModifiedOn],[CreatedBy],[ModifiedBy],Approver)
	Values
		(@RuleName,@RuleCode,@UserId,@Description,@MinimumAmount,@MaximumAmount,@IsActive,@BankCode,@BranchCode,GETDATE(),GETDATE(),@ModifiedBy,@ModifiedBy,@Approver)
	Select @RuleCode as InsertedId
End
---------------------------------------------------------------------
Commit Transaction Trans

END TRY
BEGIN CATCH

ROLLBACK Transaction Trans

  DECLARE
   @ErMessage NVARCHAR(2048),
   @ErSeverity INT,
   @ErState INT
 
 SELECT
   @ErMessage = ERROR_MESSAGE(),
   @ErSeverity = ERROR_SEVERITY(),
   @ErState = ERROR_STATE()
 
 RAISERROR (@ErMessage,
             @ErSeverity,
             @ErState )
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[TransactionRules_SelectRow]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	TransactionRules_SelectRow
-- Author:	Nsubuga Kasozi
-- Create date:	1/3/2016 10:19:17 PM
-- Description:	This stored procedure is intended for selecting a specific row from TransactionRules table
-- ==========================================================================================
CREATE Procedure [dbo].[TransactionRules_SelectRow]
	@BranchCode varchar(50),
	@BankCode varchar(50)
As
Begin
	Select 
		*
	From TransactionRules
	Where
		RuleCode=@BranchCode and BankCode=@BankCode
End
GO
/****** Object:  StoredProcedure [dbo].[TransactionRules_SelectAll]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	TransactionRules_SelectAll
-- Author:	Nsubuga Kasozi
-- Create date:	1/3/2016 10:19:17 PM
-- Description:	This stored procedure is intended for selecting all rows from TransactionRules table
-- ==========================================================================================
Create Procedure [dbo].[TransactionRules_SelectAll]
As
Begin
	Select 
		*
	From TransactionRules
End
GO
/****** Object:  StoredProcedure [dbo].[TransactionRules_Insert]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	TransactionRules_Insert
-- Author:	Nsubuga Kasozi
-- Create date:	1/3/2016 10:19:17 PM
-- Description:	This stored procedure is intended for inserting values to TransactionRules table
-- ==========================================================================================
Create Procedure [dbo].[TransactionRules_Insert]
	@RuleName varchar(50),
	@RuleCode varchar(50),
	@UserId varchar(50),
	@Description varchar(150),
	@MinimumAmount money,
	@MaximumAmount money,
	@IsActive bit,
	@BankCode varchar(50),
	@BranchCode varchar(50),
	@CreatedOn datetime,
	@ModifiedOn datetime,
	@CreatedBy varchar(50),
	@ModifiedBy varchar(50)
As
Begin
	Insert Into TransactionRules
		([RuleName],[RuleCode],[UserId],[Description],[MinimumAmount],[MaximumAmount],[IsActive],[BankCode],[BranchCode],[CreatedOn],[ModifiedOn],[CreatedBy],[ModifiedBy])
	Values
		(@RuleName,@RuleCode,@UserId,@Description,@MinimumAmount,@MaximumAmount,@IsActive,@BankCode,@BranchCode,@CreatedOn,@ModifiedOn,@CreatedBy,@ModifiedBy)

	Declare @ReferenceID int
	Select @ReferenceID = @@IDENTITY

	Return @ReferenceID

End
GO
/****** Object:  StoredProcedure [dbo].[TransactionRules_DeleteRow]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	TransactionRules_DeleteRow
-- Author:	Nsubuga Kasozi
-- Create date:	1/3/2016 10:19:17 PM
-- Description:	This stored procedure is intended for deleting a specific row from TransactionRules table
-- ==========================================================================================
Create Procedure [dbo].[TransactionRules_DeleteRow]
	@RecordId int
As
Begin
	Delete TransactionRules
	Where
		[RecordId] = @RecordId

End
GO
/****** Object:  StoredProcedure [dbo].[GetMerchantCustomerDetails2]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetMerchantCustomerDetails2]
@AccountCode varchar(50),
@CustomerRef varchar(50)

AS
select AccountCode,CustomerRef,CustomerName,CustomerTel,Amount,IsActive,CreatedOn,CreatedBy,ApprovedBy 
from MerchantCustomers 
where 
AccountCode=@AccountCode 
and ((CustomerRef=@CustomerRef) or (CustomerName like '%'+@CustomerRef+'%') or (@CustomerRef = ''))
and (ApprovedBy!='' or ApprovedBy is not null)
GO
/****** Object:  StoredProcedure [dbo].[GetMerchantCustomerDetails_Extras]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetMerchantCustomerDetails_Extras]
@AccountCode varchar(50),
@CustomerRef varchar(50),
@CustomerName varchar(50),
@extraParam varchar(50),
@extraValue varchar(50)

AS

if (lower(@extraParam)='extra1')
select RecordId,CustomerRef,CustomerTel,CustomerName,IsActive,AccountCode,CreatedOn,Extra1 as 'Association',Extra2 as 'Farmer Group',Extra3 as 'Outstanding Balance'
 from MerchantCustomers where 
AccountCode=@AccountCode 
and
((CustomerRef=@CustomerRef or @CustomerRef = '')
or 
(CustomerName=@CustomerName or @CustomerName = '')) 
and (Extra1=@extraValue or @extraValue='')
else if (lower(@extraParam)='extra2')
select RecordId,CustomerRef,CustomerTel,CustomerName,IsActive,AccountCode,CreatedOn,Extra1 as 'Association',Extra2 as 'Farmer Group',Extra3 as 'Outstanding Balance'
  from MerchantCustomers where 
AccountCode=@AccountCode 
and
((CustomerRef=@CustomerRef or @CustomerRef = '')
or 
(CustomerName=@CustomerName or @CustomerName = ''))
and (Extra2=@extraValue or @extraValue='')
else if (lower(@extraParam)='extra3')
select RecordId,CustomerRef,CustomerTel,CustomerName,IsActive,AccountCode,CreatedOn,Extra1 as 'Association',Extra2 as 'Farmer Group',Extra3 as 'Outstanding Balance'
 from MerchantCustomers where 
AccountCode=@AccountCode 
and
((CustomerRef=@CustomerRef or @CustomerRef = '')
or 
(CustomerName=@CustomerName or @CustomerName = ''))
and (Extra3=@extraValue or @extraValue='')
else 
select RecordId,CustomerRef,CustomerTel,CustomerName,IsActive,AccountCode,CreatedOn,Extra1 as 'Association',Extra2 as 'Farmer Group',Extra3 as 'Outstanding Balance'
 from MerchantCustomers where 
AccountCode=@AccountCode 
and
((CustomerRef=@CustomerRef or @CustomerRef = '')
or 
(CustomerName=@CustomerName or @CustomerName = ''))
GO
/****** Object:  StoredProcedure [dbo].[GetMerchantCustomerDetails]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetMerchantCustomerDetails]
@AccountCode varchar(50),
@CustomerRef varchar(50),
@CustomerName varchar(50)

AS

select RecordId,CustomerRef,CustomerTel,CustomerName,IsActive,AccountCode,CreatedOn from MerchantCustomers where 
AccountCode=@AccountCode 
and
((CustomerRef=@CustomerRef or @CustomerRef = '')
or 
(CustomerName=@CustomerName or @CustomerName = ''))
GO
/****** Object:  StoredProcedure [dbo].[GetMerchantCustomerById]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetMerchantCustomerById]
@AccountCode varchar(50),
@CustomerRef varchar(50)

AS
select AccountCode,CustomerRef,CustomerName,CustomerTel,IsActive,CreatedOn,CreatedBy,BankCode,Extra1,Extra2,Extra3 from MerchantCustomers where 
AccountCode=@AccountCode 
and
(CustomerRef=@CustomerRef)
GO
/****** Object:  StoredProcedure [dbo].[SearchGeneralLedgerTable3]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SearchGeneralLedgerTable3]
@BankCode varchar(50),
@BranchCode varchar(50),
@Teller varchar(50),
@AccountNumber varchar(50),
@CustomerName varchar(50),
@TransCategory varchar(50),
@BankId varchar(50),
@PegPayId varchar(50),
@FromDate varchar(50),
@ToDate varchar(50),
@Reason varchar(50)
as
--if @TransCategory='ALL'
begin
   Select
	   G.BankTranId as 'External TranId',
	   G.CustomerRef,
	   G.CustomerName,
	   G.CustomerTel,
       G.TranAmount as 'Amount',
       B.AccountCode as 'Merchant Code',B.AccountName as Merchant,
	   G.PaymentType,G.RecordDate as 'Payment Date',G.Narration,G.Teller as 'Till Code'
	from GeneralLedgerTable AS G with(nolock) 
	inner Join 
	BankAccounts AS B on B.AccNumber=G.AccountNumber
	where
			(G.BankCode=@BankCode or @BankCode='ALL') and
			(G.BranchCode=@BranchCode or @BranchCode='ALL') and
			(Teller=@Teller or @Teller='') and
			(B.AccountCode=@AccountNumber or @AccountNumber='') and 
			((G.CustomerName like '%'+@CustomerName+'%') or @CustomerName='') and
			(G.TranCategory=@TransCategory or @TransCategory='ALL') and 
			(G.BankTranId=@BankId or ChequeNumber=@BankId or @BankId='') and 
			(G.PegPayTranId=@PegPayId or @PegPayId='') and 
			(G.PaymentDate>=@FromDate or @FromDate='') and 
			(G.PaymentDate<=@ToDate or @ToDate='') and
			((G.Narration like '%'+@Reason+'%') or (@Reason=''))
	order by G.RecordDate desc
end
GO
/****** Object:  StoredProcedure [dbo].[SearchGeneralLedgerTable]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SearchGeneralLedgerTable]
@BankCode varchar(50),
@BranchCode varchar(50),
@Teller varchar(50),
@AccountNumber varchar(50),
@CustomerName varchar(50),
@TransCategory varchar(50),
@BankId varchar(50),
@PegPayId varchar(50),
@FromDate varchar(50),
@ToDate varchar(50),
@Reason varchar(50)
as
Select
	   G.PegPayTranId as 'Transaction Id',B.AccountCode as 'Merchant Code',B.AccountName as Merchant,
       G.TranAmount as 'Transaction Amount',
	   G.TranType as 'Transaction Type',G.RecordDate as 'Payment Date',G.Narration,G.Teller as 'Teller'
	   
from GeneralLedgerTable AS G with(nolock) 
inner Join 
BankAccounts AS B on B.AccNumber=G.AccountNumber
where
        (G.TranType='Credit') and
		(G.BankCode=@BankCode or @BankCode='ALL') and
		(G.BranchCode=@BranchCode or @BranchCode='ALL') and
		(Teller=@Teller or @Teller='') and
		(B.AccountCode=@AccountNumber or @AccountNumber='') and 
		((G.CustomerName like '%'+@CustomerName+'%') or @CustomerName='') and
		(G.TranCategory=@TransCategory or @TransCategory='ALL') and 
		(G.BankTranId=@BankId or @BankId='') and 
		(G.PegPayTranId=@PegPayId or @PegPayId='') and 
		(G.PaymentDate>=@FromDate or @FromDate='') and 
		(G.PaymentDate<=@ToDate or @ToDate='') and
		((G.Narration like '%'+@Reason+'%') or (@Reason=''))

order by RecordDate desc
GO
/****** Object:  StoredProcedure [dbo].[SearchMerchantsTable]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SearchMerchantsTable]
@BankCode varchar(50),
@MerchantName varchar(50)
as

SELECT AccountCode,AccountName as MerchantName,AccountCategory,A.IsActive,
(case A.IsReferenced when 1 then 'YES' else 'NO' end) as Referenced  
FROM BankAccounts AS A
 inner join
 Banks AS B on B.BankCode=A.BankCode
 inner join 
 BankBranches AS L on L.BranchCode=A.BranchCode
 Left Join
 LiquidationTypes  As T on T.LiquidationCode=A.LiquidationType
WHERE
A.BankCode=@BankCode and
((@MerchantName='')or(A.AccountCode like '%'+@MerchantName+'%') or (A.AccountName like '%'+@MerchantName+'%'))
GO
/****** Object:  StoredProcedure [dbo].[SearchMercahantCustomersTableForCustomersPendingDeletion]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SearchMercahantCustomersTableForCustomersPendingDeletion]
@BankCode varchar(50),
@MerchantCode varchar(50),
@CustRef varchar(50),
@UserId varchar(50)
as
Select RecordId as ApprovalId,CustomerRef,CustomerName,CustomerTel,MarkedForDeletion,MarkedForDeletionOn,MarkedForDeletionBy from MerchantCustomers where 
BankCode=@BankCode and 
AccountCode=@MerchantCode and 
(MarkedForDeletion=1) and
((@CustRef='' or CustomerRef=@CustRef or CustomerName like '%'+@Custref+'%'))
GO
/****** Object:  StoredProcedure [dbo].[SearchMercahantCustomersTable]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SearchMercahantCustomersTable]
@BankCode varchar(50),
@MerchantCode varchar(50),
@CustRef varchar(50),
@UserId varchar(50)
as
Select RecordId as ApprovalId,CustomerRef,CustomerName,CustomerTel,IsActive,CreatedOn,CreatedBy from MerchantCustomers where 
BankCode=@BankCode and 
AccountCode=@MerchantCode and 
(ApprovedBy='' or ApprovedBy is NULL) and
((@CustRef='' or CustomerRef=@CustRef or CustomerName like '%'+@Custref+'%'))
GO
/****** Object:  StoredProcedure [dbo].[SearchLoanRequestsTable]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SearchLoanRequestsTable]
@BankCode varchar(50),
@BranchCode varchar(50),
@CustomerID varchar(50),
@AccountNumber varchar(50),
@FromDate varchar(50),
@ToDate varchar(50),
@UserType varchar(50)
as
Select LoanID,LoanAmount,
AccountNumber,LoanAccountNumber,
LoanType,
Count(CustomerId)as NumberOfExistingLoans
from Loans 
where 
BankCode=@BankCode and 
(BranchCode=@BranchCode or @BranchCode='ALL') and 
Status='PENDING APPROVAL' and 
Approver=@UserType
and (AccountNumber=@AccountNumber or @AccountNumber='')
and (CustomerId=@CustomerID or @CustomerID='')
and (CONVERT(char(10),CreatedOn,121)>=@FromDate or @FromDate='')
and  (CONVERT(char(10),CreatedOn,121)<=@ToDate or @ToDate='')
Group by CustomerId,LoanID,LoanAmount,LoanAccountNumber,CustomerTel,MonthlyInstallmentAmounts,InterestRate,AccountNumber,LoanType,CustomerCreditScore
GO
/****** Object:  StoredProcedure [dbo].[SearchGeneralLiquidationReport]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SearchGeneralLiquidationReport]
@BankCode varchar(50),
@BranchCode varchar(50),
@Teller varchar(50),
@AccountNumber varchar(50),
@CustomerName varchar(50),
@TransCategory varchar(50),
@BankId varchar(50),
@PegPayId varchar(50),
@FromDate bigint,
@ToDate bigint
AS

Select B.AccountCode AS TillNumber,CONVERT(varchar, CAST(TranAmountInAccountCurrency AS Money),1) AS Amount,TranType,TranCategory,
Case when TranCategory='WEB_LIQUIDATION_PAYMENT' then 'PENDING'ELSE 'SUCCESS' end AS Status from GeneralLedgerTable AS G 
Left Join BankAccounts AS B on B.AccNumber=G.AccountNumber
where 
G.AccountNumber=@AccountNumber
and (G.TranType='Credit' or TranCategory='WEB_LIQUIDATION_PAYMENT')
and G.BankCode=@BankCode 
and G.AccountNumber = @AccountNumber and
G.AccountingDate >= @ToDate
 and G.AccountingDate <= @ToDate
order by G.RecordId asc
GO
/****** Object:  StoredProcedure [dbo].[LogBankRequestResponse]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[LogBankRequestResponse]
@TranType varchar(50),
@OriginatorID varchar(50),
@BeneficiaryID varchar(50),
@TranAmt varchar(50),
@SrcTranRef varchar(50),
@TranDate varchar(50),
@msisdn varchar(50),
@ChannelType varchar(50),
@BankRef varchar(50),
@response varchar(50),
@description varchar(50),
@crnarrative varchar(50),
@drnarrative varchar(50)
AS

if not exists(select * from BankResponseLog where PegPayId=@SrcTranRef)
  begin
   INSERT INTO BankResponseLog
        (TranType,OriginatorId,BeneficiaryId,TranAmount,PegPayId,BankRef,TranDate,LogDate,Msisdn,Channel,StatusCode,StatusDescription,CRNarrative,DRNarrative) 
VALUES(@TranType,@OriginatorID,@BeneficiaryID,@TranAmt,@SrcTranRef,@BankRef,CONVERT(Datetime, @TranDate, 120),GETDATE(),@msisdn,@ChannelType,@response,@description,@crnarrative,@drnarrative)
  end
else 
  begin
    update BankResponseLog set
        StatusCode = @response,
        StatusDescription = @description,
        RetryDate = @TranDate
      where PegPayId=@SrcTranRef
  end
GO
/****** Object:  StoredProcedure [dbo].[LogBankRequestAndResponse]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[LogBankRequestAndResponse]
@TranType varchar(50),
@OriginatorID varchar(50),
@BeneficiaryID varchar(50),
@TranAmt varchar(50),
@SrcTranRef varchar(50),
@TranDate varchar(50),
@msisdn varchar(50),
@ChannelType varchar(50),
@BankRef varchar(50),
@response varchar(50),
@description varchar(50),
@crnarrative varchar(50),
@drnarrative varchar(50)
AS

if not exists(select * from BankResponseLog where PegPayId=@SrcTranRef)
  begin
   INSERT INTO BankResponseLog
        (TranType,OriginatorId,BeneficiaryId,TranAmount,PegPayId,BankRef,TranDate,LogDate,Msisdn,Channel,StatusCode,StatusDescription,CRNarrative,DRNarrative) 
VALUES(@TranType,@OriginatorID,@BeneficiaryID,@TranAmt,@SrcTranRef,@BankRef,CONVERT(Datetime, @TranDate, 120),GETDATE(),@msisdn,@ChannelType,@response,@description,@crnarrative,@drnarrative)
  end
else 
  begin
    update BankResponseLog set
        StatusCode = @response,
        StatusDescription = @description,
        RetryDate = @TranDate
      where PegPayId=@SrcTranRef
  end
GO
/****** Object:  StoredProcedure [dbo].[Loans_DeleteRow]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	Loans_DeleteRow
-- Author:	Nsubuga Kasozi
-- Create date:	3/31/2016 7:35:31 PM
-- Description:	This stored procedure is intended for deleting a specific row from Loans table
-- ==========================================================================================
Create Procedure [dbo].[Loans_DeleteRow]
	@RecordId int
As
Begin
	Delete Loans
	Where
		[RecordId] = @RecordId

End
GO
/****** Object:  StoredProcedure [dbo].[TransactionTypes_DeleteRow]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	sp_TransactionTypes_DeleteRow
-- Author:	Mehdi Keramati
-- Create date:	12/19/2015 10:45:02 PM
-- Description:	This stored procedure is intended for deleting a specific row from TransactionTypes table
-- ==========================================================================================
CREATE Procedure [dbo].[TransactionTypes_DeleteRow]
	@TranTypeId int
As
Begin
	Delete TransactionCategories
	Where
		[TranTypeId] = @TranTypeId

End
GO
/****** Object:  StoredProcedure [dbo].[SearchCurrenciesTable]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SearchCurrenciesTable]
@BankCode varchar(50),
@Id varchar(50)
as
Select CurrencyCode as Id,CurrencyCode,BankCode,ModifiedBy,ValueInLocalCurrency from Currencies where 
(BankCode=@BankCode or @BankCode='ALL') and 
(CurrencyCode=@Id or @Id='')
GO
/****** Object:  StoredProcedure [dbo].[LogInterfaceError]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[LogInterfaceError]
@BankId varchar(50),
@BankCode varchar(50),
@MerchantCode varchar(50),
@MerchantId varchar(50),
@Message varchar(max),
@ErrorType varchar(50),
@Method varchar(100)
AS

INSERT INTO Errorlogs([BankId],[BankCode],[MerchantCode],[MerchantId],[Message],[RecordDate],[ErrorType],[Method]) 
VALUES(@BankId,@BankCode,@MerchantCode,@MerchantId,@Message,GETDATE(),@ErrorType,@Method)
GO
/****** Object:  StoredProcedure [dbo].[Logerror]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[Logerror]

@Method varchar(max),
@Error varchar(max),
@TranId varchar(max)
AS

INSERT INTO EODErrors(Method,Error,TranId,RecordDate) VALUES(@Method,@Error,@TranId,GETDATE())
GO
/****** Object:  StoredProcedure [dbo].[LoanTypes_Update]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	LoanTypes_Update
-- Author:	Nsubuga Kasozi
-- Create date:	3/31/2016 5:20:18 PM
-- Description:	This stored procedure is intended for updating LoanTypes table
-- ==========================================================================================
CREATE Procedure [dbo].[LoanTypes_Update]
	@LoanTypeCode varchar(50),
	@LoanTypeName varchar(50),
	@BankCode varchar(50),
	@ModifiedBy varchar(50),
	@RequiresCollateral bit,
	@InterestRate decimal(18,2),
	@InterestType varchar(50),
	@GracePeriodInDays varchar(50),
	@LoanApplicationFee decimal(18,2),
	@LoanProcessingFee decimal(18,2)
As

If exists(Select * from LoanTypes where BankCode=@BankCode and LoanTypeCode=@LoanTypeCode)
Begin
	Update LoanTypes
	Set
		[LoanTypeCode] = @LoanTypeCode,
		[LoanTypeName] = @LoanTypeName,
		InterestRateAsPercentage=@InterestRate,
		[BankCode] = @BankCode,
		[ModifiedBy] = @ModifiedBy,
		ModifiedOn=GETDATE(),
		[RequiresCollateral] = @RequiresCollateral,
		InterestRateType=@InterestType,
		GracePeriodInDays=@GracePeriodInDays,
		LoanApplicationFee=@LoanApplicationFee,
		LoanProcessingFee=@LoanProcessingFee
	where 
		BankCode=@BankCode and LoanTypeCode=@LoanTypeCode
		
		Select @LoanTypeCode as InsertedID
End
Else
Begin
	Insert Into LoanTypes
		([LoanTypeCode],[LoanTypeName],[BankCode],
		InterestRateAsPercentage,
		[ModifiedOn],[CreatedOn],
		[ModifiedBy],[CreatedBy],
		[RequiresCollateral],InterestRateType,GracePeriodInDays,LoanApplicationFee,LoanProcessingFee)
	Values
		(@LoanTypeCode,@LoanTypeName,@BankCode,
		@InterestRate,
		GETDATE(),GETDATE(),
		@ModifiedBy,@ModifiedBy,
		@RequiresCollateral,@InterestType,@GracePeriodInDays,@LoanApplicationFee,@LoanProcessingFee)

		Select @LoanTypeCode as InsertedID
End
GO
/****** Object:  StoredProcedure [dbo].[LoanTypes_SelectRow]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	LoanTypes_SelectRow
-- Author:	Nsubuga Kasozi
-- Create date:	3/31/2016 5:20:18 PM
-- Description:	This stored procedure is intended for selecting a specific row from LoanTypes table
-- ==========================================================================================
Create Procedure [dbo].[LoanTypes_SelectRow]
	@LoanTypeCode varchar(50),
	@BankCode varchar(50)
As
Begin
	Select *
	From LoanTypes
	Where
		LoanTypeCode=@LoanTypeCode and BankCode=@BankCode
End
GO
/****** Object:  StoredProcedure [dbo].[LoanTypes_SelectAll]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	LoanTypes_SelectAll
-- Author:	Nsubuga Kasozi
-- Create date:	3/31/2016 5:20:18 PM
-- Description:	This stored procedure is intended for selecting all rows from LoanTypes table
-- ==========================================================================================
Create Procedure [dbo].[LoanTypes_SelectAll]
As
Begin
	Select *
	From LoanTypes
End
GO
/****** Object:  StoredProcedure [dbo].[LoanTypes_Insert]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	LoanTypes_Insert
-- Author:	Nsubuga Kasozi
-- Create date:	3/31/2016 5:20:18 PM
-- Description:	This stored procedure is intended for inserting values to LoanTypes table
-- ==========================================================================================
Create Procedure [dbo].[LoanTypes_Insert]
	@LoanTypeCode varchar(50),
	@LoanTypeName varchar(50),
	@MaximumRepaymentPeriodInMonths int,
	@BankCode varchar(50),
	@ModifiedOn datetime,
	@CreatedOn datetime,
	@ModifiedBy varchar(50),
	@CreatedBy varchar(50),
	@RequiresCollateral bit
As
Begin
	Insert Into LoanTypes
		([LoanTypeCode],[LoanTypeName],[MaximumRepaymentPeriodInMonths],[BankCode],[ModifiedOn],[CreatedOn],[ModifiedBy],[CreatedBy],[RequiresCollateral])
	Values
		(@LoanTypeCode,@LoanTypeName,@MaximumRepaymentPeriodInMonths,@BankCode,@ModifiedOn,@CreatedOn,@ModifiedBy,@CreatedBy,@RequiresCollateral)

	Declare @ReferenceID int
	Select @ReferenceID = @@IDENTITY

	Return @ReferenceID

End
GO
/****** Object:  StoredProcedure [dbo].[LoanTypes_DeleteRow]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	LoanTypes_DeleteRow
-- Author:	Nsubuga Kasozi
-- Create date:	3/31/2016 5:20:18 PM
-- Description:	This stored procedure is intended for deleting a specific row from LoanTypes table
-- ==========================================================================================
Create Procedure [dbo].[LoanTypes_DeleteRow]
	@RecordId int
As
Begin
	Delete LoanTypes
	Where
		[RecordId] = @RecordId

End
GO
/****** Object:  StoredProcedure [dbo].[Loans_Update]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	Loans_Update
-- Author:	Nsubuga Kasozi
-- Create date:	3/31/2016 7:35:31 PM
-- Description:	This stored procedure is intended for updating Loans table
-- ==========================================================================================
CREATE Procedure [dbo].[Loans_Update]
	@RecordId int,
	@LoanAmount decimal,
	@CustomerId varchar(50),
	@CustomerTel varchar(50),
	@AccountNumber varchar(50),
	@LoanType varchar(50),
	@CustomerCreditScore decimal,
	@CollateralId varchar(50),
	@MonthlyInstallmentAmounts varchar(50),
	@InterestRate varchar(50),
	@BankCode varchar(50),
	@ModifiedBy varchar(50),
	@CreatedBy varchar(50),
	@ModifiedOn datetime,
	@CreatedOn datetime,
	@ApprovedBy varchar(50),
	@Status varchar(50)
As
Begin
	Update Loans
	Set
		[LoanAmount] = @LoanAmount,
		[CustomerId] = @CustomerId,
		[CustomerTel] = @CustomerTel,
		[AccountNumber] = @AccountNumber,
		[LoanType] = @LoanType,
		[CustomerCreditScore] = @CustomerCreditScore,
		[MonthlyInstallmentAmounts] = @MonthlyInstallmentAmounts,
		[InterestRate] = @InterestRate,
		[BankCode] = @BankCode,
		[ModifiedBy] = @ModifiedBy,
		[CreatedBy] = @CreatedBy,
		[ModifiedOn] = @ModifiedOn,
		[CreatedOn] = @CreatedOn,
		[ApprovedBy] = @ApprovedBy,
		[Status] = @Status
	Where		
		[RecordId] = @RecordId

End
GO
/****** Object:  StoredProcedure [dbo].[Loans_SelectRow]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	Loans_SelectRow
-- Author:	Nsubuga Kasozi
-- Create date:	3/31/2016 7:35:31 PM
-- Description:	This stored procedure is intended for selecting a specific row from Loans table
-- ==========================================================================================
CREATE Procedure [dbo].[Loans_SelectRow]
	@LoanID varchar(50),
	@BankCode varchar(50)
As
Begin
	Select *
	From Loans
	Where
		LoanID=@LoanID and BankCode=@BankCode
End
GO
/****** Object:  StoredProcedure [dbo].[Loans_SelectAll]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	Loans_SelectAll
-- Author:	Nsubuga Kasozi
-- Create date:	3/31/2016 7:35:31 PM
-- Description:	This stored procedure is intended for selecting all rows from Loans table
-- ==========================================================================================
Create Procedure [dbo].[Loans_SelectAll]
As
Begin
	Select *
	From Loans
End
GO
/****** Object:  StoredProcedure [dbo].[SearchPaymentsGatewayTable_External]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SearchPaymentsGatewayTable_External]
@email varchar(50),
@tranId varchar(50),
@fromdate varchar(50),
@endDate varchar(50)
as
select VendorTranId as TranId, TranAmount,PaymentOptionSelected,RecordDate,Status,TransactionRef as ExternalTranID from PaymentsGatewayRequests 
where 
(@tranId='' or TransactionRef=@tranId)
and 
((CONVERT(Date,RecordDate)>=@fromdate or @fromdate='') and (CONVERT(Date,RecordDate)<=@endDate or @endDate=''))
and
(@email='' or Email like '%'+@email+'%' or CustomerTel like '%'+@email+'%')
order by RecordDate desc
GO
/****** Object:  StoredProcedure [dbo].[SearchPaymentsGatewayTable]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SearchPaymentsGatewayTable]
@vendorCode varchar(50),
@email varchar(50),
@status varchar(50),
@fromdate varchar(50),
@endDate varchar(50)
as
select CustomerTel,CustName,TranAmount,Email,PaymentOptionSelected,RecordDate,Status from PaymentsGatewayRequests 
where 
(Status=@status or @status='ALL')
and 
((RecordDate>=@fromdate or @fromdate='') and (RecordDate<=@endDate or @endDate=''))
and
(@email='' or Email like '%'+@email+'%' or CustomerTel like '%'+@email+'%')
order by RecordDate desc
GO
/****** Object:  StoredProcedure [dbo].[RepaymentFrequencies_Update]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[RepaymentFrequencies_Update]
	@RepaymentFreqCode varchar(50),
	@RepaymentFreqName varchar(50),
	@DurationInDays decimal(18,2),
	@BankCode varchar(50),
	@ModifiedBy varchar(50)
As
If exists(select * from RepaymentFrequencies where RepaymentFreqCode=@RepaymentFreqCode and BankCode=@BankCode)
Begin
	Update RepaymentFrequencies
	Set
		[RepaymentFreqName] = @RepaymentFreqName,
		[DurationInDays] = @DurationInDays,
		[BankCode] = @BankCode,
		[ModifiedBy] = @ModifiedBy,
		[ModifiedOn] = GETDATE()
	Where		
		RepaymentFreqCode=@RepaymentFreqCode and BankCode=@BankCode
		Select @RepaymentFreqCode as InsertedID
End
Else
Begin
	Insert Into RepaymentFrequencies
		([RepaymentFreqCode],[RepaymentFreqName],[DurationInDays],[BankCode],[ModifiedBy],[CreatedBy],[ModifiedOn],[CreatedOn])
	Values
		(@RepaymentFreqCode,@RepaymentFreqName,@DurationInDays,@BankCode,@ModifiedBy,@ModifiedBy,GETDATE(),GETDATE())
	Select @RepaymentFreqCode as InsertedID
End
GO
/****** Object:  StoredProcedure [dbo].[RepaymentFrequencies_SelectRow]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	RepaymentFrequencies_SelectRow
-- Author:	Nsubuga Kasozi
-- Create date:	4/25/2016 12:21:36 AM
-- Description:	This stored procedure is intended for selecting a specific row from RepaymentFrequencies table
-- ==========================================================================================
CREATE Procedure [dbo].[RepaymentFrequencies_SelectRow]
	@freqCode varchar(50),
	@BankCode varchar(50)
As
Begin
	Select *
	From RepaymentFrequencies
	Where
		(BankCode=@BankCode or BankCode='ALL') and RepaymentFreqCode=@freqCode
End
GO
/****** Object:  StoredProcedure [dbo].[RepaymentFrequencies_SelectAll]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	RepaymentFrequencies_SelectAll
-- Author:	Nsubuga Kasozi
-- Create date:	4/25/2016 12:21:36 AM
-- Description:	This stored procedure is intended for selecting all rows from RepaymentFrequencies table
-- ==========================================================================================
Create Procedure [dbo].[RepaymentFrequencies_SelectAll]
As
Begin
	Select *
	From RepaymentFrequencies
End
GO
/****** Object:  StoredProcedure [dbo].[RepaymentFrequencies_Insert]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	RepaymentFrequencies_Insert
-- Author:	Nsubuga Kasozi
-- Create date:	4/25/2016 12:21:36 AM
-- Description:	This stored procedure is intended for inserting values to RepaymentFrequencies table
-- ==========================================================================================
Create Procedure [dbo].[RepaymentFrequencies_Insert]
	@RepaymentFreqCode varchar(50),
	@RepaymentFreqName varchar(50),
	@DurationInDays varchar(50),
	@BankCode varchar(50),
	@ModifiedBy varchar(50),
	@CreatedBy varchar(50),
	@ModifiedOn datetime,
	@CreatedOn datetime
As
Begin
	Insert Into RepaymentFrequencies
		([RepaymentFreqCode],[RepaymentFreqName],[DurationInDays],[BankCode],[ModifiedBy],[CreatedBy],[ModifiedOn],[CreatedOn])
	Values
		(@RepaymentFreqCode,@RepaymentFreqName,@DurationInDays,@BankCode,@ModifiedBy,@CreatedBy,@ModifiedOn,@CreatedOn)

	Declare @ReferenceID int
	Select @ReferenceID = @@IDENTITY

	Return @ReferenceID

End
GO
/****** Object:  StoredProcedure [dbo].[RepaymentFrequencies_DeleteRow]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	RepaymentFrequencies_DeleteRow
-- Author:	Nsubuga Kasozi
-- Create date:	4/25/2016 12:21:36 AM
-- Description:	This stored procedure is intended for deleting a specific row from RepaymentFrequencies table
-- ==========================================================================================
Create Procedure [dbo].[RepaymentFrequencies_DeleteRow]
	@RecordId int
As
Begin
	Delete RepaymentFrequencies
	Where
		[RecordId] = @RecordId

End
GO
/****** Object:  StoredProcedure [dbo].[AccountEODBalances_Insert]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	AccountEODBalances_Insert
-- Author:	Nsubuga Kasozi
-- Create date:	5/12/2016 8:35:37 PM
-- Description:	This stored procedure is intended for inserting values to AccountEODBalances table
-- ==========================================================================================
CREATE Procedure [dbo].[AccountEODBalances_Insert]
	@BankCode varchar(50),
	@AccountNumber varchar(50),
	@OpeningBalance decimal(18,2),
	@ClosingBalance decimal(18,2),
	@BalancesDate varchar(50),
	@DailyInterestAcrued decimal(18,10),
	@AccountType varchar(50),
	@AccountingDate bigint,
	@AccountingPeriod  bigint 
As
Begin Transaction trans
Begin try
--Insert End Of Day Account Balances
Declare @CurrentDate datetime = GETDATE();
declare @balDate datetime = CONVERT(Datetime, @BalancesDate, 120)
Declare @AccountDate varchar(50) =  CONVERT(varchar(10),@balDate,121)

if(not exists(select * from AccountEODBalances where BankCode=@BankCode and AccountNumber=@AccountNumber and AccountingDate=@AccountingDate ))
BEGIN
 	-- set the opening balance of the account in the accounts table
	Update BankAccounts 
	set LastRunAccountDate =@AccountingDate
	where BankCode = @BankCode and AccNumber = @AccountNumber
	
	--save the opening and closing balance
	Insert Into AccountEODBalances
		([BankCode],[AccountNumber],[OpeningBalance],[ClosingBalance],[RecordDate],BalancesDate,InterestAcrued,AccountType,AccountingDate,AccountingPeriod,AccountDate,TotalDebits,TotalCredits)
	Values
		(@BankCode,@AccountNumber,@OpeningBalance,@ClosingBalance,@CurrentDate,CONVERT(varchar,@BalancesDate,103),@DailyInterestAcrued,@AccountType,@AccountingDate,@AccountingPeriod,@AccountDate,0,0)
	
	--return inserted row id
	Select SCOPE_IDENTITY() as InsertedID
END
--if exists(select * from AccountEODBalances where BankCode=@BankCode and AccountNumber=@AccountNumber and BalancesDate=CONVERT(varchar,@BalancesDate,103))
--Begin
--	--Update the Eod Record
--	Update AccountEODBalances
--	set 
--	OpeningBalance=@OpeningBalance,
--	ClosingBalance=@ClosingBalance,
--	RecordDate=@CurrentDate,
--	InterestAcrued=@DailyInterestAcrued,
--	AccountType=@AccountType 
--	where
--	BankCode=@BankCode and AccountNumber=@AccountNumber and BalancesDate=CONVERT(varchar,@BalancesDate,103) 

--	--also set the opening balance of the account in the accounts table
--	Update BankAccounts 
--	set LastEodDate =CONVERT(varchar,@BalancesDate,103)
--	where BankCode = @BankCode and AccNumber = @AccountNumber
	
--	--return row id
--	select RecordId as InsertedID from AccountEODBalances where BankCode=@BankCode and AccountNumber=@AccountNumber and BalancesDate=CONVERT(varchar,@BalancesDate,103)
--End
--Else
--Begin
--	-- set the opening balance of the account in the accounts table
--	Update BankAccounts 
--	set LastEodDate =CONVERT(varchar,@BalancesDate,103)
--	where BankCode = @BankCode and AccNumber = @AccountNumber
	
--	--save the opening and closing balance
--	Insert Into AccountEODBalances
--		([BankCode],[AccountNumber],[OpeningBalance],[ClosingBalance],[RecordDate],BalancesDate,InterestAcrued,AccountType)
--	Values
--		(@BankCode,@AccountNumber,@OpeningBalance,@ClosingBalance,@CurrentDate,CONVERT(varchar,@BalancesDate,103),@DailyInterestAcrued,@AccountType)
	
--	--return inserted row id
--	Select SCOPE_IDENTITY() as InsertedID
--End
Commit transaction trans
End try
Begin Catch
ROLLBACK Transaction trans

  DECLARE
   @ErMessage NVARCHAR(2048),
   @ErSeverity INT,
   @ErState INT
 
 SELECT
   @ErMessage = ERROR_MESSAGE(),
   @ErSeverity = ERROR_SEVERITY(),
   @ErState = ERROR_STATE()
 
 RAISERROR (@ErMessage,
             @ErSeverity,
             @ErState )
End Catch
GO
/****** Object:  StoredProcedure [dbo].[AccountEODBalances_DeleteRow]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	AccountEODBalances_DeleteRow
-- Author:	Nsubuga Kasozi
-- Create date:	5/12/2016 8:35:37 PM
-- Description:	This stored procedure is intended for deleting a specific row from AccountEODBalances table
-- ==========================================================================================
Create Procedure [dbo].[AccountEODBalances_DeleteRow]
	@RecordId int
As
Begin
	Delete AccountEODBalances
	Where
		[RecordId] = @RecordId

End
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetCustBal]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[fn_GetCustBal](@acctCode varchar(50),@bankCode varchar(50),@ref varchar(50))
  RETURNS varchar(50)
      AS
    BEGIN
		DECLARE @res varchar(50)
		DECLARE @total varchar(50)=(select Extra3 from MerchantCustomers where CustomerRef=@ref)
		declare @moneytotal money = cast(@total as money)
		DECLARE @paymentTotal money
		
		
		SET @paymentTotal= (
		select sum(G.TranAmount)
		 from GeneralLedgerTable G inner join BankAccounts B on G.AccountNumber=b.AccNumber
		inner join MerchantCustomers M on M.CustomerRef=G.CustomerName
	      where M.AccountCode=@acctCode and G.BankCode=@bankCode and G.CustomerName=@ref
	  and PaymentDate between '2017-01-01' and '2017-03-11' and TranType='Credit' and TranCategory<>'WEB_LIQUIDATION_PAYMENT'
		)
	    if(@paymentTotal is null)
		begin
		 set @paymentTotal=0.00
		end
		
		SET @res=(@moneytotal - @paymentTotal)
	    
		return @res
    END
GO
/****** Object:  StoredProcedure [dbo].[Currencies_Update]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Currencies_Update]
@CurrencyName varchar(50),
@CurrencyCode varchar(50),
@BankCode varchar(50),
@ModifiedBy varchar(50),
@ValueInLocalCurrency money
as
Begin transaction trans
Begin try
if exists(Select * from Currencies where BankCode=@BankCode and CurrencyCode=@CurrencyCode)
	Begin
		Update Currencies set CurrencyName=@CurrencyName,ModifiedBy=@ModifiedBy,
		ModifiedOn=GETDATE(),ValueInLocalCurrency=@ValueInLocalCurrency 
		where BankCode=@BankCode and CurrencyCode=@CurrencyCode
		Select @CurrencyCode as InsertedId
	End
Else
	Begin
		INSERT INTO Currencies
				   ([CurrencyName]
				   ,[CurrencyCode]
				   ,[BankCode]
				   ,[ModifiedBy]
				   ,[CreatedBy]
				   ,[ModifiedOn]
				   ,[CreatedOn]
				   ,[ValueInLocalCurrency])
			 VALUES
				   (@CurrencyName
				   ,@CurrencyCode
				   ,@BankCode
				   ,@ModifiedBy
				   ,@ModifiedBy
				   ,GETDATE()
				   ,GETDATE()
				   ,@ValueInLocalCurrency)
		 Select @CurrencyCode as InsertedId
	End
---------------------------------------------------------------------
Commit Transaction Trans

END TRY
BEGIN CATCH

ROLLBACK Transaction Trans

  DECLARE
   @ErMessage NVARCHAR(2048),
   @ErSeverity INT,
   @ErState INT
 
 SELECT
   @ErMessage = ERROR_MESSAGE(),
   @ErSeverity = ERROR_SEVERITY(),
   @ErState = ERROR_STATE()
 
 RAISERROR (@ErMessage,
             @ErSeverity,
             @ErState )
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[Currencies_SelectRow]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Currencies_SelectRow]
@CurrencyCode varchar(50),
@BankCode varchar(50)
as
Select * from Currencies 
where CurrencyCode=@CurrencyCode and BankCode=@BankCode
GO
/****** Object:  StoredProcedure [dbo].[MerchantCustomers_Update2]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[MerchantCustomers_Update2]
    @recordID int,
	@reference varchar(50),
	@name varchar(50),
	@tel varchar(50),
	@acctCode varchar(50),
    @BankCode varchar(50),
	@IsActive bit,
	@CreatedBy varchar(50),
	@extra1 varchar(50),
	@extra2 varchar(50),
    @extra3 varchar(50),
    @Amount	decimal(18,2)
As
Begin transaction trans
Begin try
IF not exists(Select * from MerchantCustomers where (AccountCode=@acctCode and CustomerRef=@reference) or RecordId=@recordID)
Begin
	Insert Into MerchantCustomers
		(CustomerRef,CustomerName,CustomerTel,AccountCode,BankCode,
		[IsActive],CreatedOn,CreatedBy,Extra1,Extra2,Extra3,Amount
		)
	Values
		(
		   @reference,@name,@tel,@acctCode,@BankCode,@IsActive,GETDATE(),@CreatedBy,@extra1,@extra2,@extra3,@Amount
		)
End
Else
Begin
		Update MerchantCustomers
		Set
			CustomerRef = @reference,
			CustomerName=@name,
			CustomerTel=@tel,
			AccountCode = @acctCode,
			BankCode=@BankCode,
			Extra1=@extra1,
			Extra2=@extra2,
			Extra3=@extra3,
		    [IsActive] = @IsActive,
			ModifiedOn=GETDATE(),
			ModifiedBy=@CreatedBy,
			Amount=@Amount
		Where		
			BankCode=@BankCode and RecordId=@recordID

End
---------------------------------------------------------------------
Commit Transaction Trans

END TRY
BEGIN CATCH

ROLLBACK Transaction Trans

  DECLARE
   @ErMessage NVARCHAR(2048),
   @ErSeverity INT,
   @ErState INT
 
 SELECT
   @ErMessage = ERROR_MESSAGE(),
   @ErSeverity = ERROR_SEVERITY(),
   @ErState = ERROR_STATE()
 
 RAISERROR (@ErMessage,
             @ErSeverity,
             @ErState )
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[MerchantCustomers_Update]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[MerchantCustomers_Update]
    @recordID int,
	@reference varchar(50),
	@name varchar(50),
	@tel varchar(50),
	@acctCode varchar(50),
    @BankCode varchar(50),
	@IsActive bit,
	@CreatedBy varchar(50),
	@extra1 varchar(50),
	@extra2 varchar(50),
    @extra3 varchar(50)
As
Begin transaction trans
Begin try
IF not exists(Select * from MerchantCustomers where (AccountCode=@acctCode and CustomerRef=@reference) or RecordId=@recordID)
Begin
	Insert Into MerchantCustomers
		(CustomerRef,CustomerName,CustomerTel,AccountCode,BankCode,
		[IsActive],CreatedOn,CreatedBy,Extra1,Extra2,Extra3
		)
	Values
		(
		   @reference,@name,@tel,@acctCode,@BankCode,@IsActive,GETDATE(),@CreatedBy,@extra1,@extra2,@extra3
		)
End
Else
Begin
		Update MerchantCustomers
		Set
			CustomerRef = @reference,
			CustomerName=@name,
			CustomerTel=@tel,
			AccountCode = @acctCode,
			BankCode=@BankCode,
			Extra1=@extra1,
			Extra2=@extra2,
			Extra3=@extra3,
		    [IsActive] = @IsActive,
			ModifiedOn=GETDATE(),
			ModifiedBy=@CreatedBy
		Where		
			BankCode=@BankCode and RecordId=@recordID

End
---------------------------------------------------------------------
Commit Transaction Trans

END TRY
BEGIN CATCH

ROLLBACK Transaction Trans

  DECLARE
   @ErMessage NVARCHAR(2048),
   @ErSeverity INT,
   @ErState INT
 
 SELECT
   @ErMessage = ERROR_MESSAGE(),
   @ErSeverity = ERROR_SEVERITY(),
   @ErState = ERROR_STATE()
 
 RAISERROR (@ErMessage,
             @ErSeverity,
             @ErState )
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[GuarantorTypes_Update]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	GuarantorTypes_Update
-- Author:	Nsubuga Kasozi
-- Create date:	4/19/2016 12:45:14 AM
-- Description:	This stored procedure is intended for updating GuarantorTypes table
-- ==========================================================================================
CREATE Procedure [dbo].[GuarantorTypes_Update]
	@GuarantorTypeCode varchar(50),
	@GuarantorTypeName varchar(50),
	@BankCode varchar(50),
	@ModifiedBy varchar(50)
As
if exists(select * from GuarantorTypes where BankCode=@BankCode and GuarantorTypeCode=@GuarantorTypeCode)
Begin
	Update GuarantorTypes
	Set
		[GuarantorTypeName] = @GuarantorTypeName,
		[ModifiedBy] = @ModifiedBy,
		[ModifiedOn] = GETDATE()
	Where		
		BankCode=@BankCode and GuarantorTypeCode=@GuarantorTypeCode
		
	Select @GuarantorTypeCode as InsertedID
End
Else
Begin
		Insert Into GuarantorTypes
		([GuarantorTypeCode],[GuarantorTypeName],
		[BankCode],[ModifiedBy],
		[CreatedBy],[ModifiedOn],
		[CreatedOn])
	    Values
		(@GuarantorTypeCode,@GuarantorTypeName,
		@BankCode,@ModifiedBy,@ModifiedBy,GETDATE(),GETDATE())
		
		Select @GuarantorTypeCode as InsertedID
End
GO
/****** Object:  StoredProcedure [dbo].[GuarantorTypes_SelectRow]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	GuarantorTypes_SelectRow
-- Author:	Nsubuga Kasozi
-- Create date:	4/19/2016 12:45:13 AM
-- Description:	This stored procedure is intended for selecting a specific row from GuarantorTypes table
-- ==========================================================================================
Create Procedure [dbo].[GuarantorTypes_SelectRow]
	@RecordId int
As
Begin
	Select 
		*
	From GuarantorTypes
	Where
		[RecordId] = @RecordId
End
GO
/****** Object:  StoredProcedure [dbo].[GuarantorTypes_SelectAll]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	GuarantorTypes_SelectAll
-- Author:	Nsubuga Kasozi
-- Create date:	4/19/2016 12:45:13 AM
-- Description:	This stored procedure is intended for selecting all rows from GuarantorTypes table
-- ==========================================================================================
Create Procedure [dbo].[GuarantorTypes_SelectAll]
As
Begin
	Select 
		*
	From GuarantorTypes
End
GO
/****** Object:  StoredProcedure [dbo].[GuarantorTypes_Insert]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	GuarantorTypes_Insert
-- Author:	Nsubuga Kasozi
-- Create date:	4/19/2016 12:45:14 AM
-- Description:	This stored procedure is intended for inserting values to GuarantorTypes table
-- ==========================================================================================
Create Procedure [dbo].[GuarantorTypes_Insert]
	@GuarantorTypeCode varchar(50),
	@GuarantorTypeName varchar(50),
	@BankCode varchar(50),
	@ModifiedBy varchar(50),
	@CreatedBy varchar(50),
	@ModifiedOn datetime,
	@CreatedOn datetime
As
Begin
	Insert Into GuarantorTypes
		([GuarantorTypeCode],[GuarantorTypeName],[BankCode],[ModifiedBy],[CreatedBy],[ModifiedOn],[CreatedOn])
	Values
		(@GuarantorTypeCode,@GuarantorTypeName,@BankCode,@ModifiedBy,@CreatedBy,@ModifiedOn,@CreatedOn)

	Declare @ReferenceID int
	Select @ReferenceID = @@IDENTITY

	Return @ReferenceID

End
GO
/****** Object:  StoredProcedure [dbo].[GuarantorTypes_DeleteRow]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	GuarantorTypes_DeleteRow
-- Author:	Nsubuga Kasozi
-- Create date:	4/19/2016 12:45:14 AM
-- Description:	This stored procedure is intended for deleting a specific row from GuarantorTypes table
-- ==========================================================================================
Create Procedure [dbo].[GuarantorTypes_DeleteRow]
	@RecordId int
As
Begin
	Delete GuarantorTypes
	Where
		[RecordId] = @RecordId

End
GO
/****** Object:  StoredProcedure [dbo].[BankBranches_Insert]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	BankBranches_Insert
-- Author:	Nsubuga Kasozi
-- Create date:	12/27/2015 7:57:44 PM
-- Description:	This stored procedure is intended for inserting values to BankBranches table
-- ==========================================================================================
CREATE Procedure [dbo].[BankBranches_Insert]
	@BranchName nvarchar(50),
	@BranchCode nvarchar(50),
	@Location nvarchar(100),
	@BankCode nvarchar(50),
	@CreatedOn datetime,
	@ModifiedOn datetime,
	@CreatedBy varchar(50),
	@ModifiedBy varchar(50)
As
Begin
	Insert Into BankBranches
		([BranchName],[BranchCode],[Location],[BankCode],[CreatedOn],[ModifiedOn],[CreatedBy],[ModifiedBy])
	Values
		(@BranchName,@BranchCode,@Location,@BankCode,@CreatedOn,@ModifiedOn,@CreatedBy,@ModifiedBy)

	Declare @ReferenceID int
	Select @ReferenceID = @@IDENTITY

	Return @ReferenceID

End
GO
/****** Object:  StoredProcedure [dbo].[BankBranches_DeleteRow]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	BankBranches_DeleteRow
-- Author:	Nsubuga Kasozi
-- Create date:	12/27/2015 7:57:44 PM
-- Description:	This stored procedure is intended for deleting a specific row from BankBranches table
-- ==========================================================================================
Create Procedure [dbo].[BankBranches_DeleteRow]
	@BranchId int
As
Begin
	Delete BankBranches
	Where
		[BranchId] = @BranchId

End
GO
/****** Object:  StoredProcedure [dbo].[CustomerTypes_Update]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[CustomerTypes_Update]
	@CustomerTypeId int,
	@CustomerType varchar(50),
	@Description varchar(100),
	@BankCode varchar(50)
As
if not exists(Select * from CustomerTypes where CustomerType=@CustomerType and BankCode=@BankCode)
Begin
	Insert Into CustomerTypes
			([CustomerType],[Description],BankCode)
	Values
			(@CustomerType,@Description,@BankCode)
			
	Select  @CustomerType as InsertedId
End
Else
Begin
	Update CustomerTypes
	Set
		[CustomerType] = @CustomerType,
		[Description] = @Description,
		BankCode=@BankCode
	Where		
		CustomerType = @CustomerType and BankCode=@BankCode
		
   Select  @CustomerType as InsertedId
End
GO
/****** Object:  StoredProcedure [dbo].[CustomerTypes_Insert]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	sp_CustomerTypes_Insert
-- Author:	Mehdi Keramati
-- Create date:	12/19/2015 10:43:59 PM
-- Description:	This stored procedure is intended for inserting values to CustomerTypes table
-- ==========================================================================================
Create Procedure [dbo].[CustomerTypes_Insert]
	@CustomerType varchar(50),
	@Description varchar(100)
As
Begin
	Insert Into CustomerTypes
		([CustomerType],[Description])
	Values
		(@CustomerType,@Description)

	Declare @ReferenceID int
	Select @ReferenceID = @@IDENTITY

	Return @ReferenceID

End
GO
/****** Object:  StoredProcedure [dbo].[GetMerchantCode]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetMerchantCode]
@AccountNumber varchar(50)

As
Select * from BankAccounts
where AccNumber=@AccountNumber and SentToBank=1
GO
/****** Object:  StoredProcedure [dbo].[Countries_Update]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	Countries_Update
-- Author:	Nsubuga Kasozi
-- Create date:	3/29/2016 7:23:11 PM
-- Description:	This stored procedure is intended for updating Countries table
-- ==========================================================================================
Create Procedure [dbo].[Countries_Update]
	@Id smallint,
	@ISO char(2),
	@Name varchar(80),
	@NiceName varchar(80),
	@ISO3 char(3),
	@NumCode smallint,
	@PhoneCode smallint
As
Begin
	Update Countries
	Set
		[ISO] = @ISO,
		[Name] = @Name,
		[NiceName] = @NiceName,
		[ISO3] = @ISO3,
		[NumCode] = @NumCode,
		[PhoneCode] = @PhoneCode
	Where		
		[Id] = @Id

End
GO
/****** Object:  StoredProcedure [dbo].[Countries_SelectRow]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	Countries_SelectRow
-- Author:	Nsubuga Kasozi
-- Create date:	3/29/2016 7:23:11 PM
-- Description:	This stored procedure is intended for selecting a specific row from Countries table
-- ==========================================================================================
Create Procedure [dbo].[Countries_SelectRow]
	@Id smallint
As
Begin
	Select 
	*
	From Countries
	Where
		[Id] = @Id
End
GO
/****** Object:  StoredProcedure [dbo].[Countries_SelectAll]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	Countries_SelectAll
-- Author:	Nsubuga Kasozi
-- Create date:	3/29/2016 7:23:11 PM
-- Description:	This stored procedure is intended for selecting all rows from Countries table
-- ==========================================================================================
Create Procedure [dbo].[Countries_SelectAll]
As
Begin
	Select 
		*
	From Countries
End
GO
/****** Object:  StoredProcedure [dbo].[Countries_Insert]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	Countries_Insert
-- Author:	Nsubuga Kasozi
-- Create date:	3/29/2016 7:23:11 PM
-- Description:	This stored procedure is intended for inserting values to Countries table
-- ==========================================================================================
Create Procedure [dbo].[Countries_Insert]
	@Id smallint,
	@ISO char(2),
	@Name varchar(80),
	@NiceName varchar(80),
	@ISO3 char(3),
	@NumCode smallint,
	@PhoneCode smallint
As
Begin
	Insert Into Countries
		([Id],[ISO],[Name],[NiceName],[ISO3],[NumCode],[PhoneCode])
	Values
		(@Id,@ISO,@Name,@NiceName,@ISO3,@NumCode,@PhoneCode)

End
GO
/****** Object:  StoredProcedure [dbo].[Countries_DeleteRow]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	Countries_DeleteRow
-- Author:	Nsubuga Kasozi
-- Create date:	3/29/2016 7:23:11 PM
-- Description:	This stored procedure is intended for deleting a specific row from Countries table
-- ==========================================================================================
Create Procedure [dbo].[Countries_DeleteRow]
	@Id smallint
As
Begin
	Delete Countries
	Where
		[Id] = @Id

End
GO
/****** Object:  StoredProcedure [dbo].[GetMerchantPhonesToNotify]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetMerchantPhonesToNotify]
@merchantId varchar(50)
as
Select * from MerchantNotificatonPhones
where MerchantId=@merchantId
GO
/****** Object:  StoredProcedure [dbo].[GetMerchantMiniTransactions]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetMerchantMiniTransactions]
@merchantid varchar(50),
@customerRef varchar(50),
@payRef varchar(50),
@startdate varchar(50),
@enddate varchar(50)
as
if @customerRef != null 
    begin
	 declare @name varchar(50)
	 set @name  = (select CustomerName from MerchantCustomers where CustomerRef = @customerRef)
 
	select * from GeneralLedgerTable G inner join BankAccounts B on G.ToAccount=b.AccNumber
	where B.AccountCode=@merchantid and G.CustomerName=@name
	  and PaymentDate between @startdate and @enddate
	order by RecordDate desc
	end
else
  begin
    select * from GeneralLedgerTable
    where  PegPayTranId = @payRef
   end
GO
/****** Object:  StoredProcedure [dbo].[GetMerchantDetails2]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetMerchantDetails2]
@merchantId varchar(50)
as
Select *
from BankAccounts A
where AccountCode=@merchantId

UNION

Select A.*
from BankAccounts A
inner join CustomerDeviceMappings C on A.AccNumber=c.CustomerAccount and C.BankCode=A.BankCode
where (C.CustomerId=@merchantId)
GO
/****** Object:  StoredProcedure [dbo].[GetMerchantDetails]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetMerchantDetails]
@merchantId varchar(50)
as
Select C.AccountCode as CustomerId,C.MerchantContact as PhoneNumber,C.AccountName,C.BranchCode,C.AccNumber,
dbo.fn_GetAccountBalance(C.BankCode,C.AccNumber) AS AccBalance,
C.AccType,C.AccountCategory,C.IsActive AS Active,'MERCHANT' AS UserLevel,C.AccountCode AS MerchantId,
C.MerchantContact,C.IsReferenced,C.ReferenceType,C.BankCode,C.ApprovedBy,C.ApprovedBy as UserApproval
from BankAccounts C
where (C.AccountCode=@merchantId ) 

UNION

Select CustomerId,A.CustomerTel as PhoneNumber,C.AccountName,A.BranchCode,C.AccNumber,
dbo.fn_GetAccountBalance(A.BankCode,C.AccNumber) AS AccBalance,
C.AccType,C.AccountCategory,A.Active AS Active,'TILL' AS UserLevel,C.AccountCode AS MerchantId,
C.MerchantContact,C.IsReferenced,C.ReferenceType,A.BankCode,C.ApprovedBy,A.CreatedBy as UserApproval
from CustomerDeviceMappings A
inner join BankAccounts C on A.CustomerAccount=c.AccNumber and C.BankCode=A.BankCode
where (A.CustomerId=@merchantId)
GO
/****** Object:  StoredProcedure [dbo].[GetMerchantCustomerPayments_backup]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetMerchantCustomerPayments_backup]
@bankCode varchar(50),
@merchantid varchar(50),
@customerRef varchar(50),
@payRef varchar(50),
@startdate varchar(50),
@enddate varchar(50)
as
	 
if (LEN(@customerRef) > 0 and LEN(@payRef) > 0)
  begin 
    select M.CustomerRef as 'REFERENCE',dbo.fn_GetCustomerName(G.CustomerName,M.AccountCode) AS 'CUSTOMER NAME',G.TranAmount as 'AMOUNT',G.Narration AS 'NARRATION',
		G.RecordDate AS 'PAY DATE',G.PegPayTranId as 'PAYMENT ID',B.AccountCode as 'MERCHANT CODE',B.BranchCode as 'BRANCH'
		 from GeneralLedgerTable G inner join BankAccounts B on G.AccountNumber=b.AccNumber
	inner join MerchantCustomers M on M.CustomerRef=G.CustomerName
	where (M.AccountCode=@merchantid or G.BankCode=@bankCode) and G.CustomerName=@customerRef and G.PegPayTranId=@payRef
	  and PaymentDate between @startdate and @enddate and TranType='Credit' and TranCategory<>'WEB_LIQUIDATION_PAYMENT'
	order by RecordDate desc
  end 
else
 begin
   if LEN(@customerRef) > 0 
   begin
    select M.CustomerRef as 'REFERENCE',dbo.fn_GetCustomerName(G.CustomerName,M.AccountCode) AS 'CUSTOMER NAME',G.TranAmount as 'AMOUNT',G.Narration AS 'NARRATION',
		G.RecordDate AS 'PAY DATE',G.PegPayTranId as 'PAYMENT ID',B.AccountCode as 'MERCHANT CODE',B.BranchCode as 'BRANCH'
		 from GeneralLedgerTable G inner join BankAccounts B on G.AccountNumber=b.AccNumber
	inner join MerchantCustomers M on M.CustomerRef=G.CustomerName
	where (M.AccountCode=@merchantid or G.BankCode=@bankCode) and G.CustomerName=@customerRef
	  and PaymentDate between @startdate and @enddate and TranType='Credit' and TranCategory<>'WEB_LIQUIDATION_PAYMENT'
	order by RecordDate desc
	end
else if LEN(@payRef) > 0 
   begin
    select M.CustomerRef as 'REFERENCE',dbo.fn_GetCustomerName(G.CustomerName,M.AccountCode) AS 'CUSTOMER NAME',G.TranAmount as 'AMOUNT',G.Narration AS 'NARRATION',
		G.RecordDate AS 'PAY DATE',G.PegPayTranId as 'PAYMENT ID',B.AccountCode as 'MERCHANT CODE',B.BranchCode as 'BRANCH'
		 from GeneralLedgerTable G inner join BankAccounts B on G.AccountNumber=b.AccNumber
	inner join MerchantCustomers M on M.CustomerRef=G.CustomerName
	where (M.AccountCode=@merchantid or G.BankCode=@bankCode) and G.PegPayTranId=@payRef and TranType='Credit' 
	and TranCategory<>'WEB_LIQUIDATION_PAYMENT'
	and PaymentDate between @startdate and @enddate
	order by RecordDate desc
   end  
else 
   if (LEN(@merchantid) > 0)
     begin
        select M.CustomerRef as 'REFERENCE',dbo.fn_GetCustomerName(G.CustomerName,M.AccountCode) AS 'CUSTOMER NAME',G.TranAmount as 'AMOUNT',G.Narration AS 'NARRATION',
		G.RecordDate AS 'PAY DATE',G.PegPayTranId as 'PAYMENT ID',B.AccountCode as 'MERCHANT CODE',B.BranchCode as 'BRANCH'
		 from GeneralLedgerTable G inner join BankAccounts B on G.AccountNumber=b.AccNumber
		inner join MerchantCustomers M on M.CustomerRef=G.CustomerName
		where M.AccountCode=@merchantid and (PaymentDate between @startdate and @enddate) and TranType='Credit'
		and TranCategory<>'WEB_LIQUIDATION_PAYMENT'
		order by RecordDate desc
     end
   else
    begin
		select M.CustomerRef as 'REFERENCE',dbo.fn_GetCustomerName(G.CustomerName,M.AccountCode) AS 'CUSTOMER NAME',G.TranAmount as 'AMOUNT',G.Narration AS 'NARRATION',
		G.RecordDate AS 'PAY DATE',G.PegPayTranId as 'PAYMENT ID',B.AccountCode as 'MERCHANT CODE',B.BranchCode as 'BRANCH'
		 from GeneralLedgerTable G inner join BankAccounts B on G.AccountNumber=b.AccNumber
		 inner join MerchantCustomers M on M.CustomerRef=G.CustomerName
		 where G.BankCode=@bankCode and (PaymentDate between @startdate and @enddate) and TranType='Credit' and TranCategory<>'WEB_LIQUIDATION_PAYMENT'
		order by RecordDate desc
   end 
 end
GO
/****** Object:  StoredProcedure [dbo].[GetMerchantCustomerPayments]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetMerchantCustomerPayments]
@bankCode varchar(50),
@merchantid varchar(50),
@customerRef varchar(50),
@payRef varchar(50),
@startdate varchar(50),
@enddate varchar(50)
as
	 
if (LEN(@customerRef) > 0 and LEN(@payRef) > 0)
  begin 
    select M.CustomerRef as 'CUSTOMER REFERENCE',dbo.fn_GetCustomerName(G.CustomerName,M.AccountCode) AS 'CUSTOMER',G.TranAmount as 'AMOUNT',G.Narration AS 'NARRATION',
		G.RecordDate AS 'PAY DATE',G.PegPayTranId as 'TRANSACTION ID',B.AccountCode as 'MERCHANT CODE',B.BranchCode as 'BRANCH'
		 from GeneralLedgerTable G inner join BankAccounts B on G.AccountNumber=b.AccNumber
	inner join MerchantCustomers M on M.CustomerRef=G.CustomerName
	where (M.AccountCode=@merchantid or G.BankCode=@bankCode) and G.CustomerName=@customerRef and G.PegPayTranId=@payRef
	  and PaymentDate between @startdate and @enddate and TranType='Credit' and TranCategory<>'WEB_LIQUIDATION_PAYMENT'
	order by RecordDate desc
  end 
else
 begin
   if LEN(@customerRef) > 0 
   begin
    select M.CustomerRef as 'CUSTOMER REFERENCE',dbo.fn_GetCustomerName(G.CustomerName,M.AccountCode) AS 'CUSTOMER',G.TranAmount as 'AMOUNT',G.Narration AS 'NARRATION',
		G.RecordDate AS 'PAY DATE',G.PegPayTranId as 'TRANSACTION ID',B.AccountCode as 'MERCHANT CODE',B.BranchCode as 'BRANCH'
		 from GeneralLedgerTable G inner join BankAccounts B on G.AccountNumber=b.AccNumber
	inner join MerchantCustomers M on M.CustomerRef=G.CustomerName
	where (M.AccountCode=@merchantid or G.BankCode=@bankCode) and G.CustomerName=@customerRef
	  and PaymentDate between @startdate and @enddate and TranType='Credit' and TranCategory<>'WEB_LIQUIDATION_PAYMENT'
	order by RecordDate desc
	end
else if LEN(@payRef) > 0 
   begin
    select M.CustomerRef as 'CUSTOMER REFERENCE',dbo.fn_GetCustomerName(G.CustomerName,M.AccountCode) AS 'CUSTOMER',G.TranAmount as 'AMOUNT',G.Narration AS 'NARRATION',
		G.RecordDate AS 'PAY DATE',G.PegPayTranId as 'TRANSACTION ID',B.AccountCode as 'MERCHANT CODE',B.BranchCode as 'BRANCH'
		 from GeneralLedgerTable G inner join BankAccounts B on G.AccountNumber=b.AccNumber
	inner join MerchantCustomers M on M.CustomerRef=G.CustomerName
	where (M.AccountCode=@merchantid or G.BankCode=@bankCode) and G.PegPayTranId=@payRef and TranType='Credit' 
	and TranCategory<>'WEB_LIQUIDATION_PAYMENT'
	and PaymentDate between @startdate and @enddate
	order by RecordDate desc
   end  
else 
   if (LEN(@merchantid) > 0)
     begin
        select M.CustomerRef as 'CUSTOMER REFERENCE',dbo.fn_GetCustomerName(G.CustomerName,M.AccountCode) AS 'CUSTOMER',G.TranAmount as 'AMOUNT',G.Narration AS 'NARRATION',
		G.RecordDate AS 'PAY DATE',G.PegPayTranId as 'TRANSACTION ID',B.AccountCode as 'MERCHANT CODE',B.BranchCode as 'BRANCH'
		 from GeneralLedgerTable G inner join BankAccounts B on G.AccountNumber=b.AccNumber
		inner join MerchantCustomers M on M.CustomerRef=G.CustomerName
		where M.AccountCode=@merchantid and (PaymentDate between @startdate and @enddate) and TranType='Credit'
		and TranCategory<>'WEB_LIQUIDATION_PAYMENT'
		order by RecordDate desc
     end
   else
    begin
		select M.CustomerRef as 'CUSTOMER REFERENCE',dbo.fn_GetCustomerName(G.CustomerName,M.AccountCode) AS 'CUSTOMER',G.TranAmount as 'AMOUNT',G.Narration AS 'NARRATION',
		G.RecordDate AS 'PAY DATE',G.PegPayTranId as 'TRANSACTION ID',B.AccountCode as 'MERCHANT CODE',B.BranchCode as 'BRANCH'
		 from GeneralLedgerTable G inner join BankAccounts B on G.AccountNumber=b.AccNumber
		 inner join MerchantCustomers M on M.CustomerRef=G.CustomerName
		 where G.BankCode=@bankCode and (PaymentDate between @startdate and @enddate) and TranType='Credit' and TranCategory<>'WEB_LIQUIDATION_PAYMENT'
		order by RecordDate desc
   end 
 end
GO
/****** Object:  StoredProcedure [dbo].[GetMerchantChargesForTransactionWithChargeAmount]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetMerchantChargesForTransactionWithChargeAmount]
@bankCode varchar(50),
@tranAmount money,
@tranCategory varchar(50),
@accountId varchar(50),
@accountIdType varchar(50),
@PaymentChannel varchar(50),
@ChargeAmount money
as

---the aim of this stored procedure is simple
--given a merchant id and the transaction amount plus the transaction category
--it will return to you the transaction charges and whether the should be passed
--on to the customer or not. Its a bit long but thats because I had to repeat 
--certain logic
-- Assumption. That programmer passes a merchant id in the account id field plus
--the value 'merchantId' in account id type field or else he passes account number in
-- account id field and anything else (but 'merchantid') in account id type field

	
if(@accountIdType='MERCHANTID')
Begin
	EXEC dbo.GetMerchangeChargesWithChargeAmount @bankCode,@tranAmount,@tranCategory,@accountId,@PaymentChannel,@ChargeAmount
End
Else
Begin	
	--By this stage i expect that the account id type must be account number
	Declare @AccountCode varchar(50);
	Declare @ErrorMsg varchar(3000);
	
	--first get the merchant id tied to this account number
	select @AccountCode = AccountCode from BankAccounts where AccNumber=@accountId and BankCode=@BankCode
	
	--check if a charge code was found
	if((LEN(@AccountCode) <= 0) or @AccountCode is NULL)	BEGIN		set @ErrorMsg = 'NO ACCOUNT CODE FOUND WITH ACCOUNT NUMBER ['+@accountid+'] In Bank ['+@Bankcode+']';
		RAISERROR (@ErrorMsg, -- Message text.
					   16,    -- Severity.
					   1      -- State.
					   );		RETURN	END
	
	EXEC dbo.GetMerchangeChargesWithChargeAmount @bankCode,@tranAmount,@tranCategory,@accountcode,@PaymentChannel,@ChargeAmount
End
GO
/****** Object:  StoredProcedure [dbo].[GetMerchantChargesForTransactionWithCahrgeAmount]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetMerchantChargesForTransactionWithCahrgeAmount]
@bankCode varchar(50),
@tranAmount money,
@tranCategory varchar(50),
@accountId varchar(50),
@accountIdType varchar(50),
@PaymentChannel varchar(50),
@ChargeAmount money
as

---the aim of this stored procedure is simple
--given a merchant id and the transaction amount plus the transaction category
--it will return to you the transaction charges and whether the should be passed
--on to the customer or not. Its a bit long but thats because I had to repeat 
--certain logic
-- Assumption. That programmer passes a merchant id in the account id field plus
--the value 'merchantId' in account id type field or else he passes account number in
-- account id field and anything else (but 'merchantid') in account id type field

--By this stage i expect that the account id type must be account number
Declare @AccountCode varchar(50);
Declare @ErrorMsg varchar(3000);
	
	
if(@accountIdType='MERCHANTID')
Begin
	--first get the merchant id tied to this account number
	select top 1 @AccountCode = AccountCode from BankAccounts where AccountCode=@accountId and BankCode=@BankCode
	
	--check if an account code was found
	if((LEN(@AccountCode) <= 0) or @AccountCode is NULL)	BEGIN		set @ErrorMsg = 'MERCHANT WITH MERCHANT ID ['+@accountid+'] NOT FOUND In Bank ['+@Bankcode+']';
		RAISERROR (@ErrorMsg, -- Message text.
					   16,    -- Severity.
					   1      -- State.
					   );		RETURN	END
	
	EXEC dbo.GetMerchangeChargesWithChargeAmount @bankCode,@tranAmount,@tranCategory,@accountId,@PaymentChannel,@ChargeAmount
End
Else
Begin	
	
	--first get the merchant id tied to this account number
	select @AccountCode = AccountCode from BankAccounts where AccNumber=@accountId and BankCode=@BankCode
	
	--check if a charge code was found
	if((LEN(@AccountCode) <= 0) or @AccountCode is NULL)	BEGIN		set @ErrorMsg = 'NO ACCOUNT CODE FOUND WITH ACCOUNT NUMBER ['+@accountid+'] In Bank ['+@Bankcode+']';
		RAISERROR (@ErrorMsg, -- Message text.
					   16,    -- Severity.
					   1      -- State.
					   );		RETURN	END
	
	EXEC dbo.GetMerchangeChargesWithChargeAmount @bankCode,@tranAmount,@tranCategory,@accountcode,@PaymentChannel,@ChargeAmount
End
GO
/****** Object:  StoredProcedure [dbo].[GetMerchantChargesForTransaction]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetMerchantChargesForTransaction]
@bankCode varchar(50),
@tranAmount money,
@tranCategory varchar(50),
@accountId varchar(50),
@accountIdType varchar(50),
@PaymentChannel varchar(50)
as

---the aim of this stored procedure is simple
--given a merchant id and the transaction amount plus the transaction category
--it will return to you the transaction charges and whether the should be passed
--on to the customer or not. Its a bit long but thats because I had to repeat 
--certain logic
-- Assumption. That programmer passes a merchant id in the account id field plus
--the value 'merchantId' in account id type field or else he passes account number in
-- account id field and anything else (but 'merchantid') in account id type field

--By this stage i expect that the account id type must be account number
Declare @AccountCode varchar(50);
Declare @ErrorMsg varchar(3000);
	
if(@accountIdType='MERCHANTID')
Begin
	--first get the merchant id tied to this account number
	if @accountId = '100019'
	  set @AccountCode = @accountId
	else
	select top 1 @AccountCode = AccountCode from BankAccounts where AccountCode=@accountId and BankCode=@BankCode
	
	--check if an account code was found
	if((LEN(@AccountCode) <= 0) or @AccountCode is NULL)	BEGIN		set @ErrorMsg = 'MERCHANT WITH MERCHANT ID ['+@accountid+'] NOT FOUND In Bank ['+@Bankcode+']';
		RAISERROR (@ErrorMsg, -- Message text.
					   16,    -- Severity.
					   1      -- State.
					   );		RETURN	END
	
	EXEC dbo.GetMerchangeCharges @bankCode,@tranAmount,@tranCategory,@accountId,@PaymentChannel
End
Else
Begin	
	
	
	--first get the merchant id tied to this account number
	select top 1 @AccountCode = AccountCode from BankAccounts where AccNumber=@accountId and BankCode=@BankCode
	
	--check if an account code was found
	if((LEN(@AccountCode) <= 0) or @AccountCode is NULL)	BEGIN		set @ErrorMsg = 'NO ACCOUNT CODE FOUND WITH ACCOUNT NUMBER ['+@accountid+'] In Bank ['+@Bankcode+']';
		RAISERROR (@ErrorMsg, -- Message text.
					   16,    -- Severity.
					   1      -- State.
					   );		RETURN	END
	
	EXEC dbo.GetMerchangeCharges @bankCode,@tranAmount,@tranCategory,@accountcode,@PaymentChannel
End
GO
/****** Object:  StoredProcedure [dbo].[PayOutLoan]    Script Date: 12/29/2017 09:13:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[PayOutLoan]
@LoanID varchar(50),@BankCode varchar(50),@ApprovedBy varchar(50),@BranchCode varchar(50)as
---------------------------------------------------------------------
--Lets start

--prevent lost updates and phantom reads
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ

BEGIN Transaction Trans
BEGIN TRY
Declare @PegPayId varchar(50);

--if loan was already approved, then we just return its PegPay ID
if exists(Select * from GeneralLedgerTable where BankCode=@BankCode and BankTranId=@LoanID)
Begin
	Select @PegPayId=PegPayTranId from GeneralLedgerTable where BankCode=@BankCode and BankTranId=@LoanID
End
--Loan has never been approved
Else
Begin
	Declare @CustomerName varchar(50);
	Declare @LoanAccountNumber varchar(50);
	Declare @CustomerAccount varchar(50);
	Declare @LoanAmount decimal(18,2);
	Declare @PaymentDate varchar(50)=CONVERT(CHAR(10),GETDATE(),121);
	Declare @Teller varchar(50)=@ApprovedBy;
	Declare @Narration varchar(50)='Loan PayOut for Loan '+@LoanID;
	Declare @TranCategory varchar(50)='INTERNAL_TRANSFER';
	Declare @CurrencyCode varchar(50)='UGS';
	Declare @PaymentType varchar(50)='Cash';
	Declare @ChequeNumber varchar(50)='';
	Declare @NextRepaymentDate datetime;
	Declare @RepayFreq varchar(50);
	Declare @RepayFreqInDays decimal(18,2);
	Declare @LastRepaymentDate datetime;
	-------------------------------------------------------------------
	--get loan Details
	select * from loans
	Select @CustomerName = CustomerId,@LoanAccountNumber=LoanAccountNumber,
	@CustomerAccount=AccountNumber,@LoanAmount=LoanAmount,
	@RepayFreq=RepaymentFrequency from Loans 
	where BankCode=@BankCode and LoanID=@LoanID

	--get repayment Frequency in days
	Select @RepayFreqInDays=DurationInDays from repaymentFrequencies where repaymentfreqcode=@RepayFreq and (BankCode=@BankCode or BankCode='ALL')

	--------------------------------------------------------------------
	--debit loan account and credit customers account by loan amount
	 EXEC @PegPayId=InsertTranIntoGeneralLedger @CustomerName,												@CustomerAccount,												@LoanAccountNumber,												@LoanAmount,												@LoanID,												@PaymentDate,												@Teller,												@ApprovedBy,												@BankCode,												@Narration,												@TranCategory,
												@BranchCode,
												@CurrencyCode,
												@PaymentType,
												@ChequeNumber;
												

	--------------------------------------------------------------------
	--Update the loan details accordingly
	Set @LastRepaymentDate=GETDATE();
	Set @NextRepaymentDate=DATEADD(day,@RepayFreqInDays,@LastRepaymentDate);

	Update Loans set 
	RemainingAmount= ABS(@LoanAmount),
	Reason=@PegPayId,
	Status='APPROVED',
	ModifiedBy=@ApprovedBy,
	ApprovedBy=@ApprovedBy,
	LastRepaymentDate=@LastRepaymentDate,
	NextRepaymentDate=@NextRepaymentDate 
	where LoanID=@LoanID and BankCode=@BankCode

	--return transaction ID
	Select @PegPayId as InsertedID
End
---------------------------------------------------------------------
Commit Transaction Trans

END TRY
BEGIN CATCH

ROLLBACK Transaction Trans

  DECLARE
   @ErMessage NVARCHAR(2048),
   @ErSeverity INT,
   @ErState INT
 
 SELECT
   @ErMessage = ERROR_MESSAGE(),
   @ErSeverity = ERROR_SEVERITY(),
   @ErState = ERROR_STATE()
 
 RAISERROR (@ErMessage,
             @ErSeverity,
             @ErState )
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[PayOutInterest]    Script Date: 12/29/2017 09:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[PayOutInterest]
@CustomerName varchar(50),@toAccount varchar(50),@fromAccount varchar(50),@TranAmount decimal(18,2),@VendorTranId varchar(50),@PaymentDate datetime,@Teller varchar(50),@ApprovedBy varchar(50),@BankCode varchar(50),@Narration varchar(50),@TranCategory varchar(50),@BranchCode varchar(50),@Currency varchar(50),@PaymentType varchar(50),@ChequeNumber varchar(50)as
---------------------------------------------------------------------
-- Lets start
-- prevent lost updates and phantom reads

SET TRANSACTION ISOLATION LEVEL REPEATABLE READ
BEGIN Transaction Trans
BEGIN TRY
Declare @PegPayId int;
Declare @NextPaymentDate datetime;
Declare @LastPaymentDate datetime;
Declare @PaymentFreq varchar(50);
Declare @PaymentFreqInDays decimal(18,2);

--------------------------------------------------------------------
-- Insert Transaction
 EXEC @PegPayId=InsertTranIntoGeneralLedger @CustomerName,											@toAccount,											@fromAccount,											@TranAmount,											@VendorTranId,											@PaymentDate,											@Teller,											@ApprovedBy,											@BankCode,											@Narration,											@TranCategory,
											@BranchCode,
											@Currency,
											@PaymentType,
											@ChequeNumber;
-- Pick Details from Acocunts table
Select @PaymentFreq = InterestPayOutFrequency,@LastPaymentDate = NextMaturityDate 
from BankAccounts 
where BankCode = @BankCode and AccNumber = @toAccount

-- Get the actual days in the Payment Period
Select @PaymentFreqInDays = DurationInDays from RepaymentFrequencies
where 
(BankCode = @BankCode or BankCode = 'ALL') and 
(RepaymentFreqCode = @PaymentFreq)

--Calculate the next pay out date for this account
Set @NextPaymentDate = DATEADD(day,@PaymentFreqInDays,@LastPaymentDate);

--Update Accounts table, set the next payout date
Update BankAccounts set NextMaturityDate = @NextPaymentDate where 
BankCode = @BankCode and AccNumber = @toAccount

--return the pegpayId
Select PegPayTranId as PegPayId from GeneralLedgerTable 
where BankCode = @BankCode and BankTranId = @VendorTranId
--------------------------------------------------------------------
Commit Transaction Trans

END TRY
BEGIN CATCH

ROLLBACK Transaction Trans

  DECLARE
   @ErMessage NVARCHAR(2048),
   @ErSeverity INT,
   @ErState INT
 
 SELECT
   @ErMessage = ERROR_MESSAGE(),
   @ErSeverity = ERROR_SEVERITY(),
   @ErState = ERROR_STATE()
 
 RAISERROR (@ErMessage,
             @ErSeverity,
             @ErState )
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[Loans_Insert]    Script Date: 12/29/2017 09:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	Loans_Insert
-- Author:	Nsubuga Kasozi
-- Create date:	3/31/2016 7:35:31 PM
-- Description:	This stored procedure is intended for inserting values to Loans table
-- ==========================================================================================
CREATE Procedure [dbo].[Loans_Insert]
	@LoanID varchar(50),
	@LoanAmount decimal,
	@CustomerId varchar(50),
	@CustomerTel varchar(50),
	@AccountNumber varchar(50),
	@LoanType varchar(50),
	@CustomerCreditScore decimal,
	@MonthlyInstallmentAmounts varchar(50),
	@InterestRate varchar(50),
	@BankCode varchar(50),
	@ModifiedBy varchar(50),
	@ApprovedBy varchar(50),
	@Status varchar(50),
	@IsActive varchar(50),
	@LoanAccNumber varchar(50),
	@BranchCode varchar(50),
	@Comments varchar(50),
	@InterestType varchar(50),
	@MapToPlaceOfResidency varchar(50),
	@Approver varchar(50),
	@GracePeriodInDays varchar(50),
	@BussinessType varchar(50),
	@BussinessDesc varchar(50),
	@LoanAppFee decimal(18,2),
	@LoanProceesingFee decimal(18,2),
	@RepayFrequency varchar(50),
	@NumOfInstallments varchar(50),
	@InterestPaidOnDisbursement bit,
	@NextPaymentDate datetime,
	@LoanAccTitle varchar(50)
As
---------------------------------------------------------------------
--Lets start
--prevent lost updates and phantom reads
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ
BEGIN Transaction Trans
BEGIN TRY

--if loan already exists update it
if exists(Select * from Loans where LoanId=@LoanID and BankCode=@BankCode)
Begin
    --Update Loan Details
	Update Loans
	Set
		[LoanAmount] = @LoanAmount,
		[CustomerId] = @CustomerId,
		[CustomerTel] = @CustomerTel,
		[AccountNumber] = @AccountNumber,
		[LoanType] = @LoanType,
		[CustomerCreditScore] = @CustomerCreditScore,
		[MonthlyInstallmentAmounts] = @MonthlyInstallmentAmounts,
		[InterestRateType]=@InterestType,
		[MapToPlaceOfResidency] = MapToPlaceOfResidency,
		[InterestRate] = @InterestRate,
		[ModifiedBy] = @ModifiedBy,
		[ModifiedOn] = GETDATE(),
		[ApprovedBy] = @ApprovedBy,
		[Comments]=@Comments,
		[Status] = @Status,
		[Approver]=@Approver,
		GracePeriodInDays=@GracePeriodInDays,
		BussinessSector=@BussinessType,
		BussinessDescription=@BussinessDesc,
		RepaymentFrequency=@RepayFrequency,
		NumberInstallments=@NumOfInstallments,
		InterestDeductedOnDisbursement=@InterestPaidOnDisbursement,
		NextRepaymentDate=@NextPaymentDate,
		LoanAccountTitle=@LoanAccTitle
	
	Where		
		LoanId=@LoanID and BankCode=@BankCode
		
	Select @LoanID as InsertedID
End
Else
Begin
	
	--if we are supposed a fee for applying for this loan
	if(@LoanAppFee>0)
	Begin
	
		Declare @PayDate varchar(50) = Convert(char(10),GETDATE(),121);
		Declare @Narration varchar(50)='LOAN APPLICATION FEE FOR LOAN '+@LoanID;
		
		--debit customer account and credit customers loan account by montly installment amount
		EXEC InsertTranIntoGeneralLedger @CustomerId,										 @LoanAccNumber,										 @AccountNumber,										 @LoanAppFee,										 @LoanID,										 @PayDate,										 @ModifiedBy,										 @ApprovedBy,										 @BankCode,										 @Narration,										 'WITHDRAW',
										 @BranchCode,
										 'UGS',
										 'cash',
										 '';
	End
	
	--Insert Loan Request into Loans Table
	Insert Into Loans
		(LoanId,[LoanAmount],
		[CustomerId],[CustomerTel],
		[AccountNumber],[LoanType],
		[CustomerCreditScore],
		[MonthlyInstallmentAmounts],
		[InterestRate],[BankCode],
		[ModifiedBy],[CreatedBy],
		[ModifiedOn],[CreatedOn],
		[ApprovedBy],[Status],
		IsActive,LoanAccountNumber,
		BranchCode,Comments,
		InterestRateType,MapToPlaceOfResidency,
		Approver,GracePeriodInDays,BussinessSector,BussinessDescription,
		RepaymentFrequency,NumberInstallments,InterestDeductedOnDisbursement,
		LoanApplicationFee,LoanProcessingFee,NextRepaymentDate,NumberOfMissedPayments,RemainingAmount,
		LoanAccountTitle)
	Values
		(@LoanId,@LoanAmount,
		@CustomerId,@CustomerTel,
		@AccountNumber,@LoanType,
		@CustomerCreditScore, @MonthlyInstallmentAmounts,
		@InterestRate,@BankCode,
		@ModifiedBy,@ModifiedBy,
		GETDATE(),GETDATE(),
		@ApprovedBy,@Status,
		@IsActive,@LoanAccNumber,
		@BranchCode,@Comments,@InterestType,@MapToPlaceOfResidency,
		@Approver,@GracePeriodInDays,@BussinessType,@BussinessDesc,
		@RepayFrequency,@NumOfInstallments,@InterestPaidOnDisbursement,
		@LoanAppFee,@LoanProceesingFee,@NextPaymentDate,0,@LoanAmount,
		@LoanAccTitle)

	Select @LoanID as InsertedID
End
---------------------------------------------------------------------
Commit Transaction Trans

END TRY
BEGIN CATCH

ROLLBACK Transaction Trans

  DECLARE
   @ErMessage NVARCHAR(2048),
   @ErSeverity INT,
   @ErState INT
 
 SELECT
   @ErMessage = ERROR_MESSAGE(),
   @ErSeverity = ERROR_SEVERITY(),
   @ErState = ERROR_STATE()
 
 RAISERROR (@ErMessage,
             @ErSeverity,
             @ErState )
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[LogEODBalanceByAccountPeriod]    Script Date: 12/29/2017 09:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[LogEODBalanceByAccountPeriod]
 @AccountNumber varchar(50),
 @AccountType  varchar(50),
 @ProductAccount bit,
 @AccountingDate bigint,
 @AccountPeriod bigint,
 @BankCode varchar(50),
 @BranchCode varchar(50)
AS

BEGIN TRY
	BEGIN TRANSACTION EODPROCESS1
		------Insert Account EOD if it doesn't exists----------------
		IF NOT EXISTS(SELECT AccountNumber FROM AccountEODBalances where AccountNumber=@AccountNumber and BankCode=@BankCode)
		BEGIN
			DECLARE @LastClosedAccountDate bigint
			DECLARE @LastClosedAccountPeriod bigint
			Select top 1 @LastClosedAccountDate=AccountingDate,@LastClosedAccountPeriod=AccountingPeriod from SystemDateSettings 
			where IsClosed=1 and BankCode=@BankCode
			Order by AccountingDate desc
			
			INSERT INTO AccountEODBalances(AccountNumber,BankCode,OpeningBalance,ClosingBalance,BalancesDate,AccountType,AccountingDate,AccountingPeriod,RecordDate) 
			SELECT AccNumber,BankCode,0,0,GETDATE(),AccType,@LastClosedAccountDate,@LastClosedAccountPeriod,GETDATE() FROM BankAccounts 
			WHERE AccNumber = @AccountNumber and BankCode=@BankCode
			
			UPDATE BankAccounts set LastRunAccountDate= @LastClosedAccountDate 
			WHERE AccNumber = @AccountNumber and BankCode=@BankCode 
		END
		---Compute EOD for the account---
		IF NOT EXISTS(SELECT AccountNumber FROM AccountEODBalances where AccountNumber=@AccountNumber and AccountingDate=@AccountingDate and BankCode=@BankCode)
		BEGIN
			DECLARE @closingBal money
			DECLARE @OpeningBal money
			
			IF(@ProductAccount=1)
			BEGIN
			------------  For Product Accounts----------------
			SET @OpeningBal = [dbo].[fn_GetOpeningBalance](@BankCode,@AccountNumber,@AccountingDate)
			SET @closingBal=(select @OpeningBal+ISNULL(SUM(V.TranAmount),0)
			from GeneralLedgerTable AS V
			inner join
			BankAccounts AS A on A.AccNumber= V.AccountNumber and A.BankCode=V.BankCode and A.BranchCode=V.BranchCode
			where A.AccType=@AccountType and V.BankCode=@BankCode and V.BranchCode=@BranchCode and (AccountingDate>= @AccountingDate and AccountingDate<=@AccountingDate))
			END
			ELSE
			BEGIN
			---------------------Get Closing balance of the Account--------------------
			SET @OpeningBal = [dbo].[fn_GetOpeningBalance](@BankCode,@AccountNumber,@AccountingDate)
			SET @closingBal=(select @OpeningBal+ISNULL(SUM(TranAmount),0)
			from GeneralLedgerTable 
			where AccountNumber = @AccountNumber and (AccountingDate>= @AccountingDate and AccountingDate<=@AccountingDate))
			END
			----------------Insert EOD Record for the account--------------------------
			INSERT INTO AccountEODBalances(AccountNumber,BankCode,OpeningBalance,ClosingBalance,BalancesDate,AccountType,AccountingDate,AccountingPeriod,RecordDate)  
			SELECT @AccountNumber,@BankCode,@OpeningBal,@closingBal,CONVERT(date,Convert(varchar(50),@AccountingDate),102),AccType,@AccountingDate,@AccountPeriod,GETDATE() from BankAccounts
			WHERE AccNumber=@AccountNumber and BankCode=@BankCode
			
			UPDATE BankAccounts set LastRunAccountDate= @AccountingDate 
			WHERE AccNumber = @AccountNumber and BankCode=@BankCode 
		END
	COMMIT TRANSACTION EODPROCESS1
END TRY
BEGIN CATCH
ROLLBACK Transaction EODPROCESS1

  DECLARE
   @ErMessage NVARCHAR(2048),
   @ErSeverity INT,
   @ErState INT
 
 SELECT
   @ErMessage = ERROR_MESSAGE(),
   @ErSeverity = ERROR_SEVERITY(),
   @ErState = ERROR_STATE()
 
 RAISERROR (@ErMessage,
             @ErSeverity,
             @ErState )
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[SearchGeneralLedgerTableForStatement1]    Script Date: 12/29/2017 09:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SearchGeneralLedgerTableForStatement1]
@BankCode varchar(50),
@BranchCode varchar(50),
@Teller varchar(50),
@AccountNumber varchar(50),
@CustomerName varchar(50),
@TransCategory varchar(50),
@BankId varchar(50),
@PegPayId varchar(50),
@FromDate bigint,
@ToDate bigint
as
BEGIN
	
		
		DECLARE @OpeningBal varchar(50)
		SET @OpeningBal = dbo.fn_GetOpeningBalance(@BankCode,@AccountNumber,@FromDate)
		if(@OpeningBal='NONE')
		BEGIN
			SELECT 0 AS RecordId, '' AS AccountNumber,'' as VendorTranId,'' AS AccountType,'' AS TranAmount, '' AS TranType,'' AS PaymentDate,'' AS Description,'' AS Credit, '' AS Debit,'' AS AccountBalance,
			@AccountNumber AS AcountNumber ,'' as FullName, '' as OpeningBalance
		END
		else
			BEGIN
				select a.RecordId as [No.], a.AccountNumber,a.VendorTranId,a.TranAmount ,a.AccountType, a.TranType, 
				convert (varchar(12),a.PaymentDate,102) as PayDate, a.Description as TranName,
				a.Credit, a.Debit, convert(varchar,convert(money, (Select SUM(b.TranAmount) from dbo.fn_GetStatement
				(@BankCode,@AccountNumber,@FromDate,@ToDate,@OpeningBal) b WHERE b.RecordId<=a.RecordId),1)) as AccountBalance
				from 
				dbo.fn_GetStatement(@BankCode,@AccountNumber,@FromDate,@ToDate,@OpeningBal) a
				order by a.RecordId asc
				select @AccountNumber AS AcountNumber,'' as FullName, @OpeningBal as OpeningBalance
		 END
		
END
GO
/****** Object:  StoredProcedure [dbo].[SearchGeneralLedgerTableForStatement]    Script Date: 12/29/2017 09:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SearchGeneralLedgerTableForStatement]
@BankCode varchar(50),
@BranchCode varchar(50),
@Teller varchar(50),
@AccountNumber varchar(50),
@CustomerName varchar(50),
@TransCategory varchar(50),
@BankId varchar(50),
@PegPayId varchar(50),
@FromDate bigint,
@ToDate bigint
as
BEGIN
	
		
		DECLARE @OpeningBal varchar(50)
		SET @OpeningBal = dbo.fn_GetOpeningBalance(@BankCode,@AccountNumber,@FromDate)
		if(@OpeningBal='NONE')
		BEGIN
			SELECT 0 AS RecordId, '' AS AccountCode,'' as VendorTranId, '' AS TranType,'' AS PaymentDate,'' AS Description,'' AS Credit, '' AS Debit,'' AS AccountBalance,
			@AccountNumber AS AcountNumber ,'' as FullName, '' as OpeningBalance
		END
		else
			BEGIN
				select a.RecordId as [No.], a.AccountCode AS TillNumber,a.VendorTranId , a.TranType, 
				convert (varchar(12),a.PaymentDate,102) as PayDate, a.Description as TranName,
				CONVERT(varchar, CAST(a.Credit AS Money),1) AS Credit , CONVERT(varchar, CAST(a.Debit AS Money),1) As Debit, CONVERT(varchar, CAST(convert(varchar,convert(money, (Select SUM(b.TranAmount) from dbo.fn_GetStatement
				(@BankCode,@AccountNumber,@FromDate,@ToDate,@OpeningBal) b WHERE b.RecordId<=a.RecordId),1))AS Money),1) as AccountBalance
				from 
				dbo.fn_GetStatement(@BankCode,@AccountNumber,@FromDate,@ToDate,@OpeningBal) a
				order by a.RecordId asc
				select @AccountNumber AS AcountNumber,'' as FullName, @OpeningBal as OpeningBalance
		 END
		
END
GO
/****** Object:  StoredProcedure [dbo].[SearchMerchantsApproved]    Script Date: 12/29/2017 09:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	SearchMerchantsApproved
-- Author:	Albert Luganga
-- Create date:	03/27/2017 12:14:19 AM
-- Description:	This stored procedure is intended for getting merchants approved by a user
-- ==========================================================================================

CREATE proc [dbo].[SearchMerchantsApproved]
@bankCode varchar(50),
@user varchar(50),
@Id varchar(50)
as


select B.AccountCode as 'Merchant Code',B.AccountName as 'Merchant Name',A.AccTypeName as 'Merchant Type', 
CASE WHEN IsReferenced=0 THEN 'NO' ELSE 'YES' END AS 'Referenced', LiquidationType as 'Liquidation',
B.CreatedOn as 'Created On',B.CreatedBy as 'Created By',LiquidationAccount as 'Bank Account',dbo.fn_GetAccountStatus(B.AccNumber) as Status
from BankAccounts AS B
inner join
AccountTypes AS A on B.AccType=A.AccTypeCode
where 
(B.BankCode=@bankCode) and
(B.AccountCode=@Id or @Id='' or AccType=@Id) and 
A.AccountCategory = 'MERCHANT'
and B.ApprovedBy=@user
and A.BankCode=B.BankCode
order by A.CreatedOn desc


--Select AccNumber as Id,AccNumber,dbo.fn_GetAccountBalance(BankCode,AccNumber) AS AccBalance,AccType,BankCode,IsActive,CreatedOn from BankAccounts where 
--(BankCode=@bankCode or @bankCode='ALL') and
--(AccNumber=@Id or @Id='' or AccType=@Id)
GO
/****** Object:  StoredProcedure [dbo].[DebitLoanAccount]    Script Date: 12/29/2017 09:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[DebitLoanAccount]
@CustomerName varchar(50),@toAccount varchar(50),@fromAccount varchar(50),@TranAmount money,@VendorTranId varchar(50),@PaymentDate datetime,@Teller varchar(50),@ApprovedBy varchar(50),@BankCode varchar(50),@Narration varchar(50),@TranCategory varchar(50),@BranchCode varchar(50),@Currency varchar(50),@PaymentType varchar(50),@ChequeNumber varchar(50)as
---------------------------------------------------------------------
--Lets start
--prevent lost updates and phantom reads
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ
BEGIN Transaction Trans
BEGIN TRY
Declare @PegPayId varchar(50)
--------------------------------------------------------------------
--Insert Transaction
 EXEC @PegPayId=InsertTranIntoGeneralLedger @CustomerName,											@toAccount,											@fromAccount,											@TranAmount,											@VendorTranId,											@PaymentDate,											@Teller,											@ApprovedBy,											@BankCode,											@Narration,											@TranCategory,
											@BranchCode,
											@Currency,
											@PaymentType,
											@ChequeNumber;

Select @PegPayId = PegPayTranId from GeneralLedgerTable 
where BankCode=@BankCode and BankTranId=@VendorTranId

Update Loans set Status='SUCCESS',Reason=@PegPayId,LastRepaymentDate=GETDATE() 
where LoanID=@VendorTranId and BankCode=@BankCode

---------------------------------------------------------------------
Commit Transaction Trans

END TRY
BEGIN CATCH

ROLLBACK Transaction Trans

  DECLARE
   @ErMessage NVARCHAR(2048),
   @ErSeverity INT,
   @ErState INT
 
 SELECT
   @ErMessage = ERROR_MESSAGE(),
   @ErSeverity = ERROR_SEVERITY(),
   @ErState = ERROR_STATE()
 
 RAISERROR (@ErMessage,
             @ErSeverity,
             @ErState )
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[BankRoles_InsertUpdate]    Script Date: 12/29/2017 09:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	BankRoles_Update
-- Author:	Albert Luganga
-- Create date:	09/29/2016 13:44:41 PM
-- Description:	This stored procedure is intended for updating BankRoles table, only if a bank exists
-- ==========================================================================================
CREATE Procedure [dbo].[BankRoles_InsertUpdate]
	@BankCode varchar(50),
	@RoleCode1 varchar(50),
	@RoleCode2 varchar(50),
	@RoleCode3 varchar(50)
As
Begin
  EXEC  BankRoles_Update @BankCode,@RoleCode1
  EXEC  BankRoles_Update @BankCode,@RoleCode2
  EXEC  BankRoles_Update @BankCode,@RoleCode3
End


---------------------------------------------------------------------
GO
/****** Object:  StoredProcedure [dbo].[SavePssmUserAccessRule]    Script Date: 12/29/2017 09:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SavePssmUserAccessRule]
@UserType varchar(50),
@Page varchar(50)
as
Exec SaveUserAccessRule @UserType,@Page,'SBU','admin'
GO
/****** Object:  StoredProcedure [dbo].[SaveAccountOpeningClosingBalances]    Script Date: 12/29/2017 09:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SaveAccountOpeningClosingBalances]
@BankCode varchar(50),
@AccountNumber varchar(50),
@OpeningBalance decimal(18,2),
@ClosingBalance decimal(18,2),
@BalancesDate varchar(50),
@DailyInterestAcrued decimal(18,10),
@AccountType varchar(50)
as
Begin Transaction trans
Begin try 

    --lets start
	Declare @AccTypeClosingBal decimal(18,2);
	Declare @AccTypeOpeningBal decimal(18,2);
	Declare @AccTypeInterestAcrued decimal(18,10);
	Declare @AccTypeBalanceDate datetime;
	Declare @PegPayID varchar(50);
	set @BalancesDate = CONVERT(varchar,@BalancesDate,103);

	--Save the opening and closing bal for this account
	EXEC @PegPayID = AccountEODBalances_Insert @BankCode,@AccountNumber,@OpeningBalance,@ClosingBalance,@BalancesDate,@DailyInterestAcrued,@AccountType
	   
	 --sum up the closing balances of all accounts of a specific type
	Select Top 1 
	@AccTypeClosingBal=ClosingBalance,
	@AccTypeOpeningBal=OpeningBalance,
	@AccTypeInterestAcrued=InterestAcrued,
	@AccTypeBalanceDate=BalancesDate
	from AccountEODBalances 
	where 
	AccountType=@AccountType and 
	BankCode=@BankCode order by 
	BalancesDate desc
	 
	 --if we dont find a row with the End Day Bal for all accounts of this type
	if((LEN(@AccTypeClosingBal) <= 0) or @AccTypeClosingBal is NULL)	BEGIN		--we just make todays closing balance equal to this accounts closing balance		set @AccTypeClosingBal = @ClosingBalance;		set @AccTypeOpeningBal = 0;		set @AccTypeInterestAcrued = @DailyInterestAcrued;	END
	else
	BEGIN
		--the last day when we summed up accounts of this type is today
		--we just add this accounts closing bal to the closing bal of that account
		if(@AccTypeBalanceDate=@BalancesDate)
		Begin
			--we get the AccType Accounts Closing Bal + this accounts closing balance
			--we leave opening balance as is
			set @AccTypeClosingBal = @AccTypeClosingBal + @ClosingBalance;
		End
		Else
		Begin
			--AccTypeOpeningBal = To the closingBal of the account on the last day EOD was run
			Set @AccTypeOpeningBal = @AccTypeClosingBal;
			--we get the AccType Accounts Closing Bal by 
			--Adding closing now + this accounts closing balance
			set @AccTypeClosingBal =@AccTypeOpeningBal + @ClosingBalance;
		End
	END
	
	EXEC AccountEODBalances_Insert @BankCode,@AccountType,@AccTypeOpeningBal,@AccTypeClosingBal,@BalancesDate,@AccTypeInterestAcrued,@AccountType
    
    --return inserted row id
	Select @PegPayID as InsertedID

Commit transaction trans
End try
Begin Catch
ROLLBACK Transaction trans

  DECLARE
   @ErMessage NVARCHAR(2048),
   @ErSeverity INT,
   @ErState INT
 
 SELECT
   @ErMessage = ERROR_MESSAGE(),
   @ErSeverity = ERROR_SEVERITY(),
   @ErState = ERROR_STATE()
 
 RAISERROR (@ErMessage,
             @ErSeverity,
             @ErState )
End Catch
GO
/****** Object:  Table [dbo].[BankSystemUsers]    Script Date: 12/29/2017 09:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BankSystemUsers](
	[RecordId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](50) NULL,
	[Email] [varchar](50) NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[OtherName] [varchar](50) NULL,
	[Usertype] [varchar](50) NULL,
	[Password] [varchar](250) NULL,
	[IsActive] [bit] NULL,
	[BankCode] [varchar](50) NULL,
	[DateOfBirth] [varchar](50) NULL,
	[RecordDate] [datetime] NULL,
	[ModifiedOn] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedBy] [varchar](50) NULL,
	[PhoneNumber] [varchar](50) NULL,
	[BranchCode] [varchar](50) NULL,
	[Gender] [varchar](50) NULL,
	[ApprovedBy] [varchar](50) NULL,
	[TranAmountLimit] [varchar](50) NULL,
	[ResetPassword] [bit] NULL,
	[ResetPin] [bit] NULL,
	[SecretKey] [varchar](50) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[SaveSbuUserAccessRule]    Script Date: 12/29/2017 09:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SaveSbuUserAccessRule]
@UserType varchar(50),
@Page varchar(50)
as
Exec SaveUserAccessRule @UserType,@Page,'SBU','admin'
GO
/****** Object:  StoredProcedure [dbo].[ReverseTransaction]    Script Date: 12/29/2017 09:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[ReverseTransaction]
@BankTranId varchar(50),@BankCode varchar(50),@Teller varchar(50),@ApprovedBy varchar(50),@NewBankId varchar(50)as
---------------------------------------------------------------------
--Lets start
BEGIN Transaction Trans
BEGIN TRY
------------------------------
Declare @PegPayId int,
@CustomerName varchar(50),@CustomerId varchar(50),@toAccount varchar(50),@fromAccount varchar(50),@TranAmount money,@PaymentDate datetime,@Narration varchar(50),@BranchCode varchar(50),
@TranCategory varchar(50),
@PegPayTranId varchar(50),
@PaymentType varchar(50),
@CurrencyCode varchar(50),
@ChequeNumber varchar(50),
@CustomerRef varchar(50),
@CustomerTel varchar(50),
@ReversalCommissionAccount varchar(50),
@ErrorMsg varchar(6000);
Declare @Id int;

--check for existing reversal
select top 1 @PegPayId = PegPayTranId from GeneralLedgerTable where 
chequenumber=@BankTranId and BankCode=@Bankcode and TranCategory='REVERSAL' 
order by RecordDate desc

select top 1 @ReversalCommissionAccount=CommissionAccountNumber from CommissionAccounts  
where BankCode = @BankCode and CommissionAccountCode='REVERSAL_COMMISSION_ACCOUNT'

if((LEN(@ReversalCommissionAccount) <= 0) or @ReversalCommissionAccount is NULL)BEGIN	set @ErrorMsg='UNABLE TO FIND REVERSAL COMMISSION ACCOUNT:'+@ReversalCommissionAccount+' FOR SPECIFIED BANK';
	RAISERROR (@ErrorMsg, -- Message text.
				   16,    -- Severity.
				   1      -- State.
				   );	RETURNEND

--if it exists return the id of that transaction 
--and stop
if @PegPayId!='' or @PegPayId is NOT NULL
BEGIN
	Select @PegPayId as PegPayId
END
ELSE
BEGIN
    --else reverse that transaction
	--drop temp table if it exists
	if object_id('tempdb..#Temp1') is not null
		drop table #Temp1


	--pick all transactions that match that bankId 
	--and dump them into temp table
	Select *
	Into   #Temp1
	From   GeneralLedgerTable where 
	chequenumber=@BankTranId and TranCategory='M2B' and
	BankCode=@BankCode and TranType='CREDIT' order by RecordDate desc

	--loop through the charges
	While (Select Count(*) From #Temp1) > 0
	Begin
		--pick 1 charge
		Select Top 1 
			@Id=#Temp1.RecordId,
			@CustomerName=#Temp1.CustomerName,			@toAccount=#Temp1.AccountNumber,--com Acc			@fromAccount=#Temp1.fromAccount,			@TranAmount=#Temp1.TranAmount,--chargeAmnt			@BankTranId=@NewBankId, --supply new Bank ID			@PaymentDate=#Temp1.PaymentDate,			@BankCode=#Temp1.BankCode,			@Narration=#Temp1.Narration,			@TranCategory='REVERSAL',			@BranchCode=#Temp1.BranchCode,
			@PegPayTranId=#Temp1.PegPayTranId,
			@PaymentType=#Temp1.PaymentType,
			@ChequeNumber=#Temp1.ChequeNumber,
			@CurrencyCode=#Temp1.CurrencyCode,
			@CustomerRef=#Temp1.CustomerRef,
			@CustomerTel=#Temp1.CustomerTel
		From #Temp1
		
		SET @Narration='REVERSAL OF '+@PegPayTranId
		
		--move money back to original account
		EXEC @PegPayId=InsertTranIntoGeneralLedger @CustomerName,													@fromAccount,--swap to account and from account													@toAccount,--swap to account and from account													@TranAmount,													@BankTranId,													@PaymentDate,													@Teller,													@ApprovedBy,													@BankCode,													@Narration,													@TranCategory,
													@BranchCode,
													@CurrencyCode,
													@PaymentType,
													@ChequeNumber,
													@CustomerRef,
													@CustomerTel;
		
		--debit original account and credit reversal commission
		EXEC @PegPayId=InsertTranIntoGeneralLedger @CustomerName,													@ReversalCommissionAccount,--swap to account and from account													@fromAccount,--swap to account and from account													@TranAmount,													@BankTranId,													@PaymentDate,													@Teller,													@ApprovedBy,													@BankCode,													@Narration,													'M2C',
													@BranchCode,
													@CurrencyCode,
													@PaymentType,
													@ChequeNumber,
													@CustomerRef,
													@CustomerTel;
										
		--delete transaction from temp table in memory							
		Delete from #Temp1 Where #Temp1.RecordId = @Id
	END
	Select @PegPayId as PegPayId
END

---------------------------------------------------------------------
Commit Transaction Trans
END TRY
BEGIN CATCH

ROLLBACK Transaction Trans

  DECLARE
   @ErMessage NVARCHAR(2048),
   @ErSeverity INT,
   @ErState INT
 
 SELECT
   @ErMessage = ERROR_MESSAGE(),
   @ErSeverity = ERROR_SEVERITY(),
   @ErState = ERROR_STATE()
 
 RAISERROR (@ErMessage,
             @ErSeverity,
             @ErState )
END CATCH
GO
/****** Object:  Table [dbo].[BankCustomers]    Script Date: 12/29/2017 09:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BankCustomers](
	[RecordId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [nvarchar](50) NULL,
	[Email] [varchar](50) NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[OtherName] [varchar](50) NULL,
	[Pin] [varchar](50) NULL,
	[Password] [varchar](250) NULL,
	[IsActive] [bit] NULL,
	[BankCode] [varchar](50) NULL,
	[DateOfBirth] [varchar](50) NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedOn] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedBy] [varchar](50) NULL,
	[PhoneNumber] [varchar](50) NULL,
	[BranchCode] [varchar](50) NULL,
	[Gender] [varchar](50) NULL,
	[ApprovedBy] [varchar](50) NULL,
	[PathToProfilePic] [varchar](8000) NULL,
	[PathToSignature] [varchar](8000) NULL,
	[NextOfKinName] [varchar](50) NULL,
	[NextOfKinContact] [varchar](50) NULL,
	[Nationality] [varchar](50) NULL,
	[PlaceOfBirth] [varchar](50) NULL,
	[Salutation] [varchar](50) NULL,
	[MaritalStatus] [varchar](50) NULL,
	[MerchantId] [varchar](50) NULL,
	[UserCategory] [varchar](50) NULL,
	[ResetPassword] [bit] NULL,
	[ResetPin] [bit] NULL,
	[SecretKey] [varchar](50) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[Accounts_SelectRow2]    Script Date: 12/29/2017 09:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[Accounts_SelectRow2]	@AccountNumber varchar(50),	@BankCode varchar(50)ASSET NOCOUNT ONSELECT A.*,dbo.fn_GetAccountBalance(@BankCode,@AccountNumber) AS AccBalanceFROM BankAccounts AWHERE (A.AccNumber=@AccountNumber and A.BankCode=@BankCode)
GO
/****** Object:  StoredProcedure [dbo].[Accounts_SelectRow]    Script Date: 12/29/2017 09:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Accounts_SelectRow]	@AccountNumber varchar(50),	@BankCode varchar(50)ASSET NOCOUNT ONSELECT A.*,B.CustomerId as UserId,dbo.fn_GetAccountBalance(@BankCode,@AccountNumber) AS AccBalanceFROM BankAccounts Ainner join CustomersToAccountsMapping B on (A.AccNumber=B.AccountNumber and A.BankCode=B.BankCode)WHERE (A.AccNumber=@AccountNumber and A.BankCode=@BankCode)UNION
SELECT A.*,B.UserId as UserId,dbo.fn_GetAccountBalance(@BankCode,@AccountNumber) AS AccBalanceFROM BankAccounts Ainner join TellersToAccountsMapping B on (A.AccNumber=B.AccountNumber and A.BankCode=B.BankCode)WHERE (A.AccNumber=@AccountNumber and A.BankCode=@BankCode)
UNION
SELECT A.*,B.CommissionAccountName as UserId,dbo.fn_GetAccountBalance(@BankCode,@AccountNumber) AS AccBalanceFROM BankAccounts Ainner join CommissionAccounts B on (A.AccNumber=B.CommissionAccountNumber and A.BankCode=B.BankCode)WHERE (A.AccNumber=@AccountNumber and A.BankCode=@BankCode)
GO
/****** Object:  StoredProcedure [dbo].[Accounts_Update_Approval_BACKUP]    Script Date: 12/29/2017 09:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Accounts_Update_Approval_BACKUP]	@AccountId varchar(50),	@AccBalance money,	@UserId varchar(50),	@AccNumber varchar(50),	@AccType varchar(50),	@AccountCat varchar(100),	@BankCode varchar(50),	@ModifiedBy varchar(50),	@BranchCode varchar(50),	@IsActive bit,	@CurrencyCode varchar(50),	@ApprovedBy varchar(50),	@AccountName varchar(50),	@MinimumBal decimal(18,2),	@InterestRate decimal(18,2),	@InterestType varchar(50),	@InterestPayOutFreq varchar(50),	@IsProductAccount bit,	@ProductType varchar(50),	@Referenced bit,	@LiquidationType varchar(50),	@LiquidationFrequency varchar(100),	@BankLiqAccount varchar(100),	@BankAccountName varchar(100)ASBEGIN TRANSACTION CreateAccountBEGIN TRYDeclare @AccountingDate bigintDeclare @AccountingPeriod bigint--select top 1 @AccountingDate=AccountingDate,@AccountingPeriod=AccountingPeriod  from SystemDateSettings --where BankCode=@BankCode and Isclosed=1--order by accountingDate desc--if(@AccountingDate=NULL)BEGINSET @AccountingDate=(SELECT CONVERT(VARCHAR(10), DATEADD(day, -1, GETDATE()), 112))
SET @AccountingPeriod=(SELECT LEFT(CONVERT(varchar, DATEADD(day, -1, GETDATE()),112),6))ENDIF not exists(select * from BankAccounts where AccNumber=@AccNumber and BankCode=@BankCode)BEGIN	INSERT INTO BankAccounts (		[AccNumber],		[AccType],		BankCode,		CreatedOn,		ModifiedOn,		CreatedBy,		ModifiedBy,		BranchCode,		IsActive,		CurrencyCode,		ApprovedBy,		AccountName,		MinimumBalance,		InterestRate,		InterestType,		LastEodDate,		LastRunAccountDate,		InterestPayOutFrequency,		IsproductAccount,		ProductType,		IsReferenced,		LiquidationType,		AccountCategory,		LiquidationFrequency,		LiquidationAccount,		LiquidationAccountName,		AccountCode	)	VALUES (		@AccNumber,		@AccType,		@BankCode,		GETDATE(),		GETDATE(),		@ModifiedBy,		@ModifiedBy,		@BranchCode,		@IsActive,		@CurrencyCode,		@ApprovedBy,		@AccountName,		@MinimumBal,		@InterestRate,		@InterestType,		GETDATE(),		@AccountingDate,		@InterestPayOutFreq,		@IsProductAccount,		@ProductType,		@Referenced,		@LiquidationType,		@AccountCat,		@LiquidationFrequency,		@BankLiqAccount,		@BankAccountName,		@AccountId	)		--insert an EOD balance for yesterdays date	Declare @yesterdaysDate datetime =  DATEADD(d, -1, DATEDIFF(d, 0, GETDATE()));	EXEC [dbo].[AccountEODBalances_Insert] @BankCode,@AccNumber,0,0,@yesterdaysDate,0,@AccType,@AccountingDate,@AccountingPeriod		Delete from RejectedBankAccounts where AccountCode=@AccountId and BankCode=@BankCode	ENDCOMMIT TRANSACTION CreateAccountEND TRYBEGIN CATCH
ROLLBACK Transaction CreateAccount

  DECLARE
   @ErMessage NVARCHAR(2048),
   @ErSeverity INT,
   @ErState INT
 
 SELECT
   @ErMessage = ERROR_MESSAGE(),
   @ErSeverity = ERROR_SEVERITY(),
   @ErState = ERROR_STATE()
 
 RAISERROR (@ErMessage,
             @ErSeverity,
             @ErState )END CATCH
GO
/****** Object:  StoredProcedure [dbo].[Accounts_Update_Approval]    Script Date: 12/29/2017 09:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Accounts_Update_Approval]	@AccountId varchar(50),	@AccBalance money,	@UserId varchar(50),	@AccNumber varchar(50),	@AccType varchar(50),	@AccountCat varchar(100),	@BankCode varchar(50),	@ModifiedBy varchar(50),	@BranchCode varchar(50),	@IsActive bit,	@CurrencyCode varchar(50),	@ApprovedBy varchar(50),	@AccountName varchar(50),	@MinimumBal decimal(18,2),	@InterestRate decimal(18,2),	@InterestType varchar(50),	@InterestPayOutFreq varchar(50),	@IsProductAccount bit,	@ProductType varchar(50),	@Referenced bit,	@LiquidationType varchar(50),	@LiquidationFrequency varchar(100),	@BankLiqAccount varchar(100),	@BankAccountName varchar(100)ASBEGIN TRANSACTION CreateAccountBEGIN TRYDeclare @AccountingDate bigintDeclare @AccountingPeriod bigint--select top 1 @AccountingDate=AccountingDate,@AccountingPeriod=AccountingPeriod  from SystemDateSettings --where BankCode=@BankCode and Isclosed=1--order by accountingDate desc--if(@AccountingDate=NULL)BEGINSET @AccountingDate=(SELECT CONVERT(VARCHAR(10), DATEADD(day, -1, GETDATE()), 112))
SET @AccountingPeriod=(SELECT LEFT(CONVERT(varchar, DATEADD(day, -1, GETDATE()),112),6))ENDIF not exists(select * from BankAccounts where AccNumber=@AccNumber and BankCode=@BankCode)BEGIN	INSERT INTO BankAccounts (		[AccNumber],		[AccType],		BankCode,		CreatedOn,		ModifiedOn,		CreatedBy,		ModifiedBy,		BranchCode,		IsActive,		CurrencyCode,		ApprovedBy,		AccountName,		MinimumBalance,		InterestRate,		InterestType,		LastEodDate,		LastRunAccountDate,		InterestPayOutFrequency,		IsproductAccount,		ProductType,		IsReferenced,		LiquidationType,		AccountCategory,		LiquidationFrequency,		LiquidationAccount,		LiquidationAccountName,		AccountCode	)	VALUES (		@AccNumber,		@AccType,		@BankCode,		GETDATE(),		GETDATE(),		@ModifiedBy,		@ModifiedBy,		@BranchCode,		@IsActive,		@CurrencyCode,		@ApprovedBy,		@AccountName,		@MinimumBal,		@InterestRate,		@InterestType,		GETDATE(),		@AccountingDate,		@InterestPayOutFreq,		@IsProductAccount,		@ProductType,		@Referenced,		@LiquidationType,		@AccountCat,		@LiquidationFrequency,		@BankLiqAccount,		@BankAccountName,		@AccountId	)		--insert an EOD balance for yesterdays date	Declare @yesterdaysDate datetime =  DATEADD(d, -1, DATEDIFF(d, 0, GETDATE()));	EXEC [dbo].[AccountEODBalances_Insert] @BankCode,@AccNumber,0,0,@yesterdaysDate,0,@AccType,@AccountingDate,@AccountingPeriod		Delete from RejectedBankAccounts where AccountCode=@AccountId and BankCode=@BankCode	ENDCOMMIT TRANSACTION CreateAccountEND TRYBEGIN CATCH
ROLLBACK Transaction CreateAccount

  DECLARE
   @ErMessage NVARCHAR(2048),
   @ErSeverity INT,
   @ErState INT
 
 SELECT
   @ErMessage = ERROR_MESSAGE(),
   @ErSeverity = ERROR_SEVERITY(),
   @ErState = ERROR_STATE()
 
 RAISERROR (@ErMessage,
             @ErSeverity,
             @ErState )END CATCH
GO
/****** Object:  StoredProcedure [dbo].[TransactOnLoanAccount]    Script Date: 12/29/2017 09:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[TransactOnLoanAccount]
@CustomerName varchar(50),@CustomerAccountNumber varchar(50),@CustomerLoanAccountNumber varchar(50),@BankLoanCommissionAccountNumber varchar(50),@MonthlyInstallmentAmount money,@InterestAcrued money,@VendorTranId varchar(50),@PaymentDate datetime,@Teller varchar(50),@ApprovedBy varchar(50),@BankCode varchar(50),@Narration varchar(50),@TranCategory varchar(50),@BranchCode varchar(50),@Currency varchar(50),@PaymentType varchar(50),@ChequeNumber varchar(50)as
---------------------------------------------------------------------
--Lets start
--prevent lost updates and phantom reads
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ
BEGIN Transaction Trans
BEGIN TRY
Declare @PegPayId varchar(50)
--------------------------------------------------------------------
--Debit monthly installment amount from customer account to loan account
 EXEC @PegPayId=InsertTranIntoGeneralLedger @CustomerName,											@CustomerLoanAccountNumber,											@CustomerAccountNumber,											@MonthlyInstallmentAmount,											@VendorTranId,											@PaymentDate,											@Teller,											@ApprovedBy,											@BankCode,											@Narration,											@TranCategory,
											@BranchCode,
											@Currency,
											@PaymentType,
											@ChequeNumber;
											
--Debit interest acrued amount from customer account to banks loan commission account
 EXEC @PegPayId=InsertTranIntoGeneralLedger @CustomerName,											@BankLoanCommissionAccountNumber,											@CustomerAccountNumber,											@InterestAcrued,											@VendorTranId,											@PaymentDate,											@Teller,											@ApprovedBy,											@BankCode,											@Narration,											@TranCategory,
											@BranchCode,
											@Currency,
											@PaymentType,
											@ChequeNumber;
											
--Debit loan amount from customers loan account to back to banks commission account
 EXEC @PegPayId=InsertTranIntoGeneralLedger @CustomerName,											@BankLoanCommissionAccountNumber,											@CustomerLoanAccountNumber,											@MonthlyInstallmentAmount,											@VendorTranId,											@PaymentDate,											@Teller,											@ApprovedBy,											@BankCode,											@Narration,											@TranCategory,
											@BranchCode,
											@Currency,
											@PaymentType,
											@ChequeNumber;
--Update Loan Status
Update Loans set Status='SUCCESS',Reason=@PegPayId,LastRepaymentDate=GETDATE() 
where LoanID=@VendorTranId and BankCode=@BankCode

Select @PegPayId = PegPayTranId from GeneralLedgerTable 
where BankCode=@BankCode and BankTranId=@VendorTranId
---------------------------------------------------------------------
Commit Transaction Trans

END TRY
BEGIN CATCH

ROLLBACK Transaction Trans

  DECLARE
   @ErMessage NVARCHAR(2048),
   @ErSeverity INT,
   @ErState INT
 
 SELECT
   @ErMessage = ERROR_MESSAGE(),
   @ErSeverity = ERROR_SEVERITY(),
   @ErState = ERROR_STATE()
 
 RAISERROR (@ErMessage,
             @ErSeverity,
             @ErState )
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[StopEndOfDay]    Script Date: 12/29/2017 09:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[StopEndOfDay]
@TodaysDate datetime
as

	Declare @AccountTypeCode varchar(50);
	Declare @BankCode varchar(50);
	Declare @TodayClosingBal decimal(18,2);
	Declare @YesterdayClosingBal decimal(18,2);
	Declare @SumOfInterestAcrued decimal(18,10);
	
	--drop temp table if it exists
	if object_id('tempdb..#Temp1') is not null
		drop table #Temp1


	--pick all transactions that match that bankId 
	--and dump them into temp table
	Select *
	Into   #Temp1
	From   AccountTypes
	

	--loop through all the account types
	While (Select Count(*) From #Temp1) > 0
	Begin
	  --an account type
	   Select top 1 
	   @AccountTypeCode=#Temp1.AccTypeCode,
	   @BankCode=#Temp1.BankCode 
	   from #Temp1
	   
	   --sum up the closing balances of all accounts of a specific type
	   Select @TodayClosingBal=SUM(ClosingBalance),@SumOfInterestAcrued=SUM(InterestAcrued)
	   from AccountEODBalances 
	   where 
	   AccountType=@AccountTypeCode and 
	   BankCode=@BankCode and 
	   BalancesDate=@TodaysDate
	   
	   --get yesterdays Closing Balance for all accounts of a specific type
	   Select @YesterdayClosingBal=ClosingBalance from AccountEODBalances  
	   where 
	   AccountType=@AccountTypeCode and 
	   BankCode=@BankCode and 
	   BalancesDate=DATEADD(day,-1,@TodaysDate)
	   
	   --validate and correct the data
		 if((LEN(@YesterdayClosingBal) <= 0) or @YesterdayClosingBal is NULL)	   BEGIN		   set @YesterdayClosingBal=0;	   END
	   
	   --if we find that the sum of all closing balances is null(i.e no transactions done)
	     if((LEN(@TodayClosingBal) <= 0) or @TodayClosingBal is NULL)	   BEGIN		   --we just make todays closing balance equal to yesterdays closing balance		   set @TodayClosingBal=@YesterdayClosingBal;	   END
	     else
	     --we find transactions done today i.e sum of transactions is not null
	   BEGIN
		   --we get the sum of the transactions + yesterdays closing balance to be todays
		   --clsoing balance
		   set @TodayClosingBal = @TodayClosingBal + @YesterdayClosingBal;
	   END
	   
	   --Insert the balances for today
	   Declare @TodaysDate2 datetime = CONVERT(varchar,@TodaysDate,103);
	   EXEC dbo.AccountEODBalances_Insert @BankCode,
										  @AccountTypeCode,
										  @YesterdayClosingBal,
										  @TodayClosingBal,
										  @TodaysDate2,
										  @SumOfInterestAcrued,
										  @AccountTypeCode
										  
	    --delete transaction from temp table in memory							
	   Delete from #Temp1 Where 
	   #Temp1.AccTypeCode = @AccountTypeCode and BankCode=@BankCode
	End
GO
/****** Object:  StoredProcedure [dbo].[InsertWithdrawTranIntoGeneralLedger]    Script Date: 12/29/2017 09:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[InsertWithdrawTranIntoGeneralLedger]@CustomerName varchar(50),@toAccount varchar(50),@fromAccount varchar(50),@TranAmount decimal(18,2),@VendorTranId varchar(50),@PaymentDate datetime,@Teller varchar(50),@ApprovedBy varchar(50),@BankCode varchar(50),@Narration varchar(850),@TranCategory varchar(50),@BranchCode varchar(50),@CurrecnyTranAmount varchar(50),@PaymentType varchar(50),@ChequeNumber varchar(50),@CustomerRef varchar(50),@CustomerTel varchar(50)as--This Stored Procedure will move money between any 2 accounts--NB: This stored Procedure has no try cacth(Intentionally) because its not meant to be called directly by code--Stored proc with the try catch is InsertReceivedTransactionWithCharges and its the one meant--to be called to do the work--this procedure was separated from the one above mainly for readability and maintainability--NB: this stored procedure is LONG so lets do this--UPDATE: This stored procedure simply does insertion with no locking for transfers between system accounts --Trying to implement algorithm as explained by Mr Ronald-- prevent lost updates and phantom readsSET TRANSACTION ISOLATION LEVEL REPEATABLE READ----------------------------------------Declare @ErrorMsg varchar(8000);DECLARE @FromAccountType varchar(50);DECLARE @MinimumBal decimal(18,2);DECLARE @FromAccountBalance decimal(18,2);DECLARE @FromAccountClosingBalance decimal(18,2);DECLARE @SumOfTodaysTransactions decimal(18,2);DECLARE @ReturnValue int;DECLARE @LastBalancesDate datetime;DECLARE @RecordId1 varchar(50);DECLARE @RecordId2 varchar(50);DECLARE @PegPayTranId varchar(50);DECLARE @TranAmountInToAccountCurrency decimal(18,2);DECLARE @TranAmountInFromAccountCurrency decimal(18,2);Declare @CurrecnyOfFromAcc varchar(50);
Declare @CurrencyOfToAcc varchar(50);
Declare @ValueInLocalCurrencyFromAccount decimal(18,2);
Declare @ValueInLocalCurrencytoAccount decimal(18,2);
Declare @ValueInLocalCurrencyTranAmount decimal(18,2);Declare @FromAccBalAfter decimal(18,2);Declare @AccountingDate bigint;Declare @AccountingPeriod bigint;Declare @CurrencyCode varchar(50);--------------------------------------------set some globals--check for from accountSelect @FromAccount = AccNumber, @FromAccountType = AccType from BankAccounts with(nolock)where AccNumber = @FromAccount and BankCode = @BankCode--check for to accountSelect @ToAccount = AccNumber from BankAccounts with(nolock)where AccNumber = @ToAccount and BankCode = @BankCode--get minimum balance of account of that typeSelect @MinimumBal = MinimumBal from AccountTypes where AccTypeCode=@FromAccountType and BankCode=@bankCode----calculate from account balance--Select Top 1 @FromAccountClosingBalance = ClosingBalance, @LastBalancesDate = BalancesDate--from AccountEODBalances where AccountNumber = @FromAccount  and BankCode=@BankCode order by BalancesDate desc--Select @SumOfTodaysTransactions = COALESCE(sum(TranAmountInAccountCurrency),0) from GeneralLedgerTable--where RecordDate>@LastBalancesDate and AccountNumber = @FromAccount  and BankCode=@BankCode----get the account balance as of this moment--Set @FromAccountBalance = @FromAccountClosingBalance + @SumOfTodaysTransactionsSET @FromAccountBalance=dbo.fn_GetAccountBalance(@BankCode,@FromAccount)--Get currency of from account
Select @CurrecnyOfFromAcc = CurrencyCode from BankAccounts with(nolock)
where AccNumber = @FromAccount and BankCode = @BankCode

--Get currency of to account
Select @CurrencyOfToAcc = CurrencyCode from BankAccounts with(nolock)
where AccNumber = @ToAccount and BankCode = @BankCode

--Get Value in local currency of the from account cuurency(e.g value of 1 Us dollar in Ugshs is around 3500)
Select @ValueInLocalCurrencyFromAccount = ValueInLocalCurrency from Currencies with(nolock)
where CurrencyCode=@CurrecnyOfFromAcc and BankCode = @BankCode

---get Bank Currency---
SELECT @CurrencyCode=CurrencyCode from dbo.Currencies 
where CurrencyCode=@CurrecnyTranAmount and BankCode=@BankCode

--Get Value in local currency of the to account cuurency(e.g value of 1 Us dollar in Ugshs is around 3500)
Select @ValueInLocalCurrencyToAccount = ValueInLocalCurrency from Currencies with(nolock)
where CurrencyCode = @CurrencyOfToAcc and BankCode = @BankCode

--Get Value in local currency of the transaction amount currency(e.g value of 1 Us dollar in Ugshs is around 3500)
Select @ValueInLocalCurrencyTranAmount = ValueInLocalCurrency from Currencies with(nolock)
where CurrencyCode = @CurrecnyTranAmount and BankCode = @BankCode

----Set AccountingDate and AccountingPeriod
--Select @AccountingDate=AccountingDate, @AccountingPeriod=AccountingPeriod from dbo.SystemDateSettings
--Where BankCode=@BankCode and IsClosed=0SET @AccountingDate=convert(bigint,convert(VARCHAR(8),GETDATE(),112))SET @AccountingPeriod=convert(bigint,convert(VARCHAR(6),GETDATE(),112))--------------------------------------------------------Validate the data--Is to account same as from accountif(@AccountingDate is NULL)BEGINset @ErrorMsg = 'ACCOUNTING DATE NOT SET FOR '+@BankCode;
RAISERROR (@ErrorMsg, -- Message text.
               16,    -- Severity.
               1      -- State.
               );RETURNEND--if minimum balance is not found, set it to 0else if((LEN(@MinimumBal) <= 0) or @MinimumBal is NULL)BEGINset @MinimumBal = 0;ENDif(@toAccount = @fromAccount)BEGINset @ErrorMsg = 'DESTINATION ACCOUNT ['+@toAccount+'] AND SOURCE ['+@fromAccount+'] ACCOUNT CANNOT BE THE SAME';
RAISERROR (@ErrorMsg, -- Message text.
               16,    -- Severity.
               1      -- State.
               );END--does to account exist              else if((LEN(@toAccount) <= 0) or @toAccount is NULL)BEGINset @ErrorMsg = 'UNABLE TO FIND DESTINATION ACCOUNT:'+@toAccount+' FOR SPECIFIED BANK';
RAISERROR (@ErrorMsg, -- Message text.
               16,    -- Severity.
               1      -- State.
               );RETURNEND--does from account existELSE IF((LEN(@fromAccount) <= 0) or @fromAccount is NULL)BEGINset @ErrorMsg = 'UNABLE TO FIND SOURCE ACCOUNT:'+@fromAccount+' FOR SPECIFIED BANK';
RAISERROR (@ErrorMsg, -- Message text.
               16,    -- Severity.
               1      -- State.
               );RETURNEND--do we have the currency code for fromAccountELSE IF((LEN(@CurrecnyOfFromAcc) <= 0) or @CurrecnyOfFromAcc is NULL)BEGINset @ErrorMsg = 'UNABLE TO DETERMINE CURRENCY OF SOURCE ACCOUNT:'+@fromAccount;
RAISERROR (@ErrorMsg, -- Message text.
               16,    -- Severity.
               1      -- State.
               );RETURNEND--do we have the currency code for toAccountELSE IF((LEN(@CurrencyOfToAcc) <= 0) or @CurrencyOfToAcc is NULL)BEGINset @ErrorMsg = 'UNABLE TO DETERMINE CURRENCY OF DESTINATION ACCOUNT:'+@toAccount;
RAISERROR (@ErrorMsg, -- Message text.
               16,    -- Severity.
               1      -- State.
               );RETURNEND----do we have the currency code for tranAmountELSE IF((LEN(@CurrecnyTranAmount) <= 0) or @CurrecnyTranAmount is NULL)BEGINset @ErrorMsg = 'UNABLE TO DETERMINE CURRENCY OF THE TRANSACTION AMOUNT';
RAISERROR (@ErrorMsg, -- Message text.
               16,    -- Severity.
               1      -- State.
               );RETURNEND----Is Passed Currency code okELSE IF((LEN(@CurrencyCode) <= 0) or @CurrencyCode is NULL)BEGINset @ErrorMsg = 'UNABLE TO DETERMINE CURRENCY OF THE TRANSACTION AMOUNT';
RAISERROR (@ErrorMsg, -- Message text.
               16,    -- Severity.
               1      -- State.
               );RETURNEND--====================================================================------AT THIS STAGE ALL DATA SHOULD BE VALID--if the account on the from account is --less than the total transaction amount---------------------------------------------------Change Amounts into local currency
--Change Tran Amount into local currency
Set @tranAmount = @tranAmount * @ValueInLocalCurrencyTranAmount 

--Change from Acc BalanceBefore into local currency
Set @TranAmountInFromAccountCurrency = (@tranAmount / @ValueInLocalCurrencyFromAccount)

set @FromAccBalAfter= @FromAccountBalance -  @TranAmountInFromAccountCurrency;

--Get value of tran Amount in the currency of the from acount
Set @TranAmountInToAccountCurrency = (@tranAmount / @ValueInLocalCurrencyToAccount);--last check for sufficient fundsif(@FromAccBalAfter < @MinimumBal)BEGIN	-- acc bal not sufficient to cover transaction amount	set @ErrorMsg = 'INSUFFICIENT FUNDS ON SOURCE ACCOUNT. SOURCE_ACCOUNT['+@FromAccount+'] BAL =['+convert(varchar(50),@FromAccountBalance)+'] TranAmount=['+convert(varchar(50),@TranAmount)+']';
	RAISERROR (@ErrorMsg, -- Message text.
				   16,    -- Severity.
				   1      -- State.
				   );	RETURNENDELSE-- we have found sufficient fundsBEGIN	--Insert Credit	Declare @CreditTranAmount decimal(18,2) = @TranAmount;	INSERT INTO GeneralLedgerTable 	(			[PegPayTranId],			[CustomerName],			[AccountNumber],			[ToAccount],			[FromAccount],			[TranAmount],			[TranAmountInAccountCurrency],			[BankTranId],			[TranType],			[TranCategory],			[PaymentDate],			[RecordDate],			[Teller],			[ApprovedBy],			[BankCode],			[BranchCode],			[Narration],			[CurrencyCode],			[ValueInLocalCurrencyFromAccount],			[ValueInLocalCurrencyToAccount],			[ValueInLocalCurrencyTranAmount],			[PaymentType],			[ChequeNumber],			[AccountingDate],			[AccountingPeriod],			[CustomerRef],			[CustomerTel]			)	VALUES (			'',			@CustomerName,			@toAccount,			'',			@fromAccount,			@CreditTranAmount,			@TranAmountInToAccountCurrency,			@VendorTranId,			'Credit',			@TranCategory,			@PaymentDate,			GETDATE(),			@Teller,			@ApprovedBy,			@BankCode,			@BranchCode,			@Narration,			@CurrecnyTranAmount,			@ValueInLocalCurrencyFromAccount,			@ValueInLocalCurrencytoAccount,			@ValueInLocalCurrencyTranAmount,			@PaymentType,			@ChequeNumber,			@AccountingDate,			@AccountingPeriod,			@CustomerRef,			@CustomerTel	)		Set @RecordId1=SCOPE_IDENTITY()		--Insert Debit	Declare @DeditTranAmount decimal(18,2) = @TranAmount * -1;	Declare @DebitAmountInAccountCurrency decimal(18,2) = @TranAmountInFromAccountCurrency*-1;		INSERT INTO GeneralLedgerTable (		    [PegPayTranId],			[CustomerName],			[AccountNumber],			[ToAccount],			[FromAccount],			[TranAmount],			[TranAmountInAccountCurrency],			[BankTranId],			[TranType],			[TranCategory],			[PaymentDate],			[RecordDate],			[Teller],			[ApprovedBy],			[BankCode],			[BranchCode],			[Narration],			[CurrencyCode],			[ValueInLocalCurrencyFromAccount],			[ValueInLocalCurrencyToAccount],			[ValueInLocalCurrencyTranAmount],			[PaymentType],			[ChequeNumber],			[AccountingDate],			[AccountingPeriod],			[CustomerRef],			[CustomerTel]	)	VALUES (			'',			@CustomerName,			@fromAccount,			@toAccount,			'',			@DeditTranAmount,			@DebitAmountInAccountCurrency,			@VendorTranId,			'Debit',			@TranCategory,			@PaymentDate,			GETDATE(),			@Teller,			@ApprovedBy,			@BankCode,			@BranchCode,			@Narration,			@CurrecnyTranAmount,			@ValueInLocalCurrencyFromAccount,			@ValueInLocalCurrencytoAccount,			@ValueInLocalCurrencyTranAmount,			@PaymentType,			@ChequeNumber,			@AccountingDate,			@AccountingPeriod,			@CustomerRef,			@CustomerTel	)		--Generate PegPayId	Set @RecordId2=SCOPE_IDENTITY()	SET @PegPayTranId=dbo.fn_GetReceiptno(@RecordId1)		Update GeneralLedgerTable set PegPayTranId=@PegPayTranId where RecordId=@RecordId1 or RecordId=@RecordId2		--return core banking transaction ID	Select @PegPayTranId as InsertedIdEND---------------------------------------------
GO
/****** Object:  StoredProcedure [dbo].[RepayLoan]    Script Date: 12/29/2017 09:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[RepayLoan]
@CustomerName varchar(50),
@CustomerAccountNumber varchar(50),
@CustomerLoanAccountNumber varchar(50),
@BanksCommissionAccountNumber varchar(50),
@RepayAmount decimal(18,2),
@InterestAcrued decimal(18,2),
@BankTranId varchar(50),
@PaymentDate varchar(50),
@Teller varchar(50),
@ApprovedBy varchar(50),
@BankCode varchar(50),
@Narration varchar(50),
@TranCategory varchar(50),
@BranchCode varchar(50),
@CurrencyCode varchar(50),
@PaymentType varchar(50),
@ChequeNumber varchar(50),@RepayFrequencyInDays decimal(18,2)as
---------------------------------------------------------------------
--Lets start

--prevent lost updates and phantom reads
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ

BEGIN Transaction Trans
BEGIN TRY

Declare @PegPayId varchar(50);
Declare @LoanAccBalance money;
Declare @AmountMinusInterest money;
Declare @NextRepaymentDate datetime;
Declare @RemainingAmount decimal(18,2);

Set @NextRepaymentDate=DATEADD(day,@RepayFrequencyInDays,GETDATE());
--------------------------------------------------------------------
--debit customer account and credit customers loan account by montly installment amount
 EXEC @PegPayId=InsertTranIntoGeneralLedger @CustomerName,											@CustomerLoanAccountNumber,											@CustomerAccountNumber,											@RepayAmount,											@BankTranId,											@PaymentDate,											@Teller,											@ApprovedBy,											@BankCode,											@Narration,											@TranCategory,
											@BranchCode,
											@CurrencyCode,
											@PaymentType,
											@ChequeNumber;
											
--debit loan account and credit banks loan commission account by interest acrued amount
EXEC @PegPayId=InsertTranIntoGeneralLedger @CustomerName,											@BanksCommissionAccountNumber,											@CustomerLoanAccountNumber,											@InterestAcrued,											@BankTranId,											@PaymentDate,											@Teller,											@ApprovedBy,											@BankCode,											@Narration,											'INTERNAL_TRANSFER',
											@BranchCode,
											@CurrencyCode,
											@PaymentType,
											@ChequeNumber;

--get the balance of the loan account
SET @LoanAccBalance =dbo.fn_GetAccountBalance(@BankCode,@CustomerLoanAccountNumber)

--if the balance is positive, it means loan has been repaid completely
if(@LoanAccBalance>=0)
Begin
	Update Loans set Status='FINISHED REPAYMENTS',RemainingAmount=@LoanAccBalance,Reason=@PegPayId,LastRepaymentDate=GETDATE(),
	IsActive=0,NextRepaymentDate=@NextRepaymentDate
	where LoanAccountNumber=@CustomerLoanAccountNumber and BankCode=@BankCode
End
--balance is still negative which means customer has to make some more payments
Else
Begin
	Update Loans set RemainingAmount= ABS(@LoanAccBalance),Reason=@PegPayId,LastRepaymentDate=GETDATE(),NextRepaymentDate=@NextRepaymentDate 
	where LoanAccountNumber=@CustomerLoanAccountNumber and BankCode=@BankCode
End


--get the transaction iD
Select @PegPayId = PegPayTranId from GeneralLedgerTable 
where BankCode=@BankCode and BankTranId=@BankTranId

Select @PegPayId as InsertedID

---------------------------------------------------------------------
Commit Transaction Trans

END TRY
BEGIN CATCH

ROLLBACK Transaction Trans

  DECLARE
   @ErMessage NVARCHAR(2048),
   @ErSeverity INT,
   @ErState INT
 
 SELECT
   @ErMessage = ERROR_MESSAGE(),
   @ErSeverity = ERROR_SEVERITY(),
   @ErState = ERROR_STATE()
 
 RAISERROR (@ErMessage,
             @ErSeverity,
             @ErState )
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[GetHimaTransfers]    Script Date: 12/29/2017 09:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetHimaTransfers]

As
Select *
from View_AllTransactions
 where 
     RecordDate> (getdate()-2) and
    (SentToBank=0 or (SentToBank=1 and BankStatus in ('PENDING'))) and
     TranCategory='M2M' and TranType='Credit'
GO
/****** Object:  StoredProcedure [dbo].[GetMerchantUSSDCustomerDetails]    Script Date: 12/29/2017 09:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetMerchantUSSDCustomerDetails]
@AccountCode varchar(50),
@CustomerRef varchar(50)
AS

select RecordId,CustomerRef,CustomerTel,CustomerName,IsActive,AccountCode,
dbo.fn_GetCustBal(AccountCode,BankCode,CustomerRef) as Balance
 from MerchantCustomers where 
AccountCode=@AccountCode 
and (CustomerRef=@CustomerRef or CustomerRef like '%'+@CustomerRef+'%')
GO
/****** Object:  StoredProcedure [dbo].[GetTrialBalance]    Script Date: 12/29/2017 09:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[GetTrialBalance]
@StartDate bigint,
@EndDate bigint,
@BankCode varchar(50),
@BranchCode varchar(50)

AS

BEGIN
	DECLARE @LastClosedDate bigint
	DECLARE @StartclosedDate bigint
	--Get Last closed date and first closed date with the period
	SET @LastClosedDate=(select top 1 AccountingDate from dbo.SystemDateSettings where AccountingDate <=@EndDate and IsClosed=1 and BankCode=@BankCode order by  AccountingDate desc)
	SET @StartclosedDate=ISNULL((Select top 1 AccountingDate  from dbo.SystemDateSettings where AccountingDate >=@StartDate and IsClosed=1 and BankCode=@BankCode order by  AccountingDate asc),@LastClosedDate)
	Select B.BranchCode, B.AccountName AS Name, ISNULL(dbo.fn_GetOpeningBalance(@BankCode,E.AccountNumber,@StartclosedDate),0) as OpeningBalance
	,E.AccountNumber AS Account,
	(Select top 1 ClosingBalance from AccountEODBalances AS CB
	 where CB.AccountNumber=E.AccountNumber and BranchCode=@BranchCode and BankCode=@BankCode and AccountingDate<=@LastClosedDate order by  AccountingDate desc) AS ClosingBalance,
	---Get All Debits
	CASE WHEN B.IsproductAccount=1 THEN([dbo].[fn_GetAccountPeriodSum](@BankCode,@BranchCode,E.AccountNumber,@StartclosedDate,@LastClosedDate,B.ProductType,'DEBIT',1))
	ELSE ([dbo].[fn_GetAccountPeriodSum](@BankCode,@BranchCode,E.AccountNumber,@StartclosedDate,@LastClosedDate,'','DEBIT',0)) end AS debit,
	----Get all credits
	CASE WHEN B.IsproductAccount=1 THEN([dbo].[fn_GetAccountPeriodSum](@BankCode,@BranchCode,E.AccountNumber,@StartclosedDate,@LastClosedDate,B.ProductType,'CREDIT',1)) 
	ELSE ([dbo].[fn_GetAccountPeriodSum](@BankCode,@BranchCode,E.AccountNumber,@StartclosedDate,@LastClosedDate,'','CREDIT',0)) end AS credit
	from AccountEODBalances AS E
	inner join
	BankAccounts AS B on B.AccNumber=E.AccountNumber and B.BankCode =B.BankCode
	Where E.AccountType not in('CURRENT_ACCOUNT',
'SAVINGS_ACCOUNT',
'FIXED_DEPOSIT_ACCOUNT',
'LOAN_ACCOUNT',
'JOINT_ACCOUNT',
'GROUP_ACCOUNT',
'BUSSINESS_ACCOUNT')
and B.BranchCode=@BranchCode and B.BankCode=@BankCode
group by E.AccountNumber,E.AccountType,E.BankCode, B.BranchCode, B.AccountName,B.IsproductAccount,B.ProductType
SELECT  @LastClosedDate,@StartclosedDate
END
GO
/****** Object:  StoredProcedure [dbo].[GetBankAccountByAccountcode]    Script Date: 12/29/2017 09:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetBankAccountByAccountcode]	@AccountNumber varchar(50),	@BankCode varchar(50)ASSET NOCOUNT ONSELECT A.*,dbo.fn_GetAccountBalance(@BankCode,@AccountNumber) AS AccBalanceFROM BankAccounts AWHERE ((A.AccNumber=@AccountNumber or A.AccountCode=@AccountNumber) and A.BankCode=@BankCode)
GO
/****** Object:  StoredProcedure [dbo].[AprroveOrRejectUser]    Script Date: 12/29/2017 09:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[AprroveOrRejectUser]
@UserId varchar(50),
@BankCode varchar(50),
@IsActive varchar(50),
@ApprovedBy varchar(50)
as
Begin transaction trans
Begin try
if(upper(@IsActive)='TRUE')
Begin
	Update BankSystemUsers set IsActive=@IsActive,ApprovedBy=@ApprovedBy 
	where UserId=@UserId and BankCode=@BankCode
End
Else
Begin
	insert into RejectedBankSystemUsers
	select * from BankSystemUsers where UserId=@UserId and BankCode=@BankCode
	Delete from BankSystemUsers where UserId=@UserId and BankCode=@BankCode
End
Commit transaction trans
End try
Begin catch
Rollback transaction trans

  DECLARE
   @ErMessage NVARCHAR(2048),
   @ErSeverity INT,
   @ErState INT
 
 SELECT
   @ErMessage = ERROR_MESSAGE(),
   @ErSeverity = ERROR_SEVERITY(),
   @ErState = ERROR_STATE()
 
 RAISERROR (@ErMessage,
             @ErSeverity,
             @ErState )
End catch
GO
/****** Object:  StoredProcedure [dbo].[AprroveOrRejectCustomer]    Script Date: 12/29/2017 09:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[AprroveOrRejectCustomer]
@UserId varchar(50),
@BankCode varchar(50),
@IsActive varchar(50),
@ApprovedBy varchar(50)
as
Begin transaction trans
Begin try
if(UPPER(@IsActive)='TRUE')
Begin
	Update BankCustomers set ApprovedBy=@ApprovedBy 
	where CustomerId=@UserId and BankCode=@BankCode
End
Else
Begin
	insert into RejectedBankcustomers
	select * from BankCustomers where CustomerId=@UserId and BankCode=@BankCode
	Delete from BankCustomers where CustomerId=@UserId and BankCode=@BankCode
	Delete from CustomersToAccountsMapping where CustomerId=@UserId and BankCode=@BankCode
End
Commit transaction trans
End try
Begin catch
Rollback transaction trans

  DECLARE
   @ErMessage NVARCHAR(2048),
   @ErSeverity INT,
   @ErState INT
 
 SELECT
   @ErMessage = ERROR_MESSAGE(),
   @ErSeverity = ERROR_SEVERITY(),
   @ErState = ERROR_STATE()
 
 RAISERROR (@ErMessage,
             @ErSeverity,
             @ErState )
End catch
GO
/****** Object:  StoredProcedure [dbo].[BankTellers_Update]    Script Date: 12/29/2017 09:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	BankTellers_Update
-- Author:	Nsubuga Kasozi
-- Create date:	12/27/2015 9:32:04 PM
-- Description:	This stored procedure is intended for updating BankTellers table
-- ==========================================================================================
CREATE Procedure [dbo].[BankTellers_Update]
	@UserId varchar(50),
	@Email varchar(50),
    @FirstName varchar(50),
    @LastName varchar(50),
    @OtherName varchar(50),
    @Usertype varchar(50),
    @Password varchar(50),
    @IsActive varchar(50),
    @CreatedBy varchar(50),
    @ModifiedBy varchar(50),
    @ApprovedBy varchar(50),
    @BranchCode varchar(50),
    @DateOfBirth varchar(50),
    @PhoneNumber varchar(50),
    @Gender varchar(50),
	@AccountNumber varchar(50),
	@BankCode varchar(50),
	@TranAmountLimit varchar(50)
As
Begin transaction trans
Begin try
IF not exists(Select * from BankSystemUsers where UserId=@UserId and BankCode=@BankCode)
Begin
	Insert Into BankSystemUsers
		(UserId,Email,FirstName,LastName,OtherName,[Usertype],
		[Password],[IsActive],BankCode,RecordDate,
		ModifiedOn,CreatedBy,ModifiedBy,ApprovedBy,
		PhoneNumber,BranchCode,DateOfBirth,Gender,
		TranAmountLimit)
	Values
		(@UserId,@Email,@FirstName,@LastName,@OtherName,@Usertype,
		 @Password,@IsActive,@BankCode,GETDATE(),
		 GETDATE(),@CreatedBy,@ModifiedBy,@ApprovedBy,
		 @PhoneNumber,@BranchCode,@DateOfBirth,@Gender,
		 @TranAmountLimit)
	
	Select @UserId as InsertedId
End
Else
Begin
	--if this is approved By field is not set	if(@ApprovedBy='')	Begin
		Update BankSystemUsers
		Set
			FirstName = @FirstName,
			LastName=@LastName,
			OtherName=@OtherName,
			[Usertype] = @Usertype,
			[Password] = @Password,
			[IsActive] = @IsActive,
			BankCode=@BankCode,
			ModifiedOn=GETDATE(),
			ModifiedBy=@ModifiedBy,
			PhoneNumber=@PhoneNumber,
			BranchCode=@BranchCode,
			DateOfBirth=@DateOfBirth,
			Gender=@Gender,
			TranAmountLimit=@TranAmountLimit
		Where		
			UserId = @UserId and BankCode=@BankCode
			Select @UserId as InsertedId
	End
	Else
	Begin
		Update BankSystemUsers
		Set
			FirstName = @FirstName,
			LastName=@LastName,
			OtherName=@OtherName,
			[Usertype] = @Usertype,
			[Password] = @Password,
			[IsActive] = @IsActive,
			BankCode=@BankCode,
			ModifiedOn=GETDATE(),
			ModifiedBy=@ModifiedBy,
			ApprovedBy=@ApprovedBy,
			PhoneNumber=@PhoneNumber,
			BranchCode=@BranchCode,
			DateOfBirth=@DateOfBirth,
			Gender=@Gender,
			TranAmountLimit=@TranAmountLimit
		Where		
			UserId = @UserId and BankCode=@BankCode
		Select @UserId as InsertedId
	End
End
---------------------------------------------------------------------
Commit Transaction Trans

END TRY
Begin Catch
ROLLBACK Transaction Trans

  DECLARE
   @ErMessage NVARCHAR(2048),
   @ErSeverity INT,
   @ErState INT
 
 SELECT
   @ErMessage = ERROR_MESSAGE(),
   @ErSeverity = ERROR_SEVERITY(),
   @ErState = ERROR_STATE()
 
 RAISERROR (@ErMessage,
             @ErSeverity,
             @ErState )
End Catch
GO
/****** Object:  StoredProcedure [dbo].[ApproveOrRejectBankCustomerDelete]    Script Date: 12/29/2017 09:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[ApproveOrRejectBankCustomerDelete]
@RecordId varchar(50),
@BankCode varchar(50),
@Status varchar(50),
@Comment varchar(50),
@ApprovedBy varchar(50)
as
Begin transaction trans
Begin try

if(upper(@Status)='TRUE')
Begin

    declare @CustomerId varchar(50) = (select CustomerId from PendingBankCustomerApprovals where RecordId=@RecordId)
    declare @BranchCode varchar(50) = (select BranchCode from PendingBankCustomerApprovals where  RecordId=@RecordId)
    
	begin
	  insert into BankCustomersDeleted
	  select * from BankCustomers where CustomerId=@CustomerId and BankCode=@BankCode and BranchCode=@BranchCode
	 
	  begin
	    delete from BankCustomers where CustomerId = @CustomerId and BankCode=@BankCode and BranchCode=@BranchCode
        delete from CustomersToAccountsMapping where CustomerId = @CustomerId and BankCode=@BankCode
	  end
      
		begin
		   update PendingBankCustomerApprovals set Status='APPROVED' where RecordId=@RecordId
		end
		Select @CustomerId as InsertedId
	end
End
Else
Begin
	update PendingBankCustomerApprovals set Status='REJECTED',Comment=@Comment where RecordId=@RecordId
End
Commit transaction trans
End try
Begin Catch
Rollback transaction trans

  DECLARE
   @ErMessage NVARCHAR(2048),
   @ErSeverity INT,
   @ErState INT
 
 SELECT
   @ErMessage = ERROR_MESSAGE(),
   @ErSeverity = ERROR_SEVERITY(),
   @ErState = ERROR_STATE()
 
 RAISERROR (@ErMessage,
             @ErSeverity,
             @ErState )
End Catch
GO
/****** Object:  StoredProcedure [dbo].[ApproveOrRejectBankCustomerChanges]    Script Date: 12/29/2017 09:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[ApproveOrRejectBankCustomerChanges]
@RecordId varchar(50),
@BankCode varchar(50),
@CustomerId varchar(50),
@Status varchar(50),
@Comment varchar(50),
@ApprovedBy varchar(50)
as
Begin transaction trans
Begin try

if(upper(@Status)='TRUE')
Begin

    declare @FirstName varchar(50) = (select FirstName from PendingBankCustomerApprovals where RecordId=@RecordId)
	declare @LastName varchar(50) = (select LastName from PendingBankCustomerApprovals where  RecordId=@RecordId)
	declare @OtherName varchar(50) = (select OtherName from PendingBankCustomerApprovals where  RecordId=@RecordId)
	declare @IsActive varchar(50) = (select IsActive from PendingBankCustomerApprovals where  RecordId=@RecordId)
    declare @ModifiedBy varchar(50) = (select ModifiedBy from PendingBankCustomerApprovals where  RecordId=@RecordId)
	declare @PhoneNumber varchar(50) = (select PhoneNumber from PendingBankCustomerApprovals where  RecordId=@RecordId)
    declare @BranchCode varchar(50) = (select BranchCode from PendingBankCustomerApprovals where  RecordId=@RecordId)
	declare @DateOfBirth varchar(50) = (select DateOfBirth from PendingBankCustomerApprovals where  RecordId=@RecordId)
    declare @Gender varchar(50) = (select Gender from PendingBankCustomerApprovals where  RecordId=@RecordId)
    declare @Email varchar(50) = (select Email from PendingBankCustomerApprovals where  RecordId=@RecordId)
	declare @UserCategory varchar(50) = (select UserCategory from PendingBankCustomerApprovals where  RecordId=@RecordId)

	begin
	  Update BankCustomers
		Set
			FirstName = @FirstName,
			LastName=@LastName,
			OtherName=@OtherName,
			Email = @Email,
			[IsActive] = @IsActive,
			BankCode=@BankCode,
			ModifiedOn=GETDATE(),
			ModifiedBy=@ModifiedBy,
			ApprovedBy=@ApprovedBy,
			PhoneNumber=@PhoneNumber,
			BranchCode=@BranchCode,
			DateOfBirth=@DateOfBirth,
			Gender=@Gender
		Where		
			CustomerId = @CustomerId and BankCode=@BankCode
		begin
		   update PendingBankCustomerApprovals set Status='APPROVED' where RecordId=@RecordId
		end
		Select @CustomerId as InsertedId
	end
End
Else
Begin
	update PendingBankCustomerApprovals set Status='REJECTED',Comment=@Comment where RecordId=@RecordId
End
Commit transaction trans
End try
Begin Catch
Rollback transaction trans

  DECLARE
   @ErMessage NVARCHAR(2048),
   @ErSeverity INT,
   @ErState INT
 
 SELECT
   @ErMessage = ERROR_MESSAGE(),
   @ErSeverity = ERROR_SEVERITY(),
   @ErState = ERROR_STATE()
 
 RAISERROR (@ErMessage,
             @ErSeverity,
             @ErState )
End Catch
GO
/****** Object:  StoredProcedure [dbo].[ChangeUsersPassword]    Script Date: 12/29/2017 09:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[ChangeUsersPassword]
@UserId varchar(50),
@BankCode varchar(50),
@NewPassword varchar(50),
@UserRole varchar(50),
@Reset bit,
@Operation varchar(50)
as

If(@Operation='PASSWORD')
BEGIN
	if(@UserRole='CUSTOMER')
	BEGIN
		Update BankCustomers set IsActive=1, Password=@NewPassword,ModifiedBy=@UserId,ModifiedOn=GETDATE(),ResetPassword=@Reset where CustomerId=@UserId and BankCode=@BankCode
	END
	ELSE
	BEGIN
		Update BankSystemUsers set IsActive=1,Password=@NewPassword,ModifiedBy=@UserId,ModifiedOn=GETDATE(),ResetPassword=@Reset where UserId=@UserId and BankCode=@BankCode
	END
	END
ELSE
BEGIN
	Update BankCustomers set IsActive=1, Pin=@NewPassword,ModifiedBy=@UserId,ModifiedOn=GETDATE(),ResetPin=@Reset where CustomerId=@UserId and BankCode=@BankCode
END
GO
/****** Object:  StoredProcedure [dbo].[ChangePin]    Script Date: 12/29/2017 09:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[ChangePin]
@pin varchar(50),
@phone varchar(50),
@BankCode varchar(50)
as
Update BankCustomers set Pin=@pin
where (PhoneNumber=@phone or PhoneNumber like '%'+Substring(@phone, 2, (len(@phone)))+'%')  and BankCode=@BankCode
 
select * from BankCustomers 
where (PhoneNumber=@phone or PhoneNumber like '%'+Substring(@phone, 2, (len(@phone)))+'%')  and BankCode=@BankCode
GO
/****** Object:  StoredProcedure [dbo].[GenerateNewCustomersReport]    Script Date: 12/29/2017 09:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GenerateNewCustomersReport]
@BankCode varchar(50),
@BranchCode varchar(50),
@StartDate varchar(50),
@EndDate varchar(50)
as
Select FirstName+''+LastName as CustomerName,CustomerId,PhoneNumber,BranchCode,CreatedOn,CreatedBy from BankCustomers where 
(BankCode=@BankCode or @BankCode='ALL') 
and (BranchCode=@BranchCode or @BranchCode='ALL')
and (CreatedOn>= CONVERT(datetime,@StartDate) or @StartDate='')
and (CreatedOn<=CONVERT(datetime,@EndDate) or @EndDate='')
GO
/****** Object:  StoredProcedure [dbo].[GetBankCustomerByReference]    Script Date: 12/29/2017 09:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetBankCustomerByReference]
@CustomerID varchar(50),
@bankCode varchar(50)
as
Select A.CustomerId,A.PhoneNumber,FirstName,LastName,OtherName,B.AccountNumber,A.BankCode,
A.BranchCode,A.Password,A.Pin,C.AccNumber,C.IsReferenced,A.DateOfBirth,A.Email,A.Gender,A.Nationality,
A.UserCategory,A.ApprovedBy,A.CreatedBy,A.CreatedOn,
dbo.fn_GetAccountBalance(A.BankCode,C.AccNumber) AS AccBalance,
C.AccType,C.AccountCode,C.AccountName,A.UserCategory,C.AccountCategory,A.IsActive,A.Email from BankCustomers A
inner join CustomersToAccountsMapping B on A.CustomerId=B.CustomerId
inner join BankAccounts C on B.AccountNumber=c.AccNumber
where (A.CustomerId=@CustomerID
or (PhoneNumber=@CustomerID or PhoneNumber like '%'+@CustomerID+'%')
or (Email=@CustomerID or Email like '%'+@CustomerID+'%')
or (FirstName like '%'+@CustomerID+'%' or LastName like '%'+@CustomerID+'%'))
and A.BankCode=@bankCode
and C.AccType not in ('COMMISSION_ACCOUNT','SUSPENSE_ACCOUNT')
GO
/****** Object:  StoredProcedure [dbo].[getBankCustomerById]    Script Date: 12/29/2017 09:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[getBankCustomerById]
@customerId varchar(50),
@Bank varchar(50)

AS

Select A.CustomerId,FirstName,LastName,OtherName,A.PhoneNumber,A.BankCode,A.BranchCode,A.Email,A.Gender,a.DateOfBirth,
C.AccNumber AS AccountNumber,dbo.fn_GetAccountBalance(C.BankCode,C.AccNumber) AS AccountBalance,C.AccType AS AccountType 
--A.PhoneNumber
from 
BankCustomers A
inner join CustomersToAccountsMapping B on A.CustomerId=B.CustomerId
inner join BankAccounts C on B.AccountNumber=c.AccNumber
where A.CustomerId = @customerId and a.BankCode = @Bank


--select * from BankCustomers A
GO
/****** Object:  StoredProcedure [dbo].[GetBankCustomerByCustomerId]    Script Date: 12/29/2017 09:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetBankCustomerByCustomerId]
@BankCode varchar(50),
@CustomerID varchar(50)
as
Select A.CustomerId,FirstName,LastName,OtherName,B.AccountNumber,c.AccountName,A.BankCode,A.BranchCode,A.Pin,C.AccNumber,dbo.fn_GetAccountBalance(A.BankCode,C.AccNumber) AS AccBalance,C.AccType,C.AccountCode from BankCustomers A
inner join CustomersToAccountsMapping B on A.CustomerId=B.CustomerId
inner join BankAccounts C on B.AccountNumber=c.AccNumber
where A.CustomerId=@CustomerID
and A.BankCode=@BankCode
GO
/****** Object:  StoredProcedure [dbo].[GetBankCustomersByName]    Script Date: 12/29/2017 09:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetBankCustomersByName]
@BankCode varchar(50),
@CustomerId varchar(50),
@CustomerName varchar(50)

AS

select C.CustomerId,C.FirstName+' '+C.LastName as CustomerName, B.BranchName, C.BankCode from BankCustomers AS C
inner join BankBranches AS B on C.BranchCode=B.BranchCode
where C.BankCode=@BankCode
and ((upper(FirstName +' '+ LastName) like '%'+@CustomerName+'%') 
or(upper(LastName +' '+ FirstName) like '%'+@CustomerName+'%')or (@CustomerName=''))
and (CustomerId=@customerId or @CustomerId='')
GO
/****** Object:  StoredProcedure [dbo].[GetUserByCustomerTelAndBankCode]    Script Date: 12/29/2017 09:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetUserByCustomerTelAndBankCode]
@CustomerTel varchar(50),
@BankCode varchar(50)
as
Select A.CustomerId,FirstName,LastName,OtherName,B.AccountNumber,A.BankCode,C.AccountCode,
       C.CreatedOn,A.BranchCode,Pin,C.AccNumber,dbo.fn_GetAccountBalance(A.BankCode,C.AccNumber) AS AccBalance,
       C.AccType,A.Gender,A.DateOfBirth,A.Email,A.IsActive AS Active,'MERCHANT' AS UserLevel,C.ApprovedBy from BankCustomers A
inner join CustomersToAccountsMapping B on A.CustomerId=B.CustomerId
inner join BankAccounts C on B.AccountNumber=c.AccNumber
where (A.PhoneNumber=@CustomerTel or A.PhoneNumber like '%'+Substring(@CustomerTel, 2, (len(@CustomerTel)))+'%') and A.BankCode=@BankCode
UNION
Select A.CustomerId,TerminalName AS FirstName,'' AS LastName,'' AS OtherName,CustomerAccount AS AccountNumber,A.BankCode,C.AccountCode,
      C.CreatedOn,A.BranchCode,A.Pin,C.AccNumber,dbo.fn_GetAccountBalance(A.BankCode,C.AccNumber) AS AccBalance,C.AccType,'' AS Gender,
      '' as DateOfBirth,'' as Email,A.Active, 'TILL' AS UserLevel,C.ApprovedBy  from dbo.CustomerDeviceMappings A
inner join BankAccounts C on A.CustomerAccount=c.AccNumber and C.BankCode=A.BankCode
where 
A.DeviceId=@CustomerTel and  A.BankCode = @BankCode
GO
/****** Object:  StoredProcedure [dbo].[GetUserByCustomerTel2]    Script Date: 12/29/2017 09:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetUserByCustomerTel2]
@CustomerTel varchar(50),
@BankCode varchar(50)
as
Select A.CustomerId,A.PhoneNumber,FirstName,LastName,OtherName,B.AccountNumber,A.BankCode,A.BranchCode,A.Pin,C.AccNumber,dbo.fn_GetAccountBalance(A.BankCode,C.AccNumber) AS AccBalance,C.AccType,A.Gender,A.IsActive AS Active,'MERCHANT' AS UserLevel,C.AccountCode AS MerchantId, C.IsReferenced from BankCustomers A
inner join CustomersToAccountsMapping B on A.CustomerId=B.CustomerId
inner join BankAccounts C on B.AccountNumber=c.AccNumber
where (A.PhoneNumber=@CustomerTel or a.PhoneNumber like '%'+Substring(@CustomerTel, 2, (len(@CustomerTel)))+'%') and A.BankCode=@BankCode
UNION
Select A.CustomerId,A.CustomerTel,TerminalName AS FirstName,'' AS LastName,'' AS OtherName,CustomerAccount AS AccountNumber,A.BankCode,A.BranchCode,A.Pin,C.AccNumber,dbo.fn_GetAccountBalance(A.BankCode,C.AccNumber) AS AccBalance,C.AccType,'' AS Gender,A.Active, 'TILL' AS UserLevel,C.AccountCode AS MerchantId, C.IsReferenced  from dbo.CustomerDeviceMappings A
inner join BankAccounts C on A.CustomerAccount=c.AccNumber and C.BankCode=A.BankCode
inner join BankCustomers D on D.CustomerId=A.CustomerId
where 
A.DeviceId=@CustomerTel and A.BankCode=@BankCode
GO
/****** Object:  StoredProcedure [dbo].[GetUserByCustomerTel]    Script Date: 12/29/2017 09:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetUserByCustomerTel]
@CustomerTel varchar(50)
as
Select A.CustomerId,A.PhoneNumber,FirstName,LastName,OtherName,
B.AccountNumber,A.BankCode,A.BranchCode,A.Pin,C.AccNumber,
dbo.fn_GetAccountBalance(A.BankCode,C.AccNumber) AS AccBalance,C.AccType,A.Gender,A.IsActive AS Active,
'MERCHANT' AS UserLevel,C.AccountCode AS MerchantId, C.IsReferenced,C.AccountName,'Main' as TillBranch
from BankCustomers A
inner join CustomersToAccountsMapping B on A.CustomerId=B.CustomerId
inner join BankAccounts C on B.AccountNumber=c.AccNumber
where (A.PhoneNumber=@CustomerTel)
--where (A.PhoneNumber=@CustomerTel or a.PhoneNumber like '%'+Substring(@CustomerTel, 2, (len(@CustomerTel)))+'%')
UNION
Select A.CustomerId,A.CustomerTel,A.AquiredBy AS FirstName,'' AS LastName,C.AccountName AS OtherName,
CustomerAccount AS AccountNumber,A.BankCode,A.BranchCode,A.Pin,C.AccNumber,
dbo.fn_GetAccountBalance(A.BankCode,C.AccNumber) AS AccBalance,C.AccType,'' AS Gender,A.Active,
 'TILL' AS UserLevel,C.AccountCode AS MerchantId, C.IsReferenced ,c.AccountName,A.Location as TillBranch
  from dbo.CustomerDeviceMappings A
inner join BankAccounts C on A.CustomerAccount=c.AccNumber and C.BankCode=A.BankCode
--inner join BankCustomers D on D.CustomerId=A.CustomerId
where 
A.DeviceId=@CustomerTel
GO
/****** Object:  StoredProcedure [dbo].[GetTransferRequets]    Script Date: 12/29/2017 09:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetTransferRequets]
@BankCode varchar(50),
@BranchCode varchar(50),
@AccountCode varchar(50),
@AccountNumber Varchar(50),
@FromDate varchar(50),
@ToDate varchar(50)
AS

SELECT R.RecordId AS RequestId,R.TranAmount,R.PaymentDate AS RequestDate, R.TranCategory,R.Narration,C.FirstName+' '+C.LastName AS IntaitedBy,R.Status from TransactionRequests AS R
inner Join
BankCustomers AS C on C.CustomerId=R.Teller
WHERE
(TranCategory='WEB_LIQUIDATION_PAYMENT' or TranCategory='INTERNAL_TRANSFER')
AND FromAccount=@AccountNumber
and R.BankCode=@BankCode
and (R.BranchCode=@BranchCode or @BranchCode='ALL')
and(PaymentDate>=@FromDate or @FromDate='') 
and (PaymentDate<=@ToDate or @ToDate='')
GO
/****** Object:  StoredProcedure [dbo].[GetTellersWhoDontHaveAccounts]    Script Date: 12/29/2017 09:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetTellersWhoDontHaveAccounts]
@BankCode varchar(50)
as
Select * from BankSystemUsers where 
Usertype='TELLER' and UserId not in (Select UserId from TellersToAccountsMapping)
and BankCode=@BankCode
GO
/****** Object:  StoredProcedure [dbo].[GetTellerAccounts]    Script Date: 12/29/2017 09:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetTellerAccounts]
@BankCode varchar(50),
@BranchCode varchar(50)
as
Select AccNumber as AccountNumber,C.FirstName+' '+C.OtherName+' '+C.LastName as FullName,AccType,A.BranchCode,A.IsActive,A.CreatedBy from BankAccounts A
inner join TellersToAccountsMapping B on A.AccNumber=B.AccountNumber
inner join BankSystemUsers C on C.UserId=B.UserId 
where 
(A.BankCode=@BankCode) and
(A.BranchCode=@BranchCode)
GO
/****** Object:  StoredProcedure [dbo].[GetPendingLiquidationApproval]    Script Date: 12/29/2017 09:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetPendingLiquidationApproval]
@BankCode varchar(50),
@BranchCode varchar(50),
@AccountCode varchar(50),
@AccountNumber Varchar(50),
@FromDate varchar(50),
@ToDate varchar(50)
AS

SELECT R.RecordId AS RequestId,R.TranAmount,R.PaymentDate AS RequestDate, R.TranCategory,R.Narration,C.FirstName+' '+C.LastName AS IntaitedBy,R.Status from TransactionRequests AS R
inner Join
BankCustomers AS C on C.CustomerId=R.Teller
WHERE
(TranCategory='WEB_LIQUIDATION_PAYMENT' or TranCategory='INTERNAL_TRANSFER')
AND
Status='PENDING'
AND FromAccount=@AccountNumber
and R.BankCode=@BankCode
and (R.BranchCode=@BranchCode or @BranchCode='ALL')
and(PaymentDate>=@FromDate or @FromDate='') 
and (PaymentDate<=@ToDate or @ToDate='')
GO
/****** Object:  StoredProcedure [dbo].[GetMerchant]    Script Date: 12/29/2017 09:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetMerchant]
@merchantId varchar(50),
@bankCode varchar(50)
as
Select A.CustomerId,A.PhoneNumber,C.AccountName AS  FirstName,'' AS LastName,OtherName,B.AccountNumber,A.BankCode,
A.BranchCode,A.Pin,C.AccNumber,dbo.fn_GetAccountBalance(A.BankCode,C.AccNumber) AS AccBalance,A.Password,
C.AccType,A.Gender,A.IsActive AS Active,'MERCHANT' AS UserLevel,C.AccountCode AS MerchantId, C.IsReferenced 
from BankCustomers A
inner join CustomersToAccountsMapping B on A.CustomerId=B.CustomerId
inner join BankAccounts C on B.AccountNumber=C.AccNumber
where (C.AccountCode=@merchantId or C.AccountCode like '%'+@merchantId+'%')
and AccType not in ('COMMISSION_ACCOUNT','SUSPENSE_ACCOUNT','BUSSINESS_ACCOUNT')
and (MerchantContact=A.PhoneNumber or A.BankCode=@bankCode)
GO
/****** Object:  StoredProcedure [dbo].[GetCommissionAccountsByBankCode]    Script Date: 12/29/2017 09:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[GetCommissionAccountsByBankCode]
	@bankcode varchar(50)
As
Begin
	Select *
	From BankAccounts A
	inner join CustomersToAccountsMapping B on A.AccNumber=B.AccountNumber
	inner join BankCustomers C on C.CustomerId=B.CustomerId
	Where
		A.BankCode=@bankcode and AccType like '%COMMISSION%'
End
GO
/****** Object:  StoredProcedure [dbo].[GetBankUsersPendingApproval]    Script Date: 12/29/2017 09:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetBankUsersPendingApproval]
@bankCode varchar(50),
@branchCode varchar(50),
@teller varchar(50),
@accountNumber varchar(50),
@name varchar(50),
@fromDate varchar(50),
@toDate varchar(50),
@CreatedBy varchar(50)
as
Select UserId,FirstName,LastName,Gender,Usertype,RecordDate as CreatedOn,CreatedBy from BankSystemUsers
where
ApprovedBy='' and
((FirstName like '%'+@name+'%') or @name='') and
(BankCode=@bankCode or @bankCode='ALL') and
(BranchCode=@branchCode or @branchCode='ALL') and
(RecordDate>=@fromDate or @fromDate='') and
(RecordDate<=@toDate or @toDate='')
and CreatedBy<>@CreatedBy
GO
/****** Object:  StoredProcedure [dbo].[GetBankUsersByRole]    Script Date: 12/29/2017 09:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetBankUsersByRole]
@bankCode varchar(50),
@branchCode varchar(50),
@Role varchar(50)
as
Select UserId,FirstName,LastName,Gender,Usertype,Email from BankSystemUsers
where
ApprovedBy!='' and
(BankCode=@bankCode) and
(BranchCode=@branchCode)
and Usertype=@Role
GO
/****** Object:  StoredProcedure [dbo].[GetBankUsersAccountCode]    Script Date: 12/29/2017 09:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetBankUsersAccountCode]
@AccountCode varchar(50),
@BankCode varchar(50)


AS

select A.CustomerId,C.FirstName,C.LastName,C.BankCode, C.PhoneNumber,C.Email from CustomersToAccountsMapping AS A
inner Join
BankAccounts AS B on B.AccNumber=A.AccountNumber
inner Join 
BankCustomers AS C on C.CustomerId= A.CustomerId
Where
B.AccountCode=@AccountCode
and C.BankCode=@BankCode
GO
/****** Object:  StoredProcedure [dbo].[GetBankTellerAccountsPendingApproval]    Script Date: 12/29/2017 09:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetBankTellerAccountsPendingApproval]
@BankCode varchar(50),
@BranchCode varchar(50),
@UserId varchar(50)
as
Select AccNumber,FirstName,LastName,AccType,A.BranchCode,A.IsActive,A.CreatedBy from BankAccounts A
inner join TellersToAccountsMapping B on A.AccNumber=B.AccountNumber
inner join BankSystemUsers C on C.UserId=B.UserId 
where 
((A.ApprovedBy='') or (A.ApprovedBy is NULL)) and
(A.BankCode=@BankCode) and
(A.BranchCode=@BranchCode or @BranchCode='ALL') and
((C.UserId=@UserId) or @UserId='')
GO
/****** Object:  StoredProcedure [dbo].[GetCustomerAccountsByType]    Script Date: 12/29/2017 09:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetCustomerAccountsByType]
@CustomerID varchar(50),
@BankCode varchar(50),
@accType varchar(50)
as
Select A.CustomerId,FirstName,LastName,OtherName,B.AccountNumber,A.BankCode,A.BranchCode,A.Pin,C.AccNumber,dbo.fn_GetAccountBalance(C.BankCode,C.AccNumber) AS AccBalance,C.AccType from BankCustomers A
inner join CustomersToAccountsMapping B on A.CustomerId=B.CustomerId
inner join BankAccounts C on B.AccountNumber=c.AccNumber
where A.CustomerId=@CustomerID and A.BankCode=@BankCode and AccType=@accType
GO
/****** Object:  StoredProcedure [dbo].[GetCustomerDetail]    Script Date: 12/29/2017 09:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetCustomerDetail]
@customerid varchar(50),
@detail varchar(50)
AS

select * from BankCustomers where CustomerId=@customerid
GO
/****** Object:  StoredProcedure [dbo].[GetCustomerBankAccountsByAccount]    Script Date: 12/29/2017 09:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetCustomerBankAccountsByAccount]
@AccNumber varchar(50),
@AccountType varchar(50),
@Bank varchar(50)

AS

Select A.CustomerId,FirstName,LastName,OtherName,A.PhoneNumber,A.BankCode,A.BranchCode,A.Email,A.Gender,c.AccountId,
C.AccNumber AS AccountNumber,dbo.fn_GetAccountBalance(C.BankCode,C.AccNumber) AS AccountBalance,C.AccType AS AccountType 
--A.PhoneNumber
from 
BankCustomers A
inner join CustomersToAccountsMapping B on A.CustomerId=B.CustomerId
inner join BankAccounts C on B.AccountNumber=c.AccNumber
where A.BankCode=@Bank
and (AccType=@AccountType or @AccountType='')
and (c.AccNumber =@AccNumber or @AccNumber='')
GO
/****** Object:  StoredProcedure [dbo].[GetCustomerBankAccounts]    Script Date: 12/29/2017 09:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetCustomerBankAccounts]
@Bank varchar(50),
@BankBranch varchar(50),
@AccountType varchar(50)
AS

Select A.CustomerId,FirstName,LastName,OtherName,A.PhoneNumber,A.BankCode,A.BranchCode,C.AccNumber AS AccountNumber,dbo.fn_GetAccountBalance(C.BankCode,C.AccNumber) AS AccountBalance,C.AccType AS AccountType from BankCustomers A
inner join CustomersToAccountsMapping B on A.CustomerId=B.CustomerId
inner join BankAccounts C on B.AccountNumber=c.AccNumber
where A.BankCode=@Bank
and (AccType=@AccountType or @AccountType='')
and (A.BranchCode=@BankBranch or @BankBranch='ALL')
GO
/****** Object:  StoredProcedure [dbo].[InsertReceivedTransactionWithCharges]    Script Date: 12/29/2017 09:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[InsertReceivedTransactionWithCharges]
@CustomerName varchar(50),@toAccount varchar(50),@fromAccount varchar(50),@TranAmount decimal(18,2),@VendorTranId varchar(50),@PaymentDate datetime,@Teller varchar(50),@ApprovedBy varchar(50),@BankCode varchar(50),@Narration varchar(50),@TranCategory varchar(50),@BranchCode varchar(50),@Currency varchar(50),@PaymentType varchar(50),@ChequeNumber varchar(50),@Charge1Name varchar(50),@Charge1Amount decimal(18,2),@Charge1CommissionAccount varchar(50),@Charge1SourceAccount varchar(50),@Charge2Name varchar(50),@Charge2Amount decimal(18,2),@Charge2CommissionAccount varchar(50),@Charge2SourceAccount varchar(50),@Charge3Name varchar(50),@Charge3Amount decimal(18,2),@Charge3CommissionAccount varchar(50),@Charge3SourceAccount varchar(50),@Charge4Name varchar(50),@Charge4Amount decimal(18,2),@Charge4CommissionAccount varchar(50),@Charge4sourceAccount varchar(50),@CustomerRef varchar(50),@CustomerTel varchar(50)as
---------------------------------------------------------------------
-- Lets start
BEGIN Transaction Trans
BEGIN TRY
Declare @PegPayId int

--do we need to know the balance of an account before transacting
--if so then we need to lock
If(@TranCategory='WITHDRAW' or @TranCategory='CASH_OUT' or @TranCategory='INTERNAL_TRANSFER')
Begin
-- Insert withdraw Transaction..Here we need to lock
 EXEC @PegPayId = InsertWithdrawTranIntoGeneralLedger @CustomerName,													@toAccount,													@fromAccount,													@TranAmount,													@VendorTranId,													@PaymentDate,													@Teller,													@ApprovedBy,													@BankCode,													@Narration,													@TranCategory,
													@BranchCode,
													@Currency,
													@PaymentType,
													@ChequeNumber,
													@CustomerRef,
													@CustomerTel;
End

--here we dont need to know the balance..we just pass them to the general ledger
Else
Begin
--------------------------------------------------------------------
-- Insert Transaction as is..no locking
 EXEC @PegPayId = InsertTranIntoGeneralLedger @CustomerName,											@toAccount,											@fromAccount,											@TranAmount,											@VendorTranId,											@PaymentDate,											@Teller,											@ApprovedBy,											@BankCode,											@Narration,											@TranCategory,
											@BranchCode,
											@Currency,
											@PaymentType,
											@ChequeNumber,
											@CustomerRef,
											@CustomerTel;
End
--------------------------------------------------------------------
--Insert Charges
--------------------------------------------------------------------
--Insert Charge 1 if its set
 if((@Charge1Amount > 0) and (@Charge1CommissionAccount!=''))
 Begin
	  EXEC @PegPayId = InsertTranIntoGeneralLedger @CustomerName,														   @Charge1CommissionAccount,--com Acc														   @Charge1SourceAccount,														   @Charge1Amount,--chargeAmnt														   @VendorTranId,														   @PaymentDate,														   @Teller,														   @ApprovedBy,														   @BankCode,														   @Charge1Name,														   'CHARGE-1',
														   @BranchCode,
														   @Currency,
														   @PaymentType,
														   @ChequeNumber,
														   @CustomerRef,
														   @CustomerTel;
 End
 ------------------------------------------------------------------
 -- Insert Charge 2 if its set
 if((@Charge2Amount > 0) and (@Charge2CommissionAccount!=''))
 Begin
	  EXEC @PegPayId = InsertTranIntoGeneralLedger @CustomerName,														   @Charge2CommissionAccount,--com Acc														   @Charge2SourceAccount,														   @Charge2Amount,--chargeAmnt														   @VendorTranId,														   @PaymentDate,														   @Teller,														   @ApprovedBy,														   @BankCode,														   @Charge2Name,														   'CHARGE-2',
														   @BranchCode,
														   @Currency,
														   @PaymentType,
														   @ChequeNumber,
														   @CustomerRef,
														   @CustomerTel;
 End
 --------------------------------------------------------------------
 -- Insert Charge 3 if its set
 if((@Charge3Amount > 0) and (@Charge3CommissionAccount!=''))
 Begin
	  EXEC @PegPayId = InsertTranIntoGeneralLedger @CustomerName,														   @Charge3CommissionAccount,--com Acc														   @Charge3SourceAccount,														   @Charge3Amount,--chargeAmnt														   @VendorTranId,														   @PaymentDate,														   @Teller,														   @ApprovedBy,														   @BankCode,														   @Charge3Name,														   'CHARGE-3',
														   @BranchCode,
														   @Currency,
														   @PaymentType,
														   @ChequeNumber,
														   @CustomerRef,
														   @CustomerTel;
 End
 -------------------------------------------------------------------
 --Insert Charge 4 if its set
 if((@Charge4Amount > 0) and (@Charge4CommissionAccount!=''))
 Begin
	  EXEC @PegPayId = InsertTranIntoGeneralLedger @CustomerName,														   @Charge4CommissionAccount,--com Acc														   @Charge4SourceAccount,														   @Charge4Amount,--chargeAmnt														   @VendorTranId,														   @PaymentDate,														   @Teller,														   @ApprovedBy,														   @BankCode,														   @Charge4Name,														   'CHARGE-4',
														   @BranchCode,
														   @Currency,
														   @PaymentType,
														   @ChequeNumber,
														   @CustomerRef,
														   @CustomerTel;
End
---------------------------------------------------------------------
Select PegPayTranId as PegPayId from GeneralLedgerTable 
where BankCode=@BankCode and BankTranId=@VendorTranId
---------------------------------------------------------------------
Commit Transaction Trans

END TRY
BEGIN CATCH

ROLLBACK Transaction Trans

  DECLARE
   @ErMessage NVARCHAR(2048),
   @ErSeverity INT,
   @ErState INT
 
 SELECT
   @ErMessage = ERROR_MESSAGE(),
   @ErSeverity = ERROR_SEVERITY(),
   @ErState = ERROR_STATE()
 
 RAISERROR (@ErMessage,
             @ErSeverity,
             @ErState )
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[InitiateCustomerDeletion]    Script Date: 12/29/2017 09:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[InitiateCustomerDeletion]	@CustomerId varchar(50),	@bankCode varchar(50),	@ModifiedBy varchar(50),	@Reason varchar(50)AS   Begin
		Insert Into PendingBankCustomerApprovals
		(CustomerId,Email,FirstName,LastName,OtherName,
		[Password],[IsActive],BankCode,CreatedOn,
		ModifiedOn,CreatedBy,ModifiedBy,ApprovedBy,
		PhoneNumber,BranchCode,DateOfBirth,Gender,
		PathToProfilePic,PathToSignature,
		NextOfKinName,NextOfKinContact,Nationality,MaritalStatus,PIN,UserCategory,Action,Reason
		)
	    select 
		 CustomerId,Email,FirstName,LastName,OtherName,
		 [Password],[IsActive],BankCode,CreatedOn,
		 GETDATE(),CreatedBy,@ModifiedBy,'',
		 PhoneNumber,BranchCode,DateOfBirth,Gender,
		 PathToProfilePic,PathToSignature,
		 NextOfKinName,NextOfKinContact,Nationality,MaritalStatus,PIN,UserCategory,'DELETE',@Reason
		 from BankCustomers where CustomerId=@CustomerId and BankCode=@bankCode	
	End
GO
/****** Object:  StoredProcedure [dbo].[InitiateCustomerDelete]    Script Date: 12/29/2017 09:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[InitiateCustomerDelete]	@CustomerId varchar(50),	@bankCode varchar(50),	@ModifiedBy varchar(50),	@Reason varchar(50)AS   Begin
		Insert Into PendingBankCustomerApprovals
		(CustomerId,Email,FirstName,LastName,OtherName,
		[Password],[IsActive],BankCode,CreatedOn,
		ModifiedOn,CreatedBy,ModifiedBy,ApprovedBy,
		PhoneNumber,BranchCode,DateOfBirth,Gender,
		PathToProfilePic,PathToSignature,
		NextOfKinName,NextOfKinContact,Nationality,MaritalStatus,PIN,UserCategory,Action,Reason
		)
	    select 
		 CustomerId,Email,FirstName,LastName,OtherName,
		 [Password],[IsActive],BankCode,CreatedOn,
		 GETDATE(),CreatedBy,@ModifiedBy,ApprovedBy,
		 PhoneNumber,BranchCode,DateOfBirth,Gender,
		 PathToProfilePic,PathToSignature,
		 NextOfKinName,NextOfKinContact,Nationality,MaritalStatus,PIN,UserCategory,'DELETE',@Reason
		 from BankCustomers where CustomerId=@CustomerId and BankCode=@bankCode	
	End
GO
/****** Object:  StoredProcedure [dbo].[SearchBankUsersTable]    Script Date: 12/29/2017 09:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SearchBankUsersTable]
@bankCode varchar(50),
@UserType varchar(50),
@Name varchar(50)
as
Select UserId as Id,Email,FirstName+''+LastName as Name,A.IsActive,B.Role,A.BranchCode,PhoneNumber
 from BankSystemUsers A
 inner join UserTypes B on A.Usertype=B.UserType and A.BankCode=B.BankCode
 where 
(A.Usertype=@UserType or @UserType='ALL') and
(A.BankCode=@bankCode or @bankCode='ALL') and
(((FirstName like '%'+@Name+'%') or (@Name='')) or 
((LastName like '%'+@Name+'%') or (@Name='')))
GO
/****** Object:  StoredProcedure [dbo].[SearchAccountsTableForNonLoanAccounts]    Script Date: 12/29/2017 09:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SearchAccountsTableForNonLoanAccounts]
@AccountNumber varchar(50),
@bankCode varchar(50),
@CustomerName varchar(50)
as
select A.BankCode,AccNumber,C.CustomerId as CustomerID,C.FirstName+' '+C.LastName as CustomerName,dbo.fn_GetAccountBalance(A.BankCode,AccNumber) AS AccBalance,AccType,A.BranchCode,A.CreatedOn from BankAccounts A
inner join CustomersToAccountsMapping B on A.AccNumber=B.AccountNumber
inner join BankCustomers C on C.CustomerId=B.CustomerId
where 
(AccNumber=@AccountNumber or @AccountNumber='') 
and A.BankCode=@bankCode
and A.AccType!='LOAN_ACCOUNT'
and ((C.CustomerId=@CustomerName)or(C.FirstName like @CustomerName+'%')or(@CustomerName=''))
GO
/****** Object:  StoredProcedure [dbo].[SearchAccountsTableForLoanAccounts]    Script Date: 12/29/2017 09:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SearchAccountsTableForLoanAccounts]
@AccountNumber varchar(50),
@bankCode varchar(50),
@CustomerName varchar(50)
as
select A.BankCode,AccNumber,C.FirstName+' '+C.LastName as CustomerName,dbo.fn_GetAccountBalance(A.BankCode,AccNumber) AS AccBalance,AccType,A.BranchCode,A.CreatedOn from BankAccounts A
inner join CustomersToAccountsMapping B on A.AccNumber=B.AccountNumber
inner join BankCustomers C on C.CustomerId=B.CustomerId
where 
(AccNumber=@AccountNumber or @AccountNumber='') 
and A.BankCode=@bankCode
and A.AccType='LOAN_ACCOUNT'
and (
C.CustomerId=@CustomerName or 
C.FirstName = @CustomerName or 
C.LastName = @CustomerName or
C.PhoneNumber = @CustomerName or 
@CustomerName=''
)
GO
/****** Object:  StoredProcedure [dbo].[SearchAccountsTable]    Script Date: 12/29/2017 09:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SearchAccountsTable]
@AccountNumber varchar(50),
@bankCode varchar(50),
@CustomerName varchar(50)
as
select A.BankCode,AccNumber,C.CustomerId as CustomerID,C.FirstName+' '+C.LastName as CustomerName,CONVERT(varchar, CAST(dbo.fn_GetAccountBalance(A.BankCode,AccNumber) AS money),1) AS AccBalance,AccType,A.BranchCode,A.CreatedOn from BankAccounts A
inner join CustomersToAccountsMapping B on A.AccNumber=B.AccountNumber
inner join BankCustomers C on C.CustomerId=B.CustomerId
where 
(AccNumber=@AccountNumber or @AccountNumber='') 
and A.BankCode=@bankCode
and (
C.CustomerId=@CustomerName or 
C.FirstName = @CustomerName or 
C.LastName = @CustomerName or
C.PhoneNumber = @CustomerName or 
@CustomerName=''
)
GO
/****** Object:  StoredProcedure [dbo].[GetCustomerLoanAccounts]    Script Date: 12/29/2017 09:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetCustomerLoanAccounts]
@customerId varchar(50),
@bankCode varchar(50),
@accType varchar(50)
as
select A.BankCode,AccNumber,C.CustomerId as CustomerID,C.FirstName+' '+C.LastName as CustomerName,dbo.fn_GetAccountBalance(A.BankCode,A.AccNumber) AS AccBalance,AccType,A.BranchCode,A.CreatedOn from BankAccounts A
inner join CustomersToAccountsMapping B on A.AccNumber=B.AccountNumber
inner join BankCustomers C on C.CustomerId=B.CustomerId
where 
A.BankCode=@bankCode
and (C.CustomerId=@customerId) and AccType=@accType
GO
/****** Object:  StoredProcedure [dbo].[UpdateUserPasswordWithHmacSha256]    Script Date: 12/29/2017 09:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[UpdateUserPasswordWithHmacSha256]
@UserId varchar(50),
@Password varchar(250)
as
--update both tables in case user is in either
--the assumption is the userId is unique in both tables

Update BankSystemUsers set Password=@Password where UserId=@UserId

Update BankCustomers set Password=@Password where CustomerId=@UserId
GO
/****** Object:  StoredProcedure [dbo].[GetAccountValuesByCode]    Script Date: 12/29/2017 09:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetAccountValuesByCode]
@AccountCode varchar(50),
@State varchar(50)
AS

if(@State='ACCOUNT')
BEGIN
SELECT (select FirstName + ' ' + LastName from BankSystemUsers where UserId=A.CreatedBy) as Creator,
(select FirstName + ' ' + LastName from BankSystemUsers where UserId=A.ApprovedBy) as Approver,
(case A.IsReferenced when 1 then 'YES' else 'NO' end) as Referenced, *  
FROM BankAccounts AS A
 inner join
 Banks AS B on B.BankCode=A.BankCode
 inner join 
 BankBranches AS L on L.BranchCode=A.BranchCode
 Left Join
 LiquidationTypes  As T on T.LiquidationCode=A.LiquidationType
WHERE
A.AccountCode=@AccountCode

select A.CustomerId from CustomersToAccountsMapping AS A
inner Join
BankAccounts AS B on B.AccNumber=A.AccountNumber
Where
B.AccountCode=@AccountCode
END
ELSE
BEGIN
SELECT *  
FROM dbo.RejectedBankAccounts AS A
 inner join
 Banks AS B on B.BankCode=A.BankCode
 inner join 
 BankBranches AS L on L.BranchCode=A.BranchCode
 Left Join
 LiquidationTypes  As T on T.LiquidationCode=A.LiquidationType
WHERE
A.AccountCode=@AccountCode
END
GO
/****** Object:  StoredProcedure [dbo].[GetAccountSignatories2]    Script Date: 12/29/2017 09:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetAccountSignatories2]
@AccNumber varchar(50),
@BankCode varchar(50)
as
Select A.CustomerId,A.FirstName+''+A.LastName as Name,A.Email,B.AccountNumber,A.BankCode,A.BranchCode,A.CreatedOn from BankCustomers A
inner join CustomersToAccountsMapping B on (A.CustomerId=B.CustomerId and A.BankCode=B.BankCode)
inner join BankAccounts C on (B.AccountNumber=C.AccNumber)
where C.AccNumber=@AccNumber and C.BankCode=@BankCode
GO
/****** Object:  StoredProcedure [dbo].[GetAccountSignatories]    Script Date: 12/29/2017 09:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetAccountSignatories]
@AccNumber varchar(50),
@BankCode varchar(50)
as
Select * from BankCustomers A
inner join CustomersToAccountsMapping B on (A.CustomerId=B.CustomerId and A.BankCode=B.BankCode)
inner join BankAccounts C on (B.AccountNumber=C.AccNumber)
where C.AccNumber=@AccNumber and C.BankCode=@BankCode
GO
/****** Object:  StoredProcedure [dbo].[GetAccountDetailsByCode]    Script Date: 12/29/2017 09:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetAccountDetailsByCode]
@AccountCode varchar(50)
AS

SELECT A.AccountCode, A.AccountName,A.AccNumber,A.LiquidationAccount,A.LiquidationAccountName,A.AccType,B.BankName,L.BranchName,L.Location,A.CreatedOn,
A.CreatedBy,(select FirstName + ' '+ LastName from BankSystemUsers where UserId=A.CreatedBy) as Creator,
(select FirstName + ' '+ LastName from BankSystemUsers where UserId=A.ApprovedBy) as Approver
,T.LiquidationName,A.LiquidationFrequency,A.LiquidationType,case when A.IsReferenced=0 then 'NO' Else 'YES' end as Referenced ,A.BankCode,
A.BranchCode,A.IsActive,dbo.fn_GetAccountBalance(A.BankCode,a.AccNumber) as AccBalance,A.CurrencyCode,A.MinimumBalance,
A.MerchantContact,A.AccountCategory,A.ModifiedBy,A.ApprovedBy,A.ReferenceType,A.NumberOfAuthorisers
FROM BankAccounts AS A
 inner join
 Banks AS B on B.BankCode=A.BankCode
 inner join 
 BankBranches AS L on L.BranchCode=A.BranchCode
 Left Join
 LiquidationTypes  As T on T.LiquidationCode=A.LiquidationType
WHERE
A.AccountCode=@AccountCode

select A.CustomerId from CustomersToAccountsMapping AS A
inner Join
BankAccounts AS B on B.AccNumber=A.AccountNumber
Where
B.AccountCode=@AccountCode
GO
/****** Object:  StoredProcedure [dbo].[Users_Update]    Script Date: 12/29/2017 09:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	Users_Update
-- Author:	Nsubuga Kasozi
-- Create date:	12/21/2015 3:54:58 PM
-- Description:	This stored procedure is intended for updating Users table
-- ==========================================================================================
CREATE Procedure [dbo].[Users_Update]
	@UserId varchar(50),
	@Email varchar(50),
	@FirstName varchar(50),
	@LastName varchar(50),
	@OtherName varchar(50),
	@Usertype varchar(50),
	@Password varchar(50),
	@IsActive bit,
	@BankCode varchar(50),
	@CreatedBy varchar(50),
	@ModifiedBy varchar(50),
	@ApprovedBy varchar(50),
	@PhoneNumber varchar(50),
	@BranchCode varchar(50),
	@DateOfBirth varchar(50),
	@Gender varchar(50),
	@TranAmountLimit varchar(50)
As
Begin transaction trans
Begin try
IF not exists(Select * from BankSystemUsers where UserId=@UserId and BankCode=@BankCode)
Begin
	Insert Into BankSystemUsers
		(UserId,Email,FirstName,LastName,OtherName,[Usertype],
		[Password],[IsActive],BankCode,RecordDate,
		ModifiedOn,CreatedBy,ModifiedBy,ApprovedBy,
		PhoneNumber,BranchCode,DateOfBirth,Gender,TranAmountLimit)
	Values
		(@UserId,@Email,@FirstName,@LastName,@OtherName,@Usertype,
		 @Password,@IsActive,@BankCode,GETDATE(),
		 GETDATE(),@CreatedBy,@ModifiedBy,@ApprovedBy,
		 @PhoneNumber,@BranchCode,@DateOfBirth,@Gender,@TranAmountLimit)
	Select @UserId as InsertedId
End
Else
Begin
	--if this is approved By field is not set	if(@ApprovedBy='')	Begin
		Update BankSystemUsers
		Set
			FirstName = @FirstName,
			LastName=@LastName,
			OtherName=@OtherName,
			Email=@Email,
			[Usertype] = @Usertype,
			[Password] = @Password,
			[IsActive] = @IsActive,
			BankCode = @BankCode,
			ModifiedOn = GETDATE(),
			ModifiedBy = @ModifiedBy,
			PhoneNumber = @PhoneNumber,
			BranchCode = @BranchCode,
			DateOfBirth = @DateOfBirth,
			Gender = @Gender,
			TranAmountLimit = @TranAmountLimit
		Where		
			UserId = @UserId and BankCode=@BankCode
			Select @UserId as InsertedId
	End
	Else
	Begin
		Update BankSystemUsers
		Set
			FirstName = @FirstName,
			LastName=@LastName,
			OtherName=@OtherName,
			[Usertype] = @Usertype,
			[Password] = @Password,
			[IsActive] = @IsActive,
			BankCode = @BankCode,
			ModifiedOn = GETDATE(),
			ModifiedBy = @ModifiedBy,
			ApprovedBy = @ApprovedBy,
			PhoneNumber = @PhoneNumber,
			BranchCode = @BranchCode,
			DateOfBirth = @DateOfBirth,
			Gender = @Gender,
			TranAmountLimit = @TranAmountLimit
		Where		
			UserId = @UserId and BankCode=@BankCode
		Select @UserId as InsertedId
	End
End
---------------------------------------------------------------------
Commit Transaction Trans

END TRY
BEGIN CATCH

ROLLBACK Transaction Trans

  DECLARE
   @ErMessage NVARCHAR(2048),
   @ErSeverity INT,
   @ErState INT
 
 SELECT
   @ErMessage = ERROR_MESSAGE(),
   @ErSeverity = ERROR_SEVERITY(),
   @ErState = ERROR_STATE()
 
 RAISERROR (@ErMessage,
             @ErSeverity,
             @ErState )
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[Users_SelectRow]    Script Date: 12/29/2017 09:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	Users_SelectRow
-- Author:	Nsubuga Kasozi
-- Create date:	12/21/2015 3:54:58 PM
-- Description:	This stored procedure is intended for selecting a specific row from Users table
-- ==========================================================================================
CREATE Procedure [dbo].[Users_SelectRow]
	@UserId varchar(50)
As
Begin
	Select 
		*
	From BankSystemUsers
	Where
		[UserId] = @UserId
End
GO
/****** Object:  StoredProcedure [dbo].[Users_SelectAll]    Script Date: 12/29/2017 09:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	Users_SelectAll
-- Author:	Nsubuga Kasozi
-- Create date:	12/21/2015 3:54:58 PM
-- Description:	This stored procedure is intended for selecting all rows from Users table
-- ==========================================================================================
CREATE Procedure [dbo].[Users_SelectAll]
@BankCode varchar(50)
As
Begin
	Select 
	*
	From BankSystemUsers where BankCode=@BankCode
End
GO
/****** Object:  StoredProcedure [dbo].[Users_DeleteRow]    Script Date: 12/29/2017 09:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	Users_DeleteRow
-- Author:	Nsubuga Kasozi
-- Create date:	12/21/2015 3:54:58 PM
-- Description:	This stored procedure is intended for deleting a specific row from Users table
-- ==========================================================================================
CREATE Procedure [dbo].[Users_DeleteRow]
	@UserId int
As
Begin
	Delete BankSystemUsers
	Where
		[UserId] = @UserId

End
GO
/****** Object:  StoredProcedure [dbo].[UpdateUsers]    Script Date: 12/29/2017 09:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[UpdateUsers]
@custid varchar(50),
@email varchar(50),
@fname varchar(50),
@lname varchar(50)
as
Update BankCustomers set FirstName=@fname,LastName=@lname 
where Email=@email and CustomerId=@custid
GO
/****** Object:  StoredProcedure [dbo].[Accounts_Update1]    Script Date: 12/29/2017 09:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create  PROC [dbo].[Accounts_Update1]	@AccountId varchar(50),	@AccBalance money,	@UserId varchar(50),	@AccNumber varchar(50),	@AccType varchar(50),	@BankCode varchar(50),	@ModifiedBy varchar(50),	@BranchCode varchar(50),	@IsActive bit,	@CurrencyCode varchar(50),	@ApprovedBy varchar(50),	@AccountName varchar(50),	@MinimumBal decimal(18,2),	@InterestRate decimal(18,2),	@InterestType varchar(50),	@InterestPayOutFreq varchar(50)ASBEGIN TRYIF not exists(select * from BankAccounts where AccNumber=@AccNumber and BankCode=@BankCode)BEGIN	INSERT INTO BankAccounts (		[AccNumber],		[AccType],		BankCode,		CreatedOn,		ModifiedOn,		CreatedBy,		ModifiedBy,		BranchCode,		IsActive,		CurrencyCode,		ApprovedBy,		AccountName,		MinimumBalance,		InterestRate,		InterestType,		LastEodDate,		InterestPayOutFrequency	)	VALUES (		@AccNumber,		@AccType,		@BankCode,		GETDATE(),		GETDATE(),		@ModifiedBy,		@ModifiedBy,		@BranchCode,		@IsActive,		@CurrencyCode,		@ApprovedBy,		@AccountName,		@MinimumBal,		@InterestRate,		@InterestType,		GETDATE(),		@InterestPayOutFreq	)ENDELSE BEGIN	--if this is approved By field is not set	if(@ApprovedBy='')	Begin		UPDATE BankAccounts SET			[AccType] = @AccType,			ModifiedOn=GETDATE(),			ModifiedBy=@ModifiedBy,			IsActive=@IsActive,			AccountName=@AccountName,			MinimumBalance=@MinimumBal,			InterestRate=@InterestRate,			InterestType=@InterestType,			InterestPayOutFrequency=@InterestPayOutFreq		WHERE AccNumber = @AccNumber and BankCode=@BankCode				SELECT @AccNumber As InsertedID	End		--Approved By Field is set	Else	Begin		UPDATE BankAccounts SET			[AccType] = @AccType,			ModifiedOn=GETDATE(),			ModifiedBy=@ModifiedBy,			IsActive=@IsActive,			ApprovedBy=@ApprovedBy,			AccountName=@AccountName,			MinimumBalance=@MinimumBal,			InterestRate=@InterestRate,			InterestType=@InterestType,			InterestPayOutFrequency=@InterestPayOutFreq		WHERE AccNumber = @AccNumber and BankCode=@BankCode				SELECT @AccNumber As InsertedID	EndENDBEGIN		--if this is a teller account	if exists(select * from BankSystemUsers where UserId=@UserId and BankCode=@BankCode)	Begin		--add link btn teller and account in teller to accounts mapping table		EXEC dbo.TellersToAccounts_Insert @UserId,@AccNumber,@BankCode	End	--if this is a customer	Else if exists(select * from BankCustomers where CustomerId=@UserId and BankCode=@BankCode)	Begin		--add link btn customer and account in customer to accounts mapping table		EXEC dbo.CustomersToAccounts_Insert @UserId,@AccNumber,@BankCode	End		SELECT @AccNumber As InsertedIDEND--insert an EOD balance for yesterdays dateDeclare @yesterdaysDate datetime =  DATEADD(d, -1, DATEDIFF(d, 0, GETDATE()));EXEC [dbo].[AccountEODBalances_Insert] @BankCode,@AccNumber,0,0,@yesterdaysDate,0,@AccTypeEND TRYBEGIN CATCH
  DECLARE
   @ErMessage NVARCHAR(2048),
   @ErSeverity INT,
   @ErState INT
 
 SELECT
   @ErMessage = ERROR_MESSAGE(),
   @ErSeverity = ERROR_SEVERITY(),
   @ErState = ERROR_STATE()
 
 RAISERROR (@ErMessage,
             @ErSeverity,
             @ErState )END CATCH
GO
/****** Object:  StoredProcedure [dbo].[Accounts_Update]    Script Date: 12/29/2017 09:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Accounts_Update]	@AccountId varchar(50),	@AccBalance money,	@UserId varchar(50),	@AccNumber varchar(50),	@AccType varchar(50),	@AccountCat varchar(100),	@BankCode varchar(50),	@ModifiedBy varchar(50),	@BranchCode varchar(50),	@IsActive bit,	@CurrencyCode varchar(50),	@ApprovedBy varchar(50),	@AccountName varchar(50),	@MinimumBal decimal(18,2),	@InterestRate decimal(18,2),	@InterestType varchar(50),	@InterestPayOutFreq varchar(50),	@IsProductAccount bit,	@ProductType varchar(50),	@Referenced bit,	@LiquidationType varchar(50),	@LiquidationFrequency varchar(100),	@BankLiqAccount varchar(100),	@BankAccountName varchar(100),    @MerchantContact varchar(50)ASBEGIN TRANSACTION CreateAccountBEGIN TRYDeclare @AccountingDate bigintDeclare @AccountingPeriod bigint--select top 1 @AccountingDate=AccountingDate,@AccountingPeriod=AccountingPeriod  from SystemDateSettings --where BankCode=@BankCode and Isclosed=1--order by accountingDate desc--if(@AccountingDate=NULL)BEGINSET @AccountingDate=(SELECT CONVERT(VARCHAR(10), DATEADD(day, -1, GETDATE()), 112))
SET @AccountingPeriod=(SELECT LEFT(CONVERT(varchar, DATEADD(day, -1, GETDATE()),112),6))ENDIF not exists(select * from BankAccounts where AccNumber=@AccNumber and BankCode=@BankCode)BEGIN	INSERT INTO BankAccounts (		[AccNumber],		[AccType],		BankCode,		CreatedOn,		ModifiedOn,		CreatedBy,		ModifiedBy,		BranchCode,		IsActive,		CurrencyCode,		ApprovedBy,		AccountName,		MinimumBalance,		InterestRate,		InterestType,		LastEodDate,		LastRunAccountDate,		InterestPayOutFrequency,		IsproductAccount,		ProductType,		IsReferenced,		LiquidationType,		AccountCategory,		LiquidationFrequency,		LiquidationAccount,		LiquidationAccountName,		MerchantContact	)	VALUES (		@AccNumber,		@AccType,		@BankCode,		GETDATE(),		GETDATE(),		@ModifiedBy,		@ModifiedBy,		@BranchCode,		@IsActive,		@CurrencyCode,		@ApprovedBy,		@AccountName,		@MinimumBal,		@InterestRate,		@InterestType,		GETDATE(),		@AccountingDate,		@InterestPayOutFreq,		@IsProductAccount,		@ProductType,		@Referenced,		@LiquidationType,		@AccountCat,		@LiquidationFrequency,		@BankLiqAccount,		@BankAccountName,		@MerchantContact	)		DECLARE @AccountCode varchar(50)
    DECLARE @ident bigint
    SET @ident = @@Identity
    SET @AccountCode = dbo.fn_GetAccountCode(@ident)    Update BankAccounts set AccountCode=@AccountCode where AccountId=@ident    SELECT @AccNumber As InsertedID,@AccountCode AS AccountCode	--insert an EOD balance for yesterdays date	Declare @yesterdaysDate datetime =  DATEADD(d, -1, DATEDIFF(d, 0, GETDATE()));	EXEC [dbo].[AccountEODBalances_Insert] @BankCode,@AccNumber,0,0,@yesterdaysDate,0,@AccType,@AccountingDate,@AccountingPeriod		INSERT INTO [PegPayGatewayDB].[dbo].[MerchantDetails]
           ([MerchantName]
           ,[MerchantId]
           ,[Username]
           ,[Password]
           ,[IsActive]
           ,[LoginAttempts]
           ,[SecretCode])
     VALUES
           (@AccountName
           ,@AccountCode
           ,'test'
           ,'50b2d34b7a20dbadaa3735c018e9f6c3e6245d6ddd331866ca4aa1f18ba455e2'
           ,1
           ,0
           ,'T3rr16132016')ENDELSE BEGINSELECT @AccNumber As InsertedID,AccountCode AS AccountCode from BankAccounts where AccNumber=@AccNumber and BankCode=@BankCode	--if this is approved By field is not set	if(@ApprovedBy='')	Begin			INSERT INTO PendingBankAccountApprovals (		[AccNumber],		[AccType],		BankCode,		CreatedOn,		ModifiedOn,		CreatedBy,		ModifiedBy,		BranchCode,		IsActive,		CurrencyCode,		ApprovedBy,		AccountName,		MinimumBalance,		InterestRate,		InterestType,		LastEodDate,		LastRunAccountDate,		InterestPayOutFrequency,		IsproductAccount,		ProductType,		IsReferenced,		LiquidationType,		AccountCategory,		LiquidationFrequency,		LiquidationAccount,		LiquidationAccountName,		AccountCode,		SentToBank,		MerchantContact	)	VALUES (		@AccNumber,		@AccType,		@BankCode,		GETDATE(),		GETDATE(),		@ModifiedBy,		@ModifiedBy,		@BranchCode,		@IsActive,		@CurrencyCode,		@ApprovedBy,		@AccountName,		@MinimumBal,		@InterestRate,		@InterestType,		GETDATE(),		@AccountingDate,		@InterestPayOutFreq,		@IsProductAccount,		@ProductType,		@Referenced,		@LiquidationType,		@AccountCat,		@LiquidationFrequency,		@BankLiqAccount,		@BankAccountName,		@AccountId,		0,		@MerchantContact	)			End		--Approved By Field is set	Else	Begin		UPDATE BankAccounts SET			[AccType] = @AccType,			ModifiedOn=GETDATE(),			ModifiedBy=@ModifiedBy,			IsReferenced=@Referenced,			IsActive=@IsActive,			ApprovedBy=@ApprovedBy,			AccountName=@AccountName,			MinimumBalance=@MinimumBal,			InterestRate=@InterestRate,			InterestType=@InterestType,			InterestPayOutFrequency=@InterestPayOutFreq,			MerchantContact=@MerchantContact		WHERE AccNumber = @AccNumber and BankCode=@BankCode					EndENDBEGIN		--if this is a teller account	if exists(select * from BankSystemUsers where UserId=@UserId and BankCode=@BankCode)	Begin		--add link btn teller and account in teller to accounts mapping table		EXEC dbo.TellersToAccounts_Insert @UserId,@AccNumber,@BankCode	End	----if this is a customer	--Else if exists(select * from BankCustomers where CustomerId=@UserId and BankCode=@BankCode)	--Begin	--	--add link btn customer and account in customer to accounts mapping table	--	--EXEC dbo.CustomersToAccounts_Insert @UserId,@AccNumber,@BankCode	--End		ENDCOMMIT TRANSACTION CreateAccountEND TRYBEGIN CATCH
ROLLBACK Transaction CreateAccount

  DECLARE
   @ErMessage NVARCHAR(2048),
   @ErSeverity INT,
   @ErState INT
 
 SELECT
   @ErMessage = ERROR_MESSAGE(),
   @ErSeverity = ERROR_SEVERITY(),
   @ErState = ERROR_STATE()
 
 RAISERROR (@ErMessage,
             @ErSeverity,
             @ErState )END CATCH
GO
/****** Object:  StoredProcedure [dbo].[SaveBankUser]    Script Date: 12/29/2017 09:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SaveBankUser]
(@userId varchar(50), @fname varchar(50), @lname varchar(50), @oname varchar(50), @gender varchar(50), @phoneNumber varchar(50), 
@email varchar(50), @dob varchar(50), @branchCode varchar(50), @modifiedBy varchar(50))
as begin
	
	begin try
		begin transaction
		declare @accNum varchar(50)
		select @accNum = accountnumber from CustomersToAccountsMapping where CustomerId = @userId;
		
		insert into BankAccountsHistory select * from BankAccounts where AccNumber = @accNum
		insert into BankCustomersHistory select * from BankCustomers where CustomerId = @userId
		
		update BankCustomers set Email = @email, FirstName = @fname, LastName = @lname, OtherName = @oname, PhoneNumber = @phoneNumber,
		Gender = @gender, BranchCode = @branchCode, ModifiedBy = @modifiedBy where CustomerId = @userId
		
		update BankAccounts set AccountName = @fname+' '+@lname+' '+@oname, BranchCode = @branchCode, ModifiedBy = @modifiedBy where AccNumber = @accNum
		commit
	end try
	begin catch
	
		ROLLBACK Transaction Trans

		  DECLARE
		   @ErMessage NVARCHAR(2048),
		   @ErSeverity INT,
		   @ErState INT
		 
		 SELECT
		   @ErMessage = ERROR_MESSAGE(),
		   @ErSeverity = ERROR_SEVERITY(),
		   @ErState = ERROR_STATE()
		 
		 RAISERROR (@ErMessage,
				 @ErSeverity,
				 @ErState )
		
	end catch
end
	--select * from BankAccounts order by AccountId desc
	--select * from CustomersToAccountsMapping
	--select * from BankCustomers order by RecordId  desc
GO
/****** Object:  View [dbo].[SystemUsersView]    Script Date: 12/29/2017 09:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[SystemUsersView]
AS
SELECT  [CustomerId] as UserId
      ,[Email]
      ,[FirstName]
      ,[LastName]
      ,[OtherName]
      ,'CUSTOMER' as UserType
      ,[Password] as 'Password'
      ,[IsActive]
      ,[BankCode]
      ,[DateOfBirth]
      ,[CreatedOn]
      ,[ModifiedOn]
      ,[CreatedBy]
      ,[ModifiedBy]
      ,[PhoneNumber]
      ,[BranchCode]
      ,[Gender]
      ,[ApprovedBy]
      ,[PathToProfilePic]
      ,[PathToSignature]
      ,'0' as TranAmountLimit
      ,ResetPassword
      ,ResetPin
      ,UserCategory
      ,SecretKey
 from BankCustomers 
union
Select [UserId]
      ,[Email]
      ,[FirstName]
      ,[LastName]
      ,[OtherName]
      ,[Usertype]
      ,[Password]
      ,[IsActive]
      ,[BankCode]
      ,[DateOfBirth]
      ,[RecordDate] as 'CreateOn'
      ,[ModifiedOn]
      ,[CreatedBy]
      ,[ModifiedBy]
      ,[PhoneNumber]
      ,[BranchCode]
      ,[Gender]
      ,[ApprovedBy]
      ,'' as PathToProfilePic
      ,'' as PathToSignature
      ,TranAmountLimit
      ,ResetPassword
      ,ResetPin
      ,'' AS UserCategory
      ,SecretKey
 from BankSystemUsers   
union
Select CustomerId as UserId
      ,''
      ,TerminalName as FirstName
      ,''
      ,''
      ,'TELLER' as Usertype
      ,Pin as Password
      ,[Active] as IsActive
      ,[BankCode]
      ,'' as DateOfBirth
      ,[RecordDate] as 'CreateOn'
      ,'' as ModifiedOn
      ,[CreatedBy]
      ,'' as ModifiedBy
      ,CustomerTel as PhoneNumber
      ,[BranchCode]
      ,'' as Gender
      ,[CreatedBy] as ApprovedBy
      ,'' as PathToProfilePic
      ,'' as PathToSignature
      ,'' as TranAmountLimit
      ,0 as ResetPassword
      ,0 as ResetPin
      ,'' AS UserCategory
      ,'' as SecretKey
 from CustomerDeviceMappings
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "BankCustomers"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 125
               Right = 214
            End
            DisplayFlags = 280
            TopColumn = 18
         End
         Begin Table = "BankSystemUsers"
            Begin Extent = 
               Top = 6
               Left = 252
               Bottom = 125
               Right = 421
            End
            DisplayFlags = 280
            TopColumn = 16
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 1710
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'SystemUsersView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'SystemUsersView'
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetName]    Script Date: 12/29/2017 09:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[fn_GetName](@CustomerId varchar(50))
  RETURNS varchar(50)
      AS
    BEGIN
		DECLARE @res varchar(50)
		
		
		SET @res=(
				select FirstName + ' ' + LastName as UserName from BankCustomers 
				where CustomerId=@CustomerId
			)
	    
		return @res
    END
GO
/****** Object:  StoredProcedure [dbo].[Customers_Update1]    Script Date: 12/29/2017 09:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[Customers_Update1]	@UserId varchar(50),
	@Email varchar(50),
	@FirstName varchar(50),
	@LastName varchar(50),
	@OtherName varchar(50),
	@Password varchar(50),
	@IsActive bit,
	@BankCode varchar(50),
	@CreatedBy varchar(50),
	@ModifiedBy varchar(50),
	@ApprovedBy varchar(50),
	@PhoneNumber varchar(50),
	@BranchCode varchar(50),
	@DateOfBirth varchar(50),
	@Gender varchar(50),
	@PathToProfilePic varchar(50),
	@PathToSignature varchar(50),
	@NextOfKinName varchar(50),
	@NextOfKinContact varchar(50),
	@MaritalStatus varchar(50),
	@Nationality varchar(50)
As

Begin try
IF not exists(Select * from BankCustomers where CustomerId=@UserId and BankCode=@BankCode)
Begin
	Insert Into BankCustomers
		(CustomerId,Email,FirstName,LastName,OtherName,
		[Password],[IsActive],BankCode,CreatedOn,
		ModifiedOn,CreatedBy,ModifiedBy,ApprovedBy,
		PhoneNumber,BranchCode,DateOfBirth,Gender,
		PathToProfilePic,PathToSignature,
		NextOfKinName,NextOfKinContact,Nationality,MaritalStatus,PIN
		)
	Values
		(@UserId,@Email,@FirstName,@LastName,@OtherName,
		 @Password,@IsActive,@BankCode,GETDATE(),
		 GETDATE(),@ModifiedBy,@ModifiedBy,
		 @ApprovedBy,@PhoneNumber,@BranchCode,
		 @DateOfBirth,@Gender,
		 @PathToProfilePic,@PathToSignature,@NextOfKinName,
		 @NextOfKinContact,@Nationality,@MaritalStatus,@Password)
	Select @UserId as InsertedId
End
Else
Begin
	if(@ApprovedBy='')
	Begin
		Update BankCustomers
		Set
			FirstName = @FirstName,
			LastName=@LastName,
			OtherName=@OtherName,
			[Password] = @Password,
			Pin=@Password,
			[IsActive] = @IsActive,
			BankCode=@BankCode,
			ModifiedOn=GETDATE(),
			ModifiedBy=@ModifiedBy,
			PhoneNumber=@PhoneNumber,
			BranchCode=@BranchCode,
			DateOfBirth=@DateOfBirth,
			Gender=@Gender,
			PathToProfilePic=@PathToProfilePic
		Where		
			CustomerId = @UserId and BankCode=@BankCode
		Select @UserId as InsertedId
	End
	Else
	Begin
		Update BankCustomers
		Set
			FirstName = @FirstName,
			LastName=@LastName,
			OtherName=@OtherName,
			[Password] = @Password,
			[IsActive] = @IsActive,
			BankCode=@BankCode,
			ModifiedOn=GETDATE(),
			ModifiedBy=@ModifiedBy,
			ApprovedBy=@ApprovedBy,
			PhoneNumber=@PhoneNumber,
			BranchCode=@BranchCode,
			DateOfBirth=@DateOfBirth,
			Gender=@Gender,
			PathToProfilePic=@PathToProfilePic
		Where		
			CustomerId = @UserId and BankCode=@BankCode
		Select @UserId as InsertedId
	End
End
---------------------------------------------------------------------


END TRY
BEGIN CATCH



  DECLARE
   @ErMessage NVARCHAR(2048),
   @ErSeverity INT,
   @ErState INT
 
 SELECT
   @ErMessage = ERROR_MESSAGE(),
   @ErSeverity = ERROR_SEVERITY(),
   @ErState = ERROR_STATE()
 
 RAISERROR (@ErMessage,
             @ErSeverity,
             @ErState )
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[Customers_Update]    Script Date: 12/29/2017 09:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Customers_Update]	@UserId varchar(50),
	@Email varchar(50),
	@FirstName varchar(50),
	@LastName varchar(50),
	@OtherName varchar(50),
	@Password varchar(50),
	@Pin varchar(50),
	@IsActive bit,
	@BankCode varchar(50),
	@CreatedBy varchar(50),
	@ModifiedBy varchar(50),
	@ApprovedBy varchar(50),
	@PhoneNumber varchar(50),
	@BranchCode varchar(50),
	@DateOfBirth varchar(50),
	@Gender varchar(50),
	@PathToProfilePic varchar(50),
	@PathToSignature varchar(50),
	@NextOfKinName varchar(50),
	@NextOfKinContact varchar(50),
	@MaritalStatus varchar(50),
	@Nationality varchar(50),
	@AccountCode varchar(50),
	@AccountNumber varchar(50),
	@UserCategory Varchar(50)
As
Begin transaction trans
Begin try
IF not exists(Select * from BankCustomers where CustomerId=@UserId and BankCode=@BankCode)
Begin
	Insert Into BankCustomers
		(CustomerId,Email,FirstName,LastName,OtherName,
		[Password],[IsActive],BankCode,CreatedOn,
		ModifiedOn,CreatedBy,ModifiedBy,ApprovedBy,
		PhoneNumber,BranchCode,DateOfBirth,Gender,
		PathToProfilePic,PathToSignature,
		NextOfKinName,NextOfKinContact,Nationality,MaritalStatus,PIN,UserCategory
		)
	Values
		(@UserId,@Email,@FirstName,@LastName,@OtherName,
		 @Password,@IsActive,@BankCode,GETDATE(),
		 GETDATE(),@ModifiedBy,@ModifiedBy,
		 @ApprovedBy,@PhoneNumber,@BranchCode,
		 @DateOfBirth,@Gender,
		 @PathToProfilePic,@PathToSignature,@NextOfKinName,
		 @NextOfKinContact,@Nationality,@MaritalStatus,@Pin,@UserCategory)
	Select @UserId as InsertedId
	EXEC dbo.CustomersToAccounts_Insert @UserId,@AccountNumber,@BankCode
End
Else
Begin
	if(@ApprovedBy='')
	Begin
		Update BankCustomers
		Set
			FirstName = @FirstName,
			LastName=@LastName,
			OtherName=@OtherName,
			[Password] = @Password,
			Pin=@Pin,
			[IsActive] = @IsActive,
			BankCode=@BankCode,
			ModifiedOn=GETDATE(),
			ModifiedBy=@ModifiedBy,
			PhoneNumber=@PhoneNumber,
			BranchCode=@BranchCode,
			DateOfBirth=@DateOfBirth,
			Gender=@Gender,
			PathToProfilePic=@PathToProfilePic
		Where		
			CustomerId = @UserId and BankCode=@BankCode
		Select @UserId as InsertedId
	End
	Else
	Begin
		Update BankCustomers
		Set
			FirstName = @FirstName,
			LastName=@LastName,
			OtherName=@OtherName,
			[Password] = @Password,
			[IsActive] = @IsActive,
			BankCode=@BankCode,
			ModifiedOn=GETDATE(),
			ModifiedBy=@ModifiedBy,
			ApprovedBy=@ApprovedBy,
			PhoneNumber=@PhoneNumber,
			BranchCode=@BranchCode,
			DateOfBirth=@DateOfBirth,
			Gender=@Gender,
			PathToProfilePic=@PathToProfilePic
		Where		
			CustomerId = @UserId and BankCode=@BankCode
		Select @UserId as InsertedId
	End
End
---------------------------------------------------------------------
Commit Transaction Trans

END TRY
BEGIN CATCH

ROLLBACK Transaction Trans

  DECLARE
   @ErMessage NVARCHAR(2048),
   @ErSeverity INT,
   @ErState INT
 
 SELECT
   @ErMessage = ERROR_MESSAGE(),
   @ErSeverity = ERROR_SEVERITY(),
   @ErState = ERROR_STATE()
 
 RAISERROR (@ErMessage,
             @ErSeverity,
             @ErState )
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[Customers_SelectRow]    Script Date: 12/29/2017 09:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Customers_SelectRow]	@CustomerId varchar(50)ASSET NOCOUNT ONSELECT * FROM BankCustomersWHERE [CustomerId] = @CustomerIdSET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[Customers_SelectAll]    Script Date: 12/29/2017 09:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Customers_SelectAll]ASSET NOCOUNT ONSELECT * FROM BankCustomersSET NOCOUNT OFF
GO
/****** Object:  View [dbo].[BankCustomersAndAccountDetailsView]    Script Date: 12/29/2017 09:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW 
        [dbo].[BankCustomersAndAccountDetailsView]
AS
   Select C.*,A.AccNumber,A.AccountName,dbo.fn_GetAccountBalance(A.BankCode,A.AccNumber) AS AccBalance,A.AccType,A.CurrencyCode,A.IsActive as IsAccountActive,A.AccountCode from BankAccounts A
   inner join CustomersToAccountsMapping B on (A.AccNumber=B.AccountNumber and A.BankCode=B.BankCode)
   inner join BankCustomers C on (C.CustomerId=B.CustomerId and C.BankCode=B.BankCode)
GO
/****** Object:  StoredProcedure [dbo].[UpdateBankUserChangesApprovalStatus2]    Script Date: 12/29/2017 09:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[UpdateBankUserChangesApprovalStatus2]
@ApprovalId varchar(50),
@ApprovedBy varchar(50),
@Status varchar(50)
as
Begin Transaction Updater
Begin Try

--Update one table using values from another
--google Update Select sql server
if(@Status='APPROVED')
Begin
	UPDATE
    Table_A
	SET
    Table_A.BranchCode = Table_B.BranchCode,
    Table_A.DateOfBirth = Table_B.DateOfBirth,
    Table_A.Email = Table_B.Email,
    Table_A.FirstName = Table_B.FirstName,
    Table_A.Gender = Table_B.Gender,
    Table_A.IsActive = Table_B.IsActive,
    Table_A.LastName = Table_B.LastName,
    Table_A.ModifiedBy = Table_B.ModifiedBy,
    Table_A.OtherName = Table_B.OtherName,
    Table_A.PhoneNumber = Table_B.PhoneNumber
	FROM
    BankSystemUsers AS Table_A
    INNER JOIN BankSystemUserChanges AS Table_B
    ON Table_A.UserId = Table_B.UserId
	WHERE
    Table_B.RecordId=@ApprovalId
 
End
--set the status for the Change
Update BankSystemUserChanges set Status=@Status,RejectedBy=@ApprovedBy,RejectedOn=GETDATE() where RecordId=@ApprovalId 
Commit Transaction Updater
End Try
Begin catch
ROLLBACK Transaction Updater

  DECLARE
   @ErMessage NVARCHAR(2048),
   @ErSeverity INT,
   @ErState INT
 
 SELECT
   @ErMessage = ERROR_MESSAGE(),
   @ErSeverity = ERROR_SEVERITY(),
   @ErState = ERROR_STATE()
 
 RAISERROR (@ErMessage,
             @ErSeverity,
             @ErState )

End Catch
GO
/****** Object:  StoredProcedure [dbo].[UpdateBankUserChangesApprovalStatus]    Script Date: 12/29/2017 09:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[UpdateBankUserChangesApprovalStatus]
@ApprovalId varchar(50),
@ApprovedBy varchar(50),
@Status varchar(50)
as
Begin Transaction Updater
Begin Try

--Update one table using values from another
--google Update Select sql server
if(@Status='APPROVED')
Begin
	UPDATE
    Table_A
	SET
    Table_A.BranchCode = Table_B.BranchCode,
    Table_A.DateOfBirth = Table_B.DateOfBirth,
    Table_A.Email = Table_B.Email,
    Table_A.FirstName = Table_B.FirstName,
    Table_A.Gender = Table_B.Gender,
    Table_A.IsActive = Table_B.IsActive,
    Table_A.LastName = Table_B.LastName,
    Table_A.ModifiedBy = Table_B.ModifiedBy,
    Table_A.OtherName = Table_B.OtherName,
    Table_A.PhoneNumber = Table_B.PhoneNumber
	FROM
    BankSystemUsers AS Table_A
    INNER JOIN BankSystemUserChanges AS Table_B
    ON Table_A.UserId = Table_B.UserId
	WHERE
    Table_B.RecordId=@ApprovalId
 
End
--set the status for the Change
Update BankSystemUserChanges set Status=@Status,RejectedBy=@ApprovedBy,RejectedOn=GETDATE() where RecordId=@ApprovalId 
Commit Transaction Updater
End Try
Begin catch
ROLLBACK Transaction Updater

  DECLARE
   @ErMessage NVARCHAR(2048),
   @ErSeverity INT,
   @ErState INT
 
 SELECT
   @ErMessage = ERROR_MESSAGE(),
   @ErSeverity = ERROR_SEVERITY(),
   @ErState = ERROR_STATE()
 
 RAISERROR (@ErMessage,
             @ErSeverity,
             @ErState )

End Catch
GO
/****** Object:  StoredProcedure [dbo].[UpdateUserIsActiveStatus]    Script Date: 12/29/2017 09:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[UpdateUserIsActiveStatus]
@UserId varchar(50),
@BankCode varchar(50),
@IsActive varchar(50),
@ApprovedBy varchar(50)
as
Update BankSystemUsers set IsActive=@IsActive,ApprovedBy=@ApprovedBy 
where UserId=@UserId and BankCode=@BankCode
GO
/****** Object:  StoredProcedure [dbo].[Customers_DeleteRow]    Script Date: 12/29/2017 09:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Customers_DeleteRow]	@CustomerId intASSET NOCOUNT ONDELETE FROM BankCustomersWHERE [CustomerId] = @CustomerIdSET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[DeleteMerchantUserById]    Script Date: 12/29/2017 09:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[DeleteMerchantUserById]
@BankCode varchar(50),
@Id varchar(50),
@ModifiedBy varchar(50)
as
Begin Try
Begin Transaction Deleter
Insert into dbo.DeletedBankCustomers
Select *,@ModifiedBy as DeletedBy,GETDATE() as DeletedOn from BankCustomers
where CustomerId=@Id
Delete from BankCustomers where CustomerId=@Id
Commit Transaction Deleter
END try
BEGIN Catch
Rollback Transaction Deleter
DECLARE
   @ErMessage NVARCHAR(2048),
   @ErSeverity INT,
   @ErState INT
 
 SELECT
   @ErMessage = ERROR_MESSAGE(),
   @ErSeverity = ERROR_SEVERITY(),
   @ErState = ERROR_STATE()
 
 RAISERROR (@ErMessage,
             @ErSeverity,
             @ErState )
END Catch
GO
/****** Object:  StoredProcedure [dbo].[SearchMerchantUsersTable]    Script Date: 12/29/2017 09:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SearchMerchantUsersTable]
@BankCode varchar(50),
@MerchantId varchar(50),
@UserId varchar(50)
as
Select C.CustomerId,FirstName+' '+LastName as Name,
       PhoneNumber,
       UserCategory as Role,
       AccountName as Merchant,
       C.BankCode,
       C.IsActive,
       C.ApprovedBy  
from BankCustomers C 
inner join CustomersToAccountsMapping M on C.CustomerId=M.CustomerId
inner join BankAccounts A on M.AccountNumber=A.AccNumber
where 
C.BankCode=@BankCode and
AccountCode=@MerchantId and
( 
  (@UserId='') or (FirstName like '%'+@UserId+'%') or 
  (LastName like '%'+@UserId+'%') or 
  (Email like '%'+@UserId+'%') or 
  (C.CustomerId like '%'+@UserId+'%')
)
GO
/****** Object:  StoredProcedure [dbo].[SearchMerchants]    Script Date: 12/29/2017 09:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SearchMerchants]
@bankCode varchar(50),
@Id varchar(50)
as


select B.AccountCode as 'Id',UPPER(B.AccountName) as 'Merchant Name',A.AccTypeName as 'Merchant Type', 
--CASE WHEN IsReferenced=0 THEN 'NO' ELSE 'YES' END AS 'Referenced', 
B.CreatedOn as 'Created On',
V.FirstName + '  ' + V.LastName  as 'Created By',
dbo.fn_GetAccountStatus(B.AccNumber) as Status
,CASE WHEN B.ApprovedBy='' THEN 'PENDING' ELSE 'APPROVED' END AS 'Approval Status'
from BankAccounts AS B
inner join
AccountTypes AS A on B.AccType=A.AccTypeCode
inner join BankSystemUsers V on V.UserId=B.CreatedBy
where 
(B.BankCode=@bankCode or @bankCode='ALL') and
(B.AccountCode=@Id or @Id='' or AccType=@Id) and 
A.AccountCategory = 'MERCHANT'
and A.BankCode=B.BankCode
order by B.CreatedOn desc
GO
/****** Object:  StoredProcedure [dbo].[SearchCustomersTable]    Script Date: 12/29/2017 09:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SearchCustomersTable]
@AccountNumber varchar(50),
@BankCode varchar(50),
@CustomerID varchar(50)
as
Select AccountCode,CustomerId,FirstName+' '+LastName as CustomerName,BankCode,PhoneNumber,UserCategory
from dbo.BankCustomersAndAccountDetailsView
where 
BankCode=@BankCode and
(CustomerId=@CustomerID or FirstName like '%'+@CustomerID+'%' or LastName  like '%'+@CustomerID+'%' or PhoneNumber like '%'+@CustomerID+'%'  or @CustomerID='') and
(AccountCode=@AccountNumber or @AccountNumber='') and
AccType!='LOAN_ACCOUNT'
--UNION
--Select '',CustomerId,FirstName+' '+LastName as CustomerName,BankCode,PhoneNumber,Gender,'',0
--from BankCustomers
--where 
--BankCode=@BankCode and
--(CustomerId=@CustomerID or FirstName like '%'+@CustomerID+'%' or LastName  like '%'+@CustomerID+'%' or PhoneNumber like '%'+@CustomerID+'%'  or @CustomerID='') and
--CustomerId not in (Select CustomerId from dbo.BankCustomersAndAccountDetailsView
--where 
--BankCode=@BankCode and
--(CustomerId=@CustomerID or FirstName like '%'+@CustomerID+'%' or LastName  like '%'+@CustomerID+'%' or PhoneNumber like '%'+@CustomerID+'%'  or @CustomerID='') and
--(AccountCode=@AccountNumber or @AccountNumber='') and
--AccType!='LOAN_ACCOUNT')
GO
/****** Object:  StoredProcedure [dbo].[GetMerchantCodeUsingCustomerId]    Script Date: 12/29/2017 09:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetMerchantCodeUsingCustomerId]
@customerId varchar(50)
as
select CustomerId as Id,AccountCode,AccountName as Merchant,FirstName+' '+LastName as Name,UserCategory as Role,PhoneNumber from BankCustomersAndAccountDetailsView
where CustomerId=@customerId
order by CreatedOn desc
GO
/****** Object:  StoredProcedure [dbo].[TillBranch_SelectRow]    Script Date: 12/29/2017 09:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	sp_CustomerTypes_SelectRow
-- Author:	Albert Luganga
-- Create date:	03/04/2017 10:39:37 AM
-- Description:	This stored procedure is intended for selecting a row/ all rows for a bank from MerchantTillBranches table
-- ==========================================================================================
CREATE Procedure [dbo].[TillBranch_SelectRow]
	@BankCode varchar(50),
	@AccountCode varchar(50),
	@TillBranch varchar(50)
As
Begin
	Select M.AccountCode as 'Merchant Code',A.AccountName as 'Merchant Name', TillBranchCode as 'Till Branch Code', TillBranchName as 'Till Branch Name',
	V.FirstName + ' ' + V.LastName as 'Created By', M.CreatedOn as 'Created On'
	From MerchantTillBranches M 
	inner join BankAccounts A on A.AccountCode=M.AccountCode
	inner join SystemUsersView V on M.CreatedBy=V.UserId
	Where
		M.BankCode = @BankCode and
		(M.AccountCode = @AccountCode or @AccountCode='') and
		(TillBranchCode = @TillBranch or @TillBranch='') and
		(TillBranchName = @TillBranch or @TillBranch='')
	order by M.CreatedOn desc
End
GO
/****** Object:  StoredProcedure [dbo].[TillBranch_Select]    Script Date: 12/29/2017 09:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	sp_CustomerTypes_SelectRow
-- Author:	Albert Luganga
-- Create date:	03/04/2017 10:39:37 AM
-- Description:	This stored procedure is intended for selecting a row/ all rows for a bank from MerchantTillBranches table
-- ==========================================================================================
CREATE Procedure [dbo].[TillBranch_Select]
	@BankCode varchar(50),
	@AccountCode varchar(50),
	@TillBranch varchar(50)
As
Begin
	Select AccountCode, TillBranchCode, TillBranchName,
	V.FirstName + ' ' + V.LastName as 'Created By', M.CreatedOn as 'Created On'
	From MerchantTillBranches M 
	inner join SystemUsersView V on M.CreatedBy=V.UserId
	Where
		M.BankCode = @BankCode and
		(AccountCode = @AccountCode or @AccountCode='') and
		(TillBranchCode = @TillBranch or @TillBranch='') and
		(TillBranchName = @TillBranch or @TillBranch='')
	order by M.CreatedOn desc
End
GO
/****** Object:  StoredProcedure [dbo].[DeactivateUser]    Script Date: 12/29/2017 09:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[DeactivateUser]
	@UserId varchar(50),
	@Channel varchar(50),
	@IP varchar(50),
	@RequestAgent varchar(50),
	@AccountCode varchar(50)
As
Begin

Declare @userType varchar(50) = (select UserType from SystemUsersView where UserId=@UserId)
   
if @userType='CUSTOMER'
Begin
 update BankCustomers set IsActive=0 where CustomerId=@UserId
End
Else 
Begin
 update BankSystemUsers set IsActive=0 where UserId=@UserId
 Insert into DeactivationLog
 (Channel,AccountCode,UserId,IP,RequestAgent,RecordDate)
 values(@Channel,@AccountCode,@UserId,@IP,@RequestAgent,GETDATE())
End

End
GO
/****** Object:  StoredProcedure [dbo].[Banks_Update]    Script Date: 12/29/2017 09:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Banks_Update]	@BankId varchar(50),	@BankName varchar(50),	@BankCode varchar(50),	@BankContactEmail varchar(50),	@BankPassword varchar(50),	@IsActive varchar(50),	@ModifiedBy varchar(50),	@PathToLogoImage varchar(1300),	@PathToPublicKey varchar(1300),	@ThemeColor varchar(50),	@TextColor varchar(50),	@BankVaultAccNumber varchar(50),	@BankLoanCommissionAccount varchar(50),	@BankInterestPayableAccount varchar(50)ASBEGIN TRANSACTION BankUpdaterBEGIN TRYIF not exists(Select * from Banks where (BankCode=@BankCode or BankId=@BankId)) BEGIN	INSERT INTO Banks (		[BankName],		[BankCode],		[BankContactEmail],		BankPassword,		IsActive,		CreatedOn,		LastUpdateDate,		PathToLogoImage,		PathToPublicKey,		ThemeColor,		NavbarTextColor,		BankVaultAccNumber,		CreatedBy,		ModifiedBy,		BankInterestPayableAccount,		BankLoanCommissionAccount	)	VALUES (		@BankName,		@BankCode,		@BankContactEmail,		@BankPassword,		@IsActive,		GETDATE(),		GETDATE(),		@PathToLogoImage,		@PathToPublicKey,		@ThemeColor,		@TextColor,		@BankVaultAccNumber,		@ModifiedBy,		@ModifiedBy,		@BankInterestPayableAccount,		@BankLoanCommissionAccount	)		--create default user types for Bank	EXEC dbo.UserTypes_Update '','BANK_ADMIN','Banks IT Admin','Banks IT Admin',@BankCode,@ModifiedBy 	EXEC dbo.UserTypes_Update '','LOAN_OFFICER','Banks Loan Officer','Banks Loan Officer',@BankCode,@ModifiedBy 	EXEC dbo.UserTypes_Update '','MANAGER','Branch Manager','Branch Manager',@BankCode,@ModifiedBy 	EXEC dbo.UserTypes_Update '','TELLER','Bank Teller','Bank Teller',@BankCode,@ModifiedBy 	EXEC dbo.UserTypes_Update '','SUPERVISOR_TELLER','Teller Supervisor','Teller Supervisor',@BankCode,@ModifiedBy 	EXEC dbo.UserTypes_Update '','CUSTOMER_SERVICE','Customer Service','Customer Service',@BankCode,@ModifiedBy 	EXEC dbo.UserTypes_Update '','BUSSINESS_ADMIN','Bussiness Admin','Bussiness Admin',@BankCode,@ModifiedBy			----set default access rules for the users	DECLARE @date DATETIME
    SET @date = GETDATE()	EXEC dbo.AccessRules_Update '','Bank Admin Rule','BANK_ADMIN',@BankCode,'BANK_ADMIN,REPORTS','','','True',@date,@ModifiedBy	EXEC dbo.AccessRules_Update '','Manager Rule','MANAGER',@BankCode,'MANAGER,REPORTS','','','True',@date,@ModifiedBy	EXEC dbo.AccessRules_Update '','Teller Rule','TELLER',@BankCode,'TELLER,REPORTS','','','True',@date,@ModifiedBy	EXEC dbo.AccessRules_Update '','Loans Officer Rule','LOAN_OFFICER',@BankCode,'LOAN_OFFICER,REPORTS','','','True',@date,@ModifiedBy	EXEC dbo.AccessRules_Update '','Supervisor Rule','SUPERVISOR_TELLER',@BankCode,'SUPERVISOR,REPORTS','','','True',@date,@ModifiedBy	EXEC dbo.AccessRules_Update '','Customer Rule','CUSTOMER',@BankCode,'CUSTOMER,REPORTS','','','True',@date,@ModifiedBy	EXEC dbo.AccessRules_Update '','Customer Service Rule','CUSTOMER_SERVICE',@BankCode,'CUSTOMER_SERVICE,REPORTS','','','True',@date,@ModifiedBy	EXEC dbo.AccessRules_Update '','Bussiness Admin Rule','BUSSINESS_ADMIN',@BankCode,'BUSSINESS_ADMIN,REPORTS','','','True',@date,@ModifiedBy		--create default transaction Categories	EXEC dbo.TransactionTypes_Update '','WITHDRAW','Withdraw from Account',@BankCode,@ModifiedBy,'True'	EXEC dbo.TransactionTypes_Update '','DEPOSIT','Deposit onto Account',@BankCode,@ModifiedBy,'True'	EXEC dbo.TransactionTypes_Update '','INTERNAL_TRANSFER','Internal Transfer',@BankCode,@ModifiedBy,'True'	EXEC dbo.TransactionTypes_Update '','EXTERNAL_TRANSFER','External Transfer',@BankCode,@ModifiedBy,'True'		--create default Account Types	EXEC dbo.AccountTypes_Update '','Savings Account','SAVINGS_ACCOUNT',0,@BankCode,'Savings Account',@ModifiedBy,'True',1,1,'INDIVIDUAL','SIMPLE',0,'MONTHLY'	EXEC dbo.AccountTypes_Update '','Current Account','CURRENT_ACCOUNT',0,@BankCode,'Current Account',@ModifiedBy,'True',1,1,'INDIVIDUAL','SIMPLE',0,'MONTHLY'	EXEC dbo.AccountTypes_Update '','Fixed Deposit Acount','FIXED_DEPOSIT_ACCOUNT',0,@BankCode,'Fixed Deposit Account',@ModifiedBy,'True',1,4,'INDIVIDUAL','SIMPLE',0,'MONTHLY'	EXEC dbo.AccountTypes_Update '','Loan Account','LOAN_ACCOUNT',-350000000,@BankCode,'Loan Account',@ModifiedBy,'True',1,5,'INDIVIDUAL','SIMPLE',0,'MONTHLY'	EXEC dbo.AccountTypes_Update '','Commission Account','COMMISSION_ACCOUNT',0,@BankCode,'Commission Account',@ModifiedBy,'True',0,1,'INDIVIDUAL','SIMPLE',0,'MONTHLY'	EXEC dbo.AccountTypes_Update '','Suspense Account','SUSPENSE_ACCOUNT',-1000000000,@BankCode,'Suspense Account',@ModifiedBy,'True',0,1,'INDIVIDUAL','SIMPLE',0,'MONTHLY'	EXEC dbo.AccountTypes_Update '','Teller Account','TELLER_ACCOUNT',0,@BankCode,'Teller Account',@ModifiedBy,'True',1,1,'INDIVIDUAL','SIMPLE',0,'MONTHLY'	EXEC dbo.AccountTypes_Update '','Joint Account','JOINT_ACCOUNT',0,@BankCode,'Joint Account',@ModifiedBy,'True',2,5,'NON_INDIVIDUAL','SIMPLE',0,'MONTHLY'	EXEC dbo.AccountTypes_Update '','Group Account','GROUP_ACCOUNT',0,@BankCode,'Joint Account',@ModifiedBy,'True',2,10,'NON_INDIVIDUAL','SIMPLE',0,'MONTHLY'	EXEC dbo.AccountTypes_Update '','Bussiness Account','BUSSINESS_ACCOUNT',0,@BankCode,'Joint Account',@ModifiedBy,'True',2,5,'NON_INDIVIDUAL','SIMPLE',0,'MONTHLY'		--create default Currencies	EXEC dbo.Currencies_Update 'Uganda Shillings','UGX',@BankCode,@ModifiedBy,1		--create default Payment types	EXEC dbo.PaymentTypes_Update 'CASH','Cash',@BankCode,@ModifiedBy,'True'		--create default Charge Types	EXEC dbo.ChargeTypes_Update 'FLAT_FEE','Flat Fee',@ModifiedBy,@BankCode,'Flat Fee','True'	EXEC dbo.ChargeTypes_Update 'PERCENTAGE','Percentage',@ModifiedBy,@BankCode,'Percentage','True'		--create default Loan Types	EXEC dbo.LoanTypes_Update 'SECURED_LOAN','Secured Loan',@BankCode,@ModifiedBy,'True',2,'SIMPLE',0,0,0	EXEC dbo.LoanTypes_Update 'UNSECURED_LOAN','Unsecured Loan',@BankCode,@ModifiedBy,'False',5,'COMPOUND',0,0,0		--create default Collateral Types	EXEC dbo.CollateralTypes_Update 'VECHICLE','Vechicle',@BankCode,@ModifiedBy	EXEC dbo.CollateralTypes_Update 'LAND','Land',@BankCode,@ModifiedBy		--create Banks Vault Account	Declare @BankVaultAccName varchar(50) = @BankCode + ' VAULT ACCOUNT';	EXEC dbo.Accounts_Update '',0,@BankCode,@BankVaultAccNumber,'SUSPENSE_ACCOUNT','',@BankCode,@ModifiedBy,@BankCode,'True','UGX',@ModifiedBy,@BankVaultAccName,-100000000,0,'SIMPLE','MONTHLY',0,'',0,'NONE','NONE','','',''	EXEC dbo.Accounts_Update '',0,@BankCode,@BankLoanCommissionAccount,'SUSPENSE_ACCOUNT','',@BankCode,@ModifiedBy,@BankCode,'True','UGX',@ModifiedBy,@BankVaultAccName,-100000000,0,'SIMPLE','MONTHLY',0,'',0,'NONE','NONE','','',''	EXEC dbo.Accounts_Update '',0,@BankCode,@BankInterestPayableAccount,'SUSPENSE_ACCOUNT','',@BankCode,@ModifiedBy,@BankCode,'True','UGX',@ModifiedBy,@BankVaultAccName,-100000000,0,'SIMPLE','MONTHLY',0,'',0,'NONE','NONE','','',''    EXEC dbo.CustomersToAccounts_Insert @BankCode,@BankVaultAccNumber,@BankCode    Declare @BirthDate varchar(50) = GETDATE();    EXEC dbo.Customers_Update1 @BankCode,@BankContactEmail,@BankCode,'','',@BankPassword,'True',@BankCode,@ModifiedBy,@ModifiedBy,@ModifiedBy,'',@BankCode,@BirthDate,'Male','','','','','SINGLE','UGANDAN'        --create default system settings	EXEC dbo.SystemSettings_Update @BankCode,'NUMBER_OF_LOAN_APPROVERS','3',@ModifiedBy	EXEC dbo.SystemSettings_Update @BankCode,'LOAN_COMMISSION_ACCOUNT',@BankLoanCommissionAccount,@ModifiedBy	EXEC dbo.SystemSettings_Update @BankCode,'INTEREST_PAYABLE_ACCOUNT',@BankInterestPayableAccount,@ModifiedBy		--Intialize default system Date settings---	EXEC dbo.InitializeSystemDate_Update @BankCode    	SELECT @BankCode As InsertedIDENDELSE BEGIN	UPDATE Banks SET 		[BankName] = @BankName,		[BankCode] = @BankCode,		[BankContactEmail] = @BankContactEmail,		IsActive=@IsActive,		LastUpdateDate=GETDATE(),		PathToLogoImage=@PathToLogoImage,		PathToPublicKey=@PathToPublicKey,		ThemeColor=@ThemeColor,		NavbarTextColor=@TextColor,		ModifiedBy=@ModifiedBy	WHERE BankCode = @BankCode	SELECT @BankCode As InsertedIDENDCOMMIT TRANSACTION BankUpdaterEND TRYBEGIN CATCHROLLBACK Transaction BankUpdater

  DECLARE
   @ErMessage NVARCHAR(2048),
   @ErSeverity INT,
   @ErState INT
 
 SELECT
   @ErMessage = ERROR_MESSAGE(),
   @ErSeverity = ERROR_SEVERITY(),
   @ErState = ERROR_STATE()
 
 RAISERROR (@ErMessage,
             @ErSeverity,
             @ErState )             END CATCH
GO
/****** Object:  StoredProcedure [dbo].[BankBranches_Update]    Script Date: 12/29/2017 09:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	BankBranches_Update
-- Author:	Nsubuga Kasozi
-- Create date:	12/27/2015 7:57:44 PM
-- Description:	This stored procedure is intended for updating BankBranches table
-- ==========================================================================================
CREATE Procedure [dbo].[BankBranches_Update]
	@BranchId varchar(50),
	@BranchName nvarchar(50),
	@BranchCode nvarchar(50),
	@Location nvarchar(100),
	@IsActive nvarchar(50),
	@BankCode nvarchar(50),
	@ModifiedBy varchar(50),
	@BranchVaultAccNumber varchar(50),
	@BranchTellerLimit varchar(50),
	@BranchSupervisorLimit varchar(50)
As

Begin try
Begin Transaction trans
if exists(select * from BankBranches where BranchCode=@BranchCode and BankCode=@BankCode)
Begin
	Update BankBranches
	Set
		[BranchName] = @BranchName,
		[BranchCode] = @BranchCode,
		[Location] = @Location,
		IsActive = @IsActive,
		[BankCode] = @BankCode,
		[ModifiedOn] = GETDATE(),
		[CreatedBy] = @ModifiedBy,
		[ModifiedBy] = @ModifiedBy,
		BranchTellerLimit=@BranchTellerLimit,
		BranchSupervisorLimit=@BranchSupervisorLimit
	Where		
		[BranchId] = @BranchId
		Select @BranchCode as InsertedId

End
Else
Begin
	Insert Into BankBranches
		([BranchName],[BranchCode],[Location],
		 IsActive,[BankCode],[CreatedOn],
		 [ModifiedOn],[CreatedBy],[ModifiedBy],BranchVaultAccNumber,BranchTellerLimit,BranchSupervisorLimit)
	Values
		(@BranchName,@BranchCode,@Location,
		 @IsActive,@BankCode,GETDATE(),
		 GETDATE(),@ModifiedBy,@ModifiedBy,
		 @BranchVaultAccNumber,@BranchTellerLimit,@BranchSupervisorLimit)

	--create Bank Vault Account	Declare @BranchVaultAccName varchar(50) = @BranchCode + ' BRANCH VAULT ACCOUNT';	EXEC dbo.Accounts_Update '',0,@BankCode,@BranchVaultAccNumber,'COMMISSION_ACCOUNT','',@BankCode,@ModifiedBy,@BankCode,'True','UGX',@ModifiedBy,@BranchVaultAccName,0,0,'SIMPLE','MONTHLY',0,'',0,'NONE','NONE','',''	--Add product Accounts	--EXEC dbo.Accounts_Update '',0,@BankCode,@BranchVaultAccNumber,'CURRENT_ACCOUNT_PRODUCT','',@BankCode,@ModifiedBy,@BranchCode,'True','UGX',@ModifiedBy,@BranchVaultAccName,0,0,'SIMPLE','MONTHLY',1,'CURRENT_ACCOUNT',0,'NONE','NONE','',''	--EXEC dbo.Accounts_Update '',0,@BankCode,@BranchVaultAccNumber,'SAVINGS_ACCOUNT_PRODUCT','',@BankCode,@ModifiedBy,@BranchCode,'True','UGX',@ModifiedBy,@BranchVaultAccName,0,0,'SIMPLE','MONTHLY',1,'SAVINGS_ACCOUNT',0,'NONE','NONE','',''	--EXEC dbo.Accounts_Update '',0,@BankCode,@BranchVaultAccNumber,'FIXED_DEPOSIT_ACCOUNT','',@BankCode,@ModifiedBy,@BranchCode,'True','UGX',@ModifiedBy,@BranchVaultAccName,0,0,'SIMPLE','MONTHLY',1,'FIXED_DEPOSIT_ACCOUNT',0,'NONE','NONE','',''	--EXEC dbo.Accounts_Update '',0,@BankCode,@BranchVaultAccNumber,'LOAN_ACCOUNT','',@BankCode,@ModifiedBy,@BranchCode,'True','UGX',@ModifiedBy,@BranchVaultAccName,0,0,'SIMPLE','MONTHLY',1,'LOAN_ACCOUNT',0,'NONE','NONE','',''	--EXEC dbo.Accounts_Update '',0,@BankCode,@BranchVaultAccNumber,'JOINT_ACCOUNT','',@BankCode,@ModifiedBy,@BranchCode,'True','UGX',@ModifiedBy,@BranchVaultAccName,0,0,'SIMPLE','MONTHLY',1,'JOINT_ACCOUNT',0,'NONE','NONE','',''	--EXEC dbo.Accounts_Update '',0,@BankCode,@BranchVaultAccNumber,'GROUP_ACCOUNT','',@BankCode,@ModifiedBy,@BranchCode,'True','UGX',@ModifiedBy,@BranchVaultAccName,0,0,'SIMPLE','MONTHLY',1,'GROUP_ACCOUNT',0,'NONE','NONE','',''	--EXEC dbo.Accounts_Update '',0,@BankCode,@BranchVaultAccNumber,'BUSSINESS_ACCOUNT','',@BankCode,@ModifiedBy,@BranchCode,'True','UGX',@ModifiedBy,@BranchVaultAccName,0,0,'SIMPLE','MONTHLY',1,'BUSSINESS_ACCOUNT',0,'NONE','NONE','',''	--EXEC dbo.Accounts_Insert '',0,@BranchVaultAccNumber,'COMMISSION_ACCOUNT',@BankCode,@ModifiedBy,@BranchCode,'True','UGS',@ModifiedBy,@BranchVaultAccName,0,0,'SIMPLE','MONTHLY'	EXEC dbo.CustomersToAccounts_Insert @branchCode,@BranchVaultAccNumber,@BankCode    Declare @BirthDate varchar(50) = GETDATE();    EXEC dbo.Customers_Update @BranchCode,'',@BankCode,'','','','','True',@BankCode,@ModifiedBy,@ModifiedBy,@ModifiedBy,'',@BranchCode,@BirthDate,'Male','','','','','SINGLE','UGANDAN','',@BranchVaultAccNumber,''
	
	
	Select  @BranchCode as InsertedId	
End
---------------------------------------------------------------------
Commit Transaction Trans

END TRY
BEGIN CATCH

ROLLBACK Transaction Trans

  DECLARE
   @ErMessage NVARCHAR(2048),
   @ErSeverity INT,
   @ErState INT
 
 SELECT
   @ErMessage = ERROR_MESSAGE(),
   @ErSeverity = ERROR_SEVERITY(),
   @ErState = ERROR_STATE()
 
 RAISERROR (@ErMessage,
             @ErSeverity,
             @ErState )
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[PasswordTrack_Select]    Script Date: 12/29/2017 09:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	PasswordTrack_Update
-- Author:	Albert Luganga
-- Create date:	03/27/2017 15:57:20 PM
-- Description:	This stored procedure is intended for getting last password change
-- ==========================================================================================
CREATE Procedure [dbo].[PasswordTrack_Select]
	@UserId varchar(50)
As
Begin
    declare @creationDate datetime

	set @creationDate =(select top 1 RecordDate from PasswordChangeLog	where UserId=@UserId order by RecordDate desc)
	
	--if no record is found, return date of creation
	if @creationDate is null
	set @creationDate = (select CreatedOn from SystemUsersView where UserId=@UserId)
	
	select @creationDate as RecordDate
End
GO
/****** Object:  StoredProcedure [dbo].[GetAllCustomerTills]    Script Date: 12/29/2017 09:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetAllCustomerTills]
@bankCode varchar(50),
@accountCode varchar(50)
as
Select CustomerId,AccountCode as Merchant,DeviceId,DeviceType as 'Type',TerminalName as 'Device Name', SIMCard,
	AquiredBy as AcquiredBy,Location,RecordDate as 'CreatedOn',dbo.fn_GetName(CreatedBy)  as 'CreatedBy',
	CustomerTel as 'Till Contact',dbo.fn_GetName(ApprovedBy) as 'ApprovedBy', 
	ApprovalDate,BankCode,BranchCode
	from CustomerDeviceMappings 
	where BankCode=@bankCode 
		  and (AccountCode=@accountCode)
		  order by CustomerId desc
GO
/****** Object:  StoredProcedure [dbo].[UpdateUserPin]    Script Date: 12/29/2017 09:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[UpdateUserPin]
@custid varchar(50),
@oldpin varchar (50),
@pin varchar(50),
@phone varchar(50)
as
Update BankCustomers set Pin=@pin 
where CustomerId=@custid and Pin=@oldpin and PhoneNumber=@phone

EXEC dbo.GetUserByCustomerTel @phone
GO
/****** Object:  StoredProcedure [dbo].[UpdateUserPassword]    Script Date: 12/29/2017 09:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[UpdateUserPassword]
@BankCode varchar(50),
@Userid varchar(50),
@Password varchar(50)
as
Declare @UserType varchar(50);

--get the usertype of the user inorder to determine which table to update
Select @UserType=UserType from SystemUsersView where UserId=@Userid and BankCode=@BankCode

--Is he a customer
if(@UserType='CUSTOMER')
Begin
	Update BankCustomers set Password=@Password,ResetPassword=1 where CustomerId=@Userid and BankCode=@BankCode
End
--must be bank staff
Else
Begin
	Update BankSystemUsers set Password=@Password,ResetPassword=1 where UserId=@Userid and BankCode=@BankCode
End
GO
/****** Object:  StoredProcedure [dbo].[SearchBankCustomersTable2]    Script Date: 12/29/2017 09:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SearchBankCustomersTable2]
@BankCode varchar(50),
@AccountCode varchar(50)
as
select CustomerId as Id,AccountCode,AccountName as Merchant,FirstName+' '+LastName as Name,UserCategory as Role,PhoneNumber from BankCustomersAndAccountDetailsView
where BankCode=@BankCode and (AccountCode=@AccountCode or @AccountCode='')
and LEN(PhoneNumber)>1
order by CreatedOn desc
GO
/****** Object:  StoredProcedure [dbo].[SearchBankCustomersTable]    Script Date: 12/29/2017 09:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SearchBankCustomersTable]
@BankCode varchar(50),
@AccountCode varchar(50)
as
select CustomerId,AccountCode,AccountName as Merchant,FirstName+' '+LastName as Name,UserCategory as Role,PhoneNumber from BankCustomersAndAccountDetailsView
where BankCode=@BankCode and (AccountCode=@AccountCode or @AccountCode='')
and LEN(PhoneNumber)>1
order by CreatedOn desc
GO
/****** Object:  StoredProcedure [dbo].[GetUserById]    Script Date: 12/29/2017 09:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[GetUserById]
	@UserId varchar(50)
As
Begin
	Select 
		*
	From SystemUsersView
	Where
		[UserId] = @UserId
End
GO
/****** Object:  StoredProcedure [dbo].[GetCustomerTills]    Script Date: 12/29/2017 09:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetCustomerTills]
@bankCode varchar(50),
@accountCode varchar(50),
@deviceId varchar(50)
as
Select AccountCode as 'Merchant Code',CustomerId as 'Till Code',DeviceId as 'Till Contact',
	AquiredBy as 'Acquired By',Location as 'Till Branch',RecordDate as 'Created On',
	V.FirstName + ' ' +V.LastName  as 'Created By'
	from CustomerDeviceMappings C
	inner join SystemUsersView V on C.CreatedBy=V.UserId
	where C.BankCode=@bankCode 
		  and (AccountCode=@accountCode or @accountCode='')
		  and (CustomerId=@deviceId or @deviceId='')
		  order by [Created On] desc, CustomerId asc
--if (LEN(@accountCode) > 0 and LEN(@deviceId) > 0)
-- begin
--    Select AccountCode as 'Merchant Code',CustomerId as 'Till Code',DeviceId as 'Till Contact',
--	AquiredBy as 'Acquired By',Location as 'Till Branch',RecordDate as 'Created On',dbo.fn_GetName(CreatedBy)  as 'Created By'
--	from CustomerDeviceMappings 
--	where BankCode=@bankCode 
--		  and (AccountCode=@accountCode )
--		  and (CustomerId=@deviceId)
--		  order by CustomerId asc
-- end
--else if (LEN(@accountCode) > 0)
-- begin
--    Select AccountCode as 'Merchant Code',CustomerId as 'Till Code',DeviceId as 'Till Contact',
--	AquiredBy as 'Acquired By',Location as 'Till Branch',RecordDate as 'Created On',dbo.fn_GetName(CreatedBy)  as 'Created By'
--	from CustomerDeviceMappings 
--	where BankCode=@bankCode 
--		  and (AccountCode=@accountCode)
--		  order by CustomerId asc
-- end
-- else if (LEN(@deviceId) > 0)
-- begin
--    Select AccountCode as 'Merchant Code',CustomerId as 'Till Code',DeviceId as 'Till Contact',
--	AquiredBy as 'Acquired By',Location as 'Till Branch',RecordDate as 'Created On',dbo.fn_GetName(CreatedBy)  as 'Created By'
--	from CustomerDeviceMappings 
--	where BankCode=@bankCode 
--		  and (CustomerId=@deviceId)
--		  order by CustomerId asc
-- end
-- else 
-- begin
--    Select AccountCode as 'Merchant Code',CustomerId as 'Till Code',DeviceId as 'Till Contact',
--	AquiredBy as 'Acquired By',Location as 'Till Branch',RecordDate as 'Created On',dbo.fn_GetName(CreatedBy)  as 'Created By'
--	from CustomerDeviceMappings 
--	where BankCode=@bankCode 
--	order by CustomerId asc
-- end
GO
/****** Object:  StoredProcedure [dbo].[GetCustomerPendingDetailsById]    Script Date: 12/29/2017 09:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetCustomerPendingDetailsById]
@Id varchar(50)
AS

SELECT A.CustomerId, A.FirstName+' '+A.LastName as Name,A.Email,A.Gender,A.DateOfBirth,
A.PhoneNumber,V.AccountName,V.AccountCode,A.BranchCode,A.CreatedOn,A.CreatedBy,A.UserCategory,
A.BankCode,A.BranchCode  
FROM PendingBankCustomerApprovals AS A
 inner join
 BankCustomersAndAccountDetailsView V on V.CustomerId=A.CustomerId
WHERE
A.RecordId=@Id
GO
/****** Object:  StoredProcedure [dbo].[GetCustomerByPhone]    Script Date: 12/29/2017 09:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetCustomerByPhone]
@CustomerTel varchar(50)
as

Select * from BankCustomersAndAccountDetailsView
where (PhoneNumber=@CustomerTel or PhoneNumber like '%'+Substring(@CustomerTel, 2, (len(@CustomerTel)))+'%')
GO
/****** Object:  StoredProcedure [dbo].[GetCustomerByCustomerId]    Script Date: 12/29/2017 09:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetCustomerByCustomerId]
@CustomerID varchar(50)
as
Select A.CustomerId,A.PhoneNumber,FirstName,LastName,OtherName,B.AccountNumber,A.BankCode,C.AccType,C.AccountName,
A.BranchCode,A.Password,A.Pin,C.AccNumber,C.IsReferenced,A.DateOfBirth,A.Email,A.Gender,A.Nationality,
A.UserCategory,A.ApprovedBy,A.CreatedBy,A.CreatedOn,D.BankName,E.BranchName,E.Location,A.PathToProfilePic,
dbo.fn_GetAccountBalance(A.BankCode,C.AccNumber) AS AccBalance,dbo.fn_GetName(A.CreatedBy) as BackOffice,
C.AccType,C.AccountCode,C.AccountName,A.UserCategory,C.AccountCategory,A.IsActive,A.Email,
(select FirstName + ' ' + LastName from BankSystemUsers where UserId=A.CreatedBy) as Creator,
(select FirstName + ' ' + LastName from BankSystemUsers where UserId=A.ApprovedBy) as Approver
from BankCustomers A
inner join CustomersToAccountsMapping B on A.CustomerId=B.CustomerId
inner join BankAccounts C on B.AccountNumber=c.AccNumber
inner join Banks D on A.BankCode=D.BankCode
inner join BankBranches E on A.BranchCode=E.BranchCode
where A.CustomerId=@CustomerID
or (PhoneNumber=@CustomerID)
or (Email=@CustomerID)
GO
/****** Object:  StoredProcedure [dbo].[GetCustomerAccountDetail]    Script Date: 12/29/2017 09:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetCustomerAccountDetail]
@customerid varchar(50),
@detail varchar(50)
AS

select * from BankCustomersAndAccountDetailsView where CustomerId=@customerid
GO
/****** Object:  StoredProcedure [dbo].[GetBankUserById]    Script Date: 12/29/2017 09:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[GetBankUserById]
	@UserId varchar(50),
	@BankCode varchar(50)
As
Begin
	Select 
		*
	From SystemUsersView
	Where
		[UserId] = @UserId and BankCode=@BankCode
End
GO
/****** Object:  StoredProcedure [dbo].[GetBankCustomersPendingApproval]    Script Date: 12/29/2017 09:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetBankCustomersPendingApproval]
@bankCode varchar(50),
@branchCode varchar(50),
@name varchar(50)
as
Select CustomerId,B.FirstName,B.LastName,B.UserCategory as Role,AccountCode as Merchant,AccountName as MerchantName,B.CreatedOn,
V.FirstName + ' ' + V.LastName as CreatedBy
 from BankCustomersAndAccountDetailsView B
 inner join SystemUsersView V on V.UserId=B.CreatedBy
where
B.ApprovedBy='' and
((B.FirstName like '%'+@name+'%') or @name='') and
(B.BankCode=@bankCode or @bankCode='ALL') and
(B.BranchCode=@branchCode or @branchCode='ALL')
GO
/****** Object:  StoredProcedure [dbo].[GetBankCustomerChangesPendingApproval]    Script Date: 12/29/2017 09:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetBankCustomerChangesPendingApproval]
@BankCode varchar(50),
@BranchCode varchar(50),
@Phone varchar(50),
@Name varchar(50),
@fromDate varchar(50),
@toDate varchar(50)
as
Select A.CustomerId,A.RecordId AS RequestId,A.FirstName+' '+A.LastName as Name,A.Email,A.PhoneNumber,A.UserCategory as Role,B.AccountName as Merchant
,V.FirstName+' '+V.LastName AS ModifiedBy,A.ModifiedOn,A.Action from PendingBankCustomerApprovals A
inner join BankCustomersAndAccountDetailsView B on A.CustomerId=B.CustomerId
inner join dbo.SystemUsersView AS V on A.ModifiedBy= V.UserId
where 
A.Status='PENDING' and
((A.ApprovedBy='') or (A.ApprovedBy is NULL)) and
(A.BankCode=@BankCode) and
(A.BranchCode=@BranchCode or @BranchCode='ALL') and
(A.PhoneNumber=@Phone or @Phone='') and
(((upper(A.FirstName) like '%'+upper(@Name)+'%') or @Name='') or ((upper(A.LastName) like '%'+upper(@Name)+'%') or @Name='')) 
and
( CONVERT(date,A.CreatedOn,102)>=@fromDate and CONVERT(date,A.CreatedOn,102)<=@toDate)
GO
/****** Object:  StoredProcedure [dbo].[GetBankAccountsPendingApproval]    Script Date: 12/29/2017 09:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetBankAccountsPendingApproval]
@BankCode varchar(50),
@BranchCode varchar(50),
@AccountNumber varchar(50),
@Custname varchar(50),
@fromDate varchar(50),
@toDate varchar(50)
as
Select A.AccountCode,A.AccountName as CustomerName,AccType,A.BranchCode,V.FirstName+' '+V.LastName AS CreadtedBy,A.CreatedOn,
 (select count(AccountCode) from RejectionLogs where AccountCode=A.AccountCode) as 'Rejection Count'
from BankAccounts A
inner join dbo.SystemUsersView AS V on A.CreatedBy= V.UserId
where 
((A.ApprovedBy='') or (A.ApprovedBy is NULL)) and
(A.BankCode=@BankCode) and
(A.BranchCode=@BranchCode or @BranchCode='ALL') and
(A.AccountCode=@AccountNumber or @AccountNumber='') and
(((upper(AccountName) like '%'+upper(@Custname)+'%') or @Custname='')) 
and
( CONVERT(date,A.CreatedOn,102)>=@fromDate and CONVERT(date,A.CreatedOn,102)<=@toDate)
--Select A.AccountCode,A.AccountName as CustomerName,AccType,A.BranchCode,V.FirstName+' '+V.LastName AS CreadtedBy,A.CreatedOn from BankAccounts A
--inner join CustomersToAccountsMapping B on A.AccNumber=B.AccountNumber
--inner join BankCustomers C on C.CustomerId=B.CustomerId 
--inner join dbo.SystemUsersView AS V on A.CreatedBy= V.UserId
--where 
--((A.ApprovedBy='') or (A.ApprovedBy is NULL)) and
--(A.BankCode=@BankCode) and
--(A.BranchCode=@BranchCode or @BranchCode='ALL') and
--(AccountCode=@AccountNumber or @AccountNumber='') and
--(((upper(C.FirstName) like '%'+upper(@Custname)+'%') or @Custname='') or ((upper(C.LastName) like '%'+upper(@Custname)+'%') or @Custname='')) 
--and
--( CONVERT(date,C.CreatedOn,102)>=@fromDate and CONVERT(date,C.CreatedOn,102)<=@toDate)
GO
/****** Object:  StoredProcedure [dbo].[GetBankAccountsChangesPendingApproval]    Script Date: 12/29/2017 09:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetBankAccountsChangesPendingApproval]
@BankCode varchar(50),
@BranchCode varchar(50),
@AccountNumber varchar(50),
@Custname varchar(50),
@fromDate varchar(50),
@toDate varchar(50)
as
Select A.AccountCode,A.AccountId AS RequestId,A.AccountName as CustomerName,AccType,A.BranchCode,V.FirstName+' '+V.LastName AS CreadtedBy,A.CreatedOn,A.Status from PendingBankAccountApprovals A
--inner join CustomersToAccountsMapping B on A.AccNumber=B.AccountNumber
--inner join BankCustomers C on C.CustomerId=B.CustomerId 
inner join dbo.SystemUsersView AS V on A.CreatedBy= V.UserId
where 
A.Status='PENDING' and
((A.ApprovedBy='') or (A.ApprovedBy is NULL)) and
(A.BankCode=@BankCode) and
(A.BranchCode=@BranchCode or @BranchCode='ALL') and
(AccountCode=@AccountNumber or @AccountNumber='') and
(((upper(A.AccountName) like '%'+upper(@Custname)+'%') or @Custname='') or ((upper(A.AccountName) like '%'+upper(@Custname)+'%') or @Custname='')) 
and
( CONVERT(date,A.CreatedOn,102)>=@fromDate and CONVERT(date,A.CreatedOn,102)<=@toDate)
order by A.ModifiedOn desc
GO
/****** Object:  StoredProcedure [dbo].[CommissionAccounts_Update]    Script Date: 12/29/2017 09:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[CommissionAccounts_Update]
	@CommissionAccountCode varchar(50),
	@CommissionAccountName varchar(50),
	@CommissionAccountNumber varchar(50),
	@BankCode varchar(50),
	@ModifiedBy varchar(50),
	@BranchCode varchar(50),
	@IsActive bit,
	@CurrencyCode varchar(50),
	@ApprovedBy varchar(50),
	@AcountName varchar(50),
	@MinimumBal decimal(18,2),	@InterestRate decimal(18,2),	@InterestType varchar(50),	@InterestPayOutFreq varchar(50)
As
BEGIN TRYBEGIN TRANSACTION CreateAccount
if exists(Select * from CommissionAccounts where [CommissionAccountCode] = @CommissionAccountCode and [BankCode] = @BankCode)
Begin
	Update CommissionAccounts
	Set
		[CommissionAccountName] = @CommissionAccountName,
		[CommissionAccountNumber] = @CommissionAccountNumber,
		[ModifiedBy] = @ModifiedBy,
		[ModifiedOn] = GETDATE()
	Where		
		 [CommissionAccountCode] = @CommissionAccountCode and [BankCode] = @BankCode
		 
	EXEC dbo.Accounts_Update '',0,@CommissionAccountCode,@CommissionAccountNumber,'COMMISSION_ACCOUNT','',@BankCode,@ModifiedBy,@BranchCode,'True',@CurrencyCode,@ApprovedBy,@AcountName,@MinimumBal,@InterestRate,@InterestType,@InterestPayOutFreq,0,'',0,'NONE','NONE','','',''
	Select @CommissionAccountCode as InsertedID
End
Else
Begin
	Insert Into CommissionAccounts
		([CommissionAccountCode],[CommissionAccountName],
		 [CommissionAccountNumber],[BankCode],
		 [ModifiedBy],[CreatedBy],
	     [ModifiedOn],[CreatedOn])
	Values
		(@CommissionAccountCode,@CommissionAccountName,
		 @CommissionAccountNumber,@BankCode,
		 @ModifiedBy,@ModifiedBy,
		 GETDATE(),GETDATE())
	
	EXEC dbo.Accounts_Update '',0,@CommissionAccountCode,@CommissionAccountNumber,'COMMISSION_ACCOUNT','',@BankCode,@ModifiedBy,@BranchCode,'True',@CurrencyCode,@ApprovedBy,@AcountName,@MinimumBal,@InterestRate,@InterestType,@InterestPayOutFreq,0,'',0,'NONE','NONE','','',''
	Select @CommissionAccountCode as InsertedID
End
COMMIT TRANSACTION CreateAccountEND TRYBEGIN CATCH
ROLLBACK Transaction CreateAccount

  DECLARE
   @ErMessage NVARCHAR(2048),
   @ErSeverity INT,
   @ErState INT
 
 SELECT
   @ErMessage = ERROR_MESSAGE(),
   @ErSeverity = ERROR_SEVERITY(),
   @ErState = ERROR_STATE()
 
 RAISERROR (@ErMessage,
             @ErSeverity,
             @ErState )END CATCH
GO
/****** Object:  StoredProcedure [dbo].[ApproveOrRejectBankAccountChanges]    Script Date: 12/29/2017 09:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[ApproveOrRejectBankAccountChanges]
@RecordId varchar(50),
@BankCode varchar(50),
@AccountCode varchar(50),
@Status varchar(50),
@ApprovedBy varchar(50)
as
Begin transaction trans
Begin try

if(upper(@Status)='TRUE')
Begin

    declare @AccType varchar(50) = (select AccType from PendingBankAccountApprovals where AccountId=@RecordId)
	declare @AccountName varchar(50) = (select AccountName from PendingBankAccountApprovals where  AccountId=@RecordId)
	declare @IsActive varchar(50) = (select IsActive from PendingBankAccountApprovals where  AccountId=@RecordId)
    declare @MinimumBal varchar(50) = (select MinimumBalance from PendingBankAccountApprovals where  AccountId=@RecordId)
	declare @InterestRate varchar(50) = (select InterestRate from PendingBankAccountApprovals where  AccountId=@RecordId)
    declare @InterestType varchar(50) = (select InterestType from PendingBankAccountApprovals where  AccountId=@RecordId)
	declare @InterestPayOutFreq varchar(50) = (select InterestPayOutFrequency from PendingBankAccountApprovals where  AccountId=@RecordId)
    declare @IsReferenced varchar(50) = (select IsReferenced from PendingBankAccountApprovals where  AccountId=@RecordId)
    declare @LiquidationFrequency varchar(50) = (select LiquidationFrequency from PendingBankAccountApprovals where  AccountId=@RecordId)
	declare @LiquidationType varchar(50) = (select LiquidationType from PendingBankAccountApprovals where  AccountId=@RecordId)
	declare @LiquidationAcct varchar(50) = (select LiquidationAccount from PendingBankAccountApprovals where  AccountId=@RecordId)
	declare @AcctUsers int = (select COUNT(*) from BankCustomersAndAccountDetailsView with(nolock) where AccountCode=@AccountCode)
    declare @MerchantContact varchar(50) = (select MerchantContact from PendingBankAccountApprovals where  AccountId=@RecordId)


    --log old details
    begin
      insert into BankAccountsHistory
      select * from BankAccounts with(nolock) where AccountCode = @AccountCode 
    end
    
	begin
	  if (@AccType<>'SOLE')
		  begin
			UPDATE BankAccounts SET				[AccType] = @AccType,				ModifiedOn=GETDATE(),				ModifiedBy=@ApprovedBy,				IsActive=@IsActive,				AccountName=@AccountName,				MinimumBalance=@MinimumBal,				IsReferenced = @IsReferenced,				LiquidationType=@LiquidationType,				LiquidationFrequency=@LiquidationFrequency,				LiquidationAccount=@LiquidationAcct,				MerchantContact=@MerchantContact			WHERE AccountCode = @AccountCode and BankCode=@BankCode
			 begin
			    update PendingBankAccountApprovals set Status='SUCCESS' where AccountId=@RecordId
		     end
		  end
	  else 
	     begin
		    if(@AcctUsers=1)
			  begin
			   	declare @customer varchar(50) = (select CustomerId from BankCustomersAndAccountDetailsView where AccountCode=@AccountCode)

			     UPDATE BankAccounts SET				[AccType] = @AccType,				ModifiedOn=GETDATE(),				ModifiedBy=@ApprovedBy,				IsActive=@IsActive,				AccountName=@AccountName,				MinimumBalance=@MinimumBal,				IsReferenced = @IsReferenced,				LiquidationType=@LiquidationType,				LiquidationFrequency=@LiquidationFrequency,				LiquidationAccount=@LiquidationAcct,				MerchantContact=@MerchantContact					WHERE AccountCode = @AccountCode and BankCode=@BankCode
                 begin
			        update PendingBankAccountApprovals set Status='SUCCESS' where AccountId=@RecordId
				 end
				 begin
			       update BankCustomers set UserCategory='ALL' where CustomerId=@customer
				 end
			  end
			else
			  	update PendingBankAccountApprovals set Status='FAILED',Reason='SOLE PROPRIETOR CANNNOT HAVE MORE THAN ONE USER' where AccountId=@RecordId
		 end
	end
End
Else
Begin
	update PendingBankAccountApprovals set Status='FAILED' where AccountId=@RecordId
End
Commit transaction trans
End try
Begin Catch
Rollback transaction trans

  DECLARE
   @ErMessage NVARCHAR(2048),
   @ErSeverity INT,
   @ErState INT
 
 SELECT
   @ErMessage = ERROR_MESSAGE(),
   @ErSeverity = ERROR_SEVERITY(),
   @ErState = ERROR_STATE()
 
 RAISERROR (@ErMessage,
             @ErSeverity,
             @ErState )
End Catch
GO
/****** Object:  StoredProcedure [dbo].[Activation_Update]    Script Date: 12/29/2017 09:13:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==========================================================================================
-- Entity Name:	Activation_Update
-- Author:	Albert Luganga
-- Create date:	02/20/2017 19:24:00 PM
-- Description:	This stored procedure is intended for logging every de-activation of an account
-- ==========================================================================================
CREATE Procedure [dbo].[Activation_Update]
	@UserId varchar(50),
	@Channel varchar(50),
	@IP varchar(50),
	@RequestAgent varchar(50),
	@AccountCode varchar(50)
As
Begin
    declare @lastDeactivationDate datetime 
    declare @today datetime = Convert(DateTime, DATEDIFF(DAY, 0, GETDATE())) --date floored to to 00:00:00:00

    declare @date datetime = (select top 1 RecordDate from DeactivationLog where UserId=@UserId order by RecordDate desc)
    set @lastDeactivationDate = (case when @date is null then @today else @date end)

    --get number of invalid logins since last deactivation date
    declare @count int = (select Count(*) from UserLoginLog where userId=@UserId and status='555' and CreationDate>=@lastDeactivationDate)

    declare @userType varchar(50) = (select UserType from SystemUsersView where UserId=@UserId)
    
	if @count > 5
	 begin
	   if @userType='CUSTOMER'
	     update BankCustomers
		   set IsActive=0
		   where CustomerId=@UserId
	   else 
	     update BankSystemUsers
		   set IsActive=0
		   where UserId=@UserId
	 
	    insert into DeactivationLog
	     (Channel,AccountCode,UserId,IP,RequestAgent,RecordDate)
	    values(@Channel,@AccountCode,@UserId,@IP,@RequestAgent,GETDATE())
	  end
End
GO
/****** Object:  Default [DF_RejectedBankCustomers_ResetPassword]    Script Date: 12/29/2017 09:13:04 ******/
ALTER TABLE [dbo].[RejectedBankCustomers] ADD  CONSTRAINT [DF_RejectedBankCustomers_ResetPassword]  DEFAULT ((1)) FOR [ResetPassword]
GO
/****** Object:  Default [DF_RejectedBankCustomers_ResetPin]    Script Date: 12/29/2017 09:13:04 ******/
ALTER TABLE [dbo].[RejectedBankCustomers] ADD  CONSTRAINT [DF_RejectedBankCustomers_ResetPin]  DEFAULT ((1)) FOR [ResetPin]
GO
/****** Object:  Default [DF_RejectedBankAccounts_IsproductAccount]    Script Date: 12/29/2017 09:13:04 ******/
ALTER TABLE [dbo].[RejectedBankAccounts] ADD  CONSTRAINT [DF_RejectedBankAccounts_IsproductAccount]  DEFAULT ((0)) FOR [IsproductAccount]
GO
/****** Object:  Default [DF_RejectedBankAccounts_IsReferenced]    Script Date: 12/29/2017 09:13:04 ******/
ALTER TABLE [dbo].[RejectedBankAccounts] ADD  CONSTRAINT [DF_RejectedBankAccounts_IsReferenced]  DEFAULT ((0)) FOR [IsReferenced]
GO
/****** Object:  Default [DF_RejectedBankAccounts_LiquidationType]    Script Date: 12/29/2017 09:13:04 ******/
ALTER TABLE [dbo].[RejectedBankAccounts] ADD  CONSTRAINT [DF_RejectedBankAccounts_LiquidationType]  DEFAULT ('ONDEMAND') FOR [LiquidationType]
GO
/****** Object:  Default [DF__RejectedB__SentT__1940BAED]    Script Date: 12/29/2017 09:13:04 ******/
ALTER TABLE [dbo].[RejectedBankAccounts] ADD  DEFAULT ((0)) FOR [SentToBank]
GO
/****** Object:  Default [DF_RejectedBankAccounts_Status]    Script Date: 12/29/2017 09:13:04 ******/
ALTER TABLE [dbo].[RejectedBankAccounts] ADD  CONSTRAINT [DF_RejectedBankAccounts_Status]  DEFAULT ('PENDING') FOR [Status]
GO
/****** Object:  Default [DF_PendingBankAccountApprovals_Status]    Script Date: 12/29/2017 09:13:07 ******/
ALTER TABLE [dbo].[PendingBankAccountApprovals] ADD  CONSTRAINT [DF_PendingBankAccountApprovals_Status]  DEFAULT ('PENDING') FOR [Status]
GO
/****** Object:  Default [DF_TransactionRequests_Status]    Script Date: 12/29/2017 09:13:07 ******/
ALTER TABLE [dbo].[TransactionRequests] ADD  CONSTRAINT [DF_TransactionRequests_Status]  DEFAULT ('PENDING') FOR [Status]
GO
/****** Object:  Default [DF_TransactionRequests_SentToBank]    Script Date: 12/29/2017 09:13:07 ******/
ALTER TABLE [dbo].[TransactionRequests] ADD  CONSTRAINT [DF_TransactionRequests_SentToBank]  DEFAULT ((0)) FOR [SentToBank]
GO
/****** Object:  Default [DF_TransactionRequests_BankTranId]    Script Date: 12/29/2017 09:13:07 ******/
ALTER TABLE [dbo].[TransactionRequests] ADD  CONSTRAINT [DF_TransactionRequests_BankTranId]  DEFAULT ('') FOR [BankTranId]
GO
/****** Object:  Default [DF__GeneralLe__SentT__4E739D3B]    Script Date: 12/29/2017 09:13:11 ******/
ALTER TABLE [dbo].[GeneralLedgerTable] ADD  CONSTRAINT [DF__GeneralLe__SentT__4E739D3B]  DEFAULT ((0)) FOR [SentToBank]
GO
/****** Object:  Default [DF_GeneralLedgerTable_Processed]    Script Date: 12/29/2017 09:13:11 ******/
ALTER TABLE [dbo].[GeneralLedgerTable] ADD  CONSTRAINT [DF_GeneralLedgerTable_Processed]  DEFAULT ((0)) FOR [Processed]
GO
/****** Object:  Default [DF_AccountCategories_IsBankCustomer]    Script Date: 12/29/2017 09:13:11 ******/
ALTER TABLE [dbo].[AccountCategories] ADD  CONSTRAINT [DF_AccountCategories_IsBankCustomer]  DEFAULT ((0)) FOR [IsBankCustomer]
GO
/****** Object:  Default [DF_BankCustomersDeleted_ResetPassword]    Script Date: 12/29/2017 09:13:11 ******/
ALTER TABLE [dbo].[BankCustomersDeleted] ADD  CONSTRAINT [DF_BankCustomersDeleted_ResetPassword]  DEFAULT ((1)) FOR [ResetPassword]
GO
/****** Object:  Default [DF_BankCustomersDeleted_ResetPin]    Script Date: 12/29/2017 09:13:11 ******/
ALTER TABLE [dbo].[BankCustomersDeleted] ADD  CONSTRAINT [DF_BankCustomersDeleted_ResetPin]  DEFAULT ((1)) FOR [ResetPin]
GO
/****** Object:  Default [df_Processed]    Script Date: 12/29/2017 09:13:11 ******/
ALTER TABLE [dbo].[ReceivedTransactions] ADD  CONSTRAINT [df_Processed]  DEFAULT ((0)) FOR [Processed]
GO
/****** Object:  Default [df_SentToUtility]    Script Date: 12/29/2017 09:13:11 ******/
ALTER TABLE [dbo].[ReceivedTransactions] ADD  CONSTRAINT [df_SentToUtility]  DEFAULT ((0)) FOR [SentToUtility]
GO
/****** Object:  Default [DF__ReceivedP__Proce__10766AC2]    Script Date: 12/29/2017 09:13:11 ******/
ALTER TABLE [dbo].[ReceivedPaymentsGatewayRequests] ADD  DEFAULT ((0)) FOR [Processed]
GO
/****** Object:  Default [DF_PendingBankCustomerApprovals_ResetPassword]    Script Date: 12/29/2017 09:13:11 ******/
ALTER TABLE [dbo].[PendingBankCustomerApprovals] ADD  CONSTRAINT [DF_PendingBankCustomerApprovals_ResetPassword]  DEFAULT ((1)) FOR [ResetPassword]
GO
/****** Object:  Default [DF_PendingBankCustomerApprovals_ResetPin]    Script Date: 12/29/2017 09:13:11 ******/
ALTER TABLE [dbo].[PendingBankCustomerApprovals] ADD  CONSTRAINT [DF_PendingBankCustomerApprovals_ResetPin]  DEFAULT ((1)) FOR [ResetPin]
GO
/****** Object:  Default [DF_PendingBankCustomerApprovals_Status]    Script Date: 12/29/2017 09:13:11 ******/
ALTER TABLE [dbo].[PendingBankCustomerApprovals] ADD  CONSTRAINT [DF_PendingBankCustomerApprovals_Status]  DEFAULT ('PENDING') FOR [Status]
GO
/****** Object:  Default [DF_BankCharges_IsSplit]    Script Date: 12/29/2017 09:13:11 ******/
ALTER TABLE [dbo].[BankCharges] ADD  CONSTRAINT [DF_BankCharges_IsSplit]  DEFAULT ((1)) FOR [IsSplit]
GO
/****** Object:  Default [DF_PaymentsGatewayRequests_Processed]    Script Date: 12/29/2017 09:13:11 ******/
ALTER TABLE [dbo].[PaymentsGatewayRequests] ADD  CONSTRAINT [DF_PaymentsGatewayRequests_Processed]  DEFAULT ((0)) FOR [Processed]
GO
/****** Object:  Default [DF_PaymentsGatewayRequests_SentToUtility]    Script Date: 12/29/2017 09:13:11 ******/
ALTER TABLE [dbo].[PaymentsGatewayRequests] ADD  CONSTRAINT [DF_PaymentsGatewayRequests_SentToUtility]  DEFAULT ((0)) FOR [SentToUtility]
GO
/****** Object:  Default [DF_SessionLog_CreatedOn]    Script Date: 12/29/2017 09:13:11 ******/
ALTER TABLE [dbo].[SessionLog] ADD  CONSTRAINT [DF_SessionLog_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
/****** Object:  Default [DF_MenuMerchants_Active]    Script Date: 12/29/2017 09:13:11 ******/
ALTER TABLE [dbo].[MenuMerchants] ADD  CONSTRAINT [DF_MenuMerchants_Active]  DEFAULT ((1)) FOR [Active]
GO
/****** Object:  Default [DF_MenuMerchants_RecordDate]    Script Date: 12/29/2017 09:13:11 ******/
ALTER TABLE [dbo].[MenuMerchants] ADD  CONSTRAINT [DF_MenuMerchants_RecordDate]  DEFAULT (getdate()) FOR [RecordDate]
GO
/****** Object:  Default [DF_MarketPlaceRequests_RecordDate]    Script Date: 12/29/2017 09:13:11 ******/
ALTER TABLE [dbo].[MarketPlaceRequests] ADD  CONSTRAINT [DF_MarketPlaceRequests_RecordDate]  DEFAULT (getdate()) FOR [RecordDate]
GO
/****** Object:  Default [DF_BankAccounts_IsproductAccount]    Script Date: 12/29/2017 09:13:11 ******/
ALTER TABLE [dbo].[BankAccounts] ADD  CONSTRAINT [DF_BankAccounts_IsproductAccount]  DEFAULT ((0)) FOR [IsproductAccount]
GO
/****** Object:  Default [DF_BankAccounts_IsReferenced]    Script Date: 12/29/2017 09:13:11 ******/
ALTER TABLE [dbo].[BankAccounts] ADD  CONSTRAINT [DF_BankAccounts_IsReferenced]  DEFAULT ((0)) FOR [IsReferenced]
GO
/****** Object:  Default [DF_BankAccounts_LiquidationType]    Script Date: 12/29/2017 09:13:11 ******/
ALTER TABLE [dbo].[BankAccounts] ADD  CONSTRAINT [DF_BankAccounts_LiquidationType]  DEFAULT ('ONDEMAND') FOR [LiquidationType]
GO
/****** Object:  Default [DF__BankAccou__SentT__0DCF0841]    Script Date: 12/29/2017 09:13:11 ******/
ALTER TABLE [dbo].[BankAccounts] ADD  DEFAULT ((0)) FOR [SentToBank]
GO
/****** Object:  Default [DF_AccessCredentials_CreatedOn]    Script Date: 12/29/2017 09:13:11 ******/
ALTER TABLE [dbo].[AccessCredentials] ADD  CONSTRAINT [DF_AccessCredentials_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
/****** Object:  Default [DF_BankSystemUsers_ResetPassword]    Script Date: 12/29/2017 09:13:15 ******/
ALTER TABLE [dbo].[BankSystemUsers] ADD  CONSTRAINT [DF_BankSystemUsers_ResetPassword]  DEFAULT ((1)) FOR [ResetPassword]
GO
/****** Object:  Default [DF_BankSystemUsers_ResetPin]    Script Date: 12/29/2017 09:13:15 ******/
ALTER TABLE [dbo].[BankSystemUsers] ADD  CONSTRAINT [DF_BankSystemUsers_ResetPin]  DEFAULT ((1)) FOR [ResetPin]
GO
/****** Object:  Default [DF_BankSystemUsers_SecretKey]    Script Date: 12/29/2017 09:13:15 ******/
ALTER TABLE [dbo].[BankSystemUsers] ADD  CONSTRAINT [DF_BankSystemUsers_SecretKey]  DEFAULT ([dbo].[GenerateRandomString]((30))) FOR [SecretKey]
GO
/****** Object:  Default [DF_BankCustomers_ResetPassword]    Script Date: 12/29/2017 09:13:15 ******/
ALTER TABLE [dbo].[BankCustomers] ADD  CONSTRAINT [DF_BankCustomers_ResetPassword]  DEFAULT ((1)) FOR [ResetPassword]
GO
/****** Object:  Default [DF_BankCustomers_ResetPin]    Script Date: 12/29/2017 09:13:15 ******/
ALTER TABLE [dbo].[BankCustomers] ADD  CONSTRAINT [DF_BankCustomers_ResetPin]  DEFAULT ((1)) FOR [ResetPin]
GO
/****** Object:  Default [DF_BankCustomers_SecretKey]    Script Date: 12/29/2017 09:13:15 ******/
ALTER TABLE [dbo].[BankCustomers] ADD  CONSTRAINT [DF_BankCustomers_SecretKey]  DEFAULT ([dbo].[GenerateRandomString]((30))) FOR [SecretKey]
GO
