USE [master]
GO
/****** Object:  Database [NIDAS_SHOES]    Script Date: 3/16/2022 7:29:29 PM ******/
CREATE DATABASE [NIDAS_SHOES]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'NIDAS_SHOES', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\NIDAS_SHOES.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'NIDAS_SHOES_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\NIDAS_SHOES_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [NIDAS_SHOES] SET COMPATIBILITY_LEVEL = 150
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
ALTER DATABASE [NIDAS_SHOES] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [NIDAS_SHOES] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'NIDAS_SHOES', N'ON'
GO
ALTER DATABASE [NIDAS_SHOES] SET QUERY_STORE = OFF
GO
USE [NIDAS_SHOES]
GO
/****** Object:  UserDefinedTableType [dbo].[BaseParamType]    Script Date: 3/16/2022 7:29:29 PM ******/
CREATE TYPE [dbo].[BaseParamType] AS TABLE(
	[Search] [nvarchar](max) NULL,
	[PageSize] [int] NULL,
	[PageNumber] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[ProductImages]    Script Date: 3/16/2022 7:29:29 PM ******/
CREATE TYPE [dbo].[ProductImages] AS TABLE(
	[Id] [int] NULL,
	[ProductDetailId] [int] NULL,
	[Image] [nvarchar](max) NULL
)
GO
/****** Object:  Table [dbo].[Discount]    Script Date: 3/16/2022 7:29:29 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FeedBack]    Script Date: 3/16/2022 7:29:29 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MasterData]    Script Date: 3/16/2022 7:29:29 PM ******/
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
/****** Object:  Table [dbo].[Order]    Script Date: 3/16/2022 7:29:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[PaymentID] [int] NOT NULL,
	[DiscountID] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[Description] [nvarchar](max) NULL,
	[Note] [nvarchar](max) NULL,
	[OrderStatusID] [int] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 3/16/2022 7:29:29 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderStatus]    Script Date: 3/16/2022 7:29:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderStatus](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[OrderID] [int] NULL,
	[StatusID] [int] NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_OrderStatus] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 3/16/2022 7:29:29 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 3/16/2022 7:29:29 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCategory]    Script Date: 3/16/2022 7:29:29 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductColor]    Script Date: 3/16/2022 7:29:29 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductDetail]    Script Date: 3/16/2022 7:29:29 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductImage]    Script Date: 3/16/2022 7:29:29 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductPrice]    Script Date: 3/16/2022 7:29:29 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductReview]    Script Date: 3/16/2022 7:29:29 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductSize]    Script Date: 3/16/2022 7:29:29 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Receipt]    Script Date: 3/16/2022 7:29:29 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReceiptDetail]    Script Date: 3/16/2022 7:29:29 PM ******/
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
 CONSTRAINT [PK_ReceiptDetail] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rule]    Script Date: 3/16/2022 7:29:29 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shop]    Script Date: 3/16/2022 7:29:30 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Slide]    Script Date: 3/16/2022 7:29:30 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 3/16/2022 7:29:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supply]    Script Date: 3/16/2022 7:29:30 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 3/16/2022 7:29:30 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Discount] ON 

INSERT [dbo].[Discount] ([ID], [Code], [StartDate], [EndDate], [Rate], [Description]) VALUES (1, N'code11', CAST(N'2022-08-01T11:48:00.000' AS DateTime), CAST(N'2022-09-30T12:49:00.000' AS DateTime), 10, N'mota nè')
INSERT [dbo].[Discount] ([ID], [Code], [StartDate], [EndDate], [Rate], [Description]) VALUES (2, N'code2', CAST(N'2022-08-01T00:00:00.000' AS DateTime), CAST(N'2022-09-01T00:00:00.000' AS DateTime), 12, N'mota nè')
INSERT [dbo].[Discount] ([ID], [Code], [StartDate], [EndDate], [Rate], [Description]) VALUES (3, N'code3', CAST(N'2022-08-01T00:00:00.000' AS DateTime), CAST(N'2022-09-01T00:00:00.000' AS DateTime), 25, N'mota nè')
INSERT [dbo].[Discount] ([ID], [Code], [StartDate], [EndDate], [Rate], [Description]) VALUES (4, N'code4', CAST(N'2022-08-01T00:00:00.000' AS DateTime), CAST(N'2022-09-01T00:00:00.000' AS DateTime), 25, N'mota nè')
INSERT [dbo].[Discount] ([ID], [Code], [StartDate], [EndDate], [Rate], [Description]) VALUES (6, N'nhatdeptrai', CAST(N'2022-03-08T18:04:00.000' AS DateTime), CAST(N'2022-07-09T16:03:00.000' AS DateTime), 80, N'vì đẹp trai nên giảm siêu sâu')
SET IDENTITY_INSERT [dbo].[Discount] OFF
GO
SET IDENTITY_INSERT [dbo].[FeedBack] ON 

