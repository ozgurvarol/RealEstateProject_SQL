USE [master]
GO
/****** Object:  Database [FinalProjectMuhammet]    Script Date: 12/28/2019 10:29:00 PM ******/
CREATE DATABASE FinalProjectMuhammet;
GO

/*
 CONTAINMENT = NONE
 ON  PRIMARY 
/ *******  ( NAME = N'FinalProjectMuhammet', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\FinalProjectMuhammet.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FinalProjectMuhammet_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\FinalProjectMuhammet_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [FinalProjectMuhammet] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FinalProjectMuhammet].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FinalProjectMuhammet] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FinalProjectMuhammet] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FinalProjectMuhammet] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FinalProjectMuhammet] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FinalProjectMuhammet] SET ARITHABORT OFF 
GO
ALTER DATABASE [FinalProjectMuhammet] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FinalProjectMuhammet] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FinalProjectMuhammet] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FinalProjectMuhammet] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FinalProjectMuhammet] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FinalProjectMuhammet] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FinalProjectMuhammet] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FinalProjectMuhammet] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FinalProjectMuhammet] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FinalProjectMuhammet] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FinalProjectMuhammet] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FinalProjectMuhammet] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FinalProjectMuhammet] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FinalProjectMuhammet] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FinalProjectMuhammet] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FinalProjectMuhammet] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FinalProjectMuhammet] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FinalProjectMuhammet] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [FinalProjectMuhammet] SET  MULTI_USER 
GO
ALTER DATABASE [FinalProjectMuhammet] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FinalProjectMuhammet] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FinalProjectMuhammet] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FinalProjectMuhammet] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FinalProjectMuhammet] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FinalProjectMuhammet] SET QUERY_STORE = OFF
GO
*/
USE FinalProjectMuhammet
GO
/****** Object:  Table [dbo].[AGENCY]    Script Date: 12/28/2019 10:29:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON 
GO
CREATE TABLE [dbo].[AGENCY](
	[TransasctionID] [int] NOT NULL,
	[OwnerID] [int] NOT NULL,
	[BuildingID] [int] NOT NULL,
	[BoughDate] [date] NOT NULL,
	[SoldDate] [date] NULL,
	[SalePrice] [money] NOT NULL,
 CONSTRAINT [PK_AGENCY] PRIMARY KEY CLUSTERED 
(
	[TransasctionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[APARTMENT]    Script Date: 12/28/2019 10:29:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[APARTMENT](
	[BuildingID] [int] NOT NULL,
	[FloorNumber] [int] NOT NULL,
	[AptID] [int] NOT NULL,
	[NumberOfRooms] [int] NOT NULL,
	[ConditionID] [int] NOT NULL,
	[RentalStatus] [varchar](10) NOT NULL,
	[TenantID] [int] NULL,
	[OptimalMonthRentalAmount] [int] NOT NULL,
	[NumberOfBedrooms] [int] NOT NULL,
	[Washer/Dryer] [bit] NOT NULL,
	[Patio] [bit] NOT NULL,
	[HardwoodFloors] [bit] NOT NULL,
 CONSTRAINT [PK_APARTMENT] PRIMARY KEY CLUSTERED 
(
	[BuildingID] ASC,
	[FloorNumber] ASC,
	[AptID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BUILDING]    Script Date: 12/28/2019 10:29:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BUILDING](
	[BuildingID] [int] NOT NULL,
	[Street] [varchar](45) NOT NULL,
	[City] [varchar](50) NOT NULL,
	[State] [varchar](50) NOT NULL,
	[Zip] [nchar](10) NOT NULL,
	[NumberOfFloors] [int] NOT NULL,
	[NumberOfApartments] [int] NOT NULL,
	[ConditionID] [int] NOT NULL,
	[SuperID] [int] NOT NULL,
	[Neighborhood] [varchar](50) NULL,
	[Doorman] [bit] NOT NULL,
	[Garage] [bit] NOT NULL,
	[Pool] [bit] NOT NULL,
	[PetsAllowed] [bit] NOT NULL,
 CONSTRAINT [PK_BUILDING] PRIMARY KEY CLUSTERED 
(
	[BuildingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CATEGORY]    Script Date: 12/28/2019 10:29:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CATEGORY](
	[CategoryID] [int] NOT NULL,
	[CategoryDescription] [varchar](50) NOT NULL,
 CONSTRAINT [PK_CATEGORY] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[COMPANYOWNER]    Script Date: 12/28/2019 10:29:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COMPANYOWNER](
	[CompanyID] [int] NOT NULL,
	[CompanyName] [varchar](45) NOT NULL,
	[ContactPersonID] [int] NOT NULL,
 CONSTRAINT [PK_COMPANYOWNER] PRIMARY KEY CLUSTERED 
(
	[CompanyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CONDITION]    Script Date: 12/28/2019 10:29:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CONDITION](
	[ConditionID] [int] NOT NULL,
	[ConditionType] [varchar](50) NOT NULL,
 CONSTRAINT [PK_CONDITION] PRIMARY KEY CLUSTERED 
(
	[ConditionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CONTACT]    Script Date: 12/28/2019 10:29:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CONTACT](
	[ContactID] [int] NOT NULL,
	[Fname] [varchar](45) NOT NULL,
	[Lname] [varchar](45) NOT NULL,
	[CellPhone] [nchar](13) NOT NULL,
	[Email] [varchar](45) NOT NULL,
	[LogID] [varchar](45) NOT NULL,
	[LogPassword] [varchar](45) NOT NULL,
 CONSTRAINT [PK_CONTACT] PRIMARY KEY CLUSTERED 
(
	[ContactID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OWNER]    Script Date: 12/28/2019 10:29:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OWNER](
	[OwnerID] [int] NOT NULL,
	[Street] [varchar](45) NOT NULL,
	[City] [varchar](45) NOT NULL,
	[State] [varchar](6) NOT NULL,
	[Zip] [nchar](10) NOT NULL,
	[TelephoneNumber] [nchar](13) NOT NULL,
 CONSTRAINT [PK_OWNER] PRIMARY KEY CLUSTERED 
(
	[OwnerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PERSON]    Script Date: 12/28/2019 10:29:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PERSON](
	[PersonID] [int] NOT NULL,
	[Fname] [varchar](45) NOT NULL,
	[Lname] [varchar](50) NOT NULL,
	[Cellphone] [nchar](13) NOT NULL,
	[SSN] [nchar](9) NOT NULL,
	[Email] [varchar](45) NOT NULL,
	[LogID] [varchar](45) NOT NULL,
	[LogPassword] [varchar](45) NOT NULL,
 CONSTRAINT [PK_PERSON] PRIMARY KEY CLUSTERED 
(
	[PersonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RENT]    Script Date: 12/28/2019 10:29:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RENT](
	[LeaseID] [int] IDENTITY(1,1) NOT NULL,
	[BuldingID] [int] NOT NULL,
	[FloorNumber] [int] NOT NULL,
	[AptID] [int] NOT NULL,
	[TenantID] [int] NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
	[MonthlyRental] [money] NOT NULL,
	[CurrentBalance]  AS (datediff(month,[StartDate],[EndDate])*[MonthlyRental]),
 CONSTRAINT [PK_RENT] PRIMARY KEY CLUSTERED 
(
	[LeaseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[REPAIR]    Script Date: 12/28/2019 10:29:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[REPAIR](
	[RepairID] [int] NOT NULL,
	[CategoryID] [int] NOT NULL,
	[BuildingID] [int] NOT NULL,
	[FloorNumber] [int] NOT NULL,
	[AptID] [int] NOT NULL,
	[DateOfRepair] [date] NOT NULL,
	[CostOfRepair] [money] NOT NULL,
	[DescriptionOfRepair] [text] NOT NULL,
 CONSTRAINT [PK_REPAIR] PRIMARY KEY CLUSTERED 
(
	[RepairID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SUPER]    Script Date: 12/28/2019 10:29:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SUPER](
	[SuperID] [int] NOT NULL,
	[Fname] [varchar](50) NOT NULL,
	[Lname] [varchar](50) NOT NULL,
	[PhoneNumber] [nchar](15) NOT NULL,
 CONSTRAINT [PK_SUPER] PRIMARY KEY CLUSTERED 
(
	[SuperID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TENANT]    Script Date: 12/28/2019 10:29:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TENANT](
	[TenantID] [int] NOT NULL,
	[RentTransactionID] [int] NULL,
	[CurrentBalance] [int] NULL,
 CONSTRAINT [PK_TENANT] PRIMARY KEY CLUSTERED 
(
	[TenantID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[AGENCY] ([TransasctionID], [OwnerID], [BuildingID], [BoughDate], [SoldDate], [SalePrice]) VALUES (1, 6, 1, CAST(N'2016-12-01' AS Date), NULL, 5000000.0000)
INSERT [dbo].[AGENCY] ([TransasctionID], [OwnerID], [BuildingID], [BoughDate], [SoldDate], [SalePrice]) VALUES (2, 6, 2, CAST(N'2005-10-01' AS Date), NULL, 1000000.0000)
INSERT [dbo].[AGENCY] ([TransasctionID], [OwnerID], [BuildingID], [BoughDate], [SoldDate], [SalePrice]) VALUES (3, 7, 2, CAST(N'2005-10-01' AS Date), NULL, 1000000.0000)
INSERT [dbo].[AGENCY] ([TransasctionID], [OwnerID], [BuildingID], [BoughDate], [SoldDate], [SalePrice]) VALUES (4, 8, 3, CAST(N'2010-12-01' AS Date), CAST(N'2016-08-01' AS Date), 500000.0000)
INSERT [dbo].[AGENCY] ([TransasctionID], [OwnerID], [BuildingID], [BoughDate], [SoldDate], [SalePrice]) VALUES (5, 9, 3, CAST(N'2016-08-01' AS Date), CAST(N'2018-12-28' AS Date), 750000.0000)
INSERT [dbo].[AGENCY] ([TransasctionID], [OwnerID], [BuildingID], [BoughDate], [SoldDate], [SalePrice]) VALUES (6, 10, 3, CAST(N'2018-12-28' AS Date), NULL, 1250000.0000)
INSERT [dbo].[APARTMENT] ([BuildingID], [FloorNumber], [AptID], [NumberOfRooms], [ConditionID], [RentalStatus], [TenantID], [OptimalMonthRentalAmount], [NumberOfBedrooms], [Washer/Dryer], [Patio], [HardwoodFloors]) VALUES (1, 1, 1, 2, 1, N'RENTED', 3, 2500, 2, 0, 0, 1)
INSERT [dbo].[APARTMENT] ([BuildingID], [FloorNumber], [AptID], [NumberOfRooms], [ConditionID], [RentalStatus], [TenantID], [OptimalMonthRentalAmount], [NumberOfBedrooms], [Washer/Dryer], [Patio], [HardwoodFloors]) VALUES (1, 1, 2, 3, 2, N'VACANT', NULL, 2950, 3, 1, 1, 1)
INSERT [dbo].[APARTMENT] ([BuildingID], [FloorNumber], [AptID], [NumberOfRooms], [ConditionID], [RentalStatus], [TenantID], [OptimalMonthRentalAmount], [NumberOfBedrooms], [Washer/Dryer], [Patio], [HardwoodFloors]) VALUES (1, 2, 1, 3, 1, N'VACANT', NULL, 3000, 3, 0, 0, 1)
INSERT [dbo].[APARTMENT] ([BuildingID], [FloorNumber], [AptID], [NumberOfRooms], [ConditionID], [RentalStatus], [TenantID], [OptimalMonthRentalAmount], [NumberOfBedrooms], [Washer/Dryer], [Patio], [HardwoodFloors]) VALUES (1, 2, 2, 3, 1, N'RENTED', 2, 3000, 3, 0, 0, 1)
INSERT [dbo].[APARTMENT] ([BuildingID], [FloorNumber], [AptID], [NumberOfRooms], [ConditionID], [RentalStatus], [TenantID], [OptimalMonthRentalAmount], [NumberOfBedrooms], [Washer/Dryer], [Patio], [HardwoodFloors]) VALUES (2, 1, 1, 1, 4, N'VACANT', NULL, 1900, 1, 0, 0, 1)
INSERT [dbo].[APARTMENT] ([BuildingID], [FloorNumber], [AptID], [NumberOfRooms], [ConditionID], [RentalStatus], [TenantID], [OptimalMonthRentalAmount], [NumberOfBedrooms], [Washer/Dryer], [Patio], [HardwoodFloors]) VALUES (2, 1, 2, 1, 4, N'VACANT', NULL, 1900, 1, 1, 1, 1)
INSERT [dbo].[APARTMENT] ([BuildingID], [FloorNumber], [AptID], [NumberOfRooms], [ConditionID], [RentalStatus], [TenantID], [OptimalMonthRentalAmount], [NumberOfBedrooms], [Washer/Dryer], [Patio], [HardwoodFloors]) VALUES (2, 2, 1, 1, 4, N'VACANT', NULL, 1500, 1, 0, 0, 0)
INSERT [dbo].[APARTMENT] ([BuildingID], [FloorNumber], [AptID], [NumberOfRooms], [ConditionID], [RentalStatus], [TenantID], [OptimalMonthRentalAmount], [NumberOfBedrooms], [Washer/Dryer], [Patio], [HardwoodFloors]) VALUES (2, 2, 2, 2, 3, N'RENTED', 2, 1600, 2, 0, 0, 1)
INSERT [dbo].[APARTMENT] ([BuildingID], [FloorNumber], [AptID], [NumberOfRooms], [ConditionID], [RentalStatus], [TenantID], [OptimalMonthRentalAmount], [NumberOfBedrooms], [Washer/Dryer], [Patio], [HardwoodFloors]) VALUES (2, 3, 1, 2, 3, N'RENTED', 3, 1600, 2, 0, 0, 1)
INSERT [dbo].[APARTMENT] ([BuildingID], [FloorNumber], [AptID], [NumberOfRooms], [ConditionID], [RentalStatus], [TenantID], [OptimalMonthRentalAmount], [NumberOfBedrooms], [Washer/Dryer], [Patio], [HardwoodFloors]) VALUES (2, 3, 2, 2, 3, N'RENTED', 4, 1750, 2, 0, 0, 1)
INSERT [dbo].[APARTMENT] ([BuildingID], [FloorNumber], [AptID], [NumberOfRooms], [ConditionID], [RentalStatus], [TenantID], [OptimalMonthRentalAmount], [NumberOfBedrooms], [Washer/Dryer], [Patio], [HardwoodFloors]) VALUES (2, 4, 1, 2, 4, N'VACANT', NULL, 1900, 2, 0, 0, 1)
INSERT [dbo].[APARTMENT] ([BuildingID], [FloorNumber], [AptID], [NumberOfRooms], [ConditionID], [RentalStatus], [TenantID], [OptimalMonthRentalAmount], [NumberOfBedrooms], [Washer/Dryer], [Patio], [HardwoodFloors]) VALUES (2, 4, 2, 2, 3, N'VACANT', NULL, 1900, 2, 0, 0, 1)
INSERT [dbo].[APARTMENT] ([BuildingID], [FloorNumber], [AptID], [NumberOfRooms], [ConditionID], [RentalStatus], [TenantID], [OptimalMonthRentalAmount], [NumberOfBedrooms], [Washer/Dryer], [Patio], [HardwoodFloors]) VALUES (3, 1, 1, 5, 1, N'RENTED', 1, 3500, 5, 1, 1, 1)
INSERT [dbo].[BUILDING] ([BuildingID], [Street], [City], [State], [Zip], [NumberOfFloors], [NumberOfApartments], [ConditionID], [SuperID], [Neighborhood], [Doorman], [Garage], [Pool], [PetsAllowed]) VALUES (1, N'606 W 57th St', N'Manhattan', N'NY', N'10019     ', 2, 4, 1, 1, N'Hell''s Kitchen', 1, 1, 0, 1)
INSERT [dbo].[BUILDING] ([BuildingID], [Street], [City], [State], [Zip], [NumberOfFloors], [NumberOfApartments], [ConditionID], [SuperID], [Neighborhood], [Doorman], [Garage], [Pool], [PetsAllowed]) VALUES (2, N'235 W 48th St', N'Manhattan', N'NY', N'10036     ', 4, 8, 1, 2, N' Times Square', 0, 0, 0, 1)
INSERT [dbo].[BUILDING] ([BuildingID], [Street], [City], [State], [Zip], [NumberOfFloors], [NumberOfApartments], [ConditionID], [SuperID], [Neighborhood], [Doorman], [Garage], [Pool], [PetsAllowed]) VALUES (3, N'4545 Center Blvd', N'Long Island City', N'NY', N'11101     ', 1, 1, 2, 3, N'', 0, 1, 1, 0)
INSERT [dbo].[CATEGORY] ([CategoryID], [CategoryDescription]) VALUES (1, N'Electrical')
INSERT [dbo].[CATEGORY] ([CategoryID], [CategoryDescription]) VALUES (2, N'Plumbing')
INSERT [dbo].[CATEGORY] ([CategoryID], [CategoryDescription]) VALUES (3, N'General Maintenance')
INSERT [dbo].[CATEGORY] ([CategoryID], [CategoryDescription]) VALUES (4, N'Appliances')
INSERT [dbo].[CATEGORY] ([CategoryID], [CategoryDescription]) VALUES (5, N'Flooring')
INSERT [dbo].[COMPANYOWNER] ([CompanyID], [CompanyName], [ContactPersonID]) VALUES (6, N'Laz Holding', 1)
INSERT [dbo].[COMPANYOWNER] ([CompanyID], [CompanyName], [ContactPersonID]) VALUES (7, N'Kuvvet Mira Harp Okulu', 2)
INSERT [dbo].[COMPANYOWNER] ([CompanyID], [CompanyName], [ContactPersonID]) VALUES (8, N'Volvox', 3)
INSERT [dbo].[COMPANYOWNER] ([CompanyID], [CompanyName], [ContactPersonID]) VALUES (9, N'Galatasaray', 4)
INSERT [dbo].[COMPANYOWNER] ([CompanyID], [CompanyName], [ContactPersonID]) VALUES (10, N'The Flash LTD', 5)
INSERT [dbo].[CONDITION] ([ConditionID], [ConditionType]) VALUES (1, N'New')
INSERT [dbo].[CONDITION] ([ConditionID], [ConditionType]) VALUES (2, N'Excellent')
INSERT [dbo].[CONDITION] ([ConditionID], [ConditionType]) VALUES (3, N'Good')
INSERT [dbo].[CONDITION] ([ConditionID], [ConditionType]) VALUES (4, N'Fair')
INSERT [dbo].[CONDITION] ([ConditionID], [ConditionType]) VALUES (5, N'Poor')
INSERT [dbo].[CONTACT] ([ContactID], [Fname], [Lname], [CellPhone], [Email], [LogID], [LogPassword]) VALUES (1, N'Fatma', N'Laz', N'844-251-2540 ', N'Flaz@gmail.com', N'Flaz', N'123321')
INSERT [dbo].[CONTACT] ([ContactID], [Fname], [Lname], [CellPhone], [Email], [LogID], [LogPassword]) VALUES (2, N'Sagopa', N'Kajmer', N'844-852-6411 ', N'sago@gmail.com', N'sagocuyuz', N'123we3')
INSERT [dbo].[CONTACT] ([ContactID], [Fname], [Lname], [CellPhone], [Email], [LogID], [LogPassword]) VALUES (3, N'Sebnem', N'Ferah', N'844-876-4839 ', N'sebocuyuz@gmail.com', N'sebocuyuz', N'1230321')
INSERT [dbo].[CONTACT] ([ContactID], [Fname], [Lname], [CellPhone], [Email], [LogID], [LogPassword]) VALUES (4, N'Fatih', N'Terim', N' 844-445-9408', N'Fatih@gmail.com', N'fatih_gs', N'gslifatih')
INSERT [dbo].[CONTACT] ([ContactID], [Fname], [Lname], [CellPhone], [Email], [LogID], [LogPassword]) VALUES (5, N'Mehmen', N'Simsek', N'347-318-1376 ', N'memo@gmai.com', N'mehmetSimsek', N'me12met12')
INSERT [dbo].[OWNER] ([OwnerID], [Street], [City], [State], [Zip], [TelephoneNumber]) VALUES (1, N'8002 5th Avenue', N'Brooklyn', N'NY', N'10462     ', N'646-829-7381 ')
INSERT [dbo].[OWNER] ([OwnerID], [Street], [City], [State], [Zip], [TelephoneNumber]) VALUES (2, N'1229 Avenue Y', N'Brooklyn', N'NY', N'11235     ', N'646-726-7414 ')
INSERT [dbo].[OWNER] ([OwnerID], [Street], [City], [State], [Zip], [TelephoneNumber]) VALUES (3, N'864 45St', N'Brooklyn', N'NY', N'10432     ', N'938-954-9986 ')
INSERT [dbo].[OWNER] ([OwnerID], [Street], [City], [State], [Zip], [TelephoneNumber]) VALUES (4, N'325 31st', N'Brooklyn', N'NY', N'10564     ', N'213-834-7231 ')
INSERT [dbo].[OWNER] ([OwnerID], [Street], [City], [State], [Zip], [TelephoneNumber]) VALUES (5, N'326 31st', N'Brooklyn', N'NY', N'10564     ', N'231-324-1222 ')
INSERT [dbo].[OWNER] ([OwnerID], [Street], [City], [State], [Zip], [TelephoneNumber]) VALUES (6, N'10 Halletts Point', N'Astoria', N'NY', N'11102     ', N'844-251-2540 ')
INSERT [dbo].[OWNER] ([OwnerID], [Street], [City], [State], [Zip], [TelephoneNumber]) VALUES (7, N'3157 31st St', N'Astoria', N'NY', N'11106     ', N'844-852-6411 ')
INSERT [dbo].[OWNER] ([OwnerID], [Street], [City], [State], [Zip], [TelephoneNumber]) VALUES (8, N'4545 Center Blvd', N'Long Island City', N'NY', N'11101     ', N'844-876-4839 ')
INSERT [dbo].[OWNER] ([OwnerID], [Street], [City], [State], [Zip], [TelephoneNumber]) VALUES (9, N'606 W 57th St', N'Manhattan', N'NY', N'10019     ', N' 844-445-9408')
INSERT [dbo].[OWNER] ([OwnerID], [Street], [City], [State], [Zip], [TelephoneNumber]) VALUES (10, N'235 W 48th St', N'Manhattan', N'NY', N'10036     ', N' 347-318-1376')
INSERT [dbo].[PERSON] ([PersonID], [Fname], [Lname], [Cellphone], [SSN], [Email], [LogID], [LogPassword]) VALUES (1, N'Seyran', N'Say', N'646-829-7381 ', N'123456789', N'seyrans@gmail.com', N'seyrans', N'klkeqw')
INSERT [dbo].[PERSON] ([PersonID], [Fname], [Lname], [Cellphone], [SSN], [Email], [LogID], [LogPassword]) VALUES (2, N'Muhammet', N'Varol', N'646-726-7414 ', N'121456963', N'ovarol@gmail.com', N'ovarol', N'weq')
INSERT [dbo].[PERSON] ([PersonID], [Fname], [Lname], [Cellphone], [SSN], [Email], [LogID], [LogPassword]) VALUES (3, N'Kaisey', N'Mellon', N'938-954-9986 ', N'123938210', N'kmellon@gmail.com', N'kmellon', N'2193KKIweq')
INSERT [dbo].[PERSON] ([PersonID], [Fname], [Lname], [Cellphone], [SSN], [Email], [LogID], [LogPassword]) VALUES (4, N'Max', N'Tornado', N'213-834-7231 ', N'219283998', N'mtornado@gmail.com', N'qwe99', N'LLLLKI1234321')
INSERT [dbo].[PERSON] ([PersonID], [Fname], [Lname], [Cellphone], [SSN], [Email], [LogID], [LogPassword]) VALUES (5, N'Ali', N'Sokuk', N'231-324-1222 ', N'213921990', N'asokuk@gmail.com', N'Asokuk', N'12344321ali')
SET IDENTITY_INSERT [dbo].[RENT] ON 

INSERT [dbo].[RENT] ([LeaseID], [BuldingID], [FloorNumber], [AptID], [TenantID], [StartDate], [EndDate], [MonthlyRental]) VALUES (9, 1, 1, 1, 3, CAST(N'2017-12-28' AS Date), CAST(N'2018-12-28' AS Date), 2200.0000)
INSERT [dbo].[RENT] ([LeaseID], [BuldingID], [FloorNumber], [AptID], [TenantID], [StartDate], [EndDate], [MonthlyRental]) VALUES (13, 1, 2, 2, 2, CAST(N'2017-12-01' AS Date), CAST(N'2020-12-01' AS Date), 3000.0000)
INSERT [dbo].[RENT] ([LeaseID], [BuldingID], [FloorNumber], [AptID], [TenantID], [StartDate], [EndDate], [MonthlyRental]) VALUES (15, 2, 2, 2, 2, CAST(N'2016-02-12' AS Date), CAST(N'2019-12-02' AS Date), 1500.0000)
INSERT [dbo].[RENT] ([LeaseID], [BuldingID], [FloorNumber], [AptID], [TenantID], [StartDate], [EndDate], [MonthlyRental]) VALUES (16, 2, 3, 1, 3, CAST(N'2018-10-12' AS Date), CAST(N'2020-10-12' AS Date), 1600.0000)
INSERT [dbo].[RENT] ([LeaseID], [BuldingID], [FloorNumber], [AptID], [TenantID], [StartDate], [EndDate], [MonthlyRental]) VALUES (20, 2, 3, 2, 4, CAST(N'2016-12-12' AS Date), CAST(N'2020-12-12' AS Date), 1600.0000)
INSERT [dbo].[RENT] ([LeaseID], [BuldingID], [FloorNumber], [AptID], [TenantID], [StartDate], [EndDate], [MonthlyRental]) VALUES (21, 3, 1, 1, 1, CAST(N'2018-01-01' AS Date), CAST(N'2021-01-01' AS Date), 3000.0000)
SET IDENTITY_INSERT [dbo].[RENT] OFF
INSERT [dbo].[REPAIR] ([RepairID], [CategoryID], [BuildingID], [FloorNumber], [AptID], [DateOfRepair], [CostOfRepair], [DescriptionOfRepair]) VALUES (1, 1, 1, 1, 1, CAST(N'2019-12-22' AS Date), 500.0000, N'Electrical Problem on Lights, All the lights has been changed')
INSERT [dbo].[REPAIR] ([RepairID], [CategoryID], [BuildingID], [FloorNumber], [AptID], [DateOfRepair], [CostOfRepair], [DescriptionOfRepair]) VALUES (2, 5, 1, 1, 1, CAST(N'2005-10-15' AS Date), 1000.0000, N'Hardfloor Celaning')
INSERT [dbo].[REPAIR] ([RepairID], [CategoryID], [BuildingID], [FloorNumber], [AptID], [DateOfRepair], [CostOfRepair], [DescriptionOfRepair]) VALUES (3, 1, 3, 1, 1, CAST(N'2019-12-01' AS Date), 3000.0000, N'Electric system has been installed on the whole apartment')
INSERT [dbo].[SUPER] ([SuperID], [Fname], [Lname], [PhoneNumber]) VALUES (1, N'Marko', N'VanBasten', N'646-693-6366   ')
INSERT [dbo].[SUPER] ([SuperID], [Fname], [Lname], [PhoneNumber]) VALUES (2, N'John', N'Smith', N'646-893-5996   ')
INSERT [dbo].[SUPER] ([SuperID], [Fname], [Lname], [PhoneNumber]) VALUES (3, N'Mike', N'Baran', N'212-269-6933   ')
INSERT [dbo].[TENANT] ([TenantID], [RentTransactionID], [CurrentBalance]) VALUES (1, 3, NULL)
INSERT [dbo].[TENANT] ([TenantID], [RentTransactionID], [CurrentBalance]) VALUES (2, 1, NULL)
INSERT [dbo].[TENANT] ([TenantID], [RentTransactionID], [CurrentBalance]) VALUES (3, 2, NULL)
INSERT [dbo].[TENANT] ([TenantID], [RentTransactionID], [CurrentBalance]) VALUES (4, 4, NULL)
/****** Object:  Index [IX_APARTMENT]    Script Date: 12/28/2019 10:29:00 PM ******/
ALTER TABLE [dbo].[APARTMENT] ADD  CONSTRAINT [IX_APARTMENT] UNIQUE NONCLUSTERED 
(
	[BuildingID] ASC,
	[FloorNumber] ASC,
	[AptID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_BUILDING]    Script Date: 12/28/2019 10:29:00 PM ******/
ALTER TABLE [dbo].[BUILDING] ADD  CONSTRAINT [IX_BUILDING] UNIQUE NONCLUSTERED 
(
	[SuperID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [NonClusteredIndex-20191228-133407]    Script Date: 12/28/2019 10:29:00 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [NonClusteredIndex-20191228-133407] ON [dbo].[COMPANYOWNER]
(
	[ContactPersonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_PERSON_LogID]    Script Date: 12/28/2019 10:29:00 PM ******/
ALTER TABLE [dbo].[PERSON] ADD  CONSTRAINT [IX_PERSON_LogID] UNIQUE NONCLUSTERED 
(
	[LogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_PERSON_SSN]    Script Date: 12/28/2019 10:29:00 PM ******/
ALTER TABLE [dbo].[PERSON] ADD  CONSTRAINT [IX_PERSON_SSN] UNIQUE NONCLUSTERED 
(
	[SSN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AGENCY]  WITH NOCHECK ADD  CONSTRAINT [FK_AGENCY_BUILDING] FOREIGN KEY([BuildingID])
REFERENCES [dbo].[BUILDING] ([BuildingID])
GO
ALTER TABLE [dbo].[AGENCY] CHECK CONSTRAINT [FK_AGENCY_BUILDING]
GO
ALTER TABLE [dbo].[AGENCY]  WITH CHECK ADD  CONSTRAINT [FK_AGENCY_OWNER] FOREIGN KEY([OwnerID])
REFERENCES [dbo].[OWNER] ([OwnerID])
GO
ALTER TABLE [dbo].[AGENCY] CHECK CONSTRAINT [FK_AGENCY_OWNER]
GO
ALTER TABLE [dbo].[APARTMENT]  WITH NOCHECK ADD  CONSTRAINT [FK_APARTMENT_BUILDING1] FOREIGN KEY([BuildingID])
REFERENCES [dbo].[BUILDING] ([BuildingID])
GO
ALTER TABLE [dbo].[APARTMENT] CHECK CONSTRAINT [FK_APARTMENT_BUILDING1]
GO
ALTER TABLE [dbo].[APARTMENT]  WITH CHECK ADD  CONSTRAINT [FK_APARTMENT_CONDITION] FOREIGN KEY([ConditionID])
REFERENCES [dbo].[CONDITION] ([ConditionID])
GO
ALTER TABLE [dbo].[APARTMENT] CHECK CONSTRAINT [FK_APARTMENT_CONDITION]
GO
ALTER TABLE [dbo].[BUILDING]  WITH CHECK ADD  CONSTRAINT [FK_BUILDING_CONDITION] FOREIGN KEY([ConditionID])
REFERENCES [dbo].[CONDITION] ([ConditionID])
GO
ALTER TABLE [dbo].[BUILDING] CHECK CONSTRAINT [FK_BUILDING_CONDITION]
GO
ALTER TABLE [dbo].[BUILDING]  WITH CHECK ADD  CONSTRAINT [FK_BUILDING_SUPER] FOREIGN KEY([SuperID])
REFERENCES [dbo].[SUPER] ([SuperID])
GO
ALTER TABLE [dbo].[BUILDING] CHECK CONSTRAINT [FK_BUILDING_SUPER]
GO
ALTER TABLE [dbo].[COMPANYOWNER]  WITH CHECK ADD  CONSTRAINT [FK_COMPANYOWNER_CONTACT] FOREIGN KEY([ContactPersonID])
REFERENCES [dbo].[CONTACT] ([ContactID])
GO
ALTER TABLE [dbo].[COMPANYOWNER] CHECK CONSTRAINT [FK_COMPANYOWNER_CONTACT]
GO
ALTER TABLE [dbo].[COMPANYOWNER]  WITH CHECK ADD  CONSTRAINT [FK_COMPANYOWNER_OWNER] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[OWNER] ([OwnerID])
GO
ALTER TABLE [dbo].[COMPANYOWNER] CHECK CONSTRAINT [FK_COMPANYOWNER_OWNER]
GO
ALTER TABLE [dbo].[PERSON]  WITH CHECK ADD  CONSTRAINT [FK_PERSON_OWNER] FOREIGN KEY([PersonID])
REFERENCES [dbo].[OWNER] ([OwnerID])
GO
ALTER TABLE [dbo].[PERSON] CHECK CONSTRAINT [FK_PERSON_OWNER]
GO
ALTER TABLE [dbo].[RENT]  WITH NOCHECK ADD  CONSTRAINT [FK_RENT_APARTMENT] FOREIGN KEY([BuldingID], [FloorNumber], [AptID])
REFERENCES [dbo].[APARTMENT] ([BuildingID], [FloorNumber], [AptID])
GO
ALTER TABLE [dbo].[RENT] CHECK CONSTRAINT [FK_RENT_APARTMENT]
GO
ALTER TABLE [dbo].[RENT]  WITH NOCHECK ADD  CONSTRAINT [FK_RENT_TENANT] FOREIGN KEY([TenantID])
REFERENCES [dbo].[TENANT] ([TenantID])
GO
ALTER TABLE [dbo].[RENT] CHECK CONSTRAINT [FK_RENT_TENANT]
GO
ALTER TABLE [dbo].[REPAIR]  WITH CHECK ADD  CONSTRAINT [FK_REPAIR_APARTMENT] FOREIGN KEY([BuildingID], [FloorNumber], [AptID])
REFERENCES [dbo].[APARTMENT] ([BuildingID], [FloorNumber], [AptID])
GO
ALTER TABLE [dbo].[REPAIR] CHECK CONSTRAINT [FK_REPAIR_APARTMENT]
GO
ALTER TABLE [dbo].[REPAIR]  WITH CHECK ADD  CONSTRAINT [FK_REPAIR_CATEGORY] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[CATEGORY] ([CategoryID])
GO
ALTER TABLE [dbo].[REPAIR] CHECK CONSTRAINT [FK_REPAIR_CATEGORY]
GO
ALTER TABLE [dbo].[TENANT]  WITH NOCHECK ADD  CONSTRAINT [FK_TENANT_COMPANYOWNER] FOREIGN KEY([TenantID])
REFERENCES [dbo].[COMPANYOWNER] ([CompanyID])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[TENANT] NOCHECK CONSTRAINT [FK_TENANT_COMPANYOWNER]
GO
ALTER TABLE [dbo].[TENANT]  WITH NOCHECK ADD  CONSTRAINT [FK_TENANT_PERSON] FOREIGN KEY([TenantID])
REFERENCES [dbo].[PERSON] ([PersonID])
GO
ALTER TABLE [dbo].[TENANT] CHECK CONSTRAINT [FK_TENANT_PERSON]
GO
ALTER TABLE [dbo].[APARTMENT]  WITH CHECK ADD  CONSTRAINT [CK_APARTMENT_RentalStatus] CHECK  (([RentalStatus]='RENTED' OR [RentalStatus]='VACANT'))
GO
ALTER TABLE [dbo].[APARTMENT] CHECK CONSTRAINT [CK_APARTMENT_RentalStatus]
GO
ALTER TABLE [dbo].[RENT]  WITH CHECK ADD  CONSTRAINT [CK_RENT_ENDLease] CHECK  ((datediff(month,[StartDate],[EndDate])>=(6)))
GO
ALTER TABLE [dbo].[RENT] CHECK CONSTRAINT [CK_RENT_ENDLease]
GO
USE [master]
GO
ALTER DATABASE [FinalProjectMuhammet] SET  READ_WRITE 
GO


