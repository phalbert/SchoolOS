USE [master]
GO
/****** Object:  Database [SchoolOS]    Script Date: 12/09/2017 16:54:50 ******/
CREATE DATABASE [SchoolOS] ON  PRIMARY 
( NAME = N'SchoolOS', FILENAME = N'D:\databases\SchoolOS.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SchoolOS_log', FILENAME = N'D:\databases\SchoolOS_log.ldf' , SIZE = 5696KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
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
/****** Object:  Table [dbo].[UserTypes]    Script Date: 12/09/2017 16:54:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserTypes](
	[RecordId] [int] IDENTITY(1,1) NOT NULL,
	[UserTypeName] [varchar](50) NULL,
	[UserTypeCode] [varchar](50) NOT NULL,
	[SchoolCode] [varchar](50) NOT NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedBy] [varchar](50) NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedOn] [datetime] NULL,
 CONSTRAINT [PK_UserTypes] PRIMARY KEY CLUSTERED 
(
	[UserTypeCode] ASC,
	[SchoolCode] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[UserTypes] ON
INSERT [dbo].[UserTypes] ([RecordId], [UserTypeName], [UserTypeCode], [SchoolCode], [CreatedBy], [ModifiedBy], [CreatedOn], [ModifiedOn]) VALUES (2, N'', N'', N'', N'', N'', CAST(0x0000A83A00BC4464 AS DateTime), CAST(0x0000A83A00BC4464 AS DateTime))
INSERT [dbo].[UserTypes] ([RecordId], [UserTypeName], [UserTypeCode], [SchoolCode], [CreatedBy], [ModifiedBy], [CreatedOn], [ModifiedOn]) VALUES (1, N'ADMIN', N'Administrator', N'TEST_SCHOOL', N'', N'', CAST(0x0000A83A00BC4463 AS DateTime), CAST(0x0000A83A00EC3763 AS DateTime))
SET IDENTITY_INSERT [dbo].[UserTypes] OFF
/****** Object:  Table [dbo].[UserPermissions]    Script Date: 12/09/2017 16:54:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserPermissions](
	[RecordId] [int] IDENTITY(1,1) NOT NULL,
	[UserTypeCode] [varchar](50) NOT NULL,
	[MainLinkCode] [varchar](50) NOT NULL,
	[SchoolCode] [varchar](50) NOT NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedBy] [varchar](50) NULL,
	[ModifiedOn] [datetime] NULL,
	[CreatedOn] [datetime] NULL,
 CONSTRAINT [PK_UserPermissions] PRIMARY KEY CLUSTERED 
(
	[UserTypeCode] ASC,
	[MainLinkCode] ASC,
	[SchoolCode] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[UserPermissions] ON
INSERT [dbo].[UserPermissions] ([RecordId], [UserTypeCode], [MainLinkCode], [SchoolCode], [CreatedBy], [ModifiedBy], [ModifiedOn], [CreatedOn]) VALUES (1, N'ADMIN', N'ADMIN', N'TEST_SCHOOL', N'admin', N'admin', CAST(0x0000A83A00EC3766 AS DateTime), CAST(0x0000A83A00EC3766 AS DateTime))
INSERT [dbo].[UserPermissions] ([RecordId], [UserTypeCode], [MainLinkCode], [SchoolCode], [CreatedBy], [ModifiedBy], [ModifiedOn], [CreatedOn]) VALUES (2, N'ADMIN', N'REPORTS', N'TEST_SCHOOL', N'admin', N'admin', CAST(0x0000A83A00EC3766 AS DateTime), CAST(0x0000A83A00EC3766 AS DateTime))
SET IDENTITY_INSERT [dbo].[UserPermissions] OFF
/****** Object:  Table [dbo].[SystemUsers]    Script Date: 12/09/2017 16:54:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SystemUsers](
	[RecordId] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[Password] [varchar](6000) NULL,
	[UserType] [varchar](50) NULL,
	[UserCategory] [varchar](50) NULL,
	[SecretKey] [varchar](50) NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedOn] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedBy] [varchar](50) NULL,
	[ApprovedBy] [varchar](50) NULL,
	[SchoolCode] [varchar](50) NULL,
 CONSTRAINT [PK_SystemUsers] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[SystemUsers] ON
INSERT [dbo].[SystemUsers] ([RecordId], [Username], [Password], [UserType], [UserCategory], [SecretKey], [CreatedOn], [ModifiedOn], [CreatedBy], [ModifiedBy], [ApprovedBy], [SchoolCode]) VALUES (2, N'baka@kcb.co.ug', N'T3rr1613', N'ADMIN', N'ADMIN', N'-636476846178198849', CAST(0x0000A83C00068C62 AS DateTime), CAST(0x0000A83C00070E1E AS DateTime), N'Bakamale', N'Bakamale', N'Bakamale', NULL)
INSERT [dbo].[SystemUsers] ([RecordId], [Username], [Password], [UserType], [UserCategory], [SecretKey], [CreatedOn], [ModifiedOn], [CreatedBy], [ModifiedBy], [ApprovedBy], [SchoolCode]) VALUES (1, N'Nsubugak', N'50b2d34b7a20dbadaa3735c018e9f6c3e6245d6ddd331866ca4aa1f18ba455e2', N'ADMIN', N'ADMIN', N'T3rr16132016', CAST(0x0000A835012CAB1D AS DateTime), CAST(0x0000A83A00EC3761 AS DateTime), N'', N'admin', N'admin', NULL)
SET IDENTITY_INSERT [dbo].[SystemUsers] OFF
/****** Object:  Table [dbo].[SubLinks]    Script Date: 12/09/2017 16:54:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SubLinks](
	[RecordId] [int] IDENTITY(1,1) NOT NULL,
	[SubLinkName] [varchar](50) NULL,
	[SubLinkCode] [varchar](50) NOT NULL,
	[SchoolCode] [varchar](50) NOT NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedBy] [varchar](50) NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedOn] [datetime] NULL,
	[URL] [varchar](5000) NULL,
 CONSTRAINT [PK_SubLinks] PRIMARY KEY CLUSTERED 
(
	[SubLinkCode] ASC,
	[SchoolCode] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[SubLinks] ON
INSERT [dbo].[SubLinks] ([RecordId], [SubLinkName], [SubLinkCode], [SchoolCode], [CreatedBy], [ModifiedBy], [CreatedOn], [ModifiedOn], [URL]) VALUES (4, N'Approve Schools', N'APPROVE_SCHOOL', N'TEST_SCHOOL', N'admin', N'admin', CAST(0x0000A83A00EA4CBB AS DateTime), CAST(0x0000A83A00EC3766 AS DateTime), N'https://google.com')
INSERT [dbo].[SubLinks] ([RecordId], [SubLinkName], [SubLinkCode], [SchoolCode], [CreatedBy], [ModifiedBy], [CreatedOn], [ModifiedOn], [URL]) VALUES (1, N'Create School', N'CREATE_SCHOOL', N'TEST_SCHOOL', N'admin', N'admin', CAST(0x0000A83A00EA4CBB AS DateTime), CAST(0x0000A83A00EC3766 AS DateTime), N'https://google.com')
INSERT [dbo].[SubLinks] ([RecordId], [SubLinkName], [SubLinkCode], [SchoolCode], [CreatedBy], [ModifiedBy], [CreatedOn], [ModifiedOn], [URL]) VALUES (2, N'Create Student', N'CREATE_STUDENT', N'TEST_SCHOOL', N'admin', N'admin', CAST(0x0000A83A00EA4CBB AS DateTime), CAST(0x0000A83A00EC3766 AS DateTime), N'https://google.com')
INSERT [dbo].[SubLinks] ([RecordId], [SubLinkName], [SubLinkCode], [SchoolCode], [CreatedBy], [ModifiedBy], [CreatedOn], [ModifiedOn], [URL]) VALUES (3, N'Create Subject', N'CREATE_SUBJECT', N'TEST_SCHOOL', N'admin', N'admin', CAST(0x0000A83A00EA4CBB AS DateTime), CAST(0x0000A83A00EC3766 AS DateTime), N'https://google.com')
SET IDENTITY_INSERT [dbo].[SubLinks] OFF
/****** Object:  Table [dbo].[Subjects]    Script Date: 12/09/2017 16:54:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
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
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Subjects] ON
INSERT [dbo].[Subjects] ([RecordId], [SchooolCode], [SubjectName], [SubjectCode], [CreatedBy], [ModifiedBy], [CreatedOn], [ModifiedOn]) VALUES (1, N'TEST_SCHOOL', N'Test Subject', N'TEST_SUBJECT', N'admin', N'admin', CAST(0x0000A835012CAB16 AS DateTime), CAST(0x0000A83A00EC3760 AS DateTime))
SET IDENTITY_INSERT [dbo].[Subjects] OFF
/****** Object:  Table [dbo].[StudentFees]    Script Date: 12/09/2017 16:54:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StudentFees](
	[RecordId] [int] IDENTITY(1,1) NOT NULL,
	[StudentID] [varchar](50) NOT NULL,
	[FeeID] [varchar](50) NOT NULL,
	[SchoolCode] [varchar](50) NOT NULL,
	[CreatedOn] [varchar](50) NULL,
	[ModifiedOn] [varchar](50) NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedBy] [varchar](50) NULL,
 CONSTRAINT [PK_StudentFees] PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC,
	[FeeID] ASC,
	[SchoolCode] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[StudentFees] ON
INSERT [dbo].[StudentFees] ([RecordId], [StudentID], [FeeID], [SchoolCode], [CreatedOn], [ModifiedOn], [CreatedBy], [ModifiedBy]) VALUES (2, N'', N'', N'', N'Nov 29 2017 11:25AM', N'Nov 29 2017 11:25AM', N'', N'')
INSERT [dbo].[StudentFees] ([RecordId], [StudentID], [FeeID], [SchoolCode], [CreatedOn], [ModifiedOn], [CreatedBy], [ModifiedBy]) VALUES (1, N'', N'', N'TEST_SCHOOL', N'Nov 29 2017 11:25AM', N'Nov 29 2017 11:25AM', N'', N'')
INSERT [dbo].[StudentFees] ([RecordId], [StudentID], [FeeID], [SchoolCode], [CreatedOn], [ModifiedOn], [CreatedBy], [ModifiedBy]) VALUES (3, N'21000000261', N'1234', N'TEST_SCHOOL', N'Nov 29 2017  2:19PM', N'Nov 29 2017  2:20PM', N'admin', N'admin')
SET IDENTITY_INSERT [dbo].[StudentFees] OFF
/****** Object:  Table [dbo].[Student]    Script Date: 12/09/2017 16:54:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Student] ON
INSERT [dbo].[Student] ([RecordID], [SchoolCode], [StudentNumber], [PegPayStudentNumber], [StudentName], [ClassCode], [StreamCode], [DateOfBirth], [StudentCategory], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ApprovedBy], [ApprovedOn]) VALUES (1, N'TEST_SCHOOL', N'1002', N's1000', N'John', N's3', N'3c', CAST(0xAC230B00 AS Date), N'day', N'Peter', CAST(0x0000A83500E2F133 AS DateTime), N'Peter', CAST(0x0000A83A00EC375D AS DateTime), N'', CAST(0x0000000000000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[Student] OFF
/****** Object:  Table [dbo].[StaffMembers]    Script Date: 12/09/2017 16:54:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
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
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[StaffMembers] ON
INSERT [dbo].[StaffMembers] ([RecordId], [SchoolCode], [FullName], [Gender], [StaffType], [StaffCategory], [StaffIDNumber], [PegPayStaffIDNumber], [ProfilePic], [ModifiedBy], [CreatedBy], [ModifiedOn], [CreatedOn], [Email], [PhoneNumber]) VALUES (1, N'TEST_SCHOOL', N'Test Staff', N'MALE', N'FULL_TIME', N'TEACHING_STAFF', N'12345', N'12345', N'', N'admin', N'admin', CAST(0x0000A83A00EC3763 AS DateTime), CAST(0x0000A835012CAB3A AS DateTime), N'nsubugak@yahoo.com', N'0785975800')
SET IDENTITY_INSERT [dbo].[StaffMembers] OFF
/****** Object:  Table [dbo].[SchoolSemesters]    Script Date: 12/09/2017 16:54:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
	[SchoolCode] ASC,
	[SemesterCode] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[SchoolSemesters] ON
INSERT [dbo].[SchoolSemesters] ([RecordID], [SchoolCode], [SemesterCode], [SchoolStartDate], [SchoolEndDate], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ApprovedBy], [ApprovedOn]) VALUES (1, N'TEST_SCHOOL', N'2017_Term3', CAST(0x613D0B00 AS Date), CAST(0xA63D0B00 AS Date), N'Peter.K', CAST(0x0000A8350138DB75 AS DateTime), N'Peter.K', CAST(0x0000A83A00EC375F AS DateTime), N'', CAST(0x0000000000000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[SchoolSemesters] OFF
/****** Object:  Table [dbo].[Schools]    Script Date: 12/09/2017 16:54:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Schools] ON
INSERT [dbo].[Schools] ([RecordId], [SchoolCode], [SchoolName], [SchoolLocation], [SchoolEmail], [SchoolPhone], [UnebCenterNumber], [ApprovedBy], [ModifiedBy], [CreatedBy], [ModifiedOn], [CreatedOn], [ApprovedOn]) VALUES (1, N'', N'TEST SCHOOl', N'pegasus tech', N'nsubugak@yahoo.com', N'0785975800', N'123444', N'', N'admin', N'admin', CAST(0x0000A834011F428F AS DateTime), CAST(0x0000A834011F428F AS DateTime), NULL)
INSERT [dbo].[Schools] ([RecordId], [SchoolCode], [SchoolName], [SchoolLocation], [SchoolEmail], [SchoolPhone], [UnebCenterNumber], [ApprovedBy], [ModifiedBy], [CreatedBy], [ModifiedOn], [CreatedOn], [ApprovedOn]) VALUES (3, N'KCB', N'Kings College Buddo', N'', N'', N'', N'123444', N'', N'Kings College Buddo', N'Kings College Buddo', CAST(0x0000A83C00070E14 AS DateTime), CAST(0x0000A83C0002406B AS DateTime), NULL)
INSERT [dbo].[Schools] ([RecordId], [SchoolCode], [SchoolName], [SchoolLocation], [SchoolEmail], [SchoolPhone], [UnebCenterNumber], [ApprovedBy], [ModifiedBy], [CreatedBy], [ModifiedOn], [CreatedOn], [ApprovedOn]) VALUES (2, N'TEST_SCHOOL', N'TEST SCHOOl', N'pegasus tech', N'nsubugak@yahoo.com', N'0785975800', N'123444', N'', N'admin', N'admin', CAST(0x0000A83A00EC373C AS DateTime), CAST(0x0000A834011F8750 AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Schools] OFF
/****** Object:  Table [dbo].[SchoolFees]    Script Date: 12/09/2017 16:54:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SchoolFees](
	[RecordId] [int] IDENTITY(1,1) NOT NULL,
	[FeeID] [varchar](50) NOT NULL,
	[FeeName] [varchar](50) NULL,
	[Amount] [money] NULL,
	[CurrencyCode] [varchar](50) NULL,
	[SchoolCode] [varchar](50) NOT NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedBy] [varchar](50) NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedOn] [datetime] NULL,
 CONSTRAINT [PK_SchoolFees] PRIMARY KEY CLUSTERED 
(
	[FeeID] ASC,
	[SchoolCode] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[SchoolFees] ON
INSERT [dbo].[SchoolFees] ([RecordId], [FeeID], [FeeName], [Amount], [CurrencyCode], [SchoolCode], [CreatedBy], [ModifiedBy], [CreatedOn], [ModifiedOn]) VALUES (1, N'1234', N'Tuition Fees', 1000.0000, N'UGX', N'TEST_SCHOOL', N'admin', N'admin', CAST(0x0000A83A00DB7C22 AS DateTime), CAST(0x0000A83A00EC376A AS DateTime))
SET IDENTITY_INSERT [dbo].[SchoolFees] OFF
/****** Object:  Table [dbo].[SchoolClasses]    Script Date: 12/09/2017 16:54:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
	[SchoolCode] ASC,
	[ClassCode] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[SchoolClasses] ON
INSERT [dbo].[SchoolClasses] ([RecordId], [SchoolCode], [ClassCode], [ClassName], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ApprovedBy], [ApprovedOn]) VALUES (1, N'TEST_SCHOOL', N'S4', N'senior Four', N'', CAST(0x0000A83501249F8A AS DateTime), N'Peter', CAST(0x0000A83A00EC375E AS DateTime), N'', CAST(0x0000000000000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[SchoolClasses] OFF
/****** Object:  Table [dbo].[ClassStreams]    Script Date: 12/09/2017 16:54:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
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
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[ClassStreams] ON
INSERT [dbo].[ClassStreams] ([RecordId], [ClassCode], [StreamName], [StreamCode], [SchoolCode], [ModifiedBy], [CreatedBy], [ModifiedOn], [CreatedOn]) VALUES (1, N'TEST_CLASS', N'test stream', N'TEST_STREAM', N'TEST_SCHOOL', N'admin', N'admin', CAST(0x0000A83A00EC3762 AS DateTime), CAST(0x0000A835012C83E9 AS DateTime))
SET IDENTITY_INSERT [dbo].[ClassStreams] OFF
/****** Object:  Table [dbo].[ParentTypes]    Script Date: 12/09/2017 16:54:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ParentTypes](
	[RecordId] [int] IDENTITY(1,1) NOT NULL,
	[ParentTypeName] [varchar](50) NULL,
	[ParentTypeCode] [varchar](50) NOT NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedBy] [varchar](50) NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedOn] [datetime] NULL,
 CONSTRAINT [PK_ParentTypes] PRIMARY KEY CLUSTERED 
(
	[ParentTypeCode] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Parents]    Script Date: 12/09/2017 16:54:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Parents](
	[RecordId] [int] IDENTITY(1,1) NOT NULL,
	[ParentName] [varchar](50) NULL,
	[ParentIDNumber] [varchar](50) NOT NULL,
	[StudentIDNumber] [varchar](50) NULL,
	[SchoolCode] [varchar](50) NOT NULL,
	[ParentType] [varchar](50) NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedBy] [varchar](50) NULL,
	[CreatedOn] [varchar](50) NULL,
	[ModifiedOn] [varchar](50) NULL,
 CONSTRAINT [PK_Parents] PRIMARY KEY CLUSTERED 
(
	[ParentIDNumber] ASC,
	[SchoolCode] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MenuItems]    Script Date: 12/09/2017 16:54:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MenuItems](
	[RecordId] [int] IDENTITY(1,1) NOT NULL,
	[MainLinkCode] [varchar](50) NOT NULL,
	[SubLinkCode] [varchar](50) NOT NULL,
	[SchoolCode] [varchar](50) NOT NULL,
	[ModifiedBy] [varchar](50) NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedOn] [datetime] NULL,
	[CreatedOn] [datetime] NULL,
 CONSTRAINT [PK_MenuItems] PRIMARY KEY CLUSTERED 
(
	[MainLinkCode] ASC,
	[SubLinkCode] ASC,
	[SchoolCode] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[MenuItems] ON
INSERT [dbo].[MenuItems] ([RecordId], [MainLinkCode], [SubLinkCode], [SchoolCode], [ModifiedBy], [CreatedBy], [ModifiedOn], [CreatedOn]) VALUES (1, N'ADMIN', N'CREATE_SCHOOL', N'TEST_SCHOOL', N'admin', N'admin', CAST(0x0000A83A00EC3766 AS DateTime), CAST(0x0000A83A00EC3766 AS DateTime))
INSERT [dbo].[MenuItems] ([RecordId], [MainLinkCode], [SubLinkCode], [SchoolCode], [ModifiedBy], [CreatedBy], [ModifiedOn], [CreatedOn]) VALUES (2, N'ADMIN', N'CREATE_STUDENT', N'TEST_SCHOOL', N'admin', N'admin', CAST(0x0000A83A00EC3766 AS DateTime), CAST(0x0000A83A00EC3766 AS DateTime))
INSERT [dbo].[MenuItems] ([RecordId], [MainLinkCode], [SubLinkCode], [SchoolCode], [ModifiedBy], [CreatedBy], [ModifiedOn], [CreatedOn]) VALUES (3, N'ADMIN', N'CREATE_SUBJECT', N'TEST_SCHOOL', N'admin', N'admin', CAST(0x0000A83A00EC3766 AS DateTime), CAST(0x0000A83A00EC3766 AS DateTime))
INSERT [dbo].[MenuItems] ([RecordId], [MainLinkCode], [SubLinkCode], [SchoolCode], [ModifiedBy], [CreatedBy], [ModifiedOn], [CreatedOn]) VALUES (4, N'REPORTS', N'APPROVE_SCHOOL', N'TEST_SCHOOL', N'admin', N'admin', CAST(0x0000A83A00EC3766 AS DateTime), CAST(0x0000A83A00EC3766 AS DateTime))
SET IDENTITY_INSERT [dbo].[MenuItems] OFF
/****** Object:  Table [dbo].[MainLinks]    Script Date: 12/09/2017 16:54:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MainLinks](
	[RecordId] [int] IDENTITY(1,1) NOT NULL,
	[MainLinkName] [varchar](50) NULL,
	[MainLinkCode] [varchar](50) NULL,
	[SchoolCode] [varchar](50) NULL,
	[CreatedBy] [varchar](50) NULL,
	[ModifiedBy] [varchar](50) NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedOn] [datetime] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[MainLinks] ON
INSERT [dbo].[MainLinks] ([RecordId], [MainLinkName], [MainLinkCode], [SchoolCode], [CreatedBy], [ModifiedBy], [CreatedOn], [ModifiedOn]) VALUES (1, N'System Admin Tasks', N'ADMIN', N'TEST_SCHOOL', N'', N'', CAST(0x0000A83A00BC448C AS DateTime), CAST(0x0000A83A00EC3764 AS DateTime))
INSERT [dbo].[MainLinks] ([RecordId], [MainLinkName], [MainLinkCode], [SchoolCode], [CreatedBy], [ModifiedBy], [CreatedOn], [ModifiedOn]) VALUES (3, N'View Reports', N'REPORTS', N'TEST_SCHOOL', N'', N'', CAST(0x0000A83A00BC448C AS DateTime), CAST(0x0000A83A00EC3764 AS DateTime))
SET IDENTITY_INSERT [dbo].[MainLinks] OFF
/****** Object:  StoredProcedure [dbo].[GetUserMenuItems]    Script Date: 12/09/2017 16:54:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetUserMenuItems]
@UserType varchar(50),
@UserCategory varchar(50)
as
Select A.MainLinkCode,MainLinkName,C.SubLinkCode, SubLinkName,URL,A.SchoolCode,A.UserTypeCode from UserPermissions A
inner join MenuItems B on A.MainLinkCode=B.MainLinkCode
inner join MainLinks D on D.MainLinkCode=B.MainLinkCode
inner join SubLinks C on C.SubLinkCode=B.SubLinkCode
where A.UserTypeCode=@UserType
GO
/****** Object:  StoredProcedure [dbo].[GetSystemUserById]    Script Date: 12/09/2017 16:54:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetSystemUserById]
@UserId varchar(50)
as
Select * from SystemUsers where Username=@UserId
GO
/****** Object:  StoredProcedure [dbo].[SaveUserType]    Script Date: 12/09/2017 16:54:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SaveUserType]
@SchoolCode varchar(50),
@SubjectName varchar(50),
@SubjectCode varchar(50), 
@ModifiedBy varchar(50)
as
Begin Transaction trans
Begin try
if exists (select * from UserTypes where SchoolCode=@SchoolCode and UserTypeCode=@SubjectCode)
Begin
	Update UserTypes set UserTypeName=@SubjectName,ModifiedBy=@ModifiedBy,ModifiedOn=GETDATE() 
	where SchoolCode=@SchoolCode and UserTypeCode=@SubjectCode
End
Else
Begin
   INSERT INTO [dbo].UserTypes
           (SchoolCode
           ,UserTypeName
           ,UserTypeCode
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
GO
/****** Object:  StoredProcedure [dbo].[SaveUserPermission]    Script Date: 12/09/2017 16:54:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SaveUserPermission]
@UserTypeCode varchar(50),
@MainLinkCode varchar(50),
@SchoolCode varchar(50),
@ModifiedBy varchar(50)
as
Begin Transaction trans
Begin try
if exists (select * from UserPermissions where SchoolCode=@SchoolCode and UserTypeCode=@UserTypeCode and MainLinkCode=@MainLinkCode)
Begin
	Update UserPermissions set ModifiedBy=@ModifiedBy,ModifiedOn=GETDATE() 
	where SchoolCode=@SchoolCode and UserTypeCode=@UserTypeCode and MainLinkCode=@MainLinkCode
End
Else
Begin
   INSERT INTO [dbo].[UserPermissions]
           ([UserTypeCode]
           ,[MainLinkCode]
           ,[SchoolCode]
           ,[CreatedBy]
           ,[ModifiedBy]
           ,[ModifiedOn]
           ,[CreatedOn])
     VALUES
           (@UserTypeCode
           ,@MainLinkCode
           ,@SchoolCode
           ,@ModifiedBy
           ,@ModifiedBy
           ,GETDATE()
           ,GETDATE())
End
Select @@IDENTITY as InsertedID
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
/****** Object:  StoredProcedure [dbo].[SaveSystemUser]    Script Date: 12/09/2017 16:54:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SaveSystemUser]
@Username varchar(50),
@Password varchar(6000),
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
GO
/****** Object:  StoredProcedure [dbo].[SaveSubLink]    Script Date: 12/09/2017 16:54:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SaveSubLink]
@SchoolCode varchar(50),
@SubjectName varchar(50),
@SubjectCode varchar(50), 
@ModifiedBy varchar(50),
@Url varchar(50)
as
Begin Transaction trans
Begin try
if exists (select * from SubLinks where SchoolCode=@SchoolCode and SubLinkCode=@SubjectCode)
Begin
	Update SubLinks set SubLinkName=@SubjectName,URL=@Url,ModifiedBy=@ModifiedBy,ModifiedOn=GETDATE() 
	where SchoolCode=@SchoolCode and SubLinkCode=@SubjectCode
End
Else
Begin
   INSERT INTO [dbo].SubLinks
           (SchoolCode
           ,SubLinkName
           ,SubLinkCode
           ,[CreatedBy]
           ,[ModifiedBy]
           ,[CreatedOn]
           ,[ModifiedOn]
           ,URL)
     VALUES
           (
           @SchoolCode,
           @SubjectName,
           @SubjectCode,
           @ModifiedBy,
           @ModifiedBy,
           GETDATE(),
           GETDATE(),
           @Url
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
GO
/****** Object:  StoredProcedure [dbo].[SaveSubject]    Script Date: 12/09/2017 16:54:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SaveSubject]
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
GO
/****** Object:  StoredProcedure [dbo].[SaveStudentFees]    Script Date: 12/09/2017 16:54:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SaveStudentFees]
@StudentID varchar(50),
@FeeID varchar(50),
@SchoolCode varchar(50),
@ModifiedBy varchar(50)
as
Begin Transaction trans
Begin try
if exists (select * from StudentFees where SchoolCode=@SchoolCode and FeeID=@FeeID and StudentID=@StudentID)
Begin
	Update StudentFees set ModifiedBy=@ModifiedBy,ModifiedOn=GETDATE() 
	where SchoolCode=@SchoolCode and FeeID=@FeeID and StudentID=@StudentID
End
Else
Begin
   INSERT INTO [dbo].[StudentFees]
           ([StudentID]
           ,[FeeID]
           ,[SchoolCode]
           ,[CreatedOn]
           ,[ModifiedOn]
           ,[CreatedBy]
           ,[ModifiedBy])
     VALUES
           (@StudentID,
            @FeeID,
            @SchoolCode,
            GETDATE(),
            GETDATE(),
            @ModifiedBy,
            @ModifiedBy)
End
Select @FeeID as InsertedID
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
/****** Object:  StoredProcedure [dbo].[SaveStudent]    Script Date: 12/09/2017 16:54:57 ******/
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
/****** Object:  StoredProcedure [dbo].[SaveSchoolStaff]    Script Date: 12/09/2017 16:54:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SaveSchoolStaff]
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
GO
/****** Object:  StoredProcedure [dbo].[SaveSchoolSemester]    Script Date: 12/09/2017 16:54:57 ******/
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
/****** Object:  StoredProcedure [dbo].[SaveSchoolFees]    Script Date: 12/09/2017 16:54:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SaveSchoolFees]
@FeeID varchar(50),
@FeeName varchar(50),
@Amount money,
@CurrencyCode varchar(50),
@SchoolCode varchar(50),
@ModifiedBy varchar(50)
as
Begin Transaction trans
Begin try
if exists (select * from SchoolFees where SchoolCode=@SchoolCode and FeeID=@FeeID)
Begin
	Update SchoolFees set FeeName=@FeeName,Amount=@Amount,CurrencyCode=@CurrencyCode,SchoolCode=@SchoolCode
	,ModifiedBy=@ModifiedBy,ModifiedOn=GETDATE() 
	where SchoolCode=@SchoolCode and FeeID=@FeeID
End
Else
Begin
   INSERT INTO [dbo].[SchoolFees]
           ([FeeID]
           ,[FeeName]
           ,[Amount]
           ,[CurrencyCode]
           ,[SchoolCode]
           ,[CreatedBy]
           ,[ModifiedBy]
           ,[CreatedOn]
           ,[ModifiedOn])
     VALUES
           (@FeeID,
            @FeeName,
            @Amount,
            @CurrencyCode,
            @SchoolCode,
            @ModifiedBy,
            @ModifiedBy,
            GETDATE(),
            GETDATE())
End
Select @FeeID as InsertedID
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
/****** Object:  StoredProcedure [dbo].[saveschoolclass]    Script Date: 12/09/2017 16:54:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[saveschoolclass] 
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
Select @ClassCode as InsertedID
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
/****** Object:  StoredProcedure [dbo].[SaveSchool]    Script Date: 12/09/2017 16:54:57 ******/
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
/****** Object:  StoredProcedure [dbo].[SaveParent]    Script Date: 12/09/2017 16:54:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SaveParent]
@ParentName varchar(50),
@ParentIDNumber varchar(50),
@StudentIDNumber varchar(50),
@SchoolCode varchar(50),
@ParentType varchar(50),
@ModifiedBy varchar(50)
as
Begin Transaction trans
Begin try
if exists (select * from Parents where SchoolCode=@SchoolCode and ParentIDNumber=@ParentIDNumber)
Begin
	Update Parents set ParentName=@ParentName,StudentIDNumber=@StudentIDNumber,ParentType=@ParentType,ModifiedBy=@ModifiedBy,ModifiedOn=GETDATE() 
	where SchoolCode=@SchoolCode and SchoolCode=@SchoolCode and ParentIDNumber=@ParentIDNumber
End
Else
Begin
   INSERT INTO [dbo].[Parents]
           (
			[ParentName]
           ,[ParentIDNumber]
           ,[StudentIDNumber]
           ,[SchoolCode]
           ,[ParentType]
           ,[CreatedBy]
           ,[ModifiedBy]
           ,[CreatedOn]
           ,[ModifiedOn])
     VALUES
           (@ParentName,
            @ParentIDNumber,
            @StudentIDNumber,
            @SchoolCode,
            @ParentType,
            @ModifiedBy,
            @ModifiedBy,
            GETDATE(),
            GETDATE())
End
Select @ParentIDNumber as InsertedID
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
/****** Object:  StoredProcedure [dbo].[SaveMenuItem]    Script Date: 12/09/2017 16:54:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SaveMenuItem]
@SchoolCode varchar(50),
@SubjectName varchar(50),
@MainLinkCode varchar(50), 
@ModifiedBy varchar(50),
@SubLinkCode varchar(50)
as
Begin Transaction trans
Begin try
if exists (select * from MenuItems where SchoolCode=@SchoolCode and MainLinkCode=@MainLinkCode and SubLinkCode=@SubLinkCode)
Begin
	Update MenuItems set ModifiedBy=@ModifiedBy,ModifiedOn=GETDATE() 
	where SchoolCode=@SchoolCode and MainLinkCode=@MainLinkCode and SubLinkCode=@SubLinkCode
End
Else
Begin
   INSERT INTO [dbo].MenuItems
           (
           SubLinkCode
           ,MainLinkCode
           ,[CreatedBy]
           ,[ModifiedBy]
           ,[CreatedOn]
           ,[ModifiedOn]
           ,SchoolCode)
     VALUES
           (
           @SubLinkCode,
           @MainLinkCode,
           @ModifiedBy,
           @ModifiedBy,
           GETDATE(),
           GETDATE(),
           @SchoolCode
           )
End
Select @@IDENTITY as InsertedID
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
/****** Object:  StoredProcedure [dbo].[SaveMainLink]    Script Date: 12/09/2017 16:54:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SaveMainLink]
@SchoolCode varchar(50),
@SubjectName varchar(50),
@SubjectCode varchar(50), 
@ModifiedBy varchar(50)
as
Begin Transaction trans
Begin try
if exists (select * from MainLinks where SchoolCode=@SchoolCode and MainLinkCode=@SubjectCode)
Begin
	Update MainLinks set MainLinkName=@SubjectName,ModifiedBy=@ModifiedBy,ModifiedOn=GETDATE() 
	where SchoolCode=@SchoolCode and MainLinkCode=@SubjectCode
End
Else
Begin
   INSERT INTO [dbo].MainLinks
           (SchoolCode
           ,MainLinkName
           ,MainLinkCode
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
GO
/****** Object:  StoredProcedure [dbo].[SaveClassStream]    Script Date: 12/09/2017 16:54:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SaveClassStream]
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
GO
