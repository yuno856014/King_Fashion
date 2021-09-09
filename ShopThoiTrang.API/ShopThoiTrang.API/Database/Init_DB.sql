
USE [ThoiTrangOnline]
GO
/****** Object:  Database [ThoiTrangOnline]    Script Date: 9/8/2021 10:52:35 AM ******/
CREATE DATABASE [ThoiTrangOnline]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ThoiTrangOnline', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.VANDUYSQL\MSSQL\DATA\ThoiTrangOnline.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ThoiTrangOnline_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.VANDUYSQL\MSSQL\DATA\ThoiTrangOnline_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ThoiTrangOnline] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ThoiTrangOnline].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ThoiTrangOnline] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ThoiTrangOnline] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ThoiTrangOnline] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ThoiTrangOnline] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ThoiTrangOnline] SET ARITHABORT OFF 
GO
ALTER DATABASE [ThoiTrangOnline] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ThoiTrangOnline] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ThoiTrangOnline] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ThoiTrangOnline] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ThoiTrangOnline] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ThoiTrangOnline] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ThoiTrangOnline] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ThoiTrangOnline] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ThoiTrangOnline] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ThoiTrangOnline] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ThoiTrangOnline] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ThoiTrangOnline] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ThoiTrangOnline] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ThoiTrangOnline] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ThoiTrangOnline] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ThoiTrangOnline] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ThoiTrangOnline] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ThoiTrangOnline] SET RECOVERY FULL 
GO
ALTER DATABASE [ThoiTrangOnline] SET  MULTI_USER 
GO
ALTER DATABASE [ThoiTrangOnline] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ThoiTrangOnline] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ThoiTrangOnline] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ThoiTrangOnline] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ThoiTrangOnline] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ThoiTrangOnline] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ThoiTrangOnline', N'ON'
GO
ALTER DATABASE [ThoiTrangOnline] SET QUERY_STORE = OFF
GO
USE [ThoiTrangOnline]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 9/8/2021 10:52:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CategoryDetails]    Script Date: 9/8/2021 10:52:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoryDetails](
	[CatDetailsId] [int] IDENTITY(1,1) NOT NULL,
	[CatDetailsName] [nvarchar](100) NOT NULL,
	[Status] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CategoryId] [int] NOT NULL,
 CONSTRAINT [PK_CategoryDetails] PRIMARY KEY CLUSTERED 
(
	[CatDetailsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Event]    Script Date: 9/8/2021 10:52:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Event](
	[EventId] [int] IDENTITY(1,1) NOT NULL,
	[FromDate] [date] NULL,
	[ToDate] [date] NOT NULL,
	[Status] [bit] NULL,
	[EventName] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_Event] PRIMARY KEY CLUSTERED 
(
	[EventId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 9/8/2021 10:52:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrDetailsId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[QUantity] [int] NOT NULL,
	[Price] [int] NOT NULL,
	[OrderId] [int] NOT NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[OrDetailsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 9/8/2021 10:52:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[OrderDate] [date] NOT NULL,
	[ShipperId] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[UserId] [int] NULL,
	[CustomerEmail] [nvarchar](100) NULL,
	[Amount] [int] NOT NULL,
	[CustomerPhone] [nvarchar](15) NULL,
	[CustomerAddress] [nvarchar](200) NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 9/8/2021 10:52:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](100) NOT NULL,
	[Photo] [nvarchar](300) NOT NULL,
	[Price] [int] NOT NULL,
	[Description] [text] NOT NULL,
	[CatDetailsId] [int] NOT NULL,
	[Color] [nvarchar](50) NOT NULL,
	[Size] [int] NOT NULL,
	[Status] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[Quantity] [int] NOT NULL,
	[ProductCode] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shipper]    Script Date: 9/8/2021 10:52:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shipper](
	[ShipperId] [int] IDENTITY(1,1) NOT NULL,
	[ShipperName] [nvarchar](250) NOT NULL,
	[Email] [nvarchar](250) NOT NULL,
	[PhoneNumber] [nvarchar](15) NOT NULL,
	[Address] [nvarchar](100) NOT NULL,
	[OrderId] [int] NULL,
 CONSTRAINT [PK_Shipper] PRIMARY KEY CLUSTERED 
(
	[ShipperId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transactions]    Script Date: 9/8/2021 10:52:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transactions](
	[TransId] [int] IDENTITY(1,1) NOT NULL,
	[TransDate] [date] NOT NULL,
	[Amount] [int] NOT NULL,
	[Message] [nvarchar](250) NOT NULL,
	[UserId] [int] NULL,
	[CustomerEmail] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_Transactions] PRIMARY KEY CLUSTERED 
(
	[TransId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 9/8/2021 10:52:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[PhoneNumber] [nvarchar](15) NOT NULL,
	[PasswordHash] [nvarchar](100) NOT NULL,
	[Avatar] [nvarchar](300) NOT NULL,
	[Status] [bit] NOT NULL,
	[Address] [nvarchar](250) NOT NULL,
	[Dob] [date] NOT NULL,
	[Roles] [int] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CategoryDetails] ADD  CONSTRAINT [DF_CategoryDetails_Status]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[CategoryDetails] ADD  CONSTRAINT [DF_CategoryDetails_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[CategoryDetails]  WITH CHECK ADD  CONSTRAINT [FK_CategoryDetails_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([CategoryId])
GO
ALTER TABLE [dbo].[CategoryDetails] CHECK CONSTRAINT [FK_CategoryDetails_Category]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([OrderId])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_CategoryDetails] FOREIGN KEY([CatDetailsId])
REFERENCES [dbo].[CategoryDetails] ([CatDetailsId])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_CategoryDetails]
GO
ALTER TABLE [dbo].[Shipper]  WITH CHECK ADD  CONSTRAINT [FK_Shipper_Orders] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([OrderId])
GO
ALTER TABLE [dbo].[Shipper] CHECK CONSTRAINT [FK_Shipper_Orders]
GO
USE [master]
GO
ALTER DATABASE [ThoiTrangOnline] SET  READ_WRITE 
GO
