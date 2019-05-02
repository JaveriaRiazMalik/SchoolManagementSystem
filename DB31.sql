USE [DB31]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 5/2/2019 2:20:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 5/2/2019 2:20:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 5/2/2019 2:20:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 5/2/2019 2:20:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 5/2/2019 2:20:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 5/2/2019 2:20:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 5/2/2019 2:20:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Class]    Script Date: 5/2/2019 2:20:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Class](
	[ClassID] [int] IDENTITY(1,1) NOT NULL,
	[SubjectID] [int] NOT NULL,
	[TeacherID] [int] NOT NULL,
	[ClassName] [nvarchar](50) NOT NULL,
	[SectionID] [int] NOT NULL,
 CONSTRAINT [PK_Class] PRIMARY KEY CLUSTERED 
(
	[ClassID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ClassAttendance]    Script Date: 5/2/2019 2:20:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClassAttendance](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AttendanceDate] [datetime] NOT NULL,
 CONSTRAINT [PK_ClassAttendance] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ClassHomework]    Script Date: 5/2/2019 2:20:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClassHomework](
	[HomeworkID] [int] IDENTITY(1,1) NOT NULL,
	[ClassID] [int] NOT NULL,
	[AssignedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_ClassHomework] PRIMARY KEY CLUSTERED 
(
	[HomeworkID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Datesheet]    Script Date: 5/2/2019 2:20:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Datesheet](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClassID] [int] NOT NULL,
	[SectionID] [int] NOT NULL,
	[SubjectID] [int] NOT NULL,
	[Day] [nvarchar](50) NOT NULL,
	[Duration] [datetime] NOT NULL,
 CONSTRAINT [PK_Timetable] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FeeChallan]    Script Date: 5/2/2019 2:20:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FeeChallan](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IssueDate] [datetime] NOT NULL,
	[ClassID] [int] NOT NULL,
	[Fee] [int] NULL,
	[DueDate] [datetime] NULL,
 CONSTRAINT [PK_FeeChallan] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Payroll]    Script Date: 5/2/2019 2:20:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payroll](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TeacherID] [int] NOT NULL,
	[Pay] [int] NULL,
	[Designation] [nvarchar](20) NULL,
 CONSTRAINT [PK_Payroll] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Report]    Script Date: 5/2/2019 2:20:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Report](
	[ReportID] [int] IDENTITY(1,1) NOT NULL,
	[StudentID] [int] NOT NULL,
	[SubjectID] [int] NOT NULL,
	[TotalMarks] [int] NULL,
	[ObtainedMarks] [int] NULL,
 CONSTRAINT [PK_Report] PRIMARY KEY CLUSTERED 
(
	[ReportID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Request]    Script Date: 5/2/2019 2:20:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Request](
	[RequestID] [int] IDENTITY(1,1) NOT NULL,
	[TeacherID] [int] NULL,
	[StudentID] [int] NULL,
 CONSTRAINT [PK_Request] PRIMARY KEY CLUSTERED 
(
	[RequestID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Section]    Script Date: 5/2/2019 2:20:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Section](
	[SectionID] [int] IDENTITY(1,1) NOT NULL,
	[SectionName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Section] PRIMARY KEY CLUSTERED 
(
	[SectionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Student]    Script Date: 5/2/2019 2:20:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[StudentID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NULL,
	[Gender] [nvarchar](10) NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[Guardian] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[RegistrationNo] [nvarchar](20) NOT NULL,
	[Contact] [nvarchar](50) NULL,
	[Email] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StudentAttendance]    Script Date: 5/2/2019 2:20:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StudentAttendance](
	[AttendanceID] [int] NOT NULL,
	[StudentID] [int] NOT NULL,
	[AttendanceStatus] [varchar](50) NOT NULL,
 CONSTRAINT [PK_StudentAttendance_1] PRIMARY KEY CLUSTERED 
(
	[AttendanceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StudentChallan]    Script Date: 5/2/2019 2:20:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentChallan](
	[ChallanID] [int] NOT NULL,
	[StudentID] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_StudentChallan] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StudentClass]    Script Date: 5/2/2019 2:20:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentClass](
	[StudentID] [int] NOT NULL,
	[ClassID] [int] NOT NULL,
	[SectionID] [int] NOT NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_StudentClass_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StudentHomework]    Script Date: 5/2/2019 2:20:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentHomework](
	[HomeworkID] [int] NOT NULL,
	[StudentID] [int] NOT NULL,
	[Grade] [nvarchar](10) NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_StudentHomework_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Subject]    Script Date: 5/2/2019 2:20:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subject](
	[SubjectID] [int] IDENTITY(1,1) NOT NULL,
	[SubjectName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Subject] PRIMARY KEY CLUSTERED 
(
	[SubjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SubmitHomework]    Script Date: 5/2/2019 2:20:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubmitHomework](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StudentID] [int] NULL,
	[HomeworkID] [int] NULL,
	[HomeworkContent] [nvarchar](50) NULL,
 CONSTRAINT [PK_SubmitHomework] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Teacher]    Script Date: 5/2/2019 2:20:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teacher](
	[TeacherID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Contact] [nvarchar](50) NULL,
	[Gender] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_Teacher] PRIMARY KEY CLUSTERED 
