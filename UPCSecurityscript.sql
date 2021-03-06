USE [master]
GO
/****** Object:  Database [SeguridadUPC]    Script Date: 30/09/2016 17:42:38 ******/
CREATE DATABASE [SeguridadUPC]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SeguridadUPC', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.LOUDY\MSSQL\DATA\SeguridadUPC.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SeguridadUPC_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.LOUDY\MSSQL\DATA\SeguridadUPC_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [SeguridadUPC] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SeguridadUPC].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SeguridadUPC] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SeguridadUPC] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SeguridadUPC] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SeguridadUPC] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SeguridadUPC] SET ARITHABORT OFF 
GO
ALTER DATABASE [SeguridadUPC] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SeguridadUPC] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [SeguridadUPC] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SeguridadUPC] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SeguridadUPC] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SeguridadUPC] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SeguridadUPC] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SeguridadUPC] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SeguridadUPC] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SeguridadUPC] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SeguridadUPC] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SeguridadUPC] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SeguridadUPC] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SeguridadUPC] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SeguridadUPC] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SeguridadUPC] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SeguridadUPC] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SeguridadUPC] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SeguridadUPC] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SeguridadUPC] SET  MULTI_USER 
GO
ALTER DATABASE [SeguridadUPC] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SeguridadUPC] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SeguridadUPC] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SeguridadUPC] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [SeguridadUPC]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 30/09/2016 17:42:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Customers](
	[idCustomer] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[DNI] [int] NOT NULL,
	[idCustomerType] [int] NOT NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[idCustomer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CustomerTypes]    Script Date: 30/09/2016 17:42:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CustomerTypes](
	[idCustomerType] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_CustomerTypes] PRIMARY KEY CLUSTERED 
(
	[idCustomerType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DocTypes]    Script Date: 30/09/2016 17:42:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DocTypes](
	[idDocType] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_DocTypes] PRIMARY KEY CLUSTERED 
(
	[idDocType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Documents]    Script Date: 30/09/2016 17:42:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Documents](
	[idDocument] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](10) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[FilePath] [varchar](200) NOT NULL,
	[Description] [varchar](500) NOT NULL,
	[idDocType] [int] NOT NULL,
	[idIncidence] [int] NOT NULL,
 CONSTRAINT [PK_Documents] PRIMARY KEY CLUSTERED 
(
	[idDocument] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Environments]    Script Date: 30/09/2016 17:42:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Environments](
	[idEnvironment] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Environments] PRIMARY KEY CLUSTERED 
(
	[idEnvironment] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Incidences]    Script Date: 30/09/2016 17:42:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Incidences](
	[idIncidence] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](10) NOT NULL,
	[Description] [varchar](500) NOT NULL,
	[Date] [date] NOT NULL,
	[idState] [int] NOT NULL,
	[idEnvironment] [int] NOT NULL,
	[idLocal] [int] NOT NULL,
	[idUser] [int] NOT NULL,
 CONSTRAINT [PK_Incidences] PRIMARY KEY CLUSTERED 
(
	[idIncidence] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Locals]    Script Date: 30/09/2016 17:42:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Locals](
	[idLocal] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Locals] PRIMARY KEY CLUSTERED 
