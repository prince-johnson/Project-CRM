USE [master]
GO
/****** Object:  Database [ProjectCRM]    Script Date: 03-09-2022 14:34:41 ******/
CREATE DATABASE [ProjectCRM]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ProjectCRM', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ProjectCRM.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ProjectCRM_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ProjectCRM_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ProjectCRM] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ProjectCRM].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ProjectCRM] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ProjectCRM] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ProjectCRM] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ProjectCRM] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ProjectCRM] SET ARITHABORT OFF 
GO
ALTER DATABASE [ProjectCRM] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ProjectCRM] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ProjectCRM] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ProjectCRM] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ProjectCRM] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ProjectCRM] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ProjectCRM] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ProjectCRM] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ProjectCRM] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ProjectCRM] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ProjectCRM] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ProjectCRM] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ProjectCRM] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ProjectCRM] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ProjectCRM] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ProjectCRM] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ProjectCRM] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ProjectCRM] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ProjectCRM] SET  MULTI_USER 
GO
ALTER DATABASE [ProjectCRM] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ProjectCRM] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ProjectCRM] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ProjectCRM] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ProjectCRM] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ProjectCRM] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ProjectCRM] SET QUERY_STORE = OFF
GO
USE [ProjectCRM]
GO
/****** Object:  Table [dbo].[activity_log]    Script Date: 03-09-2022 14:34:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[activity_log](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NULL,
	[time] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[batches]    Script Date: 03-09-2022 14:34:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[batches](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[batchId] [varchar](80) NULL,
	[batchName] [varchar](80) NULL,
	[batchCourseId] [varchar](80) NULL,
	[batchStatus] [bit] NULL,
	[batchStrength] [int] NULL,
	[batchStartDate] [date] NULL,
	[batchEndDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[category]    Script Date: 03-09-2022 14:34:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category](
	[categoryId] [int] IDENTITY(1,1) NOT NULL,
	[categoryName] [varchar](80) NULL,
	[categoryStatus] [bit] NULL,
	[categoryComments] [varchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[categoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[course_enrollment]    Script Date: 03-09-2022 14:34:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[course_enrollment](
	[id] [int] NOT NULL,
	[userId] [int] NULL,
	[courseId] [int] NULL,
	[batchId] [int] NULL,
	[enrollStatus] [varchar](20) NULL,
	[score] [int] NULL,
 CONSTRAINT [PK_course_enrollment] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[courses]    Script Date: 03-09-2022 14:34:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[courses](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[courseId] [varchar](80) NULL,
	[courseName] [varchar](80) NULL,
	[courseCategoryId] [int] NULL,
	[courseDuration] [varchar](80) NULL,
	[courseDescription] [varchar](80) NULL,
	[courseInstructorID] [int] NULL,
	[courseMinQualificationId] [int] NULL,
	[courseBatchSize] [int] NULL,
	[courseVideoLink] [varchar](80) NULL,
	[courseRating] [int] NULL,
	[courseStatus] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[enquiries]    Script Date: 03-09-2022 14:34:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[enquiries](
	[enquiryId] [int] NOT NULL,
	[enquiryCode] [varchar](80) NULL,
	[enquiryUserId] [int] NULL,
	[enquiryCourseId] [int] NULL,
	[enquiryDescription] [varchar](250) NULL,
	[enquiryStatus] [bit] NULL,
	[enquiryUpdate] [varchar](80) NULL,
 CONSTRAINT [PK_Enquiries] PRIMARY KEY CLUSTERED 
(
	[enquiryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[instructor]    Script Date: 03-09-2022 14:34:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[instructor](
	[instructorId] [int] IDENTITY(1,1) NOT NULL,
	[instructorCode] [varchar](80) NULL,
	[instructorName] [varchar](80) NULL,
	[instructorEmail] [varchar](80) NULL,
	[instructorPhone] [varchar](80) NULL,
PRIMARY KEY CLUSTERED 
(
	[instructorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[qualifications]    Script Date: 03-09-2022 14:34:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[qualifications](
	[qualificationId] [int] IDENTITY(1,1) NOT NULL,
	[qualificationName] [varchar](80) NULL,
	[qualificationStatus] [bit] NULL,
	[qualificationPriority] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[qualificationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[role]    Script Date: 03-09-2022 14:34:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[role](
	[roleId] [int] IDENTITY(1,1) NOT NULL,
	[roleName] [varchar](80) NULL,
PRIMARY KEY CLUSTERED 
(
	[roleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_batch]    Script Date: 03-09-2022 14:34:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_batch](
	[id] [int] NOT NULL,
	[userId] [int] NULL,
	[batchId] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_qualification]    Script Date: 03-09-2022 14:34:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_qualification](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NULL,
	[qualificationId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 03-09-2022 14:34:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[userId] [int] IDENTITY(1,1) NOT NULL,
	[userCode] [varchar](80) NULL,
	[userName] [varchar](80) NULL,
	[userPassword] [varchar](250) NULL,
	[userRoleId] [int] NULL,
	[userEmail] [varchar](80) NULL,
	[userPhone] [varchar](80) NULL,
	[userCountry] [varchar](80) NULL,
	[userState] [varchar](80) NULL,
	[userCity] [varchar](80) NULL,
	[userNew] [bit] NULL,
	[userStatus] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[activity_log] ON 
GO
INSERT [dbo].[activity_log] ([id], [userId], [time]) VALUES (1, 432, CAST(N'2022-08-28T00:07:12.000' AS DateTime))
GO
INSERT [dbo].[activity_log] ([id], [userId], [time]) VALUES (2, 1652, CAST(N'2022-09-02T01:33:46.000' AS DateTime))
GO
INSERT [dbo].[activity_log] ([id], [userId], [time]) VALUES (3, 82, CAST(N'2022-09-01T17:15:31.000' AS DateTime))
GO
INSERT [dbo].[activity_log] ([id], [userId], [time]) VALUES (4, 908, CAST(N'2022-08-29T20:57:15.000' AS DateTime))
GO
INSERT [dbo].[activity_log] ([id], [userId], [time]) VALUES (5, 1159, CAST(N'2022-08-30T11:33:42.000' AS DateTime))
GO
INSERT [dbo].[activity_log] ([id], [userId], [time]) VALUES (6, 553, CAST(N'2022-08-30T20:10:01.000' AS DateTime))
GO
INSERT [dbo].[activity_log] ([id], [userId], [time]) VALUES (7, 24, CAST(N'2022-09-02T12:12:51.000' AS DateTime))
GO
INSERT [dbo].[activity_log] ([id], [userId], [time]) VALUES (8, 1007, CAST(N'2022-08-31T13:37:32.000' AS DateTime))
GO
INSERT [dbo].[activity_log] ([id], [userId], [time]) VALUES (9, 63, CAST(N'2022-08-28T00:01:03.000' AS DateTime))
GO
INSERT [dbo].[activity_log] ([id], [userId], [time]) VALUES (10, 820, CAST(N'2022-09-01T11:42:21.000' AS DateTime))
GO
INSERT [dbo].[activity_log] ([id], [userId], [time]) VALUES (11, 1217, CAST(N'2022-08-29T21:05:30.000' AS DateTime))
GO
INSERT [dbo].[activity_log] ([id], [userId], [time]) VALUES (12, 4, CAST(N'2022-08-28T00:00:04.000' AS DateTime))
GO
INSERT [dbo].[activity_log] ([id], [userId], [time]) VALUES (13, 381, CAST(N'2022-08-31T04:18:48.000' AS DateTime))
GO
INSERT [dbo].[activity_log] ([id], [userId], [time]) VALUES (14, 1455, CAST(N'2022-08-28T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[activity_log] ([id], [userId], [time]) VALUES (15, 679, CAST(N'2022-08-31T20:44:59.000' AS DateTime))
GO
INSERT [dbo].[activity_log] ([id], [userId], [time]) VALUES (16, 1337, CAST(N'2022-09-02T13:43:05.000' AS DateTime))
GO
INSERT [dbo].[activity_log] ([id], [userId], [time]) VALUES (17, 98, CAST(N'2022-09-01T23:11:47.000' AS DateTime))
GO
INSERT [dbo].[activity_log] ([id], [userId], [time]) VALUES (18, 688, CAST(N'2022-08-28T00:15:41.000' AS DateTime))
GO
INSERT [dbo].[activity_log] ([id], [userId], [time]) VALUES (19, 107, CAST(N'2022-08-30T20:48:33.000' AS DateTime))
GO
INSERT [dbo].[activity_log] ([id], [userId], [time]) VALUES (20, 1211, CAST(N'2022-08-28T00:01:22.000' AS DateTime))
GO
INSERT [dbo].[activity_log] ([id], [userId], [time]) VALUES (21, 285, CAST(N'2022-08-28T14:03:10.000' AS DateTime))
GO
INSERT [dbo].[activity_log] ([id], [userId], [time]) VALUES (22, 1284, CAST(N'2022-08-30T16:34:34.000' AS DateTime))
GO
INSERT [dbo].[activity_log] ([id], [userId], [time]) VALUES (23, 755, CAST(N'2022-08-29T11:27:52.000' AS DateTime))
GO
INSERT [dbo].[activity_log] ([id], [userId], [time]) VALUES (24, 6, CAST(N'2022-09-02T08:20:53.000' AS DateTime))
GO
INSERT [dbo].[activity_log] ([id], [userId], [time]) VALUES (25, 1003, CAST(N'2022-08-28T00:05:12.000' AS DateTime))
GO
INSERT [dbo].[activity_log] ([id], [userId], [time]) VALUES (26, 708, CAST(N'2022-08-28T07:37:53.000' AS DateTime))
GO
INSERT [dbo].[activity_log] ([id], [userId], [time]) VALUES (27, 7, CAST(N'2022-09-02T14:50:39.000' AS DateTime))
GO
INSERT [dbo].[activity_log] ([id], [userId], [time]) VALUES (28, 410, CAST(N'2022-08-28T00:01:27.000' AS DateTime))
GO
INSERT [dbo].[activity_log] ([id], [userId], [time]) VALUES (29, 930, CAST(N'2022-08-31T01:22:28.000' AS DateTime))
GO
INSERT [dbo].[activity_log] ([id], [userId], [time]) VALUES (30, 38, CAST(N'2022-08-28T00:01:37.000' AS DateTime))
GO
INSERT [dbo].[activity_log] ([id], [userId], [time]) VALUES (31, 821, CAST(N'2022-08-31T09:45:48.000' AS DateTime))
GO
INSERT [dbo].[activity_log] ([id], [userId], [time]) VALUES (32, 1194, CAST(N'2022-08-28T12:26:15.000' AS DateTime))
GO
INSERT [dbo].[activity_log] ([id], [userId], [time]) VALUES (33, 1084, CAST(N'2022-08-30T17:41:41.000' AS DateTime))
GO
INSERT [dbo].[activity_log] ([id], [userId], [time]) VALUES (34, 797, CAST(N'2022-08-28T01:00:17.000' AS DateTime))
GO
INSERT [dbo].[activity_log] ([id], [userId], [time]) VALUES (35, 165, CAST(N'2022-09-01T06:27:33.000' AS DateTime))
GO
INSERT [dbo].[activity_log] ([id], [userId], [time]) VALUES (36, 1396, CAST(N'2022-08-29T18:40:29.000' AS DateTime))
GO
INSERT [dbo].[activity_log] ([id], [userId], [time]) VALUES (37, 904, CAST(N'2022-08-30T15:33:24.000' AS DateTime))
GO
INSERT [dbo].[activity_log] ([id], [userId], [time]) VALUES (38, 152, CAST(N'2022-08-29T11:02:49.000' AS DateTime))
GO
INSERT [dbo].[activity_log] ([id], [userId], [time]) VALUES (39, 862, CAST(N'2022-09-02T22:12:24.000' AS DateTime))
GO
INSERT [dbo].[activity_log] ([id], [userId], [time]) VALUES (40, 602, CAST(N'2022-09-01T18:17:48.000' AS DateTime))
GO
INSERT [dbo].[activity_log] ([id], [userId], [time]) VALUES (41, 6, CAST(N'2022-09-02T12:18:57.000' AS DateTime))
GO
INSERT [dbo].[activity_log] ([id], [userId], [time]) VALUES (42, 113, CAST(N'2022-09-02T09:40:11.000' AS DateTime))
GO
INSERT [dbo].[activity_log] ([id], [userId], [time]) VALUES (43, 1179, CAST(N'2022-09-01T18:51:34.000' AS DateTime))
GO
INSERT [dbo].[activity_log] ([id], [userId], [time]) VALUES (44, 1344, CAST(N'2022-08-29T16:17:44.000' AS DateTime))
GO
INSERT [dbo].[activity_log] ([id], [userId], [time]) VALUES (45, 522, CAST(N'2022-08-28T00:02:21.000' AS DateTime))
GO
INSERT [dbo].[activity_log] ([id], [userId], [time]) VALUES (46, 1113, CAST(N'2022-09-02T11:22:24.000' AS DateTime))
GO
INSERT [dbo].[activity_log] ([id], [userId], [time]) VALUES (47, 1106, CAST(N'2022-08-30T10:14:30.000' AS DateTime))
GO
INSERT [dbo].[activity_log] ([id], [userId], [time]) VALUES (48, 1350, CAST(N'2022-08-31T12:04:45.000' AS DateTime))
GO
INSERT [dbo].[activity_log] ([id], [userId], [time]) VALUES (49, 251, CAST(N'2022-08-31T06:22:00.000' AS DateTime))
GO
INSERT [dbo].[activity_log] ([id], [userId], [time]) VALUES (50, 1532, CAST(N'2022-08-28T02:45:14.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[activity_log] OFF
GO
SET IDENTITY_INSERT [dbo].[batches] ON 
GO
INSERT [dbo].[batches] ([id], [batchId], [batchName], [batchCourseId], [batchStatus], [batchStrength], [batchStartDate], [batchEndDate]) VALUES (1, N'BA000', N'LAV', N'CR035', 1, 20, CAST(N'2020-01-04' AS Date), CAST(N'2020-06-02' AS Date))
GO
INSERT [dbo].[batches] ([id], [batchId], [batchName], [batchCourseId], [batchStatus], [batchStrength], [batchStartDate], [batchEndDate]) VALUES (2, N'BA001', N'SNA', N'CR016', 1, 25, CAST(N'2021-01-11' AS Date), CAST(N'2021-06-10' AS Date))
GO
INSERT [dbo].[batches] ([id], [batchId], [batchName], [batchCourseId], [batchStatus], [batchStrength], [batchStartDate], [batchEndDate]) VALUES (3, N'BA002', N'GLE', N'CR012', 1, 20, CAST(N'2020-01-08' AS Date), CAST(N'2020-06-06' AS Date))
GO
INSERT [dbo].[batches] ([id], [batchId], [batchName], [batchCourseId], [batchStatus], [batchStrength], [batchStartDate], [batchEndDate]) VALUES (4, N'BA003', N'SWE', N'CR003', 1, 25, CAST(N'2021-07-24' AS Date), CAST(N'2021-12-21' AS Date))
GO
INSERT [dbo].[batches] ([id], [batchId], [batchName], [batchCourseId], [batchStatus], [batchStrength], [batchStartDate], [batchEndDate]) VALUES (5, N'BA004', N'ASM', N'CR017', 1, 20, CAST(N'2021-01-24' AS Date), CAST(N'2021-06-23' AS Date))
GO
INSERT [dbo].[batches] ([id], [batchId], [batchName], [batchCourseId], [batchStatus], [batchStrength], [batchStartDate], [batchEndDate]) VALUES (6, N'BA005', N'URD', N'CR008', 1, 25, CAST(N'2020-04-05' AS Date), CAST(N'2020-09-02' AS Date))
GO
INSERT [dbo].[batches] ([id], [batchId], [batchName], [batchCourseId], [batchStatus], [batchStrength], [batchStartDate], [batchEndDate]) VALUES (7, N'BA006', N'BUL', N'CR036', 1, 20, CAST(N'2020-08-15' AS Date), CAST(N'2021-01-12' AS Date))
GO
INSERT [dbo].[batches] ([id], [batchId], [batchName], [batchCourseId], [batchStatus], [batchStrength], [batchStartDate], [batchEndDate]) VALUES (8, N'BA007', N'COR', N'CR013', 1, 25, CAST(N'2021-03-27' AS Date), CAST(N'2021-08-24' AS Date))
GO
INSERT [dbo].[batches] ([id], [batchId], [batchName], [batchCourseId], [batchStatus], [batchStrength], [batchStartDate], [batchEndDate]) VALUES (9, N'BA008', N'GUJ', N'CR009', 1, 20, CAST(N'2021-11-22' AS Date), CAST(N'2022-04-21' AS Date))
GO
INSERT [dbo].[batches] ([id], [batchId], [batchName], [batchCourseId], [batchStatus], [batchStrength], [batchStartDate], [batchEndDate]) VALUES (10, N'BA009', N'FIN', N'CR023', 1, 25, CAST(N'2020-12-26' AS Date), CAST(N'2021-05-25' AS Date))
GO
INSERT [dbo].[batches] ([id], [batchId], [batchName], [batchCourseId], [batchStatus], [batchStrength], [batchStartDate], [batchEndDate]) VALUES (11, N'BA010', N'DUT', N'CR040', 1, 20, CAST(N'2021-09-30' AS Date), CAST(N'2022-02-27' AS Date))
GO
INSERT [dbo].[batches] ([id], [batchId], [batchName], [batchCourseId], [batchStatus], [batchStrength], [batchStartDate], [batchEndDate]) VALUES (12, N'BA011', N'MLG', N'CR004', 1, 25, CAST(N'2021-04-14' AS Date), CAST(N'2021-09-11' AS Date))
GO
INSERT [dbo].[batches] ([id], [batchId], [batchName], [batchCourseId], [batchStatus], [batchStrength], [batchStartDate], [batchEndDate]) VALUES (13, N'BA012', N'LAO', N'CR031', 1, 20, CAST(N'2020-01-05' AS Date), CAST(N'2020-06-03' AS Date))
GO
INSERT [dbo].[batches] ([id], [batchId], [batchName], [batchCourseId], [batchStatus], [batchStrength], [batchStartDate], [batchEndDate]) VALUES (14, N'BA013', N'KAS', N'CR000', 1, 25, CAST(N'2021-02-10' AS Date), CAST(N'2021-07-10' AS Date))
GO
INSERT [dbo].[batches] ([id], [batchId], [batchName], [batchCourseId], [batchStatus], [batchStrength], [batchStartDate], [batchEndDate]) VALUES (15, N'BA014', N'ARG', N'CR019', 1, 20, CAST(N'2021-02-22' AS Date), CAST(N'2021-07-22' AS Date))
GO
INSERT [dbo].[batches] ([id], [batchId], [batchName], [batchCourseId], [batchStatus], [batchStrength], [batchStartDate], [batchEndDate]) VALUES (16, N'BA015', N'THA', N'CR037', 1, 25, CAST(N'2020-02-06' AS Date), CAST(N'2020-07-05' AS Date))
GO
INSERT [dbo].[batches] ([id], [batchId], [batchName], [batchCourseId], [batchStatus], [batchStrength], [batchStartDate], [batchEndDate]) VALUES (17, N'BA016', N'BAM', N'CR014', 1, 20, CAST(N'2021-05-03' AS Date), CAST(N'2021-09-30' AS Date))
GO
INSERT [dbo].[batches] ([id], [batchId], [batchName], [batchCourseId], [batchStatus], [batchStrength], [batchStartDate], [batchEndDate]) VALUES (18, N'BA017', N'TAT', N'CR010', 1, 25, CAST(N'2021-05-26' AS Date), CAST(N'2021-10-23' AS Date))
GO
INSERT [dbo].[batches] ([id], [batchId], [batchName], [batchCourseId], [batchStatus], [batchStrength], [batchStartDate], [batchEndDate]) VALUES (19, N'BA018', N'ORI', N'CR005', 1, 20, CAST(N'2020-03-10' AS Date), CAST(N'2020-08-07' AS Date))
GO
INSERT [dbo].[batches] ([id], [batchId], [batchName], [batchCourseId], [batchStatus], [batchStrength], [batchStartDate], [batchEndDate]) VALUES (20, N'BA019', N'AAR', N'CR001', 1, 25, CAST(N'2021-12-14' AS Date), CAST(N'2022-05-13' AS Date))
GO
INSERT [dbo].[batches] ([id], [batchId], [batchName], [batchCourseId], [batchStatus], [batchStrength], [batchStartDate], [batchEndDate]) VALUES (21, N'BA020', N'ZUL', N'CR006', 1, 20, CAST(N'2021-08-29' AS Date), CAST(N'2022-01-26' AS Date))
GO
INSERT [dbo].[batches] ([id], [batchId], [batchName], [batchCourseId], [batchStatus], [batchStrength], [batchStartDate], [batchEndDate]) VALUES (22, N'BA021', N'ENG', N'CR041', 1, 25, CAST(N'2021-08-29' AS Date), CAST(N'2022-01-26' AS Date))
GO
INSERT [dbo].[batches] ([id], [batchId], [batchName], [batchCourseId], [batchStatus], [batchStrength], [batchStartDate], [batchEndDate]) VALUES (23, N'BA022', N'LIN', N'CR024', 1, 20, CAST(N'2020-12-14' AS Date), CAST(N'2021-05-13' AS Date))
GO
INSERT [dbo].[batches] ([id], [batchId], [batchName], [batchCourseId], [batchStatus], [batchStrength], [batchStartDate], [batchEndDate]) VALUES (24, N'BA023', N'BUR', N'CR020', 1, 25, CAST(N'2020-09-05' AS Date), CAST(N'2021-02-02' AS Date))
GO
INSERT [dbo].[batches] ([id], [batchId], [batchName], [batchCourseId], [batchStatus], [batchStrength], [batchStartDate], [batchEndDate]) VALUES (25, N'BA024', N'SWA', N'CR038', 1, 20, CAST(N'2020-08-17' AS Date), CAST(N'2021-01-14' AS Date))
GO
INSERT [dbo].[batches] ([id], [batchId], [batchName], [batchCourseId], [batchStatus], [batchStrength], [batchStartDate], [batchEndDate]) VALUES (26, N'BA025', N'NEP', N'CR042', 1, 25, CAST(N'2020-04-06' AS Date), CAST(N'2020-09-03' AS Date))
GO
INSERT [dbo].[batches] ([id], [batchId], [batchName], [batchCourseId], [batchStatus], [batchStrength], [batchStartDate], [batchEndDate]) VALUES (27, N'BA026', N'SPA', N'CR027', 1, 20, CAST(N'2021-03-23' AS Date), CAST(N'2021-08-20' AS Date))
GO
INSERT [dbo].[batches] ([id], [batchId], [batchName], [batchCourseId], [batchStatus], [batchStrength], [batchStartDate], [batchEndDate]) VALUES (28, N'BA027', N'PLI', N'CR032', 1, 25, CAST(N'2020-02-20' AS Date), CAST(N'2020-07-19' AS Date))
GO
INSERT [dbo].[batches] ([id], [batchId], [batchName], [batchCourseId], [batchStatus], [batchStrength], [batchStartDate], [batchEndDate]) VALUES (29, N'BA028', N'SUN', N'CR028', 1, 20, CAST(N'2021-02-07' AS Date), CAST(N'2021-07-07' AS Date))
GO
INSERT [dbo].[batches] ([id], [batchId], [batchName], [batchCourseId], [batchStatus], [batchStrength], [batchStartDate], [batchEndDate]) VALUES (30, N'BA029', N'VIE', N'CR039', 1, 25, CAST(N'2021-10-18' AS Date), CAST(N'2022-03-17' AS Date))
GO
INSERT [dbo].[batches] ([id], [batchId], [batchName], [batchCourseId], [batchStatus], [batchStrength], [batchStartDate], [batchEndDate]) VALUES (31, N'BA030', N'CZE', N'CR002', 1, 20, CAST(N'2021-11-27' AS Date), CAST(N'2022-04-26' AS Date))
GO
INSERT [dbo].[batches] ([id], [batchId], [batchName], [batchCourseId], [batchStatus], [batchStrength], [batchStartDate], [batchEndDate]) VALUES (32, N'BA031', N'IPK', N'CR007', 1, 25, CAST(N'2020-08-04' AS Date), CAST(N'2021-01-01' AS Date))
GO
INSERT [dbo].[batches] ([id], [batchId], [batchName], [batchCourseId], [batchStatus], [batchStrength], [batchStartDate], [batchEndDate]) VALUES (33, N'BA032', N'NDO', N'CR025', 1, 20, CAST(N'2020-01-02' AS Date), CAST(N'2020-05-31' AS Date))
GO
INSERT [dbo].[batches] ([id], [batchId], [batchName], [batchCourseId], [batchStatus], [batchStrength], [batchStartDate], [batchEndDate]) VALUES (34, N'BA033', N'TSO', N'CR033', 1, 25, CAST(N'2021-05-13' AS Date), CAST(N'2021-10-10' AS Date))
GO
INSERT [dbo].[batches] ([id], [batchId], [batchName], [batchCourseId], [batchStatus], [batchStrength], [batchStartDate], [batchEndDate]) VALUES (35, N'BA034', N'YOR', N'CR015', 1, 20, CAST(N'2021-11-30' AS Date), CAST(N'2022-04-29' AS Date))
GO
INSERT [dbo].[batches] ([id], [batchId], [batchName], [batchCourseId], [batchStatus], [batchStrength], [batchStartDate], [batchEndDate]) VALUES (36, N'BA035', N'SAG', N'CR011', 1, 25, CAST(N'2021-04-15' AS Date), CAST(N'2021-09-12' AS Date))
GO
INSERT [dbo].[batches] ([id], [batchId], [batchName], [batchCourseId], [batchStatus], [batchStrength], [batchStartDate], [batchEndDate]) VALUES (37, N'BA036', N'CHE', N'CR021', 1, 20, CAST(N'2020-09-25' AS Date), CAST(N'2021-02-22' AS Date))
GO
INSERT [dbo].[batches] ([id], [batchId], [batchName], [batchCourseId], [batchStatus], [batchStrength], [batchStartDate], [batchEndDate]) VALUES (38, N'BA037', N'COS', N'CR026', 1, 25, CAST(N'2021-05-11' AS Date), CAST(N'2021-10-08' AS Date))
GO
INSERT [dbo].[batches] ([id], [batchId], [batchName], [batchCourseId], [batchStatus], [batchStrength], [batchStartDate], [batchEndDate]) VALUES (39, N'BA038', N'TWI', N'CR029', 1, 20, CAST(N'2020-06-29' AS Date), CAST(N'2020-11-26' AS Date))
GO
INSERT [dbo].[batches] ([id], [batchId], [batchName], [batchCourseId], [batchStatus], [batchStrength], [batchStartDate], [batchEndDate]) VALUES (40, N'BA039', N'TUK', N'CR034', 1, 25, CAST(N'2020-03-30' AS Date), CAST(N'2020-08-27' AS Date))
GO
INSERT [dbo].[batches] ([id], [batchId], [batchName], [batchCourseId], [batchStatus], [batchStrength], [batchStartDate], [batchEndDate]) VALUES (41, N'BA040', N'BAK', N'CR030', 1, 20, CAST(N'2021-07-05' AS Date), CAST(N'2021-12-02' AS Date))
GO
INSERT [dbo].[batches] ([id], [batchId], [batchName], [batchCourseId], [batchStatus], [batchStrength], [batchStartDate], [batchEndDate]) VALUES (42, N'BA041', N'FRE', N'CR022', 1, 25, CAST(N'2021-04-29' AS Date), CAST(N'2021-09-26' AS Date))
GO
INSERT [dbo].[batches] ([id], [batchId], [batchName], [batchCourseId], [batchStatus], [batchStrength], [batchStartDate], [batchEndDate]) VALUES (43, N'BA042', N'TAH', N'CR018', 1, 20, CAST(N'2021-11-11' AS Date), CAST(N'2022-04-10' AS Date))
GO
INSERT [dbo].[batches] ([id], [batchId], [batchName], [batchCourseId], [batchStatus], [batchStrength], [batchStartDate], [batchEndDate]) VALUES (44, N'BA043', N'EWE', N'CR035', 1, 25, CAST(N'2020-07-08' AS Date), CAST(N'2020-12-05' AS Date))
GO
INSERT [dbo].[batches] ([id], [batchId], [batchName], [batchCourseId], [batchStatus], [batchStrength], [batchStartDate], [batchEndDate]) VALUES (45, N'BA044', N'IKU', N'CR031', 1, 20, CAST(N'2020-12-07' AS Date), CAST(N'2021-05-06' AS Date))
GO
INSERT [dbo].[batches] ([id], [batchId], [batchName], [batchCourseId], [batchStatus], [batchStrength], [batchStartDate], [batchEndDate]) VALUES (46, N'BA045', N'OJI', N'CR003', 1, 25, CAST(N'2021-01-26' AS Date), CAST(N'2021-06-25' AS Date))
GO
INSERT [dbo].[batches] ([id], [batchId], [batchName], [batchCourseId], [batchStatus], [batchStrength], [batchStartDate], [batchEndDate]) VALUES (47, N'BA046', N'XHO', N'CR027', 1, 20, CAST(N'2021-09-22' AS Date), CAST(N'2022-02-19' AS Date))
GO
INSERT [dbo].[batches] ([id], [batchId], [batchName], [batchCourseId], [batchStatus], [batchStrength], [batchStartDate], [batchEndDate]) VALUES (48, N'BA047', N'HUN', N'CR016', 1, 25, CAST(N'2020-10-16' AS Date), CAST(N'2021-03-15' AS Date))
GO
INSERT [dbo].[batches] ([id], [batchId], [batchName], [batchCourseId], [batchStatus], [batchStrength], [batchStartDate], [batchEndDate]) VALUES (49, N'BA048', N'ORM', N'CR032', 1, 20, CAST(N'2020-08-14' AS Date), CAST(N'2021-01-11' AS Date))
GO
INSERT [dbo].[batches] ([id], [batchId], [batchName], [batchCourseId], [batchStatus], [batchStrength], [batchStartDate], [batchEndDate]) VALUES (50, N'BA049', N'SSW', N'CR023', 1, 25, CAST(N'2020-08-08' AS Date), CAST(N'2021-01-05' AS Date))
GO
SET IDENTITY_INSERT [dbo].[batches] OFF
GO
SET IDENTITY_INSERT [dbo].[category] ON 
GO
INSERT [dbo].[category] ([categoryId], [categoryName], [categoryStatus], [categoryComments]) VALUES (1, N'JAVA', 1, N'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum')
GO
INSERT [dbo].[category] ([categoryId], [categoryName], [categoryStatus], [categoryComments]) VALUES (2, N'PYTHON', 1, N'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum')
GO
INSERT [dbo].[category] ([categoryId], [categoryName], [categoryStatus], [categoryComments]) VALUES (3, N'DOT NET', 1, N'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum')
GO
INSERT [dbo].[category] ([categoryId], [categoryName], [categoryStatus], [categoryComments]) VALUES (4, N'TESTING', 1, N'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum')
GO
INSERT [dbo].[category] ([categoryId], [categoryName], [categoryStatus], [categoryComments]) VALUES (5, N'OTHER', 1, N'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum')
GO
INSERT [dbo].[category] ([categoryId], [categoryName], [categoryStatus], [categoryComments]) VALUES (6, N'MARKETING', 1, N'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum')
GO
INSERT [dbo].[category] ([categoryId], [categoryName], [categoryStatus], [categoryComments]) VALUES (7, N'Java & .NET', 1, N'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum')
GO
SET IDENTITY_INSERT [dbo].[category] OFF
GO
INSERT [dbo].[course_enrollment] ([id], [userId], [courseId], [batchId], [enrollStatus], [score]) VALUES (1, 1060, 20, 10, N'ENQUIRED', 0)
GO
INSERT [dbo].[course_enrollment] ([id], [userId], [courseId], [batchId], [enrollStatus], [score]) VALUES (2, 181, 22, 47, N'ENQUIRED', 0)
GO
INSERT [dbo].[course_enrollment] ([id], [userId], [courseId], [batchId], [enrollStatus], [score]) VALUES (3, 614, 47, 29, N'REJECTED', 100)
GO
INSERT [dbo].[course_enrollment] ([id], [userId], [courseId], [batchId], [enrollStatus], [score]) VALUES (4, 131, 15, 43, N'ENQUIRED', 100)
GO
INSERT [dbo].[course_enrollment] ([id], [userId], [courseId], [batchId], [enrollStatus], [score]) VALUES (5, 91, 39, 12, N'COMPLETED', 100)
GO
INSERT [dbo].[course_enrollment] ([id], [userId], [courseId], [batchId], [enrollStatus], [score]) VALUES (6, 178, 36, 22, N'ENROLLED', 0)
GO
INSERT [dbo].[course_enrollment] ([id], [userId], [courseId], [batchId], [enrollStatus], [score]) VALUES (7, 272, 27, 33, N'COMPLETED', 100)
GO
INSERT [dbo].[course_enrollment] ([id], [userId], [courseId], [batchId], [enrollStatus], [score]) VALUES (8, 396, 31, 29, N'REJECTED', 0)
GO
INSERT [dbo].[course_enrollment] ([id], [userId], [courseId], [batchId], [enrollStatus], [score]) VALUES (9, 612, 40, 34, N'ENQUIRED', 100)
GO
INSERT [dbo].[course_enrollment] ([id], [userId], [courseId], [batchId], [enrollStatus], [score]) VALUES (10, 1412, 32, 42, N'COMPLETED', 0)
GO
INSERT [dbo].[course_enrollment] ([id], [userId], [courseId], [batchId], [enrollStatus], [score]) VALUES (11, 144, 25, 10, N'COMPLETED', 0)
GO
INSERT [dbo].[course_enrollment] ([id], [userId], [courseId], [batchId], [enrollStatus], [score]) VALUES (12, 886, 28, 42, N'COMPLETED', 0)
GO
INSERT [dbo].[course_enrollment] ([id], [userId], [courseId], [batchId], [enrollStatus], [score]) VALUES (13, 1372, 34, 50, N'ENQUIRED', 100)
GO
INSERT [dbo].[course_enrollment] ([id], [userId], [courseId], [batchId], [enrollStatus], [score]) VALUES (14, 922, 40, 19, N'ENROLLED', 100)
GO
INSERT [dbo].[course_enrollment] ([id], [userId], [courseId], [batchId], [enrollStatus], [score]) VALUES (15, 79, 23, 12, N'COMPLETED', 0)
GO
INSERT [dbo].[course_enrollment] ([id], [userId], [courseId], [batchId], [enrollStatus], [score]) VALUES (16, 1000, 25, 23, N'COMPLETED', 100)
GO
INSERT [dbo].[course_enrollment] ([id], [userId], [courseId], [batchId], [enrollStatus], [score]) VALUES (17, 737, 28, 48, N'ENROLLED', 0)
GO
INSERT [dbo].[course_enrollment] ([id], [userId], [courseId], [batchId], [enrollStatus], [score]) VALUES (18, 1274, 19, 24, N'ENQUIRED', 100)
GO
INSERT [dbo].[course_enrollment] ([id], [userId], [courseId], [batchId], [enrollStatus], [score]) VALUES (19, 87, 37, 39, N'ENQUIRED', 0)
GO
INSERT [dbo].[course_enrollment] ([id], [userId], [courseId], [batchId], [enrollStatus], [score]) VALUES (20, 1463, 49, 2, N'REJECTED', 100)
GO
INSERT [dbo].[course_enrollment] ([id], [userId], [courseId], [batchId], [enrollStatus], [score]) VALUES (21, 562, 9, 32, N'COMPLETED', 0)
GO
INSERT [dbo].[course_enrollment] ([id], [userId], [courseId], [batchId], [enrollStatus], [score]) VALUES (22, 149, 13, 36, N'COMPLETED', 100)
GO
INSERT [dbo].[course_enrollment] ([id], [userId], [courseId], [batchId], [enrollStatus], [score]) VALUES (23, 986, 12, 30, N'ENROLLED', 100)
GO
INSERT [dbo].[course_enrollment] ([id], [userId], [courseId], [batchId], [enrollStatus], [score]) VALUES (24, 400, 14, 24, N'ENQUIRED', 100)
GO
INSERT [dbo].[course_enrollment] ([id], [userId], [courseId], [batchId], [enrollStatus], [score]) VALUES (25, 527, 29, 29, N'ENQUIRED', 100)
GO
INSERT [dbo].[course_enrollment] ([id], [userId], [courseId], [batchId], [enrollStatus], [score]) VALUES (26, 863, 34, 12, N'REJECTED', 100)
GO
INSERT [dbo].[course_enrollment] ([id], [userId], [courseId], [batchId], [enrollStatus], [score]) VALUES (27, 812, 11, 12, N'COMPLETED', 100)
GO
INSERT [dbo].[course_enrollment] ([id], [userId], [courseId], [batchId], [enrollStatus], [score]) VALUES (28, 1030, 10, 45, N'ENQUIRED', 100)
GO
INSERT [dbo].[course_enrollment] ([id], [userId], [courseId], [batchId], [enrollStatus], [score]) VALUES (29, 1120, 35, 3, N'ENROLLED', 100)
GO
INSERT [dbo].[course_enrollment] ([id], [userId], [courseId], [batchId], [enrollStatus], [score]) VALUES (30, 1524, 29, 8, N'ENROLLED', 0)
GO
INSERT [dbo].[course_enrollment] ([id], [userId], [courseId], [batchId], [enrollStatus], [score]) VALUES (31, 871, 8, 33, N'ENROLLED', 100)
GO
INSERT [dbo].[course_enrollment] ([id], [userId], [courseId], [batchId], [enrollStatus], [score]) VALUES (32, 426, 15, 8, N'ENROLLED', 0)
GO
INSERT [dbo].[course_enrollment] ([id], [userId], [courseId], [batchId], [enrollStatus], [score]) VALUES (33, 353, 25, 35, N'COMPLETED', 0)
GO
INSERT [dbo].[course_enrollment] ([id], [userId], [courseId], [batchId], [enrollStatus], [score]) VALUES (34, 175, 44, 44, N'REJECTED', 0)
GO
INSERT [dbo].[course_enrollment] ([id], [userId], [courseId], [batchId], [enrollStatus], [score]) VALUES (35, 1530, 37, 28, N'ENROLLED', 0)
GO
INSERT [dbo].[course_enrollment] ([id], [userId], [courseId], [batchId], [enrollStatus], [score]) VALUES (36, 1413, 29, 32, N'ENROLLED', 0)
GO
INSERT [dbo].[course_enrollment] ([id], [userId], [courseId], [batchId], [enrollStatus], [score]) VALUES (37, 1152, 43, 8, N'COMPLETED', 100)
GO
INSERT [dbo].[course_enrollment] ([id], [userId], [courseId], [batchId], [enrollStatus], [score]) VALUES (38, 144, 18, 10, N'ENROLLED', 100)
GO
INSERT [dbo].[course_enrollment] ([id], [userId], [courseId], [batchId], [enrollStatus], [score]) VALUES (39, 1391, 16, 32, N'REJECTED', 100)
GO
INSERT [dbo].[course_enrollment] ([id], [userId], [courseId], [batchId], [enrollStatus], [score]) VALUES (40, 736, 39, 19, N'ENQUIRED', 0)
GO
INSERT [dbo].[course_enrollment] ([id], [userId], [courseId], [batchId], [enrollStatus], [score]) VALUES (41, 1564, 32, 7, N'REJECTED', 0)
GO
INSERT [dbo].[course_enrollment] ([id], [userId], [courseId], [batchId], [enrollStatus], [score]) VALUES (42, 283, 18, 38, N'ENQUIRED', 100)
GO
INSERT [dbo].[course_enrollment] ([id], [userId], [courseId], [batchId], [enrollStatus], [score]) VALUES (43, 582, 39, 16, N'REJECTED', 0)
GO
INSERT [dbo].[course_enrollment] ([id], [userId], [courseId], [batchId], [enrollStatus], [score]) VALUES (44, 226, 36, 9, N'ENQUIRED', 100)
GO
INSERT [dbo].[course_enrollment] ([id], [userId], [courseId], [batchId], [enrollStatus], [score]) VALUES (45, 1443, 15, 40, N'ENQUIRED', 100)
GO
INSERT [dbo].[course_enrollment] ([id], [userId], [courseId], [batchId], [enrollStatus], [score]) VALUES (46, 7, 25, 47, N'ENQUIRED', 0)
GO
INSERT [dbo].[course_enrollment] ([id], [userId], [courseId], [batchId], [enrollStatus], [score]) VALUES (47, 468, 40, 5, N'ENROLLED', 0)
GO
INSERT [dbo].[course_enrollment] ([id], [userId], [courseId], [batchId], [enrollStatus], [score]) VALUES (48, 6, 18, 40, N'ENROLLED', 0)
GO
INSERT [dbo].[course_enrollment] ([id], [userId], [courseId], [batchId], [enrollStatus], [score]) VALUES (49, 95, 47, 5, N'COMPLETED', 0)
GO
INSERT [dbo].[course_enrollment] ([id], [userId], [courseId], [batchId], [enrollStatus], [score]) VALUES (50, 1142, 47, 13, N'COMPLETED', 0)
GO
SET IDENTITY_INSERT [dbo].[courses] ON 
GO
INSERT [dbo].[courses] ([id], [courseId], [courseName], [courseCategoryId], [courseDuration], [courseDescription], [courseInstructorID], [courseMinQualificationId], [courseBatchSize], [courseVideoLink], [courseRating], [courseStatus]) VALUES (8, N'CR000', N'JAVA FULL STACK WITH ANGULAR', 1, N'6', N'ng through collaboration with community partners ', 5, 2, 20, N'https://www.youtube.com/watch?v=QH2-TGUlwu4', 1, 1)
GO
INSERT [dbo].[courses] ([id], [courseId], [courseName], [courseCategoryId], [courseDuration], [courseDescription], [courseInstructorID], [courseMinQualificationId], [courseBatchSize], [courseVideoLink], [courseRating], [courseStatus]) VALUES (9, N'CR001', N'DATA SCIENCE', 5, N'6', N'ng through collaboration with community partners ', 10, 1, 25, N'https://www.youtube.com/watch?v=QH2-TGUlwu4', 1, 1)
GO
INSERT [dbo].[courses] ([id], [courseId], [courseName], [courseCategoryId], [courseDuration], [courseDescription], [courseInstructorID], [courseMinQualificationId], [courseBatchSize], [courseVideoLink], [courseRating], [courseStatus]) VALUES (10, N'CR002', N'ARTIFICIAL INTELLIGENCE', 5, N'6', N'ng through collaboration with community partners ', 5, 3, 20, N'https://www.youtube.com/watch?v=QH2-TGUlwu4', 1, 1)
GO
INSERT [dbo].[courses] ([id], [courseId], [courseName], [courseCategoryId], [courseDuration], [courseDescription], [courseInstructorID], [courseMinQualificationId], [courseBatchSize], [courseVideoLink], [courseRating], [courseStatus]) VALUES (11, N'CR003', N'GRAPHIC DESIGN', 5, N'12', N'ng through collaboration with community partners ', 8, 1, 25, N'https://www.youtube.com/watch?v=QH2-TGUlwu4', 1, 1)
GO
INSERT [dbo].[courses] ([id], [courseId], [courseName], [courseCategoryId], [courseDuration], [courseDescription], [courseInstructorID], [courseMinQualificationId], [courseBatchSize], [courseVideoLink], [courseRating], [courseStatus]) VALUES (12, N'CR004', N'CYBER SECURITY', 5, N'6', N'ng through collaboration with community partners ', 7, 3, 20, N'https://www.youtube.com/watch?v=QH2-TGUlwu4', 1, 1)
GO
INSERT [dbo].[courses] ([id], [courseId], [courseName], [courseCategoryId], [courseDuration], [courseDescription], [courseInstructorID], [courseMinQualificationId], [courseBatchSize], [courseVideoLink], [courseRating], [courseStatus]) VALUES (13, N'CR005', N'DATA ANALYTICS', 5, N'12', N'ng through collaboration with community partners ', 9, 1, 25, N'https://www.youtube.com/watch?v=QH2-TGUlwu4', 1, 1)
GO
INSERT [dbo].[courses] ([id], [courseId], [courseName], [courseCategoryId], [courseDuration], [courseDescription], [courseInstructorID], [courseMinQualificationId], [courseBatchSize], [courseVideoLink], [courseRating], [courseStatus]) VALUES (14, N'CR006', N'DIGITAL MARKETING', 6, N'6', N'ng through collaboration with community partners ', 10, 1, 25, N'https://www.youtube.com/watch?v=QH2-TGUlwu4', 1, 1)
GO
INSERT [dbo].[courses] ([id], [courseId], [courseName], [courseCategoryId], [courseDuration], [courseDescription], [courseInstructorID], [courseMinQualificationId], [courseBatchSize], [courseVideoLink], [courseRating], [courseStatus]) VALUES (15, N'CR007', N'SOCIAL MEDIA MARKETING', 6, N'12', N'ng through collaboration with community partners ', 3, 2, 25, N'https://www.youtube.com/watch?v=QH2-TGUlwu4', 1, 1)
GO
INSERT [dbo].[courses] ([id], [courseId], [courseName], [courseCategoryId], [courseDuration], [courseDescription], [courseInstructorID], [courseMinQualificationId], [courseBatchSize], [courseVideoLink], [courseRating], [courseStatus]) VALUES (16, N'CR008', N'PROGRAMMING', 5, N'12', N'ng through collaboration with community partners ', 5, 1, 20, N'https://www.youtube.com/watch?v=QH2-TGUlwu4', 1, 1)
GO
INSERT [dbo].[courses] ([id], [courseId], [courseName], [courseCategoryId], [courseDuration], [courseDescription], [courseInstructorID], [courseMinQualificationId], [courseBatchSize], [courseVideoLink], [courseRating], [courseStatus]) VALUES (17, N'CR009', N'FOREIGN LANGUAGE', 5, N'12', N'ng through collaboration with community partners ', 3, 1, 25, N'https://www.youtube.com/watch?v=QH2-TGUlwu4', 1, 1)
GO
INSERT [dbo].[courses] ([id], [courseId], [courseName], [courseCategoryId], [courseDuration], [courseDescription], [courseInstructorID], [courseMinQualificationId], [courseBatchSize], [courseVideoLink], [courseRating], [courseStatus]) VALUES (18, N'CR010', N'WEB DEVELOPMENT', 5, N'6', N'ng through collaboration with community partners ', 8, 2, 20, N'https://www.youtube.com/watch?v=QH2-TGUlwu4', 1, 1)
GO
INSERT [dbo].[courses] ([id], [courseId], [courseName], [courseCategoryId], [courseDuration], [courseDescription], [courseInstructorID], [courseMinQualificationId], [courseBatchSize], [courseVideoLink], [courseRating], [courseStatus]) VALUES (19, N'CR011', N'.NET FULL STACK WITH ANGULAR', 3, N'12', N'ng through collaboration with community partners ', 7, 1, 20, N'https://www.youtube.com/watch?v=QH2-TGUlwu4', 1, 1)
GO
INSERT [dbo].[courses] ([id], [courseId], [courseName], [courseCategoryId], [courseDuration], [courseDescription], [courseInstructorID], [courseMinQualificationId], [courseBatchSize], [courseVideoLink], [courseRating], [courseStatus]) VALUES (20, N'CR012', N'NODE FULL STACK WITH REACT', 5, N'12', N'ng through collaboration with community partners ', 10, 3, 25, N'https://www.youtube.com/watch?v=QH2-TGUlwu4', 1, 1)
GO
INSERT [dbo].[courses] ([id], [courseId], [courseName], [courseCategoryId], [courseDuration], [courseDescription], [courseInstructorID], [courseMinQualificationId], [courseBatchSize], [courseVideoLink], [courseRating], [courseStatus]) VALUES (21, N'CR013', N'FUNDAMENTAL MARKETING', 6, N'6', N'ng through collaboration with community partners ', 9, 3, 25, N'https://www.youtube.com/watch?v=QH2-TGUlwu4', 1, 1)
GO
INSERT [dbo].[courses] ([id], [courseId], [courseName], [courseCategoryId], [courseDuration], [courseDescription], [courseInstructorID], [courseMinQualificationId], [courseBatchSize], [courseVideoLink], [courseRating], [courseStatus]) VALUES (22, N'CR014', N'CONTENT MARKETING', 6, N'12', N'ng through collaboration with community partners ', 2, 3, 20, N'https://www.youtube.com/watch?v=QH2-TGUlwu4', 1, 1)
GO
INSERT [dbo].[courses] ([id], [courseId], [courseName], [courseCategoryId], [courseDuration], [courseDescription], [courseInstructorID], [courseMinQualificationId], [courseBatchSize], [courseVideoLink], [courseRating], [courseStatus]) VALUES (23, N'CR015', N'EMAIL MARKETING', 6, N'12', N'ng through collaboration with community partners ', 2, 3, 25, N'https://www.youtube.com/watch?v=QH2-TGUlwu4', 1, 1)
GO
INSERT [dbo].[courses] ([id], [courseId], [courseName], [courseCategoryId], [courseDuration], [courseDescription], [courseInstructorID], [courseMinQualificationId], [courseBatchSize], [courseVideoLink], [courseRating], [courseStatus]) VALUES (24, N'CR016', N'SEM', 5, N'12', N'ng through collaboration with community partners ', 7, 1, 25, N'https://www.youtube.com/watch?v=QH2-TGUlwu4', 1, 1)
GO
INSERT [dbo].[courses] ([id], [courseId], [courseName], [courseCategoryId], [courseDuration], [courseDescription], [courseInstructorID], [courseMinQualificationId], [courseBatchSize], [courseVideoLink], [courseRating], [courseStatus]) VALUES (25, N'CR017', N'SALES', 6, N'6', N'ng through collaboration with community partners ', 3, 3, 20, N'https://www.youtube.com/watch?v=QH2-TGUlwu4', 1, 1)
GO
INSERT [dbo].[courses] ([id], [courseId], [courseName], [courseCategoryId], [courseDuration], [courseDescription], [courseInstructorID], [courseMinQualificationId], [courseBatchSize], [courseVideoLink], [courseRating], [courseStatus]) VALUES (26, N'CR018', N'ECOMMERCE', 5, N'12', N'ng through collaboration with community partners ', 7, 2, 25, N'https://www.youtube.com/watch?v=QH2-TGUlwu4', 1, 1)
GO
INSERT [dbo].[courses] ([id], [courseId], [courseName], [courseCategoryId], [courseDuration], [courseDescription], [courseInstructorID], [courseMinQualificationId], [courseBatchSize], [courseVideoLink], [courseRating], [courseStatus]) VALUES (27, N'CR019', N'CODING', 5, N'6', N'ng through collaboration with community partners ', 5, 2, 25, N'https://www.youtube.com/watch?v=QH2-TGUlwu4', 1, 1)
GO
INSERT [dbo].[courses] ([id], [courseId], [courseName], [courseCategoryId], [courseDuration], [courseDescription], [courseInstructorID], [courseMinQualificationId], [courseBatchSize], [courseVideoLink], [courseRating], [courseStatus]) VALUES (28, N'CR020', N'PERSONAL & PROFESSIONAL DEVELOPMENT', 5, N'6', N'ng through collaboration with community partners ', 10, 1, 20, N'https://www.youtube.com/watch?v=QH2-TGUlwu4', 1, 1)
GO
INSERT [dbo].[courses] ([id], [courseId], [courseName], [courseCategoryId], [courseDuration], [courseDescription], [courseInstructorID], [courseMinQualificationId], [courseBatchSize], [courseVideoLink], [courseRating], [courseStatus]) VALUES (29, N'CR021', N'DESIGN', 5, N'6', N'ng through collaboration with community partners ', 6, 3, 25, N'https://www.youtube.com/watch?v=QH2-TGUlwu4', 1, 1)
GO
INSERT [dbo].[courses] ([id], [courseId], [courseName], [courseCategoryId], [courseDuration], [courseDescription], [courseInstructorID], [courseMinQualificationId], [courseBatchSize], [courseVideoLink], [courseRating], [courseStatus]) VALUES (30, N'CR022', N'ENTREPRENEURSHIP', 6, N'12', N'ng through collaboration with community partners ', 7, 3, 20, N'https://www.youtube.com/watch?v=QH2-TGUlwu4', 1, 1)
GO
INSERT [dbo].[courses] ([id], [courseId], [courseName], [courseCategoryId], [courseDuration], [courseDescription], [courseInstructorID], [courseMinQualificationId], [courseBatchSize], [courseVideoLink], [courseRating], [courseStatus]) VALUES (31, N'CR023', N'BUSINESS & FINANCE', 5, N'12', N'ng through collaboration with community partners ', 6, 1, 20, N'https://www.youtube.com/watch?v=QH2-TGUlwu4', 1, 1)
GO
INSERT [dbo].[courses] ([id], [courseId], [courseName], [courseCategoryId], [courseDuration], [courseDescription], [courseInstructorID], [courseMinQualificationId], [courseBatchSize], [courseVideoLink], [courseRating], [courseStatus]) VALUES (32, N'CR024', N'WRITING', 5, N'12', N'ng through collaboration with community partners ', 4, 1, 20, N'https://www.youtube.com/watch?v=QH2-TGUlwu4', 1, 1)
GO
INSERT [dbo].[courses] ([id], [courseId], [courseName], [courseCategoryId], [courseDuration], [courseDescription], [courseInstructorID], [courseMinQualificationId], [courseBatchSize], [courseVideoLink], [courseRating], [courseStatus]) VALUES (33, N'CR025', N'COMMUNICATION', 5, N'12', N'ng through collaboration with community partners ', 5, 1, 20, N'https://www.youtube.com/watch?v=QH2-TGUlwu4', 1, 1)
GO
INSERT [dbo].[courses] ([id], [courseId], [courseName], [courseCategoryId], [courseDuration], [courseDescription], [courseInstructorID], [courseMinQualificationId], [courseBatchSize], [courseVideoLink], [courseRating], [courseStatus]) VALUES (34, N'CR026', N'HUMANITIES', 5, N'12', N'ng through collaboration with community partners ', 10, 2, 25, N'https://www.youtube.com/watch?v=QH2-TGUlwu4', 1, 1)
GO
INSERT [dbo].[courses] ([id], [courseId], [courseName], [courseCategoryId], [courseDuration], [courseDescription], [courseInstructorID], [courseMinQualificationId], [courseBatchSize], [courseVideoLink], [courseRating], [courseStatus]) VALUES (35, N'CR027', N'LANGUAGES', 5, N'6', N'ng through collaboration with community partners ', 4, 2, 25, N'https://www.youtube.com/watch?v=QH2-TGUlwu4', 1, 1)
GO
INSERT [dbo].[courses] ([id], [courseId], [courseName], [courseCategoryId], [courseDuration], [courseDescription], [courseInstructorID], [courseMinQualificationId], [courseBatchSize], [courseVideoLink], [courseRating], [courseStatus]) VALUES (36, N'CR028', N'PYTHON FULL STACK WITH ANGULAR', 2, N'6', N'ng through collaboration with community partners ', 8, 3, 20, N'https://www.youtube.com/watch?v=QH2-TGUlwu4', 1, 1)
GO
INSERT [dbo].[courses] ([id], [courseId], [courseName], [courseCategoryId], [courseDuration], [courseDescription], [courseInstructorID], [courseMinQualificationId], [courseBatchSize], [courseVideoLink], [courseRating], [courseStatus]) VALUES (37, N'CR029', N'.NET+ MICROSOFT DYNAMICS', 3, N'6', N'ng through collaboration with community partners ', 10, 1, 25, N'https://www.youtube.com/watch?v=QH2-TGUlwu4', 1, 1)
GO
INSERT [dbo].[courses] ([id], [courseId], [courseName], [courseCategoryId], [courseDuration], [courseDescription], [courseInstructorID], [courseMinQualificationId], [courseBatchSize], [courseVideoLink], [courseRating], [courseStatus]) VALUES (38, N'CR030', N'SDET- TEST AUTOMATION', 4, N'6', N'ng through collaboration with community partners ', 6, 3, 25, N'https://www.youtube.com/watch?v=QH2-TGUlwu4', 1, 1)
GO
INSERT [dbo].[courses] ([id], [courseId], [courseName], [courseCategoryId], [courseDuration], [courseDescription], [courseInstructorID], [courseMinQualificationId], [courseBatchSize], [courseVideoLink], [courseRating], [courseStatus]) VALUES (39, N'CR031', N'JAVA -GENERIC', 1, N'12', N'ng through collaboration with community partners ', 8, 1, 25, N'https://www.youtube.com/watch?v=QH2-TGUlwu4', 1, 1)
GO
INSERT [dbo].[courses] ([id], [courseId], [courseName], [courseCategoryId], [courseDuration], [courseDescription], [courseInstructorID], [courseMinQualificationId], [courseBatchSize], [courseVideoLink], [courseRating], [courseStatus]) VALUES (40, N'CR032', N'ASP.NET', 3, N'12', N'ng through collaboration with community partners ', 2, 3, 25, N'https://www.youtube.com/watch?v=QH2-TGUlwu4', 1, 1)
GO
INSERT [dbo].[courses] ([id], [courseId], [courseName], [courseCategoryId], [courseDuration], [courseDescription], [courseInstructorID], [courseMinQualificationId], [courseBatchSize], [courseVideoLink], [courseRating], [courseStatus]) VALUES (41, N'CR033', N'JAVA.NET', 7, N'6', N'ng through collaboration with community partners ', 7, 1, 25, N'https://www.youtube.com/watch?v=QH2-TGUlwu4', 1, 1)
GO
INSERT [dbo].[courses] ([id], [courseId], [courseName], [courseCategoryId], [courseDuration], [courseDescription], [courseInstructorID], [courseMinQualificationId], [courseBatchSize], [courseVideoLink], [courseRating], [courseStatus]) VALUES (42, N'CR034', N'JAVA', 1, N'12', N'ng through collaboration with community partners ', 10, 2, 25, N'https://www.youtube.com/watch?v=QH2-TGUlwu4', 1, 1)
GO
INSERT [dbo].[courses] ([id], [courseId], [courseName], [courseCategoryId], [courseDuration], [courseDescription], [courseInstructorID], [courseMinQualificationId], [courseBatchSize], [courseVideoLink], [courseRating], [courseStatus]) VALUES (43, N'CR035', N'POPEL(.NET)', 3, N'6', N'ng through collaboration with community partners ', 2, 2, 20, N'https://www.youtube.com/watch?v=QH2-TGUlwu4', 1, 1)
GO
INSERT [dbo].[courses] ([id], [courseId], [courseName], [courseCategoryId], [courseDuration], [courseDescription], [courseInstructorID], [courseMinQualificationId], [courseBatchSize], [courseVideoLink], [courseRating], [courseStatus]) VALUES (44, N'CR036', N'TESTING', 4, N'6', N'ng through collaboration with community partners ', 6, 1, 25, N'https://www.youtube.com/watch?v=QH2-TGUlwu4', 1, 1)
GO
INSERT [dbo].[courses] ([id], [courseId], [courseName], [courseCategoryId], [courseDuration], [courseDescription], [courseInstructorID], [courseMinQualificationId], [courseBatchSize], [courseVideoLink], [courseRating], [courseStatus]) VALUES (45, N'CR037', N'IPATH', 5, N'6', N'ng through collaboration with community partners ', 6, 1, 25, N'https://www.youtube.com/watch?v=QH2-TGUlwu4', 1, 1)
GO
INSERT [dbo].[courses] ([id], [courseId], [courseName], [courseCategoryId], [courseDuration], [courseDescription], [courseInstructorID], [courseMinQualificationId], [courseBatchSize], [courseVideoLink], [courseRating], [courseStatus]) VALUES (46, N'CR038', N'.NET', 3, N'6', N'ng through collaboration with community partners ', 10, 3, 20, N'https://www.youtube.com/watch?v=QH2-TGUlwu4', 1, 1)
GO
INSERT [dbo].[courses] ([id], [courseId], [courseName], [courseCategoryId], [courseDuration], [courseDescription], [courseInstructorID], [courseMinQualificationId], [courseBatchSize], [courseVideoLink], [courseRating], [courseStatus]) VALUES (47, N'CR039', N'EDGE .NET', 3, N'6', N'ng through collaboration with community partners ', 2, 3, 25, N'https://www.youtube.com/watch?v=QH2-TGUlwu4', 1, 1)
GO
INSERT [dbo].[courses] ([id], [courseId], [courseName], [courseCategoryId], [courseDuration], [courseDescription], [courseInstructorID], [courseMinQualificationId], [courseBatchSize], [courseVideoLink], [courseRating], [courseStatus]) VALUES (48, N'CR040', N'EDGE JAVA', 1, N'6', N'ng through collaboration with community partners ', 8, 1, 20, N'https://www.youtube.com/watch?v=QH2-TGUlwu4', 1, 1)
GO
INSERT [dbo].[courses] ([id], [courseId], [courseName], [courseCategoryId], [courseDuration], [courseDescription], [courseInstructorID], [courseMinQualificationId], [courseBatchSize], [courseVideoLink], [courseRating], [courseStatus]) VALUES (49, N'CR041', N'EDGE-INFRA', 5, N'6', N'ng through collaboration with community partners ', 2, 1, 20, N'https://www.youtube.com/watch?v=QH2-TGUlwu4', 1, 1)
GO
INSERT [dbo].[courses] ([id], [courseId], [courseName], [courseCategoryId], [courseDuration], [courseDescription], [courseInstructorID], [courseMinQualificationId], [courseBatchSize], [courseVideoLink], [courseRating], [courseStatus]) VALUES (50, N'CR042', N'ITCP', 5, N'12', N'ng through collaboration with community partners ', 4, 1, 20, N'https://www.youtube.com/watch?v=QH2-TGUlwu4', 1, 1)
GO
SET IDENTITY_INSERT [dbo].[courses] OFF
GO
INSERT [dbo].[enquiries] ([enquiryId], [enquiryCode], [enquiryUserId], [enquiryCourseId], [enquiryDescription], [enquiryStatus], [enquiryUpdate]) VALUES (1, N'EN0000', 35, 14, N'Quibusdam eos reprehenderit. Ullam nemo quo. Nostrum nihil quisquam. Sed possimus dolorem. Nemo tempore repellat. Similique ipsa quia! Assumenda asperiores.', 1, N'ON_REVIEW')
GO
INSERT [dbo].[enquiries] ([enquiryId], [enquiryCode], [enquiryUserId], [enquiryCourseId], [enquiryDescription], [enquiryStatus], [enquiryUpdate]) VALUES (2, N'EN0001', 22, 8, N'Sed aut ut qui. Saepe vitae quis. Quae officia qui ut accusantium. Obcaecati itaque et! Veniam rerum inventore; porro eos error.', 1, N'ENQUIRED')
GO
INSERT [dbo].[enquiries] ([enquiryId], [enquiryCode], [enquiryUserId], [enquiryCourseId], [enquiryDescription], [enquiryStatus], [enquiryUpdate]) VALUES (3, N'EN0002', 43, 13, N'Reprehenderit sit est. Quia aut a. Illo pariatur voluptas! Cupiditate doloremque odit; cum delectus unde? Alias sit ut; sunt fugiat totam.', 1, N'ENQUIRED')
GO
INSERT [dbo].[enquiries] ([enquiryId], [enquiryCode], [enquiryUserId], [enquiryCourseId], [enquiryDescription], [enquiryStatus], [enquiryUpdate]) VALUES (4, N'EN0003', 6, 11, N'Molestias natus minima necessitatibus repudiandae nesciunt doloremque. Sit molestiae fugit itaque assumenda omnis? Dignissimos ratione eligendi. Architecto.', 1, N'ENQUIRED')
GO
INSERT [dbo].[enquiries] ([enquiryId], [enquiryCode], [enquiryUserId], [enquiryCourseId], [enquiryDescription], [enquiryStatus], [enquiryUpdate]) VALUES (5, N'EN0004', 2, 10, N'Sed hic explicabo repudiandae ab aperiam facere. Unde quae ipsa quos porro incidunt et...', 1, N'REJECTED')
GO
INSERT [dbo].[enquiries] ([enquiryId], [enquiryCode], [enquiryUserId], [enquiryCourseId], [enquiryDescription], [enquiryStatus], [enquiryUpdate]) VALUES (6, N'EN0005', 48, 9, N'Nulla illum sint. Rem ipsam rerum. Adipisci eligendi reiciendis! Vitae omnis quis? Et nihil cupiditate! Placeat quia iure. Delectus neque labore. Maiores.', 1, N'ENQUIRED')
GO
INSERT [dbo].[enquiries] ([enquiryId], [enquiryCode], [enquiryUserId], [enquiryCourseId], [enquiryDescription], [enquiryStatus], [enquiryUpdate]) VALUES (7, N'EN0006', 15, 15, N'Sed nobis maiores omnis dolorem a. Qui consequatur dolor omnis rerum molestiae? Voluptates qui velit aut! Magni ut saepe.', 1, N'ENQUIRED')
GO
INSERT [dbo].[enquiries] ([enquiryId], [enquiryCode], [enquiryUserId], [enquiryCourseId], [enquiryDescription], [enquiryStatus], [enquiryUpdate]) VALUES (8, N'EN0007', 15, 12, N'Laborum qui exercitationem. Voluptatem illum quae! Autem aut deserunt voluptas deleniti? Harum sapiente sunt tempora facere iusto repudiandae.', 1, N'ENQUIRED')
GO
SET IDENTITY_INSERT [dbo].[instructor] ON 
GO
INSERT [dbo].[instructor] ([instructorId], [instructorCode], [instructorName], [instructorEmail], [instructorPhone]) VALUES (1, N'IN01', N'Rajesh', N'Rajesh2@gmail.com', N'9996813745')
GO
INSERT [dbo].[instructor] ([instructorId], [instructorCode], [instructorName], [instructorEmail], [instructorPhone]) VALUES (2, N'IN02', N'Ramesh', N'Ramesh1@gmail.com', N'9897124845')
GO
INSERT [dbo].[instructor] ([instructorId], [instructorCode], [instructorName], [instructorEmail], [instructorPhone]) VALUES (3, N'IN03', N'Suresh', N'Suresh2@gmail.com', N'9753943227')
GO
INSERT [dbo].[instructor] ([instructorId], [instructorCode], [instructorName], [instructorEmail], [instructorPhone]) VALUES (4, N'IN04', N'Ganesh', N'Ganesh5@gmail.com', N'9921086435')
GO
INSERT [dbo].[instructor] ([instructorId], [instructorCode], [instructorName], [instructorEmail], [instructorPhone]) VALUES (5, N'IN05', N'Mahesh', N'Mahesh7@gmail.com', N'9746870854')
GO
INSERT [dbo].[instructor] ([instructorId], [instructorCode], [instructorName], [instructorEmail], [instructorPhone]) VALUES (6, N'IN06', N'Rakesh', N'Rakesh2@gmail.com', N'9794263568')
GO
INSERT [dbo].[instructor] ([instructorId], [instructorCode], [instructorName], [instructorEmail], [instructorPhone]) VALUES (7, N'IN07', N'Sachin', N'Sachin1@gmail.com', N'9892417921')
GO
INSERT [dbo].[instructor] ([instructorId], [instructorCode], [instructorName], [instructorEmail], [instructorPhone]) VALUES (8, N'IN08', N'Sandeep', N'Sandeep5@gmail.com', N'9914088443')
GO
INSERT [dbo].[instructor] ([instructorId], [instructorCode], [instructorName], [instructorEmail], [instructorPhone]) VALUES (9, N'IN09', N'Srinivas', N'Srinivas4@gmail.com', N'9937643221')
GO
INSERT [dbo].[instructor] ([instructorId], [instructorCode], [instructorName], [instructorEmail], [instructorPhone]) VALUES (10, N'IN010', N'Sudhir', N'Sudhir1@gmail.com', N'9932202111')
GO
SET IDENTITY_INSERT [dbo].[instructor] OFF
GO
SET IDENTITY_INSERT [dbo].[qualifications] ON 
GO
INSERT [dbo].[qualifications] ([qualificationId], [qualificationName], [qualificationStatus], [qualificationPriority]) VALUES (1, N'High School', 1, 0)
GO
INSERT [dbo].[qualifications] ([qualificationId], [qualificationName], [qualificationStatus], [qualificationPriority]) VALUES (2, N'Higher Secondary', 1, 1)
GO
INSERT [dbo].[qualifications] ([qualificationId], [qualificationName], [qualificationStatus], [qualificationPriority]) VALUES (3, N'Under Graduate', 1, 2)
GO
INSERT [dbo].[qualifications] ([qualificationId], [qualificationName], [qualificationStatus], [qualificationPriority]) VALUES (4, N'Post Graduate', 1, 3)
GO
INSERT [dbo].[qualifications] ([qualificationId], [qualificationName], [qualificationStatus], [qualificationPriority]) VALUES (5, N'Ph. D', 1, 4)
GO
SET IDENTITY_INSERT [dbo].[qualifications] OFF
GO
SET IDENTITY_INSERT [dbo].[role] ON 
GO
INSERT [dbo].[role] ([roleId], [roleName]) VALUES (1, N'Admin')
GO
INSERT [dbo].[role] ([roleId], [roleName]) VALUES (2, N'User')
GO
SET IDENTITY_INSERT [dbo].[role] OFF
GO
INSERT [dbo].[user_batch] ([id], [userId], [batchId]) VALUES (1, 3, 31)
GO
INSERT [dbo].[user_batch] ([id], [userId], [batchId]) VALUES (2, 4, 50)
GO
INSERT [dbo].[user_batch] ([id], [userId], [batchId]) VALUES (3, 5, 18)
GO
INSERT [dbo].[user_batch] ([id], [userId], [batchId]) VALUES (4, 6, 6)
GO
INSERT [dbo].[user_batch] ([id], [userId], [batchId]) VALUES (5, 7, 26)
GO
INSERT [dbo].[user_batch] ([id], [userId], [batchId]) VALUES (6, 8, 37)
GO
INSERT [dbo].[user_batch] ([id], [userId], [batchId]) VALUES (7, 9, 43)
GO
INSERT [dbo].[user_batch] ([id], [userId], [batchId]) VALUES (8, 10, 32)
GO
INSERT [dbo].[user_batch] ([id], [userId], [batchId]) VALUES (9, 11, 38)
GO
INSERT [dbo].[user_batch] ([id], [userId], [batchId]) VALUES (10, 12, 1)
GO
INSERT [dbo].[user_batch] ([id], [userId], [batchId]) VALUES (11, 13, 44)
GO
INSERT [dbo].[user_batch] ([id], [userId], [batchId]) VALUES (12, 14, 13)
GO
INSERT [dbo].[user_batch] ([id], [userId], [batchId]) VALUES (13, 15, 19)
GO
INSERT [dbo].[user_batch] ([id], [userId], [batchId]) VALUES (14, 16, 27)
GO
INSERT [dbo].[user_batch] ([id], [userId], [batchId]) VALUES (15, 17, 39)
GO
INSERT [dbo].[user_batch] ([id], [userId], [batchId]) VALUES (16, 18, 14)
GO
INSERT [dbo].[user_batch] ([id], [userId], [batchId]) VALUES (17, 19, 7)
GO
INSERT [dbo].[user_batch] ([id], [userId], [batchId]) VALUES (18, 20, 20)
GO
INSERT [dbo].[user_batch] ([id], [userId], [batchId]) VALUES (19, 21, 47)
GO
INSERT [dbo].[user_batch] ([id], [userId], [batchId]) VALUES (20, 22, 2)
GO
INSERT [dbo].[user_batch] ([id], [userId], [batchId]) VALUES (21, 23, 15)
GO
INSERT [dbo].[user_batch] ([id], [userId], [batchId]) VALUES (22, 24, 34)
GO
INSERT [dbo].[user_batch] ([id], [userId], [batchId]) VALUES (23, 25, 45)
GO
INSERT [dbo].[user_batch] ([id], [userId], [batchId]) VALUES (24, 26, 21)
GO
INSERT [dbo].[user_batch] ([id], [userId], [batchId]) VALUES (25, 27, 40)
GO
INSERT [dbo].[user_batch] ([id], [userId], [batchId]) VALUES (26, 28, 48)
GO
INSERT [dbo].[user_batch] ([id], [userId], [batchId]) VALUES (27, 29, 16)
GO
INSERT [dbo].[user_batch] ([id], [userId], [batchId]) VALUES (28, 30, 35)
GO
INSERT [dbo].[user_batch] ([id], [userId], [batchId]) VALUES (29, 31, 8)
GO
INSERT [dbo].[user_batch] ([id], [userId], [batchId]) VALUES (30, 32, 3)
GO
INSERT [dbo].[user_batch] ([id], [userId], [batchId]) VALUES (31, 33, 46)
GO
INSERT [dbo].[user_batch] ([id], [userId], [batchId]) VALUES (32, 34, 49)
GO
INSERT [dbo].[user_batch] ([id], [userId], [batchId]) VALUES (33, 35, 22)
GO
INSERT [dbo].[user_batch] ([id], [userId], [batchId]) VALUES (34, 36, 41)
GO
INSERT [dbo].[user_batch] ([id], [userId], [batchId]) VALUES (35, 37, 33)
GO
INSERT [dbo].[user_batch] ([id], [userId], [batchId]) VALUES (36, 38, 17)
GO
INSERT [dbo].[user_batch] ([id], [userId], [batchId]) VALUES (37, 39, 12)
GO
INSERT [dbo].[user_batch] ([id], [userId], [batchId]) VALUES (38, 40, 28)
GO
INSERT [dbo].[user_batch] ([id], [userId], [batchId]) VALUES (39, 41, 23)
GO
INSERT [dbo].[user_batch] ([id], [userId], [batchId]) VALUES (40, 42, 9)
GO
INSERT [dbo].[user_batch] ([id], [userId], [batchId]) VALUES (41, 43, 36)
GO
INSERT [dbo].[user_batch] ([id], [userId], [batchId]) VALUES (42, 44, 29)
GO
INSERT [dbo].[user_batch] ([id], [userId], [batchId]) VALUES (43, 45, 24)
GO
INSERT [dbo].[user_batch] ([id], [userId], [batchId]) VALUES (44, 46, 4)
GO
INSERT [dbo].[user_batch] ([id], [userId], [batchId]) VALUES (45, 47, 42)
GO
INSERT [dbo].[user_batch] ([id], [userId], [batchId]) VALUES (46, 48, 10)
GO
INSERT [dbo].[user_batch] ([id], [userId], [batchId]) VALUES (47, 49, 5)
GO
INSERT [dbo].[user_batch] ([id], [userId], [batchId]) VALUES (48, 50, 11)
GO
INSERT [dbo].[user_batch] ([id], [userId], [batchId]) VALUES (49, 51, 30)
GO
INSERT [dbo].[user_batch] ([id], [userId], [batchId]) VALUES (50, 52, 25)
GO
SET IDENTITY_INSERT [dbo].[user_qualification] ON 
GO
INSERT [dbo].[user_qualification] ([id], [userId], [qualificationId]) VALUES (1, 3, 1)
GO
INSERT [dbo].[user_qualification] ([id], [userId], [qualificationId]) VALUES (2, 4, 3)
GO
INSERT [dbo].[user_qualification] ([id], [userId], [qualificationId]) VALUES (3, 5, 5)
GO
INSERT [dbo].[user_qualification] ([id], [userId], [qualificationId]) VALUES (4, 6, 4)
GO
INSERT [dbo].[user_qualification] ([id], [userId], [qualificationId]) VALUES (5, 7, 2)
GO
INSERT [dbo].[user_qualification] ([id], [userId], [qualificationId]) VALUES (6, 8, 4)
GO
INSERT [dbo].[user_qualification] ([id], [userId], [qualificationId]) VALUES (7, 9, 1)
GO
INSERT [dbo].[user_qualification] ([id], [userId], [qualificationId]) VALUES (8, 10, 3)
GO
INSERT [dbo].[user_qualification] ([id], [userId], [qualificationId]) VALUES (9, 11, 5)
GO
INSERT [dbo].[user_qualification] ([id], [userId], [qualificationId]) VALUES (10, 12, 2)
GO
INSERT [dbo].[user_qualification] ([id], [userId], [qualificationId]) VALUES (11, 13, 3)
GO
INSERT [dbo].[user_qualification] ([id], [userId], [qualificationId]) VALUES (12, 14, 4)
GO
INSERT [dbo].[user_qualification] ([id], [userId], [qualificationId]) VALUES (13, 15, 5)
GO
INSERT [dbo].[user_qualification] ([id], [userId], [qualificationId]) VALUES (14, 16, 2)
GO
INSERT [dbo].[user_qualification] ([id], [userId], [qualificationId]) VALUES (15, 17, 1)
GO
INSERT [dbo].[user_qualification] ([id], [userId], [qualificationId]) VALUES (16, 18, 1)
GO
INSERT [dbo].[user_qualification] ([id], [userId], [qualificationId]) VALUES (17, 19, 5)
GO
INSERT [dbo].[user_qualification] ([id], [userId], [qualificationId]) VALUES (18, 20, 3)
GO
INSERT [dbo].[user_qualification] ([id], [userId], [qualificationId]) VALUES (19, 21, 2)
GO
INSERT [dbo].[user_qualification] ([id], [userId], [qualificationId]) VALUES (20, 22, 4)
GO
INSERT [dbo].[user_qualification] ([id], [userId], [qualificationId]) VALUES (21, 23, 4)
GO
INSERT [dbo].[user_qualification] ([id], [userId], [qualificationId]) VALUES (22, 24, 3)
GO
INSERT [dbo].[user_qualification] ([id], [userId], [qualificationId]) VALUES (23, 25, 2)
GO
INSERT [dbo].[user_qualification] ([id], [userId], [qualificationId]) VALUES (24, 26, 1)
GO
INSERT [dbo].[user_qualification] ([id], [userId], [qualificationId]) VALUES (25, 27, 5)
GO
INSERT [dbo].[user_qualification] ([id], [userId], [qualificationId]) VALUES (26, 28, 3)
GO
INSERT [dbo].[user_qualification] ([id], [userId], [qualificationId]) VALUES (27, 29, 1)
GO
INSERT [dbo].[user_qualification] ([id], [userId], [qualificationId]) VALUES (28, 30, 2)
GO
INSERT [dbo].[user_qualification] ([id], [userId], [qualificationId]) VALUES (29, 31, 4)
GO
INSERT [dbo].[user_qualification] ([id], [userId], [qualificationId]) VALUES (30, 32, 5)
GO
INSERT [dbo].[user_qualification] ([id], [userId], [qualificationId]) VALUES (31, 33, 1)
GO
INSERT [dbo].[user_qualification] ([id], [userId], [qualificationId]) VALUES (32, 34, 3)
GO
INSERT [dbo].[user_qualification] ([id], [userId], [qualificationId]) VALUES (33, 35, 4)
GO
INSERT [dbo].[user_qualification] ([id], [userId], [qualificationId]) VALUES (34, 36, 5)
GO
INSERT [dbo].[user_qualification] ([id], [userId], [qualificationId]) VALUES (35, 37, 2)
GO
INSERT [dbo].[user_qualification] ([id], [userId], [qualificationId]) VALUES (36, 38, 5)
GO
INSERT [dbo].[user_qualification] ([id], [userId], [qualificationId]) VALUES (37, 39, 4)
GO
INSERT [dbo].[user_qualification] ([id], [userId], [qualificationId]) VALUES (38, 40, 2)
GO
INSERT [dbo].[user_qualification] ([id], [userId], [qualificationId]) VALUES (39, 41, 1)
GO
INSERT [dbo].[user_qualification] ([id], [userId], [qualificationId]) VALUES (40, 42, 3)
GO
INSERT [dbo].[user_qualification] ([id], [userId], [qualificationId]) VALUES (41, 43, 1)
GO
INSERT [dbo].[user_qualification] ([id], [userId], [qualificationId]) VALUES (42, 44, 4)
GO
INSERT [dbo].[user_qualification] ([id], [userId], [qualificationId]) VALUES (43, 45, 5)
GO
INSERT [dbo].[user_qualification] ([id], [userId], [qualificationId]) VALUES (44, 46, 3)
GO
INSERT [dbo].[user_qualification] ([id], [userId], [qualificationId]) VALUES (45, 47, 2)
GO
INSERT [dbo].[user_qualification] ([id], [userId], [qualificationId]) VALUES (46, 48, 4)
GO
INSERT [dbo].[user_qualification] ([id], [userId], [qualificationId]) VALUES (47, 49, 3)
GO
INSERT [dbo].[user_qualification] ([id], [userId], [qualificationId]) VALUES (48, 50, 5)
GO
INSERT [dbo].[user_qualification] ([id], [userId], [qualificationId]) VALUES (49, 51, 2)
GO
INSERT [dbo].[user_qualification] ([id], [userId], [qualificationId]) VALUES (50, 52, 1)
GO
SET IDENTITY_INSERT [dbo].[user_qualification] OFF
GO
SET IDENTITY_INSERT [dbo].[users] ON 
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (3, N'USER02', N'Teena Shajan', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'afswn_lahwty24@gmail.com', N'9889512000', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (4, N'USER03', N'Akash Jayan', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'gshtasb.mlk@gmail.com', N'9889512001', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (5, N'USER04', N'Akshay Jayan', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'manya16@yahoo.com', N'9889512002', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (6, N'USER05', N'J.Sharath', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'hmaywn_ghny@gmail.com', N'9889512003', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (7, N'USER06', N'Ashwin S.Kumar', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'aartam_frmanfrmaeyan@yahoo.com', N'9889512004', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (8, N'USER07', N'Eabin Charly', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'kambyz69@hotmail.com', N'9889512005', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (9, N'USER08', N'Cijo Cyriac', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'srwr_lajwrdy@hotmail.com', N'9889512006', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (10, N'USER09', N'Shambhu R.', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'zadbkht_mlayry@gmail.com', N'9889512007', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (11, N'USER010', N'N.K. Vyshnavi', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'mary47@yahoo.com', N'9889512008', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (12, N'USER011', N'Nirmal N. Nair', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'mhram.kawyany14@yahoo.com', N'9889512009', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (13, N'USER012', N'Alen Sunny', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'mana91@hotmail.com', N'9889512010', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (14, N'USER013', N'Arjun T.', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'yadgar.mzfr@hotmail.com', N'9889512011', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (15, N'USER014', N'Megharaj V.S', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'prychhr.nqybzadh@hotmail.com', N'9889512012', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (16, N'USER015', N'Ajmal Jalal', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'srwsh33@gmail.com', N'9889512013', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (17, N'USER016', N'Belbin Shibi', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'wys_nwbkhty65@yahoo.com', N'9889512014', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (18, N'USER017', N'Adeeba Basheer', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'bhark_azyzy9@hotmail.com', N'9889512015', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (19, N'USER018', N'Aiswarya A. R.', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'kywandkht_mlayry23@hotmail.com', N'9889512016', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (20, N'USER019', N'Bijil Varghese', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'yzdan.glmhmdy9@gmail.com', N'9889512017', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (21, N'USER020', N'Govind A. S.', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'khzad58@yahoo.com', N'9889512018', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (22, N'USER021', N'Krishnanandh N.', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'bhshad_qadhy@hotmail.com', N'9889512019', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (23, N'USER022', N'Krishnendu R. G.', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'aathrnwsh_fany@yahoo.com', N'9889512020', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (24, N'USER023', N'Muhammad Sadiq P. S.', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'prywsh62@hotmail.com', N'9889512021', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (25, N'USER024', N'Nandhu Krishnan E. D.', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'lbkhnd_mhmdy@hotmail.com', N'9889512022', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (26, N'USER025', N'Naveen Nandanan', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'hwrchhr77@gmail.com', N'9889512023', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (27, N'USER026', N'Prince Martin', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'ftanh_qanay42@yahoo.com', N'9889512024', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (28, N'USER027', N'Sreelakshmi N. M', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'rham.kamly@gmail.com', N'9889512025', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (29, N'USER028', N'Fasila Latheef', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'yawr28@hotmail.com', N'9889512026', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (30, N'USER029', N'Muhammed Afsal K. S.', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'yganh_msbah@yahoo.com', N'9889512027', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (31, N'USER030', N'Nitheesh K. S.', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'glrw25@yahoo.com', N'9889512028', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (32, N'USER031', N'Sagar M Krishnadas', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'whrz_nyshabwry47@gmail.com', N'9889512029', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (33, N'USER032', N'Abhinav Jaiju', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'frjad_mhajrany@gmail.com', N'9889512030', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (34, N'USER033', N'Akhil M', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'nwshdkht_kmaly@gmail.com', N'9889512031', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (35, N'USER034', N'Alfina Sulfikar B', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'jawyd.frhng@gmail.com', N'9889512032', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (36, N'USER035', N'Anjana K G', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'gwhrnaz67@yahoo.com', N'9889512033', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (37, N'USER036', N'Arathi R', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'snblh27@hotmail.com', N'9889512034', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (38, N'USER037', N'Arshin Jose Sandi', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'hwr.mhdypwr@yahoo.com', N'9889512035', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (39, N'USER038', N'Ashwin Madhu', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'shbbw.myrdamady@hotmail.com', N'9889512036', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (40, N'USER039', N'Babu R', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'mhrnya.namtzadh43@hotmail.com', N'9889512037', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (41, N'USER040', N'Bidhu M Renchi', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'shyrzad_qadhy@hotmail.com', N'9889512038', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (42, N'USER041', N'Binitha S', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'bhnwd_mhjwby65@gmail.com', N'9889512039', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (43, N'USER042', N'Ganesh A', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'akhtr41@hotmail.com', N'9889512040', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (44, N'USER043', N'Kadeejath Lubaiba', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'kyandkht14@yahoo.com', N'9889512041', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (45, N'USER044', N'Mohammed Gasni', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'mhranfr.fryad46@gmail.com', N'9889512042', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (46, N'USER045', N'Nikhil Nandagopan', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'bhzad_msbah75@gmail.com', N'9889512043', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (47, N'USER046', N'Risvana Sherin', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'anwshrwan.aaly26@gmail.com', N'9889512044', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (48, N'USER047', N'Sameena', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'mhraafaq43@gmail.com', N'9889512045', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (49, N'USER048', N'Sneha K Salu', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'mhdys39@yahoo.com', N'9889512046', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (50, N'USER049', N'Sreehari Prathap', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'shyrng.myrzadh12@hotmail.com', N'9889512047', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (51, N'USER050', N'Sumeeth Kumar S Naik', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'sphr.alyzmany33@yahoo.com', N'9889512048', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (52, N'USER051', N'Akhil P Vijayan', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'bhzad76@yahoo.com', N'9889512049', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (53, N'USER052', N'Amelin Thomas', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'bapwk_qhrmany33@yahoo.com', N'9889512050', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (54, N'USER053', N'Aneesh S', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'bwzhan.ythrby@hotmail.com', N'9889512051', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (55, N'USER054', N'Anjali Nair', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'mhraara92@hotmail.com', N'9889512052', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (56, N'USER055', N'Ann Mary Jose', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'mhshyd71@hotmail.com', N'9889512053', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (57, N'USER056', N'Annie Abraham', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'shahdkht_mfth67@yahoo.com', N'9889512054', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (58, N'USER057', N'Ashika Hussain', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'gshtasb42@hotmail.com', N'9889512055', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (59, N'USER058', N'Avin Joseph', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'swlmaz.frj96@yahoo.com', N'9889512056', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (60, N'USER059', N'Haizon Helet Cruz', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'mrzban.marwf@hotmail.com', N'9889512057', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (61, N'USER060', N'Jithumol S', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'nwyd_namwr56@gmail.com', N'9889512058', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (62, N'USER061', N'Junaid K.V', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'zadbh.frshydwrd27@hotmail.com', N'9889512059', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (63, N'USER062', N'Jyothish A', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'kywandkht29@hotmail.com', N'9889512060', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (64, N'USER063', N'Krishnanunni T K', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'glbar_almalhdy@gmail.com', N'9889512061', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (65, N'USER064', N'Malavika K Nair', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'kyandkht57@yahoo.com', N'9889512062', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (66, N'USER065', N'Mohammed Anees A B', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'nylwfr74@yahoo.com', N'9889512063', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (67, N'USER066', N'Nevin Sunny', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'prywsh.mwhd46@gmail.com', N'9889512064', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (68, N'USER067', N'Nithin Peter', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'kamnwsh.ghdhnfry@gmail.com', N'9889512065', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (69, N'USER068', N'Rashmi Nayak S', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'makan.nqdy@hotmail.com', N'9889512066', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (70, N'USER069', N'Rithwik S Menon', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'nazchhr42@gmail.com', N'9889512067', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (71, N'USER070', N'Rohit Deepak', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'zybar.mnwchhry@gmail.com', N'9889512068', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (72, N'USER071', N'Roshni A T', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'qbad14@hotmail.com', N'9889512069', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (73, N'USER072', N'Sarith P Sajeev', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'yashar.alyaabady@gmail.com', N'9889512070', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (74, N'USER073', N'Shallet Mary T Eldho', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'kamyar59@gmail.com', N'9889512071', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (75, N'USER074', N'Sneha P', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'kaban.mhjwby@yahoo.com', N'9889512072', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (76, N'USER075', N'Subin Younas', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'frydkht.ndwshn4@hotmail.com', N'9889512073', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (77, N'USER076', N'Sujith S Kumar', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'bhmn_mwswyan@yahoo.com', N'9889512074', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (78, N'USER077', N'Surabhi P S', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'maral.qanay@yahoo.com', N'9889512075', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (79, N'USER078', N'Vincy Anto', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'zadfr.nqybzadh20@hotmail.com', N'9889512076', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (80, N'USER079', N'Vyshnav Sasidharan', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'aabandkht.ylda17@hotmail.com', N'9889512077', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (81, N'USER080', N'Yadhukrishnan Em', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'dlangyz27@gmail.com', N'9889512078', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (82, N'USER081', N'Adnan M', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'frhng_ythrby@gmail.com', N'9889512079', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (83, N'USER082', N'Aiswarya Radhakrishnan', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'glbar_nqybzadh79@hotmail.com', N'9889512080', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (84, N'USER083', N'Ajay Pranav M K', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'dlaawyz_gnjy@yahoo.com', N'9889512081', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (85, N'USER084', N'Akash Nair', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'mhsyma73@hotmail.com', N'9889512082', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (86, N'USER085', N'Alwin Sonny', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'drya_mstwfy31@hotmail.com', N'9889512083', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (87, N'USER086', N'Anusha P R', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'bkhtyar97@yahoo.com', N'9889512084', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (88, N'USER087', N'Arjun N', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'zhyar_framrzy@gmail.com', N'9889512085', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (89, N'USER088', N'Basil Mathew', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'rwnak.ythrby@yahoo.com', N'9889512086', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (90, N'USER089', N'Fathima Zubair M P', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'khrm.azyzy@gmail.com', N'9889512087', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (91, N'USER090', N'Jibymol Joseph', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'saghr.hmaywn70@hotmail.com', N'9889512088', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (92, N'USER091', N'Jijo Joseph', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'wamq_asar91@gmail.com', N'9889512089', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (93, N'USER092', N'Joblin K. James', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'jhannaz.fhmydh74@gmail.com', N'9889512090', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (94, N'USER093', N'Kanagarla Ravikanth', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'glpr48@hotmail.com', N'9889512091', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (95, N'USER094', N'Kiran Maria Giby', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'nahyd43@gmail.com', N'9889512092', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (96, N'USER095', N'Megha P M', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'mynadkht_namwr@gmail.com', N'9889512093', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (97, N'USER096', N'Mohamed Rishan Av', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'rkhsar_marwf@yahoo.com', N'9889512094', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (98, N'USER097', N'Navaneeth Sankar E M', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'sty60@gmail.com', N'9889512095', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (99, N'USER098', N'Nihal Farhan Kt', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'glbad64@yahoo.com', N'9889512096', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (100, N'USER099', N'Sarath', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'wyda_mhmdrdhayy87@gmail.com', N'9889512097', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (101, N'USER0100', N'Sona Grace John', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'mstan44@hotmail.com', N'9889512098', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (102, N'USER0101', N'Sreelakshmi Babu', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'mhran53@yahoo.com', N'9889512099', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (103, N'USER0102', N'Sreyas T P', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'mhraab.hashmyrfsnjany@yahoo.com', N'9889512100', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (104, N'USER0103', N'Thasni Sathar', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'mhyndkht_glmhmdy@gmail.com', N'9889512101', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (105, N'USER0104', N'V S Vishnupriyan', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'sark_qhrmany@hotmail.com', N'9889512102', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (106, N'USER0105', N'A ASWATHI', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'bnfshh_mzfr@yahoo.com', N'9889512103', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (107, N'USER0106', N'ABHIJITH V', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'aabtyn15@gmail.com', N'9889512104', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (108, N'USER0107', N'MAHEEN A', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'shhrh40@gmail.com', N'9889512105', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (109, N'USER0108', N'MOHAMMED ROSHAN', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'tajy_msbahzadh76@gmail.com', N'9889512106', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (110, N'USER0109', N'SHAJITH MON', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'frwd.alya73@gmail.com', N'9889512107', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (111, N'USER0110', N'KISHORE G', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'bhdad.msbahzadh@hotmail.com', N'9889512108', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (112, N'USER0111', N'SOORAJ NAIR', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'kaban45@yahoo.com', N'9889512109', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (113, N'USER0112', N'VISHAL PILLAI', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'hwrzad71@hotmail.com', N'9889512110', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (114, N'USER0113', N'Afsal G', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'karakw36@gmail.com', N'9889512111', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (115, N'USER0114', N'Akshay Jayakumar', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'radman.waazy35@yahoo.com', N'9889512112', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (116, N'USER0115', N'Divyamol N J', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'shmyn46@gmail.com', N'9889512113', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (117, N'USER0116', N'Nithya CS', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'ramyar_farsy70@hotmail.com', N'9889512114', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (118, N'USER0117', N'Sangeetha K S', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'syma_qadhy@yahoo.com', N'9889512115', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (119, N'USER0118', N'Vincy Sahayaraj', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'glbyz_nqybzadh58@yahoo.com', N'9889512116', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (120, N'USER0119', N'Jijito V', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'frwtn_mhmdy@yahoo.com', N'9889512117', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (121, N'USER0120', N'ISSAC', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'shahyn_qadhy@yahoo.com', N'9889512118', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (122, N'USER0121', N'LIJO', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'saghr.qhrmanyan@gmail.com', N'9889512119', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (123, N'USER0122', N'ABHINU BALACHANDRAN', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'shbbw.frmanfrmaeyan@yahoo.com', N'9889512120', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (124, N'USER0123', N'ADHEENA VARGHESE', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'kmbwjyh_yahqy@yahoo.com', N'9889512121', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (125, N'USER0124', N'ANEESH JOSE', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'kyhanh.nwab59@hotmail.com', N'9889512122', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (126, N'USER0125', N'APARNNA S', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'mrzban23@yahoo.com', N'9889512123', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (127, N'USER0126', N'CHRISTY JACOB', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'afswn.lahwty@yahoo.com', N'9889512124', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (128, N'USER0127', N'FEMI EMMANUEL', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'mhsty.hashmyrfsnjany@gmail.com', N'9889512125', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (129, N'USER0128', N'FONSO GEORGE', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'yadgar36@gmail.com', N'9889512126', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (130, N'USER0129', N'GEETHA E K', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'makan2@yahoo.com', N'9889512127', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (131, N'USER0130', N'GOVIND A PRASAD', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'fryman.mnwchhry95@gmail.com', N'9889512128', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (132, N'USER0131', N'LAKKAMRAJU GNANA DEEPIKA', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'tnaz.waazzadh@yahoo.com', N'9889512129', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (133, N'USER0132', N'LIDIYA RAJU', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'pwnh.qadhy76@yahoo.com', N'9889512130', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (134, N'USER0133', N'SARAVANAN A', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'nwyndkht_msbah@yahoo.com', N'9889512131', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (135, N'USER0134', N'SHERIN JOHN', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'brmk_kymyayy@gmail.com', N'9889512132', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (136, N'USER0135', N'SUBIN S S', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'nwshaafryn_krdbchh28@yahoo.com', N'9889512133', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (137, N'USER0136', N'TOMIN V JOSEPH', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'rawyar.alya@yahoo.com', N'9889512134', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (138, N'USER0137', N'VISHNU VIJAYAKUMAR', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'paktn.kamkar16@gmail.com', N'9889512135', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (139, N'USER0138', N'VYSHAKH V S', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'kywandkht16@hotmail.com', N'9889512136', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (140, N'USER0139', N'AISWARYA RAMDAS', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'frynwsh_qanay21@gmail.com', N'9889512137', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (141, N'USER0140', N'INDU L', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'mhrandysh_alypwr2@hotmail.com', N'9889512138', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (142, N'USER0141', N'PALLAVI SASIDHARAN', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'kyan81@hotmail.com', N'9889512139', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (143, N'USER0142', N'RENEESH J BRIGHT', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'mhyndkht44@hotmail.com', N'9889512140', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (144, N'USER0143', N'RAHUL PILLAI', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'rasa95@yahoo.com', N'9889512141', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (145, N'USER0144', N'ASHIK K SATHEESH', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'nykpy_framrzy91@yahoo.com', N'9889512142', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (146, N'USER0145', N'DRUSYA K', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'kamdyn_farsy58@yahoo.com', N'9889512143', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (147, N'USER0146', N'VIGNESH C', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'hwrmnd.njfy56@yahoo.com', N'9889512144', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (148, N'USER0147', N'CHRISTY SUNNY', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'jryrh_asar@gmail.com', N'9889512145', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (149, N'USER0148', N'JOM JOB', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'srwsh_yadgar23@gmail.com', N'9889512146', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (150, N'USER0149', N'MIDHUN M NAIR', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'nykzad.alya@hotmail.com', N'9889512147', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (151, N'USER0150', N'SOUMYA MANUEL', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'maral89@gmail.com', N'9889512148', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (152, N'USER0151', N'ATHIRA V S NAIR', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'srafraz_lahwty34@gmail.com', N'9889512149', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (153, N'USER0152', N'Abiya Joy', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'swzan.hashmyrfsnjany@hotmail.com', N'9889512150', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (154, N'USER0153', N'Manu Mohan', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'glbw.mqdm@yahoo.com', N'9889512151', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (155, N'USER0154', N'Megha G', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'makan.mwswyan14@gmail.com', N'9889512152', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (156, N'USER0155', N'Sarath P', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'nykpy_hashmyrfsnjany@hotmail.com', N'9889512153', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (157, N'USER0156', N'Kevin Charley', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'dayan97@gmail.com', N'9889512154', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (158, N'USER0157', N'Ashna George', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'nykchhr.waazzadh49@gmail.com', N'9889512155', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (159, N'USER0158', N'Aiswarya T', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'kamrawa65@hotmail.com', N'9889512156', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (160, N'USER0159', N'Jishma K P', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'zal_frhng@hotmail.com', N'9889512157', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (161, N'USER0160', N'Anu Johnson', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'chabk.aqyly72@hotmail.com', N'9889512158', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (162, N'USER0161', N'Angel Mary Paul', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'zhyar.hrwy27@gmail.com', N'9889512159', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (163, N'USER0162', N'Chindhusha T C', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'glrng64@yahoo.com', N'9889512160', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (164, N'USER0163', N'Krishnapriya Raj', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'shyna43@hotmail.com', N'9889512161', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (165, N'USER0164', N'Deepthi P N', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'aafrhdkht.krymy18@hotmail.com', N'9889512162', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (166, N'USER0165', N'Juny Maria John', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'frwd.hashmyrfsnjany76@yahoo.com', N'9889512163', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (167, N'USER0166', N'Vishnu M D', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'khzad9@gmail.com', N'9889512164', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (168, N'USER0167', N'Aathira P', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'frkhdad.msbah@gmail.com', N'9889512165', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (169, N'USER0168', N'Akhil M U', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'hyrbd34@yahoo.com', N'9889512166', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (170, N'USER0169', N'Abiya Wilson', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'kyandkht.hwshyar17@yahoo.com', N'9889512167', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (171, N'USER0170', N'Ashitha M', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'khrm38@hotmail.com', N'9889512168', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (172, N'USER0171', N'Mitha Waiben', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'lbkhnd.fatmy@hotmail.com', N'9889512169', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (173, N'USER0172', N'Neeraja R', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'bwyan81@gmail.com', N'9889512170', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (174, N'USER0173', N'Reshma Susan Thomas', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'zyma65@hotmail.com', N'9889512171', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (175, N'USER0174', N'Rose Maria Joji', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'nazprwr_araqy@gmail.com', N'9889512172', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (176, N'USER0175', N'Ruksana Salahudeen', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'zrngar55@yahoo.com', N'9889512173', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (177, N'USER0176', N'Saranya . M', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'chwbyn87@gmail.com', N'9889512174', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (178, N'USER0177', N'Thara Thomas', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'pwnh.kymyayy2@hotmail.com', N'9889512175', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (179, N'USER0178', N'Ajesh Raj', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'tnaz_abdalmlky92@yahoo.com', N'9889512176', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (180, N'USER0179', N'Heera Vinod', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'zadchhr_ghny1@gmail.com', N'9889512177', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (181, N'USER0180', N'Jeenu Jayakumar', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'ramshgr21@gmail.com', N'9889512178', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (182, N'USER0181', N'Karthika S', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'bhnaz_khnmwyy@hotmail.com', N'9889512179', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (183, N'USER0182', N'Lubina Anwer', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'dlksh.hrwy@yahoo.com', N'9889512180', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (184, N'USER0183', N'Vishnu.M.B', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'nazly_alypwr71@gmail.com', N'9889512181', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (185, N'USER0184', N'Amal Prakash J', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'glnwaz35@gmail.com', N'9889512182', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (186, N'USER0185', N'Sruthy K S', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'prham_mzfr@hotmail.com', N'9889512183', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (187, N'USER0186', N'Angella Sara Sebastian', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'aaryamhr_hrwy44@yahoo.com', N'9889512184', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (188, N'USER0187', N'SaiBalu R', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'shyrzad_hraty@yahoo.com', N'9889512185', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (189, N'USER0188', N'Gifty Mariam', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'swgnd.msha91@yahoo.com', N'9889512186', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (190, N'USER0189', N'Adithya Mohan Nair', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'shmshad.mnwchhry@gmail.com', N'9889512187', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (191, N'USER0190', N'Juliya K Paul', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'tara.yahqy@gmail.com', N'9889512188', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (192, N'USER0191', N'Libina P Joseph', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'grshasb.nylwfry@hotmail.com', N'9889512189', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (193, N'USER0192', N'Arun B', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'glnwsh_mjtbwy80@gmail.com', N'9889512190', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (194, N'USER0193', N'Chillu Elizabeth Kuriakose', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'frzanh_lachyny86@hotmail.com', N'9889512191', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (195, N'USER0194', N'Niranjana Manoj', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'dlaram_fhmydh26@hotmail.com', N'9889512192', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (196, N'USER0195', N'Karthika B', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'mhrzadh.mlk@yahoo.com', N'9889512193', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (197, N'USER0196', N'Sona Maria Noble', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'bwzhan1@yahoo.com', N'9889512194', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (198, N'USER0197', N'Apsara S B', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'lhrasb_krdbchh34@yahoo.com', N'9889512195', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (199, N'USER0198', N'Abhishek K Krishna', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'shyryndkht70@gmail.com', N'9889512196', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (200, N'USER0199', N'Pooja Mohanan', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'pwnh.namtzadh@hotmail.com', N'9889512197', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (201, N'USER0200', N'Akshara S Vijay', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'brzyn.qanwny@gmail.com', N'9889512198', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (202, N'USER0201', N'Lidiya Rajan', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'glbar.mlkyan40@hotmail.com', N'9889512199', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (203, N'USER0202', N'Boncy Benjamin', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'frydkht.araqy@yahoo.com', N'9889512200', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (204, N'USER0203', N'Aishwarya S', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'nazbanw10@gmail.com', N'9889512201', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (205, N'USER0204', N'Athira P Kumar', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'frkhmhr_qhrmany@gmail.com', N'9889512202', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (206, N'USER0205', N'Angella Sara Sebastian', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'swry52@gmail.com', N'9889512203', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (207, N'USER0206', N'SaiBalu R', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'nykzad1@yahoo.com', N'9889512204', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (208, N'USER0207', N'Gifty Mariam', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'twrj_qmyshy97@hotmail.com', N'9889512205', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (209, N'USER0208', N'Adithya Mohan Nair', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'nwyn.ghdhnfry78@yahoo.com', N'9889512206', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (210, N'USER0209', N'Juliya K Paul', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'bhtash_msahb92@yahoo.com', N'9889512207', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (211, N'USER0210', N'Libina P Joseph', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'srafraz.mwswy83@hotmail.com', N'9889512208', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (212, N'USER0211', N'Arun B', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'frkhlqa_hashmyan4@hotmail.com', N'9889512209', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (213, N'USER0212', N'Chillu Elizabeth Kuriakose', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'mshknaz.frmanfrmaeyan@yahoo.com', N'9889512210', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (214, N'USER0213', N'Niranjana Manoj', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'wamq.araqy84@yahoo.com', N'9889512211', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (215, N'USER0214', N'Karthika B', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'glbam.mjthdshbstry53@hotmail.com', N'9889512212', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (216, N'USER0215', N'Sona Maria Noble', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'lalh_nqybzadh13@gmail.com', N'9889512213', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (217, N'USER0216', N'Apsara S B', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'hywa88@gmail.com', N'9889512214', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (218, N'USER0217', N'Abhishek K Krishna', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'yasmn_mlayry@yahoo.com', N'9889512215', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (219, N'USER0218', N'Pooja Mohanan', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'rkhshndh.aarf43@hotmail.com', N'9889512216', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (220, N'USER0219', N'Akshara S Vijay', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'nrmk.mhmdrdhayy@gmail.com', N'9889512217', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (221, N'USER0220', N'Lidiya Rajan', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'rabw.myrbaqry92@yahoo.com', N'9889512218', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (222, N'USER0221', N'Boncy Benjamin', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'awrng73@yahoo.com', N'9889512219', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (223, N'USER0222', N'Aishwarya S', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'pwrandkht.anayt44@hotmail.com', N'9889512220', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (224, N'USER0223', N'Athira P Kumar', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'shhrzad49@yahoo.com', N'9889512221', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (225, N'USER0224', N'Vishnudev S', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'twrandkht.aaly@yahoo.com', N'9889512222', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (226, N'USER0225', N'Mohamed Irshad Kp', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'mhyndkht26@hotmail.com', N'9889512223', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (227, N'USER0226', N'Aswathi N R', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'swzan.aqyly18@yahoo.com', N'9889512224', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (228, N'USER0227', N'Sankar Ganesh V', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'whrz_anayt@hotmail.com', N'9889512225', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (229, N'USER0228', N'Vrinda Vijayakumar', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'glsa6@yahoo.com', N'9889512226', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (230, N'USER0229', N'Shymol Kochitty', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'glbhar97@gmail.com', N'9889512227', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (231, N'USER0230', N'Naufa N N', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'frwzndh30@gmail.com', N'9889512228', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (232, N'USER0231', N'Sreeyenan E K', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'shyryn.qhstany@gmail.com', N'9889512229', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (233, N'USER0232', N'Vishnudev Kp', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'zadbkht96@yahoo.com', N'9889512230', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (234, N'USER0233', N'Fathima Samrin P', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'mynwfr.alm@yahoo.com', N'9889512231', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (235, N'USER0234', N'Navya Babu', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'khsrw61@gmail.com', N'9889512232', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (236, N'USER0235', N'Krishnendu Shaji', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'frkhlqa_mhjwb@yahoo.com', N'9889512233', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (237, N'USER0236', N'Amitha Unnikrishnan', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'arzhn48@hotmail.com', N'9889512234', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (238, N'USER0237', N'Anagha O K', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'zadbkht.lajwrdy@hotmail.com', N'9889512235', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (239, N'USER0238', N'Ananthu A', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'pakdkht85@gmail.com', N'9889512236', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (240, N'USER0239', N'Angel Rose K A', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'kamk82@yahoo.com', N'9889512237', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (241, N'USER0240', N'Anjali K J', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'hyrbd_qhrmany@hotmail.com', N'9889512238', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (242, N'USER0241', N'Anjali Ramesh', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'yzdan99@hotmail.com', N'9889512239', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (243, N'USER0242', N'Elbin Thomas', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'fyrwzh.hashmy@yahoo.com', N'9889512240', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (244, N'USER0243', N'Jaseem.M', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'pyrwz_ghny@hotmail.com', N'9889512241', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (245, N'USER0244', N'Jerin Johny', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'makan_lachyny44@yahoo.com', N'9889512242', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (246, N'USER0245', N'Nihamathulla O', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'ftanh_nazry93@yahoo.com', N'9889512243', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (247, N'USER0246', N'Nithin Raveendran', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'thmwrth83@hotmail.com', N'9889512244', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (248, N'USER0247', N'Anjana .K', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'drya37@yahoo.com', N'9889512245', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (249, N'USER0248', N'Anju Susan Achenkunju', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'shhyn_nwbkhty@hotmail.com', N'9889512246', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (250, N'USER0249', N'Annette Joe', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'ramtyn_wathqy74@gmail.com', N'9889512247', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (251, N'USER0250', N'Ansiya C A', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'glbhar55@hotmail.com', N'9889512248', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (252, N'USER0251', N'Anupriya V', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'prya.lahwty@hotmail.com', N'9889512249', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (253, N'USER0252', N'Ashwathi Anand', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'bnfshh.alm@gmail.com', N'9889512250', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (254, N'USER0253', N'Hasna Hamsath', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'grshasb25@gmail.com', N'9889512251', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (255, N'USER0254', N'Yruthika Lakshmi V S', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'snblh_hmaywn14@hotmail.com', N'9889512252', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (256, N'USER0255', N'Anjana Anilkumar', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'spnd_mjahd@gmail.com', N'9889512253', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (257, N'USER0256', N'Aswany K T', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'mandana_framrzy52@hotmail.com', N'9889512254', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (258, N'USER0257', N'Shankar P', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'byzhn_mlayry@gmail.com', N'9889512255', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (259, N'USER0258', N'Fatima S', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'mhraafaq16@yahoo.com', N'9889512256', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (260, N'USER0259', N'Geethu Ramesh', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'kamran_msahb@hotmail.com', N'9889512257', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (261, N'USER0260', N'AKSHAY MADHAN P', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'mhryar_frshydwrd@gmail.com', N'9889512258', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (262, N'USER0261', N'CILIYA SEABSTIAN', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'mhsa53@yahoo.com', N'9889512259', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (263, N'USER0262', N'PRIYA REJU', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'frkhlqa31@yahoo.com', N'9889512260', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (264, N'USER0263', N'Dona Sara Jacob', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'kyandkht.nqdy33@gmail.com', N'9889512261', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (265, N'USER0264', N'Ashitha Augustine', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'wyda.azyzy@yahoo.com', N'9889512262', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (266, N'USER0265', N'Kumar G', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'shhbaz.glmhmdy@yahoo.com', N'9889512263', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (267, N'USER0266', N'Bijoy J Puthussery', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'mhrafzwn_mthry@gmail.com', N'9889512264', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (268, N'USER0267', N'Joseph Johny Vallanat', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'ahwra.mlk@hotmail.com', N'9889512265', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (269, N'USER0268', N'Athira Gopalakrishnan', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'jhandkht50@yahoo.com', N'9889512266', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (270, N'USER0269', N'Ankitha Nair', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'swrn37@yahoo.com', N'9889512267', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (271, N'USER0270', N'Dhanusha A D', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'nyma_mftah68@yahoo.com', N'9889512268', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (272, N'USER0271', N'Greeshma Madhu', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'frdad_mhdypwr25@yahoo.com', N'9889512269', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (273, N'USER0272', N'Sivaparvathy S', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'nykpy.njfy65@yahoo.com', N'9889512270', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (274, N'USER0273', N'Vyshnavi Siji Mohanan', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'twzhal_frwtn@gmail.com', N'9889512271', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (275, N'USER0274', N'S Sneha', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'frahan_nwbkhty@yahoo.com', N'9889512272', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (276, N'USER0275', N'Sahana S', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'aahw7@yahoo.com', N'9889512273', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (277, N'USER0276', N'Athira Prasad', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'dlaawyz.hamwn@yahoo.com', N'9889512274', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (278, N'USER0277', N'Divya Nair', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'gwmatw.mhajrany46@yahoo.com', N'9889512275', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (279, N'USER0278', N'Arathy G.K Nair', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'tyrdad59@hotmail.com', N'9889512276', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (280, N'USER0279', N'Abhijesh R Chandran', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'zrngar_hamwn@yahoo.com', N'9889512277', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (281, N'USER0280', N'Sivakami T', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'swzan_kwshky@hotmail.com', N'9889512278', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (282, N'USER0281', N'Nikhil Prakash', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'ramyla81@gmail.com', N'9889512279', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (283, N'USER0282', N'Vimal Viswambharan', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'prtw_namwr92@gmail.com', N'9889512280', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (284, N'USER0283', N'Malavika Krishnan', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'prham.msbah@yahoo.com', N'9889512281', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (285, N'USER0284', N'Anees H', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'arslan_mlk45@hotmail.com', N'9889512282', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (286, N'USER0285', N'Raechel David', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'glbhar.msahb@yahoo.com', N'9889512283', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (287, N'USER0286', N'Rohith M R', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'raspyna_myrdamady@yahoo.com', N'9889512284', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (288, N'USER0287', N'Lekshmi C Senan', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'mykhk.myrdamady@hotmail.com', N'9889512285', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (289, N'USER0288', N'Ariya Agnihothri Ms', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'frbgh_frhng@gmail.com', N'9889512286', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (290, N'USER0289', N'Athira Adev', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'banw_nqdy@yahoo.com', N'9889512287', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (291, N'USER0290', N'Lekshmi S', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'pwrya.frhng@yahoo.com', N'9889512288', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (292, N'USER0291', N'Chaithanya Ganesh', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'rabw.gnjy97@gmail.com', N'9889512289', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (293, N'USER0292', N'Annsona Ansilon Dores', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'zadbh.fnayy@gmail.com', N'9889512290', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (294, N'USER0293', N'Sujith N', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'nazprwr44@yahoo.com', N'9889512291', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (295, N'USER0294', N'Simimol S M', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'symyn42@hotmail.com', N'9889512292', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (296, N'USER0295', N'Arsha Vijayan', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'ngaryn26@hotmail.com', N'9889512293', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (297, N'USER0296', N'Arya.A.V', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'twzhal_lahwty15@gmail.com', N'9889512294', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (298, N'USER0297', N'Shruthi.Ss', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'ghrchhr63@gmail.com', N'9889512295', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (299, N'USER0298', N'Vidhya A V', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'shkwfh_myrdamady31@gmail.com', N'9889512296', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (300, N'USER0299', N'Irfan Rabeeh', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'aanahyta_fhmydh@hotmail.com', N'9889512297', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (301, N'USER0300', N'M Rakhi Manoj', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'mhranfr1@hotmail.com', N'9889512298', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (302, N'USER0301', N'Mary Joseph', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'frkhrw.fany@hotmail.com', N'9889512299', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (303, N'USER0302', N'Smrithi.S.Lal', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'rkhsar_mhmdy51@hotmail.com', N'9889512300', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (304, N'USER0303', N'Ashwin M S', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'shrh_mfth44@hotmail.com', N'9889512301', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (305, N'USER0304', N'Haritha Jerald', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'rawyar_aashwry@gmail.com', N'9889512302', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (306, N'USER0305', N'Kavya S Kumar', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'sara50@hotmail.com', N'9889512303', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (307, N'USER0306', N'Smrithy Jophrin', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'nsryn_glmhmdy@hotmail.com', N'9889512304', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (308, N'USER0307', N'Anoop Mathew Uluvathu', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'karw.kwshky@yahoo.com', N'9889512305', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (309, N'USER0308', N'Gowri R Nair', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'aafrhdkht15@hotmail.com', N'9889512306', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (310, N'USER0309', N'Amritha G', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'aaryn.aarf21@yahoo.com', N'9889512307', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (311, N'USER0310', N'Devu Mohan', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'zadmasb.myzbany59@gmail.com', N'9889512308', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (312, N'USER0311', N'Shamnad S', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'shwrangyz57@yahoo.com', N'9889512309', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (313, N'USER0312', N'Akhil M', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'spydh.mjtbayy@gmail.com', N'9889512310', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (314, N'USER0313', N'Anshula Vijayam S J', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'frzyn.asar@gmail.com', N'9889512311', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (315, N'USER0314', N'Sumitra.R', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'astr.kashy35@gmail.com', N'9889512312', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (316, N'USER0315', N'Joselin Johnson', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'ladn_lnkrany@gmail.com', N'9889512313', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (317, N'USER0316', N'Jibindas M', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'mynw_anayt63@hotmail.com', N'9889512314', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (318, N'USER0317', N'Aswathi S', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'nwshyn.framrzy@hotmail.com', N'9889512315', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (319, N'USER0318', N'Lekshmy Ps', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'twrj.mhajrany89@gmail.com', N'9889512316', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (320, N'USER0319', N'Shilpa S Pillai', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'shyna18@gmail.com', N'9889512317', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (321, N'USER0320', N'Feba Mariam Lalu', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'bhnaz.frj62@hotmail.com', N'9889512318', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (322, N'USER0321', N'Gopika S R', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'jhanbanw.qnbry@yahoo.com', N'9889512319', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (323, N'USER0322', N'Lijo John', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'shrarh_hashmyan@hotmail.com', N'9889512320', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (324, N'USER0323', N'GOKUL G. KRISHNA', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'bzrgmhr.qhrmanyan@yahoo.com', N'9889512321', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (325, N'USER0324', N'Broshini Cyriac', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'swzh79@yahoo.com', N'9889512322', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (326, N'USER0325', N'RUBY MAMACHAN', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'darywsh13@yahoo.com', N'9889512323', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (327, N'USER0326', N'FEMINA BASHEER', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'nwshfr.lnkrany5@yahoo.com', N'9889512324', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (328, N'USER0327', N'JOBIS MATHEW', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'aazadh_hashmy@gmail.com', N'9889512325', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (329, N'USER0328', N'VARUN RAJ S P', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'jhanbkhsh.mlk52@hotmail.com', N'9889512326', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (330, N'USER0329', N'NIKHIL K J', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'kyanwsh.lwks@yahoo.com', N'9889512327', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (331, N'USER0330', N'NEETHI C. M.', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'frynaz.mhdypwr@gmail.com', N'9889512328', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (332, N'USER0331', N'ELSA MARY VARUGHESE', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'frnwd.ghdhnfry31@gmail.com', N'9889512329', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (333, N'USER0332', N'NIZA S', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'mhshad.hwshyar65@gmail.com', N'9889512330', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (334, N'USER0333', N'DIVYA S EDWARD', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'syma_hwmn22@yahoo.com', N'9889512331', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (335, N'USER0334', N'JANE JEBARSON R', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'aathyn.ghny35@yahoo.com', N'9889512332', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (336, N'USER0335', N'RESINYA RASAK', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'khram_alyasgry57@hotmail.com', N'9889512333', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (337, N'USER0336', N'TEENU THOMAS', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'fda_kyanynamkhanwadgy7@hotmail.com', N'9889512334', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (338, N'USER0337', N'VIVEKANANDAN', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'qdsy62@hotmail.com', N'9889512335', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (339, N'USER0338', N'DEEPAK MATHEW', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'frywsh.kyan34@hotmail.com', N'9889512336', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (340, N'USER0339', N'JYOLSNA SUSEEL', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'ksry_aarf43@gmail.com', N'9889512337', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (341, N'USER0340', N'JOMON JOSE', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'hyma_mhmdy@yahoo.com', N'9889512338', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (342, N'USER0341', N'LEKSHMI', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'nyma_aaly@yahoo.com', N'9889512339', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (343, N'USER0342', N'MOHAMMED ASHRAF', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'swmar.yadgar50@yahoo.com', N'9889512340', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (344, N'USER0343', N'PRINCE J', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'grshyn_fhmydh80@gmail.com', N'9889512341', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (345, N'USER0344', N'SIMI P.S', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'darya.mjrd@yahoo.com', N'9889512342', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (346, N'USER0345', N'SHEEBA JOSEPH', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'nazfr56@yahoo.com', N'9889512343', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (347, N'USER0346', N'SHALU S', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'dnya.framrzy@gmail.com', N'9889512344', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (348, N'USER0347', N'SILJA PURUSHOTAMMAN', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'frzad.myzbany89@gmail.com', N'9889512345', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (349, N'USER0348', N'GIBY THANKAM BABY', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'zhywar.kyan42@hotmail.com', N'9889512346', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (350, N'USER0349', N'SREEKESH M.', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'glnwsh.mhdthy9@hotmail.com', N'9889512347', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (351, N'USER0350', N'ARUN N', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'aatwsa51@gmail.com', N'9889512348', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (352, N'USER0351', N'LOVEBIN REJO', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'tajy_glmhmdy88@hotmail.com', N'9889512349', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (353, N'USER0352', N'KESIYA ABRAHAM', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'bhrng.marwf@gmail.com', N'9889512350', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (354, N'USER0353', N'JASMINE MELBA', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'symyndkht.maarf@gmail.com', N'9889512351', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (355, N'USER0354', N'NIKHIL V. CHANDRAN', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'manwsh_azyzy89@gmail.com', N'9889512352', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (356, N'USER0355', N'AYSWARIA A.S.', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'pwpk_njfy22@yahoo.com', N'9889512353', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (357, N'USER0356', N'AMITHA MATHEWS', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'bamshad23@hotmail.com', N'9889512354', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (358, N'USER0357', N'ASWIN DEEPAK JOSE', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'nykbyn_frj3@gmail.com', N'9889512355', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (359, N'USER0358', N'ATHIRA MATHEWS', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'shyna_mhdypwr12@hotmail.com', N'9889512356', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (360, N'USER0359', N'SHRUTHI RAU', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'zhyna_klbasy85@gmail.com', N'9889512357', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (361, N'USER0360', N'KIRAN J SUNNY', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'grsha80@yahoo.com', N'9889512358', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (362, N'USER0361', N'NICHOLAS TOM', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'kanyar_framrzy13@yahoo.com', N'9889512359', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (363, N'USER0362', N'RABHEEA T T K', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'glrw_namwr@yahoo.com', N'9889512360', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (364, N'USER0363', N'DAYANA MATHEW', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'mzhdh_waaz@gmail.com', N'9889512361', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (365, N'USER0364', N'ATHIRA GEORGE', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'jmshyd_mzfr91@gmail.com', N'9889512362', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (366, N'USER0365', N'SONA ELIZABETH THOMAS', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'bhmn.hamwn@yahoo.com', N'9889512363', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (367, N'USER0366', N'A AMAL', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'srwr_yadgar@gmail.com', N'9889512364', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (368, N'USER0367', N'SANITHA G KRISHNAN', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'nwshfr_msahb@gmail.com', N'9889512365', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (369, N'USER0368', N'SONITTA PAUL', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'byta4@gmail.com', N'9889512366', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (370, N'USER0369', N'VIDHYA K.R.', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'aahw.frwtn72@hotmail.com', N'9889512367', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (371, N'USER0370', N'DINU MANUEL', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'frngys_mlk59@hotmail.com', N'9889512368', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (372, N'USER0371', N'DIVYA PREM SAMUEL', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'frahan66@gmail.com', N'9889512369', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (373, N'USER0372', N'GEETHU ROSE AUGUSTINE', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'nstrn3@yahoo.com', N'9889512370', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (374, N'USER0373', N'LAMEES ABDUL MAJEED', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'wyshtasb_alyaabady54@hotmail.com', N'9889512371', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (375, N'USER0374', N'MAHIMA MERIN JOY', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'zynw43@gmail.com', N'9889512372', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (376, N'USER0375', N'MRUDHULA MURALI', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'aayda_hmt@yahoo.com', N'9889512373', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (377, N'USER0376', N'NAVEEN T.N.', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'hngamh.myrdamady@gmail.com', N'9889512374', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (378, N'USER0377', N'NIJAS K.P.', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'ramwna_msha81@yahoo.com', N'9889512375', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (379, N'USER0378', N'THARAK C.S.', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'bhmn.mfth@yahoo.com', N'9889512376', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (380, N'USER0379', N'DEEPTHI V.D.', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'kyandkht.msha27@yahoo.com', N'9889512377', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (381, N'USER0380', N'ARJUN U', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'hmrah.msha@gmail.com', N'9889512378', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (382, N'USER0381', N'VINU VISWANATH', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'kyqbad_klbasy65@yahoo.com', N'9889512379', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (383, N'USER0382', N'REMYA T', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'zrngar55@hotmail.com', N'9889512380', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (384, N'USER0383', N'SUSMITA MARY THOMAS', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'snblh17@gmail.com', N'9889512381', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (385, N'USER0384', N'JASMIN SAMUEL', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'zrynh.mwswyan68@yahoo.com', N'9889512382', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (386, N'USER0385', N'LEKSHMI PREM', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'lalhrkh.myrspasy@gmail.com', N'9889512383', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (387, N'USER0386', N'ANSAR JOSEPH', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'ghrchhr15@gmail.com', N'9889512384', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (388, N'USER0387', N'DON JOY', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'shmyn.mjthdy@hotmail.com', N'9889512385', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (389, N'USER0388', N'SAGA TEJA', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'shkwfh38@yahoo.com', N'9889512386', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (390, N'USER0389', N'JOSE JOEL', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'frnwsh_wkyly0@yahoo.com', N'9889512387', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (391, N'USER0390', N'VISHNU HARI', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'hwrzad_mddy@hotmail.com', N'9889512388', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (392, N'USER0391', N'KRIPESH K', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'shyrng.ylda68@yahoo.com', N'9889512389', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (393, N'USER0392', N'BONY B. VARGHESE', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'nda.myrbaqry97@hotmail.com', N'9889512390', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (394, N'USER0393', N'PARVATHY MURALEEDHARAN', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'grdaafryd.abady@yahoo.com', N'9889512391', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (395, N'USER0394', N'BALU BABURAJ', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'amyd.asar75@yahoo.com', N'9889512392', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (396, N'USER0395', N'AMBILY MATHEW', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'prydkht11@gmail.com', N'9889512393', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (397, N'USER0396', N'ASWATHY A', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'bamshad.lnkrany@yahoo.com', N'9889512394', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (398, N'USER0397', N'FABY MS', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'frnwsh.ftahy@gmail.com', N'9889512395', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (399, N'USER0398', N'HARIKRISHNAN', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'gysw_frshydwrd43@yahoo.com', N'9889512396', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (400, N'USER0399', N'NAVYA GEORGE', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'prwanh_mhjwby12@hotmail.com', N'9889512397', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (401, N'USER0400', N'SILJA JAMES', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'mahbrzyn89@gmail.com', N'9889512398', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (402, N'USER0401', N'ALPHY THOMAS', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'gwhrnaz_myrzadh@gmail.com', N'9889512399', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (403, N'USER0402', N'ANAKHA M. JOSE', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'pshng.fatmy54@yahoo.com', N'9889512400', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (404, N'USER0403', N'MERLIT MATHEW', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'jhanbanw.fnyzadh@yahoo.com', N'9889512401', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (405, N'USER0404', N'MIDHUN KS', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'dlbnd.hashmy@hotmail.com', N'9889512402', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (406, N'USER0405', N'MUHAMMED ANEESH PT', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'ngyn.mwhd74@gmail.com', N'9889512403', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (407, N'USER0406', N'MUHAMMED PK', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'shwrangyz96@yahoo.com', N'9889512404', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (408, N'USER0407', N'NEENU JACOB', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'gwdrz20@gmail.com', N'9889512405', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (409, N'USER0408', N'SIMI CHACKO', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'twty39@yahoo.com', N'9889512406', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (410, N'USER0409', N'K  ARUN', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'aaryamhr.marwf@yahoo.com', N'9889512407', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (411, N'USER0410', N'RIYA JAMES', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'nazaafryn_nhawndy@gmail.com', N'9889512408', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (412, N'USER0411', N'ACHAS C', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'sasan_mthry@yahoo.com', N'9889512409', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (413, N'USER0412', N'C HARINAINYAR PILLAI', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'anwshrwan38@gmail.com', N'9889512410', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (414, N'USER0413', N'DHANYA KURUP', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'glrba_namtzadh69@gmail.com', N'9889512411', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (415, N'USER0414', N'JITHEESHh J G', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'mytra_mqdm36@yahoo.com', N'9889512412', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (416, N'USER0415', N'LEKSHMIPRIYA M S', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'yadgar78@gmail.com', N'9889512413', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (417, N'USER0416', N'SOORAJ VASANTH KUMAR', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'wygn.krmany@hotmail.com', N'9889512414', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (418, N'USER0417', N'CHRISTEENA ROSE JOHN', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'pwpk_kakawnd@hotmail.com', N'9889512415', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (419, N'USER0418', N'SRUTHI SS', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'hwrmnd.mradkhany18@yahoo.com', N'9889512416', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (420, N'USER0419', N'NANDAKUMAR R', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'mamk.frj90@hotmail.com', N'9889512417', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (421, N'USER0420', N'ROSELYN', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'shmshad50@yahoo.com', N'9889512418', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (422, N'USER0421', N'DELNA MATHEW', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'mhrnaz3@gmail.com', N'9889512419', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (423, N'USER0422', N'MANJUSHA M NAIR', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'glawyz.glpaygany@yahoo.com', N'9889512420', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (424, N'USER0423', N'ALKA M', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'glpwnh_yadgar41@yahoo.com', N'9889512421', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (425, N'USER0424', N'ROSE MARY', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'mhdkht.mlkyan19@yahoo.com', N'9889512422', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (426, N'USER0425', N'Joel Jose', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'lalhdkht79@gmail.com', N'9889512423', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (427, N'USER0426', N'Pramith E.A', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'zyba_asar78@gmail.com', N'9889512424', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (428, N'USER0427', N'JERIN JOHNSON', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'shadmhr84@hotmail.com', N'9889512425', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (429, N'USER0428', N'SIBY BABU', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'glban.alyzmany0@gmail.com', N'9889512426', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (430, N'USER0429', N'PRAVEEN PS', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'sarng52@hotmail.com', N'9889512427', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (431, N'USER0430', N'MUHAMMED ABEED NABITH', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'glshyd12@yahoo.com', N'9889512428', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (432, N'USER0431', N'EBIN SEBASTIAN', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'khawrdkht41@yahoo.com', N'9889512429', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (433, N'USER0432', N'ROSHNI ALPHONSA K.M', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'jawyd_lajwrdy35@hotmail.com', N'9889512430', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (434, N'USER0433', N'JYOTHI KRISHNA T', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'prstw88@gmail.com', N'9889512431', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (435, N'USER0434', N'SHERIN JOSEPH', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'pyam.klbasy12@yahoo.com', N'9889512432', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (436, N'USER0435', N'LIJI SIMON', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'mhbd73@hotmail.com', N'9889512433', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (437, N'USER0436', N'ASWATHI ANAND NARANATH', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'sasan62@gmail.com', N'9889512434', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (438, N'USER0437', N'CYRIAC MATHEW', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'tabandkht56@hotmail.com', N'9889512435', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (439, N'USER0438', N'GEETHU ANN MATHEW', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'mynwdkht.ghdhnfry@gmail.com', N'9889512436', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (440, N'USER0439', N'ARATHY RAJAN', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'sarng.nwbkhty24@yahoo.com', N'9889512437', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (441, N'USER0440', N'TOMIN MARKOSE', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'sanaz_qhstany90@gmail.com', N'9889512438', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (442, N'USER0441', N'JIMMY JOSEPH', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'hwtn.mhdypwr91@hotmail.com', N'9889512439', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (443, N'USER0442', N'ANU MARIA MAMLA KURIEN', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'shnd_fhmydh64@yahoo.com', N'9889512440', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (444, N'USER0443', N'NANCY ALFRED', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'dlaram.mhajrany74@hotmail.com', N'9889512441', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (445, N'USER0444', N'ANTLINE ANTONY', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'prtw_aqyly@gmail.com', N'9889512442', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (446, N'USER0445', N'ADITHYA TK', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'shwan_fryad@yahoo.com', N'9889512443', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (447, N'USER0446', N'INDRAJITH G', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'mhwsh.mjtbwy7@yahoo.com', N'9889512444', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (448, N'USER0447', N'ASHLI BEN', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'rkhshanh80@yahoo.com', N'9889512445', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (449, N'USER0448', N'JIDHIN JOSE', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'aawng_aaly@gmail.com', N'9889512446', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (450, N'USER0449', N'ANITTA C BABU', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'jawyd_myrzadh@hotmail.com', N'9889512447', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (451, N'USER0450', N'SURYA RS', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'sty29@yahoo.com', N'9889512448', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (452, N'USER0451', N'NEETHU NINAN', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'kywan_ftahy@hotmail.com', N'9889512449', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (453, N'USER0452', N'AJIN V.L.', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'zry_alm57@hotmail.com', N'9889512450', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (454, N'USER0453', N'AKHIL VINAYAK R', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'ghnchh_hrwy@hotmail.com', N'9889512451', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (455, N'USER0454', N'ANUPAMA MOHAN PARAKATE', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'brzwyh.aaly@yahoo.com', N'9889512452', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (456, N'USER0455', N'RISHANA N', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'rhy_ftahy@gmail.com', N'9889512453', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (457, N'USER0456', N'DEEPU K', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'mazyar_fhmydh36@hotmail.com', N'9889512454', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (458, N'USER0457', N'GOWRI KRISHNAN G', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'shwry_qhrmany81@yahoo.com', N'9889512455', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (459, N'USER0458', N'CHITRA T', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'shwrangyz_fryad@yahoo.com', N'9889512456', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (460, N'USER0459', N'RIYA  SUSAN OOMMEN', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'aanahyta_lahwty86@hotmail.com', N'9889512457', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (461, N'USER0460', N'IVIN S PUTHANANGADY', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'aafrhdkht_maarf29@gmail.com', N'9889512458', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (462, N'USER0461', N'VIGNESH K S', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'nwshrwan73@yahoo.com', N'9889512459', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (463, N'USER0462', N'ATHIRA M.K.', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'bnfshh_kdywr41@gmail.com', N'9889512460', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (464, N'USER0463', N'GIREESH KUMAR G', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'frwtn56@gmail.com', N'9889512461', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (465, N'USER0464', N'CHIPPY S', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'bhnam_namtzadh@yahoo.com', N'9889512462', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (466, N'USER0465', N'MELWYN N', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'shwrangyz.nylwfry21@gmail.com', N'9889512463', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (467, N'USER0466', N'VARSHA', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'hwyda50@gmail.com', N'9889512464', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (468, N'USER0467', N'JOSHMA', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'nykdad42@gmail.com', N'9889512465', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (469, N'USER0468', N'JITHU S. KUMAR', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'kara.mwhd@hotmail.com', N'9889512466', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (470, N'USER0469', N'STEFFY', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'mhnwsh_nyshabwry@hotmail.com', N'9889512467', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (471, N'USER0470', N'ABINASH', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'twfan.nraqy@yahoo.com', N'9889512468', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (472, N'USER0471', N'SIMI', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'aathyn84@yahoo.com', N'9889512469', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (473, N'USER0472', N'Aravind Mohan', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'nwyd_araqy@gmail.com', N'9889512470', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (474, N'USER0473', N'SHRUTHI BABU', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'frydwn_krymy41@yahoo.com', N'9889512471', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (475, N'USER0474', N'JINU JACKSON', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'glafrwz_myrdamady@hotmail.com', N'9889512472', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (476, N'USER0475', N'SUCHISMITHA', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'dyaakw_qhrmany@gmail.com', N'9889512473', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (477, N'USER0476', N'NISHITHA', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'glrba_araqy12@gmail.com', N'9889512474', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (478, N'USER0477', N'AKHIL BABU', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'nykkhwah_mjtbayy97@yahoo.com', N'9889512475', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (479, N'USER0478', N'MATHEW PHILIPOSE', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'frzam.lachyny@hotmail.com', N'9889512476', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (480, N'USER0479', N'RESHMA S', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'shyrzad.fany28@yahoo.com', N'9889512477', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (481, N'USER0480', N'JEMINIMOL MARKOSE', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'kawh14@gmail.com', N'9889512478', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (482, N'USER0481', N'ANAND R.V.', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'aazrm.krmany55@hotmail.com', N'9889512479', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (483, N'USER0482', N'JISHNU V.S', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'mahwr.kamly@gmail.com', N'9889512480', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (484, N'USER0483', N'POOJA G', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'hngamh.hmdany@hotmail.com', N'9889512481', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (485, N'USER0484', N'MEHARUNIZA NAZEEM', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'tws55@yahoo.com', N'9889512482', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (486, N'USER0485', N'SEBIN JOSE', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'frkhdad7@gmail.com', N'9889512483', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (487, N'USER0486', N'SOUMYA S', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'dlaara_mfth@hotmail.com', N'9889512484', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (488, N'USER0487', N'ASHOK S. KUMAR', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'twrtk.aarf82@hotmail.com', N'9889512485', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (489, N'USER0488', N'DINEESH PRAKASH', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'jhan_araqy54@hotmail.com', N'9889512486', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (490, N'USER0489', N'JEENA JOSEPH', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'zadchhr_njfy@gmail.com', N'9889512487', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (491, N'USER0490', N'JITHIN EMMANUEL', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'bhnwd_nyshabwry16@gmail.com', N'9889512488', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (492, N'USER0491', N'JOSEMON V.A', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'bwzhan_alypwr@gmail.com', N'9889512489', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (493, N'USER0492', N'MERIN SUSAN MATHEW', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'wyshtasb_marwf95@yahoo.com', N'9889512490', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (494, N'USER0493', N'RINCY ANN LALU', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'brdya_frj@yahoo.com', N'9889512491', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (495, N'USER0494', N'SANGEETA P', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'dayan.waaz@hotmail.com', N'9889512492', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (496, N'USER0495', N'JITHIN M', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'glarh.wkyly@yahoo.com', N'9889512493', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (497, N'USER0496', N'AJITH SINGH', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'mhry_aqyly@hotmail.com', N'9889512494', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (498, N'USER0497', N'APARNA SURESH', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'glban_mjthdshbstry38@gmail.com', N'9889512495', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (499, N'USER0498', N'JISI K.S', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'shyba59@hotmail.com', N'9889512496', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (500, N'USER0499', N'SARANYA MOHAN', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'sark77@hotmail.com', N'9889512497', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (501, N'USER0500', N'ALWIN JAMES', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'prychhr68@gmail.com', N'9889512498', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (502, N'USER0501', N'ARTHUR S. DAVID', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'ywshyta.ylda@yahoo.com', N'9889512499', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (503, N'USER0502', N'R.ABRAN RAJ', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'gwmatw32@gmail.com', N'9889512500', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (504, N'USER0503', N'DHANYA D', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'mshknaz.alyasgry31@gmail.com', N'9889512501', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (505, N'USER0504', N'BANU SAFNA', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'aafr_mhjwby93@gmail.com', N'9889512502', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (506, N'USER0505', N'RINI P.J', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'krshmh56@hotmail.com', N'9889512503', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (507, N'USER0506', N'BIYA PULLIMOOTIL', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'shrmyn25@hotmail.com', N'9889512504', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (508, N'USER0507', N'LIZ VARGHESE', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'frkh_alya22@hotmail.com', N'9889512505', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (509, N'USER0508', N'MARY AMRITHA', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'glzad.ythrby@hotmail.com', N'9889512506', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (510, N'USER0509', N'SHEENA S. MARY', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'khrmdkht28@gmail.com', N'9889512507', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (511, N'USER0510', N'THARA MARIA BOBAN', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'awsta61@hotmail.com', N'9889512508', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (512, N'USER0511', N'ALIF', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'jryrh8@yahoo.com', N'9889512509', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (513, N'USER0512', N'SUHBATH NISA', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'glnwaz.hashmy65@hotmail.com', N'9889512510', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (514, N'USER0513', N'AFNA ALIYAR', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'shhbaz0@yahoo.com', N'9889512511', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (515, N'USER0514', N'SARATH G.S.', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'rhy_mwswy@hotmail.com', N'9889512512', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (516, N'USER0515', N'NEENA A PANICKER', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'wrya.mrtdhwy@hotmail.com', N'9889512513', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (517, N'USER0516', N'INDU DHARMARAJ', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'astr30@yahoo.com', N'9889512514', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (518, N'USER0517', N'SHARMILA RANI P.', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'shhnwaz29@hotmail.com', N'9889512515', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (519, N'USER0518', N'ABEESHA ABDUL R.K.P', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'nwshyn_aqyly80@yahoo.com', N'9889512516', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (520, N'USER0519', N'ABLE M PETER', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'ardshyr10@hotmail.com', N'9889512517', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (521, N'USER0520', N'ANAND HARIDAS', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'razhanh_kawyany@yahoo.com', N'9889512518', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (522, N'USER0521', N'CIJO JOSE V', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'hyrbd_ylda@gmail.com', N'9889512519', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (523, N'USER0522', N'AJMAL JAMAL', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'shkwfh_hmt32@hotmail.com', N'9889512520', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (524, N'USER0523', N'RINU', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'shyryn_mwswyan72@gmail.com', N'9889512521', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (525, N'USER0524', N'PRINCE', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'nwshdkht.mfth@yahoo.com', N'9889512522', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (526, N'USER0525', N'RATHISH', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'zadchhr_hwshyar79@yahoo.com', N'9889512523', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (527, N'USER0526', N'REMYA', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'shkwfh48@yahoo.com', N'9889512524', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (528, N'USER0527', N'SNEHA PREM', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'shhrnaz52@gmail.com', N'9889512525', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (529, N'USER0528', N'GOWRI', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'lbkhnd_maarf20@hotmail.com', N'9889512526', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (530, N'USER0529', N'ABIN RAVI', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'khram_waazy@hotmail.com', N'9889512527', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (531, N'USER0530', N'JOEL VARGHESE GEORGE', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'shbnm_alya13@gmail.com', N'9889512528', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (532, N'USER0531', N'ALPHA JOSE', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'nykpy67@yahoo.com', N'9889512529', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (533, N'USER0532', N'MITHUNA PUTHIYAVALAPPIL', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'nrmyn28@hotmail.com', N'9889512530', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (534, N'USER0533', N'ARUN PAUL', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'yasmn_waazzadh48@hotmail.com', N'9889512531', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (535, N'USER0534', N'JITHIN M.', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'tnaz.mhjwby@hotmail.com', N'9889512532', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (536, N'USER0535', N'LIJO JOSEPH', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'nazprwr_hashmy63@gmail.com', N'9889512533', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (537, N'USER0536', N'PRAISEY ABRAHAM', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'wamq.lajwrdy@hotmail.com', N'9889512534', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (538, N'USER0537', N'TIBIN JOSEPH', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'jhan_aqyly47@yahoo.com', N'9889512535', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (539, N'USER0538', N'ARUN M.K.', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'frkhpy_mjtbayy76@gmail.com', N'9889512536', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (540, N'USER0539', N'ANUSREE N.P.', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'bnfshh_lachyny@hotmail.com', N'9889512537', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (541, N'USER0540', N'NEETHU CHANDRAN C P', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'glandam_mjthdshbstry67@yahoo.com', N'9889512538', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (542, N'USER0541', N'NITHEESH R', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'spnta.aaly15@gmail.com', N'9889512539', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (543, N'USER0542', N'VIJITHA P', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'frshth97@yahoo.com', N'9889512540', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (544, N'USER0543', N'PRAVITHA P.S', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'shhla.hmaywn@yahoo.com', N'9889512541', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (545, N'USER0544', N'LIJA JOHN', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'frkhlqa52@gmail.com', N'9889512542', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (546, N'USER0545', N'VIVEK S.', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'kykawws24@hotmail.com', N'9889512543', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (547, N'USER0546', N'DONIAMOL MANI', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'mhnaz77@hotmail.com', N'9889512544', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (548, N'USER0547', N'GATHU K. RAJAN', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'amyd_mjahd@gmail.com', N'9889512545', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (549, N'USER0548', N'GIREESH GOPINATH', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'aaryamhr3@yahoo.com', N'9889512546', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (550, N'USER0549', N'JINESH P', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'zhalan_hraty@yahoo.com', N'9889512547', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (551, N'USER0550', N'RINU', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'dawr53@gmail.com', N'9889512548', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (552, N'USER0551', N'SANGEETHA K', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'frywsh.marwf@hotmail.com', N'9889512549', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (553, N'USER0552', N'SREENATH GOPI', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'nysha.nraqy@yahoo.com', N'9889512550', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (554, N'USER0553', N'VISHNU P', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'nazaafryn7@gmail.com', N'9889512551', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (555, N'USER0554', N'ALIF', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'awsta_mrtdhwy@hotmail.com', N'9889512552', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (556, N'USER0555', N'ASHER THOMAS', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'hmaywn_abdalkrymy@yahoo.com', N'9889512553', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (557, N'USER0556', N'BIYA PULIMOOTIL', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'rham_msbahzadh75@yahoo.com', N'9889512554', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (558, N'USER0557', N'VARGHESE CHERIAN', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'glbanw_ghny@hotmail.com', N'9889512555', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (559, N'USER0558', N'ABINA MENACHERY', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'arghwan62@hotmail.com', N'9889512556', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (560, N'USER0559', N'JEFFRIN JOSEPH', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'nwshdkht_nwbkhty7@gmail.com', N'9889512557', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (561, N'USER0560', N'SANGEETHA P', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'aarmyta20@hotmail.com', N'9889512558', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (562, N'USER0561', N'JINTA JACOB', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'zmanh_mhajrany@gmail.com', N'9889512559', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (563, N'USER0562', N'SOORAJ', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'kamnwsh.fnyzadh@gmail.com', N'9889512560', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (564, N'USER0563', N'JASMINE', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'rwbyna22@hotmail.com', N'9889512561', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (565, N'USER0564', N'ROHIT RAJ', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'rhy92@yahoo.com', N'9889512562', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (566, N'USER0565', N'NITHIN JAMES', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'bhrkh.marwf67@gmail.com', N'9889512563', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (567, N'USER0566', N'LINTA K PHILIP', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'khshayar.hmt@yahoo.com', N'9889512564', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (568, N'USER0567', N'LIJI K LEVI', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'kywandkht_qanay@hotmail.com', N'9889512565', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (569, N'USER0568', N'DANI MATHEW', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'shyrdl_waaz81@yahoo.com', N'9889512566', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (570, N'USER0569', N'BINCY CHACKO', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'gylda.wkyly61@gmail.com', N'9889512567', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (571, N'USER0570', N'SUBIN SEBASTIAN', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'hmdm_lnkrany@hotmail.com', N'9889512568', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (572, N'USER0571', N'ABIN RAVI', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'srwr.aaly8@hotmail.com', N'9889512569', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (573, N'USER0572', N'ATHIRA K.S', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'danwsh_qmyshy56@yahoo.com', N'9889512570', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (574, N'USER0573', N'DEVI NARAYAN', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'nazly_aashwry@gmail.com', N'9889512571', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (575, N'USER0574', N'Suhail k', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'grshasb86@yahoo.com', N'9889512572', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (576, N'USER0575', N'Jisheed D', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'aarsham.alm@hotmail.com', N'9889512573', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (577, N'USER0576', N'Sanoop E P', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'sahy.mjthdshbstry@yahoo.com', N'9889512574', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (578, N'USER0577', N'SUNIL SUNNY', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'mynwfr.wkyly50@hotmail.com', N'9889512575', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (579, N'USER0578', N'ABHILASH K. PILLAI', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'lhrasb34@yahoo.com', N'9889512576', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (580, N'USER0579', N'GOKUL RAJAN', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'lbkhnd.kmaly@hotmail.com', N'9889512577', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (581, N'USER0580', N'RAIZA SAMAD', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'mnyzhh70@yahoo.com', N'9889512578', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (582, N'USER0581', N'NISHANT ROY', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'rabw.frwtn82@gmail.com', N'9889512579', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (583, N'USER0582', N'LOVELY LATIF', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'hkhamnsh28@yahoo.com', N'9889512580', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (584, N'USER0583', N'JOHNCY ANNA JOHN', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'mhwsh21@gmail.com', N'9889512581', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (585, N'USER0584', N'SURYA K.S', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'pshng.aqyly39@hotmail.com', N'9889512582', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (586, N'USER0585', N'ROHIL JUSTIN', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'khwrshyd.krmany@gmail.com', N'9889512583', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (587, N'USER0586', N'DONA CHACKO', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'twty_mrtdhwy19@yahoo.com', N'9889512584', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (588, N'USER0587', N'BENNY AMALADASAN', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'shwan_khnmwyy6@gmail.com', N'9889512585', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (589, N'USER0588', N'ACHU A.R', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'pwlad95@yahoo.com', N'9889512586', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (590, N'USER0589', N'ANU THOMAS', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'zhalh.ythrby@yahoo.com', N'9889512587', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (591, N'USER0590', N'KIRAN.S', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'frwd.qadhy8@hotmail.com', N'9889512588', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (592, N'USER0591', N'NEETHU CHANDRAN C P', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'rabyn.mjtbwy84@hotmail.com', N'9889512589', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (593, N'USER0592', N'ANSAR A.R', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'zhalan_kakawnd@hotmail.com', N'9889512590', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (594, N'USER0593', N'TERESE JOSEPH', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'dlaawyz42@yahoo.com', N'9889512591', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (595, N'USER0594', N'SHILNA MANOHAR', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'kywandkht18@gmail.com', N'9889512592', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (596, N'USER0595', N'JOHN ANTO', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'aartyn_mddy73@hotmail.com', N'9889512593', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (597, N'USER0596', N'JANET JOSE ABRAHAM', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'swzh71@hotmail.com', N'9889512594', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (598, N'USER0597', N'SANJU S K', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'twran.mlkyan@gmail.com', N'9889512595', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (599, N'USER0598', N'NAVEEN NANDAKUMAR', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'asfndyar.mayn17@gmail.com', N'9889512596', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (600, N'USER0599', N'STEPHY GEORGE', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'swrn79@gmail.com', N'9889512597', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (601, N'USER0600', N'SIJU BABU B', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'swgnd.mhdthy44@gmail.com', N'9889512598', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (602, N'USER0601', N'SHANID T L', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'nwshfr_mftah@hotmail.com', N'9889512599', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (603, N'USER0602', N'APARNA SEKAR', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'nwsh_abdalkrymy@yahoo.com', N'9889512600', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (604, N'USER0603', N'SEENA MATHEW', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'hwrdad.mlayry95@gmail.com', N'9889512601', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (605, N'USER0604', N'SREENATH.S', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'swbar_hmt74@gmail.com', N'9889512602', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (606, N'USER0605', N'KHALEEL KHALID ARATTUTHODIKA', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'tyna_frj18@hotmail.com', N'9889512603', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (607, N'USER0606', N'DIVYA.C.BABU', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'khawrdkht75@gmail.com', N'9889512604', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (608, N'USER0607', N'REMYA R', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'khwrshyd.mlkyan@gmail.com', N'9889512605', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (609, N'USER0608', N'BISMITHA.V.VINCE', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'nykdad_qhrmany@hotmail.com', N'9889512606', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (610, N'USER0609', N'RAJEEV P.H', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'aabtyn70@hotmail.com', N'9889512607', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (611, N'USER0610', N'TIJU V JOSEPH', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'frywsh25@hotmail.com', N'9889512608', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (612, N'USER0611', N'MONISHA J', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'glrw.alyasgry87@hotmail.com', N'9889512609', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (613, N'USER0612', N'JERRY JOHN', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'chhrzad.mwswy@hotmail.com', N'9889512610', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (614, N'USER0613', N'PARVATHY S.VARMA', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'lqaa.nwab43@hotmail.com', N'9889512611', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (615, N'USER0614', N'SHERIN ANN BABU', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'kyqbad84@yahoo.com', N'9889512612', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (616, N'USER0615', N'AJAY P R', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'tyna_hashmy@hotmail.com', N'9889512613', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (617, N'USER0616', N'NEHA STEPHEN', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'zyma.hashmyan@hotmail.com', N'9889512614', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (618, N'USER0617', N'SRUTHI A', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'aartam49@yahoo.com', N'9889512615', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (619, N'USER0618', N'SHERIN CHACKO', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'mhraab.nazry75@yahoo.com', N'9889512616', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (620, N'USER0619', N'NAYANA MOHAN', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'darab79@hotmail.com', N'9889512617', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (621, N'USER0620', N'APARNA SEKAR', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'nykpy_abdalkrymy73@hotmail.com', N'9889512618', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (622, N'USER0621', N'SEENA MATHEW', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'brzyn72@yahoo.com', N'9889512619', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (623, N'USER0622', N'SREENATH.S', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'mzhdh97@yahoo.com', N'9889512620', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (624, N'USER0623', N'KHALEEL KHALID ARATTUTHODIKA', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'ayaz_waaz@yahoo.com', N'9889512621', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (625, N'USER0624', N'DIVYA.C.BABU', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'jhandkht.mlk@yahoo.com', N'9889512622', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (626, N'USER0625', N'REMYA R', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'starh.mhmdy@gmail.com', N'9889512623', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (627, N'USER0626', N'BISMITHA.V.VINCE', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'prysa23@yahoo.com', N'9889512624', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (628, N'USER0627', N'CHARLY M GEORGE', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'chwbyn.qhstany@hotmail.com', N'9889512625', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (629, N'USER0628', N'VISHNU RAJ', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'prwanh.yahqy53@yahoo.com', N'9889512626', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (630, N'USER0629', N'THURGA B', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'nsryndkht92@hotmail.com', N'9889512627', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (631, N'USER0630', N'JINCY SARA THOMAS', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'hwman.mwswy0@gmail.com', N'9889512628', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (632, N'USER0631', N'SIJO G OOMMEN', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'nykkhwah_kdywr@gmail.com', N'9889512629', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (633, N'USER0632', N'ARUNDEEPAK', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'yzdan.kymyayy@hotmail.com', N'9889512630', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (634, N'USER0633', N'NIMPTHA JACOB', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'whrz.mwhd15@yahoo.com', N'9889512631', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (635, N'USER0634', N'JOB M THOMAS', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'mhrdkht_mfth41@yahoo.com', N'9889512632', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (636, N'USER0635', N'VAISAKH GOPAL', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'hwnam.framrzy@gmail.com', N'9889512633', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (637, N'USER0636', N'GAYA CP', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'pwpk.yahqy20@yahoo.com', N'9889512634', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (638, N'USER0637', N'PRANAV S KURUP', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'shhnwaz_kdywr46@hotmail.com', N'9889512635', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (639, N'USER0638', N'SAJEEV.K', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'aartmn_frj@hotmail.com', N'9889512636', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (640, N'USER0639', N'SANDRA S', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'aazyta_kyan22@yahoo.com', N'9889512637', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (641, N'USER0640', N'VINITHA V PRABHU', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'makan_mwswy83@hotmail.com', N'9889512638', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (642, N'USER0641', N'ASWINDEV.T.D', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'ramtyn_ylda@hotmail.com', N'9889512639', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (643, N'USER0642', N'TEENA THOMAS', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'shbdyz39@hotmail.com', N'9889512640', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (644, N'USER0643', N'SANGITA S', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'nstrn45@yahoo.com', N'9889512641', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (645, N'USER0644', N'LIBINA ROSE SEBASTIAN', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'darywsh36@hotmail.com', N'9889512642', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (646, N'USER0645', N'POOJA RAICHEL THOMAS', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'ashkbws_msahb60@hotmail.com', N'9889512643', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (647, N'USER0646', N'DERSANA KRISHNAN', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'bhzad19@hotmail.com', N'9889512644', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (648, N'USER0647', N'BESTIN JAMES MONICKAM.J', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'namwr51@yahoo.com', N'9889512645', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (649, N'USER0648', N'GRIBIN JOSEPH', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'nsrynnwsh.aarf@gmail.com', N'9889512646', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (650, N'USER0649', N'MARIA JOSE', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'ghwgha50@yahoo.com', N'9889512647', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (651, N'USER0650', N'JOSELIN JOSEPH', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'tyrdad_qanwny@gmail.com', N'9889512648', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (652, N'USER0651', N'DIPTI VARMA', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'hwrmnd19@gmail.com', N'9889512649', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (653, N'USER0652', N'MAGGIE M S', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'aawng12@hotmail.com', N'9889512650', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (654, N'USER0653', N'MRUDUSH.C', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'rasa.hwshyar64@hotmail.com', N'9889512651', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (655, N'USER0654', N'TEDDY KURIAN', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'zry.alm@gmail.com', N'9889512652', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (656, N'USER0655', N'SIVANAND.N.S', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'mhrdkht.hashmy@yahoo.com', N'9889512653', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (657, N'USER0656', N'AYYANAR.N', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'shyrzad_glmhmdy@hotmail.com', N'9889512654', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (658, N'USER0657', N'KANNAN G KRISHNAN', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'gwhrnaz_frj94@yahoo.com', N'9889512655', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (659, N'USER0658', N'ALLEN JOSEPH', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'frjad_aarf@yahoo.com', N'9889512656', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (660, N'USER0659', N'SIRONA SAJI', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'brzwyh_mhdypwr3@hotmail.com', N'9889512657', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (661, N'USER0660', N'ANU.S', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'shwan57@gmail.com', N'9889512658', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (662, N'USER0661', N'VEENA C N', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'frngys_alya21@yahoo.com', N'9889512659', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (663, N'USER0662', N'AARATHI VIKAS', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'aarmyta80@yahoo.com', N'9889512660', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (664, N'USER0663', N'ALPHY M GEORGE', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'mhrzadh77@hotmail.com', N'9889512661', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (665, N'USER0664', N'VARUN SATISH', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'mhraathr_frhng90@hotmail.com', N'9889512662', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (666, N'USER0665', N'RAHUL.T.R', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'sty.alyzmany19@gmail.com', N'9889512663', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (667, N'USER0666', N'NEENU MATHEW', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'kywandkht19@gmail.com', N'9889512664', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (668, N'USER0667', N'NIIKHIL T.M', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'darywsh_ythrby@gmail.com', N'9889512665', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (669, N'USER0668', N'SRUTHY A PILLAI', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'glnwsh.hwmn48@yahoo.com', N'9889512666', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (670, N'USER0669', N'JAYAKRISHNAN.A', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'aarsh20@gmail.com', N'9889512667', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (671, N'USER0670', N'VISHNU.V.S', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'sahy.farsy@gmail.com', N'9889512668', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (672, N'USER0671', N'CERIN ELIZABETH GEORGE', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'bhdad_aqyly74@yahoo.com', N'9889512669', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (673, N'USER0672', N'JINCY THOMAS', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'kawws44@yahoo.com', N'9889512670', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (674, N'USER0673', N'K.SHARIKA', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'jmshyd_almalhdy31@hotmail.com', N'9889512671', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (675, N'USER0674', N'NEENA N', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'prywsh78@yahoo.com', N'9889512672', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (676, N'USER0675', N'SNEJI MARIYAM SAMUEL', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'pdram.hashmy@gmail.com', N'9889512673', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (677, N'USER0676', N'NIDHA ANTONY', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'fryman_hmdany@gmail.com', N'9889512674', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (678, N'USER0677', N'PRIYA GEORGE', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'nrgs.msbah@gmail.com', N'9889512675', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (679, N'USER0678', N'VIDHYA R', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'ktaywn_khnmwyy@yahoo.com', N'9889512676', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (680, N'USER0679', N'ANJALY THOMAS', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'glpwnh67@gmail.com', N'9889512677', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (681, N'USER0680', N'REESHNA.T', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'dwrshasb.mjthdy@yahoo.com', N'9889512678', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (682, N'USER0681', N'VIPIN P.V.', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'mstanh.kamly41@hotmail.com', N'9889512679', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (683, N'USER0682', N'JULIE MARY MATHEW', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'chawsh_mrtdhwy@yahoo.com', N'9889512680', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (684, N'USER0683', N'DEEPU P MATHEWS', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'khrmdkht.lwks34@hotmail.com', N'9889512681', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (685, N'USER0684', N'JOGY JOSEPH', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'chhrzad59@hotmail.com', N'9889512682', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (686, N'USER0685', N'THOMAS N.T', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'sarh33@hotmail.com', N'9889512683', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (687, N'USER0686', N'ANJU VARGHESE', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'chhrzad.maarf97@yahoo.com', N'9889512684', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (688, N'USER0687', N'SHAMNA N', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'prwanh9@gmail.com', N'9889512685', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (689, N'USER0688', N'ANU JOSEPH .K', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'frwz.frshydwrd@hotmail.com', N'9889512686', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (690, N'USER0689', N'JINOSH K CHACKO', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'mhnwsh.lwks32@yahoo.com', N'9889512687', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (691, N'USER0690', N'LIFNA K SUBRAMANIAN', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'hzhyr36@hotmail.com', N'9889512688', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (692, N'USER0691', N'RASHMI KP', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'dybadkht_fatmy@gmail.com', N'9889512689', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (693, N'USER0692', N'NITIN SADANAND', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'shyrng96@yahoo.com', N'9889512690', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (694, N'USER0693', N'DEEPA SREERAJ', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'zrngar_fnayy25@hotmail.com', N'9889512691', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (695, N'USER0694', N'CHINCHU.L', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'glpwsh_mnwchhry@yahoo.com', N'9889512692', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (696, N'USER0695', N'ATHIRA VIJAYAN', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'shahdkht.mjrd65@yahoo.com', N'9889512693', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (697, N'USER0696', N'VINNY S DEV', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'saghr7@yahoo.com', N'9889512694', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (698, N'USER0697', N'NEENU MERRY TOM', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'gwdrz.almalhdy@gmail.com', N'9889512695', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (699, N'USER0698', N'ANUJA ANTONY', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'twran68@hotmail.com', N'9889512696', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (700, N'USER0699', N'ASWATHI P RAJ', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'grdan.hmaywn@gmail.com', N'9889512697', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (701, N'USER0700', N'JAISON K THOMAS', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'ksry.mzfr53@gmail.com', N'9889512698', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (702, N'USER0701', N'SREERAJ S CHIRACKAL', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'mhrdad.mfth@gmail.com', N'9889512699', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (703, N'USER0702', N'SACHIN R.S', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'wyshtasb.ythrby@gmail.com', N'9889512700', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (704, N'USER0703', N'PRAVEEN KRISHNAMOORTHY', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'frzam_mjthdshbstry@yahoo.com', N'9889512701', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (705, N'USER0704', N'GREESHMA R NAIR', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'nazfr_mradkhany74@yahoo.com', N'9889512702', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (706, N'USER0705', N'BUNAISA MOL P.B.', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'ghrchhr73@gmail.com', N'9889512703', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (707, N'USER0706', N'TREESA SUSAN JAMES', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'rawyar88@gmail.com', N'9889512704', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (708, N'USER0707', N'SYAMKUMAR.S', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'zybar.fnayy7@yahoo.com', N'9889512705', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (709, N'USER0708', N'MONISHA MOHAN', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'mhrdkht.krdbchh10@yahoo.com', N'9889512706', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (710, N'USER0709', N'GEETHU VIJAYAN', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'mhrnkar16@gmail.com', N'9889512707', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (711, N'USER0710', N'VYBHAV.PM', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'glbrg13@hotmail.com', N'9889512708', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (712, N'USER0711', N'NITIN DOMINIC', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'zry_mwswy@gmail.com', N'9889512709', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (713, N'USER0712', N'RESHMA MURALI', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'nysha.wkyly@hotmail.com', N'9889512710', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (714, N'USER0713', N'SANI.A.S', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'ksry46@gmail.com', N'9889512711', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (715, N'USER0714', N'JITHIN K.GEORGE', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'glbyz_abdalmlky88@hotmail.com', N'9889512712', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (716, N'USER0715', N'JINO CHACKO', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'zhyar.alyasgry@gmail.com', N'9889512713', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (717, N'USER0716', N'DICKSON XAVIER', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'shhla_mjtbayy36@yahoo.com', N'9889512714', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (718, N'USER0717', N'THASNA E M', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'khsrw_klbasy@yahoo.com', N'9889512715', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (719, N'USER0718', N'AIMEY.P', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'bhram.kwshky83@hotmail.com', N'9889512716', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (720, N'USER0719', N'MURINGATHERY DON DAVID', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'kamnwsh15@hotmail.com', N'9889512717', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (721, N'USER0720', N'KANNAN G.P', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'glpry49@yahoo.com', N'9889512718', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (722, N'USER0721', N'RAKHI G', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'hma.mayn@yahoo.com', N'9889512719', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (723, N'USER0722', N'BINITHA.K.NAIR', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'ardwan.mayn@hotmail.com', N'9889512720', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (724, N'USER0723', N'JIM ALEX', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'mana_kashy61@hotmail.com', N'9889512721', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (725, N'USER0724', N'JINU.P.SURENDRAN', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'manya_kamly50@gmail.com', N'9889512722', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (726, N'USER0725', N'ZAFER AM', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'mrmr.hmt@yahoo.com', N'9889512723', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (727, N'USER0726', N'TOM JOSE', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'aathyn.qmyshy@gmail.com', N'9889512724', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (728, N'USER0727', N'NIVY RACHEL THOMAS', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'twzhal81@gmail.com', N'9889512725', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (729, N'USER0728', N'HANYMOL H.A', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'grdaafryd.kwshky50@yahoo.com', N'9889512726', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (730, N'USER0729', N'GANGA RANI R', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'jhanbkhsh.ghny31@hotmail.com', N'9889512727', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (731, N'USER0730', N'RESMI RAJAN', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'jamyn_yadgar36@yahoo.com', N'9889512728', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (732, N'USER0731', N'LIGINLAL K. JOSEPH', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'nwsha_mjahd@hotmail.com', N'9889512729', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (733, N'USER0732', N'DILIP LAZAR', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'sphr90@yahoo.com', N'9889512730', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (734, N'USER0733', N'NIDHISH PS', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'chawsh97@hotmail.com', N'9889512731', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (735, N'USER0734', N'REKHA MOHAN', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'glpr_fatmy@yahoo.com', N'9889512732', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (736, N'USER0735', N'RITTY THOMAS', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'mhsyma_nwab26@gmail.com', N'9889512733', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (737, N'USER0736', N'AHILA ARAVIND', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'aathyn.aashwry81@gmail.com', N'9889512734', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (738, N'USER0737', N'DIVYA M R', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'aaryafr.hmdany77@yahoo.com', N'9889512735', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (739, N'USER0738', N'HAALA MAMMED', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'bhdys.abdalmlky86@yahoo.com', N'9889512736', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (740, N'USER0739', N'SHEEN VARGHESE .M', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'ngyn_kmaly@hotmail.com', N'9889512737', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (741, N'USER0740', N'RAHUL R', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'glpwsh.nraqy@yahoo.com', N'9889512738', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (742, N'USER0741', N'FATHIMA S', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'frdys.nhawndy@hotmail.com', N'9889512739', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (743, N'USER0742', N'AJUMAL.E', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'nwyndkht.myrzadh47@hotmail.com', N'9889512740', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (744, N'USER0743', N'ANOOJ M', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'frbgh85@yahoo.com', N'9889512741', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (745, N'USER0744', N'CHETHANA BHASKARAN', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'glaathyn_klbasy@hotmail.com', N'9889512742', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (746, N'USER0745', N'ANU CHERIAN', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'grsha_msahb@yahoo.com', N'9889512743', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (747, N'USER0746', N'SANDRA JOSE', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'zyba_qmyshy28@hotmail.com', N'9889512744', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (748, N'USER0747', N'JITHIN SEBASTIAN JOJI', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'spnd_qanwny@hotmail.com', N'9889512745', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (749, N'USER0748', N'VAISAKH R', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'zynw14@hotmail.com', N'9889512746', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (750, N'USER0749', N'JIJO K ANTONY', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'bhrng.wkyly@hotmail.com', N'9889512747', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (751, N'USER0750', N'SHAMBAVI .S', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'twty31@hotmail.com', N'9889512748', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (752, N'USER0751', N'DIVYA CYRIAC', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'ayrj91@hotmail.com', N'9889512749', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (753, N'USER0752', N'LINTU THOMAS', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'glzar_namtzadh59@yahoo.com', N'9889512750', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (754, N'USER0753', N'PRIYA GEORGE', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'bkhtyar_qhstany@gmail.com', N'9889512751', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (755, N'USER0754', N'GEO JOHN', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'khshayar92@gmail.com', N'9889512752', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (756, N'USER0755', N'SOMY SUSAN KURUVILLA', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'mrzban76@gmail.com', N'9889512753', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (757, N'USER0756', N'VISHNU SASI', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'frzyn.hashmyrfsnjany1@yahoo.com', N'9889512754', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (758, N'USER0757', N'ROSHAN STEPHEN', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'shbahng2@yahoo.com', N'9889512755', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (759, N'USER0758', N'SOMA.A.JANARDHANAN', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'frdad17@hotmail.com', N'9889512756', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (760, N'USER0759', N'JOBIN JOSEPH', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'gwdrz24@gmail.com', N'9889512757', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (761, N'USER0760', N'BIJI A', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'khram.fryad14@gmail.com', N'9889512758', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (762, N'USER0761', N'LAKSHMI DEVI', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'shbahng_nazry@hotmail.com', N'9889512759', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (763, N'USER0762', N'RASIYA MUHAMMED', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'frwd.kymyayy@hotmail.com', N'9889512760', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (764, N'USER0763', N'JASYN SUSAN MATHEW', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'frwtn.azyzy91@hotmail.com', N'9889512761', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (765, N'USER0764', N'REMYA K.V.', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'zryn.qmyshy@gmail.com', N'9889512762', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (766, N'USER0765', N'AMRITA NAIR C', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'nrmyn0@hotmail.com', N'9889512763', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (767, N'USER0766', N'EDU VISWAM', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'aazrm.myrzadh@gmail.com', N'9889512764', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (768, N'USER0767', N'NIRMALA.C', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'frkh.fryad4@hotmail.com', N'9889512765', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (769, N'USER0768', N'FAIZAL.N', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'dyba_frj67@hotmail.com', N'9889512766', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (770, N'USER0769', N'SRIRAM.R', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'wrjawnd92@yahoo.com', N'9889512767', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (771, N'USER0770', N'BETSY MATHEW', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'zadbh21@yahoo.com', N'9889512768', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (772, N'USER0771', N'MIRZA SHAMS', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'sam.alypwr68@gmail.com', N'9889512769', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (773, N'USER0772', N'JISHA MARIAM SAJU', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'frydkht31@hotmail.com', N'9889512770', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (774, N'USER0773', N'DIVYA .P', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'shrmyn.kymyayy60@gmail.com', N'9889512771', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (775, N'USER0774', N'NAMITA THOMAS', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'glbw_mhmdy@yahoo.com', N'9889512772', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (776, N'USER0775', N'RASNA P', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'astr.krdbchh15@gmail.com', N'9889512773', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (777, N'USER0776', N'GIFTY SUSAN JAMES', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'nda89@yahoo.com', N'9889512774', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (778, N'USER0777', N'HAPPY SASEENDRAN', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'frynwsh75@gmail.com', N'9889512775', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (779, N'USER0778', N'KARTHIKA', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'frwzan60@yahoo.com', N'9889512776', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (780, N'USER0779', N'SURYA JOHN CHRISTINA', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'dlnwaz.aaly@hotmail.com', N'9889512777', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (781, N'USER0780', N'ACSA.P.CLEMIS', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'hyrbd.gnjy@gmail.com', N'9889512778', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (782, N'USER0781', N'STEFFI PHILIP MULAMOOTTIL', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'glnwsh.myrdamady@hotmail.com', N'9889512779', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (783, N'USER0782', N'MANU.N.V', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'saghr.alyaabady21@hotmail.com', N'9889512780', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (784, N'USER0783', N'NIKHITHA K.B', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'kambkhsh.klbasy@gmail.com', N'9889512781', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (785, N'USER0784', N'MATHEW PHILIP A', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'jhanbanw.wathqy@yahoo.com', N'9889512782', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (786, N'USER0785', N'AJEENA THOMAS', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'lalhrkh.krdbchh@hotmail.com', N'9889512783', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (787, N'USER0786', N'TEENA GEORGE', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'glzar78@hotmail.com', N'9889512784', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (788, N'USER0787', N'FEBIN TOMY', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'twfan.qanwny59@hotmail.com', N'9889512785', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (789, N'USER0788', N'AJITH B. MALIACKAL', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'anwshrwan.aaly@yahoo.com', N'9889512786', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (790, N'USER0789', N'LINJU P B', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'mhbanw_kymyayy33@gmail.com', N'9889512787', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (791, N'USER0790', N'JUBIN JOSEPH', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'yzdan61@yahoo.com', N'9889512788', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (792, N'USER0791', N'SREELEKSHMI R', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'nrmyn_mqdm11@hotmail.com', N'9889512789', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (793, N'USER0792', N'RAHUL RAJENDRAN', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'prydkht.alyzmany89@hotmail.com', N'9889512790', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (794, N'USER0793', N'SHINU JACOB', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'shhab97@gmail.com', N'9889512791', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (795, N'USER0794', N'VANDANA V', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'radbanw.qanwny86@gmail.com', N'9889512792', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (796, N'USER0795', N'TONY JOSE', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'whrz.hmdany@gmail.com', N'9889512793', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (797, N'USER0796', N'NAMSHID A.V', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'danwsh16@hotmail.com', N'9889512794', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (798, N'USER0797', N'KEVIN KORAH ABRAHAM', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'shady24@yahoo.com', N'9889512795', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (799, N'USER0798', N'BIYAMOL BABU', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'aazadh22@gmail.com', N'9889512796', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (800, N'USER0799', N'Midhun Raj R', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'frdys_qmyshy@gmail.com', N'9889512797', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (801, N'USER0800', N'MARIYA TOMY', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'mhrnkar_mnwchhry6@hotmail.com', N'9889512798', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (802, N'USER0801', N'ANOOP.C', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'darywsh.aarf@gmail.com', N'9889512799', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (803, N'USER0802', N'SAJEEV P V', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'khbd.myrspasy50@yahoo.com', N'9889512800', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (804, N'USER0803', N'NEHA GOPAL', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'nazprwr.mhmdy32@yahoo.com', N'9889512801', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (805, N'USER0804', N'YEDU KRISHNAN B', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'mnyzhh.mhajrany@hotmail.com', N'9889512802', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (806, N'USER0805', N'TEVIN JOSEPH K.O', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'sark.mhajrany53@yahoo.com', N'9889512803', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (807, N'USER0806', N'KEVIN SEBASTIAN FERNANDEZ', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'ramyar.qmyshy76@yahoo.com', N'9889512804', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (808, N'USER0807', N'ABDUL RAHMAN SHANAZ KAPIL', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'brzw.araqy19@yahoo.com', N'9889512805', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (809, N'USER0808', N'ANUJA M V', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'hyrmnd43@gmail.com', N'9889512806', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (810, N'USER0809', N'JITHA S KUMAR', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'nwshfr_mhmdy@hotmail.com', N'9889512807', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (811, N'USER0810', N'AJAYSREEDHAR.M.R', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'twfan.hwmn@gmail.com', N'9889512808', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (812, N'USER0811', N'LIJIN P. JOHN', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'zawa.nwab@hotmail.com', N'9889512809', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (813, N'USER0812', N'BOBBY SEBASTIAN', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'glnaz_anayt65@gmail.com', N'9889512810', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (814, N'USER0813', N'TANIA THOMAS THEVARCAD', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'jwan_hashmyrfsnjany71@yahoo.com', N'9889512811', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (815, N'USER0814', N'RAHUL RAJAN', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'tajy31@yahoo.com', N'9889512812', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (816, N'USER0815', N'NAYANA JOSE', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'grsha.krmany82@gmail.com', N'9889512813', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (817, N'USER0816', N'NAVEEN DEENA THOMAS', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'banw76@hotmail.com', N'9889512814', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (818, N'USER0817', N'MINTY BABY', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'mahbrzyn91@gmail.com', N'9889512815', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (819, N'USER0818', N'MEERA J PAI', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'hwrtash_nazry@yahoo.com', N'9889512816', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (820, N'USER0819', N'JINU KURIAN', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'srafraz.msahb@yahoo.com', N'9889512817', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (821, N'USER0820', N'GEETHU SUNNY', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'pwya86@yahoo.com', N'9889512818', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (822, N'USER0821', N'FAHAD VALLANCHIRA', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'nwsha91@yahoo.com', N'9889512819', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (823, N'USER0822', N'BINYAMIN', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'dnya_abdalkrymy@yahoo.com', N'9889512820', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (824, N'USER0823', N'BINSA PAUL', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'shmshad_marwf@hotmail.com', N'9889512821', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (825, N'USER0824', N'ARCHANA P V', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'glandam.almalhdy@hotmail.com', N'9889512822', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (826, N'USER0825', N'APARNA V.NAIR', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'twrj_mwhd93@gmail.com', N'9889512823', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (827, N'USER0826', N'KARTHIKA.I', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'rkhshanh_ndwshn62@yahoo.com', N'9889512824', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (828, N'USER0827', N'JITHIN.PRAKASH', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'mynwdkht.wathqy@hotmail.com', N'9889512825', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (829, N'USER0828', N'ANN SUSAN BABU', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'pwya.azyzy12@hotmail.com', N'9889512826', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (830, N'USER0829', N'HIBA AZEEZ P', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'hwrdad_frshydwrd@yahoo.com', N'9889512827', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (831, N'USER0830', N'ANURADHA.J', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'rwzbh.mayn11@hotmail.com', N'9889512828', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (832, N'USER0831', N'NEETHU.S', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'glnaz.hashmy78@yahoo.com', N'9889512829', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (833, N'USER0832', N'LAYA JACOB', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'swsn75@hotmail.com', N'9889512830', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (834, N'USER0833', N'VIJI VARGHESE', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'anwshrwan.fnyzadh43@gmail.com', N'9889512831', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (835, N'USER0834', N'ADARSH. V. S', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'bhram.krmany9@yahoo.com', N'9889512832', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (836, N'USER0835', N'DEEPTHI WILSON', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'hytasb.maarf@gmail.com', N'9889512833', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (837, N'USER0836', N'MELVIN JOSEPH MANI', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'shrwyn13@gmail.com', N'9889512834', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (838, N'USER0837', N'DENNIS VARKEY ROY', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'nadr.ythrby20@hotmail.com', N'9889512835', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (839, N'USER0838', N'BABUL MATHEW', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'zry.glmhmdy77@gmail.com', N'9889512836', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (840, N'USER0839', N'VINEETHA NARAYANAN', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'shhrh15@hotmail.com', N'9889512837', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (841, N'USER0840', N'SUBIN T CHETHIMATTOM', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'nsrynnwsh13@hotmail.com', N'9889512838', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (842, N'USER0841', N'LEKSHMI.U.S', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'pzhman8@hotmail.com', N'9889512839', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (843, N'USER0842', N'JYOTHIS ULAHANNAN', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'frbd74@yahoo.com', N'9889512840', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (844, N'USER0843', N'JUBY SARA KURUVILLA', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'dyaakw.mlk@yahoo.com', N'9889512841', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (845, N'USER0844', N'SREELAKSHMI.N', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'glchyn_mhdthy@gmail.com', N'9889512842', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (846, N'USER0845', N'NEETHU JOSE', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'frzan51@hotmail.com', N'9889512843', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (847, N'USER0846', N'ASHISH.C', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'nrgs_nwbkht@hotmail.com', N'9889512844', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (848, N'USER0847', N'JITHIN I.V', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'dyanwsh55@gmail.com', N'9889512845', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (849, N'USER0848', N'SHINOJ.VM', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'swlmaz.myzbany39@gmail.com', N'9889512846', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (850, N'USER0849', N'JITHIN MATHEW', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'nykdad_hrwy47@hotmail.com', N'9889512847', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (851, N'USER0850', N'MERIN GEORGE', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'radbanw_mfth94@yahoo.com', N'9889512848', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (852, N'USER0851', N'SHARON MERIN JOSE', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'mhjbyn_alyasgry65@hotmail.com', N'9889512849', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (853, N'USER0852', N'RESHMA G NAIR', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'shmyla_fatmy@yahoo.com', N'9889512850', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (854, N'USER0853', N'JESTIN GEORGE JACOB', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'pyrwz.hashmyrfsnjany@hotmail.com', N'9889512851', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (855, N'USER0854', N'GEETHU JOY', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'barbd.ndwshn36@hotmail.com', N'9889512852', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (856, N'USER0855', N'FEBY ELSA VARGHESE', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'frkh.mnwchhry@gmail.com', N'9889512853', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (857, N'USER0856', N'GANESH V K', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'hwyda65@yahoo.com', N'9889512854', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (858, N'USER0857', N'RAMESH.K.R', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'prychhr.fnayy66@hotmail.com', N'9889512855', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (859, N'USER0858', N'Nirmal Therese Sunny', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'tyna.nwbkht@yahoo.com', N'9889512856', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (860, N'USER0859', N'Saranya T T', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'aathyn_mddy98@hotmail.com', N'9889512857', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (861, N'USER0860', N'Rahul Mohan', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'sayna81@yahoo.com', N'9889512858', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (862, N'USER0861', N'Juby Mariam John', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'dlnwaz.aarf95@gmail.com', N'9889512859', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (863, N'USER0862', N'SIJU PUSHKARAN', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'rasa.kamly15@hotmail.com', N'9889512860', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (864, N'USER0863', N'R RAJESH KUMAR', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'glpr24@hotmail.com', N'9889512861', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (865, N'USER0864', N'Biby Mathew', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'kyan_mlkyan@yahoo.com', N'9889512862', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (866, N'USER0865', N'Divya Sadanandan', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'frnwd_mwhd12@gmail.com', N'9889512863', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (867, N'USER0866', N'SANEEJA THOMAS', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'sark_mjtbayy@hotmail.com', N'9889512864', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (868, N'USER0867', N'SOORAJ S R', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'maral.mjtbayy@yahoo.com', N'9889512865', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (869, N'USER0868', N'JUSTIN K GEORGE', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'mhrwz.alyzmany@gmail.com', N'9889512866', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (870, N'USER0869', N'RIYA VARGHESE', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'hwmn.mfth1@yahoo.com', N'9889512867', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (871, N'USER0870', N'ATHUL MOHAN', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'thmwrth.msha@gmail.com', N'9889512868', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (872, N'USER0871', N'RITU ANN CHERIAN', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'gldys_kakawnd@yahoo.com', N'9889512869', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (873, N'USER0872', N'JEBIN ABRAHAM', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'wamq.mlayry@gmail.com', N'9889512870', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (874, N'USER0873', N'DIANA P C', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'manya.mjrd@hotmail.com', N'9889512871', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (875, N'USER0874', N'SHERY JOYA JOHN', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'tabandkht.mstwfy91@yahoo.com', N'9889512872', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (876, N'USER0875', N'LINI ELSA ABRAHAM', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'rawyar_qanwny@gmail.com', N'9889512873', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (877, N'USER0876', N'LIGIN JOSEPH', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'maral_msbahzadh36@yahoo.com', N'9889512874', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (878, N'USER0877', N'BINSY P', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'jmshyd18@gmail.com', N'9889512875', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (879, N'USER0878', N'ARUN M.S', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'ashkan_hmt69@gmail.com', N'9889512876', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (880, N'USER0879', N'ANNAMMA DOMINIC', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'byzhn_abdalkrymy@gmail.com', N'9889512877', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (881, N'USER0880', N'NINA SARA JOHN', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'many29@yahoo.com', N'9889512878', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (882, N'USER0881', N'RESHMI NARAYANAN', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'sybwbh.hwmn72@gmail.com', N'9889512879', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (883, N'USER0882', N'SANJAY KARUN', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'shrarh.abady@yahoo.com', N'9889512880', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (884, N'USER0883', N'HARSHA MANASA J S', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'zal90@yahoo.com', N'9889512881', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (885, N'USER0884', N'RAM NS', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'yawr87@gmail.com', N'9889512882', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (886, N'USER0885', N'MEERA THOMAS', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'shbahng.nylwfry65@yahoo.com', N'9889512883', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (887, N'USER0886', N'JOBISH PS', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'shyrw85@yahoo.com', N'9889512884', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (888, N'USER0887', N'SOUMYA RACHEL MATHEW', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'shbnm_mstwfy81@hotmail.com', N'9889512885', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (889, N'USER0888', N'PREJI P', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'kamran.framrzy39@hotmail.com', N'9889512886', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (890, N'USER0889', N'NINU MARIA ANDREWS', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'glrkh.myrbaqry87@gmail.com', N'9889512887', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (891, N'USER0890', N'DHANYA JAMES', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'wys_myzbany@yahoo.com', N'9889512888', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (892, N'USER0891', N'MANOJ MATHEW', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'kamjw.msha@gmail.com', N'9889512889', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (893, N'USER0892', N'ESSY CHARLEY C', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'frwtn.myrzadh@hotmail.com', N'9889512890', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (894, N'USER0893', N'VYSHAK RAJ M P', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'mahbrzyn68@hotmail.com', N'9889512891', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (895, N'USER0894', N'DEEPADAS S', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'hywa_kyan@hotmail.com', N'9889512892', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (896, N'USER0895', N'ANJANA MOHAN', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'frwd.mayn@gmail.com', N'9889512893', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (897, N'USER0896', N'JIMNA C', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'prnaz.kymyayy54@gmail.com', N'9889512894', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (898, N'USER0897', N'DIVYAMOL MATHEW', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'hmdm.waaz17@yahoo.com', N'9889512895', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (899, N'USER0898', N'BETSY GEORGE', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'kywandkht_mwswy49@yahoo.com', N'9889512896', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (900, N'USER0899', N'ANJANA R', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'grshasb.azyzy51@gmail.com', N'9889512897', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (901, N'USER0900', N'SUNU.J.B', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'bwyan_aashwry@yahoo.com', N'9889512898', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (902, N'USER0901', N'CHINU ALEX', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'nsrynnwsh_frj86@hotmail.com', N'9889512899', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (903, N'USER0902', N'NEENU SUSAN JOHN', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'mhranfr.mjthdshbstry@yahoo.com', N'9889512900', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (904, N'USER0903', N'RESHMA SUNNY ABRAHAM', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'banw64@yahoo.com', N'9889512901', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (905, N'USER0904', N'SANTHARAM. S', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'barbd_maarf10@gmail.com', N'9889512902', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (906, N'USER0905', N'PRAVEEN P R', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'pzhwa8@gmail.com', N'9889512903', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (907, N'USER0906', N'SUZEN SAJU KALLUNGAL', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'barman32@gmail.com', N'9889512904', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (908, N'USER0907', N'RIYA ELZA KOSHY', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'kywmrth_abdalkrymy72@gmail.com', N'9889512905', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (909, N'USER0908', N'RESHMI.V.K', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'aazrm_mnwchhry@gmail.com', N'9889512906', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (910, N'USER0909', N'NEETHU SIMON', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'shmshad_mhdypwr17@gmail.com', N'9889512907', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (911, N'USER0910', N'NAYANU.KV', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'mhsyma.mhjwb33@gmail.com', N'9889512908', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (912, N'USER0911', N'SHARLET JOSEPH', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'mrdas91@gmail.com', N'9889512909', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (913, N'USER0912', N'ANANDU J', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'glrkh_lahwty78@yahoo.com', N'9889512910', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (914, N'USER0913', N'MINTU VARGHESE', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'nazbanw_kwshky@yahoo.com', N'9889512911', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (915, N'USER0914', N'R.MANIKANDAN', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'hma.mrtdhwy@yahoo.com', N'9889512912', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (916, N'USER0915', N'KEWIN GEORGEY MAYHEWS', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'mrmr.wathqy@hotmail.com', N'9889512913', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (917, N'USER0916', N'SHILPA V PURUSHOTHAMAN', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'ngarh81@yahoo.com', N'9889512914', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (918, N'USER0917', N'PREETHA. A', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'bhdad95@yahoo.com', N'9889512915', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (919, N'USER0918', N'KRISHNAPRASAD.N', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'mahzad_mlkyan72@yahoo.com', N'9889512916', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (920, N'USER0919', N'ANOOP M. M.', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'darywsh_lwks@hotmail.com', N'9889512917', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (921, N'USER0920', N'MOHAMED SAJIN K C', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'swgnd_qhstany62@yahoo.com', N'9889512918', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (922, N'USER0921', N'NISHANT .A', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'glarh_aarf@gmail.com', N'9889512919', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (923, N'USER0922', N'KRISHNAPRIYA.C.H', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'zhyar.ghny@hotmail.com', N'9889512920', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (924, N'USER0923', N'BINCY THOMAS', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'fda.ylda46@yahoo.com', N'9889512921', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (925, N'USER0924', N'AFSAL.B', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'nwyn.farsy90@gmail.com', N'9889512922', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (926, N'USER0925', N'TOM MATHEW', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'hwrzad.aaly10@gmail.com', N'9889512923', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (927, N'USER0926', N'PREDHIN TOM SAPRU', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'hngamh61@gmail.com', N'9889512924', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (928, N'USER0927', N'MOHAMMED BINAS M', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'glpwsh70@yahoo.com', N'9889512925', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (929, N'USER0928', N'KAMAL NARENDRAN MENON', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'bamshad32@hotmail.com', N'9889512926', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (930, N'USER0929', N'KARTHIK BALAKRISHNAN', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'mahan.aarf@hotmail.com', N'9889512927', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (931, N'USER0930', N'BALA MURUGAN.K', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'parsa.msahb@yahoo.com', N'9889512928', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (932, N'USER0931', N'SHANKAR J', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'nwshrwan_yadgar@hotmail.com', N'9889512929', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (933, N'USER0932', N'SANDEEP.K', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'kanyar60@hotmail.com', N'9889512930', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (934, N'USER0933', N'ARUN KUMAR T.', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'dawr_hwmn@hotmail.com', N'9889512931', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (935, N'USER0934', N'SARAVANA KUMAR.K', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'chalak43@hotmail.com', N'9889512932', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (936, N'USER0935', N'SHAHID UMMER', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'aazrm32@hotmail.com', N'9889512933', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (937, N'USER0936', N'SANDEEP MJ', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'sana_mlayry0@hotmail.com', N'9889512934', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (938, N'USER0937', N'PRASIN DEV', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'prtw_araqy@yahoo.com', N'9889512935', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (939, N'USER0938', N'PRAJITH P', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'mhrnaz.ndwshn13@yahoo.com', N'9889512936', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (940, N'USER0939', N'NITHIN JACOB', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'nwa_kmaly77@hotmail.com', N'9889512937', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (941, N'USER0940', N'JACOB PAUL', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'glbhar_nazry88@gmail.com', N'9889512938', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (942, N'USER0941', N'DEEPAK.K', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'hmraz_hashmy@yahoo.com', N'9889512939', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (943, N'USER0942', N'SARAVANAN V', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'bhshad.aashwry70@hotmail.com', N'9889512940', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (944, N'USER0943', N'AJIS V.K.', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'nda.nwbkht99@hotmail.com', N'9889512941', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (945, N'USER0944', N'VITHYAKAR V', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'kyandkht_alya@hotmail.com', N'9889512942', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (946, N'USER0945', N'SOUMYA. K', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'mahandkht_abady@yahoo.com', N'9889512943', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (947, N'USER0946', N'KRITHIKA MANEEVANNAN', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'hwnam.yahqy@gmail.com', N'9889512944', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (948, N'USER0947', N'BAYYANA SRI DUTT', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'danwsh_aqyly@gmail.com', N'9889512945', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (949, N'USER0948', N'DINOOP DIVAKARAN', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'glnar_namtzadh@hotmail.com', N'9889512946', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (950, N'USER0949', N'MEERA THOMAS', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'manya47@hotmail.com', N'9889512947', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (951, N'USER0950', N'JOBISH PS', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'mahbrzyn71@gmail.com', N'9889512948', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (952, N'USER0951', N'SOUMYA RACHEL MATHEW', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'mhsa_namwr@hotmail.com', N'9889512949', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (953, N'USER0952', N'PREJI P', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'glryz73@gmail.com', N'9889512950', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (954, N'USER0953', N'NINU MARIA ANDREWS', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'zry_qhrmanyan30@gmail.com', N'9889512951', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (955, N'USER0954', N'DHANYA JAMES', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'ghwgha.waazy@hotmail.com', N'9889512952', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (956, N'USER0955', N'MANOJ MATHEW', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'nazy.anayt@yahoo.com', N'9889512953', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (957, N'USER0956', N'ESSY CHARLEY C', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'shyrng.mhdypwr@hotmail.com', N'9889512954', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (958, N'USER0957', N'VYSHAK RAJ M P', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'frman83@yahoo.com', N'9889512955', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (959, N'USER0958', N'DEEPADAS S', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'aazadh.hdayt@hotmail.com', N'9889512956', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (960, N'USER0959', N'JIMNA C', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'grdaafryd_lahwty@yahoo.com', N'9889512957', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (961, N'USER0960', N'DIVYAMOL MATHEW', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'twrj_mayn@hotmail.com', N'9889512958', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (962, N'USER0961', N'BETSY GEORGE', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'mhrwz_aashwry@gmail.com', N'9889512959', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (963, N'USER0962', N'ANJANA R', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'jhannaz.msbah8@hotmail.com', N'9889512960', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (964, N'USER0963', N'SUNU.J.B', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'kyawsh_fwladwnd@gmail.com', N'9889512961', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (965, N'USER0964', N'CHINU ALEX', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'nylwfr_mlayry19@gmail.com', N'9889512962', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (966, N'USER0965', N'NEENU SUSAN JOHN', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'hwrzad_mqdm@gmail.com', N'9889512963', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (967, N'USER0966', N'RESHMA SUNNY ABRAHAM', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'hwr60@hotmail.com', N'9889512964', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (968, N'USER0967', N'SANTHARAM. S', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'mhyn30@yahoo.com', N'9889512965', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (969, N'USER0968', N'PRAVEEN P R', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'frydwn_alyzmany46@hotmail.com', N'9889512966', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (970, N'USER0969', N'SUZEN SAJU KALLUNGAL', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'frnwd.qmyshy2@yahoo.com', N'9889512967', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (971, N'USER0970', N'REMYA RAJU', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'aatwsa_maarf50@hotmail.com', N'9889512968', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (972, N'USER0971', N'S.B.HARILAL', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'glbar_abdalmlky@gmail.com', N'9889512969', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (973, N'USER0972', N'RIYA ELZA KOSHY', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'dlshad.mthry@yahoo.com', N'9889512970', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (974, N'USER0973', N'RESHMI.V.K', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'mhnaz87@yahoo.com', N'9889512971', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (975, N'USER0974', N'NEETHU SIMON', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'yadgar29@gmail.com', N'9889512972', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (976, N'USER0975', N'NAYANU.KV', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'arzhn_wathqy17@hotmail.com', N'9889512973', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (977, N'USER0976', N'SHARLET JOSEPH', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'prnya_qhrman37@yahoo.com', N'9889512974', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (978, N'USER0977', N'ANANDU J', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'kykawws.nqybzadh19@yahoo.com', N'9889512975', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (979, N'USER0978', N'MINTU VARGHESE', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'nazfr6@yahoo.com', N'9889512976', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (980, N'USER0979', N'R.MANIKANDAN', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'aabandkht_kamly@hotmail.com', N'9889512977', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (981, N'USER0980', N'KEWIN GEORGEY MAYHEWS', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'sayna.mfth24@yahoo.com', N'9889512978', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (982, N'USER0981', N'SHILPA V PURUSHOTHAMAN', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'mhrafryn_aqyly@gmail.com', N'9889512979', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (983, N'USER0982', N'PREETHA. A', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'glshn_qhstany84@gmail.com', N'9889512980', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (984, N'USER0983', N'KRISHNAPRASAD.N', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'ard_msha46@hotmail.com', N'9889512981', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (985, N'USER0984', N'A.SUNDARAM A', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'twrj.msahb54@hotmail.com', N'9889512982', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (986, N'USER0985', N'SALIN MATHEW', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'nstrn3@gmail.com', N'9889512983', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (987, N'USER0986', N'TIJI.P.THOMAS', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'jaban14@hotmail.com', N'9889512984', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (988, N'USER0987', N'TIJO.P.MATHEWS', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'rwbyna_mradkhany@hotmail.com', N'9889512985', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (989, N'USER0988', N'DEEPA D', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'dlrba88@gmail.com', N'9889512986', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (990, N'USER0989', N'PARVATHY.S', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'glbrg_myzbany@gmail.com', N'9889512987', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (991, N'USER0990', N'PARVATHY.S', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'dwrshasb66@yahoo.com', N'9889512988', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (992, N'USER0991', N'REKHA H', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'chalak.asar@gmail.com', N'9889512989', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (993, N'USER0992', N'GEONA ANTONY', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'ktaywn_hashmyan67@gmail.com', N'9889512990', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (994, N'USER0993', N'ANITA CANCIUS', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'mhsyma_nqybzadh71@hotmail.com', N'9889512991', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (995, N'USER0994', N'JYOTSNA JOSE', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'mhtab_qhrman97@yahoo.com', N'9889512992', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (996, N'USER0995', N'ANU BABU', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'glrng_maarf@yahoo.com', N'9889512993', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (997, N'USER0996', N'ANEENA SUSAN THOMAS', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'frzyn52@hotmail.com', N'9889512994', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (998, N'USER0997', N'FASEELA TP', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'nadr96@yahoo.com', N'9889512995', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (999, N'USER0998', N'VINITHA JAMES', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'sarng_nylwfry22@hotmail.com', N'9889512996', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1000, N'USER0999', N'SARATH S P', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'makan68@yahoo.com', N'9889512997', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1001, N'USER01000', N'JINCY.J.HENDRY', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'nazy64@yahoo.com', N'9889512998', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1002, N'USER01001', N'CHIPPY MATHEW', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'ramsh.mrtdhwy45@yahoo.com', N'9889512999', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1003, N'USER01002', N'LEKSHMI PRIYA', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'bichthao39@yahoo.com', N'9889513000', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1004, N'USER01003', N'PREMJITH', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'ngoccam.dinh46@gmail.com', N'9889513001', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1005, N'USER01004', N'MANU V KURUP', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'caonghiep25@gmail.com', N'9889513002', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1006, N'USER01005', N'ANZEL JAMAL', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'binhquan88@hotmail.com', N'9889513003', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1007, N'USER01006', N'NIZA JIBSSA MEHABOOB', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'quochoang19@hotmail.com', N'9889513004', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1008, N'USER01007', N'PALLAVI MENON', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'minhphuong.mai@hotmail.com', N'9889513005', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1009, N'USER01008', N'BINI.P', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'caoky_lam@gmail.com', N'9889513006', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1010, N'USER01009', N'ANU.S.NAIR', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'duyenmy_to64@yahoo.com', N'9889513007', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1011, N'USER01010', N'AKHIL VIJAY', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'vietthang_pham@yahoo.com', N'9889513008', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1012, N'USER01011', N'TRISHA JOSE', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'thixuan43@yahoo.com', N'9889513009', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1013, N'USER01012', N'TEENA SUSAN RAJU', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'thachson_hoang@gmail.com', N'9889513010', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1014, N'USER01013', N'SREEJA T.J', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'mailien47@hotmail.com', N'9889513011', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1015, N'USER01014', N'SHIMA V SABU', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'phuonghanh.dinh@yahoo.com', N'9889513012', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1016, N'USER01015', N'KAMALA GOPIKRISHNAN', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'anhthu_to@gmail.com', N'9889513013', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1017, N'USER01016', N'GAYATHRI.C.G', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'anhdung29@hotmail.com', N'9889513014', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1018, N'USER01017', N'SELU ROY', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'bachtra_vu33@yahoo.com', N'9889513015', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1019, N'USER01018', N'TONY THOMAS', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'truongan_ly@yahoo.com', N'9889513016', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1020, N'USER01019', N'DEEPTHI JOSE', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'kimhuong2@yahoo.com', N'9889513017', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1021, N'USER01020', N'SAVIN MAMMEN KOSHY', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'thienluong.dinh@hotmail.com', N'9889513018', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1022, N'USER01021', N'ASWATHY P', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'quynhgiao_lam22@yahoo.com', N'9889513019', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1023, N'USER01022', N'SUBIN GEORGE THOMAS', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'minhthu_phan56@gmail.com', N'9889513020', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1024, N'USER01023', N'MANOJ NARAYAN G', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'camvan11@gmail.com', N'9889513021', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1025, N'USER01024', N'JITHIN RAJ R', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'tuquynh.ha@yahoo.com', N'9889513022', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1026, N'USER01025', N'DONA SABU', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'phuongdung15@hotmail.com', N'9889513023', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1027, N'USER01026', N'ANJU MALATHY', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'yenhong60@gmail.com', N'9889513024', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1028, N'USER01027', N'MELVIN M JOHNY', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'hoabinh_do6@gmail.com', N'9889513025', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1029, N'USER01028', N'PREETHY THOMAS', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'baokhanh.phan16@yahoo.com', N'9889513026', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1030, N'USER01029', N'VIVEK N', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'tuyetloan.ha93@hotmail.com', N'9889513027', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1031, N'USER01030', N'TINTU SUSAN GEORGE', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'nguyengiang.dang38@gmail.com', N'9889513028', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1032, N'USER01031', N'SREEKANTH T N', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'diemtrinh.tran@yahoo.com', N'9889513029', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1033, N'USER01032', N'SHEEJA ANNA THOMAS', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'dinhquang34@gmail.com', N'9889513030', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1034, N'USER01033', N'JESTINA K. KURUVILA', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'bachnhan.dao@hotmail.com', N'9889513031', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1035, N'USER01034', N'JENCY VARGHESE', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'dalam.vuong@yahoo.com', N'9889513032', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1036, N'USER01035', N'DIVYA.J', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'hungson9@hotmail.com', N'9889513033', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1037, N'USER01036', N'DELPHINE NIMMY', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'duyenhong13@hotmail.com', N'9889513034', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1038, N'USER01037', N'ANGEL MOHAN', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'thaonhi18@yahoo.com', N'9889513035', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1039, N'USER01038', N'PRIYA ANN JOSEPH', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'dangkhoa54@yahoo.com', N'9889513036', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1040, N'USER01039', N'SUBIN GEORGE THOMAS', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'huyenthu.ngo90@hotmail.com', N'9889513037', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1041, N'USER01040', N'ANN STEFFI RODRIGUES', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'quangsang_dinh@hotmail.com', N'9889513038', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1042, N'USER01041', N'ANU CHACKOCHAN', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'binhminh86@gmail.com', N'9889513039', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1043, N'USER01042', N'JOLLY VARGHESE', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'yenthao.tang@gmail.com', N'9889513040', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1044, N'USER01043', N'TIJO K GEORGE', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'giaduc54@gmail.com', N'9889513041', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1045, N'USER01044', N'SHONA JOY', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'ngoctuan_phung@gmail.com', N'9889513042', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1046, N'USER01045', N'SHEENA MATHEW', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'nhanvan.to@gmail.com', N'9889513043', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1047, N'USER01046', N'NEETHU.K.J', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'vietkhai33@yahoo.com', N'9889513044', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1048, N'USER01047', N'ANITHA BABY', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'thucdoan98@hotmail.com', N'9889513045', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1049, N'USER01048', N'PREMKUMAR.C', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'bichngan83@yahoo.com', N'9889513046', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1050, N'USER01049', N'PRINCY PAPPACHAN', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'quynhtram62@yahoo.com', N'9889513047', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1051, N'USER01050', N'JEENA JOHN', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'thanhhai.tang@gmail.com', N'9889513048', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1052, N'USER01051', N'JEENA RAJU', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'huutrung.ly93@gmail.com', N'9889513049', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1053, N'USER01052', N'SALINI SUDHAKARAN', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'thanhloan_pham@gmail.com', N'9889513050', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1054, N'USER01053', N'E.EVANGELIN PRABHA', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'hamy38@yahoo.com', N'9889513051', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1055, N'USER01054', N'NANDAKUMAR.N.PAI', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'bichhien.nguyen75@gmail.com', N'9889513052', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1056, N'USER01055', N'PRIJIN GEORGE KOSHY', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'nhuy.pham@hotmail.com', N'9889513053', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1057, N'USER01056', N'SIBIN BABU', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'haithuy96@yahoo.com', N'9889513054', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1058, N'USER01057', N'RESMI.S.NAIR', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'dinhkim_trinh5@yahoo.com', N'9889513055', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1059, N'USER01058', N'TINU ABRAHAM VARGHESE', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'lacphuc68@yahoo.com', N'9889513056', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1060, N'USER01059', N'NISHA ELIZABETH THOMAS', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'phuongque_dinh51@yahoo.com', N'9889513057', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1061, N'USER01060', N'SHYAMA A B', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'thinhcuong15@gmail.com', N'9889513058', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1062, N'USER01061', N'JOSEPH GEORGE C', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'thanhkien.doan@gmail.com', N'9889513059', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1063, N'USER01062', N'NIKHIL A.R', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'lannhi.duong36@hotmail.com', N'9889513060', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1064, N'USER01063', N'SUBIN V.S', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'thanhvy_vuong66@gmail.com', N'9889513061', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1065, N'USER01064', N'ASHAMOL L.S', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'minhtam22@yahoo.com', N'9889513062', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1066, N'USER01065', N'BRINDLY.B.SUJITH', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'thuyminh.nguyen@gmail.com', N'9889513063', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1067, N'USER01066', N'PINKY.M.R', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'kimthong72@gmail.com', N'9889513064', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1068, N'USER01067', N'JAYAKRISHNAN S', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'truclan89@yahoo.com', N'9889513065', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1069, N'USER01068', N'ANJU V NAIR', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'thixuan_truong@yahoo.com', N'9889513066', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1070, N'USER01069', N'SAJIN VIJAYAN HARDLY', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'nghiahoa76@yahoo.com', N'9889513067', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1071, N'USER01070', N'LEKSHMI.S', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'baothai_trinh@gmail.com', N'9889513068', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1072, N'USER01071', N'VISHNUPRASAD.S.WARRIER', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'giahuan_phung@hotmail.com', N'9889513069', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1073, N'USER01072', N'KULEEN K', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'uyennha_phung@yahoo.com', N'9889513070', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1074, N'USER01073', N'SUBHASH GEORGE THOMAS', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'thaivan_dinh@gmail.com', N'9889513071', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1075, N'USER01074', N'MANOJ P JOHN', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'hoangthu_bui99@hotmail.com', N'9889513072', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1076, N'USER01075', N'SALMAN AHMED BASHEER', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'danthanh61@yahoo.com', N'9889513073', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1077, N'USER01076', N'PRAVEEN .K.P', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'legiang_doan@gmail.com', N'9889513074', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1078, N'USER01077', N'DEEPAK M.L', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'huubao84@hotmail.com', N'9889513075', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1079, N'USER01078', N'REKHA RAJ', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'myle90@gmail.com', N'9889513076', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1080, N'USER01079', N'ABDUL KADER . A', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'quocquy.mai@yahoo.com', N'9889513077', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1081, N'USER01080', N'ABIN EMMANUEL', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'kimson_hoang99@yahoo.com', N'9889513078', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1082, N'USER01081', N'ANUROOP KUMAR S', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'ductoan73@hotmail.com', N'9889513079', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1083, N'USER01082', N'LIDIYA JACOB', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'quelam.le@hotmail.com', N'9889513080', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1084, N'USER01083', N'ALWIN AUGUSTIN', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'khanhmai.mai66@gmail.com', N'9889513081', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1085, N'USER01084', N'SONY SEBASTIAN K', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'vietson7@yahoo.com', N'9889513082', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1086, N'USER01085', N'VIJESHA P.G.', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'huubinh41@gmail.com', N'9889513083', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1087, N'USER01086', N'NEETHU ROSILINE', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'dongtra27@hotmail.com', N'9889513084', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1088, N'USER01087', N'DEEPTHA MARY THOMAS', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'viettrinh.ho@gmail.com', N'9889513085', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1089, N'USER01088', N'KARTHIKA PRAKASH', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'hoaiphong.vu@gmail.com', N'9889513086', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1090, N'USER01089', N'DEEPIKANATH.G.R', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'manhthien_nguyen@gmail.com', N'9889513087', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1091, N'USER01090', N'JEENA JAIN THOMAS', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'tusuong3@hotmail.com', N'9889513088', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1092, N'USER01091', N'LISA.S', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'minhthuy.duong35@yahoo.com', N'9889513089', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1093, N'USER01092', N'NIHAD S', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'phuchoa1@yahoo.com', N'9889513090', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1094, N'USER01093', N'BINITHA V G', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'hoangngon.hoang@gmail.com', N'9889513091', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1095, N'USER01094', N'K P PRADEEP', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'vinhlong_tang@gmail.com', N'9889513092', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1096, N'USER01095', N'HARISH A V', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'tungquang_dinh@hotmail.com', N'9889513093', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1097, N'USER01096', N'JITHIN SEBASTIAN', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'tuyettram66@gmail.com', N'9889513094', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1098, N'USER01097', N'Sangeetha.S', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'honglinh.vuong@hotmail.com', N'9889513095', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1099, N'USER01098', N'Harish.A.V', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'huykhiem_hoang@hotmail.com', N'9889513096', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1100, N'USER01099', N'Vipin Das', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'daclo65@yahoo.com', N'9889513097', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1101, N'USER01100', N'Vijeesha.P.G', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'lamkhe30@gmail.com', N'9889513098', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1102, N'USER01101', N'Mithun.C.Mohan', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'sonduong_ngo56@hotmail.com', N'9889513099', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1103, N'USER01102', N'Rakhi Leyan', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'thienan13@yahoo.com', N'9889513100', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1104, N'USER01103', N'Tina Susan Jose', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'huyenthoai11@yahoo.com', N'9889513101', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1105, N'USER01104', N'Sujithmon.P.P', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'nguyenvan_tang53@gmail.com', N'9889513102', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1106, N'USER01105', N'Sujith.T.V', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'hiephoa_phan@hotmail.com', N'9889513103', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1107, N'USER01106', N'Aabid.A.Salam', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'tuanhoang52@yahoo.com', N'9889513104', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1108, N'USER01107', N'Anjith.M.G', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'hieuhoc82@gmail.com', N'9889513105', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1109, N'USER01108', N'Shama.K.M', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'chidung.ly56@gmail.com', N'9889513106', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1110, N'USER01109', N'Mithun Kurup', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'phinhan_lam@hotmail.com', N'9889513107', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1111, N'USER01110', N'Flince Mathew', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'hongkhoi36@gmail.com', N'9889513108', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1112, N'USER01111', N'Joffin Mathew', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'ngoctien67@gmail.com', N'9889513109', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1113, N'USER01112', N'Divya.S.Sathyan', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'vanphi.phung@hotmail.com', N'9889513110', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1114, N'USER01113', N'Dijil raj.T', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'nhatbaolong_tran@hotmail.com', N'9889513111', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1115, N'USER01114', N'Varun.K.V', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'bichngoc31@yahoo.com', N'9889513112', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1116, N'USER01115', N'Biby Jose', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'ducgiang81@gmail.com', N'9889513113', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1117, N'USER01116', N'Lijitha.R', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'thuymien_do49@gmail.com', N'9889513114', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1118, N'USER01117', N'Nivya Rose Vincent', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'thientrang49@hotmail.com', N'9889513115', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1119, N'USER01118', N'Anju.S.Pillai', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'thuytrinh_dang@gmail.com', N'9889513116', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1120, N'USER01119', N'Sanjith Jacob Thomas', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'tinhnhu_do@gmail.com', N'9889513117', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1121, N'USER01120', N'Tintu Joseph', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'phucthinh_phung88@gmail.com', N'9889513118', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1122, N'USER01121', N'Joji Issac.P', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'anhphuong50@gmail.com', N'9889513119', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1123, N'USER01122', N'Minu Mereena Cherian', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'thachthao.do71@hotmail.com', N'9889513120', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1124, N'USER01123', N'Renil Raphy', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'quangtrong.ha37@gmail.com', N'9889513121', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1125, N'USER01124', N'Shameer.M.S', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'bachtra_trinh@yahoo.com', N'9889513122', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1126, N'USER01125', N'Saaju Alex', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'minhkhang_mai@yahoo.com', N'9889513123', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1127, N'USER01126', N'Sherine James', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'thienphuong36@gmail.com', N'9889513124', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1128, N'USER01127', N'Veena Sanjeev', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'ngoccam.dao@hotmail.com', N'9889513125', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1129, N'USER01128', N'Sheethal Abraham', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'dinhnguyen.ho@yahoo.com', N'9889513126', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1130, N'USER01129', N'Greehma.M.J', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'mongvy33@gmail.com', N'9889513127', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1131, N'USER01130', N'Lakshmi.k.S', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'ducquang.dang@gmail.com', N'9889513128', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1132, N'USER01131', N'Abin Mathew', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'xuantuong.phung@yahoo.com', N'9889513129', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1133, N'USER01132', N'Jaseem Hafiz.M', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'hieunghia.tran25@hotmail.com', N'9889513130', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1134, N'USER01133', N'Riya George', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'minhhien73@hotmail.com', N'9889513131', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1135, N'USER01134', N'Deepthi.S.Dev', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'manhtruong.mai@gmail.com', N'9889513132', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1136, N'USER01135', N'Sandeep Soman', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'tamdoan_mai41@gmail.com', N'9889513133', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1137, N'USER01136', N'Ajosh Varghese Thomas', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'thuygiang.ho64@gmail.com', N'9889513134', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1138, N'USER01137', N'Merin Joseph', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'lamphuong_bui63@yahoo.com', N'9889513135', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1139, N'USER01138', N'Renjith.K.C', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'thuylien.ha@hotmail.com', N'9889513136', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1140, N'USER01139', N'Ajith Jacob', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'bathanh_duong@yahoo.com', N'9889513137', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1141, N'USER01140', N'Sherly Paul', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'xuanhan20@yahoo.com', N'9889513138', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1142, N'USER01141', N'Vipin.S.Pillai', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'huutoan_lam@hotmail.com', N'9889513139', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1143, N'USER01142', N'Subramania Nehru.C', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'kimtrang84@gmail.com', N'9889513140', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1144, N'USER01143', N'Chitra Panicker.R', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'thanhhuy_tran8@gmail.com', N'9889513141', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1145, N'USER01144', N'Parvathy.R', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'chidung.hoang@hotmail.com', N'9889513142', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1146, N'USER01145', N'Chinnu.C.George', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'xuanhieu26@yahoo.com', N'9889513143', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1147, N'USER01146', N'Libitha Elizabeth Kurien', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'nguyetanh64@gmail.com', N'9889513144', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1148, N'USER01147', N'Arif.M.K', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'dinhien.duong22@yahoo.com', N'9889513145', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1149, N'USER01148', N'Rahul.S', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'thicam_hoang86@yahoo.com', N'9889513146', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1150, N'USER01149', N'Anna Jose Morris', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'yenthanh.phan58@gmail.com', N'9889513147', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1151, N'USER01150', N'Sreekumar.N.P', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'ngoccam3@yahoo.com', N'9889513148', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1152, N'USER01151', N'Remya Sebastian', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'thanhhanh32@yahoo.com', N'9889513149', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1153, N'USER01152', N'Shiby.P.Mathew', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'minhman52@hotmail.com', N'9889513150', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1154, N'USER01153', N'Nithin Terry Gomez', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'truongsa69@yahoo.com', N'9889513151', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1155, N'USER01154', N'Jithu Zacharia', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'thaichi_phung77@hotmail.com', N'9889513152', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1156, N'USER01155', N'Rahul Kiran.R.S', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'phucle8@yahoo.com', N'9889513153', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1157, N'USER01156', N'Priyanka.R', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'bichhao_tang56@gmail.com', N'9889513154', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1158, N'USER01157', N'Suvarna raj.S.R', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'hanganh41@gmail.com', N'9889513155', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1159, N'USER01158', N'Nijil.M.K', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'dankhanh.duong@yahoo.com', N'9889513156', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1160, N'USER01159', N'Aravind.V', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'nhahong_phan@yahoo.com', N'9889513157', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1161, N'USER01160', N'Haripriya.S', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'nhatmai91@yahoo.com', N'9889513158', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1162, N'USER01161', N'Prathibha Nelsaon', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'khacviet_phan38@hotmail.com', N'9889513159', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1163, N'USER01162', N'Josey Thomas jacob', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'diemmy_bui26@gmail.com', N'9889513160', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1164, N'USER01163', N'Praveen Jose', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'vietphong60@hotmail.com', N'9889513161', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1165, N'USER01164', N'Lija Annie Yohan', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'nhuhoa33@hotmail.com', N'9889513162', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1166, N'USER01165', N'Ansal.D.A', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'tuylinh96@hotmail.com', N'9889513163', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1167, N'USER01166', N'Emilie.K.Jose', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'mongthu.doan@yahoo.com', N'9889513164', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1168, N'USER01167', N'Ajith abraham', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'minhtoan_do@gmail.com', N'9889513165', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1169, N'USER01168', N'Sethu.V', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'hongdao.phan48@yahoo.com', N'9889513166', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1170, N'USER01169', N'Jineesh Joseph', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'khacanh_trinh@gmail.com', N'9889513167', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1171, N'USER01170', N'Arun Sasikumar', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'tutam85@yahoo.com', N'9889513168', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1172, N'USER01171', N'Ramprasad.G.N', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'caotien.bui@yahoo.com', N'9889513169', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1173, N'USER01172', N'Akhila.B', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'huyquang_truong@hotmail.com', N'9889513170', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1174, N'USER01173', N'Sharath Kumar.K', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'trungviet63@yahoo.com', N'9889513171', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1175, N'USER01174', N'Kiran.V.S', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'dongnghi20@yahoo.com', N'9889513172', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1176, N'USER01175', N'Sunu Treesa Sebastian', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'hieuminh.ngo20@hotmail.com', N'9889513173', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1177, N'USER01176', N'Anu.S.Nath', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'diemtrinh_tang44@gmail.com', N'9889513174', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1178, N'USER01177', N'Nicy Varghese', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'dinhnguyen.ly71@hotmail.com', N'9889513175', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1179, N'USER01178', N'Sandhya Gopinath.M', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'ngochue22@hotmail.com', N'9889513176', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1180, N'USER01179', N'Vineeth Vinod.M.K', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'mydung_tang@yahoo.com', N'9889513177', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1181, N'USER01180', N'Jithin.M', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'minhthu_truong14@hotmail.com', N'9889513178', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1182, N'USER01181', N'ATHUL.C.Tathul.C.T', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'ngoctho.pham25@yahoo.com', N'9889513179', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1183, N'USER01182', N'Eima Elsa Raju', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'tanbinh.pham64@hotmail.com', N'9889513180', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1184, N'USER01183', N'Sayooj.P.Unni', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'dieunga.lam@gmail.com', N'9889513181', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1185, N'USER01184', N'Anna Kurian', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'minhly.mai16@hotmail.com', N'9889513182', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1186, N'USER01185', N'Neetha.P.John', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'thaoly_le@gmail.com', N'9889513183', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1187, N'USER01186', N'Anil Mathew', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'quanghai.bui83@yahoo.com', N'9889513184', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1188, N'USER01187', N'Sujina Sundar', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'thequyen.dang@hotmail.com', N'9889513185', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1189, N'USER01188', N'Ajay Mohan.K', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'binhdinh47@gmail.com', N'9889513186', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1190, N'USER01189', N'Christeena jose', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'thanhyen54@hotmail.com', N'9889513187', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1191, N'USER01190', N'Babysree Cyraic', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'kieunuong17@gmail.com', N'9889513188', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1192, N'USER01191', N'Sherin Joseph', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'dalan_to@yahoo.com', N'9889513189', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1193, N'USER01192', N'R.Aiswarya', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'dahuong_ha@gmail.com', N'9889513190', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1194, N'USER01193', N'Joice Thomas', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'hamy.doan92@gmail.com', N'9889513191', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1195, N'USER01194', N'Nisha Calistras', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'thanhloi.phung@hotmail.com', N'9889513192', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1196, N'USER01195', N'Remya.R.U', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'chieuminh.ho@gmail.com', N'9889513193', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1197, N'USER01196', N'Libin Rajan', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'thanhgiang_do@gmail.com', N'9889513194', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1198, N'USER01197', N'Vishnu Duttan.S', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'quyetthang_tang@gmail.com', N'9889513195', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1199, N'USER01198', N'Shinoj.P.V', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'baoquynh_ha@gmail.com', N'9889513196', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1200, N'USER01199', N'Sooraj.S', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'dieuhuyen_le@yahoo.com', N'9889513197', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1201, N'USER01200', N'Pradeep.T.H', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'minhan_trinh92@gmail.com', N'9889513198', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1202, N'USER01201', N'Kavitha Jayachandran', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'dinhthang.phung@hotmail.com', N'9889513199', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1203, N'USER01202', N'Rakalekshmy Muralillal', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'tuyetnhi.phan65@yahoo.com', N'9889513200', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1204, N'USER01203', N'Arunkumar.R', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'thatdung_trinh84@hotmail.com', N'9889513201', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1205, N'USER01204', N'Ragesh.G.K', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'phihai.doan@yahoo.com', N'9889513202', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1206, N'USER01205', N'Revathy.E.Divakaran', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'hamduyen_do47@yahoo.com', N'9889513203', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1207, N'USER01206', N'Neethu.M', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'khanhgiang_vu@gmail.com', N'9889513204', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1208, N'USER01207', N'Priyanka.A', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'quechi48@hotmail.com', N'9889513205', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1209, N'USER01208', N'Sarath.K.U', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'hoaiphong.ngo@hotmail.com', N'9889513206', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1210, N'USER01209', N'Harish Kumar.D', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'kietvo.vu@hotmail.com', N'9889513207', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1211, N'USER01210', N'Perasanth.P', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'kieuthu_phan76@gmail.com', N'9889513208', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1212, N'USER01211', N'Aravind Melathil', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'kimchi_to@yahoo.com', N'9889513209', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1213, N'USER01212', N'Minu.S', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'baophap.hoang12@yahoo.com', N'9889513210', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1214, N'USER01213', N'Vineeth Velayudhankutty', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'phuonglong.phan8@hotmail.com', N'9889513211', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1215, N'USER01214', N'Vivek Chandran.P', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'hamy.trinh@yahoo.com', N'9889513212', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1216, N'USER01215', N'Armin John', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'toloan83@yahoo.com', N'9889513213', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1217, N'USER01216', N'Ragesh.R', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'truonglong55@hotmail.com', N'9889513214', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1218, N'USER01217', N'Joffin Anto', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'congan55@yahoo.com', N'9889513215', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1219, N'USER01218', N'Vaisakh Venu', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'khacminh_dang@hotmail.com', N'9889513216', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1220, N'USER01219', N'Jithin.R.Gireesan', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'trongchinh_duong@yahoo.com', N'9889513217', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1221, N'USER01220', N'Siddique.P', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'nhattien_dinh25@yahoo.com', N'9889513218', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1222, N'USER01221', N'Arun Kumar.U', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'vietkhoi32@hotmail.com', N'9889513219', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1223, N'USER01222', N'Anoop.A', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'vienphuong81@yahoo.com', N'9889513220', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1224, N'USER01223', N'Ramu.V.Ramanan', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'lamnhi_lam@yahoo.com', N'9889513221', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1225, N'USER01224', N'S.Santhosh Kumar', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'truclam.vu89@yahoo.com', N'9889513222', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1226, N'USER01225', N'Vineeth.V.Gopal', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'duybao.lam@yahoo.com', N'9889513223', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1227, N'USER01226', N'Julesh.C', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'ngoctuan.ha51@hotmail.com', N'9889513224', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1228, N'USER01227', N'Jabir.K', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'baoquyen.ha@hotmail.com', N'9889513225', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1229, N'USER01228', N'Soumya.B', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'ngockhang.do@gmail.com', N'9889513226', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1230, N'USER01229', N'Premjith.G', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'lienhuong40@yahoo.com', N'9889513227', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1231, N'USER01230', N'Shyni.T.P', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'khanhhuyen97@hotmail.com', N'9889513228', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1232, N'USER01231', N'Susha.Y.Chacko', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'phuongtrang27@yahoo.com', N'9889513229', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1233, N'USER01232', N'Subitha Lakshmi.S', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'xuanlam80@yahoo.com', N'9889513230', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1234, N'USER01233', N'Supriya.R', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'quangtu_ha8@yahoo.com', N'9889513231', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1235, N'USER01234', N'Vishnu Vijayan', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'thanhdao.vu95@yahoo.com', N'9889513232', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1236, N'USER01235', N'Sinin.R.Ahamed', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'vuonggia.vuong93@yahoo.com', N'9889513233', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1237, N'USER01236', N'Raj Mohan.M.V', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'thienlan68@hotmail.com', N'9889513234', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1238, N'USER01237', N'Mahesh.R', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'anhdao4@hotmail.com', N'9889513235', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1239, N'USER01238', N'Shambu.J', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'nhuquynh_trinh69@yahoo.com', N'9889513236', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1240, N'USER01239', N'Gireesh Kumar.S', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'huychieu_ha71@yahoo.com', N'9889513237', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1241, N'USER01240', N'Afnitha.M.K', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'lamtruong51@yahoo.com', N'9889513238', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1242, N'USER01241', N'Anil Thankappan', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'hongphuc_bui14@yahoo.com', N'9889513239', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1243, N'USER01242', N'Eipe John', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'hiepvu_dao1@gmail.com', N'9889513240', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1244, N'USER01243', N'Vidya Mohan', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'hongnhan0@hotmail.com', N'9889513241', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1245, N'USER01244', N'Mahendran.G', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'myhanh.dao@hotmail.com', N'9889513242', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1246, N'USER01245', N'Soumya.S', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'baochan.truong@hotmail.com', N'9889513243', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1247, N'USER01246', N'Subeesh Babu.V', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'hoaitrung65@hotmail.com', N'9889513244', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1248, N'USER01247', N'John Thomas Puthenangady', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'anhthao.vu@hotmail.com', N'9889513245', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1249, N'USER01248', N'Anitha Krishana.S', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'thucuyen72@gmail.com', N'9889513246', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1250, N'USER01249', N'Sam.K.M', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'duytan.vu@yahoo.com', N'9889513247', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1251, N'USER01250', N'Surya.B', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'huehuong_to@hotmail.com', N'9889513248', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1252, N'USER01251', N'Krishna Prasad.P.P', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'hoangkhang51@yahoo.com', N'9889513249', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1253, N'USER01252', N'Abigail Grace Baby', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'nhatnam.vuong92@yahoo.com', N'9889513250', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1254, N'USER01253', N'Remya.P', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'andi55@hotmail.com', N'9889513251', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1255, N'USER01254', N'Ranju.R.Nair', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'haithao.doan@yahoo.com', N'9889513252', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1256, N'USER01255', N'Shabina Rajan', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'xuanthien.ha84@yahoo.com', N'9889513253', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1257, N'USER01256', N'Ajith.G', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'maily.pham@hotmail.com', N'9889513254', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1258, N'USER01257', N'Anil C Ignatius', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'dinhsieu59@hotmail.com', N'9889513255', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1259, N'USER01258', N'Sajithkumar K', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'tonle_hoang@gmail.com', N'9889513256', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1260, N'USER01259', N'Sajeena.S', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'giangngoc.bui85@hotmail.com', N'9889513257', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1261, N'USER01260', N'Nitha.A.Paret', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'kimchi.tran45@gmail.com', N'9889513258', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1262, N'USER01261', N'Asok Ramachandran', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'lamtuong64@yahoo.com', N'9889513259', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1263, N'USER01262', N'Bilna.P', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'khatu.vuong@hotmail.com', N'9889513260', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1264, N'USER01263', N'Swapna Rajan', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'xuanlinh.vuong@yahoo.com', N'9889513261', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1265, N'USER01264', N'Sarath Sasidharan', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'ducgiang.do@yahoo.com', N'9889513262', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1266, N'USER01265', N'Anasuya.K', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'hongthuy_phan@gmail.com', N'9889513263', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1267, N'USER01266', N'Sreeja Divakaran', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'haimy_pham88@hotmail.com', N'9889513264', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1268, N'USER01267', N'Nishitha.U', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'giakiet.to@gmail.com', N'9889513265', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1269, N'USER01268', N'Jayakrishna. J', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'quocphong1@gmail.com', N'9889513266', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1270, N'USER01269', N'Pibin.A.P', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'bacuong.ly10@gmail.com', N'9889513267', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1271, N'USER01270', N'Sujith.M', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'chanhviet76@yahoo.com', N'9889513268', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1272, N'USER01271', N'Christy Mary Mathew', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'lamdung_ho@gmail.com', N'9889513269', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1273, N'USER01272', N'Leo Elias', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'conghieu.vu75@gmail.com', N'9889513270', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1274, N'USER01273', N'Ashiq Azeez', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'phuthinh_duong@yahoo.com', N'9889513271', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1275, N'USER01274', N'Shinu.M.S', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'minhchau_phung5@hotmail.com', N'9889513272', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1276, N'USER01275', N'Sreejith Gopalakrishnan', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'nhatanh_lam@gmail.com', N'9889513273', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1277, N'USER01276', N'Anoop Sreekumar', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'linhphuong45@hotmail.com', N'9889513274', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1278, N'USER01277', N'Milton Jose.M', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'baohue.dang47@gmail.com', N'9889513275', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1279, N'USER01278', N'Divya Mary Tharacheril', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'thuctam.phan25@yahoo.com', N'9889513276', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1280, N'USER01279', N'Jayadevan.J', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'sydan.doan@hotmail.com', N'9889513277', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1281, N'USER01280', N'Liju.G', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'kiencuong.vuong@yahoo.com', N'9889513278', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1282, N'USER01281', N'Prasanth Nair K', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'phongdinh65@gmail.com', N'9889513279', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1283, N'USER01282', N'Joewin Vallikad Joey', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'minhkhai_mai@yahoo.com', N'9889513280', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1284, N'USER01283', N'Leena Mary Joseph', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'ngoctu.doan5@gmail.com', N'9889513281', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1285, N'USER01284', N'Athulya. A', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'hatien71@gmail.com', N'9889513282', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1286, N'USER01285', N'Nisha Divakaran', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'thyvan.dinh@gmail.com', N'9889513283', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1287, N'USER01286', N'Anish Sahadevan', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'huylinh27@hotmail.com', N'9889513284', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1288, N'USER01287', N'Shemi.M.K', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'maihien.to30@gmail.com', N'9889513285', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1289, N'USER01288', N'Femymol Francis', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'bichtram.le@gmail.com', N'9889513286', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1290, N'USER01289', N'Maneeshkar.G', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'sonlam_pham65@yahoo.com', N'9889513287', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1291, N'USER01290', N'Arun Vijay', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'antuong_dang@hotmail.com', N'9889513288', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1292, N'USER01291', N'Sajid.K.P', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'baolam.pham@gmail.com', N'9889513289', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1293, N'USER01292', N'Rejoy.N.K', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'ngocdiep.pham@yahoo.com', N'9889513290', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1294, N'USER01293', N'Arun.A', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'thangloi.lam@yahoo.com', N'9889513291', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1295, N'USER01294', N'Sarin Babu.S.S', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'phuongphi0@hotmail.com', N'9889513292', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1296, N'USER01295', N'Sangeetha.K', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'uyenthy18@hotmail.com', N'9889513293', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1297, N'USER01296', N'Babitha.A.V', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'nhunga.pham9@yahoo.com', N'9889513294', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1298, N'USER01297', N'Sandhya.D', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'phucle_mai@gmail.com', N'9889513295', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1299, N'USER01298', N'Shiby Susan Varkey', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'thienduc.ngo@gmail.com', N'9889513296', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1300, N'USER01299', N'Amal.R.S', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'ngocuyen.vuong@yahoo.com', N'9889513297', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1301, N'USER01300', N'Pratheesh Rajan', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'ngocuyen_phan30@hotmail.com', N'9889513298', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1302, N'USER01301', N'Nijan.B', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'myphuong_vuong@yahoo.com', N'9889513299', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1303, N'USER01302', N'Ancy Sherin Jose', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'vietthi41@yahoo.com', N'9889513300', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1304, N'USER01303', N'Deepthy Rao.R', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'quocquan.ha@yahoo.com', N'9889513301', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1305, N'USER01304', N'Pius George.C.G', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'thusuong14@yahoo.com', N'9889513302', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1306, N'USER01305', N'Abhilash.S.V', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'dinhluc.ho88@hotmail.com', N'9889513303', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1307, N'USER01306', N'J.Jaspier Prince Kumar', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'thuylien.phung93@hotmail.com', N'9889513304', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1308, N'USER01307', N'Manu Murali', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'mongnguyet8@yahoo.com', N'9889513305', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1309, N'USER01308', N'Perumal.M', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'hoaitin_ho12@hotmail.com', N'9889513306', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1310, N'USER01309', N'Bright John Mathew', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'dinhhuong_phung70@gmail.com', N'9889513307', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1311, N'USER01310', N'Navaneeth.S', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'minhnhat56@hotmail.com', N'9889513308', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1312, N'USER01311', N'Sangeetha.S.Menon', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'ngocngan51@gmail.com', N'9889513309', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1313, N'USER01312', N'Vijay George', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'thuyvi29@hotmail.com', N'9889513310', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1314, N'USER01313', N'Ragi.R.Unnithan', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'tuyettrinh57@gmail.com', N'9889513311', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1315, N'USER01314', N'Sharon.K.Sukumaran', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'minhchau39@hotmail.com', N'9889513312', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1316, N'USER01315', N'Sandeep.P.Nair', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'nghiminh.ly34@yahoo.com', N'9889513313', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1317, N'USER01316', N'Chandra Mouli.J', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'ngochoa_do51@gmail.com', N'9889513314', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1318, N'USER01317', N'Deepak.M', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'minhdan.doan@yahoo.com', N'9889513315', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1319, N'USER01318', N'Anitha Thomas', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'hongdiem.ho91@yahoo.com', N'9889513316', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1320, N'USER01319', N'Tintu.A.S', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'ductoan10@gmail.com', N'9889513317', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1321, N'USER01320', N'Soumya Celin Jose', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'namtu_nguyen@hotmail.com', N'9889513318', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1322, N'USER01321', N'Jose George', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'tuanchuong_duong60@gmail.com', N'9889513319', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1323, N'USER01322', N'Aroon.K.V', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'xuanthuyet_ly83@gmail.com', N'9889513320', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1324, N'USER01323', N'Lekshmi.K', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'thanhhong5@hotmail.com', N'9889513321', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1325, N'USER01324', N'Anusree.M', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'phuongthanh57@gmail.com', N'9889513322', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1326, N'USER01325', N'Ronnie Merin George', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'thuyvan.le@yahoo.com', N'9889513323', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1327, N'USER01326', N'Binu.C.F', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'tandung.trinh41@yahoo.com', N'9889513324', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1328, N'USER01327', N'Ramya.P', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'quangsang37@yahoo.com', N'9889513325', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1329, N'USER01328', N'Tiju Joseph', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'thunga15@yahoo.com', N'9889513326', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1330, N'USER01329', N'Anisha.P.A', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'ngocquyen.to84@hotmail.com', N'9889513327', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1331, N'USER01330', N'Liji.K', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'thuyoanh8@hotmail.com', N'9889513328', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1332, N'USER01331', N'Sijio.j.Nelliserry', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'xuantuong_lam2@gmail.com', N'9889513329', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1333, N'USER01332', N'Sreeranjini.G', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'vanminh.doan@yahoo.com', N'9889513330', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1334, N'USER01333', N'Deepak.R', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'minhly97@yahoo.com', N'9889513331', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1335, N'USER01334', N'M.S.Anzy', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'lienhuong_ho@hotmail.com', N'9889513332', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1336, N'USER01335', N'Sani Saira George', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'diemlien.duong@gmail.com', N'9889513333', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1337, N'USER01336', N'Biby Boniface', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'ngocvy44@yahoo.com', N'9889513334', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1338, N'USER01337', N'Arif.M.Rafi', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'kieuloan_ngo@gmail.com', N'9889513335', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1339, N'USER01338', N'Jency Cherian', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'giaokieu_lam8@yahoo.com', N'9889513336', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1340, N'USER01339', N'Sebastian.J.Manavalan', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'chinam65@yahoo.com', N'9889513337', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1341, N'USER01340', N'Sreejith S', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'nguyetque_dinh77@gmail.com', N'9889513338', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1342, N'USER01341', N'Firoz.P.K', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'songha.ngo93@gmail.com', N'9889513339', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1343, N'USER01342', N'Jomit Abraham', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'xuankien55@hotmail.com', N'9889513340', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1344, N'USER01343', N'Sherin Shan', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'diepvy.dinh@gmail.com', N'9889513341', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1345, N'USER01344', N'Saveesh Kumar K.P', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'dieunga26@yahoo.com', N'9889513342', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1346, N'USER01345', N'Midhun Sunny', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'maitrinh71@yahoo.com', N'9889513343', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1347, N'USER01346', N'Joshy. M. Raj', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'huemy10@hotmail.com', N'9889513344', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1348, N'USER01347', N'Anoop M', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'huythanh.ngo61@yahoo.com', N'9889513345', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1349, N'USER01348', N'Divya. S. Nair', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'hungson_tang@hotmail.com', N'9889513346', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1350, N'USER01349', N'Rahul Venu', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'thanhlong.ly@gmail.com', N'9889513347', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1351, N'USER01350', N'Anjana. R', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'tuyenlam23@yahoo.com', N'9889513348', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1352, N'USER01351', N'Salini Dev P. V', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'huongtien43@gmail.com', N'9889513349', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1353, N'USER01352', N'Divya. S.', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'thanhvinh_ly@hotmail.com', N'9889513350', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1354, N'USER01353', N'Simi Jose', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'dacthai.vu@yahoo.com', N'9889513351', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1355, N'USER01354', N'Shinju Isack', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'trucmai_lam@hotmail.com', N'9889513352', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1356, N'USER01355', N'T. Nithiananthi', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'hungson.tran@gmail.com', N'9889513353', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1357, N'USER01356', N'Sandeep. K. S', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'nguyetanh_do@gmail.com', N'9889513354', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1358, N'USER01357', N'Jisha.V.Anand', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'huylinh_ha87@hotmail.com', N'9889513355', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1359, N'USER01358', N'Deepa.S', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'uyphong.nguyen@yahoo.com', N'9889513356', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1360, N'USER01359', N'Anu Susan John', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'honggiang12@gmail.com', N'9889513357', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1361, N'USER01360', N'Binny Elza Mathew', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'khanhchi.mai@yahoo.com', N'9889513358', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1362, N'USER01361', N'Ayyappan. A', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'hamtho6@gmail.com', N'9889513359', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1363, N'USER01362', N'Anu N', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'quochung97@gmail.com', N'9889513360', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1364, N'USER01363', N'Mohammed Razi.M', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'giangtien.duong@yahoo.com', N'9889513361', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1365, N'USER01364', N'Durga Varma', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'haccuc_dao@hotmail.com', N'9889513362', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1366, N'USER01365', N'Joby.N.V.', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'quangtrieu.phan@gmail.com', N'9889513363', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1367, N'USER01366', N'Salna K K', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'thuyvan70@yahoo.com', N'9889513364', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1368, N'USER01367', N'Anil Prasad V.R', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'ngocquyen_ho77@gmail.com', N'9889513365', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1369, N'USER01368', N'Sreekumar.P', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'ngocuyen_ha@hotmail.com', N'9889513366', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1370, N'USER01369', N'DiveshGopinath', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'ngocmai78@gmail.com', N'9889513367', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1371, N'USER01370', N'Susi das.S', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'aithi.tang@gmail.com', N'9889513368', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1372, N'USER01371', N'K.Silpi', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'thanhdoanh_trinh@hotmail.com', N'9889513369', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1373, N'USER01372', N'Tintu Ann Cherian', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'thienminh_ho@hotmail.com', N'9889513370', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1374, N'USER01373', N'Anitha Rani', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'danhson.pham64@hotmail.com', N'9889513371', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1375, N'USER01374', N'Nisha George', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'linhchi.le93@yahoo.com', N'9889513372', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1376, N'USER01375', N'Sereen Joseph', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'hungphong_hoang94@hotmail.com', N'9889513373', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1377, N'USER01376', N'H.Kalairasu', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'kimson80@gmail.com', N'9889513374', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1378, N'USER01377', N'AnandRaj N.S', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'tuanh90@hotmail.com', N'9889513375', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1379, N'USER01378', N'Unnikrishnan.M.N', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'doanthanh24@yahoo.com', N'9889513376', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1380, N'USER01379', N'Roshan Basheer', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'tuyetoanh_dinh@hotmail.com', N'9889513377', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1381, N'USER01380', N'Jyothi Krishnan.M', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'myhanh.trinh42@hotmail.com', N'9889513378', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1382, N'USER01381', N'Phijo Koshy', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'vietthong.mai91@hotmail.com', N'9889513379', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1383, N'USER01382', N'Shimith PM', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'thuanhau8@hotmail.com', N'9889513380', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1384, N'USER01383', N'Anu K P', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'thuhuyen52@hotmail.com', N'9889513381', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1385, N'USER01384', N'Philip Jacob Perakath', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'thuyvan.dinh@hotmail.com', N'9889513382', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1386, N'USER01385', N'Kannan.M', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'mongvi.doan@yahoo.com', N'9889513383', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1387, N'USER01386', N'Najeed Ali. C. A', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'nghiminh_tang@hotmail.com', N'9889513384', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1388, N'USER01387', N'Sandeep.B', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'vietquoc_dao@hotmail.com', N'9889513385', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1389, N'USER01388', N'Siji K Varghese', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'quocmy.dao89@gmail.com', N'9889513386', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1390, N'USER01389', N'Ramya. M', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'dieuvan_ho@yahoo.com', N'9889513387', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1391, N'USER01390', N'Radhika.S', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'hongphat_ha@yahoo.com', N'9889513388', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1392, N'USER01391', N'Sajini James', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'huucanh45@hotmail.com', N'9889513389', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1393, N'USER01392', N'Anie Mary Kurian', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'minhtam_pham@yahoo.com', N'9889513390', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1394, N'USER01393', N'Teny Philip George', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'tuyetnhung_pham@yahoo.com', N'9889513391', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1395, N'USER01394', N'Vinod Kumar D.N', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'myhanh19@yahoo.com', N'9889513392', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1396, N'USER01395', N'Patricia Rany Bhai .M', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'tahien10@hotmail.com', N'9889513393', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1397, N'USER01396', N'Vandana.S', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'thanhngan_ngo@yahoo.com', N'9889513394', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1398, N'USER01397', N'Raghunath .V.N', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'huubao_ha70@yahoo.com', N'9889513395', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1399, N'USER01398', N'Sherina.H', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'cuongnghi.vu94@yahoo.com', N'9889513396', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1400, N'USER01399', N'B. Unnikrishnan', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'ngocngan_tran@yahoo.com', N'9889513397', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1401, N'USER01400', N'Nitha Rajagopal', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'duyluan.tang32@hotmail.com', N'9889513398', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1402, N'USER01401', N'Varun Sinha', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'huutrac0@hotmail.com', N'9889513399', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1403, N'USER01402', N'Rejani Accamma Ninan', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'hoangmy_hoang@hotmail.com', N'9889513400', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1404, N'USER01403', N'Sreehari.K.V', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'longvinh30@gmail.com', N'9889513401', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1405, N'USER01404', N'Usha. C', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'tunguyet.lam@yahoo.com', N'9889513402', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1406, N'USER01405', N'Merin Menachery', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'bachkim26@hotmail.com', N'9889513403', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1407, N'USER01406', N'Visakh Premraj', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'thuyanh.doan87@gmail.com', N'9889513404', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1408, N'USER01407', N'Sandeep S Kumar', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'tuanlinh.duong@hotmail.com', N'9889513405', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1409, N'USER01408', N'Sherin V Thomas', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'thienan_lam@gmail.com', N'9889513406', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1410, N'USER01409', N'Soumya Tresa Jose', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'haiphuong_dang@gmail.com', N'9889513407', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1411, N'USER01410', N'Chithraja.C.T', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'vietphong.vuong96@hotmail.com', N'9889513408', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1412, N'USER01411', N'Saritha. R. S', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'huyenthu13@hotmail.com', N'9889513409', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1413, N'USER01412', N'Biju.C.P', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'myhue.ly@gmail.com', N'9889513410', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1414, N'USER01413', N'Anitha. S', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'kieumai_ly@hotmail.com', N'9889513411', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1415, N'USER01414', N'Arshed Razak', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'linhchau_pham56@hotmail.com', N'9889513412', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1416, N'USER01415', N'Karthik.S', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'trucdao89@hotmail.com', N'9889513413', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1417, N'USER01416', N'Kiran Karuppali', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'thaitam_truong@yahoo.com', N'9889513414', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1418, N'USER01417', N'Melisa Thomas', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'ducphong52@hotmail.com', N'9889513415', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1419, N'USER01418', N'Shenoy John Rajan', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'quangnhat_tang@yahoo.com', N'9889513416', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1420, N'USER01419', N'Suhail Mohammed. A', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'khanhhoi.ho22@yahoo.com', N'9889513417', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1421, N'USER01420', N'Arathy.S', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'huubao_ho@gmail.com', N'9889513418', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1422, N'USER01421', N'Jinu. K. K', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'thientheu.pham@yahoo.com', N'9889513419', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1423, N'USER01422', N'Ceju. P. L', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'quangtrieu4@hotmail.com', N'9889513420', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1424, N'USER01423', N'Hance J Tharakan', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'minhthuy_dang@hotmail.com', N'9889513421', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1425, N'USER01424', N'Nishith Ranjan Sahoo', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'dacluc41@yahoo.com', N'9889513422', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1426, N'USER01425', N'Shubha Mathew', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'duycan.dinh39@gmail.com', N'9889513423', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1427, N'USER01426', N'Antony James', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'congloc_truong@gmail.com', N'9889513424', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1428, N'USER01427', N'Joseph Saxon Seemanthy', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'hongxuan.duong@hotmail.com', N'9889513425', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1429, N'USER01428', N'Hari Ravindran', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'kiethong_tang3@yahoo.com', N'9889513426', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1430, N'USER01429', N'Susmitha.S', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'anha34@yahoo.com', N'9889513427', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1431, N'USER01430', N'Remya Mohan', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'sonca16@yahoo.com', N'9889513428', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1432, N'USER01431', N'Jobin Ninan', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'vietnhi.tang@gmail.com', N'9889513429', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1433, N'USER01432', N'Tinu Shine A.L', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'baophap_hoang65@yahoo.com', N'9889513430', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1434, N'USER01433', N'Danya Philip', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'thuanthanh_ly@yahoo.com', N'9889513431', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1435, N'USER01434', N'Sreevidya T K', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'hongquy_ha@hotmail.com', N'9889513432', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1436, N'USER01435', N'Mehar Muhammed', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'truongphat14@yahoo.com', N'9889513433', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1437, N'USER01436', N'Mubashir T', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'nguyenvan.vuong56@hotmail.com', N'9889513434', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1438, N'USER01437', N'Jishy Alice Rajan', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'quocbao_dinh31@hotmail.com', N'9889513435', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1439, N'USER01438', N'Dejies Deoder', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'kieudung_lam@hotmail.com', N'9889513436', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1440, N'USER01439', N'Sreechand.S', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'tuyetvan_ly92@hotmail.com', N'9889513437', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1441, N'USER01440', N'Francis Y Moris', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'minhthu_lam@gmail.com', N'9889513438', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1442, N'USER01441', N'S.V.Renjini', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'thanhvu.do79@yahoo.com', N'9889513439', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1443, N'USER01442', N'Rakesh.R', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'kientrung_le84@hotmail.com', N'9889513440', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1444, N'USER01443', N'Deepak J Alapatt', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'bachtuyet.pham15@gmail.com', N'9889513441', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1445, N'USER01444', N'Jayasree.R', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'naman_le@hotmail.com', N'9889513442', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1446, N'USER01445', N'Ninu Mary Joseph', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'xuanminh49@hotmail.com', N'9889513443', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1447, N'USER01446', N'Prasanth N', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'thuyvan24@hotmail.com', N'9889513444', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1448, N'USER01447', N'R. Vasanth', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'dieuthuy45@yahoo.com', N'9889513445', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1449, N'USER01448', N'Minu Korath', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'minhan.ho31@yahoo.com', N'9889513446', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1450, N'USER01449', N'Raju Paul', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'nhasuong.ho49@hotmail.com', N'9889513447', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1451, N'USER01450', N'Anju Unnithan', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'xuanyen69@yahoo.com', N'9889513448', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1452, N'USER01451', N'Rajesh.P', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'dinhnguyen80@yahoo.com', N'9889513449', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1453, N'USER01452', N'Joseph George', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'chieuphong.vu@yahoo.com', N'9889513450', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1454, N'USER01453', N'Jimmy John Perakatt', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'caonguyen_doan@hotmail.com', N'9889513451', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1455, N'USER01454', N'Able.M.A', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'vietnga.trinh39@gmail.com', N'9889513452', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1456, N'USER01455', N'Avneet Gambhir', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'hongdiep4@hotmail.com', N'9889513453', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1457, N'USER01456', N'Rani Krishna', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'giangngoc_dao23@yahoo.com', N'9889513454', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1458, N'USER01457', N'Anish M A', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'thuyhuong_dang91@gmail.com', N'9889513455', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1459, N'USER01458', N'N. Vasudevan', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'anhdao_to@gmail.com', N'9889513456', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1460, N'USER01459', N'Mohamed Shamaz m h', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'minhvu44@gmail.com', N'9889513457', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1461, N'USER01460', N'Firoz.E.V', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'tienphuong80@hotmail.com', N'9889513458', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1462, N'USER01461', N'Ram Manoj K', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'ducan_bui@hotmail.com', N'9889513459', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1463, N'USER01462', N'Arun Thomas', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'camnhi_ha@gmail.com', N'9889513460', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1464, N'USER01463', N'Resmi George', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'bichhong.phan73@hotmail.com', N'9889513461', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1465, N'USER01464', N'Thanuja Salim', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'hoaivy61@gmail.com', N'9889513462', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1466, N'USER01465', N'Divya S', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'hieugiang_to@yahoo.com', N'9889513463', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1467, N'USER01466', N'Jibin M', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'huudat.ha@yahoo.com', N'9889513464', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1468, N'USER01467', N'Sreekanth.S', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'khanhgiao_truong72@hotmail.com', N'9889513465', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1469, N'USER01468', N'Lekshmi Vijayakumar', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'aulang_dinh@yahoo.com', N'9889513466', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1470, N'USER01469', N'Jenic Kumar T B', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'diemquyen.doan98@gmail.com', N'9889513467', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1471, N'USER01470', N'Renil Roy K', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'sontuyen63@hotmail.com', N'9889513468', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1472, N'USER01471', N'Sumesh J Chackalackal', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'baodinh_phan@hotmail.com', N'9889513469', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1473, N'USER01472', N'Madhu Kumar G', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'giangthien59@hotmail.com', N'9889513470', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1474, N'USER01473', N'Tintu Devasia', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'duyhien97@gmail.com', N'9889513471', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1475, N'USER01474', N'Jofil Thekkekara', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'huuchien32@hotmail.com', N'9889513472', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1476, N'USER01475', N'Jithu Jolly', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'hongdang_phung@yahoo.com', N'9889513473', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1477, N'USER01476', N'Rittu Scaria', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'tuankiet57@yahoo.com', N'9889513474', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1478, N'USER01477', N'Ummer Shervani A.P.M', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'xuanvu_le35@yahoo.com', N'9889513475', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1479, N'USER01478', N'Jinish C', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'dongtuyen79@hotmail.com', N'9889513476', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1480, N'USER01479', N'Ron John Ninan', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'quelam.dinh66@gmail.com', N'9889513477', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1481, N'USER01480', N'Shine. M. N', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'quynhnhu.dinh69@yahoo.com', N'9889513478', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1482, N'USER01481', N'Sudheesh. S', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'phuongtrieu.do5@yahoo.com', N'9889513479', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1483, N'USER01482', N'Linto K P', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'quocmanh.bui41@yahoo.com', N'9889513480', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1484, N'USER01483', N'Sooraj. V', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'vietkhang40@hotmail.com', N'9889513481', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1485, N'USER01484', N'Arun C.Mohan', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'binhminh62@hotmail.com', N'9889513482', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1486, N'USER01485', N'Lijin.S.Chandran', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'diemloc.phan@yahoo.com', N'9889513483', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1487, N'USER01486', N'Anu Sankaranarayanan', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'namthanh.phung61@gmail.com', N'9889513484', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1488, N'USER01487', N'Anoopkiran. V', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'thangcanh.vuong@hotmail.com', N'9889513485', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1489, N'USER01488', N'Srilekshmi M.', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'thanhman_lam@yahoo.com', N'9889513486', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1490, N'USER01489', N'Ligy Thomas. M', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'xuanhien.vu73@yahoo.com', N'9889513487', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1491, N'USER01490', N'Jomet Johny', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'thykhanh34@yahoo.com', N'9889513488', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1492, N'USER01491', N'Humble Devassy. C', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'huubao_lam@yahoo.com', N'9889513489', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1493, N'USER01492', N'Swapna Raj. P. R', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'diemphuong_tran@hotmail.com', N'9889513490', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1494, N'USER01493', N'Rajul O.S', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'luongquyen41@yahoo.com', N'9889513491', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1495, N'USER01494', N'Anju Unnikrishnan', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'dangkhoa.vu79@yahoo.com', N'9889513492', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1496, N'USER01495', N'Nitha. S', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'thaovan32@yahoo.com', N'9889513493', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1497, N'USER01496', N'Amalraj Menon P', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'thedan.duong92@yahoo.com', N'9889513494', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1498, N'USER01497', N'Johncy M John', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'anhkhoi25@hotmail.com', N'9889513495', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1499, N'USER01498', N'Rajeev R', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'thuthuy30@yahoo.com', N'9889513496', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1500, N'USER01499', N'Anuja P N', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'anhson_dang76@hotmail.com', N'9889513497', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1501, N'USER01500', N'Nimisha Rachel Zachariah', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'thaisan.lam0@yahoo.com', N'9889513498', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1502, N'USER01501', N'Anjana S.', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'thuydao38@hotmail.com', N'9889513499', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1503, N'USER01502', N'Drisya. S', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'vietan.ho59@gmail.com', N'9889513500', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1504, N'USER01503', N'Shanawas.P.M', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'thaouyen6@yahoo.com', N'9889513501', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1505, N'USER01504', N'Arun.R', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'baotien_do61@yahoo.com', N'9889513502', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1506, N'USER01505', N'Karthik raja.p', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'diepanh_vu@hotmail.com', N'9889513503', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1507, N'USER01506', N'Rino Cherian', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'anhthu_ngo76@yahoo.com', N'9889513504', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1508, N'USER01507', N'Arya Vijayan', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'anhduong22@gmail.com', N'9889513505', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1509, N'USER01508', N'Bony John', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'thaisang.to@gmail.com', N'9889513506', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1510, N'USER01509', N'Bhavyasree Unni', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'thinhcuong87@yahoo.com', N'9889513507', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1511, N'USER01510', N'Seena.S', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'chikien.hoang@yahoo.com', N'9889513508', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1512, N'USER01511', N'Resmi.G.Nair', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'tuongvy_tang@yahoo.com', N'9889513509', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1513, N'USER01512', N'Dennis Joseph', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'kimngoc.truong@hotmail.com', N'9889513510', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1514, N'USER01513', N'Sumila.R', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'tanphuoc.doan89@yahoo.com', N'9889513511', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1515, N'USER01514', N'Remya Rajendran', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'thuthuan_le@yahoo.com', N'9889513512', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1516, N'USER01515', N'Nayana Rajendran', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'thattho.le95@hotmail.com', N'9889513513', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1517, N'USER01516', N'Anjaly. S', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'xuanminh_vuong@gmail.com', N'9889513514', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1518, N'USER01517', N'Aby Antony Paramby', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'bachnhan_lam@gmail.com', N'9889513515', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1519, N'USER01518', N'Yasmeen P P', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'thanhhai66@yahoo.com', N'9889513516', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1520, N'USER01519', N'Aswathy.S', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'hunganh_to19@yahoo.com', N'9889513517', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1521, N'USER01520', N'Mathew Jose', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'quocphuong.phan@yahoo.com', N'9889513518', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1522, N'USER01521', N'Anand.V.S', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'tuanminh_ly79@hotmail.com', N'9889513519', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1523, N'USER01522', N'Anuja K.', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'duchoa23@hotmail.com', N'9889513520', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1524, N'USER01523', N'Amit Kumar', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'lankhue.le52@gmail.com', N'9889513521', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1525, N'USER01524', N'Varun Panicker', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'ducgiang.duong@hotmail.com', N'9889513522', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1526, N'USER01525', N'Basil Philip Mathew', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'tanphat.dang@gmail.com', N'9889513523', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1527, N'USER01526', N'Subin Raj P.A', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'nhuhong.trinh@hotmail.com', N'9889513524', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1528, N'USER01527', N'Divya V.M', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'quangdat_lam15@yahoo.com', N'9889513525', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1529, N'USER01528', N'Sajan Emmanuel', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'quocthong5@yahoo.com', N'9889513526', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1530, N'USER01529', N'Sreekanth Venugopal', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'quangtu_le@hotmail.com', N'9889513527', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1531, N'USER01530', N'Jeena Jacob', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'haiquan_truong22@yahoo.com', N'9889513528', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1532, N'USER01531', N'Bindu.R', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'conghai46@hotmail.com', N'9889513529', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1533, N'USER01532', N'Soumya Mathews', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'giaphuc_lam86@hotmail.com', N'9889513530', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1534, N'USER01533', N'Deepu.S', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'quanglam_do81@gmail.com', N'9889513531', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1535, N'USER01534', N'Jishnu Krishnan', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'thiendung_trinh@hotmail.com', N'9889513532', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1536, N'USER01535', N'Sandeep Kumar R', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'thanhhong_mai@hotmail.com', N'9889513533', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1537, N'USER01536', N'Sudeep.C.M.', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'nghixuan_hoang@hotmail.com', N'9889513534', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1538, N'USER01537', N'Anishnath.M.G', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'nhatda41@yahoo.com', N'9889513535', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1539, N'USER01538', N'Joseph Ribin Roy', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'thyoanh49@hotmail.com', N'9889513536', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1540, N'USER01539', N'Shakhi Abraham', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'dieuvan_ly@yahoo.com', N'9889513537', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1541, N'USER01540', N'Asha M', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'vietkhoa.hoang@hotmail.com', N'9889513538', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1542, N'USER01541', N'Sanu C.N.', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'huuhoang.nguyen98@yahoo.com', N'9889513539', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1543, N'USER01542', N'Roshni Anna Mathew', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'trucdao.tran69@hotmail.com', N'9889513540', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1544, N'USER01543', N'Anup Kumar.N', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'minhthuong.tran63@gmail.com', N'9889513541', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1545, N'USER01544', N'Ajit kumar', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'mynuong86@gmail.com', N'9889513542', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1546, N'USER01545', N'C.Abraham', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'phuongyen_phung7@yahoo.com', N'9889513543', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1547, N'USER01546', N'Fazil S', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'gianguyen.dinh@hotmail.com', N'9889513544', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1548, N'USER01547', N'Chikku Anto Abraham', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'kimphu.doan@yahoo.com', N'9889513545', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1549, N'USER01548', N'Anshad M', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'thanhbinh.duong15@hotmail.com', N'9889513546', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1550, N'USER01549', N'Syamkrishnan.M.R', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'baky42@yahoo.com', N'9889513547', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1551, N'USER01550', N'G.Prijeesh', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'hieulam.dao5@yahoo.com', N'9889513548', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1552, N'USER01551', N'Sanju N', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'tanthanh_to@yahoo.com', N'9889513549', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1553, N'USER01552', N'Thomas V. K.', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'khanhgiang20@yahoo.com', N'9889513550', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1554, N'USER01553', N'Linju A.R', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'duckhang.dao75@hotmail.com', N'9889513551', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1555, N'USER01554', N'Arun.C', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'tuly_phan@hotmail.com', N'9889513552', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1556, N'USER01555', N'Uma.B', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'honglien_pham19@gmail.com', N'9889513553', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1557, N'USER01556', N'Remya.Fen', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'khiettam95@hotmail.com', N'9889513554', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1558, N'USER01557', N'Mareena Jose', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'hoanglam.to@gmail.com', N'9889513555', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1559, N'USER01558', N'Praveen.R', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'duythach87@gmail.com', N'9889513556', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1560, N'USER01559', N'Jeena Mary Mathew', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'caominh_dinh50@hotmail.com', N'9889513557', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1561, N'USER01560', N'Sijo Jose M', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'dantam.to0@hotmail.com', N'9889513558', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1562, N'USER01561', N'Sijo Jose', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'chieuquan96@yahoo.com', N'9889513559', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1563, N'USER01562', N'Deepthi L', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'camlinh.duong@yahoo.com', N'9889513560', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1564, N'USER01563', N'Shimi.M', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'monghoa.phung41@yahoo.com', N'9889513561', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1565, N'USER01564', N'Feby Felix Mathew', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'xuantruong_vuong@yahoo.com', N'9889513562', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1566, N'USER01565', N'Sathish TL', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'xuanvan95@yahoo.com', N'9889513563', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1567, N'USER01566', N'George Sebastian', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'thanhthuan.ho@gmail.com', N'9889513564', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1568, N'USER01567', N'J.H.Nidhi', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'hoaihuong33@gmail.com', N'9889513565', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1569, N'USER01568', N'Resmi Anna Jose', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'vinhtoan_tang@yahoo.com', N'9889513566', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1570, N'USER01569', N'Vinod .M .S', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'haison87@gmail.com', N'9889513567', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1571, N'USER01570', N'Jobin P Luke', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'quynhtram.tran50@hotmail.com', N'9889513568', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1572, N'USER01571', N'Anuraj L.R', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'dongdao55@yahoo.com', N'9889513569', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1573, N'USER01572', N'Remya M Vincent', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'minhhai.phung@yahoo.com', N'9889513570', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1574, N'USER01573', N'Surya.M.S.', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'mongnhi.ho14@yahoo.com', N'9889513571', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1575, N'USER01574', N'Lakshmi K G', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'vanhuong_lam@gmail.com', N'9889513572', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1576, N'USER01575', N'Nawin. M', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'thanhthien35@hotmail.com', N'9889513573', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1577, N'USER01576', N'Sujitha.V', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'luuly_tang90@yahoo.com', N'9889513574', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1578, N'USER01577', N'Seethal Baby', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'minhvu_le26@yahoo.com', N'9889513575', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1579, N'USER01578', N'Bidhu. P. M.', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'tamlinh29@yahoo.com', N'9889513576', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1580, N'USER01579', N'Dil Sebin Kuriachen', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'khanhhuyen_to19@gmail.com', N'9889513577', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1581, N'USER01580', N'Bibinu Jacob', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'aivan.bui49@yahoo.com', N'9889513578', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1582, N'USER01581', N'Drisya. S', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'haiyen.ha@yahoo.com', N'9889513579', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1583, N'USER01582', N'Saflin. P. H', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'sonha.pham18@yahoo.com', N'9889513580', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1584, N'USER01583', N'Shamnad.S', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'hoanghai.ngo27@gmail.com', N'9889513581', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1585, N'USER01584', N'Anaz M', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'huukhoi.vu84@gmail.com', N'9889513582', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1586, N'USER01585', N'Divya.R', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'camlien52@yahoo.com', N'9889513583', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1587, N'USER01586', N'Sreenisha.G.', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'theson.doan@yahoo.com', N'9889513584', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1588, N'USER01587', N'Vipin joseph', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'lanhuong22@hotmail.com', N'9889513585', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1589, N'USER01588', N'Sandeep S', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'theanh_phung@gmail.com', N'9889513586', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1590, N'USER01589', N'Dhiraj krishnan', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'huulong.vu58@yahoo.com', N'9889513587', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1591, N'USER01590', N'Sreeja C.G', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'ngochanh92@hotmail.com', N'9889513588', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1592, N'USER01591', N'Jinu George', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'tantai.phan96@hotmail.com', N'9889513589', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1593, N'USER01592', N'Jaya. T. V', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'quynhnhung.ngo@yahoo.com', N'9889513590', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1594, N'USER01593', N'Shijo Paul', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'giaphong_ha45@gmail.com', N'9889513591', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1595, N'USER01594', N'Rohith.T.Pavithran', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'hoangminh.ha9@hotmail.com', N'9889513592', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1596, N'USER01595', N'D.Preethi Praveena Roseline', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'hanhmy_tang@yahoo.com', N'9889513593', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1597, N'USER01596', N'Mereena Mathew V', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'anhtu20@hotmail.com', N'9889513594', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1598, N'USER01597', N'Leena Varghese', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'totam_vuong92@hotmail.com', N'9889513595', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1599, N'USER01598', N'Lijo Thottan', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'bathinh91@yahoo.com', N'9889513596', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1600, N'USER01599', N'K.A.Balasubramanian', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'mongvan37@yahoo.com', N'9889513597', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1601, N'USER01600', N'Arun Soman', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'naman74@gmail.com', N'9889513598', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1602, N'USER01601', N'Shinto. E. L', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'haimy_dang@hotmail.com', N'9889513599', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1603, N'USER01602', N'Padma.S', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'thiendi.ngo39@yahoo.com', N'9889513600', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1604, N'USER01603', N'Ashu Abraham', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'nhathuy_vu27@yahoo.com', N'9889513601', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1605, N'USER01604', N'Anantheswar. G', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'xuanbao.ngo92@gmail.com', N'9889513602', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1606, N'USER01605', N'Smitha.E.K', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'dinhcuong.dao70@yahoo.com', N'9889513603', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1607, N'USER01606', N'Shone Jacob', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'ngochue_ly@gmail.com', N'9889513604', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1608, N'USER01607', N'Anupama Joseph', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'tinhnhi_bui@yahoo.com', N'9889513605', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1609, N'USER01608', N'Regi Paul', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'phuongdiem40@gmail.com', N'9889513606', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1610, N'USER01609', N'Sojan P.R.', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'quangthinh95@yahoo.com', N'9889513607', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1611, N'USER01610', N'Remya.P.Antony', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'hongngoc_phan71@gmail.com', N'9889513608', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1612, N'USER01611', N'Rosbin.P.Lookose', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'songthu.pham89@gmail.com', N'9889513609', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1613, N'USER01612', N'Smitha Johnson', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'nguyenbong.ha58@gmail.com', N'9889513610', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1614, N'USER01613', N'Ranjith Ravindran', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'maihuong_le@yahoo.com', N'9889513611', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1615, N'USER01614', N'Denys Payyampally', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'thanhcong6@hotmail.com', N'9889513612', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1616, N'USER01615', N'Remya. M', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'thuylinh.tang@yahoo.com', N'9889513613', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1617, N'USER01616', N'Aparna.R', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'quephuong.do@yahoo.com', N'9889513614', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1618, N'USER01617', N'Sajin Azeez K', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'phuongnga_vu48@yahoo.com', N'9889513615', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1619, N'USER01618', N'Anoop.M.Ravindran', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'tuyenlam.tran66@yahoo.com', N'9889513616', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1620, N'USER01619', N'Simla Lakshmi.T.S.', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'quynhnhung54@hotmail.com', N'9889513617', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1621, N'USER01620', N'Geo Thomas', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'dieunuong92@yahoo.com', N'9889513618', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1622, N'USER01621', N'Jyothi Gopalakrishnan', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'lamnhi.truong@yahoo.com', N'9889513619', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1623, N'USER01622', N'Libu.L.B', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'duyuyen_ly56@yahoo.com', N'9889513620', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1624, N'USER01623', N'Nishanth M', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'ngoctrinh22@yahoo.com', N'9889513621', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1625, N'USER01624', N'C.Arvind', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'duyngon99@gmail.com', N'9889513622', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1626, N'USER01625', N'K.S.Anu', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'tuyetthanh.pham38@yahoo.com', N'9889513623', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1627, N'USER01626', N'Sajan T John', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'bichhai.ha62@gmail.com', N'9889513624', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1628, N'USER01627', N'BinishBalakrishnan', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'trangdai.ha71@yahoo.com', N'9889513625', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1629, N'USER01628', N'Kiran S', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'dantam.duong@yahoo.com', N'9889513626', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1630, N'USER01629', N'Vinay Kumar R', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'quangdat_le@hotmail.com', N'9889513627', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1631, N'USER01630', N'M.R.Roopasree', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'monghoa8@yahoo.com', N'9889513628', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1632, N'USER01631', N'Abraham Vivek Luke', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'thuyminh.to12@gmail.com', N'9889513629', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1633, N'USER01632', N'Ashish V.V', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'vinhluan_ho2@gmail.com', N'9889513630', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1634, N'USER01633', N'Jisha Susan Samuel', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'hagiang1@yahoo.com', N'9889513631', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1635, N'USER01634', N'Mary Thanu Valavi.K', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'ngocdan.do0@hotmail.com', N'9889513632', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1636, N'USER01635', N'Rageesh T', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'diemphuoc26@yahoo.com', N'9889513633', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1637, N'USER01636', N'Praveen.M.S', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'baothuy.ha@hotmail.com', N'9889513634', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1638, N'USER01637', N'Juliyat Yeldho', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'phuonghoa19@gmail.com', N'9889513635', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1639, N'USER01638', N'Indumathi.M.', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'chikhiem38@hotmail.com', N'9889513636', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1640, N'USER01639', N'Divya Krishnan', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'khanhgiao.tang6@yahoo.com', N'9889513637', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1641, N'USER01640', N'Alex George', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'ductam_vu7@hotmail.com', N'9889513638', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1642, N'USER01641', N'T.M.Sharmi', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'quelam6@yahoo.com', N'9889513639', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1643, N'USER01642', N'Fouzia V K', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'minhthien26@yahoo.com', N'9889513640', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1644, N'USER01643', N'Ashok M Kurup', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'phuccuong21@gmail.com', N'9889513641', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1645, N'USER01644', N'Asha Susan Joy', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'tuquyen.vu73@gmail.com', N'9889513642', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1646, N'USER01645', N'Nishad Showkath', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'honghoa.hoang54@yahoo.com', N'9889513643', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1647, N'USER01646', N'Lakshmy Rajendranath', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'thatcuong41@yahoo.com', N'9889513644', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1648, N'USER01647', N'C.Ramanathan', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'khoiphong86@gmail.com', N'9889513645', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1649, N'USER01648', N'Arun Appukuttan', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'haithanh.phan@hotmail.com', N'9889513646', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1650, N'USER01649', N'Averil Mary Antony', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'thetuong.phung2@hotmail.com', N'9889513647', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1651, N'USER01650', N'Poornima.I', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'lequan.tang@yahoo.com', N'9889513648', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1652, N'USER01651', N'Anuroop R', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'mynhan_do@gmail.com', N'9889513649', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1653, N'USER01652', N'Noby Kurian', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'ngocdan_bui72@hotmail.com', N'9889513650', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1654, N'USER01653', N'Julius Mathew P', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'duytan.mai93@yahoo.com', N'9889513651', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1655, N'USER01654', N'Soji P Joseph', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'monglong83@hotmail.com', N'9889513652', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1656, N'USER01655', N'Seepthy.S', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'bichlien.tang2@gmail.com', N'9889513653', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1657, N'USER01656', N'Sarah Thomas', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'hienhoa_ngo@yahoo.com', N'9889513654', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1658, N'USER01657', N'Sachin G Menon', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'tuelam51@gmail.com', N'9889513655', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1659, N'USER01658', N'Libsy Ann Merin Baby', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'chanhviet16@hotmail.com', N'9889513656', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1660, N'USER01659', N'Renjith Raj', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'bathanh60@hotmail.com', N'9889513657', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1661, N'USER01660', N'Shino Mathew', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'nhutran.vuong83@yahoo.com', N'9889513658', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1662, N'USER01661', N'Anu Mary Oommen', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'thanhgiang97@hotmail.com', N'9889513659', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1663, N'USER01662', N'Arun Mathew O', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'kiettrinh.ly@hotmail.com', N'9889513660', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1664, N'USER01663', N'Rekha.M', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'vietanh.mai27@hotmail.com', N'9889513661', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1665, N'USER01664', N'Satheesh Chandran C.I.', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'nhattien_tran@gmail.com', N'9889513662', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1666, N'USER01665', N'Ashik .S', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'baky.ho@hotmail.com', N'9889513663', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1667, N'USER01666', N'Ranjith .P', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'truongphu_ho@hotmail.com', N'9889513664', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1668, N'USER01667', N'Dinker .R', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'ductri.mai@yahoo.com', N'9889513665', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1669, N'USER01668', N'Nisha .V .Anand', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'haphuong53@yahoo.com', N'9889513666', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1670, N'USER01669', N'Anu R.P', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'lamvien.bui@hotmail.com', N'9889513667', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1671, N'USER01670', N'Sreeja .S', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'honggiang_doan@gmail.com', N'9889513668', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1672, N'USER01671', N'Saurabh Kumar Singhal', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'hungtuong49@gmail.com', N'9889513669', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1673, N'USER01672', N'Deepak Kumar Sinha', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'vankhanh.ha40@hotmail.com', N'9889513670', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1674, N'USER01673', N'Nisha .K .Jose', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'nguyetcat38@yahoo.com', N'9889513671', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1675, N'USER01674', N'Arun .K.K', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'khanhquynh_doan@gmail.com', N'9889513672', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1676, N'USER01675', N'Aby John', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'khanhgiang_lam59@yahoo.com', N'9889513673', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1677, N'USER01676', N'Sameer Salim', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'lequynh63@yahoo.com', N'9889513674', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1678, N'USER01677', N'Sameena Kabir', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'tunglinh66@yahoo.com', N'9889513675', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1679, N'USER01678', N'Vivek .R', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'thunga.ho@hotmail.com', N'9889513676', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1680, N'USER01679', N'Shirine Mohammed', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'phinhan_phung@hotmail.com', N'9889513677', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1681, N'USER01680', N'Sagorika Pal', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'baotoan.vu87@yahoo.com', N'9889513678', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1682, N'USER01681', N'Anil M.Johnson', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'tichduc_dang@gmail.com', N'9889513679', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1683, N'USER01682', N'Harline .P .Thomas', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'hamy.hoang29@hotmail.com', N'9889513680', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1684, N'USER01683', N'George Abraham .E', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'ducthang.dinh@gmail.com', N'9889513681', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1685, N'USER01684', N'Sreejith .R .C', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'phuongvu82@gmail.com', N'9889513682', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1686, N'USER01685', N'Balu .P .V', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'thanhthien_vuong@gmail.com', N'9889513683', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
INSERT [dbo].[users] ([userId], [userCode], [userName], [userPassword], [userRoleId], [userEmail], [userPhone], [userCountry], [userState], [userCity], [userNew], [userStatus]) VALUES (1687, N'USER01686', N'Suneeth John Varghese', N'e606e38b0d8c19b24cf0ee3808183162ea7cd63ff7912dbb22b5e803286b4446', 2, N'ducthangi.dinh@gmail.com', N'9889513684', N'India', N'Karnataka', N'Bangalore', 1, 1)
GO
SET IDENTITY_INSERT [dbo].[users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__batches__78CCD772B6A2AA24]    Script Date: 03-09-2022 14:34:41 ******/
ALTER TABLE [dbo].[batches] ADD UNIQUE NONCLUSTERED 
(
	[batchId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__category__37077ABD46CF84C8]    Script Date: 03-09-2022 14:34:41 ******/
ALTER TABLE [dbo].[category] ADD UNIQUE NONCLUSTERED 
(
	[categoryName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__courses__2AA84FD075237CDD]    Script Date: 03-09-2022 14:34:41 ******/
ALTER TABLE [dbo].[courses] ADD UNIQUE NONCLUSTERED 
(
	[courseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__instruct__370F55D9C11AFC00]    Script Date: 03-09-2022 14:34:41 ******/
ALTER TABLE [dbo].[instructor] ADD UNIQUE NONCLUSTERED 
(
	[instructorCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__users__F97F2AEA694C6182]    Script Date: 03-09-2022 14:34:41 ******/
ALTER TABLE [dbo].[users] ADD UNIQUE NONCLUSTERED 
(
	[userCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[activity_log]  WITH NOCHECK ADD  CONSTRAINT [FK__activity___userI__440B1D61] FOREIGN KEY([userId])
REFERENCES [dbo].[users] ([userId])
GO
ALTER TABLE [dbo].[activity_log] NOCHECK CONSTRAINT [FK__activity___userI__440B1D61]
GO
ALTER TABLE [dbo].[batches]  WITH CHECK ADD  CONSTRAINT [FK__batches__batchCo__403A8C7D] FOREIGN KEY([batchCourseId])
REFERENCES [dbo].[courses] ([courseId])
GO
ALTER TABLE [dbo].[batches] CHECK CONSTRAINT [FK__batches__batchCo__403A8C7D]
GO
ALTER TABLE [dbo].[course_enrollment]  WITH NOCHECK ADD  CONSTRAINT [FK_course_enrollment_batches] FOREIGN KEY([batchId])
REFERENCES [dbo].[batches] ([id])
GO
ALTER TABLE [dbo].[course_enrollment] CHECK CONSTRAINT [FK_course_enrollment_batches]
GO
ALTER TABLE [dbo].[course_enrollment]  WITH NOCHECK ADD  CONSTRAINT [FK_course_enrollment_course_enrollment1] FOREIGN KEY([id])
REFERENCES [dbo].[course_enrollment] ([id])
GO
ALTER TABLE [dbo].[course_enrollment] CHECK CONSTRAINT [FK_course_enrollment_course_enrollment1]
GO
ALTER TABLE [dbo].[course_enrollment]  WITH NOCHECK ADD  CONSTRAINT [FK_course_enrollment_users] FOREIGN KEY([userId])
REFERENCES [dbo].[users] ([userId])
GO
ALTER TABLE [dbo].[course_enrollment] CHECK CONSTRAINT [FK_course_enrollment_users]
GO
ALTER TABLE [dbo].[courses]  WITH NOCHECK ADD FOREIGN KEY([courseCategoryId])
REFERENCES [dbo].[category] ([categoryId])
GO
ALTER TABLE [dbo].[courses]  WITH NOCHECK ADD FOREIGN KEY([courseInstructorID])
REFERENCES [dbo].[instructor] ([instructorId])
GO
ALTER TABLE [dbo].[courses]  WITH NOCHECK ADD FOREIGN KEY([courseMinQualificationId])
REFERENCES [dbo].[qualifications] ([qualificationId])
GO
ALTER TABLE [dbo].[enquiries]  WITH NOCHECK ADD  CONSTRAINT [FK_Enquiries_users] FOREIGN KEY([enquiryUserId])
REFERENCES [dbo].[users] ([userId])
GO
ALTER TABLE [dbo].[enquiries] CHECK CONSTRAINT [FK_Enquiries_users]
GO
ALTER TABLE [dbo].[user_qualification]  WITH NOCHECK ADD FOREIGN KEY([qualificationId])
REFERENCES [dbo].[qualifications] ([qualificationId])
GO
ALTER TABLE [dbo].[user_qualification]  WITH NOCHECK ADD  CONSTRAINT [FK__user_qual__userI__37A5467C] FOREIGN KEY([userId])
REFERENCES [dbo].[users] ([userId])
GO
ALTER TABLE [dbo].[user_qualification] NOCHECK CONSTRAINT [FK__user_qual__userI__37A5467C]
GO
ALTER TABLE [dbo].[users]  WITH NOCHECK ADD  CONSTRAINT [FK__users__userRoleI__34C8D9D1] FOREIGN KEY([userRoleId])
REFERENCES [dbo].[role] ([roleId])
GO
ALTER TABLE [dbo].[users] NOCHECK CONSTRAINT [FK__users__userRoleI__34C8D9D1]
GO
USE [master]
GO
ALTER DATABASE [ProjectCRM] SET  READ_WRITE 
GO