(
	[TeacherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TeacherAttendance]    Script Date: 5/2/2019 2:20:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TeacherAttendance](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TeacherID] [int] NOT NULL,
	[AttendanceDate] [datetime] NOT NULL,
	[AttendanceStatus] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TeacherAttendance] PRIMARY KEY CLUSTERED 
(
	[Id] ASC,
	[TeacherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Timetable]    Script Date: 5/2/2019 2:20:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Timetable](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClassID] [int] NOT NULL,
	[SectionID] [int] NOT NULL,
	[Lec1] [nvarchar](50) NULL,
	[Lec2] [nvarchar](50) NULL,
	[Lec3] [nvarchar](50) NULL,
	[Lec4] [nvarchar](50) NULL,
	[Lec5] [nvarchar](50) NULL,
	[Lec6] [nvarchar](50) NULL,
	[Lec7] [nvarchar](50) NULL,
	[Lec8] [nvarchar](50) NULL,
	[Day] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Timetable_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Admin] ON 

INSERT [dbo].[Admin] ([Id], [Password], [Email]) VALUES (1, N'Javeria-123', N'javeria123@gmail.com')
SET IDENTITY_INSERT [dbo].[Admin] OFF
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'0bc8a5e7-df6f-4d69-919b-7d175d2aeaed', N'aleena@gmail.com', 0, N'ALzvEJ79mB26dzR2kgmOrkaig7eLSw/N47gt5SbebRYpsqgfbPHVwJWwKSx0zA5jiQ==', N'5f31f8f4-3cc2-4ec3-ae8b-a7a99c384a3c', NULL, 0, 0, NULL, 1, 0, N'aleena@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'1174c5bd-3682-43a6-88cb-2ec2dfad54e9', N'javeria123@gmail.com', 0, N'ACBc7KQyJn65Scxj6XM8n6dx9Gwifu3ykGc9nMibDHrKhL06kb2AzBdosd8EW57xug==', N'14722f51-7f5d-4c43-a594-322c167bc879', NULL, 0, 0, NULL, 1, 0, N'javeria123@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'1dc418f3-8a25-4cda-b03f-524df7a39aab', N'khadijazahoor772@gmail.com', 0, N'AHXBovu8KTnC/Qykx9IuktzVOGFhu1JbI1vu7WgoKsBDWxkoUot8UuPzbJiukXVf0g==', N'a38ff0f3-649f-4bf8-a8ab-78cbbe34a818', NULL, 0, 0, NULL, 1, 0, N'khadijazahoor772@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'228fd46f-c72f-48b6-90c6-747f232a8502', N'diju@gmail.com', 0, N'AEIE6seOUABlLg2R42RI4doqWJSms0mXREkeaMeZBQcxqTNFX96Ztq2/XG2QMcmIFA==', N'f91869f3-a57d-4415-866e-7868b44ecb9b', NULL, 0, 0, NULL, 1, 0, N'diju@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'4a18a4ad-7fa3-452e-8260-7345ffc344b9', N'khadijazahoor77@gmail.com', 0, N'ABJshvbg5rpt+/G9vTp/tUjPJuTuU5F/P3ypm1vhDBIdFBHDT9zxnd0MUYIdFjKxww==', N'ff3e607c-63ac-4751-8d1a-62a9d2e2a47e', NULL, 0, 0, NULL, 1, 0, N'khadijazahoor77@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'7ab705fa-77aa-4372-82d5-e2d79db52499', N'rahma@gmail.com', 0, N'AJJLknWf9wH2qMaTP5lihE/Fnpb6MTuZIIq9g0MPg/BjVuMAVc30kj4FGOYlCLBidw==', N'a67d2c71-e3d0-46ee-9907-7a8cd687cfe2', NULL, 0, 0, NULL, 1, 0, N'rahma@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'8a18f3da-065b-4bad-9047-022fad59133e', N'javeriariazmalik2@gmail.com', 0, N'AEG16mCrdOSw43+So9n55bRdvKbBmC8zOoBWSjyPzORSuHAUEaK2aY0TSrVt/NvOvA==', N'7aa49faa-9ffc-49b2-8ca5-8e12e3431c91', NULL, 0, 0, NULL, 1, 0, N'javeriariazmalik2@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'9ed5714e-7bf9-4617-97a1-376f82925264', N'javeriariazmalik3@gmail.com', 0, N'AAt2RKmLeiONP2twnzqQdimF4y4V08et+RC1xjNclE+QEFGFxu3C09Qc72/SphHbbw==', N'65fc7b90-8ba7-4b04-bbc7-490731a3a7fe', NULL, 0, 0, NULL, 1, 0, N'javeriariazmalik3@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'ad6cb34e-aa1d-4e58-96d2-f4d9ce839622', N'javeriariazmalik@gmail.com', 0, N'AMD2dQLU23U15LP3nAiHx9N2/J/6FahH31Z6vM2g6qMz2HgaE5cmpe4Cb/lkc6f4Zg==', N'7240fd89-8841-4050-b698-99731e82498a', NULL, 0, 0, NULL, 1, 0, N'javeriariazmalik@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'b509af01-f2fb-45ad-af89-a2d457d16869', N'javeriariazmalik1@gmail.com', 0, N'AABTpznQStOqh7mIoyYTyZVNlhl8sXQa2JtyPMIW/qvxfs/XWr3XW4N+q+u79dSwpA==', N'ba9dafb1-b33a-4a1c-a079-156aeffd84dd', NULL, 0, 0, NULL, 1, 0, N'javeriariazmalik1@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'caee59f7-defd-45a1-800a-bb0eb3c34ffd', N'haider@gmail.com', 0, N'AD49FRgKapMPtQ+PHA85Uvn+/PZECpZvm3p8e3If5nKMBmsAcWJeq1KDYTuK3Cq9Xg==', N'29a336c3-cf69-4b0d-84e9-ab061ee0629d', NULL, 0, 0, NULL, 1, 0, N'haider@gmail.com')
SET IDENTITY_INSERT [dbo].[Class] ON 

