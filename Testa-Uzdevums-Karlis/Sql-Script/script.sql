USE [master]
GO
/****** Object:  Database [Currency_DB]    Script Date: 16/03/2024 14:07:22 ******/
CREATE DATABASE [Currency_DB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Currency_DB', FILENAME = N'C:\Users\karli\Currency_DB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Currency_DB_log', FILENAME = N'C:\Users\karli\Currency_DB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Currency_DB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Currency_DB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Currency_DB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Currency_DB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Currency_DB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Currency_DB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Currency_DB] SET ARITHABORT OFF 
GO
ALTER DATABASE [Currency_DB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Currency_DB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Currency_DB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Currency_DB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Currency_DB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Currency_DB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Currency_DB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Currency_DB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Currency_DB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Currency_DB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Currency_DB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Currency_DB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Currency_DB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Currency_DB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Currency_DB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Currency_DB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Currency_DB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Currency_DB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Currency_DB] SET  MULTI_USER 
GO
ALTER DATABASE [Currency_DB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Currency_DB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Currency_DB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Currency_DB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Currency_DB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Currency_DB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Currency_DB] SET QUERY_STORE = OFF
GO
USE [Currency_DB]
GO
/****** Object:  User [MyLogin]    Script Date: 16/03/2024 14:07:22 ******/
CREATE USER [MyLogin] FOR LOGIN [MyLogin] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [MyLogin]
GO
/****** Object:  Table [dbo].[CurrencyRates]    Script Date: 16/03/2024 14:07:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CurrencyRates](
	[CurrencyCode] [nvarchar](3) NOT NULL,
	[Rate] [decimal](18, 5) NOT NULL,
 CONSTRAINT [PK_CurrencyRates] PRIMARY KEY CLUSTERED 
(
	[CurrencyCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[CurrencyRates] ([CurrencyCode], [Rate]) VALUES (N'AUD', CAST(1.67900 AS Decimal(18, 5)))
INSERT [dbo].[CurrencyRates] ([CurrencyCode], [Rate]) VALUES (N'BGN', CAST(1.95590 AS Decimal(18, 5)))
INSERT [dbo].[CurrencyRates] ([CurrencyCode], [Rate]) VALUES (N'BRL', CAST(3.57110 AS Decimal(18, 5)))
INSERT [dbo].[CurrencyRates] ([CurrencyCode], [Rate]) VALUES (N'CAD', CAST(1.58340 AS Decimal(18, 5)))
INSERT [dbo].[CurrencyRates] ([CurrencyCode], [Rate]) VALUES (N'CHF', CAST(1.55570 AS Decimal(18, 5)))
INSERT [dbo].[CurrencyRates] ([CurrencyCode], [Rate]) VALUES (N'CNY', CAST(10.80150 AS Decimal(18, 5)))
INSERT [dbo].[CurrencyRates] ([CurrencyCode], [Rate]) VALUES (N'CZK', CAST(30.07800 AS Decimal(18, 5)))
INSERT [dbo].[CurrencyRates] ([CurrencyCode], [Rate]) VALUES (N'DKK', CAST(7.44910 AS Decimal(18, 5)))
INSERT [dbo].[CurrencyRates] ([CurrencyCode], [Rate]) VALUES (N'GBP', CAST(0.69460 AS Decimal(18, 5)))
INSERT [dbo].[CurrencyRates] ([CurrencyCode], [Rate]) VALUES (N'HKD', CAST(10.17860 AS Decimal(18, 5)))
INSERT [dbo].[CurrencyRates] ([CurrencyCode], [Rate]) VALUES (N'HRK', CAST(7.46350 AS Decimal(18, 5)))
INSERT [dbo].[CurrencyRates] ([CurrencyCode], [Rate]) VALUES (N'HUF', CAST(247.70000 AS Decimal(18, 5)))
INSERT [dbo].[CurrencyRates] ([CurrencyCode], [Rate]) VALUES (N'IDR', CAST(12272.12000 AS Decimal(18, 5)))
INSERT [dbo].[CurrencyRates] ([CurrencyCode], [Rate]) VALUES (N'ILS', CAST(5.65980 AS Decimal(18, 5)))
INSERT [dbo].[CurrencyRates] ([CurrencyCode], [Rate]) VALUES (N'INR', CAST(57.04200 AS Decimal(18, 5)))
INSERT [dbo].[CurrencyRates] ([CurrencyCode], [Rate]) VALUES (N'JPY', CAST(137.70000 AS Decimal(18, 5)))
INSERT [dbo].[CurrencyRates] ([CurrencyCode], [Rate]) VALUES (N'KRW', CAST(1316.09000 AS Decimal(18, 5)))
INSERT [dbo].[CurrencyRates] ([CurrencyCode], [Rate]) VALUES (N'LTL', CAST(3.45280 AS Decimal(18, 5)))
INSERT [dbo].[CurrencyRates] ([CurrencyCode], [Rate]) VALUES (N'LVL', CAST(0.69610 AS Decimal(18, 5)))
INSERT [dbo].[CurrencyRates] ([CurrencyCode], [Rate]) VALUES (N'MXN', CAST(14.66920 AS Decimal(18, 5)))
INSERT [dbo].[CurrencyRates] ([CurrencyCode], [Rate]) VALUES (N'MYR', CAST(4.95850 AS Decimal(18, 5)))
INSERT [dbo].[CurrencyRates] ([CurrencyCode], [Rate]) VALUES (N'NOK', CAST(8.18180 AS Decimal(18, 5)))
INSERT [dbo].[CurrencyRates] ([CurrencyCode], [Rate]) VALUES (N'NZD', CAST(1.80160 AS Decimal(18, 5)))
INSERT [dbo].[CurrencyRates] ([CurrencyCode], [Rate]) VALUES (N'PHP', CAST(70.69000 AS Decimal(18, 5)))
INSERT [dbo].[CurrencyRates] ([CurrencyCode], [Rate]) VALUES (N'PLN', CAST(4.11980 AS Decimal(18, 5)))
INSERT [dbo].[CurrencyRates] ([CurrencyCode], [Rate]) VALUES (N'RON', CAST(36311.00000 AS Decimal(18, 5)))
INSERT [dbo].[CurrencyRates] ([CurrencyCode], [Rate]) VALUES (N'RUB', CAST(36.13780 AS Decimal(18, 5)))
INSERT [dbo].[CurrencyRates] ([CurrencyCode], [Rate]) VALUES (N'SEK', CAST(9.11140 AS Decimal(18, 5)))
INSERT [dbo].[CurrencyRates] ([CurrencyCode], [Rate]) VALUES (N'SGD', CAST(2.13930 AS Decimal(18, 5)))
INSERT [dbo].[CurrencyRates] ([CurrencyCode], [Rate]) VALUES (N'THB', CAST(50.45600 AS Decimal(18, 5)))
INSERT [dbo].[CurrencyRates] ([CurrencyCode], [Rate]) VALUES (N'TRY', CAST(1.77760 AS Decimal(18, 5)))
INSERT [dbo].[CurrencyRates] ([CurrencyCode], [Rate]) VALUES (N'USD', CAST(1.30500 AS Decimal(18, 5)))
INSERT [dbo].[CurrencyRates] ([CurrencyCode], [Rate]) VALUES (N'ZAR', CAST(8.08790 AS Decimal(18, 5)))
GO
/****** Object:  StoredProcedure [dbo].[InsertCurrencyRate]    Script Date: 16/03/2024 14:07:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertCurrencyRate]
    @CurrencyCode NVARCHAR(3),
    @Rate DECIMAL(18, 5)
AS
BEGIN
    INSERT INTO CurrencyRates (CurrencyCode, Rate)
    VALUES (@CurrencyCode, @Rate)
END
GO
USE [master]
GO
ALTER DATABASE [Currency_DB] SET  READ_WRITE 
GO
