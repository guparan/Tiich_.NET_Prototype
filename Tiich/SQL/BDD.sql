USE [Tiich]
GO
/****** Object:  Table [dbo].[Tag]    Script Date: 22/11/2014 13:32:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tag](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[parentId] [int] NULL,
	[label] [nchar](100) NOT NULL,
	[workshopID] [int] NOT NULL,
 CONSTRAINT [PK_Tag] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 22/11/2014 13:32:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Password] [nchar](30) NOT NULL,
	[Email] [nchar](30) NOT NULL,
	[Bio] [text] NULL,
	[Phone] [nchar](10) NULL,
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
/****** Object:  Table [dbo].[Workshop]    Script Date: 22/11/2014 13:32:01 ******/
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
	[PriceMin] [float] NULL,
	[PriceMax] [float] NULL,
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
SET IDENTITY_INSERT [dbo].[Tag] ON 

INSERT [dbo].[Tag] ([ID], [parentId], [label], [workshopID]) VALUES (1, NULL, N'banjo                                                                                               ', 34)
INSERT [dbo].[Tag] ([ID], [parentId], [label], [workshopID]) VALUES (2, NULL, N'luth                                                                                                ', 34)
INSERT [dbo].[Tag] ([ID], [parentId], [label], [workshopID]) VALUES (3, NULL, N'mandoline                                                                                           ', 34)
INSERT [dbo].[Tag] ([ID], [parentId], [label], [workshopID]) VALUES (4, NULL, N'cistre                                                                                              ', 34)
INSERT [dbo].[Tag] ([ID], [parentId], [label], [workshopID]) VALUES (5, NULL, N'mandore                                                                                             ', 34)
INSERT [dbo].[Tag] ([ID], [parentId], [label], [workshopID]) VALUES (6, NULL, N'théorbe                                                                                             ', 34)
SET IDENTITY_INSERT [dbo].[Tag] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([Password], [Email], [Bio], [Phone], [Avatar], [Birthday], [FirstName], [LastName], [ID]) VALUES (N'cABhAHMAcwA=                  ', N'wieser.laurent@gmail.com      ', NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[User] ([Password], [Email], [Bio], [Phone], [Avatar], [Birthday], [FirstName], [LastName], [ID]) VALUES (N'cABhAHMAcwB3AG8AcgBkAA==      ', N'eleonore.pirri@gmail.com      ', NULL, NULL, NULL, NULL, NULL, NULL, 2)
INSERT [dbo].[User] ([Password], [Email], [Bio], [Phone], [Avatar], [Birthday], [FirstName], [LastName], [ID]) VALUES (N'cABhAHMAcwA=                  ', N'wieser.laurent@gmail.com      ', NULL, NULL, NULL, NULL, NULL, NULL, 3)
INSERT [dbo].[User] ([Password], [Email], [Bio], [Phone], [Avatar], [Birthday], [FirstName], [LastName], [ID]) VALUES (N'cABhAHMAcwA=                  ', N'wieser.laurent@gmail.com      ', NULL, NULL, NULL, NULL, NULL, NULL, 6)
INSERT [dbo].[User] ([Password], [Email], [Bio], [Phone], [Avatar], [Birthday], [FirstName], [LastName], [ID]) VALUES (N'cABhAHMAcwA=                  ', N'wieser.laurent@gmail.com      ', NULL, NULL, NULL, NULL, NULL, NULL, 7)
INSERT [dbo].[User] ([Password], [Email], [Bio], [Phone], [Avatar], [Birthday], [FirstName], [LastName], [ID]) VALUES (N'cABhAHMAcwA=                  ', N'wieser.laurent@gmail.com      ', NULL, NULL, NULL, NULL, NULL, NULL, 8)
INSERT [dbo].[User] ([Password], [Email], [Bio], [Phone], [Avatar], [Birthday], [FirstName], [LastName], [ID]) VALUES (N'cABhAHMAcwA=                  ', N'wieser.laurent@gmail.com      ', NULL, NULL, NULL, NULL, NULL, NULL, 9)
INSERT [dbo].[User] ([Password], [Email], [Bio], [Phone], [Avatar], [Birthday], [FirstName], [LastName], [ID]) VALUES (N'cABhAHMAcwA=                  ', N'wieser.laurent@gmail.com      ', NULL, NULL, NULL, NULL, NULL, NULL, 10)
INSERT [dbo].[User] ([Password], [Email], [Bio], [Phone], [Avatar], [Birthday], [FirstName], [LastName], [ID]) VALUES (N'cABhAHMAcwA=                  ', N'wieser.laurent@gmail.com      ', NULL, NULL, NULL, NULL, NULL, NULL, 11)
INSERT [dbo].[User] ([Password], [Email], [Bio], [Phone], [Avatar], [Birthday], [FirstName], [LastName], [ID]) VALUES (N'cABhAHMAcwA=                  ', N'wieser.laurent@gmail.com      ', NULL, NULL, NULL, NULL, NULL, NULL, 12)
INSERT [dbo].[User] ([Password], [Email], [Bio], [Phone], [Avatar], [Birthday], [FirstName], [LastName], [ID]) VALUES (N'cABhAHMAcwA=                  ', N'wieser.laurent@gmail.com      ', NULL, NULL, NULL, NULL, NULL, NULL, 13)
INSERT [dbo].[User] ([Password], [Email], [Bio], [Phone], [Avatar], [Birthday], [FirstName], [LastName], [ID]) VALUES (N'cABhAHMAcwA=                  ', N'wieser.laurent@gmail.com      ', NULL, NULL, NULL, NULL, NULL, NULL, 14)
INSERT [dbo].[User] ([Password], [Email], [Bio], [Phone], [Avatar], [Birthday], [FirstName], [LastName], [ID]) VALUES (N'cABhAHMAcwA=                  ', N'wieser.laurent@gmail.com      ', NULL, NULL, NULL, NULL, NULL, NULL, 15)
INSERT [dbo].[User] ([Password], [Email], [Bio], [Phone], [Avatar], [Birthday], [FirstName], [LastName], [ID]) VALUES (N'cABhAHMAcwA=                  ', N'wieser.laurent@gmail.com      ', NULL, NULL, NULL, NULL, NULL, NULL, 16)
INSERT [dbo].[User] ([Password], [Email], [Bio], [Phone], [Avatar], [Birthday], [FirstName], [LastName], [ID]) VALUES (N'cABhAHMAcwA=                  ', N'wieser.laurent@gmail.com      ', NULL, NULL, NULL, NULL, NULL, NULL, 20)
INSERT [dbo].[User] ([Password], [Email], [Bio], [Phone], [Avatar], [Birthday], [FirstName], [LastName], [ID]) VALUES (N'cABhAHMAcwA=                  ', N'wieser.laurent@gmail.com      ', NULL, NULL, NULL, NULL, NULL, NULL, 39)
SET IDENTITY_INSERT [dbo].[User] OFF
SET IDENTITY_INSERT [dbo].[Workshop] ON 

INSERT [dbo].[Workshop] ([ID], [Label], [Date], [Hour], [PeopleMin], [PeopleMax], [Location], [PriceMin], [PriceMax], [Recurence], [CreationDate], [Equipement], [UserID], [Address], [Details]) VALUES (3, N'Cours de guitare                                                                                    ', CAST(0x44390B00 AS Date), CAST(0x07002058A3A70000 AS Time), 0, 4, NULL, NULL, NULL, NULL, CAST(0x0000A3E800D4DC66 AS DateTime), N'Une brosse à dents', 8, N'Mommenheim, Deutschland', N'Cours de solfège possible')
INSERT [dbo].[Workshop] ([ID], [Label], [Date], [Hour], [PeopleMin], [PeopleMax], [Location], [PriceMin], [PriceMax], [Recurence], [CreationDate], [Equipement], [UserID], [Address], [Details]) VALUES (4, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, CAST(0x0000A3E900BC7168 AS DateTime), NULL, 9, N'Afrique', NULL)
INSERT [dbo].[Workshop] ([ID], [Label], [Date], [Hour], [PeopleMin], [PeopleMax], [Location], [PriceMin], [PriceMax], [Recurence], [CreationDate], [Equipement], [UserID], [Address], [Details]) VALUES (5, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, CAST(0x0000A3E900BD210E AS DateTime), NULL, 10, N'Mommert Sebastien, Rue des Jonquilles, Meximieux, France', NULL)
INSERT [dbo].[Workshop] ([ID], [Label], [Date], [Hour], [PeopleMin], [PeopleMax], [Location], [PriceMin], [PriceMax], [Recurence], [CreationDate], [Equipement], [UserID], [Address], [Details]) VALUES (6, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, CAST(0x0000A3E900BD3F6E AS DateTime), NULL, 11, N'Mommert Sebastien, Rue des Jonquilles, Meximieux, France', NULL)
INSERT [dbo].[Workshop] ([ID], [Label], [Date], [Hour], [PeopleMin], [PeopleMax], [Location], [PriceMin], [PriceMax], [Recurence], [CreationDate], [Equipement], [UserID], [Address], [Details]) VALUES (7, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, CAST(0x0000A3E900BD515C AS DateTime), NULL, 12, N'Mommert Sebastien, Rue des Jonquilles, Meximieux, France', NULL)
INSERT [dbo].[Workshop] ([ID], [Label], [Date], [Hour], [PeopleMin], [PeopleMax], [Location], [PriceMin], [PriceMax], [Recurence], [CreationDate], [Equipement], [UserID], [Address], [Details]) VALUES (8, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, CAST(0x0000A3E900BD9C11 AS DateTime), NULL, 13, N'Mommert Sebastien, Rue des Jonquilles, Meximieux, France', NULL)
INSERT [dbo].[Workshop] ([ID], [Label], [Date], [Hour], [PeopleMin], [PeopleMax], [Location], [PriceMin], [PriceMax], [Recurence], [CreationDate], [Equipement], [UserID], [Address], [Details]) VALUES (9, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, CAST(0x0000A3E900BDBF47 AS DateTime), NULL, 14, N'Mommert Sebastien, Rue des Jonquilles, Meximieux, France', NULL)
INSERT [dbo].[Workshop] ([ID], [Label], [Date], [Hour], [PeopleMin], [PeopleMax], [Location], [PriceMin], [PriceMax], [Recurence], [CreationDate], [Equipement], [UserID], [Address], [Details]) VALUES (10, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, CAST(0x0000A3E900BDD4FF AS DateTime), NULL, 15, N'Mommert Sebastien, Rue des Jonquilles, Meximieux, France', NULL)
INSERT [dbo].[Workshop] ([ID], [Label], [Date], [Hour], [PeopleMin], [PeopleMax], [Location], [PriceMin], [PriceMax], [Recurence], [CreationDate], [Equipement], [UserID], [Address], [Details]) VALUES (11, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, CAST(0x0000A3E900BE0343 AS DateTime), NULL, 16, N'Mommert Sebastien, Rue des Jonquilles, Meximieux, France', NULL)
INSERT [dbo].[Workshop] ([ID], [Label], [Date], [Hour], [PeopleMin], [PeopleMax], [Location], [PriceMin], [PriceMax], [Recurence], [CreationDate], [Equipement], [UserID], [Address], [Details]) VALUES (15, N'tenis                                                                                               ', NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, CAST(0x0000A3EA00ACB89A AS DateTime), NULL, 20, NULL, NULL)
INSERT [dbo].[Workshop] ([ID], [Label], [Date], [Hour], [PeopleMin], [PeopleMax], [Location], [PriceMin], [PriceMax], [Recurence], [CreationDate], [Equipement], [UserID], [Address], [Details]) VALUES (34, N'guitare                                                                                             ', NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, CAST(0x0000A3EA00C5CA8E AS DateTime), NULL, 39, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Workshop] OFF
ALTER TABLE [dbo].[Tag]  WITH CHECK ADD  CONSTRAINT [FK_Tag_Workshop] FOREIGN KEY([workshopID])
REFERENCES [dbo].[Workshop] ([ID])
GO
ALTER TABLE [dbo].[Tag] CHECK CONSTRAINT [FK_Tag_Workshop]
GO
ALTER TABLE [dbo].[Workshop]  WITH CHECK ADD  CONSTRAINT [FK_Workshop_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Workshop] CHECK CONSTRAINT [FK_Workshop_User]
GO
