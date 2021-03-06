USE [master]
GO
/****** Object:  Database [ESCODB]    Script Date: 7/24/2020 10:34:02 PM ******/
CREATE DATABASE [ESCODB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ESCODB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\ESCODB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ESCODB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\ESCODB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ESCODB] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ESCODB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ESCODB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ESCODB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ESCODB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ESCODB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ESCODB] SET ARITHABORT OFF 
GO
ALTER DATABASE [ESCODB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ESCODB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ESCODB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ESCODB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ESCODB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ESCODB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ESCODB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ESCODB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ESCODB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ESCODB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ESCODB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ESCODB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ESCODB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ESCODB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ESCODB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ESCODB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ESCODB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ESCODB] SET RECOVERY FULL 
GO
ALTER DATABASE [ESCODB] SET  MULTI_USER 
GO
ALTER DATABASE [ESCODB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ESCODB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ESCODB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ESCODB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ESCODB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ESCODB', N'ON'
GO
ALTER DATABASE [ESCODB] SET QUERY_STORE = OFF
GO
USE [ESCODB]
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
USE [ESCODB]
GO
/****** Object:  Table [dbo].[AchievedRate]    Script Date: 7/24/2020 10:34:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AchievedRate](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Rate] [nchar](50) NULL,
 CONSTRAINT [PK_AchievedRate] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Cities]    Script Date: 7/24/2020 10:34:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cities](
	[CityID] [int] IDENTITY(1,1) NOT NULL,
	[City] [nchar](100) NULL,
 CONSTRAINT [PK_Cities] PRIMARY KEY CLUSTERED 
(
	[CityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Conractors]    Script Date: 7/24/2020 10:34:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Conractors](
	[CotractorID] [int] IDENTITY(1,1) NOT NULL,
	[ContractorName] [nvarchar](50) NOT NULL,
	[ConractorSupervisor] [nchar](100) NOT NULL,
 CONSTRAINT [PK_Conractors] PRIMARY KEY CLUSTERED 
(
	[CotractorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FieldTour]    Script Date: 7/24/2020 10:34:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FieldTour](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProjectID] [int] NULL,
	[ContractorID] [int] NULL,
	[City] [int] NULL,
	[Date] [datetime] NULL,
	[CreatedBy] [nvarchar](100) NULL,
	[CreatedAt] [datetime] NULL,
	[Notes] [nvarchar](max) NULL,
 CONSTRAINT [PK_FieldTour] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[IsAchieved]    Script Date: 7/24/2020 10:34:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IsAchieved](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Result] [nchar](100) NULL,
 CONSTRAINT [PK_IsAchieved] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Projects]    Script Date: 7/24/2020 10:34:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Projects](
	[ProjectID] [int] IDENTITY(1,1) NOT NULL,
	[ARProjectName] [nvarchar](255) NOT NULL,
	[EngProjectName] [nchar](255) NOT NULL,
	[IsActive] [nchar](10) NULL,
	[ContractorID] [int] NOT NULL,
 CONSTRAINT [PK_Projects] PRIMARY KEY CLUSTERED 
(
	[ProjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ServiceDetails]    Script Date: 7/24/2020 10:34:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiceDetails](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ServiceID] [int] NULL,
	[AchievedID] [int] NULL,
	[AchievedRateID] [int] NULL,
	[TourID] [int] NULL,
 CONSTRAINT [PK_ServiceDetails] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Services]    Script Date: 7/24/2020 10:34:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Services](
	[ServiceID] [int] IDENTITY(1,1) NOT NULL,
	[Service] [nchar](255) NULL,
 CONSTRAINT [PK_Services] PRIMARY KEY CLUSTERED 
(
	[ServiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Workers]    Script Date: 7/24/2020 10:34:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Workers](
	[WorkerID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nchar](100) NULL,
 CONSTRAINT [PK_Workers] PRIMARY KEY CLUSTERED 
(
	[WorkerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[AchievedRate] ON 

INSERT [dbo].[AchievedRate] ([ID], [Rate]) VALUES (1, N'جيد                                               ')
INSERT [dbo].[AchievedRate] ([ID], [Rate]) VALUES (2, N'مقبول                                             ')
INSERT [dbo].[AchievedRate] ([ID], [Rate]) VALUES (3, N'سئ                                                ')
SET IDENTITY_INSERT [dbo].[AchievedRate] OFF
SET IDENTITY_INSERT [dbo].[Cities] ON 

INSERT [dbo].[Cities] ([CityID], [City]) VALUES (1, N'الرياض                                                                                              ')
INSERT [dbo].[Cities] ([CityID], [City]) VALUES (2, N'جدة                                                                                                 ')
INSERT [dbo].[Cities] ([CityID], [City]) VALUES (3, N'الدمام                                                                                              ')
SET IDENTITY_INSERT [dbo].[Cities] OFF
SET IDENTITY_INSERT [dbo].[Conractors] ON 

INSERT [dbo].[Conractors] ([CotractorID], [ContractorName], [ConractorSupervisor]) VALUES (1, N'مقاول رقم 1', N'علي                                                                                                 ')
INSERT [dbo].[Conractors] ([CotractorID], [ContractorName], [ConractorSupervisor]) VALUES (2, N'مقاول رقم 2', N'احمد                                                                                                ')
INSERT [dbo].[Conractors] ([CotractorID], [ContractorName], [ConractorSupervisor]) VALUES (3, N'مقاول رقم 3', N'سعد                                                                                                 ')
SET IDENTITY_INSERT [dbo].[Conractors] OFF
SET IDENTITY_INSERT [dbo].[IsAchieved] ON 

INSERT [dbo].[IsAchieved] ([ID], [Result]) VALUES (1, N'نعم                                                                                                 ')
INSERT [dbo].[IsAchieved] ([ID], [Result]) VALUES (2, N'لا                                                                                                  ')
SET IDENTITY_INSERT [dbo].[IsAchieved] OFF
SET IDENTITY_INSERT [dbo].[Projects] ON 

INSERT [dbo].[Projects] ([ProjectID], [ARProjectName], [EngProjectName], [IsActive], [ContractorID]) VALUES (1, N'مشروع نقل وجمع نفايات', N'WasteCllectionProject                                                                                                                                                                                                                                          ', N'1         ', 1)
INSERT [dbo].[Projects] ([ProjectID], [ARProjectName], [EngProjectName], [IsActive], [ContractorID]) VALUES (2, N'مشروع تنظيف الشوارع', N'CleaningProject                                                                                                                                                                                                                                                ', N'1         ', 2)
SET IDENTITY_INSERT [dbo].[Projects] OFF
SET IDENTITY_INSERT [dbo].[Services] ON 

INSERT [dbo].[Services] ([ServiceID], [Service]) VALUES (1, N'نظافة الشوارع                                                                                                                                                                                                                                                  ')
INSERT [dbo].[Services] ([ServiceID], [Service]) VALUES (2, N'التقاط النفايات المبعثرة                                                                                                                                                                                                                                       ')
INSERT [dbo].[Services] ([ServiceID], [Service]) VALUES (3, N'تفريغ ونقل الحاويات                                                                                                                                                                                                                                            ')
INSERT [dbo].[Services] ([ServiceID], [Service]) VALUES (4, N'رقع النفايات ذات الحجم الكبير                                                                                                                                                                                                                                  ')
INSERT [dbo].[Services] ([ServiceID], [Service]) VALUES (5, N'نظافة مغاسل الموتى والمقابر                                                                                                                                                                                                                                    ')
INSERT [dbo].[Services] ([ServiceID], [Service]) VALUES (6, N'نظافة الحدائق العامة والمنتزهات                                                                                                                                                                                                                                ')
INSERT [dbo].[Services] ([ServiceID], [Service]) VALUES (7, N'نزح مباة البيارات                                                                                                                                                                                                                                              ')
INSERT [dbo].[Services] ([ServiceID], [Service]) VALUES (8, N'شفط مياه الامطار والمياه المتسربة                                                                                                                                                                                                                              ')
INSERT [dbo].[Services] ([ServiceID], [Service]) VALUES (9, N'غسيل الحاويات                                                                                                                                                                                                                                                  ')
SET IDENTITY_INSERT [dbo].[Services] OFF
SET IDENTITY_INSERT [dbo].[Workers] ON 

INSERT [dbo].[Workers] ([WorkerID], [Name]) VALUES (1, N'محمد                                                                                                ')
INSERT [dbo].[Workers] ([WorkerID], [Name]) VALUES (2, N'سليم                                                                                                ')
INSERT [dbo].[Workers] ([WorkerID], [Name]) VALUES (3, N'عماد                                                                                                ')
SET IDENTITY_INSERT [dbo].[Workers] OFF
ALTER TABLE [dbo].[FieldTour]  WITH CHECK ADD  CONSTRAINT [FK_FieldTour_Cities] FOREIGN KEY([City])
REFERENCES [dbo].[Cities] ([CityID])
GO
ALTER TABLE [dbo].[FieldTour] CHECK CONSTRAINT [FK_FieldTour_Cities]
GO
ALTER TABLE [dbo].[FieldTour]  WITH CHECK ADD  CONSTRAINT [FK_FieldTour_Conractors] FOREIGN KEY([ContractorID])
REFERENCES [dbo].[Conractors] ([CotractorID])
GO
ALTER TABLE [dbo].[FieldTour] CHECK CONSTRAINT [FK_FieldTour_Conractors]
GO
ALTER TABLE [dbo].[FieldTour]  WITH CHECK ADD  CONSTRAINT [FK_FieldTour_Projects] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[Projects] ([ProjectID])
GO
ALTER TABLE [dbo].[FieldTour] CHECK CONSTRAINT [FK_FieldTour_Projects]
GO
ALTER TABLE [dbo].[Projects]  WITH CHECK ADD  CONSTRAINT [FK_Projects_Conractors] FOREIGN KEY([ContractorID])
REFERENCES [dbo].[Conractors] ([CotractorID])
GO
ALTER TABLE [dbo].[Projects] CHECK CONSTRAINT [FK_Projects_Conractors]
GO
ALTER TABLE [dbo].[ServiceDetails]  WITH CHECK ADD  CONSTRAINT [FK_ServiceDetails_AchievedRate] FOREIGN KEY([AchievedRateID])
REFERENCES [dbo].[AchievedRate] ([ID])
GO
ALTER TABLE [dbo].[ServiceDetails] CHECK CONSTRAINT [FK_ServiceDetails_AchievedRate]
GO
ALTER TABLE [dbo].[ServiceDetails]  WITH CHECK ADD  CONSTRAINT [FK_ServiceDetails_FieldTour] FOREIGN KEY([TourID])
REFERENCES [dbo].[FieldTour] ([ID])
GO
ALTER TABLE [dbo].[ServiceDetails] CHECK CONSTRAINT [FK_ServiceDetails_FieldTour]
GO
ALTER TABLE [dbo].[ServiceDetails]  WITH CHECK ADD  CONSTRAINT [FK_ServiceDetails_IsAchieved] FOREIGN KEY([AchievedID])
REFERENCES [dbo].[IsAchieved] ([ID])
GO
ALTER TABLE [dbo].[ServiceDetails] CHECK CONSTRAINT [FK_ServiceDetails_IsAchieved]
GO
ALTER TABLE [dbo].[ServiceDetails]  WITH CHECK ADD  CONSTRAINT [FK_ServiceDetails_Services] FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Services] ([ServiceID])
GO
ALTER TABLE [dbo].[ServiceDetails] CHECK CONSTRAINT [FK_ServiceDetails_Services]
GO
USE [master]
GO
ALTER DATABASE [ESCODB] SET  READ_WRITE 
GO
