USE [master]
GO
/****** Object:  Database [Tiich]    Script Date: 28/11/2014 08:31:13 ******/
CREATE DATABASE [Tiich]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Tiich', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\Tiich.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Tiich_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\Tiich_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Tiich] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Tiich].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Tiich] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Tiich] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Tiich] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Tiich] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Tiich] SET ARITHABORT OFF 
GO
ALTER DATABASE [Tiich] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Tiich] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Tiich] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Tiich] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Tiich] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Tiich] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Tiich] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Tiich] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Tiich] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Tiich] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Tiich] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Tiich] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Tiich] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Tiich] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Tiich] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Tiich] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Tiich] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Tiich] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Tiich] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Tiich] SET  MULTI_USER 
GO
ALTER DATABASE [Tiich] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Tiich] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Tiich] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Tiich] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [Tiich]
GO
/****** Object:  StoredProcedure [dbo].[StraightSearch]    Script Date: 28/11/2014 08:31:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[StraightSearch] 
    @term nvarchar(50),
	@option nvarchar(3)
AS 
	IF(@option = 'Or')
		BEGIN
		DECLARE @individual varchar(30)
		DECLARE @terms varchar(50)
		
		SET @terms = @term
		WHILE LEN(@terms) > 0
			BEGIN
			IF PATINDEX('% %',@terms) > 0
				BEGIN
				print 'if'

					SET @individual = SUBSTRING(@terms, 0, PATINDEX('% %',@terms))
					SELECT * FROM Workshop
					WHERE
						LABEL LIKE '%'+@individual+'%'
						
						PRINT @terms
						PRINT LEN(@individual) + 1
						PRINT LEN(@terms)
					SET @terms = LTRIM(SUBSTRING(@terms, LEN(@individual) + 1,
																 LEN(@terms)))
				END
			ELSE
				BEGIN
					SELECT * FROM Workshop
					WHERE
						LABEL LIKE '%'+@terms+'%'

					SET @individual = @terms
					SET @terms = NULL
				END
			END
		END
	ELSE if (@option = 'And')
		SELECT * FROM Workshop
		WHERE
			LABEL LIKE '%'+@term+'%'

GO
/****** Object:  Table [dbo].[Participation]    Script Date: 28/11/2014 08:31:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Participation](
	[UserID] [int] NOT NULL,
	[WorkshopID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[WorkshopID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SeenWorkshops]    Script Date: 28/11/2014 08:31:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SeenWorkshops](
	[UserID] [int] NOT NULL,
	[WorkshopID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[WorkshopID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tag]    Script Date: 28/11/2014 08:31:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tag](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[parentId] [int] NULL,
	[label] [nchar](100) NOT NULL,
 CONSTRAINT [PK_Tag] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 28/11/2014 08:31:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Password] [nchar](30) NOT NULL,
	[Email] [nchar](30) NOT NULL,
	[Bio] [text] NULL,
	[Phone] [nchar](30) NULL,
	[Avatar] [nchar](30) NULL,
	[Birthday] [date] NULL,
	[FirstName] [nchar](30) NULL,
	[LastName] [nchar](30) NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Workshop]    Script Date: 28/11/2014 08:31:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Workshop](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Label] [nchar](100) NULL,
	[Date] [date] NULL,
	[Hour] [time](7) NULL,
	[PeopleMin] [int] NOT NULL,
	[PeopleMax] [int] NOT NULL,
	[Location] [geography] NULL,
	[Recurence] [nchar](50) NULL,
	[CreationDate] [datetime] NOT NULL,
	[Equipement] [text] NULL,
	[UserID] [int] NULL,
	[Address] [text] NULL,
	[Details] [text] NULL,
 CONSTRAINT [PK_Workshop] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[WorkshopTags]    Script Date: 28/11/2014 08:31:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkshopTags](
	[WorkshopID] [int] NOT NULL,
	[TagID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TagID] ASC,
	[WorkshopID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[SeenWorkshops] ([UserID], [WorkshopID]) VALUES (68, 59)
INSERT [dbo].[SeenWorkshops] ([UserID], [WorkshopID]) VALUES (69, 59)
SET IDENTITY_INSERT [dbo].[Tag] ON 

INSERT [dbo].[Tag] ([ID], [parentId], [label]) VALUES (109, NULL, N'classe                                                                                              ')
INSERT [dbo].[Tag] ([ID], [parentId], [label]) VALUES (110, NULL, N'catégorie                                                                                           ')
INSERT [dbo].[Tag] ([ID], [parentId], [label]) VALUES (111, NULL, N'espèce                                                                                              ')
INSERT [dbo].[Tag] ([ID], [parentId], [label]) VALUES (112, NULL, N'élégance                                                                                            ')
INSERT [dbo].[Tag] ([ID], [parentId], [label]) VALUES (113, NULL, N'courant                                                                                             ')
INSERT [dbo].[Tag] ([ID], [parentId], [label]) VALUES (114, NULL, N'promenade                                                                                           ')
INSERT [dbo].[Tag] ([ID], [parentId], [label]) VALUES (115, NULL, N'évolution                                                                                           ')
INSERT [dbo].[Tag] ([ID], [parentId], [label]) VALUES (116, NULL, N'leçon                                                                                               ')
INSERT [dbo].[Tag] ([ID], [parentId], [label]) VALUES (117, NULL, N'conseil                                                                                             ')
INSERT [dbo].[Tag] ([ID], [parentId], [label]) VALUES (118, NULL, N'lycée                                                                                               ')
INSERT [dbo].[Tag] ([ID], [parentId], [label]) VALUES (119, NULL, N'école                                                                                               ')
INSERT [dbo].[Tag] ([ID], [parentId], [label]) VALUES (120, NULL, N'collège                                                                                             ')
INSERT [dbo].[Tag] ([ID], [parentId], [label]) VALUES (121, NULL, N'institut                                                                                            ')
INSERT [dbo].[Tag] ([ID], [parentId], [label]) VALUES (122, NULL, N'institution                                                                                         ')
INSERT [dbo].[Tag] ([ID], [parentId], [label]) VALUES (123, NULL, N'pension                                                                                             ')
INSERT [dbo].[Tag] ([ID], [parentId], [label]) VALUES (124, NULL, N'balade                                                                                              ')
INSERT [dbo].[Tag] ([ID], [parentId], [label]) VALUES (125, NULL, N'rivière                                                                                             ')
INSERT [dbo].[Tag] ([ID], [parentId], [label]) VALUES (126, NULL, N'affluent                                                                                            ')
INSERT [dbo].[Tag] ([ID], [parentId], [label]) VALUES (127, NULL, N'ruisseau                                                                                            ')
INSERT [dbo].[Tag] ([ID], [parentId], [label]) VALUES (128, NULL, N'torrent                                                                                             ')
INSERT [dbo].[Tag] ([ID], [parentId], [label]) VALUES (129, NULL, N'voie                                                                                                ')
INSERT [dbo].[Tag] ([ID], [parentId], [label]) VALUES (130, NULL, N'taux                                                                                                ')
INSERT [dbo].[Tag] ([ID], [parentId], [label]) VALUES (131, NULL, N'rapport                                                                                             ')
INSERT [dbo].[Tag] ([ID], [parentId], [label]) VALUES (132, NULL, N'pourcentage                                                                                         ')
INSERT [dbo].[Tag] ([ID], [parentId], [label]) VALUES (133, NULL, N'proportion                                                                                          ')
INSERT [dbo].[Tag] ([ID], [parentId], [label]) VALUES (134, NULL, N'montant                                                                                             ')
INSERT [dbo].[Tag] ([ID], [parentId], [label]) VALUES (135, NULL, N'taxe                                                                                                ')
INSERT [dbo].[Tag] ([ID], [parentId], [label]) VALUES (136, NULL, N'intérêt                                                                                             ')
INSERT [dbo].[Tag] ([ID], [parentId], [label]) VALUES (137, NULL, N'prix                                                                                                ')
INSERT [dbo].[Tag] ([ID], [parentId], [label]) VALUES (138, NULL, N'tribunaux                                                                                           ')
INSERT [dbo].[Tag] ([ID], [parentId], [label]) VALUES (139, NULL, N'chambres                                                                                            ')
INSERT [dbo].[Tag] ([ID], [parentId], [label]) VALUES (140, NULL, N'pour                                                                                                ')
INSERT [dbo].[Tag] ([ID], [parentId], [label]) VALUES (141, NULL, N'contre                                                                                              ')
INSERT [dbo].[Tag] ([ID], [parentId], [label]) VALUES (142, NULL, N'moyennant                                                                                           ')
INSERT [dbo].[Tag] ([ID], [parentId], [label]) VALUES (143, NULL, N'comme                                                                                               ')
INSERT [dbo].[Tag] ([ID], [parentId], [label]) VALUES (144, NULL, N'quant à                                                                                             ')
INSERT [dbo].[Tag] ([ID], [parentId], [label]) VALUES (145, NULL, N'afin                                                                                                ')
INSERT [dbo].[Tag] ([ID], [parentId], [label]) VALUES (146, NULL, N'vers                                                                                                ')
INSERT [dbo].[Tag] ([ID], [parentId], [label]) VALUES (147, NULL, N'parce que                                                                                           ')
INSERT [dbo].[Tag] ([ID], [parentId], [label]) VALUES (148, NULL, N'par                                                                                                 ')
INSERT [dbo].[Tag] ([ID], [parentId], [label]) VALUES (149, NULL, N'aussi                                                                                               ')
INSERT [dbo].[Tag] ([ID], [parentId], [label]) VALUES (150, NULL, N'quelque                                                                                             ')
INSERT [dbo].[Tag] ([ID], [parentId], [label]) VALUES (151, NULL, N'pendant                                                                                             ')
INSERT [dbo].[Tag] ([ID], [parentId], [label]) VALUES (152, NULL, N'banjo                                                                                               ')
INSERT [dbo].[Tag] ([ID], [parentId], [label]) VALUES (153, NULL, N'luth                                                                                                ')
INSERT [dbo].[Tag] ([ID], [parentId], [label]) VALUES (154, NULL, N'mandoline                                                                                           ')
INSERT [dbo].[Tag] ([ID], [parentId], [label]) VALUES (155, NULL, N'cistre                                                                                              ')
INSERT [dbo].[Tag] ([ID], [parentId], [label]) VALUES (156, NULL, N'mandore                                                                                             ')
INSERT [dbo].[Tag] ([ID], [parentId], [label]) VALUES (157, NULL, N'théorbe                                                                                             ')
INSERT [dbo].[Tag] ([ID], [parentId], [label]) VALUES (160, NULL, N'appentis                                                                                            ')
INSERT [dbo].[Tag] ([ID], [parentId], [label]) VALUES (161, NULL, N'remise                                                                                              ')
INSERT [dbo].[Tag] ([ID], [parentId], [label]) VALUES (162, NULL, N'hangar                                                                                              ')
INSERT [dbo].[Tag] ([ID], [parentId], [label]) VALUES (163, NULL, N'arsenal                                                                                             ')
INSERT [dbo].[Tag] ([ID], [parentId], [label]) VALUES (164, NULL, N'réserve                                                                                             ')
INSERT [dbo].[Tag] ([ID], [parentId], [label]) VALUES (165, NULL, N'entrepôt                                                                                            ')
INSERT [dbo].[Tag] ([ID], [parentId], [label]) VALUES (166, NULL, N'magasin                                                                                             ')
INSERT [dbo].[Tag] ([ID], [parentId], [label]) VALUES (167, NULL, N'manutention                                                                                         ')
INSERT [dbo].[Tag] ([ID], [parentId], [label]) VALUES (168, NULL, N'dépôt                                                                                               ')
INSERT [dbo].[Tag] ([ID], [parentId], [label]) VALUES (169, NULL, N'manufacture                                                                                         ')
INSERT [dbo].[Tag] ([ID], [parentId], [label]) VALUES (170, NULL, N'chantier                                                                                            ')
INSERT [dbo].[Tag] ([ID], [parentId], [label]) VALUES (171, NULL, N'boutique                                                                                            ')
INSERT [dbo].[Tag] ([ID], [parentId], [label]) VALUES (172, NULL, N'laboratoire                                                                                         ')
INSERT [dbo].[Tag] ([ID], [parentId], [label]) VALUES (173, NULL, N'ouvroir                                                                                             ')
INSERT [dbo].[Tag] ([ID], [parentId], [label]) VALUES (174, NULL, N'équipe                                                                                              ')
INSERT [dbo].[Tag] ([ID], [parentId], [label]) VALUES (175, NULL, N'groupe                                                                                              ')
INSERT [dbo].[Tag] ([ID], [parentId], [label]) VALUES (176, NULL, N'escouade                                                                                            ')
INSERT [dbo].[Tag] ([ID], [parentId], [label]) VALUES (177, NULL, N'fabrique                                                                                            ')
INSERT [dbo].[Tag] ([ID], [parentId], [label]) VALUES (178, NULL, N'usine                                                                                               ')
INSERT [dbo].[Tag] ([ID], [parentId], [label]) VALUES (179, NULL, N'officine                                                                                            ')
INSERT [dbo].[Tag] ([ID], [parentId], [label]) VALUES (180, NULL, N'cabinet                                                                                             ')
INSERT [dbo].[Tag] ([ID], [parentId], [label]) VALUES (181, NULL, N'loge                                                                                                ')
INSERT [dbo].[Tag] ([ID], [parentId], [label]) VALUES (182, NULL, N'loggia                                                                                              ')
INSERT [dbo].[Tag] ([ID], [parentId], [label]) VALUES (183, NULL, N'pièce                                                                                               ')
INSERT [dbo].[Tag] ([ID], [parentId], [label]) VALUES (184, NULL, N'habite                                                                                              ')
INSERT [dbo].[Tag] ([ID], [parentId], [label]) VALUES (185, NULL, N'industrie                                                                                           ')
INSERT [dbo].[Tag] ([ID], [parentId], [label]) VALUES (186, NULL, N'aciérie                                                                                             ')
INSERT [dbo].[Tag] ([ID], [parentId], [label]) VALUES (187, NULL, N'forge                                                                                               ')
INSERT [dbo].[Tag] ([ID], [parentId], [label]) VALUES (188, NULL, N'fonderie                                                                                            ')
INSERT [dbo].[Tag] ([ID], [parentId], [label]) VALUES (189, NULL, N'distillerie                                                                                         ')
INSERT [dbo].[Tag] ([ID], [parentId], [label]) VALUES (190, NULL, N'raffinerie                                                                                          ')
INSERT [dbo].[Tag] ([ID], [parentId], [label]) VALUES (191, NULL, N'centrale                                                                                            ')
SET IDENTITY_INSERT [dbo].[Tag] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([Password], [Email], [Bio], [Phone], [Avatar], [Birthday], [FirstName], [LastName], [ID]) VALUES (N'cABhAHMAcwA=                  ', N'laurent.wieser@gmail.com      ', N'J''aime le poker la guitare et plein d''autre choses. La bière c''est une bonne chose aussi. ', N'+33650511711                  ', N'68.jpeg                       ', CAST(0xF5190B00 AS Date), N'Laurent                       ', N'Wieser                        ', 68)
INSERT [dbo].[User] ([Password], [Email], [Bio], [Phone], [Avatar], [Birthday], [FirstName], [LastName], [ID]) VALUES (N'cABhAHMAcwA=                  ', N'elsa.theuil@gmail.com         ', NULL, NULL, NULL, NULL, NULL, NULL, 69)
SET IDENTITY_INSERT [dbo].[User] OFF
SET IDENTITY_INSERT [dbo].[Workshop] ON 

INSERT [dbo].[Workshop] ([ID], [Label], [Date], [Hour], [PeopleMin], [PeopleMax], [Location], [Recurence], [CreationDate], [Equipement], [UserID], [Address], [Details]) VALUES (59, N'cours de guitare                                                                                    ', NULL, NULL, 1, 4, NULL, NULL, CAST(0x0000A3EF0105CB88 AS DateTime), NULL, 68, NULL, NULL)
INSERT [dbo].[Workshop] ([ID], [Label], [Date], [Hour], [PeopleMin], [PeopleMax], [Location], [Recurence], [CreationDate], [Equipement], [UserID], [Address], [Details]) VALUES (63, N'Atelier de guitare                                                                                  ', NULL, NULL, 1, 2, NULL, NULL, CAST(0x0000A3F1008501D5 AS DateTime), NULL, 69, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Workshop] OFF
INSERT [dbo].[WorkshopTags] ([WorkshopID], [TagID]) VALUES (63, 140)
INSERT [dbo].[WorkshopTags] ([WorkshopID], [TagID]) VALUES (63, 141)
INSERT [dbo].[WorkshopTags] ([WorkshopID], [TagID]) VALUES (63, 142)
INSERT [dbo].[WorkshopTags] ([WorkshopID], [TagID]) VALUES (63, 143)
INSERT [dbo].[WorkshopTags] ([WorkshopID], [TagID]) VALUES (63, 144)
INSERT [dbo].[WorkshopTags] ([WorkshopID], [TagID]) VALUES (63, 145)
INSERT [dbo].[WorkshopTags] ([WorkshopID], [TagID]) VALUES (63, 146)
INSERT [dbo].[WorkshopTags] ([WorkshopID], [TagID]) VALUES (63, 147)
INSERT [dbo].[WorkshopTags] ([WorkshopID], [TagID]) VALUES (63, 148)
INSERT [dbo].[WorkshopTags] ([WorkshopID], [TagID]) VALUES (63, 149)
INSERT [dbo].[WorkshopTags] ([WorkshopID], [TagID]) VALUES (63, 150)
INSERT [dbo].[WorkshopTags] ([WorkshopID], [TagID]) VALUES (63, 151)
INSERT [dbo].[WorkshopTags] ([WorkshopID], [TagID]) VALUES (63, 152)
INSERT [dbo].[WorkshopTags] ([WorkshopID], [TagID]) VALUES (63, 153)
INSERT [dbo].[WorkshopTags] ([WorkshopID], [TagID]) VALUES (63, 154)
INSERT [dbo].[WorkshopTags] ([WorkshopID], [TagID]) VALUES (63, 155)
INSERT [dbo].[WorkshopTags] ([WorkshopID], [TagID]) VALUES (63, 156)
INSERT [dbo].[WorkshopTags] ([WorkshopID], [TagID]) VALUES (63, 157)
INSERT [dbo].[WorkshopTags] ([WorkshopID], [TagID]) VALUES (63, 160)
INSERT [dbo].[WorkshopTags] ([WorkshopID], [TagID]) VALUES (63, 161)
INSERT [dbo].[WorkshopTags] ([WorkshopID], [TagID]) VALUES (63, 162)
INSERT [dbo].[WorkshopTags] ([WorkshopID], [TagID]) VALUES (63, 163)
INSERT [dbo].[WorkshopTags] ([WorkshopID], [TagID]) VALUES (63, 164)
INSERT [dbo].[WorkshopTags] ([WorkshopID], [TagID]) VALUES (63, 165)
INSERT [dbo].[WorkshopTags] ([WorkshopID], [TagID]) VALUES (63, 166)
INSERT [dbo].[WorkshopTags] ([WorkshopID], [TagID]) VALUES (63, 167)
INSERT [dbo].[WorkshopTags] ([WorkshopID], [TagID]) VALUES (63, 168)
INSERT [dbo].[WorkshopTags] ([WorkshopID], [TagID]) VALUES (63, 169)
INSERT [dbo].[WorkshopTags] ([WorkshopID], [TagID]) VALUES (63, 170)
INSERT [dbo].[WorkshopTags] ([WorkshopID], [TagID]) VALUES (63, 171)
INSERT [dbo].[WorkshopTags] ([WorkshopID], [TagID]) VALUES (63, 172)
INSERT [dbo].[WorkshopTags] ([WorkshopID], [TagID]) VALUES (63, 173)
INSERT [dbo].[WorkshopTags] ([WorkshopID], [TagID]) VALUES (63, 174)
INSERT [dbo].[WorkshopTags] ([WorkshopID], [TagID]) VALUES (63, 175)
INSERT [dbo].[WorkshopTags] ([WorkshopID], [TagID]) VALUES (63, 176)
INSERT [dbo].[WorkshopTags] ([WorkshopID], [TagID]) VALUES (63, 177)
INSERT [dbo].[WorkshopTags] ([WorkshopID], [TagID]) VALUES (63, 178)
INSERT [dbo].[WorkshopTags] ([WorkshopID], [TagID]) VALUES (63, 179)
INSERT [dbo].[WorkshopTags] ([WorkshopID], [TagID]) VALUES (63, 180)
INSERT [dbo].[WorkshopTags] ([WorkshopID], [TagID]) VALUES (63, 181)
INSERT [dbo].[WorkshopTags] ([WorkshopID], [TagID]) VALUES (63, 182)
INSERT [dbo].[WorkshopTags] ([WorkshopID], [TagID]) VALUES (63, 183)
INSERT [dbo].[WorkshopTags] ([WorkshopID], [TagID]) VALUES (63, 184)
INSERT [dbo].[WorkshopTags] ([WorkshopID], [TagID]) VALUES (63, 185)
INSERT [dbo].[WorkshopTags] ([WorkshopID], [TagID]) VALUES (63, 186)
INSERT [dbo].[WorkshopTags] ([WorkshopID], [TagID]) VALUES (63, 187)
INSERT [dbo].[WorkshopTags] ([WorkshopID], [TagID]) VALUES (63, 188)
INSERT [dbo].[WorkshopTags] ([WorkshopID], [TagID]) VALUES (63, 189)
INSERT [dbo].[WorkshopTags] ([WorkshopID], [TagID]) VALUES (63, 190)
INSERT [dbo].[WorkshopTags] ([WorkshopID], [TagID]) VALUES (63, 191)
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Tag]    Script Date: 28/11/2014 08:31:14 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Tag] ON [dbo].[Tag]
(
	[label] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_User]    Script Date: 28/11/2014 08:31:14 ******/
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [IX_User] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Participation]  WITH CHECK ADD  CONSTRAINT [FK_Participation_Participation] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Participation] CHECK CONSTRAINT [FK_Participation_Participation]
GO
ALTER TABLE [dbo].[Participation]  WITH CHECK ADD  CONSTRAINT [FK_Participation_Workshop1] FOREIGN KEY([WorkshopID])
REFERENCES [dbo].[Workshop] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Participation] CHECK CONSTRAINT [FK_Participation_Workshop1]
GO
ALTER TABLE [dbo].[SeenWorkshops]  WITH CHECK ADD  CONSTRAINT [FK_SeenWorkshops_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SeenWorkshops] CHECK CONSTRAINT [FK_SeenWorkshops_User]
GO
ALTER TABLE [dbo].[SeenWorkshops]  WITH CHECK ADD  CONSTRAINT [FK_SeenWorkshops_Workshop] FOREIGN KEY([WorkshopID])
REFERENCES [dbo].[Workshop] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SeenWorkshops] CHECK CONSTRAINT [FK_SeenWorkshops_Workshop]
GO
ALTER TABLE [dbo].[WorkshopTags]  WITH NOCHECK ADD  CONSTRAINT [FK_WorkshopTags_Tag] FOREIGN KEY([TagID])
REFERENCES [dbo].[Tag] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[WorkshopTags] NOCHECK CONSTRAINT [FK_WorkshopTags_Tag]
GO
ALTER TABLE [dbo].[WorkshopTags]  WITH NOCHECK ADD  CONSTRAINT [FK_WorkshopTags_Workshop] FOREIGN KEY([WorkshopID])
REFERENCES [dbo].[Workshop] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[WorkshopTags] CHECK CONSTRAINT [FK_WorkshopTags_Workshop]
GO
USE [master]
GO
ALTER DATABASE [Tiich] SET  READ_WRITE 
GO
