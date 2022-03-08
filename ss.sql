USE [master]
GO
/****** Object:  Database [NIDAS_SHOES]    Script Date: 3/3/2022 7:11:27 PM ******/
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
/****** Object:  UserDefinedTableType [dbo].[BaseParamType]    Script Date: 3/3/2022 7:11:27 PM ******/
CREATE TYPE [dbo].[BaseParamType] AS TABLE(
	[Search] [nvarchar](max) NULL,
	[PageSize] [int] NULL,
	[PageNumber] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[ProductImages]    Script Date: 3/3/2022 7:11:27 PM ******/
CREATE TYPE [dbo].[ProductImages] AS TABLE(
	[Id] [int] NULL,
	[ProductDetailId] [int] NULL,
	[Image] [nvarchar](max) NULL
)
GO
/****** Object:  Table [dbo].[Color]    Script Date: 3/3/2022 7:11:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Color](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[Image] [nvarchar](max) NULL,
 CONSTRAINT [PK_Color] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Discount]    Script Date: 3/3/2022 7:11:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Discount](
	[ID] [int] IDENTITY(1,1) NOT NULL,
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
/****** Object:  Table [dbo].[FeedBack]    Script Date: 3/3/2022 7:11:27 PM ******/
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
/****** Object:  Table [dbo].[Images]    Script Date: 3/3/2022 7:11:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Images](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NULL,
	[Name] [nvarchar](255) NULL,
	[Url] [nvarchar](255) NULL,
 CONSTRAINT [PK_Images] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 3/3/2022 7:11:27 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 3/3/2022 7:11:27 PM ******/
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
/****** Object:  Table [dbo].[OrderStatus]    Script Date: 3/3/2022 7:11:27 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 3/3/2022 7:11:27 PM ******/
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
/****** Object:  Table [dbo].[Product]    Script Date: 3/3/2022 7:11:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductCategoryID] [int] NULL,
	[Code] [nvarchar](255) NULL,
	[Name] [nvarchar](255) NULL,
	[Title] [nvarchar](255) NULL,
	[Description] [nvarchar](max) NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCategory]    Script Date: 3/3/2022 7:11:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ParentID] [nvarchar](255) NULL,
	[Name] [nvarchar](255) NULL,
	[Description] [nvarchar](255) NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_ProductCategory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductDetail]    Script Date: 3/3/2022 7:11:27 PM ******/
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
/****** Object:  Table [dbo].[ProductPrice]    Script Date: 3/3/2022 7:11:27 PM ******/
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
/****** Object:  Table [dbo].[ProductReview]    Script Date: 3/3/2022 7:11:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductReview](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[ProductID] [int] NULL,
	[Star] [float] NULL,
	[Favorite] [int] NULL,
 CONSTRAINT [PK_ProductReview] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Receipt]    Script Date: 3/3/2022 7:11:27 PM ******/
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
/****** Object:  Table [dbo].[ReceiptDetail]    Script Date: 3/3/2022 7:11:27 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rule]    Script Date: 3/3/2022 7:11:27 PM ******/
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
/****** Object:  Table [dbo].[Shop]    Script Date: 3/3/2022 7:11:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shop](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
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
/****** Object:  Table [dbo].[Size]    Script Date: 3/3/2022 7:11:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Size](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
 CONSTRAINT [PK_Size] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Slide]    Script Date: 3/3/2022 7:11:27 PM ******/
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
	[Status] [int] NULL,
 CONSTRAINT [PK_Slide] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 3/3/2022 7:11:27 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supply]    Script Date: 3/3/2022 7:11:27 PM ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 3/3/2022 7:11:27 PM ******/
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
SET IDENTITY_INSERT [dbo].[Rule] ON 

INSERT [dbo].[Rule] ([ID], [Name]) VALUES (1, N'Admin')
INSERT [dbo].[Rule] ([ID], [Name]) VALUES (2, N'Management')
INSERT [dbo].[Rule] ([ID], [Name]) VALUES (3, N'Staff')
INSERT [dbo].[Rule] ([ID], [Name]) VALUES (4, N'User')
SET IDENTITY_INSERT [dbo].[Rule] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([ID], [RuleID], [UserName], [HashedPassword], [Name], [Email], [Address], [PhoneNumber]) VALUES (1, 1, N'Admin', N'ZCthc6xoqYg=', N'Admin', N'holongnhat2000@gmail.com', N'Hà Nội', N'0866721300')
INSERT [dbo].[User] ([ID], [RuleID], [UserName], [HashedPassword], [Name], [Email], [Address], [PhoneNumber]) VALUES (2, 2, N'Manager', N'ZCthc6xoqYg=', N'Manager', N'Manager', N'Manager', N'541564')
INSERT [dbo].[User] ([ID], [RuleID], [UserName], [HashedPassword], [Name], [Email], [Address], [PhoneNumber]) VALUES (3, 3, N'Staff', N'ZCthc6xoqYg=', N'Staff', N'324165', N'564', N'231654')
INSERT [dbo].[User] ([ID], [RuleID], [UserName], [HashedPassword], [Name], [Email], [Address], [PhoneNumber]) VALUES (4, 4, N'demo', N'ZCthc6xoqYg=', N'demo', N'54654', N'56435', N'4654')
INSERT [dbo].[User] ([ID], [RuleID], [UserName], [HashedPassword], [Name], [Email], [Address], [PhoneNumber]) VALUES (5, 4, N'nhat', N'hx5uYogkuCQ=', N'ten', N'email', N'dia chi nè', N'0866721300')
INSERT [dbo].[User] ([ID], [RuleID], [UserName], [HashedPassword], [Name], [Email], [Address], [PhoneNumber]) VALUES (6, 4, N'123', N'1x3R3eocF5Y=', N'123', N'123', N'123', N'0866721300')
SET IDENTITY_INSERT [dbo].[User] OFF
GO
/****** Object:  StoredProcedure [dbo].[NidasShoes_create_login]    Script Date: 3/3/2022 7:11:27 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_delete_user_login]    Script Date: 3/3/2022 7:11:27 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_get_user]    Script Date: 3/3/2022 7:11:27 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_get_user_by_email]    Script Date: 3/3/2022 7:11:27 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_get_user_login_byId]    Script Date: 3/3/2022 7:11:27 PM ******/
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
/****** Object:  StoredProcedure [dbo].[NidasShoes_user_login]    Script Date: 3/3/2022 7:11:27 PM ******/
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


EXEC [NidasShoes_get_user_by_email]