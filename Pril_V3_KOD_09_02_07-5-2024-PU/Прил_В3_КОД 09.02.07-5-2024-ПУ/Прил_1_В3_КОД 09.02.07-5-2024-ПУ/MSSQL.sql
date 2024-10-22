USE [name_database]
GO
/****** Object:  Table [dbo].[order]    Script Date: 26.02.2024 15:13:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order](
	[datecreation] [date] NOT NULL,
	[orderstatus] [nvarchar](50) NOT NULL,
	[paymentstatus] [nvarchar](50) NOT NULL,
	[addres] [nvarchar](50) NOT NULL,
	[paymentmethod] [nvarchar](50) NOT NULL,
	[orderid] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [order_pk] PRIMARY KEY CLUSTERED 
(
	[orderid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orderpersonlist]    Script Date: 26.02.2024 15:13:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orderpersonlist](
	[orderpersonlistid] [int] IDENTITY(1,1) NOT NULL,
	[userid] [int] NOT NULL,
	[orderid] [int] NOT NULL,
 CONSTRAINT [orderpersonlist_pk] PRIMARY KEY CLUSTERED 
(
	[orderpersonlistid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[person]    Script Date: 26.02.2024 15:13:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[person](
	[personid] [int] IDENTITY(1,1) NOT NULL,
	[firstname] [nvarchar](50) NOT NULL,
	[lastname] [nvarchar](50) NOT NULL,
	[middlename] [nvarchar](50) NULL,
	[personrole] [nvarchar](50) NOT NULL,
 CONSTRAINT [person_pk] PRIMARY KEY CLUSTERED 
(
	[personid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[shift]    Script Date: 26.02.2024 15:13:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[shift](
	[shiftid] [int] IDENTITY(1,1) NOT NULL,
	[datestart] [date] NOT NULL,
	[dateend] [date] NOT NULL,
 CONSTRAINT [shift_pk] PRIMARY KEY CLUSTERED 
(
	[shiftid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user]    Script Date: 26.02.2024 15:13:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user](
	[userid] [int] IDENTITY(1,1) NOT NULL,
	[login] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[status] [nvarchar](50) NULL,
	[userroleid] [int] NOT NULL,
	[personid] [int] NOT NULL,
 CONSTRAINT [user_pk] PRIMARY KEY CLUSTERED 
(
	[userid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[userlist]    Script Date: 26.02.2024 15:13:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[userlist](
	[userlistid] [int] IDENTITY(1,1) NOT NULL,
	[userid] [int] NOT NULL,
	[shiftid] [int] NOT NULL,
 CONSTRAINT [userlist_pk] PRIMARY KEY CLUSTERED 
(
	[userlistid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[userrole]    Script Date: 26.02.2024 15:13:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[userrole](
	[userroleid] [int] IDENTITY(1,1) NOT NULL,
	[namerole] [nvarchar](50) NOT NULL,
 CONSTRAINT [userrole_pk] PRIMARY KEY CLUSTERED 
(
	[userroleid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[order] ON 

INSERT [dbo].[order] ([datecreation], [orderstatus], [paymentstatus], [addres], [paymentmethod], [orderid]) VALUES (CAST(N'2023-06-06' AS Date), N'готовится', N'принят', N'Россия, г. Тамбов, Социалистическая ул., д. 6', N'наличные', 1)
INSERT [dbo].[order] ([datecreation], [orderstatus], [paymentstatus], [addres], [paymentmethod], [orderid]) VALUES (CAST(N'2023-06-07' AS Date), N'готов', N'оплачен', N'Россия, г. Ангарск, Комсомольская ул., д. 13', N'наличные', 2)
INSERT [dbo].[order] ([datecreation], [orderstatus], [paymentstatus], [addres], [paymentmethod], [orderid]) VALUES (CAST(N'2023-06-08' AS Date), N'готовится', N'принят', N'Россия, г. Щёлково, Центральная ул., д. 5', N'ипотека', 3)
INSERT [dbo].[order] ([datecreation], [orderstatus], [paymentstatus], [addres], [paymentmethod], [orderid]) VALUES (CAST(N'2023-06-09' AS Date), N'готов', N'оплачен', N'Россия, г. Петропавловск-Камчатский, Вокзальная ул', N'ипотека', 4)
INSERT [dbo].[order] ([datecreation], [orderstatus], [paymentstatus], [addres], [paymentmethod], [orderid]) VALUES (CAST(N'2023-06-10' AS Date), N'готов', N'принят', N'Россия, г. Самара, Цветочная ул., д. 21', N'наличные', 5)
SET IDENTITY_INSERT [dbo].[order] OFF
GO
SET IDENTITY_INSERT [dbo].[person] ON 

INSERT [dbo].[person] ([personid], [firstname], [lastname], [middlename], [personrole]) VALUES (2, N'Николай', N'Селиванов', N'Даниилович', N'Пользователь')
INSERT [dbo].[person] ([personid], [firstname], [lastname], [middlename], [personrole]) VALUES (3, N'Никита', N'Афанасьев', N'Львович', N'Пользователь')
INSERT [dbo].[person] ([personid], [firstname], [lastname], [middlename], [personrole]) VALUES (4, N'Мария', N'Кириллова', N'Львовна', N'Пользователь')
INSERT [dbo].[person] ([personid], [firstname], [lastname], [middlename], [personrole]) VALUES (5, N'Анна', N'Савина', N'Серафимовна', N'Пользователь')
INSERT [dbo].[person] ([personid], [firstname], [lastname], [middlename], [personrole]) VALUES (6, N'Алиса', N'Зайцева', N'Адамовна', N'Пользователь')
INSERT [dbo].[person] ([personid], [firstname], [lastname], [middlename], [personrole]) VALUES (7, N'Степан', N'Фадеев', N'Романович', N'Пользователь')
INSERT [dbo].[person] ([personid], [firstname], [lastname], [middlename], [personrole]) VALUES (8, N'Ева', N'Яковлева', N'Максимовна', N'Пользователь')
INSERT [dbo].[person] ([personid], [firstname], [lastname], [middlename], [personrole]) VALUES (9, N'Станислав', N'Зиновьев', N'Демидович', N'Пользователь')
INSERT [dbo].[person] ([personid], [firstname], [lastname], [middlename], [personrole]) VALUES (10, N'Андрей', N'Корнев', N'Ильич', N'Пользователь')
INSERT [dbo].[person] ([personid], [firstname], [lastname], [middlename], [personrole]) VALUES (11, N'Иван', N'Кондрашов', N'Даниилович', N'Пользователь')
INSERT [dbo].[person] ([personid], [firstname], [lastname], [middlename], [personrole]) VALUES (12, N'Александр', N'Ульянов', N'Даниилович', N'Клиент')
INSERT [dbo].[person] ([personid], [firstname], [lastname], [middlename], [personrole]) VALUES (13, N'Милана', N'Карпова', N'Вячеславовна', N'Клиент')
INSERT [dbo].[person] ([personid], [firstname], [lastname], [middlename], [personrole]) VALUES (14, N'Иван', N'Коротков', N'Иванович', N'Клиент')
INSERT [dbo].[person] ([personid], [firstname], [lastname], [middlename], [personrole]) VALUES (15, N'София', N'Черная', N'Марковна', N'Клиент')
INSERT [dbo].[person] ([personid], [firstname], [lastname], [middlename], [personrole]) VALUES (16, N'Сафия', N'Дементьева', N'Матвеевна', N'Клиент')
SET IDENTITY_INSERT [dbo].[person] OFF
GO
SET IDENTITY_INSERT [dbo].[user] ON 

INSERT [dbo].[user] ([userid], [login], [password], [status], [userroleid], [personid]) VALUES (2, N'rubies', N'cmjcFvB3cI', NULL, 2, 2)
INSERT [dbo].[user] ([userid], [login], [password], [status], [userroleid], [personid]) VALUES (3, N'windle', N'2PAUAd0gMZ', NULL, 1, 3)
INSERT [dbo].[user] ([userid], [login], [password], [status], [userroleid], [personid]) VALUES (4, N'improv', N'bcFFGU16f6', NULL, 1, 4)
INSERT [dbo].[user] ([userid], [login], [password], [status], [userroleid], [personid]) VALUES (5, N'moving', N'A8HPZz9HTG', NULL, 2, 5)
INSERT [dbo].[user] ([userid], [login], [password], [status], [userroleid], [personid]) VALUES (6, N'bellum', N'ZjXm3JW7RJ', NULL, 3, 6)
INSERT [dbo].[user] ([userid], [login], [password], [status], [userroleid], [personid]) VALUES (7, N'siller', N'dVMfx1VMFF', NULL, 3, 7)
INSERT [dbo].[user] ([userid], [login], [password], [status], [userroleid], [personid]) VALUES (8, N'ragman', N'25Y9oOkwHn', NULL, 2, 8)
INSERT [dbo].[user] ([userid], [login], [password], [status], [userroleid], [personid]) VALUES (9, N'fautor', N'RJ41C0qynP', NULL, 3, 9)
INSERT [dbo].[user] ([userid], [login], [password], [status], [userroleid], [personid]) VALUES (10, N'coated', N'8g2FubQVZH', NULL, 3, 10)
INSERT [dbo].[user] ([userid], [login], [password], [status], [userroleid], [personid]) VALUES (11, N'fiches', N'LO1qRB42GP', NULL, 1, 11)
SET IDENTITY_INSERT [dbo].[user] OFF
GO
SET IDENTITY_INSERT [dbo].[userrole] ON 

INSERT [dbo].[userrole] ([userroleid], [namerole]) VALUES (1, N'Администратор')
INSERT [dbo].[userrole] ([userroleid], [namerole]) VALUES (2, N'Риелтор')
INSERT [dbo].[userrole] ([userroleid], [namerole]) VALUES (3, N'Юрист')
SET IDENTITY_INSERT [dbo].[userrole] OFF
GO
ALTER TABLE [dbo].[orderpersonlist]  WITH CHECK ADD  CONSTRAINT [orderpersonlist___fk] FOREIGN KEY([userid])
REFERENCES [dbo].[user] ([userid])
GO
ALTER TABLE [dbo].[orderpersonlist] CHECK CONSTRAINT [orderpersonlist___fk]
GO
ALTER TABLE [dbo].[orderpersonlist]  WITH CHECK ADD  CONSTRAINT [orderpersonlist___fk_2] FOREIGN KEY([orderid])
REFERENCES [dbo].[order] ([orderid])
GO
ALTER TABLE [dbo].[orderpersonlist] CHECK CONSTRAINT [orderpersonlist___fk_2]
GO
ALTER TABLE [dbo].[user]  WITH CHECK ADD  CONSTRAINT [user___fk] FOREIGN KEY([userroleid])
REFERENCES [dbo].[userrole] ([userroleid])
GO
ALTER TABLE [dbo].[user] CHECK CONSTRAINT [user___fk]
GO
ALTER TABLE [dbo].[user]  WITH CHECK ADD  CONSTRAINT [user___fk_2] FOREIGN KEY([personid])
REFERENCES [dbo].[person] ([personid])
GO
ALTER TABLE [dbo].[user] CHECK CONSTRAINT [user___fk_2]
GO
ALTER TABLE [dbo].[userlist]  WITH CHECK ADD  CONSTRAINT [userlist___fk] FOREIGN KEY([userid])
REFERENCES [dbo].[user] ([userid])
GO
ALTER TABLE [dbo].[userlist] CHECK CONSTRAINT [userlist___fk]
GO
ALTER TABLE [dbo].[userlist]  WITH CHECK ADD  CONSTRAINT [userlist___fk_2] FOREIGN KEY([shiftid])
REFERENCES [dbo].[shift] ([shiftid])
GO
ALTER TABLE [dbo].[userlist] CHECK CONSTRAINT [userlist___fk_2]
GO
