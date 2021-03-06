USE [master]
GO
/****** Object:  Database [NIDAS_SHOES]    Script Date: 4/19/2022 5:40:05 PM ******/
CREATE DATABASE [NIDAS_SHOES]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'NIDAS_SHOES', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\NIDAS_SHOES.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'NIDAS_SHOES_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\NIDAS_SHOES_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [NIDAS_SHOES].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [NIDAS_SHOES] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [NIDAS_SHOES] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [NIDAS_SHOES] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [NIDAS_SHOES] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [NIDAS_SHOES] SET ARITHABORT OFF 
GO
ALTER DATABASE [NIDAS_SHOES] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [NIDAS_SHOES] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [NIDAS_SHOES] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [NIDAS_SHOES] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [NIDAS_SHOES] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [NIDAS_SHOES] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [NIDAS_SHOES] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [NIDAS_SHOES] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [NIDAS_SHOES] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [NIDAS_SHOES] SET  DISABLE_BROKER 
GO
ALTER DATABASE [NIDAS_SHOES] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [NIDAS_SHOES] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [NIDAS_SHOES] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [NIDAS_SHOES] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [NIDAS_SHOES] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [NIDAS_SHOES] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [NIDAS_SHOES] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [NIDAS_SHOES] SET RECOVERY FULL 
GO
ALTER DATABASE [NIDAS_SHOES] SET  MULTI_USER 
GO
ALTER DATABASE [NIDAS_SHOES] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [NIDAS_SHOES] SET DB_CHAINING OFF 
GO
ALTER DATABASE [NIDAS_SHOES] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [NIDAS_SHOES] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'NIDAS_SHOES', N'ON'
GO
USE [NIDAS_SHOES]
GO
/****** Object:  User [NhatHL]    Script Date: 4/19/2022 5:40:05 PM ******/
CREATE USER [NhatHL] FOR LOGIN [NhatHL] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [nhat]    Script Date: 4/19/2022 5:40:05 PM ******/
CREATE USER [nhat] FOR LOGIN [nhat] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [nhat]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [nhat]
GO
ALTER ROLE [db_securityadmin] ADD MEMBER [nhat]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [nhat]
GO
ALTER ROLE [db_backupoperator] ADD MEMBER [nhat]
GO
ALTER ROLE [db_datareader] ADD MEMBER [nhat]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [nhat]
GO
ALTER ROLE [db_denydatareader] ADD MEMBER [nhat]
GO
ALTER ROLE [db_denydatawriter] ADD MEMBER [nhat]
GO
/****** Object:  UserDefinedTableType [dbo].[BaseParamType]    Script Date: 4/19/2022 5:40:05 PM ******/
CREATE TYPE [dbo].[BaseParamType] AS TABLE(
	[Search] [nvarchar](max) NULL,
	[PageSize] [int] NULL,
	[PageNumber] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[OrderDetails]    Script Date: 4/19/2022 5:40:05 PM ******/
CREATE TYPE [dbo].[OrderDetails] AS TABLE(
	[Id] [int] NULL,
	[OrderID] [int] NULL,
	[ProductDetailID] [int] NULL,
	[Price] [decimal](18, 0) NULL,
	[Quantity] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[ProductImages]    Script Date: 4/19/2022 5:40:05 PM ******/
CREATE TYPE [dbo].[ProductImages] AS TABLE(
	[Id] [int] NULL,
	[ProductDetailId] [int] NULL,
	[Image] [nvarchar](max) NULL
)
GO
/****** Object:  Table [dbo].[Discount]    Script Date: 4/19/2022 5:40:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Discount](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](255) NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[Rate] [int] NULL,
	[Description] [nvarchar](255) NULL,
 CONSTRAINT [PK_Discount] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FeedBack]    Script Date: 4/19/2022 5:40:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FeedBack](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[Title] [nvarchar](255) NULL,
	[Content] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NULL,
	[ParentFBID] [int] NULL,
 CONSTRAINT [PK_FeedBack] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MasterData]    Script Date: 4/19/2022 5:40:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MasterData](
	[ID] [int] NULL,
	[Code] [nvarchar](255) NULL,
	[Name] [nvarchar](255) NULL,
	[Value] [nvarchar](max) NULL,
	[Link] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 4/19/2022 5:40:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NULL,
	[EmployeeID] [int] NULL,
	[PaymentID] [int] NOT NULL,
	[DiscountID] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[Description] [nvarchar](max) NULL,
	[Note] [nvarchar](max) NULL,
	[OrderStatusID] [int] NULL,
	[CustomerName] [nvarchar](255) NULL,
	[CustomerMobile] [nvarchar](255) NULL,
	[CustomerEmail] [nvarchar](255) NULL,
	[CustomerAddress] [nvarchar](max) NULL,
	[ModifyDate] [datetime] NULL,
	[TotalCost] [decimal](18, 0) NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 4/19/2022 5:40:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NULL,
	[ProductDetailID] [int] NULL,
	[Price] [decimal](18, 0) NULL,
	[Quantity] [int] NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderStatus]    Script Date: 4/19/2022 5:40:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderStatus](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 4/19/2022 5:40:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
 CONSTRAINT [PK_Payment] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 4/19/2022 5:40:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductCategoryID] [int] NULL,
	[Code] [nvarchar](255) NULL,
	[Name] [nvarchar](255) NULL,
	[Title] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[Status] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[Manufacturer] [nvarchar](max) NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCategory]    Script Date: 4/19/2022 5:40:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ParentID] [int] NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](255) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_ProductCategory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductColor]    Script Date: 4/19/2022 5:40:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductColor](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[Code] [nvarchar](255) NULL,
 CONSTRAINT [PK_Color] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductDetail]    Script Date: 4/19/2022 5:40:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductDetail](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NULL,
	[SizeID] [int] NULL,
	[ColorID] [int] NULL,
	[Quantity] [int] NULL,
	[Image] [nvarchar](255) NULL,
 CONSTRAINT [PK_ProductDetail] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductImage]    Script Date: 4/19/2022 5:40:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductImage](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NULL,
	[Image] [nvarchar](255) NULL,
 CONSTRAINT [PK_Images] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductPrice]    Script Date: 4/19/2022 5:40:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductPrice](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ImportPrice] [decimal](18, 0) NULL,
	[ExportPrice] [decimal](18, 0) NULL,
	[CreatedDate] [datetime] NULL,
	[ProductDetailID] [int] NULL,
 CONSTRAINT [PK_Stock] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductReview]    Script Date: 4/19/2022 5:40:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductReview](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[ProductID] [int] NULL,
	[Star] [float] NULL,
	[Favorite] [bit] NULL,
	[Content] [nvarchar](500) NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_ProductReview] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductSize]    Script Date: 4/19/2022 5:40:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductSize](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
 CONSTRAINT [PK_Size] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Receipt]    Script Date: 4/19/2022 5:40:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Receipt](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[Note] [nvarchar](max) NULL,
	[SupplyID] [int] NULL,
 CONSTRAINT [PK_Receipt] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReceiptDetail]    Script Date: 4/19/2022 5:40:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReceiptDetail](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ReceiptID] [int] NULL,
	[ProductDetailID] [int] NULL,
	[ImportQuantity] [int] NULL,
	[ImportPrice] [decimal](18, 0) NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_ReceiptDetail] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rule]    Script Date: 4/19/2022 5:40:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rule](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
 CONSTRAINT [PK_Rule] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shop]    Script Date: 4/19/2022 5:40:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shop](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[Logo] [nvarchar](255) NULL,
	[Slogan] [nvarchar](255) NULL,
	[Address] [nvarchar](255) NULL,
	[PhoneNumber] [nvarchar](255) NULL,
	[Email] [nvarchar](255) NULL,
 CONSTRAINT [PK_Shop] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Slide]    Script Date: 4/19/2022 5:40:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slide](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Image] [nvarchar](max) NULL,
	[DisplayOrder] [int] NULL,
	[Link] [nvarchar](max) NULL,
	[Title] [nvarchar](255) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Slide] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supply]    Script Date: 4/19/2022 5:40:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supply](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[Phone] [nvarchar](50) NULL,
	[Address] [nvarchar](255) NULL,
	[Description] [nvarchar](255) NULL,
 CONSTRAINT [PK_Supply] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 4/19/2022 5:40:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RuleID] [int] NULL,
	[UserName] [nvarchar](255) NULL,
	[HashedPassword] [nvarchar](255) NULL,
	[Name] [nvarchar](255) NULL,
	[Email] [nvarchar](255) NULL,
	[Address] [nvarchar](255) NULL,
	[PhoneNumber] [nvarchar](50) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Discount] ON 

INSERT [dbo].[Discount] ([ID], [Code], [StartDate], [EndDate], [Rate], [Description]) VALUES (1, N'code11', CAST(N'2022-01-01T11:48:00.000' AS DateTime), CAST(N'2022-09-30T12:49:00.000' AS DateTime), 10, N'mota nè')
INSERT [dbo].[Discount] ([ID], [Code], [StartDate], [EndDate], [Rate], [Description]) VALUES (2, N'code2', CAST(N'2022-08-01T00:00:00.000' AS DateTime), CAST(N'2022-09-01T00:00:00.000' AS DateTime), 12, N'mota nè')
INSERT [dbo].[Discount] ([ID], [Code], [StartDate], [EndDate], [Rate], [Description]) VALUES (3, N'code3', CAST(N'2022-08-01T00:00:00.000' AS DateTime), CAST(N'2022-09-01T00:00:00.000' AS DateTime), 25, N'mota nè')
INSERT [dbo].[Discount] ([ID], [Code], [StartDate], [EndDate], [Rate], [Description]) VALUES (4, N'code4', CAST(N'2022-08-01T00:00:00.000' AS DateTime), CAST(N'2022-09-01T00:00:00.000' AS DateTime), 25, N'mota nè')
INSERT [dbo].[Discount] ([ID], [Code], [StartDate], [EndDate], [Rate], [Description]) VALUES (6, N'p', CAST(N'2022-03-08T18:04:00.000' AS DateTime), CAST(N'2022-07-09T16:03:00.000' AS DateTime), 80, N'vì đẹp trai nên giảm siêu sâu')
INSERT [dbo].[Discount] ([ID], [Code], [StartDate], [EndDate], [Rate], [Description]) VALUES (7, N'demo', CAST(N'2022-03-08T18:04:00.000' AS DateTime), CAST(N'2022-03-09T18:04:00.000' AS DateTime), 10, NULL)
SET IDENTITY_INSERT [dbo].[Discount] OFF
GO
SET IDENTITY_INSERT [dbo].[FeedBack] ON 

INSERT [dbo].[FeedBack] ([ID], [UserID], [Title], [Content], [CreatedDate], [ParentFBID]) VALUES (1, 1, N'tiêu đề gửi ', N'noi dung', CAST(N'2022-03-08T11:26:59.860' AS DateTime), NULL)
INSERT [dbo].[FeedBack] ([ID], [UserID], [Title], [Content], [CreatedDate], [ParentFBID]) VALUES (2, 2, N'ádf', N'sdaf', CAST(N'2022-03-08T11:26:59.860' AS DateTime), 1)
INSERT [dbo].[FeedBack] ([ID], [UserID], [Title], [Content], [CreatedDate], [ParentFBID]) VALUES (3, 2, N'gsdf', N'gsdfg', CAST(N'2022-03-08T11:26:59.860' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[FeedBack] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([ID], [CustomerID], [EmployeeID], [PaymentID], [DiscountID], [CreatedDate], [Description], [Note], [OrderStatusID], [CustomerName], [CustomerMobile], [CustomerEmail], [CustomerAddress], [ModifyDate], [TotalCost]) VALUES (2, 0, 1, 0, 0, CAST(N'2022-01-23T23:30:21.780' AS DateTime), NULL, NULL, 4, N'Admin2345', NULL, N'holongnhat2000@gmail.com', NULL, CAST(N'2021-12-01T11:41:40.123' AS DateTime), CAST(100000 AS Decimal(18, 0)))
INSERT [dbo].[Order] ([ID], [CustomerID], [EmployeeID], [PaymentID], [DiscountID], [CreatedDate], [Description], [Note], [OrderStatusID], [CustomerName], [CustomerMobile], [CustomerEmail], [CustomerAddress], [ModifyDate], [TotalCost]) VALUES (3, 0, NULL, 0, 0, CAST(N'2022-01-23T23:51:05.030' AS DateTime), NULL, NULL, 3, N'2345', NULL, N'holongnhat2000@gmail.com', NULL, CAST(N'2021-12-01T11:41:40.123' AS DateTime), CAST(240000 AS Decimal(18, 0)))
INSERT [dbo].[Order] ([ID], [CustomerID], [EmployeeID], [PaymentID], [DiscountID], [CreatedDate], [Description], [Note], [OrderStatusID], [CustomerName], [CustomerMobile], [CustomerEmail], [CustomerAddress], [ModifyDate], [TotalCost]) VALUES (4, 1, NULL, 0, 0, CAST(N'2022-02-23T23:52:53.763' AS DateTime), NULL, NULL, 4, N'2345gh', NULL, N'holongnhat2000@gmail.com', NULL, CAST(N'2022-02-01T11:41:34.963' AS DateTime), CAST(240000 AS Decimal(18, 0)))
INSERT [dbo].[Order] ([ID], [CustomerID], [EmployeeID], [PaymentID], [DiscountID], [CreatedDate], [Description], [Note], [OrderStatusID], [CustomerName], [CustomerMobile], [CustomerEmail], [CustomerAddress], [ModifyDate], [TotalCost]) VALUES (5, 1, 2, 0, 0, CAST(N'2022-01-23T23:55:47.350' AS DateTime), NULL, NULL, 2, N'dfgh', NULL, N'holongnhat2000@gmail.com', NULL, CAST(N'2021-12-01T11:41:40.123' AS DateTime), CAST(100000 AS Decimal(18, 0)))
INSERT [dbo].[Order] ([ID], [CustomerID], [EmployeeID], [PaymentID], [DiscountID], [CreatedDate], [Description], [Note], [OrderStatusID], [CustomerName], [CustomerMobile], [CustomerEmail], [CustomerAddress], [ModifyDate], [TotalCost]) VALUES (6, 3, NULL, 0, 0, CAST(N'2022-01-24T00:42:49.510' AS DateTime), NULL, N'ádfgsdg', 2, N'fdgh', N'0866721300', N'324165', N'Hà Nội', CAST(N'2022-02-01T11:41:34.963' AS DateTime), CAST(240000 AS Decimal(18, 0)))
INSERT [dbo].[Order] ([ID], [CustomerID], [EmployeeID], [PaymentID], [DiscountID], [CreatedDate], [Description], [Note], [OrderStatusID], [CustomerName], [CustomerMobile], [CustomerEmail], [CustomerAddress], [ModifyDate], [TotalCost]) VALUES (7, 3, 2, 1, 0, CAST(N'2022-01-24T00:59:24.747' AS DateTime), NULL, N'fsdgdfgsgfsfdg', 2, N'dfgh', N'0866721300', N'324165', N'Hà Nội', CAST(N'2021-12-01T11:41:40.123' AS DateTime), CAST(100000 AS Decimal(18, 0)))
INSERT [dbo].[Order] ([ID], [CustomerID], [EmployeeID], [PaymentID], [DiscountID], [CreatedDate], [Description], [Note], [OrderStatusID], [CustomerName], [CustomerMobile], [CustomerEmail], [CustomerAddress], [ModifyDate], [TotalCost]) VALUES (8, 1, 2, 0, 0, CAST(N'2022-01-24T01:24:53.560' AS DateTime), NULL, N'', 2, N'nguyen van a', N'', N'', N'', CAST(N'2021-12-01T11:41:40.123' AS DateTime), CAST(100000 AS Decimal(18, 0)))
INSERT [dbo].[Order] ([ID], [CustomerID], [EmployeeID], [PaymentID], [DiscountID], [CreatedDate], [Description], [Note], [OrderStatusID], [CustomerName], [CustomerMobile], [CustomerEmail], [CustomerAddress], [ModifyDate], [TotalCost]) VALUES (9, 1, 2, 0, 0, CAST(N'2022-03-24T01:27:57.597' AS DateTime), NULL, N'', 2, N'nguyen van a', N'', N'', N'', CAST(N'2021-12-01T11:41:40.123' AS DateTime), CAST(200000 AS Decimal(18, 0)))
INSERT [dbo].[Order] ([ID], [CustomerID], [EmployeeID], [PaymentID], [DiscountID], [CreatedDate], [Description], [Note], [OrderStatusID], [CustomerName], [CustomerMobile], [CustomerEmail], [CustomerAddress], [ModifyDate], [TotalCost]) VALUES (10, 7, 2, 1, 0, CAST(N'2022-01-25T03:20:16.420' AS DateTime), NULL, N'ghi chú nè', 6, N'Hồ Long Nhật', N'0866721300', N'holongnhat2000@gmail.com', N'Hà Nội', CAST(N'2021-12-01T11:41:40.123' AS DateTime), CAST(240000 AS Decimal(18, 0)))
INSERT [dbo].[Order] ([ID], [CustomerID], [EmployeeID], [PaymentID], [DiscountID], [CreatedDate], [Description], [Note], [OrderStatusID], [CustomerName], [CustomerMobile], [CustomerEmail], [CustomerAddress], [ModifyDate], [TotalCost]) VALUES (11, 10, 2, 1, 0, CAST(N'2022-03-25T09:04:47.173' AS DateTime), NULL, N'', 6, N'Hồ Long Nhật', N'0866721300', N'dray.opp.1909@gmail.com', N'Hà Nội', CAST(N'2021-12-01T11:41:40.123' AS DateTime), CAST(50000 AS Decimal(18, 0)))
INSERT [dbo].[Order] ([ID], [CustomerID], [EmployeeID], [PaymentID], [DiscountID], [CreatedDate], [Description], [Note], [OrderStatusID], [CustomerName], [CustomerMobile], [CustomerEmail], [CustomerAddress], [ModifyDate], [TotalCost]) VALUES (12, 1, 2, 1, 0, CAST(N'2022-03-29T15:15:20.023' AS DateTime), NULL, N'', 2, N'Admin', N'0866721300', N'holongnhat2000@gmail.com', N'Hà Nội', CAST(N'2022-03-01T11:41:34.963' AS DateTime), CAST(90000 AS Decimal(18, 0)))
INSERT [dbo].[Order] ([ID], [CustomerID], [EmployeeID], [PaymentID], [DiscountID], [CreatedDate], [Description], [Note], [OrderStatusID], [CustomerName], [CustomerMobile], [CustomerEmail], [CustomerAddress], [ModifyDate], [TotalCost]) VALUES (13, 1, 1, 1, 0, CAST(N'2022-01-29T15:21:09.457' AS DateTime), NULL, N'', 3, N'Admin', N'0866721300', N'holongnhat2000@gmail.com', N'Hà Nội', CAST(N'2022-03-01T11:41:34.963' AS DateTime), CAST(880000 AS Decimal(18, 0)))
INSERT [dbo].[Order] ([ID], [CustomerID], [EmployeeID], [PaymentID], [DiscountID], [CreatedDate], [Description], [Note], [OrderStatusID], [CustomerName], [CustomerMobile], [CustomerEmail], [CustomerAddress], [ModifyDate], [TotalCost]) VALUES (14, 0, 2, 1, 6, CAST(N'2022-03-30T03:42:44.857' AS DateTime), NULL, N'fasdfagafg', 2, N'Hồ Long Nhật', N'0866721300', N'holongnhat2000@gmail.com', N'Hà Nội', CAST(N'2022-03-01T11:41:34.963' AS DateTime), CAST(100000 AS Decimal(18, 0)))
INSERT [dbo].[Order] ([ID], [CustomerID], [EmployeeID], [PaymentID], [DiscountID], [CreatedDate], [Description], [Note], [OrderStatusID], [CustomerName], [CustomerMobile], [CustomerEmail], [CustomerAddress], [ModifyDate], [TotalCost]) VALUES (15, 1, 2, 1, 0, CAST(N'2022-03-30T18:36:48.900' AS DateTime), NULL, N'hsdfhsh', 2, N'dsarhgsdf', N'sdhsd', N'sdh', N'hsdfh', CAST(N'2022-03-01T11:41:34.963' AS DateTime), CAST(4100000 AS Decimal(18, 0)))
INSERT [dbo].[Order] ([ID], [CustomerID], [EmployeeID], [PaymentID], [DiscountID], [CreatedDate], [Description], [Note], [OrderStatusID], [CustomerName], [CustomerMobile], [CustomerEmail], [CustomerAddress], [ModifyDate], [TotalCost]) VALUES (16, 0, 2, 1, 0, CAST(N'2022-04-01T10:57:20.407' AS DateTime), NULL, N'', 2, N'àga', N'0866721300', N'sdfadsf', N'ádfa', CAST(N'2022-03-01T11:41:34.963' AS DateTime), CAST(9000000 AS Decimal(18, 0)))
INSERT [dbo].[Order] ([ID], [CustomerID], [EmployeeID], [PaymentID], [DiscountID], [CreatedDate], [Description], [Note], [OrderStatusID], [CustomerName], [CustomerMobile], [CustomerEmail], [CustomerAddress], [ModifyDate], [TotalCost]) VALUES (17, 0, 2, 1, 0, CAST(N'2022-04-01T10:57:59.850' AS DateTime), NULL, N'', 2, N'àga', N'0866721300', N'sdfadsf', N'ádfa', CAST(N'2022-02-01T11:41:34.963' AS DateTime), CAST(9000000 AS Decimal(18, 0)))
INSERT [dbo].[Order] ([ID], [CustomerID], [EmployeeID], [PaymentID], [DiscountID], [CreatedDate], [Description], [Note], [OrderStatusID], [CustomerName], [CustomerMobile], [CustomerEmail], [CustomerAddress], [ModifyDate], [TotalCost]) VALUES (18, 1, 1, 1, 0, CAST(N'2022-04-01T10:58:56.633' AS DateTime), NULL, N'', 6, N'Admin', N'0866721300', N'holongnhat2000@gmail.com', N'Hà Nội', CAST(N'2022-04-01T19:17:47.800' AS DateTime), CAST(12000000 AS Decimal(18, 0)))
INSERT [dbo].[Order] ([ID], [CustomerID], [EmployeeID], [PaymentID], [DiscountID], [CreatedDate], [Description], [Note], [OrderStatusID], [CustomerName], [CustomerMobile], [CustomerEmail], [CustomerAddress], [ModifyDate], [TotalCost]) VALUES (19, 1, 1, 1, 0, CAST(N'2022-04-01T11:00:01.467' AS DateTime), NULL, N'', 5, N'Admin', N'0866721300', N'holongnhat2000@gmail.com', N'Hà Nội', CAST(N'2021-12-01T11:46:59.260' AS DateTime), CAST(3000000 AS Decimal(18, 0)))
INSERT [dbo].[Order] ([ID], [CustomerID], [EmployeeID], [PaymentID], [DiscountID], [CreatedDate], [Description], [Note], [OrderStatusID], [CustomerName], [CustomerMobile], [CustomerEmail], [CustomerAddress], [ModifyDate], [TotalCost]) VALUES (20, 1, 2, 1, 0, CAST(N'2022-04-01T11:01:14.637' AS DateTime), NULL, N'', 3, N'Admin', N'0866721300', N'holongnhat2000@gmail.com', N'Hà Nội', CAST(N'2022-04-01T11:46:59.260' AS DateTime), CAST(3000000 AS Decimal(18, 0)))
INSERT [dbo].[Order] ([ID], [CustomerID], [EmployeeID], [PaymentID], [DiscountID], [CreatedDate], [Description], [Note], [OrderStatusID], [CustomerName], [CustomerMobile], [CustomerEmail], [CustomerAddress], [ModifyDate], [TotalCost]) VALUES (21, 1, 1, 1, 0, CAST(N'2022-04-01T13:30:46.390' AS DateTime), NULL, N'', 3, N'Admin', N'0866721300', N'holongnhat2000@gmail.com', N'Hà Nội', CAST(N'2021-12-01T11:41:40.123' AS DateTime), CAST(6000000 AS Decimal(18, 0)))
INSERT [dbo].[Order] ([ID], [CustomerID], [EmployeeID], [PaymentID], [DiscountID], [CreatedDate], [Description], [Note], [OrderStatusID], [CustomerName], [CustomerMobile], [CustomerEmail], [CustomerAddress], [ModifyDate], [TotalCost]) VALUES (22, 1, 0, 2, 0, CAST(N'2022-04-02T11:02:56.900' AS DateTime), NULL, N'', 1, N'Admin', N'0866721300', N'holongnhat2000@gmail.com', N'Hà Nội', CAST(N'2022-04-02T11:02:56.900' AS DateTime), CAST(1100000 AS Decimal(18, 0)))
INSERT [dbo].[Order] ([ID], [CustomerID], [EmployeeID], [PaymentID], [DiscountID], [CreatedDate], [Description], [Note], [OrderStatusID], [CustomerName], [CustomerMobile], [CustomerEmail], [CustomerAddress], [ModifyDate], [TotalCost]) VALUES (23, 0, 1, 1, 6, CAST(N'2022-04-12T15:51:23.647' AS DateTime), NULL, N'ghi chú', 2, N'Admin', N'0866721300', N'holongnhat2000@gmail.com', N'hà nội', CAST(N'2022-04-12T15:52:03.413' AS DateTime), CAST(200000 AS Decimal(18, 0)))
INSERT [dbo].[Order] ([ID], [CustomerID], [EmployeeID], [PaymentID], [DiscountID], [CreatedDate], [Description], [Note], [OrderStatusID], [CustomerName], [CustomerMobile], [CustomerEmail], [CustomerAddress], [ModifyDate], [TotalCost]) VALUES (24, 1, 2, 1, 0, CAST(N'2022-04-12T15:53:42.240' AS DateTime), NULL, N'', 3, N'Admin', N'0866721300', N'holongnhat2000@gmail.com', N'Hà Nội', CAST(N'2021-12-01T11:41:40.123' AS DateTime), CAST(4000000 AS Decimal(18, 0)))
INSERT [dbo].[Order] ([ID], [CustomerID], [EmployeeID], [PaymentID], [DiscountID], [CreatedDate], [Description], [Note], [OrderStatusID], [CustomerName], [CustomerMobile], [CustomerEmail], [CustomerAddress], [ModifyDate], [TotalCost]) VALUES (25, 11, 2, 1, 0, CAST(N'2022-04-12T15:56:33.520' AS DateTime), NULL, N'ádf', 4, N'ádfasdf', N'0866721300', N'khachhang@gmail.com', N'ádfasdf', CAST(N'2022-04-12T15:57:18.600' AS DateTime), CAST(4000000 AS Decimal(18, 0)))
INSERT [dbo].[Order] ([ID], [CustomerID], [EmployeeID], [PaymentID], [DiscountID], [CreatedDate], [Description], [Note], [OrderStatusID], [CustomerName], [CustomerMobile], [CustomerEmail], [CustomerAddress], [ModifyDate], [TotalCost]) VALUES (26, 11, 0, 1, 0, CAST(N'2022-04-12T15:58:17.377' AS DateTime), NULL, N'sdfg', 1, N'dágd', N'0866721300', N'khachhang@gmail.com', N'sdfg', CAST(N'2022-04-12T15:58:17.377' AS DateTime), CAST(4000000 AS Decimal(18, 0)))
INSERT [dbo].[Order] ([ID], [CustomerID], [EmployeeID], [PaymentID], [DiscountID], [CreatedDate], [Description], [Note], [OrderStatusID], [CustomerName], [CustomerMobile], [CustomerEmail], [CustomerAddress], [ModifyDate], [TotalCost]) VALUES (27, 11, 0, 1, 6, CAST(N'2022-04-19T11:02:22.483' AS DateTime), NULL, N'sản phẩm demo', 1, N'Admin', N'0866721300', N'khachhang@gmail.com', N'hsdfh', CAST(N'2022-01-19T11:02:22.483' AS DateTime), CAST(220000 AS Decimal(18, 0)))
INSERT [dbo].[Order] ([ID], [CustomerID], [EmployeeID], [PaymentID], [DiscountID], [CreatedDate], [Description], [Note], [OrderStatusID], [CustomerName], [CustomerMobile], [CustomerEmail], [CustomerAddress], [ModifyDate], [TotalCost]) VALUES (28, 11, 2, 1, 0, CAST(N'2022-04-19T11:03:07.953' AS DateTime), NULL, N'sản phẩm demo', 6, N'Admin', N'0866721300', N'khachhang@gmail.com', N'hsdfh', CAST(N'2022-04-19T11:03:47.043' AS DateTime), CAST(220000 AS Decimal(18, 0)))
INSERT [dbo].[Order] ([ID], [CustomerID], [EmployeeID], [PaymentID], [DiscountID], [CreatedDate], [Description], [Note], [OrderStatusID], [CustomerName], [CustomerMobile], [CustomerEmail], [CustomerAddress], [ModifyDate], [TotalCost]) VALUES (29, 1, 0, 1, 6, CAST(N'2022-04-19T11:14:56.993' AS DateTime), NULL, N'', 1, N'Admin', N'0866721300', N'holongnhat2000@gmail.com', N'Hà Nội', CAST(N'2021-12-01T11:41:40.123' AS DateTime), CAST(220000 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetail] ON 

INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductDetailID], [Price], [Quantity]) VALUES (1, 1, 1, CAST(10000 AS Decimal(18, 0)), 1)
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductDetailID], [Price], [Quantity]) VALUES (2, 5, 4, CAST(1100000 AS Decimal(18, 0)), 1)
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductDetailID], [Price], [Quantity]) VALUES (3, 5, 3, CAST(1200000 AS Decimal(18, 0)), 1)
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductDetailID], [Price], [Quantity]) VALUES (4, 6, 4, CAST(1300000 AS Decimal(18, 0)), 2)
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductDetailID], [Price], [Quantity]) VALUES (5, 7, 4, CAST(1400000 AS Decimal(18, 0)), 2)
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductDetailID], [Price], [Quantity]) VALUES (6, 8, 4, CAST(1500000 AS Decimal(18, 0)), 1)
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductDetailID], [Price], [Quantity]) VALUES (7, 9, 4, CAST(1600000 AS Decimal(18, 0)), 1)
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductDetailID], [Price], [Quantity]) VALUES (8, 10, 3, CAST(1700000 AS Decimal(18, 0)), 1)
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductDetailID], [Price], [Quantity]) VALUES (9, 10, 4, CAST(1800000 AS Decimal(18, 0)), 2)
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductDetailID], [Price], [Quantity]) VALUES (10, 10, 8, CAST(4000000 AS Decimal(18, 0)), 2)
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductDetailID], [Price], [Quantity]) VALUES (11, 11, 19, CAST(190000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductDetailID], [Price], [Quantity]) VALUES (12, 11, 21, CAST(8000000 AS Decimal(18, 0)), 1)
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductDetailID], [Price], [Quantity]) VALUES (13, 11, 20, CAST(4000000 AS Decimal(18, 0)), 1)
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductDetailID], [Price], [Quantity]) VALUES (14, 11, 3, CAST(1100000 AS Decimal(18, 0)), 1)
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductDetailID], [Price], [Quantity]) VALUES (15, 12, 19, CAST(3000000 AS Decimal(18, 0)), 1)
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductDetailID], [Price], [Quantity]) VALUES (16, 14, 19, CAST(3000000 AS Decimal(18, 0)), 1)
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductDetailID], [Price], [Quantity]) VALUES (17, 14, 3, CAST(1100000 AS Decimal(18, 0)), 1)
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductDetailID], [Price], [Quantity]) VALUES (18, 15, 19, CAST(3000000 AS Decimal(18, 0)), 1)
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductDetailID], [Price], [Quantity]) VALUES (19, 15, 3, CAST(1100000 AS Decimal(18, 0)), 1)
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductDetailID], [Price], [Quantity]) VALUES (20, 16, 19, CAST(3000000 AS Decimal(18, 0)), 3)
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductDetailID], [Price], [Quantity]) VALUES (21, 18, 19, CAST(3000000 AS Decimal(18, 0)), 4)
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductDetailID], [Price], [Quantity]) VALUES (22, 19, 19, CAST(3000000 AS Decimal(18, 0)), 1)
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductDetailID], [Price], [Quantity]) VALUES (23, 20, 19, CAST(3000000 AS Decimal(18, 0)), 1)
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductDetailID], [Price], [Quantity]) VALUES (24, 21, 19, CAST(3000000 AS Decimal(18, 0)), 2)
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductDetailID], [Price], [Quantity]) VALUES (25, 22, 3, CAST(1100000 AS Decimal(18, 0)), 1)
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductDetailID], [Price], [Quantity]) VALUES (26, 23, 75, CAST(100000 AS Decimal(18, 0)), 10)
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductDetailID], [Price], [Quantity]) VALUES (27, 24, 20, CAST(4000000 AS Decimal(18, 0)), 1)
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductDetailID], [Price], [Quantity]) VALUES (28, 25, 20, CAST(4000000 AS Decimal(18, 0)), 1)
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductDetailID], [Price], [Quantity]) VALUES (29, 26, 20, CAST(4000000 AS Decimal(18, 0)), 1)
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductDetailID], [Price], [Quantity]) VALUES (30, 27, 3, CAST(1100000 AS Decimal(18, 0)), 1)
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductDetailID], [Price], [Quantity]) VALUES (31, 29, 3, CAST(1100000 AS Decimal(18, 0)), 1)
SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderStatus] ON 

INSERT [dbo].[OrderStatus] ([ID], [Name]) VALUES (1, N'Chờ xác nhận')
INSERT [dbo].[OrderStatus] ([ID], [Name]) VALUES (2, N'Đã xác nhận đơn hàng')
INSERT [dbo].[OrderStatus] ([ID], [Name]) VALUES (3, N'Đang lấy hàng')
INSERT [dbo].[OrderStatus] ([ID], [Name]) VALUES (4, N'Đang giao hàng')
INSERT [dbo].[OrderStatus] ([ID], [Name]) VALUES (5, N'Đã giao hàng')
INSERT [dbo].[OrderStatus] ([ID], [Name]) VALUES (6, N'Hủy đơn hàng')
INSERT [dbo].[OrderStatus] ([ID], [Name]) VALUES (7, N'Đã thanh toán chờ xác nhận')
SET IDENTITY_INSERT [dbo].[OrderStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[Payment] ON 

INSERT [dbo].[Payment] ([ID], [Name]) VALUES (1, N'Thanh toán khi nhận hàng')
INSERT [dbo].[Payment] ([ID], [Name]) VALUES (2, N'Thanh toán momo')
INSERT [dbo].[Payment] ([ID], [Name]) VALUES (3, N'Thanh toán nvpay')
SET IDENTITY_INSERT [dbo].[Payment] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ID], [ProductCategoryID], [Code], [Name], [Title], [Description], [Status], [CreatedDate], [Manufacturer]) VALUES (4, 9, NULL, N'RUSS MEN''S SNEAKERS', N' Ngay cả Pointing toàn năng cũng không kiểm soát được các văn bản mù, nó gần như là một cuộc sống gần như không có thần thoại Một ngày nọ, một dòng văn bản mù nhỏ tên là Lorem Ipsum quyết định rời đi đến Thế giới Ngữ pháp xa xôi. Khi đến những ngọn đồi đầu tiên của Dãy núi Italic, cô ấy đã có cái nhìn cuối cùng về đường chân trời của Bookmarksgrove quê hương của cô ấy,
dòng tiêu đề của Làng bảng chữ cái và dòng phụ trên con đường riêng của cô ấy, Dòng kẻ. Đáng tiếc, một câu hỏi thần thoại lướt qua má cô, rồi cô tiếp tục đi', N'<p>Ngay cả Pointing to&agrave;n năng cũng kh&ocirc;ng kiểm so&aacute;t được c&aacute;c văn bản m&ugrave;, n&oacute; gần như l&agrave; một cuộc sống gần như kh&ocirc;ng c&oacute; thần thoại Một ng&agrave;y nọ, một d&ograve;ng văn bản m&ugrave; nhỏ c&oacute; t&ecirc;n Lorem Ipsum quyết định rời đi đến Thế giới Ngữ ph&aacute;p xa x&ocirc;i. Khi đến những ngọn đồi đầu ti&ecirc;n của D&atilde;y n&uacute;i Italic, c&ocirc; ấy đ&atilde; c&oacute; c&aacute;i nh&igrave;n cuối c&ugrave;ng về đường ch&acirc;n trời của Bookmarksgrove qu&ecirc; hương của c&ocirc; ấy, d&ograve;ng ti&ecirc;u đề của L&agrave;ng bảng chữ c&aacute;i v&agrave; d&ograve;ng phụ tr&ecirc;n con đường ri&ecirc;ng của c&ocirc; ấy, D&ograve;ng kẻ. Đ&aacute;ng tiếc, một c&acirc;u hỏi thần thoại lướt qua m&aacute; c&ocirc;, rồi c&ocirc; tiếp tục đi. Big Oxmox khuy&ecirc;n c&ocirc; kh&ocirc;ng n&ecirc;n l&agrave;m như vậy Bởi v&igrave; c&oacute; h&agrave;ng ng&agrave;n Dấu phẩy nghi vấn dở kh&oacute;c dở cười v&agrave; Semikoli ranh ma.</p>
', 1, CAST(N'2022-03-15T00:00:00.000' AS DateTime), N'Ngay cả Pointing toàn năng cũng không kiểm soát được các văn bản mù, nó gần như là một cuộc sống gần như không có thần thoại Một ngày nọ, một dòng văn bản mù nhỏ tên là Lorem Ipsum quyết định rời đi đến Thế giới Ngữ pháp xa xôi. Khi đến những ngọn đồi đầu tiên của Dãy núi Italic, cô ấy đã có cái nhìn cuối cùng về đường chân trời của Bookmarksgrove quê hương của cô ấy,
dòng tiêu đề của Làng bảng chữ cái và dòng phụ trên con đường riêng của cô ấy, Dòng kẻ. Đáng tiếc, một câu hỏi thần thoại lướt qua má cô, rồi cô tiếp tục đi')
INSERT [dbo].[Product] ([ID], [ProductCategoryID], [Code], [Name], [Title], [Description], [Status], [CreatedDate], [Manufacturer]) VALUES (5, 3, NULL, N'MEN''S TAJA COMMISSIONER', N' Ngay cả Pointing toàn năng cũng không kiểm soát được các văn bản mù, nó gần như là một cuộc sống gần như không có thần thoại Một ngày nọ, một dòng văn bản mù nhỏ tên là Lorem Ipsum quyết định rời đi đến Thế giới Ngữ pháp xa xôi. Khi đến những ngọn đồi đầu tiên của Dãy núi Italic, cô ấy đã có cái nhìn cuối cùng về đường chân trời của Bookmarksgrove quê hương của cô ấy,
dòng tiêu đề của Làng bảng chữ cái và dòng phụ trên con đường riêng của cô ấy, Dòng kẻ. Đáng tiếc, một câu hỏi thần thoại lướt qua má cô, rồi cô tiếp tục đi', N'<p>Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar.</p>
', 1, CAST(N'2022-03-15T00:00:00.000' AS DateTime), N'Ngay cả Pointing toàn năng cũng không kiểm soát được các văn bản mù, nó gần như là một cuộc sống gần như không có thần thoại Một ngày nọ, một dòng văn bản mù nhỏ tên là Lorem Ipsum quyết định rời đi đến Thế giới Ngữ pháp xa xôi. Khi đến những ngọn đồi đầu tiên của Dãy núi Italic, cô ấy đã có cái nhìn cuối cùng về đường chân trời của Bookmarksgrove quê hương của cô ấy,
dòng tiêu đề của Làng bảng chữ cái và dòng phụ trên con đường riêng của cô ấy, Dòng kẻ. Đáng tiếc, một câu hỏi thần thoại lướt qua má cô, rồi cô tiếp tục đi')
INSERT [dbo].[Product] ([ID], [ProductCategoryID], [Code], [Name], [Title], [Description], [Status], [CreatedDate], [Manufacturer]) VALUES (6, 2, NULL, N'WOMEN''S BOOTS SHOES MACA', N' Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar.

When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrove, the headline of Alphabet Village and the subline of her own road, the Line Lane. Pityful a rethoric question ran over her cheek, then she continued her way.', N'<p>WOMEN&#39;S BOOTS SHOES MACA235634tgyhg</p>
', 1, CAST(N'2022-03-15T00:00:00.000' AS DateTime), N'Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar.

When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrove, the headline of Alphabet Village and the subline of her own road, the Line Lane. Pityful a rethoric question ran over her cheek, then she continued her way.')
INSERT [dbo].[Product] ([ID], [ProductCategoryID], [Code], [Name], [Title], [Description], [Status], [CreatedDate], [Manufacturer]) VALUES (8, 8, NULL, N'women sunbaked', N' Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar.

When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrove, the headline of Alphabet Village and the subline of her own road, the Line Lane. Pityful a rethoric question ran over her cheek, then she continued her way.', N'<p>women-sunbaked</p>
', 1, CAST(N'2022-03-15T00:00:00.000' AS DateTime), N'Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar.

When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrove, the headline of Alphabet Village and the subline of her own road, the Line Lane. Pityful a rethoric question ran over her cheek, then she continued her way.')
INSERT [dbo].[Product] ([ID], [ProductCategoryID], [Code], [Name], [Title], [Description], [Status], [CreatedDate], [Manufacturer]) VALUES (9, 8, NULL, N'women classic 001', N' Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar.

When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrove, the headline of Alphabet Village and the subline of her own road, the Line Lane. Pityful a rethoric question ran over her cheek, then she continued her way.', N'<p>Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar.</p>
', 1, CAST(N'2022-03-15T00:00:00.000' AS DateTime), N'Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar.

When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrove, the headline of Alphabet Village and the subline of her own road, the Line Lane. Pityful a rethoric question ran over her cheek, then she continued her way.')
INSERT [dbo].[Product] ([ID], [ProductCategoryID], [Code], [Name], [Title], [Description], [Status], [CreatedDate], [Manufacturer]) VALUES (21, 7, NULL, N'Balance 327', N'Giày Thể Thao New Balance 327 MS327STC Màu Đen là một trong những đôi giày thể thao được nhiều tín đồ thời trang săn đón. Với thiết kế trẻ trung, cùng chất liệu cao cấp New Balance 327 MS327STC mang đến cho người đi sự thoải mái, tiện lợi.', N'<p><strong>Gi&agrave;y Thể Thao New Balance 327 MS327STC M&agrave;u Đen</strong>&nbsp;l&agrave; một trong những đ&ocirc;i gi&agrave;y thể thao được nhiều t&iacute;n đồ&nbsp;<a href="https://vuahanghieu.com/thoi-trang" title="thời trang">thời trang</a>&nbsp;săn đ&oacute;n. Với thiết kế trẻ trung, c&ugrave;ng chất liệu cao cấp New Balance 327 MS327STC mang đến cho người đi sự thoải m&aacute;i, tiện lợi.</p>
', 1, CAST(N'2022-04-12T15:00:29.907' AS DateTime), N'Giày Thể Thao New Balance 327 MS327STC Màu Đen là một trong những đôi giày thể thao được nhiều tín đồ thời trang săn đón. Với thiết kế trẻ trung, cùng chất liệu cao cấp New Balance 327 MS327STC mang đến cho người đi sự thoải mái, tiện lợi.')
INSERT [dbo].[Product] ([ID], [ProductCategoryID], [Code], [Name], [Title], [Description], [Status], [CreatedDate], [Manufacturer]) VALUES (22, 12, NULL, N'air jordan 1 mid', N' air jordan 1 mid', N'<p>air jordan 1 mid</p>
', 1, CAST(N'2022-04-19T14:52:26.893' AS DateTime), N'air jordan 1 mid')
INSERT [dbo].[Product] ([ID], [ProductCategoryID], [Code], [Name], [Title], [Description], [Status], [CreatedDate], [Manufacturer]) VALUES (23, 10, NULL, N'DG288-S', N'DG288-S', N'<p>DG288-S</p>
', 1, CAST(N'2022-04-19T14:53:12.277' AS DateTime), N'DG288-S')
INSERT [dbo].[Product] ([ID], [ProductCategoryID], [Code], [Name], [Title], [Description], [Status], [CreatedDate], [Manufacturer]) VALUES (24, 1, NULL, N'Faster-06-N', N'Faster-06-N', N'<p>Faster-06-N</p>
', 1, CAST(N'2022-04-19T14:53:48.953' AS DateTime), N'Faster-06-N')
INSERT [dbo].[Product] ([ID], [ProductCategoryID], [Code], [Name], [Title], [Description], [Status], [CreatedDate], [Manufacturer]) VALUES (25, 2, NULL, N'Forum Exhibit Low Shoes', N' Forum Exhibit Low Shoes', N'<p>Forum Exhibit Low Shoes</p>
', 1, CAST(N'2022-04-19T14:54:39.563' AS DateTime), N'Forum Exhibit Low Shoes')
INSERT [dbo].[Product] ([ID], [ProductCategoryID], [Code], [Name], [Title], [Description], [Status], [CreatedDate], [Manufacturer]) VALUES (26, 4, NULL, N'G classics B1639', N'G classics B1639', N'<p>G classics B1639</p>
', 1, CAST(N'2022-04-19T14:55:13.177' AS DateTime), N'G classics B1639')
INSERT [dbo].[Product] ([ID], [ProductCategoryID], [Code], [Name], [Title], [Description], [Status], [CreatedDate], [Manufacturer]) VALUES (27, 2, NULL, N'Galaxy 5', N'Galaxy 5', N'<p>Galaxy 5</p>
', 1, CAST(N'2022-04-19T14:55:44.467' AS DateTime), N'Galaxy 5')
INSERT [dbo].[Product] ([ID], [ProductCategoryID], [Code], [Name], [Title], [Description], [Status], [CreatedDate], [Manufacturer]) VALUES (28, 9, NULL, N'GB Classics B1655', N'GB Classics B1655', N'<p>GB Classics B1655</p>
', 1, CAST(N'2022-04-19T15:01:07.457' AS DateTime), N'GB Classics B1655')
INSERT [dbo].[Product] ([ID], [ProductCategoryID], [Code], [Name], [Title], [Description], [Status], [CreatedDate], [Manufacturer]) VALUES (29, 10, NULL, N'GDC-01-X', N'GDC-01-X', N'<p>GDC-01-X</p>
', 1, CAST(N'2022-04-19T15:01:51.023' AS DateTime), N'GDC-01-X')
INSERT [dbo].[Product] ([ID], [ProductCategoryID], [Code], [Name], [Title], [Description], [Status], [CreatedDate], [Manufacturer]) VALUES (30, 1, NULL, N'Nike air force 1', N'Nike air force 1', N'<p>Nike air force 1</p>
', 1, CAST(N'2022-04-19T15:02:18.970' AS DateTime), N'Nike air force 1')
INSERT [dbo].[Product] ([ID], [ProductCategoryID], [Code], [Name], [Title], [Description], [Status], [CreatedDate], [Manufacturer]) VALUES (31, 1, NULL, N'Nike air zoom pegasus 39', N'Nike air zoom pegasus 39', N'<p>Nike air zoom pegasus 39</p>
', 1, CAST(N'2022-04-19T15:02:51.270' AS DateTime), N'Nike air zoom pegasus 39')
INSERT [dbo].[Product] ([ID], [ProductCategoryID], [Code], [Name], [Title], [Description], [Status], [CreatedDate], [Manufacturer]) VALUES (32, 1, NULL, N'Nike Pegasus Trail 3 GORE-TEX', N'Nike Pegasus Trail 3 GORE-TEX', N'<p>Nike Pegasus Trail 3 GORE-TEX</p>
', 1, CAST(N'2022-04-19T15:03:16.450' AS DateTime), N'Nike Pegasus Trail 3 GORE-TEX')
INSERT [dbo].[Product] ([ID], [ProductCategoryID], [Code], [Name], [Title], [Description], [Status], [CreatedDate], [Manufacturer]) VALUES (33, 3, NULL, N'Smart-68-D', N'Smart-68-D', N'<p>Smart-68-D</p>
', 1, CAST(N'2022-04-19T15:03:40.210' AS DateTime), N'Smart-68-D')
INSERT [dbo].[Product] ([ID], [ProductCategoryID], [Code], [Name], [Title], [Description], [Status], [CreatedDate], [Manufacturer]) VALUES (34, 13, NULL, N'Sneaker Blooming', N' Sneaker Blooming', N'<p>Sneaker Blooming</p>
', 1, CAST(N'2022-04-19T15:04:34.340' AS DateTime), N'Sneaker Blooming')
INSERT [dbo].[Product] ([ID], [ProductCategoryID], [Code], [Name], [Title], [Description], [Status], [CreatedDate], [Manufacturer]) VALUES (35, 13, NULL, N'Sneaker Gravity', N' Sneaker Gravity', N'<p>Sneaker Gravity</p>
', 1, CAST(N'2022-04-19T15:05:01.990' AS DateTime), N'Sneaker Gravity')
INSERT [dbo].[Product] ([ID], [ProductCategoryID], [Code], [Name], [Title], [Description], [Status], [CreatedDate], [Manufacturer]) VALUES (36, 13, NULL, N'Sneaker Light Up', N'Sneaker Light Up', N'<p>Sneaker Light Up</p>
', 1, CAST(N'2022-04-19T15:05:30.230' AS DateTime), N'Sneaker Light UpSneaker Light Up')
INSERT [dbo].[Product] ([ID], [ProductCategoryID], [Code], [Name], [Title], [Description], [Status], [CreatedDate], [Manufacturer]) VALUES (37, 13, NULL, N'Sneakers Whale', N'Sneakers Whale', N'<p>Sneakers Whale</p>
', 1, CAST(N'2022-04-19T15:06:14.997' AS DateTime), N'Sneakers Whale')
INSERT [dbo].[Product] ([ID], [ProductCategoryID], [Code], [Name], [Title], [Description], [Status], [CreatedDate], [Manufacturer]) VALUES (38, 11, NULL, N'Stan smith', N'Stan smith', N'<p>Stan smith</p>
', 1, CAST(N'2022-04-19T15:06:50.510' AS DateTime), N'Stan smith')
INSERT [dbo].[Product] ([ID], [ProductCategoryID], [Code], [Name], [Title], [Description], [Status], [CreatedDate], [Manufacturer]) VALUES (39, 2, NULL, N'Supernova', N'Supernova', N'<p>Supernova</p>
', 1, CAST(N'2022-04-19T15:07:18.710' AS DateTime), N'Supernova')
INSERT [dbo].[Product] ([ID], [ProductCategoryID], [Code], [Name], [Title], [Description], [Status], [CreatedDate], [Manufacturer]) VALUES (40, 2, NULL, N'Superstar', N'Superstar', N'<p>Superstar</p>
', 1, CAST(N'2022-04-19T15:07:51.180' AS DateTime), N'Superstar')
INSERT [dbo].[Product] ([ID], [ProductCategoryID], [Code], [Name], [Title], [Description], [Status], [CreatedDate], [Manufacturer]) VALUES (41, 2, NULL, N'Ultra 4D shoes', N'Ultra 4D shoes', N'<p>Ultra 4D shoes</p>
', 1, CAST(N'2022-04-19T15:08:10.917' AS DateTime), N'Ultra 4D shoes')
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductCategory] ON 

INSERT [dbo].[ProductCategory] ([ID], [ParentID], [Name], [Description], [Status]) VALUES (1, 1, N'NIKE', N'Giầy nam hãng Nike', 1)
INSERT [dbo].[ProductCategory] ([ID], [ParentID], [Name], [Description], [Status]) VALUES (2, 1, N'Adidas', N'giày nam hãng Adidas', 1)
INSERT [dbo].[ProductCategory] ([ID], [ParentID], [Name], [Description], [Status]) VALUES (3, 0, N'JUNO ', N'Thương hiệu thời trang Việt dẫn đầu xu hướng.', 0)
INSERT [dbo].[ProductCategory] ([ID], [ParentID], [Name], [Description], [Status]) VALUES (4, 0, N'Vans', N'Giày nữ hãng Vans', 0)
INSERT [dbo].[ProductCategory] ([ID], [ParentID], [Name], [Description], [Status]) VALUES (7, 0, N'Balenciaga', N'Balenciaga Balenciaga', 0)
INSERT [dbo].[ProductCategory] ([ID], [ParentID], [Name], [Description], [Status]) VALUES (8, 0, N'Converse', N'Converse', 0)
INSERT [dbo].[ProductCategory] ([ID], [ParentID], [Name], [Description], [Status]) VALUES (9, 0, N'Reebok', N'Reebok', 0)
INSERT [dbo].[ProductCategory] ([ID], [ParentID], [Name], [Description], [Status]) VALUES (10, 0, N'Supreme', N'Supreme', 0)
INSERT [dbo].[ProductCategory] ([ID], [ParentID], [Name], [Description], [Status]) VALUES (11, 0, N' Charles & Keith', N' Charles & Keith', 0)
INSERT [dbo].[ProductCategory] ([ID], [ParentID], [Name], [Description], [Status]) VALUES (12, 0, N'Jordan', N'Jordan', 0)
INSERT [dbo].[ProductCategory] ([ID], [ParentID], [Name], [Description], [Status]) VALUES (13, 0, N'Sneaker', N'Sneaker', 0)
SET IDENTITY_INSERT [dbo].[ProductCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductColor] ON 

INSERT [dbo].[ProductColor] ([ID], [Name], [Code]) VALUES (1, N'Đỏ', N'')
INSERT [dbo].[ProductColor] ([ID], [Name], [Code]) VALUES (2, N'Xanh dương', N'')
INSERT [dbo].[ProductColor] ([ID], [Name], [Code]) VALUES (3, N'Vàng', N'')
INSERT [dbo].[ProductColor] ([ID], [Name], [Code]) VALUES (4, N'Đỏ đậm', N'')
INSERT [dbo].[ProductColor] ([ID], [Name], [Code]) VALUES (6, N'Tím', N'')
INSERT [dbo].[ProductColor] ([ID], [Name], [Code]) VALUES (7, N'Đen', N'')
INSERT [dbo].[ProductColor] ([ID], [Name], [Code]) VALUES (8, N'Trắng', N'')
INSERT [dbo].[ProductColor] ([ID], [Name], [Code]) VALUES (9, N'Nâu', N'')
INSERT [dbo].[ProductColor] ([ID], [Name], [Code]) VALUES (10, N'Xanh đậm', N'')
INSERT [dbo].[ProductColor] ([ID], [Name], [Code]) VALUES (11, N'Xanh rêu', N'')
SET IDENTITY_INSERT [dbo].[ProductColor] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductDetail] ON 

INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (3, 4, 2, 1, 25, N'/Admin/Content/Upload/120220412150545avatar.jpg')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (9, 9, 2, 2, 37, N'/Admin/Content/Upload/120220412151512avatar.jpg')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (14, 13, 7, 2, 35, N'/images/item-4.jpg')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (20, 4, 2, 2, 7, N'/images/item-8.jpg')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (28, 4, 3, 3, 265, N'/Admin/Content/Upload/120220412150625avatar.jpg')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (40, 4, 14, 4, 123, N'/Admin/Content/Upload/120220412150632avatar.jpg')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (64, 5, 4, 3, 10, N'/Admin/Content/Upload/120220407002514avatar.jpg')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (65, 5, 2, 3, 10, N'/Admin/Content/Upload/120220407002523avatar.jpg')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (66, 5, 6, 3, 15, N'/Admin/Content/Upload/120220407002537avatar.jpg')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (67, 5, 4, 3, 15, N'/Admin/Content/Upload/120220407002545avatar.jpg')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (74, 21, 2, 1, 100, N'/Admin/Content/Upload/120220412154246avatar.jpg')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (75, 21, 2, 2, 1, N'/Admin/Content/Upload/120220412154812avatar.jpg')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (76, 22, 28, 7, 100, N'/Admin/Content/Upload/120220419161450avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (77, 22, 27, 7, 100, N'/Admin/Content/Upload/120220419161541avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (78, 22, 26, 7, 100, N'/Admin/Content/Upload/120220419161558avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (79, 22, 25, 7, 100, N'/Admin/Content/Upload/120220419161613avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (80, 22, 24, 7, 100, N'/Admin/Content/Upload/120220419161638avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (81, 22, 23, 7, 100, N'/Admin/Content/Upload/120220419161648avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (82, 22, 22, 7, 100, N'/Admin/Content/Upload/120220419161703avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (83, 22, 28, 1, 100, N'/Admin/Content/Upload/120220419161733avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (84, 22, 27, 1, 100, N'/Admin/Content/Upload/120220419161749avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (85, 22, 26, 1, 100, N'/Admin/Content/Upload/120220419161803avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (86, 22, 25, 1, 100, N'/Admin/Content/Upload/120220419161818avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (87, 22, 24, 1, 100, N'/Admin/Content/Upload/120220419161830avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (88, 22, 23, 1, 100, N'/Admin/Content/Upload/120220419161845avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (89, 22, 22, 1, 100, N'/Admin/Content/Upload/120220419161858avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (90, 22, 28, 8, 100, N'/Admin/Content/Upload/120220419161920avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (91, 22, 27, 8, 100, N'/Admin/Content/Upload/120220419161932avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (92, 22, 26, 8, 100, N'/Admin/Content/Upload/120220419161947avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (93, 22, 25, 8, 100, N'/Admin/Content/Upload/120220419162005avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (94, 22, 24, 8, 100, N'/Admin/Content/Upload/120220419162200avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (95, 22, 23, 8, 100, N'/Admin/Content/Upload/120220419162207avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (96, 22, 22, 8, 100, N'/Admin/Content/Upload/120220419162214avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (97, 23, 28, 7, 100, N'/Admin/Content/Upload/120220419162231avatar.jpg')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (98, 23, 27, 7, 100, N'/Admin/Content/Upload/120220419162538avatar.jpg')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (99, 23, 26, 7, 100, N'/Admin/Content/Upload/120220419162547avatar.jpg')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (100, 23, 25, 7, 100, N'/Admin/Content/Upload/120220419162547avatar.jpg')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (101, 23, 24, 7, 100, N'/Admin/Content/Upload/120220419162547avatar.jpg')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (102, 23, 23, 7, 100, N'/Admin/Content/Upload/120220419162547avatar.jpg')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (103, 23, 22, 7, 100, N'/Admin/Content/Upload/120220419162547avatar.jpg')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (104, 25, 28, 8, 100, N'/Admin/Content/Upload/120220419162645avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (105, 25, 27, 8, 100, N'/Admin/Content/Upload/120220419162645avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (106, 25, 26, 8, 100, N'/Admin/Content/Upload/120220419162645avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (107, 25, 25, 8, 100, N'/Admin/Content/Upload/120220419162645avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (108, 25, 24, 8, 100, N'/Admin/Content/Upload/120220419162645avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (109, 25, 23, 8, 100, N'/Admin/Content/Upload/120220419162645avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (110, 25, 22, 8, 100, N'/Admin/Content/Upload/120220419162645avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (111, 26, 28, 2, 80, N'/Admin/Content/Upload/120220419162941avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (112, 26, 27, 2, 80, N'/Admin/Content/Upload/120220419162941avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (113, 26, 26, 2, 80, N'/Admin/Content/Upload/120220419162941avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (114, 26, 25, 2, 80, N'/Admin/Content/Upload/120220419162941avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (115, 26, 24, 2, 80, N'/Admin/Content/Upload/120220419162941avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (116, 26, 23, 2, 80, N'/Admin/Content/Upload/120220419162941avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (117, 26, 22, 2, 80, N'/Admin/Content/Upload/120220419162941avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (118, 27, 28, 7, 80, N'/Admin/Content/Upload/120220419163211avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (119, 27, 27, 7, 80, N'/Admin/Content/Upload/120220419163211avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (120, 27, 26, 7, 80, N'/Admin/Content/Upload/120220419163211avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (121, 27, 25, 7, 80, N'/Admin/Content/Upload/120220419163211avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (122, 27, 24, 7, 80, N'/Admin/Content/Upload/120220419163211avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (123, 27, 23, 7, 80, N'/Admin/Content/Upload/120220419163211avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (124, 27, 22, 7, 80, N'/Admin/Content/Upload/120220419163211avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (125, 29, 28, 7, 80, N'/Admin/Content/Upload/120220419163445avatar.jpg')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (126, 29, 27, 7, 80, N'/Admin/Content/Upload/120220419163445avatar.jpg')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (127, 29, 26, 7, 80, N'/Admin/Content/Upload/120220419163445avatar.jpg')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (128, 29, 25, 7, 80, N'/Admin/Content/Upload/120220419163445avatar.jpg')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (129, 29, 24, 7, 80, N'/Admin/Content/Upload/120220419163445avatar.jpg')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (130, 29, 23, 7, 80, N'/Admin/Content/Upload/120220419163445avatar.jpg')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (131, 29, 22, 7, 80, N'/Admin/Content/Upload/120220419163445avatar.jpg')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (132, 33, 28, 7, 80, N'/Admin/Content/Upload/120220419163540avatar.jpg')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (133, 33, 27, 7, 80, N'/Admin/Content/Upload/120220419163540avatar.jpg')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (134, 33, 26, 7, 80, N'/Admin/Content/Upload/120220419163540avatar.jpg')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (135, 33, 25, 7, 80, N'/Admin/Content/Upload/120220419163540avatar.jpg')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (136, 33, 24, 7, 80, N'/Admin/Content/Upload/120220419163540avatar.jpg')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (137, 33, 23, 7, 80, N'/Admin/Content/Upload/120220419163540avatar.jpg')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (138, 33, 22, 7, 80, N'/Admin/Content/Upload/120220419163540avatar.jpg')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (139, 34, 28, 7, 80, N'/Admin/Content/Upload/120220419163633avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (140, 34, 27, 7, 80, N'/Admin/Content/Upload/120220419163633avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (141, 34, 26, 7, 80, N'/Admin/Content/Upload/120220419163633avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (142, 34, 25, 7, 80, N'/Admin/Content/Upload/120220419163633avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (143, 34, 24, 7, 80, N'/Admin/Content/Upload/120220419163633avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (144, 34, 23, 7, 80, N'/Admin/Content/Upload/120220419163633avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (145, 34, 22, 7, 80, N'/Admin/Content/Upload/120220419163633avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (146, 39, 28, 7, 80, N'/Admin/Content/Upload/120220419163741avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (147, 39, 27, 7, 80, N'/Admin/Content/Upload/120220419163741avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (148, 39, 26, 7, 80, N'/Admin/Content/Upload/120220419163741avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (149, 39, 25, 7, 80, N'/Admin/Content/Upload/120220419163741avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (150, 39, 24, 7, 80, N'/Admin/Content/Upload/120220419163741avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (151, 39, 23, 7, 80, N'/Admin/Content/Upload/120220419163741avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (152, 39, 22, 7, 80, N'/Admin/Content/Upload/120220419163741avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (153, 41, 28, 7, 80, N'/Admin/Content/Upload/120220419163816avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (154, 41, 27, 7, 80, N'/Admin/Content/Upload/120220419163816avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (155, 41, 26, 7, 80, N'/Admin/Content/Upload/120220419163816avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (156, 41, 25, 7, 80, N'/Admin/Content/Upload/120220419163816avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (157, 41, 24, 7, 80, N'/Admin/Content/Upload/120220419163816avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (158, 41, 23, 7, 80, N'/Admin/Content/Upload/120220419163816avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (159, 41, 22, 7, 80, N'/Admin/Content/Upload/120220419163852avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (160, 28, 28, 8, 80, N'/Admin/Content/Upload/120220419163926avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (161, 28, 27, 8, 80, N'/Admin/Content/Upload/120220419163926avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (162, 28, 26, 8, 80, N'/Admin/Content/Upload/120220419163926avatar.webp')
GO
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (163, 28, 25, 8, 80, N'/Admin/Content/Upload/120220419163926avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (164, 28, 24, 8, 80, N'/Admin/Content/Upload/120220419163926avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (165, 28, 23, 8, 80, N'/Admin/Content/Upload/120220419163926avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (166, 28, 22, 8, 80, N'/Admin/Content/Upload/120220419163926avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (167, 28, 21, 8, 80, N'/Admin/Content/Upload/120220419163926avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (168, 30, 28, 8, 80, N'/Admin/Content/Upload/120220419164007avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (169, 30, 27, 8, 80, N'/Admin/Content/Upload/120220419164007avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (170, 30, 26, 8, 80, N'/Admin/Content/Upload/120220419164007avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (171, 30, 25, 8, 80, N'/Admin/Content/Upload/120220419164007avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (172, 30, 24, 8, 80, N'/Admin/Content/Upload/120220419164007avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (173, 30, 23, 8, 80, N'/Admin/Content/Upload/120220419164007avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (174, 30, 22, 8, 80, N'/Admin/Content/Upload/120220419164007avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (175, 30, 21, 8, 80, N'/Admin/Content/Upload/120220419164007avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (176, 31, 28, 8, 80, N'/Admin/Content/Upload/120220419164058avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (177, 31, 27, 8, 80, N'/Admin/Content/Upload/120220419164058avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (178, 31, 26, 8, 80, N'/Admin/Content/Upload/120220419164058avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (179, 31, 25, 8, 80, N'/Admin/Content/Upload/120220419164058avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (180, 31, 24, 8, 80, N'/Admin/Content/Upload/120220419164058avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (181, 31, 23, 8, 80, N'/Admin/Content/Upload/120220419164058avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (182, 31, 22, 8, 80, N'/Admin/Content/Upload/120220419164058avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (183, 31, 21, 8, 80, N'/Admin/Content/Upload/120220419164058avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (184, 35, 28, 8, 80, N'/Admin/Content/Upload/120220419164153avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (185, 35, 27, 8, 80, N'/Admin/Content/Upload/120220419164153avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (186, 35, 26, 8, 80, N'/Admin/Content/Upload/120220419164153avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (187, 35, 25, 8, 80, N'/Admin/Content/Upload/120220419164153avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (188, 35, 24, 8, 80, N'/Admin/Content/Upload/120220419164153avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (189, 35, 23, 8, 80, N'/Admin/Content/Upload/120220419164153avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (190, 35, 22, 8, 80, N'/Admin/Content/Upload/120220419164153avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (191, 35, 21, 8, 80, N'/Admin/Content/Upload/120220419164153avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (192, 38, 28, 8, 80, N'/Admin/Content/Upload/120220419164227avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (193, 38, 27, 8, 80, N'/Admin/Content/Upload/120220419164227avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (194, 38, 26, 8, 80, N'/Admin/Content/Upload/120220419164227avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (195, 38, 25, 8, 80, N'/Admin/Content/Upload/120220419164227avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (196, 38, 24, 8, 80, N'/Admin/Content/Upload/120220419164227avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (197, 38, 23, 8, 80, N'/Admin/Content/Upload/120220419164227avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (198, 38, 22, 8, 80, N'/Admin/Content/Upload/120220419164227avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (199, 38, 21, 8, 80, N'/Admin/Content/Upload/120220419164227avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (200, 32, 28, 11, 100, N'/Admin/Content/Upload/120220419164329avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (201, 32, 27, 11, 100, N'/Admin/Content/Upload/120220419164329avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (202, 32, 26, 11, 100, N'/Admin/Content/Upload/120220419164329avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (203, 32, 25, 11, 100, N'/Admin/Content/Upload/120220419164329avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (204, 32, 24, 11, 100, N'/Admin/Content/Upload/120220419164329avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (205, 32, 23, 11, 100, N'/Admin/Content/Upload/120220419164329avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (206, 32, 22, 11, 100, N'/Admin/Content/Upload/120220419164329avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (207, 32, 21, 11, 100, N'/Admin/Content/Upload/120220419164329avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (208, 32, 20, 11, 100, N'/Admin/Content/Upload/120220419164329avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (209, 32, 19, 11, 100, N'/Admin/Content/Upload/120220419164329avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (210, 32, 18, 11, 100, N'/Admin/Content/Upload/120220419164329avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (211, 32, 17, 11, 100, N'/Admin/Content/Upload/120220419164329avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (212, 32, 28, 7, 50, N'/Admin/Content/Upload/120220419164405avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (213, 32, 27, 7, 50, N'/Admin/Content/Upload/120220419164405avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (214, 32, 26, 7, 50, N'/Admin/Content/Upload/120220419164405avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (215, 32, 25, 7, 50, N'/Admin/Content/Upload/120220419164405avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (216, 32, 24, 7, 50, N'/Admin/Content/Upload/120220419164405avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (217, 32, 23, 7, 50, N'/Admin/Content/Upload/120220419164405avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (218, 32, 22, 7, 50, N'/Admin/Content/Upload/120220419164405avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (219, 32, 21, 7, 50, N'/Admin/Content/Upload/120220419164405avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (220, 32, 20, 7, 50, N'/Admin/Content/Upload/120220419164405avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (221, 32, 19, 7, 50, N'/Admin/Content/Upload/120220419164405avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (222, 32, 18, 7, 50, N'/Admin/Content/Upload/120220419164405avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (223, 32, 17, 7, 50, N'/Admin/Content/Upload/120220419164405avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (224, 32, 28, 1, 50, N'/Admin/Content/Upload/120220419164432avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (225, 32, 27, 1, 50, N'/Admin/Content/Upload/120220419164432avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (226, 32, 26, 1, 50, N'/Admin/Content/Upload/120220419164432avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (227, 32, 25, 1, 50, N'/Admin/Content/Upload/120220419164432avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (228, 32, 24, 1, 50, N'/Admin/Content/Upload/120220419164432avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (229, 32, 23, 1, 50, N'/Admin/Content/Upload/120220419164432avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (230, 32, 22, 1, 50, N'/Admin/Content/Upload/120220419164432avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (231, 32, 21, 1, 50, N'/Admin/Content/Upload/120220419164432avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (232, 32, 20, 1, 50, N'/Admin/Content/Upload/120220419164432avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (233, 32, 19, 1, 50, N'/Admin/Content/Upload/120220419164432avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (234, 32, 18, 1, 50, N'/Admin/Content/Upload/120220419164432avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (235, 32, 17, 1, 50, N'/Admin/Content/Upload/120220419164432avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (236, 32, 28, 3, 50, N'/Admin/Content/Upload/120220419164505avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (237, 32, 27, 3, 50, N'/Admin/Content/Upload/120220419164505avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (238, 32, 26, 3, 50, N'/Admin/Content/Upload/120220419164505avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (239, 32, 25, 3, 50, N'/Admin/Content/Upload/120220419164505avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (240, 32, 24, 3, 50, N'/Admin/Content/Upload/120220419164505avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (241, 32, 23, 3, 50, N'/Admin/Content/Upload/120220419164505avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (242, 32, 22, 3, 50, N'/Admin/Content/Upload/120220419164505avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (243, 32, 21, 3, 50, N'/Admin/Content/Upload/120220419164505avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (244, 32, 20, 3, 50, N'/Admin/Content/Upload/120220419164505avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (245, 32, 19, 3, 50, N'/Admin/Content/Upload/120220419164505avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (246, 32, 18, 3, 50, N'/Admin/Content/Upload/120220419164505avatar.webp')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (247, 32, 17, 3, 50, N'/Admin/Content/Upload/120220419164505avatar.webp')
SET IDENTITY_INSERT [dbo].[ProductDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductImage] ON 

INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (9, 10, N'/images/item-14.jpg')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (78, 19, N'/Admin/Content/Upload/120220318203202274631631_498653225214275_8699417978467316534_n.jpg')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (79, 19, N'/Admin/Content/Upload/120220318203202275017629_1176713696467520_7178042485241104266_n.jpg')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (80, 11, N'/images/item-1.jpg')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (81, 12, N'/images/item-2.jpg')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (82, 13, N'/images/item-3.jpg')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (83, 14, N'/images/item-4.jpg')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (84, 15, N'/images/item-5.jpg')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (85, 16, N'/images/item-6.jpg')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (86, 17, N'/images/item-7.jpg')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (87, 18, N'/images/item-8.jpg')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (88, 20, N'/Admin/Content/Upload/120220409081446sale-off-2 - Copy.jpg')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (89, 20, N'/Admin/Content/Upload/120220409081446item-14.jpg')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (90, 21, N'/Admin/Content/Upload/120220412150029giay-the-thao-new-balance-327-ms327stc-mau-den-gum-5fc6102098bcb-01122020164256.jpg')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (91, 21, N'/Admin/Content/Upload/120220412150029giay-the-thao-new-balance-327-ms327stc-mau-den-gum-5fc61020dbc59-01122020164256.jpg')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (92, 21, N'/Admin/Content/Upload/120220412150029Balance 327.jpg')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (98, 5, N'/Admin/Content/Upload/120220412150322item-7.jpg')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (99, 5, N'/Admin/Content/Upload/120220412150322item-8.jpg')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (100, 6, N'/Admin/Content/Upload/120220412150354sale-off-4-1-300x225.jpg')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (101, 6, N'/Admin/Content/Upload/120220412150354sale-off-4 - Copy.jpg')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (102, 7, N'/Admin/Content/Upload/120220412150816women-classic-2 - Copy.jpg')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (103, 7, N'/Admin/Content/Upload/120220412150816women-classic-2-1-300x225 - Copy.jpg')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (104, 7, N'/Admin/Content/Upload/120220412150816women-classic-3 - Copy.jpg')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (105, 7, N'/Admin/Content/Upload/120220412150816women-classic-3-1-300x225.jpg')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (106, 8, N'/Admin/Content/Upload/120220412150857women-sunbaked-4-1-300x225.jpg')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (107, 8, N'/Admin/Content/Upload/120220412150857women-sunbaked-4.jpg')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (108, 9, N'/Admin/Content/Upload/120220412150957women-classic-8.jpg')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (109, 9, N'/Admin/Content/Upload/120220412150957women-classic-8-1-300x225 - Copy.jpg')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (110, 4, N'/Admin/Content/Upload/120220412151341item-8.jpg')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (111, 4, N'/Admin/Content/Upload/120220412151341item-7.jpg')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (112, 22, N'/Admin/Content/Upload/1202204191452262c262b2c-67d7-4b6b-82eb-f441a5567b53.webp')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (113, 22, N'/Admin/Content/Upload/120220419145226db17ab49-5353-4d6b-8373-63b516dc4c52.webp')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (114, 22, N'/Admin/Content/Upload/120220419145226i1-88b61b02-fda2-4378-a259-ed819fb46aa5.webp')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (115, 22, N'/Admin/Content/Upload/120220419145226i1-57fcb887-0f6a-4edc-a0c9-bbdeb9d46005.webp')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (116, 23, N'/Admin/Content/Upload/120220419145312giay-cao-nam-tre-trung-GD288S-1.jpg')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (117, 23, N'/Admin/Content/Upload/120220419145312giay-cao-nam-tre-trung-GD288S-2.jpg')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (118, 23, N'/Admin/Content/Upload/120220419145312giay-cao-nam-tre-trung-GD288S-3.jpg')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (119, 24, N'/Admin/Content/Upload/120220419145348giay-cao-nam-tre-trung-FASTER-06M-3.jpg')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (120, 24, N'/Admin/Content/Upload/120220419145348giay-cao-nam-tre-trung-FASTER-06N-1.jpg')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (121, 24, N'/Admin/Content/Upload/120220419145348giay-cao-nam-tre-trung-FASTER-06N-2.jpg')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (122, 24, N'/Admin/Content/Upload/120220419145348giay-cao-nam-tre-trung-FASTER-06N-4.jpg')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (123, 24, N'/Admin/Content/Upload/120220419145348giay-cao-nam-tre-trung-FASTER-06N-5.jpg')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (124, 25, N'/Admin/Content/Upload/1202204191454393e1bc2a553d544318524acef0016d3ad_9366.webp')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (125, 25, N'/Admin/Content/Upload/1202204191454396d15927eae0e47009cc5acef00145536_9366.webp')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (126, 25, N'/Admin/Content/Upload/120220419145439a9ebccfc557c4bd3996aacef0010d64a_9366.webp')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (127, 25, N'/Admin/Content/Upload/120220419145439b5a564016218496d932bacef000eb76e_9366.webp')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (128, 25, N'/Admin/Content/Upload/120220419145439bc49df7251e4474dab21acef00140140_9366.webp')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (129, 25, N'/Admin/Content/Upload/120220419145439dc9b2ac866b14cdb9514acef000fa46e_9366.webp')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (130, 26, N'/Admin/Content/Upload/1202204191455131_5485f5a7a83a47b6ac2f1e2ecc9c15e2_master.webp')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (131, 26, N'/Admin/Content/Upload/1202204191455132_7066ad9d4ffc4abf93b89b6fd4666305_master.webp')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (132, 26, N'/Admin/Content/Upload/1202204191455133_77d5d936a4ab41eb80951b6a823059ac_master.webp')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (133, 26, N'/Admin/Content/Upload/1202204191455134_78e381095d5b462e9d46cb9eb63b1f0e_master.webp')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (134, 26, N'/Admin/Content/Upload/1202204191455135_6b3dec4b1ff748639f0dee4af3a4a08f_master.webp')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (135, 26, N'/Admin/Content/Upload/1202204191455136_0285b85d4449417aba5d816565403522_master.webp')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (136, 27, N'/Admin/Content/Upload/12022041914554478d27a22dc1e438fabf5ab5000f70927_9366.webp')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (137, 27, N'/Admin/Content/Upload/120220419145544804b2ddf9a1449318eceab5000f6f6fb_9366.webp')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (138, 27, N'/Admin/Content/Upload/120220419145544b5c4d9d92bd64c0da3d2ab5000f6e2d7_9366.webp')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (139, 27, N'/Admin/Content/Upload/120220419145544d3f4bdf1f3204db6ba2dab5000f6da2e_9366.webp')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (140, 27, N'/Admin/Content/Upload/120220419145544Giay_Galaxy_5_DJen_FW6125_02_standard_hover.jpg')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (141, 27, N'/Admin/Content/Upload/120220419145544Giay_Galaxy_5_DJen_FW6125_41_detail.jpg')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (142, 28, N'/Admin/Content/Upload/1202204191501072_b924f4c2fef046c0b6c66d7d358cc555_master.webp')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (143, 28, N'/Admin/Content/Upload/1202204191501071_b37476a6d763427c8205465de26e7985_master.webp')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (144, 28, N'/Admin/Content/Upload/1202204191501073_e3b27402e1ad4c239ca6b1ca12c7b023_master.webp')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (145, 28, N'/Admin/Content/Upload/12022041915010713_ce9ed174de12477b810358e0dc5e602d_master.webp')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (146, 29, N'/Admin/Content/Upload/120220419150151giay-cao-nam-tre-trung-GDC01X-1.jpg')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (147, 29, N'/Admin/Content/Upload/120220419150151giay-cao-nam-tre-trung-GDC01X-2.jpg')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (148, 29, N'/Admin/Content/Upload/120220419150151giay-cao-nam-tre-trung-GDC01X-4.jpg')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (149, 30, N'/Admin/Content/Upload/1202204191502183dfe3476-2164-4b40-ab1a-f22d47bd6c74.webp')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (150, 30, N'/Admin/Content/Upload/12022041915021875d323e5-e132-4f45-a134-895253831a33.webp')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (151, 30, N'/Admin/Content/Upload/120220419150218543974ae-f119-42a8-9198-072ccb76c064.webp')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (152, 30, N'/Admin/Content/Upload/12022041915021822731494-994c-4cc9-ba75-7d90a8e520b9.webp')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (153, 30, N'/Admin/Content/Upload/120220419150218ca3798f8-93b2-4f83-9b8d-4d8e0a1b49e4.webp')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (154, 31, N'/Admin/Content/Upload/12022041915025189a3c86c-2a5e-4fbe-ac92-5d1077d13182.webp')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (155, 31, N'/Admin/Content/Upload/12022041915025196e08d41-f4af-4c34-9591-717c20b00499.webp')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (156, 31, N'/Admin/Content/Upload/12022041915025131060365-58b7-4009-b53a-5d4cfcb5ba0d.webp')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (157, 31, N'/Admin/Content/Upload/12022041915025197696125-ba37-4ff7-b811-691041d0f164.webp')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (158, 31, N'/Admin/Content/Upload/120220419150251a88e5a5c-b343-4e65-8f56-26452d081d64.webp')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (159, 32, N'/Admin/Content/Upload/1202204191503162e333ce7-5f14-4a87-bc6d-873e755785cc.webp')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (160, 32, N'/Admin/Content/Upload/1202204191503168e25b6e2-9415-4cdc-925b-7bed15985609.webp')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (161, 32, N'/Admin/Content/Upload/120220419150316a184b6d6-358a-4b57-a565-5b6ed50dc53f.webp')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (162, 32, N'/Admin/Content/Upload/120220419150316c3798047-b3f4-4bfc-912f-99ab7d6e094a.webp')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (163, 32, N'/Admin/Content/Upload/120220419150316e139c0d5-36d1-4687-ae12-d4bf485aa803.webp')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (164, 33, N'/Admin/Content/Upload/120220419150340giay-cao-nam-tre-trung-SMART68D-1.jpg')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (165, 33, N'/Admin/Content/Upload/120220419150340giay-cao-nam-tre-trung-SMART68D-2.jpg')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (166, 33, N'/Admin/Content/Upload/120220419150340giay-cao-nam-tre-trung-SMART68D-3.jpg')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (167, 34, N'/Admin/Content/Upload/120220419150434den_tt03037_1_0b24879bfd3a4527a801c8b5c766b59b_master.webp')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (168, 34, N'/Admin/Content/Upload/120220419150434den_tt03037_2_ee27972816e443979a233b7d1c74d2f2_master.webp')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (169, 34, N'/Admin/Content/Upload/120220419150434den_tt03037_7_66ff745661bc4560be2f1ecd565c440a_master.webp')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (170, 35, N'/Admin/Content/Upload/120220419150501hong_tt03040_1_0ac57066ed334ab3af43290c102a7ebe_master.webp')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (171, 35, N'/Admin/Content/Upload/120220419150501hong_tt03040_2_0e1ec74a4b064da7bea9b68c9be54dd5_master.webp')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (172, 35, N'/Admin/Content/Upload/120220419150501hong_tt03040_3_96b99bec808a4427aadee275e84f1c7a_master.webp')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (173, 35, N'/Admin/Content/Upload/120220419150501hong_tt03040_4_3852d72907b245958744504788b94d42_master.webp')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (174, 36, N'/Admin/Content/Upload/120220419150530xanh-la_tt03041_1_1d8b3e344f0045108be4de3447883510_master.webp')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (175, 36, N'/Admin/Content/Upload/120220419150530xanh-la_tt03041_2_49b51c442ec0443fb11b019a77e974d1_master.webp')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (176, 36, N'/Admin/Content/Upload/120220419150530xanh-la_tt03041_3_8cd4fcc39e3a4df0ab3a925674e44925_master.webp')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (177, 36, N'/Admin/Content/Upload/120220419150530xanh-la_tt03041_4_0d9c5f16e5ce4b1da132c7a64dde152d_master.webp')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (178, 36, N'/Admin/Content/Upload/120220419150530xanh-la_tt03041_5_59feebb85a2641dbbb2ffd964f69bd1f_master.webp')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (179, 36, N'/Admin/Content/Upload/120220419150530xanh-la_tt03041_8_b6a322ddcb61458f94bff5a4d653829c_master.webp')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (180, 37, N'/Admin/Content/Upload/120220419150614hong-kem_tt07004_1_5bfad0a7c100404e9479a99cb91b946f_master.webp')
GO
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (181, 37, N'/Admin/Content/Upload/120220419150614hong-kem_tt07004_2_d3d4a726db094a74934675743b5d11bd_master.webp')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (182, 37, N'/Admin/Content/Upload/120220419150614hong-kem_tt07004_3_4dea440729204934affe4c84c0146749_master.webp')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (183, 37, N'/Admin/Content/Upload/120220419150614hong-kem_tt07004_5_fa9e53b2d6e24466a1831ddb6c4162c1_master.webp')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (184, 38, N'/Admin/Content/Upload/1202204191506500b7ac5caa58241119780ae080097911b_9366.webp')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (185, 38, N'/Admin/Content/Upload/12022041915065006a1fb94bd3f4a669a1aae0800968a82_9366.webp')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (186, 38, N'/Admin/Content/Upload/12022041915065009b9b10433014fd2b3e0ae08009755a8_9366.webp')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (187, 38, N'/Admin/Content/Upload/1202204191506509f1aecfe552f44beb8eaae080097e2b6_9366.webp')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (188, 39, N'/Admin/Content/Upload/1202204191507187c5e5be55de14c6e9db0acbb016f88be_9366.webp')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (189, 39, N'/Admin/Content/Upload/12022041915071862d10dcc99ab4bec8e9facbb011e8255_9366.webp')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (190, 39, N'/Admin/Content/Upload/12022041915071869cbc73d0cb846889f89acbb011e68cb_9366.webp')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (191, 39, N'/Admin/Content/Upload/12022041915071846661f456e83432eb233acbb011e8925_9366.webp')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (192, 39, N'/Admin/Content/Upload/12022041915071883143ffe0a644c83b712acbb011e7ae2_9366.webp')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (193, 39, N'/Admin/Content/Upload/120220419150718c8953617284f4c47b613acbb011e74ee_9366.webp')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (194, 40, N'/Admin/Content/Upload/12022041915075196b64a04801f491e915cae6a01078038_9366.webp')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (195, 40, N'/Admin/Content/Upload/1202204191507515ee29caaf85f405da297ae6a01076fb7_9366.webp')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (196, 40, N'/Admin/Content/Upload/120220419150751863d1c6937de49568550ae6a01077842_9366.webp')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (197, 40, N'/Admin/Content/Upload/120220419150751aa31086c90d24bd28994ae6a0107896f_9366.webp')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (198, 41, N'/Admin/Content/Upload/120220419150810030ba2a432ec4490b4bbae14010e66c5_9366.webp')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (199, 41, N'/Admin/Content/Upload/12022041915081048a9472419134511a833ae14010e6dc1_9366.webp')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (200, 41, N'/Admin/Content/Upload/120220419150810940b9a5662ec42fe801aae14010e5f39_9366.webp')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (201, 41, N'/Admin/Content/Upload/1202204191508105056f46804d5486693acae14010e5784_9366.webp')
SET IDENTITY_INSERT [dbo].[ProductImage] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductPrice] ON 

INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (1, CAST(10000 AS Decimal(18, 0)), CAST(1100000 AS Decimal(18, 0)), CAST(N'2022-03-14T20:29:33.083' AS DateTime), 4)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (2, CAST(10000 AS Decimal(18, 0)), CAST(1200000 AS Decimal(18, 0)), CAST(N'2022-03-14T20:29:33.083' AS DateTime), 5)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (3, CAST(10000 AS Decimal(18, 0)), CAST(2000000 AS Decimal(18, 0)), CAST(N'2022-03-13T20:29:33.083' AS DateTime), 4)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (4, CAST(10000 AS Decimal(18, 0)), CAST(1100000 AS Decimal(18, 0)), CAST(N'2022-03-13T20:29:34.153' AS DateTime), 3)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (5, CAST(10000 AS Decimal(18, 0)), CAST(1100000 AS Decimal(18, 0)), CAST(N'2022-03-13T20:29:35.813' AS DateTime), 2)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (6, CAST(120000 AS Decimal(18, 0)), CAST(3000000 AS Decimal(18, 0)), CAST(N'2022-03-15T18:47:00.547' AS DateTime), 1)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (7, CAST(200000 AS Decimal(18, 0)), CAST(4000000 AS Decimal(18, 0)), CAST(N'2022-03-22T22:52:01.387' AS DateTime), 8)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (8, CAST(10000 AS Decimal(18, 0)), CAST(10000 AS Decimal(18, 0)), CAST(N'2022-03-25T08:06:48.260' AS DateTime), 7)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (9, CAST(10000 AS Decimal(18, 0)), CAST(1100000 AS Decimal(18, 0)), CAST(N'2022-03-25T08:07:18.910' AS DateTime), 11)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (10, CAST(10000 AS Decimal(18, 0)), CAST(1100000 AS Decimal(18, 0)), CAST(N'2022-03-25T08:07:20.097' AS DateTime), 12)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (11, CAST(10000 AS Decimal(18, 0)), CAST(1234000 AS Decimal(18, 0)), CAST(N'2022-03-25T08:07:21.600' AS DateTime), 13)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (12, CAST(10000 AS Decimal(18, 0)), CAST(3000000 AS Decimal(18, 0)), CAST(N'2022-03-25T08:07:22.720' AS DateTime), 14)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (13, CAST(10000 AS Decimal(18, 0)), CAST(200000 AS Decimal(18, 0)), CAST(N'2022-03-25T08:07:23.843' AS DateTime), 15)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (14, CAST(10000 AS Decimal(18, 0)), CAST(1841000 AS Decimal(18, 0)), CAST(N'2022-03-25T08:07:25.157' AS DateTime), 16)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (15, CAST(10000 AS Decimal(18, 0)), CAST(3000000 AS Decimal(18, 0)), CAST(N'2022-03-25T08:07:27.603' AS DateTime), 17)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (16, CAST(10000 AS Decimal(18, 0)), CAST(1841000 AS Decimal(18, 0)), CAST(N'2022-03-25T08:08:00.390' AS DateTime), 18)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (17, CAST(1841000 AS Decimal(18, 0)), CAST(3000000 AS Decimal(18, 0)), CAST(N'2022-03-25T08:18:56.037' AS DateTime), 19)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (18, CAST(10000 AS Decimal(18, 0)), CAST(4000000 AS Decimal(18, 0)), CAST(N'2022-03-25T08:21:05.317' AS DateTime), 20)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (19, CAST(10000 AS Decimal(18, 0)), CAST(8000000 AS Decimal(18, 0)), CAST(N'2022-03-25T08:21:14.650' AS DateTime), 21)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (20, CAST(10000 AS Decimal(18, 0)), CAST(1100000 AS Decimal(18, 0)), CAST(N'2022-04-06T23:23:40.147' AS DateTime), 3)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (21, CAST(10000 AS Decimal(18, 0)), CAST(1100000 AS Decimal(18, 0)), CAST(N'2022-04-06T23:24:10.193' AS DateTime), 3)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (22, CAST(10000 AS Decimal(18, 0)), CAST(1100000 AS Decimal(18, 0)), CAST(N'2022-04-06T23:24:11.987' AS DateTime), 3)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (23, CAST(10000 AS Decimal(18, 0)), CAST(40000 AS Decimal(18, 0)), CAST(N'2022-04-06T23:24:36.323' AS DateTime), 3)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (24, CAST(10000 AS Decimal(18, 0)), CAST(1100000 AS Decimal(18, 0)), CAST(N'2022-04-06T23:41:58.637' AS DateTime), 3)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (25, CAST(100000 AS Decimal(18, 0)), CAST(1100000 AS Decimal(18, 0)), CAST(N'2022-04-06T23:42:08.507' AS DateTime), 3)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (26, CAST(100000 AS Decimal(18, 0)), CAST(100000 AS Decimal(18, 0)), CAST(N'2022-04-06T23:47:36.307' AS DateTime), 64)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (27, CAST(100000 AS Decimal(18, 0)), CAST(100000 AS Decimal(18, 0)), CAST(N'2022-04-06T23:48:58.630' AS DateTime), 65)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (28, CAST(50000 AS Decimal(18, 0)), CAST(50000 AS Decimal(18, 0)), CAST(N'2022-04-06T23:51:24.670' AS DateTime), 66)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (29, CAST(50000 AS Decimal(18, 0)), CAST(50000 AS Decimal(18, 0)), CAST(N'2022-04-06T23:58:11.677' AS DateTime), 67)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (30, CAST(500000 AS Decimal(18, 0)), CAST(500000 AS Decimal(18, 0)), CAST(N'2022-04-07T00:16:53.953' AS DateTime), 68)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (31, CAST(1000 AS Decimal(18, 0)), CAST(1000 AS Decimal(18, 0)), CAST(N'2022-04-07T00:17:11.480' AS DateTime), 69)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (32, CAST(1000000 AS Decimal(18, 0)), CAST(1000000 AS Decimal(18, 0)), CAST(N'2022-04-07T00:18:58.600' AS DateTime), 70)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (33, CAST(3 AS Decimal(18, 0)), CAST(3 AS Decimal(18, 0)), CAST(N'2022-04-07T00:19:18.790' AS DateTime), 70)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (34, CAST(100 AS Decimal(18, 0)), CAST(1000000 AS Decimal(18, 0)), CAST(N'2022-04-07T00:23:27.403' AS DateTime), 70)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (35, CAST(1000000 AS Decimal(18, 0)), CAST(10000 AS Decimal(18, 0)), CAST(N'2022-04-07T00:23:41.817' AS DateTime), 70)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (36, CAST(50000 AS Decimal(18, 0)), CAST(100000 AS Decimal(18, 0)), CAST(N'2022-04-07T00:24:06.730' AS DateTime), 70)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (37, CAST(10000 AS Decimal(18, 0)), CAST(20000 AS Decimal(18, 0)), CAST(N'2022-04-07T00:24:46.607' AS DateTime), 28)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (38, CAST(10000 AS Decimal(18, 0)), CAST(20000 AS Decimal(18, 0)), CAST(N'2022-04-07T00:24:59.493' AS DateTime), 40)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (39, CAST(10000 AS Decimal(18, 0)), CAST(20000 AS Decimal(18, 0)), CAST(N'2022-04-07T00:25:07.933' AS DateTime), 40)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (40, CAST(100000 AS Decimal(18, 0)), CAST(100000 AS Decimal(18, 0)), CAST(N'2022-04-07T00:25:14.897' AS DateTime), 64)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (41, CAST(100000 AS Decimal(18, 0)), CAST(100000 AS Decimal(18, 0)), CAST(N'2022-04-07T00:25:23.940' AS DateTime), 65)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (42, CAST(50000 AS Decimal(18, 0)), CAST(50000 AS Decimal(18, 0)), CAST(N'2022-04-07T00:25:27.517' AS DateTime), 66)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (43, CAST(50000 AS Decimal(18, 0)), CAST(50000 AS Decimal(18, 0)), CAST(N'2022-04-07T00:25:37.923' AS DateTime), 66)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (44, CAST(50000 AS Decimal(18, 0)), CAST(50000 AS Decimal(18, 0)), CAST(N'2022-04-07T00:25:45.237' AS DateTime), 67)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (45, CAST(1000000 AS Decimal(18, 0)), CAST(1000000 AS Decimal(18, 0)), CAST(N'2022-04-07T00:25:52.077' AS DateTime), 70)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (46, CAST(10000 AS Decimal(18, 0)), CAST(1100000 AS Decimal(18, 0)), CAST(N'2022-04-12T15:05:45.233' AS DateTime), 3)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (47, CAST(10000 AS Decimal(18, 0)), CAST(10000 AS Decimal(18, 0)), CAST(N'2022-04-12T15:05:51.507' AS DateTime), 7)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (48, CAST(10000 AS Decimal(18, 0)), CAST(1100000 AS Decimal(18, 0)), CAST(N'2022-04-12T15:05:58.257' AS DateTime), 12)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (49, CAST(10000 AS Decimal(18, 0)), CAST(1234000 AS Decimal(18, 0)), CAST(N'2022-04-12T15:06:04.303' AS DateTime), 13)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (50, CAST(10000 AS Decimal(18, 0)), CAST(1841000 AS Decimal(18, 0)), CAST(N'2022-04-12T15:06:09.200' AS DateTime), 16)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (51, CAST(1841000 AS Decimal(18, 0)), CAST(3000000 AS Decimal(18, 0)), CAST(N'2022-04-12T15:06:14.370' AS DateTime), 19)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (52, CAST(10000 AS Decimal(18, 0)), CAST(8000000 AS Decimal(18, 0)), CAST(N'2022-04-12T15:06:20.590' AS DateTime), 21)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (53, CAST(10000 AS Decimal(18, 0)), CAST(20000 AS Decimal(18, 0)), CAST(N'2022-04-12T15:06:25.963' AS DateTime), 28)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (54, CAST(10000 AS Decimal(18, 0)), CAST(20000 AS Decimal(18, 0)), CAST(N'2022-04-12T15:06:32.270' AS DateTime), 40)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (55, CAST(1000000 AS Decimal(18, 0)), CAST(1000000 AS Decimal(18, 0)), CAST(N'2022-04-12T15:06:44.030' AS DateTime), 70)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (56, CAST(100000 AS Decimal(18, 0)), CAST(200000 AS Decimal(18, 0)), CAST(N'2022-04-12T15:15:12.207' AS DateTime), 9)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (57, CAST(10000 AS Decimal(18, 0)), CAST(1100000 AS Decimal(18, 0)), CAST(N'2022-04-12T15:16:36.813' AS DateTime), 11)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (58, CAST(10000 AS Decimal(18, 0)), CAST(200000 AS Decimal(18, 0)), CAST(N'2022-04-12T15:21:50.873' AS DateTime), 15)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (59, CAST(10000 AS Decimal(18, 0)), CAST(200000 AS Decimal(18, 0)), CAST(N'2022-04-12T15:21:59.450' AS DateTime), 15)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (60, CAST(10000 AS Decimal(18, 0)), CAST(200000 AS Decimal(18, 0)), CAST(N'2022-04-12T15:22:16.780' AS DateTime), 15)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (61, CAST(10000 AS Decimal(18, 0)), CAST(10000 AS Decimal(18, 0)), CAST(N'2022-04-12T15:42:46.203' AS DateTime), 74)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (62, CAST(100000 AS Decimal(18, 0)), CAST(100000 AS Decimal(18, 0)), CAST(N'2022-04-12T15:48:12.730' AS DateTime), 75)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (63, CAST(100000 AS Decimal(18, 0)), CAST(200000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:14:50.230' AS DateTime), 76)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (64, CAST(100000 AS Decimal(18, 0)), CAST(200000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:15:41.980' AS DateTime), 77)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (65, CAST(100000 AS Decimal(18, 0)), CAST(200000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:15:58.447' AS DateTime), 78)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (66, CAST(100000 AS Decimal(18, 0)), CAST(200000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:16:13.323' AS DateTime), 79)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (67, CAST(100000 AS Decimal(18, 0)), CAST(200000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:16:38.810' AS DateTime), 80)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (68, CAST(100000 AS Decimal(18, 0)), CAST(100000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:16:48.560' AS DateTime), 81)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (69, CAST(100000 AS Decimal(18, 0)), CAST(200000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:17:03.183' AS DateTime), 82)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (70, CAST(100000 AS Decimal(18, 0)), CAST(200000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:17:20.613' AS DateTime), 83)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (71, CAST(100000 AS Decimal(18, 0)), CAST(210000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:17:33.960' AS DateTime), 83)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (72, CAST(100000 AS Decimal(18, 0)), CAST(210000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:17:49.550' AS DateTime), 84)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (73, CAST(100000 AS Decimal(18, 0)), CAST(210000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:18:03.437' AS DateTime), 85)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (74, CAST(100000 AS Decimal(18, 0)), CAST(210000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:18:18.320' AS DateTime), 86)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (75, CAST(100000 AS Decimal(18, 0)), CAST(210000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:18:30.483' AS DateTime), 87)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (76, CAST(100000 AS Decimal(18, 0)), CAST(210000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:18:45.613' AS DateTime), 88)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (77, CAST(100000 AS Decimal(18, 0)), CAST(210000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:18:58.570' AS DateTime), 89)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (78, CAST(100000 AS Decimal(18, 0)), CAST(220000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:19:20.680' AS DateTime), 90)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (79, CAST(100000 AS Decimal(18, 0)), CAST(220000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:19:32.827' AS DateTime), 91)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (80, CAST(100000 AS Decimal(18, 0)), CAST(220000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:19:47.780' AS DateTime), 92)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (81, CAST(100000 AS Decimal(18, 0)), CAST(220000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:20:05.860' AS DateTime), 93)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (82, CAST(100000 AS Decimal(18, 0)), CAST(220000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:20:05.860' AS DateTime), 94)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (83, CAST(100000 AS Decimal(18, 0)), CAST(220000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:20:05.860' AS DateTime), 95)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (84, CAST(100000 AS Decimal(18, 0)), CAST(220000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:20:05.860' AS DateTime), 96)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (85, CAST(100000 AS Decimal(18, 0)), CAST(220000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:22:01.000' AS DateTime), 94)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (86, CAST(100000 AS Decimal(18, 0)), CAST(220000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:22:07.540' AS DateTime), 95)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (87, CAST(100000 AS Decimal(18, 0)), CAST(220000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:22:14.923' AS DateTime), 96)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (88, CAST(200000 AS Decimal(18, 0)), CAST(450000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:22:31.463' AS DateTime), 97)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (89, CAST(200000 AS Decimal(18, 0)), CAST(450000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:22:31.463' AS DateTime), 98)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (90, CAST(200000 AS Decimal(18, 0)), CAST(450000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:22:31.463' AS DateTime), 99)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (91, CAST(200000 AS Decimal(18, 0)), CAST(450000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:22:31.463' AS DateTime), 100)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (92, CAST(200000 AS Decimal(18, 0)), CAST(450000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:22:31.463' AS DateTime), 101)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (93, CAST(200000 AS Decimal(18, 0)), CAST(450000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:22:31.463' AS DateTime), 102)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (94, CAST(200000 AS Decimal(18, 0)), CAST(450000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:22:31.463' AS DateTime), 103)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (95, CAST(200000 AS Decimal(18, 0)), CAST(450000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:25:38.460' AS DateTime), 98)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (96, CAST(200000 AS Decimal(18, 0)), CAST(450000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:25:47.720' AS DateTime), 99)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (97, CAST(0 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), CAST(N'2022-04-19T16:26:45.830' AS DateTime), 104)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (98, CAST(100000 AS Decimal(18, 0)), CAST(3000000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:27:33.597' AS DateTime), 104)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (99, CAST(100000 AS Decimal(18, 0)), CAST(3000000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:27:50.240' AS DateTime), 105)
GO
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (100, CAST(100000 AS Decimal(18, 0)), CAST(3000000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:27:50.240' AS DateTime), 106)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (101, CAST(100000 AS Decimal(18, 0)), CAST(3000000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:27:33.597' AS DateTime), 107)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (102, CAST(100000 AS Decimal(18, 0)), CAST(3000000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:27:50.240' AS DateTime), 108)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (103, CAST(100000 AS Decimal(18, 0)), CAST(3000000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:27:50.240' AS DateTime), 108)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (104, CAST(100000 AS Decimal(18, 0)), CAST(3000000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:27:33.597' AS DateTime), 109)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (105, CAST(200000 AS Decimal(18, 0)), CAST(5000000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:29:41.570' AS DateTime), 111)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (106, CAST(200000 AS Decimal(18, 0)), CAST(5000000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:29:41.570' AS DateTime), 112)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (107, CAST(200000 AS Decimal(18, 0)), CAST(5000000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:29:41.570' AS DateTime), 113)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (108, CAST(200000 AS Decimal(18, 0)), CAST(5000000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:29:41.570' AS DateTime), 114)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (109, CAST(200000 AS Decimal(18, 0)), CAST(5000000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:29:41.570' AS DateTime), 115)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (110, CAST(200000 AS Decimal(18, 0)), CAST(5000000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:29:41.570' AS DateTime), 116)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (111, CAST(200000 AS Decimal(18, 0)), CAST(5000000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:29:41.570' AS DateTime), 117)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (112, CAST(100000 AS Decimal(18, 0)), CAST(3000000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:27:33.597' AS DateTime), 110)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (113, CAST(1000000 AS Decimal(18, 0)), CAST(2000000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:32:11.110' AS DateTime), 118)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (114, CAST(1000000 AS Decimal(18, 0)), CAST(2000000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:32:11.110' AS DateTime), 119)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (115, CAST(1000000 AS Decimal(18, 0)), CAST(2000000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:32:11.110' AS DateTime), 120)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (116, CAST(1000000 AS Decimal(18, 0)), CAST(2000000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:32:11.110' AS DateTime), 121)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (117, CAST(1000000 AS Decimal(18, 0)), CAST(2000000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:32:11.110' AS DateTime), 122)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (118, CAST(1000000 AS Decimal(18, 0)), CAST(2000000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:32:11.110' AS DateTime), 123)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (119, CAST(1000000 AS Decimal(18, 0)), CAST(2000000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:32:11.110' AS DateTime), 124)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (136, CAST(1100000 AS Decimal(18, 0)), CAST(2000000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:45:59.987' AS DateTime), 125)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (137, CAST(1100000 AS Decimal(18, 0)), CAST(2000000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:45:59.987' AS DateTime), 126)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (138, CAST(1100000 AS Decimal(18, 0)), CAST(2000000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:45:59.987' AS DateTime), 127)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (139, CAST(1100000 AS Decimal(18, 0)), CAST(2000000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:45:59.987' AS DateTime), 128)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (140, CAST(1100000 AS Decimal(18, 0)), CAST(2000000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:45:59.987' AS DateTime), 129)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (141, CAST(1100000 AS Decimal(18, 0)), CAST(2000000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:45:59.987' AS DateTime), 130)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (142, CAST(1100000 AS Decimal(18, 0)), CAST(2000000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:45:59.987' AS DateTime), 131)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (143, CAST(1100000 AS Decimal(18, 0)), CAST(2000000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:45:59.987' AS DateTime), 132)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (144, CAST(1100000 AS Decimal(18, 0)), CAST(2000000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:45:59.987' AS DateTime), 133)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (145, CAST(1100000 AS Decimal(18, 0)), CAST(2000000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:45:59.987' AS DateTime), 134)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (146, CAST(1100000 AS Decimal(18, 0)), CAST(2000000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:45:59.987' AS DateTime), 135)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (147, CAST(1100000 AS Decimal(18, 0)), CAST(2000000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:45:59.987' AS DateTime), 136)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (148, CAST(1100000 AS Decimal(18, 0)), CAST(2000000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:45:59.987' AS DateTime), 137)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (149, CAST(1100000 AS Decimal(18, 0)), CAST(2000000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:45:59.987' AS DateTime), 138)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (150, CAST(1100000 AS Decimal(18, 0)), CAST(2000000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:45:59.987' AS DateTime), 139)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (151, CAST(1100000 AS Decimal(18, 0)), CAST(2000000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:45:59.987' AS DateTime), 140)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (152, CAST(1100000 AS Decimal(18, 0)), CAST(2000000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:45:59.987' AS DateTime), 141)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (153, CAST(1100000 AS Decimal(18, 0)), CAST(2000000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:45:59.987' AS DateTime), 142)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (154, CAST(1100000 AS Decimal(18, 0)), CAST(2000000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:45:59.987' AS DateTime), 143)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (155, CAST(1100000 AS Decimal(18, 0)), CAST(2000000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:45:59.987' AS DateTime), 144)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (156, CAST(1100000 AS Decimal(18, 0)), CAST(2000000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:45:59.987' AS DateTime), 145)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (157, CAST(1100000 AS Decimal(18, 0)), CAST(2000000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:45:59.987' AS DateTime), 146)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (158, CAST(1100000 AS Decimal(18, 0)), CAST(2000000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:45:59.987' AS DateTime), 147)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (159, CAST(1100000 AS Decimal(18, 0)), CAST(2000000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:45:59.987' AS DateTime), 148)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (160, CAST(1100000 AS Decimal(18, 0)), CAST(2000000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:45:59.987' AS DateTime), 148)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (161, CAST(1100000 AS Decimal(18, 0)), CAST(2000000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:45:59.987' AS DateTime), 149)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (162, CAST(1100000 AS Decimal(18, 0)), CAST(2000000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:45:59.987' AS DateTime), 150)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (163, CAST(1100000 AS Decimal(18, 0)), CAST(2000000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:45:59.987' AS DateTime), 151)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (164, CAST(1100000 AS Decimal(18, 0)), CAST(2000000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:45:59.987' AS DateTime), 152)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (165, CAST(1100000 AS Decimal(18, 0)), CAST(2000000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:45:59.987' AS DateTime), 153)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (166, CAST(1100000 AS Decimal(18, 0)), CAST(2000000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:45:59.987' AS DateTime), 154)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (167, CAST(1100000 AS Decimal(18, 0)), CAST(2000000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:45:59.987' AS DateTime), 155)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (168, CAST(1100000 AS Decimal(18, 0)), CAST(2000000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:45:59.987' AS DateTime), 156)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (169, CAST(1100000 AS Decimal(18, 0)), CAST(2000000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:45:59.987' AS DateTime), 157)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (170, CAST(1100000 AS Decimal(18, 0)), CAST(2000000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:45:59.987' AS DateTime), 158)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (171, CAST(1100000 AS Decimal(18, 0)), CAST(2000000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:45:59.987' AS DateTime), 159)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (172, CAST(1100000 AS Decimal(18, 0)), CAST(2000000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:45:59.987' AS DateTime), 160)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (173, CAST(1100000 AS Decimal(18, 0)), CAST(2000000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:45:59.987' AS DateTime), 161)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (174, CAST(1100000 AS Decimal(18, 0)), CAST(2000000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:45:59.987' AS DateTime), 162)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (175, CAST(1100000 AS Decimal(18, 0)), CAST(2000000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:45:59.987' AS DateTime), 163)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (176, CAST(1100000 AS Decimal(18, 0)), CAST(2000000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:45:59.987' AS DateTime), 164)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (177, CAST(1100000 AS Decimal(18, 0)), CAST(2000000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:45:59.987' AS DateTime), 165)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (178, CAST(1100000 AS Decimal(18, 0)), CAST(2000000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:45:59.987' AS DateTime), 166)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (179, CAST(1100000 AS Decimal(18, 0)), CAST(2000000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:45:59.987' AS DateTime), 167)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (180, CAST(1100000 AS Decimal(18, 0)), CAST(2000000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:45:59.987' AS DateTime), 168)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (181, CAST(1100000 AS Decimal(18, 0)), CAST(2000000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:45:59.987' AS DateTime), 169)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (182, CAST(1100000 AS Decimal(18, 0)), CAST(2000000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:45:59.987' AS DateTime), 170)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (183, CAST(1100000 AS Decimal(18, 0)), CAST(2000000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:45:59.987' AS DateTime), 171)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (184, CAST(1100000 AS Decimal(18, 0)), CAST(2000000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:45:59.987' AS DateTime), 172)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (185, CAST(1100000 AS Decimal(18, 0)), CAST(2000000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:45:59.987' AS DateTime), 173)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (186, CAST(1100000 AS Decimal(18, 0)), CAST(2000000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:45:59.987' AS DateTime), 174)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (187, CAST(1100000 AS Decimal(18, 0)), CAST(2000000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:45:59.987' AS DateTime), 175)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (188, CAST(1100000 AS Decimal(18, 0)), CAST(2000000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:45:59.987' AS DateTime), 176)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (189, CAST(1100000 AS Decimal(18, 0)), CAST(2000000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:45:59.987' AS DateTime), 177)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (190, CAST(1100000 AS Decimal(18, 0)), CAST(3100000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:45:59.987' AS DateTime), 178)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (191, CAST(1100000 AS Decimal(18, 0)), CAST(3100000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:45:59.987' AS DateTime), 179)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (192, CAST(1100000 AS Decimal(18, 0)), CAST(3100000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:45:59.987' AS DateTime), 180)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (193, CAST(1100000 AS Decimal(18, 0)), CAST(3100000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:45:59.987' AS DateTime), 181)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (194, CAST(1100000 AS Decimal(18, 0)), CAST(3100000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:45:59.987' AS DateTime), 182)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (195, CAST(1100000 AS Decimal(18, 0)), CAST(3100000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:45:59.987' AS DateTime), 183)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (196, CAST(1100000 AS Decimal(18, 0)), CAST(3100000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:45:59.987' AS DateTime), 184)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (197, CAST(1100000 AS Decimal(18, 0)), CAST(3100000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:45:59.987' AS DateTime), 185)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (198, CAST(1100000 AS Decimal(18, 0)), CAST(3100000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:45:59.987' AS DateTime), 186)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (199, CAST(1100000 AS Decimal(18, 0)), CAST(3100000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:45:59.987' AS DateTime), 187)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (200, CAST(1100000 AS Decimal(18, 0)), CAST(3100000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:45:59.987' AS DateTime), 188)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (201, CAST(1100000 AS Decimal(18, 0)), CAST(3100000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:45:59.987' AS DateTime), 189)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (202, CAST(1100000 AS Decimal(18, 0)), CAST(3100000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:45:59.987' AS DateTime), 190)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (203, CAST(1100000 AS Decimal(18, 0)), CAST(3100000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:45:59.987' AS DateTime), 191)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (204, CAST(1100000 AS Decimal(18, 0)), CAST(3100000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:45:59.987' AS DateTime), 192)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (205, CAST(1100000 AS Decimal(18, 0)), CAST(3100000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:45:59.987' AS DateTime), 193)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (206, CAST(1100000 AS Decimal(18, 0)), CAST(3100000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:45:59.987' AS DateTime), 194)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (207, CAST(1100000 AS Decimal(18, 0)), CAST(3100000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:45:59.987' AS DateTime), 195)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (208, CAST(1100000 AS Decimal(18, 0)), CAST(3100000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:45:59.987' AS DateTime), 196)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (209, CAST(1100000 AS Decimal(18, 0)), CAST(3100000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:45:59.987' AS DateTime), 197)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (210, CAST(1100000 AS Decimal(18, 0)), CAST(3100000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:45:59.987' AS DateTime), 198)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (211, CAST(1100000 AS Decimal(18, 0)), CAST(3100000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:45:59.987' AS DateTime), 199)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (212, CAST(1100000 AS Decimal(18, 0)), CAST(3100000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:45:59.987' AS DateTime), 200)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (213, CAST(1100000 AS Decimal(18, 0)), CAST(3100000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:45:59.987' AS DateTime), 201)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (214, CAST(1100000 AS Decimal(18, 0)), CAST(3100000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:45:59.987' AS DateTime), 202)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (215, CAST(1100000 AS Decimal(18, 0)), CAST(3100000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:45:59.987' AS DateTime), 203)
GO
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (216, CAST(1100000 AS Decimal(18, 0)), CAST(3100000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:45:59.987' AS DateTime), 204)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (217, CAST(1100000 AS Decimal(18, 0)), CAST(3100000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:45:59.987' AS DateTime), 205)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (218, CAST(1100000 AS Decimal(18, 0)), CAST(3100000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:45:59.987' AS DateTime), 206)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (219, CAST(1100000 AS Decimal(18, 0)), CAST(3100000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:45:59.987' AS DateTime), 207)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (220, CAST(1100000 AS Decimal(18, 0)), CAST(3100000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:45:59.987' AS DateTime), 208)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (221, CAST(1100000 AS Decimal(18, 0)), CAST(3100000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:45:59.987' AS DateTime), 209)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (222, CAST(1100000 AS Decimal(18, 0)), CAST(3100000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:45:59.987' AS DateTime), 210)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (223, CAST(1100000 AS Decimal(18, 0)), CAST(3300000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:45:59.987' AS DateTime), 211)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (224, CAST(1100000 AS Decimal(18, 0)), CAST(3300000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:45:59.987' AS DateTime), 212)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (225, CAST(1100000 AS Decimal(18, 0)), CAST(3300000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:45:59.987' AS DateTime), 213)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (226, CAST(1100000 AS Decimal(18, 0)), CAST(3300000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:45:59.987' AS DateTime), 214)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (227, CAST(1100000 AS Decimal(18, 0)), CAST(3300000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:45:59.987' AS DateTime), 215)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (228, CAST(1100000 AS Decimal(18, 0)), CAST(3300000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:45:59.987' AS DateTime), 216)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (229, CAST(1100000 AS Decimal(18, 0)), CAST(3300000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:45:59.987' AS DateTime), 217)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (230, CAST(1100000 AS Decimal(18, 0)), CAST(3300000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:45:59.987' AS DateTime), 218)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (231, CAST(1100000 AS Decimal(18, 0)), CAST(3300000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:45:59.987' AS DateTime), 219)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (232, CAST(1100000 AS Decimal(18, 0)), CAST(3100000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:45:59.987' AS DateTime), 220)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (233, CAST(1100000 AS Decimal(18, 0)), CAST(3100000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:45:59.987' AS DateTime), 221)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (234, CAST(1100000 AS Decimal(18, 0)), CAST(3100000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:45:59.987' AS DateTime), 222)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (235, CAST(1100000 AS Decimal(18, 0)), CAST(3100000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:45:59.987' AS DateTime), 223)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (236, CAST(1100000 AS Decimal(18, 0)), CAST(3100000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:45:59.987' AS DateTime), 224)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (237, CAST(1100000 AS Decimal(18, 0)), CAST(3100000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:45:59.987' AS DateTime), 225)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (238, CAST(1100000 AS Decimal(18, 0)), CAST(3100000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:45:59.987' AS DateTime), 226)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (239, CAST(1100000 AS Decimal(18, 0)), CAST(3100000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:45:59.987' AS DateTime), 227)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (240, CAST(1100000 AS Decimal(18, 0)), CAST(3100000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:45:59.987' AS DateTime), 228)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (241, CAST(1100000 AS Decimal(18, 0)), CAST(3100000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:45:59.987' AS DateTime), 229)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (242, CAST(1100000 AS Decimal(18, 0)), CAST(3100000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:45:59.987' AS DateTime), 230)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (243, CAST(1100000 AS Decimal(18, 0)), CAST(3100000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:45:59.987' AS DateTime), 231)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (244, CAST(1100000 AS Decimal(18, 0)), CAST(3100000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:45:59.987' AS DateTime), 232)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (245, CAST(1100000 AS Decimal(18, 0)), CAST(3100000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:45:59.987' AS DateTime), 233)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (246, CAST(1100000 AS Decimal(18, 0)), CAST(3100000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:45:59.987' AS DateTime), 234)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (247, CAST(1100000 AS Decimal(18, 0)), CAST(3100000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:45:59.987' AS DateTime), 235)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (248, CAST(1100000 AS Decimal(18, 0)), CAST(3100000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:45:59.987' AS DateTime), 236)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (249, CAST(1100000 AS Decimal(18, 0)), CAST(3100000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:45:59.987' AS DateTime), 237)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (250, CAST(1100000 AS Decimal(18, 0)), CAST(3100000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:45:59.987' AS DateTime), 238)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (251, CAST(1100000 AS Decimal(18, 0)), CAST(3100000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:45:59.987' AS DateTime), 239)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (252, CAST(1100000 AS Decimal(18, 0)), CAST(3100000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:45:59.987' AS DateTime), 240)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (253, CAST(1100000 AS Decimal(18, 0)), CAST(3100000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:45:59.987' AS DateTime), 241)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (254, CAST(1100000 AS Decimal(18, 0)), CAST(3100000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:45:59.987' AS DateTime), 242)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (255, CAST(1100000 AS Decimal(18, 0)), CAST(3100000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:45:59.987' AS DateTime), 243)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (256, CAST(1100000 AS Decimal(18, 0)), CAST(3100000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:45:59.987' AS DateTime), 244)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (257, CAST(1100000 AS Decimal(18, 0)), CAST(3100000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:45:59.987' AS DateTime), 245)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (258, CAST(1100000 AS Decimal(18, 0)), CAST(3100000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:45:59.987' AS DateTime), 246)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (259, CAST(1100000 AS Decimal(18, 0)), CAST(3100000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:45:59.987' AS DateTime), 247)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (332, CAST(1100000 AS Decimal(18, 0)), CAST(3200000 AS Decimal(18, 0)), CAST(N'2022-04-19T17:17:49.387' AS DateTime), 247)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (333, CAST(1100000 AS Decimal(18, 0)), CAST(3200000 AS Decimal(18, 0)), CAST(N'2022-04-19T17:18:24.507' AS DateTime), 246)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (334, CAST(1100000 AS Decimal(18, 0)), CAST(3200000 AS Decimal(18, 0)), CAST(N'2022-04-19T17:20:40.943' AS DateTime), 245)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (335, CAST(1100000 AS Decimal(18, 0)), CAST(3200000 AS Decimal(18, 0)), CAST(N'2022-04-19T17:20:48.497' AS DateTime), 244)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (336, CAST(1100000 AS Decimal(18, 0)), CAST(3200000 AS Decimal(18, 0)), CAST(N'2022-04-19T17:20:54.527' AS DateTime), 243)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (337, CAST(1100000 AS Decimal(18, 0)), CAST(3200000 AS Decimal(18, 0)), CAST(N'2022-04-19T17:20:58.463' AS DateTime), 242)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (338, CAST(1100000 AS Decimal(18, 0)), CAST(3200000 AS Decimal(18, 0)), CAST(N'2022-04-19T17:21:03.047' AS DateTime), 241)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (339, CAST(1100000 AS Decimal(18, 0)), CAST(3200000 AS Decimal(18, 0)), CAST(N'2022-04-19T17:21:07.567' AS DateTime), 240)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (340, CAST(1100000 AS Decimal(18, 0)), CAST(3200000 AS Decimal(18, 0)), CAST(N'2022-04-19T17:21:17.633' AS DateTime), 239)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (341, CAST(1100000 AS Decimal(18, 0)), CAST(3200000 AS Decimal(18, 0)), CAST(N'2022-04-19T17:21:24.977' AS DateTime), 238)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (342, CAST(1100000 AS Decimal(18, 0)), CAST(3200000 AS Decimal(18, 0)), CAST(N'2022-04-19T17:21:58.483' AS DateTime), 237)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (343, CAST(1100000 AS Decimal(18, 0)), CAST(3200000 AS Decimal(18, 0)), CAST(N'2022-04-19T17:22:04.413' AS DateTime), 236)
SET IDENTITY_INSERT [dbo].[ProductPrice] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductReview] ON 

INSERT [dbo].[ProductReview] ([ID], [UserID], [ProductID], [Star], [Favorite], [Content], [CreatedDate]) VALUES (1, 1, 1, 3.5, 1, NULL, NULL)
INSERT [dbo].[ProductReview] ([ID], [UserID], [ProductID], [Star], [Favorite], [Content], [CreatedDate]) VALUES (2, 2, 4, 4, 1, NULL, NULL)
INSERT [dbo].[ProductReview] ([ID], [UserID], [ProductID], [Star], [Favorite], [Content], [CreatedDate]) VALUES (3, 3, 4, 4, 1, NULL, CAST(N'2022-03-16T13:19:00.210' AS DateTime))
INSERT [dbo].[ProductReview] ([ID], [UserID], [ProductID], [Star], [Favorite], [Content], [CreatedDate]) VALUES (4, 1, 4, 3, 1, NULL, CAST(N'2022-03-16T13:19:05.683' AS DateTime))
INSERT [dbo].[ProductReview] ([ID], [UserID], [ProductID], [Star], [Favorite], [Content], [CreatedDate]) VALUES (5, 4, 4, 3, 1, NULL, CAST(N'2022-03-16T13:19:06.600' AS DateTime))
INSERT [dbo].[ProductReview] ([ID], [UserID], [ProductID], [Star], [Favorite], [Content], [CreatedDate]) VALUES (6, 1, 5, 1, 1, NULL, CAST(N'2022-03-16T13:19:07.293' AS DateTime))
INSERT [dbo].[ProductReview] ([ID], [UserID], [ProductID], [Star], [Favorite], [Content], [CreatedDate]) VALUES (7, 1, 5, 2, 1, NULL, CAST(N'2022-03-16T13:19:07.940' AS DateTime))
INSERT [dbo].[ProductReview] ([ID], [UserID], [ProductID], [Star], [Favorite], [Content], [CreatedDate]) VALUES (8, 1, 5, 5, 1, NULL, CAST(N'2022-03-16T13:19:08.957' AS DateTime))
SET IDENTITY_INSERT [dbo].[ProductReview] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductSize] ON 

INSERT [dbo].[ProductSize] ([ID], [Name]) VALUES (2, N'7.5')
INSERT [dbo].[ProductSize] ([ID], [Name]) VALUES (3, N'8')
INSERT [dbo].[ProductSize] ([ID], [Name]) VALUES (4, N'8.5')
INSERT [dbo].[ProductSize] ([ID], [Name]) VALUES (5, N'9')
INSERT [dbo].[ProductSize] ([ID], [Name]) VALUES (6, N'9.5')
INSERT [dbo].[ProductSize] ([ID], [Name]) VALUES (7, N'10')
INSERT [dbo].[ProductSize] ([ID], [Name]) VALUES (8, N'10.5')
INSERT [dbo].[ProductSize] ([ID], [Name]) VALUES (9, N'11')
INSERT [dbo].[ProductSize] ([ID], [Name]) VALUES (10, N'11.5')
INSERT [dbo].[ProductSize] ([ID], [Name]) VALUES (11, N'12')
INSERT [dbo].[ProductSize] ([ID], [Name]) VALUES (12, N'12.5')
INSERT [dbo].[ProductSize] ([ID], [Name]) VALUES (13, N'13')
INSERT [dbo].[ProductSize] ([ID], [Name]) VALUES (14, N'13.5')
INSERT [dbo].[ProductSize] ([ID], [Name]) VALUES (15, N'14')
INSERT [dbo].[ProductSize] ([ID], [Name]) VALUES (16, N'15')
INSERT [dbo].[ProductSize] ([ID], [Name]) VALUES (17, N'36')
INSERT [dbo].[ProductSize] ([ID], [Name]) VALUES (18, N'37')
INSERT [dbo].[ProductSize] ([ID], [Name]) VALUES (19, N'38')
INSERT [dbo].[ProductSize] ([ID], [Name]) VALUES (20, N'39')
INSERT [dbo].[ProductSize] ([ID], [Name]) VALUES (21, N'40')
INSERT [dbo].[ProductSize] ([ID], [Name]) VALUES (22, N'41')
INSERT [dbo].[ProductSize] ([ID], [Name]) VALUES (23, N'42')
INSERT [dbo].[ProductSize] ([ID], [Name]) VALUES (24, N'43')
INSERT [dbo].[ProductSize] ([ID], [Name]) VALUES (25, N'44')
INSERT [dbo].[ProductSize] ([ID], [Name]) VALUES (26, N'45')
INSERT [dbo].[ProductSize] ([ID], [Name]) VALUES (27, N'46')
INSERT [dbo].[ProductSize] ([ID], [Name]) VALUES (28, N'47')
SET IDENTITY_INSERT [dbo].[ProductSize] OFF
GO
SET IDENTITY_INSERT [dbo].[Receipt] ON 

INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (93, 8, NULL, N'helu', 1)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (94, 8, CAST(N'2022-03-28T00:47:20.890' AS DateTime), N'helu22', 3)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (95, 8, CAST(N'2022-03-28T00:49:35.823' AS DateTime), N'helu22', 3)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (96, 0, CAST(N'2022-03-28T00:53:35.090' AS DateTime), NULL, 0)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (97, 0, CAST(N'2022-03-28T00:55:43.080' AS DateTime), NULL, 0)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (98, 0, CAST(N'2022-03-28T00:58:36.380' AS DateTime), NULL, 0)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (99, 0, CAST(N'2022-03-28T01:00:34.270' AS DateTime), NULL, 0)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (100, 0, CAST(N'2022-03-28T01:04:25.943' AS DateTime), NULL, 0)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (101, 8, CAST(N'2022-03-28T01:21:13.497' AS DateTime), N'', 0)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (102, 0, CAST(N'2022-03-28T01:21:13.600' AS DateTime), NULL, 0)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (103, 0, CAST(N'2022-03-28T01:21:54.827' AS DateTime), NULL, 0)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (104, 0, CAST(N'2022-03-28T01:22:47.120' AS DateTime), NULL, 0)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (105, 0, CAST(N'2022-03-28T01:28:25.923' AS DateTime), NULL, 0)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (106, 0, CAST(N'2022-03-28T01:31:08.403' AS DateTime), NULL, 0)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (107, 0, CAST(N'2022-03-28T01:32:44.810' AS DateTime), NULL, 0)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (108, 0, CAST(N'2022-03-28T01:34:38.880' AS DateTime), NULL, 0)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (109, 0, CAST(N'2022-03-28T01:35:57.690' AS DateTime), NULL, 0)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (110, 0, CAST(N'2022-03-28T01:36:52.820' AS DateTime), NULL, 0)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (111, 0, CAST(N'2022-03-28T01:38:41.770' AS DateTime), NULL, 0)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (112, 0, CAST(N'2022-03-28T01:39:19.400' AS DateTime), NULL, 0)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (113, 0, CAST(N'2022-03-28T01:39:54.410' AS DateTime), NULL, 0)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (114, 0, CAST(N'2022-03-28T01:41:04.277' AS DateTime), NULL, 0)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (115, 0, CAST(N'2022-03-28T01:42:04.657' AS DateTime), NULL, 0)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (116, 0, CAST(N'2022-03-28T01:45:03.567' AS DateTime), NULL, 0)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (117, 0, CAST(N'2022-03-28T01:45:38.380' AS DateTime), NULL, 0)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (118, 0, CAST(N'2022-03-28T01:46:58.047' AS DateTime), NULL, 0)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (119, 8, CAST(N'2022-03-28T01:47:24.320' AS DateTime), N'ngon rồi', 4)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (120, 8, CAST(N'2022-03-28T01:50:06.873' AS DateTime), N'ngon rồi', 4)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (121, 0, CAST(N'2022-03-28T01:50:59.620' AS DateTime), NULL, 0)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (122, 8, CAST(N'2022-03-28T01:51:15.600' AS DateTime), N'5', 1)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (123, 8, CAST(N'2022-03-28T01:52:22.500' AS DateTime), N'5', 1)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (124, 8, CAST(N'2022-03-28T01:53:05.780' AS DateTime), N'5', 1)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (125, 0, CAST(N'2022-03-28T02:06:51.400' AS DateTime), NULL, 0)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (126, 8, CAST(N'2022-03-28T02:07:11.223' AS DateTime), N'sdgfsdg', 4)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (127, 8, CAST(N'2022-03-28T02:09:51.870' AS DateTime), N'sdgfsdg', 4)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (128, 8, CAST(N'2022-03-28T02:11:15.210' AS DateTime), N'sdgfsdg', 4)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (129, 8, CAST(N'2022-03-28T02:12:17.000' AS DateTime), N'sdgfsdg', 4)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (130, 0, CAST(N'2022-03-28T02:15:39.750' AS DateTime), NULL, 0)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (131, 8, CAST(N'2022-03-28T02:16:01.470' AS DateTime), N'ádf', 5)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (132, 8, CAST(N'2022-03-28T02:17:11.977' AS DateTime), N'ádf', 5)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (133, 8, CAST(N'2022-03-28T02:18:38.503' AS DateTime), N'ádf', 5)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (134, 0, CAST(N'2022-03-28T02:23:11.183' AS DateTime), NULL, 0)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (135, 8, CAST(N'2022-03-28T02:23:33.410' AS DateTime), N'123', 1)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (136, 0, CAST(N'2022-03-28T02:27:20.287' AS DateTime), NULL, 0)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (137, 8, CAST(N'2022-03-28T02:27:47.467' AS DateTime), N'hgdf', 1)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (138, 0, CAST(N'2022-03-29T14:56:16.913' AS DateTime), NULL, 0)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (139, 0, CAST(N'2022-03-29T15:00:36.560' AS DateTime), NULL, 0)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (140, 0, CAST(N'2022-03-29T15:27:30.583' AS DateTime), NULL, 0)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (141, 0, CAST(N'2022-03-29T15:27:34.710' AS DateTime), NULL, 0)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (142, 0, CAST(N'2022-03-29T23:46:09.610' AS DateTime), NULL, 0)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (143, 0, CAST(N'2022-04-01T13:05:11.150' AS DateTime), NULL, 0)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (144, 0, CAST(N'2022-04-01T13:05:15.817' AS DateTime), NULL, 0)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (145, 0, CAST(N'2022-04-01T13:24:22.787' AS DateTime), NULL, 0)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (146, 0, CAST(N'2022-04-01T13:30:57.590' AS DateTime), NULL, 0)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (147, 0, CAST(N'2022-04-01T13:49:34.247' AS DateTime), NULL, 0)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (148, 0, CAST(N'2022-04-01T13:49:42.077' AS DateTime), NULL, 0)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (149, 0, CAST(N'2022-04-01T13:49:45.610' AS DateTime), NULL, 0)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (150, 0, CAST(N'2022-04-01T13:51:31.467' AS DateTime), NULL, 0)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (151, 0, CAST(N'2022-04-01T18:26:16.170' AS DateTime), NULL, 0)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (152, 0, CAST(N'2022-04-01T18:28:17.227' AS DateTime), NULL, 0)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (153, 1, CAST(N'2022-04-01T18:28:38.230' AS DateTime), N'sdgsdfgsdfgsfg', 1)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (154, 0, CAST(N'2022-04-01T18:46:52.353' AS DateTime), NULL, 0)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (155, 0, CAST(N'2022-04-01T18:50:53.883' AS DateTime), NULL, 0)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (156, 0, CAST(N'2022-04-01T18:51:38.903' AS DateTime), NULL, 0)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (157, 0, CAST(N'2022-04-01T18:51:52.220' AS DateTime), NULL, 0)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (158, 0, CAST(N'2022-04-01T19:19:14.280' AS DateTime), NULL, 0)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (159, 0, CAST(N'2022-04-01T19:21:34.670' AS DateTime), NULL, 0)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (160, 1, CAST(N'2022-04-01T19:21:36.270' AS DateTime), N'', 0)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (161, 0, CAST(N'2022-04-01T19:21:50.610' AS DateTime), NULL, 0)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (162, 0, CAST(N'2022-04-01T19:23:00.293' AS DateTime), NULL, 0)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (163, 0, CAST(N'2022-04-01T19:23:12.823' AS DateTime), NULL, 0)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (164, 0, CAST(N'2022-04-01T19:23:41.757' AS DateTime), NULL, 0)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (165, 0, CAST(N'2022-04-01T19:24:15.550' AS DateTime), NULL, 0)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (166, 0, CAST(N'2022-04-01T19:24:35.500' AS DateTime), NULL, 0)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (167, 0, CAST(N'2022-04-01T19:25:12.170' AS DateTime), NULL, 0)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (168, 0, CAST(N'2022-04-01T19:26:47.520' AS DateTime), NULL, 0)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (169, 0, CAST(N'2022-04-01T19:26:48.857' AS DateTime), NULL, 0)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (170, 1, CAST(N'2022-04-01T19:28:09.670' AS DateTime), N'dfas', 1)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (171, 1, CAST(N'2022-04-01T19:28:09.680' AS DateTime), N'dfas', 1)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (172, 1, CAST(N'2022-04-01T19:29:16.603' AS DateTime), N'dfas', 1)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (173, 1, CAST(N'2022-04-01T19:29:16.617' AS DateTime), N'dfas', 1)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (174, 1, CAST(N'2022-04-01T19:29:47.377' AS DateTime), N'dfas', 1)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (175, 1, CAST(N'2022-04-01T19:29:53.753' AS DateTime), N'dfas', 1)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (176, 1, CAST(N'2022-04-01T19:29:53.763' AS DateTime), N'dfas', 1)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (177, 1, CAST(N'2022-04-01T19:30:15.800' AS DateTime), N'dfas', 1)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (178, 1, CAST(N'2022-04-01T19:30:19.277' AS DateTime), N'dfas', 1)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (179, 1, CAST(N'2022-04-01T19:30:27.827' AS DateTime), N'dfas', 1)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (180, 0, CAST(N'2022-04-01T19:31:30.873' AS DateTime), NULL, 0)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (181, 1, CAST(N'2022-04-01T19:32:27.910' AS DateTime), N'àgadfg', 4)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (182, 1, CAST(N'2022-04-01T19:33:16.780' AS DateTime), N'àgadfg', 4)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (183, 1, CAST(N'2022-04-01T19:33:16.780' AS DateTime), N'àgadfg', 4)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (184, 1, CAST(N'2022-04-01T19:33:16.793' AS DateTime), N'àgadfg', 4)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (185, 1, CAST(N'2022-04-01T19:33:16.800' AS DateTime), N'àgadfg', 4)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (186, 1, CAST(N'2022-04-01T19:33:16.807' AS DateTime), N'àgadfg', 4)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (187, 1, CAST(N'2022-04-01T19:33:16.810' AS DateTime), N'àgadfg', 4)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (188, 1, CAST(N'2022-04-01T19:33:16.823' AS DateTime), N'àgadfg', 4)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (189, 1, CAST(N'2022-04-01T19:33:16.830' AS DateTime), N'àgadfg', 4)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (190, 1, CAST(N'2022-04-01T19:33:16.833' AS DateTime), N'àgadfg', 4)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (191, 1, CAST(N'2022-04-01T19:33:16.840' AS DateTime), N'àgadfg', 4)
GO
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (192, 1, CAST(N'2022-04-01T19:33:16.847' AS DateTime), N'àgadfg', 4)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (193, 1, CAST(N'2022-04-01T19:33:16.850' AS DateTime), N'àgadfg', 4)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (194, 1, CAST(N'2022-04-01T19:33:16.857' AS DateTime), N'àgadfg', 4)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (195, 1, CAST(N'2022-04-01T19:33:16.867' AS DateTime), N'àgadfg', 4)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (196, 1, CAST(N'2022-04-01T19:33:16.877' AS DateTime), N'àgadfg', 4)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (197, 1, CAST(N'2022-04-01T19:33:16.880' AS DateTime), N'àgadfg', 4)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (198, 1, CAST(N'2022-04-01T19:33:16.880' AS DateTime), N'àgadfg', 4)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (199, 1, CAST(N'2022-04-01T19:33:16.887' AS DateTime), N'àgadfg', 4)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (200, 1, CAST(N'2022-04-01T19:33:16.897' AS DateTime), N'àgadfg', 4)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (201, 1, CAST(N'2022-04-01T19:33:16.900' AS DateTime), N'àgadfg', 4)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (202, 1, CAST(N'2022-04-01T19:33:16.903' AS DateTime), N'àgadfg', 4)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (203, 0, CAST(N'2022-04-01T19:36:15.667' AS DateTime), NULL, 0)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (204, 1, CAST(N'2022-04-01T19:36:26.660' AS DateTime), N'143', 1)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (205, 1, CAST(N'2022-04-01T19:37:28.487' AS DateTime), N'143', 1)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (206, 0, CAST(N'2022-04-04T16:49:57.180' AS DateTime), NULL, 0)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (207, 0, CAST(N'2022-04-04T16:50:48.730' AS DateTime), NULL, 0)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (208, 0, CAST(N'2022-04-04T16:51:14.083' AS DateTime), NULL, 0)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (209, 0, CAST(N'2022-04-06T23:45:01.917' AS DateTime), NULL, 0)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (210, 0, CAST(N'2022-04-06T23:46:20.540' AS DateTime), NULL, 0)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (211, 1, CAST(N'2022-04-06T23:47:36.250' AS DateTime), N'nhập 10 đôi 	MEN''S TAJA COMMISSIONER', 1)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (212, 1, CAST(N'2022-04-06T23:48:58.597' AS DateTime), N'nhập 10 đôi 	MEN''S TAJA COMMISSIONER', 1)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (213, 1, CAST(N'2022-04-06T23:51:24.640' AS DateTime), N'nhập 15 đôi 	MEN''S TAJA COMMISSIONER', 1)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (214, 1, CAST(N'2022-04-06T23:53:40.890' AS DateTime), N'nhập 15 đôi 	MEN''S TAJA COMMISSIONER', 1)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (215, 0, CAST(N'2022-04-07T00:16:10.513' AS DateTime), NULL, 0)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (216, 1, CAST(N'2022-04-07T00:16:53.910' AS DateTime), N'fsgfds', 1)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (217, 1, CAST(N'2022-04-07T00:17:11.470' AS DateTime), N'fsgfds', 1)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (218, 0, CAST(N'2022-04-07T00:18:18.417' AS DateTime), NULL, 0)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (219, 1, CAST(N'2022-04-07T00:18:57.210' AS DateTime), N'fasdf', 1)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (220, 1, CAST(N'2022-04-07T00:19:18.140' AS DateTime), N'fasdf', 1)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (221, 0, CAST(N'2022-04-09T08:16:07.677' AS DateTime), NULL, 0)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (222, 1, CAST(N'2022-04-09T08:16:32.290' AS DateTime), N'giày nike', 2)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (223, 0, CAST(N'2022-04-09T08:16:55.333' AS DateTime), NULL, 0)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (224, 1, CAST(N'2022-04-09T08:25:07.817' AS DateTime), N'200000200000200000200000', 1)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (225, 0, CAST(N'2022-04-09T08:56:51.247' AS DateTime), NULL, 0)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (226, 0, CAST(N'2022-04-09T08:58:20.990' AS DateTime), NULL, 0)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (227, 0, CAST(N'2022-04-09T09:00:16.423' AS DateTime), NULL, 0)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (228, 0, CAST(N'2022-04-09T09:01:50.097' AS DateTime), NULL, 0)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (229, 0, CAST(N'2022-04-09T09:04:11.970' AS DateTime), NULL, 0)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (230, 0, CAST(N'2022-04-09T09:17:18.967' AS DateTime), NULL, 0)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (231, 0, CAST(N'2022-04-09T09:17:31.093' AS DateTime), NULL, 0)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (232, 0, CAST(N'2022-04-09T09:19:00.647' AS DateTime), NULL, 0)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (233, 0, CAST(N'2022-04-09T09:19:13.643' AS DateTime), NULL, 0)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (234, 0, CAST(N'2022-04-09T09:19:56.813' AS DateTime), NULL, 0)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (235, 0, CAST(N'2022-04-12T15:37:26.740' AS DateTime), NULL, 0)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (236, 0, CAST(N'2022-04-12T15:39:10.280' AS DateTime), NULL, 0)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (237, 0, CAST(N'2022-04-12T15:40:21.223' AS DateTime), NULL, 0)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (238, 1, CAST(N'2022-04-12T15:40:47.740' AS DateTime), N'sản phẩm balen', 1)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (239, 0, CAST(N'2022-04-12T15:43:58.850' AS DateTime), NULL, 0)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (240, 1, CAST(N'2022-04-12T15:44:55.867' AS DateTime), N'13453', 1)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (241, 0, CAST(N'2022-04-12T15:47:35.010' AS DateTime), NULL, 0)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (242, 1, CAST(N'2022-04-12T15:47:51.817' AS DateTime), N'sda', 2)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (243, 0, CAST(N'2022-04-19T13:15:34.710' AS DateTime), NULL, 0)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (244, 0, CAST(N'2022-04-19T15:42:26.923' AS DateTime), NULL, 0)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (245, 0, CAST(N'2022-04-19T15:44:49.030' AS DateTime), NULL, 0)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (246, 1, CAST(N'2022-04-19T15:47:07.180' AS DateTime), N'air jordan 1 mid is the best', 2)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (247, 1, CAST(N'2022-04-19T15:47:28.430' AS DateTime), N'air jordan 1 mid is the best', 2)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (248, 1, CAST(N'2022-04-19T15:47:49.450' AS DateTime), N'air jordan 1 mid is the best', 2)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (249, 1, CAST(N'2022-04-19T15:49:09.300' AS DateTime), N'giay-cao-nam-tre-trung-GD288S-2', 2)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (250, 1, CAST(N'2022-04-19T15:51:18.513' AS DateTime), N'Forum Exhibit Low Shoes', 1)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (251, 1, CAST(N'2022-04-19T15:52:11.280' AS DateTime), N'G classics B1639', 1)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (252, 1, CAST(N'2022-04-19T15:53:00.637' AS DateTime), N'Galaxy 5', 1)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (253, 1, CAST(N'2022-04-19T15:53:41.303' AS DateTime), N'Galaxy 5', 1)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (254, 1, CAST(N'2022-04-19T15:54:00.973' AS DateTime), N'Galaxy 5', 1)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (255, 1, CAST(N'2022-04-19T15:54:13.733' AS DateTime), N'Galaxy 5', 1)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (256, 1, CAST(N'2022-04-19T15:54:30.097' AS DateTime), N'Galaxy 5', 1)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (257, 1, CAST(N'2022-04-19T15:54:44.923' AS DateTime), N'Galaxy 5', 1)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (258, 1, CAST(N'2022-04-19T15:55:51.157' AS DateTime), N'GB Classics B1655', 1)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (259, 1, CAST(N'2022-04-19T15:56:05.483' AS DateTime), N'GB Classics B1655', 1)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (260, 1, CAST(N'2022-04-19T15:56:20.457' AS DateTime), N'GB Classics B1655', 1)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (261, 1, CAST(N'2022-04-19T15:56:47.900' AS DateTime), N'Sneaker Gravity', 1)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (262, 1, CAST(N'2022-04-19T15:57:13.893' AS DateTime), N'Stan smith', 1)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (263, 0, CAST(N'2022-04-19T15:58:58.140' AS DateTime), NULL, 0)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (264, 1, CAST(N'2022-04-19T16:01:11.383' AS DateTime), N'Nike Pegasus Trail 3 GORE-TEX xanh rêu', 7)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (265, 0, CAST(N'2022-04-19T16:02:03.110' AS DateTime), NULL, 0)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (266, 1, CAST(N'2022-04-19T16:02:14.370' AS DateTime), N'Nike Pegasus Trail 3 GORE-TEX xanh rêu', 7)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (267, 1, CAST(N'2022-04-19T16:05:53.770' AS DateTime), N'Nike Pegasus Trail 3 GORE-TEX xanh rêu', 7)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (268, 1, CAST(N'2022-04-19T16:06:31.273' AS DateTime), N'Nike Pegasus Trail 3 GORE-TEX xanh rêu', 7)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (269, 1, CAST(N'2022-04-19T16:07:08.310' AS DateTime), N'Nike Pegasus Trail 3 GORE-TEX Vàng', 7)
INSERT [dbo].[Receipt] ([ID], [UserID], [CreatedDate], [Note], [SupplyID]) VALUES (270, 0, CAST(N'2022-04-19T16:13:45.520' AS DateTime), NULL, 0)
SET IDENTITY_INSERT [dbo].[Receipt] OFF
GO
SET IDENTITY_INSERT [dbo].[ReceiptDetail] ON 

INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (1, 93, 3, 2, CAST(100000 AS Decimal(18, 0)), CAST(N'2022-03-28T00:43:01.983' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (2, 93, 3, 2, CAST(300000 AS Decimal(18, 0)), CAST(N'2022-03-28T00:43:14.420' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (3, 94, 3, 22, CAST(4500000 AS Decimal(18, 0)), CAST(N'2022-03-28T00:47:20.903' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (4, 94, 3, 22, CAST(1250000 AS Decimal(18, 0)), CAST(N'2022-03-28T00:47:20.907' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (5, 94, 3, 22, CAST(880000 AS Decimal(18, 0)), CAST(N'2022-03-28T00:47:20.910' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (6, 95, 3, 22, CAST(510000 AS Decimal(18, 0)), CAST(N'2022-03-28T00:49:37.253' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (7, 95, 3, 22, CAST(80000 AS Decimal(18, 0)), CAST(N'2022-03-28T00:49:37.260' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (8, 95, 3, 22, CAST(70000 AS Decimal(18, 0)), CAST(N'2022-03-28T00:49:37.260' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (9, 119, 3, 1, CAST(600000 AS Decimal(18, 0)), CAST(N'2022-03-28T01:47:25.390' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (10, 120, 3, 1, CAST(1250000 AS Decimal(18, 0)), CAST(N'2022-03-28T01:50:56.533' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (11, 126, 21, 123, CAST(100000 AS Decimal(18, 0)), CAST(N'2022-03-28T02:07:15.483' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (12, 127, 21, 123, CAST(600000 AS Decimal(18, 0)), CAST(N'2022-03-28T02:10:09.457' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (13, 127, 22, 1, CAST(1250000 AS Decimal(18, 0)), CAST(N'2022-03-28T02:10:35.417' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (14, 129, 23, 123, CAST(1250000 AS Decimal(18, 0)), CAST(N'2022-03-28T02:12:23.127' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (15, 131, 19, 1, CAST(100000 AS Decimal(18, 0)), CAST(N'2022-03-28T02:16:11.330' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (16, 133, 26, 2, CAST(600000 AS Decimal(18, 0)), CAST(N'2022-03-28T02:19:24.700' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (17, 135, 19, 1, CAST(1250000 AS Decimal(18, 0)), CAST(N'2022-03-28T02:23:40.163' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (18, 135, 27, 3, CAST(100000 AS Decimal(18, 0)), CAST(N'2022-03-28T02:23:48.587' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (19, 137, 19, 1, CAST(100000 AS Decimal(18, 0)), CAST(N'2022-03-28T02:27:50.690' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (20, 153, 28, 1, CAST(2 AS Decimal(18, 0)), CAST(N'2022-04-01T18:28:38.257' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (21, 153, 29, 4, CAST(4 AS Decimal(18, 0)), CAST(N'2022-04-01T18:28:38.263' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (22, 171, 31, 123, CAST(123 AS Decimal(18, 0)), CAST(N'2022-04-01T19:28:09.700' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (23, 171, 31, 123, CAST(123 AS Decimal(18, 0)), CAST(N'2022-04-01T19:28:09.700' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (24, 173, 33, 123, CAST(123 AS Decimal(18, 0)), CAST(N'2022-04-01T19:29:16.627' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (25, 173, 33, 123, CAST(123 AS Decimal(18, 0)), CAST(N'2022-04-01T19:29:16.627' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (26, 175, 34, 123, CAST(123 AS Decimal(18, 0)), CAST(N'2022-04-01T19:29:53.753' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (27, 175, 35, 123, CAST(123 AS Decimal(18, 0)), CAST(N'2022-04-01T19:29:53.757' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (28, 176, 36, 123, CAST(123 AS Decimal(18, 0)), CAST(N'2022-04-01T19:29:53.770' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (29, 177, 37, 123, CAST(123 AS Decimal(18, 0)), CAST(N'2022-04-01T19:30:19.270' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (30, 178, 38, 123, CAST(123 AS Decimal(18, 0)), CAST(N'2022-04-01T19:30:27.810' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (31, 179, 39, 123, CAST(123 AS Decimal(18, 0)), CAST(N'2022-04-01T19:30:27.830' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (32, 181, 28, 12, CAST(5000000 AS Decimal(18, 0)), CAST(N'2022-04-01T19:32:27.927' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (33, 181, 3, 123, CAST(8000000 AS Decimal(18, 0)), CAST(N'2022-04-01T19:33:16.733' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (34, 198, 28, 12, CAST(5000000 AS Decimal(18, 0)), CAST(N'2022-04-01T19:33:16.887' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (35, 202, 28, 12, CAST(5000000 AS Decimal(18, 0)), CAST(N'2022-04-01T19:33:16.903' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (36, 202, 28, 12, CAST(5000000 AS Decimal(18, 0)), CAST(N'2022-04-01T19:33:16.903' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (37, 202, 28, 12, CAST(5000000 AS Decimal(18, 0)), CAST(N'2022-04-01T19:33:16.907' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (38, 202, 28, 12, CAST(5000000 AS Decimal(18, 0)), CAST(N'2022-04-01T19:33:16.907' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (39, 202, 28, 12, CAST(5000000 AS Decimal(18, 0)), CAST(N'2022-04-01T19:33:16.907' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (40, 202, 28, 12, CAST(5000000 AS Decimal(18, 0)), CAST(N'2022-04-01T19:33:16.907' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (41, 202, 28, 12, CAST(5000000 AS Decimal(18, 0)), CAST(N'2022-04-01T19:33:16.907' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (42, 202, 28, 12, CAST(5000000 AS Decimal(18, 0)), CAST(N'2022-04-01T19:33:16.910' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (43, 202, 28, 12, CAST(5000000 AS Decimal(18, 0)), CAST(N'2022-04-01T19:33:16.910' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (44, 202, 28, 12, CAST(5000000 AS Decimal(18, 0)), CAST(N'2022-04-01T19:33:16.910' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (45, 202, 28, 12, CAST(5000000 AS Decimal(18, 0)), CAST(N'2022-04-01T19:33:16.910' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (46, 202, 28, 12, CAST(5000000 AS Decimal(18, 0)), CAST(N'2022-04-01T19:33:16.910' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (47, 202, 28, 12, CAST(5000000 AS Decimal(18, 0)), CAST(N'2022-04-01T19:33:16.910' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (48, 202, 28, 12, CAST(5000000 AS Decimal(18, 0)), CAST(N'2022-04-01T19:33:16.917' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (49, 202, 28, 12, CAST(5000000 AS Decimal(18, 0)), CAST(N'2022-04-01T19:33:16.917' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (50, 202, 28, 12, CAST(5000000 AS Decimal(18, 0)), CAST(N'2022-04-01T19:33:16.917' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (51, 202, 40, 123, CAST(9000000 AS Decimal(18, 0)), CAST(N'2022-04-01T19:33:16.927' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (52, 202, 28, 12, CAST(5000000 AS Decimal(18, 0)), CAST(N'2022-04-01T19:33:16.927' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (53, 202, 3, 123, CAST(8000000 AS Decimal(18, 0)), CAST(N'2022-04-01T19:33:16.927' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (54, 202, 28, 12, CAST(5000000 AS Decimal(18, 0)), CAST(N'2022-04-01T19:33:16.930' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (55, 202, 3, 123, CAST(8000000 AS Decimal(18, 0)), CAST(N'2022-04-01T19:33:16.933' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (56, 202, 28, 12, CAST(5000000 AS Decimal(18, 0)), CAST(N'2022-04-01T19:33:16.933' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (57, 202, 28, 12, CAST(5000000 AS Decimal(18, 0)), CAST(N'2022-04-01T19:33:16.933' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (58, 202, 3, 123, CAST(8000000 AS Decimal(18, 0)), CAST(N'2022-04-01T19:33:16.940' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (59, 202, 3, 123, CAST(8000000 AS Decimal(18, 0)), CAST(N'2022-04-01T19:33:16.943' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (60, 202, 3, 123, CAST(8000000 AS Decimal(18, 0)), CAST(N'2022-04-01T19:33:16.947' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (61, 202, 3, 123, CAST(8000000 AS Decimal(18, 0)), CAST(N'2022-04-01T19:33:16.947' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (62, 202, 3, 123, CAST(8000000 AS Decimal(18, 0)), CAST(N'2022-04-01T19:33:16.947' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (63, 202, 3, 123, CAST(8000000 AS Decimal(18, 0)), CAST(N'2022-04-01T19:33:16.947' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (64, 202, 3, 123, CAST(8000000 AS Decimal(18, 0)), CAST(N'2022-04-01T19:33:16.947' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (65, 202, 3, 123, CAST(8000000 AS Decimal(18, 0)), CAST(N'2022-04-01T19:33:16.947' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (66, 202, 3, 123, CAST(8000000 AS Decimal(18, 0)), CAST(N'2022-04-01T19:33:16.950' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (67, 202, 3, 123, CAST(8000000 AS Decimal(18, 0)), CAST(N'2022-04-01T19:33:16.950' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (68, 202, 3, 123, CAST(8000000 AS Decimal(18, 0)), CAST(N'2022-04-01T19:33:16.950' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (69, 202, 3, 123, CAST(8000000 AS Decimal(18, 0)), CAST(N'2022-04-01T19:33:16.957' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (70, 202, 3, 123, CAST(8000000 AS Decimal(18, 0)), CAST(N'2022-04-01T19:33:16.957' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (71, 202, 3, 123, CAST(8000000 AS Decimal(18, 0)), CAST(N'2022-04-01T19:33:16.957' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (72, 202, 3, 123, CAST(8000000 AS Decimal(18, 0)), CAST(N'2022-04-01T19:33:16.957' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (73, 202, 3, 123, CAST(8000000 AS Decimal(18, 0)), CAST(N'2022-04-01T19:33:16.960' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (74, 202, 3, 123, CAST(8000000 AS Decimal(18, 0)), CAST(N'2022-04-01T19:33:16.963' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (75, 202, 3, 123, CAST(8000000 AS Decimal(18, 0)), CAST(N'2022-04-01T19:33:16.967' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (76, 202, 42, 123, CAST(9000000 AS Decimal(18, 0)), CAST(N'2022-04-01T19:33:16.967' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (77, 202, 3, 123, CAST(8000000 AS Decimal(18, 0)), CAST(N'2022-04-01T19:33:16.970' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (78, 202, 52, 123, CAST(9000000 AS Decimal(18, 0)), CAST(N'2022-04-01T19:33:16.970' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (79, 202, 55, 123, CAST(9000000 AS Decimal(18, 0)), CAST(N'2022-04-01T19:33:16.973' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (80, 202, 55, 123, CAST(9000000 AS Decimal(18, 0)), CAST(N'2022-04-01T19:33:16.973' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (81, 202, 55, 123, CAST(9000000 AS Decimal(18, 0)), CAST(N'2022-04-01T19:33:16.973' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (82, 202, 55, 123, CAST(9000000 AS Decimal(18, 0)), CAST(N'2022-04-01T19:33:16.973' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (83, 202, 55, 123, CAST(9000000 AS Decimal(18, 0)), CAST(N'2022-04-01T19:33:16.973' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (84, 202, 56, 123, CAST(9000000 AS Decimal(18, 0)), CAST(N'2022-04-01T19:33:16.977' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (85, 202, 57, 123, CAST(9000000 AS Decimal(18, 0)), CAST(N'2022-04-01T19:33:16.977' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (86, 202, 58, 123, CAST(9000000 AS Decimal(18, 0)), CAST(N'2022-04-01T19:33:16.977' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (87, 202, 58, 123, CAST(9000000 AS Decimal(18, 0)), CAST(N'2022-04-01T19:33:16.977' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (88, 202, 59, 123, CAST(9000000 AS Decimal(18, 0)), CAST(N'2022-04-01T19:33:16.980' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (89, 202, 59, 123, CAST(9000000 AS Decimal(18, 0)), CAST(N'2022-04-01T19:33:16.980' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (90, 202, 59, 123, CAST(9000000 AS Decimal(18, 0)), CAST(N'2022-04-01T19:33:16.983' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (91, 202, 59, 123, CAST(9000000 AS Decimal(18, 0)), CAST(N'2022-04-01T19:33:16.983' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (92, 202, 60, 123, CAST(9000000 AS Decimal(18, 0)), CAST(N'2022-04-01T19:33:16.987' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (93, 202, 60, 123, CAST(9000000 AS Decimal(18, 0)), CAST(N'2022-04-01T19:33:16.990' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (94, 202, 61, 123, CAST(9000000 AS Decimal(18, 0)), CAST(N'2022-04-01T19:33:16.990' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (95, 202, 61, 123, CAST(9000000 AS Decimal(18, 0)), CAST(N'2022-04-01T19:33:16.993' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (96, 202, 61, 123, CAST(9000000 AS Decimal(18, 0)), CAST(N'2022-04-01T19:33:16.997' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (97, 202, 61, 123, CAST(9000000 AS Decimal(18, 0)), CAST(N'2022-04-01T19:33:17.000' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (98, 204, 62, 123, CAST(123 AS Decimal(18, 0)), CAST(N'2022-04-01T19:36:26.673' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (99, 205, 63, 123, CAST(123 AS Decimal(18, 0)), CAST(N'2022-04-01T19:37:28.500' AS DateTime))
GO
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (100, 211, 64, 10, CAST(100000 AS Decimal(18, 0)), CAST(N'2022-04-06T23:47:36.307' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (101, 212, 65, 10, CAST(100000 AS Decimal(18, 0)), CAST(N'2022-04-06T23:48:58.630' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (102, 213, 66, 15, CAST(50000 AS Decimal(18, 0)), CAST(N'2022-04-06T23:51:24.670' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (103, 214, 67, 15, CAST(50000 AS Decimal(18, 0)), CAST(N'2022-04-06T23:58:11.677' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (104, 216, 68, 10, CAST(500000 AS Decimal(18, 0)), CAST(N'2022-04-07T00:16:53.953' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (105, 217, 69, 10, CAST(1000 AS Decimal(18, 0)), CAST(N'2022-04-07T00:17:11.477' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (106, 219, 70, 1, CAST(1000000 AS Decimal(18, 0)), CAST(N'2022-04-07T00:18:58.600' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (107, 220, 70, 1, CAST(3 AS Decimal(18, 0)), CAST(N'2022-04-07T00:19:18.787' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (108, 222, 71, 10, CAST(10000 AS Decimal(18, 0)), CAST(N'2022-04-09T08:16:32.320' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (109, 224, 72, 5, CAST(200000 AS Decimal(18, 0)), CAST(N'2022-04-09T08:25:07.830' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (110, 224, 73, 10, CAST(200000 AS Decimal(18, 0)), CAST(N'2022-04-09T08:25:07.830' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (111, 238, 74, 10, CAST(120000 AS Decimal(18, 0)), CAST(N'2022-04-12T15:40:47.760' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (112, 240, 9, 2, CAST(10000 AS Decimal(18, 0)), CAST(N'2022-04-12T15:44:55.877' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (113, 242, 75, 10, CAST(10000 AS Decimal(18, 0)), CAST(N'2022-04-12T15:47:51.827' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (114, 246, 76, 100, CAST(100000 AS Decimal(18, 0)), CAST(N'2022-04-19T15:47:07.213' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (115, 246, 77, 100, CAST(100000 AS Decimal(18, 0)), CAST(N'2022-04-19T15:47:07.220' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (116, 246, 78, 100, CAST(100000 AS Decimal(18, 0)), CAST(N'2022-04-19T15:47:07.223' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (117, 246, 79, 100, CAST(100000 AS Decimal(18, 0)), CAST(N'2022-04-19T15:47:07.223' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (118, 246, 80, 100, CAST(100000 AS Decimal(18, 0)), CAST(N'2022-04-19T15:47:07.227' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (119, 246, 81, 100, CAST(100000 AS Decimal(18, 0)), CAST(N'2022-04-19T15:47:07.227' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (120, 246, 82, 100, CAST(100000 AS Decimal(18, 0)), CAST(N'2022-04-19T15:47:07.227' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (121, 247, 83, 100, CAST(100000 AS Decimal(18, 0)), CAST(N'2022-04-19T15:47:28.433' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (122, 247, 84, 100, CAST(100000 AS Decimal(18, 0)), CAST(N'2022-04-19T15:47:28.437' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (123, 247, 85, 100, CAST(100000 AS Decimal(18, 0)), CAST(N'2022-04-19T15:47:28.440' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (124, 247, 86, 100, CAST(100000 AS Decimal(18, 0)), CAST(N'2022-04-19T15:47:28.443' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (125, 247, 87, 100, CAST(100000 AS Decimal(18, 0)), CAST(N'2022-04-19T15:47:28.447' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (126, 247, 88, 100, CAST(100000 AS Decimal(18, 0)), CAST(N'2022-04-19T15:47:28.447' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (127, 247, 89, 100, CAST(100000 AS Decimal(18, 0)), CAST(N'2022-04-19T15:47:28.450' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (128, 248, 90, 100, CAST(100000 AS Decimal(18, 0)), CAST(N'2022-04-19T15:47:49.460' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (129, 248, 91, 100, CAST(100000 AS Decimal(18, 0)), CAST(N'2022-04-19T15:47:49.463' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (130, 248, 92, 100, CAST(100000 AS Decimal(18, 0)), CAST(N'2022-04-19T15:47:49.463' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (131, 248, 93, 100, CAST(100000 AS Decimal(18, 0)), CAST(N'2022-04-19T15:47:49.463' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (132, 248, 94, 100, CAST(100000 AS Decimal(18, 0)), CAST(N'2022-04-19T15:47:49.467' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (133, 248, 95, 100, CAST(100000 AS Decimal(18, 0)), CAST(N'2022-04-19T15:47:49.467' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (134, 248, 96, 100, CAST(100000 AS Decimal(18, 0)), CAST(N'2022-04-19T15:47:49.470' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (135, 249, 97, 100, CAST(200000 AS Decimal(18, 0)), CAST(N'2022-04-19T15:49:09.310' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (136, 249, 98, 100, CAST(200000 AS Decimal(18, 0)), CAST(N'2022-04-19T15:49:09.317' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (137, 249, 99, 100, CAST(200000 AS Decimal(18, 0)), CAST(N'2022-04-19T15:49:09.317' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (138, 249, 100, 100, CAST(200000 AS Decimal(18, 0)), CAST(N'2022-04-19T15:49:09.320' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (139, 249, 101, 100, CAST(200000 AS Decimal(18, 0)), CAST(N'2022-04-19T15:49:09.320' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (140, 249, 102, 100, CAST(200000 AS Decimal(18, 0)), CAST(N'2022-04-19T15:49:09.323' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (141, 249, 103, 100, CAST(200000 AS Decimal(18, 0)), CAST(N'2022-04-19T15:49:09.327' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (142, 250, 104, 100, CAST(300000 AS Decimal(18, 0)), CAST(N'2022-04-19T15:51:18.520' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (143, 250, 105, 100, CAST(300000 AS Decimal(18, 0)), CAST(N'2022-04-19T15:51:18.527' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (144, 250, 106, 100, CAST(300000 AS Decimal(18, 0)), CAST(N'2022-04-19T15:51:18.530' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (145, 250, 107, 100, CAST(300000 AS Decimal(18, 0)), CAST(N'2022-04-19T15:51:18.533' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (146, 250, 108, 100, CAST(300000 AS Decimal(18, 0)), CAST(N'2022-04-19T15:51:18.537' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (147, 250, 109, 100, CAST(300000 AS Decimal(18, 0)), CAST(N'2022-04-19T15:51:18.537' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (148, 250, 110, 100, CAST(300000 AS Decimal(18, 0)), CAST(N'2022-04-19T15:51:18.540' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (149, 251, 111, 80, CAST(250000 AS Decimal(18, 0)), CAST(N'2022-04-19T15:52:11.293' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (150, 251, 112, 80, CAST(250000 AS Decimal(18, 0)), CAST(N'2022-04-19T15:52:11.293' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (151, 251, 113, 80, CAST(250000 AS Decimal(18, 0)), CAST(N'2022-04-19T15:52:11.293' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (152, 251, 114, 80, CAST(250000 AS Decimal(18, 0)), CAST(N'2022-04-19T15:52:11.297' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (153, 251, 115, 80, CAST(250000 AS Decimal(18, 0)), CAST(N'2022-04-19T15:52:11.297' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (154, 251, 116, 80, CAST(250000 AS Decimal(18, 0)), CAST(N'2022-04-19T15:52:11.300' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (155, 251, 117, 80, CAST(250000 AS Decimal(18, 0)), CAST(N'2022-04-19T15:52:11.300' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (156, 252, 118, 80, CAST(250000 AS Decimal(18, 0)), CAST(N'2022-04-19T15:53:00.650' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (157, 252, 119, 80, CAST(250000 AS Decimal(18, 0)), CAST(N'2022-04-19T15:53:00.650' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (158, 252, 120, 80, CAST(250000 AS Decimal(18, 0)), CAST(N'2022-04-19T15:53:00.650' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (159, 252, 121, 80, CAST(250000 AS Decimal(18, 0)), CAST(N'2022-04-19T15:53:00.653' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (160, 252, 122, 80, CAST(250000 AS Decimal(18, 0)), CAST(N'2022-04-19T15:53:00.653' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (161, 252, 123, 80, CAST(250000 AS Decimal(18, 0)), CAST(N'2022-04-19T15:53:00.660' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (162, 252, 124, 80, CAST(250000 AS Decimal(18, 0)), CAST(N'2022-04-19T15:53:00.660' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (163, 253, 125, 80, CAST(250000 AS Decimal(18, 0)), CAST(N'2022-04-19T15:53:41.317' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (164, 253, 126, 80, CAST(250000 AS Decimal(18, 0)), CAST(N'2022-04-19T15:53:41.320' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (165, 253, 127, 80, CAST(250000 AS Decimal(18, 0)), CAST(N'2022-04-19T15:53:41.320' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (166, 253, 128, 80, CAST(250000 AS Decimal(18, 0)), CAST(N'2022-04-19T15:53:41.323' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (167, 253, 129, 80, CAST(250000 AS Decimal(18, 0)), CAST(N'2022-04-19T15:53:41.327' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (168, 253, 130, 80, CAST(250000 AS Decimal(18, 0)), CAST(N'2022-04-19T15:53:41.327' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (169, 253, 131, 80, CAST(250000 AS Decimal(18, 0)), CAST(N'2022-04-19T15:53:41.327' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (170, 254, 132, 80, CAST(250000 AS Decimal(18, 0)), CAST(N'2022-04-19T15:54:00.977' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (171, 254, 133, 80, CAST(250000 AS Decimal(18, 0)), CAST(N'2022-04-19T15:54:00.977' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (172, 254, 134, 80, CAST(250000 AS Decimal(18, 0)), CAST(N'2022-04-19T15:54:00.980' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (173, 254, 135, 80, CAST(250000 AS Decimal(18, 0)), CAST(N'2022-04-19T15:54:00.980' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (174, 254, 136, 80, CAST(250000 AS Decimal(18, 0)), CAST(N'2022-04-19T15:54:00.980' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (175, 254, 137, 80, CAST(250000 AS Decimal(18, 0)), CAST(N'2022-04-19T15:54:00.983' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (176, 254, 138, 80, CAST(250000 AS Decimal(18, 0)), CAST(N'2022-04-19T15:54:00.983' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (177, 255, 139, 80, CAST(250000 AS Decimal(18, 0)), CAST(N'2022-04-19T15:54:13.737' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (178, 255, 140, 80, CAST(250000 AS Decimal(18, 0)), CAST(N'2022-04-19T15:54:13.737' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (179, 255, 141, 80, CAST(250000 AS Decimal(18, 0)), CAST(N'2022-04-19T15:54:13.737' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (180, 255, 142, 80, CAST(250000 AS Decimal(18, 0)), CAST(N'2022-04-19T15:54:13.740' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (181, 255, 143, 80, CAST(250000 AS Decimal(18, 0)), CAST(N'2022-04-19T15:54:13.740' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (182, 255, 144, 80, CAST(250000 AS Decimal(18, 0)), CAST(N'2022-04-19T15:54:13.740' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (183, 255, 145, 80, CAST(250000 AS Decimal(18, 0)), CAST(N'2022-04-19T15:54:13.743' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (184, 256, 146, 80, CAST(250000 AS Decimal(18, 0)), CAST(N'2022-04-19T15:54:30.100' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (185, 256, 147, 80, CAST(250000 AS Decimal(18, 0)), CAST(N'2022-04-19T15:54:30.100' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (186, 256, 148, 80, CAST(250000 AS Decimal(18, 0)), CAST(N'2022-04-19T15:54:30.100' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (187, 256, 149, 80, CAST(250000 AS Decimal(18, 0)), CAST(N'2022-04-19T15:54:30.100' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (188, 256, 150, 80, CAST(250000 AS Decimal(18, 0)), CAST(N'2022-04-19T15:54:30.103' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (189, 256, 151, 80, CAST(250000 AS Decimal(18, 0)), CAST(N'2022-04-19T15:54:30.103' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (190, 256, 152, 80, CAST(250000 AS Decimal(18, 0)), CAST(N'2022-04-19T15:54:30.107' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (191, 257, 153, 80, CAST(250000 AS Decimal(18, 0)), CAST(N'2022-04-19T15:54:44.930' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (192, 257, 154, 80, CAST(250000 AS Decimal(18, 0)), CAST(N'2022-04-19T15:54:44.933' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (193, 257, 155, 80, CAST(250000 AS Decimal(18, 0)), CAST(N'2022-04-19T15:54:44.933' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (194, 257, 156, 80, CAST(250000 AS Decimal(18, 0)), CAST(N'2022-04-19T15:54:44.937' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (195, 257, 157, 80, CAST(250000 AS Decimal(18, 0)), CAST(N'2022-04-19T15:54:44.937' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (196, 257, 158, 80, CAST(250000 AS Decimal(18, 0)), CAST(N'2022-04-19T15:54:44.940' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (197, 257, 159, 80, CAST(250000 AS Decimal(18, 0)), CAST(N'2022-04-19T15:54:44.940' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (198, 258, 160, 80, CAST(150000 AS Decimal(18, 0)), CAST(N'2022-04-19T15:55:51.170' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (199, 258, 161, 80, CAST(150000 AS Decimal(18, 0)), CAST(N'2022-04-19T15:55:51.170' AS DateTime))
GO
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (200, 258, 162, 80, CAST(150000 AS Decimal(18, 0)), CAST(N'2022-04-19T15:55:51.173' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (201, 258, 163, 80, CAST(150000 AS Decimal(18, 0)), CAST(N'2022-04-19T15:55:51.173' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (202, 258, 164, 80, CAST(150000 AS Decimal(18, 0)), CAST(N'2022-04-19T15:55:51.173' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (203, 258, 165, 80, CAST(150000 AS Decimal(18, 0)), CAST(N'2022-04-19T15:55:51.177' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (204, 258, 166, 80, CAST(150000 AS Decimal(18, 0)), CAST(N'2022-04-19T15:55:51.177' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (205, 258, 167, 80, CAST(150000 AS Decimal(18, 0)), CAST(N'2022-04-19T15:55:51.180' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (206, 259, 168, 80, CAST(150000 AS Decimal(18, 0)), CAST(N'2022-04-19T15:56:05.487' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (207, 259, 169, 80, CAST(150000 AS Decimal(18, 0)), CAST(N'2022-04-19T15:56:05.487' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (208, 259, 170, 80, CAST(150000 AS Decimal(18, 0)), CAST(N'2022-04-19T15:56:05.490' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (209, 259, 171, 80, CAST(150000 AS Decimal(18, 0)), CAST(N'2022-04-19T15:56:05.490' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (210, 259, 172, 80, CAST(150000 AS Decimal(18, 0)), CAST(N'2022-04-19T15:56:05.490' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (211, 259, 173, 80, CAST(150000 AS Decimal(18, 0)), CAST(N'2022-04-19T15:56:05.493' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (212, 259, 174, 80, CAST(150000 AS Decimal(18, 0)), CAST(N'2022-04-19T15:56:05.493' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (213, 259, 175, 80, CAST(150000 AS Decimal(18, 0)), CAST(N'2022-04-19T15:56:05.497' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (214, 260, 176, 80, CAST(150000 AS Decimal(18, 0)), CAST(N'2022-04-19T15:56:20.460' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (215, 260, 177, 80, CAST(150000 AS Decimal(18, 0)), CAST(N'2022-04-19T15:56:20.463' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (216, 260, 178, 80, CAST(150000 AS Decimal(18, 0)), CAST(N'2022-04-19T15:56:20.463' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (217, 260, 179, 80, CAST(150000 AS Decimal(18, 0)), CAST(N'2022-04-19T15:56:20.467' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (218, 260, 180, 80, CAST(150000 AS Decimal(18, 0)), CAST(N'2022-04-19T15:56:20.467' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (219, 260, 181, 80, CAST(150000 AS Decimal(18, 0)), CAST(N'2022-04-19T15:56:20.470' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (220, 260, 182, 80, CAST(150000 AS Decimal(18, 0)), CAST(N'2022-04-19T15:56:20.470' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (221, 260, 183, 80, CAST(150000 AS Decimal(18, 0)), CAST(N'2022-04-19T15:56:20.470' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (222, 261, 184, 80, CAST(150000 AS Decimal(18, 0)), CAST(N'2022-04-19T15:56:47.913' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (223, 261, 185, 80, CAST(150000 AS Decimal(18, 0)), CAST(N'2022-04-19T15:56:47.917' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (224, 261, 186, 80, CAST(150000 AS Decimal(18, 0)), CAST(N'2022-04-19T15:56:47.917' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (225, 261, 187, 80, CAST(150000 AS Decimal(18, 0)), CAST(N'2022-04-19T15:56:47.917' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (226, 261, 188, 80, CAST(150000 AS Decimal(18, 0)), CAST(N'2022-04-19T15:56:47.920' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (227, 261, 189, 80, CAST(150000 AS Decimal(18, 0)), CAST(N'2022-04-19T15:56:47.920' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (228, 261, 190, 80, CAST(150000 AS Decimal(18, 0)), CAST(N'2022-04-19T15:56:47.920' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (229, 261, 191, 80, CAST(150000 AS Decimal(18, 0)), CAST(N'2022-04-19T15:56:47.923' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (230, 262, 192, 80, CAST(150000 AS Decimal(18, 0)), CAST(N'2022-04-19T15:57:13.903' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (231, 262, 193, 80, CAST(150000 AS Decimal(18, 0)), CAST(N'2022-04-19T15:57:13.903' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (232, 262, 194, 80, CAST(150000 AS Decimal(18, 0)), CAST(N'2022-04-19T15:57:13.907' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (233, 262, 195, 80, CAST(150000 AS Decimal(18, 0)), CAST(N'2022-04-19T15:57:13.907' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (234, 262, 196, 80, CAST(150000 AS Decimal(18, 0)), CAST(N'2022-04-19T15:57:13.910' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (235, 262, 197, 80, CAST(150000 AS Decimal(18, 0)), CAST(N'2022-04-19T15:57:13.910' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (236, 262, 198, 80, CAST(150000 AS Decimal(18, 0)), CAST(N'2022-04-19T15:57:13.913' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (237, 262, 199, 80, CAST(150000 AS Decimal(18, 0)), CAST(N'2022-04-19T15:57:13.920' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (238, 264, 200, 50, CAST(800000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:01:11.397' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (239, 264, 201, 50, CAST(800000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:01:11.397' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (240, 264, 202, 50, CAST(800000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:01:11.400' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (241, 264, 203, 50, CAST(800000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:01:11.400' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (242, 264, 204, 50, CAST(800000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:01:11.403' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (243, 264, 205, 50, CAST(800000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:01:11.403' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (244, 264, 206, 50, CAST(800000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:01:11.403' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (245, 264, 207, 50, CAST(800000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:01:11.407' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (246, 264, 208, 50, CAST(800000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:01:11.407' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (247, 264, 209, 50, CAST(800000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:01:11.407' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (248, 264, 210, 50, CAST(800000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:01:11.410' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (249, 264, 211, 50, CAST(800000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:01:11.410' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (250, 266, 200, 50, CAST(800000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:02:14.387' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (251, 266, 201, 50, CAST(800000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:02:14.387' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (252, 266, 202, 50, CAST(800000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:02:14.387' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (253, 266, 203, 50, CAST(800000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:02:14.390' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (254, 266, 204, 50, CAST(800000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:02:14.390' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (255, 266, 205, 50, CAST(800000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:02:14.390' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (256, 266, 206, 50, CAST(800000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:02:14.390' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (257, 266, 207, 50, CAST(800000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:02:14.390' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (258, 266, 208, 50, CAST(800000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:02:14.390' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (259, 266, 209, 50, CAST(800000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:02:14.393' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (260, 266, 210, 50, CAST(800000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:02:14.393' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (261, 266, 211, 50, CAST(800000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:02:14.393' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (262, 267, 212, 50, CAST(800000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:05:53.780' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (263, 267, 213, 50, CAST(800000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:05:53.787' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (264, 267, 214, 50, CAST(800000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:05:53.787' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (265, 267, 215, 50, CAST(800000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:05:53.790' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (266, 267, 216, 50, CAST(800000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:05:53.790' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (267, 267, 217, 50, CAST(800000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:05:53.790' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (268, 267, 218, 50, CAST(800000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:05:53.793' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (269, 267, 219, 50, CAST(800000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:05:53.793' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (270, 267, 220, 50, CAST(800000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:05:53.797' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (271, 267, 221, 50, CAST(800000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:05:53.797' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (272, 267, 222, 50, CAST(800000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:05:53.797' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (273, 267, 223, 50, CAST(800000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:05:53.800' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (274, 268, 224, 50, CAST(800000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:06:31.277' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (275, 268, 225, 50, CAST(800000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:06:31.283' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (276, 268, 226, 50, CAST(800000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:06:31.290' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (277, 268, 227, 50, CAST(800000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:06:31.290' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (278, 268, 228, 50, CAST(800000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:06:31.290' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (279, 268, 229, 50, CAST(800000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:06:31.293' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (280, 268, 230, 50, CAST(800000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:06:31.293' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (281, 268, 231, 50, CAST(800000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:06:31.297' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (282, 268, 232, 50, CAST(800000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:06:31.300' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (283, 268, 233, 50, CAST(800000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:06:31.300' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (284, 268, 234, 50, CAST(800000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:06:31.300' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (285, 268, 235, 50, CAST(800000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:06:31.300' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (286, 269, 236, 50, CAST(800000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:07:08.320' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (287, 269, 237, 50, CAST(800000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:07:08.320' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (288, 269, 238, 50, CAST(800000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:07:08.323' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (289, 269, 239, 50, CAST(800000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:07:08.327' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (290, 269, 240, 50, CAST(800000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:07:08.327' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (291, 269, 241, 50, CAST(800000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:07:08.330' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (292, 269, 242, 50, CAST(800000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:07:08.330' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (293, 269, 243, 50, CAST(800000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:07:08.330' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (294, 269, 244, 50, CAST(800000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:07:08.333' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (295, 269, 245, 50, CAST(800000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:07:08.333' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (296, 269, 246, 50, CAST(800000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:07:08.333' AS DateTime))
INSERT [dbo].[ReceiptDetail] ([ID], [ReceiptID], [ProductDetailID], [ImportQuantity], [ImportPrice], [CreatedDate]) VALUES (297, 269, 247, 50, CAST(800000 AS Decimal(18, 0)), CAST(N'2022-04-19T16:07:08.337' AS DateTime))
SET IDENTITY_INSERT [dbo].[ReceiptDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[Rule] ON 

INSERT [dbo].[Rule] ([ID], [Name]) VALUES (1, N'Admin')
INSERT [dbo].[Rule] ([ID], [Name]) VALUES (2, N'Management')
INSERT [dbo].[Rule] ([ID], [Name]) VALUES (3, N'Staff')
INSERT [dbo].[Rule] ([ID], [Name]) VALUES (4, N'User')
SET IDENTITY_INSERT [dbo].[Rule] OFF
GO
SET IDENTITY_INSERT [dbo].[Shop] ON 

INSERT [dbo].[Shop] ([ID], [Name], [Logo], [Slogan], [Address], [PhoneNumber], [Email]) VALUES (1, N'Cửa hàng Nidas', N'/Admin/Content/Upload/120220308185125avatar.png', N'Nó bắt đầu với một ý tưởng đơn giản: Tạo ra những sản phẩm chất lượng, được thiết kế đẹp mà bản thân tôi muốn!', N'Hà Nội', N'0866721300', N'Holongnhat2000@gmail.com')
SET IDENTITY_INSERT [dbo].[Shop] OFF
GO
SET IDENTITY_INSERT [dbo].[Slide] ON 

INSERT [dbo].[Slide] ([ID], [Image], [DisplayOrder], [Link], [Title], [Status]) VALUES (1, N'/Admin/Content/Upload/120220412144352avatar.jpg', 1, N'/Product/Detail?id=4', N'GIÀY NAM GIÀY XU HƯỚNG MỚI', 1)
INSERT [dbo].[Slide] ([ID], [Image], [DisplayOrder], [Link], [Title], [Status]) VALUES (2, N'/images/img_bg_2.jpg', 2, N'/Product/Detail?id=4', N'GIÀY NỮ GIÀY XU HƯỚNG MỚI', 1)
INSERT [dbo].[Slide] ([ID], [Image], [DisplayOrder], [Link], [Title], [Status]) VALUES (3, N'/images/img_bg_3.jpg', 3, N'/Product/Detail?id=4', N'GIÀY NAM GIÀY XU HƯỚNG MỚI', 1)
INSERT [dbo].[Slide] ([ID], [Image], [DisplayOrder], [Link], [Title], [Status]) VALUES (4, N'/Admin/Content/Upload/120220412144615avatar.jpg', 4, N'/Product/Detail?id=4', N'	GIÀY NAM GIÀY XU HƯỚNG MỚI', 0)
SET IDENTITY_INSERT [dbo].[Slide] OFF
GO
SET IDENTITY_INSERT [dbo].[Supply] ON 

INSERT [dbo].[Supply] ([ID], [Name], [Phone], [Address], [Description]) VALUES (1, N'adidas', N'0866721301', N'Hà Đông', N'nhãn hàng disa')
INSERT [dbo].[Supply] ([ID], [Name], [Phone], [Address], [Description]) VALUES (2, N'Nike', N'0847848714', N'Tiền Giang', N'nhãn hàng nidas')
INSERT [dbo].[Supply] ([ID], [Name], [Phone], [Address], [Description]) VALUES (3, N'Phake as', N'0123452343', N'Dịa chỉ nè', N'demo nhan hàng')
INSERT [dbo].[Supply] ([ID], [Name], [Phone], [Address], [Description]) VALUES (4, N'adidas1', N'0866721301', N'Hà Đông', N'nhãn hàng disagsdg')
INSERT [dbo].[Supply] ([ID], [Name], [Phone], [Address], [Description]) VALUES (5, N'Nike1', N'0847848714', N'Tiền Giang', N'nhãn hàng nidas')
INSERT [dbo].[Supply] ([ID], [Name], [Phone], [Address], [Description]) VALUES (6, N'1123123', N'0123456789', N'Dịa chỉ nè', N'demo nhan hàng')
INSERT [dbo].[Supply] ([ID], [Name], [Phone], [Address], [Description]) VALUES (7, N'nha cc', N'01239808121', N'Sai gon a', N'mo t')
INSERT [dbo].[Supply] ([ID], [Name], [Phone], [Address], [Description]) VALUES (8, N'fasdf', N'0123452343', N'sdfgsdhsd', N'hdsfhsdhf')
SET IDENTITY_INSERT [dbo].[Supply] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([ID], [RuleID], [UserName], [HashedPassword], [Name], [Email], [Address], [PhoneNumber]) VALUES (1, 1, N'Admin', N'ZCthc6xoqYg=', N'Admin', N'holongnhat2000@gmail.com', N'Hà Nội', N'0866721300')
INSERT [dbo].[User] ([ID], [RuleID], [UserName], [HashedPassword], [Name], [Email], [Address], [PhoneNumber]) VALUES (2, 2, N'Manager', N'ZCthc6xoqYg=', N'Manager', N'Manager', N'Manager', N'541564')
INSERT [dbo].[User] ([ID], [RuleID], [UserName], [HashedPassword], [Name], [Email], [Address], [PhoneNumber]) VALUES (3, 3, N'Staff', N'ZCthc6xoqYg=', N'Staff', N'324165', N'Hà Nội', N'0866721300')
INSERT [dbo].[User] ([ID], [RuleID], [UserName], [HashedPassword], [Name], [Email], [Address], [PhoneNumber]) VALUES (4, 3, N'demo', N'ZCthc6xoqYg=', N'demo', N'54654', N'56435', N'0866721301')
INSERT [dbo].[User] ([ID], [RuleID], [UserName], [HashedPassword], [Name], [Email], [Address], [PhoneNumber]) VALUES (5, 4, N'nhat', N'hx5uYogkuCQ=', N'ten', N'email', N'dia chi nè', N'09768118764')
INSERT [dbo].[User] ([ID], [RuleID], [UserName], [HashedPassword], [Name], [Email], [Address], [PhoneNumber]) VALUES (6, 4, N'123', N'1x3R3eocF5Y=', N'123', N'nhat@1231654', N'123', N'0866721300')
INSERT [dbo].[User] ([ID], [RuleID], [UserName], [HashedPassword], [Name], [Email], [Address], [PhoneNumber]) VALUES (7, 4, N'holongnhat2000', N'PXAbVQhR7arWPIDYe8qImw==', NULL, N'holongnhat2000@gmail.com', NULL, NULL)
INSERT [dbo].[User] ([ID], [RuleID], [UserName], [HashedPassword], [Name], [Email], [Address], [PhoneNumber]) VALUES (8, 4, N'admin1', N'lykPAKovWmI=', NULL, N'holongnhat2000@gmail.com', NULL, NULL)
INSERT [dbo].[User] ([ID], [RuleID], [UserName], [HashedPassword], [Name], [Email], [Address], [PhoneNumber]) VALUES (9, 4, N'admin2', N'lykPAKovWmI=', NULL, N'holongnhat200@gmail.com', NULL, NULL)
INSERT [dbo].[User] ([ID], [RuleID], [UserName], [HashedPassword], [Name], [Email], [Address], [PhoneNumber]) VALUES (10, 4, N'holongnhat', N'lykPAKovWmI=', NULL, N'dray.opp.1909@gmail.com', NULL, NULL)
INSERT [dbo].[User] ([ID], [RuleID], [UserName], [HashedPassword], [Name], [Email], [Address], [PhoneNumber]) VALUES (11, 4, N'khachhang1', N'lykPAKovWmI=', NULL, N'khachhang@gmail.com', NULL, NULL)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[FeedBack] ADD  CONSTRAINT [DF_FeedBack_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[ProductPrice] ADD  CONSTRAINT [DF_ProductPrice_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[ProductReview] ADD  CONSTRAINT [DF_ProductReview_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Receipt] ADD  CONSTRAINT [DF_Receipt_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[ReceiptDetail] ADD  CONSTRAINT [DF_ReceiptDetail_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  StoredProcedure [dbo].[forgot_password]    Script Date: 4/19/2022 5:40:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

     CREATE proc [dbo].[forgot_password]
@email nvarchar(255),
@newPass nvarchar(255)
as
begin
	if exists (select top 1 * from [User] where Email = @email)
	begin
		update [User]
		set HashedPassword = @newPass
		where Email = @email
	end
	select @@ROWCOUNT
end
GO
/****** Object:  StoredProcedure [dbo].[NidasShoes_create_login]    Script Date: 4/19/2022 5:40:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[NidasShoes_create_login]
@Id int,
@RuleID int = 4,
@UserName nvarchar(255),
@HashedPassword nvarchar(255),
@Name nvarchar(255) ='',
@Email nvarchar(255) = '',
@Address nvarchar(255) = '',
@Phone nvarchar(255) =''
as
begin
	if @Id = 0
		begin
			if not exists (select * from [User] where UserName = @UserName or Email=@Email)
				begin
					insert into [User] values (@RuleID,@UserName,@HashedPassword,@Name,@Email,@Address,@Phone)
					select 1
				end
			else
				begin
					select 0
				end
		end
	else
		begin
			if  exists (select * from [User] where UserName= @UserName and @Id = Id)
				begin
					update  [User]
					set HashedPassword = @HashedPassword,
						RuleID = @RuleID,
						[Name] = @Name,
						Email = @Email,
						[Address] = @Address,
						PhoneNumber = @Phone
						where Id = @Id
						select 1
				end
			else
				begin
					select 0
				end
		end
end
GO
/****** Object:  StoredProcedure [dbo].[NidasShoes_create_or_update_Discount]    Script Date: 4/19/2022 5:40:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[NidasShoes_create_or_update_Discount]
@Id int,
@Code nvarchar(255),
@StartDate datetime,
@EndDate datetime,
@Rate int,
@Description nvarchar(255)
as
begin
 if @Id = 0
	begin
		insert into Discount(Code,StartDate,EndDate,Rate,Description) values (@Code,@StartDate,@EndDate,@Rate,@Description)
		select iif(@@ROWCOUNT>0,1,0)
	end

 else
	begin
	    update Discount
		set Code = @Code
		,StartDate = @StartDate
		,EndDate = @EndDate
		,Rate = @Rate
		,Description = @Description
		where Id = @Id
		select iif(@@ROWCOUNT>0,1,0)
	end
end
GO
/****** Object:  StoredProcedure [dbo].[NidasShoes_create_or_update_FeedBack]    Script Date: 4/19/2022 5:40:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[NidasShoes_create_or_update_FeedBack]
@Id int,
@UserID INT,
@Title nvarchar(255),
@Content nvarchar(255),
@ParentFBID INT
as
begin
 if @Id = 0
	begin
		insert into FeedBack(UserID,Title,Content,ParentFBID) values (@UserID,@Title,@Content,@ParentFBID)
		select iif(@@ROWCOUNT>0,1,0)
	end

 else
	begin
	    update FeedBack
		set UserID = @UserID
		,Title = @Title
		,Content = @Content
		,ParentFBID = @ParentFBID
		,CreatedDate = GETDATE()
		where Id = @Id
		select iif(@@ROWCOUNT>0,1,0)
	end
end
GO
/****** Object:  StoredProcedure [dbo].[NidasShoes_create_or_update_Order]    Script Date: 4/19/2022 5:40:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[NidasShoes_create_or_update_Order]
@Id int,
@CustomerID INT =0,
@EmployeeID INT =0,
@PaymentID  INT = 0,
@DiscountID INT =0,
@Description nvarchar(max) = '',
@Note nvarchar(max) = '',
@OrderStatusID INT,
@CustomerName nvarchar(255),
@CustomerMobile nvarchar(255),
@CustomerEmail nvarchar(255),
@CustomerAddress nvarchar(max),
@TotalCost	DECIMAL,
@OrderDetail OrderDetails READONLY
as
begin
 if @Id = 0
	begin
		insert into [dbo].[Order](CustomerID,EmployeeID,PaymentID,[DiscountID],[Description],[Note],[OrderStatusID],[CustomerName],[CustomerMobile],[CustomerEmail],CustomerAddress,TotalCost,ModifyDate) 
		VALUES (@CustomerID,@EmployeeID,@PaymentID,@DiscountID,@Description,@Note,@OrderStatusID,@CustomerName,@CustomerMobile,@CustomerEmail,@CustomerAddress,@TotalCost,GETDATE())
		
		
		declare @IdNew int
		select top 1 @IdNew = Id from dbo.[Order] order by Id desc

		insert into [dbo].[OrderDetail](OrderID,ProductDetailID,Price,Quantity) 
		select @IdNew,ProductDetailID,Price,Quantity from @OrderDetail

	end

 else
	begin
	    update [dbo].[Order]
		set CustomerID = @CustomerID
		,EmployeeID = @EmployeeID
		,PaymentID = @PaymentID
		,[DiscountID] = @DiscountID
		,[Description] = @Description
		,[Note] = @Note
		,[OrderStatusID] = @OrderStatusID
		,CustomerName = @CustomerName
		,[CustomerMobile] = @CustomerMobile
		,[CustomerEmail] = @CustomerEmail
		,CustomerAddress = @CustomerAddress
		,TotalCost = @TotalCost	 
		,ModifyDate = GETDATE()
		where Id = @Id
		
		delete [OrderDetail] where OrderID = @Id
		insert into [OrderDetail](OrderID,ProductDetailID,Price,Quantity) 
		select @IdNew,ProductDetailID,Price,Quantity from @OrderDetail

	end
end
GO
/****** Object:  StoredProcedure [dbo].[NidasShoes_create_or_update_OrderDetail]    Script Date: 4/19/2022 5:40:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[NidasShoes_create_or_update_OrderDetail]
@Id int,
@OrderID INT,
@ProductDetailID INT,
@Price DECIMAL,
@Quantity INT
as
begin
 if @Id = 0
	begin
		insert into [dbo].[OrderDetail](OrderID,ProductDetailID,Price,Quantity) 
		VALUES (@OrderID,@ProductDetailID,@Price,@Quantity)
		select iif(@@ROWCOUNT>0,1,0)
	end

 else
	begin
	    update [dbo].[OrderDetail]
		set OrderID = @OrderID
		,ProductDetailID = @ProductDetailID
		,Price = @Price
		,Quantity = @Quantity
		where Id = @Id
		select iif(@@ROWCOUNT>0,1,0)
	end
end
GO
/****** Object:  StoredProcedure [dbo].[NidasShoes_create_or_update_Product]    Script Date: 4/19/2022 5:40:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[NidasShoes_create_or_update_Product]
@Id int,
@ProductCategoryID INT,
@Code NVARCHAR(255),
@Name NVARCHAR(255),
@Title NVARCHAR(MAX),
@Description NVARCHAR(MAX),
@Status bit,
@Manufacturer NVARCHAR(MAX),
@ProductImage ProductImages readonly

as
begin
 if @Id = 0
	begin
		insert into Product(ProductCategoryID,Code,Name,Title,Description,Status,Manufacturer) values (@ProductCategoryID,@Code,@Name,@Title,@Description,@Status,@Manufacturer)

		declare @IdNew int
		select top 1 @IdNew = Id from Product order by Id desc

		insert into [dbo].[ProductImage](ProductID,Image) 
		select @IdNew,Image from @ProductImage

		select 1
	end

 else
	begin
	    update Product
		set ProductCategoryID = @ProductCategoryID
		,Code = @Code
		,Name = @Name
		,Title = @Title
		,Description = @Description
		,Status = @Status
		,Manufacturer = @Manufacturer
		where Id = @Id

		delete ProductImage where ProductId = @Id
		insert into ProductImage(ProductId,Image) 
		select @Id,Image from @ProductImage

		select 1
	end
end
GO
/****** Object:  StoredProcedure [dbo].[NidasShoes_create_or_update_ProductCategory]    Script Date: 4/19/2022 5:40:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[NidasShoes_create_or_update_ProductCategory]
@Id int,
@ParentID INT,
@Name nvarchar(255),
@Description nvarchar(255),
@Status bit
as
begin
 if @Id = 0
	begin
		insert into ProductCategory(ParentID,Name,Description,Status) values (@ParentID,@Name,@Description,@Status)
		select iif(@@ROWCOUNT>0,1,0)
	end

 else
	begin
	    update ProductCategory
		set ParentID = @ParentID
		,Name = @Name
		,Description = @Description
		,Status = @Status
		where Id = @Id
		select iif(@@ROWCOUNT>0,1,0)
	end
end
GO
/****** Object:  StoredProcedure [dbo].[NidasShoes_create_or_update_ProductColor]    Script Date: 4/19/2022 5:40:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[NidasShoes_create_or_update_ProductColor]
@Id int,
@Name nvarchar(255),
@Code nvarchar(255)
as
begin
 if @Id = 0
	begin
		insert into ProductColor(Name,Code) values (@Name,@Code)
		select iif(@@ROWCOUNT>0,1,0)
	end

 else
	begin
	    update ProductColor
		set Name = @Name
		,Code = @Code
		where Id = @Id
		select iif(@@ROWCOUNT>0,1,0)
	end
end
GO
/****** Object:  StoredProcedure [dbo].[NidasShoes_create_or_update_ProductDetail]    Script Date: 4/19/2022 5:40:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[NidasShoes_create_or_update_ProductDetail]
@Id int,
@ProductID int,
@SizeID int,
@ColorID int,
@Quantity int,
@Image nvarchar(255),
@ImportPrice DECIMAL,
@ExportPrice DECIMAL
as
begin
 if @Id = 0
	begin
		insert into ProductDetail(ProductID,SizeID,ColorID,Quantity,Image) values (@ProductID,@SizeID,@ColorID,@Quantity,@Image)
		select iif(@@ROWCOUNT>0,1,0)
	end

 else
	begin
	    update ProductDetail
		set 
		Quantity = @Quantity
		,Image = @Image
		where Id = @Id

		INSERT INTO dbo.ProductPrice
		(
		    ImportPrice,
		    ExportPrice,
		    CreatedDate,
		    ProductDetailID
		)
		VALUES
		(   @ImportPrice,      -- ImportPrice - decimal(18, 0)
		    @ExportPrice,      -- ExportPrice - decimal(18, 0)
		    GETDATE(), -- CreatedDate - datetime
		    @Id          -- ProductDetailID - int
		    )


		select iif(@@ROWCOUNT>0,1,0)
	end
end
GO
/****** Object:  StoredProcedure [dbo].[NidasShoes_create_or_update_ProductReview]    Script Date: 4/19/2022 5:40:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[NidasShoes_create_or_update_ProductReview]
@Id int,
@UserID INT,
@ProductID INT,
@Star FLOAT,
@Favorite INT
as
begin
 if @Id = 0
	begin
		insert into ProductReview(UserID,ProductID,Star,Favorite) values (@UserID,@ProductID,@Star,@Favorite)
		select iif(@@ROWCOUNT>0,1,0)
	end

 else
	begin
	    update ProductReview
		set UserID = @UserID
		,ProductID = @ProductID
		,Star = @Star
		,Favorite = @Favorite
		where Id = @Id
		select iif(@@ROWCOUNT>0,1,0)
	end
end
GO
/****** Object:  StoredProcedure [dbo].[NidasShoes_create_or_update_ProductSize]    Script Date: 4/19/2022 5:40:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[NidasShoes_create_or_update_ProductSize]
@Id int,
@Name nvarchar(255)
as
begin
 if @Id = 0
	begin
		insert into ProductSize(Name) values (@Name)
		select iif(@@ROWCOUNT>0,1,0)
	end

 else
	begin
	    update ProductSize
		set [Name] = @Name
		WHERE ID = @Id
		select iif(@@ROWCOUNT>0,1,0)
	end
end
GO
/****** Object:  StoredProcedure [dbo].[NidasShoes_create_or_update_Receipt]    Script Date: 4/19/2022 5:40:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[NidasShoes_create_or_update_Receipt]
@Id int,
@UserID int,
@Note nvarchar(max),
@SupplyID INT
as
begin
 if @Id = 0
	begin
		insert into Receipt(UserID,Note,SupplyID) values (@UserID,@Note,@SupplyID)
		select iif(@@ROWCOUNT>0,1,0)
	end

 else
	begin
	    update Receipt
		set UserID = @UserID
		,Note = @Note
		,SupplyID = @SupplyID
		WHERE ID = @Id
		select iif(@@ROWCOUNT>0,1,0)
	end
end
GO
/****** Object:  StoredProcedure [dbo].[NidasShoes_create_or_update_ReceiptDetail]    Script Date: 4/19/2022 5:40:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[NidasShoes_create_or_update_ReceiptDetail]
@Id int,
@ProductDetailID INT,
@ImportQuantity INT,
@ImportPrice DECIMAL
as
BEGIN
	DECLARE @ReceiptID int
	SELECT TOP(1) @ReceiptID = id FROM dbo.Receipt ORDER BY ID DESC
	
	IF @ProductDetailID = 0
	BEGIN
		SELECT TOP(1) @ProductDetailID = id FROM dbo.ProductDetail ORDER BY ID DESC
	END


 if @Id = 0
	begin
		insert into ReceiptDetail(ReceiptID,ProductDetailID,ImportQuantity,ImportPrice) values (@ReceiptID,@ProductDetailID,@ImportQuantity,@ImportPrice)
		
		UPDATE dbo.ProductDetail 
		SET Quantity = Quantity + @ImportQuantity
		WHERE ID = @ProductDetailID
		-- update bảng giá sau khi nhập đơn
		--insert into dbo.ProductPrice(ImportPrice, ExportPrice,CreatedDate, ProductDetailID)
		--VALUES(   @ImportPrice,@ImportPrice, GETDATE(),@ProductDetailID)

		SELECT iif(@@ROWCOUNT>0,1,0)
	end

 else
	begin
	    update ReceiptDetail
		set ReceiptID =@ReceiptID,
		ProductDetailID = @ProductDetailID
		,ImportQuantity = @ImportQuantity
		,ImportPrice = @ImportPrice
		WHERE ID = @Id
		select iif(@@ROWCOUNT>0,1,0)
	end
end
GO
/****** Object:  StoredProcedure [dbo].[NidasShoes_create_or_update_Shop]    Script Date: 4/19/2022 5:40:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create proc [dbo].[NidasShoes_create_or_update_Shop]
@Id int,
@Name nvarchar(255),
@Logo nvarchar(255),
@Slogan nvarchar(255),
@Address nvarchar(255),
@PhoneNumber nvarchar(255),
@Email nvarchar(255)
as
begin
 if @Id = 0
	begin
		insert into Shop(Name,Logo,Slogan,Address,PhoneNumber,Email) values (@Name,@Logo,@Slogan,@Address,@PhoneNumber,@Email)
		select iif(@@ROWCOUNT>0,1,0)
	end

 else
	begin
	    update Shop
		set Name = @Name
		,Logo = @Logo
		,Slogan = @Slogan
		,Address = @Address
		,PhoneNumber = @PhoneNumber
		,Email = @Email
		where Id = @Id
		select iif(@@ROWCOUNT>0,1,0)
	end
end
GO
/****** Object:  StoredProcedure [dbo].[NidasShoes_create_or_update_Slide]    Script Date: 4/19/2022 5:40:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[NidasShoes_create_or_update_Slide]
@Id int,
@Image nvarchar(255),
@DisplayOrder int,
@Link nvarchar(255),
@Title nvarchar(255),
@Status bit
as
begin
 if @Id = 0
	begin
		insert into Slide([Image],[DisplayOrder],[Link],[Title],[Status]) values (@Image,@DisplayOrder,@Link,@Title,@Status)
		select iif(@@ROWCOUNT>0,1,0)
	end

 else
	begin
	    update Slide
		set [Image] = @Image
		,[DisplayOrder] = @DisplayOrder
		,[Link] = @Link
		,[Title] = @Title
		,[Status] = @Status
		where Id = @Id
		select iif(@@ROWCOUNT>0,1,0)
	end
end
GO
/****** Object:  StoredProcedure [dbo].[NidasShoes_create_or_update_Supply]    Script Date: 4/19/2022 5:40:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create proc [dbo].[NidasShoes_create_or_update_Supply]
@Id int,
@Name nvarchar(255),
@Phone nvarchar(255),
@Address nvarchar(255),
@Description nvarchar(255)
as
begin
 if @Id = 0
	begin
		insert into Supply([Name],Phone,[Address],[Description]) values (@Name,@Phone,@Address,@Description)
		select iif(@@ROWCOUNT>0,1,0)
	end

 else
	begin
	    update Supply
		set Name = @Name
		,Phone = @Phone
		,Address = @Address
		,Description = @Description
		where Id = @Id
		select iif(@@ROWCOUNT>0,1,0)
	end
end
GO
/****** Object:  StoredProcedure [dbo].[NidasShoes_delete_Discount]    Script Date: 4/19/2022 5:40:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[NidasShoes_delete_Discount]
@Id int
as
begin
	delete Discount
	where Id = @Id
	select iif(@@ROWCOUNT>0,1,0) 
end
GO
/****** Object:  StoredProcedure [dbo].[NidasShoes_delete_FeedBack]    Script Date: 4/19/2022 5:40:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[NidasShoes_delete_FeedBack]
@Id int
as
begin
	delete FeedBack
	where Id = @Id
	select iif(@@ROWCOUNT>0,1,0) 
end
GO
/****** Object:  StoredProcedure [dbo].[NidasShoes_delete_Order]    Script Date: 4/19/2022 5:40:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[NidasShoes_delete_Order]
@Id int
as
begin
	delete [dbo].[Order]
	where Id = @Id
	select iif(@@ROWCOUNT>0,1,0) 
end
GO
/****** Object:  StoredProcedure [dbo].[NidasShoes_delete_OrderDetail]    Script Date: 4/19/2022 5:40:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[NidasShoes_delete_OrderDetail]
@Id int
as
begin
	delete [dbo].[OrderDetail]
	where Id = @Id
	select iif(@@ROWCOUNT>0,1,0) 
end
GO
/****** Object:  StoredProcedure [dbo].[NidasShoes_delete_OrderStatus]    Script Date: 4/19/2022 5:40:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[NidasShoes_delete_OrderStatus]
@Id int
as
begin
	delete [dbo].[OrderStatus]
	where Id = @Id
	select iif(@@ROWCOUNT>0,1,0) 
end
GO
/****** Object:  StoredProcedure [dbo].[NidasShoes_delete_Product]    Script Date: 4/19/2022 5:40:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[NidasShoes_delete_Product]
@Id int
as
begin
	delete Product
	where Id = @Id
	select iif(@@ROWCOUNT>0,1,0) 
end
GO
/****** Object:  StoredProcedure [dbo].[NidasShoes_delete_ProductCategory]    Script Date: 4/19/2022 5:40:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[NidasShoes_delete_ProductCategory]
@Id int
as
begin
	delete ProductCategory
	where Id = @Id
	select iif(@@ROWCOUNT>0,1,0) 
end
GO
/****** Object:  StoredProcedure [dbo].[NidasShoes_delete_ProductColor]    Script Date: 4/19/2022 5:40:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[NidasShoes_delete_ProductColor]
@Id int
as
begin
	delete ProductColor
	where Id = @Id
	select iif(@@ROWCOUNT>0,1,0) 
end
GO
/****** Object:  StoredProcedure [dbo].[NidasShoes_delete_ProductDetail]    Script Date: 4/19/2022 5:40:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
      

create proc [dbo].[NidasShoes_delete_ProductDetail]
@Id int
as
begin
	delete ProductDetail
	where Id = @Id
	select iif(@@ROWCOUNT>0,1,0) 
end
GO
/****** Object:  StoredProcedure [dbo].[NidasShoes_delete_ProductReview]    Script Date: 4/19/2022 5:40:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[NidasShoes_delete_ProductReview]
@Id int
as
begin
	delete ProductReview
	where Id = @Id
	select iif(@@ROWCOUNT>0,1,0) 
end
GO
/****** Object:  StoredProcedure [dbo].[NidasShoes_delete_ProductSize]    Script Date: 4/19/2022 5:40:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[NidasShoes_delete_ProductSize]
@Id int
as
begin
	delete ProductSize
	where Id = @Id
	select iif(@@ROWCOUNT>0,1,0) 
end
GO
/****** Object:  StoredProcedure [dbo].[NidasShoes_delete_Receipt]    Script Date: 4/19/2022 5:40:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[NidasShoes_delete_Receipt]
@Id int
as
begin
	delete Receipt
	where Id = @Id
	select iif(@@ROWCOUNT>0,1,0) 
end
GO
/****** Object:  StoredProcedure [dbo].[NidasShoes_delete_ReceiptDetail]    Script Date: 4/19/2022 5:40:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[NidasShoes_delete_ReceiptDetail]
@Id int
as
begin
	delete ReceiptDetail
	where Id = @Id
	select iif(@@ROWCOUNT>0,1,0) 
end
GO
/****** Object:  StoredProcedure [dbo].[NidasShoes_delete_Shop]    Script Date: 4/19/2022 5:40:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[NidasShoes_delete_Shop]
@Id int
as
begin
	delete Shop
	where Id = @Id
	select iif(@@ROWCOUNT>0,1,0) 
end
GO
/****** Object:  StoredProcedure [dbo].[NidasShoes_delete_Slide]    Script Date: 4/19/2022 5:40:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[NidasShoes_delete_Slide]
@Id int
as
begin
	delete Slide
	where Id = @Id
	select iif(@@ROWCOUNT>0,1,0) 
end
GO
/****** Object:  StoredProcedure [dbo].[NidasShoes_delete_Supply]    Script Date: 4/19/2022 5:40:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[NidasShoes_delete_Supply]
@Id int
as
begin
	delete Supply
	where Id = @Id
	select iif(@@ROWCOUNT>0,1,0) 
end
GO
/****** Object:  StoredProcedure [dbo].[NidasShoes_delete_user_login]    Script Date: 4/19/2022 5:40:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[NidasShoes_delete_user_login]
@Id int
as
begin
	delete [dbo].[User]
	where Id = @Id
	select iif(@@ROWCOUNT>0,1,0) 
end
GO
/****** Object:  StoredProcedure [dbo].[NidasShoes_get_client_Product]    Script Date: 4/19/2022 5:40:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[NidasShoes_get_client_Product]
@BaseParam BaseParamType readonly,
@Totals int  out,
@PageCount int out
as
begin
	declare @Search nvarchar(max),
			@PageSize int,
			@PageNumber int

	declare @whereSql nvarchar(max) = 'where 1=1',
			@sql nvarchar(max) = ''
	
	select top 1 @Search = Search,@PageSize = PageSize,@PageNumber = PageNumber from @BaseParam
	select @Totals = count(Id) from Product
	set @PageCount = iif(@Totals % @PageSize=0,@Totals / @PageSize,@Totals / @PageSize+1)
	if ISNULL(@Search,'') != ''
		begin
			set @whereSql += N'and (p.name like N''%''+@Search+''%''
									or p.code like N''%''+@Search+''%''
									or p.title like N''%''+@Search+''%''
									or p.description like N''%''+@Search+''%''
									)'
		end
	set @sql = N'		
		SELECT p.*,tpp.ExportPrice,tpi.image FROM product p 
		LEFT JOIN dbo.ProductCategory pc ON p.ProductCategoryID = pc.ID  
		OUTER APPLY(
			SELECT TOP(1)* FROM dbo.ProductImage i WHERE i.productId = p.ID
	
		) AS [tpi]
		OUTER APPLY(
			SELECT TOP(1)pp.* FROM dbo.ProductPrice pp 
			JOIN dbo.ProductDetail pd ON pp.ProductDetailID = pd.ID
			WHERE pd.ProductID =p.ID
			ORDER BY pp.CreatedDate DESC
		) AS [tpp]
		' + @whereSql + '
		order by [Id] desc
		offset (@PageSize*(@PageNumber-1)) rows fetch next @PageSize rows only'
	print @Sql
	declare @Param nvarchar(max) = N'@Search nvarchar(max),@PageSize int,@PageNumber int,@Totals int,@PageCount int'
	EXEC sp_executesql @Sql,@Param,@Search,@PageSize,@PageNumber,@Totals,@PageCount
end
GO
/****** Object:  StoredProcedure [dbo].[NidasShoes_get_Client_Product_Detail]    Script Date: 4/19/2022 5:40:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE proc [dbo].[NidasShoes_get_Client_Product_Detail]
@Id int	 ,
@sizeID int,
@colorID int
as
begin
	SELECT TOP(1) p.*
	,pc.name [NameProductCategory]
	,pc.Description [DescriptionProductCategory] 
	,c.name [NameColor]
	,c.code [CodeColor]
	,s.name [NameSize]
	,pd.Quantity
	,tpp.ImportPrice
	,tpp.ExportPrice
	,tpp.CreatedDate [LastUpdatedDate]
	,pd.ID	ProductDetailID
	,pd.Image 
	FROM product p 
	LEFT JOIN dbo.ProductCategory pc ON p.ProductCategoryID = pc.ID  
	LEFT JOIN dbo.ProductDetail	 pd ON p.id =pd.ProductID
	LEFT JOIN ProductColor c ON pd.ColorID	= c.id
	LEFT JOIN ProductSize s ON pd.SizeID= s.id
	OUTER APPLY(
		SELECT TOP(1) * FROM dbo.ProductPrice pp WHERE pd.id = pp.ProductDetailID
		ORDER BY pp.CreatedDate DESC
	) AS tpp
	WHERE p.ID = @Id AND (@sizeID=0 OR @sizeID =s.id) AND (@colorID =0 OR @colorID = c.id)
end
GO
/****** Object:  StoredProcedure [dbo].[NidasShoes_get_Client_Product_Detail_by_productDetailId]    Script Date: 4/19/2022 5:40:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create proc [dbo].[NidasShoes_get_Client_Product_Detail_by_productDetailId]
@Id int	 
as
begin

	--SELECT  * from	   product JOIN det WHERE 	   (@sizeID  = 0 OR @sizeID = dbo.Size)

	 --declare @whereSql nvarchar(max) = N'',
		--	@sql nvarchar(max) = N''
	 --if ISNULL(@sizeID,'') != ''
		--begin
		--	set @whereSql += 'and  c.id ='+ CONVERT(varchar(20), @sizeID)+''
		--end
	 -- if ISNULL(@colorID,'') != ''
		--begin
		--	set @whereSql += 'and s.id ='+ CONVERT(varchar(20), @colorID)+''
		--end

	SELECT TOP(1) p.*
	,pc.name [NameProductCategory]
	,pc.Description [DescriptionProductCategory] 
	,c.name [NameColor]
	,c.code [CodeColor]
	,s.name [NameSize]
	,pd.Quantity
	,tpp.ImportPrice
	,tpp.ExportPrice
	,tpp.CreatedDate [LastUpdatedDate]
	,pd.ID	productDetailID
	,pd.Image 
	FROM product p 
	LEFT JOIN dbo.ProductCategory pc ON p.ProductCategoryID = pc.ID  
	LEFT JOIN dbo.ProductDetail	 pd ON p.id =pd.ProductID
	LEFT JOIN ProductColor c ON pd.ColorID	= c.id
	LEFT JOIN ProductSize s ON pd.SizeID= s.id
	OUTER APPLY(
		SELECT TOP(1) * FROM dbo.ProductPrice pp WHERE pd.id = pp.ProductDetailID
		ORDER BY pp.CreatedDate DESC
	) AS tpp
	WHERE pd.id = @Id 
end
GO
/****** Object:  StoredProcedure [dbo].[NidasShoes_get_Discount]    Script Date: 4/19/2022 5:40:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[NidasShoes_get_Discount]
@BaseParam BaseParamType readonly,
@Totals int  out,
@PageCount int out
as
begin
	declare @Search nvarchar(max),
			@PageSize int,
			@PageNumber int

	declare @whereSql nvarchar(max) = 'where 1=1',
			@sql nvarchar(max) = ''
	
	select top 1 @Search = Search,@PageSize = PageSize,@PageNumber = PageNumber from @BaseParam
	select @Totals = count(Id) from Discount
	set @PageCount = iif(@Totals % @PageSize=0,@Totals / @PageSize,@Totals / @PageSize+1)
	if ISNULL(@Search,'') != ''
		begin
			set @whereSql += N'and (Code like N''%'+@Search+'%''
									or Description like N''%'+@Search+'%''
									)'
		end
	set @sql = N'
		
		select 
		* from Discount
		' + @whereSql + '
		order by [Id]
		offset (@PageSize*(@PageNumber-1)) rows fetch next @PageSize rows only'
	print @Sql
	declare @Param nvarchar(max) = N'@Search nvarchar(max),@PageSize int,@PageNumber int,@Totals int,@PageCount int'
	EXEC sp_executesql @Sql,@Param,@Search,@PageSize,@PageNumber,@Totals,@PageCount
end
GO
/****** Object:  StoredProcedure [dbo].[NidasShoes_get_Discount_byId]    Script Date: 4/19/2022 5:40:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[NidasShoes_get_Discount_byId]
@Id int
as
begin
	select * from Discount
	where Id = @Id
end
GO
/****** Object:  StoredProcedure [dbo].[NidasShoes_get_FeedBack]    Script Date: 4/19/2022 5:40:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[NidasShoes_get_FeedBack]
@BaseParam BaseParamType readonly,
@Totals int  out,
@PageCount int out
as
begin
	declare @Search nvarchar(max),
			@PageSize int,
			@PageNumber int

	declare @whereSql nvarchar(max) = 'where 1=1',
			@sql nvarchar(max) = ''
	
	select top 1 @Search = Search,@PageSize = PageSize,@PageNumber = PageNumber from @BaseParam
	select @Totals = count(Id) from FeedBack
	set @PageCount = iif(@Totals % @PageSize=0,@Totals / @PageSize,@Totals / @PageSize+1)
	if ISNULL(@Search,'') != ''
		begin
			set @whereSql += N'and (Name like N''%'+@Search+'%''
									)'
		end
	set @sql = N'
		
		select 
		* from FeedBack
		' + @whereSql + '
		order by [Id]
		offset (@PageSize*(@PageNumber-1)) rows fetch next @PageSize rows only'
	print @Sql
	declare @Param nvarchar(max) = N'@Search nvarchar(max),@PageSize int,@PageNumber int,@Totals int,@PageCount int'
	EXEC sp_executesql @Sql,@Param,@Search,@PageSize,@PageNumber,@Totals,@PageCount
end
GO
/****** Object:  StoredProcedure [dbo].[NidasShoes_get_FeedBack_byId]    Script Date: 4/19/2022 5:40:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[NidasShoes_get_FeedBack_byId]
@Id int
as
begin
	select * from FeedBack
	where Id = @Id
end


declare @BaseParam BaseParamType 
insert into @BaseParam values (N'mota',10,1)
exec [NidasShoes_get_FeedBack] @BaseParam,1,1
GO
/****** Object:  StoredProcedure [dbo].[NidasShoes_get_Order]    Script Date: 4/19/2022 5:40:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[NidasShoes_get_Order]
@BaseParam BaseParamType readonly,
@Totals int  out,
@PageCount int out
as
begin
	declare @Search nvarchar(max),
			@PageSize int,
			@PageNumber int

	declare @whereSql nvarchar(max) = 'where 1=1',
			@sql nvarchar(max) = ''
	
	select top 1 @Search = Search,@PageSize = PageSize,@PageNumber = PageNumber from @BaseParam
	select @Totals = count(Id) FROM [dbo].[Order]
	set @PageCount = iif(@Totals % @PageSize=0,@Totals / @PageSize,@Totals / @PageSize+1)
	if ISNULL(@Search,'') != ''
		begin
			set @whereSql += N'and (o.CustomerName like N''%''+@Search+''%''
								or o.CustomerMobile like N''%''+@Search+''%''
								or o.CustomerEmail like N''%''+@Search+''%''
								or o.CustomerAddress like N''%''+@Search+''%''
								or os.Name like N''%''+@Search+''%''
								or p.Name like N''%''+@Search+''%''
								or u.Name like N''%''+@Search+''%''
								or d.Code like N''%''+@Search+''%''
								
									)'
		END
        --or o.id =CONVERT(int,''''+@Search+'''')
	set @sql = N'
		
		SELECT o.*,
			os.Name StatusName,
			p.Name PaymentName,
			u.Name EmployeeName,
			d.Code
		FROM dbo.[Order] o 
		LEFT JOIN dbo.OrderStatus os ON  os.ID = o.OrderStatusID
		LEFT JOIN dbo.Payment p ON o.PaymentID = p.ID
		LEFT JOIN dbo.[User] u ON o.EmployeeID = u.ID
		LEFT JOIN dbo.Discount d ON o.DiscountID = d.ID
		' + @whereSql + '
		order by o.OrderStatusID  ASC,o.ID DESC 
		offset (@PageSize*(@PageNumber-1)) rows fetch next @PageSize rows only'
	print @Sql
	declare @Param nvarchar(max) = N'@Search nvarchar(max),@PageSize int,@PageNumber int,@Totals int,@PageCount int'
	EXEC sp_executesql @Sql,@Param,@Search,@PageSize,@PageNumber,@Totals,@PageCount
end
GO
/****** Object:  StoredProcedure [dbo].[NidasShoes_get_Order_by_CustomerId]    Script Date: 4/19/2022 5:40:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[NidasShoes_get_Order_by_CustomerId]
@Id int
as
begin
		SELECT o.*,
			os.Name StatusName,
			p.Name PaymentName,
			u.Name EmployeeName,
			d.Code
		FROM dbo.[Order] o 
		LEFT JOIN dbo.OrderDetail od ON o.id = od.OrderID
		LEFT JOIN dbo.OrderStatus os ON  os.ID = o.OrderStatusID
		LEFT JOIN dbo.Payment p ON o.PaymentID = p.ID
		LEFT JOIN dbo.[User] u ON o.EmployeeID = u.ID
		LEFT JOIN dbo.Discount d ON o.DiscountID = d.ID
		WHERE o.CustomerID = @Id
		ORDER BY o.ID DESC
end
GO
/****** Object:  StoredProcedure [dbo].[NidasShoes_get_Order_byId]    Script Date: 4/19/2022 5:40:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[NidasShoes_get_Order_byId]
@Id int
as
begin
		SELECT o.*,
			os.Name StatusName,
			p.Name PaymentName,
			u.Name EmployeeName,
			d.Code
		FROM dbo.[Order] o 
		LEFT JOIN dbo.OrderDetail od ON o.id = od.OrderID
		LEFT JOIN dbo.OrderStatus os ON  os.ID = o.OrderStatusID
		LEFT JOIN dbo.Payment p ON o.PaymentID = p.ID
		LEFT JOIN dbo.[User] u ON o.EmployeeID = u.ID
		LEFT JOIN dbo.Discount d ON o.DiscountID = d.ID
	where o.ID = @Id
end
GO
/****** Object:  StoredProcedure [dbo].[NidasShoes_get_OrderDetail]    Script Date: 4/19/2022 5:40:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[NidasShoes_get_OrderDetail]
@BaseParam BaseParamType readonly,
@Totals int  out,
@PageCount int out
as
begin
	declare @Search nvarchar(max),
			@PageSize int,
			@PageNumber int

	declare @whereSql nvarchar(max) = 'where 1=1',
			@sql nvarchar(max) = ''
	
	select top 1 @Search = Search,@PageSize = PageSize,@PageNumber = PageNumber from @BaseParam
	select @Totals = count(Id) FROM [dbo].[OrderDetail]
	set @PageCount = iif(@Totals % @PageSize=0,@Totals / @PageSize,@Totals / @PageSize+1)
	if ISNULL(@Search,'') != ''
		begin
			set @whereSql += N'and (CustomerName like N''%''+@Search+''%''
									)'
		end
	set @sql = N'
		
		select 
		* from [dbo].[OrderDetail]
		' + @whereSql + '
		Order by [Id]
		offset (@PageSize*(@PageNumber-1)) rows fetch next @PageSize rows only'
	print @Sql
	declare @Param nvarchar(max) = N'@Search nvarchar(max),@PageSize int,@PageNumber int,@Totals int,@PageCount int'
	EXEC sp_executesql @Sql,@Param,@Search,@PageSize,@PageNumber,@Totals,@PageCount
end
GO
/****** Object:  StoredProcedure [dbo].[NidasShoes_get_OrderDetail_by_OrderId]    Script Date: 4/19/2022 5:40:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- [NidasShoes_get_OrderDetail_by_OrderId] 5
CREATE proc [dbo].[NidasShoes_get_OrderDetail_by_OrderId]
@Id int
as
begin
	select * from OrderDetail
	where OrderID = @Id
end
GO
/****** Object:  StoredProcedure [dbo].[NidasShoes_get_OrderDetail_byId]    Script Date: 4/19/2022 5:40:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[NidasShoes_get_OrderDetail_byId]
@Id int
as
begin
	select * from OrderDetail
	where Id = @Id
end
GO
/****** Object:  StoredProcedure [dbo].[NidasShoes_get_OrderStatus]    Script Date: 4/19/2022 5:40:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[NidasShoes_get_OrderStatus]
@BaseParam BaseParamType readonly,
@Totals int  out,
@PageCount int out
as
begin
	declare @Search nvarchar(max),
			@PageSize int,
			@PageNumber int

	declare @whereSql nvarchar(max) = 'where 1=1',
			@sql nvarchar(max) = ''
	
	select top 1 @Search = Search,@PageSize = PageSize,@PageNumber = PageNumber from @BaseParam
	select @Totals = count(Id) FROM [dbo].[OrderStatus]
	set @PageCount = iif(@Totals % @PageSize=0,@Totals / @PageSize,@Totals / @PageSize+1)
	if ISNULL(@Search,'') != ''
		begin
			set @whereSql += N'and (name like N''%''+@Search+''%''
									)'
		end
	set @sql = N'
		
		select 
		* from [dbo].[OrderStatus]
		' + @whereSql + '
		Order by [Id]
		offset (@PageSize*(@PageNumber-1)) rows fetch next @PageSize rows only'
	print @Sql
	declare @Param nvarchar(max) = N'@Search nvarchar(max),@PageSize int,@PageNumber int,@Totals int,@PageCount int'
	EXEC sp_executesql @Sql,@Param,@Search,@PageSize,@PageNumber,@Totals,@PageCount
end
GO
/****** Object:  StoredProcedure [dbo].[NidasShoes_get_OrderStatus_byId]    Script Date: 4/19/2022 5:40:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[NidasShoes_get_OrderStatus_byId]
@Id int
as
begin
	select * from OrderStatus
	where Id = @Id
end
GO
/****** Object:  StoredProcedure [dbo].[NidasShoes_get_Product]    Script Date: 4/19/2022 5:40:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[NidasShoes_get_Product]
@BaseParam BaseParamType readonly,
@Totals int  out,
@PageCount int out
as
begin
	declare @Search nvarchar(max),
			@PageSize int,
			@PageNumber int

	declare @whereSql nvarchar(max) = N'where 1=1',
			@sql nvarchar(max) = N''
	
	select top 1 @Search = Search,@PageSize = PageSize,@PageNumber = PageNumber from @BaseParam
	select @Totals = count(Id) from Product
	set @PageCount = iif(@Totals % @PageSize=0,@Totals / @PageSize,@Totals / @PageSize+1)
	if ISNULL(@Search,'') != ''
		begin
			set @whereSql += N'and (Name like N''%'+@Search+N'%''
									)'
		end
	set @sql = N'
		select p.*, pc.Name AS CatagoryName from Product p left JOIN dbo.ProductCategory pc ON p.ProductCategoryID = pc.ID 
		' + @whereSql + N'
		order by [Id] desc
		offset (@PageSize*(@PageNumber-1)) rows fetch next @PageSize rows only'
	print @Sql
	declare @Param nvarchar(max) = N'@Search nvarchar(max),@PageSize int,@PageNumber int,@Totals int,@PageCount int'
	EXEC sp_executesql @Sql,@Param,@Search,@PageSize,@PageNumber,@Totals,@PageCount
end
GO
/****** Object:  StoredProcedure [dbo].[NidasShoes_get_Product_byId]    Script Date: 4/19/2022 5:40:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[NidasShoes_get_Product_byId]
@Id int
as
begin
	select p.*, pc.Name AS CatagoryName from Product p left JOIN dbo.ProductCategory pc ON p.ProductCategoryID = pc.ID 
	where p.Id = @Id
end
GO
/****** Object:  StoredProcedure [dbo].[NidasShoes_get_ProductCategory]    Script Date: 4/19/2022 5:40:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[NidasShoes_get_ProductCategory]
@BaseParam BaseParamType readonly,
@Totals int  out,
@PageCount int out
as
begin
	declare @Search nvarchar(max),
			@PageSize int,
			@PageNumber int

	declare @whereSql nvarchar(max) = 'where 1=1',
			@sql nvarchar(max) = ''
	
	select top 1 @Search = Search,@PageSize = PageSize,@PageNumber = PageNumber from @BaseParam;

	select @Totals = count(Id) from ProductCategory
	set @PageCount = iif(@Totals % @PageSize=0,@Totals / @PageSize,@Totals / @PageSize+1)
	if ISNULL(@Search,'') != ''
		begin
			set @whereSql += N'and (Name like N''%''+@Search+''%''
									or Description like N''%''+@Search+''%''
									)'
		end																	 
	set @sql = N'
		select 
		* from ProductCategory
		' + @whereSql + '
		order by [Id]
		offset (@PageSize*(@PageNumber-1)) rows fetch next @PageSize rows only'
	print @Sql
	declare @Param nvarchar(max) = N'@Search nvarchar(max),@PageSize int,@PageNumber int,@Totals int,@PageCount int'
	EXEC sp_executesql @Sql,@Param,@Search,@PageSize,@PageNumber,@Totals,@PageCount
end
GO
/****** Object:  StoredProcedure [dbo].[NidasShoes_get_ProductCategory_byId]    Script Date: 4/19/2022 5:40:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[NidasShoes_get_ProductCategory_byId]
@Id int
as
begin
	select * from ProductCategory
	where Id = @Id
end
GO
/****** Object:  StoredProcedure [dbo].[NidasShoes_get_ProductColor]    Script Date: 4/19/2022 5:40:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[NidasShoes_get_ProductColor]
@BaseParam BaseParamType readonly,
@Totals int  out,
@PageCount int out
as
begin
	declare @Search nvarchar(max),
			@PageSize int,
			@PageNumber int

	declare @whereSql nvarchar(max) = 'where 1=1',
			@sql nvarchar(max) = ''
	
	select top 1 @Search = Search,@PageSize = PageSize,@PageNumber = PageNumber from @BaseParam
	select @Totals = count(Id) from ProductColor
	set @PageCount = iif(@Totals % @PageSize=0,@Totals / @PageSize,@Totals / @PageSize+1)
	if ISNULL(@Search,'') != ''
		begin
			set @whereSql += N'and (Name like N''%'+@Search+'%''
								or Code like N''%'+@Search+'%''
									)'
		end
	set @sql = N'
		
		select 
		* from ProductColor
		' + @whereSql + '
		order by [Id]
		offset (@PageSize*(@PageNumber-1)) rows fetch next @PageSize rows only'
	print @Sql
	declare @Param nvarchar(max) = N'@Search nvarchar(max),@PageSize int,@PageNumber int,@Totals int,@PageCount int'
	EXEC sp_executesql @Sql,@Param,@Search,@PageSize,@PageNumber,@Totals,@PageCount
end
GO
/****** Object:  StoredProcedure [dbo].[NidasShoes_get_productColor_by_ProductID]    Script Date: 4/19/2022 5:40:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--EXEC [dbo].[NidasShoes_get_productColor_by_ProductID] 21

CREATE proc [dbo].[NidasShoes_get_productColor_by_ProductID]
@Id int
as begin
	select c.* from [dbo].[ProductColor] c JOIN [dbo].[ProductDetail] pd ON c.id = pd.ColorID 
	where pd.productID = @Id
	GROUP BY c.id,c.name,c.code
end
GO
/****** Object:  StoredProcedure [dbo].[NidasShoes_get_ProductColor_byId]    Script Date: 4/19/2022 5:40:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[NidasShoes_get_ProductColor_byId]
@Id int
as
begin
	select * from ProductColor
	where Id = @Id
end
GO
/****** Object:  StoredProcedure [dbo].[NidasShoes_get_ProductDetail]    Script Date: 4/19/2022 5:40:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[NidasShoes_get_ProductDetail]
@BaseParam BaseParamType readonly,
@Totals int  out,
@PageCount int out
as
begin
	declare @Search nvarchar(max),
			@PageSize int,
			@PageNumber int

	declare @whereSql nvarchar(max) = 'where 1=1',
			@sql nvarchar(max) = ''
	
	select top 1 @Search = Search,@PageSize = PageSize,@PageNumber = PageNumber from @BaseParam
	select @Totals = count(Id) from ProductDetail
	set @PageCount = iif(@Totals % @PageSize=0,@Totals / @PageSize,@Totals / @PageSize+1)
	if ISNULL(@Search,'') != ''
		begin
			set @whereSql += N'and (p.Name like N''%''+@Search+''%''
									or s.Name like N''%''+@Search+''%''
									or c.name like N''%''+@Search+''%''
									or pc.Name like N''%''+@Search+''%''
									)'
		end
	set @sql = N'
		
		SELECT pd.*
			,p.Name AS [ProductName]
			,s.Name AS [SizeName]
			,c.name AS [ColorName]
			,pc.Name AS [ProductCategoryName]
			,ppt.ImportPrice
			,ppt.ExportPrice
			,ppt.CreatedDate AS [LastUpdated]
		FROM dbo.ProductDetail pd 
		LEFT JOIN dbo.Product p ON pd.ProductID = p.ID
		LEFT JOIN dbo.ProductCategory pc ON p.ProductCategoryID =pc.id
		LEFT JOIN dbo.ProductColor c ON pd.ColorID = c.ID
		LEFT JOIN dbo.ProductSize s ON pd.SizeID = s.ID
		OUTER APPLY(
			SELECT  TOP(1)* FROM dbo.ProductPrice pp 	
			WHERE pp.ProductDetailID = pd.ID
			ORDER BY pp.CreatedDate DESC
		) AS ppt
		' + @whereSql + '
		order by [Id]
		offset (@PageSize*(@PageNumber-1)) rows fetch next @PageSize rows only'
	print @Sql
	declare @Param nvarchar(max) = N'@Search nvarchar(max),@PageSize int,@PageNumber int,@Totals int,@PageCount int'
	EXEC sp_executesql @Sql,@Param,@Search,@PageSize,@PageNumber,@Totals,@PageCount
end
GO
/****** Object:  StoredProcedure [dbo].[NidasShoes_get_ProductDetail_byId]    Script Date: 4/19/2022 5:40:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[NidasShoes_get_ProductDetail_byId]
@Id int
as
begin
	SELECT TOP(1) pd.*,pp.ImportPrice,pp.ExportPrice from ProductDetail pd 
	LEFT JOIN dbo.ProductPrice pp ON pd.id =pp.ProductDetailID
	where pd.Id = @Id
	ORDER BY pp.CreatedDate DESC
end
GO
/****** Object:  StoredProcedure [dbo].[NidasShoes_get_productImage]    Script Date: 4/19/2022 5:40:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[NidasShoes_get_productImage]
@Id int
as begin
	select * from ProductImage
	where ProductId = @Id
end
GO
/****** Object:  StoredProcedure [dbo].[NidasShoes_get_productImage_by_ProductID]    Script Date: 4/19/2022 5:40:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[NidasShoes_get_productImage_by_ProductID]
@Id int
as begin
	select * from ProductImage
	where ProductId = @Id
end
GO
/****** Object:  StoredProcedure [dbo].[NidasShoes_get_ProductReview]    Script Date: 4/19/2022 5:40:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[NidasShoes_get_ProductReview]
@BaseParam BaseParamType readonly,
@Totals int  out,
@PageCount int out
as
begin
	declare @Search nvarchar(max),
			@PageSize int,
			@PageNumber int

	declare @whereSql nvarchar(max) = 'where 1=1',
			@sql nvarchar(max) = ''
	
	select top 1 @Search = Search,@PageSize = PageSize,@PageNumber = PageNumber from @BaseParam
	select @Totals = count(Id) from slide
	set @PageCount = iif(@Totals % @PageSize=0,@Totals / @PageSize,@Totals / @PageSize+1)
	if ISNULL(@Search,'') != ''
		begin
			set @whereSql += N'and (Name like N''%'+@Search+'%''
									)'
		end
	set @sql = N'
		
		select 
		* from ProductReview
		' + @whereSql + '
		order by [Id]
		offset (@PageSize*(@PageNumber-1)) rows fetch next @PageSize rows only'
	print @Sql
	declare @Param nvarchar(max) = N'@Search nvarchar(max),@PageSize int,@PageNumber int,@Totals int,@PageCount int'
	EXEC sp_executesql @Sql,@Param,@Search,@PageSize,@PageNumber,@Totals,@PageCount
end
GO
/****** Object:  StoredProcedure [dbo].[NidasShoes_get_ProductReview_by_productID]    Script Date: 4/19/2022 5:40:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[NidasShoes_get_ProductReview_by_productID]
@Id int
as
begin
	select * from ProductReview
	where ProductID = @Id
end
GO
/****** Object:  StoredProcedure [dbo].[NidasShoes_get_ProductReview_byId]    Script Date: 4/19/2022 5:40:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[NidasShoes_get_ProductReview_byId]
@Id int
as
begin
	select * from ProductReview
	where Id = @Id
end
GO
/****** Object:  StoredProcedure [dbo].[NidasShoes_get_ProductSize]    Script Date: 4/19/2022 5:40:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[NidasShoes_get_ProductSize]
@BaseParam BaseParamType readonly,
@Totals int  out,
@PageCount int out
as
begin
	declare @Search nvarchar(max),
			@PageSize int,
			@PageNumber int

	declare @whereSql nvarchar(max) = 'where 1=1',
			@sql nvarchar(max) = ''
	
	select top 1 @Search = Search,@PageSize = PageSize,@PageNumber = PageNumber from @BaseParam
	select @Totals = count(Id) from ProductSize
	set @PageCount = iif(@Totals % @PageSize=0,@Totals / @PageSize,@Totals / @PageSize+1)
	if ISNULL(@Search,'') != ''
		begin
			set @whereSql += N'and (Name like N''%'+@Search+'%''
									)'
		end
	set @sql = N'
		
		select 
		* from ProductSize
		' + @whereSql + '
		order by [Id] desc
		offset (@PageSize*(@PageNumber-1)) rows fetch next @PageSize rows only'
	print @Sql
	declare @Param nvarchar(max) = N'@Search nvarchar(max),@PageSize int,@PageNumber int,@Totals int,@PageCount int'
	EXEC sp_executesql @Sql,@Param,@Search,@PageSize,@PageNumber,@Totals,@PageCount
end
GO
/****** Object:  StoredProcedure [dbo].[NidasShoes_get_productSize_by_ProductID]    Script Date: 4/19/2022 5:40:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[NidasShoes_get_productSize_by_ProductID]
@Id int
as begin
	select s.* from [dbo].[ProductSize] s JOIN [dbo].[ProductDetail] pd ON s.id = pd.sizeId 
	where pd.productID = @Id
	GROUP BY s.id, s.name
end
GO
/****** Object:  StoredProcedure [dbo].[NidasShoes_get_ProductSize_byId]    Script Date: 4/19/2022 5:40:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[NidasShoes_get_ProductSize_byId]
@Id int
as
begin
	select * from ProductSize
	where Id = @Id
end
GO
/****** Object:  StoredProcedure [dbo].[NidasShoes_get_rateing_Review_by_ProductID]    Script Date: 4/19/2022 5:40:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[NidasShoes_get_rateing_Review_by_ProductID]
@Id int
as
begin
	SELECT COUNT(pr.ID) AS Rating,ROUND(SUM(pr.Star)/COUNT(pr.ID),0) AS Point FROM dbo.ProductReview pr 
	JOIN dbo.Product p ON p.ID = pr.ProductID  
	WHERE pr.ProductID = @Id
	GROUP BY pr.ProductID
end
GO
/****** Object:  StoredProcedure [dbo].[NidasShoes_get_Receipt]    Script Date: 4/19/2022 5:40:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[NidasShoes_get_Receipt]
@BaseParam BaseParamType readonly,
@Totals int  out,
@PageCount int out
as
begin
	declare @Search nvarchar(max),
			@PageSize int,
			@PageNumber int

	declare @whereSql nvarchar(max) = 'where 1=1',
			@sql nvarchar(max) = ''
	
	select top 1 @Search = Search,@PageSize = PageSize,@PageNumber = PageNumber from @BaseParam
	select @Totals = count(Id) from Receipt
	set @PageCount = iif(@Totals % @PageSize=0,@Totals / @PageSize,@Totals / @PageSize+1)
	if ISNULL(@Search,'') != ''
		begin
			set @whereSql += N'and (u.UserName like N''%''+@Search+''%''
									or s.SupplyName like N''%''+@Search+''%''		    
									)'
		end
	set @sql = N'
		
		select r.*,s.Name AS SupplyName,u.UserName from Receipt r 
		LEFT JOIN dbo.Supply s ON r.SupplyID = s.ID 
		LEFT JOIN dbo.[User] u ON r.UserID = u.ID
		' + @whereSql + '
		order by [Id] desc 
		offset (@PageSize*(@PageNumber-1)) rows fetch next @PageSize rows only'
	print @Sql
	declare @Param nvarchar(max) = N'@Search nvarchar(max),@PageSize int,@PageNumber int,@Totals int,@PageCount int'
	EXEC sp_executesql @Sql,@Param,@Search,@PageSize,@PageNumber,@Totals,@PageCount
end
GO
/****** Object:  StoredProcedure [dbo].[NidasShoes_get_Receipt_byId]    Script Date: 4/19/2022 5:40:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[NidasShoes_get_Receipt_byId]
@Id int
as
begin
		select r.*,s.Name AS SupplyName,u.UserName from Receipt r 
		LEFT JOIN dbo.Supply s ON r.SupplyID = s.ID 
		LEFT JOIN dbo.[User] u ON r.UserID = u.ID
	where r.Id = @Id
end
GO
/****** Object:  StoredProcedure [dbo].[NidasShoes_get_ReceiptDetail]    Script Date: 4/19/2022 5:40:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[NidasShoes_get_ReceiptDetail]
@BaseParam BaseParamType readonly,
@Totals int  out,
@PageCount int out
as
begin
	declare @Search nvarchar(max),
			@PageSize int,
			@PageNumber int

	declare @whereSql nvarchar(max) = 'where 1=1',
			@sql nvarchar(max) = ''
	
	select top 1 @Search = Search,@PageSize = PageSize,@PageNumber = PageNumber from @BaseParam
	select @Totals = count(Id) from ReceiptDetail
	set @PageCount = iif(@Totals % @PageSize=0,@Totals / @PageSize,@Totals / @PageSize+1)
	if ISNULL(@Search,'') != ''
		begin
			set @whereSql += ''
		end
	set @sql = N'
		
		select 
		* from ReceiptDetail
		' + @whereSql + '
		order by [Id]
		offset (@PageSize*(@PageNumber-1)) rows fetch next @PageSize rows only'
	print @Sql
	declare @Param nvarchar(max) = N'@Search nvarchar(max),@PageSize int,@PageNumber int,@Totals int,@PageCount int'
	EXEC sp_executesql @Sql,@Param,@Search,@PageSize,@PageNumber,@Totals,@PageCount
end
GO
/****** Object:  StoredProcedure [dbo].[NidasShoes_get_ReceiptDetail_by_ReceiptId]    Script Date: 4/19/2022 5:40:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  proc [dbo].[NidasShoes_get_ReceiptDetail_by_ReceiptId]
@Id int
as
begin
	SELECT rd.*,p.Name ProductName,c.name ColorName,s.name SizeName 
	FROM dbo.ReceiptDetail rd
	LEFT JOIN dbo.Receipt r ON rd.ReceiptID = r.ID
	LEFT JOIN dbo.ProductDetail pd ON pd.ID = rd.ProductDetailID
	LEFT JOIN dbo.ProductSize s ON pd.SizeID = s.ID
	LEFT JOIN dbo.ProductColor c ON pd.ColorID = c.ID
	LEFT JOIN dbo.Product p ON pd.ProductID = p.ID
	where r.ID = @Id
end
GO
/****** Object:  StoredProcedure [dbo].[NidasShoes_get_Shop]    Script Date: 4/19/2022 5:40:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[NidasShoes_get_Shop]
@BaseParam BaseParamType readonly,
@Totals int  out,
@PageCount int out
as
begin
	declare @Search nvarchar(max),
			@PageSize int,
			@PageNumber int

	declare @whereSql nvarchar(max) = 'where 1=1',
			@sql nvarchar(max) = ''
	
	select top 1 @Search = Search,@PageSize = PageSize,@PageNumber = PageNumber from @BaseParam
	select @Totals = count(Id) from Shop
	set @PageCount = iif(@Totals % @PageSize=0,@Totals / @PageSize,@Totals / @PageSize+1)
	if ISNULL(@Search,'') != ''
		begin
			set @whereSql += N'and (Name like N''%'+@Search+'%''
									)'
		end
	set @sql = N'
		
		select 
		* from Shop
		' + @whereSql + '
		order by [Id]
		offset (@PageSize*(@PageNumber-1)) rows fetch next @PageSize rows only'
	print @Sql
	declare @Param nvarchar(max) = N'@Search nvarchar(max),@PageSize int,@PageNumber int,@Totals int,@PageCount int'
	EXEC sp_executesql @Sql,@Param,@Search,@PageSize,@PageNumber,@Totals,@PageCount
end
GO
/****** Object:  StoredProcedure [dbo].[NidasShoes_get_Shop_byId]    Script Date: 4/19/2022 5:40:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[NidasShoes_get_Shop_byId]
@Id int
as
begin
	select * from Shop
	where Id = @Id
end
GO
/****** Object:  StoredProcedure [dbo].[NidasShoes_get_Slide]    Script Date: 4/19/2022 5:40:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[NidasShoes_get_Slide]
@BaseParam BaseParamType readonly,
@Totals int  out,
@PageCount int out
as
begin
	declare @Search nvarchar(max),
			@PageSize int,
			@PageNumber int

	declare @whereSql nvarchar(max) = 'where 1=1',
			@sql nvarchar(max) = ''
	
	select top 1 @Search = Search,@PageSize = PageSize,@PageNumber = PageNumber from @BaseParam
	select @Totals = count(Id) from slide
	set @PageCount = iif(@Totals % @PageSize=0,@Totals / @PageSize,@Totals / @PageSize+1)
	if ISNULL(@Search,'') != ''
		begin
			set @whereSql += N'and (Title like N''%'+@Search+'%''
									)'
		end
	set @sql = N'
		
		select 
		* from Slide
		' + @whereSql + '
		order by [Id]
		offset (@PageSize*(@PageNumber-1)) rows fetch next @PageSize rows only'
	print @Sql
	declare @Param nvarchar(max) = N'@Search nvarchar(max),@PageSize int,@PageNumber int,@Totals int,@PageCount int'
	EXEC sp_executesql @Sql,@Param,@Search,@PageSize,@PageNumber,@Totals,@PageCount
end
GO
/****** Object:  StoredProcedure [dbo].[NidasShoes_get_Slide_byId]    Script Date: 4/19/2022 5:40:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[NidasShoes_get_Slide_byId]
@Id int
as
begin
	select * from Slide
	where Id = @Id
end
GO
/****** Object:  StoredProcedure [dbo].[NidasShoes_get_Supply]    Script Date: 4/19/2022 5:40:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[NidasShoes_get_Supply]
@BaseParam BaseParamType readonly,
@Totals int  out,
@PageCount int out
as
begin
	declare @Search nvarchar(max),
			@PageSize int,
			@PageNumber int

	declare @whereSql nvarchar(max) = 'where 1=1',
			@sql nvarchar(max) = ''
	
	select top 1 @Search = Search,@PageSize = PageSize,@PageNumber = PageNumber from @BaseParam
	select @Totals = count(Id) from Supply
	set @PageCount = iif(@Totals % @PageSize=0,@Totals / @PageSize,@Totals / @PageSize+1)
	if ISNULL(@Search,'') != ''
		begin
			set @whereSql += N'and (Name like N''%'+@Search+'%''
									or Phone like N''%'+@Search+'%''
									or Address like N''%'+@Search+'%''
									or Description like N''%'+@Search+'%''
									)'
		end
	set @sql = N'
		
		select 
		* from Supply
		' + @whereSql + '
		order by [Id]
		offset (@PageSize*(@PageNumber-1)) rows fetch next @PageSize rows only'
	print @Sql
	declare @Param nvarchar(max) = N'@Search nvarchar(max),@PageSize int,@PageNumber int,@Totals int,@PageCount int'
	EXEC sp_executesql @Sql,@Param,@Search,@PageSize,@PageNumber,@Totals,@PageCount
end
GO
/****** Object:  StoredProcedure [dbo].[NidasShoes_get_Supply_byId]    Script Date: 4/19/2022 5:40:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[NidasShoes_get_Supply_byId]
@Id int
as
begin
	select * from Supply
	where Id = @Id
end

--
GO
/****** Object:  StoredProcedure [dbo].[NidasShoes_get_user]    Script Date: 4/19/2022 5:40:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[NidasShoes_get_user]
@BaseParam BaseParamType readonly,
@Totals int  out,
@PageCount int out
as
begin
	declare @Search nvarchar(max),
			@PageSize int,
			@PageNumber int

	declare @whereSql nvarchar(max) = 'where 1=1',
			@sql nvarchar(max) = ''
	
	select top 1 @Search = Search,@PageSize = PageSize,@PageNumber = PageNumber from @BaseParam
	select @Totals = count(Id) from [dbo].[User]
	set @PageCount = iif(@Totals % @PageSize=0,@Totals / @PageSize,@Totals / @PageSize+1)
	if ISNULL(@Search,'') != ''
		begin
			set @whereSql += N'and (UserName like N''%'+@Search+'%'' or
									Email like N''%'+@Search+'%'')'
		end
	set @sql = N'
		
		select Id,RuleID,UserName,HashedPassword,Name,Email,PhoneNumber,Address from [dbo].[User]
		' + @whereSql + '
		order by Id
		offset (@PageSize*(@PageNumber-1)) rows fetch next @PageSize rows only'
	print @Sql
	declare @Param nvarchar(max) = N'@Search nvarchar(max),@PageSize int,@PageNumber int,@Totals int,@PageCount int'
	EXEC sp_executesql @Sql,@Param,@Search,@PageSize,@PageNumber,@Totals,@PageCount
end
GO
/****** Object:  StoredProcedure [dbo].[NidasShoes_get_user_by_email]    Script Date: 4/19/2022 5:40:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[NidasShoes_get_user_by_email]
@Email nvarchar(255)
as
begin
	select *  from [User]
	where Email = @Email
end
GO
/****** Object:  StoredProcedure [dbo].[NidasShoes_get_user_login_byId]    Script Date: 4/19/2022 5:40:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[NidasShoes_get_user_login_byId]
@Id int
as
begin
	select * from  [dbo].[User]
	where Id = @Id
end
GO
/****** Object:  StoredProcedure [dbo].[NidasShoes_search_Client_Product_Detail]    Script Date: 4/19/2022 5:40:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[NidasShoes_search_Client_Product_Detail]
	@sizeID int,
	@colorID int ,
	@ProductCategoryID INT
	--@FromPrice DECIMAL,
	--@ToPrice DECIMAL
as
begin
SELECT  p.ID,p.Name,tpi.image AS [Image],tpp.ExportPrice FROM product p 
		LEFT JOIN dbo.ProductCategory pc ON p.ProductCategoryID = pc.ID 
		LEFT JOIN dbo.ProductDetail pd ON p.id = pd.ProductID
		OUTER APPLY(
			SELECT TOP(1)* FROM dbo.ProductImage i WHERE i.productId = p.ID
		) AS [tpi]
		OUTER APPLY(
			SELECT TOP(1)pp.* FROM dbo.ProductPrice pp 
			JOIN dbo.ProductDetail pd ON pp.ProductDetailID = pd.ID
			WHERE pd.ProductID =p.ID
			ORDER BY pp.CreatedDate DESC
		) AS [tpp]
		WHERE (@colorID = 0 or pd.ColorID = @colorID) 
		AND (@sizeID=0 OR pd.SizeID = @sizeID )
		AND (@ProductCategoryID =0 OR pc.ID = @ProductCategoryID)
		GROUP BY p.id,p.Name,tpi.image,tpp.ExportPrice
end
GO
/****** Object:  StoredProcedure [dbo].[NidasShoes_transaction_export]    Script Date: 4/19/2022 5:40:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[NidasShoes_transaction_export]
AS
BEGIN
	SELECT SUM(TotalCost) AS total ,MONTH(ModifyDate) AS [Month],YEAR(ModifyDate) AS [year]  
	FROM dbo.[Order]
	WHERE OrderStatusID <> 0 AND OrderStatusID <> 6
	GROUP BY MONTH(ModifyDate),YEAR(ModifyDate)
END
GO
/****** Object:  StoredProcedure [dbo].[NidasShoes_UPDATE_QUANTITY_PRODUCT]    Script Date: 4/19/2022 5:40:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[NidasShoes_UPDATE_QUANTITY_PRODUCT]
	@productDetailId INT,
	@quantity INT
AS
BEGIN
	UPDATE dbo.ProductDetail 
	SET Quantity = Quantity + @quantity 
	WHERE ID = @productDetailId
END
GO
/****** Object:  StoredProcedure [dbo].[NidasShoes_Update_Status_Order_By_Id]    Script Date: 4/19/2022 5:40:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[NidasShoes_Update_Status_Order_By_Id]
@Id INT,
@StatusID INT,
@EmployeeID INT
AS
BEGIN
   UPDATE dbo.[Order]
   SET OrderStatusID = @StatusID,
   EmployeeID = @EmployeeID,
   ModifyDate = GETDATE()
   WHERE id = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[NidasShoes_user_login]    Script Date: 4/19/2022 5:40:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- [dbo].[NidasShoes_user_login] N'admin',N'ZCthc6xoqYg='
CREATE proc [dbo].[NidasShoes_user_login]
@UserName nvarchar(255),
@HashedPassword nvarchar(255)
as
begin
	select * from  [dbo].[User]
	where UserName = @UserName and HashedPassword = @HashedPassword
end
GO
USE [master]
GO
ALTER DATABASE [NIDAS_SHOES] SET  READ_WRITE 
GO
