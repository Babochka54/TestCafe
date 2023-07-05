USE [master]
GO
/****** Object:  Database [TestCafe]    Script Date: 05.07.2023 21:36:29 ******/
CREATE DATABASE [TestCafe]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TestCafe', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\TestCafe.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TestCafe_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\TestCafe_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [TestCafe] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TestCafe].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TestCafe] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TestCafe] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TestCafe] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TestCafe] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TestCafe] SET ARITHABORT OFF 
GO
ALTER DATABASE [TestCafe] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TestCafe] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TestCafe] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TestCafe] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TestCafe] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TestCafe] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TestCafe] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TestCafe] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TestCafe] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TestCafe] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TestCafe] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TestCafe] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TestCafe] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TestCafe] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TestCafe] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TestCafe] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TestCafe] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TestCafe] SET RECOVERY FULL 
GO
ALTER DATABASE [TestCafe] SET  MULTI_USER 
GO
ALTER DATABASE [TestCafe] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TestCafe] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TestCafe] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TestCafe] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TestCafe] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TestCafe] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'TestCafe', N'ON'
GO
ALTER DATABASE [TestCafe] SET QUERY_STORE = ON
GO
ALTER DATABASE [TestCafe] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [TestCafe]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 05.07.2023 21:36:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[category] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MenuItems]    Script Date: 05.07.2023 21:36:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenuItems](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[itemName] [varchar](50) NOT NULL,
	[price] [decimal](18, 2) NOT NULL,
	[categoryId] [int] NOT NULL,
	[imageRef] [varchar](100) NULL,
	[descriprion] [varchar](100) NULL,
 CONSTRAINT [PK_MenuItems] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([id], [category]) VALUES (1, N'Started')
INSERT [dbo].[Categories] ([id], [category]) VALUES (2, N'Main')
INSERT [dbo].[Categories] ([id], [category]) VALUES (3, N'Dessert')
INSERT [dbo].[Categories] ([id], [category]) VALUES (5, N'Cold Drinks')
INSERT [dbo].[Categories] ([id], [category]) VALUES (6, N'Hot Drinks')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[MenuItems] ON 

INSERT [dbo].[MenuItems] ([id], [itemName], [price], [categoryId], [imageRef], [descriprion]) VALUES (1, N'Caesar Salad', CAST(2.00 AS Decimal(18, 2)), 1, N'~/images/CaesarSalad.jpeg', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit.')
INSERT [dbo].[MenuItems] ([id], [itemName], [price], [categoryId], [imageRef], [descriprion]) VALUES (2, N'Garlic Bacon Salad', CAST(4.00 AS Decimal(18, 2)), 1, N'~/images/GarlicBaconSalad.jpeg', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit.')
INSERT [dbo].[MenuItems] ([id], [itemName], [price], [categoryId], [imageRef], [descriprion]) VALUES (4, N'Greek Salad', CAST(2.00 AS Decimal(18, 2)), 1, N'~/images/GreekSalad.jpeg', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit.')
INSERT [dbo].[MenuItems] ([id], [itemName], [price], [categoryId], [imageRef], [descriprion]) VALUES (5, N'Garlic Bread', CAST(1.00 AS Decimal(18, 2)), 1, N'~/images/GarlicBread.jpeg', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit.')
INSERT [dbo].[MenuItems] ([id], [itemName], [price], [categoryId], [imageRef], [descriprion]) VALUES (6, N'Pesto Bread', CAST(1.50 AS Decimal(18, 2)), 1, N'~/images/PestoBread.jpeg', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit.')
INSERT [dbo].[MenuItems] ([id], [itemName], [price], [categoryId], [imageRef], [descriprion]) VALUES (7, N'Pizza Pepperoni', CAST(9.99 AS Decimal(18, 2)), 2, N'~/images/PizzaPepperoni.jpeg', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit.')
INSERT [dbo].[MenuItems] ([id], [itemName], [price], [categoryId], [imageRef], [descriprion]) VALUES (8, N'Pizza BBQ', CAST(12.99 AS Decimal(18, 2)), 2, N'~/images/PizzaBBQ.jpeg', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit.')
INSERT [dbo].[MenuItems] ([id], [itemName], [price], [categoryId], [imageRef], [descriprion]) VALUES (10, N'Pizza Diablo', CAST(12.99 AS Decimal(18, 2)), 2, N'~/images/CaesarSalad.jpeg', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit.')
INSERT [dbo].[MenuItems] ([id], [itemName], [price], [categoryId], [imageRef], [descriprion]) VALUES (11, N'Test Cake', CAST(99.99 AS Decimal(18, 2)), 3, N'~/images/CaesarSalad.jpeg', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit.')
INSERT [dbo].[MenuItems] ([id], [itemName], [price], [categoryId], [imageRef], [descriprion]) VALUES (17, N'Ice Coffie', CAST(2.00 AS Decimal(18, 2)), 5, N'~/images/CaesarSalad.jpeg', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit.')
INSERT [dbo].[MenuItems] ([id], [itemName], [price], [categoryId], [imageRef], [descriprion]) VALUES (18, N'Apple Juice', CAST(1.00 AS Decimal(18, 2)), 5, N'~/images/CaesarSalad.jpeg', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit.')
INSERT [dbo].[MenuItems] ([id], [itemName], [price], [categoryId], [imageRef], [descriprion]) VALUES (19, N'Espresso', CAST(1.00 AS Decimal(18, 2)), 6, N'~/images/CaesarSalad.jpeg', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit.')
INSERT [dbo].[MenuItems] ([id], [itemName], [price], [categoryId], [imageRef], [descriprion]) VALUES (20, N'Black Tea', CAST(0.50 AS Decimal(18, 2)), 6, N'~/images/CaesarSalad.jpeg', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit.')
INSERT [dbo].[MenuItems] ([id], [itemName], [price], [categoryId], [imageRef], [descriprion]) VALUES (21, N'Green Tea', CAST(0.50 AS Decimal(18, 2)), 6, N'~/images/CaesarSalad.jpeg', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit.')
SET IDENTITY_INSERT [dbo].[MenuItems] OFF
GO
ALTER TABLE [dbo].[MenuItems]  WITH CHECK ADD  CONSTRAINT [FK_MenuItems_Categories] FOREIGN KEY([categoryId])
REFERENCES [dbo].[Categories] ([id])
GO
ALTER TABLE [dbo].[MenuItems] CHECK CONSTRAINT [FK_MenuItems_Categories]
GO
USE [master]
GO
ALTER DATABASE [TestCafe] SET  READ_WRITE 
GO
