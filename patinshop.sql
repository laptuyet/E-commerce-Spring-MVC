USE [master]
GO
/****** Object:  Database [PATINSHOP]    Script Date: 07/21/2022 7:27:19 PM ******/
CREATE DATABASE [PATINSHOP]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PATINSHOP', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\PATINSHOP.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PATINSHOP_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\PATINSHOP_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [PATINSHOP] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PATINSHOP].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PATINSHOP] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PATINSHOP] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PATINSHOP] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PATINSHOP] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PATINSHOP] SET ARITHABORT OFF 
GO
ALTER DATABASE [PATINSHOP] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PATINSHOP] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PATINSHOP] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PATINSHOP] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PATINSHOP] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PATINSHOP] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PATINSHOP] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PATINSHOP] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PATINSHOP] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PATINSHOP] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PATINSHOP] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PATINSHOP] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PATINSHOP] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PATINSHOP] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PATINSHOP] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PATINSHOP] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PATINSHOP] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PATINSHOP] SET RECOVERY FULL 
GO
ALTER DATABASE [PATINSHOP] SET  MULTI_USER 
GO
ALTER DATABASE [PATINSHOP] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PATINSHOP] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PATINSHOP] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PATINSHOP] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PATINSHOP] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PATINSHOP] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'PATINSHOP', N'ON'
GO
ALTER DATABASE [PATINSHOP] SET QUERY_STORE = OFF
GO
USE [PATINSHOP]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 07/21/2022 7:27:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[cate_name] [nvarchar](70) NULL,
	[is_accessory] [bit] NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CusEmails]    Script Date: 07/21/2022 7:27:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CusEmails](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[email] [varchar](150) NULL,
 CONSTRAINT [PK_CusEmails] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CusOrder]    Script Date: 07/21/2022 7:27:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CusOrder](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[cre_date] [smalldatetime] NOT NULL,
	[full_name] [nvarchar](60) NOT NULL,
	[email] [nvarchar](100) NOT NULL,
	[phone] [varchar](15) NOT NULL,
	[address] [nvarchar](150) NOT NULL,
	[note] [nvarchar](200) NULL,
	[status] [bit] NULL,
	[total_money] [money] NULL,
	[cus_id] [varchar](8) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 07/21/2022 7:27:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[id] [varchar](8) NOT NULL,
	[fname] [nvarchar](50) NOT NULL,
	[lname] [nvarchar](10) NOT NULL,
	[email] [varchar](100) NULL,
	[phone] [varchar](15) NULL,
	[address] [nvarchar](150) NULL,
	[password] [varchar](100) NOT NULL,
	[role_id] [int] NULL,
	[photo] [text] NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 07/21/2022 7:27:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fname] [nvarchar](50) NOT NULL,
	[lname] [nvarchar](10) NOT NULL,
	[email] [varchar](100) NOT NULL,
	[phone] [varchar](15) NULL,
	[subject_name] [nvarchar](50) NOT NULL,
	[note] [nvarchar](200) NULL,
 CONSTRAINT [PK_Feedback] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Image]    Script Date: 07/21/2022 7:27:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Image](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[img_url] [text] NULL,
	[product_id] [varchar](8) NULL,
 CONSTRAINT [PK_Image] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MemberRole]    Script Date: 07/21/2022 7:27:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberRole](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[role_name] [nvarchar](50) NULL,
 CONSTRAINT [PK_MemberRole] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 07/21/2022 7:27:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [varchar](8) NULL,
	[order_id] [int] NULL,
	[price] [money] NOT NULL,
	[quantity] [int] NOT NULL,
	[total_money] [money] NOT NULL,
	[prod_size] [int] NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 07/21/2022 7:27:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[id] [varchar](8) NOT NULL,
	[category_id] [int] NULL,
	[title] [nvarchar](100) NOT NULL,
	[price] [money] NULL,
	[discount] [money] NULL,
	[image_url] [text] NULL,
	[prod_description] [nvarchar](500) NULL,
	[create_at] [smalldatetime] NULL,
	[view_count] [int] NULL,
	[is_accessory] [bit] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductSize]    Script Date: 07/21/2022 7:27:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductSize](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[size_num] [int] NOT NULL,
	[product_id] [varchar](8) NOT NULL,
 CONSTRAINT [PK_ProductSize] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Size]    Script Date: 07/21/2022 7:27:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Size](
	[size_num] [int] NOT NULL,
 CONSTRAINT [PK_Size] PRIMARY KEY CLUSTERED 
(
	[size_num] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([id], [cate_name], [is_accessory]) VALUES (1, N'Giày nam', 0)
INSERT [dbo].[Category] ([id], [cate_name], [is_accessory]) VALUES (2, N'Giày nữ', 0)
INSERT [dbo].[Category] ([id], [cate_name], [is_accessory]) VALUES (3, N'Giày trẻ em', 0)
INSERT [dbo].[Category] ([id], [cate_name], [is_accessory]) VALUES (20, N'Áo nam', 0)
INSERT [dbo].[Category] ([id], [cate_name], [is_accessory]) VALUES (36, N'Áo nữ', 0)
INSERT [dbo].[Category] ([id], [cate_name], [is_accessory]) VALUES (38, N'Nón', 1)
INSERT [dbo].[Category] ([id], [cate_name], [is_accessory]) VALUES (39, N'Đồ bộ nam', 0)
INSERT [dbo].[Category] ([id], [cate_name], [is_accessory]) VALUES (40, N'Đồ bộ nữ', 0)
INSERT [dbo].[Category] ([id], [cate_name], [is_accessory]) VALUES (41, N'Đồ bộ trẻ em', 0)
INSERT [dbo].[Category] ([id], [cate_name], [is_accessory]) VALUES (42, N'Tất', 1)
INSERT [dbo].[Category] ([id], [cate_name], [is_accessory]) VALUES (43, N'Kính', 0)
INSERT [dbo].[Category] ([id], [cate_name], [is_accessory]) VALUES (44, N'Quần', 0)
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[CusEmails] ON 

INSERT [dbo].[CusEmails] ([id], [email]) VALUES (3, N'n19dccn100@student.ptithcm.edu.vn')
INSERT [dbo].[CusEmails] ([id], [email]) VALUES (4, N'n19dccn055@student.ptithcm.edu.vn')
INSERT [dbo].[CusEmails] ([id], [email]) VALUES (5, N'n19dccn025@student.ptithcm.edu.vn')
INSERT [dbo].[CusEmails] ([id], [email]) VALUES (14, N'tranhoangphi0987@gmail.com')
SET IDENTITY_INSERT [dbo].[CusEmails] OFF
GO
SET IDENTITY_INSERT [dbo].[CusOrder] ON 

INSERT [dbo].[CusOrder] ([id], [cre_date], [full_name], [email], [phone], [address], [note], [status], [total_money], [cus_id]) VALUES (12, CAST(N'2022-05-01T00:00:00' AS SmallDateTime), N'Trần Phi', N'tranhoangphi0987@gmail.com', N'0914683078', N'TP. Phan Rang - Tháp Chàm', N'test', 1, 1229.4400, N'admin')
INSERT [dbo].[CusOrder] ([id], [cre_date], [full_name], [email], [phone], [address], [note], [status], [total_money], [cus_id]) VALUES (13, CAST(N'2022-05-01T00:00:00' AS SmallDateTime), N'Trần Phi', N'tranhoangphi0987@gmail.com', N'0914683078', N'TP. Phan Rang - Tháp Chàm', N'xả tiền ngày quốc tế lao động 1/5', 1, 2584.9900, N'admin')
INSERT [dbo].[CusOrder] ([id], [cre_date], [full_name], [email], [phone], [address], [note], [status], [total_money], [cus_id]) VALUES (14, CAST(N'2022-05-01T00:00:00' AS SmallDateTime), N'Trần Phi', N'tranhoangphi0987@gmail.com', N'0914683078', N'TP. Phan Rang - Tháp Chàm', N'', 1, 299.9800, N'admin')
INSERT [dbo].[CusOrder] ([id], [cre_date], [full_name], [email], [phone], [address], [note], [status], [total_money], [cus_id]) VALUES (15, CAST(N'2022-05-07T00:00:00' AS SmallDateTime), N'Trần Phi', N'tranhoangphi0987@gmail.com', N'0914683078', N'TP. Phan Rang - Tháp Chàm', N'test', 1, 1400.0000, N'admin')
INSERT [dbo].[CusOrder] ([id], [cre_date], [full_name], [email], [phone], [address], [note], [status], [total_money], [cus_id]) VALUES (16, CAST(N'2022-05-12T00:00:00' AS SmallDateTime), N'Trần Phi', N'tranhoangphi0987@gmail.com', N'0914683078', N'TP. Phan Rang - Tháp Chàm', N'', 1, 1852.9900, N'zoro2104')
SET IDENTITY_INSERT [dbo].[CusOrder] OFF
GO
INSERT [dbo].[Customer] ([id], [fname], [lname], [email], [phone], [address], [password], [role_id], [photo]) VALUES (N'admin', N'Trần Hoàng', N'Phi', N'tranhoangphi0987@gmail.com', N'0914683078', N'TP. Phan Rang - Tháp Chàm', N'$2a$10$eIWBWKNC.PLV2.Wm3birku9UJGEOGAjTyndiYwdXi8M4ca306dk.K', 1, N'narutooo.jpg')
INSERT [dbo].[Customer] ([id], [fname], [lname], [email], [phone], [address], [password], [role_id], [photo]) VALUES (N'phipro', N'Trần', N'Phi', N'tranhoangphi0987@gmail.com', N'0914683078', N'TP. Phan Rang - Tháp Chàm', N'$2a$10$eIWBWKNC.PLV2.Wm3birku9UJGEOGAjTyndiYwdXi8M4ca306dk.K', 2, N'user.jpg')
INSERT [dbo].[Customer] ([id], [fname], [lname], [email], [phone], [address], [password], [role_id], [photo]) VALUES (N'zoro2104', N'Monkey D', N'Luffy', N'luffy2104@gmail.com', N'0987361935', N'Ninh thuận', N'$2a$10$eIWBWKNC.PLV2.Wm3birku9UJGEOGAjTyndiYwdXi8M4ca306dk.K', 2, N'sasukeee.jpg')
GO
SET IDENTITY_INSERT [dbo].[MemberRole] ON 

INSERT [dbo].[MemberRole] ([id], [role_name]) VALUES (1, N'ROLE_ADMIN')
INSERT [dbo].[MemberRole] ([id], [role_name]) VALUES (2, N'ROLE_USER')
SET IDENTITY_INSERT [dbo].[MemberRole] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetail] ON 

INSERT [dbo].[OrderDetail] ([id], [product_id], [order_id], [price], [quantity], [total_money], [prod_size]) VALUES (4, N'SP0003', 12, 209.9900, 1, 209.9900, 40)
INSERT [dbo].[OrderDetail] ([id], [product_id], [order_id], [price], [quantity], [total_money], [prod_size]) VALUES (5, N'SP0004', 12, 519.4900, 1, 519.4900, 40)
INSERT [dbo].[OrderDetail] ([id], [product_id], [order_id], [price], [quantity], [total_money], [prod_size]) VALUES (6, N'SP0001', 12, 149.9900, 2, 299.9800, 40)
INSERT [dbo].[OrderDetail] ([id], [product_id], [order_id], [price], [quantity], [total_money], [prod_size]) VALUES (7, N'SP0002', 12, 99.9900, 2, 199.9800, 40)
INSERT [dbo].[OrderDetail] ([id], [product_id], [order_id], [price], [quantity], [total_money], [prod_size]) VALUES (8, N'SP0005', 13, 320.0000, 1, 320.0000, 40)
INSERT [dbo].[OrderDetail] ([id], [product_id], [order_id], [price], [quantity], [total_money], [prod_size]) VALUES (9, N'SP0006', 13, 452.9900, 1, 452.9900, 40)
INSERT [dbo].[OrderDetail] ([id], [product_id], [order_id], [price], [quantity], [total_money], [prod_size]) VALUES (10, N'SP0007', 13, 412.0000, 1, 412.0000, 40)
INSERT [dbo].[OrderDetail] ([id], [product_id], [order_id], [price], [quantity], [total_money], [prod_size]) VALUES (11, N'SP0008', 13, 700.0000, 2, 1400.0000, 40)
INSERT [dbo].[OrderDetail] ([id], [product_id], [order_id], [price], [quantity], [total_money], [prod_size]) VALUES (12, N'SP0001', 14, 149.9900, 2, 299.9800, 40)
INSERT [dbo].[OrderDetail] ([id], [product_id], [order_id], [price], [quantity], [total_money], [prod_size]) VALUES (13, N'SP0008', 15, 700.0000, 2, 1400.0000, 42)
INSERT [dbo].[OrderDetail] ([id], [product_id], [order_id], [price], [quantity], [total_money], [prod_size]) VALUES (14, N'SP0006', 16, 452.9900, 1, 452.9900, 41)
INSERT [dbo].[OrderDetail] ([id], [product_id], [order_id], [price], [quantity], [total_money], [prod_size]) VALUES (15, N'SP0008', 16, 700.0000, 2, 1400.0000, 42)
SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
GO
INSERT [dbo].[Product] ([id], [category_id], [title], [price], [discount], [image_url], [prod_description], [create_at], [view_count], [is_accessory]) VALUES (N'SP0001', 1, N'Air Jordan 1 Retro High OG University Blue', 179.9900, 149.9900, N'Air_Jordan_1_Retro_High_OG_University_Blue.png', N'Giày patin Flying Eagle F6 đỏ có form dáng tạo được sự chuyên nghiệp đối với cả những người mới bắt đầu chơi nhờ phần cổ cao, ôm gọn, chắc chắn. Sự xuất hiện của các hoạt tiết đơn giản song bắt mắt đã rất kích thích thị giác người dùng ngay lần đầu tiên bắt gặp. Nhiều ô thoáng ở thân giày giúp điều hòa khí hiệu quả để đôi bàn chân người đeo luôn cảm thấy dễ chịu.', CAST(N'2022-04-21T00:00:00' AS SmallDateTime), 392, 0)
INSERT [dbo].[Product] ([id], [category_id], [title], [price], [discount], [image_url], [prod_description], [create_at], [view_count], [is_accessory]) VALUES (N'SP0002', 2, N'Nike Air Max 90 Premium', 150.0000, 99.9900, N'Nike_Air_Max_90_Premium.png', N'Giày patin Flying Eagle F6 đỏ có form dáng tạo được sự chuyên nghiệp đối với cả những người mới bắt đầu chơi nhờ phần cổ cao, ôm gọn, chắc chắn. Sự xuất hiện của các hoạt tiết đơn giản song bắt mắt đã rất kích thích thị giác người dùng ngay lần đầu tiên bắt gặp. Nhiều ô thoáng ở thân giày giúp điều hòa khí hiệu quả để đôi bàn chân người đeo luôn cảm thấy dễ chịu.', CAST(N'2022-04-23T00:00:00' AS SmallDateTime), 2308, 0)
INSERT [dbo].[Product] ([id], [category_id], [title], [price], [discount], [image_url], [prod_description], [create_at], [view_count], [is_accessory]) VALUES (N'SP0003', 20, N'Áo thun Drew House Mascot SS Tee ‘Brown’', 209.9900, NULL, N'279337635_858338515569439_8695121887488827381_n.png', N'Giày patin Flying Eagle F6 đỏ có form dáng tạo được sự chuyên nghiệp đối với cả những người mới bắt đầu chơi nhờ phần cổ cao, ôm gọn, chắc chắn. Sự xuất hiện của các hoạt tiết đơn giản song bắt mắt đã rất kích thích thị giác người dùng ngay lần đầu tiên bắt gặp. Nhiều ô thoáng ở thân giày giúp điều hòa khí hiệu quả để đôi bàn chân người đeo luôn cảm thấy dễ chịu.', CAST(N'2022-04-24T00:00:00' AS SmallDateTime), 2045, 0)
INSERT [dbo].[Product] ([id], [category_id], [title], [price], [discount], [image_url], [prod_description], [create_at], [view_count], [is_accessory]) VALUES (N'SP0004', 20, N'Áo Drew House Corduroy SS Shirt ‘Chaz Brown’
', 519.4900, NULL, N'280751376_553283839523481_8866698617494383515_n.png', N'Giày patin Flying Eagle F6 đỏ có form dáng tạo được sự chuyên nghiệp đối với cả những người mới bắt đầu chơi nhờ phần cổ cao, ôm gọn, chắc chắn. Sự xuất hiện của các hoạt tiết đơn giản song bắt mắt đã rất kích thích thị giác người dùng ngay lần đầu tiên bắt gặp. Nhiều ô thoáng ở thân giày giúp điều hòa khí hiệu quả để đôi bàn chân người đeo luôn cảm thấy dễ chịu.', CAST(N'2022-04-25T00:00:00' AS SmallDateTime), 1021, 0)
INSERT [dbo].[Product] ([id], [category_id], [title], [price], [discount], [image_url], [prod_description], [create_at], [view_count], [is_accessory]) VALUES (N'SP0005', 20, N'Áo Drew House Drew Script Sweater Black
', 357.8900, 320.0000, N'283313702_557173889155161_1786631249477287719_n.png', N'Giày patin Flying Eagle F6 đỏ có form dáng tạo được sự chuyên nghiệp đối với cả những người mới bắt đầu chơi nhờ phần cổ cao, ôm gọn, chắc chắn. Sự xuất hiện của các hoạt tiết đơn giản song bắt mắt đã rất kích thích thị giác người dùng ngay lần đầu tiên bắt gặp. Nhiều ô thoáng ở thân giày giúp điều hòa khí hiệu quả để đôi bàn chân người đeo luôn cảm thấy dễ chịu.', CAST(N'2022-04-26T00:00:00' AS SmallDateTime), 2579, 0)
INSERT [dbo].[Product] ([id], [category_id], [title], [price], [discount], [image_url], [prod_description], [create_at], [view_count], [is_accessory]) VALUES (N'SP0006', 20, N'Áo thun FEAR OF GOD ESSENTIALS T-shirt SS21 Light Heather Oatmeal
', 452.9900, NULL, N'281582620_562378092151086_298567304924043760_n.png', N'Giày patin Flying Eagle F6 đỏ có form dáng tạo được sự chuyên nghiệp đối với cả những người mới bắt đầu chơi nhờ phần cổ cao, ôm gọn, chắc chắn. Sự xuất hiện của các hoạt tiết đơn giản song bắt mắt đã rất kích thích thị giác người dùng ngay lần đầu tiên bắt gặp. Nhiều ô thoáng ở thân giày giúp điều hòa khí hiệu quả để đôi bàn chân người đeo luôn cảm thấy dễ chịu.', CAST(N'2022-04-27T00:00:00' AS SmallDateTime), 474, 0)
INSERT [dbo].[Product] ([id], [category_id], [title], [price], [discount], [image_url], [prod_description], [create_at], [view_count], [is_accessory]) VALUES (N'SP0007', 20, N'Áo Hoodie Fear of God Essentials Knit Pullover Hoodie Pistachio
', 501.9900, 412.0000, N'282679158_1171956523375846_5320654553096334362_n.png', N'Giày patin Flying Eagle F6 đỏ có form dáng tạo được sự chuyên nghiệp đối với cả những người mới bắt đầu chơi nhờ phần cổ cao, ôm gọn, chắc chắn. Sự xuất hiện của các hoạt tiết đơn giản song bắt mắt đã rất kích thích thị giác người dùng ngay lần đầu tiên bắt gặp. Nhiều ô thoáng ở thân giày giúp điều hòa khí hiệu quả để đôi bàn chân người đeo luôn cảm thấy dễ chịu.', CAST(N'2022-04-28T00:00:00' AS SmallDateTime), 3479, 0)
INSERT [dbo].[Product] ([id], [category_id], [title], [price], [discount], [image_url], [prod_description], [create_at], [view_count], [is_accessory]) VALUES (N'SP0008', 2, N'Air Jordan 1 Mid Crimson Tint
', 725.8900, 700.0000, N'281272288_1032845774324098_1969121764141684620_n.png', N'Giày patin Flying Eagle F6 đỏ có form dáng tạo được sự chuyên nghiệp đối với cả những người mới bắt đầu chơi nhờ phần cổ cao, ôm gọn, chắc chắn. Sự xuất hiện của các hoạt tiết đơn giản song bắt mắt đã rất kích thích thị giác người dùng ngay lần đầu tiên bắt gặp. Nhiều ô thoáng ở thân giày giúp điều hòa khí hiệu quả để đôi bàn chân người đeo luôn cảm thấy dễ chịu.', CAST(N'2022-04-29T00:00:00' AS SmallDateTime), 258, 0)
INSERT [dbo].[Product] ([id], [category_id], [title], [price], [discount], [image_url], [prod_description], [create_at], [view_count], [is_accessory]) VALUES (N'SP0009', 38, N'Nón BucKet Cây mầm màu Vàng', 300.0000, NULL, N'281820891_697732261555693_1661528456620456961_n.jpg', N'', CAST(N'2022-05-24T00:00:00' AS SmallDateTime), 0, 1)
INSERT [dbo].[Product] ([id], [category_id], [title], [price], [discount], [image_url], [prod_description], [create_at], [view_count], [is_accessory]) VALUES (N'SP0010', 39, N'Đồ bộ đá banh nam hảo hảo', 500.0000, NULL, N'VHsKGicR7PzC7QdoyqZV_simg_de2fe0_500x500_maxb.jpg', N'', CAST(N'2022-05-24T00:00:00' AS SmallDateTime), 1, 0)
INSERT [dbo].[Product] ([id], [category_id], [title], [price], [discount], [image_url], [prod_description], [create_at], [view_count], [is_accessory]) VALUES (N'SP0011', 41, N'Đồ bộ trẻ em mì hảo hảo', 399.0000, NULL, N'c1ef842cf1465f2a96130787918bd763.jpg', NULL, CAST(N'2022-05-24T15:36:00' AS SmallDateTime), 0, 0)
INSERT [dbo].[Product] ([id], [category_id], [title], [price], [discount], [image_url], [prod_description], [create_at], [view_count], [is_accessory]) VALUES (N'SP0012', 41, N'Đồ bộ trẻ em CHIN-SU', 214.0000, NULL, N'6948923b22311bf08e847fe9c106d2a5.jpg', N'', CAST(N'2022-05-24T00:00:00' AS SmallDateTime), 7, 0)
INSERT [dbo].[Product] ([id], [category_id], [title], [price], [discount], [image_url], [prod_description], [create_at], [view_count], [is_accessory]) VALUES (N'SP0013', 40, N'Đồ bộ nữ mì hảo hảo', 450.0000, NULL, N'6290469ac90d5d52e18b38843d05c7e5.jpg', NULL, CAST(N'2022-05-24T00:00:00' AS SmallDateTime), 2, 0)
INSERT [dbo].[Product] ([id], [category_id], [title], [price], [discount], [image_url], [prod_description], [create_at], [view_count], [is_accessory]) VALUES (N'SP0014', 42, N'Tất Nike Everyday Plus', 100.0000, NULL, N'275932623_653165105769659_5153583173312726250_n.png', N'', CAST(N'2022-05-24T00:00:00' AS SmallDateTime), 2, 1)
INSERT [dbo].[Product] ([id], [category_id], [title], [price], [discount], [image_url], [prod_description], [create_at], [view_count], [is_accessory]) VALUES (N'SP0015', 42, N'Tất Nike Everyday Plus Cushioned
', 99.0000, NULL, N'277254934_442812147602696_6100492901969831261_n.png', NULL, CAST(N'2022-05-24T00:00:00' AS SmallDateTime), 1, 1)
INSERT [dbo].[Product] ([id], [category_id], [title], [price], [discount], [image_url], [prod_description], [create_at], [view_count], [is_accessory]) VALUES (N'SP0016', 40, N'Đồ bộ nữ Nike Sportswear Essential
', 456.0000, NULL, N'279227131_559691512206534_7480491355841059274_n.png', NULL, CAST(N'2022-05-24T00:00:00' AS SmallDateTime), 5, 0)
INSERT [dbo].[Product] ([id], [category_id], [title], [price], [discount], [image_url], [prod_description], [create_at], [view_count], [is_accessory]) VALUES (N'SP0017', 40, N'Đồ bộ nữ Nike Sportswear Swoosh', 457.0000, NULL, N'280237567_1042850639947902_826930113415633933_n.png', N'', CAST(N'2022-05-24T00:00:00' AS SmallDateTime), 9, 0)
GO
SET IDENTITY_INSERT [dbo].[ProductSize] ON 

INSERT [dbo].[ProductSize] ([id], [size_num], [product_id]) VALUES (2, 38, N'SP0001')
INSERT [dbo].[ProductSize] ([id], [size_num], [product_id]) VALUES (11, 38, N'SP0005')
INSERT [dbo].[ProductSize] ([id], [size_num], [product_id]) VALUES (3, 39, N'SP0001')
INSERT [dbo].[ProductSize] ([id], [size_num], [product_id]) VALUES (12, 39, N'SP0005')
INSERT [dbo].[ProductSize] ([id], [size_num], [product_id]) VALUES (4, 40, N'SP0001')
INSERT [dbo].[ProductSize] ([id], [size_num], [product_id]) VALUES (7, 40, N'SP0002')
INSERT [dbo].[ProductSize] ([id], [size_num], [product_id]) VALUES (10, 40, N'SP0004')
INSERT [dbo].[ProductSize] ([id], [size_num], [product_id]) VALUES (13, 40, N'SP0005')
INSERT [dbo].[ProductSize] ([id], [size_num], [product_id]) VALUES (19, 40, N'SP0008')
INSERT [dbo].[ProductSize] ([id], [size_num], [product_id]) VALUES (41, 40, N'SP0009')
INSERT [dbo].[ProductSize] ([id], [size_num], [product_id]) VALUES (22, 40, N'SP0010')
INSERT [dbo].[ProductSize] ([id], [size_num], [product_id]) VALUES (23, 40, N'SP0011')
INSERT [dbo].[ProductSize] ([id], [size_num], [product_id]) VALUES (24, 40, N'SP0012')
INSERT [dbo].[ProductSize] ([id], [size_num], [product_id]) VALUES (26, 40, N'SP0013')
INSERT [dbo].[ProductSize] ([id], [size_num], [product_id]) VALUES (27, 40, N'SP0014')
INSERT [dbo].[ProductSize] ([id], [size_num], [product_id]) VALUES (28, 40, N'SP0015')
INSERT [dbo].[ProductSize] ([id], [size_num], [product_id]) VALUES (29, 40, N'SP0016')
INSERT [dbo].[ProductSize] ([id], [size_num], [product_id]) VALUES (39, 40, N'SP0017')
INSERT [dbo].[ProductSize] ([id], [size_num], [product_id]) VALUES (6, 41, N'SP0003')
INSERT [dbo].[ProductSize] ([id], [size_num], [product_id]) VALUES (8, 41, N'SP0004')
INSERT [dbo].[ProductSize] ([id], [size_num], [product_id]) VALUES (14, 41, N'SP0006')
INSERT [dbo].[ProductSize] ([id], [size_num], [product_id]) VALUES (5, 42, N'SP0002')
INSERT [dbo].[ProductSize] ([id], [size_num], [product_id]) VALUES (15, 42, N'SP0006')
INSERT [dbo].[ProductSize] ([id], [size_num], [product_id]) VALUES (18, 42, N'SP0008')
INSERT [dbo].[ProductSize] ([id], [size_num], [product_id]) VALUES (9, 43, N'SP0004')
INSERT [dbo].[ProductSize] ([id], [size_num], [product_id]) VALUES (17, 43, N'SP0007')
INSERT [dbo].[ProductSize] ([id], [size_num], [product_id]) VALUES (16, 44, N'SP0007')
SET IDENTITY_INSERT [dbo].[ProductSize] OFF
GO
INSERT [dbo].[Size] ([size_num]) VALUES (38)
INSERT [dbo].[Size] ([size_num]) VALUES (39)
INSERT [dbo].[Size] ([size_num]) VALUES (40)
INSERT [dbo].[Size] ([size_num]) VALUES (41)
INSERT [dbo].[Size] ([size_num]) VALUES (42)
INSERT [dbo].[Size] ([size_num]) VALUES (43)
INSERT [dbo].[Size] ([size_num]) VALUES (44)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_Table_2]    Script Date: 07/21/2022 7:27:19 PM ******/
ALTER TABLE [dbo].[ProductSize] ADD  CONSTRAINT [UK_Table_2] UNIQUE NONCLUSTERED 
(
	[size_num] ASC,
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_is_accessory]  DEFAULT ((0)) FOR [is_accessory]
GO
ALTER TABLE [dbo].[CusOrder] ADD  DEFAULT (getdate()) FOR [cre_date]
GO
ALTER TABLE [dbo].[CusOrder] ADD  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_id]  DEFAULT ((0)) FOR [id]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_create_at]  DEFAULT (getdate()) FOR [create_at]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_view_count]  DEFAULT ((0)) FOR [view_count]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_is_accessory]  DEFAULT ((0)) FOR [is_accessory]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_MemberRole] FOREIGN KEY([role_id])
REFERENCES [dbo].[MemberRole] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_MemberRole]
GO
ALTER TABLE [dbo].[Image]  WITH CHECK ADD  CONSTRAINT [FK_Image_Product] FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Image] CHECK CONSTRAINT [FK_Image_Product]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_Order_ID] FOREIGN KEY([order_id])
REFERENCES [dbo].[CusOrder] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_Order_ID]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Product] FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([category_id])
REFERENCES [dbo].[Category] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[ProductSize]  WITH CHECK ADD  CONSTRAINT [FK_ProductSize_Product] FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[ProductSize] CHECK CONSTRAINT [FK_ProductSize_Product]
GO
ALTER TABLE [dbo].[ProductSize]  WITH CHECK ADD  CONSTRAINT [FK_ProductSize_Size] FOREIGN KEY([size_num])
REFERENCES [dbo].[Size] ([size_num])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[ProductSize] CHECK CONSTRAINT [FK_ProductSize_Size]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [CK_discount] CHECK  (([discount]<[price] AND [discount]>(0)))
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [CK_discount]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [CK_price] CHECK  (([price]>(0)))
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [CK_price]
GO
USE [master]
GO
ALTER DATABASE [PATINSHOP] SET  READ_WRITE 
GO
