USE [master]
GO
/****** Object:  Database [Base]    Script Date: 14.01.2025 12:15:04 ******/
CREATE DATABASE [Base]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Base', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Base.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Base_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Base_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Base] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Base].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Base] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Base] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Base] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Base] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Base] SET ARITHABORT OFF 
GO
ALTER DATABASE [Base] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Base] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Base] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Base] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Base] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Base] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Base] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Base] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Base] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Base] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Base] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Base] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Base] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Base] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Base] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Base] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Base] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Base] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Base] SET  MULTI_USER 
GO
ALTER DATABASE [Base] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Base] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Base] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Base] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Base] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Base] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Base] SET QUERY_STORE = OFF
GO
USE [Base]
GO
/****** Object:  Table [dbo].[Gender]    Script Date: 14.01.2025 12:15:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gender](
	[id] [int] NOT NULL,
	[gender] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Gender] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 14.01.2025 12:15:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[id] [int] NOT NULL,
	[role] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 14.01.2025 12:15:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[id] [int] NOT NULL,
	[RoleID] [int] NOT NULL,
	[FIO] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Login] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[Number_Phone] [varchar](50) NOT NULL,
	[Pasport_S] [varchar](50) NOT NULL,
	[Pasport_NUM] [varchar](50) NOT NULL,
	[DateBD] [date] NOT NULL,
	[LastExit] [varchar](50) NULL,
	[TypeExit] [varchar](50) NOT NULL,
	[GenderID] [int] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Gender] FOREIGN KEY([GenderID])
REFERENCES [dbo].[Gender] ([id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Gender]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Role] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Role]
GO
USE [master]
GO
ALTER DATABASE [Base] SET  READ_WRITE 
GO