INSERT [dbo].[Class] ([ClassID], [SubjectID], [TeacherID], [ClassName], [SectionID]) VALUES (6, 1, 1, N'Class 2', 1)
INSERT [dbo].[Class] ([ClassID], [SubjectID], [TeacherID], [ClassName], [SectionID]) VALUES (8, 4, 1, N'Class 2', 2)
INSERT [dbo].[Class] ([ClassID], [SubjectID], [TeacherID], [ClassName], [SectionID]) VALUES (9, 6, 2, N'Class 3', 2)
INSERT [dbo].[Class] ([ClassID], [SubjectID], [TeacherID], [ClassName], [SectionID]) VALUES (10, 1, 1, N'Class 5', 1)
INSERT [dbo].[Class] ([ClassID], [SubjectID], [TeacherID], [ClassName], [SectionID]) VALUES (11, 7, 1, N'Class 6', 1)
INSERT [dbo].[Class] ([ClassID], [SubjectID], [TeacherID], [ClassName], [SectionID]) VALUES (12, 9, 1, N'Class 6', 1)
SET IDENTITY_INSERT [dbo].[Class] OFF
SET IDENTITY_INSERT [dbo].[Datesheet] ON 

INSERT [dbo].[Datesheet] ([Id], [ClassID], [SectionID], [SubjectID], [Day], [Duration]) VALUES (7, 6, 2, 6, N'Monday', CAST(N'2019-04-30 00:08:49.867' AS DateTime))
INSERT [dbo].[Datesheet] ([Id], [ClassID], [SectionID], [SubjectID], [Day], [Duration]) VALUES (8, 6, 2, 4, N'Tuesday', CAST(N'2019-04-30 00:11:23.540' AS DateTime))
INSERT [dbo].[Datesheet] ([Id], [ClassID], [SectionID], [SubjectID], [Day], [Duration]) VALUES (9, 6, 2, 8, N'Wednesday', CAST(N'2019-04-30 00:12:35.963' AS DateTime))
INSERT [dbo].[Datesheet] ([Id], [ClassID], [SectionID], [SubjectID], [Day], [Duration]) VALUES (10, 6, 3, 6, N'Thursday', CAST(N'2019-04-30 00:12:55.823' AS DateTime))
INSERT [dbo].[Datesheet] ([Id], [ClassID], [SectionID], [SubjectID], [Day], [Duration]) VALUES (12, 6, 2, 3, N'Thursday', CAST(N'2019-05-01 00:24:55.900' AS DateTime))
INSERT [dbo].[Datesheet] ([Id], [ClassID], [SectionID], [SubjectID], [Day], [Duration]) VALUES (13, 8, 1, 7, N'Monday', CAST(N'2019-04-30 00:00:00.000' AS DateTime))
INSERT [dbo].[Datesheet] ([Id], [ClassID], [SectionID], [SubjectID], [Day], [Duration]) VALUES (15, 6, 2, 6, N'Friday', CAST(N'2020-04-30 00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Datesheet] OFF
SET IDENTITY_INSERT [dbo].[FeeChallan] ON 

INSERT [dbo].[FeeChallan] ([Id], [IssueDate], [ClassID], [Fee], [DueDate]) VALUES (3, CAST(N'2019-05-02 00:58:04.327' AS DateTime), 6, 2999, NULL)
INSERT [dbo].[FeeChallan] ([Id], [IssueDate], [ClassID], [Fee], [DueDate]) VALUES (4, CAST(N'2019-04-30 23:30:02.677' AS DateTime), 6, 7000, NULL)
SET IDENTITY_INSERT [dbo].[FeeChallan] OFF
SET IDENTITY_INSERT [dbo].[Payroll] ON 

INSERT [dbo].[Payroll] ([Id], [TeacherID], [Pay], [Designation]) VALUES (1, 2, 1000, N'Associate Professor')
INSERT [dbo].[Payroll] ([Id], [TeacherID], [Pay], [Designation]) VALUES (2, 2, 6000, N'Associate Professor')
INSERT [dbo].[Payroll] ([Id], [TeacherID], [Pay], [Designation]) VALUES (3, 2, 8888, N'Associate Professor')
INSERT [dbo].[Payroll] ([Id], [TeacherID], [Pay], [Designation]) VALUES (4, 1, 6000, N'Associate Professor')
INSERT [dbo].[Payroll] ([Id], [TeacherID], [Pay], [Designation]) VALUES (5, 2, 5000, N'Associate Professor')
SET IDENTITY_INSERT [dbo].[Payroll] OFF
SET IDENTITY_INSERT [dbo].[Section] ON 

INSERT [dbo].[Section] ([SectionID], [SectionName]) VALUES (1, N'Section B')
INSERT [dbo].[Section] ([SectionID], [SectionName]) VALUES (2, N'Section C')
INSERT [dbo].[Section] ([SectionID], [SectionName]) VALUES (3, N'Section C')
SET IDENTITY_INSERT [dbo].[Section] OFF
SET IDENTITY_INSERT [dbo].[Student] ON 

INSERT [dbo].[Student] ([StudentID], [FirstName], [LastName], [Gender], [Address], [Guardian], [Password], [RegistrationNo], [Contact], [Email]) VALUES (1, N'javeria', N'riaz', N'F', N'lahore', N'riaz', N'Javeria-1', N'2016-cs-251', N'252552', N'javeriariazmalik3@gmail.com')
INSERT [dbo].[Student] ([StudentID], [FirstName], [LastName], [Gender], [Address], [Guardian], [Password], [RegistrationNo], [Contact], [Email]) VALUES (2, N'javeria', N'riaz', N'Female', N'lahore', N'riaz', N'Dija-1', N'2016-cs-251', N'252552', N'diju@gmail.com')
INSERT [dbo].[Student] ([StudentID], [FirstName], [LastName], [Gender], [Address], [Guardian], [Password], [RegistrationNo], [Contact], [Email]) VALUES (3, N'Haider', N'Ahmad', N'Male', N'lahore', N'riaz', N'Haider-1', N'2016-cs-266', N'252552', N'haider@gmail.com')
SET IDENTITY_INSERT [dbo].[Student] OFF
SET IDENTITY_INSERT [dbo].[StudentClass] ON 

INSERT [dbo].[StudentClass] ([StudentID], [ClassID], [SectionID], [Id]) VALUES (2, 6, 3, 1)
INSERT [dbo].[StudentClass] ([StudentID], [ClassID], [SectionID], [Id]) VALUES (3, 8, 2, 2)
INSERT [dbo].[StudentClass] ([StudentID], [ClassID], [SectionID], [Id]) VALUES (3, 8, 2, 3)
SET IDENTITY_INSERT [dbo].[StudentClass] OFF
SET IDENTITY_INSERT [dbo].[Subject] ON 

INSERT [dbo].[Subject] ([SubjectID], [SubjectName]) VALUES (1, N'Physics')
INSERT [dbo].[Subject] ([SubjectID], [SubjectName]) VALUES (2, N'Chemistry')
INSERT [dbo].[Subject] ([SubjectID], [SubjectName]) VALUES (3, N'Biology')
INSERT [dbo].[Subject] ([SubjectID], [SubjectName]) VALUES (4, N'Science')
INSERT [dbo].[Subject] ([SubjectID], [SubjectName]) VALUES (5, N'Maths')
INSERT [dbo].[Subject] ([SubjectID], [SubjectName]) VALUES (6, N'Urdu')
INSERT [dbo].[Subject] ([SubjectID], [SubjectName]) VALUES (7, N'Urdu')
INSERT [dbo].[Subject] ([SubjectID], [SubjectName]) VALUES (8, N'Islamiat')
INSERT [dbo].[Subject] ([SubjectID], [SubjectName]) VALUES (9, N'Pak Studies')
INSERT [dbo].[Subject] ([SubjectID], [SubjectName]) VALUES (10, N'Social Studies')
SET IDENTITY_INSERT [dbo].[Subject] OFF
SET IDENTITY_INSERT [dbo].[Teacher] ON 

INSERT [dbo].[Teacher] ([TeacherID], [FirstName], [LastName], [Address], [Password], [Contact], [Gender], [Email]) VALUES (1, N'javeria', N'riaz', N'lahore', N'Khadija-1', N'252552', N'F', N'khadijazahoor772@gmail.com')
INSERT [dbo].[Teacher] ([TeacherID], [FirstName], [LastName], [Address], [Password], [Contact], [Gender], [Email]) VALUES (2, N'Rahma', N'Tahir', N'lahore', N'Rahma-1', N'252552', N'F', N'rahma@gmail.com')
INSERT [dbo].[Teacher] ([TeacherID], [FirstName], [LastName], [Address], [Password], [Contact], [Gender], [Email]) VALUES (3, N'Aleena', N'Riaz', N'lahore', N'Aleena-1', N'252552', N'Female', N'aleena@gmail.com')
SET IDENTITY_INSERT [dbo].[Teacher] OFF
SET IDENTITY_INSERT [dbo].[Timetable] ON 

INSERT [dbo].[Timetable] ([Id], [ClassID], [SectionID], [Lec1], [Lec2], [Lec3], [Lec4], [Lec5], [Lec6], [Lec7], [Lec8], [Day]) VALUES (2, 6, 1, N'Science', N'Urdu', N'Urdu', N'Maths', N'Maths', N'Islamiat', N'Maths', N'English', N'Wednesday')
INSERT [dbo].[Timetable] ([Id], [ClassID], [SectionID], [Lec1], [Lec2], [Lec3], [Lec4], [Lec5], [Lec6], [Lec7], [Lec8], [Day]) VALUES (3, 8, 2, N'Islamiat', N'Social Studies', N'Biology', N'Urdu', N'Urdu', N'Urdu', N'Urdu', N'Maths', N'Thursday')
INSERT [dbo].[Timetable] ([Id], [ClassID], [SectionID], [Lec1], [Lec2], [Lec3], [Lec4], [Lec5], [Lec6], [Lec7], [Lec8], [Day]) VALUES (4, 9, 2, N'Urdu', N'Maths', N'English', N'English', N'Break', N'Science', N'English', N'Islamiat', N'Tuesday')
INSERT [dbo].[Timetable] ([Id], [ClassID], [SectionID], [Lec1], [Lec2], [Lec3], [Lec4], [Lec5], [Lec6], [Lec7], [Lec8], [Day]) VALUES (5, 6, 1, N'Biology', N'Maths', N'Chemistry', N'Maths', N'Break', N'Urdu', N'English', N'Science', N'Tuesday')
SET IDENTITY_INSERT [dbo].[Timetable] OFF
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Class]  WITH CHECK ADD  CONSTRAINT [FK_Section_Class] FOREIGN KEY([SectionID])
REFERENCES [dbo].[Section] ([SectionID])
GO
ALTER TABLE [dbo].[Class] CHECK CONSTRAINT [FK_Section_Class]
GO
ALTER TABLE [dbo].[Class]  WITH CHECK ADD  CONSTRAINT [FK_Subject_Class] FOREIGN KEY([SubjectID])
REFERENCES [dbo].[Subject] ([SubjectID])
GO
ALTER TABLE [dbo].[Class] CHECK CONSTRAINT [FK_Subject_Class]
GO
ALTER TABLE [dbo].[Class]  WITH CHECK ADD  CONSTRAINT [FK_Teacher_Class] FOREIGN KEY([TeacherID])
REFERENCES [dbo].[Teacher] ([TeacherID])
GO
ALTER TABLE [dbo].[Class] CHECK CONSTRAINT [FK_Teacher_Class]
GO
ALTER TABLE [dbo].[ClassHomework]  WITH CHECK ADD  CONSTRAINT [FK_ClassHomework_Class] FOREIGN KEY([ClassID])
REFERENCES [dbo].[Class] ([ClassID])
GO
ALTER TABLE [dbo].[ClassHomework] CHECK CONSTRAINT [FK_ClassHomework_Class]
GO
ALTER TABLE [dbo].[Datesheet]  WITH CHECK ADD  CONSTRAINT [FK_Timetable_Class] FOREIGN KEY([ClassID])
REFERENCES [dbo].[Class] ([ClassID])
GO
ALTER TABLE [dbo].[Datesheet] CHECK CONSTRAINT [FK_Timetable_Class]
GO
ALTER TABLE [dbo].[Datesheet]  WITH CHECK ADD  CONSTRAINT [FK_Timetable_Section] FOREIGN KEY([SectionID])
REFERENCES [dbo].[Section] ([SectionID])
GO
ALTER TABLE [dbo].[Datesheet] CHECK CONSTRAINT [FK_Timetable_Section]
GO
ALTER TABLE [dbo].[Datesheet]  WITH CHECK ADD  CONSTRAINT [FK_Timetable_Subject] FOREIGN KEY([SubjectID])
REFERENCES [dbo].[Subject] ([SubjectID])
GO
ALTER TABLE [dbo].[Datesheet] CHECK CONSTRAINT [FK_Timetable_Subject]
GO
ALTER TABLE [dbo].[FeeChallan]  WITH CHECK ADD  CONSTRAINT [FK_FeeChallan_Class] FOREIGN KEY([ClassID])
REFERENCES [dbo].[Class] ([ClassID])
GO
ALTER TABLE [dbo].[FeeChallan] CHECK CONSTRAINT [FK_FeeChallan_Class]
GO
ALTER TABLE [dbo].[Payroll]  WITH CHECK ADD  CONSTRAINT [FK_Payroll_Teacher] FOREIGN KEY([TeacherID])
REFERENCES [dbo].[Teacher] ([TeacherID])
GO
ALTER TABLE [dbo].[Payroll] CHECK CONSTRAINT [FK_Payroll_Teacher]
GO
ALTER TABLE [dbo].[Report]  WITH CHECK ADD  CONSTRAINT [FK_Report_Student] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Student] ([StudentID])
GO
ALTER TABLE [dbo].[Report] CHECK CONSTRAINT [FK_Report_Student]
GO
ALTER TABLE [dbo].[Report]  WITH CHECK ADD  CONSTRAINT [FK_Report_Subject] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Subject] ([SubjectID])
GO
ALTER TABLE [dbo].[Report] CHECK CONSTRAINT [FK_Report_Subject]
GO
ALTER TABLE [dbo].[Request]  WITH CHECK ADD  CONSTRAINT [FK_Request_Student] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Student] ([StudentID])
GO
ALTER TABLE [dbo].[Request] CHECK CONSTRAINT [FK_Request_Student]
GO
ALTER TABLE [dbo].[Request]  WITH CHECK ADD  CONSTRAINT [FK_Request_Teacher] FOREIGN KEY([TeacherID])
REFERENCES [dbo].[Teacher] ([TeacherID])
GO
ALTER TABLE [dbo].[Request] CHECK CONSTRAINT [FK_Request_Teacher]
GO
ALTER TABLE [dbo].[StudentAttendance]  WITH CHECK ADD  CONSTRAINT [FK_StudentAttendance_ClassAttendance] FOREIGN KEY([AttendanceID])
REFERENCES [dbo].[ClassAttendance] ([Id])
GO
ALTER TABLE [dbo].[StudentAttendance] CHECK CONSTRAINT [FK_StudentAttendance_ClassAttendance]
GO
ALTER TABLE [dbo].[StudentAttendance]  WITH CHECK ADD  CONSTRAINT [FK_StudentAttendance_Student] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Student] ([StudentID])
GO
ALTER TABLE [dbo].[StudentAttendance] CHECK CONSTRAINT [FK_StudentAttendance_Student]
GO
ALTER TABLE [dbo].[StudentChallan]  WITH CHECK ADD  CONSTRAINT [FK_StudentChallan_FeeChallan] FOREIGN KEY([ChallanID])
REFERENCES [dbo].[FeeChallan] ([Id])
GO
ALTER TABLE [dbo].[StudentChallan] CHECK CONSTRAINT [FK_StudentChallan_FeeChallan]
GO
ALTER TABLE [dbo].[StudentChallan]  WITH CHECK ADD  CONSTRAINT [FK_StudentChallan_Student] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Student] ([StudentID])
GO
ALTER TABLE [dbo].[StudentChallan] CHECK CONSTRAINT [FK_StudentChallan_Student]
GO
ALTER TABLE [dbo].[StudentClass]  WITH CHECK ADD  CONSTRAINT [FK_StudentClass_Class] FOREIGN KEY([ClassID])
REFERENCES [dbo].[Class] ([ClassID])
GO
ALTER TABLE [dbo].[StudentClass] CHECK CONSTRAINT [FK_StudentClass_Class]
GO
ALTER TABLE [dbo].[StudentClass]  WITH CHECK ADD  CONSTRAINT [FK_StudentClass_Section] FOREIGN KEY([SectionID])
REFERENCES [dbo].[Section] ([SectionID])
GO
ALTER TABLE [dbo].[StudentClass] CHECK CONSTRAINT [FK_StudentClass_Section]
GO
ALTER TABLE [dbo].[StudentClass]  WITH CHECK ADD  CONSTRAINT [FK_StudentClass_Student] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Student] ([StudentID])
GO
ALTER TABLE [dbo].[StudentClass] CHECK CONSTRAINT [FK_StudentClass_Student]
GO
ALTER TABLE [dbo].[StudentHomework]  WITH CHECK ADD  CONSTRAINT [FK_StudentHomework_ClassHomework] FOREIGN KEY([HomeworkID])
REFERENCES [dbo].[ClassHomework] ([HomeworkID])
GO
ALTER TABLE [dbo].[StudentHomework] CHECK CONSTRAINT [FK_StudentHomework_ClassHomework]
GO
ALTER TABLE [dbo].[StudentHomework]  WITH CHECK ADD  CONSTRAINT [FK_StudentHomework_Student] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Student] ([StudentID])
GO
ALTER TABLE [dbo].[StudentHomework] CHECK CONSTRAINT [FK_StudentHomework_Student]
GO
ALTER TABLE [dbo].[SubmitHomework]  WITH CHECK ADD  CONSTRAINT [FK_SubmitHomework_ClassHomework] FOREIGN KEY([HomeworkID])
REFERENCES [dbo].[ClassHomework] ([HomeworkID])
GO
ALTER TABLE [dbo].[SubmitHomework] CHECK CONSTRAINT [FK_SubmitHomework_ClassHomework]
GO
ALTER TABLE [dbo].[SubmitHomework]  WITH CHECK ADD  CONSTRAINT [FK_SubmitHomework_Student] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Student] ([StudentID])
GO
ALTER TABLE [dbo].[SubmitHomework] CHECK CONSTRAINT [FK_SubmitHomework_Student]
GO
ALTER TABLE [dbo].[TeacherAttendance]  WITH CHECK ADD  CONSTRAINT [FK_TeacherAttendance_Teacher] FOREIGN KEY([TeacherID])
REFERENCES [dbo].[Teacher] ([TeacherID])
GO
ALTER TABLE [dbo].[TeacherAttendance] CHECK CONSTRAINT [FK_TeacherAttendance_Teacher]
GO
ALTER TABLE [dbo].[Timetable]  WITH CHECK ADD  CONSTRAINT [FK_Class_Timetable] FOREIGN KEY([ClassID])
REFERENCES [dbo].[Class] ([ClassID])
GO
ALTER TABLE [dbo].[Timetable] CHECK CONSTRAINT [FK_Class_Timetable]
GO
ALTER TABLE [dbo].[Timetable]  WITH CHECK ADD  CONSTRAINT [FK_Section_Timetable] FOREIGN KEY([SectionID])
REFERENCES [dbo].[Section] ([SectionID])
GO
ALTER TABLE [dbo].[Timetable] CHECK CONSTRAINT [FK_Section_Timetable]
GO
