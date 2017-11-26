USE [master]
GO
/****** Object:  Database [SchoolOS]    Script Date: 11/27/2017 12:19:42 AM ******/
CREATE DATABASE [SchoolOS] ON  PRIMARY 
( NAME = N'SchoolOS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\SchoolOS.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SchoolOS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\SchoolOS_log.ldf' , SIZE = 5696KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [SchoolOS] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SchoolOS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SchoolOS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SchoolOS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SchoolOS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SchoolOS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SchoolOS] SET ARITHABORT OFF 
GO
ALTER DATABASE [SchoolOS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SchoolOS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SchoolOS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SchoolOS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SchoolOS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SchoolOS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SchoolOS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SchoolOS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SchoolOS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SchoolOS] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SchoolOS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SchoolOS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SchoolOS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SchoolOS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SchoolOS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SchoolOS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SchoolOS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SchoolOS] SET RECOVERY FULL 
GO
ALTER DATABASE [SchoolOS] SET  MULTI_USER 
GO
ALTER DATABASE [SchoolOS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SchoolOS] SET DB_CHAINING OFF 
GO
USE [SchoolOS]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [SchoolOS]
GO
/****** Object:  Table [dbo].[SchoolClasses]    Script Date: 11/27/2017 12:19:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SchoolClasses](
	[RecordId] [bigint] IDENTITY(1,1) NOT NULL,
	[SchoolCode] [varchar](50) NOT NULL,
	[ClassCode] [varchar](50) NOT NULL,
	[ClassName] [varchar](50) NULL,
	[CreatedBy] [varchar](50) NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[ModifiedOn] [datetime] NULL,
	[ApprovedBy] [varchar](50) NULL,
	[ApprovedOn] [datetime] NULL,
 CONSTRAINT [PK_SchoolClasses] PRIMARY KEY CLUSTERED 
(
	[ClassCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SchoolExams]    Script Date: 11/27/2017 12:19:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SchoolExams](
	[RecordID] [bigint] IDENTITY(1,1) NOT NULL,
	[SchoolCode] [varchar](50) NOT NULL,
	[SemesterCode] [varchar](50) NULL,
	[ClassCode] [varchar](50) NOT NULL,
	[ExamCode] [varchar](50) NOT NULL,
	[ExamName] [varchar](100) NULL,
	[ExamDate] [varchar](50) NULL,
	[CreatedBy] [varchar](50) NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[ModifiedOn] [datetime] NULL,
 CONSTRAINT [PK_SchoolExams] PRIMARY KEY CLUSTERED 
(
	[ExamCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SchoolResults]    Script Date: 11/27/2017 12:19:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SchoolResults](
	[RecordID] [bigint] IDENTITY(1,1) NOT NULL,
	[SchoolCode] [varchar](50) NULL,
	[SemesterCode] [varchar](50) NULL,
	[ExamCode] [varchar](50) NULL,
	[ClassCode] [varchar](50) NULL,
	[SubjectCode] [varchar](50) NULL,
	[ResultsCode] [varchar](50) NOT NULL,
	[ResultName] [varchar](50) NULL,
	[CreatedBy] [varchar](50) NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[ModifiedOn] [datetime] NULL,
 CONSTRAINT [PK_SchoolResults] PRIMARY KEY CLUSTERED 
(
	[ResultsCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Schools]    Script Date: 11/27/2017 12:19:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Schools](
	[RecordId] [int] IDENTITY(1,1) NOT NULL,
	[SchoolCode] [varchar](50) NOT NULL,
	[SchoolName] [varchar](50) NOT NULL,
	[SchoolLocation] [varchar](5000) NULL,
	[SchoolEmail] [varchar](50) NULL,
	[SchoolPhone] [varchar](50) NULL,
	[UnebCenterNumber] [varchar](50) NULL,
	[ApprovedBy] [varchar](50) NULL,
	[ModifiedBy] [varchar](50) NOT NULL,
	[CreatedBy] [varchar](50) NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[ApprovedOn] [datetime] NULL,
 CONSTRAINT [PK_Schools] PRIMARY KEY CLUSTERED 
(
	[SchoolCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SchoolSemesters]    Script Date: 11/27/2017 12:19:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SchoolSemesters](
	[RecordID] [bigint] IDENTITY(1,1) NOT NULL,
	[SchoolCode] [varchar](50) NOT NULL,
	[SemesterCode] [varchar](50) NOT NULL,
	[SchoolStartDate] [date] NOT NULL,
	[SchoolEndDate] [date] NOT NULL,
	[CreatedBy] [varchar](50) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[ModifiedBy] [varchar](50) NULL,
	[ModifiedOn] [datetime] NULL,
	[ApprovedBy] [varchar](50) NULL,
	[ApprovedOn] [datetime] NULL,
 CONSTRAINT [PK_SchoolSemesters] PRIMARY KEY CLUSTERED 
(
	[SemesterCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Student]    Script Date: 11/27/2017 12:19:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[RecordID] [int] IDENTITY(1,1) NOT NULL,
	[SchoolCode] [varchar](50) NOT NULL,
	[StudentNumber] [varchar](50) NOT NULL,
	[PegPayStudentNumber] [varchar](50) NULL,
	[StudentName] [varchar](50) NOT NULL,
	[ClassCode] [varchar](50) NOT NULL,
	[StreamCode] [varchar](50) NOT NULL,
	[DateOfBirth] [date] NULL,
	[StudentCategory] [varchar](50) NULL,
	[CreatedBy] [varchar](50) NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[ModifiedOn] [datetime] NULL,
	[ApprovedBy] [varchar](50) NULL,
	[ApprovedOn] [datetime] NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[SchoolCode] ASC,
	[StudentNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[SchoolClasses] ON 

INSERT [dbo].[SchoolClasses] ([RecordId], [SchoolCode], [ClassCode], [ClassName], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ApprovedBy], [ApprovedOn]) VALUES (1, N'TEST_SCHOOL', N'S4', N'senior Four', N'', CAST(N'2017-11-24T17:45:24.513' AS DateTime), N'Peter', CAST(N'2017-11-24T18:58:40.463' AS DateTime), N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[SchoolClasses] OFF
SET IDENTITY_INSERT [dbo].[SchoolExams] ON 

INSERT [dbo].[SchoolExams] ([RecordID], [SchoolCode], [SemesterCode], [ClassCode], [ExamCode], [ExamName], [ExamDate], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (2, N'', N'', N'', N'', N'', N'', N'', CAST(N'2017-11-26T22:25:02.480' AS DateTime), N'', CAST(N'2017-11-26T22:35:22.400' AS DateTime))
INSERT [dbo].[SchoolExams] ([RecordID], [SchoolCode], [SemesterCode], [ClassCode], [ExamCode], [ExamName], [ExamDate], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1, N'TEST_SCHOOL', N'2017_Term3', N's41', N'2017EOT3', N'End of Term2', N'2017-12-16', N'Peter.K', CAST(N'2017-11-26T22:22:29.760' AS DateTime), N'Pe.K', CAST(N'2017-11-26T23:17:29.180' AS DateTime))
SET IDENTITY_INSERT [dbo].[SchoolExams] OFF
SET IDENTITY_INSERT [dbo].[SchoolResults] ON 

INSERT [dbo].[SchoolResults] ([RecordID], [SchoolCode], [SemesterCode], [ExamCode], [ClassCode], [SubjectCode], [ResultsCode], [ResultName], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1, N'TEST_SCHOOL', N'2017_Term3', N's41', N'ENG10023', N'2017EOT3', N'End of Term2', N'2017-12-16', N'Pe.K', CAST(N'2017-11-27T00:04:56.753' AS DateTime), N'Pe.K', CAST(N'2017-11-27T00:04:56.753' AS DateTime))
SET IDENTITY_INSERT [dbo].[SchoolResults] OFF
SET IDENTITY_INSERT [dbo].[Schools] ON 

INSERT [dbo].[Schools] ([RecordId], [SchoolCode], [SchoolName], [SchoolLocation], [SchoolEmail], [SchoolPhone], [UnebCenterNumber], [ApprovedBy], [ModifiedBy], [CreatedBy], [ModifiedOn], [CreatedOn], [ApprovedOn]) VALUES (1, N'', N'TEST SCHOOl', N'pegasus tech', N'nsubugak@yahoo.com', N'0785975800', N'123444', N'', N'admin', N'admin', CAST(N'2017-11-23T17:25:52.903' AS DateTime), CAST(N'2017-11-23T17:25:52.903' AS DateTime), NULL)
INSERT [dbo].[Schools] ([RecordId], [SchoolCode], [SchoolName], [SchoolLocation], [SchoolEmail], [SchoolPhone], [UnebCenterNumber], [ApprovedBy], [ModifiedBy], [CreatedBy], [ModifiedOn], [CreatedOn], [ApprovedOn]) VALUES (2, N'TEST_SCHOOL', N'TEST SCHOOl', N'pegasus tech', N'nsubugak@yahoo.com', N'0785975800', N'123444', N'', N'admin', N'admin', CAST(N'2017-11-24T18:58:40.127' AS DateTime), CAST(N'2017-11-23T17:26:51.573' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Schools] OFF
SET IDENTITY_INSERT [dbo].[SchoolSemesters] ON 

INSERT [dbo].[SchoolSemesters] ([RecordID], [SchoolCode], [SemesterCode], [SchoolStartDate], [SchoolEndDate], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ApprovedBy], [ApprovedOn]) VALUES (1, N'TEST_SCHOOL', N'2017_Term3', CAST(N'2017-10-08' AS Date), CAST(N'2017-12-16' AS Date), N'Peter.K', CAST(N'2017-11-24T18:59:04.710' AS DateTime), N'Peter.K', CAST(N'2017-11-24T18:59:43.010' AS DateTime), N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[SchoolSemesters] OFF
SET IDENTITY_INSERT [dbo].[Student] ON 

INSERT [dbo].[Student] ([RecordID], [SchoolCode], [StudentNumber], [PegPayStudentNumber], [StudentName], [ClassCode], [StreamCode], [DateOfBirth], [StudentCategory], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ApprovedBy], [ApprovedOn]) VALUES (1, N'TEST_SCHOOL', N'1002', N's1000', N'John', N's3', N'3c', CAST(N'1999-10-02' AS Date), N'day', N'Peter', CAST(N'2017-11-24T13:46:16.277' AS DateTime), N'Peter', CAST(N'2017-11-24T18:58:40.410' AS DateTime), N'', CAST(N'1900-01-01T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Student] OFF
/****** Object:  StoredProcedure [dbo].[SaveSchool]    Script Date: 11/27/2017 12:19:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SaveSchool]
@SchoolCode varchar(50),
@SchoolName varchar(50),
@SchoolLocation varchar(5000),
@SchoolEmail varchar(50),
@SchoolPhone varchar(50),
@UnebCenterNmber varchar(50),
@ModifiedBy varchar(50)
as
Begin Transaction trans
Begin try
if exists (select * from Schools where SchoolCode=@SchoolCode)
Begin
	Update Schools set SchoolEmail=@SchoolEmail,SchoolName=@SchoolName,SchoolLocation=@SchoolLocation,SchoolPhone=@SchoolPhone,
	UnebCenterNumber=@UnebCenterNmber,ModifiedBy=@ModifiedBy,ModifiedOn=GETDATE() where SchoolCode=@SchoolCode
End
Else
Begin
   INSERT INTO [dbo].[Schools]
           ([SchoolCode]
           ,[SchoolName]
           ,[SchoolLocation]
           ,[SchoolEmail]
           ,[SchoolPhone]
           ,[UnebCenterNumber]
           ,[ApprovedBy]
           ,[ModifiedBy]
           ,[CreatedBy]
           ,[ModifiedOn]
           ,[CreatedOn])
     VALUES
           (@SchoolCode,
            @SchoolName,
            @SchoolLocation,
            @SchoolEmail,
            @SchoolPhone,
            @UnebCenterNmber,
            '',
            @ModifiedBy,
            @ModifiedBy,
            GETDATE(),
            GETDATE())
End
Select @SchoolCode as InsertedID
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
/****** Object:  StoredProcedure [dbo].[saveschoolclass]    Script Date: 11/27/2017 12:19:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[saveschoolclass] 
	-- Add the parameters for the stored procedure here
@SchoolCode varchar(50),
@ClassCode varchar(50),
@ClassName varchar(50),
@ModifiedBy varchar(50)
	
AS
Begin Transaction trans
Begin try
if exists (select * from SchoolClasses where ClassCode=@ClassCode and SchoolCode=@SchoolCode)
Begin
	Update SchoolClasses set ClassName =@ClassName,
	ModifiedBy=@ModifiedBy,ModifiedOn=GETDATE() where SchoolCode=@SchoolCode and ClassCode=@ClassCode
End
Else
Begin
   INSERT INTO [dbo].[SchoolClasses]
           ([SchoolCode]
           ,[ClassCode]
           ,[ClassName]
           ,[CreatedBy]
           ,[CreatedOn]
           ,[ModifiedBy]
           ,[ModifiedOn]
           ,[ApprovedBy]
           ,[ApprovedOn])
     VALUES
           ( @SchoolCode,
            @ClassCode,
            @ClassName,
            @ModifiedBy,
		    GETDATE(),
		    @ModifiedBy,
		    GETDATE(),
		   '',
		   '')
End
Select @SchoolCode as InsertedID
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
/****** Object:  StoredProcedure [dbo].[SaveSchoolExam]    Script Date: 11/27/2017 12:19:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SaveSchoolExam] 
	-- Add the parameters for the stored procedure here
@SchoolCode varchar(50),
@SemesterCode varchar(50),
@ClassCode varchar(50),
@ExamCode varchar(50),
@ExamName varchar(100),
@ExamDate varchar(50),
@ModifiedBy varchar(50)
          
AS
Begin Transaction trans
Begin try
if exists (select * from SchoolExams where ExamCode=@ExamCode and ClassCode=@ClassCode and SemesterCode=@SemesterCode and SchoolCode=@SchoolCode)
Begin
	Update SchoolExams set ClassCode=@ClassCode,@ExamName=@ExamName,ExamDate=ExamDate
	,ModifiedBy=@ModifiedBy,ModifiedOn=GETDATE() where SchoolCode=@SchoolCode and ClassCode=@ClassCode and SemesterCode=@SemesterCode and ExamCode=@ExamCode
End
Else
Begin
   INSERT INTO [dbo].[SchoolExams]
           ([SchoolCode]
		   ,[SemesterCode]
           ,[ClassCode]
           ,[ExamCode]
           ,[ExamName]
           ,[ExamDate]
           ,[CreatedBy]
           ,[CreatedOn]
           ,[ModifiedBy]
           ,[ModifiedOn])
     VALUES
           (
		   @SchoolCode,
		   @SemesterCode,
           @ClassCode,
           @ExamCode,
           @ExamName,
           @ExamDate,
           @ModifiedBy,
		    GETDATE(),
		    @ModifiedBy,
            GETDATE())
          
End
Select @SchoolCode as InsertedID
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
/****** Object:  StoredProcedure [dbo].[SaveSchoolResults]    Script Date: 11/27/2017 12:19:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SaveSchoolResults]
	
@SchoolCode varchar(50),
@SemesterCode varchar(50),
@ExamCode varchar(50),
@ClassCode varchar(50),
@SubjectCode varchar(50),
@ResultsCode varchar(50),
@ResultName varchar(50),
@ModifiedBy varchar(50)
          
AS
Begin Transaction trans
Begin try
if exists (select * from SchoolResults where ResultsCode= @ResultsCode and  SchoolCode=@SchoolCode)
Begin
	Update SchoolResults set ResultName =@ResultName,ClassCode=@ClassCode,SemesterCode= @SemesterCode,ExamCode= @ExamCode,SubjectCode=@SubjectCode,
	ModifiedBy=@ModifiedBy,ModifiedOn=GETDATE() where SchoolCode=@SchoolCode  and ResultsCode= @ResultsCode
End
Else
Begin
   INSERT INTO [dbo].[SchoolResults]
           ([SchoolCode]
           ,[SemesterCode]
           ,[ExamCode]
           ,[ClassCode]
		   ,[SubjectCode]
           ,[ResultsCode]
           ,[ResultName]
           ,[CreatedBy]
           ,[CreatedOn]
           ,[ModifiedBy]
           ,[ModifiedOn])
     VALUES
           (
		    @SchoolCode,
            @SemesterCode,
            @ExamCode ,
            @ClassCode ,
			@SubjectCode,
            @ResultsCode ,
            @ResultName ,
            @ModifiedBy,  
		    GETDATE(),
		    @ModifiedBy,
		    GETDATE()
		   )
End
Select @SchoolCode as InsertedID
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
/****** Object:  StoredProcedure [dbo].[SaveSchools]    Script Date: 11/27/2017 12:19:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SaveSchools]
@SchoolCode varchar(50),
@SchoolName varchar(50),
@SchoolLocation varchar(5000),
@SchoolEmail varchar(50),
@SchoolPhone varchar(50),
@UnebCenterNmber varchar(50),
@ModifiedBy varchar(50)
as
Begin Transaction trans
Begin try
if exists (select * from Schools where SchoolCode=@SchoolCode)
Begin
	Update Schools set SchoolEmail=@SchoolEmail,SchoolName=@SchoolName,SchoolLocation=@SchoolLocation,SchoolPhone=@SchoolPhone,
	UnebCenterNumber=@UnebCenterNmber,ModifiedBy=@ModifiedBy,ModifiedOn=GETDATE() where SchoolCode=@SchoolCode
End
Else
Begin
   INSERT INTO [dbo].[Schools]
           ([SchoolCode]
           ,[SchoolName]
           ,[SchoolLocation]
           ,[SchoolEmail]
           ,[SchoolPhone]
           ,[UnebCenterNumber]
           ,[ApprovedBy]
           ,[ModifiedBy]
           ,[CreatedBy]
           ,[ModifiedOn]
           ,[CreatedOn])
     VALUES
           (@SchoolCode,
            @SchoolName,
            @SchoolLocation,
            @SchoolEmail,
            @SchoolPhone,
            @UnebCenterNmber,
            '',
            @ModifiedBy,
            @ModifiedBy,
            GETDATE(),
            GETDATE())
End
Select @SchoolCode as InsertedID
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
/****** Object:  StoredProcedure [dbo].[SaveSchoolSemester]    Script Date: 11/27/2017 12:19:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SaveSchoolSemester] 

@SchoolCode varchar(50),
@SemesterCode varchar(50),
@SchoolStartDate date,
@SchoolEndDate date,
@ModifiedBy varchar(50)

	
AS
Begin Transaction trans
Begin try
if exists (select * from SchoolSemesters where SchoolCode=@SchoolCode and SemesterCode =@SemesterCode)
Begin
	Update SchoolSemesters set SchoolCode=@SchoolCode,SemesterCode =@SemesterCode,
	SchoolStartDate=@SchoolStartDate,SchoolEndDate =@SchoolEndDate,
	 ModifiedBy=@ModifiedBy,ModifiedOn=GETDATE() where SchoolCode=@SchoolCode and SemesterCode =@SemesterCode
End
Else
Begin
   INSERT INTO [dbo].[SchoolSemesters]
           ([SchoolCode]
           ,[SemesterCode]
           ,[SchoolStartDate]
           ,[SchoolEndDate]
           ,[CreatedBy]
           ,[CreatedOn]
           ,[ModifiedBy]
           ,[ModifiedOn]
           ,[ApprovedBy]
           ,[ApprovedOn])
     VALUES
           (@SchoolCode,
           @SemesterCode,
           @SchoolStartDate,
           @SchoolEndDate,
           @ModifiedBy,
		   GETDATE(),
		   @ModifiedBy,
		   GETDATE(),
		   '',
		   '' 
		    )
		   
		   
End
Select @SchoolCode as InsertedID
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
/****** Object:  StoredProcedure [dbo].[SaveStudent]    Script Date: 11/27/2017 12:19:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SaveStudent] 
	-- Add the parameters for the stored procedure here
@SchoolCode varchar(50),

@StudentNumber varchar(50),
@PegPayStudentNumber varchar(50),
@StudentName varchar(50),
@ClassCode varchar(50),
@StreamCode varchar(50),
@DateOfBirth date,
@StudentCategory varchar(50),
@ModifiedBy varchar(50)
         
           
AS
Begin Transaction trans
Begin try
if exists (select * from Student where SchoolCode=@SchoolCode and StudentNumber =@StudentNumber)
Begin
	Update Student set SchoolCode=@SchoolCode,PegPayStudentNumber=@PegPayStudentNumber,
	StudentName=@StudentName,ClassCode=@ClassCode,StreamCode=@StreamCode,DateOfBirth=@DateOfBirth,StudentCategory=@StudentCategory,
	 ModifiedBy=@ModifiedBy,ModifiedOn=GETDATE() where SchoolCode=@SchoolCode and StudentNumber =@StudentNumber
End
Else
Begin
   INSERT INTO [dbo].[Student]
           ([SchoolCode]
           
           ,[StudentNumber]
           ,[PegPayStudentNumber]
           ,[StudentName]
           ,[ClassCode]
           ,[StreamCode]
           ,[DateOfBirth]
           ,[StudentCategory]
           ,[CreatedBy]
           ,[CreatedOn]
           ,[ModifiedBy]
           ,[ModifiedOn]
           ,[ApprovedBy]
           ,[ApprovedOn])
     VALUES
           (
		   @SchoolCode,
		   
		   @StudentNumber,
		   @PegPayStudentNumber,
		   @StudentName,
		   @ClassCode,
		   @StreamCode,
		   @DateOfBirth,
		   @StudentCategory,
		   @ModifiedBy,
		   GETDATE(),
		   @ModifiedBy,
		   GETDATE(),
		   '',
		   '')
		   
		   
End
Select @SchoolCode as InsertedID
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
USE [master]
GO
ALTER DATABASE [SchoolOS] SET  READ_WRITE 
GO
