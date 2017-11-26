USE [master]
GO
/****** Object:  Database [SchoolOS]    Script Date: 11/24/2017 18:17:16 ******/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'SchoolOS')
BEGIN
CREATE DATABASE [SchoolOS] ON  PRIMARY 
( NAME = N'SchoolOS', FILENAME = N'D:\databases\SchoolOS.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SchoolOS_log', FILENAME = N'D:\databases\SchoolOS_log.ldf' , SIZE = 5696KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
END
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
ALTER DATABASE [SchoolOS] SET AUTO_CREATE_STATISTICS ON
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
ALTER DATABASE [SchoolOS] SET  READ_WRITE
GO
ALTER DATABASE [SchoolOS] SET RECOVERY FULL
GO
ALTER DATABASE [SchoolOS] SET  MULTI_USER
GO
ALTER DATABASE [SchoolOS] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [SchoolOS] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'SchoolOS', N'ON'
GO
USE [SchoolOS]
GO
/****** Object:  Table [dbo].[ClassStreams]    Script Date: 11/24/2017 18:17:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ClassStreams]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ClassStreams](
	[RecordId] [int] IDENTITY(1,1) NOT NULL,
	[ClassCode] [varchar](50) NOT NULL,
	[StreamName] [varchar](50) NULL,
	[StreamCode] [varchar](50) NOT NULL,
	[SchoolCode] [varchar](50) NOT NULL,
	[ModifiedBy] [varchar](50) NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedOn] [datetime] NULL,
	[CreatedOn] [datetime] NULL,
 CONSTRAINT [PK_ClassStreams] PRIMARY KEY CLUSTERED 
(
	[ClassCode] ASC,
	[StreamCode] ASC,
	[SchoolCode] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[ClassStreams] ON
INSERT [dbo].[ClassStreams] ([RecordId], [ClassCode], [StreamName], [StreamCode], [SchoolCode], [ModifiedBy], [CreatedBy], [ModifiedOn], [CreatedOn]) VALUES (1, N'TEST_CLASS', N'test stream', N'TEST_STREAM', N'TEST_SCHOOL', N'admin', N'admin', CAST(0x0000A835012CAB29 AS DateTime), CAST(0x0000A835012C83E9 AS DateTime))
SET IDENTITY_INSERT [dbo].[ClassStreams] OFF
/****** Object:  Table [dbo].[SystemUsers]    Script Date: 11/24/2017 18:17:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SystemUsers]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SystemUsers](
	[RecordId] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[UserType] [varchar](50) NULL,
	[UserCategory] [varchar](50) NULL,
	[SecretKey] [varchar](50) NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedOn] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedBy] [varchar](50) NULL,
	[ApprovedBy] [varchar](50) NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[SystemUsers] ON
INSERT [dbo].[SystemUsers] ([RecordId], [Username], [Password], [UserType], [UserCategory], [SecretKey], [CreatedOn], [ModifiedOn], [CreatedBy], [ModifiedBy], [ApprovedBy]) VALUES (1, N'nsubugak@yahoo.com', N'', N'ADMIN', N'ADMIN', N'', CAST(0x0000A835012CAB1D AS DateTime), CAST(0x0000A835012CAB1D AS DateTime), N'', N'', N'')
SET IDENTITY_INSERT [dbo].[SystemUsers] OFF
/****** Object:  Table [dbo].[Subjects]    Script Date: 11/24/2017 18:17:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Subjects]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Subjects](
	[RecordId] [int] IDENTITY(1,1) NOT NULL,
	[SchooolCode] [varchar](50) NOT NULL,
	[SubjectName] [varchar](50) NULL,
	[SubjectCode] [varchar](50) NOT NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedBy] [varchar](50) NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedOn] [datetime] NULL,
 CONSTRAINT [PK_Subjects] PRIMARY KEY CLUSTERED 
(
	[SchooolCode] ASC,
	[SubjectCode] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Subjects] ON
INSERT [dbo].[Subjects] ([RecordId], [SchooolCode], [SubjectName], [SubjectCode], [CreatedBy], [ModifiedBy], [CreatedOn], [ModifiedOn]) VALUES (1, N'TEST_SCHOOL', N'Test Subject', N'TEST_SUBJECT', N'admin', N'admin', CAST(0x0000A835012CAB16 AS DateTime), CAST(0x0000A835012CAB16 AS DateTime))
SET IDENTITY_INSERT [dbo].[Subjects] OFF
/****** Object:  Table [dbo].[Student]    Script Date: 11/24/2017 18:17:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Student]') AND type in (N'U'))
BEGIN
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Student] ON
INSERT [dbo].[Student] ([RecordID], [SchoolCode], [StudentNumber], [PegPayStudentNumber], [StudentName], [ClassCode], [StreamCode], [DateOfBirth], [StudentCategory], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ApprovedBy], [ApprovedOn]) VALUES (1, N'TEST_SCHOOL', N'1002', N's1000', N'John', N's3', N'3c', CAST(0xAC230B00 AS Date), N'day', N'Peter', CAST(0x0000A83500E2F133 AS DateTime), N'Peter', CAST(0x0000A835012CAB03 AS DateTime), N'', CAST(0x0000000000000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[Student] OFF
/****** Object:  Table [dbo].[StaffMembers]    Script Date: 11/24/2017 18:17:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[StaffMembers]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[StaffMembers](
	[RecordId] [int] IDENTITY(1,1) NOT NULL,
	[SchoolCode] [varchar](50) NOT NULL,
	[FullName] [nchar](10) NULL,
	[Gender] [varchar](50) NOT NULL,
	[StaffType] [varchar](50) NULL,
	[StaffCategory] [varchar](50) NULL,
	[StaffIDNumber] [varchar](50) NOT NULL,
	[PegPayStaffIDNumber] [varchar](50) NOT NULL,
	[ProfilePic] [varchar](50) NULL,
	[ModifiedBy] [varchar](50) NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedOn] [datetime] NULL,
	[CreatedOn] [datetime] NULL,
	[Email] [varchar](50) NULL,
	[PhoneNumber] [varchar](50) NULL,
 CONSTRAINT [PK_StaffMembers] PRIMARY KEY CLUSTERED 
(
	[SchoolCode] ASC,
	[StaffIDNumber] ASC,
	[PegPayStaffIDNumber] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[StaffMembers] ON
INSERT [dbo].[StaffMembers] ([RecordId], [SchoolCode], [FullName], [Gender], [StaffType], [StaffCategory], [StaffIDNumber], [PegPayStaffIDNumber], [ProfilePic], [ModifiedBy], [CreatedBy], [ModifiedOn], [CreatedOn], [Email], [PhoneNumber]) VALUES (1, N'TEST_SCHOOL', N'Test Staff', N'MALE', N'FULL_TIME', N'TEACHING_STAFF', N'12345', N'12345', N'', N'admin', N'admin', CAST(0x0000A835012CAB3A AS DateTime), CAST(0x0000A835012CAB3A AS DateTime), N'nsubugak@yahoo.com', N'0785975800')
SET IDENTITY_INSERT [dbo].[StaffMembers] OFF
/****** Object:  Table [dbo].[Schools]    Script Date: 11/24/2017 18:17:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Schools]') AND type in (N'U'))
BEGIN
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Schools] ON
INSERT [dbo].[Schools] ([RecordId], [SchoolCode], [SchoolName], [SchoolLocation], [SchoolEmail], [SchoolPhone], [UnebCenterNumber], [ApprovedBy], [ModifiedBy], [CreatedBy], [ModifiedOn], [CreatedOn], [ApprovedOn]) VALUES (1, N'', N'TEST SCHOOl', N'pegasus tech', N'nsubugak@yahoo.com', N'0785975800', N'123444', N'', N'admin', N'admin', CAST(0x0000A834011F428F AS DateTime), CAST(0x0000A834011F428F AS DateTime), NULL)
INSERT [dbo].[Schools] ([RecordId], [SchoolCode], [SchoolName], [SchoolLocation], [SchoolEmail], [SchoolPhone], [UnebCenterNumber], [ApprovedBy], [ModifiedBy], [CreatedBy], [ModifiedOn], [CreatedOn], [ApprovedOn]) VALUES (2, N'TEST_SCHOOL', N'TEST SCHOOl', N'pegasus tech', N'nsubugak@yahoo.com', N'0785975800', N'123444', N'', N'admin', N'admin', CAST(0x0000A835012CAAE0 AS DateTime), CAST(0x0000A834011F8750 AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Schools] OFF
/****** Object:  StoredProcedure [dbo].[SaveSystemUser]    Script Date: 11/24/2017 18:17:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SaveSystemUser]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'create proc [dbo].[SaveSystemUser]
@Username varchar(50),
@Password varchar(50),
@UserType varchar(50),
@UserCategory varchar(50),
@SecretKey varchar(50),
@ModifiedBy varchar(50)
as
Begin Transaction trans
Begin try
if exists (select * from SystemUsers where Username=@Username)
Begin
	Update SystemUsers set Password=@Password,UserType=@UserType,UserCategory=@UserCategory
	,ModifiedBy=@ModifiedBy,ModifiedOn=GETDATE() where Username=@Username
End
Else
Begin
   INSERT INTO [dbo].[SystemUsers]
           ([Username]
           ,[Password]
           ,[UserType]
           ,[UserCategory]
           ,[SecretKey]
           ,[CreatedOn]
           ,[ModifiedOn]
           ,[CreatedBy]
           ,[ModifiedBy]
           ,[ApprovedBy])
     VALUES
           (@Username,
			@Password,
			@UserType,
			@UserCategory,
			@SecretKey,
			GETDATE(),
			GETDATE(),
			@ModifiedBy,
			@ModifiedBy,
			@ModifiedBy)
End
Select @Username as InsertedID
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




' 
END
GO
/****** Object:  StoredProcedure [dbo].[SaveSubject]    Script Date: 11/24/2017 18:17:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SaveSubject]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'create proc [dbo].[SaveSubject]
@SchoolCode varchar(50),
@SubjectName varchar(50),
@SubjectCode varchar(50), 
@ModifiedBy varchar(50)
as
Begin Transaction trans
Begin try
if exists (select * from Subjects where SchooolCode=@SchoolCode and SubjectCode=@SubjectCode)
Begin
	Update Subjects set SubjectName=@SubjectName,ModifiedBy=@ModifiedBy,ModifiedOn=GETDATE() 
	where SchooolCode=@SchoolCode and SubjectCode=@SubjectCode
End
Else
Begin
   INSERT INTO [dbo].[Subjects]
           ([SchooolCode]
           ,[SubjectName]
           ,[SubjectCode]
           ,[CreatedBy]
           ,[ModifiedBy]
           ,[CreatedOn]
           ,[ModifiedOn])
     VALUES
           (
           @SchoolCode,
           @SubjectName,
           @SubjectCode,
           @ModifiedBy,
           @ModifiedBy,
           GETDATE(),
           GETDATE()
           )
End
Select @SubjectCode as InsertedID
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




' 
END
GO
/****** Object:  StoredProcedure [dbo].[SaveStudent]    Script Date: 11/24/2017 18:17:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SaveStudent]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
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
		   '''',
		   '''')
		   
		   
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

' 
END
GO
/****** Object:  StoredProcedure [dbo].[SaveSchoolStaff]    Script Date: 11/24/2017 18:17:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SaveSchoolStaff]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'create proc [dbo].[SaveSchoolStaff]
@SchoolCode varchar(50),
@FullName nchar(10),
@Gender varchar(50),
@StaffType varchar(50),
@StaffCategory varchar(50),
@StaffIDNumber varchar(50),
@PegPayStaffIDNumber varchar(50),
@ProfilePic varchar(50),
@ModifiedBy varchar(50),
@Email varchar(50),
@PhoneNumber varchar(50)
as
Begin Transaction trans
Begin try
if exists (select * from StaffMembers where StaffIDNumber=@StaffIDNumber and SchoolCode=@SchoolCode)
Begin
	Update StaffMembers set FullName=@FullName,Gender=@Gender,StaffType=@StaffType,StaffCategory=@StaffCategory,
	ProfilePic=@ProfilePic,ModifiedBy=@ModifiedBy,ModifiedOn=GETDATE(),Email=@Email,PhoneNumber=@PhoneNumber
	 where StaffIDNumber=@StaffIDNumber and SchoolCode=@SchoolCode
End
Else
Begin
   INSERT INTO [SchoolOS].[dbo].[StaffMembers]
           ([SchoolCode]
           ,[FullName]
           ,[Gender]
           ,[StaffType]
           ,[StaffCategory]
           ,[StaffIDNumber]
           ,[PegPayStaffIDNumber]
           ,[ProfilePic]
           ,[ModifiedBy]
           ,[CreatedBy]
           ,[ModifiedOn]
           ,[CreatedOn]
           ,[Email]
           ,[PhoneNumber])
     VALUES
           (@SchoolCode,
           @FullName,
           @Gender,
           @StaffType,
           @StaffCategory,
           @StaffIDNumber,
           @PegPayStaffIDNumber,
           @ProfilePic,
           @ModifiedBy,
           @ModifiedBy,
           GETDATE(),
           GETDATE(),
           @Email,
           @PhoneNumber)
End
Select @StaffIDNumber as InsertedID
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




' 
END
GO
/****** Object:  StoredProcedure [dbo].[SaveSchools]    Script Date: 11/24/2017 18:17:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SaveSchools]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'create proc [dbo].[SaveSchools]
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
            '''',
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




' 
END
GO
/****** Object:  StoredProcedure [dbo].[SaveSchool]    Script Date: 11/24/2017 18:17:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SaveSchool]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'create proc [dbo].[SaveSchool]
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
            '''',
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




' 
END
GO
/****** Object:  StoredProcedure [dbo].[SaveClassStream]    Script Date: 11/24/2017 18:17:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SaveClassStream]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'create proc [dbo].[SaveClassStream]
@SchoolCode varchar(50),
@StreamName varchar(50),
@StreamCode varchar(50), 
@ClassCode varchar(50), 
@ModifiedBy varchar(50)
as
Begin Transaction trans
Begin try
if exists (select * from ClassStreams where SchoolCode=@SchoolCode and StreamCode=@StreamCode and ClassCode=@ClassCode)
Begin
	Update ClassStreams set StreamName=@StreamName,ModifiedBy=@ModifiedBy,ModifiedOn=GETDATE()
	where SchoolCode=@SchoolCode and StreamCode=@StreamCode and ClassCode=@ClassCode
End
Else
Begin
   INSERT INTO [SchoolOS].[dbo].[ClassStreams]
           ([ClassCode]
           ,[StreamName]
           ,[StreamCode]
           ,[SchoolCode]
           ,[ModifiedBy]
           ,[CreatedBy]
           ,[ModifiedOn]
           ,[CreatedOn]
           )
     VALUES
           (@ClassCode,
           @StreamName,
           @StreamCode,
           @SchoolCode,
           @ModifiedBy,
           @ModifiedBy,
           GETDATE(),
           GETDATE())
End
Select @StreamCode as InsertedID
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




' 
END
GO
