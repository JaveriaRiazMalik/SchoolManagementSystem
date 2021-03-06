USE [DB31]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 5/4/2019 9:52:37 AM ******/
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
/****** Object:  Table [dbo].[Admin]    Script Date: 5/4/2019 9:52:37 AM ******/
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
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 5/4/2019 9:52:37 AM ******/
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
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 5/4/2019 9:52:37 AM ******/
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
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 5/4/2019 9:52:37 AM ******/
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
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 5/4/2019 9:52:37 AM ******/
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
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 5/4/2019 9:52:37 AM ******/
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
/****** Object:  Table [dbo].[Class]    Script Date: 5/4/2019 9:52:37 AM ******/
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
/****** Object:  Table [dbo].[ClassAttendance]    Script Date: 5/4/2019 9:52:37 AM ******/
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
/****** Object:  Table [dbo].[ClassHomework]    Script Date: 5/4/2019 9:52:37 AM ******/
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
/****** Object:  Table [dbo].[Datesheet]    Script Date: 5/4/2019 9:52:37 AM ******/
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
/****** Object:  Table [dbo].[FeeChallan]    Script Date: 5/4/2019 9:52:37 AM ******/
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
/****** Object:  Table [dbo].[Payroll]    Script Date: 5/4/2019 9:52:37 AM ******/
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
/****** Object:  Table [dbo].[Report]    Script Date: 5/4/2019 9:52:37 AM ******/
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
/****** Object:  Table [dbo].[Request]    Script Date: 5/4/2019 9:52:37 AM ******/
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
/****** Object:  Table [dbo].[Section]    Script Date: 5/4/2019 9:52:37 AM ******/
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
/****** Object:  Table [dbo].[Student]    Script Date: 5/4/2019 9:52:37 AM ******/
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
/****** Object:  Table [dbo].[StudentAttendance]    Script Date: 5/4/2019 9:52:37 AM ******/
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
/****** Object:  Table [dbo].[StudentChallan]    Script Date: 5/4/2019 9:52:37 AM ******/
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
/****** Object:  Table [dbo].[StudentClass]    Script Date: 5/4/2019 9:52:37 AM ******/
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
/****** Object:  Table [dbo].[StudentHomework]    Script Date: 5/4/2019 9:52:37 AM ******/
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
/****** Object:  Table [dbo].[Subject]    Script Date: 5/4/2019 9:52:37 AM ******/
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
/****** Object:  Table [dbo].[SubmitHomework]    Script Date: 5/4/2019 9:52:37 AM ******/
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
/****** Object:  Table [dbo].[Teacher]    Script Date: 5/4/2019 9:52:37 AM ******/
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
/****** Object:  Table [dbo].[TeacherAttendance]    Script Date: 5/4/2019 9:52:37 AM ******/
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
/****** Object:  Table [dbo].[Timetable]    Script Date: 5/4/2019 9:52:37 AM ******/
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
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'0171f01a-f287-4019-9792-a38500c675bc', N'rahma6@gmail.com', 0, N'AMQkDtFoiaIofDvKo4bciDxOYb/ajItqjbRni+nv7W/wX70swZFE1VT/bnG4tuYlCQ==', N'33e740f9-49a9-4e04-9fe7-9d7bf719d2fd', NULL, 0, 0, NULL, 1, 0, N'rahma6@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'05c390d8-ec83-44fb-acbb-494c9730c53c', N'aleena2@gmail.com', 0, N'AAiPHL9eyMY15GSkZEl827LT60uLeXUhh/a3iJIc3xleYXbzs4vX+vIEFgxR7jng2g==', N'661058b0-5931-477f-8f43-11e8f5f6611b', NULL, 0, 0, NULL, 1, 0, N'aleena2@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'0bc8a5e7-df6f-4d69-919b-7d175d2aeaed', N'aleena@gmail.com', 0, N'ALzvEJ79mB26dzR2kgmOrkaig7eLSw/N47gt5SbebRYpsqgfbPHVwJWwKSx0zA5jiQ==', N'5f31f8f4-3cc2-4ec3-ae8b-a7a99c384a3c', NULL, 0, 0, NULL, 1, 0, N'aleena@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'1174c5bd-3682-43a6-88cb-2ec2dfad54e9', N'javeria123@gmail.com', 0, N'ACBc7KQyJn65Scxj6XM8n6dx9Gwifu3ykGc9nMibDHrKhL06kb2AzBdosd8EW57xug==', N'14722f51-7f5d-4c43-a594-322c167bc879', NULL, 0, 0, NULL, 1, 0, N'javeria123@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'1bc5890d-1061-4cb9-8524-ab7b9bff7f38', N'javeria3@gmail.com', 0, N'AGMpWu1NYBtlRnCudY2/5upFWrCf2txMRXXcZqTqpPIhSs+uZnyaKvS7VOhV3STjdg==', N'2b050462-780a-40a9-88d6-e1096bb4dc12', NULL, 0, 0, NULL, 1, 0, N'javeria3@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'1dc418f3-8a25-4cda-b03f-524df7a39aab', N'khadijazahoor772@gmail.com', 0, N'AHXBovu8KTnC/Qykx9IuktzVOGFhu1JbI1vu7WgoKsBDWxkoUot8UuPzbJiukXVf0g==', N'a38ff0f3-649f-4bf8-a8ab-78cbbe34a818', NULL, 0, 0, NULL, 1, 0, N'khadijazahoor772@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'228fd46f-c72f-48b6-90c6-747f232a8502', N'diju@gmail.com', 0, N'AEIE6seOUABlLg2R42RI4doqWJSms0mXREkeaMeZBQcxqTNFX96Ztq2/XG2QMcmIFA==', N'f91869f3-a57d-4415-866e-7868b44ecb9b', NULL, 0, 0, NULL, 1, 0, N'diju@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'410cae9f-2631-4ede-bfe8-929830e86e2b', N'rahma12@gmail.com', 0, N'AG/I8T9V7vd6KsXsN1qSgSD9czBxKpVpl6vsyMWCvCRX5RL0umefAKOFT8tkGCpt0g==', N'3322062a-3bd1-4351-8652-67e8fb072a63', NULL, 0, 0, NULL, 1, 0, N'rahma12@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'45cf6cb9-d806-4a4f-84de-c927fb3f235c', N'rahma11@gmail.com', 0, N'APrrRhJ9hNCV0h6jQXmrh8hxe5bL5MTLIxCYvCKGYJagiPWzLX8NKoWShU8McIB1Mw==', N'39b0da78-3224-4c53-9451-745325d1407c', NULL, 0, 0, NULL, 1, 0, N'rahma11@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'4a18a4ad-7fa3-452e-8260-7345ffc344b9', N'khadijazahoor77@gmail.com', 0, N'ABJshvbg5rpt+/G9vTp/tUjPJuTuU5F/P3ypm1vhDBIdFBHDT9zxnd0MUYIdFjKxww==', N'ff3e607c-63ac-4751-8d1a-62a9d2e2a47e', NULL, 0, 0, NULL, 1, 0, N'khadijazahoor77@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'4d8392df-b4b6-4904-acda-657bd2c945d8', N'aleena3@gmail.com', 0, N'AAZ7284AHod+rYJxlXY259p9tPqJMEihalvInyBpADRu7+kW0ySY9qLDvGh06xaDjQ==', N'12549c2e-c7ac-48c1-90a9-04c1fec6f263', NULL, 0, 0, NULL, 1, 0, N'aleena3@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'4e1c4c7d-c315-4174-ad50-dcc1234e9758', N'rahma8@gmail.com', 0, N'AJaGWPl2GrBalMU5y6KM20l0a5B5D+Bs1fUF+pGgrTuxtg/IaxkpQWxnaVEfmXnUvQ==', N'7d85b968-3799-49bb-92e9-dca543f80571', NULL, 0, 0, NULL, 1, 0, N'rahma8@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'5c845803-3810-40fc-a187-49d743d275fb', N'rahma5@gmail.com', 0, N'AG2wQtCXC999IYcNUO1OiSXzjWhX7CAGYyyGWUyzqBWk9Z8vgJ23Kep8Daf0IrfpnQ==', N'9a555075-74ba-40ba-b56e-74ad839321de', NULL, 0, 0, NULL, 1, 0, N'rahma5@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'726a3c30-8926-4873-9b57-e047e037bceb', N'rahma9@gmail.com', 0, N'AELDvBcCp9sGqvZOvZaCFMwkkB49O0EcA/OeSdx+xCxRZBBbntN/ocpmGh/zD3klmg==', N'c150a00a-04a0-4d51-ad22-6ed45394d207', NULL, 0, 0, NULL, 1, 0, N'rahma9@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'7930df5e-58cf-4de2-9f1d-8c9f861e8982', N'rahma10@gmail.com', 0, N'ACuWTVrSNsptHdtgk8fOCDF35nbFWqnydHXkYWtSwgD/tC4wiBViplKuw8nUEtzhsw==', N'fc37cb42-f376-47d7-8b55-7f26fdb81c49', NULL, 0, 0, NULL, 1, 0, N'rahma10@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'7ab705fa-77aa-4372-82d5-e2d79db52499', N'rahma@gmail.com', 0, N'AJJLknWf9wH2qMaTP5lihE/Fnpb6MTuZIIq9g0MPg/BjVuMAVc30kj4FGOYlCLBidw==', N'a67d2c71-e3d0-46ee-9907-7a8cd687cfe2', NULL, 0, 0, NULL, 1, 0, N'rahma@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'81e4a9df-57fc-496b-9f9f-14cc2e9be4f4', N'rahma3@gmail.com', 0, N'AJGWDafELZiT4E8hrf9LCU27rR7rUzyp2caVJCyBON79pKtefV7RuPkrobDyCTenkA==', N'8032975a-c8b4-4128-b428-3942e160159a', NULL, 0, 0, NULL, 1, 0, N'rahma3@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'88364ef6-1c3c-497b-9296-8d2a660d42a1', N'javeria14@gmail.com', 0, N'AMJmBgh9+JHcsHBtlgViGJjMPLIENnFM5In6N9UlWVY8RGZioiWJq3XAgnulpSoepQ==', N'da953704-70c2-450e-8035-bea30da6932d', NULL, 0, 0, NULL, 1, 0, N'javeria14@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'8a18f3da-065b-4bad-9047-022fad59133e', N'javeriariazmalik2@gmail.com', 0, N'AEG16mCrdOSw43+So9n55bRdvKbBmC8zOoBWSjyPzORSuHAUEaK2aY0TSrVt/NvOvA==', N'7aa49faa-9ffc-49b2-8ca5-8e12e3431c91', NULL, 0, 0, NULL, 1, 0, N'javeriariazmalik2@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'94585592-b31a-49d6-985b-87f1995f33d3', N'rahma4@gmail.com', 0, N'ALQULDJ0oGh6GRuuyX7k2lIcjwiWb7f9+3lb0KJGW7tIv0So25eGlNl0nv8jbcEsJQ==', N'f303b5b1-5e81-4f4c-a150-e3e563618979', NULL, 0, 0, NULL, 1, 0, N'rahma4@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'9b4438ed-4939-409c-9d54-9edf1271a6bb', N'aleena1@gmail.com', 0, N'AK0xBLqX4x2lrR76qYPzNO/5Y3t8RisCzS0ItbpVyN/PliAiF6maGjvrLHquKqGk/w==', N'ff623fee-6c22-4216-b5d2-137c280111d8', NULL, 0, 0, NULL, 1, 0, N'aleena1@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'9f97eecd-3735-4c12-9f4a-105e05f0fbf7', N'javeria1@gmail.com', 0, N'AKj3b+0LxBErQYPf3JZ1IvuLwY+YCcnIF05Xdx/Njt/6q75ukrkkn1ZangpvwdMA4A==', N'2b29deb0-6618-4081-98f1-51fe32d3e361', NULL, 0, 0, NULL, 1, 0, N'javeria1@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'a289d878-70d2-4db6-a4e8-184b62cab656', N'javeria9@gmail.com', 0, N'AEcJ5sXgrNddyKHX13wkVzaaYLQB19qokTYm/bRB3zWwGSqxei+7k1ZpRFUYoIcWeQ==', N'509e7f90-18bc-4602-9411-9c4f62acf3ad', NULL, 0, 0, NULL, 1, 0, N'javeria9@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'aa4679cc-4f4f-4ce1-b30b-d64a1fa178ed', N'javeria11@gmail.com', 0, N'AE2oBBp9aSrJpw0xVg3C2hb8+iTRZdGg1wiM3SMKqsEQu1iIajd5Ek/LUlg9lJfmMg==', N'94be8a14-9d25-4881-90d9-9e0c51246c90', NULL, 0, 0, NULL, 1, 0, N'javeria11@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'ad6cb34e-aa1d-4e58-96d2-f4d9ce839622', N'javeriariazmalik@gmail.com', 0, N'AMD2dQLU23U15LP3nAiHx9N2/J/6FahH31Z6vM2g6qMz2HgaE5cmpe4Cb/lkc6f4Zg==', N'7240fd89-8841-4050-b698-99731e82498a', NULL, 0, 0, NULL, 1, 0, N'javeriariazmalik@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'ad987839-6140-4fa1-9594-49643ddcee23', N'javeria7@gmail.com', 0, N'ACj/NJk5mBzHcwFTwlEmd62gQBeO1/tN81ZdfgIDxEt7PuJSJ4RvlPGoNBkoNPZgqA==', N'c183a403-1286-4e68-83af-db8717debba7', NULL, 0, 0, NULL, 1, 0, N'javeria7@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'b3f1c621-682d-4809-8262-9a0388ef8154', N'javeria5@gmail.com', 0, N'ABobfvgoeuIKB7msAykYRzER9UJ2wJJoIyMyZaRlNyzMRFVJanG0mro0HNhE4ae0zQ==', N'1bc4eebd-0e5e-4ebc-a3b2-c34f19b62aec', NULL, 0, 0, NULL, 1, 0, N'javeria5@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'b4fdc704-c933-4bc5-a6a5-2ef37c9fbcc4', N'javeria2@gmail.com', 0, N'AE3J9XQYomMAGSAP9PjltQEMsx9ZkomQFb704z3qObhvBAYq6/J8FAFppNueata44g==', N'1b9adc5d-e4a3-4053-a611-2956107ca38d', NULL, 0, 0, NULL, 1, 0, N'javeria2@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'b509af01-f2fb-45ad-af89-a2d457d16869', N'javeriariazmalik1@gmail.com', 0, N'AABTpznQStOqh7mIoyYTyZVNlhl8sXQa2JtyPMIW/qvxfs/XWr3XW4N+q+u79dSwpA==', N'ba9dafb1-b33a-4a1c-a079-156aeffd84dd', NULL, 0, 0, NULL, 1, 0, N'javeriariazmalik1@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'b5c0bbab-5f14-4748-8936-16031163297c', N'javeria12@gmail.com', 0, N'AJyRX01h0dvEmtAcUMHK0luvF3uPKPQrIipAi05KEu3w2fALgPiCdAlz+WbvAtkwoQ==', N'd95e525c-89d2-4f62-9a1a-518525699d1c', NULL, 0, 0, NULL, 1, 0, N'javeria12@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'c0f37a3e-271e-4fbe-aa65-b9dca0a59d2b', N'rahma7@gmail.com', 0, N'AJtyIOrN7iglr4/RlRMhMa+hsHp0SyGDhERRJRVfeFVPT5YjzOzTfRbT7Jb4LEEQOg==', N'3a31332f-31c8-491e-8f3d-008243cb68fd', NULL, 0, 0, NULL, 1, 0, N'rahma7@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'c8c771a0-931f-4dbb-bc25-0881a9138bda', N'javeria4@gmail.com', 0, N'AAo8lt2xI6tim35+LEALURWYOnkAmTfGh0hpAbDVgG85rXfsCsNBeptEA2gaRpJYdQ==', N'f4e47011-3d0b-4bf4-94dd-b50f1301d5b6', NULL, 0, 0, NULL, 1, 0, N'javeria4@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'cad7df26-0ba3-480d-89f7-e7fc9ee8d513', N'javeria8@gmail.com', 0, N'AFVOVdEYyWypnRzKlTuBTUuSM4COJgxRdpm7B6mQEvbntDph/oVW2EKBxIABNkVRbg==', N'a1cc1402-db70-444b-a420-f46f789a0fac', NULL, 0, 0, NULL, 1, 0, N'javeria8@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'caee59f7-defd-45a1-800a-bb0eb3c34ffd', N'haider@gmail.com', 0, N'AD49FRgKapMPtQ+PHA85Uvn+/PZECpZvm3p8e3If5nKMBmsAcWJeq1KDYTuK3Cq9Xg==', N'29a336c3-cf69-4b0d-84e9-ab061ee0629d', NULL, 0, 0, NULL, 1, 0, N'haider@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'd82c81a9-49d2-41e2-ae72-38a9de1fb065', N'javeria10@gmail.com', 0, N'ABKf3AWOItKcPEr5ezyatp0ezLjuxurzLV7mkCbB+ZopGx3MIk8MpDGIEmEFKddr/Q==', N'167f96d3-26f1-4b5c-b22d-51972fa1c8df', NULL, 0, 0, NULL, 1, 0, N'javeria10@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'e5f25f36-26fd-492b-a79f-99e4828d8a2b', N'rahma1@gmail.com', 0, N'APB7WfRKVnWE015JIujbZPgZiU1QqXJqNazOOFuBor+SlBexXScOcBwi/7PmasVpOw==', N'46b7c7b1-cfd6-427d-8802-63a61a058aad', NULL, 0, 0, NULL, 1, 0, N'rahma1@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'e632fee6-1ae6-47c3-86db-f07f9e7a494d', N'rahma2@gmail.com', 0, N'AFKTlmG3IuUMXyWKHvtWplkJ5YCL33MHVBK4A3Y/ZXxwnhvrcvlCyTkUzE/Myh9lRA==', N'2c9c5752-4ea7-4010-82f2-a74e9ba96f14', NULL, 0, 0, NULL, 1, 0, N'rahma2@gmail.com')
SET IDENTITY_INSERT [dbo].[Class] ON 

