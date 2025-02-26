USE [master]
GO
/****** Object:  Database [MovieSystem]    Script Date: 12/2/2020 12:17:39 PM ******/
CREATE DATABASE [MovieSystem]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MovieSystem', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\MovieSystem.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'MovieSystem_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\MovieSystem_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [MovieSystem] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MovieSystem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MovieSystem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MovieSystem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MovieSystem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MovieSystem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MovieSystem] SET ARITHABORT OFF 
GO
ALTER DATABASE [MovieSystem] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MovieSystem] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [MovieSystem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MovieSystem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MovieSystem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MovieSystem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MovieSystem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MovieSystem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MovieSystem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MovieSystem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MovieSystem] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MovieSystem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MovieSystem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MovieSystem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MovieSystem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MovieSystem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MovieSystem] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MovieSystem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MovieSystem] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MovieSystem] SET  MULTI_USER 
GO
ALTER DATABASE [MovieSystem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MovieSystem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MovieSystem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MovieSystem] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [MovieSystem]
GO
/****** Object:  StoredProcedure [dbo].[GetAllData]    Script Date: 12/2/2020 12:17:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetAllData]
  @ID int
  AS
  SET NOCOUNT ON;
  SELECT * FROM Movies WHERE MoviesId = @ID
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 12/2/2020 12:17:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Customer](
	[CId] [int] NOT NULL,
	[FName] [varchar](50) NULL,
	[LName] [varchar](50) NULL,
	[CAddress] [varchar](50) NULL,
	[CPhoneNo] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Listmovies]    Script Date: 12/2/2020 12:17:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Listmovies](
	[RentalMoviesId] [int] NOT NULL,
	[MoviesTitle] [nchar](10) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Movies]    Script Date: 12/2/2020 12:17:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Movies](
	[MoviesId] [int] NOT NULL,
	[MTitle] [varchar](50) NULL,
	[MRating] [int] NULL,
	[Mcopies] [int] NULL,
	[Mgenre] [varchar](50) NULL,
	[Mplot] [varchar](50) NULL,
	[MCost] [money] NULL,
	[MRelaseDate] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MoviesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RentalMovies]    Script Date: 12/2/2020 12:17:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RentalMovies](
	[RentalMoviesId] [int] NOT NULL,
	[MoviesId] [int] NULL,
	[CId] [int] NULL,
	[RentalDate] [varchar](50) NULL,
	[ReturnDate] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[RentalMoviesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Customer] ([CId], [FName], [LName], [CAddress], [CPhoneNo]) VALUES (1, N'Rebecca', N'Padilla', N'58  Kentia Lane', 652438)
INSERT [dbo].[Customer] ([CId], [FName], [LName], [CAddress], [CPhoneNo]) VALUES (2, N'Teresa', N'Paz', N'8  Wilson Street', 804823)
INSERT [dbo].[Customer] ([CId], [FName], [LName], [CAddress], [CPhoneNo]) VALUES (3, N'Gary', N'Horn', N'161  Brough Place', 344532)
INSERT [dbo].[Customer] ([CId], [FName], [LName], [CAddress], [CPhoneNo]) VALUES (4, N'Karen', N'Groover', N'53  Market Street South', 673256)
INSERT [dbo].[Customer] ([CId], [FName], [LName], [CAddress], [CPhoneNo]) VALUES (5, N'Ollie', N'Rodriguez', N'159  Rishworth Avenue', 348965)
INSERT [dbo].[Customer] ([CId], [FName], [LName], [CAddress], [CPhoneNo]) VALUES (6, N'James', N'Morris', N'146  Menen Place', 554584)
INSERT [dbo].[Customer] ([CId], [FName], [LName], [CAddress], [CPhoneNo]) VALUES (7, N'Joseph', N'Schuster', N'41  Junction Street', 243786)
INSERT [dbo].[Customer] ([CId], [FName], [LName], [CAddress], [CPhoneNo]) VALUES (8, N'Elsie', N'Gonzales', N'51  Hawea Street', 465678)
INSERT [dbo].[Listmovies] ([RentalMoviesId], [MoviesTitle]) VALUES (1, N'Traitor   ')
INSERT [dbo].[Listmovies] ([RentalMoviesId], [MoviesTitle]) VALUES (2, N'Annabelle ')
INSERT [dbo].[Listmovies] ([RentalMoviesId], [MoviesTitle]) VALUES (3, N'Logan     ')
INSERT [dbo].[Listmovies] ([RentalMoviesId], [MoviesTitle]) VALUES (4, N'Apocalypto')
INSERT [dbo].[Listmovies] ([RentalMoviesId], [MoviesTitle]) VALUES (5, N'Logan     ')
INSERT [dbo].[Listmovies] ([RentalMoviesId], [MoviesTitle]) VALUES (6, N'Snitch    ')
INSERT [dbo].[Movies] ([MoviesId], [MTitle], [MRating], [Mcopies], [Mgenre], [Mplot], [MCost], [MRelaseDate]) VALUES (1, N'Apocalypto', 7, 30, N'Adventure ', N'Surviving in Mesoamerican rainforest', 2.0000, N'8-10-2006')
INSERT [dbo].[Movies] ([MoviesId], [MTitle], [MRating], [Mcopies], [Mgenre], [Mplot], [MCost], [MRelaseDate]) VALUES (2, N'Traitor', 8, 22, N'Spy thriller', N'Story of Samir Horn', 2.0000, N'27-8-2008')
INSERT [dbo].[Movies] ([MoviesId], [MTitle], [MRating], [Mcopies], [Mgenre], [Mplot], [MCost], [MRelaseDate]) VALUES (3, N'Annabelle', 8, 22, N'Supernatural horror', N'Story of doll of girl', 5.0000, N'11-8-2017')
INSERT [dbo].[Movies] ([MoviesId], [MTitle], [MRating], [Mcopies], [Mgenre], [Mplot], [MCost], [MRelaseDate]) VALUES (4, N'Logan', 9, 16, N'Superhero', N'Logan fight for mutants', 5.0000, N'17-2-2017')
INSERT [dbo].[Movies] ([MoviesId], [MTitle], [MRating], [Mcopies], [Mgenre], [Mplot], [MCost], [MRelaseDate]) VALUES (5, N'Snitch', 8, 16, N'Action', N'College student Jason Collins Story', 2.0000, N'22-2-2013')
INSERT [dbo].[RentalMovies] ([RentalMoviesId], [MoviesId], [CId], [RentalDate], [ReturnDate]) VALUES (1, 2, 5, N'17-10-2020', N'19-10-2020')
INSERT [dbo].[RentalMovies] ([RentalMoviesId], [MoviesId], [CId], [RentalDate], [ReturnDate]) VALUES (2, 3, 7, N'18-10-2020', N'')
INSERT [dbo].[RentalMovies] ([RentalMoviesId], [MoviesId], [CId], [RentalDate], [ReturnDate]) VALUES (3, 4, 1, N'22-10-2020', N'')
INSERT [dbo].[RentalMovies] ([RentalMoviesId], [MoviesId], [CId], [RentalDate], [ReturnDate]) VALUES (4, 1, 3, N'25-10-2020', N'25-10-2020')
INSERT [dbo].[RentalMovies] ([RentalMoviesId], [MoviesId], [CId], [RentalDate], [ReturnDate]) VALUES (5, 4, 2, N'28-10-2020', N'')
INSERT [dbo].[RentalMovies] ([RentalMoviesId], [MoviesId], [CId], [RentalDate], [ReturnDate]) VALUES (6, 5, 6, N'30-10-2020', N'')
ALTER TABLE [dbo].[Listmovies]  WITH CHECK ADD  CONSTRAINT [FK_Listmovies_RentalMovies] FOREIGN KEY([RentalMoviesId])
REFERENCES [dbo].[RentalMovies] ([RentalMoviesId])
GO
ALTER TABLE [dbo].[Listmovies] CHECK CONSTRAINT [FK_Listmovies_RentalMovies]
GO
ALTER TABLE [dbo].[RentalMovies]  WITH CHECK ADD  CONSTRAINT [FK_Table_Customer] FOREIGN KEY([CId])
REFERENCES [dbo].[Customer] ([CId])
GO
ALTER TABLE [dbo].[RentalMovies] CHECK CONSTRAINT [FK_Table_Customer]
GO
ALTER TABLE [dbo].[RentalMovies]  WITH CHECK ADD  CONSTRAINT [FK_Table_Movies] FOREIGN KEY([MoviesId])
REFERENCES [dbo].[Movies] ([MoviesId])
GO
ALTER TABLE [dbo].[RentalMovies] CHECK CONSTRAINT [FK_Table_Movies]
GO
USE [master]
GO
ALTER DATABASE [MovieSystem] SET  READ_WRITE 
GO
