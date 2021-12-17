USE [master]
GO
/****** Object:  Database [GameShop]    Script Date: 8/12/2021 5:56:27 PM ******/
CREATE DATABASE [GameShop]
GO
ALTER DATABASE [GameShop] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GameShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GameShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GameShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GameShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GameShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GameShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [GameShop] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [GameShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GameShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GameShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GameShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GameShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GameShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GameShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GameShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GameShop] SET  ENABLE_BROKER 
GO
ALTER DATABASE [GameShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GameShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GameShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GameShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GameShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GameShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [GameShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GameShop] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [GameShop] SET  MULTI_USER 
GO
ALTER DATABASE [GameShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GameShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GameShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GameShop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [GameShop] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [GameShop] SET QUERY_STORE = OFF
GO
USE [GameShop]
GO
/****** Object:  UserDefinedTableType [dbo].[BaseParamType]    Script Date: 8/12/2021 5:56:27 PM ******/
CREATE TYPE [dbo].[BaseParamType] AS TABLE(
	[Search] [nvarchar](max) NULL,
	[PageSize] [int] NULL,
	[PageNumber] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[ProductImages]    Script Date: 8/12/2021 5:56:27 PM ******/
CREATE TYPE [dbo].[ProductImages] AS TABLE(
	[Id] [int] NULL,
	[ProductId] [int] NULL,
	[Image] [nvarchar](max) NULL
)
GO
/****** Object:  Table [dbo].[Account]    Script Date: 8/12/2021 5:56:27 PM ******/
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
/****** Object:  Table [dbo].[Blog]    Script Date: 8/12/2021 5:56:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blog](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[MetaTitle] [nvarchar](255) NULL,
	[Description] [nvarchar](255) NULL,
	[CreatedDate] [datetime] NULL,
	[BlogTypeId] [int] NULL,
	[Image] [nvarchar](500) NULL,
 CONSTRAINT [PK_Blog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BlogType]    Script Date: 8/12/2021 5:56:27 PM ******/
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
/****** Object:  Table [dbo].[CardAdmin]    Script Date: 8/12/2021 5:56:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CardAdmin](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CardNumber] [int] NULL,
	[CardType] [nvarchar](255) NULL,
	[CardHolder] [nvarchar](255) NULL,
	[CardBranch] [nvarchar](255) NULL,
 CONSTRAINT [PK_CardAdmin] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DiscountCode]    Script Date: 8/12/2021 5:56:27 PM ******/
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
/****** Object:  Table [dbo].[Menu]    Script Date: 8/12/2021 5:56:27 PM ******/
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
/****** Object:  Table [dbo].[Notification]    Script Date: 8/12/2021 5:56:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notification](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Content] [nvarchar](255) NULL,
	[Image] [nvarchar](255) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Notification] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 8/12/2021 5:56:27 PM ******/
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
	[Images] [nvarchar](500) NULL,
	[MoreImage] [nvarchar](255) NULL,
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
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCategory]    Script Date: 8/12/2021 5:56:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](500) NULL,
	[Image] [nvarchar](500) NULL,
	[Description] [nvarchar](500) NULL,
 CONSTRAINT [PK_ProductCategory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductImage]    Script Date: 8/12/2021 5:56:27 PM ******/
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
/****** Object:  Table [dbo].[ProductPrice]    Script Date: 8/12/2021 5:56:27 PM ******/
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
/****** Object:  Table [dbo].[Skin]    Script Date: 8/12/2021 5:56:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Skin](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[Image] [nvarchar](500) NULL,
	[SkinCategoryId] [int] NULL,
	[Piece] [decimal](18, 0) NULL,
	[Createdate] [datetime] NULL,
 CONSTRAINT [PK_Skin] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SkinCategory]    Script Date: 8/12/2021 5:56:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SkinCategory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nchar](10) NULL,
 CONSTRAINT [PK_SkinCategory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Slide]    Script Date: 8/12/2021 5:56:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slide](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Image] [nvarchar](255) NULL,
	[DisplayOrder] [int] NULL,
	[Link] [nvarchar](255) NULL,
	[Description] [nvarchar](255) NULL,
	[CreatedDate] [datetime] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Slide] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SpinLuck]    Script Date: 8/12/2021 5:56:27 PM ******/
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
/****** Object:  Table [dbo].[SpinLuckType]    Script Date: 8/12/2021 5:56:27 PM ******/
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
/****** Object:  Table [dbo].[Transaction]    Script Date: 8/12/2021 5:56:27 PM ******/
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
	[Status] [bit] NULL,
	[TheCao] [nvarchar](255) NULL,
	[LoaiThe] [nvarchar](255) NULL,
	[KieuNap] [nvarchar](255) NULL,
	[MaThe] [nvarchar](255) NULL,
	[TransactionCategoryTypeId] [int] NOT NULL,
	[UserId] [int] NULL,
 CONSTRAINT [PK_Transaction] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TransactionCategoryType]    Script Date: 8/12/2021 5:56:27 PM ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 8/12/2021 5:56:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] NOT NULL,
	[UserName] [nvarchar](255) NULL,
	[HashedPassword] [nvarchar](255) NULL,
	[Name] [nvarchar](255) NULL,
	[Email] [nvarchar](255) NULL,
	[CreatedDate] [datetime] NULL,
	[Balance] [decimal](18, 0) NULL,
	[Phone] [nvarchar](255) NULL,
 CONSTRAINT [PK_User_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserItem]    Script Date: 8/12/2021 5:56:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserItem](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
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

INSERT [dbo].[Account] ([Id], [UserName], [HashedPassword]) VALUES (1, N'admin', N'Jc48xDJ3HD0=')
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[BlogType] ON 

INSERT [dbo].[BlogType] ([BlogTypeId], [Name]) VALUES (2, N'123123')
INSERT [dbo].[BlogType] ([BlogTypeId], [Name]) VALUES (3, N'123123')
INSERT [dbo].[BlogType] ([BlogTypeId], [Name]) VALUES (4, N'123')
SET IDENTITY_INSERT [dbo].[BlogType] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductCategory] ON 