INSERT [dbo].[Class] ([ClassID], [SubjectID], [TeacherID], [ClassName], [SectionID]) VALUES (6, 1, 5, N'Class 1', 1)
INSERT [dbo].[Class] ([ClassID], [SubjectID], [TeacherID], [ClassName], [SectionID]) VALUES (8, 2, 6, N'Class 1', 2)
INSERT [dbo].[Class] ([ClassID], [SubjectID], [TeacherID], [ClassName], [SectionID]) VALUES (9, 4, 7, N'Class 1', 3)
INSERT [dbo].[Class] ([ClassID], [SubjectID], [TeacherID], [ClassName], [SectionID]) VALUES (10, 9, 9, N'Class 1', 4)
INSERT [dbo].[Class] ([ClassID], [SubjectID], [TeacherID], [ClassName], [SectionID]) VALUES (11, 1, 2, N'Class 6', 1)
INSERT [dbo].[Class] ([ClassID], [SubjectID], [TeacherID], [ClassName], [SectionID]) VALUES (12, 9, 1, N'Class 6', 1)
INSERT [dbo].[Class] ([ClassID], [SubjectID], [TeacherID], [ClassName], [SectionID]) VALUES (13, 2, 5, N'Class 6', 2)
INSERT [dbo].[Class] ([ClassID], [SubjectID], [TeacherID], [ClassName], [SectionID]) VALUES (14, 3, 6, N'Class 6', 3)
INSERT [dbo].[Class] ([ClassID], [SubjectID], [TeacherID], [ClassName], [SectionID]) VALUES (15, 5, 7, N'Class 6', 4)
INSERT [dbo].[Class] ([ClassID], [SubjectID], [TeacherID], [ClassName], [SectionID]) VALUES (16, 1, 5, N'Class 3', 1)
INSERT [dbo].[Class] ([ClassID], [SubjectID], [TeacherID], [ClassName], [SectionID]) VALUES (17, 2, 6, N'Class 3', 2)
INSERT [dbo].[Class] ([ClassID], [SubjectID], [TeacherID], [ClassName], [SectionID]) VALUES (18, 4, 7, N'Class 3', 3)
INSERT [dbo].[Class] ([ClassID], [SubjectID], [TeacherID], [ClassName], [SectionID]) VALUES (19, 7, 12, N'Class 3', 4)
INSERT [dbo].[Class] ([ClassID], [SubjectID], [TeacherID], [ClassName], [SectionID]) VALUES (20, 1, 16, N'Class 5', 1)
INSERT [dbo].[Class] ([ClassID], [SubjectID], [TeacherID], [ClassName], [SectionID]) VALUES (21, 10, 12, N'Class 5', 2)
INSERT [dbo].[Class] ([ClassID], [SubjectID], [TeacherID], [ClassName], [SectionID]) VALUES (22, 2, 1, N'Class 2', 1)
INSERT [dbo].[Class] ([ClassID], [SubjectID], [TeacherID], [ClassName], [SectionID]) VALUES (23, 3, 1, N'Class 7', 2)
SET IDENTITY_INSERT [dbo].[Class] OFF
SET IDENTITY_INSERT [dbo].[Datesheet] ON 