(
	[idLocal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RelationIncidenceCustomers]    Script Date: 30/09/2016 17:42:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RelationIncidenceCustomers](
	[idRelIncCustomer] [int] IDENTITY(1,1) NOT NULL,
	[idIncidence] [int] NOT NULL,
	[idCustomer] [int] NOT NULL,
 CONSTRAINT [PK_RelationIncidenceCustomers] PRIMARY KEY CLUSTERED 
(
	[idRelIncCustomer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[States]    Script Date: 30/09/2016 17:42:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[States](
	[idState] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_States] PRIMARY KEY CLUSTERED 
(
	[idState] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Users]    Script Date: 30/09/2016 17:42:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[idUser] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[idUserType] [int] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[idUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserTypes]    Script Date: 30/09/2016 17:42:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserTypes](
	[idUserType] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_UserTypes] PRIMARY KEY CLUSTERED 
(
	[idUserType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([idUser], [Username], [Password], [idUserType]) VALUES (1, N'Admin', N'Admin1234', 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
SET IDENTITY_INSERT [dbo].[UserTypes] ON 

INSERT [dbo].[UserTypes] ([idUserType], [Name]) VALUES (1, N'Administrator')
INSERT [dbo].[UserTypes] ([idUserType], [Name]) VALUES (2, N'Supervisor')
SET IDENTITY_INSERT [dbo].[UserTypes] OFF
ALTER TABLE [dbo].[Customers]  WITH CHECK ADD  CONSTRAINT [FK_Customers_CustomerTypes] FOREIGN KEY([idCustomerType])
REFERENCES [dbo].[CustomerTypes] ([idCustomerType])
GO
ALTER TABLE [dbo].[Customers] CHECK CONSTRAINT [FK_Customers_CustomerTypes]
GO
ALTER TABLE [dbo].[Documents]  WITH CHECK ADD  CONSTRAINT [FK_Documents_DocTypes] FOREIGN KEY([idDocType])
REFERENCES [dbo].[DocTypes] ([idDocType])
GO
ALTER TABLE [dbo].[Documents] CHECK CONSTRAINT [FK_Documents_DocTypes]
GO
ALTER TABLE [dbo].[Documents]  WITH CHECK ADD  CONSTRAINT [FK_Documents_Incidences] FOREIGN KEY([idIncidence])
REFERENCES [dbo].[Incidences] ([idIncidence])
GO
ALTER TABLE [dbo].[Documents] CHECK CONSTRAINT [FK_Documents_Incidences]
GO
ALTER TABLE [dbo].[Incidences]  WITH CHECK ADD  CONSTRAINT [FK_Incidences_Environments] FOREIGN KEY([idEnvironment])
REFERENCES [dbo].[Environments] ([idEnvironment])
GO
ALTER TABLE [dbo].[Incidences] CHECK CONSTRAINT [FK_Incidences_Environments]
GO
ALTER TABLE [dbo].[Incidences]  WITH CHECK ADD  CONSTRAINT [FK_Incidences_Locals] FOREIGN KEY([idLocal])
REFERENCES [dbo].[Locals] ([idLocal])
GO
ALTER TABLE [dbo].[Incidences] CHECK CONSTRAINT [FK_Incidences_Locals]
GO
ALTER TABLE [dbo].[Incidences]  WITH CHECK ADD  CONSTRAINT [FK_Incidences_States] FOREIGN KEY([idState])
REFERENCES [dbo].[States] ([idState])
GO
ALTER TABLE [dbo].[Incidences] CHECK CONSTRAINT [FK_Incidences_States]
GO
ALTER TABLE [dbo].[Incidences]  WITH CHECK ADD  CONSTRAINT [FK_Incidences_Users] FOREIGN KEY([idUser])
REFERENCES [dbo].[Users] ([idUser])
GO
ALTER TABLE [dbo].[Incidences] CHECK CONSTRAINT [FK_Incidences_Users]
GO
ALTER TABLE [dbo].[RelationIncidenceCustomers]  WITH CHECK ADD  CONSTRAINT [FK_RelationIncidenceCustomers_Customers] FOREIGN KEY([idCustomer])
REFERENCES [dbo].[Customers] ([idCustomer])
GO
ALTER TABLE [dbo].[RelationIncidenceCustomers] CHECK CONSTRAINT [FK_RelationIncidenceCustomers_Customers]
GO
ALTER TABLE [dbo].[RelationIncidenceCustomers]  WITH CHECK ADD  CONSTRAINT [FK_RelationIncidenceCustomers_Incidences] FOREIGN KEY([idIncidence])
REFERENCES [dbo].[Incidences] ([idIncidence])
GO
ALTER TABLE [dbo].[RelationIncidenceCustomers] CHECK CONSTRAINT [FK_RelationIncidenceCustomers_Incidences]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_UserTypes] FOREIGN KEY([idUserType])
REFERENCES [dbo].[UserTypes] ([idUserType])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_UserTypes]
GO
USE [master]
GO
ALTER DATABASE [SeguridadUPC] SET  READ_WRITE 
GO