INSERT [dbo].[ProductCategory] ([Id], [Name], [Image], [Description]) VALUES (1, N'xin chao', N'/Admin/Content/images/no-image-available-thumb(1349x760-crop).jpg', N'ádasd')
INSERT [dbo].[ProductCategory] ([Id], [Name], [Image], [Description]) VALUES (2, N'234234', N'/Admin/Content/Upload/120210811142319224447824_557950131914826_6293216930518805489_n.jpg', N'qưeqwe')
INSERT [dbo].[ProductCategory] ([Id], [Name], [Image], [Description]) VALUES (3, N'ád', N'/Admin/Content/Upload/120210811203923Screenshot (3).png', N'ấdasd')
INSERT [dbo].[ProductCategory] ([Id], [Name], [Image], [Description]) VALUES (4, N'ád', N'/Admin/Content/Upload/120210811204026Screenshot (1).png', N'ad')
SET IDENTITY_INSERT [dbo].[ProductCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductImage] ON 

INSERT [dbo].[ProductImage] ([Id], [Image], [ProductId]) VALUES (7, N'/Admin/Content/Upload/120210812000924Screenshot (2).png', 1)
INSERT [dbo].[ProductImage] ([Id], [Image], [ProductId]) VALUES (8, N'/Admin/Content/Upload/120210812000924Screenshot (3).png', 1)
INSERT [dbo].[ProductImage] ([Id], [Image], [ProductId]) VALUES (9, N'/Admin/Content/Upload/120210812000924Screenshot (4).png', 1)
INSERT [dbo].[ProductImage] ([Id], [Image], [ProductId]) VALUES (10, N'/Admin/Content/Upload/120210812001033Screenshot (2).png', 0)
INSERT [dbo].[ProductImage] ([Id], [Image], [ProductId]) VALUES (11, N'/Admin/Content/Upload/120210812001033Screenshot (3).png', 0)
INSERT [dbo].[ProductImage] ([Id], [Image], [ProductId]) VALUES (12, N'/Admin/Content/Upload/120210812001033Screenshot (4).png', 0)
INSERT [dbo].[ProductImage] ([Id], [Image], [ProductId]) VALUES (13, N'/Admin/Content/Upload/120210812102148Screenshot (3).png', 5)
INSERT [dbo].[ProductImage] ([Id], [Image], [ProductId]) VALUES (14, N'/Admin/Content/Upload/120210812102148Screenshot (4).png', 5)
INSERT [dbo].[ProductImage] ([Id], [Image], [ProductId]) VALUES (15, N'/Admin/Content/Upload/120210812102148Screenshot (5).png', 5)
INSERT [dbo].[ProductImage] ([Id], [Image], [ProductId]) VALUES (26, N'/Admin/Content/Upload/120210812105528Screenshot (2).png', 3)
INSERT [dbo].[ProductImage] ([Id], [Image], [ProductId]) VALUES (27, N'/Admin/Content/Upload/120210812105528Screenshot (4).png', 3)
INSERT [dbo].[ProductImage] ([Id], [Image], [ProductId]) VALUES (28, N'/Admin/Content/Upload/120210812110217Screenshot (1).png', 3)
SET IDENTITY_INSERT [dbo].[ProductImage] OFF
GO
/****** Object:  StoredProcedure [dbo].[shopgame_check_delete_productcategory]    Script Date: 8/12/2021 5:56:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
alter proc [dbo].[shopgame_check_delete_productcategory]
@Id int
as
begin
  declare @Check int
  select @Check = COUNT(Id) from Product
  where CategoryId = @Id
  select @Check = 0
end
GO
/****** Object:  StoredProcedure [dbo].[shopgame_create_blog]    Script Date: 8/12/2021 5:56:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
alter proc [dbo].[shopgame_create_blog]
@Id int,
@Name nvarchar(500),
@MetaTitle nvarchar(500),
@Description nvarchar(500),
@BlogTypeId int
as
begin
 if @Id = 0
	begin
		insert into Blog(Name,MetaTitle,Description,BlogTypeId,CreatedDate) values (@Name,@MetaTitle,@Description,@BlogTypeId,GETDATE())
		select iif(@@ROWCOUNT>0,1,0)
	end

 else
	begin
	    update Blog
		set Name = @Name,
		MetaTitle =@MetaTitle,
		Description = @Description,
		BlogTypeId = @BlogTypeId
		where Id = @Id
		select iif(@@ROWCOUNT>0,1,0)
	end
end

GO
/****** Object:  StoredProcedure [dbo].[shopgame_create_blogtype]    Script Date: 8/12/2021 5:56:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
alter proc [dbo].[shopgame_create_blogtype]
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
/****** Object:  StoredProcedure [dbo].[shopgame_create_login]    Script Date: 8/12/2021 5:56:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[shopgame_create_login]
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
				end
			else
				begin
					select 0
				end
		end
end
GO
/****** Object:  StoredProcedure [dbo].[shopgame_create_product]    Script Date: 8/12/2021 5:56:27 PM ******/
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
@ProductImage ProductImages readonly
as
begin
	if @Id = 0
		begin
			insert into Product (Code,Name,Description,[Images],CategoryId,Detail,OrderNo,Rank,SoTuong,SoTrangPhuc,LoaiTaiKhoan,NoiBat,DangKy,VIP,[Top],AccUserName,AccPassword,Metatitle,MetaDescription,Status)
			values (@Code,@Name,@Description,@Image,@CategoryId,@Detail,@OrderNo,@Rank,@SoTuong,@SoTrangPhuc,@LoaiTaiKhoan,@NoiBat,@DangKy,@VIP,@Top,@AccUserName,@AccPassword,@MetaTitle,@MetaDescription,@Status)

			declare @IdNew int
			select top 1 @IdNew = Id from Product order by Id desc

			insert into ProductImage(ProductId,Image) 
			select @IdNew,Image from @ProductImage

		end
	else
		begin
			Update Product
			set Code = @Code,
				Name = @Name,
				Description = @Description,
				Images = @Image,
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
		end

		select IIF(@@ROWCOUNT>0,1,0)