INSERT [dbo].[Datesheet] ([Id], [ClassID], [SectionID], [SubjectID], [Day], [Duration]) VALUES (7, 6, 2, 6, N'Monday', CAST(N'2019-04-30 00:08:49.867' AS DateTime))
INSERT [dbo].[Datesheet] ([Id], [ClassID], [SectionID], [SubjectID], [Day], [Duration]) VALUES (8, 6, 2, 4, N'Tuesday', CAST(N'2019-04-30 00:11:23.540' AS DateTime))
INSERT [dbo].[Datesheet] ([Id], [ClassID], [SectionID], [SubjectID], [Day], [Duration]) VALUES (9, 6, 2, 8, N'Wednesday', CAST(N'2019-04-30 00:12:35.963' AS DateTime))
INSERT [dbo].[Datesheet] ([Id], [ClassID], [SectionID], [SubjectID], [Day], [Duration]) VALUES (10, 6, 3, 6, N'Thursday', CAST(N'2019-04-30 00:12:55.823' AS DateTime))
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
SET IDENTITY_INSERT [dbo].[Report] ON 

INSERT [dbo].[Report] ([ReportID], [StudentID], [SubjectID], [TotalMarks], [ObtainedMarks]) VALUES (2, 3, 4, 100, 20)
INSERT [dbo].[Report] ([ReportID], [StudentID], [SubjectID], [TotalMarks], [ObtainedMarks]) VALUES (11, 1018, 1, 100, 80)
INSERT [dbo].[Report] ([ReportID], [StudentID], [SubjectID], [TotalMarks], [ObtainedMarks]) VALUES (13, 1016, 6, 100, 70)
INSERT [dbo].[Report] ([ReportID], [StudentID], [SubjectID], [TotalMarks], [ObtainedMarks]) VALUES (14, 1016, 9, 70, 65)
INSERT [dbo].[Report] ([ReportID], [StudentID], [SubjectID], [TotalMarks], [ObtainedMarks]) VALUES (15, 3, 3, 100, 90)
SET IDENTITY_INSERT [dbo].[Report] OFF
SET IDENTITY_INSERT [dbo].[Section] ON 