INSERT [dbo].[FeedBack] ([ID], [UserID], [Title], [Content], [CreatedDate], [ParentFBID]) VALUES (1, 1, N'tiêu đề gửi ', N'noi dung', CAST(N'2022-03-08T11:26:59.860' AS DateTime), NULL)
INSERT [dbo].[FeedBack] ([ID], [UserID], [Title], [Content], [CreatedDate], [ParentFBID]) VALUES (2, 2, N'ádf', N'sdaf', CAST(N'2022-03-08T11:26:59.860' AS DateTime), 1)
INSERT [dbo].[FeedBack] ([ID], [UserID], [Title], [Content], [CreatedDate], [ParentFBID]) VALUES (3, 2, N'gsdf', N'gsdfg', CAST(N'2022-03-08T11:26:59.860' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[FeedBack] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([ID], [UserID], [PaymentID], [DiscountID], [CreatedDate], [Description], [Note], [OrderStatusID]) VALUES (1, 1, 1, 1, CAST(N'2000-02-02T00:00:00.000' AS DateTime), NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetail] ON 

INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductDetailID], [Price], [Quantity]) VALUES (1, 1, 1, CAST(10000 AS Decimal(18, 0)), 1)
SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ID], [ProductCategoryID], [Code], [Name], [Title], [Description], [Status], [CreatedDate], [Manufacturer]) VALUES (4, 1, N'giaydep', N'RUSS MEN''S SNEAKERS', N'Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar.

When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrove, the headline of Alphabet Village and the subline of her own road, the Line Lane. Pityful a rethoric question ran over her cheek, then she continued her way.', N'Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar.

When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrove, the headline of Alphabet Village and the subline of her own road, the Line Lane. Pityful a rethoric question ran over her cheek, then she continued her way.

The Big Oxmox advised her not to do so
Because there were thousands of bad Commas
Wild Question Marks and devious Semikoli
She packed her seven versalia
tial into the belt and made herself on the way.', 1, CAST(N'2022-03-15T00:00:00.000' AS DateTime), N'Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar.

When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrove, the headline of Alphabet Village and the subline of her own road, the Line Lane. Pityful a rethoric question ran over her cheek, then she continued her way.')
INSERT [dbo].[Product] ([ID], [ProductCategoryID], [Code], [Name], [Title], [Description], [Status], [CreatedDate], [Manufacturer]) VALUES (5, 3, N'giaydep1', N'MEN''S TAJA COMMISSIONER', N'Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar.', N'Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar.', 1, CAST(N'2022-03-15T00:00:00.000' AS DateTime), N'Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar.

When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrove, the headline of Alphabet Village and the subline of her own road, the Line Lane. Pityful a rethoric question ran over her cheek, then she continued her way.')
INSERT [dbo].[Product] ([ID], [ProductCategoryID], [Code], [Name], [Title], [Description], [Status], [CreatedDate], [Manufacturer]) VALUES (6, 2, N'giaydep2', N'WOMEN''S BOOTS SHOES MACA', N'WOMEN''S BOOTS SHOES MACA125235', N'WOMEN''S BOOTS SHOES MACA235634tgyhg', 1, CAST(N'2022-03-15T00:00:00.000' AS DateTime), N'Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar.

When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrove, the headline of Alphabet Village and the subline of her own road, the Line Lane. Pityful a rethoric question ran over her cheek, then she continued her way.')
INSERT [dbo].[Product] ([ID], [ProductCategoryID], [Code], [Name], [Title], [Description], [Status], [CreatedDate], [Manufacturer]) VALUES (7, 4, N'giaydep3', N'RUSS MEN''S SNEAKERS', N'Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar.', N'giaydep1', 1, CAST(N'2022-03-15T00:00:00.000' AS DateTime), N'Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar.

When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrove, the headline of Alphabet Village and the subline of her own road, the Line Lane. Pityful a rethoric question ran over her cheek, then she continued her way.')
INSERT [dbo].[Product] ([ID], [ProductCategoryID], [Code], [Name], [Title], [Description], [Status], [CreatedDate], [Manufacturer]) VALUES (8, 5, N'giaydep112', N'giaydep1', N'giaydep1', N'giaydep1', 1, CAST(N'2022-03-15T00:00:00.000' AS DateTime), N'Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar.

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
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductCategory] ON 

INSERT [dbo].[ProductCategory] ([ID], [ParentID], [Name], [Description], [Status]) VALUES (1, 1, N'NIKE', N'Giầy nam hãng Nike', 1)
INSERT [dbo].[ProductCategory] ([ID], [ParentID], [Name], [Description], [Status]) VALUES (2, 1, N'Adidas', N'giày nam hãng Adidas', 1)
INSERT [dbo].[ProductCategory] ([ID], [ParentID], [Name], [Description], [Status]) VALUES (3, 2, N'Nike', N'Giày nữ hãng Nike', 1)
INSERT [dbo].[ProductCategory] ([ID], [ParentID], [Name], [Description], [Status]) VALUES (4, 2, N'Adidas ', N'Giày nữ hãng Adidas', 1)
SET IDENTITY_INSERT [dbo].[ProductCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductColor] ON 

INSERT [dbo].[ProductColor] ([ID], [Name], [Code]) VALUES (1, N'red', N'#ff0000')
INSERT [dbo].[ProductColor] ([ID], [Name], [Code]) VALUES (2, N'blue', N'#0000ff')
INSERT [dbo].[ProductColor] ([ID], [Name], [Code]) VALUES (3, N'yellow', N'#ffff00')
SET IDENTITY_INSERT [dbo].[ProductColor] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductDetail] ON 

INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (1, 4, 2, 1, 30, N'/images/item-3.jpg')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (2, 4, 1, 1, 30, N'/images/item-1.jpg')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (3, 4, 1, 2, 35, N'/images/item-2.jpg')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (4, 5, 1, 2, 35, N'/images/item-3.jpg')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (5, 6, 1, 2, 35, N'/images/item-3.jpg')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (6, 7, 1, 2, 35, N'/images/item-3.jpg')
INSERT [dbo].[ProductDetail] ([ID], [ProductID], [SizeID], [ColorID], [Quantity], [Image]) VALUES (7, 8, 1, 2, 35, N'/images/item-3.jpg')
SET IDENTITY_INSERT [dbo].[ProductDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductImage] ON 

INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (1, 4, N'/images/item-1.jpg')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (2, 5, N'/images/item-6.jpg')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (3, 6, N'/images/item-7.jpg')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (4, 7, N'/images/item-8.jpg')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (5, 4, N'/images/item-2.jpg')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (6, 4, N'/images/item-3.jpg')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (7, 8, N'/images/item-14.jpg')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (8, 9, N'/images/item-14.jpg')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (9, 10, N'/images/item-14.jpg')
INSERT [dbo].[ProductImage] ([ID], [ProductID], [Image]) VALUES (10, 4, N'/images/item-5.jpg')
SET IDENTITY_INSERT [dbo].[ProductImage] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductPrice] ON 

INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (1, CAST(10000 AS Decimal(18, 0)), CAST(11000 AS Decimal(18, 0)), CAST(N'2022-03-14T20:29:33.083' AS DateTime), 4)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (2, CAST(10000 AS Decimal(18, 0)), CAST(12000 AS Decimal(18, 0)), CAST(N'2022-03-14T20:29:33.083' AS DateTime), 5)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (3, CAST(10000 AS Decimal(18, 0)), CAST(11000 AS Decimal(18, 0)), CAST(N'2022-03-13T20:29:33.083' AS DateTime), 4)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (4, CAST(10000 AS Decimal(18, 0)), CAST(11000 AS Decimal(18, 0)), CAST(N'2022-03-13T20:29:34.153' AS DateTime), 3)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (5, CAST(10000 AS Decimal(18, 0)), CAST(11000 AS Decimal(18, 0)), CAST(N'2022-03-13T20:29:35.813' AS DateTime), 2)
INSERT [dbo].[ProductPrice] ([ID], [ImportPrice], [ExportPrice], [CreatedDate], [ProductDetailID]) VALUES (6, CAST(120000 AS Decimal(18, 0)), CAST(300000 AS Decimal(18, 0)), CAST(N'2022-03-15T18:47:00.547' AS DateTime), 1)
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
INSERT [dbo].[Supply] ([ID], [Name], [Phone], [Address], [Description]) VALUES (7, N'nha cc', N'01239808121', N'Sai gon a', N'mo ta ne')
SET IDENTITY_INSERT [dbo].[Supply] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([ID], [RuleID], [UserName], [HashedPassword], [Name], [Email], [Address], [PhoneNumber]) VALUES (1, 1, N'Admin', N'ZCthc6xoqYg=', N'Admin', N'holongnhat2000@gmail.com', N'Hà Nội', N'0866721300')
INSERT [dbo].[User] ([ID], [RuleID], [UserName], [HashedPassword], [Name], [Email], [Address], [PhoneNumber]) VALUES (2, 2, N'Manager', N'ZCthc6xoqYg=', N'Manager', N'Manager', N'Manager', N'541564')
INSERT [dbo].[User] ([ID], [RuleID], [UserName], [HashedPassword], [Name], [Email], [Address], [PhoneNumber]) VALUES (3, 3, N'Staff', N'ZCthc6xoqYg=', N'Staff', N'324165', N'Hà Nội', N'0866721300')
INSERT [dbo].[User] ([ID], [RuleID], [UserName], [HashedPassword], [Name], [Email], [Address], [PhoneNumber]) VALUES (4, 3, N'demo', N'ZCthc6xoqYg=', N'demo', N'54654', N'56435', N'0866721301')
INSERT [dbo].[User] ([ID], [RuleID], [UserName], [HashedPassword], [Name], [Email], [Address], [PhoneNumber]) VALUES (5, 4, N'nhat', N'hx5uYogkuCQ=', N'ten', N'email', N'dia chi nè', N'09768118764')
INSERT [dbo].[User] ([ID], [RuleID], [UserName], [HashedPassword], [Name], [Email], [Address], [PhoneNumber]) VALUES (6, 4, N'123', N'1x3R3eocF5Y=', N'123', N'nhat@1231654', N'123', N'0866721300')
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[FeedBack] ADD  CONSTRAINT [DF_FeedBack_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[ProductPrice] ADD  CONSTRAINT [DF_ProductPrice_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[ProductReview] ADD  CONSTRAINT [DF_ProductReview_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  StoredProcedure [dbo].[forgot_password]    Script Date: 3/16/2022 7:29:30 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_create_login]    Script Date: 3/16/2022 7:29:30 PM ******/
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
			if not exists (select * from [User] where UserName = @UserName)
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_create_or_update_Discount]    Script Date: 3/16/2022 7:29:30 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_create_or_update_FeedBack]    Script Date: 3/16/2022 7:29:30 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_create_or_update_Product]    Script Date: 3/16/2022 7:29:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[NidasShoes_create_or_update_Product]
@Id int,
@ProductCategoryID nvarchar(255),
@Code datetime,
@Name datetime,
@Title int,
@Description INT,
@Status int   ,
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_create_or_update_ProductCategory]    Script Date: 3/16/2022 7:29:30 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_create_or_update_ProductColor]    Script Date: 3/16/2022 7:29:30 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_create_or_update_ProductReview]    Script Date: 3/16/2022 7:29:30 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_create_or_update_ProductSize]    Script Date: 3/16/2022 7:29:30 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_create_or_update_Shop]    Script Date: 3/16/2022 7:29:30 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_create_or_update_Slide]    Script Date: 3/16/2022 7:29:30 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_create_or_update_Supply]    Script Date: 3/16/2022 7:29:30 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_delete_Discount]    Script Date: 3/16/2022 7:29:30 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_delete_FeedBack]    Script Date: 3/16/2022 7:29:30 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_delete_Product]    Script Date: 3/16/2022 7:29:30 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_delete_ProductCategory]    Script Date: 3/16/2022 7:29:30 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_delete_ProductColor]    Script Date: 3/16/2022 7:29:30 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_delete_ProductReview]    Script Date: 3/16/2022 7:29:30 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_delete_ProductSize]    Script Date: 3/16/2022 7:29:30 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_delete_Shop]    Script Date: 3/16/2022 7:29:30 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_delete_Slide]    Script Date: 3/16/2022 7:29:30 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_delete_Supply]    Script Date: 3/16/2022 7:29:30 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_delete_user_login]    Script Date: 3/16/2022 7:29:30 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_get_client_Product]    Script Date: 3/16/2022 7:29:30 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_get_Client_Product_Detail]    Script Date: 3/16/2022 7:29:30 PM ******/
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
	WHERE p.ID = @Id AND (@sizeID=0 OR @sizeID =c.id) AND (@sizeID =0 OR @colorID = s.id)