end

GO
/****** Object:  StoredProcedure [dbo].[shopgame_create_productcategory]    Script Date: 8/12/2021 5:56:27 PM ******/
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
/****** Object:  StoredProcedure [dbo].[shopgame_delete_blog]    Script Date: 8/12/2021 5:56:27 PM ******/
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
/****** Object:  StoredProcedure [dbo].[shopgame_delete_blogtype]    Script Date: 8/12/2021 5:56:27 PM ******/
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
/****** Object:  StoredProcedure [dbo].[shopgame_delete_login]    Script Date: 8/12/2021 5:56:27 PM ******/
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
/****** Object:  StoredProcedure [dbo].[shopgame_delete_product]    Script Date: 8/12/2021 5:56:27 PM ******/
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
/****** Object:  StoredProcedure [dbo].[shopgame_delete_productcategory]    Script Date: 8/12/2021 5:56:27 PM ******/
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
/****** Object:  StoredProcedure [dbo].[shopgame_get_account]    Script Date: 8/12/2021 5:56:27 PM ******/
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
/****** Object:  StoredProcedure [dbo].[shopgame_get_blog]    Script Date: 8/12/2021 5:56:27 PM ******/
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
	select @Totals = count(Id) from Account
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
/****** Object:  StoredProcedure [dbo].[shopgame_get_blog_byId]    Script Date: 8/12/2021 5:56:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
alter proc [dbo].[shopgame_get_blog_byId]
@Id int
as
begin
	select bt.Name,b.* from Blog b
	join BlogType bt on b.BlogTypeId = bt.BlogTypeId
	where b.Id = @Id
end
GO
/****** Object:  StoredProcedure [dbo].[shopgame_get_blogtype]    Script Date: 8/12/2021 5:56:27 PM ******/
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
/****** Object:  StoredProcedure [dbo].[shopgame_get_blogtype_byId]    Script Date: 8/12/2021 5:56:27 PM ******/
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
/****** Object:  StoredProcedure [dbo].[shopgame_get_login_byId]    Script Date: 8/12/2021 5:56:27 PM ******/
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
/****** Object:  StoredProcedure [dbo].[shopgame_get_product]    Script Date: 8/12/2021 5:56:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[shopgame_get_product]
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
			set @whereSql += N'and (p.Name like N''%'+@Search+'%'' or p.Code like N''%'+@Search+'%'' or p.Rank like N''%'+@Search+'%'' 
								or p.SoTuong like N''%'+@Search+'%'' or p.SoTrangPhuc like N''%'+@Search+'%'' 
								or p.LoaiTaiKhoan like N''%'+@Search+'%'' or p.DangKy like N''%'+@Search+'%''
								or p.VIP like N''%'+@Search+'%'' or p.AccUserName like N''%'+@Search+'%'')'
		end
	set @sql = N'
		
		select p.*,pc.Name as CategoryName from Product p
		join ProductCategory pc on p.CategoryId = pc.Id
		' + @whereSql + '
		order by p.Id
		offset (@PageSize*(@PageNumber-1)) rows fetch next @PageSize rows only'
	print @Sql
	declare @Param nvarchar(max) = N'@Search nvarchar(max),@PageSize int,@PageNumber int,@Totals int,@PageCount int'
	EXEC sp_executesql @Sql,@Param,@Search,@PageSize,@PageNumber,@Totals,@PageCount
end
GO
/****** Object:  StoredProcedure [dbo].[shopgame_get_productcategory]    Script Date: 8/12/2021 5:56:27 PM ******/
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
	select @Totals = count(Id) from Account
	set @PageCount = iif(@Totals % @PageSize=0,@Totals / @PageSize,@Totals / @PageSize+1)
	if ISNULL(@Search,'') != ''
		begin
			set @whereSql += N'and (Name like N''%'+@Search+'%'')'
		end
	set @sql = N'
		
		select Id,Name,Image,Description from ProductCategory
		' + @whereSql + '
		order by Id
		offset (@PageSize*(@PageNumber-1)) rows fetch next @PageSize rows only'
	print @Sql
	declare @Param nvarchar(max) = N'@Search nvarchar(max),@PageSize int,@PageNumber int,@Totals int,@PageCount int'
	EXEC sp_executesql @Sql,@Param,@Search,@PageSize,@PageNumber,@Totals,@PageCount
end

GO
/****** Object:  StoredProcedure [dbo].[shopgame_get_productImage]    Script Date: 8/12/2021 5:56:27 PM ******/
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
/****** Object:  StoredProcedure [dbo].[shopgame_getbyId_product]    Script Date: 8/12/2021 5:56:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[shopgame_getbyId_product]
@Id int
as
begin
	select p.*,pc.Name as CategoryName from Product p
	join ProductCategory pc on p.CategoryId = pc.Id
	where p.Id = @Id
end
GO
/****** Object:  StoredProcedure [dbo].[shopgame_getbyid_productcategory]    Script Date: 8/12/2021 5:56:27 PM ******/
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
/****** Object:  StoredProcedure [dbo].[shopgame_login]    Script Date: 8/12/2021 5:56:27 PM ******/
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
ALTER DATABASE [GameShop] SET  READ_WRITE 
GO