INSERT [dbo].[Section] ([SectionID], [SectionName]) VALUES (1, N'Section A')
INSERT [dbo].[Section] ([SectionID], [SectionName]) VALUES (2, N'Section B')
INSERT [dbo].[Section] ([SectionID], [SectionName]) VALUES (3, N'Section C')
INSERT [dbo].[Section] ([SectionID], [SectionName]) VALUES (4, N'Section D')
SET IDENTITY_INSERT [dbo].[Section] OFF
SET IDENTITY_INSERT [dbo].[Student] ON 

INSERT [dbo].[Student] ([StudentID], [FirstName], [LastName], [Gender], [Address], [Guardian], [Password], [RegistrationNo], [Contact], [Email]) VALUES (2, N'javeria', N'riaz', N'Female', N'lahore', N'riaz', N'Dija-1', N'2016-cs-251', N'252552', N'diju@gmail.com')
INSERT [dbo].[Student] ([StudentID], [FirstName], [LastName], [Gender], [Address], [Guardian], [Password], [RegistrationNo], [Contact], [Email]) VALUES (3, N'Haider', N'Ahmad', N'Male', N'lahore', N'riaz', N'Haider-1', N'2016-cs-266', N'252552', N'haider@gmail.com')
INSERT [dbo].[Student] ([StudentID], [FirstName], [LastName], [Gender], [Address], [Guardian], [Password], [RegistrationNo], [Contact], [Email]) VALUES (1004, N'Rahma1', N'Tahir1', N'Female', N'lahore', N'riaz', N'Rahma-1', N'251', N'8566466', N'rahma1@gmail.com')
INSERT [dbo].[Student] ([StudentID], [FirstName], [LastName], [Gender], [Address], [Guardian], [Password], [RegistrationNo], [Contact], [Email]) VALUES (1005, N'Rahma2', N'Tahir2', N'Female', N'gujranwall', N'hahah', N'Rahma-2', N'252', N'64645', N'rahma2@gmail.com')
INSERT [dbo].[Student] ([StudentID], [FirstName], [LastName], [Gender], [Address], [Guardian], [Password], [RegistrationNo], [Contact], [Email]) VALUES (1006, N'Rahma-3', N'Tahir-3', N'Female', N'multan', N'Hore', N'Rahma-3', N'253', N'7645454', N'rahma3@gmail.com')
INSERT [dbo].[Student] ([StudentID], [FirstName], [LastName], [Gender], [Address], [Guardian], [Password], [RegistrationNo], [Contact], [Email]) VALUES (1007, N'Rahma4', N'Tahir4', N'Female', N'lahore', N'jahtr', N'Rahma-4', N'254', N'64545', N'rahma4@gmail.com')
INSERT [dbo].[Student] ([StudentID], [FirstName], [LastName], [Gender], [Address], [Guardian], [Password], [RegistrationNo], [Contact], [Email]) VALUES (1008, N'Rahma5', N'Tahir5', N'Female', N'lahore', N'mama', N'Rahma-5', N'255', N'654665', N'rahma5@gmail.com')
INSERT [dbo].[Student] ([StudentID], [FirstName], [LastName], [Gender], [Address], [Guardian], [Password], [RegistrationNo], [Contact], [Email]) VALUES (1009, N'Rahma6', N'Tahir6', N'Female', N'lahore', N'male', N'Rahma-6', N'256', N'432455', N'rahma6@gmail.com')
INSERT [dbo].[Student] ([StudentID], [FirstName], [LastName], [Gender], [Address], [Guardian], [Password], [RegistrationNo], [Contact], [Email]) VALUES (1010, N'Rahm6', N'Tahir6', N'Female', N'haore', N'uyy', N'Rahma-6', N'257', N'64564', N'rahma7@gmail.com')
INSERT [dbo].[Student] ([StudentID], [FirstName], [LastName], [Gender], [Address], [Guardian], [Password], [RegistrationNo], [Contact], [Email]) VALUES (1011, N'Rahma8', N'Tahir8', N'Female', N'lahore', N'ftt', N'Rahma-8', N'258', N'54545', N'rahma8@gmail.com')
INSERT [dbo].[Student] ([StudentID], [FirstName], [LastName], [Gender], [Address], [Guardian], [Password], [RegistrationNo], [Contact], [Email]) VALUES (1012, N'Rahma9', N'Tahir9', N'Male', N'lahore', N'haore', N'Rahma-9', N'259', N'6546556', N'rahma9@gmail.com')
INSERT [dbo].[Student] ([StudentID], [FirstName], [LastName], [Gender], [Address], [Guardian], [Password], [RegistrationNo], [Contact], [Email]) VALUES (1013, N'Rahma-10', N'Tahir10', N'Female', N'lahore', N'father', N'Rahma-10', N'260', N'654556', N'rahma10@gmail.com')
INSERT [dbo].[Student] ([StudentID], [FirstName], [LastName], [Gender], [Address], [Guardian], [Password], [RegistrationNo], [Contact], [Email]) VALUES (1014, N'Rahma-11', N'Tahir-11', N'Male', N'lahore', N'father', N'Rahma-11', N'261', N'6565', N'rahma11@gmail.com')
INSERT [dbo].[Student] ([StudentID], [FirstName], [LastName], [Gender], [Address], [Guardian], [Password], [RegistrationNo], [Contact], [Email]) VALUES (1015, N'Rahma-12', N'Tahir12', N'Male', N'lahore', N'hh', N'Rahma-12', N'262', N'55', N'rahma12@gmail.com')
INSERT [dbo].[Student] ([StudentID], [FirstName], [LastName], [Gender], [Address], [Guardian], [Password], [RegistrationNo], [Contact], [Email]) VALUES (1016, N'Aleena', N'Riaz', N'Female', N'haore', N'Hore', N'Aleena-1', N'2016-cs-355', N'6666', N'aleena1@gmail.com')
INSERT [dbo].[Student] ([StudentID], [FirstName], [LastName], [Gender], [Address], [Guardian], [Password], [RegistrationNo], [Contact], [Email]) VALUES (1017, N'Rahma', N'Riaz', N'Female', N'gujranwall', N'father', N'Aleena-1', N'2016-cs-266', N'111', N'aleena2@gmail.com')
INSERT [dbo].[Student] ([StudentID], [FirstName], [LastName], [Gender], [Address], [Guardian], [Password], [RegistrationNo], [Contact], [Email]) VALUES (1018, N'javeria', N'Tahir6', N'Male', N'multan', N'Hore', N'Aleena-1', N'233', N'111', N'aleena3@gmail.com')
SET IDENTITY_INSERT [dbo].[Student] OFF
SET IDENTITY_INSERT [dbo].[StudentClass] ON 