end
GO
/****** Object:  StoredProcedure [dbo].[NidasShoes_get_Discount]    Script Date: 3/16/2022 7:29:30 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_get_Discount_byId]    Script Date: 3/16/2022 7:29:30 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_get_FeedBack]    Script Date: 3/16/2022 7:29:30 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_get_FeedBack_byId]    Script Date: 3/16/2022 7:29:30 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_get_Product]    Script Date: 3/16/2022 7:29:30 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_get_Product_byId]    Script Date: 3/16/2022 7:29:30 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_get_ProductCategory]    Script Date: 3/16/2022 7:29:30 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_get_ProductCategory_byId]    Script Date: 3/16/2022 7:29:30 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_get_ProductColor]    Script Date: 3/16/2022 7:29:30 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_get_productColor_by_ProductID]    Script Date: 3/16/2022 7:29:30 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_get_ProductColor_byId]    Script Date: 3/16/2022 7:29:30 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_get_productImage]    Script Date: 3/16/2022 7:29:30 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_get_productImage_by_ProductID]    Script Date: 3/16/2022 7:29:30 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_get_ProductReview]    Script Date: 3/16/2022 7:29:30 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_get_ProductReview_by_productID]    Script Date: 3/16/2022 7:29:30 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_get_ProductReview_byId]    Script Date: 3/16/2022 7:29:30 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_get_ProductSize]    Script Date: 3/16/2022 7:29:30 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_get_productSize_by_ProductID]    Script Date: 3/16/2022 7:29:30 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_get_ProductSize_byId]    Script Date: 3/16/2022 7:29:30 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_get_rateing_Review_by_ProductID]    Script Date: 3/16/2022 7:29:30 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_get_Shop]    Script Date: 3/16/2022 7:29:30 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_get_Shop_byId]    Script Date: 3/16/2022 7:29:30 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_get_Slide]    Script Date: 3/16/2022 7:29:30 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_get_Slide_byId]    Script Date: 3/16/2022 7:29:30 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_get_Supply]    Script Date: 3/16/2022 7:29:30 PM ******/
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
	select @Totals = count(Id) from slide
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_get_Supply_byId]    Script Date: 3/16/2022 7:29:30 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_get_user]    Script Date: 3/16/2022 7:29:30 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_get_user_by_email]    Script Date: 3/16/2022 7:29:30 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_get_user_login_byId]    Script Date: 3/16/2022 7:29:30 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_user_login]    Script Date: 3/16/2022 7:29:30 PM ******/
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
