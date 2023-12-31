USE [master]
GO
/****** Object:  Database [БД_посещений]    Script Date: 25.06.2023 14:53:51 ******/
CREATE DATABASE [БД_посещений]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'БД_посещений', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\БД_посещений.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'БД_посещений_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\БД_посещений_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [БД_посещений] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [БД_посещений].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [БД_посещений] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [БД_посещений] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [БД_посещений] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [БД_посещений] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [БД_посещений] SET ARITHABORT OFF 
GO
ALTER DATABASE [БД_посещений] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [БД_посещений] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [БД_посещений] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [БД_посещений] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [БД_посещений] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [БД_посещений] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [БД_посещений] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [БД_посещений] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [БД_посещений] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [БД_посещений] SET  DISABLE_BROKER 
GO
ALTER DATABASE [БД_посещений] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [БД_посещений] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [БД_посещений] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [БД_посещений] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [БД_посещений] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [БД_посещений] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [БД_посещений] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [БД_посещений] SET RECOVERY FULL 
GO
ALTER DATABASE [БД_посещений] SET  MULTI_USER 
GO
ALTER DATABASE [БД_посещений] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [БД_посещений] SET DB_CHAINING OFF 
GO
ALTER DATABASE [БД_посещений] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [БД_посещений] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [БД_посещений] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [БД_посещений] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'БД_посещений', N'ON'
GO
ALTER DATABASE [БД_посещений] SET QUERY_STORE = OFF
GO
USE [БД_посещений]
GO
/****** Object:  Table [dbo].[Посещаемость]    Script Date: 25.06.2023 14:53:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Посещаемость](
	[КодСотрудника] [int] NOT NULL,
	[КодСчитывателя] [int] NOT NULL,
	[ДатаВремя] [datetime] NOT NULL,
	[Доступ] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Смена]    Script Date: 25.06.2023 14:53:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Смена](
	[КодСмены] [int] NOT NULL,
	[Название] [varchar](100) NOT NULL,
	[Начало] [time](7) NOT NULL,
	[Конец] [time](7) NOT NULL,
 CONSTRAINT [PK_Смена] PRIMARY KEY CLUSTERED 
(
	[КодСмены] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Сотрудник]    Script Date: 25.06.2023 14:53:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Сотрудник](
	[КодСотрудника] [int] NOT NULL,
	[ФИО] [varchar](80) NOT NULL,
 CONSTRAINT [PK_Сотрудник] PRIMARY KEY CLUSTERED 
(
	[КодСотрудника] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Считыватель]    Script Date: 25.06.2023 14:53:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Считыватель](
	[КодСчитывателя] [int] NOT NULL,
	[Устройство] [varchar](100) NOT NULL,
	[СторонаКонтроля] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Считыватель] PRIMARY KEY CLUSTERED 
(
	[КодСчитывателя] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Смена] ([КодСмены], [Название], [Начало], [Конец]) VALUES (1, N'Первая (дневная)', CAST(N'08:00:00' AS Time), CAST(N'17:00:00' AS Time))
INSERT [dbo].[Смена] ([КодСмены], [Название], [Начало], [Конец]) VALUES (2, N'Вторая (ночная)', CAST(N'23:00:00' AS Time), CAST(N'08:00:00' AS Time))
GO
ALTER TABLE [dbo].[Посещаемость]  WITH CHECK ADD  CONSTRAINT [FK_Посещаемость_Сотрудник] FOREIGN KEY([КодСотрудника])
REFERENCES [dbo].[Сотрудник] ([КодСотрудника])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Посещаемость] CHECK CONSTRAINT [FK_Посещаемость_Сотрудник]
GO
ALTER TABLE [dbo].[Посещаемость]  WITH CHECK ADD  CONSTRAINT [FK_Посещаемость_Считыватель] FOREIGN KEY([КодСчитывателя])
REFERENCES [dbo].[Считыватель] ([КодСчитывателя])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Посещаемость] CHECK CONSTRAINT [FK_Посещаемость_Считыватель]
GO
USE [master]
GO
ALTER DATABASE [БД_посещений] SET  READ_WRITE 
GO