INSERT [dbo].[StudentClass] ([StudentID], [ClassID], [SectionID], [Id]) VALUES (2, 6, 3, 1)
INSERT [dbo].[StudentClass] ([StudentID], [ClassID], [SectionID], [Id]) VALUES (3, 8, 2, 2)
INSERT [dbo].[StudentClass] ([StudentID], [ClassID], [SectionID], [Id]) VALUES (1006, 10, 1, 4)
INSERT [dbo].[StudentClass] ([StudentID], [ClassID], [SectionID], [Id]) VALUES (1005, 10, 1, 5)
INSERT [dbo].[StudentClass] ([StudentID], [ClassID], [SectionID], [Id]) VALUES (1007, 10, 1, 6)
INSERT [dbo].[StudentClass] ([StudentID], [ClassID], [SectionID], [Id]) VALUES (1008, 10, 2, 7)
INSERT [dbo].[StudentClass] ([StudentID], [ClassID], [SectionID], [Id]) VALUES (1010, 10, 2, 8)
INSERT [dbo].[StudentClass] ([StudentID], [ClassID], [SectionID], [Id]) VALUES (1011, 10, 2, 9)
INSERT [dbo].[StudentClass] ([StudentID], [ClassID], [SectionID], [Id]) VALUES (1012, 10, 3, 10)
INSERT [dbo].[StudentClass] ([StudentID], [ClassID], [SectionID], [Id]) VALUES (1013, 10, 3, 11)
INSERT [dbo].[StudentClass] ([StudentID], [ClassID], [SectionID], [Id]) VALUES (1014, 10, 4, 12)
INSERT [dbo].[StudentClass] ([StudentID], [ClassID], [SectionID], [Id]) VALUES (1015, 19, 1, 13)
INSERT [dbo].[StudentClass] ([StudentID], [ClassID], [SectionID], [Id]) VALUES (1016, 22, 1, 14)
INSERT [dbo].[StudentClass] ([StudentID], [ClassID], [SectionID], [Id]) VALUES (1017, 22, 1, 15)
INSERT [dbo].[StudentClass] ([StudentID], [ClassID], [SectionID], [Id]) VALUES (1018, 22, 1, 16)
SET IDENTITY_INSERT [dbo].[StudentClass] OFF
SET IDENTITY_INSERT [dbo].[Subject] ON 

