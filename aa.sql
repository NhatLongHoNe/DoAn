USE [master]
GO
/****** Object:  Database [ShopGame]    Script Date: 3/11/2022 9:51:02 PM ******/
CREATE DATABASE [ShopGame]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ShopGame', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ShopGame.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ShopGame_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ShopGame_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ShopGame] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ShopGame].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ShopGame] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ShopGame] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ShopGame] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ShopGame] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ShopGame] SET ARITHABORT OFF 
GO
ALTER DATABASE [ShopGame] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ShopGame] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ShopGame] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ShopGame] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ShopGame] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ShopGame] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ShopGame] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ShopGame] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ShopGame] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ShopGame] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ShopGame] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ShopGame] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ShopGame] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ShopGame] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ShopGame] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ShopGame] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ShopGame] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ShopGame] SET RECOVERY FULL 
GO
ALTER DATABASE [ShopGame] SET  MULTI_USER 
GO
ALTER DATABASE [ShopGame] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ShopGame] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ShopGame] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ShopGame] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ShopGame] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ShopGame] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ShopGame', N'ON'
GO
ALTER DATABASE [ShopGame] SET QUERY_STORE = OFF
GO
USE [ShopGame]
GO
/****** Object:  UserDefinedTableType [dbo].[BaseParamType]    Script Date: 3/11/2022 9:51:02 PM ******/
CREATE TYPE [dbo].[BaseParamType] AS TABLE(
	[Search] [nvarchar](max) NULL,
	[PageSize] [int] NULL,
	[PageNumber] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[ProductImages]    Script Date: 3/11/2022 9:51:02 PM ******/
CREATE TYPE [dbo].[ProductImages] AS TABLE(
	[Id] [int] NULL,
	[ProductId] [int] NULL,
	[Image] [nvarchar](max) NULL
)
GO
/****** Object:  Table [dbo].[Account]    Script Date: 3/11/2022 9:51:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](255) NULL,
	[HashedPassword] [nvarchar](255) NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Blog]    Script Date: 3/11/2022 9:51:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blog](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[MetaTitle] [nvarchar](255) NULL,
	[Description] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NULL,
	[BlogTypeId] [int] NULL,
	[Image] [nvarchar](500) NULL,
 CONSTRAINT [PK_Blog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BlogType]    Script Date: 3/11/2022 9:51:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BlogType](
	[BlogTypeId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
 CONSTRAINT [PK_BlogType] PRIMARY KEY CLUSTERED 
(
	[BlogTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CardAdmin]    Script Date: 3/11/2022 9:51:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CardAdmin](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CardNumber] [nvarchar](255) NULL,
	[CardType] [nvarchar](255) NULL,
	[CardHolder] [nvarchar](255) NULL,
	[CardBranch] [nvarchar](255) NULL,
	[BankName] [nvarchar](255) NULL,
 CONSTRAINT [PK_CardAdmin] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DiscountCode]    Script Date: 3/11/2022 9:51:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiscountCode](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[Code] [nvarchar](255) NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_DiscountCode] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GiaTriThe]    Script Date: 3/11/2022 9:51:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GiaTriThe](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[Value] [decimal](18, 0) NULL,
	[Percent] [decimal](18, 0) NULL,
 CONSTRAINT [PK_GiaTriThe] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MasterData]    Script Date: 3/11/2022 9:51:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MasterData](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](255) NULL,
	[Name] [nvarchar](255) NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_MasterData] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 3/11/2022 9:51:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DisplayOrder] [int] NULL,
	[Description] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NULL,
	[Status] [bit] NULL,
	[Link] [nvarchar](255) NULL,
 CONSTRAINT [PK_Menu] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NaptheTransaction]    Script Date: 3/11/2022 9:51:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NaptheTransaction](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NCCId] [int] NULL,
	[GiaTriTheId] [int] NULL,
	[MaThe] [nvarchar](255) NULL,
	[Serial] [nvarchar](255) NULL,
	[ThucNhan] [decimal](18, 0) NULL,
	[KieuNap] [nvarchar](255) NULL,
	[UserId] [nvarchar](255) NULL,
	[CreatedDate] [datetime] NULL,
	[Status] [int] NULL,
	[OutIn] [int] NULL,
 CONSTRAINT [PK_NaptheTransaction] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NCC]    Script Date: 3/11/2022 9:51:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NCC](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
 CONSTRAINT [PK_NCC] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notification]    Script Date: 3/11/2022 9:51:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notification](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Content] [nvarchar](max) NULL,
	[Image] [nvarchar](500) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Notification] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 3/11/2022 9:51:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[Code] [nvarchar](255) NULL,
	[Metatitle] [nvarchar](255) NULL,
	[Description] [nvarchar](max) NULL,
	[Image] [nvarchar](500) NULL,
	[CategoryId] [int] NULL,
	[Detail] [nvarchar](255) NULL,
	[CreatedDate] [datetime] NULL,
	[MetaDescription] [nvarchar](255) NULL,
	[Status] [bit] NULL,
	[OrderNo] [int] NULL,
	[Rank] [nvarchar](255) NULL,
	[SoTuong] [nvarchar](255) NULL,
	[SoTrangPhuc] [nvarchar](255) NULL,
	[LoaiTaiKhoan] [nvarchar](255) NULL,
	[NoiBat] [nvarchar](255) NULL,
	[DangKy] [nvarchar](255) NULL,
	[VIP] [nvarchar](255) NULL,
	[Top] [int] NULL,
	[AccUserName] [nvarchar](255) NOT NULL,
	[AccPassword] [nvarchar](255) NOT NULL,
	[IsBuyed] [bit] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCategory]    Script Date: 3/11/2022 9:51:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](500) NULL,
	[Image] [nvarchar](500) NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_ProductCategory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductImage]    Script Date: 3/11/2022 9:51:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductImage](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Image] [nvarchar](500) NULL,
	[ProductId] [int] NULL,
 CONSTRAINT [PK_ProductImage] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductPrice]    Script Date: 3/11/2022 9:51:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductPrice](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NULL,
	[Name] [nvarchar](255) NULL,
	[CreatedDate] [datetime] NULL,
	[Price] [decimal](18, 0) NULL,
 CONSTRAINT [PK_ProductPrice] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductTransaction]    Script Date: 3/11/2022 9:51:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductTransaction](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductType] [int] NULL,
	[Name] [nvarchar](255) NULL,
	[IdGame] [nvarchar](255) NULL,
	[AccUserName] [nvarchar](255) NULL,
	[AccPassword] [nvarchar](255) NULL,
	[Price] [decimal](18, 0) NULL,
	[CreatedDate] [datetime] NULL,
	[UserId] [int] NULL,
	[EndBalance] [decimal](18, 0) NULL,
	[Content] [nvarchar](255) NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_ProductTransaction] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Skin]    Script Date: 3/11/2022 9:51:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Skin](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[Image] [nvarchar](500) NULL,
	[SkinCategoryId] [int] NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_Skin] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SkinCategory]    Script Date: 3/11/2022 9:51:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SkinCategory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[Image] [nvarchar](500) NULL,
	[Description] [nvarchar](max) NULL,
	[SkinsSold] [int] NULL,
 CONSTRAINT [PK_SkinCategory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SkinPrice]    Script Date: 3/11/2022 9:51:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SkinPrice](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Price] [decimal](18, 0) NULL,
	[SkinId] [int] NULL,
	[CreatedDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Slide]    Script Date: 3/11/2022 9:51:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slide](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Image] [nvarchar](255) NULL,
	[DisplayOrder] [int] NULL,
	[Link] [nvarchar](255) NULL,
	[Description] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Slide] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SpinLuck]    Script Date: 3/11/2022 9:51:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SpinLuck](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[SpinLuckTypeId] [int] NULL,
	[Price] [decimal](18, 0) NULL,
	[Image] [nvarchar](500) NULL,
 CONSTRAINT [PK_SpinLuck] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SpinLuckType]    Script Date: 3/11/2022 9:51:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SpinLuckType](
	[SpinLuckTypeId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
 CONSTRAINT [PK_SpinLuckType] PRIMARY KEY CLUSTERED 
(
	[SpinLuckTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Step]    Script Date: 3/11/2022 9:51:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Step](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Content] [nvarchar](max) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Step] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transaction]    Script Date: 3/11/2022 9:51:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transaction](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GiaoDich] [nvarchar](255) NULL,
	[SoTien] [decimal](18, 0) NULL,
	[SoDu] [decimal](18, 0) NULL,
	[Content] [nvarchar](255) NULL,
	[Status] [nvarchar](255) NULL,
	[Serial] [nvarchar](255) NULL,
	[LoaiThe] [nvarchar](255) NULL,
	[KieuNap] [nvarchar](255) NULL,
	[MaThe] [nvarchar](255) NULL,
	[TransactionCategoryTypeId] [int] NULL,
	[UserId] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[NhaMang] [nvarchar](255) NULL,
	[Game] [nvarchar](255) NULL,
	[AccUserName] [nvarchar](255) NULL,
	[AccPassword] [nvarchar](255) NULL,
 CONSTRAINT [PK_Transaction] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TransactionCategoryType]    Script Date: 3/11/2022 9:51:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransactionCategoryType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
 CONSTRAINT [PK_TransactionCategoryType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 3/11/2022 9:51:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](255) NULL,
	[HashedPassword] [nvarchar](255) NULL,
	[Name] [nvarchar](255) NULL,
	[Email] [nvarchar](255) NULL,
	[Balance] [decimal](18, 0) NULL,
	[Phone] [nvarchar](255) NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_User_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserItem]    Script Date: 3/11/2022 9:51:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserItem](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[Name] [nvarchar](255) NULL,
	[MaThe] [nvarchar](255) NULL,
	[LoaiThe] [nvarchar](255) NULL,
	[KieuNap] [nvarchar](255) NULL,
	[CanNguyen] [nvarchar](255) NULL,
 CONSTRAINT [PK_UserItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([Id], [UserName], [HashedPassword]) VALUES (1004, N'Thanhninh1st', N'9izQ0R2Z4k5UbahrWv8fHA==')
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[Blog] ON 

INSERT [dbo].[Blog] ([Id], [Name], [MetaTitle], [Description], [CreatedDate], [BlogTypeId], [Image]) VALUES (1, N'Cập nhật tháng 7 của Đột Kích, AK-47 TRUMPET - khẩu “Súng kèn” vô cùng độc đáo và mới lạ.', N'game-gido', N'<p>Trong bản cập nhật ng&agrave;y 13/7, một vật phẩm mới sẽ đến tay game thủ Đột K&iacute;ch, khẩu AK47-Trumpet, đ&uacute;ng nghĩa &ldquo;s&uacute;ng k&egrave;n&rdquo; độc đ&aacute;o.</p>

<p>Tiếp tục chuỗi sự kiện mừng kỉ niệm 1 năm ra mắt của NPH VTC Online, Đột K&iacute;ch sẽ cập nhật mở rộng th&aacute;ng 7 v&agrave;o ng&agrave;y 13/7 tới, giới thiệu 2 g&oacute;i QCMM Russian Classic A v&agrave; B. Game thủ sẽ c&oacute; cơ hội sở hữu 3 b&aacute;u vật cũ: Bộ AK47+DE Khokhloma v&agrave; OC-14 v', CAST(N'2021-08-12T23:44:32.843' AS DateTime), 2, N'/Admin/Content/images/no-image-available-thumb(1349x760-crop).jpg')
INSERT [dbo].[Blog] ([Id], [Name], [MetaTitle], [Description], [CreatedDate], [BlogTypeId], [Image]) VALUES (2, N'Cập nhật tháng 7 của Đột Kích, AK-47 TRUMPET - khẩu “Súng kèn” vô cùng độc
                                        đáo và mới lạ.', N'game-gido', N' <p>
                            Trong bản cập nhật ngày 13/7, một vật phẩm mới sẽ đến tay game thủ Đột Kích, khẩu
                            AK47-Trumpet, đúng nghĩa “súng kèn” độc đáo.
                        </p>
                        <p>
                            Tiếp tục chuỗi sự kiện mừng kỉ niệm 1 năm ra mắt của NPH VTC Online, Đột Kích sẽ cập nhật
                            mở rộng tháng 7 vào ngày 13/7 tới, giới thiệu 2 gói QCMM Russian Classic A và B. Game
                            thủ sẽ có cơ hội sở hữu 3 báu vật cũ: Bộ AK47+DE Khokhloma và OC-14 vĩnh viễn trong
                            combo B, hoặc AK47, AK12 và RPK-Russia trong combo A. Thu thập đủ 6 báu vật này còn giúp
                            bạn được nhận thêm Golden Soccer Ball và AWM-Red Stripe, cả 2 đều là báu vật ẩn rất
                            hiếm, được nhiều nhà sưu tầm báu vật săn lùng.
                        </p>
                        <img src="/client/images/blog-detail-1.png" alt="">
                        <p>
                            QCMM Russian Classic với 6 báu vật hấp dẫn.

                            Tuy nhiên, cộng đồng Đột Kích đang dồn sự chú ý vào Gói vũ khí I sẽ được mở bán trong
                            cập nhật này: Ngoài búp bê, skin C4, Lựu đạn Âm Dương, killmark Blue Neon, thì gói I còn
                            chứa khẩu AK47-Trumpet, hay nhiều game thủ còn gọi là “súng kèn” vì ngoại hình y hệt một
                            cây kèn trumpet thông thường. Khẩu súng này là đối trọng của M4A1-Guitar, cải trang dưới
                            dạng một nhạc cụ vô hại nhưng sở hữu hỏa lực lớn, độ chính xác cao và có tiếng súng,
                            thao tác “độc”, không lặp lại của các khẩu AK cũ. Khi tiêu diệt kẻ địch, súng còn có
                            hiệu ứng “vũ điệu chết chóc” buộc đối thủ phải “nhảy múa” trước khi gục ngã, khá vui
                            nhộn.
                        </p>
                        <img src="/client/images/blog-detail-1.png" alt="">
                        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Aut ipsam nobis, laborum, nemo natus numquam est enim quo debitis distinctio omnis. Beatae hic, quasi temporibus vero blanditiis inventore impedit dicta!</p>
                   ', CAST(N'2021-08-13T10:02:12.000' AS DateTime), 3, N'/client/images/blog-1.jpg')
INSERT [dbo].[Blog] ([Id], [Name], [MetaTitle], [Description], [CreatedDate], [BlogTypeId], [Image]) VALUES (6, N'chung', N'', N'', CAST(N'2021-08-13T12:31:34.260' AS DateTime), 2, N'')
INSERT [dbo].[Blog] ([Id], [Name], [MetaTitle], [Description], [CreatedDate], [BlogTypeId], [Image]) VALUES (7, N'chung', N'', N'', CAST(N'2021-08-13T12:31:34.260' AS DateTime), 2, N'')
INSERT [dbo].[Blog] ([Id], [Name], [MetaTitle], [Description], [CreatedDate], [BlogTypeId], [Image]) VALUES (8, N'chung', N'', N'', CAST(N'2021-08-13T12:31:34.260' AS DateTime), 2, N'')
INSERT [dbo].[Blog] ([Id], [Name], [MetaTitle], [Description], [CreatedDate], [BlogTypeId], [Image]) VALUES (9, N'chung', N'', N'', CAST(N'2021-08-13T12:31:34.260' AS DateTime), 2, N'')
INSERT [dbo].[Blog] ([Id], [Name], [MetaTitle], [Description], [CreatedDate], [BlogTypeId], [Image]) VALUES (10, N'chung', N'', N'', CAST(N'2021-08-13T12:31:34.260' AS DateTime), 2, N'')
INSERT [dbo].[Blog] ([Id], [Name], [MetaTitle], [Description], [CreatedDate], [BlogTypeId], [Image]) VALUES (11, N'chung', N'', N'', CAST(N'2021-08-13T12:31:34.260' AS DateTime), 2, N'')
INSERT [dbo].[Blog] ([Id], [Name], [MetaTitle], [Description], [CreatedDate], [BlogTypeId], [Image]) VALUES (12, N'chung', N'', N'', CAST(N'2021-08-13T12:31:34.260' AS DateTime), 2, N'')
INSERT [dbo].[Blog] ([Id], [Name], [MetaTitle], [Description], [CreatedDate], [BlogTypeId], [Image]) VALUES (13, N'chung', N'', N'', CAST(N'2021-08-13T12:31:34.260' AS DateTime), 2, N'')
INSERT [dbo].[Blog] ([Id], [Name], [MetaTitle], [Description], [CreatedDate], [BlogTypeId], [Image]) VALUES (14, N'chung', N'', N'', CAST(N'2021-08-13T12:31:34.260' AS DateTime), 2, N'')
INSERT [dbo].[Blog] ([Id], [Name], [MetaTitle], [Description], [CreatedDate], [BlogTypeId], [Image]) VALUES (15, N'chung', N'k''l', N'<p>k&#39;</p>
', CAST(N'2021-08-13T12:31:34.260' AS DateTime), 2, N'/Admin/Content/Upload/120210823155822avatar.png')
INSERT [dbo].[Blog] ([Id], [Name], [MetaTitle], [Description], [CreatedDate], [BlogTypeId], [Image]) VALUES (16, N'chung', N'', N'', CAST(N'2021-08-13T12:31:34.260' AS DateTime), 1, N'')
INSERT [dbo].[Blog] ([Id], [Name], [MetaTitle], [Description], [CreatedDate], [BlogTypeId], [Image]) VALUES (17, N'chung', N'', N'', CAST(N'2021-08-13T12:31:34.273' AS DateTime), 1, N'')
INSERT [dbo].[Blog] ([Id], [Name], [MetaTitle], [Description], [CreatedDate], [BlogTypeId], [Image]) VALUES (18, N'chung', N'', N'', CAST(N'2021-08-13T12:31:34.273' AS DateTime), 1, N'')
INSERT [dbo].[Blog] ([Id], [Name], [MetaTitle], [Description], [CreatedDate], [BlogTypeId], [Image]) VALUES (19, N'chung', N'', N'', CAST(N'2021-08-13T12:31:34.273' AS DateTime), 1, N'')
INSERT [dbo].[Blog] ([Id], [Name], [MetaTitle], [Description], [CreatedDate], [BlogTypeId], [Image]) VALUES (20, N'chung', N'', N'', CAST(N'2021-08-13T12:31:34.273' AS DateTime), 1, N'')
INSERT [dbo].[Blog] ([Id], [Name], [MetaTitle], [Description], [CreatedDate], [BlogTypeId], [Image]) VALUES (21, N'chung', N'', N'', CAST(N'2021-08-13T12:31:34.273' AS DateTime), 1, N'')
INSERT [dbo].[Blog] ([Id], [Name], [MetaTitle], [Description], [CreatedDate], [BlogTypeId], [Image]) VALUES (22, N'chung', N'', N'', CAST(N'2021-08-13T12:31:34.273' AS DateTime), 1, N'')
INSERT [dbo].[Blog] ([Id], [Name], [MetaTitle], [Description], [CreatedDate], [BlogTypeId], [Image]) VALUES (23, N'chung', N'', N'', CAST(N'2021-08-13T12:31:34.273' AS DateTime), 1, N'')
INSERT [dbo].[Blog] ([Id], [Name], [MetaTitle], [Description], [CreatedDate], [BlogTypeId], [Image]) VALUES (24, N'chung', N'', N'', CAST(N'2021-08-13T12:31:34.273' AS DateTime), 1, N'')
INSERT [dbo].[Blog] ([Id], [Name], [MetaTitle], [Description], [CreatedDate], [BlogTypeId], [Image]) VALUES (25, N'chung', N'', N'', CAST(N'2021-08-13T12:31:34.273' AS DateTime), 1, N'')
INSERT [dbo].[Blog] ([Id], [Name], [MetaTitle], [Description], [CreatedDate], [BlogTypeId], [Image]) VALUES (26, N'chung', N'', N'', CAST(N'2021-08-13T12:31:34.273' AS DateTime), 1, N'')
INSERT [dbo].[Blog] ([Id], [Name], [MetaTitle], [Description], [CreatedDate], [BlogTypeId], [Image]) VALUES (27, N'chung', N'', N'', CAST(N'2021-08-13T12:31:34.273' AS DateTime), 1, N'')
INSERT [dbo].[Blog] ([Id], [Name], [MetaTitle], [Description], [CreatedDate], [BlogTypeId], [Image]) VALUES (28, N'chung', N'', N'', CAST(N'2021-08-13T12:31:34.273' AS DateTime), 1, N'')
INSERT [dbo].[Blog] ([Id], [Name], [MetaTitle], [Description], [CreatedDate], [BlogTypeId], [Image]) VALUES (29, N'chung', N'', N'', CAST(N'2021-08-13T12:31:34.273' AS DateTime), 1, N'')
INSERT [dbo].[Blog] ([Id], [Name], [MetaTitle], [Description], [CreatedDate], [BlogTypeId], [Image]) VALUES (30, N'chung', N'', N'', CAST(N'2021-08-13T12:31:34.273' AS DateTime), 1, N'')
INSERT [dbo].[Blog] ([Id], [Name], [MetaTitle], [Description], [CreatedDate], [BlogTypeId], [Image]) VALUES (31, N'chung', N'', N'', CAST(N'2021-08-13T12:31:34.273' AS DateTime), 1, N'')
INSERT [dbo].[Blog] ([Id], [Name], [MetaTitle], [Description], [CreatedDate], [BlogTypeId], [Image]) VALUES (32, N'chung', N'', N'', CAST(N'2021-08-13T12:31:34.273' AS DateTime), 1, N'')
INSERT [dbo].[Blog] ([Id], [Name], [MetaTitle], [Description], [CreatedDate], [BlogTypeId], [Image]) VALUES (33, N'chung', N'', N'', CAST(N'2021-08-13T12:31:34.273' AS DateTime), 1, N'')
INSERT [dbo].[Blog] ([Id], [Name], [MetaTitle], [Description], [CreatedDate], [BlogTypeId], [Image]) VALUES (34, N'chung', N'', N'', CAST(N'2021-08-13T12:31:34.273' AS DateTime), 1, N'')
INSERT [dbo].[Blog] ([Id], [Name], [MetaTitle], [Description], [CreatedDate], [BlogTypeId], [Image]) VALUES (35, N'chung', N'', N'', CAST(N'2021-08-13T12:31:44.573' AS DateTime), 1, N'')
INSERT [dbo].[Blog] ([Id], [Name], [MetaTitle], [Description], [CreatedDate], [BlogTypeId], [Image]) VALUES (36, N'Khuất Văn Chung', N'123123', N'<p>123123123111</p>
', CAST(N'2021-08-13T12:33:56.537' AS DateTime), 4, N'/Admin/Content/Upload/120210813123405avatar.png')
INSERT [dbo].[Blog] ([Id], [Name], [MetaTitle], [Description], [CreatedDate], [BlogTypeId], [Image]) VALUES (43, N't1', N'111', N'<p>1111</p>
', CAST(N'2021-08-27T22:52:05.300' AS DateTime), 2, N'/Admin/Content/images/no-image-available-thumb(1349x760-crop).jpg')
SET IDENTITY_INSERT [dbo].[Blog] OFF
GO
SET IDENTITY_INSERT [dbo].[BlogType] ON 

INSERT [dbo].[BlogType] ([BlogTypeId], [Name]) VALUES (2, N'Hướng dẫn')
INSERT [dbo].[BlogType] ([BlogTypeId], [Name]) VALUES (3, N'Tin game')
SET IDENTITY_INSERT [dbo].[BlogType] OFF
GO
SET IDENTITY_INSERT [dbo].[CardAdmin] ON 

INSERT [dbo].[CardAdmin] ([Id], [CardNumber], [CardType], [CardHolder], [CardBranch], [BankName]) VALUES (2, N'0491000161234', N'1', N'Hồ Long nhật', N'Hà Nội', N'VPbank')
INSERT [dbo].[CardAdmin] ([Id], [CardNumber], [CardType], [CardHolder], [CardBranch], [BankName]) VALUES (3, N'1507205852938', N'1', N'Ho long nhat', N'Hà Nội', N'Vietconbank')
INSERT [dbo].[CardAdmin] ([Id], [CardNumber], [CardType], [CardHolder], [CardBranch], [BankName]) VALUES (4, N'nhat123', N'2', N'nhat123', NULL, N'Tsr (thesieure .com)')
INSERT [dbo].[CardAdmin] ([Id], [CardNumber], [CardType], [CardHolder], [CardBranch], [BankName]) VALUES (5, N'nhat123', N'2', N'Hồ Long Nhật', NULL, N'Azpro (azpro .vn)')
INSERT [dbo].[CardAdmin] ([Id], [CardNumber], [CardType], [CardHolder], [CardBranch], [BankName]) VALUES (6, N'0866721300', N'2', N'Hồ Long Nhật', N'.', N'Ví momo')
SET IDENTITY_INSERT [dbo].[CardAdmin] OFF
GO
SET IDENTITY_INSERT [dbo].[GiaTriThe] ON 

INSERT [dbo].[GiaTriThe] ([Id], [Name], [Value], [Percent]) VALUES (1, N'Mười nghìn ', CAST(10000 AS Decimal(18, 0)), CAST(70 AS Decimal(18, 0)))
INSERT [dbo].[GiaTriThe] ([Id], [Name], [Value], [Percent]) VALUES (2, NULL, CAST(20000 AS Decimal(18, 0)), CAST(70 AS Decimal(18, 0)))
INSERT [dbo].[GiaTriThe] ([Id], [Name], [Value], [Percent]) VALUES (3, NULL, CAST(30000 AS Decimal(18, 0)), CAST(70 AS Decimal(18, 0)))
INSERT [dbo].[GiaTriThe] ([Id], [Name], [Value], [Percent]) VALUES (4, NULL, CAST(50000 AS Decimal(18, 0)), CAST(70 AS Decimal(18, 0)))
INSERT [dbo].[GiaTriThe] ([Id], [Name], [Value], [Percent]) VALUES (5, N'Một trăm nghìn', CAST(100000 AS Decimal(18, 0)), CAST(70 AS Decimal(18, 0)))
INSERT [dbo].[GiaTriThe] ([Id], [Name], [Value], [Percent]) VALUES (6, N'Hai trăm nghìn', CAST(200000 AS Decimal(18, 0)), CAST(70 AS Decimal(18, 0)))
INSERT [dbo].[GiaTriThe] ([Id], [Name], [Value], [Percent]) VALUES (7, N'Năm trăm nghìn', CAST(500000 AS Decimal(18, 0)), CAST(70 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[GiaTriThe] OFF
GO
SET IDENTITY_INSERT [dbo].[MasterData] ON 

INSERT [dbo].[MasterData] ([Id], [Code], [Name], [Value]) VALUES (1, NULL, N'Message plugin', N'<!-- Messenger Plugin chat Code -->     <div id="fb-root"></div>      <!-- Your Plugin chat code -->     <div id="fb-customer-chat" class="fb-customerchat">     </div>      <script>       var chatbox = document.getElementById(''fb-customer-chat'');       chatbox.setAttribute("page_id", "108734941541385");       chatbox.setAttribute("attribution", "biz_inbox");        window.fbAsyncInit = function() {         FB.init({           xfbml            : true,           version          : ''v11.0''         });       };        (function(d, s, id) {         var js, fjs = d.getElementsByTagName(s)[0];         if (d.getElementById(id)) return;         js = d.createElement(s); js.id = id;         js.src = ''https://connect.facebook.net/vi_VN/sdk/xfbml.customerchat.js'';         fjs.parentNode.insertBefore(js, fjs);       }(document, ''script'', ''facebook-jssdk''));     </script>')
INSERT [dbo].[MasterData] ([Id], [Code], [Name], [Value]) VALUES (3, NULL, N'Số điện thoại', N'0359345952')
INSERT [dbo].[MasterData] ([Id], [Code], [Name], [Value]) VALUES (4, N'Image', N'Logo', N'/Admin/Content/Upload/120210903220403logo.png')
INSERT [dbo].[MasterData] ([Id], [Code], [Name], [Value]) VALUES (5, N'backgroud', N'Hình nền', N'/Admin/Content/Upload/120210911232908white-background-2.jpg')
SET IDENTITY_INSERT [dbo].[MasterData] OFF
GO
SET IDENTITY_INSERT [dbo].[NaptheTransaction] ON 

INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (1, 1, 1, N'523416541', N'354651324', CAST(0 AS Decimal(18, 0)), N'Nạp tự động', N'1', CAST(N'2021-08-21T10:52:33.587' AS DateTime), 1, 1)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (2, 3, 2, N'3242234234234', N'234234234234', NULL, NULL, N'15', CAST(N'2021-08-23T21:38:04.070' AS DateTime), 0, 1)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (3, 1, 1, N'123123', N'123123', NULL, NULL, N'15', CAST(N'2021-08-23T21:47:38.803' AS DateTime), 0, 1)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (4, 1, 1, N'123123', N'123123', NULL, NULL, N'15', CAST(N'2021-08-23T21:47:40.697' AS DateTime), 0, 1)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (5, 1, 1, N'123123', N'123123', NULL, NULL, N'15', CAST(N'2021-08-23T21:47:42.557' AS DateTime), 0, 1)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (6, 1, 1, N'123123', N'123123', NULL, NULL, N'15', CAST(N'2021-08-23T21:47:59.217' AS DateTime), 0, 1)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (7, 1, 1, N'2313423242', N'2342344234', NULL, NULL, N'15', CAST(N'2021-08-23T22:47:17.743' AS DateTime), 0, 1)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (8, 1, 1, N'624547286728635', N'20000153945655', NULL, NULL, N'15', CAST(N'2021-08-23T22:51:28.500' AS DateTime), 0, 0)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (9, 1, 1, N'24324234', N'2342344', NULL, NULL, N'15', CAST(N'2021-08-23T22:54:06.987' AS DateTime), 0, 0)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (10, 1, 1, N'2334324432234', N'23424234234', NULL, NULL, N'15', CAST(N'2021-08-23T22:58:20.573' AS DateTime), 0, 0)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (11, 1, 1, N'344234', N'234234', NULL, NULL, N'15', CAST(N'2021-08-23T23:00:33.287' AS DateTime), 0, 0)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (12, 1, 1, N'324543345345', N'34453453455', NULL, NULL, N'15', CAST(N'2021-08-23T23:05:54.983' AS DateTime), 0, 0)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (13, 1, 1, N'324543345345', N'34453453455', NULL, NULL, N'15', CAST(N'2021-08-23T23:05:58.140' AS DateTime), 0, 1)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (14, 1, 1, N'324543345345', N'34453453455', NULL, NULL, N'15', CAST(N'2021-08-23T23:05:59.297' AS DateTime), 0, 1)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (15, 1, 1, N'324543345345', N'34453453455', NULL, NULL, N'15', CAST(N'2021-08-23T23:05:59.487' AS DateTime), 0, 1)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (16, 1, 1, N'324543345345', N'34453453455', NULL, NULL, N'15', CAST(N'2021-08-23T23:05:59.673' AS DateTime), 0, 0)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (17, 1, 1, N'324543345345', N'34453453455', NULL, NULL, N'15', CAST(N'2021-08-23T23:06:09.440' AS DateTime), 0, 1)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (18, 1, 1, N'324543345345', N'34453453455', NULL, NULL, N'15', CAST(N'2021-08-23T23:06:17.237' AS DateTime), 0, 0)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (19, 1, 2, N'12343423243324', N'23423423432434', NULL, NULL, N'15', CAST(N'2021-08-23T23:26:05.173' AS DateTime), 0, 1)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (20, 1, 2, N'12343423243324', N'23423423432434', NULL, NULL, N'15', CAST(N'2021-08-23T23:26:15.203' AS DateTime), 0, 1)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (21, 1, 1, N'23424234543', N'34534354534', NULL, NULL, N'15', CAST(N'2021-08-23T23:32:20.047' AS DateTime), 0, 1)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (22, 1, 1, N'624547286728635', N'20000153945655', NULL, NULL, N'15', CAST(N'2021-08-24T00:52:42.647' AS DateTime), 0, 1)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (23, 1, 1, N'624547286728635', N'20000153945655', NULL, NULL, N'15', CAST(N'2021-08-24T01:02:28.110' AS DateTime), 0, 1)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (24, 1, 1, N'624547286728635', N'20000153945655', NULL, NULL, N'15', CAST(N'2021-08-24T01:19:38.227' AS DateTime), 0, 1)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (25, 1, 1, N'624547286728635', N'20000153945655', NULL, NULL, N'15', CAST(N'2021-08-24T01:19:48.260' AS DateTime), 0, 0)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (26, 1, 1, N'624547286728635', N'20000153945655', NULL, NULL, N'15', CAST(N'2021-08-24T01:20:07.680' AS DateTime), 0, 1)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (27, 1, 1, N'624547286728635', N'20000153945655', NULL, NULL, N'15', CAST(N'2021-08-24T01:23:57.300' AS DateTime), 0, 1)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (28, 1, 1, N'624547286728635', N'20000153945655', NULL, NULL, N'15', CAST(N'2021-08-24T01:27:23.930' AS DateTime), 0, 1)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (29, 1, 1, N'4245453453534', N'3455345345534', NULL, NULL, N'15', CAST(N'2021-08-24T09:47:51.770' AS DateTime), 0, 1)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (35, 1, 1, N'123213123324', N'234234234234', NULL, NULL, N'15', CAST(N'2021-08-24T22:54:04.453' AS DateTime), 0, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (36, 1, 1, N'12343245435', N'34534524324', NULL, NULL, N'15', CAST(N'2021-08-24T22:55:23.210' AS DateTime), 0, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (37, 1, 1, N'123435345345', N'23425435345', NULL, NULL, N'15', CAST(N'2021-08-24T22:56:26.183' AS DateTime), 0, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (38, 1, 1, N'12312343242', N'234234234432', NULL, NULL, N'15', CAST(N'2021-08-25T16:08:15.173' AS DateTime), 0, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (39, 1, 1, N'23432534234', N'2342342342', NULL, NULL, N'15', CAST(N'2021-08-25T16:11:51.053' AS DateTime), 0, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (40, 1, 1, N'2323423435435', N'2342344342342', NULL, NULL, N'15', CAST(N'2021-08-25T16:14:05.107' AS DateTime), 0, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (41, 1, 2, N'32423435434354', N'234234343553455', NULL, NULL, N'15', CAST(N'2021-08-25T16:16:59.950' AS DateTime), 0, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (42, 1, 1, N'624547286728635', N'20000153945655', NULL, NULL, N'15', CAST(N'2021-08-25T16:19:03.817' AS DateTime), 0, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (43, 1, 1, N'624547286728635', N'20000153945655', NULL, NULL, N'15', CAST(N'2021-08-25T16:23:21.920' AS DateTime), 0, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (44, 1, 1, N'1233', N'1231233', NULL, NULL, N'15', CAST(N'2021-08-25T16:24:45.443' AS DateTime), 0, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (45, 1, 1, N'23123', N'234234234', NULL, NULL, N'15', CAST(N'2021-08-25T16:29:36.080' AS DateTime), 0, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (46, 1, 1, N'213123123', N'234234243', NULL, NULL, N'15', CAST(N'2021-08-25T16:31:48.480' AS DateTime), 0, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (47, 1, 1, N'24234234', N'234234234', NULL, NULL, N'15', CAST(N'2021-08-25T16:34:42.510' AS DateTime), 0, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (48, 1, 1, N'24345345345345', N'3543534534535', NULL, NULL, N'15', CAST(N'2021-08-25T16:40:27.977' AS DateTime), 0, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (49, 1, 1, N'624547286728635', N'20000153945655', NULL, NULL, N'15', CAST(N'2021-08-25T17:03:02.460' AS DateTime), 0, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (50, 1, 1, N'34324354345', N'354345345345', NULL, NULL, N'15', CAST(N'2021-08-25T17:07:28.060' AS DateTime), 0, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (51, 1, 1, N'624547286728635', N'20000153945655', NULL, NULL, N'15', CAST(N'2021-08-25T17:40:40.767' AS DateTime), 0, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (52, 1, 1, N'624547286728635', N'20000153945655', NULL, NULL, N'15', CAST(N'2021-08-25T17:45:51.620' AS DateTime), 0, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (53, 1, 1, N'624547286728635', N'20000153945655', NULL, NULL, N'15', CAST(N'2021-08-25T17:46:13.263' AS DateTime), 0, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (54, 1, 1, N'624547286728635', N'20000153945655', NULL, NULL, N'15', CAST(N'2021-08-25T17:50:20.283' AS DateTime), 0, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (55, 1, 1, N'624547286728635', N'20000153945655', NULL, NULL, N'15', CAST(N'2021-08-25T17:59:29.423' AS DateTime), 0, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (56, 1, 1, N'3454354324234', N'234243243424', NULL, NULL, N'15', CAST(N'2021-08-25T18:17:31.697' AS DateTime), 0, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (57, 1, 1, N'2222224584148', N'5114946616', NULL, NULL, N'15', CAST(N'2021-08-25T19:37:39.710' AS DateTime), 0, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (58, 1, 1, N'2222224584148', N'5114946616', NULL, NULL, N'15', CAST(N'2021-08-25T19:37:40.977' AS DateTime), 0, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (59, 1, 1, N'2222224584148', N'5114946616', NULL, NULL, N'15', CAST(N'2021-08-25T19:37:41.180' AS DateTime), 0, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (60, 1, 1, N'2222224584148', N'5114946616', NULL, NULL, N'15', CAST(N'2021-08-25T19:37:41.350' AS DateTime), 0, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (61, 1, 1, N'123123123123', N'123123123123', NULL, NULL, N'15', CAST(N'2021-08-25T20:44:46.450' AS DateTime), 0, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (62, 1, 1, N'624547286728635', N'20000153945655', NULL, NULL, N'15', CAST(N'2021-08-25T20:45:48.140' AS DateTime), 0, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (63, 1, 1, N'624547286728635', N'20000153945655', NULL, NULL, N'15', CAST(N'2021-08-25T20:47:20.697' AS DateTime), 0, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (64, 1, 3, N'z', N'a', CAST(0 AS Decimal(18, 0)), NULL, N'16', CAST(N'2021-08-27T22:31:24.363' AS DateTime), 100, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (65, 1, 3, N'z', N'a', CAST(0 AS Decimal(18, 0)), NULL, N'16', CAST(N'2021-08-27T22:31:33.913' AS DateTime), 100, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (66, 1, 1, N'801234', N'801234', CAST(0 AS Decimal(18, 0)), NULL, N'1', CAST(N'2021-08-28T12:46:48.840' AS DateTime), 100, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (67, 1, 1, N'801234', N'801234', CAST(0 AS Decimal(18, 0)), NULL, N'1', CAST(N'2021-08-28T12:47:00.247' AS DateTime), 100, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (68, 1, 4, N'34634256345', N'6345643564356', CAST(0 AS Decimal(18, 0)), NULL, N'1', CAST(N'2021-08-28T16:52:10.847' AS DateTime), 100, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (69, 1, 3, N'346', N'463', CAST(0 AS Decimal(18, 0)), NULL, N'1', CAST(N'2021-08-28T16:52:37.237' AS DateTime), 100, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (70, 1, 2, N'1243', N'13421423', CAST(0 AS Decimal(18, 0)), NULL, N'1', CAST(N'2021-08-28T16:56:32.950' AS DateTime), 100, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (71, 1, 2, N'4522330866328', N'53835832354', CAST(0 AS Decimal(18, 0)), NULL, N'1', CAST(N'2021-08-28T16:57:40.303' AS DateTime), 100, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (72, 1, 2, N'3456', N'3456345', CAST(0 AS Decimal(18, 0)), NULL, N'1', CAST(N'2021-08-28T16:58:39.280' AS DateTime), 100, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (73, 0, 0, NULL, NULL, CAST(0 AS Decimal(18, 0)), NULL, N'1', CAST(N'2021-08-28T17:01:28.573' AS DateTime), 100, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (74, 0, 0, NULL, NULL, CAST(0 AS Decimal(18, 0)), NULL, N'1', CAST(N'2021-08-28T17:05:57.307' AS DateTime), 100, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (75, 0, 0, NULL, NULL, CAST(0 AS Decimal(18, 0)), NULL, N'1', CAST(N'2021-08-28T17:06:05.603' AS DateTime), 100, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (76, 1, 2, N'4522330866328', N'53835832354', CAST(0 AS Decimal(18, 0)), NULL, N'1', CAST(N'2021-08-28T17:07:32.037' AS DateTime), 100, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (77, 1, 1, N'1234', N'4123', CAST(0 AS Decimal(18, 0)), NULL, N'1', CAST(N'2021-08-28T17:20:30.760' AS DateTime), 100, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (78, 1, 1, N'1234', N'4123', CAST(0 AS Decimal(18, 0)), NULL, N'1', CAST(N'2021-08-28T17:20:52.920' AS DateTime), 100, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (79, 1, 1, N'12341234', N'41235325', CAST(0 AS Decimal(18, 0)), NULL, N'1', CAST(N'2021-08-28T17:24:04.400' AS DateTime), 100, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (80, 1, 1, N'822830649349981', N'20000154636155', CAST(7000 AS Decimal(18, 0)), NULL, N'1', CAST(N'2021-08-28T17:25:08.300' AS DateTime), 99, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (81, 1, 1, N'12221212', N'12121212', CAST(0 AS Decimal(18, 0)), NULL, N'16', CAST(N'2021-08-28T21:47:18.387' AS DateTime), 100, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (82, 1, 1, N'12221212', N'12121212', CAST(0 AS Decimal(18, 0)), NULL, N'16', CAST(N'2021-08-28T21:47:20.230' AS DateTime), 100, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (83, 1, 1, N'12221212', N'12121212', CAST(0 AS Decimal(18, 0)), NULL, N'16', CAST(N'2021-08-28T21:47:21.853' AS DateTime), 100, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (84, 1, 1, N'12221212', N'12121212', CAST(0 AS Decimal(18, 0)), NULL, N'16', CAST(N'2021-08-28T21:47:22.213' AS DateTime), 100, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (85, 1, 1, N'12221212', N'12121212', CAST(0 AS Decimal(18, 0)), NULL, N'16', CAST(N'2021-08-28T21:47:22.230' AS DateTime), 100, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (86, 1, 1, N'12221212', N'12121212', CAST(0 AS Decimal(18, 0)), NULL, N'16', CAST(N'2021-08-28T21:47:23.043' AS DateTime), 100, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (87, 1, 1, N'12221212', N'12121212', CAST(0 AS Decimal(18, 0)), NULL, N'16', CAST(N'2021-08-28T21:47:23.247' AS DateTime), 100, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (88, 1, 1, N'12221212', N'12121212', CAST(0 AS Decimal(18, 0)), NULL, N'16', CAST(N'2021-08-28T21:47:23.433' AS DateTime), 100, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (89, 1, 1, N'12221212', N'12121212', CAST(0 AS Decimal(18, 0)), NULL, N'16', CAST(N'2021-08-28T21:47:23.933' AS DateTime), 100, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (90, 1, 1, N'12221212', N'12121212', CAST(0 AS Decimal(18, 0)), NULL, N'16', CAST(N'2021-08-28T21:47:38.310' AS DateTime), 100, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (91, 2, 1, N'098765432345', N'09876543223456', CAST(0 AS Decimal(18, 0)), NULL, N'16', CAST(N'2021-08-28T21:56:21.360' AS DateTime), 100, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (92, 2, 1, N'098765432345', N'09876543223456', CAST(0 AS Decimal(18, 0)), NULL, N'16', CAST(N'2021-08-28T21:56:23.157' AS DateTime), 100, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (93, 2, 1, N'0987654323451', N'09876543223456', CAST(0 AS Decimal(18, 0)), NULL, N'16', CAST(N'2021-08-28T22:00:26.803' AS DateTime), 100, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (94, 2, 1, N'0987654323451', N'0987654322345', CAST(0 AS Decimal(18, 0)), NULL, N'16', CAST(N'2021-08-28T22:00:32.600' AS DateTime), 100, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (95, 2, 1, N'0987654323451', N'0987654322345', CAST(0 AS Decimal(18, 0)), NULL, N'16', CAST(N'2021-08-28T22:01:08.900' AS DateTime), 100, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (96, 2, 1, N'0987654323451', N'0987654322345', CAST(0 AS Decimal(18, 0)), NULL, N'16', CAST(N'2021-08-28T22:16:47.097' AS DateTime), 100, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (97, 2, 1, N'0987654323451', N'098765432234512', CAST(0 AS Decimal(18, 0)), NULL, N'16', CAST(N'2021-08-28T22:19:00.967' AS DateTime), 100, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (98, 2, 1, N'098765432345112', N'098765432234512', CAST(0 AS Decimal(18, 0)), NULL, N'16', CAST(N'2021-08-28T22:19:06.703' AS DateTime), 100, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (99, 1, 1, N'0987654323451', N'0987654323451', CAST(7000 AS Decimal(18, 0)), NULL, N'16', CAST(N'2021-08-28T22:27:25.763' AS DateTime), 99, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (100, 1, 1, N'09876543234', N'0987654323451', CAST(0 AS Decimal(18, 0)), NULL, N'16', CAST(N'2021-08-28T22:28:17.363' AS DateTime), 100, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (101, 1, 1, N'0987654323487', N'0987654323451', CAST(7000 AS Decimal(18, 0)), NULL, N'16', CAST(N'2021-08-28T22:28:23.940' AS DateTime), 99, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (102, 1, 1, N'0987654323487aa', N'0987654323451', CAST(0 AS Decimal(18, 0)), NULL, N'16', CAST(N'2021-08-28T22:28:44.693' AS DateTime), 3, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (103, 4, 1, N'0987654323487aa', N'0987654323451', CAST(0 AS Decimal(18, 0)), NULL, N'16', CAST(N'2021-08-28T22:30:42.157' AS DateTime), 100, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (104, 4, 1, N'0987654323487', N'0987654323451', CAST(0 AS Decimal(18, 0)), NULL, N'16', CAST(N'2021-08-28T22:30:47.110' AS DateTime), 100, NULL)
GO
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (105, 4, 1, N'09876543234', N'0987654323451', CAST(0 AS Decimal(18, 0)), NULL, N'16', CAST(N'2021-08-28T22:30:53.220' AS DateTime), 100, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (106, 1, 1, N'0987654323412', N'0987654323451', CAST(7000 AS Decimal(18, 0)), NULL, N'16', CAST(N'2021-08-28T22:31:03.050' AS DateTime), 99, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (107, 4, 1, N'0987654323412', N'0987654323451', CAST(0 AS Decimal(18, 0)), NULL, N'16', CAST(N'2021-08-28T22:31:10.580' AS DateTime), 100, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (108, 1, 1, N'523416541', N'354651324', CAST(0 AS Decimal(18, 0)), NULL, N'1', CAST(N'2021-08-28T23:34:25.287' AS DateTime), 100, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (109, 1, 1, N'11223121231', N'12313123231', CAST(0 AS Decimal(18, 0)), NULL, N'16', CAST(N'2021-08-28T23:42:20.990' AS DateTime), 100, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (110, 1, 1, N'098765432', N'12313123', CAST(0 AS Decimal(18, 0)), NULL, N'16', CAST(N'2021-08-28T23:43:44.310' AS DateTime), 100, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (111, 1, 1, N'0987654323412', N'1231312312121', CAST(7000 AS Decimal(18, 0)), NULL, N'16', CAST(N'2021-08-28T23:44:26.603' AS DateTime), 99, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (112, 1, 2, N'1234567891111', N'1234567891111', CAST(14000 AS Decimal(18, 0)), NULL, N'1', CAST(N'2021-08-28T23:44:46.337' AS DateTime), 99, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (113, 1, 1, N'09876543234121', N'12313123121211', CAST(0 AS Decimal(18, 0)), NULL, N'16', CAST(N'2021-08-28T23:44:54.797' AS DateTime), 100, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (114, 1, 1, N'098765432341211', N'123131231212111', CAST(7000 AS Decimal(18, 0)), NULL, N'16', CAST(N'2021-08-28T23:44:59.233' AS DateTime), 99, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (115, 1, 1, N'0987654323412111', N'1231312312121111', CAST(0 AS Decimal(18, 0)), NULL, N'16', CAST(N'2021-08-28T23:45:04.360' AS DateTime), 100, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (116, 1, 1, N'0987654323412111', N'1231312312121111', CAST(0 AS Decimal(18, 0)), NULL, N'16', CAST(N'2021-08-28T23:56:01.700' AS DateTime), 100, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (117, 1, 1, N'098765432341211', N'123131231212111', CAST(0 AS Decimal(18, 0)), NULL, N'16', CAST(N'2021-08-28T23:56:10.300' AS DateTime), 100, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (118, 1, 1, N'0987654323412', N'1231312312121', CAST(0 AS Decimal(18, 0)), NULL, N'16', CAST(N'2021-08-28T23:56:21.683' AS DateTime), 100, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (119, 1, 1, N'0987654323412', N'0987654323451', CAST(0 AS Decimal(18, 0)), NULL, N'16', CAST(N'2021-08-28T23:56:33.200' AS DateTime), 100, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (120, 1, 1, N'0987654111412', N'0987654311151', CAST(7000 AS Decimal(18, 0)), NULL, N'16', CAST(N'2021-08-28T23:56:43.980' AS DateTime), 99, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (121, 1, 1, N'0987654111412', N'0987654311151', CAST(0 AS Decimal(18, 0)), NULL, N'16', CAST(N'2021-08-28T23:56:56.267' AS DateTime), 100, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (122, 1, 1, N'098765411141212', N'098765431115112', CAST(7000 AS Decimal(18, 0)), NULL, N'16', CAST(N'2021-08-28T23:57:42.380' AS DateTime), 99, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (123, 1, 1, N'09876541114121', N'09876543111511', CAST(0 AS Decimal(18, 0)), NULL, N'16', CAST(N'2021-08-28T23:57:47.117' AS DateTime), 100, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (124, 1, 1, N'09876541114120', N'09876543111510', CAST(0 AS Decimal(18, 0)), NULL, N'16', CAST(N'2021-08-28T23:57:58.710' AS DateTime), 100, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (125, 2, 1, N'098765411141205', N'098765431115105', CAST(0 AS Decimal(18, 0)), NULL, N'16', CAST(N'2021-08-28T23:58:06.460' AS DateTime), 100, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (126, 2, 1, N'09876541114120', N'09876543111', CAST(7000 AS Decimal(18, 0)), NULL, N'16', CAST(N'2021-08-29T00:09:38.777' AS DateTime), 99, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (127, 2, 1, N'09876541114120', N'09876543111', CAST(0 AS Decimal(18, 0)), NULL, N'16', CAST(N'2021-08-29T00:23:03.713' AS DateTime), 100, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (128, 1, 1, N'132412341234', N'132412341234', CAST(0 AS Decimal(18, 0)), NULL, N'1', CAST(N'2021-08-29T00:23:32.263' AS DateTime), 100, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (129, 1, 1, N'1234567891234', N'1234567891234', CAST(0 AS Decimal(18, 0)), NULL, N'1', CAST(N'2021-08-29T00:24:01.077' AS DateTime), 3, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (130, 1, 1, N'123456789123', N'123456789123', CAST(0 AS Decimal(18, 0)), NULL, N'1', CAST(N'2021-08-29T00:24:12.080' AS DateTime), 100, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (131, 1, 1, N'12345678912', N'12345678912', CAST(0 AS Decimal(18, 0)), NULL, N'1', CAST(N'2021-08-29T00:24:22.350' AS DateTime), 100, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (132, 1, 1, N'1234567891', N'1234567891', CAST(0 AS Decimal(18, 0)), NULL, N'1', CAST(N'2021-08-29T00:24:27.390' AS DateTime), 100, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (133, 1, 1, N'09876541114120', N'09876543111', CAST(0 AS Decimal(18, 0)), NULL, N'1', CAST(N'2021-08-29T00:25:37.570' AS DateTime), 100, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (134, 2, 1, N'09876543234129', N'09876543234129', CAST(7000 AS Decimal(18, 0)), NULL, N'16', CAST(N'2021-08-29T08:32:35.217' AS DateTime), 99, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (135, 2, 1, N'098765432341291', N'09876543234129', CAST(0 AS Decimal(18, 0)), NULL, N'16', CAST(N'2021-08-29T08:32:44.247' AS DateTime), 100, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (136, 2, 1, N'09876543234', N'09876543234129', CAST(0 AS Decimal(18, 0)), NULL, N'16', CAST(N'2021-08-29T08:32:51.293' AS DateTime), 100, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (137, 4, 1, N'0987654', N'09876543234129', CAST(0 AS Decimal(18, 0)), NULL, N'16', CAST(N'2021-08-29T08:33:01.453' AS DateTime), 100, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (138, 4, 1, N'098765411', N'09876543234129', CAST(0 AS Decimal(18, 0)), NULL, N'16', CAST(N'2021-08-29T08:33:07.437' AS DateTime), 100, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (139, 4, 1, N'098765411', N'09876543234129', CAST(0 AS Decimal(18, 0)), NULL, N'16', CAST(N'2021-08-29T08:33:16.240' AS DateTime), 100, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (140, 4, 1, N'09876541111', N'09876543234129', CAST(0 AS Decimal(18, 0)), NULL, N'16', CAST(N'2021-08-29T08:33:19.677' AS DateTime), 100, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (141, 3, 1, N'098765411111', N'09876543234129', CAST(7000 AS Decimal(18, 0)), NULL, N'16', CAST(N'2021-08-29T08:34:07.337' AS DateTime), 99, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (142, 3, 1, N'098765411111', N'09876543234129', CAST(0 AS Decimal(18, 0)), NULL, N'16', CAST(N'2021-08-29T08:34:13.493' AS DateTime), 100, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (143, 3, 1, N'09876541000', N'09876543234129', CAST(0 AS Decimal(18, 0)), NULL, N'16', CAST(N'2021-08-29T08:34:26.073' AS DateTime), 100, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (144, 2, 1, N'09876543290900', N'098765432234512', CAST(7000 AS Decimal(18, 0)), NULL, N'1', CAST(N'2021-08-29T08:57:11.597' AS DateTime), 99, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (145, 7, 1, N'123456789', N'123456789', CAST(0 AS Decimal(18, 0)), NULL, N'16', CAST(N'2021-08-29T08:59:56.703' AS DateTime), 100, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (146, 1, 1, N'1234567891234', N'1234567891234', CAST(0 AS Decimal(18, 0)), NULL, N'1', CAST(N'2021-08-29T18:43:16.750' AS DateTime), 100, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (147, 1, 1, N'1234567891234', N'1234567891234', CAST(0 AS Decimal(18, 0)), NULL, N'1', CAST(N'2021-08-29T18:44:08.110' AS DateTime), 100, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (148, 1, 1, N'1234567891234', N'1234567891234', CAST(0 AS Decimal(18, 0)), NULL, N'1', CAST(N'2021-08-29T18:46:15.713' AS DateTime), 100, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (149, 1, 2, N'1234567891234', N'1234567891234', CAST(0 AS Decimal(18, 0)), NULL, N'1', CAST(N'2021-08-29T18:47:02.833' AS DateTime), 100, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (150, 1, 2, N'1234567891234', N'1234567891234', CAST(0 AS Decimal(18, 0)), NULL, N'1', CAST(N'2021-08-29T18:47:06.043' AS DateTime), 100, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (151, 1, 2, N'1234567891234', N'1234567891234', CAST(0 AS Decimal(18, 0)), NULL, N'1', CAST(N'2021-08-29T18:47:08.697' AS DateTime), 100, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (152, 1, 1, N'1234567891234', N'1234567891234', CAST(0 AS Decimal(18, 0)), NULL, N'1', CAST(N'2021-08-29T18:48:23.523' AS DateTime), 100, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (153, 1, 1, N'1234567891234', N'1234567891234', CAST(0 AS Decimal(18, 0)), NULL, N'1', CAST(N'2021-08-29T18:48:27.337' AS DateTime), 100, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (154, 1, 1, N'1234567891234', N'1234567891234', CAST(0 AS Decimal(18, 0)), NULL, N'1', CAST(N'2021-08-29T18:48:29.777' AS DateTime), 100, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (155, 1, 1, N'1234567891234', N'1234567891234', CAST(0 AS Decimal(18, 0)), NULL, N'1', CAST(N'2021-08-29T18:54:16.720' AS DateTime), 100, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (156, 2, 1, N'09876543234127', N'09876788999', NULL, NULL, N'16', CAST(N'2021-08-29T21:07:22.457' AS DateTime), 99, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (157, 2, 1, N'09876543234127', N'09876788999', NULL, NULL, N'16', CAST(N'2021-08-29T21:07:36.910' AS DateTime), 100, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (158, 2, 1, N'09876543234127', N'09876788999', NULL, NULL, N'16', CAST(N'2021-08-29T21:07:46.333' AS DateTime), 100, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (159, 1, 1, N'09876543234127', N'09876788999', NULL, NULL, N'16', CAST(N'2021-08-29T21:08:29.123' AS DateTime), 100, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (160, 1, 1, N'09876543234127', N'09876788999', NULL, NULL, N'16', CAST(N'2021-08-29T21:08:38.410' AS DateTime), 100, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (161, 1, 1, N'0987654323412', N'09876788999', NULL, NULL, N'16', CAST(N'2021-08-29T21:09:08.977' AS DateTime), 99, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (162, 1, 1, N'0987654323412', N'09876788999', NULL, NULL, N'16', CAST(N'2021-08-29T21:09:20.357' AS DateTime), 100, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (163, 1, 1, N'098765432341287', N'09876788999', NULL, NULL, N'16', CAST(N'2021-08-29T21:09:49.563' AS DateTime), 99, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (164, 1, 1, N'09876543234111', N'09876788999', NULL, NULL, N'16', CAST(N'2021-08-29T21:10:20.937' AS DateTime), 100, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (165, 6, 1, N'098765 122', N'123123123', NULL, NULL, N'16', CAST(N'2021-08-29T21:14:05.703' AS DateTime), 100, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (166, 6, 1, N'098765122', N'123123123', NULL, NULL, N'16', CAST(N'2021-08-29T21:14:13.123' AS DateTime), 100, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (167, 6, 1, N'09876512222', N'123123123', NULL, NULL, N'16', CAST(N'2021-08-29T21:14:20.893' AS DateTime), 100, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (168, 7, 3, N'09876512222', N'123123123', NULL, NULL, N'16', CAST(N'2021-08-29T21:14:57.740' AS DateTime), 100, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (169, 2, 3, N'09876512222000', N'123123123', NULL, NULL, N'16', CAST(N'2021-08-29T21:15:25.283' AS DateTime), 99, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (170, 4, 3, N'09876512222000', N'123123123', NULL, NULL, N'16', CAST(N'2021-08-29T21:15:41.560' AS DateTime), 100, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (171, 4, 3, N'09876512222999', N'123123123', NULL, NULL, N'16', CAST(N'2021-08-29T21:15:47.493' AS DateTime), 100, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (172, 4, 3, N'09876512222999', N'123123123', NULL, NULL, N'16', CAST(N'2021-08-29T21:16:39.397' AS DateTime), 100, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (173, 4, 3, N'09876512222999', N'123123123', NULL, NULL, N'16', CAST(N'2021-08-29T21:18:39.733' AS DateTime), 100, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (174, 1, 1, N'12345687912345', N'12345678912345', NULL, NULL, N'1', CAST(N'2021-08-29T21:35:21.263' AS DateTime), 100, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (175, 1, 1, N'12345687912345', N'12345678912345', NULL, NULL, N'1', CAST(N'2021-08-29T21:35:29.683' AS DateTime), 100, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (176, 3, 1, N'123456879123', N'123456789123', NULL, NULL, N'1', CAST(N'2021-08-29T21:36:52.623' AS DateTime), 99, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (177, 4, 1, N'1234568791234563', N'12345678912346', NULL, NULL, N'1', CAST(N'2021-08-29T21:37:17.047' AS DateTime), 100, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (178, 1, 1, N'1234567891234', N'1234567891234', NULL, NULL, N'1', CAST(N'2021-08-29T21:38:04.783' AS DateTime), 100, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (179, 1, 1, N'1234567891234', N'1234567891234', NULL, NULL, N'1', CAST(N'2021-08-29T21:38:36.970' AS DateTime), 100, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (180, 1, 1, N'1234567891234', N'1234567891234', NULL, NULL, N'1', CAST(N'2021-08-29T21:38:42.570' AS DateTime), 100, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (181, 1, 1, N'7894561234567', N'1234567891234', NULL, NULL, N'1', CAST(N'2021-08-29T21:39:11.410' AS DateTime), 99, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (182, 1, 1, N'7894561234567', N'1234567891234', NULL, NULL, N'1', CAST(N'2021-08-29T21:39:21.150' AS DateTime), 100, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (183, 5, 1, N'7894561234567', N'1234567891234', NULL, NULL, N'1', CAST(N'2021-08-29T21:39:32.560' AS DateTime), 100, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (184, 5, 1, N'7894561234567', N'1234567891234', NULL, NULL, N'1', CAST(N'2021-08-29T21:40:06.417' AS DateTime), 100, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (185, 5, 1, N'7894561234567', N'1234567891234', NULL, NULL, N'1', CAST(N'2021-08-29T21:41:44.200' AS DateTime), 100, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (186, 5, 2, N'123412341342', N'123412341234', NULL, NULL, N'1', CAST(N'2021-08-29T21:46:48.197' AS DateTime), 3, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (187, 5, 2, N'123412341342', N'123412341234', NULL, NULL, N'1', CAST(N'2021-08-29T21:47:01.247' AS DateTime), 100, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (188, 5, 2, N'123412341342', N'123412341234', NULL, NULL, N'1', CAST(N'2021-08-29T21:47:09.730' AS DateTime), 100, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (189, 6, 3, N'011765989', N'0987654323451', NULL, NULL, N'16', CAST(N'2021-08-30T07:45:23.430' AS DateTime), 100, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (190, 3, 6, N'091215432341', N'098765432234512', NULL, NULL, N'16', CAST(N'2021-08-30T07:46:16.563' AS DateTime), 99, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (191, 1, 1, N'5299273766272', N'18287365399', NULL, NULL, N'16', CAST(N'2021-08-31T18:59:55.923' AS DateTime), 99, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (192, 4, 1, N'52992hhgh', N'18287365399', NULL, NULL, N'16', CAST(N'2021-08-31T19:00:43.180' AS DateTime), 100, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (193, 4, 1, N'52999983711', N'18287365399', NULL, NULL, N'16', CAST(N'2021-08-31T19:00:54.200' AS DateTime), 100, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (194, 2, 1, N'52999983711009', N'18287365399', NULL, NULL, N'16', CAST(N'2021-08-31T19:01:23.227' AS DateTime), 99, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (195, 1, 3, N'0987653456781', N'098765345678', NULL, NULL, N'16', CAST(N'2021-08-31T19:59:38.910' AS DateTime), 99, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (196, 2, 3, N'09876534567811', N'0987654323451', NULL, NULL, N'16', CAST(N'2021-08-31T20:00:12.640' AS DateTime), 99, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (197, 2, 3, N'09876534567811', N'0987654323451', NULL, NULL, N'16', CAST(N'2021-08-31T20:00:22.213' AS DateTime), 100, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (198, 3, 3, N'098765345678', N'0987654323451', NULL, NULL, N'16', CAST(N'2021-08-31T20:00:37.873' AS DateTime), 99, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (199, 5, 1, N'098765345678', N'0987654323451', NULL, NULL, N'16', CAST(N'2021-08-31T20:01:02.523' AS DateTime), 100, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (200, 5, 1, N'098765345', N'0987654323451', NULL, NULL, N'16', CAST(N'2021-08-31T20:01:11.493' AS DateTime), 99, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (201, 4, 1, N'098765345', N'0987654323451', NULL, NULL, N'16', CAST(N'2021-08-31T20:01:31.207' AS DateTime), 100, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (202, 4, 1, N'0987653098', N'0987654323451', NULL, NULL, N'16', CAST(N'2021-08-31T20:01:37.777' AS DateTime), 100, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (203, 4, 1, N'0987653098090876', N'0987654323451', NULL, NULL, N'16', CAST(N'2021-08-31T20:01:47.680' AS DateTime), 100, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (204, 4, 1, N'098765301', N'0987654323451', NULL, NULL, N'16', CAST(N'2021-08-31T20:01:56.430' AS DateTime), 100, NULL)
GO
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (205, 6, 1, N'098765301', N'0987654323451', NULL, NULL, N'16', CAST(N'2021-08-31T20:02:09.110' AS DateTime), 100, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (206, 6, 1, N'09876530112', N'0987654323451', NULL, NULL, N'16', CAST(N'2021-08-31T20:02:22.970' AS DateTime), 100, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (207, 7, 1, N'0987653009', N'0987654323451', NULL, NULL, N'16', CAST(N'2021-08-31T20:02:44.740' AS DateTime), 100, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (208, 7, 1, N'098765300', N'0987654323451', NULL, NULL, N'16', CAST(N'2021-08-31T20:02:50.207' AS DateTime), 100, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (209, 5, 1, N'09876511111', N'098765432000', NULL, NULL, N'16', CAST(N'2021-08-31T20:03:18.173' AS DateTime), 3, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (210, 5, 1, N'098765111', N'098765432000', NULL, NULL, N'16', CAST(N'2021-08-31T20:03:41.653' AS DateTime), 99, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (211, 5, 1, N'098765111', N'098765432000', NULL, NULL, N'16', CAST(N'2021-08-31T20:03:58.397' AS DateTime), 100, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (212, 5, 1, N'098765199', N'098765432000', NULL, NULL, N'16', CAST(N'2021-08-31T20:04:05.580' AS DateTime), 99, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (213, 1, 1, N'1111111111111', N'1111111111111', NULL, NULL, N'16', CAST(N'2021-08-31T20:23:22.060' AS DateTime), 100, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (214, 1, 1, N'1111111111111', N'1111111111111', NULL, NULL, N'16', CAST(N'2021-08-31T20:23:33.550' AS DateTime), 100, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (215, 1, 1, N'1111111111112', N'1111111111112', NULL, NULL, N'16', CAST(N'2021-08-31T20:23:44.240' AS DateTime), 100, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (216, 1, 1, N'091236543234121', N'098765433122122', NULL, NULL, N'16', CAST(N'2021-08-31T20:57:23.987' AS DateTime), 100, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (217, 1, 1, N'46942222555598', N'3333666454889', NULL, NULL, N'2', CAST(N'2021-08-31T21:33:35.030' AS DateTime), 100, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (218, 1, 1, N'46942222555598', N'333366645', NULL, NULL, N'2', CAST(N'2021-08-31T21:33:40.790' AS DateTime), 100, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (219, 1, 2, N'0991283813287', N'12312323123', NULL, NULL, N'16', CAST(N'2021-08-31T22:23:31.527' AS DateTime), 99, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (1081, 1, 1, N'12345678912313', N'123456791233', NULL, NULL, N'1', CAST(N'2021-09-01T15:33:06.477' AS DateTime), 100, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (1082, 1, 1, N'12345678912313', N'123456791233123', NULL, NULL, N'1', CAST(N'2021-09-01T15:33:08.547' AS DateTime), 100, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (1083, 1, 1, N'0982112736231', N'1232112414552', NULL, NULL, N'16', CAST(N'2021-09-01T21:38:14.387' AS DateTime), 99, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (1084, 1, 6, N'0987655678812', N'21245456765', NULL, NULL, N'16', CAST(N'2021-09-01T21:39:12.780' AS DateTime), 99, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (1085, 1, 1, N'513757731358935', N'10007404822934', CAST(7000 AS Decimal(18, 0)), NULL, N'1', CAST(N'2021-09-02T16:48:10.513' AS DateTime), 1, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (1086, 1, 1, N'12345678912312', N'12345678912312', NULL, NULL, N'1', CAST(N'2021-09-02T22:26:12.953' AS DateTime), 100, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (1087, 1, 1, N'12345673535435', N'12345678912312', NULL, NULL, N'1', CAST(N'2021-09-02T22:26:46.873' AS DateTime), 100, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (1088, 1, 1, N'12345673535435', N'12345678912312', NULL, NULL, N'1', CAST(N'2021-09-02T22:26:48.010' AS DateTime), 100, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (1089, 1, 1, N'10007404822934', N'513757731358935', NULL, NULL, N'1', CAST(N'2021-09-02T22:27:14.620' AS DateTime), 100, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (1090, 1, 2, N'10007404822934', N'513757731358935', NULL, NULL, N'1', CAST(N'2021-09-02T22:28:25.727' AS DateTime), 100, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (1091, 1, 1, N'829514760905280', N'20000149713499', NULL, NULL, N'1', CAST(N'2021-09-03T18:24:44.613' AS DateTime), 3, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (1092, 1, 1, N'829514760905280', N'20000149713499', NULL, NULL, N'1', CAST(N'2021-09-03T18:35:00.560' AS DateTime), 100, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (1093, 1, 1, N'829514760905280', N'20000149713499', NULL, NULL, N'1', CAST(N'2021-09-03T18:36:06.053' AS DateTime), 100, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (1094, 1, 1, N'621592747905158', N'20000154626903', CAST(7000 AS Decimal(18, 0)), NULL, N'1', CAST(N'2021-09-03T18:44:27.437' AS DateTime), 1, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (2083, 1, 1, N'10007404822934', N'12345678912312', NULL, NULL, N'2', CAST(N'2021-09-16T09:44:57.880' AS DateTime), 100, NULL)
INSERT [dbo].[NaptheTransaction] ([Id], [NCCId], [GiaTriTheId], [MaThe], [Serial], [ThucNhan], [KieuNap], [UserId], [CreatedDate], [Status], [OutIn]) VALUES (2084, 1, 2, N'12345673535435', N'513757731358935', NULL, NULL, N'2', CAST(N'2021-09-16T09:45:07.500' AS DateTime), 100, NULL)
SET IDENTITY_INSERT [dbo].[NaptheTransaction] OFF
GO
SET IDENTITY_INSERT [dbo].[NCC] ON 

INSERT [dbo].[NCC] ([Id], [Name]) VALUES (1, N'VIETTEL')
INSERT [dbo].[NCC] ([Id], [Name]) VALUES (2, N'VINAPHONE')
INSERT [dbo].[NCC] ([Id], [Name]) VALUES (3, N'MOBIFONE')
INSERT [dbo].[NCC] ([Id], [Name]) VALUES (4, N'VCOIN')
INSERT [dbo].[NCC] ([Id], [Name]) VALUES (5, N'GATE')
INSERT [dbo].[NCC] ([Id], [Name]) VALUES (6, N'ZING')
INSERT [dbo].[NCC] ([Id], [Name]) VALUES (7, N'GARENA')
SET IDENTITY_INSERT [dbo].[NCC] OFF
GO
SET IDENTITY_INSERT [dbo].[Notification] ON 

INSERT [dbo].[Notification] ([Id], [Content], [Image], [Status]) VALUES (2, N'<p style="text-align:center"><span style="color:#27ae60"><strong><span style="font-size:14px">CHÀO MỪNG CÁC BẠN ĐÃ ĐẾN VỚI SHOPTIENZOMBIE.VN</span></strong></span></p>

                <p style="text-align:center"><strong><span style="color:#000000">"</span><a href="" target="_blank"><span style="color:#f39c12">GIẢM GIÁ KHUNG GIỜ VÀNG</span></a><span style="color:#000000">" CỰC SỐC LÊN TỚI </span><span style="color:#ff0000">70%</span> <span style="color:#000000">DIỄN RA&nbsp;VÀO LÚC </span><span style="color:#ff0000">18H đến 20H THỨ 3,5,7</span> <span style="color:#000000">HÀNG TUẦN</span></strong></p>

                <p style="text-align:center"><strong><span style="color:#000000">AE NHANH TAY</span> <a href="" target="_blank"><span style="color:#f39c12">THAM GIA</span></a> <span style="color:#000000">ĐỂ SỞ HỮU NICK CF GIÁ SIÊU RẺ NHA</span></strong></p>
', N'/client/images/productType.gif', 1)
INSERT [dbo].[Notification] ([Id], [Content], [Image], [Status]) VALUES (3, N'<p style="text-align:center"><span style="color:#27ae60"><strong><span style="font-size:14px">CHÀO MỪNG CÁC BẠN ĐÃ ĐẾN VỚI SHOPTIENZOMBIE.VN</span></strong></span></p>

                <p style="text-align:center"><strong><span style="color:#000000">"</span><a href="" target="_blank"><span style="color:#f39c12">GIẢM GIÁ KHUNG GIỜ VÀNG</span></a><span style="color:#000000">" CỰC SỐC LÊN TỚI </span><span style="color:#ff0000">70%</span> <span style="color:#000000">DIỄN RA&nbsp;VÀO LÚC </span><span style="color:#ff0000">18H đến 20H THỨ 3,5,7</span> <span style="color:#000000">HÀNG TUẦN</span></strong></p>

                <p style="text-align:center"><strong><span style="color:#000000">AE NHANH TAY</span> <a href="" target="_blank"><span style="color:#f39c12">THAM GIA</span></a> <span style="color:#000000">ĐỂ SỞ HỮU NICK CF GIÁ SIÊU RẺ NHA</span></strong></p>
', N'/client/images/productType.gif', 0)
SET IDENTITY_INSERT [dbo].[Notification] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([Id], [Name], [Code], [Metatitle], [Description], [Image], [CategoryId], [Detail], [CreatedDate], [MetaDescription], [Status], [OrderNo], [Rank], [SoTuong], [SoTrangPhuc], [LoaiTaiKhoan], [NoiBat], [DangKy], [VIP], [Top], [AccUserName], [AccPassword], [IsBuyed]) VALUES (1, N'sản phẩm 1', N'', N'1', N'1', N'/client/images/toc-chien-1.jpg', 2, N'<p>123</p>
', CAST(N'2021-08-13T12:36:31.773' AS DateTime), N'1', 0, 1, N'vàng', N'100', N'1', N'garena', N'123', N'123', N'123', 1, N'acc123456', N'123456', NULL)
INSERT [dbo].[Product] ([Id], [Name], [Code], [Metatitle], [Description], [Image], [CategoryId], [Detail], [CreatedDate], [MetaDescription], [Status], [OrderNo], [Rank], [SoTuong], [SoTrangPhuc], [LoaiTaiKhoan], [NoiBat], [DangKy], [VIP], [Top], [AccUserName], [AccPassword], [IsBuyed]) VALUES (2, N'1', N'', N'', N'1', N'/client/images/toc-chien-1.jpg', 2, N'', CAST(N'2021-08-13T12:36:43.430' AS DateTime), N'', 0, 2, N'1', N'', N'', N'1', N'', N'1', N'', 0, N'1', N'1', NULL)
INSERT [dbo].[Product] ([Id], [Name], [Code], [Metatitle], [Description], [Image], [CategoryId], [Detail], [CreatedDate], [MetaDescription], [Status], [OrderNo], [Rank], [SoTuong], [SoTrangPhuc], [LoaiTaiKhoan], [NoiBat], [DangKy], [VIP], [Top], [AccUserName], [AccPassword], [IsBuyed]) VALUES (3, N'3', N'code3', N'1', N'123', N'/client/images/toc-chien-1.jpg', 1, N'<p>1</p>
', CAST(N'2021-08-13T12:37:06.663' AS DateTime), N'', 0, 1, N'1', N'1', N'1', N'1', N'1', N'1', N'1', 0, N'1', N'1', NULL)
INSERT [dbo].[Product] ([Id], [Name], [Code], [Metatitle], [Description], [Image], [CategoryId], [Detail], [CreatedDate], [MetaDescription], [Status], [OrderNo], [Rank], [SoTuong], [SoTrangPhuc], [LoaiTaiKhoan], [NoiBat], [DangKy], [VIP], [Top], [AccUserName], [AccPassword], [IsBuyed]) VALUES (4, N'4', N'code4', N'1', N'123', N'/client/images/toc-chien-1.jpg', 1, N'<p>1</p>
', CAST(N'2021-08-13T12:37:13.990' AS DateTime), N'', 1, 1, N'1', N'1', N'1', N'1', N'1', N'1', N'1', 0, N'1', N'1', NULL)
INSERT [dbo].[Product] ([Id], [Name], [Code], [Metatitle], [Description], [Image], [CategoryId], [Detail], [CreatedDate], [MetaDescription], [Status], [OrderNo], [Rank], [SoTuong], [SoTrangPhuc], [LoaiTaiKhoan], [NoiBat], [DangKy], [VIP], [Top], [AccUserName], [AccPassword], [IsBuyed]) VALUES (5, N'5', N'code5', N'12', N'23', N'/client/images/toc-chien-1.jpg', 2, N'<p>123123</p>
', CAST(N'2021-08-14T00:03:54.577' AS DateTime), N'132', 0, 0, N'132', N'123', N'123', N'123', N'123', N'132', N'123', 0, N'213', N'123', NULL)
INSERT [dbo].[Product] ([Id], [Name], [Code], [Metatitle], [Description], [Image], [CategoryId], [Detail], [CreatedDate], [MetaDescription], [Status], [OrderNo], [Rank], [SoTuong], [SoTrangPhuc], [LoaiTaiKhoan], [NoiBat], [DangKy], [VIP], [Top], [AccUserName], [AccPassword], [IsBuyed]) VALUES (9, N'test', N'', N'', N'test', N'/Admin/Content/Upload/120210828152916avatar.jpg', 0, N'', CAST(N'2021-08-28T15:29:23.860' AS DateTime), N'', 1, 0, N'1', N'', N'', N'1', N'', N'1', N'', 0, N'1', N'1', NULL)
INSERT [dbo].[Product] ([Id], [Name], [Code], [Metatitle], [Description], [Image], [CategoryId], [Detail], [CreatedDate], [MetaDescription], [Status], [OrderNo], [Rank], [SoTuong], [SoTrangPhuc], [LoaiTaiKhoan], [NoiBat], [DangKy], [VIP], [Top], [AccUserName], [AccPassword], [IsBuyed]) VALUES (10, N'test', N'', N'', N'1', N'/Admin/Content/Upload/120210828153019avatar.jpg', 0, N'<p>test</p>
', CAST(N'2021-08-28T15:30:26.303' AS DateTime), N'', 1, 0, N'1', N'', N'', N'1', N'', N'1', N'', 0, N'1', N'1', NULL)
INSERT [dbo].[Product] ([Id], [Name], [Code], [Metatitle], [Description], [Image], [CategoryId], [Detail], [CreatedDate], [MetaDescription], [Status], [OrderNo], [Rank], [SoTuong], [SoTrangPhuc], [LoaiTaiKhoan], [NoiBat], [DangKy], [VIP], [Top], [AccUserName], [AccPassword], [IsBuyed]) VALUES (11, N'test', N'', N'', N'ádadsd', N'/Admin/Content/images/no-image-available-thumb(1349x760-crop).jpg', 1, N'<p>adsadsad</p>
', CAST(N'2021-08-28T15:33:04.630' AS DateTime), N'', 1, 4, N'1', N'', N'', N'11111', N'', N'11111', N'', 0, N'12345', N'12345', NULL)
INSERT [dbo].[Product] ([Id], [Name], [Code], [Metatitle], [Description], [Image], [CategoryId], [Detail], [CreatedDate], [MetaDescription], [Status], [OrderNo], [Rank], [SoTuong], [SoTrangPhuc], [LoaiTaiKhoan], [NoiBat], [DangKy], [VIP], [Top], [AccUserName], [AccPassword], [IsBuyed]) VALUES (12, N'Queen1', N'', N'', N'1234', N'/Admin/Content/images/no-image-available-thumb(1349x760-crop).jpg', 2, N'<p>test</p>
', CAST(N'2021-08-31T20:42:47.010' AS DateTime), N'', 0, 1, N'bạch kim', N'', N'', N'1', N'', N'admin123', N'', 0, N'admin123', N'admin123', NULL)
INSERT [dbo].[Product] ([Id], [Name], [Code], [Metatitle], [Description], [Image], [CategoryId], [Detail], [CreatedDate], [MetaDescription], [Status], [OrderNo], [Rank], [SoTuong], [SoTrangPhuc], [LoaiTaiKhoan], [NoiBat], [DangKy], [VIP], [Top], [AccUserName], [AccPassword], [IsBuyed]) VALUES (1012, N'san pham 1', N'', N'1234', N'1234', N'/Admin/Content/Upload/120210912133646avatar.jpg', 2, N'<p>124</p>
', CAST(N'2021-09-12T13:36:46.817' AS DateTime), N'1342', 1, 10, N'vàng', N'123', N'123', N'garena', N'1', N'1', N'1', 1, N'acc1', N'pass1', NULL)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductCategory] ON 

INSERT [dbo].[ProductCategory] ([Id], [Name], [Image], [Description]) VALUES (1, N'CF', N'/client/images/productType.gif', N'game đột kích')
INSERT [dbo].[ProductCategory] ([Id], [Name], [Image], [Description]) VALUES (2, N'Liên Minh Tốc Chiến', N'/client/images/productType-2.gif', N'Liên Minh Huyền Thoại: Tốc Chiến hay rút gọn lại là Liên Minh: Tốc Chiến là một trò chơi điện tử moba
                5vs5 đấu trường trận chiến trực tuyến nhiều người chơi đã được ra mắt được phát triển và phát hành
                bởi Riot Games cho Android, iOS và máy chơi game cầm tay. Trò chơi là phiên bản di động của Liên
                Minh Huyền Thoại. Ở Việt Nam LMHT Tốc Chiến được phát hành bởi Vinagame.')
INSERT [dbo].[ProductCategory] ([Id], [Name], [Image], [Description]) VALUES (3, N'ádmmm', N'/client/images/productType.gif', N'ấdasd')
SET IDENTITY_INSERT [dbo].[ProductCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductImage] ON 

INSERT [dbo].[ProductImage] ([Id], [Image], [ProductId]) VALUES (10, N'/Admin/Content/Upload/120210812001033Screenshot (2).png', 0)
INSERT [dbo].[ProductImage] ([Id], [Image], [ProductId]) VALUES (11, N'/Admin/Content/Upload/120210812001033Screenshot (3).png', 0)
INSERT [dbo].[ProductImage] ([Id], [Image], [ProductId]) VALUES (12, N'/Admin/Content/Upload/120210812001033Screenshot (4).png', 0)
INSERT [dbo].[ProductImage] ([Id], [Image], [ProductId]) VALUES (13, N'/Admin/Content/Upload/120210812102148Screenshot (3).png', 5)
INSERT [dbo].[ProductImage] ([Id], [Image], [ProductId]) VALUES (14, N'/Admin/Content/Upload/120210812102148Screenshot (4).png', 5)
INSERT [dbo].[ProductImage] ([Id], [Image], [ProductId]) VALUES (15, N'/Admin/Content/Upload/120210812102148Screenshot (5).png', 5)
INSERT [dbo].[ProductImage] ([Id], [Image], [ProductId]) VALUES (26, N'/Admin/Content/Upload/120210812105528Screenshot (2).png', 3)
INSERT [dbo].[ProductImage] ([Id], [Image], [ProductId]) VALUES (27, N'/Admin/Content/Upload/120210812105528Screenshot (4).png', 3)
INSERT [dbo].[ProductImage] ([Id], [Image], [ProductId]) VALUES (28, N'/Admin/Content/Upload/120210812110217Screenshot (1).png', 3)
INSERT [dbo].[ProductImage] ([Id], [Image], [ProductId]) VALUES (37, N'/client/images/product-detail.jpg', 5)
INSERT [dbo].[ProductImage] ([Id], [Image], [ProductId]) VALUES (38, N'/client/images/product-detail.jpg', 5)
INSERT [dbo].[ProductImage] ([Id], [Image], [ProductId]) VALUES (39, N'/client/images/product-detail.jpg', 5)
INSERT [dbo].[ProductImage] ([Id], [Image], [ProductId]) VALUES (43, N'/Admin/Content/Upload/120210825183036background-đẹp-3-1024x682.jpg', 7)
INSERT [dbo].[ProductImage] ([Id], [Image], [ProductId]) VALUES (44, N'/Admin/Content/Upload/120210825183055Background-dep-vector.jpg', 7)
INSERT [dbo].[ProductImage] ([Id], [Image], [ProductId]) VALUES (65, N'/Admin/Content/Upload/120210828153019Chanh-tri-mun-removebg-preview.png', 10)
INSERT [dbo].[ProductImage] ([Id], [Image], [ProductId]) VALUES (80, N'/client/images/product-detail.jpg', 1)
INSERT [dbo].[ProductImage] ([Id], [Image], [ProductId]) VALUES (81, N'/Admin/Content/Upload/120210827235543product-detail.jpg', 1)
INSERT [dbo].[ProductImage] ([Id], [Image], [ProductId]) VALUES (82, N'/Admin/Content/Upload/120210827235837blog-2.jpg', 1)
INSERT [dbo].[ProductImage] ([Id], [Image], [ProductId]) VALUES (1080, N'/Admin/Content/Upload/120210828215303Chanh-tri-mun-removebg-preview.png', 2)
INSERT [dbo].[ProductImage] ([Id], [Image], [ProductId]) VALUES (1081, N'/Admin/Content/Upload/120210912133646toc-chien-1.jpg', 1012)
SET IDENTITY_INSERT [dbo].[ProductImage] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductPrice] ON 

INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Name], [CreatedDate], [Price]) VALUES (1, 5, N'786', CAST(N'2021-08-14T00:03:54.577' AS DateTime), CAST(1123 AS Decimal(18, 0)))
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Name], [CreatedDate], [Price]) VALUES (2, 1, N'78', CAST(N'2021-08-15T14:37:50.857' AS DateTime), CAST(6546 AS Decimal(18, 0)))
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Name], [CreatedDate], [Price]) VALUES (3, 1, N'786786', CAST(N'2021-08-16T10:55:15.540' AS DateTime), CAST(7000 AS Decimal(18, 0)))
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Name], [CreatedDate], [Price]) VALUES (4, 3, N'123', CAST(N'2021-08-16T15:56:14.573' AS DateTime), CAST(1000 AS Decimal(18, 0)))
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Name], [CreatedDate], [Price]) VALUES (5, 3, N'124', CAST(N'2021-08-16T15:56:31.370' AS DateTime), CAST(2000 AS Decimal(18, 0)))
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Name], [CreatedDate], [Price]) VALUES (6, 6, N'', CAST(N'2021-08-21T07:45:28.960' AS DateTime), CAST(122222 AS Decimal(18, 0)))
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Name], [CreatedDate], [Price]) VALUES (7, 7, N'', CAST(N'2021-08-25T18:29:10.820' AS DateTime), CAST(222 AS Decimal(18, 0)))
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Name], [CreatedDate], [Price]) VALUES (8, 2, N'ádfasdf', CAST(N'2021-08-26T11:45:20.953' AS DateTime), CAST(10000 AS Decimal(18, 0)))
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Name], [CreatedDate], [Price]) VALUES (9, 8, N'', CAST(N'2021-08-26T22:19:18.800' AS DateTime), CAST(100000 AS Decimal(18, 0)))
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Name], [CreatedDate], [Price]) VALUES (10, 9, N'', CAST(N'2021-08-28T15:29:23.877' AS DateTime), CAST(10 AS Decimal(18, 0)))
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Name], [CreatedDate], [Price]) VALUES (11, 10, N'', CAST(N'2021-08-28T15:30:26.303' AS DateTime), CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Name], [CreatedDate], [Price]) VALUES (12, 11, N'', CAST(N'2021-08-28T15:33:04.630' AS DateTime), CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Name], [CreatedDate], [Price]) VALUES (13, NULL, N'', CAST(N'2021-08-28T21:53:10.307' AS DateTime), CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Name], [CreatedDate], [Price]) VALUES (14, 12, N'', CAST(N'2021-08-31T20:42:47.067' AS DateTime), CAST(230000 AS Decimal(18, 0)))
INSERT [dbo].[ProductPrice] ([Id], [ProductId], [Name], [CreatedDate], [Price]) VALUES (1013, 1012, N'', CAST(N'2021-09-12T13:36:46.820' AS DateTime), CAST(10000 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[ProductPrice] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductTransaction] ON 

INSERT [dbo].[ProductTransaction] ([Id], [ProductType], [Name], [IdGame], [AccUserName], [AccPassword], [Price], [CreatedDate], [UserId], [EndBalance], [Content], [Status]) VALUES (1, 0, N'4231', NULL, N'taikhoan1', N'matkhau1', CAST(20000 AS Decimal(18, 0)), CAST(N'2021-08-21T10:47:51.570' AS DateTime), 1, CAST(10000 AS Decimal(18, 0)), N'vừa mua xong', 1)
INSERT [dbo].[ProductTransaction] ([Id], [ProductType], [Name], [IdGame], [AccUserName], [AccPassword], [Price], [CreatedDate], [UserId], [EndBalance], [Content], [Status]) VALUES (3, 0, N'456', NULL, N'taikhoan1', N'matkhau1', CAST(20000 AS Decimal(18, 0)), CAST(N'2021-08-22T10:47:51.570' AS DateTime), 1, CAST(10000 AS Decimal(18, 0)), N'vừa mua xong', 1)
INSERT [dbo].[ProductTransaction] ([Id], [ProductType], [Name], [IdGame], [AccUserName], [AccPassword], [Price], [CreatedDate], [UserId], [EndBalance], [Content], [Status]) VALUES (4, 1, N'ekko', NULL, NULL, NULL, CAST(30000 AS Decimal(18, 0)), CAST(N'2021-08-21T00:00:00.000' AS DateTime), 1, CAST(10000 AS Decimal(18, 0)), N'vừa mua xong', 0)
INSERT [dbo].[ProductTransaction] ([Id], [ProductType], [Name], [IdGame], [AccUserName], [AccPassword], [Price], [CreatedDate], [UserId], [EndBalance], [Content], [Status]) VALUES (5, 1, N'ekko bão cat', NULL, NULL, NULL, CAST(20000 AS Decimal(18, 0)), CAST(N'2021-08-22T00:00:00.000' AS DateTime), 1, CAST(10000 AS Decimal(18, 0)), N'vừa mua xong', 1)
INSERT [dbo].[ProductTransaction] ([Id], [ProductType], [Name], [IdGame], [AccUserName], [AccPassword], [Price], [CreatedDate], [UserId], [EndBalance], [Content], [Status]) VALUES (7, 0, N'1', NULL, N'taikhoan1', N'matkhau1', CAST(20000 AS Decimal(18, 0)), CAST(N'2021-08-26T00:00:00.000' AS DateTime), 1, CAST(10000 AS Decimal(18, 0)), N'vừa mua xong', 2)
INSERT [dbo].[ProductTransaction] ([Id], [ProductType], [Name], [IdGame], [AccUserName], [AccPassword], [Price], [CreatedDate], [UserId], [EndBalance], [Content], [Status]) VALUES (8, 0, N'12', NULL, N'tk3', N'mk3', CAST(2010 AS Decimal(18, 0)), CAST(N'2021-08-22T00:00:00.000' AS DateTime), 3, CAST(2000 AS Decimal(18, 0)), N'ascd', 0)
INSERT [dbo].[ProductTransaction] ([Id], [ProductType], [Name], [IdGame], [AccUserName], [AccPassword], [Price], [CreatedDate], [UserId], [EndBalance], [Content], [Status]) VALUES (9, 0, N'12', NULL, N'tk3', N'mk3', CAST(2010 AS Decimal(18, 0)), CAST(N'2021-08-24T14:56:47.243' AS DateTime), 3, CAST(2000 AS Decimal(18, 0)), N'ascd', 2)
INSERT [dbo].[ProductTransaction] ([Id], [ProductType], [Name], [IdGame], [AccUserName], [AccPassword], [Price], [CreatedDate], [UserId], [EndBalance], [Content], [Status]) VALUES (10, 0, N'12', NULL, N'tk4', N'mk4', CAST(2010 AS Decimal(18, 0)), CAST(N'2021-08-24T16:31:20.390' AS DateTime), 3, CAST(2000 AS Decimal(18, 0)), N'ascd', 1)
INSERT [dbo].[ProductTransaction] ([Id], [ProductType], [Name], [IdGame], [AccUserName], [AccPassword], [Price], [CreatedDate], [UserId], [EndBalance], [Content], [Status]) VALUES (11, 0, NULL, NULL, NULL, NULL, CAST(2000 AS Decimal(18, 0)), CAST(N'2021-08-24T20:33:00.020' AS DateTime), 15, CAST(998000 AS Decimal(18, 0)), N'', 1)
INSERT [dbo].[ProductTransaction] ([Id], [ProductType], [Name], [IdGame], [AccUserName], [AccPassword], [Price], [CreatedDate], [UserId], [EndBalance], [Content], [Status]) VALUES (12, 0, NULL, NULL, N'1', N'123', CAST(7000 AS Decimal(18, 0)), CAST(N'2021-08-24T20:35:02.920' AS DateTime), 15, CAST(991000 AS Decimal(18, 0)), N'', 1)
INSERT [dbo].[ProductTransaction] ([Id], [ProductType], [Name], [IdGame], [AccUserName], [AccPassword], [Price], [CreatedDate], [UserId], [EndBalance], [Content], [Status]) VALUES (13, 1, N'Ekko', N'tobi1012', NULL, NULL, CAST(80000 AS Decimal(18, 0)), CAST(N'2021-08-24T21:16:29.910' AS DateTime), 15, CAST(911000 AS Decimal(18, 0)), N'', 0)
INSERT [dbo].[ProductTransaction] ([Id], [ProductType], [Name], [IdGame], [AccUserName], [AccPassword], [Price], [CreatedDate], [UserId], [EndBalance], [Content], [Status]) VALUES (14, 0, NULL, NULL, N'213', N'123', CAST(1123 AS Decimal(18, 0)), CAST(N'2021-08-25T20:05:58.967' AS DateTime), 15, CAST(989877 AS Decimal(18, 0)), N'', 1)
INSERT [dbo].[ProductTransaction] ([Id], [ProductType], [Name], [IdGame], [AccUserName], [AccPassword], [Price], [CreatedDate], [UserId], [EndBalance], [Content], [Status]) VALUES (15, 1, N'Dianaâ', N'tennhanvat', NULL, NULL, CAST(63000 AS Decimal(18, 0)), CAST(N'2021-08-26T11:57:01.777' AS DateTime), 1, CAST(937000 AS Decimal(18, 0)), N'', 1)
INSERT [dbo].[ProductTransaction] ([Id], [ProductType], [Name], [IdGame], [AccUserName], [AccPassword], [Price], [CreatedDate], [UserId], [EndBalance], [Content], [Status]) VALUES (16, 1, N'Dianaâ', N'tennhanvat', NULL, NULL, CAST(63000 AS Decimal(18, 0)), CAST(N'2021-08-26T11:57:11.420' AS DateTime), 1, CAST(874000 AS Decimal(18, 0)), N'', 1)
INSERT [dbo].[ProductTransaction] ([Id], [ProductType], [Name], [IdGame], [AccUserName], [AccPassword], [Price], [CreatedDate], [UserId], [EndBalance], [Content], [Status]) VALUES (17, 1, N'Ekko', N'tennguoidung123', NULL, NULL, CAST(10000 AS Decimal(18, 0)), CAST(N'2021-08-26T22:36:49.353' AS DateTime), 1, CAST(864000 AS Decimal(18, 0)), N'', 0)
INSERT [dbo].[ProductTransaction] ([Id], [ProductType], [Name], [IdGame], [AccUserName], [AccPassword], [Price], [CreatedDate], [UserId], [EndBalance], [Content], [Status]) VALUES (18, 1, N'Ekko', N'234', NULL, NULL, CAST(10000 AS Decimal(18, 0)), CAST(N'2021-08-26T22:43:22.090' AS DateTime), 1, CAST(854000 AS Decimal(18, 0)), N'', 1)
INSERT [dbo].[ProductTransaction] ([Id], [ProductType], [Name], [IdGame], [AccUserName], [AccPassword], [Price], [CreatedDate], [UserId], [EndBalance], [Content], [Status]) VALUES (19, 1, N'Arhi', N'taikhoan123', NULL, NULL, CAST(10 AS Decimal(18, 0)), CAST(N'2021-08-26T23:00:18.340' AS DateTime), 1, CAST(853990 AS Decimal(18, 0)), N'', 1)
INSERT [dbo].[ProductTransaction] ([Id], [ProductType], [Name], [IdGame], [AccUserName], [AccPassword], [Price], [CreatedDate], [UserId], [EndBalance], [Content], [Status]) VALUES (20, 1, N'Ekko', N'test', NULL, NULL, CAST(10000 AS Decimal(18, 0)), CAST(N'2021-08-26T23:46:10.780' AS DateTime), 16, CAST(990000 AS Decimal(18, 0)), N'', 2)
INSERT [dbo].[ProductTransaction] ([Id], [ProductType], [Name], [IdGame], [AccUserName], [AccPassword], [Price], [CreatedDate], [UserId], [EndBalance], [Content], [Status]) VALUES (21, 1, N'trang phục 2', N'sgdag', NULL, NULL, CAST(10 AS Decimal(18, 0)), CAST(N'2021-08-27T00:07:28.680' AS DateTime), 1, CAST(853980 AS Decimal(18, 0)), N'', 0)
INSERT [dbo].[ProductTransaction] ([Id], [ProductType], [Name], [IdGame], [AccUserName], [AccPassword], [Price], [CreatedDate], [UserId], [EndBalance], [Content], [Status]) VALUES (22, 1, N'Ekko', N'test', NULL, NULL, CAST(10000 AS Decimal(18, 0)), CAST(N'2021-08-27T10:05:16.310' AS DateTime), 16, CAST(980000 AS Decimal(18, 0)), N'', 1)
INSERT [dbo].[ProductTransaction] ([Id], [ProductType], [Name], [IdGame], [AccUserName], [AccPassword], [Price], [CreatedDate], [UserId], [EndBalance], [Content], [Status]) VALUES (23, 1, N'trang phục 1', N'test', NULL, NULL, CAST(10 AS Decimal(18, 0)), CAST(N'2021-08-27T10:15:08.707' AS DateTime), 16, CAST(979990 AS Decimal(18, 0)), N'', 0)
INSERT [dbo].[ProductTransaction] ([Id], [ProductType], [Name], [IdGame], [AccUserName], [AccPassword], [Price], [CreatedDate], [UserId], [EndBalance], [Content], [Status]) VALUES (26, 1, N'trang phục 2', N'tennv', NULL, NULL, CAST(10 AS Decimal(18, 0)), CAST(N'2021-08-27T21:23:22.583' AS DateTime), 1, CAST(853970 AS Decimal(18, 0)), N'', 0)
INSERT [dbo].[ProductTransaction] ([Id], [ProductType], [Name], [IdGame], [AccUserName], [AccPassword], [Price], [CreatedDate], [UserId], [EndBalance], [Content], [Status]) VALUES (27, 1, N'trang phục 2', N'tennv', NULL, NULL, CAST(10 AS Decimal(18, 0)), CAST(N'2021-08-27T21:23:28.757' AS DateTime), 1, CAST(853960 AS Decimal(18, 0)), N'', 0)
INSERT [dbo].[ProductTransaction] ([Id], [ProductType], [Name], [IdGame], [AccUserName], [AccPassword], [Price], [CreatedDate], [UserId], [EndBalance], [Content], [Status]) VALUES (28, 1, N'trang phục 2', N'tyiityyuo', NULL, NULL, CAST(10 AS Decimal(18, 0)), CAST(N'2021-08-27T21:28:54.787' AS DateTime), 1, CAST(853950 AS Decimal(18, 0)), N'', 0)
INSERT [dbo].[ProductTransaction] ([Id], [ProductType], [Name], [IdGame], [AccUserName], [AccPassword], [Price], [CreatedDate], [UserId], [EndBalance], [Content], [Status]) VALUES (29, 1, N'Ekko', N'testtttt', NULL, NULL, CAST(10000 AS Decimal(18, 0)), CAST(N'2021-08-27T23:15:46.610' AS DateTime), 16, CAST(969970 AS Decimal(18, 0)), N'', 0)
INSERT [dbo].[ProductTransaction] ([Id], [ProductType], [Name], [IdGame], [AccUserName], [AccPassword], [Price], [CreatedDate], [UserId], [EndBalance], [Content], [Status]) VALUES (30, 1, N'trang phục 2', N'test', NULL, NULL, CAST(10 AS Decimal(18, 0)), CAST(N'2021-08-27T23:33:06.663' AS DateTime), 16, CAST(969960 AS Decimal(18, 0)), N'', 0)
INSERT [dbo].[ProductTransaction] ([Id], [ProductType], [Name], [IdGame], [AccUserName], [AccPassword], [Price], [CreatedDate], [UserId], [EndBalance], [Content], [Status]) VALUES (31, 1, N'Ekko', N'234', NULL, NULL, CAST(10000 AS Decimal(18, 0)), CAST(N'2021-08-28T00:20:07.977' AS DateTime), 1, CAST(843950 AS Decimal(18, 0)), N'', 0)
INSERT [dbo].[ProductTransaction] ([Id], [ProductType], [Name], [IdGame], [AccUserName], [AccPassword], [Price], [CreatedDate], [UserId], [EndBalance], [Content], [Status]) VALUES (32, 0, NULL, NULL, N'1', N'123', CAST(10000 AS Decimal(18, 0)), CAST(N'2021-08-28T00:20:42.693' AS DateTime), 1, CAST(833950 AS Decimal(18, 0)), N'', 1)
INSERT [dbo].[ProductTransaction] ([Id], [ProductType], [Name], [IdGame], [AccUserName], [AccPassword], [Price], [CreatedDate], [UserId], [EndBalance], [Content], [Status]) VALUES (33, 0, NULL, NULL, N'acc123456', N'123456', CAST(7000 AS Decimal(18, 0)), CAST(N'2021-08-28T00:31:15.113' AS DateTime), 1, CAST(826950 AS Decimal(18, 0)), N'', 1)
INSERT [dbo].[ProductTransaction] ([Id], [ProductType], [Name], [IdGame], [AccUserName], [AccPassword], [Price], [CreatedDate], [UserId], [EndBalance], [Content], [Status]) VALUES (34, 0, NULL, NULL, N'acc123456', N'123456', CAST(7000 AS Decimal(18, 0)), CAST(N'2021-08-28T00:36:02.657' AS DateTime), 1, CAST(819950 AS Decimal(18, 0)), N'', 1)
INSERT [dbo].[ProductTransaction] ([Id], [ProductType], [Name], [IdGame], [AccUserName], [AccPassword], [Price], [CreatedDate], [UserId], [EndBalance], [Content], [Status]) VALUES (35, 0, NULL, NULL, N'1', N'123', CAST(10000 AS Decimal(18, 0)), CAST(N'2021-08-28T00:41:08.283' AS DateTime), 1, CAST(809950 AS Decimal(18, 0)), N'', 1)
INSERT [dbo].[ProductTransaction] ([Id], [ProductType], [Name], [IdGame], [AccUserName], [AccPassword], [Price], [CreatedDate], [UserId], [EndBalance], [Content], [Status]) VALUES (36, 0, NULL, NULL, N'213', N'123', CAST(1123 AS Decimal(18, 0)), CAST(N'2021-08-28T00:41:29.803' AS DateTime), 1, CAST(808827 AS Decimal(18, 0)), N'', 1)
INSERT [dbo].[ProductTransaction] ([Id], [ProductType], [Name], [IdGame], [AccUserName], [AccPassword], [Price], [CreatedDate], [UserId], [EndBalance], [Content], [Status]) VALUES (37, 0, NULL, NULL, N'1', N'1', CAST(2000 AS Decimal(18, 0)), CAST(N'2021-08-28T07:59:31.130' AS DateTime), 16, CAST(967960 AS Decimal(18, 0)), N'', 1)
INSERT [dbo].[ProductTransaction] ([Id], [ProductType], [Name], [IdGame], [AccUserName], [AccPassword], [Price], [CreatedDate], [UserId], [EndBalance], [Content], [Status]) VALUES (38, 1, N'Arhi', N'aas', NULL, NULL, CAST(10 AS Decimal(18, 0)), CAST(N'2021-08-28T15:35:43.023' AS DateTime), 16, CAST(967950 AS Decimal(18, 0)), N'', 0)
INSERT [dbo].[ProductTransaction] ([Id], [ProductType], [Name], [IdGame], [AccUserName], [AccPassword], [Price], [CreatedDate], [UserId], [EndBalance], [Content], [Status]) VALUES (39, 0, NULL, NULL, N'1', N'123', CAST(10000 AS Decimal(18, 0)), CAST(N'2021-08-28T15:39:07.930' AS DateTime), 16, CAST(957950 AS Decimal(18, 0)), N'', 1)
INSERT [dbo].[ProductTransaction] ([Id], [ProductType], [Name], [IdGame], [AccUserName], [AccPassword], [Price], [CreatedDate], [UserId], [EndBalance], [Content], [Status]) VALUES (40, 0, NULL, NULL, N'acc123456', N'123456', CAST(7000 AS Decimal(18, 0)), CAST(N'2021-08-28T21:51:53.520' AS DateTime), 16, CAST(950950 AS Decimal(18, 0)), N'', 1)
INSERT [dbo].[ProductTransaction] ([Id], [ProductType], [Name], [IdGame], [AccUserName], [AccPassword], [Price], [CreatedDate], [UserId], [EndBalance], [Content], [Status]) VALUES (41, 0, NULL, NULL, N'1', N'1', CAST(10000 AS Decimal(18, 0)), CAST(N'2021-08-28T21:53:38.903' AS DateTime), 16, CAST(940950 AS Decimal(18, 0)), N'', 1)
INSERT [dbo].[ProductTransaction] ([Id], [ProductType], [Name], [IdGame], [AccUserName], [AccPassword], [Price], [CreatedDate], [UserId], [EndBalance], [Content], [Status]) VALUES (42, 1, N'trang phục 1', N'ádasd', NULL, NULL, CAST(10 AS Decimal(18, 0)), CAST(N'2021-08-28T21:54:08.640' AS DateTime), 16, CAST(940940 AS Decimal(18, 0)), N'', 1)
INSERT [dbo].[ProductTransaction] ([Id], [ProductType], [Name], [IdGame], [AccUserName], [AccPassword], [Price], [CreatedDate], [UserId], [EndBalance], [Content], [Status]) VALUES (43, 1, N'trang phục 1', N'#190820', NULL, NULL, CAST(10 AS Decimal(18, 0)), CAST(N'2021-08-31T20:26:29.377' AS DateTime), 2, CAST(499990 AS Decimal(18, 0)), N'', 0)
INSERT [dbo].[ProductTransaction] ([Id], [ProductType], [Name], [IdGame], [AccUserName], [AccPassword], [Price], [CreatedDate], [UserId], [EndBalance], [Content], [Status]) VALUES (44, 1, N'trang phục 1', N'#190820', NULL, NULL, CAST(10 AS Decimal(18, 0)), CAST(N'2021-08-31T20:41:09.503' AS DateTime), 2, CAST(499980 AS Decimal(18, 0)), N'', 1)
INSERT [dbo].[ProductTransaction] ([Id], [ProductType], [Name], [IdGame], [AccUserName], [AccPassword], [Price], [CreatedDate], [UserId], [EndBalance], [Content], [Status]) VALUES (45, 0, NULL, NULL, N'admin123', N'admin123', CAST(230000 AS Decimal(18, 0)), CAST(N'2021-08-31T20:45:09.063' AS DateTime), 2, CAST(269980 AS Decimal(18, 0)), N'', 1)
INSERT [dbo].[ProductTransaction] ([Id], [ProductType], [Name], [IdGame], [AccUserName], [AccPassword], [Price], [CreatedDate], [UserId], [EndBalance], [Content], [Status]) VALUES (46, 1, N'trang phục 2', N'#5445445', NULL, NULL, CAST(10 AS Decimal(18, 0)), CAST(N'2021-08-31T21:31:09.610' AS DateTime), 2, CAST(269970 AS Decimal(18, 0)), N'', 0)
INSERT [dbo].[ProductTransaction] ([Id], [ProductType], [Name], [IdGame], [AccUserName], [AccPassword], [Price], [CreatedDate], [UserId], [EndBalance], [Content], [Status]) VALUES (47, 0, NULL, NULL, N'213', N'123', CAST(1123 AS Decimal(18, 0)), CAST(N'2021-08-31T21:32:38.770' AS DateTime), 2, CAST(268847 AS Decimal(18, 0)), N'', 1)
INSERT [dbo].[ProductTransaction] ([Id], [ProductType], [Name], [IdGame], [AccUserName], [AccPassword], [Price], [CreatedDate], [UserId], [EndBalance], [Content], [Status]) VALUES (1040, 1, N'Ekko', N'1111', NULL, NULL, CAST(10000 AS Decimal(18, 0)), CAST(N'2021-09-01T17:37:38.377' AS DateTime), 16, CAST(930940 AS Decimal(18, 0)), N'', 1)
SET IDENTITY_INSERT [dbo].[ProductTransaction] OFF
GO
SET IDENTITY_INSERT [dbo].[Skin] ON 

INSERT [dbo].[Skin] ([Id], [Name], [Image], [SkinCategoryId], [CreatedDate]) VALUES (2, N'Ekko', N'/client/images/skin/diana.png', 1, CAST(N'2021-08-13T17:40:43.820' AS DateTime))
INSERT [dbo].[Skin] ([Id], [Name], [Image], [SkinCategoryId], [CreatedDate]) VALUES (3, N'Dianaâ', N'/client/images/skin/diana.png', 1, CAST(N'2021-08-16T09:56:47.750' AS DateTime))
INSERT [dbo].[Skin] ([Id], [Name], [Image], [SkinCategoryId], [CreatedDate]) VALUES (4, N'Arhi', N'/client/images/skin/diana.png', 1, CAST(N'2021-08-16T09:57:31.373' AS DateTime))
INSERT [dbo].[Skin] ([Id], [Name], [Image], [SkinCategoryId], [CreatedDate]) VALUES (5, N'trang phục 1', N'/client/images/skin/diana.png', 2, CAST(N'2021-08-16T09:58:04.717' AS DateTime))
INSERT [dbo].[Skin] ([Id], [Name], [Image], [SkinCategoryId], [CreatedDate]) VALUES (6, N'trang phục 2', N'/client/images/skin/diana.png', 2, CAST(N'2021-08-16T09:58:13.780' AS DateTime))
INSERT [dbo].[Skin] ([Id], [Name], [Image], [SkinCategoryId], [CreatedDate]) VALUES (7, N'test 01', N'/Admin/Content/images/no-image-available-thumb(1349x760-crop).jpg', 1, CAST(N'2021-08-26T22:20:12.260' AS DateTime))
SET IDENTITY_INSERT [dbo].[Skin] OFF
GO
SET IDENTITY_INSERT [dbo].[SkinCategory] ON 

INSERT [dbo].[SkinCategory] ([Id], [Name], [Image], [Description], [SkinsSold]) VALUES (1, N'Mua Tướng Tốc Chiến', N'/client/images/list-services.jpg', N'test', 132)
INSERT [dbo].[SkinCategory] ([Id], [Name], [Image], [Description], [SkinsSold]) VALUES (2, N'Mua Skin Tốc Chiến', N'/client/images/list-services.jpg', N'mô tả  1231123', 123123)
SET IDENTITY_INSERT [dbo].[SkinCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[SkinPrice] ON 

INSERT [dbo].[SkinPrice] ([Id], [Price], [SkinId], [CreatedDate]) VALUES (3, CAST(10000 AS Decimal(18, 0)), 1, CAST(N'2021-08-16T10:01:07.250' AS DateTime))
INSERT [dbo].[SkinPrice] ([Id], [Price], [SkinId], [CreatedDate]) VALUES (4, CAST(20000 AS Decimal(18, 0)), 2, CAST(N'2021-08-16T10:01:13.970' AS DateTime))
INSERT [dbo].[SkinPrice] ([Id], [Price], [SkinId], [CreatedDate]) VALUES (5, CAST(30000 AS Decimal(18, 0)), 3, CAST(N'2021-08-16T10:01:26.343' AS DateTime))
INSERT [dbo].[SkinPrice] ([Id], [Price], [SkinId], [CreatedDate]) VALUES (6, CAST(40000 AS Decimal(18, 0)), 4, CAST(N'2021-08-16T10:01:29.297' AS DateTime))
INSERT [dbo].[SkinPrice] ([Id], [Price], [SkinId], [CreatedDate]) VALUES (7, CAST(50000 AS Decimal(18, 0)), 5, CAST(N'2021-08-16T10:01:33.907' AS DateTime))
INSERT [dbo].[SkinPrice] ([Id], [Price], [SkinId], [CreatedDate]) VALUES (8, CAST(60000 AS Decimal(18, 0)), 6, CAST(N'2021-08-16T10:01:37.720' AS DateTime))
INSERT [dbo].[SkinPrice] ([Id], [Price], [SkinId], [CreatedDate]) VALUES (9, CAST(70000 AS Decimal(18, 0)), 7, CAST(N'2021-08-16T10:01:40.670' AS DateTime))
INSERT [dbo].[SkinPrice] ([Id], [Price], [SkinId], [CreatedDate]) VALUES (10, CAST(8880000 AS Decimal(18, 0)), 2, CAST(N'2021-08-16T10:01:52.390' AS DateTime))
INSERT [dbo].[SkinPrice] ([Id], [Price], [SkinId], [CreatedDate]) VALUES (11, CAST(0 AS Decimal(18, 0)), 3, CAST(N'2021-08-26T09:52:13.817' AS DateTime))
INSERT [dbo].[SkinPrice] ([Id], [Price], [SkinId], [CreatedDate]) VALUES (12, CAST(63000 AS Decimal(18, 0)), 3, CAST(N'2021-08-26T09:53:15.230' AS DateTime))
INSERT [dbo].[SkinPrice] ([Id], [Price], [SkinId], [CreatedDate]) VALUES (13, CAST(63000 AS Decimal(18, 0)), 3, CAST(N'2021-08-26T09:53:33.153' AS DateTime))
INSERT [dbo].[SkinPrice] ([Id], [Price], [SkinId], [CreatedDate]) VALUES (20, CAST(10 AS Decimal(18, 0)), 7, CAST(N'2021-08-26T22:20:35.150' AS DateTime))
INSERT [dbo].[SkinPrice] ([Id], [Price], [SkinId], [CreatedDate]) VALUES (21, CAST(10000 AS Decimal(18, 0)), 2, CAST(N'2021-08-26T22:25:02.057' AS DateTime))
INSERT [dbo].[SkinPrice] ([Id], [Price], [SkinId], [CreatedDate]) VALUES (22, CAST(2000000 AS Decimal(18, 0)), 3, CAST(N'2021-08-26T22:25:13.887' AS DateTime))
INSERT [dbo].[SkinPrice] ([Id], [Price], [SkinId], [CreatedDate]) VALUES (14, CAST(10 AS Decimal(18, 0)), 7, CAST(N'2021-08-26T22:20:12.260' AS DateTime))
INSERT [dbo].[SkinPrice] ([Id], [Price], [SkinId], [CreatedDate]) VALUES (15, CAST(10 AS Decimal(18, 0)), 6, CAST(N'2021-08-26T22:20:12.260' AS DateTime))
INSERT [dbo].[SkinPrice] ([Id], [Price], [SkinId], [CreatedDate]) VALUES (16, CAST(10 AS Decimal(18, 0)), 5, CAST(N'2021-08-26T22:20:12.260' AS DateTime))
INSERT [dbo].[SkinPrice] ([Id], [Price], [SkinId], [CreatedDate]) VALUES (17, CAST(10 AS Decimal(18, 0)), 4, CAST(N'2021-08-26T22:20:12.260' AS DateTime))
INSERT [dbo].[SkinPrice] ([Id], [Price], [SkinId], [CreatedDate]) VALUES (18, CAST(10 AS Decimal(18, 0)), 3, CAST(N'2021-08-26T22:20:12.260' AS DateTime))
INSERT [dbo].[SkinPrice] ([Id], [Price], [SkinId], [CreatedDate]) VALUES (19, CAST(10 AS Decimal(18, 0)), 2, CAST(N'2021-08-26T22:20:12.260' AS DateTime))
SET IDENTITY_INSERT [dbo].[SkinPrice] OFF
GO
SET IDENTITY_INSERT [dbo].[Slide] ON 

INSERT [dbo].[Slide] ([Id], [Image], [DisplayOrder], [Link], [Description], [CreatedDate], [Status]) VALUES (3, N'/client/images/slider1.gif', 1, N'/buycard', N'mo-ta', CAST(N'2021-08-12T21:38:40.077' AS DateTime), 1)
INSERT [dbo].[Slide] ([Id], [Image], [DisplayOrder], [Link], [Description], [CreatedDate], [Status]) VALUES (4, N'/client/images/slider2.jpg', 3, N'/napthe', NULL, CAST(N'2021-08-12T21:39:07.627' AS DateTime), 1)
INSERT [dbo].[Slide] ([Id], [Image], [DisplayOrder], [Link], [Description], [CreatedDate], [Status]) VALUES (5, N'/client/images/slider3.jpg', 2, N'/napthe', NULL, CAST(N'2021-08-12T21:39:23.513' AS DateTime), 1)
INSERT [dbo].[Slide] ([Id], [Image], [DisplayOrder], [Link], [Description], [CreatedDate], [Status]) VALUES (6, N'/client/images/slider3.jpg', 4, N'/buycard', N'1', CAST(N'2021-08-12T22:06:35.433' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[Slide] OFF
GO
SET IDENTITY_INSERT [dbo].[Step] ON 

INSERT [dbo].[Step] ([Id], [Content], [Status]) VALUES (1, N'<p><span style="color:#dc3545">Bước 1 : Kết bạn với nick : lienminhnhai123</span></p>

<p><span style="color:#dc3545">Bước 2 : Chờ trả tướng từ 24-48h ( t&ugrave;y v&agrave;o số thứ tự mua v&agrave; quy định tặng qu&agrave; đủ 24h kết bạn trong game )</span></p>

<p><span style="color:#dc3545">( Lưu &yacute; : nick người mua skin - tướng phải tr&ecirc;n lv15 v&agrave; bắt buộc phải kết bạn với tất cả những nick tr&ecirc;n</span></p>

<p><span style="color:#dc3545">Nếu thất bại vui l&ograve;ng li&ecirc;n hệ với Admin)</span></p>
', 1)
INSERT [dbo].[Step] ([Id], [Content], [Status]) VALUES (2, N'<p><span style="color:red">Bước 1 </span> : Kết bạn với nick :</p>

<p><span style="color:red">Bước 2</span> : Chờ trả tướng từ 24-48h ( t&ugrave;y v&agrave;o số thứ tự mua v&agrave; quy định tặng qu&agrave; đủ 24h kết bạn trong game )</p>

<p>( Lưu &yacute; : <span style="color:red">nick người mua skin - tướng phải tr&ecirc;n lv15 v&agrave; bắt buộc phải kết bạn với tất cả những nick tr&ecirc;n </span>)</p>
', 0)
SET IDENTITY_INSERT [dbo].[Step] OFF
GO
SET IDENTITY_INSERT [dbo].[Transaction] ON 

INSERT [dbo].[Transaction] ([Id], [GiaoDich], [SoTien], [SoDu], [Content], [Status], [Serial], [LoaiThe], [KieuNap], [MaThe], [TransactionCategoryTypeId], [UserId], [CreatedDate], [NhaMang], [Game], [AccUserName], [AccPassword]) VALUES (1, N'Nạp thẻ tự động', CAST(20000 AS Decimal(18, 0)), CAST(100000 AS Decimal(18, 0)), N'bán kìa', N'1', N'013456', N'012345640656', NULL, NULL, 3, 1, CAST(N'2021-08-17T23:29:24.680' AS DateTime), NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Transaction] OFF
GO
SET IDENTITY_INSERT [dbo].[TransactionCategoryType] ON 

INSERT [dbo].[TransactionCategoryType] ([Id], [Name]) VALUES (3, N'Nạp thẻ tự động')
INSERT [dbo].[TransactionCategoryType] ([Id], [Name]) VALUES (4, N'Lịch sử nạp thẻ')
INSERT [dbo].[TransactionCategoryType] ([Id], [Name]) VALUES (5, N'Tài khoản đã mua')
INSERT [dbo].[TransactionCategoryType] ([Id], [Name]) VALUES (6, N'Thẻ cào đã mua')
SET IDENTITY_INSERT [dbo].[TransactionCategoryType] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([Id], [UserName], [HashedPassword], [Name], [Email], [Balance], [Phone], [CreatedDate]) VALUES (1, N'cuty1163', N'Jc48xDJ3HD0=', N'Nhat Ho 1', N'holong@gmail.com', CAST(822827 AS Decimal(18, 0)), N'0866721300', CAST(N'2021-10-21T00:00:00.000' AS DateTime))
INSERT [dbo].[User] ([Id], [UserName], [HashedPassword], [Name], [Email], [Balance], [Phone], [CreatedDate]) VALUES (2, N'admin123', N'Jc48xDJ3HD0=', N'13', N'132', CAST(268847 AS Decimal(18, 0)), N'0866721101', CAST(N'2021-10-21T00:00:00.000' AS DateTime))
INSERT [dbo].[User] ([Id], [UserName], [HashedPassword], [Name], [Email], [Balance], [Phone], [CreatedDate]) VALUES (7, N'admin12', N'Jc48xDJ3HD0=', N'nhat', N'0866721300', CAST(0 AS Decimal(18, 0)), N'0866721300', CAST(N'2021-08-19T21:46:39.423' AS DateTime))
INSERT [dbo].[User] ([Id], [UserName], [HashedPassword], [Name], [Email], [Balance], [Phone], [CreatedDate]) VALUES (8, N'admin124', N'Jc48xDJ3HD0=', N'nhat', N'086672130', CAST(10000 AS Decimal(18, 0)), N'0866721300', CAST(N'2021-08-19T21:50:21.157' AS DateTime))
INSERT [dbo].[User] ([Id], [UserName], [HashedPassword], [Name], [Email], [Balance], [Phone], [CreatedDate]) VALUES (13, N'adminne', N'tQOzxIaDqUVUbahrWv8fHA==', NULL, N'holongnhat2010@gmail.com', CAST(0 AS Decimal(18, 0)), NULL, CAST(N'2021-08-19T23:16:26.740' AS DateTime))
INSERT [dbo].[User] ([Id], [UserName], [HashedPassword], [Name], [Email], [Balance], [Phone], [CreatedDate]) VALUES (15, N'admin', N'SepfN6huputUbahrWv8fHA==', NULL, N'khuatchung1012@gmail.com', CAST(989877 AS Decimal(18, 0)), NULL, CAST(N'2021-08-23T15:24:54.987' AS DateTime))
INSERT [dbo].[User] ([Id], [UserName], [HashedPassword], [Name], [Email], [Balance], [Phone], [CreatedDate]) VALUES (16, N'tiennn', N'6VCp9VESzMs=', N'Tiên', N'Nguyenthuytien307@gmail.com', CAST(100000 AS Decimal(18, 0)), N'0968284850', CAST(N'2021-08-24T00:10:00.630' AS DateTime))
INSERT [dbo].[User] ([Id], [UserName], [HashedPassword], [Name], [Email], [Balance], [Phone], [CreatedDate]) VALUES (17, N'tiennnn', N'Jc48xDJ3HD0=', N'test', N'Nguyenthuytien307@gmail.con', CAST(0 AS Decimal(18, 0)), N'0968284850', CAST(N'2021-08-24T00:14:13.313' AS DateTime))
INSERT [dbo].[User] ([Id], [UserName], [HashedPassword], [Name], [Email], [Balance], [Phone], [CreatedDate]) VALUES (20, N'admin123456', N'Jc48xDJ3HD0=', NULL, N'holongnhat2011@gmail.commm', CAST(0 AS Decimal(18, 0)), NULL, CAST(N'2021-08-25T00:10:32.320' AS DateTime))
INSERT [dbo].[User] ([Id], [UserName], [HashedPassword], [Name], [Email], [Balance], [Phone], [CreatedDate]) VALUES (21, N'hongphuong', N'Jc48xDJ3HD0=', N'Test123', N'test@gmail.com', CAST(13122 AS Decimal(18, 0)), N'0969422308', CAST(N'2021-08-25T18:56:50.333' AS DateTime))
INSERT [dbo].[User] ([Id], [UserName], [HashedPassword], [Name], [Email], [Balance], [Phone], [CreatedDate]) VALUES (22, N'yenmi198', N'Jc48xDJ3HD0=', NULL, N'honganh1908@gmail.com', CAST(0 AS Decimal(18, 0)), NULL, CAST(N'2021-08-25T19:54:51.403' AS DateTime))
INSERT [dbo].[User] ([Id], [UserName], [HashedPassword], [Name], [Email], [Balance], [Phone], [CreatedDate]) VALUES (31, N'demo', N'Jc48xDJ3HD0=', N'456', N'holongnh12340@gmail.com', CAST(4521 AS Decimal(18, 0)), N'0866751300', CAST(N'2021-08-27T22:20:46.910' AS DateTime))
INSERT [dbo].[User] ([Id], [UserName], [HashedPassword], [Name], [Email], [Balance], [Phone], [CreatedDate]) VALUES (32, N'admin1111', N'6VCp9VESzMs=', NULL, N'Laminhhong998@gmail.com', CAST(0 AS Decimal(18, 0)), NULL, CAST(N'2021-08-28T17:12:25.160' AS DateTime))
INSERT [dbo].[User] ([Id], [UserName], [HashedPassword], [Name], [Email], [Balance], [Phone], [CreatedDate]) VALUES (35, N'holongnhat2000@gmail.com', N'3sDV6ZAVtHZUeSfKmDPZLQeLBhWkjzzrVG2oa1r/Hxw=', NULL, N'holongnhat2000@gmail.com', CAST(0 AS Decimal(18, 0)), NULL, CAST(N'2021-09-06T13:20:53.650' AS DateTime))
INSERT [dbo].[User] ([Id], [UserName], [HashedPassword], [Name], [Email], [Balance], [Phone], [CreatedDate]) VALUES (36, N'vietawesome1994@gmail.com', N'eRAAvnDGF/fzEuySq5BjJIuooX9pXo4pYYtBJ/0EV+Q=', NULL, N'vietawesome1994@gmail.com', CAST(0 AS Decimal(18, 0)), NULL, CAST(N'2021-09-06T17:05:49.977' AS DateTime))
INSERT [dbo].[User] ([Id], [UserName], [HashedPassword], [Name], [Email], [Balance], [Phone], [CreatedDate]) VALUES (37, N'dray.opp.1909@gmail.com', N'kH4ijraPRVqbgczPuNDinU7VMTI2ZiJ1', NULL, N'dray.opp.1909@gmail.com', CAST(0 AS Decimal(18, 0)), NULL, CAST(N'2021-09-06T17:06:16.077' AS DateTime))
INSERT [dbo].[User] ([Id], [UserName], [HashedPassword], [Name], [Email], [Balance], [Phone], [CreatedDate]) VALUES (38, N'ninhvanthanh070120@gmail.com', N'WAdLoz5d0WXq2wEdXv2Yo31ROv+Muxj4JtnrnU20neM=', NULL, N'ninhvanthanh070120@gmail.com', CAST(0 AS Decimal(18, 0)), NULL, CAST(N'2021-09-11T11:47:01.637' AS DateTime))
INSERT [dbo].[User] ([Id], [UserName], [HashedPassword], [Name], [Email], [Balance], [Phone], [CreatedDate]) VALUES (1033, N'Abigail81', N'Pv8NyHlEwfReqnVD1GQJZQ==', NULL, N'Giovani.King@gmail.com', CAST(0 AS Decimal(18, 0)), NULL, CAST(N'2021-09-15T04:57:28.130' AS DateTime))
INSERT [dbo].[User] ([Id], [UserName], [HashedPassword], [Name], [Email], [Balance], [Phone], [CreatedDate]) VALUES (1034, N'Abigail81', N'Pv8NyHlEwfReqnVD1GQJZQ==', NULL, N'Giovani.King@gmail.com', CAST(0 AS Decimal(18, 0)), NULL, CAST(N'2021-09-15T04:57:28.930' AS DateTime))
INSERT [dbo].[User] ([Id], [UserName], [HashedPassword], [Name], [Email], [Balance], [Phone], [CreatedDate]) VALUES (1035, N'Neva.Bechtelar', N'jJ2i7ryoxYgFE241fDqf2w==', NULL, N'sfaridifar@ebbklaw.com', CAST(0 AS Decimal(18, 0)), NULL, CAST(N'2021-09-24T18:54:28.990' AS DateTime))
INSERT [dbo].[User] ([Id], [UserName], [HashedPassword], [Name], [Email], [Balance], [Phone], [CreatedDate]) VALUES (1036, N'Neva.Bechtelar', N'jJ2i7ryoxYgFE241fDqf2w==', NULL, N'sfaridifar@ebbklaw.com', CAST(0 AS Decimal(18, 0)), NULL, CAST(N'2021-09-24T18:54:29.777' AS DateTime))
INSERT [dbo].[User] ([Id], [UserName], [HashedPassword], [Name], [Email], [Balance], [Phone], [CreatedDate]) VALUES (1037, N'ninhthanh7120@gmail.com', N'qol1va9Xrue8qSvQFKUwEU7VMTI2ZiJ1', NULL, N'ninhthanh7120@gmail.com', CAST(0 AS Decimal(18, 0)), NULL, CAST(N'2021-10-07T09:29:23.557' AS DateTime))
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Blog] ADD  CONSTRAINT [DF_Blog_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[NaptheTransaction] ADD  CONSTRAINT [DF_NaptheTransaction_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[ProductPrice] ADD  CONSTRAINT [DF_ProductPrice_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[ProductTransaction] ADD  CONSTRAINT [DF_ProductTransaction_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Skin] ADD  CONSTRAINT [DF_Skin_Createdate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[SkinPrice] ADD  CONSTRAINT [DF_SkinPrice_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Slide] ADD  CONSTRAINT [DF_Slide_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Transaction] ADD  CONSTRAINT [DF_Transaction_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
/****** Object:  StoredProcedure [dbo].[callback_transaction]    Script Date: 3/11/2022 9:51:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[callback_transaction]
@requestId int,
@status int,
@amount int
as
begin
	update NaptheTransaction
	set [Status] = @status
	where @requestId = Id

	declare @UserId int
	select @UserId = UserId from NaptheTransaction
	where Id = @requestId

	if(@status=1)
	begin
		update NaptheTransaction
		set ThucNhan = iif(@amount is null,0,@amount)*0.7
		where @requestId = Id

		update [User]
		set Balance = Balance + iif(@amount is null,0,@amount)*0.7
		where Id = @UserId
	end
	select @@ROWCOUNT
end
GO
/****** Object:  StoredProcedure [dbo].[forgot_password]    Script Date: 3/11/2022 9:51:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[forgot_password]
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
/****** Object:  StoredProcedure [dbo].[shopgame_buy_account]    Script Date: 3/11/2022 9:51:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[shopgame_buy_account]
@Id int,
@UserId int
as
begin
	declare @Balance decimal(18,0)
	declare @Price decimal(18,0)
	declare @Account nvarchar(255)
	declare @Pass nvarchar(255)

	select @Balance = Balance from [User]
	where Id = @UserId

	select top 1 @Price = Price from ProductPrice
	where ProductId = @Id
	order by Id desc

	if(@Balance > @Price)
		begin

			if exists (select * from Product where Id = @Id and Status = 1)
			begin

				select @Account = AccUserName,@Pass = AccPassword from Product
				where Id = @Id
				
				insert into ProductTransaction (ProductType,AccUserName,AccPassword,Price,CreatedDate,UserId,EndBalance,Content,Status)
				values (0,@Account,@Pass,@Price,GETDATE(),@UserId,@Balance-@Price,'',1)

				update [User]
				set Balance = @Balance - @Price
				where Id = @UserId

				update Product
				set Status = 0
				where Id = @Id

				select 1  -- thành công
			end
			
			else
			begin
				select 2  -- đã có người mua
			end
		end
	else
		begin
			select 0; -- tiền không đủ
		end
end
GO
/****** Object:  StoredProcedure [dbo].[shopgame_buy_skin]    Script Date: 3/11/2022 9:51:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[shopgame_buy_skin]
@Id int,
@UserId int,
@Name nvarchar(255)
as
begin
	declare @Balance decimal(18,0)
	declare @Price decimal(18,0)
	declare @NameSkin nvarchar(255)

	select @Balance = Balance from [User]
	where Id = @UserId

	select top 1 @Price = Price from SkinPrice
	where SkinId = @Id
	order by Id desc

	if(@Balance > @Price)
		begin

			if exists (select * from Skin where Id = @Id)
			begin

				select @NameSkin = Name from Skin
				where Id = @Id
				
				insert into ProductTransaction (ProductType,IdGame,Name,Price,CreatedDate,UserId,EndBalance,Content,Status)
				values (1,@Name,@NameSkin,@Price,GETDATE(),@UserId,@Balance-@Price,'',0)

				update [User]
				set Balance = @Balance - @Price
				where Id = @UserId

				select 1  -- thành công
			end
			
			else
			begin
				select 2  -- không tồn tại
			end
		end
	else
		begin
			select 0; -- tiền không đủ
		end
end


GO
/****** Object:  StoredProcedure [dbo].[shopgame_change_status_ProductTransaction_byId]    Script Date: 3/11/2022 9:51:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[shopgame_change_status_ProductTransaction_byId]
@Id int,
@Status int
as
begin
	 if @Id = 0
	begin
		select 0
	end

 else
	begin
	    update ProductTransaction
		set
			Status = @Status
		where Id = @Id
		select iif(@@ROWCOUNT>0,1,0)
	end
end
GO
/****** Object:  StoredProcedure [dbo].[shopgame_charge]    Script Date: 3/11/2022 9:51:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[shopgame_charge]
@Id int,
@NCCId int,
@ValueId int,
@Code nvarchar(255),
@Seri nvarchar(255),
@UserId int
as
begin
	insert into NaptheTransaction(NCCId,GiaTriTheId,MaThe,Serial,UserId,CreatedDate,Status)
	values (@NCCId,@ValueId,@Code,@Seri,@UserId,GETDATE(),0)


	declare @telco nvarchar(100) = '',
			@amount decimal(18,0) = 0,
			@request_id int

	select top 1 @telco = NCC.Name from NCC
	where NCC.Id = @NCCId

	select top 1 @amount = gt.Value from GiaTriThe gt
	where gt.Id  = @ValueId

	select top 1 @request_id = Id from NaptheTransaction
	order by Id desc
	select @telco as telco,@amount as amount,@request_id as request_id ,@Code as code,@Seri as serial
end
GO
/****** Object:  StoredProcedure [dbo].[shopgame_check_delete_productcategory]    Script Date: 3/11/2022 9:51:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[shopgame_check_delete_productcategory]
@Id int
as
begin
  declare @Check int
  select @Check = COUNT(Id) from Product
  where CategoryId = @Id
  select @Check = 0
end
GO
/****** Object:  StoredProcedure [dbo].[shopgame_client_user_login]    Script Date: 3/11/2022 9:51:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[shopgame_client_user_login]
@UserName nvarchar(255),
@HashedPassword nvarchar(255)
as
begin
	select * from  [dbo].[User]
	where UserName = @UserName and HashedPassword = @HashedPassword
end
GO
/****** Object:  StoredProcedure [dbo].[shopgame_create_blog]    Script Date: 3/11/2022 9:51:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[shopgame_create_blog]
@Id int,
@Name nvarchar(500),
@Image nvarchar(500),
@MetaTitle nvarchar(500),
@Description nvarchar(500),
@BlogTypeId int
as
begin
 if @Id = 0
	begin
		insert into Blog(Name,MetaTitle,Description,BlogTypeId,CreatedDate,Image) values (@Name,@MetaTitle,@Description,@BlogTypeId,GETDATE(),@Image)
		select iif(@@ROWCOUNT>0,1,0)
	end

 else
	begin
	    update Blog
		set Name = @Name,
		MetaTitle =@MetaTitle,
		Description = @Description,
		BlogTypeId = @BlogTypeId,
		Image = @Image
		where Id = @Id
		select iif(@@ROWCOUNT>0,1,0)
	end
end
GO
/****** Object:  StoredProcedure [dbo].[shopgame_create_blogtype]    Script Date: 3/11/2022 9:51:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[shopgame_create_blogtype]
@Id int,
@Name nvarchar(500)
as
begin
 if @Id = 0
	begin
		insert into BlogType(Name) values (@Name)
		select iif(@@ROWCOUNT>0,1,0)
	end

 else
	begin
	    update BlogType
		set Name = @Name
		where BlogTypeId = @Id
		select iif(@@ROWCOUNT>0,1,0)
	end
end
GO
/****** Object:  StoredProcedure [dbo].[shopgame_create_cardadmin]    Script Date: 3/11/2022 9:51:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[shopgame_create_cardadmin]
@Id int,
@CardNumber nvarchar(255),
@CardType nvarchar(255),
@CardHolder nvarchar(255),
@CardBranch nvarchar(255),
@BankName nvarchar(255)
as
begin
 if @Id = 0
	begin
		insert into CardAdmin(CardNumber,CardType,CardHolder,CardBranch,BankName) values (@CardNumber,@CardType,@CardHolder,@CardBranch,@BankName)
		select iif(@@ROWCOUNT>0,1,0)
	end

 else
	begin
	    update CardAdmin
		set CardNumber = @CardNumber,
			CardType = @CardType,
			CardHolder = @CardHolder,
			CardBranch = @CardBranch,
			BankName = @BankName
		where Id = @Id
		select iif(@@ROWCOUNT>0,1,0)
	end
end
GO
/****** Object:  StoredProcedure [dbo].[shopgame_create_login]    Script Date: 3/11/2022 9:51:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[shopgame_create_login]
@Id int,
@UserName nvarchar(255),
@HashedPassword nvarchar(255)
as
begin
	if @Id = 0
		begin
			if not exists (select * from Account where UserName = @UserName)
				begin
					insert into Account values (@UserName,@HashedPassword)
					select 1
				end
			else
				begin
					select 0
				end
		end
	else
		begin
			if not exists (select * from Account where UserName = @UserName and @Id = Id)
				begin
					update  Account
					set UserName = @UserName,
						HashedPassword = @HashedPassword
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
/****** Object:  StoredProcedure [dbo].[shopgame_create_masterdata]    Script Date: 3/11/2022 9:51:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[shopgame_create_masterdata]
@Id int,
@Code nvarchar(255),
@Name nvarchar(255),
@Value nvarchar(Max)
as
begin
 if @Id = 0
	begin
	
		select 0
	end

 else
	begin
	    update MasterData
		set Code = @Code,
			Name = @Name,
			Value = @Value
		where Id = @Id
		select iif(@@ROWCOUNT>0,1,0)
	end
end
GO
/****** Object:  StoredProcedure [dbo].[shopgame_create_notification]    Script Date: 3/11/2022 9:51:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[shopgame_create_notification]
@Id int,
@Content nvarchar(500),
@Image nvarchar(500),
@Status bit
as
begin
 if @Id = 0
	begin
		insert into Notification(Content,Image,Status) values (@Content,@Image,@Status)
		select iif(@@ROWCOUNT>0,1,0)
	end

 else
	begin
	    update Notification
		set Content = @Content,
			Image = @Image,
			Status = @Status
		where Id = @Id
		select iif(@@ROWCOUNT>0,1,0)
	end
end


GO
/****** Object:  StoredProcedure [dbo].[shopgame_create_or_update_client_login]    Script Date: 3/11/2022 9:51:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[shopgame_create_or_update_client_login]
@Id int,
@UserName nvarchar(255),
@HashedPassword nvarchar(255),
@Name nvarchar(255),
@Email nvarchar(255),
@Balance decimal(18,0),
@Phone nvarchar(255)

as
begin
	if @Id = 0
		begin
			if not exists (select * from [dbo].[User] where UserName = @UserName or Email = @Email or Phone = @Phone)
				begin
					insert into [dbo].[User] values (@UserName,
					@HashedPassword,
					@Name,
					@Email,
					@Balance,
					@Phone,
					GETDATE())
					select 1
				end
			else
				begin
					select 0
				end
		end
	else
		begin
			if exists (select * from [dbo].[User] where UserName = @UserName and Id =@Id)
				begin
				print(N'ok')
					update  [dbo].[User]
					set 
						HashedPassword = @HashedPassword,
						[Name] = @Name ,
						Email = @Email ,
						Balance = @Balance ,
						Phone = @Phone 
						where Id = @Id
						select 1
				end
			else
				begin
				print(N'notke')
					select 0
				end
		end
end
GO
/****** Object:  StoredProcedure [dbo].[shopgame_create_or_update_GiaTriThe]    Script Date: 3/11/2022 9:51:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[shopgame_create_or_update_GiaTriThe]
@Id int,
@Name nvarchar(255),
@Value decimal(18,0),
@Percent decimal(18,0)
as
begin
 if @Id = 0
	begin
		insert into [dbo].[GiaTriThe]([Name],[Value],[Percent]) values (@Name,@Value,@Percent)
		select iif(@@ROWCOUNT>0,1,0)
	end

 else
	begin
	    update [dbo].[GiaTriThe]
		set Name = @Name,
			[Value] = @Value,
			[Percent] = @Percent
		where Id = @Id
		select iif(@@ROWCOUNT>0,1,0)
	end
end
GO
/****** Object:  StoredProcedure [dbo].[shopgame_create_or_update_NCC]    Script Date: 3/11/2022 9:51:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[shopgame_create_or_update_NCC]
@Id int,
@Name nvarchar(255)
as
begin
 if @Id = 0
	begin
		insert into NCC([Name]) values (@Name)
		select iif(@@ROWCOUNT>0,1,0)
	end

 else
	begin
	    update NCC
		set Name = @Name
		where Id = @Id
		select iif(@@ROWCOUNT>0,1,0)
	end
end
GO
/****** Object:  StoredProcedure [dbo].[shopgame_create_product]    Script Date: 3/11/2022 9:51:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[shopgame_create_product]
@Id int,
@Code nvarchar(255),
@Name nvarchar(255),
@Description nvarchar(max),
@Image nvarchar(500),
@CategoryId int,
@Detail nvarchar(max),
@OrderNo int,
@Rank nvarchar(255),
@SoTuong nvarchar(255),
@SoTrangPhuc nvarchar(255),
@LoaiTaiKhoan nvarchar(255),
@NoiBat nvarchar(255),
@DangKy nvarchar(255),
@VIP nvarchar(255),
@Top int,
@AccUserName nvarchar(255),
@AccPassword nvarchar(255),
@MetaTitle nvarchar(255),
@MetaDescription nvarchar(255),
@Status bit,
@ProductImage ProductImages readonly,
@Price decimal(18,2)
as
begin
	if @Id = 0
		begin
			insert into Product (Code,Name,Description,[Image],CategoryId,Detail,OrderNo,Rank,SoTuong,SoTrangPhuc,LoaiTaiKhoan,NoiBat,DangKy,VIP,[Top],AccUserName,AccPassword,Metatitle,MetaDescription,Status)
			values (@Code,@Name,@Description,@Image,@CategoryId,@Detail,@OrderNo,@Rank,@SoTuong,@SoTrangPhuc,@LoaiTaiKhoan,@NoiBat,@DangKy,@VIP,@Top,@AccUserName,@AccPassword,@MetaTitle,@MetaDescription,@Status)

			declare @IdNew int
			select top 1 @IdNew = Id from Product order by Id desc

			insert into ProductImage(ProductId,Image) 
			select @IdNew,Image from @ProductImage

			insert into ProductPrice values(@IdNew,'',GETDATE(),@Price)
		end
	else
		begin
			Update Product
			set Code = @Code,
				Name = @Name,
				Description = @Description,
				Image = @Image,
				CategoryId = @CategoryId,
				Detail = @Detail,
				OrderNo = @OrderNo,
				[Rank] = @Rank,
				SoTuong = @SoTuong,
				SoTrangPhuc = @SoTrangPhuc,
				LoaiTaiKhoan = @LoaiTaiKhoan,
				NoiBat = @NoiBat,
				DangKy = @DangKy,
				VIP = @VIP,
				[Top] = @Top,
				AccUserName = @AccUserName,
				AccPassword = @AccPassword,
				Metatitle = @MetaTitle,
				MetaDescription = @MetaDescription,
				[Status] = @Status
			where Id = @Id

			delete ProductIMage where ProductId = @Id
			insert into ProductImage(ProductId,Image) 
			select @Id,Image from @ProductImage

			-- update price
			declare @currentPrice decimal(18,0) = 0
			select top 1 @currentPrice = Price from ProductPrice where ProductId = @Id order by Id desc
			if(@currentPrice = 0 or @currentPrice != @price)
			begin
				insert into ProductPrice values(@IdNew,'',GETDATE(),@Price)
			end
		end

		--select IIF(@@ROWCOUNT>0,1,0)
		select 1

end

GO
/****** Object:  StoredProcedure [dbo].[shopgame_create_productcategory]    Script Date: 3/11/2022 9:51:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[shopgame_create_productcategory]
@Id int,
@Name nvarchar(500),
@Image nvarchar(500),
@Description nvarchar(500)
as
begin
 if @Id = 0
	begin
		insert into ProductCategory(Name,Image,Description) values (@Name,@Image,@Description)
		select iif(@@ROWCOUNT>0,1,0)
	end

 else
	begin
	    update ProductCategory
		set Name = @Name,
			Image = @Image,
			Description = @Description
			where Id = @Id
		select iif(@@ROWCOUNT>0,1,0)
	end
end

GO
/****** Object:  StoredProcedure [dbo].[shopgame_create_ProductTransaction]    Script Date: 3/11/2022 9:51:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[shopgame_create_ProductTransaction]
@Id int,
@ProductType int,
@Name nvarchar(255),
@AccUserName nvarchar(255),
@AccPassword nvarchar(255),
@Price decimal(18,0),
@UserId int,
@EndBalance decimal(18,0),
@Content nvarchar(255),
@Status int
as
begin
 if @Id = 0
	begin
		insert into ProductTransaction(ProductType,Name,AccUserName,AccPassword,Price,UserId,EndBalance,Content,Status) 
		values (@ProductType,@Name,@AccUserName,@AccPassword,@Price,@UserId,@EndBalance,@Content,@Status)
		select iif(@@ROWCOUNT>0,1,0)
	end
 else
	begin
	    update ProductTransaction
		set ProductType = @ProductType,
			Name = @Name,
			AccUserName = @AccUserName,
			AccPassword = @AccPassword,
			Price = @Price,
			UserId = @UserId,
			EndBalance = @EndBalance,
			Content = @Content,
			Status = @Status
		where Id = @Id
		select iif(@@ROWCOUNT>0,1,0)
	end
end
GO
/****** Object:  StoredProcedure [dbo].[shopgame_create_skin]    Script Date: 3/11/2022 9:51:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[shopgame_create_skin]
@Id int,
@Name nvarchar(500),
@Image nvarchar(500),
@SkinCategoryId int,
@Price decimal(18,2)
as
begin
 if @Id = 0
	begin
		insert into Skin(Name,Image,SkinCategoryId) values (@Name,@Image,@SkinCategoryId)
		insert SkinPrice(SkinId,Price,CreatedDate) select Id,@Price,GETDATE() from Skin Order by Id desc
		select iif(@@ROWCOUNT>0,1,0)
	end

 else
	begin
	    update Skin
		set Name = @Name,
		Image = @Image,
		SkinCategoryId = @SkinCategoryId
		where Id = @Id

		declare @CurrentPrice decimal(18,0) = 0
		select @CurrentPrice = Price from SkinPrice where SkinId = @Id order by Id desc 
		if(@CurrentPrice = 0 or @CurrentPrice != @Price)
		begin
			insert SkinPrice(SkinId,Price,CreatedDate) values (@Id,@Price,GETDATE())
		end
		select iif(@@ROWCOUNT>0,1,0)
	end
end
GO
/****** Object:  StoredProcedure [dbo].[shopgame_create_skincategory]    Script Date: 3/11/2022 9:51:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[shopgame_create_skincategory]
@Id int,
@Name nvarchar(500),
@Image nvarchar(500),
@Description nvarchar(MAX),
@SkinsSold int
as
begin
 if @Id = 0
	begin
		insert into SkinCategory(Name,Image,Description,SkinsSold) values (@Name,@Image,@Description,@SkinsSold)
		select iif(@@ROWCOUNT>0,1,0)
	end

 else
	begin
	    update SkinCategory
		set Name = @Name,
			Image = @Image,
			Description = @Description,
			SkinsSold = @SkinsSold
		where Id = @Id
		select iif(@@ROWCOUNT>0,1,0)
	end
end


GO
/****** Object:  StoredProcedure [dbo].[shopgame_create_slide]    Script Date: 3/11/2022 9:51:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[shopgame_create_slide]
@Id int,
@Image nvarchar(500),
@DisplayOrder int,
@Link nvarchar(255),
@Description nvarchar(255),
@Status bit
as
begin
 if @Id = 0
	begin
		insert into Slide(Image,DisplayOrder,Link,Description,Status) values (@Image,@DisplayOrder,@Link,@Description,@Status)
		select iif(@@ROWCOUNT>0,1,0)
	end

 else
	begin
	    update Slide
		set Image = @Image,
			DisplayOrder = @DisplayOrder,
			Link = @Link,
			Description = @Description,
			Status = @Status
		where Id = @Id
		select iif(@@ROWCOUNT>0,1,0)
	end
end


GO
/****** Object:  StoredProcedure [dbo].[shopgame_create_step]    Script Date: 3/11/2022 9:51:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[shopgame_create_step]
@Id int,
@Content nvarchar(max),
@Status bit
as
begin
 if @Id = 0
	begin
		insert into Step(Content,Status) values (@Content,@Status)
		select iif(@@ROWCOUNT>0,1,0)
	end

 else
	begin
	    update Step
		set Content = @Content,
			Status = @Status
		where Id = @Id
		select iif(@@ROWCOUNT>0,1,0)
	end
end

GO
/****** Object:  StoredProcedure [dbo].[shopgame_create_transactiontype]    Script Date: 3/11/2022 9:51:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[shopgame_create_transactiontype]
@Id int,
@Name nvarchar(500)
as
begin
 if @Id = 0
	begin
		insert into TransactionCategoryType(Name) values (@Name)
		select iif(@@ROWCOUNT>0,1,0)
	end

 else
	begin
	    update TransactionCategoryType
		set Name = @Name
		where Id = @Id
		select iif(@@ROWCOUNT>0,1,0)
	end
end


GO
/****** Object:  StoredProcedure [dbo].[shopgame_delete_blog]    Script Date: 3/11/2022 9:51:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[shopgame_delete_blog]
@Id int
as
begin
	delete Blog
	where Id = @Id
	select iif(@@ROWCOUNT>0,1,0) 
end
GO
/****** Object:  StoredProcedure [dbo].[shopgame_delete_blogtype]    Script Date: 3/11/2022 9:51:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[shopgame_delete_blogtype]
@Id int
as
begin
	delete BlogType
	where BlogTypeId = @Id
	select iif(@@ROWCOUNT>0,1,0) 
end
GO
/****** Object:  StoredProcedure [dbo].[shopgame_delete_cardadmin]    Script Date: 3/11/2022 9:51:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[shopgame_delete_cardadmin]
@Id int
as
begin
	delete CardAdmin
	where Id = @Id
	select iif(@@ROWCOUNT>0,1,0) 
end


GO
/****** Object:  StoredProcedure [dbo].[shopgame_delete_client_user_login]    Script Date: 3/11/2022 9:51:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[shopgame_delete_client_user_login]
@Id int
as
begin
	delete [dbo].[User]
	where Id = @Id
	select iif(@@ROWCOUNT>0,1,0) 
end
GO
/****** Object:  StoredProcedure [dbo].[shopgame_delete_GiaTriThe]    Script Date: 3/11/2022 9:51:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[shopgame_delete_GiaTriThe]
@Id int
as
begin
	delete GiaTriThe
	where Id = @Id
	select iif(@@ROWCOUNT>0,1,0) 
end
GO
/****** Object:  StoredProcedure [dbo].[shopgame_delete_login]    Script Date: 3/11/2022 9:51:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[shopgame_delete_login]
@Id int
as
begin
	delete Account
	where Id = @Id
	select iif(@@ROWCOUNT>0,1,0) 
end


GO
/****** Object:  StoredProcedure [dbo].[shopgame_delete_MasterData]    Script Date: 3/11/2022 9:51:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[shopgame_delete_MasterData]
@Id int
as
begin
	delete MasterData
	where Id = @Id
	select iif(@@ROWCOUNT>0,1,0) 
end
GO
/****** Object:  StoredProcedure [dbo].[shopgame_delete_NCC]    Script Date: 3/11/2022 9:51:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[shopgame_delete_NCC]
@Id int
as
begin
	delete NCC
	where Id = @Id
	select iif(@@ROWCOUNT>0,1,0) 
end
GO
/****** Object:  StoredProcedure [dbo].[shopgame_delete_notification]    Script Date: 3/11/2022 9:51:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[shopgame_delete_notification]
@Id int
as
begin
	delete Notification
	where Id = @Id
	select iif(@@ROWCOUNT>0,1,0) 
end


GO
/****** Object:  StoredProcedure [dbo].[shopgame_delete_product]    Script Date: 3/11/2022 9:51:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[shopgame_delete_product]
@Id int
as 
begin
	delete Product
	where Id = @Id
	select iif(@@ROWCOUNT>0,1,0)
end
GO
/****** Object:  StoredProcedure [dbo].[shopgame_delete_productcategory]    Script Date: 3/11/2022 9:51:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[shopgame_delete_productcategory]
@Id int
as
begin
	delete ProductCategory
	where Id = @Id
	select iif(@@ROWCOUNT>0,1,0)
end
GO
/****** Object:  StoredProcedure [dbo].[shopgame_delete_ProductTransaction]    Script Date: 3/11/2022 9:51:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[shopgame_delete_ProductTransaction]
@Id int
as
begin
	delete [dbo].ProductTransaction
	where Id = @Id
	select iif(@@ROWCOUNT>0,1,0) 
end
GO
/****** Object:  StoredProcedure [dbo].[shopgame_delete_skin]    Script Date: 3/11/2022 9:51:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[shopgame_delete_skin]
@Id int
as
begin
	delete Skin
	where Id = @Id
	select iif(@@ROWCOUNT>0,1,0) 
end


GO
/****** Object:  StoredProcedure [dbo].[shopgame_delete_skincategory]    Script Date: 3/11/2022 9:51:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[shopgame_delete_skincategory]
@Id int
as
begin
	delete SkinCategory
	where Id = @Id
	select iif(@@ROWCOUNT>0,1,0) 
end


GO
/****** Object:  StoredProcedure [dbo].[shopgame_delete_slide]    Script Date: 3/11/2022 9:51:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[shopgame_delete_slide]
@Id int
as
begin
	delete Slide
	where Id = @Id
	select iif(@@ROWCOUNT>0,1,0) 
end


GO
/****** Object:  StoredProcedure [dbo].[shopgame_delete_step]    Script Date: 3/11/2022 9:51:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[shopgame_delete_step]
@Id int
as
begin
	delete step
	where Id = @Id
	select iif(@@ROWCOUNT>0,1,0) 
end
GO
/****** Object:  StoredProcedure [dbo].[shopgame_delete_transactiontype]    Script Date: 3/11/2022 9:51:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[shopgame_delete_transactiontype]
@Id int
as
begin
	delete TransactionCategoryType
	where Id = @Id
	select iif(@@ROWCOUNT>0,1,0) 
end


GO
/****** Object:  StoredProcedure [dbo].[shopgame_get_account]    Script Date: 3/11/2022 9:51:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[shopgame_get_account]
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
	select @Totals = count(Id) from Account
	set @PageCount = iif(@Totals % @PageSize=0,@Totals / @PageSize,@Totals / @PageSize+1)
	if ISNULL(@Search,'') != ''
		begin
			set @whereSql += N'and (UserName like N''%'+@Search+'%'')'
		end
	set @sql = N'
		
		select Id,UserName,HashedPassword from Account
		' + @whereSql + '
		order by Id
		offset (@PageSize*(@PageNumber-1)) rows fetch next @PageSize rows only'
	print @Sql
	declare @Param nvarchar(max) = N'@Search nvarchar(max),@PageSize int,@PageNumber int,@Totals int,@PageCount int'
	EXEC sp_executesql @Sql,@Param,@Search,@PageSize,@PageNumber,@Totals,@PageCount
end

GO
/****** Object:  StoredProcedure [dbo].[shopgame_get_banner]    Script Date: 3/11/2022 9:51:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[shopgame_get_banner]
@BaseParam BaseParamType readonly,
@Totals int  out,
@PageCount int out
as
begin
	declare @Search nvarchar(max),
			@PageSize int,
			@PageNumber int

	declare @whereSql nvarchar(max) = 'where status = 1 and 1=1',
			@sql nvarchar(max) = ''
	
	select top 1 @Search = Search,@PageSize = PageSize,@PageNumber = PageNumber from @BaseParam
	select @Totals = count(Id) from slide
	set @PageCount = iif(@Totals % @PageSize=0,@Totals / @PageSize,@Totals / @PageSize+1)
	if ISNULL(@Search,'') != ''
		begin
			set @whereSql += N'and (Name like N''%'+@Search+'%'')'
		end
	set @sql = N'
		
		select 
		* from slide
		' + @whereSql + '
		order by [DisplayOrder]
		offset (@PageSize*(@PageNumber-1)) rows fetch next @PageSize rows only'
	print @Sql
	declare @Param nvarchar(max) = N'@Search nvarchar(max),@PageSize int,@PageNumber int,@Totals int,@PageCount int'
	EXEC sp_executesql @Sql,@Param,@Search,@PageSize,@PageNumber,@Totals,@PageCount
end

GO
/****** Object:  StoredProcedure [dbo].[shopgame_get_blog]    Script Date: 3/11/2022 9:51:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[shopgame_get_blog]
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
	select @Totals = count(Id) from Blog
	set @PageCount = iif(@Totals % @PageSize=0,@Totals / @PageSize,@Totals / @PageSize+1)
	if ISNULL(@Search,'') != ''
		begin
			set @whereSql += N'and (b.Name like N''%'+@Search+'%'' or bt.Name like N''%'+@Search+'%'')'
		end
	set @sql = N'
		select b.*,bt.Name BlogTypeName from Blog b
		join Blogtype bt on b.BlogTypeId = bt.BlogTypeId
		' + @whereSql + '
		order by b.Id
		offset (@PageSize*(@PageNumber-1)) rows fetch next @PageSize rows only'
	print @Sql
	declare @Param nvarchar(max) = N'@Search nvarchar(max),@PageSize int,@PageNumber int,@Totals int,@PageCount int'
	EXEC sp_executesql @Sql,@Param,@Search,@PageSize,@PageNumber,@Totals,@PageCount
end

GO
/****** Object:  StoredProcedure [dbo].[shopgame_get_blog_byId]    Script Date: 3/11/2022 9:51:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[shopgame_get_blog_byId]
@Id int
as
begin
	select bt.Name,b.* from Blog b
	join BlogType bt on b.BlogTypeId = bt.BlogTypeId
	where b.Id = @Id
end
GO
/****** Object:  StoredProcedure [dbo].[shopgame_get_blogtype]    Script Date: 3/11/2022 9:51:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[shopgame_get_blogtype]
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
	select @Totals = count(Id) from Account
	set @PageCount = iif(@Totals % @PageSize=0,@Totals / @PageSize,@Totals / @PageSize+1)
	if ISNULL(@Search,'') != ''
		begin
			set @whereSql += N'and (Name like N''%'+@Search+'%'')'
		end
	set @sql = N'
		select BlogTypeId Id,Name from BlogType
		' + @whereSql + '
		order by BlogTypeId
		offset (@PageSize*(@PageNumber-1)) rows fetch next @PageSize rows only'
	print @Sql
	declare @Param nvarchar(max) = N'@Search nvarchar(max),@PageSize int,@PageNumber int,@Totals int,@PageCount int'
	EXEC sp_executesql @Sql,@Param,@Search,@PageSize,@PageNumber,@Totals,@PageCount
end
GO
/****** Object:  StoredProcedure [dbo].[shopgame_get_blogtype_byId]    Script Date: 3/11/2022 9:51:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[shopgame_get_blogtype_byId]
@Id int
as
begin
	select BlogTypeId Id,Name from BlogType
	where BlogTypeId = @Id
end
GO
/****** Object:  StoredProcedure [dbo].[shopgame_get_cardadmin]    Script Date: 3/11/2022 9:51:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[shopgame_get_cardadmin]
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
	select @Totals = count(Id) from CardAdmin
	set @PageCount = iif(@Totals % @PageSize=0,@Totals / @PageSize,@Totals / @PageSize+1)
	if ISNULL(@Search,'') != ''
		begin
			set @whereSql += N'and (CardNumber like N''%'+@Search+'%'' 
								or CardType like N''%'+@Search+'%''
								or CardHolder like N''%'+@Search+'%''
								or CardBranch like N''%'+@Search+'%''
								or BankName like N''%'+@Search+'%'')'
		end
	set @sql = N'
		select * from CardAdmin
		' + @whereSql + '
		order by Id
		offset (@PageSize*(@PageNumber-1)) rows fetch next @PageSize rows only'
	print @Sql
	declare @Param nvarchar(max) = N'@Search nvarchar(max),@PageSize int,@PageNumber int,@Totals int,@PageCount int'
	EXEC sp_executesql @Sql,@Param,@Search,@PageSize,@PageNumber,@Totals,@PageCount
end
GO
/****** Object:  StoredProcedure [dbo].[shopgame_get_cardadmin_byId]    Script Date: 3/11/2022 9:51:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[shopgame_get_cardadmin_byId]
@Id int
as
begin
	select * from CardAdmin
	where Id = @Id
end
GO
/****** Object:  StoredProcedure [dbo].[shopgame_get_client_user_login_byId]    Script Date: 3/11/2022 9:51:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[shopgame_get_client_user_login_byId]
@Id int
as
begin
	select * from  [dbo].[User]
	where Id = @Id
end
GO
/****** Object:  StoredProcedure [dbo].[shopgame_get_GiaTriThe]    Script Date: 3/11/2022 9:51:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create proc [dbo].[shopgame_get_GiaTriThe]
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
			set @whereSql += N'and (Value like N''%'+@Search+'%'' or Name like N''%'+@Search+'%'')'
		end
	set @sql = N'
		
		select 
		* from GiaTriThe
		' + @whereSql + '
		order by [Value]
		offset (@PageSize*(@PageNumber-1)) rows fetch next @PageSize rows only'
	print @Sql
	declare @Param nvarchar(max) = N'@Search nvarchar(max),@PageSize int,@PageNumber int,@Totals int,@PageCount int'
	EXEC sp_executesql @Sql,@Param,@Search,@PageSize,@PageNumber,@Totals,@PageCount
end
GO
/****** Object:  StoredProcedure [dbo].[shopgame_get_GiaTriThe_byId]    Script Date: 3/11/2022 9:51:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[shopgame_get_GiaTriThe_byId]
@Id int
as
begin
	select * from GiaTriThe
	where Id = @Id
end
GO
/****** Object:  StoredProcedure [dbo].[shopgame_get_list_product_byProductCategoryId]    Script Date: 3/11/2022 9:51:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[shopgame_get_list_product_byProductCategoryId]
@BaseParam BaseParamType readonly,
@Totals int  out,
@PageCount int out,
@ProductCategoryId int out
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
			set @whereSql += N'and (p.Name like N''%'+@Search+'%'' or p.Code like N''%'+@Search+'%'' or p.Rank like N''%'+@Search+'%'' 
								or p.SoTuong like N''%'+@Search+'%'' or p.SoTrangPhuc like N''%'+@Search+'%'' 
								or p.Id like N''%'+@Search+'%'' or pr.price like N''%'+@Search+'%'' 
								or p.LoaiTaiKhoan like N''%'+@Search+'%'' or p.DangKy like N''%'+@Search+'%''
								or p.VIP like N''%'+@Search+'%'' or p.AccUserName like N''%'+@Search+'%'')'
		end
	if @ProductCategoryId > 0
		begin
			set @whereSql += N'and p.CategoryId ='+ CONVERT(varchar, @ProductCategoryId)+''
		end
		print @WhereSql
	set @sql = N'
		select p.*,pc.Name as CategoryName,pr.Price,pr.CreatedDate from Product p
			join ProductCategory pc on p.CategoryId = pc.Id
			outer apply(
			select top 1 * from ProductPrice pri
			where pri.ProductId = p.Id
			order by pri.CreatedDate desc
			) as pr
		' + @whereSql + '
		order by p.Id
		offset (@PageSize*(@PageNumber-1)) rows fetch next @PageSize rows only'
	print @Sql
	declare @Param nvarchar(max) = N'@Search nvarchar(max),@PageSize int,@PageNumber int,@Totals int,@PageCount int, @ProductCategoryId int'
	EXEC sp_executesql @Sql,@Param,@Search,@PageSize,@PageNumber,@Totals,@PageCount, @ProductCategoryId
end
GO
/****** Object:  StoredProcedure [dbo].[shopgame_get_list_product_byProductId]    Script Date: 3/11/2022 9:51:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[shopgame_get_list_product_byProductId]
@BaseParam BaseParamType readonly,
@Totals int  out,
@PageCount int out,
@ProductCategoryId int 
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
			set @whereSql += N'and (p.Name like N''%'+@Search+'%'' or p.Code like N''%'+@Search+'%'' or p.Rank like N''%'+@Search+'%'' 
								or p.SoTuong like N''%'+@Search+'%'' or p.SoTrangPhuc like N''%'+@Search+'%'' 
								or p.LoaiTaiKhoan like N''%'+@Search+'%'' or p.DangKy like N''%'+@Search+'%''
								or p.VIP like N''%'+@Search+'%'' or p.AccUserName like N''%'+@Search+'%'')'
		end
	if @ProductCategoryId > 0
		begin
			set @whereSql += N'and p.CategoryId ='+ CONVERT(varchar, @ProductCategoryId)+''
		end
		print @WhereSql
	set @sql = N'
		select p.*,pc.Name as CategoryName, pr.Price as Price from Product p
		join ProductCategory pc on p.CategoryId = pc.Id
		join ProductPrice pr on  pr.ProductId = (select top 1 ProductId from ProductPrice pri where pri.ProductId = p.Id  order by Id desc)
		' + @whereSql + '
		order by p.Id
		offset (@PageSize*(@PageNumber-1)) rows fetch next @PageSize rows only'
	print @Sql
	declare @Param nvarchar(max) = N'@Search nvarchar(max),@PageSize int,@PageNumber int,@Totals int,@PageCount int, @ProductCategoryId int'
	EXEC sp_executesql @Sql,@Param,@Search,@PageSize,@PageNumber,@Totals,@PageCount, @ProductCategoryId
end
GO
/****** Object:  StoredProcedure [dbo].[shopgame_get_list_ProductTransaction]    Script Date: 3/11/2022 9:51:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[shopgame_get_list_ProductTransaction]
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
			set @whereSql += N'and (pt.Name like N''%'+@Search+'%'' 
									or pt.IdGame like N''%'+@Search+'%'' 
									or pt.AccUserName like N''%'+@Search+'%'' 
									or u.UserName like N''%'+@Search+'%'')'
		end
	set @sql = N'
		
		select pt.*, u.UserName from ProductTransaction pt 
		join  [User] u on pt.userid = u.id 
		' + @whereSql + '
		order by CreatedDate DESC  
		offset (@PageSize*(@PageNumber-1)) rows fetch next @PageSize rows only'
	print @Sql
	declare @Param nvarchar(max) = N'@Search nvarchar(max),@PageSize int,@PageNumber int,@Totals int,@PageCount int'
	EXEC sp_executesql @Sql,@Param,@Search,@PageSize,@PageNumber,@Totals,@PageCount
end
GO
/****** Object:  StoredProcedure [dbo].[shopgame_get_list_ProductTransaction_by_UserId]    Script Date: 3/11/2022 9:51:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[shopgame_get_list_ProductTransaction_by_UserId]
@BaseParam BaseParamType readonly,
@Totals int  out,
@PageCount int out,
@UserId int out
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
			set @whereSql += N'and (Name like N''%'+@Search+'%''
									or Price like N''%'+@Search+'%''
									or AccUserName like N''%'+@Search+'%'')'
		end
	if @UserId > 0
		begin
			set @whereSql += N'and UserId ='+ CONVERT(varchar, @UserId)+''
		end
		print @WhereSql
	set @sql = N'
		select *from ProductTransaction
		' + @whereSql + '
		order by Id desc
		offset (@PageSize*(@PageNumber-1)) rows fetch next @PageSize rows only'
	print @Sql
	declare @Param nvarchar(max) = N'@Search nvarchar(max),@PageSize int,@PageNumber int,@Totals int,@PageCount int, @UserId int'
	EXEC sp_executesql @Sql,@Param,@Search,@PageSize,@PageNumber,@Totals,@PageCount, @UserId
end
GO
/****** Object:  StoredProcedure [dbo].[shopgame_get_list_skin_bySkinCategoryId]    Script Date: 3/11/2022 9:51:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[shopgame_get_list_skin_bySkinCategoryId]
@BaseParam BaseParamType readonly,
@Totals int  out,
@PageCount int out,
@SkinCategoryId int out
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
			set @whereSql += N'and (s.Name like N''%'+@Search+'%'' 
							or pk.Price like N''%'+@Search+'%''
							)'
		end
	if @SkinCategoryId > 0
		begin
			set @whereSql += N'and s.SkinCategoryId ='+ CONVERT(varchar, @SkinCategoryId)+''
		end
		print @WhereSql
	set @sql = N'
		select s.*,sc.Name as SkinCategoryName, pk.price from Skin s
		join SkinCategory sc on s.SkinCategoryId = sc.Id
		outer apply( select top 1 * from SkinPrice pri where pri.SkinId = s.id  order by Id desc)
		as pk
		' + @whereSql + '
		order by s.Id
		offset (@PageSize*(@PageNumber-1)) rows fetch next @PageSize rows only'
	print @Sql
	declare @Param nvarchar(max) = N'@Search nvarchar(max),@PageSize int,@PageNumber int,@Totals int,@PageCount int, @SkinCategoryId int'
	EXEC sp_executesql @Sql,@Param,@Search,@PageSize,@PageNumber,@Totals,@PageCount, @SkinCategoryId
end
GO
/****** Object:  StoredProcedure [dbo].[shopgame_get_login_byId]    Script Date: 3/11/2022 9:51:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[shopgame_get_login_byId]
@Id int
as
begin
	select * from Account
	where Id = @Id
end
GO
/****** Object:  StoredProcedure [dbo].[shopgame_get_masterdata]    Script Date: 3/11/2022 9:51:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[shopgame_get_masterdata]
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
	select @Totals = count(Id) from masterdata
	set @PageCount = iif(@Totals % @PageSize=0,@Totals / @PageSize,@Totals / @PageSize+1)
	if ISNULL(@Search,'') != ''
		begin
			set @whereSql += N'and (name like N''%'+@Search+'%'' )'
		end
	set @sql = N'
		select * from masterdata
		' + @whereSql + '
		order by Id
		offset (@PageSize*(@PageNumber-1)) rows fetch next @PageSize rows only'
	print @Sql
	declare @Param nvarchar(max) = N'@Search nvarchar(max),@PageSize int,@PageNumber int,@Totals int,@PageCount int'
	EXEC sp_executesql @Sql,@Param,@Search,@PageSize,@PageNumber,@Totals,@PageCount
end
GO
/****** Object:  StoredProcedure [dbo].[shopgame_get_masterdata_byId]    Script Date: 3/11/2022 9:51:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[shopgame_get_masterdata_byId]
@Id int
as
begin
	select * from masterdata
	where Id = @Id
end
GO
/****** Object:  StoredProcedure [dbo].[shopgame_get_NapTheTransaction]    Script Date: 3/11/2022 9:51:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[shopgame_get_NapTheTransaction]
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
			set @whereSql += N'and (n.Mathe like N''%'+@Search+'%''
									or n.Mathe like N''%'+@Search+'%''
									or n.serial like N''%'+@Search+'%''
									or ncc.name like N''%'+@Search+'%''
									or gtt.value like N''%'+@Search+'%''
									or gtt.name like N''%'+@Search+'%''
			)'
		end
	set @sql = N'
		
		select n.*,ncc.Name as [TenNCC],gtt.name as [TenGTT] , gtt.[Value],gtt.[Percent] from [dbo].NapTheTransaction n
		join NCC ncc on n.NCCId = ncc.Id
		join GiaTriThe gtt on n.GiaTriTheId = gtt.id
		' + @whereSql + '
		order by Id
		offset (@PageSize*(@PageNumber-1)) rows fetch next @PageSize rows only'
	print @Sql
	declare @Param nvarchar(max) = N'@Search nvarchar(max),@PageSize int,@PageNumber int,@Totals int,@PageCount int'
	EXEC sp_executesql @Sql,@Param,@Search,@PageSize,@PageNumber,@Totals,@PageCount
end
GO
/****** Object:  StoredProcedure [dbo].[shopgame_get_NapTheTransaction_by_UserId]    Script Date: 3/11/2022 9:51:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[shopgame_get_NapTheTransaction_by_UserId]
@BaseParam BaseParamType readonly,
@Totals int  out,
@PageCount int out,
@UserId int out
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
			set @whereSql += N'and (n.Mathe like N''%'+@Search+'%''
									or n.Mathe like N''%'+@Search+'%''
									or n.serial like N''%'+@Search+'%''
									or ncc.name like N''%'+@Search+'%''
									or gtt.value like N''%'+@Search+'%''
									or gtt.name like N''%'+@Search+'%''
			)'
		end
if @UserId > 0
		begin
			set @whereSql += N'and UserId ='+ CONVERT(varchar, @UserId)+''
		end

	set @sql = N'
		
		select n.*,ncc.Name as [TenNCC],gtt.name as [TenGTT] , gtt.[Value],gtt.[Percent] from [dbo].NapTheTransaction n
		join NCC ncc on n.NCCId = ncc.Id
		join GiaTriThe gtt on n.GiaTriTheId = gtt.id
		' + @whereSql + '
		order by Id desc
		offset (@PageSize*(@PageNumber-1)) rows fetch next @PageSize rows only'
	print @Sql
	declare @Param nvarchar(max) = N'@Search nvarchar(max),@PageSize int,@PageNumber int,@Totals int,@PageCount int, @UserId int'
	EXEC sp_executesql @Sql,@Param,@Search,@PageSize,@PageNumber,@Totals,@PageCount, @UserId
end
GO
/****** Object:  StoredProcedure [dbo].[shopgame_get_NCC]    Script Date: 3/11/2022 9:51:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[shopgame_get_NCC]
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
			set @whereSql += N'and (Name like N''%'+@Search+'%'')'
		end
	set @sql = N'
		
		select 
		* from NCC
		' + @whereSql + '
		order by [Id]
		offset (@PageSize*(@PageNumber-1)) rows fetch next @PageSize rows only'
	print @Sql
	declare @Param nvarchar(max) = N'@Search nvarchar(max),@PageSize int,@PageNumber int,@Totals int,@PageCount int'
	EXEC sp_executesql @Sql,@Param,@Search,@PageSize,@PageNumber,@Totals,@PageCount
end
GO
/****** Object:  StoredProcedure [dbo].[shopgame_get_NCC_byId]    Script Date: 3/11/2022 9:51:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[shopgame_get_NCC_byId]
@Id int
as
begin
	select * from NCC
	where Id = @Id
end
GO
/****** Object:  StoredProcedure [dbo].[shopgame_get_notification]    Script Date: 3/11/2022 9:51:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[shopgame_get_notification]
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
	select @Totals = count(Id) from Notification
	set @PageCount = iif(@Totals % @PageSize=0,@Totals / @PageSize,@Totals / @PageSize+1)
	if ISNULL(@Search,'') != ''
		begin
			set @whereSql += N'and (Content like N''%'+@Search+'%'' )'
		end
	set @sql = N'
		select * from Notification
		' + @whereSql + '
		order by Id
		offset (@PageSize*(@PageNumber-1)) rows fetch next @PageSize rows only'
	print @Sql
	declare @Param nvarchar(max) = N'@Search nvarchar(max),@PageSize int,@PageNumber int,@Totals int,@PageCount int'
	EXEC sp_executesql @Sql,@Param,@Search,@PageSize,@PageNumber,@Totals,@PageCount
end

GO
/****** Object:  StoredProcedure [dbo].[shopgame_get_notification_byId]    Script Date: 3/11/2022 9:51:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[shopgame_get_notification_byId]
@Id int
as
begin
	select * from Notification
	where Id = @Id
end


-- skin category

GO
/****** Object:  StoredProcedure [dbo].[shopgame_get_product]    Script Date: 3/11/2022 9:51:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[shopgame_get_product]
@BaseParam BaseParamType readonly,
@Totals int  out,
@PageCount int out
as
begin
	declare @Search nvarchar(max),
			@PageSize int,
			@PageNumber int

	declare @whereSql nvarchar(max) = 'where 1=1 and pr.Price is not null ',
			@sql nvarchar(max) = ''
	
	select top 1 @Search = Search,@PageSize = PageSize,@PageNumber = PageNumber from @BaseParam
	select @Totals = count(Id) from Product
	set @PageCount = iif(@Totals % @PageSize=0,@Totals / @PageSize,@Totals / @PageSize+1)
	if ISNULL(@Search,'') != ''
		begin
			set @whereSql += N'and (p.Name like N''%'+@Search+'%'' 
								or p.Code like N''%'+@Search+'%'' 
								or p.Rank like N''%'+@Search+'%'' 
								or p.SoTuong like N''%'+@Search+'%'' 
								or p.SoTrangPhuc like N''%'+@Search+'%'' 
								or p.AccUserName like N''%'+@Search+'%''
								)'
		end
	set @sql = N'
		
			select p.*,pc.Name as CategoryName,pr.Price,pr.CreatedDate  from Product p
			join ProductCategory pc on p.CategoryId = pc.Id
			outer apply(
			select top 1 * from ProductPrice pri
			where pri.ProductId = p.Id
			order by pri.CreatedDate desc
			) as pr
		' + @whereSql + '
		order by p.Id
		offset (@PageSize*(@PageNumber-1)) rows fetch next @PageSize rows only'
	print @Sql
	declare @Param nvarchar(max) = N'@Search nvarchar(max),@PageSize int,@PageNumber int,@Totals int,@PageCount int'
	EXEC sp_executesql @Sql,@Param,@Search,@PageSize,@PageNumber,@Totals,@PageCount
end
GO
/****** Object:  StoredProcedure [dbo].[shopgame_get_product_transaction]    Script Date: 3/11/2022 9:51:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[shopgame_get_product_transaction]
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
			set @whereSql += N'and (Name like N''%'+@Search+'%'')'
		end
	set @sql = N'
		select  pt.*,u.UserName as TaiKhoan  from [dbo].[ProductTransaction] pt 
		join [dbo].[User] u on pt.UserId = u.id 
		' + @whereSql + '
		order by [CreatedDate]
		offset (@PageSize*(@PageNumber-1)) rows fetch next @PageSize rows only'
	print @Sql
	declare @Param nvarchar(max) = N'@Search nvarchar(max),@PageSize int,@PageNumber int,@Totals int,@PageCount int'
	EXEC sp_executesql @Sql,@Param,@Search,@PageSize,@PageNumber,@Totals,@PageCount
end
GO
/****** Object:  StoredProcedure [dbo].[shopgame_get_productcategory]    Script Date: 3/11/2022 9:51:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[shopgame_get_productcategory]
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
	select @Totals = count(Id) from ProductCategory
	set @PageCount = iif(@Totals % @PageSize=0,@Totals / @PageSize,@Totals / @PageSize+1)
	if ISNULL(@Search,'') != ''
		begin
			set @whereSql += N'and (p.Name like N''%'+@Search+'%''
									or pc.Name like N''%'+@Search+'%''	)'
		end
	set @sql = N'
		select pc.Id,pc.Name,pc.Image,pc.Description,  COUNT(p.CategoryId) as [Count]  from ProductCategory pc
		join Product p on pc.Id = p.CategoryId
		' + @whereSql + '
		group by  pc.Id,pc.Name,pc.Image,pc.Description, p.CategoryId
		order by Id
		offset (@PageSize*(@PageNumber-1)) rows fetch next @PageSize rows only'
	print @Sql
	declare @Param nvarchar(max) = N'@Search nvarchar(max),@PageSize int,@PageNumber int,@Totals int,@PageCount int'
	EXEC sp_executesql @Sql,@Param,@Search,@PageSize,@PageNumber,@Totals,@PageCount
end
GO
/****** Object:  StoredProcedure [dbo].[shopgame_get_productImage]    Script Date: 3/11/2022 9:51:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[shopgame_get_productImage]
@Id int
as begin
	select * from ProductImage
	where ProductId = @Id
end
GO
/****** Object:  StoredProcedure [dbo].[shopgame_get_ProductTransaction]    Script Date: 3/11/2022 9:51:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[shopgame_get_ProductTransaction]
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
			set @whereSql += N'and (Name like N''%'+@Search+'%'')'
		end
	set @sql = N'
		
		select * from [dbo].ProductTransaction
		' + @whereSql + '
		order by Id
		offset (@PageSize*(@PageNumber-1)) rows fetch next @PageSize rows only'
	print @Sql
	declare @Param nvarchar(max) = N'@Search nvarchar(max),@PageSize int,@PageNumber int,@Totals int,@PageCount int'
	EXEC sp_executesql @Sql,@Param,@Search,@PageSize,@PageNumber,@Totals,@PageCount
end
GO
/****** Object:  StoredProcedure [dbo].[shopgame_get_ProductTransaction_by_id]    Script Date: 3/11/2022 9:51:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[shopgame_get_ProductTransaction_by_id]
@Id int
as
begin
	select * from ProductTransaction
	where Id = @Id
end
GO
/****** Object:  StoredProcedure [dbo].[shopgame_get_ProductTransaction_byId]    Script Date: 3/11/2022 9:51:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[shopgame_get_ProductTransaction_byId]
@Id int
as
begin
	select * from ProductTransaction
	where Id = @Id
end
GO
/****** Object:  StoredProcedure [dbo].[shopgame_get_skin]    Script Date: 3/11/2022 9:51:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[shopgame_get_skin]
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
	select @Totals = count(Id) from Skin
	set @PageCount = iif(@Totals % @PageSize=0,@Totals / @PageSize,@Totals / @PageSize+1)
	if ISNULL(@Search,'') != ''
		begin
			set @whereSql += N'and (s.Name like N''%'+@Search+'%'' or sc.Name like N''%'+@Search+'%'')'
		end
	set @sql = N'
		select s.*,sc.Name as SkinCategoryName,spr.Price from Skin s
		join SkinCategory sc on s.SkinCategoryId = sc.Id
		outer apply(
			select top 1 * from SkinPrice pri
			where pri.SkinId = s.Id
			order by pri.CreatedDate desc
			) as spr
		' + @whereSql + '
		order by Id
		offset (@PageSize*(@PageNumber-1)) rows fetch next @PageSize rows only'
	print @Sql
	declare @Param nvarchar(max) = N'@Search nvarchar(max),@PageSize int,@PageNumber int,@Totals int,@PageCount int'
	EXEC sp_executesql @Sql,@Param,@Search,@PageSize,@PageNumber,@Totals,@PageCount
end
GO
/****** Object:  StoredProcedure [dbo].[shopgame_get_skin_byId]    Script Date: 3/11/2022 9:51:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[shopgame_get_skin_byId]
@Id int
as
begin
	select s.*,sc.Name as SkinCategoryName, pk.price  from Skin s
		join SkinCategory sc on s.SkinCategoryId = sc.Id
		outer apply( select top 1 * from SkinPrice pri where pri.SkinId = s.Id  order by Id desc)
		as pk
		where s.id = @Id
end
GO
/****** Object:  StoredProcedure [dbo].[shopgame_get_skincategory]    Script Date: 3/11/2022 9:51:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[shopgame_get_skincategory]
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
	select @Totals = count(Id) from SkinCategory
	set @PageCount = iif(@Totals % @PageSize=0,@Totals / @PageSize,@Totals / @PageSize+1)
	if ISNULL(@Search,'') != ''
		begin
			set @whereSql += N'and (sk.Name like N''%'+@Search+'%''
									or	s.Name like N''%'+@Search+'%'')'
		end
	set @sql = N'
		select sk.Id,sk.Name,sk.Image,sk.Description, count(s.SkinCategoryId) as [Count] from SkinCategory sk
		join Skin s on sk.id = s.SkinCategoryId
		' + @whereSql + '
		group by sk.Id,sk.Name,sk.Image,sk.Description, s.SkinCategoryId
		order by Id
		offset (@PageSize*(@PageNumber-1)) rows fetch next @PageSize rows only'
	print @Sql
	declare @Param nvarchar(max) = N'@Search nvarchar(max),@PageSize int,@PageNumber int,@Totals int,@PageCount int'
	EXEC sp_executesql @Sql,@Param,@Search,@PageSize,@PageNumber,@Totals,@PageCount
end
GO
/****** Object:  StoredProcedure [dbo].[shopgame_get_skincategory_byId]    Script Date: 3/11/2022 9:51:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[shopgame_get_skincategory_byId]
@Id int
as
begin
	select Id,Name,Image,Description,SkinsSold from SkinCategory
	where Id = @Id
end
GO
/****** Object:  StoredProcedure [dbo].[shopgame_get_slide]    Script Date: 3/11/2022 9:51:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[shopgame_get_slide]
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
	select @Totals = count(Id) from Slide
	set @PageCount = iif(@Totals % @PageSize=0,@Totals / @PageSize,@Totals / @PageSize+1)
	if ISNULL(@Search,'') != ''
		begin
			set @whereSql += N'and (Link like N''%'+@Search+'%'')'
		end
	set @sql = N'
		select * from Slide
		' + @whereSql + '
		order by Id
		offset (@PageSize*(@PageNumber-1)) rows fetch next @PageSize rows only'
	print @Sql
	declare @Param nvarchar(max) = N'@Search nvarchar(max),@PageSize int,@PageNumber int,@Totals int,@PageCount int'
	EXEC sp_executesql @Sql,@Param,@Search,@PageSize,@PageNumber,@Totals,@PageCount
end


GO
/****** Object:  StoredProcedure [dbo].[shopgame_get_slide_byId]    Script Date: 3/11/2022 9:51:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[shopgame_get_slide_byId]
@Id int
as
begin
	select * from Slide
	where Id = @Id
end



-- transaction category
GO
/****** Object:  StoredProcedure [dbo].[shopgame_get_Step]    Script Date: 3/11/2022 9:51:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[shopgame_get_Step]
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
			set @whereSql += N'and (Name like N''%'+@Search+'%'')'
		end
	set @sql = N'
		
		select 
		* from step
		' + @whereSql + '
		order by [Id]
		offset (@PageSize*(@PageNumber-1)) rows fetch next @PageSize rows only'
	print @Sql
	declare @Param nvarchar(max) = N'@Search nvarchar(max),@PageSize int,@PageNumber int,@Totals int,@PageCount int'
	EXEC sp_executesql @Sql,@Param,@Search,@PageSize,@PageNumber,@Totals,@PageCount
end

GO
/****** Object:  StoredProcedure [dbo].[shopgame_get_step_byId]    Script Date: 3/11/2022 9:51:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[shopgame_get_step_byId]
@Id int
as
begin
	select * from step
	where Id = @Id
end
GO
/****** Object:  StoredProcedure [dbo].[shopgame_get_step_client]    Script Date: 3/11/2022 9:51:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[shopgame_get_step_client]
@BaseParam BaseParamType readonly,
@Totals int  out,
@PageCount int out
as
begin
	declare @Search nvarchar(max),
			@PageSize int,
			@PageNumber int

	declare @whereSql nvarchar(max) = 'where status = 1 and 1=1',
			@sql nvarchar(max) = ''
	
	select top 1 @Search = Search,@PageSize = PageSize,@PageNumber = PageNumber from @BaseParam
	select @Totals = count(Id) from slide
	set @PageCount = iif(@Totals % @PageSize=0,@Totals / @PageSize,@Totals / @PageSize+1)
	if ISNULL(@Search,'') != ''
		begin
			set @whereSql += N'and (Name like N''%'+@Search+'%'')'
		end
	set @sql = N'
		
		select 
		* from step
		' + @whereSql + '
		order by [Id]
		offset (@PageSize*(@PageNumber-1)) rows fetch next @PageSize rows only'
	print @Sql
	declare @Param nvarchar(max) = N'@Search nvarchar(max),@PageSize int,@PageNumber int,@Totals int,@PageCount int'
	EXEC sp_executesql @Sql,@Param,@Search,@PageSize,@PageNumber,@Totals,@PageCount
end

GO
/****** Object:  StoredProcedure [dbo].[shopgame_get_transactiontype]    Script Date: 3/11/2022 9:51:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[shopgame_get_transactiontype]
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
	select @Totals = count(Id) from TransactionCategoryType
	set @PageCount = iif(@Totals % @PageSize=0,@Totals / @PageSize,@Totals / @PageSize+1)
	if ISNULL(@Search,'') != ''
		begin
			set @whereSql += N'and (Name like N''%'+@Search+'%'')'
		end
	set @sql = N'
		select Id,Name from TransactionCategoryType
		' + @whereSql + '
		order by Id
		offset (@PageSize*(@PageNumber-1)) rows fetch next @PageSize rows only'
	print @Sql
	declare @Param nvarchar(max) = N'@Search nvarchar(max),@PageSize int,@PageNumber int,@Totals int,@PageCount int'
	EXEC sp_executesql @Sql,@Param,@Search,@PageSize,@PageNumber,@Totals,@PageCount
end


GO
/****** Object:  StoredProcedure [dbo].[shopgame_get_transactiontype_byId]    Script Date: 3/11/2022 9:51:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[shopgame_get_transactiontype_byId]
@Id int
as
begin
	select Id,Name from TransactionCategoryType
	where Id = @Id
end



GO
/****** Object:  StoredProcedure [dbo].[shopgame_get_user]    Script Date: 3/11/2022 9:51:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[shopgame_get_user]
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
		
		select Id,UserName,HashedPassword,Name,Email,Balance,Phone,CreatedDate from [dbo].[User]
		' + @whereSql + '
		order by Id
		offset (@PageSize*(@PageNumber-1)) rows fetch next @PageSize rows only'
	print @Sql
	declare @Param nvarchar(max) = N'@Search nvarchar(max),@PageSize int,@PageNumber int,@Totals int,@PageCount int'
	EXEC sp_executesql @Sql,@Param,@Search,@PageSize,@PageNumber,@Totals,@PageCount
end
GO
/****** Object:  StoredProcedure [dbo].[shopgame_get_user_by_email]    Script Date: 3/11/2022 9:51:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[shopgame_get_user_by_email]
@Email nvarchar(255)
as
begin
	select *  from [User]
	where Email = @Email
end
GO
/****** Object:  StoredProcedure [dbo].[shopgame_getbyId_product]    Script Date: 3/11/2022 9:51:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[shopgame_getbyId_product]
@Id int
as
begin
	select p.*,pc.Name as CategoryName,pr.Price,pr.CreatedDate from Product p
			join ProductCategory pc on p.CategoryId = pc.Id
			outer apply(
			select top 1 * from ProductPrice pri
			where pri.ProductId = p.Id
			order by pri.CreatedDate desc
			) as pr
	where p.Id = @Id
end

GO
/****** Object:  StoredProcedure [dbo].[shopgame_getbyid_productcategory]    Script Date: 3/11/2022 9:51:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[shopgame_getbyid_productcategory]
@Id int
as
begin
	select * from ProductCategory
	where Id = @Id
end
GO
/****** Object:  StoredProcedure [dbo].[shopgame_login]    Script Date: 3/11/2022 9:51:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[shopgame_login]
@UserName nvarchar(255),
@HashedPassword nvarchar(255)
as
begin
	select * from Account
	where UserName = @UserName and HashedPassword = @HashedPassword
end
GO
USE [master]
GO
ALTER DATABASE [ShopGame] SET  READ_WRITE 
GO
