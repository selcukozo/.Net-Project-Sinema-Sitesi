USE [master]
GO
/****** Object:  Database [SinemaProje]    Script Date: 28.3.2015 14:31:56 ******/
CREATE DATABASE [SinemaProje]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SinemaProje', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\SinemaProje.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SinemaProje_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\SinemaProje_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [SinemaProje] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SinemaProje].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SinemaProje] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SinemaProje] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SinemaProje] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SinemaProje] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SinemaProje] SET ARITHABORT OFF 
GO
ALTER DATABASE [SinemaProje] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SinemaProje] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SinemaProje] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SinemaProje] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SinemaProje] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SinemaProje] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SinemaProje] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SinemaProje] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SinemaProje] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SinemaProje] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SinemaProje] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SinemaProje] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SinemaProje] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SinemaProje] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SinemaProje] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SinemaProje] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SinemaProje] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SinemaProje] SET RECOVERY FULL 
GO
ALTER DATABASE [SinemaProje] SET  MULTI_USER 
GO
ALTER DATABASE [SinemaProje] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SinemaProje] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SinemaProje] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SinemaProje] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [SinemaProje] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'SinemaProje', N'ON'
GO
USE [SinemaProje]
GO
/****** Object:  Table [dbo].[tbl_film_begenme]    Script Date: 28.3.2015 14:31:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_film_begenme](
	[film_begenme_ref_id] [int] IDENTITY(1,1) NOT NULL,
	[kul_id] [int] NULL,
	[film_ref_id] [int] NULL,
 CONSTRAINT [PK_tbl_film_begenme] PRIMARY KEY CLUSTERED 
(
	[film_begenme_ref_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_filmler]    Script Date: 28.3.2015 14:31:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_filmler](
	[film_ref_id] [int] IDENTITY(1,1) NOT NULL,
	[film_adi] [nvarchar](max) NULL,
	[film_izlenme] [int] NULL,
	[film_resim] [nvarchar](50) NULL,
	[film_seslendirme] [nvarchar](max) NULL,
	[film_imdb_puani] [nvarchar](10) NULL,
	[film_aciklama] [nvarchar](max) NULL,
	[film_link_fragman] [nvarchar](max) NULL,
	[film_link] [nvarchar](max) NULL,
	[film_begenme] [int] NULL,
	[film_upload_tarihi] [datetime] NULL CONSTRAINT [DF_tbl_filmler_film_upload_tarihi]  DEFAULT (getdate()),
	[film_kunye] [nvarchar](max) NULL,
	[film_yapim] [nvarchar](max) NULL,
	[film_yonetmen] [nvarchar](50) NULL,
	[film_oyuncular] [nvarchar](max) NULL,
 CONSTRAINT [PK_Tbl_filmler] PRIMARY KEY CLUSTERED 
(
	[film_ref_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_filmler_ve_kategoriler]    Script Date: 28.3.2015 14:31:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_filmler_ve_kategoriler](
	[film_kategori_ref_id] [int] IDENTITY(1,1) NOT NULL,
	[film_ref_id] [int] NULL,
	[kategori_ref_id] [int] NULL,
 CONSTRAINT [PK_tbl_filmler_ve_kategoriler] PRIMARY KEY CLUSTERED 
(
	[film_kategori_ref_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_kategoriler]    Script Date: 28.3.2015 14:31:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_kategoriler](
	[kategori_ref_id] [int] IDENTITY(1,1) NOT NULL,
	[kategori_adi] [nvarchar](50) NULL,
 CONSTRAINT [PK_tbl_kategoriler] PRIMARY KEY CLUSTERED 
(
	[kategori_ref_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_kul]    Script Date: 28.3.2015 14:31:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_kul](
	[kul_id] [int] IDENTITY(1,1) NOT NULL,
	[kul_adi] [nvarchar](max) NULL,
	[kul_soyadi] [nvarchar](max) NULL,
	[kul_username] [nvarchar](max) NULL,
	[kul_password] [nvarchar](max) NULL,
	[kul_email] [nvarchar](max) NULL,
	[kul_create_date] [datetime] NULL CONSTRAINT [DF_tbl_kul_kul_create_date]  DEFAULT (getdate()),
	[kul_last_login] [datetime] NULL,
	[kul_is_active] [bit] NULL,
	[kul_hakkimda] [nvarchar](max) NULL,
	[kul_yetki] [nvarchar](max) NULL,
 CONSTRAINT [PK_tbl_kul] PRIMARY KEY CLUSTERED 
(
	[kul_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_log_kul]    Script Date: 28.3.2015 14:31:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_log_kul](
	[log_id] [int] IDENTITY(1,1) NOT NULL,
	[log_tarihi] [datetime] NULL CONSTRAINT [DF_tbl_log_kul_log_tarihi]  DEFAULT (getdate()),
	[log_aciklama] [nvarchar](50) NULL,
	[log_tipi] [bit] NULL,
	[log_kul_id] [int] NULL,
 CONSTRAINT [PK_tbl_log_kul] PRIMARY KEY CLUSTERED 
(
	[log_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_yorumlar]    Script Date: 28.3.2015 14:31:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_yorumlar](
	[yorum_ref_id] [int] IDENTITY(1,1) NOT NULL,
	[yorum_icerik] [nvarchar](max) NULL,
	[yorum_tarihi] [datetime] NULL CONSTRAINT [DF_tbl_yorumlar_yorum_tarihi]  DEFAULT (getdate()),
	[yorum_silinme] [bit] NULL,
	[film_ref_id] [int] NULL,
	[kul_id] [int] NULL,
 CONSTRAINT [PK_tbl_yorumlar] PRIMARY KEY CLUSTERED 
(
	[yorum_ref_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  View [dbo].[View_film_begenme]    Script Date: 28.3.2015 14:31:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_film_begenme]
AS
SELECT        dbo.tbl_filmler.film_adi, dbo.tbl_filmler.film_begenme, dbo.tbl_filmler.film_ref_id, dbo.tbl_kul.kul_id, dbo.tbl_kul.kul_adi, dbo.tbl_kul.kul_soyadi, dbo.tbl_kul.kul_username, 
                         dbo.tbl_film_begenme.film_begenme_ref_id, dbo.tbl_filmler.film_izlenme, dbo.tbl_filmler.film_resim, dbo.tbl_filmler.film_seslendirme, dbo.tbl_filmler.film_imdb_puani, dbo.tbl_filmler.film_aciklama, 
                         dbo.tbl_filmler.film_link_fragman, dbo.tbl_filmler.film_link, dbo.tbl_filmler.film_upload_tarihi, dbo.tbl_filmler.film_kunye, dbo.tbl_filmler.film_yapim, dbo.tbl_filmler.film_yonetmen, 
                         dbo.tbl_filmler.film_oyuncular
FROM            dbo.tbl_film_begenme INNER JOIN
                         dbo.tbl_filmler ON dbo.tbl_film_begenme.film_ref_id = dbo.tbl_filmler.film_ref_id INNER JOIN
                         dbo.tbl_kul ON dbo.tbl_film_begenme.kul_id = dbo.tbl_kul.kul_id

GO
/****** Object:  View [dbo].[View_film_yorum]    Script Date: 28.3.2015 14:31:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_film_yorum]
AS
SELECT        dbo.tbl_filmler.film_ref_id, dbo.tbl_filmler.film_adi, dbo.tbl_filmler.film_izlenme, dbo.tbl_filmler.film_resim, dbo.tbl_filmler.film_seslendirme, dbo.tbl_filmler.film_imdb_puani, dbo.tbl_filmler.film_aciklama, 
                         dbo.tbl_filmler.film_link_fragman, dbo.tbl_filmler.film_link, dbo.tbl_filmler.film_begenme, dbo.tbl_filmler.film_upload_tarihi, dbo.tbl_filmler.film_kunye, dbo.tbl_filmler.film_yapim, dbo.tbl_filmler.film_yonetmen, 
                         dbo.tbl_filmler.film_oyuncular, dbo.tbl_yorumlar.kul_id
FROM            dbo.tbl_filmler INNER JOIN
                         dbo.tbl_yorumlar ON dbo.tbl_filmler.film_ref_id = dbo.tbl_yorumlar.film_ref_id

GO
/****** Object:  View [dbo].[View_filmler_ve_kategoriler]    Script Date: 28.3.2015 14:31:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_filmler_ve_kategoriler]
AS
SELECT        dbo.tbl_filmler.*, dbo.tbl_kategoriler.*
FROM            dbo.tbl_filmler INNER JOIN
                         dbo.tbl_filmler_ve_kategoriler ON dbo.tbl_filmler.film_ref_id = dbo.tbl_filmler_ve_kategoriler.film_ref_id INNER JOIN
                         dbo.tbl_kategoriler ON dbo.tbl_filmler_ve_kategoriler.kategori_ref_id = dbo.tbl_kategoriler.kategori_ref_id

GO
SET IDENTITY_INSERT [dbo].[tbl_film_begenme] ON 

GO
INSERT [dbo].[tbl_film_begenme] ([film_begenme_ref_id], [kul_id], [film_ref_id]) VALUES (2, 1, 2)
GO
INSERT [dbo].[tbl_film_begenme] ([film_begenme_ref_id], [kul_id], [film_ref_id]) VALUES (4, 1, 4)
GO
INSERT [dbo].[tbl_film_begenme] ([film_begenme_ref_id], [kul_id], [film_ref_id]) VALUES (6, 2, 2)
GO
INSERT [dbo].[tbl_film_begenme] ([film_begenme_ref_id], [kul_id], [film_ref_id]) VALUES (7, 2, 5)
GO
INSERT [dbo].[tbl_film_begenme] ([film_begenme_ref_id], [kul_id], [film_ref_id]) VALUES (9, 2, 1)
GO
INSERT [dbo].[tbl_film_begenme] ([film_begenme_ref_id], [kul_id], [film_ref_id]) VALUES (10, 3, 1)
GO
INSERT [dbo].[tbl_film_begenme] ([film_begenme_ref_id], [kul_id], [film_ref_id]) VALUES (11, 4, 1)
GO
INSERT [dbo].[tbl_film_begenme] ([film_begenme_ref_id], [kul_id], [film_ref_id]) VALUES (12, 5, 1)
GO
INSERT [dbo].[tbl_film_begenme] ([film_begenme_ref_id], [kul_id], [film_ref_id]) VALUES (25, 1, 1)
GO
INSERT [dbo].[tbl_film_begenme] ([film_begenme_ref_id], [kul_id], [film_ref_id]) VALUES (32, 1, 3)
GO
SET IDENTITY_INSERT [dbo].[tbl_film_begenme] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_filmler] ON 

GO
INSERT [dbo].[tbl_filmler] ([film_ref_id], [film_adi], [film_izlenme], [film_resim], [film_seslendirme], [film_imdb_puani], [film_aciklama], [film_link_fragman], [film_link], [film_begenme], [film_upload_tarihi], [film_kunye], [film_yapim], [film_yonetmen], [film_oyuncular]) VALUES (1, N'A Good Man', 27127, N'../film_images/a_good_man01.jpg', N'../images/tr_dublaj.png', N'4.6', N'720p Türkçe Dublaj HD', N'https://www.youtube.com/embed/pYcobufHJAA', N'http://videoapi.my.mail.ru/videos/embed/mail/btektek/myvideo/55.html', 0, CAST(N'2015-01-08 21:00:02.000' AS DateTime), N'<a>İyi Bir Adam</a> 2014 yapımı aksiyon filmi.Geçmişi başarılarla dolu olan ve girdiği her operasyondan başarılı bir şekilde çıkan Alexander işini son derece iyi yapmaktadır. Alexander yine özel bir operasyona çağrılır ama bu operasyon diğerlerinden ayrıdır. Çünkü bu operasyonda hiçbirşey başarılı gitmeyecek başarısız olacaktır. Bu operasyon sonrasında bütün kariyeri biter ve artık sakin bir hayat yaşamak ister. Ancak bu imkansızdır geçmişinin getirdiği sıkıntılar peşini bırakmaz. Rus ve Çin’li çetelerin girdiği savaşlarda ailesini korumak zorundadır. Sitemizden 720p seçeneğiyle İyi Bir Adam hd izleyebilirsiniz. Sitemizdeki tüm<a> İyi Bir Adam</a> izleyicilerine iyi seyirler dileriz.', N'2014 - ABD', N'Keoni Waxman', N'Steven Seagal , Tzi Mia , Julia Verdes , Radu Banzaru , Claudiu Bleont')
GO
INSERT [dbo].[tbl_filmler] ([film_ref_id], [film_adi], [film_izlenme], [film_resim], [film_seslendirme], [film_imdb_puani], [film_aciklama], [film_link_fragman], [film_link], [film_begenme], [film_upload_tarihi], [film_kunye], [film_yapim], [film_yonetmen], [film_oyuncular]) VALUES (2, N'Attack On Titan', 614229, N'../film_images/attack_on_titan01.jpg', N'../images/tr_altyazi.png', N'9.0', N'1080p Türkçe Altyazılı HD', N'https://www.youtube.com/embed/MGRm4IzK1SQ', N'http://videoapi.my.mail.ru/videos/embed/mail/bicapss/11/497.html', 0, CAST(N'2014-09-20 00:00:00.000' AS DateTime), N'<a>Attack on Titan</a> 2013 yapımı animasyon aksiyon dizisi. Birkaç asır öncesinde, insanlar devler tarafından hemen hemen tamamiyle yok edilmiştir. Devler kocamandır, zekaya sahip değildirler, insanları yerler ve bunu zevk için yaparlar. Küçük bir grup insan, en büyük devlerden bile uzun olan yüksek duvarlarla etrafı çevrili olan bir şehire kendilerini kapatarak kurtulmuşlardır. Günümüze gelindiğinde kentte 100 senedir hiç dev gözükmemiştir. Genç delikanlı Eren ve üvey kız kardeşi Mikasa, çok büyük bir dev tarafından içinde bulundukları sur duvarlarının yıkılışına şahit olurlar. Küçük devler sur içine akın etmeye başlar ve iki çocuk da annelerinin canlı canlı dev tarafından yiyilişini korku içinde seyrederler. Eren her bir devi öldürüp tüm insanlığın intikamını alacağına yemin eder. Sitemizden 1080p ve 720p seçenekleriyle</a> Attack on Titan</a> hd izleyebilirsiniz. Sitemizdeki tüm Attack on Titan</a> izleyicilerine iyi seyirler dileriz.', N'2013', N'Tetsuro Araki', N'Seslendirenler : Keiji Fujiwara , Tomohisa Hashizume , Marina Inoue , Yui ıshikawa')
GO
INSERT [dbo].[tbl_filmler] ([film_ref_id], [film_adi], [film_izlenme], [film_resim], [film_seslendirme], [film_imdb_puani], [film_aciklama], [film_link_fragman], [film_link], [film_begenme], [film_upload_tarihi], [film_kunye], [film_yapim], [film_yonetmen], [film_oyuncular]) VALUES (3, N'BTooom!', 65151, N'../film_images/btooom01.jpg', N'../images/tr_altyazi.png', N'7.4', N'1080P TÜRKÇE ALTYAZILI HD', N'https://www.youtube.com/embed/H92d6YZkVO8', N'http://videoapi.my.mail.ru/videos/embed/mail/anisekai2/582/584.html', 0, CAST(N'2014-09-21 00:00:00.000' AS DateTime), N'Sakamoto Ryouta, annesiyle hayatını sürdüren 22 yaşındaki bir işsizdir. Real de onu öne çıkartan hiçbir özellik yoktur lakin İnternet üzerinde, Btooom!! adlı oyunun en iyi oyuncuları arasındadır.Günün birinde, tropik bir adayı andıran bir yerde uyanır. Oraya nasıl ve niçin geldiğiyle ilgili hiçbir şey hatırlamamaktadır. Ryouta etrafta dolaşırken birine rastlar ve ondan neler olup bittiğini öğrenmek ister. Yabancının cevabı ise Ryouta''ya oyundaki gibi bomba atmak olur. Ryouta hem hayatının tehlikede olduğunu hem de en sevdiği oyunda bir şekilde mahsur kaldığını anlar.Ryouta bu adaya nasıl ve niçin geldiğini çözebilecek midir?Tüm <a>online oyun</a> oynamış oyuncuların dikkatini çekebilecek bir anime sizleri bekliyor.Sitemizdeki Tüm <a>Btooom!</a> izleyicilerine iyi seyirler dileriz.', N'2012 - JAPONYA', N'Kotono Watanabe', N'Kanata Hongô , Yûichi Nakamura , Suzuko Mimori , Miyuki Sawashiro , Tôru Ôkawa')
GO
INSERT [dbo].[tbl_filmler] ([film_ref_id], [film_adi], [film_izlenme], [film_resim], [film_seslendirme], [film_imdb_puani], [film_aciklama], [film_link_fragman], [film_link], [film_begenme], [film_upload_tarihi], [film_kunye], [film_yapim], [film_yonetmen], [film_oyuncular]) VALUES (4, N'Camp X Ray', 100917, N'../film_images/camp_x-ray01.jpg', N'../images/tr_altyazi.png', N'7.4', N'720p Türkçe Altyazılı ', N'https://www.youtube.com/embed/EyNa3HB27EI', N'http://videoapi.my.mail.ru/videos/embed/mail/fatihinfedayisi/_myvideo/1334.html', 0, CAST(N'2015-10-15 00:00:00.000' AS DateTime), N'<a>Camp X Ray</a> baş rollerini Kristen Stewart ve (adını İran sinema filmi Jodaeiye Nader az Simin adı yapımdan duyduğumuz) Peyman Moaadi paylaşmaktadır .Filmin konusuysa ;Hayatının istediği şekilde gitmediğini fark eden Amy (Kristen Stewart) hayatını değiştirmek ve ülkesine hizmet etmek amacıyla orduya katılır, ancak umduğu gibi Irak''a değil, Guantanamo adı verilen 11 Eylül saldırılarından sonra tutuklanan Müslümanların tutulduğu bir Ceza evine gönderilir. Burada ki mahkumlardan Ali Amir ile (Peyman Moaadi) aralarında tuhaf bir dostluk başlar.Başta tutuklulara terörist gözüyle bakan Amy ''in zamanla düşüncesi değişecek midir?Sitemizdeki Tüm <a>Camp X Ray</a> İzleyicilerine iyi seyirler dileriz.Biz daha iyisini paylaşana kadar en iyisi bu.', N'2014 - ABD', N'Peter Sattler', N'Kristen Stewart ,Tara Holt , Lane Garrison , Peyman Moaadi , Marco Khan')
GO
INSERT [dbo].[tbl_filmler] ([film_ref_id], [film_adi], [film_izlenme], [film_resim], [film_seslendirme], [film_imdb_puani], [film_aciklama], [film_link_fragman], [film_link], [film_begenme], [film_upload_tarihi], [film_kunye], [film_yapim], [film_yonetmen], [film_oyuncular]) VALUES (5, N'Coherence', 50886, N'../film_images/coherence01.jpg', N'../images/tr_altyazi.png', N'7.2', N'1080P Tr Altyazılı HD', N'https://www.youtube.com/embed/sEceDz1Rodc', N'http://videoapi.my.mail.ru/videos/embed/mail/film-izle/_myvideo/783.html', 0, CAST(N'2014-09-23 00:00:00.000' AS DateTime), N'<a>Paralel Evren</a> 2013 yapımı bilim kurgu filmi. Bir kuyrukluyıldızın dünyanın yakınından geçtiği o gece, yakın dostlar keyifli bir akşam yemeği için toplanmış. Ancak, gerçekliğin ve ilişkilerin yavaş yavaş kırılmaya başlayacağını az sonra anlayacaklar. Mahallede elektrik kesilince, yemekleri yarım kalıyor. Sadece az ilerideki tuhaf evde elektrik var. Ardı ardına gizemli olaylara tanık olan bu konuklar aslında hiçbir gücün çözemeyeceği bir muammanın içine düştüklerinin er geç farkına varacak. Sitemizden 1080p ve 720p seçenekleriyle <a>Paralel Evren hd izle</a>yebilirsiniz. Sitemizdeki tüm <a>Paralel Evren</a> izleyicilerine iyi seyirler dileriz.', N'2013 - ABD', N'James Ward Byrkit', N'Emily Foxler , Nicholas Brendon , Elizabeth Gracen')
GO
INSERT [dbo].[tbl_filmler] ([film_ref_id], [film_adi], [film_izlenme], [film_resim], [film_seslendirme], [film_imdb_puani], [film_aciklama], [film_link_fragman], [film_link], [film_begenme], [film_upload_tarihi], [film_kunye], [film_yapim], [film_yonetmen], [film_oyuncular]) VALUES (6, N'Fury', 415368, N'../film_images/fury01.jpg', N'../images/tr_altyazi.png', N'8.0', N'720p Türkçe Altyazılı HD', N'https://www.youtube.com/embed/-OGvZoIrXpg', N'http://videoapi.my.mail.ru/videos/embed/mail/yarensahinci/_myvideo/452.html', 0, CAST(N'2015-01-09 00:00:00.000' AS DateTime), N'<a>Fury</a>, 1945 yılının Nisan ayında, İkinci Dünya Savaşı''nın son günlerinde geçiyor ve Komutan Wardaddy, topçu Boyd Swan, yükleyici Grady Travis, şoför Trini Garcia ve yardımcı şoför Norman''dan oluşan müfrezenin, 300 düşman askeriyle karşılaştığı ve tüm imkansızlıklarla savaşmak zorunda kaldığı 24 saati konu alıyor. Beş askerden oluşan küçük ekip, zırhlı tanklarıyla, Almanya''da savaşın ortasında kalır ve bu ekip bölgede kalan son Amerikan ordusu askerlerinden oluşur. Birlik az sayıda askerden oluşmasının yanı sıra cephane anlamında da bir hayli zor durumdadır. Gruba komuta eden Çavuş Wardaddy''nin Avrupa''nın tamamını yıkıma uğratan bu savaştaki son görevi, askerlerini Nazi birliklerinin kuşatması altında olan bu bölgeden sağ salim çıkarabilmektir. 20. yüzyılın en kanlı senelerinden biri olan 1945 yılında geçen ve müfrezenin geçirdiği bir günü ele alan savaş dramının yönetmeni ve senaristi David Ayer. Filmin başrollerini ise Brad Pitt, Shia LaBeouf ve Logan Lerman paylaşıyor. Sitemizden 720p seçeneğiyle <a>Fury hd izle</a>yebilirsiniz. Sitemizdeki tüm <a>Fury</a> izleyicilerine iyi seyirler dileriz.', N'2014 - ABD', N'David Ayer', N'Brad Pitt , Shia LaBeouf , Logan Lerman , Xavier Samuel , Jason Isaacs')
GO
INSERT [dbo].[tbl_filmler] ([film_ref_id], [film_adi], [film_izlenme], [film_resim], [film_seslendirme], [film_imdb_puani], [film_aciklama], [film_link_fragman], [film_link], [film_begenme], [film_upload_tarihi], [film_kunye], [film_yapim], [film_yonetmen], [film_oyuncular]) VALUES (7, N'HOBBİT', 10285, N'../film_images/hobbit01.jpg', N'../images/tr_altyazi.png', N'7.7', N'1080P TÜRKÇE DUBLAJ HD', N'https://www.youtube.com/embed/JTSoD4BBCJc', N'http://videoapi.my.mail.ru/videos/embed/mail/marc-antonyo/_myvideo/105.html', 2, CAST(N'2015-03-22 00:00:00.000' AS DateTime), N'<a>Hobbit: Beş Ordunun Savaşı</a> 2014 yapımı fantastik macera filmi. The Hobbit üçlemesinin son bölümü olan üçüncü filmde, Bilbo Baggins, Thorin Meşekalkan ve Cüceler Bölüğü’nün maceraları bitiyor. Ejderha Smaug ile yüz yüze geldikten ve günahkar Hobbit Gollum''dan meşhur güç yüzüğünü ele geçirdikten sonra sağ salim eve gidinceye kadar Bilbo''yu halen daha onlarca yeni macera bekliyor. Evlerine yeniden kavuşan Erebor Cüceleri, Ejderha Smaug''u Göl Kasabası''nın temiz yerlileri üzerine saldıkları gerçeğiyle yüzleşmek durmundadır. Thorin Meşekalkan ise Arkentaşı''nı ararken önemli değerlerden ödün vermiştir. Thorin''e yardımcı olamayan Bilbo tehlikeli bir seçim yapmanın eşiğine gelir. Bu sırada Lord Sauron planladığı gizli Yalnız Dağ saldırısı için dört Ork bölüğü göndermiştir. Şimdi Cüce, Elf ve İnsanların önünde iki seçenek vardır: Ya birleşip birlikte savaşacaklar ya da hep beraber yok olacaklardır. Beş ordu toplanıp savaşa girmeye hazırlanırken Bilbo hem kendi hayatı hem de arkadaşları nı kurtarmak için savaşmak durumunda kalacaktır. Sitemizen 1080p ve 720p seçenekleriyle <a>Hobbit: Beş Ordunun Savaşı hd</a> izleyebilirsiniz. Sitemizdeki tüm <a>Hobbit: Beş Ordunun Savaşı izle</a>yicilerine iyi seyirler dileriz.', N'2014 - ABD , YeniZelanda', N'Peter Jackson', N'Martin Freeman , Ian McKellen , Benedict Cumberbatch , Luke Evans , Evangeline Lilly')
GO
INSERT [dbo].[tbl_filmler] ([film_ref_id], [film_adi], [film_izlenme], [film_resim], [film_seslendirme], [film_imdb_puani], [film_aciklama], [film_link_fragman], [film_link], [film_begenme], [film_upload_tarihi], [film_kunye], [film_yapim], [film_yonetmen], [film_oyuncular]) VALUES (8, N'Shaolin Soccer', 1044, N'../film_images/Sholin_Soccer01.jpg', N'../images/tr_dublaj.png', N'7.3', N'720p Türkçe Dublaj HD', N'https://www.youtube.com/embed/Q_iuSiotQeM', N'http://vk.com/video_ext.php?oid=220654095&id=167005929&hash=c27fcaf99e6b212b&hd=1', 3, CAST(N'2015-03-22 00:00:00.000' AS DateTime), N'Gençliğinde bir oyuncu tarafından sonra sakatlanan ve futbol kariyeri biten 50’lili yaşlarda birinin kung fu ustalarından tekrar bir futbol takımı kurarak liglere dönmesini konu alan ve ülkemizde de bir hayli ilgi gösterilen <a>Shaolin Futbolu</a> Türkçe Dublaj HD olarak sizlerle. Keyifli Seyirler Dileriz.', N'2001 - Hongkong', N'Stephen Chow', N'Stephen Chow , Wei Zhao , Yut Fei Wong')
GO
INSERT [dbo].[tbl_filmler] ([film_ref_id], [film_adi], [film_izlenme], [film_resim], [film_seslendirme], [film_imdb_puani], [film_aciklama], [film_link_fragman], [film_link], [film_begenme], [film_upload_tarihi], [film_kunye], [film_yapim], [film_yonetmen], [film_oyuncular]) VALUES (29, N'Hababam Sınıfı', 7022, N'../film_images/950Hababam_Sinifi_1975.jpg', N'', N'9.9', N'1080 Türkçe Dublaj HD', N'https://www.youtube.com/embed/o_fBa8ISiyk', N'https://www.youtube.com/embed/Ol6PpTefplY', 2, CAST(N'2015-03-23 00:00:00.000' AS DateTime), N'<a>Hababam Sınıfı 1975</a> Kemal Sunal, Adile Naşit, Halit Akçatepe, Tarık Akan, Münir Özkul Restorasyonlu HD 720p Sansürsüz', N'1975-TÜRKİYE', N'ERTEM EĞİLMEZ', N' Kemal Sunal , Adile Naşit , Halit Akçatepe , Tarık Akan , Münir Özkul')
GO
SET IDENTITY_INSERT [dbo].[tbl_filmler] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_filmler_ve_kategoriler] ON 

GO
INSERT [dbo].[tbl_filmler_ve_kategoriler] ([film_kategori_ref_id], [film_ref_id], [kategori_ref_id]) VALUES (2, 1, 12)
GO
INSERT [dbo].[tbl_filmler_ve_kategoriler] ([film_kategori_ref_id], [film_ref_id], [kategori_ref_id]) VALUES (3, 1, 47)
GO
INSERT [dbo].[tbl_filmler_ve_kategoriler] ([film_kategori_ref_id], [film_ref_id], [kategori_ref_id]) VALUES (4, 1, 48)
GO
INSERT [dbo].[tbl_filmler_ve_kategoriler] ([film_kategori_ref_id], [film_ref_id], [kategori_ref_id]) VALUES (5, 2, 2)
GO
INSERT [dbo].[tbl_filmler_ve_kategoriler] ([film_kategori_ref_id], [film_ref_id], [kategori_ref_id]) VALUES (6, 2, 6)
GO
INSERT [dbo].[tbl_filmler_ve_kategoriler] ([film_kategori_ref_id], [film_ref_id], [kategori_ref_id]) VALUES (7, 2, 12)
GO
INSERT [dbo].[tbl_filmler_ve_kategoriler] ([film_kategori_ref_id], [film_ref_id], [kategori_ref_id]) VALUES (8, 2, 13)
GO
INSERT [dbo].[tbl_filmler_ve_kategoriler] ([film_kategori_ref_id], [film_ref_id], [kategori_ref_id]) VALUES (9, 2, 14)
GO
INSERT [dbo].[tbl_filmler_ve_kategoriler] ([film_kategori_ref_id], [film_ref_id], [kategori_ref_id]) VALUES (10, 2, 15)
GO
INSERT [dbo].[tbl_filmler_ve_kategoriler] ([film_kategori_ref_id], [film_ref_id], [kategori_ref_id]) VALUES (11, 2, 17)
GO
INSERT [dbo].[tbl_filmler_ve_kategoriler] ([film_kategori_ref_id], [film_ref_id], [kategori_ref_id]) VALUES (12, 2, 23)
GO
INSERT [dbo].[tbl_filmler_ve_kategoriler] ([film_kategori_ref_id], [film_ref_id], [kategori_ref_id]) VALUES (13, 2, 24)
GO
INSERT [dbo].[tbl_filmler_ve_kategoriler] ([film_kategori_ref_id], [film_ref_id], [kategori_ref_id]) VALUES (14, 2, 25)
GO
INSERT [dbo].[tbl_filmler_ve_kategoriler] ([film_kategori_ref_id], [film_ref_id], [kategori_ref_id]) VALUES (15, 2, 27)
GO
INSERT [dbo].[tbl_filmler_ve_kategoriler] ([film_kategori_ref_id], [film_ref_id], [kategori_ref_id]) VALUES (16, 2, 30)
GO
INSERT [dbo].[tbl_filmler_ve_kategoriler] ([film_kategori_ref_id], [film_ref_id], [kategori_ref_id]) VALUES (17, 2, 29)
GO
INSERT [dbo].[tbl_filmler_ve_kategoriler] ([film_kategori_ref_id], [film_ref_id], [kategori_ref_id]) VALUES (18, 2, 51)
GO
INSERT [dbo].[tbl_filmler_ve_kategoriler] ([film_kategori_ref_id], [film_ref_id], [kategori_ref_id]) VALUES (19, 2, 74)
GO
INSERT [dbo].[tbl_filmler_ve_kategoriler] ([film_kategori_ref_id], [film_ref_id], [kategori_ref_id]) VALUES (20, 3, 5)
GO
INSERT [dbo].[tbl_filmler_ve_kategoriler] ([film_kategori_ref_id], [film_ref_id], [kategori_ref_id]) VALUES (21, 3, 12)
GO
INSERT [dbo].[tbl_filmler_ve_kategoriler] ([film_kategori_ref_id], [film_ref_id], [kategori_ref_id]) VALUES (22, 3, 13)
GO
INSERT [dbo].[tbl_filmler_ve_kategoriler] ([film_kategori_ref_id], [film_ref_id], [kategori_ref_id]) VALUES (23, 3, 14)
GO
INSERT [dbo].[tbl_filmler_ve_kategoriler] ([film_kategori_ref_id], [film_ref_id], [kategori_ref_id]) VALUES (24, 3, 15)
GO
INSERT [dbo].[tbl_filmler_ve_kategoriler] ([film_kategori_ref_id], [film_ref_id], [kategori_ref_id]) VALUES (25, 3, 17)
GO
INSERT [dbo].[tbl_filmler_ve_kategoriler] ([film_kategori_ref_id], [film_ref_id], [kategori_ref_id]) VALUES (26, 3, 24)
GO
INSERT [dbo].[tbl_filmler_ve_kategoriler] ([film_kategori_ref_id], [film_ref_id], [kategori_ref_id]) VALUES (27, 3, 26)
GO
INSERT [dbo].[tbl_filmler_ve_kategoriler] ([film_kategori_ref_id], [film_ref_id], [kategori_ref_id]) VALUES (28, 3, 30)
GO
INSERT [dbo].[tbl_filmler_ve_kategoriler] ([film_kategori_ref_id], [film_ref_id], [kategori_ref_id]) VALUES (29, 3, 35)
GO
INSERT [dbo].[tbl_filmler_ve_kategoriler] ([film_kategori_ref_id], [film_ref_id], [kategori_ref_id]) VALUES (30, 3, 41)
GO
INSERT [dbo].[tbl_filmler_ve_kategoriler] ([film_kategori_ref_id], [film_ref_id], [kategori_ref_id]) VALUES (31, 3, 48)
GO
INSERT [dbo].[tbl_filmler_ve_kategoriler] ([film_kategori_ref_id], [film_ref_id], [kategori_ref_id]) VALUES (32, 3, 51)
GO
INSERT [dbo].[tbl_filmler_ve_kategoriler] ([film_kategori_ref_id], [film_ref_id], [kategori_ref_id]) VALUES (33, 4, 7)
GO
INSERT [dbo].[tbl_filmler_ve_kategoriler] ([film_kategori_ref_id], [film_ref_id], [kategori_ref_id]) VALUES (34, 4, 13)
GO
INSERT [dbo].[tbl_filmler_ve_kategoriler] ([film_kategori_ref_id], [film_ref_id], [kategori_ref_id]) VALUES (35, 4, 23)
GO
INSERT [dbo].[tbl_filmler_ve_kategoriler] ([film_kategori_ref_id], [film_ref_id], [kategori_ref_id]) VALUES (36, 4, 24)
GO
INSERT [dbo].[tbl_filmler_ve_kategoriler] ([film_kategori_ref_id], [film_ref_id], [kategori_ref_id]) VALUES (37, 4, 48)
GO
INSERT [dbo].[tbl_filmler_ve_kategoriler] ([film_kategori_ref_id], [film_ref_id], [kategori_ref_id]) VALUES (38, 5, 2)
GO
INSERT [dbo].[tbl_filmler_ve_kategoriler] ([film_kategori_ref_id], [film_ref_id], [kategori_ref_id]) VALUES (39, 5, 6)
GO
INSERT [dbo].[tbl_filmler_ve_kategoriler] ([film_kategori_ref_id], [film_ref_id], [kategori_ref_id]) VALUES (40, 5, 13)
GO
INSERT [dbo].[tbl_filmler_ve_kategoriler] ([film_kategori_ref_id], [film_ref_id], [kategori_ref_id]) VALUES (41, 5, 17)
GO
INSERT [dbo].[tbl_filmler_ve_kategoriler] ([film_kategori_ref_id], [film_ref_id], [kategori_ref_id]) VALUES (42, 5, 30)
GO
INSERT [dbo].[tbl_filmler_ve_kategoriler] ([film_kategori_ref_id], [film_ref_id], [kategori_ref_id]) VALUES (43, 5, 48)
GO
INSERT [dbo].[tbl_filmler_ve_kategoriler] ([film_kategori_ref_id], [film_ref_id], [kategori_ref_id]) VALUES (44, 6, 7)
GO
INSERT [dbo].[tbl_filmler_ve_kategoriler] ([film_kategori_ref_id], [film_ref_id], [kategori_ref_id]) VALUES (45, 6, 12)
GO
INSERT [dbo].[tbl_filmler_ve_kategoriler] ([film_kategori_ref_id], [film_ref_id], [kategori_ref_id]) VALUES (46, 6, 13)
GO
INSERT [dbo].[tbl_filmler_ve_kategoriler] ([film_kategori_ref_id], [film_ref_id], [kategori_ref_id]) VALUES (47, 6, 23)
GO
INSERT [dbo].[tbl_filmler_ve_kategoriler] ([film_kategori_ref_id], [film_ref_id], [kategori_ref_id]) VALUES (48, 6, 30)
GO
INSERT [dbo].[tbl_filmler_ve_kategoriler] ([film_kategori_ref_id], [film_ref_id], [kategori_ref_id]) VALUES (49, 6, 41)
GO
INSERT [dbo].[tbl_filmler_ve_kategoriler] ([film_kategori_ref_id], [film_ref_id], [kategori_ref_id]) VALUES (50, 6, 74)
GO
INSERT [dbo].[tbl_filmler_ve_kategoriler] ([film_kategori_ref_id], [film_ref_id], [kategori_ref_id]) VALUES (51, 6, 48)
GO
INSERT [dbo].[tbl_filmler_ve_kategoriler] ([film_kategori_ref_id], [film_ref_id], [kategori_ref_id]) VALUES (52, 7, 2)
GO
INSERT [dbo].[tbl_filmler_ve_kategoriler] ([film_kategori_ref_id], [film_ref_id], [kategori_ref_id]) VALUES (53, 7, 7)
GO
INSERT [dbo].[tbl_filmler_ve_kategoriler] ([film_kategori_ref_id], [film_ref_id], [kategori_ref_id]) VALUES (54, 7, 13)
GO
INSERT [dbo].[tbl_filmler_ve_kategoriler] ([film_kategori_ref_id], [film_ref_id], [kategori_ref_id]) VALUES (55, 7, 25)
GO
INSERT [dbo].[tbl_filmler_ve_kategoriler] ([film_kategori_ref_id], [film_ref_id], [kategori_ref_id]) VALUES (56, 7, 30)
GO
INSERT [dbo].[tbl_filmler_ve_kategoriler] ([film_kategori_ref_id], [film_ref_id], [kategori_ref_id]) VALUES (57, 7, 35)
GO
INSERT [dbo].[tbl_filmler_ve_kategoriler] ([film_kategori_ref_id], [film_ref_id], [kategori_ref_id]) VALUES (58, 7, 48)
GO
INSERT [dbo].[tbl_filmler_ve_kategoriler] ([film_kategori_ref_id], [film_ref_id], [kategori_ref_id]) VALUES (59, 7, 74)
GO
INSERT [dbo].[tbl_filmler_ve_kategoriler] ([film_kategori_ref_id], [film_ref_id], [kategori_ref_id]) VALUES (60, 31, 5)
GO
INSERT [dbo].[tbl_filmler_ve_kategoriler] ([film_kategori_ref_id], [film_ref_id], [kategori_ref_id]) VALUES (61, 31, 18)
GO
INSERT [dbo].[tbl_filmler_ve_kategoriler] ([film_kategori_ref_id], [film_ref_id], [kategori_ref_id]) VALUES (62, 31, 23)
GO
INSERT [dbo].[tbl_filmler_ve_kategoriler] ([film_kategori_ref_id], [film_ref_id], [kategori_ref_id]) VALUES (63, 31, 64)
GO
INSERT [dbo].[tbl_filmler_ve_kategoriler] ([film_kategori_ref_id], [film_ref_id], [kategori_ref_id]) VALUES (64, 31, 30)
GO
INSERT [dbo].[tbl_filmler_ve_kategoriler] ([film_kategori_ref_id], [film_ref_id], [kategori_ref_id]) VALUES (65, 31, 41)
GO
INSERT [dbo].[tbl_filmler_ve_kategoriler] ([film_kategori_ref_id], [film_ref_id], [kategori_ref_id]) VALUES (66, 31, 48)
GO
INSERT [dbo].[tbl_filmler_ve_kategoriler] ([film_kategori_ref_id], [film_ref_id], [kategori_ref_id]) VALUES (67, 31, 51)
GO
INSERT [dbo].[tbl_filmler_ve_kategoriler] ([film_kategori_ref_id], [film_ref_id], [kategori_ref_id]) VALUES (68, 31, 74)
GO
INSERT [dbo].[tbl_filmler_ve_kategoriler] ([film_kategori_ref_id], [film_ref_id], [kategori_ref_id]) VALUES (69, 31, 47)
GO
INSERT [dbo].[tbl_filmler_ve_kategoriler] ([film_kategori_ref_id], [film_ref_id], [kategori_ref_id]) VALUES (70, 8, 47)
GO
INSERT [dbo].[tbl_filmler_ve_kategoriler] ([film_kategori_ref_id], [film_ref_id], [kategori_ref_id]) VALUES (71, 3, 2)
GO
INSERT [dbo].[tbl_filmler_ve_kategoriler] ([film_kategori_ref_id], [film_ref_id], [kategori_ref_id]) VALUES (72, 29, 2)
GO
INSERT [dbo].[tbl_filmler_ve_kategoriler] ([film_kategori_ref_id], [film_ref_id], [kategori_ref_id]) VALUES (97, 1, 7)
GO
INSERT [dbo].[tbl_filmler_ve_kategoriler] ([film_kategori_ref_id], [film_ref_id], [kategori_ref_id]) VALUES (98, 38, 4)
GO
INSERT [dbo].[tbl_filmler_ve_kategoriler] ([film_kategori_ref_id], [film_ref_id], [kategori_ref_id]) VALUES (99, 38, 13)
GO
INSERT [dbo].[tbl_filmler_ve_kategoriler] ([film_kategori_ref_id], [film_ref_id], [kategori_ref_id]) VALUES (100, 39, 4)
GO
INSERT [dbo].[tbl_filmler_ve_kategoriler] ([film_kategori_ref_id], [film_ref_id], [kategori_ref_id]) VALUES (102, 39, 13)
GO
INSERT [dbo].[tbl_filmler_ve_kategoriler] ([film_kategori_ref_id], [film_ref_id], [kategori_ref_id]) VALUES (103, 40, 13)
GO
INSERT [dbo].[tbl_filmler_ve_kategoriler] ([film_kategori_ref_id], [film_ref_id], [kategori_ref_id]) VALUES (104, 40, 14)
GO
SET IDENTITY_INSERT [dbo].[tbl_filmler_ve_kategoriler] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_kategoriler] ON 

GO
INSERT [dbo].[tbl_kategoriler] ([kategori_ref_id], [kategori_adi]) VALUES (1, N'Filmler')
GO
INSERT [dbo].[tbl_kategoriler] ([kategori_ref_id], [kategori_adi]) VALUES (2, N'1080p Filmler')
GO
INSERT [dbo].[tbl_kategoriler] ([kategori_ref_id], [kategori_adi]) VALUES (3, N'2010 Filmleri')
GO
INSERT [dbo].[tbl_kategoriler] ([kategori_ref_id], [kategori_adi]) VALUES (4, N'2011 Filmleri')
GO
INSERT [dbo].[tbl_kategoriler] ([kategori_ref_id], [kategori_adi]) VALUES (5, N'2012 Filmleri')
GO
INSERT [dbo].[tbl_kategoriler] ([kategori_ref_id], [kategori_adi]) VALUES (6, N'2013 Filmleri')
GO
INSERT [dbo].[tbl_kategoriler] ([kategori_ref_id], [kategori_adi]) VALUES (7, N'2014 Filmleri')
GO
INSERT [dbo].[tbl_kategoriler] ([kategori_ref_id], [kategori_adi]) VALUES (8, N'2015 Filmleri')
GO
INSERT [dbo].[tbl_kategoriler] ([kategori_ref_id], [kategori_adi]) VALUES (9, N'3D Filmler')
GO
INSERT [dbo].[tbl_kategoriler] ([kategori_ref_id], [kategori_adi]) VALUES (10, N'Aamir Khan Filmleri')
GO
INSERT [dbo].[tbl_kategoriler] ([kategori_ref_id], [kategori_adi]) VALUES (11, N'Aile Filmleri')
GO
INSERT [dbo].[tbl_kategoriler] ([kategori_ref_id], [kategori_adi]) VALUES (12, N'Aksiyon Filmleri')
GO
INSERT [dbo].[tbl_kategoriler] ([kategori_ref_id], [kategori_adi]) VALUES (13, N'Altyazılı Filmler')
GO
INSERT [dbo].[tbl_kategoriler] ([kategori_ref_id], [kategori_adi]) VALUES (14, N'Animasyon Filmleri')
GO
INSERT [dbo].[tbl_kategoriler] ([kategori_ref_id], [kategori_adi]) VALUES (15, N'Anime')
GO
INSERT [dbo].[tbl_kategoriler] ([kategori_ref_id], [kategori_adi]) VALUES (16, N'Belgeseller')
GO
INSERT [dbo].[tbl_kategoriler] ([kategori_ref_id], [kategori_adi]) VALUES (17, N'Bilim Kurgu Filmleri')
GO
INSERT [dbo].[tbl_kategoriler] ([kategori_ref_id], [kategori_adi]) VALUES (18, N'Biyografi')
GO
INSERT [dbo].[tbl_kategoriler] ([kategori_ref_id], [kategori_adi]) VALUES (19, N'Casusluk')
GO
INSERT [dbo].[tbl_kategoriler] ([kategori_ref_id], [kategori_adi]) VALUES (20, N'Çizgi Filmler')
GO
INSERT [dbo].[tbl_kategoriler] ([kategori_ref_id], [kategori_adi]) VALUES (21, N'Çocuk Filmleri')
GO
INSERT [dbo].[tbl_kategoriler] ([kategori_ref_id], [kategori_adi]) VALUES (22, N'Dans')
GO
INSERT [dbo].[tbl_kategoriler] ([kategori_ref_id], [kategori_adi]) VALUES (23, N'Dram Filmleri')
GO
INSERT [dbo].[tbl_kategoriler] ([kategori_ref_id], [kategori_adi]) VALUES (24, N'Editör Önerisi')
GO
INSERT [dbo].[tbl_kategoriler] ([kategori_ref_id], [kategori_adi]) VALUES (25, N'Fantastik')
GO
INSERT [dbo].[tbl_kategoriler] ([kategori_ref_id], [kategori_adi]) VALUES (26, N'Gençlik Filmleri')
GO
INSERT [dbo].[tbl_kategoriler] ([kategori_ref_id], [kategori_adi]) VALUES (27, N'Gerilim Filmleri')
GO
INSERT [dbo].[tbl_kategoriler] ([kategori_ref_id], [kategori_adi]) VALUES (28, N'Gizem')
GO
INSERT [dbo].[tbl_kategoriler] ([kategori_ref_id], [kategori_adi]) VALUES (29, N'Hint Filmleri')
GO
INSERT [dbo].[tbl_kategoriler] ([kategori_ref_id], [kategori_adi]) VALUES (30, N'İMDB 7.0+')
GO
INSERT [dbo].[tbl_kategoriler] ([kategori_ref_id], [kategori_adi]) VALUES (31, N'Kısa Film')
GO
INSERT [dbo].[tbl_kategoriler] ([kategori_ref_id], [kategori_adi]) VALUES (32, N'Komedi')
GO
INSERT [dbo].[tbl_kategoriler] ([kategori_ref_id], [kategori_adi]) VALUES (33, N'Kore Filmleri')
GO
INSERT [dbo].[tbl_kategoriler] ([kategori_ref_id], [kategori_adi]) VALUES (34, N'Korku Filmleri')
GO
INSERT [dbo].[tbl_kategoriler] ([kategori_ref_id], [kategori_adi]) VALUES (35, N'Macera Filmleri')
GO
INSERT [dbo].[tbl_kategoriler] ([kategori_ref_id], [kategori_adi]) VALUES (36, N'Müzikal')
GO
INSERT [dbo].[tbl_kategoriler] ([kategori_ref_id], [kategori_adi]) VALUES (37, N'Polisiye Filmler')
GO
INSERT [dbo].[tbl_kategoriler] ([kategori_ref_id], [kategori_adi]) VALUES (38, N'Politik')
GO
INSERT [dbo].[tbl_kategoriler] ([kategori_ref_id], [kategori_adi]) VALUES (39, N'Psikolojik')
GO
INSERT [dbo].[tbl_kategoriler] ([kategori_ref_id], [kategori_adi]) VALUES (40, N'Romantik Filmler')
GO
INSERT [dbo].[tbl_kategoriler] ([kategori_ref_id], [kategori_adi]) VALUES (41, N'Savaş Filmleri')
GO
INSERT [dbo].[tbl_kategoriler] ([kategori_ref_id], [kategori_adi]) VALUES (42, N'Spor Filmleri')
GO
INSERT [dbo].[tbl_kategoriler] ([kategori_ref_id], [kategori_adi]) VALUES (43, N'Suç Filmleri')
GO
INSERT [dbo].[tbl_kategoriler] ([kategori_ref_id], [kategori_adi]) VALUES (44, N'Tarih Filmleri')
GO
INSERT [dbo].[tbl_kategoriler] ([kategori_ref_id], [kategori_adi]) VALUES (45, N'Top 250')
GO
INSERT [dbo].[tbl_kategoriler] ([kategori_ref_id], [kategori_adi]) VALUES (46, N'Western')
GO
INSERT [dbo].[tbl_kategoriler] ([kategori_ref_id], [kategori_adi]) VALUES (47, N'Türkçe Dublaj  Filmler')
GO
INSERT [dbo].[tbl_kategoriler] ([kategori_ref_id], [kategori_adi]) VALUES (48, N'Yabancı Filmler')
GO
INSERT [dbo].[tbl_kategoriler] ([kategori_ref_id], [kategori_adi]) VALUES (49, N'Yerli Filmler')
GO
INSERT [dbo].[tbl_kategoriler] ([kategori_ref_id], [kategori_adi]) VALUES (50, N'Zombi Filmleri')
GO
INSERT [dbo].[tbl_kategoriler] ([kategori_ref_id], [kategori_adi]) VALUES (51, N'Yabancı Diziler')
GO
INSERT [dbo].[tbl_kategoriler] ([kategori_ref_id], [kategori_adi]) VALUES (52, N'American Horor Story')
GO
INSERT [dbo].[tbl_kategoriler] ([kategori_ref_id], [kategori_adi]) VALUES (53, N'Arrow')
GO
INSERT [dbo].[tbl_kategoriler] ([kategori_ref_id], [kategori_adi]) VALUES (54, N'Breaking Bad')
GO
INSERT [dbo].[tbl_kategoriler] ([kategori_ref_id], [kategori_adi]) VALUES (55, N'Da Vinci''s Demons')
GO
INSERT [dbo].[tbl_kategoriler] ([kategori_ref_id], [kategori_adi]) VALUES (56, N'Dexter')
GO
INSERT [dbo].[tbl_kategoriler] ([kategori_ref_id], [kategori_adi]) VALUES (57, N'Doctor Who')
GO
INSERT [dbo].[tbl_kategoriler] ([kategori_ref_id], [kategori_adi]) VALUES (58, N'Fringe')
GO
INSERT [dbo].[tbl_kategoriler] ([kategori_ref_id], [kategori_adi]) VALUES (59, N'Gotham')
GO
INSERT [dbo].[tbl_kategoriler] ([kategori_ref_id], [kategori_adi]) VALUES (60, N'Lost')
GO
INSERT [dbo].[tbl_kategoriler] ([kategori_ref_id], [kategori_adi]) VALUES (61, N'The 100')
GO
INSERT [dbo].[tbl_kategoriler] ([kategori_ref_id], [kategori_adi]) VALUES (62, N'The Last Ship')
GO
INSERT [dbo].[tbl_kategoriler] ([kategori_ref_id], [kategori_adi]) VALUES (63, N'The Originals')
GO
INSERT [dbo].[tbl_kategoriler] ([kategori_ref_id], [kategori_adi]) VALUES (64, N'Hz. Ömer')
GO
INSERT [dbo].[tbl_kategoriler] ([kategori_ref_id], [kategori_adi]) VALUES (65, N'Masters of Horror')
GO
INSERT [dbo].[tbl_kategoriler] ([kategori_ref_id], [kategori_adi]) VALUES (66, N'Mayday')
GO
INSERT [dbo].[tbl_kategoriler] ([kategori_ref_id], [kategori_adi]) VALUES (67, N'Merlin')
GO
INSERT [dbo].[tbl_kategoriler] ([kategori_ref_id], [kategori_adi]) VALUES (68, N'Person of İnterest')
GO
INSERT [dbo].[tbl_kategoriler] ([kategori_ref_id], [kategori_adi]) VALUES (69, N'Prison Break')
GO
INSERT [dbo].[tbl_kategoriler] ([kategori_ref_id], [kategori_adi]) VALUES (70, N'Red Widow')
GO
INSERT [dbo].[tbl_kategoriler] ([kategori_ref_id], [kategori_adi]) VALUES (71, N'Revolution')
GO
INSERT [dbo].[tbl_kategoriler] ([kategori_ref_id], [kategori_adi]) VALUES (72, N'Sherlock')
GO
INSERT [dbo].[tbl_kategoriler] ([kategori_ref_id], [kategori_adi]) VALUES (73, N'Sinbad')
GO
INSERT [dbo].[tbl_kategoriler] ([kategori_ref_id], [kategori_adi]) VALUES (74, N'Slider')
GO
INSERT [dbo].[tbl_kategoriler] ([kategori_ref_id], [kategori_adi]) VALUES (75, N'Star Wars:Klon Savaşları')
GO
INSERT [dbo].[tbl_kategoriler] ([kategori_ref_id], [kategori_adi]) VALUES (76, N'Teen Wolf')
GO
INSERT [dbo].[tbl_kategoriler] ([kategori_ref_id], [kategori_adi]) VALUES (77, N'Terminator:The Sarah Connor Chonicles')
GO
INSERT [dbo].[tbl_kategoriler] ([kategori_ref_id], [kategori_adi]) VALUES (78, N'The Bible')
GO
INSERT [dbo].[tbl_kategoriler] ([kategori_ref_id], [kategori_adi]) VALUES (79, N'The Following')
GO
INSERT [dbo].[tbl_kategoriler] ([kategori_ref_id], [kategori_adi]) VALUES (80, N'The Killing')
GO
INSERT [dbo].[tbl_kategoriler] ([kategori_ref_id], [kategori_adi]) VALUES (81, N'The Pacific')
GO
INSERT [dbo].[tbl_kategoriler] ([kategori_ref_id], [kategori_adi]) VALUES (82, N'The Sopranos')
GO
INSERT [dbo].[tbl_kategoriler] ([kategori_ref_id], [kategori_adi]) VALUES (83, N'The Vampire Diaries')
GO
INSERT [dbo].[tbl_kategoriler] ([kategori_ref_id], [kategori_adi]) VALUES (84, N'The Walking Dead')
GO
INSERT [dbo].[tbl_kategoriler] ([kategori_ref_id], [kategori_adi]) VALUES (85, N'Top of The Lake')
GO
INSERT [dbo].[tbl_kategoriler] ([kategori_ref_id], [kategori_adi]) VALUES (86, N'Touch')
GO
INSERT [dbo].[tbl_kategoriler] ([kategori_ref_id], [kategori_adi]) VALUES (87, N'Under The Dome')
GO
INSERT [dbo].[tbl_kategoriler] ([kategori_ref_id], [kategori_adi]) VALUES (88, N'Vikings')
GO
INSERT [dbo].[tbl_kategoriler] ([kategori_ref_id], [kategori_adi]) VALUES (89, N'Zero Hour')
GO
SET IDENTITY_INSERT [dbo].[tbl_kategoriler] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_kul] ON 

GO
INSERT [dbo].[tbl_kul] ([kul_id], [kul_adi], [kul_soyadi], [kul_username], [kul_password], [kul_email], [kul_create_date], [kul_last_login], [kul_is_active], [kul_hakkimda], [kul_yetki]) VALUES (1, N'Selçuk', N'Özoğlu', N'ADMIN', N'123', N'selcukozo@yahoo.com', CAST(N'2015-03-15 08:41:59.623' AS DateTime), CAST(N'2015-03-28 14:18:37.000' AS DateTime), 0, NULL, N'ADMIN')
GO
INSERT [dbo].[tbl_kul] ([kul_id], [kul_adi], [kul_soyadi], [kul_username], [kul_password], [kul_email], [kul_create_date], [kul_last_login], [kul_is_active], [kul_hakkimda], [kul_yetki]) VALUES (2, N'Deneme1', N'Deneme2', N'Deneme3', N'abc', N'g@gmail.com', CAST(N'2015-03-15 09:01:48.797' AS DateTime), CAST(N'2015-03-26 15:09:27.000' AS DateTime), 0, N'denemeee', NULL)
GO
INSERT [dbo].[tbl_kul] ([kul_id], [kul_adi], [kul_soyadi], [kul_username], [kul_password], [kul_email], [kul_create_date], [kul_last_login], [kul_is_active], [kul_hakkimda], [kul_yetki]) VALUES (4, N'deneme2', N'Deneme3', N'Deneme34', N'123', N'se@gmail.com', CAST(N'2015-03-15 09:12:21.257' AS DateTime), CAST(N'2015-03-15 09:12:21.000' AS DateTime), 0, NULL, NULL)
GO
INSERT [dbo].[tbl_kul] ([kul_id], [kul_adi], [kul_soyadi], [kul_username], [kul_password], [kul_email], [kul_create_date], [kul_last_login], [kul_is_active], [kul_hakkimda], [kul_yetki]) VALUES (6, N'David', N'Backham', N'DC_Burbon', N'123', N'DC_Burbon@hotmai.com', CAST(N'2015-03-26 12:25:29.897' AS DateTime), CAST(N'2015-03-26 12:25:29.000' AS DateTime), 0, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[tbl_kul] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_log_kul] ON 

GO
INSERT [dbo].[tbl_log_kul] ([log_id], [log_tarihi], [log_aciklama], [log_tipi], [log_kul_id]) VALUES (1, CAST(N'2015-03-26 15:01:23.337' AS DateTime), N'Giriş yapıldı', 1, 1)
GO
INSERT [dbo].[tbl_log_kul] ([log_id], [log_tarihi], [log_aciklama], [log_tipi], [log_kul_id]) VALUES (2, CAST(N'2015-03-26 15:01:39.007' AS DateTime), N'Giriş yapıldı', 1, 2)
GO
INSERT [dbo].[tbl_log_kul] ([log_id], [log_tarihi], [log_aciklama], [log_tipi], [log_kul_id]) VALUES (3, CAST(N'2015-03-26 15:07:11.637' AS DateTime), N'Giriş yapıldı', 1, 1)
GO
INSERT [dbo].[tbl_log_kul] ([log_id], [log_tarihi], [log_aciklama], [log_tipi], [log_kul_id]) VALUES (4, CAST(N'2015-03-26 15:08:28.807' AS DateTime), N'Çıkış yapıldı', 0, 1)
GO
INSERT [dbo].[tbl_log_kul] ([log_id], [log_tarihi], [log_aciklama], [log_tipi], [log_kul_id]) VALUES (5, CAST(N'2015-03-26 15:09:56.360' AS DateTime), N'Giriş yapıldı', 1, 2)
GO
INSERT [dbo].[tbl_log_kul] ([log_id], [log_tarihi], [log_aciklama], [log_tipi], [log_kul_id]) VALUES (6, CAST(N'2015-03-26 15:10:57.167' AS DateTime), N'Çıkış yapıldı', 0, 2)
GO
INSERT [dbo].[tbl_log_kul] ([log_id], [log_tarihi], [log_aciklama], [log_tipi], [log_kul_id]) VALUES (7, CAST(N'2015-03-26 15:16:22.500' AS DateTime), N'Giriş yapıldı', 1, 13)
GO
INSERT [dbo].[tbl_log_kul] ([log_id], [log_tarihi], [log_aciklama], [log_tipi], [log_kul_id]) VALUES (8, CAST(N'2015-03-26 17:42:01.360' AS DateTime), N'Giriş yapıldı', 1, 1)
GO
INSERT [dbo].[tbl_log_kul] ([log_id], [log_tarihi], [log_aciklama], [log_tipi], [log_kul_id]) VALUES (9, CAST(N'2015-03-26 17:43:34.860' AS DateTime), N'Giriş yapıldı', 1, 1)
GO
INSERT [dbo].[tbl_log_kul] ([log_id], [log_tarihi], [log_aciklama], [log_tipi], [log_kul_id]) VALUES (10, CAST(N'2015-03-26 17:47:05.060' AS DateTime), N'Giriş yapıldı', 1, 1)
GO
INSERT [dbo].[tbl_log_kul] ([log_id], [log_tarihi], [log_aciklama], [log_tipi], [log_kul_id]) VALUES (11, CAST(N'2015-03-26 17:54:24.310' AS DateTime), N'Giriş yapıldı', 1, 1)
GO
INSERT [dbo].[tbl_log_kul] ([log_id], [log_tarihi], [log_aciklama], [log_tipi], [log_kul_id]) VALUES (12, CAST(N'2015-03-26 17:56:22.170' AS DateTime), N'Giriş yapıldı', 1, 1)
GO
INSERT [dbo].[tbl_log_kul] ([log_id], [log_tarihi], [log_aciklama], [log_tipi], [log_kul_id]) VALUES (13, CAST(N'2015-03-26 18:01:34.847' AS DateTime), N'Giriş yapıldı', 1, 1)
GO
INSERT [dbo].[tbl_log_kul] ([log_id], [log_tarihi], [log_aciklama], [log_tipi], [log_kul_id]) VALUES (14, CAST(N'2015-03-26 18:09:18.573' AS DateTime), N'Giriş yapıldı', 1, 1)
GO
INSERT [dbo].[tbl_log_kul] ([log_id], [log_tarihi], [log_aciklama], [log_tipi], [log_kul_id]) VALUES (15, CAST(N'2015-03-26 18:31:25.187' AS DateTime), N'Giriş yapıldı', 1, 1)
GO
INSERT [dbo].[tbl_log_kul] ([log_id], [log_tarihi], [log_aciklama], [log_tipi], [log_kul_id]) VALUES (16, CAST(N'2015-03-26 18:38:43.440' AS DateTime), N'Giriş yapıldı', 1, 1)
GO
INSERT [dbo].[tbl_log_kul] ([log_id], [log_tarihi], [log_aciklama], [log_tipi], [log_kul_id]) VALUES (17, CAST(N'2015-03-26 18:44:49.233' AS DateTime), N'Giriş yapıldı', 1, 1)
GO
INSERT [dbo].[tbl_log_kul] ([log_id], [log_tarihi], [log_aciklama], [log_tipi], [log_kul_id]) VALUES (18, CAST(N'2015-03-27 11:52:56.407' AS DateTime), N'Giriş yapıldı', 1, 1)
GO
INSERT [dbo].[tbl_log_kul] ([log_id], [log_tarihi], [log_aciklama], [log_tipi], [log_kul_id]) VALUES (19, CAST(N'2015-03-27 11:54:15.863' AS DateTime), N'Giriş yapıldı', 1, 1)
GO
INSERT [dbo].[tbl_log_kul] ([log_id], [log_tarihi], [log_aciklama], [log_tipi], [log_kul_id]) VALUES (20, CAST(N'2015-03-27 11:59:26.733' AS DateTime), N'Giriş yapıldı', 1, 1)
GO
INSERT [dbo].[tbl_log_kul] ([log_id], [log_tarihi], [log_aciklama], [log_tipi], [log_kul_id]) VALUES (21, CAST(N'2015-03-27 12:00:42.370' AS DateTime), N'Giriş yapıldı', 1, 1)
GO
INSERT [dbo].[tbl_log_kul] ([log_id], [log_tarihi], [log_aciklama], [log_tipi], [log_kul_id]) VALUES (22, CAST(N'2015-03-27 12:03:17.960' AS DateTime), N'Giriş yapıldı', 1, 1)
GO
INSERT [dbo].[tbl_log_kul] ([log_id], [log_tarihi], [log_aciklama], [log_tipi], [log_kul_id]) VALUES (23, CAST(N'2015-03-27 12:05:59.040' AS DateTime), N'Giriş yapıldı', 1, 1)
GO
INSERT [dbo].[tbl_log_kul] ([log_id], [log_tarihi], [log_aciklama], [log_tipi], [log_kul_id]) VALUES (24, CAST(N'2015-03-27 12:09:23.987' AS DateTime), N'Çıkış yapıldı', 0, 1)
GO
INSERT [dbo].[tbl_log_kul] ([log_id], [log_tarihi], [log_aciklama], [log_tipi], [log_kul_id]) VALUES (25, CAST(N'2015-03-27 12:11:36.337' AS DateTime), N'Giriş yapıldı', 1, 1)
GO
INSERT [dbo].[tbl_log_kul] ([log_id], [log_tarihi], [log_aciklama], [log_tipi], [log_kul_id]) VALUES (26, CAST(N'2015-03-27 12:12:28.517' AS DateTime), N'Çıkış yapıldı', 0, 1)
GO
INSERT [dbo].[tbl_log_kul] ([log_id], [log_tarihi], [log_aciklama], [log_tipi], [log_kul_id]) VALUES (27, CAST(N'2015-03-27 12:16:54.670' AS DateTime), N'Giriş yapıldı', 1, 1)
GO
INSERT [dbo].[tbl_log_kul] ([log_id], [log_tarihi], [log_aciklama], [log_tipi], [log_kul_id]) VALUES (28, CAST(N'2015-03-27 12:25:02.260' AS DateTime), N'Giriş yapıldı', 1, 1)
GO
INSERT [dbo].[tbl_log_kul] ([log_id], [log_tarihi], [log_aciklama], [log_tipi], [log_kul_id]) VALUES (29, CAST(N'2015-03-27 12:37:13.287' AS DateTime), N'Giriş yapıldı', 1, 1)
GO
INSERT [dbo].[tbl_log_kul] ([log_id], [log_tarihi], [log_aciklama], [log_tipi], [log_kul_id]) VALUES (30, CAST(N'2015-03-27 12:42:18.027' AS DateTime), N'Giriş yapıldı', 1, 1)
GO
INSERT [dbo].[tbl_log_kul] ([log_id], [log_tarihi], [log_aciklama], [log_tipi], [log_kul_id]) VALUES (31, CAST(N'2015-03-27 12:44:26.080' AS DateTime), N'Giriş yapıldı', 1, 1)
GO
INSERT [dbo].[tbl_log_kul] ([log_id], [log_tarihi], [log_aciklama], [log_tipi], [log_kul_id]) VALUES (32, CAST(N'2015-03-27 12:48:25.543' AS DateTime), N'Giriş yapıldı', 1, 1)
GO
INSERT [dbo].[tbl_log_kul] ([log_id], [log_tarihi], [log_aciklama], [log_tipi], [log_kul_id]) VALUES (33, CAST(N'2015-03-27 12:50:56.297' AS DateTime), N'Giriş yapıldı', 1, 1)
GO
INSERT [dbo].[tbl_log_kul] ([log_id], [log_tarihi], [log_aciklama], [log_tipi], [log_kul_id]) VALUES (34, CAST(N'2015-03-27 13:08:51.900' AS DateTime), N'Giriş yapıldı', 1, 1)
GO
INSERT [dbo].[tbl_log_kul] ([log_id], [log_tarihi], [log_aciklama], [log_tipi], [log_kul_id]) VALUES (35, CAST(N'2015-03-27 13:09:14.050' AS DateTime), N'Çıkış yapıldı', 0, 1)
GO
INSERT [dbo].[tbl_log_kul] ([log_id], [log_tarihi], [log_aciklama], [log_tipi], [log_kul_id]) VALUES (36, CAST(N'2015-03-27 13:09:29.983' AS DateTime), N'Giriş yapıldı', 1, 1)
GO
INSERT [dbo].[tbl_log_kul] ([log_id], [log_tarihi], [log_aciklama], [log_tipi], [log_kul_id]) VALUES (37, CAST(N'2015-03-27 13:11:26.043' AS DateTime), N'Giriş yapıldı', 1, 1)
GO
INSERT [dbo].[tbl_log_kul] ([log_id], [log_tarihi], [log_aciklama], [log_tipi], [log_kul_id]) VALUES (38, CAST(N'2015-03-27 13:15:36.107' AS DateTime), N'Giriş yapıldı', 1, 1)
GO
INSERT [dbo].[tbl_log_kul] ([log_id], [log_tarihi], [log_aciklama], [log_tipi], [log_kul_id]) VALUES (39, CAST(N'2015-03-27 13:18:08.030' AS DateTime), N'Giriş yapıldı', 1, 1)
GO
INSERT [dbo].[tbl_log_kul] ([log_id], [log_tarihi], [log_aciklama], [log_tipi], [log_kul_id]) VALUES (40, CAST(N'2015-03-27 13:41:31.377' AS DateTime), N'Giriş yapıldı', 1, 1)
GO
INSERT [dbo].[tbl_log_kul] ([log_id], [log_tarihi], [log_aciklama], [log_tipi], [log_kul_id]) VALUES (41, CAST(N'2015-03-27 14:03:35.433' AS DateTime), N'Giriş yapıldı', 1, 1)
GO
INSERT [dbo].[tbl_log_kul] ([log_id], [log_tarihi], [log_aciklama], [log_tipi], [log_kul_id]) VALUES (42, CAST(N'2015-03-27 14:16:08.733' AS DateTime), N'Giriş yapıldı', 1, 1)
GO
INSERT [dbo].[tbl_log_kul] ([log_id], [log_tarihi], [log_aciklama], [log_tipi], [log_kul_id]) VALUES (43, CAST(N'2015-03-27 14:21:31.397' AS DateTime), N'Giriş yapıldı', 1, 1)
GO
INSERT [dbo].[tbl_log_kul] ([log_id], [log_tarihi], [log_aciklama], [log_tipi], [log_kul_id]) VALUES (44, CAST(N'2015-03-27 14:38:39.930' AS DateTime), N'Giriş yapıldı', 1, 1)
GO
INSERT [dbo].[tbl_log_kul] ([log_id], [log_tarihi], [log_aciklama], [log_tipi], [log_kul_id]) VALUES (45, CAST(N'2015-03-27 14:41:27.200' AS DateTime), N'Giriş yapıldı', 1, 1)
GO
INSERT [dbo].[tbl_log_kul] ([log_id], [log_tarihi], [log_aciklama], [log_tipi], [log_kul_id]) VALUES (46, CAST(N'2015-03-27 14:44:15.070' AS DateTime), N'Giriş yapıldı', 1, 1)
GO
INSERT [dbo].[tbl_log_kul] ([log_id], [log_tarihi], [log_aciklama], [log_tipi], [log_kul_id]) VALUES (47, CAST(N'2015-03-27 14:45:35.683' AS DateTime), N'Giriş yapıldı', 1, 1)
GO
INSERT [dbo].[tbl_log_kul] ([log_id], [log_tarihi], [log_aciklama], [log_tipi], [log_kul_id]) VALUES (48, CAST(N'2015-03-27 14:47:48.310' AS DateTime), N'Giriş yapıldı', 1, 1)
GO
INSERT [dbo].[tbl_log_kul] ([log_id], [log_tarihi], [log_aciklama], [log_tipi], [log_kul_id]) VALUES (49, CAST(N'2015-03-27 14:48:38.827' AS DateTime), N'Giriş yapıldı', 1, 1)
GO
INSERT [dbo].[tbl_log_kul] ([log_id], [log_tarihi], [log_aciklama], [log_tipi], [log_kul_id]) VALUES (50, CAST(N'2015-03-27 14:57:35.027' AS DateTime), N'Giriş yapıldı', 1, 1)
GO
INSERT [dbo].[tbl_log_kul] ([log_id], [log_tarihi], [log_aciklama], [log_tipi], [log_kul_id]) VALUES (51, CAST(N'2015-03-27 15:05:45.550' AS DateTime), N'Giriş yapıldı', 1, 1)
GO
INSERT [dbo].[tbl_log_kul] ([log_id], [log_tarihi], [log_aciklama], [log_tipi], [log_kul_id]) VALUES (52, CAST(N'2015-03-27 15:11:55.740' AS DateTime), N'Giriş yapıldı', 1, 1)
GO
INSERT [dbo].[tbl_log_kul] ([log_id], [log_tarihi], [log_aciklama], [log_tipi], [log_kul_id]) VALUES (53, CAST(N'2015-03-27 15:27:35.677' AS DateTime), N'Giriş yapıldı', 1, 1)
GO
INSERT [dbo].[tbl_log_kul] ([log_id], [log_tarihi], [log_aciklama], [log_tipi], [log_kul_id]) VALUES (54, CAST(N'2015-03-27 15:39:38.547' AS DateTime), N'Çıkış yapıldı', 0, 1)
GO
INSERT [dbo].[tbl_log_kul] ([log_id], [log_tarihi], [log_aciklama], [log_tipi], [log_kul_id]) VALUES (55, CAST(N'2015-03-27 15:40:05.890' AS DateTime), N'Giriş yapıldı', 1, 1)
GO
INSERT [dbo].[tbl_log_kul] ([log_id], [log_tarihi], [log_aciklama], [log_tipi], [log_kul_id]) VALUES (56, CAST(N'2015-03-27 15:40:54.380' AS DateTime), N'Çıkış yapıldı', 0, 1)
GO
INSERT [dbo].[tbl_log_kul] ([log_id], [log_tarihi], [log_aciklama], [log_tipi], [log_kul_id]) VALUES (57, CAST(N'2015-03-27 15:49:55.387' AS DateTime), N'Giriş yapıldı', 1, 1)
GO
INSERT [dbo].[tbl_log_kul] ([log_id], [log_tarihi], [log_aciklama], [log_tipi], [log_kul_id]) VALUES (58, CAST(N'2015-03-27 17:32:16.780' AS DateTime), N'Giriş yapıldı', 1, 1)
GO
INSERT [dbo].[tbl_log_kul] ([log_id], [log_tarihi], [log_aciklama], [log_tipi], [log_kul_id]) VALUES (59, CAST(N'2015-03-27 17:33:54.730' AS DateTime), N'Giriş yapıldı', 1, 1)
GO
INSERT [dbo].[tbl_log_kul] ([log_id], [log_tarihi], [log_aciklama], [log_tipi], [log_kul_id]) VALUES (60, CAST(N'2015-03-27 17:37:29.930' AS DateTime), N'Çıkış yapıldı', 0, 1)
GO
INSERT [dbo].[tbl_log_kul] ([log_id], [log_tarihi], [log_aciklama], [log_tipi], [log_kul_id]) VALUES (61, CAST(N'2015-03-27 17:37:36.377' AS DateTime), N'Giriş yapıldı', 1, 1)
GO
INSERT [dbo].[tbl_log_kul] ([log_id], [log_tarihi], [log_aciklama], [log_tipi], [log_kul_id]) VALUES (62, CAST(N'2015-03-27 17:39:09.170' AS DateTime), N'Çıkış yapıldı', 0, 1)
GO
INSERT [dbo].[tbl_log_kul] ([log_id], [log_tarihi], [log_aciklama], [log_tipi], [log_kul_id]) VALUES (63, CAST(N'2015-03-27 17:39:42.300' AS DateTime), N'Giriş yapıldı', 1, 1)
GO
INSERT [dbo].[tbl_log_kul] ([log_id], [log_tarihi], [log_aciklama], [log_tipi], [log_kul_id]) VALUES (64, CAST(N'2015-03-27 19:33:06.337' AS DateTime), N'Giriş yapıldı', 1, 1)
GO
INSERT [dbo].[tbl_log_kul] ([log_id], [log_tarihi], [log_aciklama], [log_tipi], [log_kul_id]) VALUES (65, CAST(N'2015-03-28 14:05:51.377' AS DateTime), N'Giriş yapıldı', 1, 1)
GO
INSERT [dbo].[tbl_log_kul] ([log_id], [log_tarihi], [log_aciklama], [log_tipi], [log_kul_id]) VALUES (66, CAST(N'2015-03-28 14:06:27.290' AS DateTime), N'Çıkış yapıldı', 0, 1)
GO
INSERT [dbo].[tbl_log_kul] ([log_id], [log_tarihi], [log_aciklama], [log_tipi], [log_kul_id]) VALUES (67, CAST(N'2015-03-28 14:18:37.987' AS DateTime), N'Giriş yapıldı', 1, 1)
GO
INSERT [dbo].[tbl_log_kul] ([log_id], [log_tarihi], [log_aciklama], [log_tipi], [log_kul_id]) VALUES (68, CAST(N'2015-03-28 14:19:15.143' AS DateTime), N'Çıkış yapıldı', 0, 1)
GO
SET IDENTITY_INSERT [dbo].[tbl_log_kul] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_yorumlar] ON 

GO
INSERT [dbo].[tbl_yorumlar] ([yorum_ref_id], [yorum_icerik], [yorum_tarihi], [yorum_silinme], [film_ref_id], [kul_id]) VALUES (1, N'Steven Seagalin çektiği en berbat en kötü ve amatör film bu yaslandıkça filmleri
                            kötüleşiyo bencede arkadaşlar zaman kaybı izlemeyin hic ne konu be öz konuşma
                            lar birbirini tutmuyor alakası yok ve alakasız bir dublaj bu film sitesi
                            cok iyi ve kaliteli fakat bu filme 10 üzerinden 1.2 veriyorum...', CAST(N'2015-03-22 00:00:00.000' AS DateTime), 0, 1, 1)
GO
INSERT [dbo].[tbl_yorumlar] ([yorum_ref_id], [yorum_icerik], [yorum_tarihi], [yorum_silinme], [film_ref_id], [kul_id]) VALUES (2, N'Bence super bır fılm steven seagal varsa o fılm zaten superdır...', CAST(N'2015-01-22 00:00:00.000' AS DateTime), 0, 1, 2)
GO
INSERT [dbo].[tbl_yorumlar] ([yorum_ref_id], [yorum_icerik], [yorum_tarihi], [yorum_silinme], [film_ref_id], [kul_id]) VALUES (3, N'3. Denememiz hem tarih hem de yorum olayını gözden geçirmemiz gerekiyor.
Bakalım bu kez olmuşmu?', CAST(N'2015-03-23 22:54:28.910' AS DateTime), 0, 1, 1)
GO
INSERT [dbo].[tbl_yorumlar] ([yorum_ref_id], [yorum_icerik], [yorum_tarihi], [yorum_silinme], [film_ref_id], [kul_id]) VALUES (4, N'Şimdi 4. yü atıyoruz. Böylece de bir koyu bir açık renk yazdığını görebileceğiz.
Tarihi gösterirken günü çıkarmak istiyoruz. Bir de günlerden sonra ayları da göstermek istiyoruz. Böylece orjinalindeki haline benzeyecek.', CAST(N'2015-03-23 22:56:35.673' AS DateTime), 0, 1, 1)
GO
INSERT [dbo].[tbl_yorumlar] ([yorum_ref_id], [yorum_icerik], [yorum_tarihi], [yorum_silinme], [film_ref_id], [kul_id]) VALUES (5, N'Bu filmi beğendim!!!', CAST(N'2015-03-24 02:26:24.857' AS DateTime), 0, 1, 1)
GO
INSERT [dbo].[tbl_yorumlar] ([yorum_ref_id], [yorum_icerik], [yorum_tarihi], [yorum_silinme], [film_ref_id], [kul_id]) VALUES (6, N'eheheheheh', CAST(N'2015-03-24 06:59:31.233' AS DateTime), 0, 1, 1)
GO
INSERT [dbo].[tbl_yorumlar] ([yorum_ref_id], [yorum_icerik], [yorum_tarihi], [yorum_silinme], [film_ref_id], [kul_id]) VALUES (7, N'tttadadsasdada dada', CAST(N'2015-03-24 07:06:38.663' AS DateTime), 0, 1, 1)
GO
INSERT [dbo].[tbl_yorumlar] ([yorum_ref_id], [yorum_icerik], [yorum_tarihi], [yorum_silinme], [film_ref_id], [kul_id]) VALUES (8, N'Hataya düşme nedeni direk Moviese gönder dedik redirect olayında', CAST(N'2015-03-24 07:10:16.920' AS DateTime), 0, 1, 1)
GO
INSERT [dbo].[tbl_yorumlar] ([yorum_ref_id], [yorum_icerik], [yorum_tarihi], [yorum_silinme], [film_ref_id], [kul_id]) VALUES (9, N'Bakalım şimdi doğru çalışıyor mu?', CAST(N'2015-03-24 07:11:20.653' AS DateTime), 0, 1, 1)
GO
INSERT [dbo].[tbl_yorumlar] ([yorum_ref_id], [yorum_icerik], [yorum_tarihi], [yorum_silinme], [film_ref_id], [kul_id]) VALUES (10, N'Hataya düşme nedeni direk Moviese gönder dedik redirect olayında', CAST(N'2015-03-24 00:00:00.000' AS DateTime), 0, 2, 3)
GO
INSERT [dbo].[tbl_yorumlar] ([yorum_ref_id], [yorum_icerik], [yorum_tarihi], [yorum_silinme], [film_ref_id], [kul_id]) VALUES (11, N'3. Denememiz hem tarih hem de yorum olayını gözden geçirmemiz gerekiyor.
Bakalım bu kez olmuşmu?', CAST(N'2015-03-24 07:06:38.663' AS DateTime), 0, 2, 3)
GO
INSERT [dbo].[tbl_yorumlar] ([yorum_ref_id], [yorum_icerik], [yorum_tarihi], [yorum_silinme], [film_ref_id], [kul_id]) VALUES (12, N'Bakalım şimdi doğru çalışıyor mu?', CAST(N'2015-03-24 06:59:31.233' AS DateTime), 0, 2, 2)
GO
INSERT [dbo].[tbl_yorumlar] ([yorum_ref_id], [yorum_icerik], [yorum_tarihi], [yorum_silinme], [film_ref_id], [kul_id]) VALUES (13, N'Bence super bır fılm steven seagal varsa o fılm zaten superdır...', CAST(N'2015-03-23 22:54:28.910' AS DateTime), 0, 5, 3)
GO
INSERT [dbo].[tbl_yorumlar] ([yorum_ref_id], [yorum_icerik], [yorum_tarihi], [yorum_silinme], [film_ref_id], [kul_id]) VALUES (14, N'Bence super bır fılm steven seagal varsa o fılm zaten superdır...', CAST(N'2015-03-23 22:54:28.910' AS DateTime), 0, 5, 1)
GO
INSERT [dbo].[tbl_yorumlar] ([yorum_ref_id], [yorum_icerik], [yorum_tarihi], [yorum_silinme], [film_ref_id], [kul_id]) VALUES (15, N'Bakalım şimdi doğru çalışıyor mu?', CAST(N'2015-03-24 06:59:31.233' AS DateTime), 0, 4, 2)
GO
SET IDENTITY_INSERT [dbo].[tbl_yorumlar] OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "tbl_film_begenme"
            Begin Extent = 
               Top = 7
               Left = 250
               Bottom = 120
               Right = 449
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tbl_filmler"
            Begin Extent = 
               Top = 7
               Left = 27
               Bottom = 137
               Right = 211
            End
            DisplayFlags = 280
            TopColumn = 11
         End
         Begin Table = "tbl_kul"
            Begin Extent = 
               Top = 7
               Left = 482
               Bottom = 137
               Right = 681
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_film_begenme'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_film_begenme'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "tbl_filmler"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 222
            End
            DisplayFlags = 280
            TopColumn = 5
         End
         Begin Table = "tbl_yorumlar"
            Begin Extent = 
               Top = 11
               Left = 267
               Bottom = 141
               Right = 437
            End
            DisplayFlags = 280
            TopColumn = 2
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_film_yorum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_film_yorum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "tbl_filmler"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 222
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tbl_filmler_ve_kategoriler"
            Begin Extent = 
               Top = 6
               Left = 260
               Bottom = 119
               Right = 452
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tbl_kategoriler"
            Begin Extent = 
               Top = 6
               Left = 490
               Bottom = 102
               Right = 660
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_filmler_ve_kategoriler'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_filmler_ve_kategoriler'
GO
USE [master]
GO
ALTER DATABASE [SinemaProje] SET  READ_WRITE 
GO