INSERT [dbo].[Subject] ([SubjectID], [SubjectName]) VALUES (1, N'Physics')
INSERT [dbo].[Subject] ([SubjectID], [SubjectName]) VALUES (2, N'Chemistry')
INSERT [dbo].[Subject] ([SubjectID], [SubjectName]) VALUES (3, N'Biology')
INSERT [dbo].[Subject] ([SubjectID], [SubjectName]) VALUES (4, N'Science')
INSERT [dbo].[Subject] ([SubjectID], [SubjectName]) VALUES (5, N'Maths')
INSERT [dbo].[Subject] ([SubjectID], [SubjectName]) VALUES (6, N'Urdu A')
INSERT [dbo].[Subject] ([SubjectID], [SubjectName]) VALUES (7, N'Urdu B')
INSERT [dbo].[Subject] ([SubjectID], [SubjectName]) VALUES (8, N'Islamiat')
INSERT [dbo].[Subject] ([SubjectID], [SubjectName]) VALUES (9, N'Pak Studies')
INSERT [dbo].[Subject] ([SubjectID], [SubjectName]) VALUES (10, N'Social Studies')
SET IDENTITY_INSERT [dbo].[Subject] OFF
SET IDENTITY_INSERT [dbo].[Teacher] ON 

INSERT [dbo].[Teacher] ([TeacherID], [FirstName], [LastName], [Address], [Password], [Contact], [Gender], [Email]) VALUES (1, N'javeria', N'riaz', N'lahore', N'Khadija-1', N'252552', N'F', N'khadijazahoor772@gmail.com')
INSERT [dbo].[Teacher] ([TeacherID], [FirstName], [LastName], [Address], [Password], [Contact], [Gender], [Email]) VALUES (2, N'Rahma', N'Tahir', N'lahore', N'Rahma-1', N'252552', N'F', N'rahma@gmail.com')
INSERT [dbo].[Teacher] ([TeacherID], [FirstName], [LastName], [Address], [Password], [Contact], [Gender], [Email]) VALUES (3, N'Aleena', N'Riaz', N'lahore', N'Aleena-1', N'252552', N'Female', N'aleena@gmail.com')
INSERT [dbo].[Teacher] ([TeacherID], [FirstName], [LastName], [Address], [Password], [Contact], [Gender], [Email]) VALUES (5, N'javeria1', N'riaz1', N'lahore', N'Javeria-1', N'270', N'Female', N'javeria1@gmail.com')
INSERT [dbo].[Teacher] ([TeacherID], [FirstName], [LastName], [Address], [Password], [Contact], [Gender], [Email]) VALUES (6, N'javeria-2', N'riaz2', N'lahore', N'Javeria-2', N'5443545', N'Female', N'javeria2@gmail.com')
INSERT [dbo].[Teacher] ([TeacherID], [FirstName], [LastName], [Address], [Password], [Contact], [Gender], [Email]) VALUES (7, N'Javeria-3', N'Riaz3', N'lahore', N'Javeria-3', N'6555', N'Female', N'javeria3@gmail.com')
INSERT [dbo].[Teacher] ([TeacherID], [FirstName], [LastName], [Address], [Password], [Contact], [Gender], [Email]) VALUES (8, N'javeria4', N'Riaz4', N'lahore', N'Javeria-4', N'64646', N'Male', N'javeria4@gmail.com')
INSERT [dbo].[Teacher] ([TeacherID], [FirstName], [LastName], [Address], [Password], [Contact], [Gender], [Email]) VALUES (9, N'javeria5', N'Riaz5', N'lahore', N'Javeria-5', N'454554', N'Female', N'javeria5@gmail.com')
INSERT [dbo].[Teacher] ([TeacherID], [FirstName], [LastName], [Address], [Password], [Contact], [Gender], [Email]) VALUES (10, N'Javeria7', N'Riaz7', N'lahore', N'Javeria-7', N'666666', N'Male', N'javeria7@gmail.com')
INSERT [dbo].[Teacher] ([TeacherID], [FirstName], [LastName], [Address], [Password], [Contact], [Gender], [Email]) VALUES (11, N'Javeria8', N'riaz8', N'kajhhs', N'Javeria-8', N'6666', N'Male', N'javeria8@gmail.com')
INSERT [dbo].[Teacher] ([TeacherID], [FirstName], [LastName], [Address], [Password], [Contact], [Gender], [Email]) VALUES (12, N'Javeria9', N'Riaz9', N'lahore', N'Javeria-9', N'785656', N'Female', N'javeria9@gmail.com')
INSERT [dbo].[Teacher] ([TeacherID], [FirstName], [LastName], [Address], [Password], [Contact], [Gender], [Email]) VALUES (13, N'javeria10', N'Riaz10', N'lahore', N'Javeria-10', N'0655', N'Female', N'javeria10@gmail.com')
INSERT [dbo].[Teacher] ([TeacherID], [FirstName], [LastName], [Address], [Password], [Contact], [Gender], [Email]) VALUES (14, N'Javeria11', N'Riaz11', N'lahore', N'Javeria-11', N'7657', N'Female', N'javeria11@gmail.com')
INSERT [dbo].[Teacher] ([TeacherID], [FirstName], [LastName], [Address], [Password], [Contact], [Gender], [Email]) VALUES (15, N'javeria-12', N'Riaz-12', N'lahore', N'Javeria-12', N'766666', N'Female', N'javeria12@gmail.com')
INSERT [dbo].[Teacher] ([TeacherID], [FirstName], [LastName], [Address], [Password], [Contact], [Gender], [Email]) VALUES (16, N'Javeria-14', N'Riaz-14', N'hhshu', N'Javeria-14', N'6666', N'Female', N'javeria14@gmail.com')
SET IDENTITY_INSERT [dbo].[Teacher] OFF
SET IDENTITY_INSERT [dbo].[Timetable] ON 

