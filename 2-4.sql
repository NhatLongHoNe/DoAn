USE [master]
GO
/****** Object:  Database [NIDAS_SHOES]    Script Date: 4/2/2022 12:05:24 PM ******/
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
/****** Object:  UserDefinedTableType [dbo].[BaseParamType]    Script Date: 4/2/2022 12:05:24 PM ******/
CREATE TYPE [dbo].[BaseParamType] AS TABLE(
	[Search] [nvarchar](max) NULL,
	[PageSize] [int] NULL,
	[PageNumber] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[OrderDetails]    Script Date: 4/2/2022 12:05:24 PM ******/
CREATE TYPE [dbo].[OrderDetails] AS TABLE(
	[Id] [int] NULL,
	[OrderID] [int] NULL,
	[ProductDetailID] [int] NULL,
	[Price] [decimal](18, 0) NULL,
	[Quantity] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[ProductImages]    Script Date: 4/2/2022 12:05:24 PM ******/
CREATE TYPE [dbo].[ProductImages] AS TABLE(
	[Id] [int] NULL,
	[ProductDetailId] [int] NULL,
	[Image] [nvarchar](max) NULL
)
GO
/****** Object:  Table [dbo].[Discount]    Script Date: 4/2/2022 12:05:24 PM ******/
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
/****** Object:  Table [dbo].[FeedBack]    Script Date: 4/2/2022 12:05:25 PM ******/
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
/****** Object:  Table [dbo].[MasterData]    Script Date: 4/2/2022 12:05:25 PM ******/
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
/****** Object:  Table [dbo].[Order]    Script Date: 4/2/2022 12:05:25 PM ******/
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
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 4/2/2022 12:05:25 PM ******/
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
/****** Object:  Table [dbo].[OrderStatus]    Script Date: 4/2/2022 12:05:25 PM ******/
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
/****** Object:  Table [dbo].[Payment]    Script Date: 4/2/2022 12:05:25 PM ******/
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
/****** Object:  Table [dbo].[Product]    Script Date: 4/2/2022 12:05:25 PM ******/
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
/****** Object:  Table [dbo].[ProductCategory]    Script Date: 4/2/2022 12:05:25 PM ******/
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
/****** Object:  Table [dbo].[ProductColor]    Script Date: 4/2/2022 12:05:25 PM ******/
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
/****** Object:  Table [dbo].[ProductDetail]    Script Date: 4/2/2022 12:05:25 PM ******/
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
/****** Object:  Table [dbo].[ProductImage]    Script Date: 4/2/2022 12:05:25 PM ******/
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
/****** Object:  Table [dbo].[ProductPrice]    Script Date: 4/2/2022 12:05:25 PM ******/
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
/****** Object:  Table [dbo].[ProductReview]    Script Date: 4/2/2022 12:05:25 PM ******/
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
/****** Object:  Table [dbo].[ProductSize]    Script Date: 4/2/2022 12:05:25 PM ******/
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
/****** Object:  Table [dbo].[Receipt]    Script Date: 4/2/2022 12:05:25 PM ******/
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
/****** Object:  Table [dbo].[ReceiptDetail]    Script Date: 4/2/2022 12:05:25 PM ******/
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
/****** Object:  Table [dbo].[Rule]    Script Date: 4/2/2022 12:05:25 PM ******/
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
/****** Object:  Table [dbo].[Shop]    Script Date: 4/2/2022 12:05:25 PM ******/
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
/****** Object:  Table [dbo].[Slide]    Script Date: 4/2/2022 12:05:25 PM ******/
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
/****** Object:  Table [dbo].[Supply]    Script Date: 4/2/2022 12:05:25 PM ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 4/2/2022 12:05:25 PM ******/
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

INSERT [dbo].[Order] ([ID], [CustomerID], [EmployeeID], [PaymentID], [DiscountID], [CreatedDate], [Description], [Note], [OrderStatusID], [CustomerName], [CustomerMobile], [CustomerEmail], [CustomerAddress], [ModifyDate], [TotalCost]) VALUES (2, 0, 1, 0, 0, CAST(N'2022-01-23T23:30:21.780' AS DateTime), NULL, NULL, 4, N'Admin2345', NULL, N'holongnhat2000@gmail.com', NULL, NULL, CAST(100000 AS Decimal(18, 0)))
INSERT [dbo].[Order] ([ID], [CustomerID], [EmployeeID], [PaymentID], [DiscountID], [CreatedDate], [Description], [Note], [OrderStatusID], [CustomerName], [CustomerMobile], [CustomerEmail], [CustomerAddress], [ModifyDate], [TotalCost]) VALUES (3, 0, NULL, 0, 0, CAST(N'2022-01-23T23:51:05.030' AS DateTime), NULL, NULL, 3, N'2345', NULL, N'holongnhat2000@gmail.com', NULL, NULL, CAST(240000 AS Decimal(18, 0)))
INSERT [dbo].[Order] ([ID], [CustomerID], [EmployeeID], [PaymentID], [DiscountID], [CreatedDate], [Description], [Note], [OrderStatusID], [CustomerName], [CustomerMobile], [CustomerEmail], [CustomerAddress], [ModifyDate], [TotalCost]) VALUES (4, 1, NULL, 0, 0, CAST(N'2022-02-23T23:52:53.763' AS DateTime), NULL, NULL, 4, N'2345gh', NULL, N'holongnhat2000@gmail.com', NULL, NULL, CAST(240000 AS Decimal(18, 0)))
INSERT [dbo].[Order] ([ID], [CustomerID], [EmployeeID], [PaymentID], [DiscountID], [CreatedDate], [Description], [Note], [OrderStatusID], [CustomerName], [CustomerMobile], [CustomerEmail], [CustomerAddress], [ModifyDate], [TotalCost]) VALUES (5, 1, 2, 0, 0, CAST(N'2022-01-23T23:55:47.350' AS DateTime), NULL, NULL, 2, N'dfgh', NULL, N'holongnhat2000@gmail.com', NULL, CAST(N'2022-04-01T11:41:44.250' AS DateTime), CAST(100000 AS Decimal(18, 0)))
INSERT [dbo].[Order] ([ID], [CustomerID], [EmployeeID], [PaymentID], [DiscountID], [CreatedDate], [Description], [Note], [OrderStatusID], [CustomerName], [CustomerMobile], [CustomerEmail], [CustomerAddress], [ModifyDate], [TotalCost]) VALUES (6, 3, NULL, 0, 0, CAST(N'2022-01-24T00:42:49.510' AS DateTime), NULL, N'ádfgsdg', 6, N'fdgh', N'0866721300', N'324165', N'Hà Nội', NULL, CAST(240000 AS Decimal(18, 0)))
INSERT [dbo].[Order] ([ID], [CustomerID], [EmployeeID], [PaymentID], [DiscountID], [CreatedDate], [Description], [Note], [OrderStatusID], [CustomerName], [CustomerMobile], [CustomerEmail], [CustomerAddress], [ModifyDate], [TotalCost]) VALUES (7, 3, 2, 1, 0, CAST(N'2022-01-24T00:59:24.747' AS DateTime), NULL, N'fsdgdfgsgfsfdg', 2, N'dfgh', N'0866721300', N'324165', N'Hà Nội', CAST(N'2022-04-01T11:41:40.123' AS DateTime), CAST(100000 AS Decimal(18, 0)))
INSERT [dbo].[Order] ([ID], [CustomerID], [EmployeeID], [PaymentID], [DiscountID], [CreatedDate], [Description], [Note], [OrderStatusID], [CustomerName], [CustomerMobile], [CustomerEmail], [CustomerAddress], [ModifyDate], [TotalCost]) VALUES (8, 1, 2, 0, 0, CAST(N'2022-01-24T01:24:53.560' AS DateTime), NULL, N'', 2, N'nguyen van a', N'', N'', N'', CAST(N'2022-04-01T11:41:39.027' AS DateTime), CAST(100000 AS Decimal(18, 0)))
INSERT [dbo].[Order] ([ID], [CustomerID], [EmployeeID], [PaymentID], [DiscountID], [CreatedDate], [Description], [Note], [OrderStatusID], [CustomerName], [CustomerMobile], [CustomerEmail], [CustomerAddress], [ModifyDate], [TotalCost]) VALUES (9, 1, 2, 0, 0, CAST(N'2022-03-24T01:27:57.597' AS DateTime), NULL, N'', 2, N'nguyen van a', N'', N'', N'', CAST(N'2022-04-01T11:41:37.987' AS DateTime), CAST(200000 AS Decimal(18, 0)))
INSERT [dbo].[Order] ([ID], [CustomerID], [EmployeeID], [PaymentID], [DiscountID], [CreatedDate], [Description], [Note], [OrderStatusID], [CustomerName], [CustomerMobile], [CustomerEmail], [CustomerAddress], [ModifyDate], [TotalCost]) VALUES (10, 7, 2, 1, 0, CAST(N'2022-01-25T03:20:16.420' AS DateTime), NULL, N'ghi chú nè', 6, N'Hồ Long Nhật', N'0866721300', N'holongnhat2000@gmail.com', N'Hà Nội', CAST(N'2022-04-01T13:33:39.670' AS DateTime), CAST(240000 AS Decimal(18, 0)))
INSERT [dbo].[Order] ([ID], [CustomerID], [EmployeeID], [PaymentID], [DiscountID], [CreatedDate], [Description], [Note], [OrderStatusID], [CustomerName], [CustomerMobile], [CustomerEmail], [CustomerAddress], [ModifyDate], [TotalCost]) VALUES (11, 10, 2, 1, 0, CAST(N'2022-03-25T09:04:47.173' AS DateTime), NULL, N'', 6, N'Hồ Long Nhật', N'0866721300', N'dray.opp.1909@gmail.com', N'Hà Nội', CAST(N'2022-04-01T13:31:42.363' AS DateTime), CAST(50000 AS Decimal(18, 0)))
INSERT [dbo].[Order] ([ID], [CustomerID], [EmployeeID], [PaymentID], [DiscountID], [CreatedDate], [Description], [Note], [OrderStatusID], [CustomerName], [CustomerMobile], [CustomerEmail], [CustomerAddress], [ModifyDate], [TotalCost]) VALUES (12, 1, 2, 1, 0, CAST(N'2022-03-29T15:15:20.023' AS DateTime), NULL, N'', 2, N'Admin', N'0866721300', N'holongnhat2000@gmail.com', N'Hà Nội', CAST(N'2022-04-01T11:41:34.963' AS DateTime), CAST(90000 AS Decimal(18, 0)))
INSERT [dbo].[Order] ([ID], [CustomerID], [EmployeeID], [PaymentID], [DiscountID], [CreatedDate], [Description], [Note], [OrderStatusID], [CustomerName], [CustomerMobile], [CustomerEmail], [CustomerAddress], [ModifyDate], [TotalCost]) VALUES (13, 1, 1, 1, 0, CAST(N'2022-01-29T15:21:09.457' AS DateTime), NULL, N'', 3, N'Admin', N'0866721300', N'holongnhat2000@gmail.com', N'Hà Nội', CAST(N'2022-04-01T11:23:06.270' AS DateTime), CAST(880000 AS Decimal(18, 0)))
INSERT [dbo].[Order] ([ID], [CustomerID], [EmployeeID], [PaymentID], [DiscountID], [CreatedDate], [Description], [Note], [OrderStatusID], [CustomerName], [CustomerMobile], [CustomerEmail], [CustomerAddress], [ModifyDate], [TotalCost]) VALUES (14, 0, 2, 1, 6, CAST(N'2022-03-30T03:42:44.857' AS DateTime), NULL, N'fasdfagafg', 2, N'Hồ Long Nhật', N'0866721300', N'holongnhat2000@gmail.com', N'Hà Nội', CAST(N'2022-04-01T11:41:34.137' AS DateTime), CAST(100000 AS Decimal(18, 0)))
INSERT [dbo].[Order] ([ID], [CustomerID], [EmployeeID], [PaymentID], [DiscountID], [CreatedDate], [Description], [Note], [OrderStatusID], [CustomerName], [CustomerMobile], [CustomerEmail], [CustomerAddress], [ModifyDate], [TotalCost]) VALUES (15, 1, 2, 1, 0, CAST(N'2022-03-30T18:36:48.900' AS DateTime), NULL, N'hsdfhsh', 2, N'dsarhgsdf', N'sdhsd', N'sdh', N'hsdfh', CAST(N'2022-04-01T11:41:33.170' AS DateTime), CAST(4100000 AS Decimal(18, 0)))
INSERT [dbo].[Order] ([ID], [CustomerID], [EmployeeID], [PaymentID], [DiscountID], [CreatedDate], [Description], [Note], [OrderStatusID], [CustomerName], [CustomerMobile], [CustomerEmail], [CustomerAddress], [ModifyDate], [TotalCost]) VALUES (16, 0, 2, 1, 0, CAST(N'2022-04-01T10:57:20.407' AS DateTime), NULL, N'', 2, N'àga', N'0866721300', N'sdfadsf', N'ádfa', CAST(N'2022-04-01T11:41:32.273' AS DateTime), CAST(9000000 AS Decimal(18, 0)))
INSERT [dbo].[Order] ([ID], [CustomerID], [EmployeeID], [PaymentID], [DiscountID], [CreatedDate], [Description], [Note], [OrderStatusID], [CustomerName], [CustomerMobile], [CustomerEmail], [CustomerAddress], [ModifyDate], [TotalCost]) VALUES (17, 0, 2, 1, 0, CAST(N'2022-04-01T10:57:59.850' AS DateTime), NULL, N'', 2, N'àga', N'0866721300', N'sdfadsf', N'ádfa', CAST(N'2022-04-01T11:41:30.830' AS DateTime), CAST(9000000 AS Decimal(18, 0)))
INSERT [dbo].[Order] ([ID], [CustomerID], [EmployeeID], [PaymentID], [DiscountID], [CreatedDate], [Description], [Note], [OrderStatusID], [CustomerName], [CustomerMobile], [CustomerEmail], [CustomerAddress], [ModifyDate], [TotalCost]) VALUES (18, 1, 1, 1, 0, CAST(N'2022-04-01T10:58:56.633' AS DateTime), NULL, N'', 6, N'Admin', N'0866721300', N'holongnhat2000@gmail.com', N'Hà Nội', CAST(N'2022-04-01T19:17:47.800' AS DateTime), CAST(12000000 AS Decimal(18, 0)))
INSERT [dbo].[Order] ([ID], [CustomerID], [EmployeeID], [PaymentID], [DiscountID], [CreatedDate], [Description], [Note], [OrderStatusID], [CustomerName], [CustomerMobile], [CustomerEmail], [CustomerAddress], [ModifyDate], [TotalCost]) VALUES (19, 1, 1, 1, 0, CAST(N'2022-04-01T11:00:01.467' AS DateTime), NULL, N'', 5, N'Admin', N'0866721300', N'holongnhat2000@gmail.com', N'Hà Nội', NULL, CAST(3000000 AS Decimal(18, 0)))
INSERT [dbo].[Order] ([ID], [CustomerID], [EmployeeID], [PaymentID], [DiscountID], [CreatedDate], [Description], [Note], [OrderStatusID], [CustomerName], [CustomerMobile], [CustomerEmail], [CustomerAddress], [ModifyDate], [TotalCost]) VALUES (20, 1, 2, 1, 0, CAST(N'2022-04-01T11:01:14.637' AS DateTime), NULL, N'', 3, N'Admin', N'0866721300', N'holongnhat2000@gmail.com', N'Hà Nội', CAST(N'2022-04-01T11:46:59.260' AS DateTime), CAST(3000000 AS Decimal(18, 0)))
INSERT [dbo].[Order] ([ID], [CustomerID], [EmployeeID], [PaymentID], [DiscountID], [CreatedDate], [Description], [Note], [OrderStatusID], [CustomerName], [CustomerMobile], [CustomerEmail], [CustomerAddress], [ModifyDate], [TotalCost]) VALUES (21, 1, 1, 1, 0, CAST(N'2022-04-01T13:30:46.390' AS DateTime), NULL, N'', 6, N'Admin', N'0866721300', N'holongnhat2000@gmail.com', N'Hà Nội', CAST(N'2022-04-01T19:16:53.770' AS DateTime), CAST(6000000 AS Decimal(18, 0)))
INSERT [dbo].[Order] ([ID], [CustomerID], [EmployeeID], [PaymentID], [DiscountID], [CreatedDate], [Description], [Note], [OrderStatusID], [CustomerName], [CustomerMobile], [CustomerEmail], [CustomerAddress], [ModifyDate], [TotalCost]) VALUES (22, 1, 0, 2, 0, CAST(N'2022-04-02T11:02:56.900' AS DateTime), NULL, N'', 1, N'Admin', N'0866721300', N'holongnhat2000@gmail.com', N'Hà Nội', CAST(N'2022-04-02T11:02:56.900' AS DateTime), CAST(1100000 AS Decimal(18, 0)))
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

INSERT [dbo].[Product] ([ID], [ProductCategoryID], [Code], [Name], [Title], [Description], [Status], [CreatedDate], [Manufacturer]) VALUES (4, 9, NULL, N'RUSS MEN''S SNEAKERS asdfasf', N'Ngay cả Pointing toàn năng cũng không kiểm soát được các văn bản mù, nó gần như là một cuộc sống gần như không có thần thoại Một ngày nọ, một dòng văn bản mù nhỏ có tên Lorem Ipsum quyết định rời đi đến Thế giới Ngữ pháp xa xôi. Khi đến những ngọn đồi đầu tiên của Dãy núi Italic, cô ấy đã có cái nhìn cuối cùng về đường chân trời của Bookmarksgrove quê hương của cô ấy,
dòng tiêu đề của Làng bảng chữ cái và dòng phụ trên con đường riêng của cô ấy, Dòng kẻ. Đáng tiếc, một câu hỏi thần thoại lướt qua má cô, rồi cô tiếp tục đi.', N'<p>Ngay cả Pointing toàn năng cũng không kiểm soát được các văn bản mù, nó gần như là một cuộc sống gần như không có thần thoại Một ngày nọ, một dòng văn bản mù nhỏ có tên Lorem Ipsum quyết định rời đi đến Thế giới Ngữ pháp xa xôi. Khi đến những ngọn đồi đầu tiên của Dãy núi Italic, cô ấy đã có cái nhìn cuối cùng về đường chân trời của Bookmarksgrove quê hương của cô ấy,
dòng tiêu đề của Làng bảng chữ cái và dòng phụ trên con đường riêng của cô ấy, Dòng kẻ. Đáng tiếc, một câu hỏi thần thoại lướt qua má cô, rồi cô tiếp tục đi.
Big Oxmox khuyên cô không nên làm như vậy Bởi vì có hàng ngàn Dấu phẩy nghi vấn dở khóc dở cười và Semikoli ranh ma.</p>
', 1, CAST(N'2022-03-15T00:00:00.000' AS DateTime), N'Ngay cả Pointing toàn năng cũng không kiểm soát được các văn bản mù, nó gần như là một cuộc sống gần như không có thần thoại Một ngày nọ, một dòng văn bản mù nhỏ tên là Lorem Ipsum quyết định rời đi đến Thế giới Ngữ pháp xa xôi. Khi đến những ngọn đồi đầu tiên của Dãy núi Italic, cô ấy đã có cái nhìn cuối cùng về đường chân trời của Bookmarksgrove quê hương của cô ấy,
dòng tiêu đề của Làng bảng chữ cái và dòng phụ trên con đường riêng của cô ấy, Dòng kẻ. Đáng tiếc, một câu hỏi thần thoại lướt qua má cô, rồi cô tiếp tục đi')
INSERT [dbo].[Product] ([ID], [ProductCategoryID], [Code], [Name], [Title], [Description], [Status], [CreatedDate], [Manufacturer]) VALUES (5, 3, N'giaydep1', N'MEN''S TAJA COMMISSIONER', N'Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar.', N'Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar.', 1, CAST(N'2022-03-15T00:00:00.000' AS DateTime), N'Ngay cả Pointing toàn năng cũng không kiểm soát được các văn bản mù, nó gần như là một cuộc sống gần như không có thần thoại Một ngày nọ, một dòng văn bản mù nhỏ tên là Lorem Ipsum quyết định rời đi đến Thế giới Ngữ pháp xa xôi. Khi đến những ngọn đồi đầu tiên của Dãy núi Italic, cô ấy đã có cái nhìn cuối cùng về đường chân trời của Bookmarksgrove quê hương của cô ấy,
dòng tiêu đề của Làng bảng chữ cái và dòng phụ trên con đường riêng của cô ấy, Dòng kẻ. Đáng tiếc, một câu hỏi thần thoại lướt qua má cô, rồi cô tiếp tục đi')
INSERT [dbo].[Product] ([ID], [ProductCategoryID], [Code], [Name], [Title], [Description], [Status], [CreatedDate], [Manufacturer]) VALUES (6, 2, N'giaydep2', N'WOMEN''S BOOTS SHOES MACA', N'WOMEN''S BOOTS SHOES MACA125235', N'WOMEN''S BOOTS SHOES MACA235634tgyhg', 1, CAST(N'2022-03-15T00:00:00.000' AS DateTime), N'Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar.

When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrove, the headline of Alphabet Village and the subline of her own road, the Line Lane. Pityful a rethoric question ran over her cheek, then she continued her way.')
INSERT [dbo].[Product] ([ID], [ProductCategoryID], [Code], [Name], [Title], [Description], [Status], [CreatedDate], [Manufacturer]) VALUES (7, 4, N'giaydep3', N'RUSS MEN''S SNEAKERS', N'Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar.', N'giaydep1', 1, CAST(N'2022-03-15T00:00:00.000' AS DateTime), N'Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar.

When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrove, the headline of Alphabet Village and the subline of her own road, the Line Lane. Pityful a rethoric question ran over her cheek, then she continued her way.')
INSERT [dbo].[Product] ([ID], [ProductCategoryID], [Code], [Name], [Title], [Description], [Status], [CreatedDate], [Manufacturer]) VALUES (8, 11, NULL, N'giaydep1', N' Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar.

When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrove, the headline of Alphabet Village and the subline of her own road, the Line Lane. Pityful a rethoric question ran over her cheek, then she continued her way.', N'<p>giaydep1</p>
', 1, CAST(N'2022-03-15T00:00:00.000' AS DateTime), N'Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar.

When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrove, the headline of Alphabet Village and the subline of her own road, the Line Lane. Pityful a rethoric question ran over her cheek, then she continued her way.')
INSERT [dbo].[Product] ([ID], [ProductCategoryID], [Code], [Name], [Title], [Description], [Status], [CreatedDate], [Manufacturer]) VALUES (9, 6, N'giaydep1123', N'MEN''S TAJA COMMISSIONER', N'Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar.', N'Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar.', 1, CAST(N'2022-03-15T00:00:00.000' AS DateTime), N'Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar.

When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrove, the headline of Alphabet Village and the subline of her own road, the Line Lane. Pityful a rethoric question ran over her cheek, then she continued her way.')
INSERT [dbo].[Product] ([ID], [ProductCategoryID], [Code], [Name], [Title], [Description], [Status], [CreatedDate], [Manufacturer]) VALUES (10, 2, N'giaydep2213', N'WOMEN''S BOOTS SHOES MACA', N'WOMEN''S BOOTS SHOES MACA125235', N'WOMEN''S BOOTS SHOES MACA235634tgyhg', 1, CAST(N'2022-03-15T00:00:00.000' AS DateTime), N'Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar.

When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrove, the headline of Alphabet Village and the subline of her own road, the Line Lane. Pityful a rethoric question ran over her cheek, then she continued her way.')
INSERT [dbo].[Product] ([ID], [ProductCategoryID], [Code], [Name], [Title], [Description], [Status], [CreatedDate], [Manufacturer]) VALUES (11, 1, N'giaydep', N'RUSS MEN''S SNEAKERS', N'Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar.', N'WOMEN''S BOOTS SHOES MACA235634tgyhg', 1, CAST(N'2022-03-15T17:46:54.940' AS DateTime), N'Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar.

When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrove, the headline of Alphabet Village and the subline of her own road, the Line Lane. Pityful a rethoric question ran over her cheek, then she continued her way.')
INSERT [dbo].[Product] ([ID], [ProductCategoryID], [Code], [Name], [Title], [Description], [Status], [CreatedDate], [Manufacturer]) VALUES (12, 1, N'giaydep', N'RUSS MEN''S SNEAKERS', N'Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar.', N'WOMEN''S BOOTS SHOES MACA235634tgyhg', 1, CAST(N'2022-03-15T17:46:54.977' AS DateTime), N'Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar.

When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrove, the headline of Alphabet Village and the subline of her own road, the Line Lane. Pityful a rethoric question ran over her cheek, then she continued her way.')
INSERT [dbo].[Product] ([ID], [ProductCategoryID], [Code], [Name], [Title], [Description], [Status], [CreatedDate], [Manufacturer]) VALUES (13, 3, N'giaydep1', N'MEN''S TAJA COMMISSIONER', N'Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar.', N'Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar.', 1, CAST(N'2022-03-15T00:00:00.000' AS DateTime), N'Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar.

When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrove, the headline of Alphabet Village and the subline of her own road, the Line Lane. Pityful a rethoric question ran over her cheek, then she continued her way.')
INSERT [dbo].[Product] ([ID], [ProductCategoryID], [Code], [Name], [Title], [Description], [Status], [CreatedDate], [Manufacturer]) VALUES (14, 2, N'giaydep2', N'WOMEN''S BOOTS SHOES MACA', N'WOMEN''S BOOTS SHOES MACA125235', N'WOMEN''S BOOTS SHOES MACA235634tgyhg', 1, CAST(N'2022-03-15T00:00:00.000' AS DateTime), N'Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar.

When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrove, the headline of Alphabet Village and the subline of her own road, the Line Lane. Pityful a rethoric question ran over her cheek, then she continued her way.')
INSERT [dbo].[Product] ([ID], [ProductCategoryID], [Code], [Name], [Title], [Description], [Status], [CreatedDate], [Manufacturer]) VALUES (15, 4, N'giaydep3', N'RUSS MEN''S SNEAKERS', N'Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar.', N'giaydep1', 1, CAST(N'2022-03-15T00:00:00.000' AS DateTime), N'Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar.

When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrove, the headline of Alphabet Village and the subline of her own road, the Line Lane. Pityful a rethoric question ran over her cheek, then she continued her way.')
INSERT [dbo].[Product] ([ID], [ProductCategoryID], [Code], [Name], [Title], [Description], [Status], [CreatedDate], [Manufacturer]) VALUES (16, 5, N'giaydep112', N'giaydep1', N'giaydep1', N'giaydep1', 1, CAST(N'2022-03-15T00:00:00.000' AS DateTime), N'Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar.

When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrove, the headline of Alphabet Village and the subline of her own road, the Line Lane. Pityful a rethoric question ran over her cheek, then she continued her way.')
INSERT [dbo].[Product] ([ID], [ProductCategoryID], [Code], [Name], [Title], [Description], [Status], [CreatedDate], [Manufacturer]) VALUES (17, 6, N'giaydep1123', N'MEN''S TAJA COMMISSIONER', N'Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar.', N'Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar.', 1, CAST(N'2022-03-15T00:00:00.000' AS DateTime), N'Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar.

When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrove, the headline of Alphabet Village and the subline of her own road, the Line Lane. Pityful a rethoric question ran over her cheek, then she continued her way.')
INSERT [dbo].[Product] ([ID], [ProductCategoryID], [Code], [Name], [Title], [Description], [Status], [CreatedDate], [Manufacturer]) VALUES (18, 2, N'giaydep2213', N'WOMEN''S BOOTS SHOES MACA', N'WOMEN''S BOOTS SHOES MACA125235', N'WOMEN''S BOOTS SHOES MACA235634tgyhg', 1, CAST(N'2022-03-15T00:00:00.000' AS DateTime), N'Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar.

When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrove, the headline of Alphabet Village and the subline of her own road, the Line Lane. Pityful a rethoric question ran over her cheek, then she continued her way.')
INSERT [dbo].[Product] ([ID], [ProductCategoryID], [Code], [Name], [Title], [Description], [Status], [CreatedDate], [Manufacturer]) VALUES (19, 1, NULL, N'sản phẩm demo', N' ádfa', N'<p>&agrave;dgafgadfg</p>
', 1, CAST(N'2022-03-18T20:32:03.850' AS DateTime), N'sgdasdfg')
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
SET IDENTITY_INSERT [dbo].[ProductCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductColor] ON 

INSERT [dbo].[ProductColor] ([ID], [Name], [Code]) VALUES (1, N'red', N'#ff0000')
INSERT [dbo].[ProductColor] ([ID], [Name], [Code]) VALUES (2, N'blue', N'#0000ff')
INSERT [dbo].[ProductColor] ([ID], [Name], [Code]) VALUES (3, N'yellow', N'#ffff00')
INSERT [dbo].[ProductColor] ([ID], [Name], [Code]) VALUES (4, N'đỏ đậm', N'')
INSERT [dbo].[ProductColor] ([ID], [Name], [Code]) VALUES (5, N'vàng', N'')
SET IDENTITY_INSERT [dbo].[ProductColor] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductDetail] ON 

INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (3, 4, 2, 1, 2735, N'/images/item-3.jpg')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (4, 5, 1, 1, 35, N'/images/item-1.jpg')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (6, 6, 1, 2, 35, N'/images/item-3.jpg')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (7, 7, 1, 2, 35, N'/images/item-2.jpg')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (8, 8, 1, 2, 20, N'/images/item-3.jpg')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (9, 9, 2, 2, 35, N'/images/item-2.jpg')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (11, 10, 4, 2, 35, N'/images/item-5.jpg')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (12, 11, 5, 2, 35, N'/images/item-4.jpg')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (13, 12, 6, 2, 35, N'/images/item-4.jpg')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (14, 13, 7, 2, 35, N'/images/item-4.jpg')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (15, 14, 7, 2, 35, N'/images/item-5.jpg')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (16, 15, 7, 2, 10, N'/images/item-6.jpg')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (17, 16, 4, 2, 10, N'/images/item-7.jpg')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (18, 17, 1, 1, 20, N'/images/item-8.jpg')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (19, 4, 1, 1, 23, N'/images/item-1.jpg')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (20, 4, 2, 2, 10, N'/images/item-8.jpg')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (21, 4, 1, 2, 10, N'/images/item-1.jpg')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (22, 6, 4, 4, 0, NULL)
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (23, 4, 5, 5, 0, NULL)
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (24, 6, 13, 5, 0, NULL)
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (25, 19, 4, 5, 0, NULL)
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (26, 19, 4, 4, 0, NULL)
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (27, 18, 12, 3, 0, N'')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (28, 4, 3, 3, 265, N'')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (29, 5, 4, 3, 4, N'')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (30, 4, 2, 3, 0, N'')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (31, 4, 2, 3, 246, N'')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (32, 4, 2, 3, 0, N'')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (33, 4, 2, 3, 246, N'')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (34, 4, 2, 3, 123, N'')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (35, 4, 2, 3, 123, N'')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (36, 4, 2, 3, 123, N'')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (37, 4, 2, 3, 123, N'')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (38, 4, 2, 3, 123, N'')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (39, 4, 2, 3, 123, N'')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (40, 4, 14, 4, 123, N'')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (41, 4, 14, 4, 0, N'')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (42, 4, 14, 4, 123, N'')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (43, 4, 14, 4, 0, N'')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (44, 4, 14, 4, 0, N'')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (45, 4, 14, 4, 0, N'')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (46, 4, 14, 4, 0, N'')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (47, 4, 14, 4, 0, N'')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (48, 4, 14, 4, 0, N'')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (49, 4, 14, 4, 0, N'')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (50, 4, 14, 4, 0, N'')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (51, 4, 14, 4, 0, N'')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (52, 4, 14, 4, 123, N'')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (53, 4, 14, 4, 0, N'')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (54, 4, 14, 4, 0, N'')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (55, 4, 14, 4, 615, N'')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (56, 4, 14, 4, 123, N'')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (57, 4, 14, 4, 123, N'')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (58, 4, 14, 4, 246, N'')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (59, 4, 14, 4, 492, N'')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (60, 4, 14, 4, 246, N'')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (61, 4, 14, 4, 492, N'')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (62, 4, 2, 3, 123, N'')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (63, 4, 2, 3, 123, N'')
SET IDENTITY_INSERT [dbo].[ProductDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductImage] ON 

INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (2, 5, N'/images/item-6.jpg')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (3, 6, N'/images/item-7.jpg')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (4, 7, N'/images/item-8.jpg')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (8, 9, N'/images/item-14.jpg')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (9, 10, N'/images/item-14.jpg')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (73, 4, N'/images/item-1.jpg')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (74, 4, N'/images/item-2.jpg')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (75, 4, N'/images/item-3.jpg')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (76, 4, N'/images/item-5.jpg')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (77, 8, N'/images/item-14.jpg')
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

INSERT [dbo].[ProductSize] ([ID], [Name]) VALUES (1, N'7')
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

INSERT [dbo].[Slide] ([ID], [Image], [DisplayOrder], [Link], [Title], [Status]) VALUES (1, N'/images/img_bg_1.jpg', 1, N'/trangchu/a', N'Men''s Shoes New trending shoes', 1)
INSERT [dbo].[Slide] ([ID], [Image], [DisplayOrder], [Link], [Title], [Status]) VALUES (2, N'/images/img_bg_2.jpg', 2, N'ảnh 1', N'Men''s Shoes New trending shoes', 1)
INSERT [dbo].[Slide] ([ID], [Image], [DisplayOrder], [Link], [Title], [Status]) VALUES (3, N'/images/img_bg_3.jpg', 3, N'/trangchu/a', N'Men''s Shoes New trending shoes', 1)
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
/****** Object:  StoredProcedure [dbo].[forgot_password]    Script Date: 4/2/2022 12:05:25 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_create_login]    Script Date: 4/2/2022 12:05:25 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_create_or_update_Discount]    Script Date: 4/2/2022 12:05:25 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_create_or_update_FeedBack]    Script Date: 4/2/2022 12:05:25 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_create_or_update_Order]    Script Date: 4/2/2022 12:05:25 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_create_or_update_OrderDetail]    Script Date: 4/2/2022 12:05:25 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_create_or_update_Product]    Script Date: 4/2/2022 12:05:25 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_create_or_update_ProductCategory]    Script Date: 4/2/2022 12:05:25 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_create_or_update_ProductColor]    Script Date: 4/2/2022 12:05:25 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_create_or_update_ProductDetail]    Script Date: 4/2/2022 12:05:25 PM ******/
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
@Image nvarchar(255)
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
		set ProductID = @ProductID
		,SizeID = @SizeID
		,ColorID = @ColorID
		,Quantity = @Quantity
		,Image = @Image
		where Id = @Id
		select iif(@@ROWCOUNT>0,1,0)
	end
end
GO
/****** Object:  StoredProcedure [dbo].[NidasShoes_create_or_update_ProductReview]    Script Date: 4/2/2022 12:05:25 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_create_or_update_ProductSize]    Script Date: 4/2/2022 12:05:25 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_create_or_update_Receipt]    Script Date: 4/2/2022 12:05:25 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_create_or_update_ReceiptDetail]    Script Date: 4/2/2022 12:05:25 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_create_or_update_Shop]    Script Date: 4/2/2022 12:05:25 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_create_or_update_Slide]    Script Date: 4/2/2022 12:05:25 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_create_or_update_Supply]    Script Date: 4/2/2022 12:05:25 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_delete_Discount]    Script Date: 4/2/2022 12:05:25 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_delete_FeedBack]    Script Date: 4/2/2022 12:05:25 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_delete_Order]    Script Date: 4/2/2022 12:05:25 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_delete_OrderDetail]    Script Date: 4/2/2022 12:05:25 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_delete_OrderStatus]    Script Date: 4/2/2022 12:05:25 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_delete_Product]    Script Date: 4/2/2022 12:05:25 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_delete_ProductCategory]    Script Date: 4/2/2022 12:05:25 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_delete_ProductColor]    Script Date: 4/2/2022 12:05:25 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_delete_ProductDetail]    Script Date: 4/2/2022 12:05:25 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_delete_ProductReview]    Script Date: 4/2/2022 12:05:25 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_delete_ProductSize]    Script Date: 4/2/2022 12:05:25 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_delete_Receipt]    Script Date: 4/2/2022 12:05:25 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_delete_ReceiptDetail]    Script Date: 4/2/2022 12:05:25 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_delete_Shop]    Script Date: 4/2/2022 12:05:25 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_delete_Slide]    Script Date: 4/2/2022 12:05:25 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_delete_Supply]    Script Date: 4/2/2022 12:05:25 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_delete_user_login]    Script Date: 4/2/2022 12:05:25 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_get_client_Product]    Script Date: 4/2/2022 12:05:25 PM ******/
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
		order by [Id]
		offset (@PageSize*(@PageNumber-1)) rows fetch next @PageSize rows only'
	print @Sql
	declare @Param nvarchar(max) = N'@Search nvarchar(max),@PageSize int,@PageNumber int,@Totals int,@PageCount int'
	EXEC sp_executesql @Sql,@Param,@Search,@PageSize,@PageNumber,@Totals,@PageCount
end
GO
/****** Object:  StoredProcedure [dbo].[NidasShoes_get_Client_Product_Detail]    Script Date: 4/2/2022 12:05:25 PM ******/
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
	WHERE p.ID = @Id AND (@sizeID=0 OR @sizeID =c.id) AND (@sizeID =0 OR @colorID = s.id)
end
GO
/****** Object:  StoredProcedure [dbo].[NidasShoes_get_Client_Product_Detail_by_productDetailId]    Script Date: 4/2/2022 12:05:25 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_get_Discount]    Script Date: 4/2/2022 12:05:25 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_get_Discount_byId]    Script Date: 4/2/2022 12:05:25 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_get_FeedBack]    Script Date: 4/2/2022 12:05:25 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_get_FeedBack_byId]    Script Date: 4/2/2022 12:05:25 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_get_Order]    Script Date: 4/2/2022 12:05:25 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_get_Order_by_CustomerId]    Script Date: 4/2/2022 12:05:25 PM ******/
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
	where o.CustomerID = @Id
end
GO
/****** Object:  StoredProcedure [dbo].[NidasShoes_get_Order_byId]    Script Date: 4/2/2022 12:05:25 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_get_OrderDetail]    Script Date: 4/2/2022 12:05:25 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_get_OrderDetail_by_OrderId]    Script Date: 4/2/2022 12:05:25 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_get_OrderDetail_byId]    Script Date: 4/2/2022 12:05:25 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_get_OrderStatus]    Script Date: 4/2/2022 12:05:25 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_get_OrderStatus_byId]    Script Date: 4/2/2022 12:05:25 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_get_Product]    Script Date: 4/2/2022 12:05:25 PM ******/
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
		order by [Id]
		offset (@PageSize*(@PageNumber-1)) rows fetch next @PageSize rows only'
	print @Sql
	declare @Param nvarchar(max) = N'@Search nvarchar(max),@PageSize int,@PageNumber int,@Totals int,@PageCount int'
	EXEC sp_executesql @Sql,@Param,@Search,@PageSize,@PageNumber,@Totals,@PageCount
end
GO
/****** Object:  StoredProcedure [dbo].[NidasShoes_get_Product_byId]    Script Date: 4/2/2022 12:05:25 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_get_ProductCategory]    Script Date: 4/2/2022 12:05:25 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_get_ProductCategory_byId]    Script Date: 4/2/2022 12:05:25 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_get_ProductColor]    Script Date: 4/2/2022 12:05:25 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_get_productColor_by_ProductID]    Script Date: 4/2/2022 12:05:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[NidasShoes_get_productColor_by_ProductID]
@Id int
as begin
	select c.* from [dbo].[ProductColor] c JOIN [dbo].[ProductDetail] pd ON c.id = pd.sizeId 
	where pd.productID = @Id
	GROUP BY c.id,c.name,c.code
end
GO
/****** Object:  StoredProcedure [dbo].[NidasShoes_get_ProductColor_byId]    Script Date: 4/2/2022 12:05:25 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_get_ProductDetail]    Script Date: 4/2/2022 12:05:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[NidasShoes_get_ProductDetail]
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_get_ProductDetail_byId]    Script Date: 4/2/2022 12:05:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[NidasShoes_get_ProductDetail_byId]
@Id int
as
begin
	select * from ProductDetail
	where Id = @Id
end
GO
/****** Object:  StoredProcedure [dbo].[NidasShoes_get_productImage]    Script Date: 4/2/2022 12:05:25 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_get_productImage_by_ProductID]    Script Date: 4/2/2022 12:05:25 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_get_ProductReview]    Script Date: 4/2/2022 12:05:25 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_get_ProductReview_by_productID]    Script Date: 4/2/2022 12:05:25 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_get_ProductReview_byId]    Script Date: 4/2/2022 12:05:25 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_get_ProductSize]    Script Date: 4/2/2022 12:05:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[NidasShoes_get_ProductSize]
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
		order by [Id]
		offset (@PageSize*(@PageNumber-1)) rows fetch next @PageSize rows only'
	print @Sql
	declare @Param nvarchar(max) = N'@Search nvarchar(max),@PageSize int,@PageNumber int,@Totals int,@PageCount int'
	EXEC sp_executesql @Sql,@Param,@Search,@PageSize,@PageNumber,@Totals,@PageCount
end
GO
/****** Object:  StoredProcedure [dbo].[NidasShoes_get_productSize_by_ProductID]    Script Date: 4/2/2022 12:05:25 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_get_ProductSize_byId]    Script Date: 4/2/2022 12:05:25 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_get_rateing_Review_by_ProductID]    Script Date: 4/2/2022 12:05:25 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_get_Receipt]    Script Date: 4/2/2022 12:05:25 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_get_Receipt_byId]    Script Date: 4/2/2022 12:05:25 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_get_ReceiptDetail]    Script Date: 4/2/2022 12:05:25 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_get_ReceiptDetail_by_ReceiptId]    Script Date: 4/2/2022 12:05:25 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_get_Shop]    Script Date: 4/2/2022 12:05:25 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_get_Shop_byId]    Script Date: 4/2/2022 12:05:25 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_get_Slide]    Script Date: 4/2/2022 12:05:25 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_get_Slide_byId]    Script Date: 4/2/2022 12:05:25 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_get_Supply]    Script Date: 4/2/2022 12:05:25 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_get_Supply_byId]    Script Date: 4/2/2022 12:05:25 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_get_user]    Script Date: 4/2/2022 12:05:25 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_get_user_by_email]    Script Date: 4/2/2022 12:05:25 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_get_user_login_byId]    Script Date: 4/2/2022 12:05:25 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_search_Client_Product_Detail]    Script Date: 4/2/2022 12:05:25 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_transaction_export]    Script Date: 4/2/2022 12:05:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[NidasShoes_transaction_export]
AS
BEGIN
	SELECT SUM(TotalCost) AS total ,MONTH(CreatedDate) AS [Month],YEAR(CreatedDate) AS [year]  FROM dbo.[Order]
	GROUP BY MONTH(CreatedDate),YEAR(CreatedDate)
END
GO
/****** Object:  StoredProcedure [dbo].[NidasShoes_UPDATE_QUANTITY_PRODUCT]    Script Date: 4/2/2022 12:05:25 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_Update_Status_Order_By_Id]    Script Date: 4/2/2022 12:05:25 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_user_login]    Script Date: 4/2/2022 12:05:25 PM ******/
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