INSERT [dbo].[Timetable] ([Id], [ClassID], [SectionID], [Lec1], [Lec2], [Lec3], [Lec4], [Lec5], [Lec6], [Lec7], [Lec8], [Day]) VALUES (2, 6, 1, N'Science', N'Urdu', N'Urdu', N'Maths', N'Maths', N'Islamiat', N'Maths', N'English', N'Wednesday')
INSERT [dbo].[Timetable] ([Id], [ClassID], [SectionID], [Lec1], [Lec2], [Lec3], [Lec4], [Lec5], [Lec6], [Lec7], [Lec8], [Day]) VALUES (3, 8, 2, N'Islamiat', N'Social Studies', N'Biology', N'Urdu', N'Urdu', N'Urdu', N'Urdu', N'Maths', N'Thursday')
INSERT [dbo].[Timetable] ([Id], [ClassID], [SectionID], [Lec1], [Lec2], [Lec3], [Lec4], [Lec5], [Lec6], [Lec7], [Lec8], [Day]) VALUES (4, 9, 2, N'Urdu', N'Maths', N'English', N'English', N'Break', N'Science', N'English', N'Islamiat', N'Tuesday')
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
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Class] CHECK CONSTRAINT [FK_Teacher_Class]
GO
ALTER TABLE [dbo].[ClassHomework]  WITH CHECK ADD  CONSTRAINT [FK_ClassHomework_Class] FOREIGN KEY([ClassID])
REFERENCES [dbo].[Class] ([ClassID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ClassHomework] CHECK CONSTRAINT [FK_ClassHomework_Class]
GO
ALTER TABLE [dbo].[Datesheet]  WITH CHECK ADD  CONSTRAINT [FK_Timetable_Class] FOREIGN KEY([ClassID])
REFERENCES [dbo].[Class] ([ClassID])
ON DELETE CASCADE
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
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FeeChallan] CHECK CONSTRAINT [FK_FeeChallan_Class]
GO
ALTER TABLE [dbo].[Payroll]  WITH CHECK ADD  CONSTRAINT [FK_Payroll_Teacher] FOREIGN KEY([TeacherID])
REFERENCES [dbo].[Teacher] ([TeacherID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Payroll] CHECK CONSTRAINT [FK_Payroll_Teacher]
GO
ALTER TABLE [dbo].[Report]  WITH CHECK ADD  CONSTRAINT [FK_Report_Student] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Student] ([StudentID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Report] CHECK CONSTRAINT [FK_Report_Student]
GO
ALTER TABLE [dbo].[Report]  WITH CHECK ADD  CONSTRAINT [FK_Report_Subject] FOREIGN KEY([SubjectID])
REFERENCES [dbo].[Subject] ([SubjectID])
GO
ALTER TABLE [dbo].[Report] CHECK CONSTRAINT [FK_Report_Subject]
GO
ALTER TABLE [dbo].[Request]  WITH CHECK ADD  CONSTRAINT [FK_Request_Student] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Student] ([StudentID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Request] CHECK CONSTRAINT [FK_Request_Student]
GO
ALTER TABLE [dbo].[Request]  WITH CHECK ADD  CONSTRAINT [FK_Request_Teacher] FOREIGN KEY([TeacherID])
REFERENCES [dbo].[Teacher] ([TeacherID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Request] CHECK CONSTRAINT [FK_Request_Teacher]
GO
ALTER TABLE [dbo].[StudentAttendance]  WITH CHECK ADD  CONSTRAINT [FK_StudentAttendance_ClassAttendance] FOREIGN KEY([AttendanceID])
REFERENCES [dbo].[ClassAttendance] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[StudentAttendance] CHECK CONSTRAINT [FK_StudentAttendance_ClassAttendance]
GO
ALTER TABLE [dbo].[StudentAttendance]  WITH CHECK ADD  CONSTRAINT [FK_StudentAttendance_Student] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Student] ([StudentID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[StudentAttendance] CHECK CONSTRAINT [FK_StudentAttendance_Student]
GO
ALTER TABLE [dbo].[StudentChallan]  WITH CHECK ADD  CONSTRAINT [FK_StudentChallan_FeeChallan] FOREIGN KEY([ChallanID])
REFERENCES [dbo].[FeeChallan] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[StudentChallan] CHECK CONSTRAINT [FK_StudentChallan_FeeChallan]
GO
ALTER TABLE [dbo].[StudentChallan]  WITH CHECK ADD  CONSTRAINT [FK_StudentChallan_Student] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Student] ([StudentID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[StudentChallan] CHECK CONSTRAINT [FK_StudentChallan_Student]
GO
ALTER TABLE [dbo].[StudentClass]  WITH CHECK ADD  CONSTRAINT [FK_StudentClass_Class] FOREIGN KEY([ClassID])
REFERENCES [dbo].[Class] ([ClassID])
ON DELETE CASCADE
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
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[StudentClass] CHECK CONSTRAINT [FK_StudentClass_Student]
GO
ALTER TABLE [dbo].[StudentHomework]  WITH CHECK ADD  CONSTRAINT [FK_StudentHomework_ClassHomework] FOREIGN KEY([HomeworkID])
REFERENCES [dbo].[ClassHomework] ([HomeworkID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[StudentHomework] CHECK CONSTRAINT [FK_StudentHomework_ClassHomework]
GO
ALTER TABLE [dbo].[StudentHomework]  WITH CHECK ADD  CONSTRAINT [FK_StudentHomework_Student] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Student] ([StudentID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[StudentHomework] CHECK CONSTRAINT [FK_StudentHomework_Student]
GO
ALTER TABLE [dbo].[SubmitHomework]  WITH CHECK ADD  CONSTRAINT [FK_SubmitHomework_ClassHomework] FOREIGN KEY([HomeworkID])
REFERENCES [dbo].[ClassHomework] ([HomeworkID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SubmitHomework] CHECK CONSTRAINT [FK_SubmitHomework_ClassHomework]
GO
ALTER TABLE [dbo].[SubmitHomework]  WITH CHECK ADD  CONSTRAINT [FK_SubmitHomework_Student] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Student] ([StudentID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SubmitHomework] CHECK CONSTRAINT [FK_SubmitHomework_Student]
GO
ALTER TABLE [dbo].[TeacherAttendance]  WITH CHECK ADD  CONSTRAINT [FK_TeacherAttendance_Teacher] FOREIGN KEY([TeacherID])
REFERENCES [dbo].[Teacher] ([TeacherID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TeacherAttendance] CHECK CONSTRAINT [FK_TeacherAttendance_Teacher]
GO
ALTER TABLE [dbo].[Timetable]  WITH CHECK ADD  CONSTRAINT [FK_Class_Timetable] FOREIGN KEY([ClassID])
REFERENCES [dbo].[Class] ([ClassID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Timetable] CHECK CONSTRAINT [FK_Class_Timetable]
GO
ALTER TABLE [dbo].[Timetable]  WITH CHECK ADD  CONSTRAINT [FK_Section_Timetable] FOREIGN KEY([SectionID])
REFERENCES [dbo].[Section] ([SectionID])
GO
ALTER TABLE [dbo].[Timetable] CHECK CONSTRAINT [FK_Section_Timetable]
GO
