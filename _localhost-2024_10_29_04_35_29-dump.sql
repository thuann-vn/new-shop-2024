-- MySQL dump 10.13  Distrib 8.4.0, for macos14 (arm64)
--
-- Host: 127.0.0.1    Database: new_shop
-- ------------------------------------------------------
-- Server version	5.7.39

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `activity_log`
--

DROP TABLE IF EXISTS `activity_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activity_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `log_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `event` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject_id` bigint(20) unsigned DEFAULT NULL,
  `causer_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `causer_id` bigint(20) unsigned DEFAULT NULL,
  `properties` json DEFAULT NULL,
  `batch_uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subject` (`subject_type`,`subject_id`),
  KEY `causer` (`causer_type`,`causer_id`),
  KEY `activity_log_log_name_index` (`log_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_log`
--

LOCK TABLES `activity_log` WRITE;
/*!40000 ALTER TABLE `activity_log` DISABLE KEYS */;
INSERT INTO `activity_log` VALUES (1,'default','created','App\\Models\\Shop\\Product','created',1,'App\\Models\\User',1,'{\"old\": [], \"attributes\": {\"name\": \"Sản phẩm 1\", \"price\": 50000, \"active\": \"false\"}}',NULL,'2024-10-29 00:29:25','2024-10-29 00:29:25');
/*!40000 ALTER TABLE `activity_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addressables`
--

DROP TABLE IF EXISTS `addressables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addressables` (
  `address_id` bigint(20) unsigned NOT NULL,
  `addressable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `addressable_id` bigint(20) unsigned NOT NULL,
  KEY `addressables_addressable_type_addressable_id_index` (`addressable_type`,`addressable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addressables`
--

LOCK TABLES `addressables` WRITE;
/*!40000 ALTER TABLE `addressables` DISABLE KEYS */;
INSERT INTO `addressables` VALUES (1,'App\\Models\\Shop\\Order',1);
/*!40000 ALTER TABLE `addressables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addresses` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `street` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ward_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `district_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `province_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ward` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `district` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `province` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
INSERT INTO `addresses` VALUES (1,NULL,NULL,NULL,NULL,NULL,'01549','048','04',NULL,NULL,NULL,NULL,'2024-10-28 10:33:13','2024-10-28 10:33:13');
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authentication_log`
--

DROP TABLE IF EXISTS `authentication_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authentication_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `authenticatable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `authenticatable_id` bigint(20) unsigned NOT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `login_at` timestamp NULL DEFAULT NULL,
  `login_successful` tinyint(1) NOT NULL DEFAULT '0',
  `logout_at` timestamp NULL DEFAULT NULL,
  `cleared_by_user` tinyint(1) NOT NULL DEFAULT '0',
  `location` json DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `authentication_log_authenticatable_type_authenticatable_id_index` (`authenticatable_type`,`authenticatable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authentication_log`
--

LOCK TABLES `authentication_log` WRITE;
/*!40000 ALTER TABLE `authentication_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `authentication_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_authors`
--

DROP TABLE IF EXISTS `blog_authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_authors` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bio` longtext COLLATE utf8mb4_unicode_ci,
  `github_handle` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter_handle` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `blog_authors_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_authors`
--

LOCK TABLES `blog_authors` WRITE;
/*!40000 ALTER TABLE `blog_authors` DISABLE KEYS */;
/*!40000 ALTER TABLE `blog_authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_categories`
--

DROP TABLE IF EXISTS `blog_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `is_visible` tinyint(1) NOT NULL DEFAULT '0',
  `seo_title` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_description` varchar(160) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `blog_categories_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_categories`
--

LOCK TABLES `blog_categories` WRITE;
/*!40000 ALTER TABLE `blog_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `blog_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_posts`
--

DROP TABLE IF EXISTS `blog_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_posts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `blog_author_id` bigint(20) unsigned DEFAULT NULL,
  `blog_category_id` bigint(20) unsigned DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `published_at` date DEFAULT NULL,
  `seo_title` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_description` varchar(160) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_featured` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `blog_posts_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_posts`
--

LOCK TABLES `blog_posts` WRITE;
/*!40000 ALTER TABLE `blog_posts` DISABLE KEYS */;
/*!40000 ALTER TABLE `blog_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) DEFAULT NULL,
  `commentable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `commentable_id` bigint(20) unsigned NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci,
  `content` text COLLATE utf8mb4_unicode_ci,
  `is_visible` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comments_commentable_type_commentable_id_index` (`commentable_type`,`commentable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_requests`
--

DROP TABLE IF EXISTS `contact_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_requests` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_requests`
--

LOCK TABLES `contact_requests` WRITE;
/*!40000 ALTER TABLE `contact_requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `districts`
--

DROP TABLE IF EXISTS `districts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `districts` (
  `code` varchar(20) CHARACTER SET latin1 NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_en` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `full_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `full_name_en` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `code_name` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `province_code` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  `administrative_unit_id` int(11) DEFAULT NULL,
  `display_order` int(11) DEFAULT NULL,
  PRIMARY KEY (`code`),
  KEY `idx_districts_province` (`province_code`),
  KEY `idx_districts_unit` (`administrative_unit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `districts`
--

LOCK TABLES `districts` WRITE;
/*!40000 ALTER TABLE `districts` DISABLE KEYS */;
INSERT INTO `districts` VALUES ('001','Ba Đình','Ba Dinh','Quận Ba Đình','Ba Dinh District','ba_dinh','01',5,NULL),('002','Hoàn Kiếm','Hoan Kiem','Quận Hoàn Kiếm','Hoan Kiem District','hoan_kiem','01',5,NULL),('003','Tây Hồ','Tay Ho','Quận Tây Hồ','Tay Ho District','tay_ho','01',5,NULL),('004','Long Biên','Long Bien','Quận Long Biên','Long Bien District','long_bien','01',5,NULL),('005','Cầu Giấy','Cau Giay','Quận Cầu Giấy','Cau Giay District','cau_giay','01',5,NULL),('006','Đống Đa','Dong Da','Quận Đống Đa','Dong Da District','dong_da','01',5,NULL),('007','Hai Bà Trưng','Hai Ba Trung','Quận Hai Bà Trưng','Hai Ba Trung District','hai_ba_trung','01',5,NULL),('008','Hoàng Mai','Hoang Mai','Quận Hoàng Mai','Hoang Mai District','hoang_mai','01',5,NULL),('009','Thanh Xuân','Thanh Xuan','Quận Thanh Xuân','Thanh Xuan District','thanh_xuan','01',5,NULL),('016','Sóc Sơn','Soc Son','Huyện Sóc Sơn','Soc Son District','soc_son','01',7,NULL),('017','Đông Anh','Dong Anh','Huyện Đông Anh','Dong Anh District','dong_anh','01',7,NULL),('018','Gia Lâm','Gia Lam','Huyện Gia Lâm','Gia Lam District','gia_lam','01',7,NULL),('019','Nam Từ Liêm','Nam Tu Liem','Quận Nam Từ Liêm','Nam Tu Liem District','nam_tu_liem','01',5,NULL),('020','Thanh Trì','Thanh Tri','Huyện Thanh Trì','Thanh Tri District','thanh_tri','01',7,NULL),('021','Bắc Từ Liêm','Bac Tu Liem','Quận Bắc Từ Liêm','Bac Tu Liem District','bac_tu_liem','01',5,NULL),('024','Hà Giang','Ha Giang','Thành phố Hà Giang','Ha Giang City','ha_giang','02',4,NULL),('026','Đồng Văn','Dong Van','Huyện Đồng Văn','Dong Van District','dong_van','02',7,NULL),('027','Mèo Vạc','Meo Vac','Huyện Mèo Vạc','Meo Vac District','meo_vac','02',7,NULL),('028','Yên Minh','Yen Minh','Huyện Yên Minh','Yen Minh District','yen_minh','02',7,NULL),('029','Quản Bạ','Quan Ba','Huyện Quản Bạ','Quan Ba District','quan_ba','02',7,NULL),('030','Vị Xuyên','Vi Xuyen','Huyện Vị Xuyên','Vi Xuyen District','vi_xuyen','02',7,NULL),('031','Bắc Mê','Bac Me','Huyện Bắc Mê','Bac Me District','bac_me','02',7,NULL),('032','Hoàng Su Phì','Hoang Su Phi','Huyện Hoàng Su Phì','Hoang Su Phi District','hoang_su_phi','02',7,NULL),('033','Xín Mần','Xin Man','Huyện Xín Mần','Xin Man District','xin_man','02',7,NULL),('034','Bắc Quang','Bac Quang','Huyện Bắc Quang','Bac Quang District','bac_quang','02',7,NULL),('035','Quang Bình','Quang Binh','Huyện Quang Bình','Quang Binh District','quang_binh','02',7,NULL),('040','Cao Bằng','Cao Bang','Thành phố Cao Bằng','Cao Bang City','cao_bang','04',4,NULL),('042','Bảo Lâm','Bao Lam','Huyện Bảo Lâm','Bao Lam District','bao_lam','04',7,NULL),('043','Bảo Lạc','Bao Lac','Huyện Bảo Lạc','Bao Lac District','bao_lac','04',7,NULL),('045','Hà Quảng','Ha Quang','Huyện Hà Quảng','Ha Quang District','ha_quang','04',7,NULL),('047','Trùng Khánh','Trung Khanh','Huyện Trùng Khánh','Trung Khanh District','trung_khanh','04',7,NULL),('048','Hạ Lang','Ha Lang','Huyện Hạ Lang','Ha Lang District','ha_lang','04',7,NULL),('049','Quảng Hòa','Quang Hoa','Huyện Quảng Hòa','Quang Hoa District','quang_hoa','04',7,NULL),('051','Hoà An','Hoa An','Huyện Hoà An','Hoa An District','hoa_an','04',7,NULL),('052','Nguyên Bình','Nguyen Binh','Huyện Nguyên Bình','Nguyen Binh District','nguyen_binh','04',7,NULL),('053','Thạch An','Thach An','Huyện Thạch An','Thach An District','thach_an','04',7,NULL),('058','Bắc Kạn','Bac Kan','Thành phố Bắc Kạn','Bac Kan City','bac_kan','06',4,NULL),('060','Pác Nặm','Pac Nam','Huyện Pác Nặm','Pac Nam District','pac_nam','06',7,NULL),('061','Ba Bể','Ba Be','Huyện Ba Bể','Ba Be District','ba_be','06',7,NULL),('062','Ngân Sơn','Ngan Son','Huyện Ngân Sơn','Ngan Son District','ngan_son','06',7,NULL),('063','Bạch Thông','Bach Thong','Huyện Bạch Thông','Bach Thong District','bach_thong','06',7,NULL),('064','Chợ Đồn','Cho Don','Huyện Chợ Đồn','Cho Don District','cho_don','06',7,NULL),('065','Chợ Mới','Cho Moi','Huyện Chợ Mới','Cho Moi District','cho_moi','06',7,NULL),('066','Na Rì','Na Ri','Huyện Na Rì','Na Ri District','na_ri','06',7,NULL),('070','Tuyên Quang','Tuyen Quang','Thành phố Tuyên Quang','Tuyen Quang City','tuyen_quang','08',4,NULL),('071','Lâm Bình','Lam Binh','Huyện Lâm Bình','Lam Binh District','lam_binh','08',7,NULL),('072','Na Hang','Na Hang','Huyện Na Hang','Na Hang District','na_hang','08',7,NULL),('073','Chiêm Hóa','Chiem Hoa','Huyện Chiêm Hóa','Chiem Hoa District','chiem_hoa','08',7,NULL),('074','Hàm Yên','Ham Yen','Huyện Hàm Yên','Ham Yen District','ham_yen','08',7,NULL),('075','Yên Sơn','Yen Son','Huyện Yên Sơn','Yen Son District','yen_son','08',7,NULL),('076','Sơn Dương','Son Duong','Huyện Sơn Dương','Son Duong District','son_duong','08',7,NULL),('080','Lào Cai','Lao Cai','Thành phố Lào Cai','Lao Cai City','lao_cai','10',4,NULL),('082','Bát Xát','Bat Xat','Huyện Bát Xát','Bat Xat District','bat_xat','10',7,NULL),('083','Mường Khương','Muong Khuong','Huyện Mường Khương','Muong Khuong District','muong_khuong','10',7,NULL),('084','Si Ma Cai','Si Ma Cai','Huyện Si Ma Cai','Si Ma Cai District','si_ma_cai','10',7,NULL),('085','Bắc Hà','Bac Ha','Huyện Bắc Hà','Bac Ha District','bac_ha','10',7,NULL),('086','Bảo Thắng','Bao Thang','Huyện Bảo Thắng','Bao Thang District','bao_thang','10',7,NULL),('087','Bảo Yên','Bao Yen','Huyện Bảo Yên','Bao Yen District','bao_yen','10',7,NULL),('088','Sa Pa','Sa Pa','Thị xã Sa Pa','Sa Pa Town','sa_pa','10',6,NULL),('089','Văn Bàn','Van Ban','Huyện Văn Bàn','Van Ban District','van_ban','10',7,NULL),('094','Điện Biên Phủ','Dien Bien Phu','Thành phố Điện Biên Phủ','Dien Bien Phu City','dien_bien_phu','11',4,NULL),('095','Mường Lay','Muong Lay','Thị xã Mường Lay','Muong Lay Town','muong_lay','11',6,NULL),('096','Mường Nhé','Muong Nhe','Huyện Mường Nhé','Muong Nhe District','muong_nhe','11',7,NULL),('097','Mường Chà','Muong Cha','Huyện Mường Chà','Muong Cha District','muong_cha','11',7,NULL),('098','Tủa Chùa','Tua Chua','Huyện Tủa Chùa','Tua Chua District','tua_chua','11',7,NULL),('099','Tuần Giáo','Tuan Giao','Huyện Tuần Giáo','Tuan Giao District','tuan_giao','11',7,NULL),('100','Điện Biên','Dien Bien','Huyện Điện Biên','Dien Bien District','dien_bien','11',7,NULL),('101','Điện Biên Đông','Dien Bien Dong','Huyện Điện Biên Đông','Dien Bien Dong District','dien_bien_dong','11',7,NULL),('102','Mường Ảng','Muong Ang','Huyện Mường Ảng','Muong Ang District','muong_ang','11',7,NULL),('103','Nậm Pồ','Nam Po','Huyện Nậm Pồ','Nam Po District','nam_po','11',7,NULL),('105','Lai Châu','Lai Chau','Thành phố Lai Châu','Lai Chau City','lai_chau','12',4,NULL),('106','Tam Đường','Tam Duong','Huyện Tam Đường','Tam Duong District','tam_duong','12',7,NULL),('107','Mường Tè','Muong Te','Huyện Mường Tè','Muong Te District','muong_te','12',7,NULL),('108','Sìn Hồ','Sin Ho','Huyện Sìn Hồ','Sin Ho District','sin_ho','12',7,NULL),('109','Phong Thổ','Phong Tho','Huyện Phong Thổ','Phong Tho District','phong_tho','12',7,NULL),('110','Than Uyên','Than Uyen','Huyện Than Uyên','Than Uyen District','than_uyen','12',7,NULL),('111','Tân Uyên','Tan Uyen','Huyện Tân Uyên','Tan Uyen District','tan_uyen','12',7,NULL),('112','Nậm Nhùn','Nam Nhun','Huyện Nậm Nhùn','Nam Nhun District','nam_nhun','12',7,NULL),('116','Sơn La','Son La','Thành phố Sơn La','Son La City','son_la','14',4,NULL),('118','Quỳnh Nhai','Quynh Nhai','Huyện Quỳnh Nhai','Quynh Nhai District','quynh_nhai','14',7,NULL),('119','Thuận Châu','Thuan Chau','Huyện Thuận Châu','Thuan Chau District','thuan_chau','14',7,NULL),('120','Mường La','Muong La','Huyện Mường La','Muong La District','muong_la','14',7,NULL),('121','Bắc Yên','Bac Yen','Huyện Bắc Yên','Bac Yen District','bac_yen','14',7,NULL),('122','Phù Yên','Phu Yen','Huyện Phù Yên','Phu Yen District','phu_yen','14',7,NULL),('123','Mộc Châu','Moc Chau','Huyện Mộc Châu','Moc Chau District','moc_chau','14',7,NULL),('124','Yên Châu','Yen Chau','Huyện Yên Châu','Yen Chau District','yen_chau','14',7,NULL),('125','Mai Sơn','Mai Son','Huyện Mai Sơn','Mai Son District','mai_son','14',7,NULL),('126','Sông Mã','Song Ma','Huyện Sông Mã','Song Ma District','song_ma','14',7,NULL),('127','Sốp Cộp','Sop Cop','Huyện Sốp Cộp','Sop Cop District','sop_cop','14',7,NULL),('128','Vân Hồ','Van Ho','Huyện Vân Hồ','Van Ho District','van_ho','14',7,NULL),('132','Yên Bái','Yen Bai','Thành phố Yên Bái','Yen Bai City','yen_bai','15',4,NULL),('133','Nghĩa Lộ','Nghia Lo','Thị xã Nghĩa Lộ','Nghia Lo Town','nghia_lo','15',6,NULL),('135','Lục Yên','Luc Yen','Huyện Lục Yên','Luc Yen District','luc_yen','15',7,NULL),('136','Văn Yên','Van Yen','Huyện Văn Yên','Van Yen District','van_yen','15',7,NULL),('137','Mù Căng Chải','Mu Cang Chai','Huyện Mù Căng Chải','Mu Cang Chai District','mu_cang_chai','15',7,NULL),('138','Trấn Yên','Tran Yen','Huyện Trấn Yên','Tran Yen District','tran_yen','15',7,NULL),('139','Trạm Tấu','Tram Tau','Huyện Trạm Tấu','Tram Tau District','tram_tau','15',7,NULL),('140','Văn Chấn','Van Chan','Huyện Văn Chấn','Van Chan District','van_chan','15',7,NULL),('141','Yên Bình','Yen Binh','Huyện Yên Bình','Yen Binh District','yen_binh','15',7,NULL),('148','Hòa Bình','Hoa Binh','Thành phố Hòa Bình','Hoa Binh City','hoa_binh','17',4,NULL),('150','Đà Bắc','Da Bac','Huyện Đà Bắc','Da Bac District','da_bac','17',7,NULL),('152','Lương Sơn','Luong Son','Huyện Lương Sơn','Luong Son District','luong_son','17',7,NULL),('153','Kim Bôi','Kim Boi','Huyện Kim Bôi','Kim Boi District','kim_boi','17',7,NULL),('154','Cao Phong','Cao Phong','Huyện Cao Phong','Cao Phong District','cao_phong','17',7,NULL),('155','Tân Lạc','Tan Lac','Huyện Tân Lạc','Tan Lac District','tan_lac','17',7,NULL),('156','Mai Châu','Mai Chau','Huyện Mai Châu','Mai Chau District','mai_chau','17',7,NULL),('157','Lạc Sơn','Lac Son','Huyện Lạc Sơn','Lac Son District','lac_son','17',7,NULL),('158','Yên Thủy','Yen Thuy','Huyện Yên Thủy','Yen Thuy District','yen_thuy','17',7,NULL),('159','Lạc Thủy','Lac Thuy','Huyện Lạc Thủy','Lac Thuy District','lac_thuy','17',7,NULL),('164','Thái Nguyên','Thai Nguyen','Thành phố Thái Nguyên','Thai Nguyen City','thai_nguyen','19',4,NULL),('165','Sông Công','Song Cong','Thành phố Sông Công','Song Cong City','song_cong','19',4,NULL),('167','Định Hóa','Dinh Hoa','Huyện Định Hóa','Dinh Hoa District','dinh_hoa','19',7,NULL),('168','Phú Lương','Phu Luong','Huyện Phú Lương','Phu Luong District','phu_luong','19',7,NULL),('169','Đồng Hỷ','Dong Hy','Huyện Đồng Hỷ','Dong Hy District','dong_hy','19',7,NULL),('170','Võ Nhai','Vo Nhai','Huyện Võ Nhai','Vo Nhai District','vo_nhai','19',7,NULL),('171','Đại Từ','Dai Tu','Huyện Đại Từ','Dai Tu District','dai_tu','19',7,NULL),('172','Phổ Yên','Pho Yen','Thành phố Phổ Yên','Pho Yen City','pho_yen','19',4,NULL),('173','Phú Bình','Phu Binh','Huyện Phú Bình','Phu Binh District','phu_binh','19',7,NULL),('178','Lạng Sơn','Lang Son','Thành phố Lạng Sơn','Lang Son City','lang_son','20',4,NULL),('180','Tràng Định','Trang Dinh','Huyện Tràng Định','Trang Dinh District','trang_dinh','20',7,NULL),('181','Bình Gia','Binh Gia','Huyện Bình Gia','Binh Gia District','binh_gia','20',7,NULL),('182','Văn Lãng','Van Lang','Huyện Văn Lãng','Van Lang District','van_lang','20',7,NULL),('183','Cao Lộc','Cao Loc','Huyện Cao Lộc','Cao Loc District','cao_loc','20',7,NULL),('184','Văn Quan','Van Quan','Huyện Văn Quan','Van Quan District','van_quan','20',7,NULL),('185','Bắc Sơn','Bac Son','Huyện Bắc Sơn','Bac Son District','bac_son','20',7,NULL),('186','Hữu Lũng','Huu Lung','Huyện Hữu Lũng','Huu Lung District','huu_lung','20',7,NULL),('187','Chi Lăng','Chi Lang','Huyện Chi Lăng','Chi Lang District','chi_lang','20',7,NULL),('188','Lộc Bình','Loc Binh','Huyện Lộc Bình','Loc Binh District','loc_binh','20',7,NULL),('189','Đình Lập','Dinh Lap','Huyện Đình Lập','Dinh Lap District','dinh_lap','20',7,NULL),('193','Hạ Long','Ha Long','Thành phố Hạ Long','Ha Long City','ha_long','22',4,NULL),('194','Móng Cái','Mong Cai','Thành phố Móng Cái','Mong Cai City','mong_cai','22',4,NULL),('195','Cẩm Phả','Cam Pha','Thành phố Cẩm Phả','Cam Pha City','cam_pha','22',4,NULL),('196','Uông Bí','Uong Bi','Thành phố Uông Bí','Uong Bi City','uong_bi','22',4,NULL),('198','Bình Liêu','Binh Lieu','Huyện Bình Liêu','Binh Lieu District','binh_lieu','22',7,NULL),('199','Tiên Yên','Tien Yen','Huyện Tiên Yên','Tien Yen District','tien_yen','22',7,NULL),('200','Đầm Hà','Dam Ha','Huyện Đầm Hà','Dam Ha District','dam_ha','22',7,NULL),('201','Hải Hà','Hai Ha','Huyện Hải Hà','Hai Ha District','hai_ha','22',7,NULL),('202','Ba Chẽ','Ba Che','Huyện Ba Chẽ','Ba Che District','ba_che','22',7,NULL),('203','Vân Đồn','Van Don','Huyện Vân Đồn','Van Don District','van_don','22',7,NULL),('205','Đông Triều','Dong Trieu','Thị xã Đông Triều','Dong Trieu Town','dong_trieu','22',6,NULL),('206','Quảng Yên','Quang Yen','Thị xã Quảng Yên','Quang Yen Town','quang_yen','22',6,NULL),('207','Cô Tô','Co To','Huyện Cô Tô','Co To District','co_to','22',7,NULL),('213','Bắc Giang','Bac Giang','Thành phố Bắc Giang','Bac Giang City','bac_giang','24',4,NULL),('215','Yên Thế','Yen The','Huyện Yên Thế','Yen The District','yen_the','24',7,NULL),('216','Tân Yên','Tan Yen','Huyện Tân Yên','Tan Yen District','tan_yen','24',7,NULL),('217','Lạng Giang','Lang Giang','Huyện Lạng Giang','Lang Giang District','lang_giang','24',7,NULL),('218','Lục Nam','Luc Nam','Huyện Lục Nam','Luc Nam District','luc_nam','24',7,NULL),('219','Lục Ngạn','Luc Ngan','Huyện Lục Ngạn','Luc Ngan District','luc_ngan','24',7,NULL),('220','Sơn Động','Son Dong','Huyện Sơn Động','Son Dong District','son_dong','24',7,NULL),('221','Yên Dũng','Yen Dung','Huyện Yên Dũng','Yen Dung District','yen_dung','24',7,NULL),('222','Việt Yên','Viet Yen','Huyện Việt Yên','Viet Yen District','viet_yen','24',7,NULL),('223','Hiệp Hòa','Hiep Hoa','Huyện Hiệp Hòa','Hiep Hoa District','hiep_hoa','24',7,NULL),('227','Việt Trì','Viet Tri','Thành phố Việt Trì','Viet Tri City','viet_tri','25',4,NULL),('228','Phú Thọ','Phu Tho','Thị xã Phú Thọ','Phu Tho Town','phu_tho','25',6,NULL),('230','Đoan Hùng','Doan Hung','Huyện Đoan Hùng','Doan Hung District','doan_hung','25',7,NULL),('231','Hạ Hoà','Ha Hoa','Huyện Hạ Hoà','Ha Hoa District','ha_hoa','25',7,NULL),('232','Thanh Ba','Thanh Ba','Huyện Thanh Ba','Thanh Ba District','thanh_ba','25',7,NULL),('233','Phù Ninh','Phu Ninh','Huyện Phù Ninh','Phu Ninh District','phu_ninh','25',7,NULL),('234','Yên Lập','Yen Lap','Huyện Yên Lập','Yen Lap District','yen_lap','25',7,NULL),('235','Cẩm Khê','Cam Khe','Huyện Cẩm Khê','Cam Khe District','cam_khe','25',7,NULL),('236','Tam Nông','Tam Nong','Huyện Tam Nông','Tam Nong District','tam_nong','25',7,NULL),('237','Lâm Thao','Lam Thao','Huyện Lâm Thao','Lam Thao District','lam_thao','25',7,NULL),('238','Thanh Sơn','Thanh Son','Huyện Thanh Sơn','Thanh Son District','thanh_son','25',7,NULL),('239','Thanh Thuỷ','Thanh Thuy','Huyện Thanh Thuỷ','Thanh Thuy District','thanh_thuy','25',7,NULL),('240','Tân Sơn','Tan Son','Huyện Tân Sơn','Tan Son District','tan_son','25',7,NULL),('243','Vĩnh Yên','Vinh Yen','Thành phố Vĩnh Yên','Vinh Yen City','vinh_yen','26',4,NULL),('244','Phúc Yên','Phuc Yen','Thành phố Phúc Yên','Phuc Yen City','phuc_yen','26',4,NULL),('246','Lập Thạch','Lap Thach','Huyện Lập Thạch','Lap Thach District','lap_thach','26',7,NULL),('247','Tam Dương','Tam Duong','Huyện Tam Dương','Tam Duong District','tam_duong','26',7,NULL),('248','Tam Đảo','Tam Dao','Huyện Tam Đảo','Tam Dao District','tam_dao','26',7,NULL),('249','Bình Xuyên','Binh Xuyen','Huyện Bình Xuyên','Binh Xuyen District','binh_xuyen','26',7,NULL),('250','Mê Linh','Me Linh','Huyện Mê Linh','Me Linh District','me_linh','01',7,NULL),('251','Yên Lạc','Yen Lac','Huyện Yên Lạc','Yen Lac District','yen_lac','26',7,NULL),('252','Vĩnh Tường','Vinh Tuong','Huyện Vĩnh Tường','Vinh Tuong District','vinh_tuong','26',7,NULL),('253','Sông Lô','Song Lo','Huyện Sông Lô','Song Lo District','song_lo','26',7,NULL),('256','Bắc Ninh','Bac Ninh','Thành phố Bắc Ninh','Bac Ninh City','bac_ninh','27',4,NULL),('258','Yên Phong','Yen Phong','Huyện Yên Phong','Yen Phong District','yen_phong','27',7,NULL),('259','Quế Võ','Que Vo','Thị xã Quế Võ','Que Vo Town','que_vo','27',6,NULL),('260','Tiên Du','Tien Du','Huyện Tiên Du','Tien Du District','tien_du','27',7,NULL),('261','Từ Sơn','Tu Son','Thành phố Từ Sơn','Tu Son City','tu_son','27',4,NULL),('262','Thuận Thành','Thuan Thanh','Thị xã Thuận Thành','Thuan Thanh Town','thuan_thanh','27',6,NULL),('263','Gia Bình','Gia Binh','Huyện Gia Bình','Gia Binh District','gia_binh','27',7,NULL),('264','Lương Tài','Luong Tai','Huyện Lương Tài','Luong Tai District','luong_tai','27',7,NULL),('268','Hà Đông','Ha Dong','Quận Hà Đông','Ha Dong District','ha_dong','01',5,NULL),('269','Sơn Tây','Son Tay','Thị xã Sơn Tây','Son Tay Town','son_tay','01',6,NULL),('271','Ba Vì','Ba Vi','Huyện Ba Vì','Ba Vi District','ba_vi','01',7,NULL),('272','Phúc Thọ','Phuc Tho','Huyện Phúc Thọ','Phuc Tho District','phuc_tho','01',7,NULL),('273','Đan Phượng','Dan Phuong','Huyện Đan Phượng','Dan Phuong District','dan_phuong','01',7,NULL),('274','Hoài Đức','Hoai Duc','Huyện Hoài Đức','Hoai Duc District','hoai_duc','01',7,NULL),('275','Quốc Oai','Quoc Oai','Huyện Quốc Oai','Quoc Oai District','quoc_oai','01',7,NULL),('276','Thạch Thất','Thach That','Huyện Thạch Thất','Thach That District','thach_that','01',7,NULL),('277','Chương Mỹ','Chuong My','Huyện Chương Mỹ','Chuong My District','chuong_my','01',7,NULL),('278','Thanh Oai','Thanh Oai','Huyện Thanh Oai','Thanh Oai District','thanh_oai','01',7,NULL),('279','Thường Tín','Thuong Tin','Huyện Thường Tín','Thuong Tin District','thuong_tin','01',7,NULL),('280','Phú Xuyên','Phu Xuyen','Huyện Phú Xuyên','Phu Xuyen District','phu_xuyen','01',7,NULL),('281','Ứng Hòa','Ung Hoa','Huyện Ứng Hòa','Ung Hoa District','ung_hoa','01',7,NULL),('282','Mỹ Đức','My Duc','Huyện Mỹ Đức','My Duc District','my_duc','01',7,NULL),('288','Hải Dương','Hai Duong','Thành phố Hải Dương','Hai Duong City','hai_duong','30',4,NULL),('290','Chí Linh','Chi Linh','Thành phố Chí Linh','Chi Linh City','chi_linh','30',4,NULL),('291','Nam Sách','Nam Sach','Huyện Nam Sách','Nam Sach District','nam_sach','30',7,NULL),('292','Kinh Môn','Kinh Mon','Thị xã Kinh Môn','Kinh Mon Town','kinh_mon','30',6,NULL),('293','Kim Thành','Kim Thanh','Huyện Kim Thành','Kim Thanh District','kim_thanh','30',7,NULL),('294','Thanh Hà','Thanh Ha','Huyện Thanh Hà','Thanh Ha District','thanh_ha','30',7,NULL),('295','Cẩm Giàng','Cam Giang','Huyện Cẩm Giàng','Cam Giang District','cam_giang','30',7,NULL),('296','Bình Giang','Binh Giang','Huyện Bình Giang','Binh Giang District','binh_giang','30',7,NULL),('297','Gia Lộc','Gia Loc','Huyện Gia Lộc','Gia Loc District','gia_loc','30',7,NULL),('298','Tứ Kỳ','Tu Ky','Huyện Tứ Kỳ','Tu Ky District','tu_ky','30',7,NULL),('299','Ninh Giang','Ninh Giang','Huyện Ninh Giang','Ninh Giang District','ninh_giang','30',7,NULL),('300','Thanh Miện','Thanh Mien','Huyện Thanh Miện','Thanh Mien District','thanh_mien','30',7,NULL),('303','Hồng Bàng','Hong Bang','Quận Hồng Bàng','Hong Bang District','hong_bang','31',5,NULL),('304','Ngô Quyền','Ngo Quyen','Quận Ngô Quyền','Ngo Quyen District','ngo_quyen','31',5,NULL),('305','Lê Chân','Le Chan','Quận Lê Chân','Le Chan District','le_chan','31',5,NULL),('306','Hải An','Hai An','Quận Hải An','Hai An District','hai_an','31',5,NULL),('307','Kiến An','Kien An','Quận Kiến An','Kien An District','kien_an','31',5,NULL),('308','Đồ Sơn','Do Son','Quận Đồ Sơn','Do Son District','do_son','31',5,NULL),('309','Dương Kinh','Duong Kinh','Quận Dương Kinh','Duong Kinh District','duong_kinh','31',5,NULL),('311','Thuỷ Nguyên','Thuy Nguyen','Huyện Thuỷ Nguyên','Thuy Nguyen District','thuy_nguyen','31',7,NULL),('312','An Dương','An Duong','Huyện An Dương','An Duong District','an_duong','31',7,NULL),('313','An Lão','An Lao','Huyện An Lão','An Lao District','an_lao','31',7,NULL),('314','Kiến Thuỵ','Kien Thuy','Huyện Kiến Thuỵ','Kien Thuy District','kien_thuy','31',7,NULL),('315','Tiên Lãng','Tien Lang','Huyện Tiên Lãng','Tien Lang District','tien_lang','31',7,NULL),('316','Vĩnh Bảo','Vinh Bao','Huyện Vĩnh Bảo','Vinh Bao District','vinh_bao','31',7,NULL),('317','Cát Hải','Cat Hai','Huyện Cát Hải','Cat Hai District','cat_hai','31',7,NULL),('318','Bạch Long Vĩ','Bach Long Vi','Huyện Bạch Long Vĩ','Bach Long Vi District','bach_long_vi','31',7,NULL),('323','Hưng Yên','Hung Yen','Thành phố Hưng Yên','Hung Yen City','hung_yen','33',4,NULL),('325','Văn Lâm','Van Lam','Huyện Văn Lâm','Van Lam District','van_lam','33',7,NULL),('326','Văn Giang','Van Giang','Huyện Văn Giang','Van Giang District','van_giang','33',7,NULL),('327','Yên Mỹ','Yen My','Huyện Yên Mỹ','Yen My District','yen_my','33',7,NULL),('328','Mỹ Hào','My Hao','Thị xã Mỹ Hào','My Hao Town','my_hao','33',6,NULL),('329','Ân Thi','An Thi','Huyện Ân Thi','An Thi District','an_thi','33',7,NULL),('330','Khoái Châu','Khoai Chau','Huyện Khoái Châu','Khoai Chau District','khoai_chau','33',7,NULL),('331','Kim Động','Kim Dong','Huyện Kim Động','Kim Dong District','kim_dong','33',7,NULL),('332','Tiên Lữ','Tien Lu','Huyện Tiên Lữ','Tien Lu District','tien_lu','33',7,NULL),('333','Phù Cừ','Phu Cu','Huyện Phù Cừ','Phu Cu District','phu_cu','33',7,NULL),('336','Thái Bình','Thai Binh','Thành phố Thái Bình','Thai Binh City','thai_binh','34',4,NULL),('338','Quỳnh Phụ','Quynh Phu','Huyện Quỳnh Phụ','Quynh Phu District','quynh_phu','34',7,NULL),('339','Hưng Hà','Hung Ha','Huyện Hưng Hà','Hung Ha District','hung_ha','34',7,NULL),('340','Đông Hưng','Dong Hung','Huyện Đông Hưng','Dong Hung District','dong_hung','34',7,NULL),('341','Thái Thụy','Thai Thuy','Huyện Thái Thụy','Thai Thuy District','thai_thuy','34',7,NULL),('342','Tiền Hải','Tien Hai','Huyện Tiền Hải','Tien Hai District','tien_hai','34',7,NULL),('343','Kiến Xương','Kien Xuong','Huyện Kiến Xương','Kien Xuong District','kien_xuong','34',7,NULL),('344','Vũ Thư','Vu Thu','Huyện Vũ Thư','Vu Thu District','vu_thu','34',7,NULL),('347','Phủ Lý','Phu Ly','Thành phố Phủ Lý','Phu Ly City','phu_ly','35',4,NULL),('349','Duy Tiên','Duy Tien','Thị xã Duy Tiên','Duy Tien Town','duy_tien','35',6,NULL),('350','Kim Bảng','Kim Bang','Huyện Kim Bảng','Kim Bang District','kim_bang','35',7,NULL),('351','Thanh Liêm','Thanh Liem','Huyện Thanh Liêm','Thanh Liem District','thanh_liem','35',7,NULL),('352','Bình Lục','Binh Luc','Huyện Bình Lục','Binh Luc District','binh_luc','35',7,NULL),('353','Lý Nhân','Ly Nhan','Huyện Lý Nhân','Ly Nhan District','ly_nhan','35',7,NULL),('356','Nam Định','Nam Dinh','Thành phố Nam Định','Nam Dinh City','nam_dinh','36',4,NULL),('358','Mỹ Lộc','My Loc','Huyện Mỹ Lộc','My Loc District','my_loc','36',7,NULL),('359','Vụ Bản','Vu Ban','Huyện Vụ Bản','Vu Ban District','vu_ban','36',7,NULL),('360','Ý Yên','Y Yen','Huyện Ý Yên','Y Yen District','y_yen','36',7,NULL),('361','Nghĩa Hưng','Nghia Hung','Huyện Nghĩa Hưng','Nghia Hung District','nghia_hung','36',7,NULL),('362','Nam Trực','Nam Truc','Huyện Nam Trực','Nam Truc District','nam_truc','36',7,NULL),('363','Trực Ninh','Truc Ninh','Huyện Trực Ninh','Truc Ninh District','truc_ninh','36',7,NULL),('364','Xuân Trường','Xuan Truong','Huyện Xuân Trường','Xuan Truong District','xuan_truong','36',7,NULL),('365','Giao Thủy','Giao Thuy','Huyện Giao Thủy','Giao Thuy District','giao_thuy','36',7,NULL),('366','Hải Hậu','Hai Hau','Huyện Hải Hậu','Hai Hau District','hai_hau','36',7,NULL),('369','Ninh Bình','Ninh Binh','Thành phố Ninh Bình','Ninh Binh City','ninh_binh','37',4,NULL),('370','Tam Điệp','Tam Diep','Thành phố Tam Điệp','Tam Diep City','tam_diep','37',4,NULL),('372','Nho Quan','Nho Quan','Huyện Nho Quan','Nho Quan District','nho_quan','37',7,NULL),('373','Gia Viễn','Gia Vien','Huyện Gia Viễn','Gia Vien District','gia_vien','37',7,NULL),('374','Hoa Lư','Hoa Lu','Huyện Hoa Lư','Hoa Lu District','hoa_lu','37',7,NULL),('375','Yên Khánh','Yen Khanh','Huyện Yên Khánh','Yen Khanh District','yen_khanh','37',7,NULL),('376','Kim Sơn','Kim Son','Huyện Kim Sơn','Kim Son District','kim_son','37',7,NULL),('377','Yên Mô','Yen Mo','Huyện Yên Mô','Yen Mo District','yen_mo','37',7,NULL),('380','Thanh Hóa','Thanh Hoa','Thành phố Thanh Hóa','Thanh Hoa City','thanh_hoa','38',4,NULL),('381','Bỉm Sơn','Bim Son','Thị xã Bỉm Sơn','Bim Son Town','bim_son','38',6,NULL),('382','Sầm Sơn','Sam Son','Thành phố Sầm Sơn','Sam Son City','sam_son','38',4,NULL),('384','Mường Lát','Muong Lat','Huyện Mường Lát','Muong Lat District','muong_lat','38',7,NULL),('385','Quan Hóa','Quan Hoa','Huyện Quan Hóa','Quan Hoa District','quan_hoa','38',7,NULL),('386','Bá Thước','Ba Thuoc','Huyện Bá Thước','Ba Thuoc District','ba_thuoc','38',7,NULL),('387','Quan Sơn','Quan Son','Huyện Quan Sơn','Quan Son District','quan_son','38',7,NULL),('388','Lang Chánh','Lang Chanh','Huyện Lang Chánh','Lang Chanh District','lang_chanh','38',7,NULL),('389','Ngọc Lặc','Ngoc Lac','Huyện Ngọc Lặc','Ngoc Lac District','ngoc_lac','38',7,NULL),('390','Cẩm Thủy','Cam Thuy','Huyện Cẩm Thủy','Cam Thuy District','cam_thuy','38',7,NULL),('391','Thạch Thành','Thach Thanh','Huyện Thạch Thành','Thach Thanh District','thach_thanh','38',7,NULL),('392','Hà Trung','Ha Trung','Huyện Hà Trung','Ha Trung District','ha_trung','38',7,NULL),('393','Vĩnh Lộc','Vinh Loc','Huyện Vĩnh Lộc','Vinh Loc District','vinh_loc','38',7,NULL),('394','Yên Định','Yen Dinh','Huyện Yên Định','Yen Dinh District','yen_dinh','38',7,NULL),('395','Thọ Xuân','Tho Xuan','Huyện Thọ Xuân','Tho Xuan District','tho_xuan','38',7,NULL),('396','Thường Xuân','Thuong Xuan','Huyện Thường Xuân','Thuong Xuan District','thuong_xuan','38',7,NULL),('397','Triệu Sơn','Trieu Son','Huyện Triệu Sơn','Trieu Son District','trieu_son','38',7,NULL),('398','Thiệu Hóa','Thieu Hoa','Huyện Thiệu Hóa','Thieu Hoa District','thieu_hoa','38',7,NULL),('399','Hoằng Hóa','Hoang Hoa','Huyện Hoằng Hóa','Hoang Hoa District','hoang_hoa','38',7,NULL),('400','Hậu Lộc','Hau Loc','Huyện Hậu Lộc','Hau Loc District','hau_loc','38',7,NULL),('401','Nga Sơn','Nga Son','Huyện Nga Sơn','Nga Son District','nga_son','38',7,NULL),('402','Như Xuân','Nhu Xuan','Huyện Như Xuân','Nhu Xuan District','nhu_xuan','38',7,NULL),('403','Như Thanh','Nhu Thanh','Huyện Như Thanh','Nhu Thanh District','nhu_thanh','38',7,NULL),('404','Nông Cống','Nong Cong','Huyện Nông Cống','Nong Cong District','nong_cong','38',7,NULL),('405','Đông Sơn','Dong Son','Huyện Đông Sơn','Dong Son District','dong_son','38',7,NULL),('406','Quảng Xương','Quang Xuong','Huyện Quảng Xương','Quang Xuong District','quang_xuong','38',7,NULL),('407','Nghi Sơn','Nghi Son','Thị xã Nghi Sơn','Nghi Son Town','nghi_son','38',6,NULL),('412','Vinh','Vinh','Thành phố Vinh','Vinh City','vinh','40',4,NULL),('413','Cửa Lò','Cua Lo','Thị xã Cửa Lò','Cua Lo Town','cua_lo','40',6,NULL),('414','Thái Hoà','Thai Hoa','Thị xã Thái Hoà','Thai Hoa Town','thai_hoa','40',6,NULL),('415','Quế Phong','Que Phong','Huyện Quế Phong','Que Phong District','que_phong','40',7,NULL),('416','Quỳ Châu','Quy Chau','Huyện Quỳ Châu','Quy Chau District','quy_chau','40',7,NULL),('417','Kỳ Sơn','Ky Son','Huyện Kỳ Sơn','Ky Son District','ky_son','40',7,NULL),('418','Tương Dương','Tuong Duong','Huyện Tương Dương','Tuong Duong District','tuong_duong','40',7,NULL),('419','Nghĩa Đàn','Nghia Dan','Huyện Nghĩa Đàn','Nghia Dan District','nghia_dan','40',7,NULL),('420','Quỳ Hợp','Quy Hop','Huyện Quỳ Hợp','Quy Hop District','quy_hop','40',7,NULL),('421','Quỳnh Lưu','Quynh Luu','Huyện Quỳnh Lưu','Quynh Luu District','quynh_luu','40',7,NULL),('422','Con Cuông','Con Cuong','Huyện Con Cuông','Con Cuong District','con_cuong','40',7,NULL),('423','Tân Kỳ','Tan Ky','Huyện Tân Kỳ','Tan Ky District','tan_ky','40',7,NULL),('424','Anh Sơn','Anh Son','Huyện Anh Sơn','Anh Son District','anh_son','40',7,NULL),('425','Diễn Châu','Dien Chau','Huyện Diễn Châu','Dien Chau District','dien_chau','40',7,NULL),('426','Yên Thành','Yen Thanh','Huyện Yên Thành','Yen Thanh District','yen_thanh','40',7,NULL),('427','Đô Lương','Do Luong','Huyện Đô Lương','Do Luong District','do_luong','40',7,NULL),('428','Thanh Chương','Thanh Chuong','Huyện Thanh Chương','Thanh Chuong District','thanh_chuong','40',7,NULL),('429','Nghi Lộc','Nghi Loc','Huyện Nghi Lộc','Nghi Loc District','nghi_loc','40',7,NULL),('430','Nam Đàn','Nam Dan','Huyện Nam Đàn','Nam Dan District','nam_dan','40',7,NULL),('431','Hưng Nguyên','Hung Nguyen','Huyện Hưng Nguyên','Hung Nguyen District','hung_nguyen','40',7,NULL),('432','Hoàng Mai','Hoang Mai','Thị xã Hoàng Mai','Hoang Mai Town','hoang_mai','40',6,NULL),('436','Hà Tĩnh','Ha Tinh','Thành phố Hà Tĩnh','Ha Tinh City','ha_tinh','42',4,NULL),('437','Hồng Lĩnh','Hong Linh','Thị xã Hồng Lĩnh','Hong Linh Town','hong_linh','42',6,NULL),('439','Hương Sơn','Huong Son','Huyện Hương Sơn','Huong Son District','huong_son','42',7,NULL),('440','Đức Thọ','Duc Tho','Huyện Đức Thọ','Duc Tho District','duc_tho','42',7,NULL),('441','Vũ Quang','Vu Quang','Huyện Vũ Quang','Vu Quang District','vu_quang','42',7,NULL),('442','Nghi Xuân','Nghi Xuan','Huyện Nghi Xuân','Nghi Xuan District','nghi_xuan','42',7,NULL),('443','Can Lộc','Can Loc','Huyện Can Lộc','Can Loc District','can_loc','42',7,NULL),('444','Hương Khê','Huong Khe','Huyện Hương Khê','Huong Khe District','huong_khe','42',7,NULL),('445','Thạch Hà','Thach Ha','Huyện Thạch Hà','Thach Ha District','thach_ha','42',7,NULL),('446','Cẩm Xuyên','Cam Xuyen','Huyện Cẩm Xuyên','Cam Xuyen District','cam_xuyen','42',7,NULL),('447','Kỳ Anh','Ky Anh','Huyện Kỳ Anh','Ky Anh District','ky_anh','42',7,NULL),('448','Lộc Hà','Loc Ha','Huyện Lộc Hà','Loc Ha District','loc_ha','42',7,NULL),('449','Kỳ Anh','Ky Anh','Thị xã Kỳ Anh','Ky Anh Town','ky_anh','42',6,NULL),('450','Đồng Hới','Dong Hoi','Thành phố Đồng Hới','Dong Hoi City','dong_hoi','44',4,NULL),('452','Minh Hóa','Minh Hoa','Huyện Minh Hóa','Minh Hoa District','minh_hoa','44',7,NULL),('453','Tuyên Hóa','Tuyen Hoa','Huyện Tuyên Hóa','Tuyen Hoa District','tuyen_hoa','44',7,NULL),('454','Quảng Trạch','Quang Trach','Huyện Quảng Trạch','Quang Trach District','quang_trach','44',7,NULL),('455','Bố Trạch','Bo Trach','Huyện Bố Trạch','Bo Trach District','bo_trach','44',7,NULL),('456','Quảng Ninh','Quang Ninh','Huyện Quảng Ninh','Quang Ninh District','quang_ninh','44',7,NULL),('457','Lệ Thủy','Le Thuy','Huyện Lệ Thủy','Le Thuy District','le_thuy','44',7,NULL),('458','Ba Đồn','Ba Don','Thị xã Ba Đồn','Ba Don Town','ba_don','44',6,NULL),('461','Đông Hà','Dong Ha','Thành phố Đông Hà','Dong Ha City','dong_ha','45',4,NULL),('462','Quảng Trị','Quang Tri','Thị xã Quảng Trị','Quang Tri Town','quang_tri','45',6,NULL),('464','Vĩnh Linh','Vinh Linh','Huyện Vĩnh Linh','Vinh Linh District','vinh_linh','45',7,NULL),('465','Hướng Hóa','Huong Hoa','Huyện Hướng Hóa','Huong Hoa District','huong_hoa','45',7,NULL),('466','Gio Linh','Gio Linh','Huyện Gio Linh','Gio Linh District','gio_linh','45',7,NULL),('467','Đa Krông','Da Krong','Huyện Đa Krông','Da Krong District','da_krong','45',7,NULL),('468','Cam Lộ','Cam Lo','Huyện Cam Lộ','Cam Lo District','cam_lo','45',7,NULL),('469','Triệu Phong','Trieu Phong','Huyện Triệu Phong','Trieu Phong District','trieu_phong','45',7,NULL),('470','Hải Lăng','Hai Lang','Huyện Hải Lăng','Hai Lang District','hai_lang','45',7,NULL),('471','Cồn Cỏ','Con Co','Huyện Cồn Cỏ','Con Co District','con_co','45',7,NULL),('474','Huế','Hue','Thành phố Huế','Hue City','hue','46',4,NULL),('476','Phong Điền','Phong Dien','Huyện Phong Điền','Phong Dien District','phong_dien','46',7,NULL),('477','Quảng Điền','Quang Dien','Huyện Quảng Điền','Quang Dien District','quang_dien','46',7,NULL),('478','Phú Vang','Phu Vang','Huyện Phú Vang','Phu Vang District','phu_vang','46',7,NULL),('479','Hương Thủy','Huong Thuy','Thị xã Hương Thủy','Huong Thuy Town','huong_thuy','46',6,NULL),('480','Hương Trà','Huong Tra','Thị xã Hương Trà','Huong Tra Town','huong_tra','46',6,NULL),('481','A Lưới','A Luoi','Huyện A Lưới','A Luoi District','a_luoi','46',7,NULL),('482','Phú Lộc','Phu Loc','Huyện Phú Lộc','Phu Loc District','phu_loc','46',7,NULL),('483','Nam Đông','Nam Dong','Huyện Nam Đông','Nam Dong District','nam_dong','46',7,NULL),('490','Liên Chiểu','Lien Chieu','Quận Liên Chiểu','Lien Chieu District','lien_chieu','48',5,NULL),('491','Thanh Khê','Thanh Khe','Quận Thanh Khê','Thanh Khe District','thanh_khe','48',5,NULL),('492','Hải Châu','Hai Chau','Quận Hải Châu','Hai Chau District','hai_chau','48',5,NULL),('493','Sơn Trà','Son Tra','Quận Sơn Trà','Son Tra District','son_tra','48',5,NULL),('494','Ngũ Hành Sơn','Ngu Hanh Son','Quận Ngũ Hành Sơn','Ngu Hanh Son District','ngu_hanh_son','48',5,NULL),('495','Cẩm Lệ','Cam Le','Quận Cẩm Lệ','Cam Le District','cam_le','48',5,NULL),('497','Hòa Vang','Hoa Vang','Huyện Hòa Vang','Hoa Vang District','hoa_vang','48',7,NULL),('498','Hoàng Sa','Hoang Sa','Huyện Hoàng Sa','Hoang Sa District','hoang_sa','48',7,NULL),('502','Tam Kỳ','Tam Ky','Thành phố Tam Kỳ','Tam Ky City','tam_ky','49',4,NULL),('503','Hội An','Hoi An','Thành phố Hội An','Hoi An City','hoi_an','49',4,NULL),('504','Tây Giang','Tay Giang','Huyện Tây Giang','Tay Giang District','tay_giang','49',7,NULL),('505','Đông Giang','Dong Giang','Huyện Đông Giang','Dong Giang District','dong_giang','49',7,NULL),('506','Đại Lộc','Dai Loc','Huyện Đại Lộc','Dai Loc District','dai_loc','49',7,NULL),('507','Điện Bàn','Dien Ban','Thị xã Điện Bàn','Dien Ban Town','dien_ban','49',6,NULL),('508','Duy Xuyên','Duy Xuyen','Huyện Duy Xuyên','Duy Xuyen District','duy_xuyen','49',7,NULL),('509','Quế Sơn','Que Son','Huyện Quế Sơn','Que Son District','que_son','49',7,NULL),('510','Nam Giang','Nam Giang','Huyện Nam Giang','Nam Giang District','nam_giang','49',7,NULL),('511','Phước Sơn','Phuoc Son','Huyện Phước Sơn','Phuoc Son District','phuoc_son','49',7,NULL),('512','Hiệp Đức','Hiep Duc','Huyện Hiệp Đức','Hiep Duc District','hiep_duc','49',7,NULL),('513','Thăng Bình','Thang Binh','Huyện Thăng Bình','Thang Binh District','thang_binh','49',7,NULL),('514','Tiên Phước','Tien Phuoc','Huyện Tiên Phước','Tien Phuoc District','tien_phuoc','49',7,NULL),('515','Bắc Trà My','Bac Tra My','Huyện Bắc Trà My','Bac Tra My District','bac_tra_my','49',7,NULL),('516','Nam Trà My','Nam Tra My','Huyện Nam Trà My','Nam Tra My District','nam_tra_my','49',7,NULL),('517','Núi Thành','Nui Thanh','Huyện Núi Thành','Nui Thanh District','nui_thanh','49',7,NULL),('518','Phú Ninh','Phu Ninh','Huyện Phú Ninh','Phu Ninh District','phu_ninh','49',7,NULL),('519','Nông Sơn','Nong Son','Huyện Nông Sơn','Nong Son District','nong_son','49',7,NULL),('522','Quảng Ngãi','Quang Ngai','Thành phố Quảng Ngãi','Quang Ngai City','quang_ngai','51',4,NULL),('524','Bình Sơn','Binh Son','Huyện Bình Sơn','Binh Son District','binh_son','51',7,NULL),('525','Trà Bồng','Tra Bong','Huyện Trà Bồng','Tra Bong District','tra_bong','51',7,NULL),('527','Sơn Tịnh','Son Tinh','Huyện Sơn Tịnh','Son Tinh District','son_tinh','51',7,NULL),('528','Tư Nghĩa','Tu Nghia','Huyện Tư Nghĩa','Tu Nghia District','tu_nghia','51',7,NULL),('529','Sơn Hà','Son Ha','Huyện Sơn Hà','Son Ha District','son_ha','51',7,NULL),('530','Sơn Tây','Son Tay','Huyện Sơn Tây','Son Tay District','son_tay','51',7,NULL),('531','Minh Long','Minh Long','Huyện Minh Long','Minh Long District','minh_long','51',7,NULL),('532','Nghĩa Hành','Nghia Hanh','Huyện Nghĩa Hành','Nghia Hanh District','nghia_hanh','51',7,NULL),('533','Mộ Đức','Mo Duc','Huyện Mộ Đức','Mo Duc District','mo_duc','51',7,NULL),('534','Đức Phổ','Duc Pho','Thị xã Đức Phổ','Duc Pho Town','duc_pho','51',6,NULL),('535','Ba Tơ','Ba To','Huyện Ba Tơ','Ba To District','ba_to','51',7,NULL),('536','Lý Sơn','Ly Son','Huyện Lý Sơn','Ly Son District','ly_son','51',7,NULL),('540','Quy Nhơn','Quy Nhon','Thành phố Quy Nhơn','Quy Nhon City','quy_nhon','52',4,NULL),('542','An Lão','An Lao','Huyện An Lão','An Lao District','an_lao','52',7,NULL),('543','Hoài Nhơn','Hoai Nhon','Thị xã Hoài Nhơn','Hoai Nhon Town','hoai_nhon','52',6,NULL),('544','Hoài Ân','Hoai An','Huyện Hoài Ân','Hoai An District','hoai_an','52',7,NULL),('545','Phù Mỹ','Phu My','Huyện Phù Mỹ','Phu My District','phu_my','52',7,NULL),('546','Vĩnh Thạnh','Vinh Thanh','Huyện Vĩnh Thạnh','Vinh Thanh District','vinh_thanh','52',7,NULL),('547','Tây Sơn','Tay Son','Huyện Tây Sơn','Tay Son District','tay_son','52',7,NULL),('548','Phù Cát','Phu Cat','Huyện Phù Cát','Phu Cat District','phu_cat','52',7,NULL),('549','An Nhơn','An Nhon','Thị xã An Nhơn','An Nhon Town','an_nhon','52',6,NULL),('550','Tuy Phước','Tuy Phuoc','Huyện Tuy Phước','Tuy Phuoc District','tuy_phuoc','52',7,NULL),('551','Vân Canh','Van Canh','Huyện Vân Canh','Van Canh District','van_canh','52',7,NULL),('555','Tuy Hoà','Tuy Hoa','Thành phố Tuy Hoà','Tuy Hoa City','tuy_hoa','54',4,NULL),('557','Sông Cầu','Song Cau','Thị xã Sông Cầu','Song Cau Town','song_cau','54',6,NULL),('558','Đồng Xuân','Dong Xuan','Huyện Đồng Xuân','Dong Xuan District','dong_xuan','54',7,NULL),('559','Tuy An','Tuy An','Huyện Tuy An','Tuy An District','tuy_an','54',7,NULL),('560','Sơn Hòa','Son Hoa','Huyện Sơn Hòa','Son Hoa District','son_hoa','54',7,NULL),('561','Sông Hinh','Song Hinh','Huyện Sông Hinh','Song Hinh District','song_hinh','54',7,NULL),('562','Tây Hoà','Tay Hoa','Huyện Tây Hoà','Tay Hoa District','tay_hoa','54',7,NULL),('563','Phú Hoà','Phu Hoa','Huyện Phú Hoà','Phu Hoa District','phu_hoa','54',7,NULL),('564','Đông Hòa','Dong Hoa','Thị xã Đông Hòa','Dong Hoa Town','dong_hoa','54',6,NULL),('568','Nha Trang','Nha Trang','Thành phố Nha Trang','Nha Trang City','nha_trang','56',4,NULL),('569','Cam Ranh','Cam Ranh','Thành phố Cam Ranh','Cam Ranh City','cam_ranh','56',4,NULL),('570','Cam Lâm','Cam Lam','Huyện Cam Lâm','Cam Lam District','cam_lam','56',7,NULL),('571','Vạn Ninh','Van Ninh','Huyện Vạn Ninh','Van Ninh District','van_ninh','56',7,NULL),('572','Ninh Hòa','Ninh Hoa','Thị xã Ninh Hòa','Ninh Hoa Town','ninh_hoa','56',6,NULL),('573','Khánh Vĩnh','Khanh Vinh','Huyện Khánh Vĩnh','Khanh Vinh District','khanh_vinh','56',7,NULL),('574','Diên Khánh','Dien Khanh','Huyện Diên Khánh','Dien Khanh District','dien_khanh','56',7,NULL),('575','Khánh Sơn','Khanh Son','Huyện Khánh Sơn','Khanh Son District','khanh_son','56',7,NULL),('576','Trường Sa','Truong Sa','Huyện Trường Sa','Truong Sa District','truong_sa','56',7,NULL),('582','Phan Rang-Tháp Chàm','Phan Rang-Thap Cham','Thành phố Phan Rang-Tháp Chàm','Phan Rang-Thap Cham City','phan_rang-thap_cham','58',4,NULL),('584','Bác Ái','Bac Ai','Huyện Bác Ái','Bac Ai District','bac_ai','58',7,NULL),('585','Ninh Sơn','Ninh Son','Huyện Ninh Sơn','Ninh Son District','ninh_son','58',7,NULL),('586','Ninh Hải','Ninh Hai','Huyện Ninh Hải','Ninh Hai District','ninh_hai','58',7,NULL),('587','Ninh Phước','Ninh Phuoc','Huyện Ninh Phước','Ninh Phuoc District','ninh_phuoc','58',7,NULL),('588','Thuận Bắc','Thuan Bac','Huyện Thuận Bắc','Thuan Bac District','thuan_bac','58',7,NULL),('589','Thuận Nam','Thuan Nam','Huyện Thuận Nam','Thuan Nam District','thuan_nam','58',7,NULL),('593','Phan Thiết','Phan Thiet','Thành phố Phan Thiết','Phan Thiet City','phan_thiet','60',4,NULL),('594','La Gi','La Gi','Thị xã La Gi','La Gi Town','la_gi','60',6,NULL),('595','Tuy Phong','Tuy Phong','Huyện Tuy Phong','Tuy Phong District','tuy_phong','60',7,NULL),('596','Bắc Bình','Bac Binh','Huyện Bắc Bình','Bac Binh District','bac_binh','60',7,NULL),('597','Hàm Thuận Bắc','Ham Thuan Bac','Huyện Hàm Thuận Bắc','Ham Thuan Bac District','ham_thuan_bac','60',7,NULL),('598','Hàm Thuận Nam','Ham Thuan Nam','Huyện Hàm Thuận Nam','Ham Thuan Nam District','ham_thuan_nam','60',7,NULL),('599','Tánh Linh','Tanh Linh','Huyện Tánh Linh','Tanh Linh District','tanh_linh','60',7,NULL),('600','Đức Linh','Duc Linh','Huyện Đức Linh','Duc Linh District','duc_linh','60',7,NULL),('601','Hàm Tân','Ham Tan','Huyện Hàm Tân','Ham Tan District','ham_tan','60',7,NULL),('602','Phú Quí','Phu Qui','Huyện Phú Quí','Phu Qui District','phu_qui','60',7,NULL),('608','Kon Tum','Kon Tum','Thành phố Kon Tum','Kon Tum City','kon_tum','62',4,NULL),('610','Đắk Glei','Dak Glei','Huyện Đắk Glei','Dak Glei District','dak_glei','62',7,NULL),('611','Ngọc Hồi','Ngoc Hoi','Huyện Ngọc Hồi','Ngoc Hoi District','ngoc_hoi','62',7,NULL),('612','Đắk Tô','Dak To','Huyện Đắk Tô','Dak To District','dak_to','62',7,NULL),('613','Kon Plông','Kon Plong','Huyện Kon Plông','Kon Plong District','kon_plong','62',7,NULL),('614','Kon Rẫy','Kon Ray','Huyện Kon Rẫy','Kon Ray District','kon_ray','62',7,NULL),('615','Đắk Hà','Dak Ha','Huyện Đắk Hà','Dak Ha District','dak_ha','62',7,NULL),('616','Sa Thầy','Sa Thay','Huyện Sa Thầy','Sa Thay District','sa_thay','62',7,NULL),('617','Tu Mơ Rông','Tu Mo Rong','Huyện Tu Mơ Rông','Tu Mo Rong District','tu_mo_rong','62',7,NULL),('618','Ia H\' Drai','Ia H\' Drai','Huyện Ia H\' Drai','Ia H\' Drai District','ia_h\'_drai','62',7,NULL),('622','Pleiku','Pleiku','Thành phố Pleiku','Pleiku City','pleiku','64',4,NULL),('623','An Khê','An Khe','Thị xã An Khê','An Khe Town','an_khe','64',6,NULL),('624','Ayun Pa','Ayun Pa','Thị xã Ayun Pa','Ayun Pa Town','ayun_pa','64',6,NULL),('625','KBang','KBang','Huyện KBang','KBang District','kbang','64',7,NULL),('626','Đăk Đoa','Dak Doa','Huyện Đăk Đoa','Dak Doa District','dak_doa','64',7,NULL),('627','Chư Păh','Chu Pah','Huyện Chư Păh','Chu Pah District','chu_pah','64',7,NULL),('628','Ia Grai','Ia Grai','Huyện Ia Grai','Ia Grai District','ia_grai','64',7,NULL),('629','Mang Yang','Mang Yang','Huyện Mang Yang','Mang Yang District','mang_yang','64',7,NULL),('630','Kông Chro','Kong Chro','Huyện Kông Chro','Kong Chro District','kong_chro','64',7,NULL),('631','Đức Cơ','Duc Co','Huyện Đức Cơ','Duc Co District','duc_co','64',7,NULL),('632','Chư Prông','Chu Prong','Huyện Chư Prông','Chu Prong District','chu_prong','64',7,NULL),('633','Chư Sê','Chu Se','Huyện Chư Sê','Chu Se District','chu_se','64',7,NULL),('634','Đăk Pơ','Dak Po','Huyện Đăk Pơ','Dak Po District','dak_po','64',7,NULL),('635','Ia Pa','Ia Pa','Huyện Ia Pa','Ia Pa District','ia_pa','64',7,NULL),('637','Krông Pa','Krong Pa','Huyện Krông Pa','Krong Pa District','krong_pa','64',7,NULL),('638','Phú Thiện','Phu Thien','Huyện Phú Thiện','Phu Thien District','phu_thien','64',7,NULL),('639','Chư Pưh','Chu Puh','Huyện Chư Pưh','Chu Puh District','chu_puh','64',7,NULL),('643','Buôn Ma Thuột','Buon Ma Thuot','Thành phố Buôn Ma Thuột','Buon Ma Thuot City','buon_ma_thuot','66',4,NULL),('644','Buôn Hồ','Buon Ho','Thị xã Buôn Hồ','Buon Ho Town','buon_ho','66',6,NULL),('645','Ea H\'leo','Ea H\'leo','Huyện Ea H\'leo','Ea H\'leo District','ea_h\'leo','66',7,NULL),('646','Ea Súp','Ea Sup','Huyện Ea Súp','Ea Sup District','ea_sup','66',7,NULL),('647','Buôn Đôn','Buon Don','Huyện Buôn Đôn','Buon Don District','buon_don','66',7,NULL),('648','Cư M\'gar','Cu M\'gar','Huyện Cư M\'gar','Cu M\'gar District','cu_m\'gar','66',7,NULL),('649','Krông Búk','Krong Buk','Huyện Krông Búk','Krong Buk District','krong_buk','66',7,NULL),('650','Krông Năng','Krong Nang','Huyện Krông Năng','Krong Nang District','krong_nang','66',7,NULL),('651','Ea Kar','Ea Kar','Huyện Ea Kar','Ea Kar District','ea_kar','66',7,NULL),('652','M\'Đrắk','M\'Drak','Huyện M\'Đrắk','M\'Drak District','m\'drak','66',7,NULL),('653','Krông Bông','Krong Bong','Huyện Krông Bông','Krong Bong District','krong_bong','66',7,NULL),('654','Krông Pắc','Krong Pac','Huyện Krông Pắc','Krong Pac District','krong_pac','66',7,NULL),('655','Krông A Na','Krong A Na','Huyện Krông A Na','Krong A Na District','krong_a_na','66',7,NULL),('656','Lắk','Lak','Huyện Lắk','Lak District','lak','66',7,NULL),('657','Cư Kuin','Cu Kuin','Huyện Cư Kuin','Cu Kuin District','cu_kuin','66',7,NULL),('660','Gia Nghĩa','Gia Nghia','Thành phố Gia Nghĩa','Gia Nghia City','gia_nghia','67',4,NULL),('661','Đăk Glong','Dak Glong','Huyện Đăk Glong','Dak Glong District','dak_glong','67',7,NULL),('662','Cư Jút','Cu Jut','Huyện Cư Jút','Cu Jut District','cu_jut','67',7,NULL),('663','Đắk Mil','Dak Mil','Huyện Đắk Mil','Dak Mil District','dak_mil','67',7,NULL),('664','Krông Nô','Krong No','Huyện Krông Nô','Krong No District','krong_no','67',7,NULL),('665','Đắk Song','Dak Song','Huyện Đắk Song','Dak Song District','dak_song','67',7,NULL),('666','Đắk R\'Lấp','Dak R\'Lap','Huyện Đắk R\'Lấp','Dak R\'Lap District','dak_r\'lap','67',7,NULL),('667','Tuy Đức','Tuy Duc','Huyện Tuy Đức','Tuy Duc District','tuy_duc','67',7,NULL),('672','Đà Lạt','Da Lat','Thành phố Đà Lạt','Da Lat City','da_lat','68',4,NULL),('673','Bảo Lộc','Bao Loc','Thành phố Bảo Lộc','Bao Loc City','bao_loc','68',4,NULL),('674','Đam Rông','Dam Rong','Huyện Đam Rông','Dam Rong District','dam_rong','68',7,NULL),('675','Lạc Dương','Lac Duong','Huyện Lạc Dương','Lac Duong District','lac_duong','68',7,NULL),('676','Lâm Hà','Lam Ha','Huyện Lâm Hà','Lam Ha District','lam_ha','68',7,NULL),('677','Đơn Dương','Don Duong','Huyện Đơn Dương','Don Duong District','don_duong','68',7,NULL),('678','Đức Trọng','Duc Trong','Huyện Đức Trọng','Duc Trong District','duc_trong','68',7,NULL),('679','Di Linh','Di Linh','Huyện Di Linh','Di Linh District','di_linh','68',7,NULL),('680','Bảo Lâm','Bao Lam','Huyện Bảo Lâm','Bao Lam District','bao_lam','68',7,NULL),('681','Đạ Huoai','Da Huoai','Huyện Đạ Huoai','Da Huoai District','da_huoai','68',7,NULL),('682','Đạ Tẻh','Da Teh','Huyện Đạ Tẻh','Da Teh District','da_teh','68',7,NULL),('683','Cát Tiên','Cat Tien','Huyện Cát Tiên','Cat Tien District','cat_tien','68',7,NULL),('688','Phước Long','Phuoc Long','Thị xã Phước Long','Phuoc Long Town','phuoc_long','70',6,NULL),('689','Đồng Xoài','Dong Xoai','Thành phố Đồng Xoài','Dong Xoai City','dong_xoai','70',4,NULL),('690','Bình Long','Binh Long','Thị xã Bình Long','Binh Long Town','binh_long','70',6,NULL),('691','Bù Gia Mập','Bu Gia Map','Huyện Bù Gia Mập','Bu Gia Map District','bu_gia_map','70',7,NULL),('692','Lộc Ninh','Loc Ninh','Huyện Lộc Ninh','Loc Ninh District','loc_ninh','70',7,NULL),('693','Bù Đốp','Bu Dop','Huyện Bù Đốp','Bu Dop District','bu_dop','70',7,NULL),('694','Hớn Quản','Hon Quan','Huyện Hớn Quản','Hon Quan District','hon_quan','70',7,NULL),('695','Đồng Phú','Dong Phu','Huyện Đồng Phú','Dong Phu District','dong_phu','70',7,NULL),('696','Bù Đăng','Bu Dang','Huyện Bù Đăng','Bu Dang District','bu_dang','70',7,NULL),('697','Chơn Thành','Chon Thanh','Thị xã Chơn Thành','Chon Thanh Town','chon_thanh','70',6,NULL),('698','Phú Riềng','Phu Rieng','Huyện Phú Riềng','Phu Rieng District','phu_rieng','70',7,NULL),('703','Tây Ninh','Tay Ninh','Thành phố Tây Ninh','Tay Ninh City','tay_ninh','72',4,NULL),('705','Tân Biên','Tan Bien','Huyện Tân Biên','Tan Bien District','tan_bien','72',7,NULL),('706','Tân Châu','Tan Chau','Huyện Tân Châu','Tan Chau District','tan_chau','72',7,NULL),('707','Dương Minh Châu','Duong Minh Chau','Huyện Dương Minh Châu','Duong Minh Chau District','duong_minh_chau','72',7,NULL),('708','Châu Thành','Chau Thanh','Huyện Châu Thành','Chau Thanh District','chau_thanh','72',7,NULL),('709','Hòa Thành','Hoa Thanh','Thị xã Hòa Thành','Hoa Thanh Town','hoa_thanh','72',6,NULL),('710','Gò Dầu','Go Dau','Huyện Gò Dầu','Go Dau District','go_dau','72',7,NULL),('711','Bến Cầu','Ben Cau','Huyện Bến Cầu','Ben Cau District','ben_cau','72',7,NULL),('712','Trảng Bàng','Trang Bang','Thị xã Trảng Bàng','Trang Bang Town','trang_bang','72',6,NULL),('718','Thủ Dầu Một','Thu Dau Mot','Thành phố Thủ Dầu Một','Thu Dau Mot City','thu_dau_mot','74',4,NULL),('719','Bàu Bàng','Bau Bang','Huyện Bàu Bàng','Bau Bang District','bau_bang','74',7,NULL),('720','Dầu Tiếng','Dau Tieng','Huyện Dầu Tiếng','Dau Tieng District','dau_tieng','74',7,NULL),('721','Bến Cát','Ben Cat','Thị xã Bến Cát','Ben Cat Town','ben_cat','74',6,NULL),('722','Phú Giáo','Phu Giao','Huyện Phú Giáo','Phu Giao District','phu_giao','74',7,NULL),('723','Tân Uyên','Tan Uyen','Thành phố Tân Uyên','Tan Uyen City','tan_uyen','74',4,NULL),('724','Dĩ An','Di An','Thành phố Dĩ An','Di An City','di_an','74',4,NULL),('725','Thuận An','Thuan An','Thành phố Thuận An','Thuan An City','thuan_an','74',4,NULL),('726','Bắc Tân Uyên','Bac Tan Uyen','Huyện Bắc Tân Uyên','Bac Tan Uyen District','bac_tan_uyen','74',7,NULL),('731','Biên Hòa','Bien Hoa','Thành phố Biên Hòa','Bien Hoa City','bien_hoa','75',4,NULL),('732','Long Khánh','Long Khanh','Thành phố Long Khánh','Long Khanh City','long_khanh','75',4,NULL),('734','Tân Phú','Tan Phu','Huyện Tân Phú','Tan Phu District','tan_phu','75',7,NULL),('735','Vĩnh Cửu','Vinh Cuu','Huyện Vĩnh Cửu','Vinh Cuu District','vinh_cuu','75',7,NULL),('736','Định Quán','Dinh Quan','Huyện Định Quán','Dinh Quan District','dinh_quan','75',7,NULL),('737','Trảng Bom','Trang Bom','Huyện Trảng Bom','Trang Bom District','trang_bom','75',7,NULL),('738','Thống Nhất','Thong Nhat','Huyện Thống Nhất','Thong Nhat District','thong_nhat','75',7,NULL),('739','Cẩm Mỹ','Cam My','Huyện Cẩm Mỹ','Cam My District','cam_my','75',7,NULL),('740','Long Thành','Long Thanh','Huyện Long Thành','Long Thanh District','long_thanh','75',7,NULL),('741','Xuân Lộc','Xuan Loc','Huyện Xuân Lộc','Xuan Loc District','xuan_loc','75',7,NULL),('742','Nhơn Trạch','Nhon Trach','Huyện Nhơn Trạch','Nhon Trach District','nhon_trach','75',7,NULL),('747','Vũng Tàu','Vung Tau','Thành phố Vũng Tàu','Vung Tau City','vung_tau','77',4,NULL),('748','Bà Rịa','Ba Ria','Thành phố Bà Rịa','Ba Ria City','ba_ria','77',4,NULL),('750','Châu Đức','Chau Duc','Huyện Châu Đức','Chau Duc District','chau_duc','77',7,NULL),('751','Xuyên Mộc','Xuyen Moc','Huyện Xuyên Mộc','Xuyen Moc District','xuyen_moc','77',7,NULL),('752','Long Điền','Long Dien','Huyện Long Điền','Long Dien District','long_dien','77',7,NULL),('753','Đất Đỏ','Dat Do','Huyện Đất Đỏ','Dat Do District','dat_do','77',7,NULL),('754','Phú Mỹ','Phu My','Thị xã Phú Mỹ','Phu My Town','phu_my','77',6,NULL),('755','Côn Đảo','Con Dao','Huyện Côn Đảo','Con Dao District','con_dao','77',7,NULL),('760','1','1','Quận 1','District 1','1','79',5,1),('761','12','12','Quận 12','District 12','12','79',5,11),('764','Gò Vấp','Go Vap','Quận Gò Vấp','Go Vap District','go_vap','79',5,13),('765','Bình Thạnh','Binh Thanh','Quận Bình Thạnh','Binh Thanh District','binh_thanh','79',5,12),('766','Tân Bình','Tan Binh','Quận Tân Bình','Tan Binh District','tan_binh','79',5,15),('767','Tân Phú','Tan Phu','Quận Tân Phú','Tan Phu District','tan_phu','79',5,15),('768','Phú Nhuận','Phu Nhuan','Quận Phú Nhuận','Phu Nhuan District','phu_nhuan','79',5,15),('769','Thủ Đức','Thu Duc','Thành phố Thủ Đức','Thu Duc City','thu_duc','79',3,15),('770','3','3','Quận 3','District 3','3','79',5,2),('771','10','10','Quận 10','District 10','10','79',5,9),('772','11','11','Quận 11','District 11','11','79',5,10),('773','4','4','Quận 4','District 4','4','79',5,3),('774','5','5','Quận 5','District 5','5','79',5,4),('775','6','6','Quận 6','District 6','6','79',5,5),('776','8','8','Quận 8','District 8','8','79',5,7),('777','Bình Tân','Binh Tan','Quận Bình Tân','Binh Tan District','binh_tan','79',5,15),('778','7','7','Quận 7','District 7','7','79',5,6),('783','Củ Chi','Cu Chi','Huyện Củ Chi','Cu Chi District','cu_chi','79',7,15),('784','Hóc Môn','Hoc Mon','Huyện Hóc Môn','Hoc Mon District','hoc_mon','79',7,15),('785','Bình Chánh','Binh Chanh','Huyện Bình Chánh','Binh Chanh District','binh_chanh','79',7,15),('786','Nhà Bè','Nha Be','Huyện Nhà Bè','Nha Be District','nha_be','79',7,15),('787','Cần Giờ','Can Gio','Huyện Cần Giờ','Can Gio District','can_gio','79',7,15),('794','Tân An','Tan An','Thành phố Tân An','Tan An City','tan_an','80',4,NULL),('795','Kiến Tường','Kien Tuong','Thị xã Kiến Tường','Kien Tuong Town','kien_tuong','80',6,NULL),('796','Tân Hưng','Tan Hung','Huyện Tân Hưng','Tan Hung District','tan_hung','80',7,NULL),('797','Vĩnh Hưng','Vinh Hung','Huyện Vĩnh Hưng','Vinh Hung District','vinh_hung','80',7,NULL),('798','Mộc Hóa','Moc Hoa','Huyện Mộc Hóa','Moc Hoa District','moc_hoa','80',7,NULL),('799','Tân Thạnh','Tan Thanh','Huyện Tân Thạnh','Tan Thanh District','tan_thanh','80',7,NULL),('800','Thạnh Hóa','Thanh Hoa','Huyện Thạnh Hóa','Thanh Hoa District','thanh_hoa','80',7,NULL),('801','Đức Huệ','Duc Hue','Huyện Đức Huệ','Duc Hue District','duc_hue','80',7,NULL),('802','Đức Hòa','Duc Hoa','Huyện Đức Hòa','Duc Hoa District','duc_hoa','80',7,NULL),('803','Bến Lức','Ben Luc','Huyện Bến Lức','Ben Luc District','ben_luc','80',7,NULL),('804','Thủ Thừa','Thu Thua','Huyện Thủ Thừa','Thu Thua District','thu_thua','80',7,NULL),('805','Tân Trụ','Tan Tru','Huyện Tân Trụ','Tan Tru District','tan_tru','80',7,NULL),('806','Cần Đước','Can Duoc','Huyện Cần Đước','Can Duoc District','can_duoc','80',7,NULL),('807','Cần Giuộc','Can Giuoc','Huyện Cần Giuộc','Can Giuoc District','can_giuoc','80',7,NULL),('808','Châu Thành','Chau Thanh','Huyện Châu Thành','Chau Thanh District','chau_thanh','80',7,NULL),('815','Mỹ Tho','My Tho','Thành phố Mỹ Tho','My Tho City','my_tho','82',4,NULL),('816','Gò Công','Go Cong','Thị xã Gò Công','Go Cong Town','go_cong','82',6,NULL),('817','Cai Lậy','Cai Lay','Thị xã Cai Lậy','Cai Lay Town','cai_lay','82',6,NULL),('818','Tân Phước','Tan Phuoc','Huyện Tân Phước','Tan Phuoc District','tan_phuoc','82',7,NULL),('819','Cái Bè','Cai Be','Huyện Cái Bè','Cai Be District','cai_be','82',7,NULL),('820','Cai Lậy','Cai Lay','Huyện Cai Lậy','Cai Lay District','cai_lay','82',7,NULL),('821','Châu Thành','Chau Thanh','Huyện Châu Thành','Chau Thanh District','chau_thanh','82',7,NULL),('822','Chợ Gạo','Cho Gao','Huyện Chợ Gạo','Cho Gao District','cho_gao','82',7,NULL),('823','Gò Công Tây','Go Cong Tay','Huyện Gò Công Tây','Go Cong Tay District','go_cong_tay','82',7,NULL),('824','Gò Công Đông','Go Cong Dong','Huyện Gò Công Đông','Go Cong Dong District','go_cong_dong','82',7,NULL),('825','Tân Phú Đông','Tan Phu Dong','Huyện Tân Phú Đông','Tan Phu Dong District','tan_phu_dong','82',7,NULL),('829','Bến Tre','Ben Tre','Thành phố Bến Tre','Ben Tre City','ben_tre','83',4,NULL),('831','Châu Thành','Chau Thanh','Huyện Châu Thành','Chau Thanh District','chau_thanh','83',7,NULL),('832','Chợ Lách','Cho Lach','Huyện Chợ Lách','Cho Lach District','cho_lach','83',7,NULL),('833','Mỏ Cày Nam','Mo Cay Nam','Huyện Mỏ Cày Nam','Mo Cay Nam District','mo_cay_nam','83',7,NULL),('834','Giồng Trôm','Giong Trom','Huyện Giồng Trôm','Giong Trom District','giong_trom','83',7,NULL),('835','Bình Đại','Binh Dai','Huyện Bình Đại','Binh Dai District','binh_dai','83',7,NULL),('836','Ba Tri','Ba Tri','Huyện Ba Tri','Ba Tri District','ba_tri','83',7,NULL),('837','Thạnh Phú','Thanh Phu','Huyện Thạnh Phú','Thanh Phu District','thanh_phu','83',7,NULL),('838','Mỏ Cày Bắc','Mo Cay Bac','Huyện Mỏ Cày Bắc','Mo Cay Bac District','mo_cay_bac','83',7,NULL),('842','Trà Vinh','Tra Vinh','Thành phố Trà Vinh','Tra Vinh City','tra_vinh','84',4,NULL),('844','Càng Long','Cang Long','Huyện Càng Long','Cang Long District','cang_long','84',7,NULL),('845','Cầu Kè','Cau Ke','Huyện Cầu Kè','Cau Ke District','cau_ke','84',7,NULL),('846','Tiểu Cần','Tieu Can','Huyện Tiểu Cần','Tieu Can District','tieu_can','84',7,NULL),('847','Châu Thành','Chau Thanh','Huyện Châu Thành','Chau Thanh District','chau_thanh','84',7,NULL),('848','Cầu Ngang','Cau Ngang','Huyện Cầu Ngang','Cau Ngang District','cau_ngang','84',7,NULL),('849','Trà Cú','Tra Cu','Huyện Trà Cú','Tra Cu District','tra_cu','84',7,NULL),('850','Duyên Hải','Duyen Hai','Huyện Duyên Hải','Duyen Hai District','duyen_hai','84',7,NULL),('851','Duyên Hải','Duyen Hai','Thị xã Duyên Hải','Duyen Hai Town','duyen_hai','84',6,NULL),('855','Vĩnh Long','Vinh Long','Thành phố Vĩnh Long','Vinh Long City','vinh_long','86',4,NULL),('857','Long Hồ','Long Ho','Huyện Long Hồ','Long Ho District','long_ho','86',7,NULL),('858','Mang Thít','Mang Thit','Huyện Mang Thít','Mang Thit District','mang_thit','86',7,NULL),('859','Vũng Liêm','Vung Liem','Huyện Vũng Liêm','Vung Liem District','vung_liem','86',7,NULL),('860','Tam Bình','Tam Binh','Huyện Tam Bình','Tam Binh District','tam_binh','86',7,NULL),('861','Bình Minh','Binh Minh','Thị xã Bình Minh','Binh Minh Town','binh_minh','86',6,NULL),('862','Trà Ôn','Tra On','Huyện Trà Ôn','Tra On District','tra_on','86',7,NULL),('863','Bình Tân','Binh Tan','Huyện Bình Tân','Binh Tan District','binh_tan','86',7,NULL),('866','Cao Lãnh','Cao Lanh','Thành phố Cao Lãnh','Cao Lanh City','cao_lanh','87',4,NULL),('867','Sa Đéc','Sa Dec','Thành phố Sa Đéc','Sa Dec City','sa_dec','87',4,NULL),('868','Hồng Ngự','Hong Ngu','Thành phố Hồng Ngự','Hong Ngu City','hong_ngu','87',4,NULL),('869','Tân Hồng','Tan Hong','Huyện Tân Hồng','Tan Hong District','tan_hong','87',7,NULL),('870','Hồng Ngự','Hong Ngu','Huyện Hồng Ngự','Hong Ngu District','hong_ngu','87',7,NULL),('871','Tam Nông','Tam Nong','Huyện Tam Nông','Tam Nong District','tam_nong','87',7,NULL),('872','Tháp Mười','Thap Muoi','Huyện Tháp Mười','Thap Muoi District','thap_muoi','87',7,NULL),('873','Cao Lãnh','Cao Lanh','Huyện Cao Lãnh','Cao Lanh District','cao_lanh','87',7,NULL),('874','Thanh Bình','Thanh Binh','Huyện Thanh Bình','Thanh Binh District','thanh_binh','87',7,NULL),('875','Lấp Vò','Lap Vo','Huyện Lấp Vò','Lap Vo District','lap_vo','87',7,NULL),('876','Lai Vung','Lai Vung','Huyện Lai Vung','Lai Vung District','lai_vung','87',7,NULL),('877','Châu Thành','Chau Thanh','Huyện Châu Thành','Chau Thanh District','chau_thanh','87',7,NULL),('883','Long Xuyên','Long Xuyen','Thành phố Long Xuyên','Long Xuyen City','long_xuyen','89',4,NULL),('884','Châu Đốc','Chau Doc','Thành phố Châu Đốc','Chau Doc City','chau_doc','89',4,NULL),('886','An Phú','An Phu','Huyện An Phú','An Phu District','an_phu','89',7,NULL),('887','Tân Châu','Tan Chau','Thị xã Tân Châu','Tan Chau Town','tan_chau','89',6,NULL),('888','Phú Tân','Phu Tan','Huyện Phú Tân','Phu Tan District','phu_tan','89',7,NULL),('889','Châu Phú','Chau Phu','Huyện Châu Phú','Chau Phu District','chau_phu','89',7,NULL),('890','Tịnh Biên','Tinh Bien','Thị xã Tịnh Biên','Tinh Bien Town','tinh_bien','89',6,NULL),('891','Tri Tôn','Tri Ton','Huyện Tri Tôn','Tri Ton District','tri_ton','89',7,NULL),('892','Châu Thành','Chau Thanh','Huyện Châu Thành','Chau Thanh District','chau_thanh','89',7,NULL),('893','Chợ Mới','Cho Moi','Huyện Chợ Mới','Cho Moi District','cho_moi','89',7,NULL),('894','Thoại Sơn','Thoai Son','Huyện Thoại Sơn','Thoai Son District','thoai_son','89',7,NULL),('899','Rạch Giá','Rach Gia','Thành phố Rạch Giá','Rach Gia City','rach_gia','91',4,NULL),('900','Hà Tiên','Ha Tien','Thành phố Hà Tiên','Ha Tien City','ha_tien','91',4,NULL),('902','Kiên Lương','Kien Luong','Huyện Kiên Lương','Kien Luong District','kien_luong','91',7,NULL),('903','Hòn Đất','Hon Dat','Huyện Hòn Đất','Hon Dat District','hon_dat','91',7,NULL),('904','Tân Hiệp','Tan Hiep','Huyện Tân Hiệp','Tan Hiep District','tan_hiep','91',7,NULL),('905','Châu Thành','Chau Thanh','Huyện Châu Thành','Chau Thanh District','chau_thanh','91',7,NULL),('906','Giồng Riềng','Giong Rieng','Huyện Giồng Riềng','Giong Rieng District','giong_rieng','91',7,NULL),('907','Gò Quao','Go Quao','Huyện Gò Quao','Go Quao District','go_quao','91',7,NULL),('908','An Biên','An Bien','Huyện An Biên','An Bien District','an_bien','91',7,NULL),('909','An Minh','An Minh','Huyện An Minh','An Minh District','an_minh','91',7,NULL),('910','Vĩnh Thuận','Vinh Thuan','Huyện Vĩnh Thuận','Vinh Thuan District','vinh_thuan','91',7,NULL),('911','Phú Quốc','Phu Quoc','Thành phố Phú Quốc','Phu Quoc City','phu_quoc','91',4,NULL),('912','Kiên Hải','Kien Hai','Huyện Kiên Hải','Kien Hai District','kien_hai','91',7,NULL),('913','U Minh Thượng','U Minh Thuong','Huyện U Minh Thượng','U Minh Thuong District','u_minh_thuong','91',7,NULL),('914','Giang Thành','Giang Thanh','Huyện Giang Thành','Giang Thanh District','giang_thanh','91',7,NULL),('916','Ninh Kiều','Ninh Kieu','Quận Ninh Kiều','Ninh Kieu District','ninh_kieu','92',5,NULL),('917','Ô Môn','O Mon','Quận Ô Môn','O Mon District','o_mon','92',5,NULL),('918','Bình Thuỷ','Binh Thuy','Quận Bình Thuỷ','Binh Thuy District','binh_thuy','92',5,NULL),('919','Cái Răng','Cai Rang','Quận Cái Răng','Cai Rang District','cai_rang','92',5,NULL),('923','Thốt Nốt','Thot Not','Quận Thốt Nốt','Thot Not District','thot_not','92',5,NULL),('924','Vĩnh Thạnh','Vinh Thanh','Huyện Vĩnh Thạnh','Vinh Thanh District','vinh_thanh','92',7,NULL),('925','Cờ Đỏ','Co Do','Huyện Cờ Đỏ','Co Do District','co_do','92',7,NULL),('926','Phong Điền','Phong Dien','Huyện Phong Điền','Phong Dien District','phong_dien','92',7,NULL),('927','Thới Lai','Thoi Lai','Huyện Thới Lai','Thoi Lai District','thoi_lai','92',7,NULL),('930','Vị Thanh','Vi Thanh','Thành phố Vị Thanh','Vi Thanh City','vi_thanh','93',4,NULL),('931','Ngã Bảy','Nga Bay','Thành phố Ngã Bảy','Nga Bay City','nga_bay','93',4,NULL),('932','Châu Thành A','Chau Thanh A','Huyện Châu Thành A','Chau Thanh A District','chau_thanh_a','93',7,NULL),('933','Châu Thành','Chau Thanh','Huyện Châu Thành','Chau Thanh District','chau_thanh','93',7,NULL),('934','Phụng Hiệp','Phung Hiep','Huyện Phụng Hiệp','Phung Hiep District','phung_hiep','93',7,NULL),('935','Vị Thuỷ','Vi Thuy','Huyện Vị Thuỷ','Vi Thuy District','vi_thuy','93',7,NULL),('936','Long Mỹ','Long My','Huyện Long Mỹ','Long My District','long_my','93',7,NULL),('937','Long Mỹ','Long My','Thị xã Long Mỹ','Long My Town','long_my','93',6,NULL),('941','Sóc Trăng','Soc Trang','Thành phố Sóc Trăng','Soc Trang City','soc_trang','94',4,NULL),('942','Châu Thành','Chau Thanh','Huyện Châu Thành','Chau Thanh District','chau_thanh','94',7,NULL),('943','Kế Sách','Ke Sach','Huyện Kế Sách','Ke Sach District','ke_sach','94',7,NULL),('944','Mỹ Tú','My Tu','Huyện Mỹ Tú','My Tu District','my_tu','94',7,NULL),('945','Cù Lao Dung','Cu Lao Dung','Huyện Cù Lao Dung','Cu Lao Dung District','cu_lao_dung','94',7,NULL),('946','Long Phú','Long Phu','Huyện Long Phú','Long Phu District','long_phu','94',7,NULL),('947','Mỹ Xuyên','My Xuyen','Huyện Mỹ Xuyên','My Xuyen District','my_xuyen','94',7,NULL),('948','Ngã Năm','Nga Nam','Thị xã Ngã Năm','Nga Nam Town','nga_nam','94',6,NULL),('949','Thạnh Trị','Thanh Tri','Huyện Thạnh Trị','Thanh Tri District','thanh_tri','94',7,NULL),('950','Vĩnh Châu','Vinh Chau','Thị xã Vĩnh Châu','Vinh Chau Town','vinh_chau','94',6,NULL),('951','Trần Đề','Tran De','Huyện Trần Đề','Tran De District','tran_de','94',7,NULL),('954','Bạc Liêu','Bac Lieu','Thành phố Bạc Liêu','Bac Lieu City','bac_lieu','95',4,NULL),('956','Hồng Dân','Hong Dan','Huyện Hồng Dân','Hong Dan District','hong_dan','95',7,NULL),('957','Phước Long','Phuoc Long','Huyện Phước Long','Phuoc Long District','phuoc_long','95',7,NULL),('958','Vĩnh Lợi','Vinh Loi','Huyện Vĩnh Lợi','Vinh Loi District','vinh_loi','95',7,NULL),('959','Giá Rai','Gia Rai','Thị xã Giá Rai','Gia Rai Town','gia_rai','95',6,NULL),('960','Đông Hải','Dong Hai','Huyện Đông Hải','Dong Hai District','dong_hai','95',7,NULL),('961','Hoà Bình','Hoa Binh','Huyện Hoà Bình','Hoa Binh District','hoa_binh','95',7,NULL),('964','Cà Mau','Ca Mau','Thành phố Cà Mau','Ca Mau City','ca_mau','96',4,NULL),('966','U Minh','U Minh','Huyện U Minh','U Minh District','u_minh','96',7,NULL),('967','Thới Bình','Thoi Binh','Huyện Thới Bình','Thoi Binh District','thoi_binh','96',7,NULL),('968','Trần Văn Thời','Tran Van Thoi','Huyện Trần Văn Thời','Tran Van Thoi District','tran_van_thoi','96',7,NULL),('969','Cái Nước','Cai Nuoc','Huyện Cái Nước','Cai Nuoc District','cai_nuoc','96',7,NULL),('970','Đầm Dơi','Dam Doi','Huyện Đầm Dơi','Dam Doi District','dam_doi','96',7,NULL),('971','Năm Căn','Nam Can','Huyện Năm Căn','Nam Can District','nam_can','96',7,NULL),('972','Phú Tân','Phu Tan','Huyện Phú Tân','Phu Tan District','phu_tan','96',7,NULL),('973','Ngọc Hiển','Ngoc Hien','Huyện Ngọc Hiển','Ngoc Hien District','ngoc_hien','96',7,NULL);
/*!40000 ALTER TABLE `districts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_import_rows`
--

DROP TABLE IF EXISTS `failed_import_rows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_import_rows` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `data` json NOT NULL,
  `import_id` bigint(20) unsigned NOT NULL,
  `validation_error` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `failed_import_rows_import_id_foreign` (`import_id`),
  CONSTRAINT `failed_import_rows_import_id_foreign` FOREIGN KEY (`import_id`) REFERENCES `imports` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_import_rows`
--

LOCK TABLES `failed_import_rows` WRITE;
/*!40000 ALTER TABLE `failed_import_rows` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_import_rows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filament_email_log`
--

DROP TABLE IF EXISTS `filament_email_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `filament_email_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `from` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `to` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bcc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text_body` longtext COLLATE utf8mb4_unicode_ci,
  `html_body` longtext COLLATE utf8mb4_unicode_ci,
  `raw_body` longtext COLLATE utf8mb4_unicode_ci,
  `sent_debug_info` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filament_email_log`
--

LOCK TABLES `filament_email_log` WRITE;
/*!40000 ALTER TABLE `filament_email_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `filament_email_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imports`
--

DROP TABLE IF EXISTS `imports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imports` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `completed_at` timestamp NULL DEFAULT NULL,
  `file_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `importer` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `processed_rows` int(10) unsigned NOT NULL DEFAULT '0',
  `total_rows` int(10) unsigned NOT NULL,
  `successful_rows` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `imports_user_id_foreign` (`user_id`),
  CONSTRAINT `imports_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imports`
--

LOCK TABLES `imports` WRITE;
/*!40000 ALTER TABLE `imports` DISABLE KEYS */;
/*!40000 ALTER TABLE `imports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_batches`
--

LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `collection_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disk` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `conversions_disk` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` bigint(20) unsigned NOT NULL,
  `manipulations` json NOT NULL,
  `custom_properties` json NOT NULL,
  `generated_conversions` json NOT NULL,
  `responsive_images` json NOT NULL,
  `order_column` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `media_uuid_unique` (`uuid`),
  KEY `media_model_type_model_id_index` (`model_type`,`model_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_reset_tokens_table',1),(3,'2014_10_12_100000_create_password_resets_table',1),(4,'2019_08_19_000000_create_failed_jobs_table',1),(5,'2019_12_14_000001_create_personal_access_tokens_table',1),(6,'2021_12_13_055514_create_media_table',1),(7,'2021_12_13_072541_create_tag_tables',1),(8,'2021_12_13_072624_create_settings_table',1),(9,'2021_12_13_073001_create_blog_authors_table',1),(10,'2021_12_13_073006_create_blog_categories_table',1),(11,'2021_12_13_073022_create_blog_posts_table',1),(12,'2021_12_13_155621_create_shop_categories_table',1),(13,'2021_12_13_164316_create_shop_brands_table',1),(14,'2021_12_13_164519_create_shop_products_table',1),(15,'2021_12_13_164524_create_shop_category_product_table',2),(16,'2021_12_13_165855_create_shop_orders_table',3),(17,'2021_12_13_182904_create_shop_order_items_table',3),(18,'2022_04_18_132920_create_navigations_table',3),(19,'2022_04_21_203420_make_items_longtext_on_navigations_table',3),(20,'2022_06_01_232533_alter_order_items_add_sort_column',3),(21,'2022_06_09_091930_create_comments_table',4),(22,'2022_06_09_092322_create_payments_table',4),(23,'2022_06_09_155042_create_addressable_table',4),(24,'2022_09_10_131605_create_notifications_table',4),(25,'2022_10_27_140431_create_teams_table',4),(26,'2023_11_06_210743_create_wishlist_table',4),(27,'2023_11_29_144716_create_job_batches_table',4),(28,'2023_11_29_144720_create_imports_table',4),(29,'2023_11_29_144721_create_failed_import_rows_table',4),(30,'2023_12_14_142331_create_default_pages_table',4),(31,'2023_12_14_142332_create_default_translatable_pages_table',4),(32,'2023_12_15_090208_create_activity_log_table',4),(33,'2023_12_15_090209_add_event_column_to_activity_log_table',4),(34,'2023_12_15_090210_add_batch_uuid_column_to_activity_log_table',4),(35,'2023_12_15_105314_create_authentication_log_table',4),(36,'2023_12_16_051653_create_filament_email_table',4),(37,'2023_12_16_053450_create_general_settings',4),(38,'2023_12_16_075110_create_permission_tables',4),(39,'2023_12_18_145938_create_shop_product_variants_table',4),(40,'2023_12_20_125004_update_general_settings',4),(41,'2023_12_20_125019_create_shop_settings',4),(42,'2023_12_20_125936_update_shop_settings',4),(43,'2023_12_21_103950_create_shop_sliders_table',4),(44,'2023_12_21_125546_create_shop_collections_table',4),(45,'2023_12_21_125716_create_shop_collection_product_table',4),(46,'2023_12_25_092211_add_content_to_shop_products_table',4),(47,'2023_12_25_141318_add_add_name_to_addresses_table',4),(48,'2023_12_26_040505_add_shipping_method_settings',4),(49,'2023_12_26_053525_add_shop_payment_method_settings',4),(50,'2023_12_26_140300_add_columns_to_users_table',4),(51,'2023_12_26_141428_add_columns_to_addresses_table',4),(52,'2023_12_26_143038_add_columns_to_shop_orders_table',5),(53,'2023_12_27_060810_add_soft_delete_to_users_table',5),(54,'2023_12_27_125025_add_code_to_pages_table',5),(55,'2023_12_28_125955_create_contact_requests_table',5),(56,'2023_12_29_082745_add_featured_to_blog_posts_table',5),(57,'2023_12_31_141830_add_copyright_setting',5),(58,'2024_01_02_195359_add_old_price_to_shop_product_variants_table',5),(59,'2024_01_09_101218_add_is_alt_style_to_slider_items_table',5),(60,'2024_01_09_170343_add_is_featured_to_shop_categories_table',5),(61,'2024_01_09_184422_add_slider_id_to_collections_table',6),(62,'2024_01_21_140014_create_footer_settings',6),(63,'2024_01_27_140344_add_columns_to_sliders_table',6),(65,'2024_10_28_193212_add_subtotal_to_shop_order_items_table',7);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_permissions`
--

DROP TABLE IF EXISTS `model_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_permissions`
--

LOCK TABLES `model_has_permissions` WRITE;
/*!40000 ALTER TABLE `model_has_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `model_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_roles`
--

DROP TABLE IF EXISTS `model_has_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_roles`
--

LOCK TABLES `model_has_roles` WRITE;
/*!40000 ALTER TABLE `model_has_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `model_has_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `navigations`
--

DROP TABLE IF EXISTS `navigations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `navigations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `items` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `navigations_handle_unique` (`handle`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `navigations`
--

LOCK TABLES `navigations` WRITE;
/*!40000 ALTER TABLE `navigations` DISABLE KEYS */;
INSERT INTO `navigations` VALUES (1,'Main Navigation','main','{\"ea7402ca-1aaf-41d6-afef-718229988c75\":{\"label\":\"TRANG CH\\u1ee6\",\"type\":null,\"children\":[],\"data\":{\"icon\":null,\"classes\":null,\"url\":\"\",\"target\":\"\"}},\"403a88ae-8a91-4445-bab6-18be10015a11\":{\"label\":\"GI\\u1edaI THI\\u1ec6U\",\"type\":\"internal-link\",\"data\":{\"url\":\"\\/gioi-thieu-ve-gemq\",\"target\":\"\",\"icon\":null,\"classes\":\"gioi-thieu-ve-gemq\"},\"children\":[]},\"95b9a7e5-3edc-4be1-b71c-834d20cce7f4\":{\"label\":\"D\\u1ecaCH V\\u1ee4\",\"type\":\"external-link\",\"data\":{\"url\":\"#\",\"icon\":null,\"classes\":null,\"target\":\"\"},\"children\":{\"f31e62c9-f54c-4090-b1cb-aaac17bb8627\":{\"label\":\"GIA C\\u00d4NG S\\u01a0N T\\u0128NH \\u0110I\\u1ec6N\",\"type\":\"page\",\"data\":{\"url\":\"\\/gia-cong-son-tinh-dien\",\"icon\":null,\"classes\":null},\"children\":[]},\"516b0e4a-25bf-445d-81b2-efbbf34e0d29\":{\"label\":\"GIA C\\u00d4NG C\\u1eaeT LAZER CNC\",\"type\":\"page\",\"data\":{\"url\":\"\\/gia-cong-cat-laser-cnc\",\"icon\":null,\"classes\":null},\"children\":[]},\"b0f35300-f2bf-4d73-867f-655c6597fdf1\":{\"label\":\"GIA C\\u00d4NG \\u0110\\u1ed8T CNC\",\"type\":\"page\",\"data\":{\"url\":\"\\/gia-cong-dot-cnc\",\"icon\":null,\"classes\":null},\"children\":[]},\"18032d62-0d4a-47a6-88ab-dc18e0cd5122\":{\"label\":\"GIA C\\u00d4NG CH\\u1ea4N CNC\",\"type\":\"page\",\"data\":{\"url\":\"\\/gia-cong-chan-cnc\",\"icon\":null,\"classes\":null},\"children\":[]},\"992a071c-33d9-48d1-90a2-6270356e882a\":{\"label\":\"GIA C\\u00d4NG H\\u00c0N\",\"type\":\"page\",\"data\":{\"url\":\"\\/gia-cong-han\",\"target\":\"\",\"icon\":null,\"classes\":null},\"children\":[]}}},\"91d77690-eab4-4dfc-8a90-0a5ac54d245a\":{\"label\":\"D\\u1ef0 \\u00c1N\",\"type\":\"route\",\"data\":{\"url\":\"shop.index\",\"target\":\"\",\"icon\":null,\"classes\":null},\"children\":[]},\"790ee127-a891-4c47-9ac6-365523d6cc28\":{\"label\":\"TIN T\\u1ee8C CHUY\\u00caN NG\\u00c0NH\",\"type\":\"route\",\"data\":{\"url\":\"blog\",\"icon\":null,\"classes\":null},\"children\":[]},\"074e785c-649e-4bb9-b732-767c5dfb8d08\":{\"label\":\"LI\\u00caN H\\u1ec6\",\"type\":\"page\",\"data\":{\"url\":\"\\/lien-he\",\"target\":\"\",\"icon\":null,\"classes\":null},\"children\":[]}}','2023-12-20 22:23:00','2024-05-09 00:17:08'),(2,'Footer links','footer-links','{\"8d6394ad-5743-4c1e-9579-ab59cfdf6b54\":{\"label\":\"Quy \\u0111\\u1ecbnh v\\u00e0 ch\\u00ednh s\\u00e1ch\",\"type\":null,\"data\":{\"icon\":null,\"classes\":null},\"children\":{\"4fd1481a-b7ca-4f13-bf13-3db3d0653d2c\":{\"label\":\"Ch\\u00ednh s\\u00e1ch thanh to\\u00e1n\",\"type\":\"internal-link\",\"data\":{\"icon\":null,\"classes\":null,\"url\":\"chinh-sach-thanh-toan\"},\"children\":[]},\"e391fea8-b7ff-4ecb-b062-95d69b699df9\":{\"label\":\"Ch\\u00ednh s\\u00e1ch v\\u1eadn chuy\\u1ec3n\",\"type\":\"internal-link\",\"data\":{\"icon\":null,\"classes\":\"chinh-sach-van-chuyen\",\"url\":\"chinh-sach-van-chuyen\",\"target\":\"\"},\"children\":[]},\"a2fcd001-7c00-4d73-99f4-b8943f1a7bc0\":{\"label\":\"Ch\\u00ednh s\\u00e1ch b\\u1ea3o h\\u00e0nh\",\"type\":\"internal-link\",\"data\":{\"icon\":null,\"classes\":null,\"url\":\"chinh-sach-bao-hanh\"},\"children\":[]},\"18888e75-c1de-4e97-a890-c095197d46d8\":{\"label\":\"Ch\\u00ednh s\\u00e1ch b\\u1ea3o m\\u1eadt th\\u00f4ng tin\",\"type\":\"internal-link\",\"data\":{\"icon\":null,\"classes\":null,\"url\":\"chinh-sach-bao-mat-thong-tin\"},\"children\":[]},\"e576bf1e-658d-493d-acd7-4f2dc46a2e7f\":{\"label\":\"H\\u01b0\\u1edbng d\\u1eabn mua h\\u00e0ng\",\"type\":\"internal-link\",\"data\":{\"icon\":null,\"classes\":null,\"url\":\"huong-dan-mua-hang\"},\"children\":[]}}},\"5fa10fd8-09a5-4d50-8dbb-a441aba493a3\":{\"label\":\"D\\u1ecbch v\\u1ee5 ch\\u00ednh GEMQ\",\"type\":null,\"data\":{\"icon\":null,\"classes\":null},\"children\":{\"d38b574d-3daf-4f52-8ee9-d42bd4116e0e\":{\"label\":\"Gia c\\u00f4ng s\\u01a1n t\\u0129nh \\u0111i\\u1ec7n\",\"type\":\"page\",\"data\":{\"icon\":null,\"classes\":null,\"url\":\"\\/gia-cong-son-tinh-dien\"},\"children\":[]},\"6cc83bcb-f34f-41c4-8541-174d531a8b2d\":{\"label\":\"Gia c\\u00f4ng c\\u1eaft lazer\",\"type\":\"page\",\"data\":{\"icon\":null,\"classes\":null,\"url\":\"\\/gia-cong-cat-laser-cnc\"},\"children\":[]},\"dd57546d-7bbb-4af8-bbee-0266ca592d79\":{\"label\":\"Gia c\\u00f4ng \\u0111\\u1ed9t CNC\",\"type\":\"page\",\"data\":{\"icon\":null,\"classes\":null,\"url\":\"\\/gia-cong-dot-cnc\"},\"children\":[]},\"555e97c3-f20d-4709-957e-d3c13125e7f6\":{\"label\":\"Gia c\\u00f4ng ch\\u1ea5n CNC\",\"type\":\"page\",\"data\":{\"icon\":null,\"classes\":null,\"url\":\"\\/gia-cong-chan-cnc\"},\"children\":[]},\"afc2a88a-2fcf-4435-8b1d-00202f9b733e\":{\"label\":\"Gia c\\u00f4ng h\\u00e0n robot, h\\u00e0n lazer, h\\u00e0n tig, h\\u00e0n mig\",\"type\":\"page\",\"data\":{\"icon\":null,\"classes\":null,\"url\":\"\\/gia-cong-han\"},\"children\":[]}}},\"b8583433-5b96-4c36-8932-cc80a983581d\":{\"label\":\"Th\\u00f4ng tin\",\"type\":null,\"data\":{\"icon\":null,\"classes\":null},\"children\":{\"45424325-b933-4255-a5be-9d54ade5466c\":{\"label\":\"Tin t\\u1ee9c chuy\\u00ean ng\\u00e0nh\",\"type\":\"route\",\"data\":{\"icon\":null,\"classes\":null,\"url\":\"blog\"},\"children\":[]}}}}','2023-12-30 19:06:53','2024-05-09 01:31:46');
/*!40000 ALTER TABLE `navigations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) unsigned NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `intro` text COLLATE utf8mb4_unicode_ci,
  `hero_image_copyright` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hero_image_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `publishing_begins_at` timestamp NULL DEFAULT NULL,
  `publishing_ends_at` timestamp NULL DEFAULT NULL,
  `seo_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_description` text COLLATE utf8mb4_unicode_ci,
  `seo_keywords` json DEFAULT NULL,
  `overview_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `overview_description` text COLLATE utf8mb4_unicode_ci,
  `content_blocks` json DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `author_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pages_publishing_begins_at_index` (`publishing_begins_at`),
  KEY `pages_publishing_ends_at_index` (`publishing_ends_at`),
  KEY `pages_author_id_foreign` (`author_id`),
  CONSTRAINT `pages_author_id_foreign` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES (1,'{\"en\":\"Contact\",\"vi\":\"Contact\"}','contact-page','{\"vi\":\"\"}',NULL,NULL,NULL,NULL,'{\"vi\":\"\"}','{\"vi\":\"\"}','{\"en\": [], \"vi\": []}','{\"vi\":\"\"}','{\"vi\":\"\"}','{\"en\": [{\"data\": {\"title\": \"Liên hệ chúng tôi\", \"content\": \"<h1><strong>C&ocirc;ng ty TNHH GEMQ</strong></h1>\\n<p><strong>Địa chỉ: 621 Xa Lộ H&agrave; Nội, Phường Linh Trung, Th&agrave;nh phố Thủ Đức, Th&agrave;nh phố Hồ Ch&iacute; Minh</strong></p>\\n<p><strong>Hotline: 0888404066</strong></p>\\n<p><strong>Website: www.gemq.vn</strong></p>\\n<p><strong>Email: gemqcompany@gmail.com</strong></p>\", \"custom_classes\": null, \"container_width\": null}, \"type\": \"Text\"}, {\"data\": {\"template\": \"partials.contact-form\"}, \"type\": \"filament-flexible-content-blocks::template\"}], \"vi\": []}','{\"en\":\"lien-he\",\"vi\":\"contact\"}',1,'2023-12-27 05:51:58','2024-05-09 01:09:27'),(2,'{\"en\":\"Privacy Policy\"}',NULL,'{\"en\":null}',NULL,NULL,NULL,NULL,'{\"en\":null}','{\"en\":null}','{\"en\": [], \"vi\": []}',NULL,NULL,'{\"en\": [{\"data\": {\"title\": null, \"content\": \"<h1>Privacy Policy for Best Of Network</h1><p>Last updated:</p><p>Best Of Network (\\\"us\\\", \\\"we\\\", or \\\"our\\\") operates the https://bestoftailwind.com website (the \\\"Service\\\").</p><p>This page informs you of our policies regarding the collection, use, and disclosure of personal data when you use our Service and the choices you have associated with that data. Our Privacy Policy for Best Of Network is created with the help of the Free Privacy Policy website.</p><p>We use your data to provide and improve the Service. By using the Service, you agree to the collection and use of information in accordance with this policy. Unless otherwise defined in this Privacy Policy, terms used in this Privacy Policy have the same meanings as in our Terms and Conditions, accessible from https://bestoftailwind.com</p><h2>Information Collection And Use</h2><p>We collect several different types of information for various purposes to provide and improve our Service to you.</p><h3>Types of Data Collected</h3><p><strong><br>Personal Data</strong></p><p>While using our Service, we may ask you to provide us with certain personally identifiable information that can be used to contact or identify you (\\\"Personal Data\\\"). Personally identifiable information may include, but is not limited to:</p><ul><li>Email address</li><li>First name and last name</li><li>Phone number</li><li>Address, State, Province, ZIP/Postal code, City</li><li>Cookies and Usage Data</li></ul><p><strong><br>Usage Data</strong></p><p>We may also collect information how the Service is accessed and used (\\\"Usage Data\\\"). This Usage Data may include information such as your computer\'s Internet Protocol address (e.g. IP address), browser type, browser version, the pages of our Service that you visit, the time and date of your visit, the time spent on those pages, unique device identifiers and other diagnostic data.</p><p><strong><br>Tracking &amp; Cookies Data</strong></p><p>We use cookies and similar tracking technologies to track the activity on our Service and hold certain information.</p><p>Cookies are files with small amount of data which may include an anonymous unique identifier. Cookies are sent to your browser from a website and stored on your device. Tracking technologies also used are beacons, tags, and scripts to collect and track information and to improve and analyze our Service.</p><p>You can instruct your browser to refuse all cookies or to indicate when a cookie is being sent. However, if you do not accept cookies, you may not be able to use some portions of our Service.</p><p>Examples of Cookies we use:</p><ul><li><strong>Session Cookies.</strong> We use Session Cookies to operate our Service.</li><li><strong>Preference Cookies.</strong> We use Preference Cookies to remember your preferences and various settings.</li><li><strong>Security Cookies.</strong> We use Security Cookies for security purposes.</li></ul><h2>Use of Data</h2><p>Best Of Network uses the collected data for various purposes:</p><ul><li>To provide and maintain the Service</li><li>To notify you about changes to our Service</li><li>To allow you to participate in interactive features of our Service when you choose to do so</li><li>To provide customer care and support</li><li>To provide analysis or valuable information so that we can improve the Service</li><li>To monitor the usage of the Service</li><li>To detect, prevent and address technical issues</li></ul><h2>Transfer Of Data</h2><p>Your information, including Personal Data, may be transferred to — and maintained on — computers located outside of your state, province, country or other governmental jurisdiction where the data protection laws may differ than those from your jurisdiction.</p><p>If you are located outside United States and choose to provide information to us, please note that we transfer the data, including Personal Data, to United States and process it there.</p><p>Your consent to this Privacy Policy followed by your submission of such information represents your agreement to that transfer.</p><p>Best Of Network will take all steps reasonably necessary to ensure that your data is treated securely and in accordance with this Privacy Policy and no transfer of your Personal Data will take place to an organization or a country unless there are adequate controls in place including the security of your data and other personal information.</p><h2>Disclosure Of Data</h2><h3>Legal Requirements</h3><p>Best Of Network may disclose your Personal Data in the good faith belief that such action is necessary to:</p><ul><li>To comply with a legal obligation</li><li>To protect and defend the rights or property of Best Of Network</li><li>To prevent or investigate possible wrongdoing in connection with the Service</li><li>To protect the personal safety of users of the Service or the public</li><li>To protect against legal liability</li></ul><h2>Security Of Data</h2><p>The security of your data is important to us, but remember that no method of transmission over the Internet, or method of electronic storage is 100% secure. While we strive to use commercially acceptable means to protect your Personal Data, we cannot guarantee its absolute security.</p><h2>Information Regarding Your Data Protection Rights Under General Data Protection Regulation (GDPR)</h2><p>For the purpose of this Privacy Policy, we are a Data Controller of your personal information.</p><p>If you are from the European Economic Area (EEA), our legal basis for collecting and using your personal information, as described in this Privacy Policy, depends on the information we collect and the specific context in which we collect it. We may process your personal information because:</p><ul><li>We need to perform a contract with you, such as when you use our services</li><li>You have given us permission to do so</li><li>The processing is in our legitimate interests and it\'s not overridden by your rights</li><li>For payment processing purposes</li><li>To comply with the law</li></ul><p>If you are a resident of the European Economic Area (EEA), you have certain data protection rights. In certain circumstances, you have the following data protection rights:</p><ul><li>The right to access, update or to delete the personal information we have on you</li><li>The right of rectification</li><li>The right to object</li><li>The right of restriction</li><li>The right to data portability</li><li>The right to withdraw consent</li></ul><p>Please note that we may ask you to verify your identity before responding to such requests.</p><p>You have the right to complain to a Data Protection Authority about our collection and use of your personal information. For more information, please contact your local data protection authority in the European Economic Area (EEA).</p><h2>Service Providers</h2><p>We may employ third party companies and individuals to facilitate our Service (\\\"Service Providers\\\"), to provide the Service on our behalf, to perform Service-related services or to assist us in analyzing how our Service is used.</p><p>These third parties have access to your Personal Data only to perform these tasks on our behalf and are obligated not to disclose or use it for any other purpose.</p><h3>Analytics</h3><p>We may use third-party Service Providers to monitor and analyze the use of our Service.</p><ul><li><strong>Google Analytics</strong></li><li>Google Analytics is a web analytics service offered by Google that tracks and reports website traffic. Google uses the data collected to track and monitor the use of our Service. This data is shared with other Google services. Google may use the collected data to contextualize and personalize the ads of its own advertising network.</li><li>You can opt-out of having made your activity on the Service available to Google Analytics by installing the Google Analytics opt-out browser add-on. The add-on prevents the Google Analytics JavaScript (ga.js, analytics.js, and dc.js) from sharing information with Google Analytics about visits activity.</li><li>For more information on the privacy practices of Google, please visit the Google Privacy &amp; Terms web page: <a href=\\\"https://policies.google.com/privacy?hl=en\\\"><strong style=\\\"text-decoration: underline;\\\">https://policies.google.com/privacy?hl=en</strong></a></li><li><strong>Payments processors</strong></li><li>We provide paid products and/or services on our Website. We use third-party services for payment processing (e.g. payment processors).</li><li>We will not store or collect your payment card details. That information is provided directly to our third-party payment processors whose use of your personal information is governed by their Privacy Policy. These payment processors adhere to the standards set by PCI-DSS as managed by the PCI Security Standards Council.</li></ul><h2>Links To Other Sites</h2><p>Our Service may contain links to other sites that are not operated by us. If you click on a third party link, you will be directed to that third party\'s site. We strongly advise you to review the Privacy Policy of every site you visit.</p><p>We have no control over and assume no responsibility for the content, privacy policies or practices of any third party sites or services.</p><h2>Children\'s Privacy</h2><p>Our Service does not address anyone under the age of 18 (\\\"Children\\\").</p><p>We do not knowingly collect personally identifiable information from anyone under the age of 18. If you are a parent or guardian and you are aware that your Children has provided us with Personal Data, please contact us. If we become aware that we have collected Personal Data from children without verification of parental consent, we take steps to remove that information from our servers.</p><h2>Changes To This Privacy Policy</h2><p>We may update our Privacy Policy from time to time. We will notify you of any changes by posting the new Privacy Policy on this page.</p><p>We will let you know via email and/or a prominent notice on our Service, prior to the change becoming effective and update the \\\"effective date\\\" at the top of this Privacy Policy.</p><p>You are advised to review this Privacy Policy periodically for any changes. Changes to this Privacy Policy are effective when they are posted on this page.</p><h2>Contact Us</h2><p>If you have any questions about this Privacy Policy, please contact us:</p><ul><li>By email: bestofsites2@gmail.com</li><li>By visiting this page on our website: <a href=\\\"https://bestoftailwind.com/contact\\\"><strong style=\\\"text-decoration: underline;\\\">https://bestoftailwind.com/contact</strong></a></li></ul><p><br></p>\", \"block_style\": \"default\", \"background_colour\": \"default\"}, \"type\": \"filament-flexible-content-blocks::text\"}, {\"data\": {\"title\": \"Privacy Policy\", \"content\": \"<p>[Your Company Name] is committed to protecting the privacy of its users. This Privacy Policy describes how [Your Company Name] collects, uses, and shares personal information gathered through our website and services.</p><h3><strong>1. Information We Collect</strong></h3><p>We may collect personal information such as names, email addresses, and other relevant details when voluntarily provided by users. Additionally, we may automatically collect certain information about the devices used to access our services.</p><h3><strong>2. How We Use Information</strong></h3><p>We use the collected information to provide and improve our services, communicate with users, and personalize their experience. We may also use the information for research and analytics.</p><h3><strong>3. Information Sharing</strong></h3><p>We do not sell, trade, or otherwise transfer users\' personal information to third parties without consent. However, we may share information with trusted third parties who assist us in operating our website, conducting business, or servicing users.</p><h3><strong>4. Security Measures</strong></h3><p>We implement a variety of security measures to maintain the safety of users\' personal information.</p><h3><strong>5. Cookies</strong></h3><p>We use cookies to enhance user experience and track website usage. Users can choose to set their web browser to refuse cookies or alert them when cookies are being sent.</p><h3><strong>6. Your Consent</strong></h3><p>By using our website, you consent to our privacy policy.</p><h3><strong>7. Changes to This Privacy Policy</strong></h3><p>We reserve the right to update or change our privacy policy at any time. Users will be notified of any changes on this page.</p><h3><strong>8. Contact Information</strong></h3><p>If there are any questions regarding this privacy policy, you may contact us using the information below:</p><p><em>[Your Company Name]<br>[Your Contact Information]<br>[Your Email Address]</em></p>\", \"custom_classes\": null, \"container_width\": \"container\"}, \"type\": \"Text\"}], \"vi\": []}','{\"en\":\"privacy-policy\"}',1,'2023-12-28 07:26:28','2024-01-30 07:02:34'),(3,'{\"en\":\"Home page\"}','home','{\"en\":null}',NULL,NULL,NULL,NULL,'{\"en\":null}','{\"en\":null}','{\"en\": []}',NULL,NULL,'{\"en\": [{\"data\": {\"title\": null, \"slider_id\": \"1\", \"custom_classes\": null, \"container_width\": \"container-fluid\"}, \"type\": \"Slider\"}, {\"data\": {\"title\": \"Dịch vụ chính\", \"category_ids\": [\"8\", \"9\", \"10\", \"11\", \"12\", \"13\"], \"custom_classes\": null, \"container_width\": \"container\"}, \"type\": \"Categories\"}, {\"data\": {\"collection_id\": \"5\", \"custom_classes\": \"bg-main-50\", \"container_width\": \"container-fluid\"}, \"type\": \"Product Collection\"}, {\"data\": {\"title\": \"Điểm mạnh của GEMQ\", \"columns\": [{\"content_blocks\": [{\"data\": {\"title\": null, \"content\": \"<p>Tại sao nên chọn chúng tôi? Vì chúng tôi mang đến:</p><p>🌟 <strong>Chất lượng hàng đầu</strong>: Sản phẩm của chúng tôi được sản xuất với công nghệ tiên tiến và quy trình kiểm soát chất lượng nghiêm ngặt.</p><p>🔧 <strong>Linh hoạt và đa dạng</strong>: Chúng tôi linh hoạt trong việc đáp ứng mọi yêu cầu sản xuất của bạn, từ nhỏ đến lớn, đơn giản đến phức tạp.</p><p>👨‍🔧 <strong>Đội ngũ chuyên gia</strong>: Đội ngũ kỹ thuật viên giàu kinh nghiệm của chúng tôi luôn sẵn lòng hỗ trợ và tư vấn.</p><p>🔄 <strong>Dịch vụ toàn diện</strong>: Bạn sẽ nhận được không chỉ sản phẩm xuất sắc mà còn sự tiện lợi từ các dịch vụ bổ sung như thiết kế và kiểm tra chất lượng.</p><p>Chọn chúng tôi là chọn sự đảm bảo và chất lượng!</p>\", \"custom_classes\": \"py-10\", \"container_width\": \"container\"}, \"type\": \"Text\"}]}, {\"content_blocks\": [{\"data\": {\"title\": null, \"content\": \"<p>&nbsp;</p>\\n<figure class=\\\"attachment attachment--preview attachment--gif\\\" data-trix-attachment=\\\"{&quot;contentType&quot;:&quot;image/gif&quot;,&quot;filename&quot;:&quot;gt.gif&quot;,&quot;filesize&quot;:409728,&quot;height&quot;:442,&quot;href&quot;:&quot;http://localhost:8000/storage/SwS95DhwRoZf1AClJyCObVg9mwILmDq8ETgz8skx.gif&quot;,&quot;url&quot;:&quot;http://localhost:8000/storage/SwS95DhwRoZf1AClJyCObVg9mwILmDq8ETgz8skx.gif&quot;,&quot;width&quot;:600}\\\" data-trix-content-type=\\\"image/gif\\\" data-trix-attributes=\\\"{&quot;presentation&quot;:&quot;gallery&quot;}\\\"><a href=\\\"/storage/SwS95DhwRoZf1AClJyCObVg9mwILmDq8ETgz8skx.gif\\\"><img src=\\\"/storage/SwS95DhwRoZf1AClJyCObVg9mwILmDq8ETgz8skx.gif\\\" width=\\\"600\\\" height=\\\"442\\\"></a></figure>\\n<p>&nbsp;</p>\", \"custom_classes\": null, \"container_width\": \"container\"}, \"type\": \"Text\"}]}], \"block_style\": \"default\", \"grid_columns\": \"2\", \"custom_classes\": \"py-10\", \"container_width\": \"container\", \"background_colour\": \"default\"}, \"type\": \"Grid\"}, {\"data\": {\"title\": \"Đối tác tin cậy\", \"columns\": [{\"content_blocks\": [{\"data\": {\"title\": null, \"custom_classes\": null, \"container_width\": \"container\"}, \"type\": \"Brand Logo Slider\"}]}, {\"content_blocks\": [{\"data\": {\"title\": null, \"content\": null, \"custom_classes\": null, \"container_width\": \"container\"}, \"type\": \"Contact Form\"}]}], \"block_style\": \"default\", \"grid_columns\": \"2\", \"custom_classes\": \"py-10 bg-main-50\", \"container_width\": \"container-fluid\", \"background_colour\": \"default\"}, \"type\": \"Grid\"}, {\"data\": {\"slider_id\": \"2\"}, \"type\": \"Two Columns Banner\"}, {\"data\": {\"category_ids\": [\"2\", \"3\", \"4\", \"5\", \"6\"]}, \"type\": \"Top Categories\"}, {\"data\": {\"title\": \"Khách hàng nói gì về GEMQ\", \"custom_classes\": \"py-10\", \"container_width\": \"container\"}, \"type\": \"Testimonials\"}]}','{\"en\":\"home-page\"}',1,'2024-01-23 12:47:55','2024-03-28 12:45:46'),(4,'{\"en\":\"H\\u01b0\\u1edbng d\\u1eabn mua h\\u00e0ng\"}','huong-dan-mua-hang',NULL,NULL,NULL,NULL,NULL,'{\"en\":\"H\\u01b0\\u1edbng d\\u1eabn mua h\\u00e0ng t\\u1ea1i Gemq\"}','{\"en\":\"Chi ti\\u1ebft v\\u1ec1 h\\u01b0\\u1edbng d\\u1eabn mua h\\u00e0ng, \\u0111\\u1eb7t \\u0111\\u01a1n h\\u00e0ng gia c\\u00f4ng t\\u1ea1i c\\u00f4ng ty Gemq\"}','{\"en\": \"hướng dẫn mua hàng\"}',NULL,NULL,'{\"en\": [{\"data\": {\"title\": null, \"content\": \"<h2 dir=\\\"ltr\\\">1. C&aacute;ch gia c&ocirc;ng, đặt đơn h&agrave;ng tại Gemq</h2>\\n<h3 dir=\\\"ltr\\\">1.1. Mua h&agrave;ng trực tiếp</h3>\\n<p dir=\\\"ltr\\\">Qu&yacute; kh&aacute;ch h&agrave;ng đến trực tiếp cửa h&agrave;ng của GEMQ để tham quan, lựa chọn sản phẩm v&agrave; thanh to&aacute;n. Địa chỉ cửa h&agrave;ng: 621 Xa Lộ H&agrave; Nội, Phường Linh Trung, TP. Thủ Đức, TP.HCM, Việt Nam.</p>\\n<h3 dir=\\\"ltr\\\">1.2. Mua h&agrave;ng qua website</h3>\\n<ul>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\">Truy cập website www.gemq.vn v&agrave; lựa chọn sản phẩm muốn mua.</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\">Th&ecirc;m sản phẩm v&agrave;o giỏ h&agrave;ng v&agrave; điền đầy đủ th&ocirc;ng tin thanh to&aacute;n v&agrave; giao h&agrave;ng.</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\">Chọn phương thức thanh to&aacute;n v&agrave; ho&agrave;n tất đơn h&agrave;ng.</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\">GEMQ sẽ li&ecirc;n hệ với qu&yacute; kh&aacute;ch h&agrave;ng để x&aacute;c nhận đơn h&agrave;ng v&agrave; tiến h&agrave;nh giao h&agrave;ng.</p>\\n</li>\\n</ul>\\n<h3 dir=\\\"ltr\\\">1.3. Mua h&agrave;ng qua điện thoại</h3>\\n<ul>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\">Gọi điện thoại hoặc zalo đến số 0888.4040.66 để được tư vấn v&agrave; đặt h&agrave;ng.</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\">Nh&acirc;n vi&ecirc;n của GEMQ sẽ hỗ trợ qu&yacute; kh&aacute;ch h&agrave;ng lựa chọn sản phẩm ph&ugrave; hợp v&agrave; ho&agrave;n tất đơn h&agrave;ng.</p>\\n</li>\\n</ul>\\n<h3 dir=\\\"ltr\\\">1.4. Mua h&agrave;ng qua email</h3>\\n<ul>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\">Gửi email đến gemqcompany@gmail.com để đặt h&agrave;ng.</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\">Trong email, qu&yacute; kh&aacute;ch h&agrave;ng vui l&ograve;ng ghi r&otilde; th&ocirc;ng tin sản phẩm muốn mua, th&ocirc;ng tin thanh to&aacute;n v&agrave; giao h&agrave;ng.</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\">GEMQ sẽ li&ecirc;n hệ với qu&yacute; kh&aacute;ch h&agrave;ng để x&aacute;c nhận đơn h&agrave;ng v&agrave; tiến h&agrave;nh giao h&agrave;ng.</p>\\n</li>\\n</ul>\\n<h2 dir=\\\"ltr\\\">2. Thời gian giao h&agrave;ng</h2>\\n<ul>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\">Thời gian giao h&agrave;ng phụ thuộc v&agrave;o địa điểm giao h&agrave;ng v&agrave; phương thức vận chuyển.</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\">Th&ocirc;ng thường, thời gian giao h&agrave;ng trong nội th&agrave;nh TP.HCM từ 1-2 ng&agrave;y l&agrave;m việc.</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\">Đối với c&aacute;c khu vực ngoại th&agrave;nh v&agrave; c&aacute;c tỉnh th&agrave;nh kh&aacute;c, thời gian giao h&agrave;ng từ 3-5 ng&agrave;y l&agrave;m việc.</p>\\n</li>\\n</ul>\\n<p dir=\\\"ltr\\\">GEMQ h&acirc;n hạnh được phục vụ qu&yacute; kh&aacute;ch h&agrave;ng!</p>\\n<p dir=\\\"ltr\\\">Nếu qu&yacute; kh&aacute;ch h&agrave;ng c&oacute; bất kỳ c&acirc;u hỏi n&agrave;o về hướng dẫn mua h&agrave;ng, vui l&ograve;ng li&ecirc;n hệ với GEMQ th&ocirc;ng qua:</p>\\n<ul>\\n<li dir=\\\"ltr\\\">Địa chỉ: 621 Xa Lộ H&agrave; Nội, Phường Linh Trung, TP. Thủ Đức, TP.HCM, Việt Nam.</li>\\n<li dir=\\\"ltr\\\">Điện thoại: 0888.4040.66</li>\\n<li dir=\\\"ltr\\\">Email: gemqcompany@gmail.com</li>\\n<li dir=\\\"ltr\\\">Website: www.gemq.vn</li>\\n</ul>\", \"custom_classes\": null, \"container_width\": \"container\"}, \"type\": \"Text\"}]}','{\"en\":\"huong-dan-mua-hang\"}',1,'2024-04-15 20:49:26','2024-04-15 20:49:26'),(5,'{\"en\":\"Ch\\u00ednh s\\u00e1ch thanh to\\u00e1n\"}','chinh-sach-thanh-toan',NULL,NULL,NULL,NULL,NULL,'{\"en\":\"Ch\\u00ednh s\\u00e1ch thanh to\\u00e1n t\\u1ea1i Gemq\"}','{\"en\":\"ch\\u00ednh s\\u00e1ch thanh to\\u00e1n\"}','{\"en\": \"chính sách thanh toán\"}',NULL,NULL,'{\"en\": [{\"data\": {\"title\": \"Chính sách thanh toán\", \"content\": \"<h1 dir=\\\"ltr\\\">Ch&iacute;nh s&aacute;ch thanh to&aacute;n của GEMQ</h1>\\n<p dir=\\\"ltr\\\">C&Ocirc;NG TY TNHH GEMQ &aacute;p dụng c&aacute;c h&igrave;nh thức thanh to&aacute;n sau đ&acirc;y:</p>\\n<h2 dir=\\\"ltr\\\">1. Thanh to&aacute;n tiền mặt</h2>\\n<ul>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\">Qu&yacute; kh&aacute;ch h&agrave;ng thanh to&aacute;n trực tiếp bằng tiền mặt cho nh&acirc;n vi&ecirc;n giao h&agrave;ng khi nhận h&agrave;ng.</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\">H&igrave;nh thức thanh to&aacute;n n&agrave;y &aacute;p dụng cho tất cả c&aacute;c đơn h&agrave;ng tr&ecirc;n to&agrave;n quốc.</p>\\n</li>\\n</ul>\\n<h2 dir=\\\"ltr\\\">2. Thanh to&aacute;n chuyển khoản ng&acirc;n h&agrave;ng</h2>\\n<ul>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\">Qu&yacute; kh&aacute;ch h&agrave;ng chuyển khoản thanh to&aacute;n v&agrave;o t&agrave;i khoản ng&acirc;n h&agrave;ng của GEMQ.</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\">Sau khi nhận được thanh to&aacute;n, GEMQ sẽ tiến h&agrave;nh giao h&agrave;ng cho qu&yacute; kh&aacute;ch h&agrave;ng.</p>\\n</li>\\n</ul>\\n<h2 dir=\\\"ltr\\\">3. Thanh to&aacute;n qua cổng thanh to&aacute;n trực tuyến</h2>\\n<p dir=\\\"ltr\\\">GEMQ hỗ trợ c&aacute;c h&igrave;nh thức thanh to&aacute;n trực tuyến sau:</p>\\n<ul>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\">Thẻ ATM nội địa</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\">Thẻ t&iacute;n dụng quốc tế</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\">V&iacute; điện tử</p>\\n</li>\\n</ul>\\n<p dir=\\\"ltr\\\">GEMQ tr&acirc;n trọng sự hợp t&aacute;c của qu&yacute; kh&aacute;ch h&agrave;ng!</p>\\n<h2 dir=\\\"ltr\\\">Lưu &yacute;:</h2>\\n<p dir=\\\"ltr\\\">Qu&yacute; kh&aacute;ch h&agrave;ng vui l&ograve;ng thanh to&aacute;n đầy đủ gi&aacute; trị đơn h&agrave;ng v&agrave; ph&iacute; vận chuyển (nếu c&oacute;).</p>\\n<p dir=\\\"ltr\\\">GEMQ c&oacute; quyền từ chối giao h&agrave;ng nếu kh&ocirc;ng nhận được thanh to&aacute;n từ qu&yacute; kh&aacute;ch h&agrave;ng.</p>\\n<p><strong>&nbsp;</strong></p>\\n<p dir=\\\"ltr\\\">Nếu qu&yacute; kh&aacute;ch h&agrave;ng c&oacute; bất kỳ c&acirc;u hỏi n&agrave;o về ch&iacute;nh s&aacute;ch thanh to&aacute;n, vui l&ograve;ng li&ecirc;n hệ với GEMQ th&ocirc;ng qua:</p>\\n<p dir=\\\"ltr\\\"><strong>C&ocirc;ng ty TNHH GEMQ</strong></p>\\n<p dir=\\\"ltr\\\">Địa chỉ: 621 Xa Lộ H&agrave; Nội, Phường Linh Trung, TP. Thủ Đức, TP.HCM, Việt Nam.</p>\\n<p dir=\\\"ltr\\\">Điện thoại: 0888.4040.66</p>\\n<p dir=\\\"ltr\\\">Email: gemqcompany@gmail.com</p>\\n<p dir=\\\"ltr\\\">Website: www.gemq.vn</p>\\n<p><strong id=\\\"docs-internal-guid-f04e5001-7fff-e364-22a0-19b614c8286c\\\"><br><br><br><br></strong></p>\", \"custom_classes\": null, \"container_width\": \"container\"}, \"type\": \"Text\"}]}','{\"en\":\"chinh-sach-thanh-toan\"}',1,'2024-04-15 23:57:58','2024-04-16 00:01:13'),(6,'{\"en\":\"Ch\\u00ednh s\\u00e1ch v\\u1eadn chuy\\u1ec3n\"}','chinh-sach-van-chuyen',NULL,NULL,NULL,NULL,NULL,'{\"en\":\"Ch\\u00ednh s\\u00e1ch v\\u1eadn chuy\\u1ec3n v\\u00e0 giao nh\\u1eadn h\\u00e0ng c\\u1ee7a Gemq\"}','{\"en\":\"ch\\u00ednh s\\u00e1ch v\\u1eadn chuy\\u1ec3n v\\u00e0 giao nh\\u1eadn c\\u1ee7a Gemq, v\\u1eadn chuy\\u1ec3n giao nh\\u1eadn h\\u00e0ng\"}','{\"en\": \"chính sách vận chuyển và giao nhận hàng của Gemq\"}',NULL,NULL,'{\"en\": [{\"data\": {\"title\": \"Chính sách vận chuyển và giao nhận của GEMQ\", \"content\": \"<h1 dir=\\\"ltr\\\">Ch&iacute;nh s&aacute;ch vận chuyển v&agrave; giao nhận của GEMQ</h1>\\n<p dir=\\\"ltr\\\">C&Ocirc;NG TY TNHH GEMQ cam kết cung cấp dịch vụ vận chuyển v&agrave; giao nhận nhanh ch&oacute;ng, an to&agrave;n v&agrave; hiệu quả cho qu&yacute; kh&aacute;ch h&agrave;ng.</p>\\n<p><strong>&nbsp;</strong></p>\\n<h2 dir=\\\"ltr\\\">1. Ph&iacute; vận chuyển</h2>\\n<ul>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\">Ph&iacute; vận chuyển được t&iacute;nh dựa tr&ecirc;n trọng lượng, k&iacute;ch thước v&agrave; địa điểm giao h&agrave;ng của sản phẩm.</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\">Qu&yacute; kh&aacute;ch h&agrave;ng c&oacute; thể tham khảo bảng ph&iacute; vận chuyển tại website www.gemq.vn hoặc li&ecirc;n hệ trực tiếp với GEMQ để được tư vấn cụ thể.</p>\\n</li>\\n</ul>\\n<h2 dir=\\\"ltr\\\">2. Thời gian giao h&agrave;ng</h2>\\n<ul>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\">Thời gian giao h&agrave;ng phụ thuộc v&agrave;o địa điểm giao h&agrave;ng v&agrave; phương thức vận chuyển.</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\">Th&ocirc;ng thường, thời gian giao h&agrave;ng trong nội th&agrave;nh TP.HCM từ 1-2 ng&agrave;y l&agrave;m việc.</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\">Đối với c&aacute;c khu vực ngoại th&agrave;nh v&agrave; c&aacute;c tỉnh th&agrave;nh kh&aacute;c, thời gian giao h&agrave;ng từ 3-5 ng&agrave;y l&agrave;m việc.</p>\\n</li>\\n</ul>\\n<h2 dir=\\\"ltr\\\">3. Phương thức vận chuyển</h2>\\n<p dir=\\\"ltr\\\">GEMQ &aacute;p dụng c&aacute;c phương thức vận chuyển sau:</p>\\n<ul>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\">Giao h&agrave;ng trực tiếp bởi GEMQ</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\">Giao h&agrave;ng th&ocirc;ng qua c&aacute;c c&ocirc;ng ty vận chuyển</p>\\n</li>\\n</ul>\\n<h2 dir=\\\"ltr\\\">4. Quy tr&igrave;nh giao nhận</h2>\\n<ul>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\">Sau khi nhận được đơn h&agrave;ng, GEMQ sẽ tiến h&agrave;nh xử l&yacute; v&agrave; li&ecirc;n hệ với qu&yacute; kh&aacute;ch h&agrave;ng để x&aacute;c nhận th&ocirc;ng tin giao h&agrave;ng.</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\">GEMQ sẽ th&ocirc;ng b&aacute;o cho qu&yacute; kh&aacute;ch h&agrave;ng về thời gian giao h&agrave;ng dự kiến.</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\">Nh&acirc;n vi&ecirc;n giao h&agrave;ng của GEMQ sẽ li&ecirc;n hệ với qu&yacute; kh&aacute;ch h&agrave;ng trước khi giao h&agrave;ng.</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\">Qu&yacute; kh&aacute;ch h&agrave;ng vui l&ograve;ng kiểm tra kỹ sản phẩm trước khi nhận h&agrave;ng.</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\">Sau khi nhận h&agrave;ng, qu&yacute; kh&aacute;ch h&agrave;ng vui l&ograve;ng k&yacute; x&aacute;c nhận v&agrave; thanh to&aacute;n cho nh&acirc;n vi&ecirc;n giao h&agrave;ng.</p>\\n</li>\\n</ul>\\n<p dir=\\\"ltr\\\">GEMQ tr&acirc;n trọng sự hợp t&aacute;c của qu&yacute; kh&aacute;ch h&agrave;ng!</p>\\n<p><strong>&nbsp;</strong></p>\\n<p dir=\\\"ltr\\\">Nếu qu&yacute; kh&aacute;ch h&agrave;ng c&oacute; bất kỳ c&acirc;u hỏi n&agrave;o về ch&iacute;nh s&aacute;ch vận chuyển v&agrave; giao nhận, vui l&ograve;ng li&ecirc;n hệ với GEMQ th&ocirc;ng qua:</p>\\n<p dir=\\\"ltr\\\"><strong>C&ocirc;ng ty TNHH GEMQ</strong></p>\\n<p dir=\\\"ltr\\\">Địa chỉ: 621 Xa Lộ H&agrave; Nội, Phường Linh Trung, TP. Thủ Đức, TP.HCM, Việt Nam.</p>\\n<p dir=\\\"ltr\\\">Điện thoại: 0888.4040.66</p>\\n<p dir=\\\"ltr\\\">Email: gemqcompany@gmail.com</p>\\n<p dir=\\\"ltr\\\">Website: www.gemq.vn</p>\\n<p><strong id=\\\"docs-internal-guid-d3e1e513-7fff-a2a3-3247-a70745763914\\\"><br><br></strong></p>\", \"custom_classes\": null, \"container_width\": \"container\"}, \"type\": \"Text\"}]}','{\"en\":\"chinh-sach-van-chuyen\"}',1,'2024-04-16 00:03:51','2024-04-16 00:06:30'),(8,'{\"en\":\"Ch\\u00ednh s\\u00e1ch b\\u1ea3o h\\u00e0nh c\\u1ee7a Gemq\"}','chinh-sach-bao-hanh',NULL,NULL,NULL,NULL,NULL,'{\"en\":\"Ch\\u00ednh s\\u00e1ch b\\u1ea3o h\\u00e0nh c\\u1ee7a Gemq\"}','{\"en\":\"ch\\u00ednh s\\u00e1ch b\\u1ea3o h\\u00e0nh, b\\u1ea3o h\\u00e0nh s\\u1ea3n ph\\u1ea9m, \\u0111i\\u1ec1u ki\\u1ec7n b\\u1ea3o h\\u00e0nh\"}','{\"en\": \"chính sách bảo hành\"}',NULL,NULL,'{\"en\": [{\"data\": {\"title\": \"Chính sách bảo hành của Gemq\", \"content\": \"<p dir=\\\"ltr\\\">C&Ocirc;NG TY TNHH GEMQ cam kết bảo h&agrave;nh cho tất cả c&aacute;c sản phẩm do ch&uacute;ng t&ocirc;i cung cấp. Mục ti&ecirc;u của ch&uacute;ng t&ocirc;i l&agrave; đảm bảo qu&yacute; kh&aacute;ch h&agrave;ng ho&agrave;n to&agrave;n h&agrave;i l&ograve;ng với chất lượng sản phẩm v&agrave; dịch vụ của GEMQ.</p>\\n<h2 dir=\\\"ltr\\\">1. Điều khoản bảo h&agrave;nh</h2>\\n<h3 dir=\\\"ltr\\\">1.1. Thời hạn bảo h&agrave;nh</h3>\\n<ul>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\">T&ugrave;y thuộc v&agrave;o từng loại sản phẩm, GEMQ sẽ &aacute;p dụng thời hạn bảo h&agrave;nh kh&aacute;c nhau.&nbsp;</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\">Thời hạn bảo h&agrave;nh sẽ được nh&acirc;n vi&ecirc;n GEMQ tư vấn cụ thể khi mua h&agrave;ng.</p>\\n</li>\\n</ul>\\n<h3 dir=\\\"ltr\\\">1.2. Phạm vi bảo h&agrave;nh</h3>\\n<ul>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\">GEMQ bảo h&agrave;nh miễn ph&iacute; cho c&aacute;c lỗi kỹ thuật do nh&agrave; sản xuất trong thời hạn bảo h&agrave;nh.</p>\\n</li>\\n</ul>\\n<h3 dir=\\\"ltr\\\">1.3. C&aacute;c trường hợp sau đ&acirc;y sẽ kh&ocirc;ng được bảo h&agrave;nh</h3>\\n<ul>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\">Sản phẩm bị hư hỏng do sử dụng kh&ocirc;ng đ&uacute;ng c&aacute;ch, sai mục đ&iacute;ch.</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\">Sản phẩm bị hư hỏng do thi&ecirc;n tai, hỏa hoạn, lũ lụt, va đập mạnh.</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\">Sản phẩm bị tự &yacute; sửa chữa bởi người kh&ocirc;ng c&oacute; chuy&ecirc;n m&ocirc;n.</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\">Tem bảo h&agrave;nh bị r&aacute;ch, trầy xước, hoặc bị d&aacute;n đ&egrave;.</p>\\n</li>\\n</ul>\\n<h2 dir=\\\"ltr\\\">2. Quy tr&igrave;nh bảo h&agrave;nh</h2>\\n<ul>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\">Bước 1: Qu&yacute; kh&aacute;ch h&agrave;ng li&ecirc;n hệ với GEMQ th&ocirc;ng qua số điện thoại, email hoặc website để th&ocirc;ng b&aacute;o về lỗi sản phẩm.</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\">Bước 2: GEMQ sẽ cử nh&acirc;n vi&ecirc;n kỹ thuật đến kiểm tra v&agrave; x&aacute;c định lỗi sản phẩm.</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\">Bước 3: Nếu sản phẩm được bảo h&agrave;nh, GEMQ sẽ tiến h&agrave;nh sửa chữa hoặc đổi mới sản phẩm cho qu&yacute; kh&aacute;ch h&agrave;ng.</p>\\n</li>\\n</ul>\\n<h2 dir=\\\"ltr\\\">Lưu &yacute;:</h2>\\n<ul>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\">Qu&yacute; kh&aacute;ch h&agrave;ng vui l&ograve;ng mang theo phiếu bảo h&agrave;nh khi đến bảo h&agrave;nh sản phẩm.</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\">GEMQ c&oacute; thể từ chối bảo h&agrave;nh nếu sản phẩm kh&ocirc;ng đ&aacute;p ứng c&aacute;c điều kiện bảo h&agrave;nh.</p>\\n</li>\\n</ul>\\n<p dir=\\\"ltr\\\">GEMQ cam kết mang đến cho qu&yacute; kh&aacute;ch h&agrave;ng dịch vụ bảo h&agrave;nh chuy&ecirc;n nghiệp, nhanh ch&oacute;ng v&agrave; hiệu quả.</p>\\n<p><strong>&nbsp;</strong></p>\\n<p dir=\\\"ltr\\\">Li&ecirc;n hệ bảo h&agrave;nh</p>\\n<p dir=\\\"ltr\\\"><strong>C&ocirc;ng ty TNHH GEMQ</strong></p>\\n<p dir=\\\"ltr\\\">Địa chỉ: 621 Xa Lộ H&agrave; Nội, Phường Linh Trung, TP. Thủ Đức, TP.HCM, Việt Nam.</p>\\n<p dir=\\\"ltr\\\">Điện thoại: 0888.4040.66</p>\\n<p dir=\\\"ltr\\\">Email: gemqcompany@gmail.com</p>\\n<p dir=\\\"ltr\\\">Website: www.gemq.vn</p>\\n<p><strong id=\\\"docs-internal-guid-0650ab03-7fff-b462-cd72-361eea834f97\\\"><br><br><br></strong></p>\", \"custom_classes\": null, \"container_width\": \"container\"}, \"type\": \"Text\"}]}','{\"en\":\"chinh-sach-bao-hanh-cua-gemq\"}',1,'2024-04-16 00:08:28','2024-04-16 00:09:39'),(9,'{\"en\":\"Ch\\u00ednh s\\u00e1ch b\\u1ea3o m\\u1eadt th\\u00f4ng tin t\\u1ea1i Gemq\"}','chinh-sach-bao-mat-thong-tin',NULL,NULL,NULL,NULL,NULL,'{\"en\":\"Ch\\u00ednh s\\u00e1ch b\\u1ea3o m\\u1eadt th\\u00f4ng tin t\\u1ea1i Gemq\"}','{\"en\":\"Ch\\u00ednh s\\u00e1ch b\\u1ea3o m\\u1eadt th\\u00f4ng tin, b\\u1ea3o m\\u1eadt th\\u00f4ng tin\"}','{\"en\": \"Chính sách bảo mật thông tin\"}',NULL,NULL,'{\"en\": [{\"data\": {\"title\": \"Chính sách bảo mật thông tin tại Gemq\", \"content\": \"<h1 dir=\\\"ltr\\\">Ch&iacute;nh s&aacute;ch bảo mật th&ocirc;ng tin của GEMQ</h1>\\n<p dir=\\\"ltr\\\">C&Ocirc;NG TY TNHH GEMQ cam kết bảo mật th&ocirc;ng tin c&aacute; nh&acirc;n của qu&yacute; kh&aacute;ch h&agrave;ng theo đ&uacute;ng quy định của ph&aacute;p luật Việt Nam.</p>\\n<h2 dir=\\\"ltr\\\">1. Mục đ&iacute;ch thu thập th&ocirc;ng tin</h2>\\n<p dir=\\\"ltr\\\">GEMQ thu thập th&ocirc;ng tin c&aacute; nh&acirc;n của qu&yacute; kh&aacute;ch h&agrave;ng để phục vụ cho c&aacute;c mục đ&iacute;ch sau:</p>\\n<ul>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\">Li&ecirc;n hệ v&agrave; tư vấn về sản phẩm, dịch vụ.</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\">Gửi th&ocirc;ng tin khuyến m&atilde;i, chương tr&igrave;nh ưu đ&atilde;i.</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\">Cung cấp dịch vụ chăm s&oacute;c kh&aacute;ch h&agrave;ng.</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\">Giải quyết khiếu nại, tranh chấp.</p>\\n</li>\\n</ul>\\n<h2 dir=\\\"ltr\\\">2. Loại th&ocirc;ng tin thu thập</h2>\\n<ul>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\">GEMQ thu thập c&aacute;c loại th&ocirc;ng tin sau:</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\">Họ v&agrave; t&ecirc;n</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\">Số điện thoại</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\">Email</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\">Địa chỉ</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\">Th&ocirc;ng tin về sản phẩm, dịch vụ m&agrave; qu&yacute; kh&aacute;ch h&agrave;ng quan t&acirc;m.</p>\\n</li>\\n</ul>\\n<h2 dir=\\\"ltr\\\">3. C&aacute;ch thức thu thập th&ocirc;ng tin</h2>\\n<p dir=\\\"ltr\\\">GEMQ thu thập th&ocirc;ng tin c&aacute; nh&acirc;n của qu&yacute; kh&aacute;ch h&agrave;ng th&ocirc;ng qua c&aacute;c k&ecirc;nh sau:</p>\\n<ul>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\">Website www.gemq.vn</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\">Fanpage Facebook</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\">Zalo</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\">Email</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\">Điện thoại</p>\\n</li>\\n</ul>\\n<h2 dir=\\\"ltr\\\">4. Quyền của chủ thể th&ocirc;ng tin</h2>\\n<p dir=\\\"ltr\\\">Qu&yacute; kh&aacute;ch h&agrave;ng c&oacute; quyền:</p>\\n<ul>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\">Y&ecirc;u cầu sửa đổi, bổ sung th&ocirc;ng tin c&aacute; nh&acirc;n.</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\">Y&ecirc;u cầu x&oacute;a th&ocirc;ng tin c&aacute; nh&acirc;n.</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\">Y&ecirc;u cầu hạn chế thu thập, sử dụng th&ocirc;ng tin c&aacute; nh&acirc;n.</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\">Y&ecirc;u cầu GEMQ ngừng li&ecirc;n lạc, gửi th&ocirc;ng tin quảng c&aacute;o.</p>\\n</li>\\n</ul>\\n<h2 dir=\\\"ltr\\\">5. Cam kết bảo mật th&ocirc;ng tin</h2>\\n<ul>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\">GEMQ cam kết bảo mật th&ocirc;ng tin c&aacute; nh&acirc;n của qu&yacute; kh&aacute;ch h&agrave;ng bằng c&aacute;c biện ph&aacute;p kỹ thuật v&agrave; tổ chức ph&ugrave; hợp.</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\">GEMQ kh&ocirc;ng chia sẻ, b&aacute;n hoặc cho thu&ecirc; th&ocirc;ng tin c&aacute; nh&acirc;n của qu&yacute; kh&aacute;ch h&agrave;ng cho bất kỳ tổ chức n&agrave;o kh&aacute;c.</p>\\n</li>\\n</ul>\\n<p dir=\\\"ltr\\\">GEMQ tr&acirc;n trọng sự tin tưởng của qu&yacute; kh&aacute;ch h&agrave;ng!</p>\\n<h2 dir=\\\"ltr\\\">Nếu qu&yacute; kh&aacute;ch h&agrave;ng c&oacute; bất kỳ c&acirc;u hỏi n&agrave;o về ch&iacute;nh s&aacute;ch bảo mật th&ocirc;ng tin, vui l&ograve;ng li&ecirc;n hệ với GEMQ th&ocirc;ng qua:</h2>\\n<p dir=\\\"ltr\\\">C&ocirc;ng ty TNHH GEMQ</p>\\n<p dir=\\\"ltr\\\">Địa chỉ: 621 Xa Lộ H&agrave; Nội, Phường Linh Trung, TP. Thủ Đức, TP.HCM, Việt Nam.</p>\\n<p dir=\\\"ltr\\\">Điện thoại: 0888.4040.66</p>\\n<p dir=\\\"ltr\\\">Email: gemqcompany@gmail.com</p>\\n<p dir=\\\"ltr\\\">Website: www.gemq.vn</p>\\n<p><strong id=\\\"docs-internal-guid-462592c0-7fff-5860-0064-a339b49a6134\\\"><br><br><br></strong></p>\", \"custom_classes\": null, \"container_width\": \"container\"}, \"type\": \"Text\"}]}','{\"en\":\"chinh-sach-bao-mat-thong-tin-tai-gemq\"}',1,'2024-04-16 00:10:13','2024-04-16 00:11:41'),(10,'{\"en\":\"Gi\\u1edbi thi\\u1ec7u v\\u1ec1 GEMQ\"}','gioi-thieu-ve-gemq',NULL,NULL,NULL,NULL,NULL,'{\"en\":\"Gi\\u1edbi thi\\u1ec7u v\\u1ec1 GEMQ\"}','{\"en\":\"gi\\u1edbi thi\\u1ec7u, t\\u1ef1 gi\\u1edbi thi\\u1ec7u, t\\u00ecm hi\\u1ec3u v\\u1ec1 GEMQ\"}','{\"en\": \"giới thiệu về GEMQ\"}',NULL,NULL,'{\"en\": [{\"data\": {\"title\": \"Giới thiệu về GEMQ\", \"content\": \"<p dir=\\\"ltr\\\">C&Ocirc;NG TY TNHH GEMQ tự h&agrave;o l&agrave; đơn vị chuy&ecirc;n thi c&ocirc;ng v&agrave; gia c&ocirc;ng c&aacute;c sản phẩm kim loại uy t&iacute;n, chuy&ecirc;n nghiệp tại Việt Nam. Với đội ngũ kỹ thuật vi&ecirc;n gi&agrave;u kinh nghiệm, c&ugrave;ng hệ thống m&aacute;y m&oacute;c hiện đại, ch&uacute;ng t&ocirc;i cam kết mang đến cho qu&yacute; kh&aacute;ch h&agrave;ng những sản phẩm chất lượng cao, đ&aacute;p ứng mọi y&ecirc;u cầu khắt khe nhất.</p>\\n<h2 dir=\\\"ltr\\\">1. Tầm nh&igrave;n</h2>\\n<p dir=\\\"ltr\\\">Trở th&agrave;nh c&ocirc;ng ty h&agrave;ng đầu trong lĩnh vực gia c&ocirc;ng kim loại tại Việt Nam.</p>\\n<p dir=\\\"ltr\\\">Cung cấp c&aacute;c sản phẩm v&agrave; dịch vụ chất lượng cao, đ&aacute;p ứng mọi nhu cầu của kh&aacute;ch h&agrave;ng.</p>\\n<p dir=\\\"ltr\\\">X&acirc;y dựng thương hiệu GEMQ uy t&iacute;n v&agrave; được tin cậy tr&ecirc;n thị trường.</p>\\n<h2 dir=\\\"ltr\\\">2. Sứ mệnh</h2>\\n<p dir=\\\"ltr\\\">Cung cấp c&aacute;c giải ph&aacute;p gia c&ocirc;ng kim loại to&agrave;n diện, s&aacute;ng tạo v&agrave; hiệu quả.</p>\\n<p dir=\\\"ltr\\\">Mang đến cho kh&aacute;ch h&agrave;ng những sản phẩm chất lượng cao với gi&aacute; cả cạnh tranh.</p>\\n<p dir=\\\"ltr\\\">Đ&oacute;ng g&oacute;p v&agrave;o sự ph&aacute;t triển chung của ng&agrave;nh c&ocirc;ng nghiệp Việt Nam.</p>\\n<h2 dir=\\\"ltr\\\">3. Gi&aacute; trị cốt l&otilde;i</h2>\\n<p dir=\\\"ltr\\\">Uy t&iacute;n: Lu&ocirc;n trung thực, giữ chữ t&iacute;n trong mọi cam kết với kh&aacute;ch h&agrave;ng.</p>\\n<p dir=\\\"ltr\\\">Chất lượng: Đảm bảo chất lượng sản phẩm v&agrave; dịch vụ ở mức cao nhất.</p>\\n<p dir=\\\"ltr\\\">Chuy&ecirc;n nghiệp: Cung cấp dịch vụ chuy&ecirc;n nghiệp, tận t&acirc;m v&agrave; chu đ&aacute;o.</p>\\n<p dir=\\\"ltr\\\">S&aacute;ng tạo: Đổi mới kh&ocirc;ng ngừng để đ&aacute;p ứng nhu cầu ng&agrave;y c&agrave;ng cao của kh&aacute;ch h&agrave;ng.</p>\\n<p dir=\\\"ltr\\\">Hiệu quả: Tối ưu h&oacute;a hiệu quả hoạt động, mang lại lợi &iacute;ch cho kh&aacute;ch h&agrave;ng v&agrave; doanh nghiệp.</p>\\n<h2 dir=\\\"ltr\\\">4. Năng lực sản xuất</h2>\\n<p dir=\\\"ltr\\\">C&ocirc;ng ty TNHH GEMQ tự h&agrave;o l&agrave; đơn vị ti&ecirc;n phong trong lĩnh vực gia c&ocirc;ng kim loại tại Việt Nam với hệ thống m&aacute;y m&oacute;c hiện đại, đội ngũ kỹ thuật vi&ecirc;n tay nghề cao v&agrave; dịch vụ chuy&ecirc;n nghiệp. Ch&uacute;ng t&ocirc;i cam kết mang đến cho kh&aacute;ch h&agrave;ng những sản phẩm chất lượng cao, đ&aacute;p ứng mọi y&ecirc;u cầu khắt khe nhất.</p>\\n<p dir=\\\"ltr\\\">Dưới đ&acirc;y l&agrave; một số thiết bị hiện đại đang được GEMQ sử dụng:</p>\\n<h2 dir=\\\"ltr\\\">4.1. D&acirc;y chuyền sơn tĩnh điện</h2>\\n<p dir=\\\"ltr\\\">D&acirc;y chuyền sơn tĩnh điện l&agrave; một hệ thống tự động được sử dụng để phủ sơn tĩnh điện l&ecirc;n bề mặt kim loại.</p>\\n<p dir=\\\"ltr\\\">Sử dụng d&acirc;y chuyền sơn tĩnh điện mang lại nhiều hiệu quả so với phương ph&aacute;p sơn truyền thống như:</p>\\n<ul>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\">Chất lượng sơn tốt hơn: Lớp sơn tĩnh điện d&agrave;y hơn, đồng đều hơn v&agrave; c&oacute; khả năng chống gỉ s&eacute;t, ăn m&ograve;n tốt hơn.</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\">Hiệu quả cao hơn: Tốc độ sơn nhanh hơn, tiết kiệm thời gian v&agrave; chi ph&iacute; sản xuất.</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\">Th&acirc;n thiện với m&ocirc;i trường: &Iacute;t tạo ra dung m&ocirc;i thải, g&oacute;p phần bảo vệ m&ocirc;i trường.</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\">An to&agrave;n cho người sử dụng: Kh&ocirc;ng sử dụng dung m&ocirc;i n&ecirc;n an to&agrave;n cho người sử dụng.</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\">C&oacute; thể sơn nhiều m&agrave;u sắc kh&aacute;c nhau: đ&aacute;p ứng mọi nhu cầu của kh&aacute;ch h&agrave;ng</p>\\n</li>\\n</ul>\\n<h2 dir=\\\"ltr\\\">4.2. M&aacute;y cắt laser CNC</h2>\\n<p dir=\\\"ltr\\\">M&aacute;y cắt laser l&agrave; một thiết bị sử dụng tia laser để cắt kim loại tấm với độ ch&iacute;nh x&aacute;c cao, đường cắt mịn đẹp v&agrave; kh&ocirc;ng bị biến dạng. M&aacute;y cắt laser c&oacute; thể cắt được nhiều loại kim loại kh&aacute;c nhau như th&eacute;p, inox, nh&ocirc;m, đồng, v.v.</p>\\n<p dir=\\\"ltr\\\">Hiệu quả của cắt laser so với phương ph&aacute;p truyền thống:</p>\\n<ul>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\">Độ ch&iacute;nh x&aacute;c cao: M&aacute;y cắt laser c&oacute; thể cắt c&aacute;c chi tiết phức tạp với độ ch&iacute;nh x&aacute;c cao, kh&ocirc;ng cần gia c&ocirc;ng lại.</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\">Tốc độ cắt nhanh: M&aacute;y cắt laser c&oacute; tốc độ cắt nhanh hơn so với phương ph&aacute;p truyền thống như cắt bằng dao, cắt bằng plasma.</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\">Tiết kiệm vật liệu: M&aacute;y cắt laser c&oacute; thể cắt theo đường viền tối ưu, gi&uacute;p tiết kiệm vật liệu.</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\">&Iacute;t tạo ra phế liệu: M&aacute;y cắt laser tạo ra &iacute;t phế liệu hơn so với phương ph&aacute;p truyền thống.</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\">Bề mặt cắt đẹp: Bề mặt cắt bằng laser mịn đẹp, kh&ocirc;ng bị biến dạng.</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\">An to&agrave;n cho người sử dụng: M&aacute;y cắt laser sử dụng tia laser n&ecirc;n an to&agrave;n cho người sử dụng hơn so với phương ph&aacute;p truyền thống.</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\">Dễ d&agrave;ng sử dụng: M&aacute;y cắt laser c&oacute; thể được điều khiển bằng m&aacute;y t&iacute;nh, dễ d&agrave;ng sử dụng v&agrave; vận h&agrave;nh.</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\">C&oacute; thể cắt nhiều loại kim loại kh&aacute;c nhau: M&aacute;y cắt laser c&oacute; thể cắt được nhiều loại kim loại kh&aacute;c nhau như th&eacute;p, inox, nh&ocirc;m, đồng, v.v.</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\">C&oacute; thể cắt c&aacute;c chi tiết c&oacute; độ d&agrave;y mỏng kh&aacute;c nhau: M&aacute;y cắt laser c&oacute; thể cắt được c&aacute;c chi tiết c&oacute; độ d&agrave;y mỏng kh&aacute;c nhau.</p>\\n</li>\\n</ul>\\n<h2 dir=\\\"ltr\\\">4.3. M&aacute;y đột CNC</h2>\\n<p dir=\\\"ltr\\\">M&aacute;y đột CNC l&agrave; một thiết bị sử dụng c&ocirc;ng nghệ điều khiển số bằng m&aacute;y t&iacute;nh (CNC) để điều khiển hoạt động của dao đột, tạo ra c&aacute;c lỗ hoặc h&igrave;nh dạng mong muốn tr&ecirc;n kim loại tấm.&nbsp;</p>\\n<p dir=\\\"ltr\\\">Đột CNC rất hiệu quả so với phương ph&aacute;p truyền thống:</p>\\n<ul>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\">Độ ch&iacute;nh x&aacute;c cao: M&aacute;y đột CNC c&oacute; thể đột c&aacute;c lỗ hoặc h&igrave;nh dạng với độ ch&iacute;nh x&aacute;c cao, kh&ocirc;ng cần gia c&ocirc;ng lại.</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\">Tốc độ đột nhanh: M&aacute;y đột CNC c&oacute; tốc độ đột nhanh hơn nhiều so với phương ph&aacute;p truyền thống như đột bằng tay, đột bằng m&aacute;y đột cơ.</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\">Tiết kiệm vật liệu: M&aacute;y đột CNC c&oacute; thể đột theo đường viền tối ưu, gi&uacute;p tiết kiệm vật liệu.</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\">&Iacute;t tạo ra phế liệu: M&aacute;y đột CNC tạo ra &iacute;t phế liệu hơn so với phương ph&aacute;p truyền thống.</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\">An to&agrave;n cho người sử dụng: M&aacute;y đột CNC sử dụng hệ thống điều khiển tự động n&ecirc;n an to&agrave;n cho người sử dụng hơn so với phương ph&aacute;p truyền thống.</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\">Dễ d&agrave;ng sử dụng: M&aacute;y đột CNC c&oacute; thể được điều khiển bằng m&aacute;y t&iacute;nh, dễ d&agrave;ng sử dụng v&agrave; vận h&agrave;nh.</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\">C&oacute; thể đột nhiều loại kim loại kh&aacute;c nhau: M&aacute;y đột CNC c&oacute; thể đột được nhiều loại kim loại kh&aacute;c nhau như th&eacute;p, inox, nh&ocirc;m, đồng, v.v.</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\">C&oacute; thể đột c&aacute;c chi tiết c&oacute; độ d&agrave;y mỏng kh&aacute;c nhau: M&aacute;y đột CNC c&oacute; thể đột được c&aacute;c chi tiết c&oacute; độ d&agrave;y mỏng kh&aacute;c nhau.</p>\\n</li>\\n</ul>\\n<h2 dir=\\\"ltr\\\">4.4. M&aacute;y chấn CNC</h2>\\n<p dir=\\\"ltr\\\">M&aacute;y chấn CNC l&agrave; một thiết bị sử dụng c&ocirc;ng nghệ điều khiển số bằng m&aacute;y t&iacute;nh (CNC) để điều khiển hoạt động của dao chấn, tạo ra c&aacute;c chi tiết kim loại tấm c&oacute; h&igrave;nh dạng mong muốn.&nbsp;</p>\\n<p dir=\\\"ltr\\\">Chấn CNC c&oacute; c&aacute;c ưu điểm như:</p>\\n<ul>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\">Độ ch&iacute;nh x&aacute;c cao: M&aacute;y chấn CNC c&oacute; thể chấn c&aacute;c chi tiết với độ ch&iacute;nh x&aacute;c cao, kh&ocirc;ng cần gia c&ocirc;ng lại.</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\">Tốc độ chấn nhanh: M&aacute;y chấn CNC c&oacute; tốc độ chấn nhanh hơn nhiều so với phương ph&aacute;p chấn tay truyền thống.</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\">Tiết kiệm vật liệu: M&aacute;y chấn CNC c&oacute; thể chấn theo đường viền tối ưu, gi&uacute;p tiết kiệm vật liệu.</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\">&Iacute;t tạo ra phế liệu: M&aacute;y chấn CNC tạo ra &iacute;t phế liệu hơn so với phương ph&aacute;p truyền thống.</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\">An to&agrave;n cho người sử dụng: M&aacute;y chấn CNC sử dụng hệ thống điều khiển tự động n&ecirc;n an to&agrave;n cho người sử dụng hơn so với phương ph&aacute;p truyền thống.</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\">Dễ d&agrave;ng sử dụng: M&aacute;y chấn CNC c&oacute; thể được điều khiển bằng m&aacute;y t&iacute;nh, dễ d&agrave;ng sử dụng v&agrave; vận h&agrave;nh.</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\">C&oacute; thể chấn nhiều loại kim loại kh&aacute;c nhau: M&aacute;y chấn CNC c&oacute; thể chấn được nhiều loại kim loại kh&aacute;c nhau như th&eacute;p, inox, nh&ocirc;m, đồng, v.v.</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\">C&oacute; thể chấn c&aacute;c chi tiết c&oacute; độ d&agrave;y mỏng kh&aacute;c nhau: M&aacute;y chấn CNC c&oacute; thể chấn được c&aacute;c chi tiết c&oacute; độ d&agrave;y mỏng kh&aacute;c nhau.</p>\\n</li>\\n</ul>\\n<h2 dir=\\\"ltr\\\">4.5. H&agrave;n bấm</h2>\\n<p dir=\\\"ltr\\\">H&agrave;n bấm l&agrave; phương ph&aacute;p h&agrave;n sử dụng kẹp hoặc khu&ocirc;n để &eacute;p c&aacute;c chi tiết kim loại lại với nhau, tạo ra mối h&agrave;n chắc chắn.</p>\\n<p dir=\\\"ltr\\\">Hiệu quả so với phương ph&aacute;p truyền thống:</p>\\n<ul>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\">Tốc độ h&agrave;n nhanh: H&agrave;n bấm c&oacute; tốc độ h&agrave;n nhanh hơn so với phương ph&aacute;p h&agrave;n tay truyền thống.</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\">Hiệu quả cao: H&agrave;n bấm tạo ra mối h&agrave;n c&oacute; độ ch&iacute;nh x&aacute;c cao, &iacute;t sai s&oacute;t.</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\">Dễ d&agrave;ng sử dụng: H&agrave;n bấm sử dụng kẹp hoặc khu&ocirc;n n&ecirc;n dễ d&agrave;ng sử dụng hơn so với phương ph&aacute;p h&agrave;n tay truyền thống.</p>\\n</li>\\n</ul>\\n<h2 dir=\\\"ltr\\\">4.6. H&agrave;n laser</h2>\\n<p dir=\\\"ltr\\\">H&agrave;n laser l&agrave; phương ph&aacute;p h&agrave;n sử dụng tia laser để nung chảy kim loại tại vị tr&iacute; cần h&agrave;n, tạo ra mối h&agrave;n c&oacute; độ bền cao v&agrave; thẩm mỹ.</p>\\n<p dir=\\\"ltr\\\">Hiệu quả so với phương ph&aacute;p truyền thống:</p>\\n<ul>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\">Độ ch&iacute;nh x&aacute;c cao: H&agrave;n laser c&oacute; thể h&agrave;n c&aacute;c chi tiết phức tạp với độ ch&iacute;nh x&aacute;c cao.</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\">Tốc độ h&agrave;n nhanh: H&agrave;n laser c&oacute; tốc độ h&agrave;n nhanh hơn so với phương ph&aacute;p h&agrave;n hồ quang truyền thống.</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\">S&acirc;u h&agrave;n lớn: H&agrave;n laser c&oacute; thể h&agrave;n c&aacute;c chi tiết c&oacute; độ d&agrave;y lớn hơn so với phương ph&aacute;p h&agrave;n hồ quang truyền thống.</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\">&Iacute;t tạo ra kh&oacute;i h&agrave;n: H&agrave;n laser &iacute;t tạo ra kh&oacute;i h&agrave;n hơn so với phương ph&aacute;p h&agrave;n hồ quang truyền thống, an to&agrave;n hơn cho người sử dụng.</p>\\n</li>\\n</ul>\\n<h2 dir=\\\"ltr\\\">4.7. H&agrave;n robot</h2>\\n<p dir=\\\"ltr\\\">H&agrave;n robot l&agrave; phương ph&aacute;p h&agrave;n sử dụng robot để điều khiển mỏ h&agrave;n, tạo ra mối h&agrave;n c&oacute; độ ch&iacute;nh x&aacute;c cao v&agrave; đồng đều.</p>\\n<p dir=\\\"ltr\\\">Hiệu quả so với phương ph&aacute;p truyền thống:</p>\\n<ul>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\">Tự động h&oacute;a: H&agrave;n robot c&oacute; thể tự động h&oacute;a ho&agrave;n to&agrave;n qu&aacute; tr&igrave;nh h&agrave;n, gi&uacute;p tiết kiệm nh&acirc;n c&ocirc;ng v&agrave; tăng năng suất.</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\">Độ ch&iacute;nh x&aacute;c cao: H&agrave;n robot c&oacute; thể h&agrave;n c&aacute;c chi tiết phức tạp với độ ch&iacute;nh x&aacute;c cao.</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\">Chất lượng h&agrave;n ổn định: H&agrave;n robot đảm bảo chất lượng h&agrave;n ổn định, &iacute;t sai s&oacute;t.</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\">An to&agrave;n cho người sử dụng: H&agrave;n robot gi&uacute;p người sử dụng tr&aacute;nh xa khu vực h&agrave;n, an to&agrave;n hơn so với phương ph&aacute;p h&agrave;n tay truyền thống.</p>\\n</li>\\n</ul>\\n<p dir=\\\"ltr\\\">Với hệ thống m&aacute;y m&oacute;c hiện đại GEMQ tự tin đ&aacute;p ứng mọi y&ecirc;u cầu gia c&ocirc;ng kim loại của kh&aacute;ch h&agrave;ng với độ ch&iacute;nh x&aacute;c cao, tốc độ nhanh, chất lượng ho&agrave;n hảo v&agrave; tiến độ đảm bảo.</p>\\n<p dir=\\\"ltr\\\">Đội ngũ kỹ thuật vi&ecirc;n tay nghề cao, gi&agrave;u kinh nghiệm c&ugrave;ng đội ngũ nh&acirc;n vi&ecirc;n chuy&ecirc;n nghiệp, nhiệt t&igrave;nh sẽ lu&ocirc;n sẵn s&agrave;ng tư vấn v&agrave; hỗ trợ kh&aacute;ch h&agrave;ng.</p>\\n<h2 dir=\\\"ltr\\\">5. Lợi &iacute;ch khi lựa chọn GEMQ</h2>\\n<h3 dir=\\\"ltr\\\">5.1. Sản phẩm chất lượng cao</h3>\\n<ul>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\">Sử dụng nguy&ecirc;n vật liệu cao cấp</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\">Gia c&ocirc;ng theo ti&ecirc;u chuẩn quốc tế</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\">Kiểm tra chất lượng nghi&ecirc;m ngặt</p>\\n</li>\\n</ul>\\n<h3 dir=\\\"ltr\\\">5.2. Gi&aacute; th&agrave;nh cạnh tranh</h3>\\n<ul>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\">Chiết khấu hấp dẫn cho đơn h&agrave;ng số lượng lớn</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\">Miễn ph&iacute; vận chuyển cho khu vực nội th&agrave;nh</p>\\n</li>\\n</ul>\\n<h3 dir=\\\"ltr\\\">5.3. Dịch vụ chuy&ecirc;n nghiệp</h3>\\n<ul>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\">Đội ngũ tư vấn vi&ecirc;n nhiệt t&igrave;nh, chu đ&aacute;o</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\">Kỹ thuật vi&ecirc;n gi&agrave;u kinh nghiệm, tay nghề cao</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\">Chế độ bảo h&agrave;nh uy t&iacute;n</p>\\n</li>\\n</ul>\\n<p><strong>&nbsp;</strong></p>\\n<p dir=\\\"ltr\\\">GEMQ - Uy t&iacute;n, chất lượng, chuy&ecirc;n nghiệp!</p>\\n<p dir=\\\"ltr\\\">H&atilde;y li&ecirc;n hệ với ch&uacute;ng t&ocirc;i ngay h&ocirc;m nay để được tư vấn v&agrave; b&aacute;o gi&aacute; miễn ph&iacute;!</p>\\n<p dir=\\\"ltr\\\">GEMQ - Đ&aacute;p ứng mọi nhu cầu của bạn!</p>\\n<p dir=\\\"ltr\\\">&nbsp;</p>\\n<h1 dir=\\\"ltr\\\">Li&ecirc;n hệ với GEMQ</h1>\\n<p dir=\\\"ltr\\\">C&ocirc;ng ty TNHH GEMQ</p>\\n<p dir=\\\"ltr\\\">Địa chỉ: 621 Xa Lộ H&agrave; Nội, Phường Linh Trung, TP. Thủ Đức, TP.HCM, Việt Nam.</p>\\n<p dir=\\\"ltr\\\">Điện thoại: 0888.4040.66</p>\\n<p dir=\\\"ltr\\\">Email: gemqcompany@gmail.com</p>\\n<p dir=\\\"ltr\\\">Website: www.gemq.vn</p>\\n<p><strong id=\\\"docs-internal-guid-66729e8d-7fff-bb58-1dee-3f8b37ab0a13\\\"><br><br><br><br><br></strong></p>\", \"custom_classes\": null, \"container_width\": \"container\"}, \"type\": \"Text\"}]}','{\"en\":\"gioi-thieu-ve-gemq\"}',1,'2024-04-16 01:27:08','2024-04-16 01:42:13'),(11,'{\"en\":\"Gia c\\u00f4ng s\\u01a1n t\\u0129nh \\u0111i\\u1ec7n\"}','gia-cong-son-tinh-dien',NULL,NULL,NULL,NULL,NULL,'{\"en\":\"Gia c\\u00f4ng s\\u01a1n t\\u0129nh \\u0111i\\u1ec7n\"}','{\"en\":\"gia c\\u00f4ng s\\u01a1n t\\u0129nh \\u0111i\\u1ec7n\"}','{\"en\": \"gia công sơn tĩnh điện\"}',NULL,NULL,'{\"en\": [{\"data\": {\"title\": \"Gia công sơn tĩnh điện\", \"content\": \"<p dir=\\\"ltr\\\">Trong thế giới hiện đại, nhu cầu bảo vệ v&agrave; n&acirc;ng cao gi&aacute; trị thẩm mỹ cho c&aacute;c sản phẩm kim loại ng&agrave;y c&agrave;ng gia tăng. Kỹ thuật sơn tĩnh điện đ&aacute;p ứng ho&agrave;n nhu cầu ấy!</p>\\n<p dir=\\\"ltr\\\">Sơn tĩnh điện kh&ocirc;ng chỉ đơn thuần l&agrave; lớp phủ bảo vệ, m&agrave; c&ograve;n mang đến vẻ đẹp sang trọng, tinh tế cho sản phẩm. Lớp sơn tĩnh điện sở hữu những ưu điểm vượt trội như độ bền bỉ m&agrave; c&ograve;n ở t&iacute;nh thẩm mỹ với lớp sơn b&oacute;ng lo&aacute;ng, m&agrave;u sắc đa dạng, th&acirc;n thiện m&ocirc;i trường đặc biệt c&ograve;n tiết kiệm chi ph&iacute;.</p>\\n<p dir=\\\"ltr\\\">Sơn tĩnh điện chỉ thực sự ph&aacute;t huy hiệu quả khi được thực hiện bởi nh&agrave; cung cấp đảm bảo uy t&iacute;n. T&igrave;m&nbsp;hiểu ngay sau đ&acirc;y để lựa chọn nh&agrave; cung cấp ho&agrave;n hảo!</p>\\n<p dir=\\\"ltr\\\"><img src=\\\"/storage/3VZvmMOVRbMomc7yClRtBm40sQMbtpeoHQKRYfUO.jpg\\\" alt=\\\"son-tinh-dien\\\" width=\\\"800\\\" height=\\\"600\\\"></p>\\n<h2 dir=\\\"ltr\\\">1. Tại sao n&ecirc;n chọn dịch vụ gia c&ocirc;ng sơn tĩnh điện?</h2>\\n<p dir=\\\"ltr\\\">C&oacute; nhiều l&yacute; do khiến việc sử dụng dịch vụ gia c&ocirc;ng sơn tĩnh điện trở n&ecirc;n ưu việt hơn so với việc đầu tư hệ thống sơn tĩnh điện ri&ecirc;ng hoặc sử dụng c&aacute;c phương ph&aacute;p sơn kh&aacute;c:</p>\\n<h3 dir=\\\"ltr\\\">1.1. Tiết kiệm chi ph&iacute;</h3>\\n<p dir=\\\"ltr\\\"><strong>Chi ph&iacute; đầu tư:&nbsp;</strong>Việc đầu tư hệ thống sơn tĩnh điện đ&ograve;i hỏi chi ph&iacute; ban đầu lớn cho m&aacute;y m&oacute;c, thiết bị, ph&ograve;ng ốc v&agrave; nh&acirc;n c&ocirc;ng vận h&agrave;nh.</p>\\n<p dir=\\\"ltr\\\"><strong>Chi ph&iacute; bảo tr&igrave;: </strong>Hệ thống sơn tĩnh điện cần được bảo tr&igrave;, bảo dưỡng định kỳ để đảm bảo hoạt động hiệu quả.</p>\\n<p dir=\\\"ltr\\\"><strong>Chi ph&iacute; nguy&ecirc;n vật liệu:</strong> Gi&aacute; th&agrave;nh sơn tĩnh điện, dung m&ocirc;i, h&oacute;a chất xử l&yacute; bề mặt,... c&oacute; thể cao hơn so với sơn th&ocirc;ng thường.</p>\\n<p dir=\\\"ltr\\\">Sử dụng dịch vụ gia c&ocirc;ng sơn tĩnh điện gi&uacute;p bạn tiết kiệm được c&aacute;c khoản chi ph&iacute; tr&ecirc;n, đặc biệt l&agrave; khi nhu cầu sơn của bạn kh&ocirc;ng qu&aacute; lớn hoặc chỉ cần sơn theo đợt.</p>\\n<h3 dir=\\\"ltr\\\">1.2. Chuy&ecirc;n m&ocirc;n h&oacute;a</h3>\\n<p dir=\\\"ltr\\\"><strong>C&ocirc;ng nghệ ti&ecirc;n tiến: </strong>C&aacute;c c&ocirc;ng ty gia c&ocirc;ng sơn tĩnh điện thường sở hữu c&ocirc;ng nghệ sơn ti&ecirc;n tiến, d&acirc;y chuyền hiện đại v&agrave; đội ngũ kỹ thuật vi&ecirc;n chuy&ecirc;n nghiệp, đảm bảo chất lượng sơn tốt nhất.</p>\\n<p dir=\\\"ltr\\\"><strong>Kiến thức chuy&ecirc;n m&ocirc;n:</strong> C&oacute; kiến thức chuy&ecirc;n s&acirc;u về sơn tĩnh điện, lựa chọn loại sơn ph&ugrave; hợp với từng loại vật liệu v&agrave; ứng dụng, đảm bảo hiệu quả tối ưu.</p>\\n<p dir=\\\"ltr\\\"><strong>Kinh nghiệm thực tế: </strong>Với kinh nghiệm d&agrave;y dặn trong lĩnh vực sơn tĩnh điện, họ c&oacute; thể xử l&yacute; hiệu quả c&aacute;c vấn đề kỹ thuật v&agrave; đảm bảo tiến độ thi c&ocirc;ng nhanh ch&oacute;ng.</p>\\n<h3 dir=\\\"ltr\\\">1.3. Sự tiện lợi</h3>\\n<p dir=\\\"ltr\\\"><strong>Tiết kiệm thời gian: </strong>Thay v&igrave; phải tự đầu tư, thi c&ocirc;ng v&agrave; bảo tr&igrave; hệ thống sơn tĩnh điện, bạn chỉ cần thu&ecirc; dịch vụ gia c&ocirc;ng v&agrave; nhận th&agrave;nh phẩm ho&agrave;n chỉnh.</p>\\n<p dir=\\\"ltr\\\"><strong>Giảm thiểu rủi ro: </strong>Việc thi c&ocirc;ng sơn tĩnh điện tiềm ẩn nhiều rủi ro như an to&agrave;n lao động, &ocirc; nhiễm m&ocirc;i trường,... Việc sử dụng dịch vụ gia c&ocirc;ng gi&uacute;p bạn giảm thiểu những rủi ro n&agrave;y.</p>\\n<p dir=\\\"ltr\\\"><strong>Mở rộng khả năng:</strong> Bạn c&oacute; thể dễ d&agrave;ng gia tăng năng lực sơn tĩnh điện khi sử dụng dịch vụ gia c&ocirc;ng, ph&ugrave; hợp với nhu cầu biến động của sản xuất kinh doanh.</p>\\n<h2 dir=\\\"ltr\\\">1.4. So s&aacute;nh với c&aacute;c phương ph&aacute;p sơn kh&aacute;c</h2>\\n<p dir=\\\"ltr\\\"><strong>Sơn th&ocirc;ng thường:</strong> Độ bền, t&iacute;nh thẩm mỹ v&agrave; khả năng chống chịu của sơn tĩnh điện vượt trội so với sơn th&ocirc;ng thường.</p>\\n<p dir=\\\"ltr\\\"><strong>Mạ điện:</strong> Mạ điện c&oacute; thể tốn k&eacute;m hơn v&agrave; g&acirc;y &ocirc; nhiễm m&ocirc;i trường nhiều hơn so với sơn tĩnh điện.</p>\\n<p dir=\\\"ltr\\\"><strong>Phủ nhựa: </strong>Phủ nhựa chỉ ph&ugrave; hợp với một số loại vật liệu nhất định v&agrave; c&oacute; thể ảnh hưởng đến trọng lượng v&agrave; độ linh hoạt của sản phẩm.</p>\\n<h2 dir=\\\"ltr\\\">2. Quy tr&igrave;nh gia c&ocirc;ng sơn tĩnh điện</h2>\\n<p dir=\\\"ltr\\\"><strong>L&agrave;m sạch bề mặt:</strong> Bề mặt kim loại cần được l&agrave;m sạch ho&agrave;n to&agrave;n bụi bẩn, dầu mỡ, rỉ s&eacute;t để đảm bảo độ b&aacute;m d&iacute;nh tốt của lớp sơn.</p>\\n<p dir=\\\"ltr\\\"><strong>Tiền xử l&yacute;:</strong> Bề mặt kim loại c&oacute; thể được mạ kẽm, phosphat h&oacute;a hoặc anodized để tăng độ b&aacute;m d&iacute;nh v&agrave; chống ăn m&ograve;n.</p>\\n<p dir=\\\"ltr\\\"><strong>Phun sơn:</strong> Bột sơn được phun l&ecirc;n bề mặt kim loại bằng s&uacute;ng phun tĩnh điện. Lực h&uacute;t tĩnh điện sẽ gi&uacute;p bột sơn b&aacute;m đều l&ecirc;n bề mặt.</p>\\n<p dir=\\\"ltr\\\"><strong>Nung n&oacute;ng: </strong>Bề mặt được nung n&oacute;ng ở nhiệt độ nhất định để bột sơn chảy ra v&agrave; tạo th&agrave;nh lớp phủ rắn chắc.</p>\\n<p dir=\\\"ltr\\\"><strong>L&agrave;m nguội:</strong> Bề mặt được l&agrave;m nguội tự nhi&ecirc;n hoặc bằng quạt gi&oacute;.</p>\\n<p dir=\\\"ltr\\\"><img src=\\\"/storage/8n1z1obUU6fNFAUoHcNa4VyUS7bIM1PkPmsLHVnZ.jpg\\\" alt=\\\"he-thong-son-tinh-dien\\\" width=\\\"800\\\" height=\\\"600\\\"></p>\\n<h2 dir=\\\"ltr\\\">3. Những lưu &yacute; khi chọn đơn vị gia c&ocirc;ng sơn tĩnh điện</h2>\\n<p dir=\\\"ltr\\\">Để đảm bảo chất lượng sản phẩm, độ bền đẹp v&agrave; hiệu quả sử dụng l&acirc;u d&agrave;i đ&ograve;i hỏi việc lựa chọn đơn vị gia c&ocirc;ng sơn tĩnh điện uy t&iacute;n v&agrave; chất lượng l&agrave; v&ocirc; c&ugrave;ng quan trọng. Tuy nhi&ecirc;n, với v&ocirc; số đơn vị gia c&ocirc;ng hiện nay, việc t&igrave;m kiếm một địa chỉ tin cậy kh&ocirc;ng hề dễ d&agrave;ng.</p>\\n<p dir=\\\"ltr\\\">Hiểu được điều n&agrave;y, b&agrave;i viết n&agrave;y xin chia sẻ những lưu &yacute; quan trọng khi lựa chọn đơn vị gia c&ocirc;ng sơn tĩnh điện.</p>\\n<h3 dir=\\\"ltr\\\">3.1. Kinh nghiệm v&agrave; năng lực của đơn vị</h3>\\n<p dir=\\\"ltr\\\"><strong>Kinh nghiệm: </strong>Ưu ti&ecirc;n lựa chọn đơn vị c&oacute; nhiều năm kinh nghiệm trong lĩnh vực sơn tĩnh điện, đ&atilde; thực hiện nhiều dự &aacute;n cho c&aacute;c kh&aacute;ch h&agrave;ng kh&aacute;c nhau.</p>\\n<p dir=\\\"ltr\\\"><strong>Năng lực:</strong> Đ&aacute;nh gi&aacute; năng lực của đơn vị qua c&aacute;c yếu tố như: quy m&ocirc; nh&agrave; xưởng, trang thiết bị m&aacute;y m&oacute;c hiện đại, đội ngũ kỹ thuật vi&ecirc;n tay nghề cao, quy tr&igrave;nh thi c&ocirc;ng chuy&ecirc;n nghiệp, khả năng đ&aacute;p ứng tiến độ thi c&ocirc;ng của đơn vị, hỗ trợ tư vấn v&agrave; dịch vụ kh&aacute;ch h&agrave;ng của đơn vị</p>\\n<h3 dir=\\\"ltr\\\">3.2. Chất lượng sơn v&agrave; dịch vụ</h3>\\n<p dir=\\\"ltr\\\"><strong>Chất lượng sơn:</strong> Sử dụng sơn ch&iacute;nh h&atilde;ng, c&oacute; nguồn gốc r&otilde; r&agrave;ng, đảm bảo chất lượng tốt v&agrave; an to&agrave;n cho sức khỏe.</p>\\n<p dir=\\\"ltr\\\"><strong>Dịch vụ:</strong> Tham khảo c&aacute;c dịch vụ đi k&egrave;m như: tiền xử l&yacute; bề mặt, tư vấn lựa chọn loại sơn ph&ugrave; hợp, kiểm tra chất lượng sản phẩm sau khi sơn,...</p>\\n<p dir=\\\"ltr\\\"><img src=\\\"/storage/00ZiRjzVpWW8U9UsayBgrPsU9hvLQJj3mIn0xzgm.jpg\\\" alt=\\\"mau-son-tinh-dien\\\" width=\\\"800\\\" height=\\\"600\\\"></p>\\n<h3 dir=\\\"ltr\\\">3.3. Gi&aacute; cả v&agrave; chế độ bảo h&agrave;nh</h3>\\n<p dir=\\\"ltr\\\"><strong>Gi&aacute; cả:</strong> Tham khảo gi&aacute; cả của nhiều đơn vị kh&aacute;c nhau để lựa chọn được mức gi&aacute; hợp l&yacute; nhất.</p>\\n<p dir=\\\"ltr\\\"><strong>Chế độ bảo h&agrave;nh:</strong> Lựa chọn đơn vị c&oacute; chế độ bảo h&agrave;nh l&acirc;u d&agrave;i, đảm bảo uy t&iacute;n v&agrave; tr&aacute;ch nhiệm.</p>\\n<h3 dir=\\\"ltr\\\">4.4. Tham khảo đ&aacute;nh gi&aacute; v&agrave; phản hồi của kh&aacute;ch h&agrave;ng</h3>\\n<p dir=\\\"ltr\\\">T&igrave;m hiểu đ&aacute;nh gi&aacute; v&agrave; phản hồi của kh&aacute;ch h&agrave;ng đ&atilde; sử dụng dịch vụ của đơn vị qua c&aacute;c k&ecirc;nh như website, mạng x&atilde; hội,...</p>\\n<p dir=\\\"ltr\\\">Tham khảo c&aacute;c dự &aacute;n ti&ecirc;u biểu m&agrave; đơn vị đ&atilde; thực hiện để đ&aacute;nh gi&aacute; năng lực v&agrave; chất lượng dịch vụ.</p>\\n<h3 dir=\\\"ltr\\\">4.5. Tham quan nh&agrave; xưởng v&agrave; quy tr&igrave;nh sản xuất</h3>\\n<p dir=\\\"ltr\\\">Nếu c&oacute; thể, h&atilde;y đến trực tiếp nh&agrave; xưởng của đơn vị để tham quan cơ sở vật chất, trang thiết bị v&agrave; quy tr&igrave;nh sản xuất.</p>\\n<p dir=\\\"ltr\\\">Quan s&aacute;t th&aacute;i độ l&agrave;m việc của nh&acirc;n vi&ecirc;n v&agrave; trao đổi trực tiếp với đại diện đơn vị để giải đ&aacute;p thắc mắc.</p>\\n<p><strong>&nbsp;<em>Tự h&agrave;o l&agrave; đơn vị đ&aacute;p ứng đầy đủ c&aacute;c ti&ecirc;u chuẩn tr&ecirc;n, GEMQ tự tin l&agrave; đơn vị gia c&ocirc;ng sơn tĩnh điện uy t&iacute;n h&agrave;ng đầu thị trường hiện nay. H&atilde;y đến với GEMQ để trải nghiệm dịch vụ chất lượng cao v&agrave; nhận được sản phẩm ho&agrave;n hảo nhất!</em></strong></p>\\n<p dir=\\\"ltr\\\"><strong>Lựa chọn GEMQ l&agrave; lựa chọn th&ocirc;ng minh!</strong></p>\\n<p><strong id=\\\"docs-internal-guid-85c828b0-7fff-5da1-963c-e9dfe4c68881\\\">&nbsp;</strong></p>\", \"custom_classes\": null, \"container_width\": \"container\"}, \"type\": \"Text\"}]}','{\"en\":\"gia-cong-son-tinh-dien\"}',1,'2024-04-23 21:41:25','2024-04-25 00:19:08'),(12,'{\"en\":\"Gia c\\u00f4ng c\\u1eaft laser CNC\"}','gia-cong-cat-laser-cnc',NULL,NULL,NULL,NULL,NULL,'{\"en\":\"Gia c\\u00f4ng c\\u1eaft laser CNC\"}','{\"en\":\"gia c\\u00f4ng c\\u1eaft laser cnc\"}','{\"en\": \"gia công cắt laser cnc\"}',NULL,NULL,'{\"en\": [{\"data\": {\"title\": \"Gia công cắt laser CNC\", \"content\": \"<p dir=\\\"ltr\\\">Khi khoa học kỹ thuật ng&agrave;y c&agrave;ng ph&aacute;t triển, nhu cầu gia c&ocirc;ng c&aacute;c chi tiết phức tạp, ch&iacute;nh x&aacute;c v&agrave; nhanh ch&oacute;ng ng&agrave;y c&agrave;ng cao. Nhằm đ&aacute;p ứng nhu cầu đ&oacute;, dịch vụ gia c&ocirc;ng cắt laser CNC đ&atilde; ra đời v&agrave; trở th&agrave;nh giải ph&aacute;p tối ưu cho nhiều ng&agrave;nh c&ocirc;ng nghiệp.</p>\\n<p dir=\\\"ltr\\\"><img src=\\\"/storage/60GwVm6O5UFRW3JI0xRfbwU1h1dtAVWhEZXG6ZhQ.jpg\\\" alt=\\\"may-laser-cnc\\\" width=\\\"800\\\" height=\\\"600\\\"></p>\\n<h2 dir=\\\"ltr\\\">1. Cắt laser CNC l&agrave; g&igrave;?</h2>\\n<p dir=\\\"ltr\\\">Cắt laser CNC l&agrave; phương ph&aacute;p gia c&ocirc;ng kim loại, phi kim loại sử dụng tia laser cường độ cao để cắt theo đường viền được lập tr&igrave;nh sẵn tr&ecirc;n m&aacute;y t&iacute;nh. Tia laser di chuyển với tốc độ cao, tạo ra đường cắt sắc n&eacute;t, ch&iacute;nh x&aacute;c v&agrave; &iacute;t dăm thừa tr&ecirc;n m&eacute;p cắt.</p>\\n<h2 dir=\\\"ltr\\\">2. V&igrave; sao cần sử dụng dịch vụ cắt laser CNC?</h2>\\n<p dir=\\\"ltr\\\">So với c&aacute;c phương ph&aacute;p gia c&ocirc;ng truyền thống như cắt thủ c&ocirc;ng, cắt bằng dao phay, cắt plasma, cắt laser CNC mang lại nhiều ưu điểm vượt trội:</p>\\n<ul>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\"><strong>Độ ch&iacute;nh x&aacute;c cao: </strong>Cắt laser CNC đảm bảo độ ch&iacute;nh x&aacute;c cao đến từng milimet, đ&aacute;p ứng y&ecirc;u cầu khắt khe của c&aacute;c ng&agrave;nh c&ocirc;ng nghiệp như h&agrave;ng kh&ocirc;ng, y tế, điện tử,...</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\"><strong>Hiệu quả cao:</strong> Tốc độ cắt nhanh, &iacute;t bavớ, giảm thiểu hao ph&iacute; vật liệu, tiết kiệm thời gian v&agrave; chi ph&iacute; sản xuất.</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\"><strong>T&iacute;nh linh hoạt: </strong>Cắt được nhiều loại vật liệu kim loại, phi kim loại như th&eacute;p, nh&ocirc;m, đồng, mica, acrylic,... với độ d&agrave;y đa dạng.</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\"><strong>Thiết kế phức tạp:</strong> Cắt được c&aacute;c chi tiết c&oacute; h&igrave;nh dạng phức tạp, hoa văn tinh xảo m&agrave; c&aacute;c phương ph&aacute;p kh&aacute;c kh&oacute; hoặc kh&ocirc;ng thể thực hiện.</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\"><strong>Độ an to&agrave;n cao: </strong>Qu&aacute; tr&igrave;nh cắt diễn ra tự động, hạn chế tối đa sự tiếp x&uacute;c của con người với vật liệu, đảm bảo an to&agrave;n lao động.</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\"><img src=\\\"/storage/jftQiUfkfGJunckk72qcrMqg0MJaQI3PdpMja3Du.jpg\\\" alt=\\\"cat-chi-tiet-bang-may-laser\\\" width=\\\"800\\\" height=\\\"600\\\"></p>\\n</li>\\n</ul>\\n<h2 dir=\\\"ltr\\\">3. C&aacute;c dịch vụ cắt laser CNC phổ biến</h2>\\n<ul>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\"><strong>Cắt kim loại tấm: </strong>th&eacute;p, nh&ocirc;m, đồng, inox,...</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\"><strong>Cắt phi kim loại: </strong>mica, acrylic, gỗ, da, nhựa,...</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\"><strong>Cắt theo y&ecirc;u cầu: </strong>cắt theo bản vẽ, mẫu m&atilde;, thiết kế của kh&aacute;ch h&agrave;ng.</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\"><strong>Cắt hoa văn, tạo h&igrave;nh: </strong>cắt logo, chữ, hoa văn trang tr&iacute;,...</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\"><strong>Cắt khắc laser:</strong> khắc logo, chữ, th&ocirc;ng tin sản phẩm,...</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\"><strong>Đ&aacute;nh dấu laser: </strong>Đ&aacute;nh dấu laser c&oacute; thể đ&aacute;nh dấu m&atilde; sản phẩm, th&ocirc;ng tin kỹ thuật,... tr&ecirc;n bề mặt vật liệu.</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\"><img src=\\\"/storage/MkDtDYnzCYoXcUDBKhw7tyT1Dl9mc5METPbJRyfr.jpg\\\" alt=\\\"cat-laser-kim-loai\\\" width=\\\"800\\\" height=\\\"600\\\"></p>\\n</li>\\n</ul>\\n<h2 dir=\\\"ltr\\\">4. B&iacute; quyết lựa chọn đơn vị cung cấp dịch vụ gia c&ocirc;ng cắt laser CNC</h2>\\n<ul>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\"><strong>Kinh nghiệm v&agrave; uy t&iacute;n: </strong>Đ&acirc;y l&agrave; yếu tố ưu ti&ecirc;n h&agrave;ng đầu. Việc lựa chọn đơn vị c&oacute; nhiều năm kinh nghiệm trong lĩnh vực gia c&ocirc;ng cắt laser CNC, được kh&aacute;ch h&agrave;ng đ&aacute;nh gi&aacute; cao.</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\"><strong>Trang thiết bị hiện đại: </strong>Sử dụng m&aacute;y m&oacute;c laser ti&ecirc;n tiến, đảm bảo độ ch&iacute;nh x&aacute;c v&agrave; hiệu quả cao trong qu&aacute; tr&igrave;nh cắt.</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\"><strong>Đội ngũ kỹ thuật tay nghề cao:</strong> C&oacute; đội ngũ kỹ thuật vi&ecirc;n chuy&ecirc;n nghiệp, am hiểu về c&ocirc;ng nghệ cắt laser CNC v&agrave; c&aacute;c loại vật liệu.</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\"><strong>Gi&aacute; cả cạnh tranh: </strong>Cung cấp dịch vụ với mức gi&aacute; hợp l&yacute;, ph&ugrave; hợp với nhu cầu v&agrave; ng&acirc;n s&aacute;ch của kh&aacute;ch h&agrave;ng.</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\"><strong>Dịch vụ kh&aacute;ch h&agrave;ng chu đ&aacute;o:</strong> Tư vấn tận t&igrave;nh, giải đ&aacute;p mọi thắc mắc của kh&aacute;ch h&agrave;ng, đảm bảo tiến độ v&agrave; chất lượng sản phẩm.</p>\\n</li>\\n</ul>\\n<p><strong>&nbsp;</strong>Dịch vụ gia c&ocirc;ng cắt laser CNC mang lại nhiều lợi &iacute;ch cho c&aacute;c doanh nghiệp v&agrave; c&aacute; nh&acirc;n trong nhiều lĩnh vực kh&aacute;c nhau. Việc lựa chọn đơn vị cung cấp dịch vụ uy t&iacute;n sẽ gi&uacute;p bạn c&oacute; được sản phẩm chất lượng cao với gi&aacute; cả hợp l&yacute;.</p>\\n<p dir=\\\"ltr\\\"><strong><em>C&ocirc;ng ty GEMQ tự h&agrave;o l&agrave; đơn vị cung cấp dịch vụ gia c&ocirc;ng cắt laser CNC đ&aacute;p ứng đầy đủ c&aacute;c ti&ecirc;u chuẩn tr&ecirc;n v&agrave; l&agrave; đơn vị gia c&ocirc;ng uy t&iacute;n chất lượng gi&aacute; cả cạnh tranh nhất trong ng&agrave;nh.&nbsp;</em></strong></p>\\n<p dir=\\\"ltr\\\"><strong>Li&ecirc;n hệ ngay GEMQ để nhận tư vấn v&agrave; b&aacute;o gi&aacute; tốt nhất thị trường!</strong></p>\\n<p>&nbsp;</p>\", \"custom_classes\": null, \"container_width\": \"container\"}, \"type\": \"Text\"}]}','{\"en\":\"gia-cong-cat-laser-cnc\"}',1,'2024-04-23 21:46:15','2024-04-25 00:23:52'),(13,'{\"en\":\"Gia c\\u00f4ng \\u0111\\u1ed9t CNC\"}','gia-cong-dot-cnc',NULL,NULL,NULL,NULL,NULL,'{\"en\":\"Gia c\\u00f4ng \\u0111\\u1ed9t CNC\"}','{\"en\":\"gia c\\u00f4ng \\u0111\\u1ed9t cnc\"}','{\"en\": \"gia công đột cnc\"}',NULL,NULL,'{\"en\": [{\"data\": {\"title\": \"Gia công đột CNC\", \"content\": \"<p dir=\\\"ltr\\\">Gia c&ocirc;ng đột CNC l&agrave; một phương ph&aacute;p gia c&ocirc;ng kim loại tấm hiện đại, mang lại nhiều lợi &iacute;ch cho sản xuất c&ocirc;ng nghiệp. Với độ ch&iacute;nh x&aacute;c cao, hiệu suất vượt trội v&agrave; khả năng tạo h&igrave;nh linh hoạt, gia c&ocirc;ng đột CNC đang dần trở th&agrave;nh lựa chọn h&agrave;ng đầu cho c&aacute;c doanh nghiệp trong nhiều lĩnh vực kh&aacute;c nhau.</p>\\n<h2 dir=\\\"ltr\\\">1. Đột CNC l&agrave; g&igrave;?</h2>\\n<p dir=\\\"ltr\\\">Đột CNC (Computer Numerical Control) l&agrave; phương ph&aacute;p gia c&ocirc;ng kim loại tấm phổ biến trong ng&agrave;nh c&ocirc;ng nghiệp hiện đại. Sử dụng m&aacute;y m&oacute;c điều khiển bằng chương tr&igrave;nh m&aacute;y t&iacute;nh, quy tr&igrave;nh n&agrave;y mang đến độ ch&iacute;nh x&aacute;c cao, hiệu suất vượt trội v&agrave; khả năng tạo h&igrave;nh linh hoạt cho nhiều chi tiết phức tạp.</p>\\n<p dir=\\\"ltr\\\"><img src=\\\"/storage/H9Mxh1AG1a44X7o9lIpT5FRQylnJk2o948giSWEF.jpg\\\" alt=\\\"may-dot-cnc\\\" width=\\\"800\\\" height=\\\"600\\\"></p>\\n<h2 dir=\\\"ltr\\\">2. C&aacute;c loại lỗ đột CNC</h2>\\n<p dir=\\\"ltr\\\">C&oacute; nhiều loại lỗ đột CNC phổ biến, bao gồm:</p>\\n<ul>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\"><strong>Lỗ tr&ograve;n: </strong>Loại lỗ phổ biến nhất, được sử dụng trong nhiều ứng dụng kh&aacute;c nhau.</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\"><strong>Lỗ vu&ocirc;ng:</strong> Thường được sử dụng cho c&aacute;c chi tiết c&oacute; kết cấu vu&ocirc;ng g&oacute;c.</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\"><strong>Lỗ chữ nhật:</strong> D&ugrave;ng cho c&aacute;c chi tiết c&oacute; h&igrave;nh dạng chữ nhật.</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\"><strong>Lỗ bầu dục:</strong> Th&iacute;ch hợp cho c&aacute;c chi tiết cần độ linh hoạt về h&igrave;nh dạng.</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\"><strong>Lỗ h&igrave;nh thang:</strong> D&ugrave;ng cho c&aacute;c chi tiết c&oacute; kết cấu h&igrave;nh thang.</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\"><strong>Lỗ dạng t&ugrave;y chỉnh: </strong>C&oacute; thể tạo ra bất kỳ h&igrave;nh dạng n&agrave;o theo y&ecirc;u cầu thiết kế.</p>\\n</li>\\n</ul>\\n<p dir=\\\"ltr\\\">Ngo&agrave;i ra, c&ograve;n c&oacute; c&aacute;c loại lỗ đột kh&aacute;c như lỗ răng cưa, lỗ đinh t&aacute;n, lỗ xoắn ốc,...</p>\\n<p dir=\\\"ltr\\\"><img src=\\\"/storage/BoMPUfKeSHZ4muytMTw14vB5zd5oOnr5Fl8Nnx8b.jpg\\\" alt=\\\"dot-lo-tron\\\" width=\\\"800\\\" height=\\\"600\\\"></p>\\n<h2 dir=\\\"ltr\\\">3. C&aacute;c loại vật liệu c&oacute; thể đột CNC</h2>\\n<p dir=\\\"ltr\\\">Gia c&ocirc;ng đột CNC c&oacute; thể thực hiện tr&ecirc;n nhiều loại vật liệu kim loại tấm kh&aacute;c nhau, bao gồm:</p>\\n<ul>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\"><strong>Th&eacute;p: </strong>Vật liệu phổ biến nhất, được sử dụng trong nhiều ng&agrave;nh c&ocirc;ng nghiệp như x&acirc;y dựng, chế tạo m&aacute;y m&oacute;c, đ&oacute;ng t&agrave;u,...</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\"><strong>Nh&ocirc;m: </strong>Nhẹ v&agrave; dễ gia c&ocirc;ng, th&iacute;ch hợp cho c&aacute;c ứng dụng cần độ nhẹ v&agrave; chống gỉ.</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\"><strong>Đồng: </strong>C&oacute; độ dẫn điện v&agrave; dẫn nhiệt cao, được sử dụng trong ng&agrave;nh điện tử v&agrave; cơ điện.</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\"><strong>Inox:</strong> Chống gỉ v&agrave; ăn m&ograve;n tốt, th&iacute;ch hợp cho c&aacute;c ứng dụng trong m&ocirc;i trường khắc nghiệt.</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\"><strong>T&ocirc;n mạ kẽm: </strong>Gi&aacute; th&agrave;nh rẻ, được sử dụng trong x&acirc;y dựng v&agrave; sản xuất c&aacute;c đồ gia dụng.</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\"><img src=\\\"/storage/uPijhPXUHnMADpcJS4p5zwodNMEtKjNsyUjAvZn8.jpg\\\" alt=\\\"dot-dap-cnc\\\" width=\\\"800\\\" height=\\\"600\\\"></li>\\n</ul>\\n<h2 dir=\\\"ltr\\\">4. Vai tr&ograve; của dịch vụ gia c&ocirc;ng đột CNC trong sản xuất c&ocirc;ng nghiệp</h2>\\n<p dir=\\\"ltr\\\">Gia c&ocirc;ng đột CNC đ&oacute;ng vai tr&ograve; quan trọng trong sản xuất c&ocirc;ng nghiệp, mang lại nhiều lợi &iacute;ch như:</p>\\n<ul>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\"><strong>Tăng năng suất: </strong>M&aacute;y m&oacute;c CNC hoạt động tự động, li&ecirc;n tục, gi&uacute;p gia c&ocirc;ng chi tiết nhanh ch&oacute;ng v&agrave; ch&iacute;nh x&aacute;c hơn so với phương ph&aacute;p thủ c&ocirc;ng.</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\"><strong>N&acirc;ng cao chất lượng sản phẩm:</strong> Độ ch&iacute;nh x&aacute;c cao của m&aacute;y CNC đảm bảo sản phẩm đạt chất lượng cao, đ&aacute;p ứng y&ecirc;u cầu kỹ thuật khắt khe.</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\"><strong>Tiết kiệm chi ph&iacute;: </strong>Giảm thiểu hao ph&iacute; vật liệu, hạn chế lỗi sai v&agrave; tối ưu h&oacute;a quy tr&igrave;nh sản xuất, gi&uacute;p doanh nghiệp tiết kiệm chi ph&iacute; hiệu quả.</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\"><strong>Tăng t&iacute;nh linh hoạt:</strong> M&aacute;y CNC c&oacute; thể gia c&ocirc;ng nhiều loại h&igrave;nh dạng, k&iacute;ch thước v&agrave; độ d&agrave;y kh&aacute;c nhau, đ&aacute;p ứng mọi y&ecirc;u cầu thiết kế.</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\"><strong>An to&agrave;n lao động: </strong>M&aacute;y m&oacute;c vận h&agrave;nh tự động, hạn chế sự tham gia trực tiếp của con người, đảm bảo an to&agrave;n lao động cao.</p>\\n</li>\\n</ul>\\n<p dir=\\\"ltr\\\">Gia c&ocirc;ng đột CNC đ&oacute;ng vai tr&ograve; quan trọng trong nhiều ng&agrave;nh c&ocirc;ng nghiệp, g&oacute;p phần tạo n&ecirc;n những sản phẩm chất lượng cao, đ&aacute;p ứng nhu cầu thị trường. Tuy nhi&ecirc;n, việc lựa chọn đơn vị gia c&ocirc;ng uy t&iacute;n, đảm bảo chất lượng l&agrave; điều kh&ocirc;ng đơn giản. Dưới đ&acirc;y l&agrave; một số ti&ecirc;u ch&iacute; quan trọng gi&uacute;p bạn đưa ra quyết định s&aacute;ng suốt.</p>\\n<p dir=\\\"ltr\\\"><img src=\\\"/storage/j3HlNBUpYaM3Js2nYI8thsuOn1Fgs5PN0d261CM4.jpg\\\" alt=\\\"dot-lo-hinh-bau-duc\\\" width=\\\"800\\\" height=\\\"600\\\"></p>\\n<h2 dir=\\\"ltr\\\">5. C&aacute;c ti&ecirc;u ch&iacute; lựa chọn đơn vị gia c&ocirc;ng đột CNC</h2>\\n<h3 dir=\\\"ltr\\\">5.1. Kinh nghiệm v&agrave; năng lực</h3>\\n<ul>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\"><strong>Kinh nghiệm hoạt động:</strong> Ưu ti&ecirc;n những đơn vị c&oacute; nhiều năm kinh nghiệm trong lĩnh vực gia c&ocirc;ng đột CNC, đ&atilde; thực hiện th&agrave;nh c&ocirc;ng nhiều dự &aacute;n cho c&aacute;c kh&aacute;ch h&agrave;ng uy t&iacute;n.</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\"><strong>Năng lực kỹ thuật:</strong> Đ&aacute;nh gi&aacute; năng lực kỹ thuật của đội ngũ kỹ sư, kỹ thuật vi&ecirc;n th&ocirc;ng qua tr&igrave;nh độ chuy&ecirc;n m&ocirc;n, tay nghề cao, khả năng vận h&agrave;nh m&aacute;y m&oacute;c th&agrave;nh thạo v&agrave; xử l&yacute; c&aacute;c vấn đề kỹ thuật hiệu quả.</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\"><strong>Cơ sở vật chất: </strong>Tham quan nh&agrave; xưởng để đ&aacute;nh gi&aacute; quy m&ocirc;, trang thiết bị m&aacute;y m&oacute;c hiện đại, đảm bảo đ&aacute;p ứng được y&ecirc;u cầu gia c&ocirc;ng của bạn.</p>\\n</li>\\n</ul>\\n<h3 dir=\\\"ltr\\\">5.2. Chất lượng sản phẩm</h3>\\n<ul>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\"><strong>Độ ch&iacute;nh x&aacute;c:</strong> Y&ecirc;u cầu cung cấp mẫu sản phẩm hoặc bản vẽ chi tiết để đ&aacute;nh gi&aacute; độ ch&iacute;nh x&aacute;c của gia c&ocirc;ng, đảm bảo đ&aacute;p ứng y&ecirc;u cầu kỹ thuật của bạn.</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\"><strong>Chất lượng bề mặt: </strong>Kiểm tra chất lượng bề mặt sản phẩm, đảm bảo kh&ocirc;ng c&oacute; lỗi, xước, mẻ, đảm bảo t&iacute;nh thẩm mỹ v&agrave; độ bền cho sản phẩm.</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\"><strong>Khả năng đ&aacute;p ứng ti&ecirc;u chuẩn:</strong> X&aacute;c định đơn vị c&oacute; khả năng đ&aacute;p ứng c&aacute;c ti&ecirc;u chuẩn chất lượng quốc tế hay ng&agrave;nh nghề cụ thể m&agrave; bạn y&ecirc;u cầu.</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\"><img src=\\\"/storage/mu7fjOIPStt3wUIymY1DKErp9mNziflinYuy2whD.jpg\\\" alt=\\\"dot-lo\\\" width=\\\"800\\\" height=\\\"600\\\"></li>\\n</ul>\\n<h3 dir=\\\"ltr\\\">5.3. Gi&aacute; cả cạnh tranh</h3>\\n<ul>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\">So s&aacute;nh b&aacute;o gi&aacute; từ nhiều đơn vị kh&aacute;c nhau: Y&ecirc;u cầu b&aacute;o gi&aacute; chi tiết cho từng hạng mục gia c&ocirc;ng, bao gồm gi&aacute; vật liệu, chi ph&iacute; gia c&ocirc;ng, vận chuyển, thuế,... để so s&aacute;nh v&agrave; lựa chọn đơn vị c&oacute; gi&aacute; cả hợp l&yacute;.</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\">C&acirc;n nhắc gi&aacute; cả đi k&egrave;m với chất lượng: Kh&ocirc;ng n&ecirc;n chỉ tập trung v&agrave;o gi&aacute; rẻ m&agrave; bỏ qua chất lượng sản phẩm v&agrave; dịch vụ. Lựa chọn đơn vị c&oacute; mức gi&aacute; ph&ugrave; hợp với gi&aacute; trị sản phẩm v&agrave; dịch vụ họ cung cấp.</p>\\n</li>\\n</ul>\\n<h3 dir=\\\"ltr\\\">5.4. Dịch vụ kh&aacute;ch h&agrave;ng chuy&ecirc;n nghiệp</h3>\\n<ul>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\"><strong>Th&aacute;i độ phục vụ:</strong> Đ&aacute;nh gi&aacute; th&aacute;i độ phục vụ của nh&acirc;n vi&ecirc;n, đảm bảo sự chuy&ecirc;n nghiệp, nhiệt t&igrave;nh, chu đ&aacute;o v&agrave; sẵn s&agrave;ng giải đ&aacute;p mọi thắc mắc của bạn.</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\"><strong>Ch&iacute;nh s&aacute;ch bảo h&agrave;nh:</strong> Y&ecirc;u cầu th&ocirc;ng tin chi tiết về ch&iacute;nh s&aacute;ch bảo h&agrave;nh sản phẩm, dịch vụ, đảm bảo quyền lợi của bạn khi sử dụng dịch vụ.</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\"><strong>Khả năng hỗ trợ sau b&aacute;n h&agrave;ng:</strong> Đ&aacute;nh gi&aacute; khả năng hỗ trợ sau b&aacute;n h&agrave;ng của đơn vị, đảm bảo hỗ trợ kịp thời, hiệu quả khi bạn gặp vấn đề với sản phẩm hoặc dịch vụ.</p>\\n</li>\\n</ul>\\n<h3 dir=\\\"ltr\\\">5.5. Uy t&iacute;n v&agrave; thương hiệu</h3>\\n<ul>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\"><strong>T&igrave;m hiểu thương hiệu:</strong> Tham khảo th&ocirc;ng tin về thương hiệu, uy t&iacute;n của đơn vị tr&ecirc;n thị trường, th&ocirc;ng qua website, đ&aacute;nh gi&aacute; của kh&aacute;ch h&agrave;ng, c&aacute;c dự &aacute;n đ&atilde; thực hiện,...</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\"><strong>Trao đổi với kh&aacute;ch h&agrave;ng cũ:</strong> Li&ecirc;n hệ với kh&aacute;ch h&agrave;ng cũ của đơn vị để t&igrave;m hiểu th&ecirc;m về chất lượng sản phẩm, dịch vụ v&agrave; trải nghiệm thực tế khi sử dụng dịch vụ.</p>\\n</li>\\n</ul>\\n<p><strong>&nbsp;</strong>Lựa chọn đơn vị gia c&ocirc;ng đột CNC uy t&iacute;n l&agrave; bước quan trọng đảm bảo chất lượng sản phẩm, tối ưu h&oacute;a chi ph&iacute; v&agrave; n&acirc;ng cao hiệu quả sản xuất cho doanh nghiệp. H&atilde;y c&acirc;n nhắc kỹ lưỡng c&aacute;c ti&ecirc;u ch&iacute; tr&ecirc;n để đưa ra quyết định s&aacute;ng suốt, g&oacute;p phần tạo n&ecirc;n th&agrave;nh c&ocirc;ng cho doanh nghiệp của bạn.</p>\\n<p><strong><em>&nbsp;GEMQ tự h&agrave;o l&agrave; đơn vị cung cấp dịch vụ gia c&ocirc;ng đột CNC uy t&iacute;n h&agrave;ng đầu tại Việt Nam, với nhiều năm kinh nghiệm v&agrave; đội ngũ nh&acirc;n vi&ecirc;n chuy&ecirc;n nghiệp, nhiệt t&igrave;nh. Ch&uacute;ng t&ocirc;i cam kết mang đến cho kh&aacute;ch h&agrave;ng những sản phẩm v&agrave; dịch vụ chất lượng cao với gi&aacute; cả cạnh tranh.</em></strong></p>\\n<p dir=\\\"ltr\\\"><strong><em>Với những l&yacute; do tr&ecirc;n, GEMQ tin tưởng sẽ l&agrave; lựa chọn ho&agrave;n hảo cho qu&yacute; kh&aacute;ch h&agrave;ng khi c&oacute; nhu cầu gia c&ocirc;ng đột CNC. H&atilde;y li&ecirc;n hệ với ch&uacute;ng t&ocirc;i ngay h&ocirc;m nay để được tư vấn v&agrave; hỗ trợ tốt nhất!</em></strong></p>\\n<p>&nbsp;</p>\", \"custom_classes\": null, \"container_width\": \"container\"}, \"type\": \"Text\"}]}','{\"en\":\"gia-cong-dot-cnc\"}',1,'2024-04-23 21:46:42','2024-04-25 02:28:50'),(14,'{\"en\":\"Gia c\\u00f4ng ch\\u1ea5n CNC\"}','gia-cong-chan-cnc',NULL,NULL,NULL,NULL,NULL,'{\"en\":\"Gia c\\u00f4ng ch\\u1ea5n CNC\"}','{\"en\":\"gia c\\u00f4ng ch\\u1ea5n cnc\"}','{\"en\": \"gia công chấn cnc\"}',NULL,NULL,'{\"en\": [{\"data\": {\"title\": \"Gia công chấn CNC\", \"content\": \"<p dir=\\\"ltr\\\">Gia c&ocirc;ng chấn CNC l&agrave; phương ph&aacute;p gia c&ocirc;ng kim loại sử dụng m&aacute;y chấn CNC hiện đại để tạo ra c&aacute;c chi tiết c&oacute; h&igrave;nh dạng phức tạp với độ ch&iacute;nh x&aacute;c cao. Phương ph&aacute;p n&agrave;y được ứng dụng rộng r&atilde;i trong nhiều ng&agrave;nh c&ocirc;ng nghiệp kh&aacute;c nhau, từ sản xuất &ocirc; t&ocirc;, h&agrave;ng kh&ocirc;ng vũ trụ đến điện tử, y tế v&agrave; nội thất.</p>\\n<p dir=\\\"ltr\\\"><img src=\\\"/storage/GoT7g1Yut5kNGCgHk83Q2Dpy6bdrSK7aivNoQprn.jpg\\\" alt=\\\"chan-cnc\\\" width=\\\"800\\\" height=\\\"600\\\"></p>\\n<h2><strong>&nbsp;</strong>1. C&aacute;c loại kim loại được sử dụng để gia c&ocirc;ng chấn CNC phổ biến</h2>\\n<h3 dir=\\\"ltr\\\">1.1. Th&eacute;p</h3>\\n<p dir=\\\"ltr\\\">Th&eacute;p l&agrave; vật liệu phổ biến nhất được sử dụng cho gia c&ocirc;ng chấn CNC do độ bền, độ cứng v&agrave; khả năng chịu lực cao.</p>\\n<p dir=\\\"ltr\\\">Một số loại th&eacute;p thường d&ugrave;ng bao gồm: Th&eacute;p cacbon, th&eacute;p hợp kim, th&eacute;p kh&ocirc;ng gỉ.</p>\\n<h3 dir=\\\"ltr\\\">1.2. Nh&ocirc;m</h3>\\n<p dir=\\\"ltr\\\">Nh&ocirc;m l&agrave; vật liệu nhẹ, dễ gia c&ocirc;ng v&agrave; c&oacute; khả năng chống ăn m&ograve;n tốt.</p>\\n<p dir=\\\"ltr\\\">Một số loại nh&ocirc;m phổ biến bao gồm: Nh&ocirc;m 6061, nh&ocirc;m 5052.</p>\\n<h3 dir=\\\"ltr\\\">1.3. Đồng</h3>\\n<p dir=\\\"ltr\\\">Đồng l&agrave; vật liệu dẫn điện v&agrave; dẫn nhiệt tốt, c&oacute; khả năng chống ăn m&ograve;n tốt v&agrave; dễ gia c&ocirc;ng.</p>\\n<p dir=\\\"ltr\\\">Một số loại đồng phổ biến bao gồm:Đồng C101, đồng C104.&nbsp;</p>\\n<h3 dir=\\\"ltr\\\">1.4. Inox</h3>\\n<p dir=\\\"ltr\\\">Inox l&agrave; hợp kim th&eacute;p c&oacute; khả năng chống gỉ s&eacute;t cao, chịu được nhiệt độ cao v&agrave; dễ vệ sinh.</p>\\n<p dir=\\\"ltr\\\">Một số loại inox phổ biến bao gồm: Inox 304, inox 316</p>\\n<h3 dir=\\\"ltr\\\">1.5. C&aacute;c kim loại kh&aacute;c</h3>\\n<p dir=\\\"ltr\\\">Ngo&agrave;i c&aacute;c loại kim loại phổ biến được liệt k&ecirc; ở tr&ecirc;n, gia c&ocirc;ng chấn CNC c&ograve;n c&oacute; thể được sử dụng cho một số kim loại kh&aacute;c như titan, magi&ecirc;, đồng thau,... Tuy nhi&ecirc;n, việc sử dụng c&aacute;c kim loại n&agrave;y thường tốn k&eacute;m hơn v&agrave; đ&ograve;i hỏi kỹ thuật gia c&ocirc;ng cao hơn.</p>\\n<p dir=\\\"ltr\\\"><img src=\\\"/storage/V31YUPXkWuSoNmmkncYBl59AtrSGV7jP0qtk6k9l.jpg\\\" alt=\\\"mau-chan-cnc\\\" width=\\\"800\\\" height=\\\"600\\\"></p>\\n<h2 dir=\\\"ltr\\\">2. Ưu điểm của gia c&ocirc;ng chấn CNC theo y&ecirc;u cầu</h2>\\n<p dir=\\\"ltr\\\"><strong>Độ ch&iacute;nh x&aacute;c cao:</strong> M&aacute;y chấn CNC được điều khiển bằng chương tr&igrave;nh m&aacute;y t&iacute;nh, đảm bảo độ ch&iacute;nh x&aacute;c cao v&agrave; đồng nhất cho c&aacute;c chi tiết sản xuất.</p>\\n<p dir=\\\"ltr\\\"><strong>Hiệu quả cao: </strong>Gia c&ocirc;ng chấn CNC c&oacute; thể thực hiện nhiều thao t&aacute;c c&ugrave;ng l&uacute;c, gi&uacute;p tăng năng suất v&agrave; tiết kiệm thời gian sản xuất.</p>\\n<p dir=\\\"ltr\\\"><strong>T&iacute;nh linh hoạt: </strong>Gia c&ocirc;ng chấn CNC c&oacute; thể gia c&ocirc;ng nhiều loại vật liệu kh&aacute;c nhau, bao gồm kim loại tấm, kim loại phi kim loại v&agrave; nhựa.</p>\\n<p dir=\\\"ltr\\\"><strong>Tiết kiệm chi ph&iacute;: </strong>Gia c&ocirc;ng chấn CNC gi&uacute;p giảm thiểu hao ph&iacute; vật liệu v&agrave; nh&acirc;n c&ocirc;ng, từ đ&oacute; tiết kiệm chi ph&iacute; sản xuất.</p>\\n<h2 dir=\\\"ltr\\\">3. Ứng dụng của gia c&ocirc;ng chấn CNC</h2>\\n<p dir=\\\"ltr\\\">Gia c&ocirc;ng chấn CNC được ứng dụng rộng r&atilde;i trong nhiều ng&agrave;nh c&ocirc;ng nghiệp kh&aacute;c nhau, bao gồm:</p>\\n<ul>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\"><strong>Sản xuất &ocirc; t&ocirc;: </strong>Gia c&ocirc;ng chấn CNC được sử dụng để sản xuất c&aacute;c chi tiết &ocirc; t&ocirc; như vỏ xe, khung xe, cửa xe, bảng điều khiển,...</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\"><strong>H&agrave;ng kh&ocirc;ng vũ trụ:</strong> Gia c&ocirc;ng chấn CNC được sử dụng để sản xuất c&aacute;c chi tiết m&aacute;y bay như c&aacute;nh quạt, th&acirc;n m&aacute;y bay, khung gầm,...</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\"><strong>Điện tử: </strong>Gia c&ocirc;ng chấn CNC được sử dụng để sản xuất c&aacute;c chi tiết điện tử như vỏ m&aacute;y t&iacute;nh, vỏ điện thoại, bảng mạch,...</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\"><strong>Y tế: </strong>Gia c&ocirc;ng chấn CNC được sử dụng để sản xuất c&aacute;c thiết bị y tế như dụng cụ phẫu thuật, thiết bị cấy gh&eacute;p,...</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\"><strong>Nội thất:</strong> Gia c&ocirc;ng chấn CNC được sử dụng để sản xuất c&aacute;c chi tiết nội thất như tủ bếp, kệ tivi, b&agrave;n ghế,...</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\"><img src=\\\"/storage/IeSzTdtRKHZYnHhLvabmsx3fKAl2dmkefiYS42rI.jpg\\\" alt=\\\"khay-mang-cap\\\" width=\\\"800\\\" height=\\\"600\\\"></li>\\n</ul>\\n<h2 dir=\\\"ltr\\\">4. Những tiện &iacute;ch khi chọn gia c&ocirc;ng chấn CNC tại GEMQ</h2>\\n<p dir=\\\"ltr\\\">Trong ng&agrave;nh gia c&ocirc;ng cơ kh&iacute; hiện đại, gia c&ocirc;ng chấn CNC đ&oacute;ng vai tr&ograve; quan trọng trong việc tạo ra c&aacute;c chi tiết kim loại ch&iacute;nh x&aacute;c, tinh xảo. Tuy nhi&ecirc;n, để t&igrave;m kiếm một đơn vị gia c&ocirc;ng chấn CNC uy t&iacute;n, chuy&ecirc;n nghiệp v&agrave; đảm bảo chất lượng sản phẩm l&agrave; điều kh&ocirc;ng hề dễ d&agrave;ng.</p>\\n<p dir=\\\"ltr\\\">H&atilde;y c&ugrave;ng kh&aacute;m ph&aacute; những điểm nổi bật sau đ&acirc;y của GEMQ để hiểu r&otilde; hơn về l&yacute; do tại sao bạn n&ecirc;n lựa chọn GEMQ cho nhu cầu gia c&ocirc;ng chấn CNC của m&igrave;nh.</p>\\n<p dir=\\\"ltr\\\"><img src=\\\"/storage/OElmgcjxSqCHVA26LbSWYGDR57XKnZlaWuzBpkX1.jpg\\\" alt=\\\"chan-inox\\\" width=\\\"800\\\" height=\\\"600\\\"></p>\\n<h3 dir=\\\"ltr\\\">4.1. Dịch vụ gia c&ocirc;ng chấn CNC chuy&ecirc;n nghiệp</h3>\\n<ul>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\"><strong>Tư vấn thiết kế:</strong> Đội ngũ kỹ thuật vi&ecirc;n gi&agrave;u kinh nghiệm của GEMQ sẽ tư vấn cho kh&aacute;ch h&agrave;ng về thiết kế chi tiết ph&ugrave; hợp với y&ecirc;u cầu v&agrave; ứng dụng, đảm bảo tối ưu h&oacute;a hiệu quả v&agrave; chi ph&iacute; sản xuất.</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\"><strong>Lập tr&igrave;nh CNC ch&iacute;nh x&aacute;c: </strong>GEMQ sử dụng phần mềm lập tr&igrave;nh CNC ti&ecirc;n tiến, đảm bảo độ ch&iacute;nh x&aacute;c cao cho chương tr&igrave;nh, gi&uacute;p tạo ra sản phẩm đạt chất lượng cao nhất.</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\"><strong>Gia c&ocirc;ng chấn CNC hiện đại: </strong>GEMQ sở hữu hệ thống m&aacute;y chấn CNC hiện đại, nhập khẩu từ c&aacute;c thương hiệu uy t&iacute;n tr&ecirc;n thế giới, đảm bảo độ ch&iacute;nh x&aacute;c v&agrave; năng suất cao trong qu&aacute; tr&igrave;nh gia c&ocirc;ng.</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\"><strong>Ho&agrave;n thiện v&agrave; kiểm tra kỹ lưỡng:</strong> Sau khi gia c&ocirc;ng, sản phẩm sẽ được ho&agrave;n thiện v&agrave; kiểm tra kỹ lưỡng theo quy tr&igrave;nh nghi&ecirc;m ngặt đảm bảo đ&aacute;p ứng mọi y&ecirc;u cầu của kh&aacute;ch h&agrave;ng.</p>\\n</li>\\n</ul>\\n<h3 dir=\\\"ltr\\\">4.2. Đội ngũ kỹ thuật vi&ecirc;n chuy&ecirc;n nghiệp</h3>\\n<p dir=\\\"ltr\\\">GEMQ sở hữu đội ngũ kỹ thuật vi&ecirc;n gi&agrave;u kinh nghiệm, được đ&agrave;o tạo b&agrave;i bản, c&oacute; chuy&ecirc;n m&ocirc;n cao trong lĩnh vực gia c&ocirc;ng chấn CNC.</p>\\n<p dir=\\\"ltr\\\">Đội ngũ kỹ thuật vi&ecirc;n lu&ocirc;n sẵn s&agrave;ng tư vấn v&agrave; hỗ trợ kh&aacute;ch h&agrave;ng giải quyết mọi vấn đề kỹ thuật một c&aacute;ch hiệu quả nhất.</p>\\n<h3 dir=\\\"ltr\\\">4.3. Gi&aacute; cả cạnh tranh</h3>\\n<p dir=\\\"ltr\\\">GEMQ lu&ocirc;n cam kết cung cấp dịch vụ gia c&ocirc;ng chấn CNC với gi&aacute; cả cạnh tranh nhất tr&ecirc;n thị trường.</p>\\n<p dir=\\\"ltr\\\">C&ocirc;ng ty &aacute;p dụng ch&iacute;nh s&aacute;ch ưu đ&atilde;i cho kh&aacute;ch h&agrave;ng th&acirc;n thiết v&agrave; kh&aacute;ch h&agrave;ng đặt h&agrave;ng số lượng lớn.</p>\\n<h3 dir=\\\"ltr\\\">4.4. Dịch vụ kh&aacute;ch h&agrave;ng chu đ&aacute;o</h3>\\n<p dir=\\\"ltr\\\">GEMQ lu&ocirc;n đặt lợi &iacute;ch của kh&aacute;ch h&agrave;ng l&ecirc;n h&agrave;ng đầu, cung cấp dịch vụ kh&aacute;ch h&agrave;ng chu đ&aacute;o, hỗ trợ kh&aacute;ch h&agrave;ng 24/7.</p>\\n<p dir=\\\"ltr\\\">C&ocirc;ng ty lu&ocirc;n sẵn s&agrave;ng lắng nghe &yacute; kiến phản hồi của kh&aacute;ch h&agrave;ng để kh&ocirc;ng ngừng n&acirc;ng cao chất lượng dịch vụ.</p>\\n<p><strong>&nbsp;</strong><strong>Li&ecirc;n hệ với GEMQ ngay h&ocirc;m nay để được tư vấn v&agrave; b&aacute;o gi&aacute; miễn ph&iacute;!</strong></p>\", \"custom_classes\": null, \"container_width\": \"container\"}, \"type\": \"Text\"}]}','{\"en\":\"gia-cong-chan-cnc\"}',1,'2024-04-23 21:47:11','2024-04-25 02:17:25'),(15,'{\"en\":\"Gia c\\u00f4ng h\\u00e0n\"}','Gia-cong-han',NULL,NULL,NULL,NULL,NULL,'{\"en\":\"Gia c\\u00f4ng h\\u00e0n\"}','{\"en\":\"gia c\\u00f4ng h\\u00e0n\"}','{\"en\": \"gia công hàn\"}',NULL,NULL,'{\"en\": [{\"data\": {\"title\": \"Gia công hàn\", \"content\": \"<p dir=\\\"ltr\\\">Gia c&ocirc;ng h&agrave;n l&agrave; kỹ thuật kết nối c&aacute;c chi tiết kim loại bằng c&aacute;ch sử dụng nhiệt độ cao để l&agrave;m n&oacute;ng chảy v&agrave; h&ograve;a tan vật liệu tại vị tr&iacute; cần h&agrave;n. Phương ph&aacute;p n&agrave;y được ứng dụng rộng r&atilde;i trong nhiều ng&agrave;nh c&ocirc;ng nghiệp, từ x&acirc;y dựng, đ&oacute;ng t&agrave;u, chế tạo m&aacute;y m&oacute;c đến sản xuất đồ gia dụng.</p>\\n<p><strong>&nbsp;</strong>Hiện nay, c&oacute; nhiều phương ph&aacute;p h&agrave;n kh&aacute;c nhau, mỗi phương ph&aacute;p c&oacute; ưu nhược điểm v&agrave; ph&ugrave; hợp với những loại vật liệu v&agrave; ứng dụng ri&ecirc;ng. Dưới đ&acirc;y l&agrave; 5 phương ph&aacute;p h&agrave;n phổ biến nhất.</p>\\n<h2 dir=\\\"ltr\\\">1. C&aacute;c phương ph&aacute;p h&agrave;n</h2>\\n<p dir=\\\"ltr\\\">C&oacute; nhiều phương ph&aacute;p gia c&ocirc;ng h&agrave;n kh&aacute;c nhau, bao gồm h&agrave;n que, h&agrave;n TIG, h&agrave;n MIG, h&agrave;n laser, h&agrave;n robot, v.v. Mỗi phương ph&aacute;p c&oacute; ưu điểm v&agrave; ph&ugrave; hợp với những loại vật liệu v&agrave; ứng dụng ri&ecirc;ng. Việc lựa chọn phương ph&aacute;p h&agrave;n ph&ugrave; hợp sẽ phụ thuộc v&agrave;o nhiều yếu tố như độ d&agrave;y vật liệu, h&igrave;nh dạng mối h&agrave;n, y&ecirc;u cầu kỹ thuật, ng&acirc;n s&aacute;ch, v.v.</p>\\n<h3 dir=\\\"ltr\\\">1.1. H&agrave;n que</h3>\\n<p dir=\\\"ltr\\\">Sử dụng điện cực n&oacute;ng chảy (que h&agrave;n) để tạo hồ quang điện, l&agrave;m n&oacute;ng chảy vật liệu h&agrave;n v&agrave; que h&agrave;n, tạo th&agrave;nh mối h&agrave;n.<strong><img src=\\\"/storage/1zd8OAOdOKKhIsAeMd0biZJGQTktQvCLr1jsG11N.jpg\\\" alt=\\\"han-que-dung-cach\\\" width=\\\"800\\\" height=\\\"600\\\"></strong></p>\\n<h4 dir=\\\"ltr\\\">1.1.1. Ưu điểm&nbsp;</h4>\\n<p dir=\\\"ltr\\\">Dễ d&agrave;ng thi c&ocirc;ng, ph&ugrave; hợp cho nhiều vị tr&iacute; h&agrave;n kh&aacute;c nhau.</p>\\n<p dir=\\\"ltr\\\">Chi ph&iacute; thấp, thiết bị đơn giản.</p>\\n<p dir=\\\"ltr\\\">H&agrave;n được nhiều loại vật liệu kim loại.</p>\\n<h4 dir=\\\"ltr\\\">1.1.2. Nhược điểm</h4>\\n<p dir=\\\"ltr\\\">Tốc độ h&agrave;n chậm.</p>\\n<p dir=\\\"ltr\\\">Mối h&agrave;n kh&ocirc;ng thẩm mỹ cao.</p>\\n<p dir=\\\"ltr\\\">Y&ecirc;u cầu kỹ năng thợ h&agrave;n cao.</p>\\n<p dir=\\\"ltr\\\">Nguy cơ bắn tia hồ quang v&agrave; kh&oacute;i bụi cao.</p>\\n<h4 dir=\\\"ltr\\\">1.1.3. Ứng dụng</h4>\\n<p dir=\\\"ltr\\\">Thường được sử dụng trong thi c&ocirc;ng kết cấu th&eacute;p, sửa chữa cơ kh&iacute;, h&agrave;n d&acirc;n dụng.</p>\\n<h3 dir=\\\"ltr\\\">1.2. H&agrave;n TIG</h3>\\n<p dir=\\\"ltr\\\">Sử dụng điện cực kh&ocirc;ng n&oacute;ng chảy (que vonfram) v&agrave; kh&iacute; bảo vệ (argon, heli) để tạo hồ quang điện, l&agrave;m n&oacute;ng chảy vật liệu h&agrave;n v&agrave; phụ gia h&agrave;n (que h&agrave;n), tạo th&agrave;nh mối h&agrave;n.</p>\\n<p dir=\\\"ltr\\\"><img src=\\\"/storage/QXqWFhzbpoVuutQwLEGSy4KFM9pQSEKGnXnDHNEr.jpg\\\" alt=\\\"ky-thuat-han-tig\\\" width=\\\"800\\\" height=\\\"600\\\"></p>\\n<h4 dir=\\\"ltr\\\">1.2.1. Ưu điểm&nbsp;</h4>\\n<p dir=\\\"ltr\\\">Mối h&agrave;n chất lượng cao, độ bền cao, thẩm mỹ đẹp.</p>\\n<p dir=\\\"ltr\\\">H&agrave;n được nhiều loại vật liệu kim loại, kể cả kim loại mỏng.</p>\\n<p dir=\\\"ltr\\\">&Iacute;t kh&oacute;i bụi, an to&agrave;n cho sức khỏe.</p>\\n<h4 dir=\\\"ltr\\\">1.2.2. Nhược điểm</h4>\\n<p dir=\\\"ltr\\\">Tốc độ h&agrave;n chậm hơn so với h&agrave;n MIG.</p>\\n<p dir=\\\"ltr\\\">Y&ecirc;u cầu kỹ năng thợ h&agrave;n co hơn.</p>\\n<p dir=\\\"ltr\\\">Chi ph&iacute; cao hơn so với h&agrave;n que.</p>\\n<h4 dir=\\\"ltr\\\">1.2.3. Ứng dụng</h4>\\n<p dir=\\\"ltr\\\">&nbsp;Thường được sử dụng trong h&agrave;n th&eacute;p kh&ocirc;ng gỉ, nh&ocirc;m, hợp kim titan, h&agrave;n ống, h&agrave;n ch&iacute;nh x&aacute;c.</p>\\n<h3>1.3. H&agrave;n MIG</h3>\\n<p dir=\\\"ltr\\\">Sử dụng d&acirc;y h&agrave;n n&oacute;ng chảy v&agrave; kh&iacute; bảo vệ (CO2, hỗn hợp kh&iacute;) để tạo hồ quang điện, l&agrave;m n&oacute;ng chảy vật liệu h&agrave;n v&agrave; d&acirc;y h&agrave;n, tạo th&agrave;nh mối h&agrave;n.</p>\\n<p dir=\\\"ltr\\\"><img src=\\\"/storage/cIvQLW3jebu3StMW0x3hpSpUkXB620GlbQUpfw1H.jpg\\\" alt=\\\"ky-thuat-han-mig\\\" width=\\\"800\\\" height=\\\"600\\\"></p>\\n<h4 dir=\\\"ltr\\\">1.3.1. Ưu điểm</h4>\\n<p dir=\\\"ltr\\\">Tốc độ h&agrave;n nhanh, năng suất cao.</p>\\n<p dir=\\\"ltr\\\">Mối h&agrave;n chất lượng tốt, độ ngấu s&acirc;u.</p>\\n<p dir=\\\"ltr\\\">Dễ d&agrave;ng thao t&aacute;c, ph&ugrave; hợp cho h&agrave;n tự động.</p>\\n<p dir=\\\"ltr\\\">&Iacute;t kh&oacute;i bụi, an to&agrave;n cho sức khỏe.</p>\\n<h4 dir=\\\"ltr\\\">1.3.2. Nhược điểm</h4>\\n<p dir=\\\"ltr\\\">Kh&ocirc;ng h&agrave;n được c&aacute;c kim loại mỏng.</p>\\n<p dir=\\\"ltr\\\">Chi ph&iacute; cao hơn so với h&agrave;n que.</p>\\n<p dir=\\\"ltr\\\">Y&ecirc;u cầu kỹ thuật h&agrave;n cao hơn.</p>\\n<h4 dir=\\\"ltr\\\">1.3.3. Ứng dụng</h4>\\n<p dir=\\\"ltr\\\">Thường được sử dụng trong sản xuất xe hơi, đ&oacute;ng t&agrave;u, chế tạo m&aacute;y m&oacute;c, h&agrave;n kết cấu th&eacute;p d&agrave;y.</p>\\n<h3 dir=\\\"ltr\\\">1.4. H&agrave;n laser</h3>\\n<p dir=\\\"ltr\\\">Sử dụng tia laser tập trung năng lượng cao để l&agrave;m n&oacute;ng chảy vật liệu h&agrave;n, tạo th&agrave;nh mối h&agrave;n.</p>\\n<p dir=\\\"ltr\\\"><img src=\\\"/storage/rWWI7xpC0xh9EgtHIKtJjQZRcMiZ7LJHci95rCFG.jpg\\\" alt=\\\"han-laser\\\" width=\\\"800\\\" height=\\\"600\\\"></p>\\n<h4 dir=\\\"ltr\\\">1.4.1. Ưu điểm</h4>\\n<p dir=\\\"ltr\\\">Tốc độ h&agrave;n nhanh, ch&iacute;nh x&aacute;c cao.</p>\\n<p dir=\\\"ltr\\\">Mối h&agrave;n chất lượng cao, độ ngấu s&acirc;u, &iacute;t biến dạng vật liệu.</p>\\n<p dir=\\\"ltr\\\">C&oacute; thể h&agrave;n được c&aacute;c kim loại mỏng, kh&oacute; h&agrave;n.</p>\\n<p dir=\\\"ltr\\\">Dễ d&agrave;ng thao t&aacute;c, ph&ugrave; hợp cho h&agrave;n tự động.</p>\\n<h4 dir=\\\"ltr\\\">1.4.2. Nhược điểm</h4>\\n<p dir=\\\"ltr\\\">Chi ph&iacute; đầu tư cao.</p>\\n<p dir=\\\"ltr\\\">Khả năng h&agrave;n vật liệu d&agrave;y hạn chế.</p>\\n<p dir=\\\"ltr\\\">Y&ecirc;u cầu kỹ thuật cao.</p>\\n<h4 dir=\\\"ltr\\\">1.4.3. Ứng dụng</h4>\\n<p dir=\\\"ltr\\\">Thường được sử dụng trong h&agrave;n điện tử, h&agrave;n vi m&ocirc;, h&agrave;n kim loại qu&yacute;, h&agrave;n c&aacute;c chi tiết phức tạp.</p>\\n<h3 dir=\\\"ltr\\\">1.5. H&agrave;n robot</h3>\\n<p dir=\\\"ltr\\\">Sử dụng robot để thao t&aacute;c m&aacute;y h&agrave;n, tự động h&oacute;a qu&aacute; tr&igrave;nh h&agrave;n.</p>\\n<p dir=\\\"ltr\\\"><img src=\\\"/storage/qPIZYABU55AIOGypjcANQ5wbwuPvzo9AAy46Z81b.jpg\\\" alt=\\\"han-robot\\\" width=\\\"800\\\" height=\\\"600\\\"></p>\\n<h4 dir=\\\"ltr\\\">1.5.1. Ưu điểm</h4>\\n<p dir=\\\"ltr\\\">Tự động h&oacute;a cao, giảm thiểu sai s&oacute;t do con người.</p>\\n<p dir=\\\"ltr\\\">N&acirc;ng cao năng suất, tiết kiệm thời gian.</p>\\n<p dir=\\\"ltr\\\">C&oacute; thể h&agrave;n những vị tr&iacute; kh&oacute; tiếp cận.</p>\\n<p dir=\\\"ltr\\\">An to&agrave;n cho người lao động.</p>\\n<h4 dir=\\\"ltr\\\">1.5.2. Nhược điểm</h4>\\n<p dir=\\\"ltr\\\">Chi ph&iacute; đầu tư cao.</p>\\n<p dir=\\\"ltr\\\">Y&ecirc;u cầu kỹ thuật lập tr&igrave;nh phức tạp.</p>\\n<p dir=\\\"ltr\\\">Khả năng linh hoạt thấp hơn so với h&agrave;n thủ c&ocirc;ng.</p>\\n<h4 dir=\\\"ltr\\\">1.5.3. Ứng dụng</h4>\\n<p dir=\\\"ltr\\\">&nbsp;Thường được sử dụng trong sản xuất h&agrave;ng loạt, h&agrave;n kết cấu th&eacute;p phức tạp, h&agrave;n c&aacute;c vị tr&iacute; nguy hiểm.</p>\\n<h2 dir=\\\"ltr\\\">2. Lựa chọn phương ph&aacute;p h&agrave;n ph&ugrave; hợp phụ thuộc c&aacute;c yếu tố sau</h2>\\n<ul>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\"><strong>Loại vật liệu cần h&agrave;n:</strong> Mỗi phương ph&aacute;p h&agrave;n c&oacute; khả năng h&agrave;n tốt với một số loại vật liệu nhất định. V&iacute; dụ, h&agrave;n que ph&ugrave; hợp cho nhiều loại th&eacute;p, h&agrave;n TIG tốt cho th&eacute;p kh&ocirc;ng gỉ v&agrave; nh&ocirc;m, h&agrave;n MIG tốt cho th&eacute;p d&agrave;y, h&agrave;n laser tốt cho kim loại mỏng v&agrave; kh&oacute; h&agrave;n, v.v.</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\"><strong>Độ d&agrave;y vật liệu:</strong> Một số phương ph&aacute;p h&agrave;n ph&ugrave; hợp cho vật liệu mỏng, trong khi một số kh&aacute;c ph&ugrave; hợp cho vật liệu d&agrave;y.</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\"><strong>H&igrave;nh dạng mối h&agrave;n: </strong>Y&ecirc;u cầu h&igrave;nh dạng v&agrave; k&iacute;ch thước mối h&agrave;n cũng ảnh hưởng đến lựa chọn phương ph&aacute;p h&agrave;n.</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\"><strong>Y&ecirc;u cầu kỹ thuật: </strong>Một số phương ph&aacute;p h&agrave;n đ&ograve;i hỏi kỹ năng cao hơn so với những phương ph&aacute;p kh&aacute;c.</p>\\n</li>\\n<li dir=\\\"ltr\\\" aria-level=\\\"1\\\">\\n<p dir=\\\"ltr\\\" role=\\\"presentation\\\"><strong>Ng&acirc;n s&aacute;ch: </strong>Chi ph&iacute; đầu tư cho thiết bị v&agrave; vật liệu h&agrave;n cũng l&agrave; một yếu tố cần c&acirc;n nhắc.</p>\\n</li>\\n</ul>\\n<h2 dir=\\\"ltr\\\">3. Ưu điểm của gia c&ocirc;ng h&agrave;n</h2>\\n<ul>\\n<li dir=\\\"ltr\\\"><strong>Độ bền cao:</strong> Mối h&agrave;n c&oacute; thể chịu được lực k&eacute;o, n&eacute;n, va đập mạnh, đảm bảo độ an to&agrave;n v&agrave; tuổi thọ cho c&ocirc;ng tr&igrave;nh.</li>\\n<li dir=\\\"ltr\\\"><strong>T&iacute;nh linh hoạt: </strong>C&oacute; thể h&agrave;n được nhiều loại kim loại kh&aacute;c nhau, với độ d&agrave;y v&agrave; h&igrave;nh dạng đa dạng.</li>\\n<li dir=\\\"ltr\\\"><strong>Tiết kiệm chi ph&iacute;:</strong> So với c&aacute;c phương ph&aacute;p kết nối kh&aacute;c như đinh t&aacute;n, keo d&aacute;n, gia c&ocirc;ng h&agrave;n c&oacute; chi ph&iacute; thấp hơn v&agrave; hiệu quả hơn.</li>\\n<li dir=\\\"ltr\\\"><strong>Dễ d&agrave;ng thi c&ocirc;ng:</strong> Với sự hỗ trợ của m&aacute;y m&oacute;c v&agrave; trang thiết bị hiện đại, gia c&ocirc;ng h&agrave;n c&oacute; thể được thực hiện nhanh ch&oacute;ng v&agrave; ch&iacute;nh x&aacute;c.</li>\\n</ul>\\n<h2 dir=\\\"ltr\\\">4. Ứng dụng của gia c&ocirc;ng h&agrave;n</h2>\\n<ul>\\n<li dir=\\\"ltr\\\"><strong>X&acirc;y dựng:</strong> Kết nối c&aacute;c dầm th&eacute;p, cột, k&egrave;o, bản lề, thanh th&eacute;p trong c&aacute;c c&ocirc;ng tr&igrave;nh nh&agrave; ở, cao ốc, cầu đường, v.v.</li>\\n<li dir=\\\"ltr\\\"><strong>Đ&oacute;ng t&agrave;u:</strong> X&acirc;y dựng th&acirc;n t&agrave;u, boong t&agrave;u, v&aacute;ch ngăn, khung, v.v.</li>\\n<li dir=\\\"ltr\\\"><strong>Chế tạo m&aacute;y m&oacute;c:</strong> Sản xuất c&aacute;c chi tiết m&aacute;y m&oacute;c, khung xe, thiết bị c&ocirc;ng nghiệp, v.v.</li>\\n<li dir=\\\"ltr\\\"><strong>Sản xuất đồ gia dụng: </strong>Chế tạo cửa cổng, lan can, khung ghế, b&agrave;n ghế, v.v.</li>\\n<li dir=\\\"ltr\\\"><strong>Sửa chữa: </strong>Khắc phục hư hỏng, nứt vỡ tr&ecirc;n c&aacute;c chi tiết kim loại.</li>\\n</ul>\\n<h2 dir=\\\"ltr\\\">5. Lựa chọn phương ph&aacute;p gia c&ocirc;ng h&agrave;n ph&ugrave; hợp</h2>\\n<p dir=\\\"ltr\\\">GEMQ - Với đội ngũ kỹ thuật vi&ecirc;n d&agrave;y dặn kinh nghiệm, được đ&agrave;o tạo b&agrave;i bản c&ugrave;ng hệ thống m&aacute;y m&oacute;c hiện đại, quy tr&igrave;nh thi c&ocirc;ng chuy&ecirc;n nghiệp, đảm bảo chất lượng, gi&aacute; cả cạnh tranh, hợp l&yacute;, dịch vụ tư vấn miễn ph&iacute;, tận t&igrave;nh GEMQ cam kết mang đến cho kh&aacute;ch h&agrave;ng dịch vụ gia c&ocirc;ng h&agrave;n chất lượng cao, đ&aacute;p ứng mọi nhu cầu.</p>\\n<p dir=\\\"ltr\\\">Dịch vụ gia c&ocirc;ng h&agrave;n tại GEMQ:</p>\\n<ul>\\n<li dir=\\\"ltr\\\">H&agrave;n TIG</li>\\n<li dir=\\\"ltr\\\">H&agrave;n MIG</li>\\n<li dir=\\\"ltr\\\">H&agrave;n laser</li>\\n<li dir=\\\"ltr\\\">H&agrave;n robot</li>\\n</ul>\\n<p><strong id=\\\"docs-internal-guid-5252f270-7fff-14d1-f8bf-e2fbe1216de0\\\">Liện hệ GEMQ ngay h&ocirc;m nay để được tư vấn v&agrave; b&aacute;o gi&aacute; tốt nhất!<br><br><br></strong></p>\", \"custom_classes\": null, \"container_width\": \"container\"}, \"type\": \"Text\"}]}','{\"en\":\"gia-cong-han\"}',1,'2024-04-23 21:47:27','2024-04-24 01:44:47');
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provinces`
--

DROP TABLE IF EXISTS `provinces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `provinces` (
  `code` varchar(20) CHARACTER SET latin1 NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_en` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `full_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `full_name_en` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `code_name` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `administrative_unit_id` int(11) DEFAULT NULL,
  `administrative_region_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`code`),
  KEY `idx_provinces_region` (`administrative_region_id`),
  KEY `idx_provinces_unit` (`administrative_unit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provinces`
--

LOCK TABLES `provinces` WRITE;
/*!40000 ALTER TABLE `provinces` DISABLE KEYS */;
INSERT INTO `provinces` VALUES ('01','Hà Nội','Ha Noi','Thành phố Hà Nội','Ha Noi City','ha_noi',1,3),('02','Hà Giang','Ha Giang','Tỉnh Hà Giang','Ha Giang Province','ha_giang',2,1),('04','Cao Bằng','Cao Bang','Tỉnh Cao Bằng','Cao Bang Province','cao_bang',2,1),('06','Bắc Kạn','Bac Kan','Tỉnh Bắc Kạn','Bac Kan Province','bac_kan',2,1),('08','Tuyên Quang','Tuyen Quang','Tỉnh Tuyên Quang','Tuyen Quang Province','tuyen_quang',2,1),('10','Lào Cai','Lao Cai','Tỉnh Lào Cai','Lao Cai Province','lao_cai',2,2),('11','Điện Biên','Dien Bien','Tỉnh Điện Biên','Dien Bien Province','dien_bien',2,2),('12','Lai Châu','Lai Chau','Tỉnh Lai Châu','Lai Chau Province','lai_chau',2,2),('14','Sơn La','Son La','Tỉnh Sơn La','Son La Province','son_la',2,2),('15','Yên Bái','Yen Bai','Tỉnh Yên Bái','Yen Bai Province','yen_bai',2,2),('17','Hoà Bình','Hoa Binh','Tỉnh Hoà Bình','Hoa Binh Province','hoa_binh',2,2),('19','Thái Nguyên','Thai Nguyen','Tỉnh Thái Nguyên','Thai Nguyen Province','thai_nguyen',2,1),('20','Lạng Sơn','Lang Son','Tỉnh Lạng Sơn','Lang Son Province','lang_son',2,1),('22','Quảng Ninh','Quang Ninh','Tỉnh Quảng Ninh','Quang Ninh Province','quang_ninh',2,1),('24','Bắc Giang','Bac Giang','Tỉnh Bắc Giang','Bac Giang Province','bac_giang',2,1),('25','Phú Thọ','Phu Tho','Tỉnh Phú Thọ','Phu Tho Province','phu_tho',2,1),('26','Vĩnh Phúc','Vinh Phuc','Tỉnh Vĩnh Phúc','Vinh Phuc Province','vinh_phuc',2,3),('27','Bắc Ninh','Bac Ninh','Tỉnh Bắc Ninh','Bac Ninh Province','bac_ninh',2,3),('30','Hải Dương','Hai Duong','Tỉnh Hải Dương','Hai Duong Province','hai_duong',2,3),('31','Hải Phòng','Hai Phong','Thành phố Hải Phòng','Hai Phong City','hai_phong',1,3),('33','Hưng Yên','Hung Yen','Tỉnh Hưng Yên','Hung Yen Province','hung_yen',2,3),('34','Thái Bình','Thai Binh','Tỉnh Thái Bình','Thai Binh Province','thai_binh',2,3),('35','Hà Nam','Ha Nam','Tỉnh Hà Nam','Ha Nam Province','ha_nam',2,3),('36','Nam Định','Nam Dinh','Tỉnh Nam Định','Nam Dinh Province','nam_dinh',2,3),('37','Ninh Bình','Ninh Binh','Tỉnh Ninh Bình','Ninh Binh Province','ninh_binh',2,3),('38','Thanh Hóa','Thanh Hoa','Tỉnh Thanh Hóa','Thanh Hoa Province','thanh_hoa',2,4),('40','Nghệ An','Nghe An','Tỉnh Nghệ An','Nghe An Province','nghe_an',2,4),('42','Hà Tĩnh','Ha Tinh','Tỉnh Hà Tĩnh','Ha Tinh Province','ha_tinh',2,4),('44','Quảng Bình','Quang Binh','Tỉnh Quảng Bình','Quang Binh Province','quang_binh',2,4),('45','Quảng Trị','Quang Tri','Tỉnh Quảng Trị','Quang Tri Province','quang_tri',2,4),('46','Thừa Thiên Huế','Thua Thien Hue','Tỉnh Thừa Thiên Huế','Thua Thien Hue Province','thua_thien_hue',2,4),('48','Đà Nẵng','Da Nang','Thành phố Đà Nẵng','Da Nang City','da_nang',1,5),('49','Quảng Nam','Quang Nam','Tỉnh Quảng Nam','Quang Nam Province','quang_nam',2,5),('51','Quảng Ngãi','Quang Ngai','Tỉnh Quảng Ngãi','Quang Ngai Province','quang_ngai',2,5),('52','Bình Định','Binh Dinh','Tỉnh Bình Định','Binh Dinh Province','binh_dinh',2,5),('54','Phú Yên','Phu Yen','Tỉnh Phú Yên','Phu Yen Province','phu_yen',2,5),('56','Khánh Hòa','Khanh Hoa','Tỉnh Khánh Hòa','Khanh Hoa Province','khanh_hoa',2,5),('58','Ninh Thuận','Ninh Thuan','Tỉnh Ninh Thuận','Ninh Thuan Province','ninh_thuan',2,5),('60','Bình Thuận','Binh Thuan','Tỉnh Bình Thuận','Binh Thuan Province','binh_thuan',2,5),('62','Kon Tum','Kon Tum','Tỉnh Kon Tum','Kon Tum Province','kon_tum',2,6),('64','Gia Lai','Gia Lai','Tỉnh Gia Lai','Gia Lai Province','gia_lai',2,6),('66','Đắk Lắk','Dak Lak','Tỉnh Đắk Lắk','Dak Lak Province','dak_lak',2,6),('67','Đắk Nông','Dak Nong','Tỉnh Đắk Nông','Dak Nong Province','dak_nong',2,6),('68','Lâm Đồng','Lam Dong','Tỉnh Lâm Đồng','Lam Dong Province','lam_dong',2,6),('70','Bình Phước','Binh Phuoc','Tỉnh Bình Phước','Binh Phuoc Province','binh_phuoc',2,7),('72','Tây Ninh','Tay Ninh','Tỉnh Tây Ninh','Tay Ninh Province','tay_ninh',2,7),('74','Bình Dương','Binh Duong','Tỉnh Bình Dương','Binh Duong Province','binh_duong',2,7),('75','Đồng Nai','Dong Nai','Tỉnh Đồng Nai','Dong Nai Province','dong_nai',2,7),('77','Bà Rịa - Vũng Tàu','Ba Ria - Vung Tau','Tỉnh Bà Rịa - Vũng Tàu','Ba Ria - Vung Tau Province','ba_ria_vung_tau',2,7),('79','Hồ Chí Minh','Ho Chi Minh','Thành phố Hồ Chí Minh','Ho Chi Minh City','ho_chi_minh',1,7),('80','Long An','Long An','Tỉnh Long An','Long An Province','long_an',2,8),('82','Tiền Giang','Tien Giang','Tỉnh Tiền Giang','Tien Giang Province','tien_giang',2,8),('83','Bến Tre','Ben Tre','Tỉnh Bến Tre','Ben Tre Province','ben_tre',2,8),('84','Trà Vinh','Tra Vinh','Tỉnh Trà Vinh','Tra Vinh Province','tra_vinh',2,8),('86','Vĩnh Long','Vinh Long','Tỉnh Vĩnh Long','Vinh Long Province','vinh_long',2,8),('87','Đồng Tháp','Dong Thap','Tỉnh Đồng Tháp','Dong Thap Province','dong_thap',2,8),('89','An Giang','An Giang','Tỉnh An Giang','An Giang Province','an_giang',2,8),('91','Kiên Giang','Kien Giang','Tỉnh Kiên Giang','Kien Giang Province','kien_giang',2,8),('92','Cần Thơ','Can Tho','Thành phố Cần Thơ','Can Tho City','can_tho',1,8),('93','Hậu Giang','Hau Giang','Tỉnh Hậu Giang','Hau Giang Province','hau_giang',2,8),('94','Sóc Trăng','Soc Trang','Tỉnh Sóc Trăng','Soc Trang Province','soc_trang',2,8),('95','Bạc Liêu','Bac Lieu','Tỉnh Bạc Liêu','Bac Lieu Province','bac_lieu',2,8),('96','Cà Mau','Ca Mau','Tỉnh Cà Mau','Ca Mau Province','ca_mau',2,8);
/*!40000 ALTER TABLE `provinces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_has_permissions`
--

DROP TABLE IF EXISTS `role_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_has_permissions`
--

LOCK TABLES `role_has_permissions` WRITE;
/*!40000 ALTER TABLE `role_has_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `group` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `payload` json NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `settings_group_index` (`group`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'general','site_name',0,'\"Spatie\"','2024-10-28 13:46:36','2024-10-28 13:46:36'),(2,'general','site_active',0,'true','2024-10-28 13:46:36','2024-10-28 13:46:36'),(3,'general','site_logo',0,'\"\"','2024-10-28 13:46:36','2024-10-28 13:46:36'),(4,'general','site_favicon',0,'\"\"','2024-10-28 13:46:36','2024-10-28 13:46:36'),(5,'general','site_description',0,'\"\"','2024-10-28 13:46:36','2024-10-28 13:46:36'),(6,'general','site_keywords',0,'\"\"','2024-10-28 13:46:36','2024-10-28 13:46:36'),(7,'general','site_author',0,'\"\"','2024-10-28 13:46:36','2024-10-28 13:46:36'),(8,'general','site_phone',0,'\"\"','2024-10-28 13:46:36','2024-10-28 13:46:36'),(9,'general','site_email',0,'\"\"','2024-10-28 13:46:36','2024-10-28 13:46:36'),(10,'general','site_address',0,'\"\"','2024-10-28 13:46:36','2024-10-28 13:46:36'),(11,'general','site_facebook',0,'\"\"','2024-10-28 13:46:36','2024-10-28 13:46:36'),(12,'general','site_twitter',0,'\"\"','2024-10-28 13:46:36','2024-10-28 13:46:36'),(13,'general','site_instagram',0,'\"\"','2024-10-28 13:46:36','2024-10-28 13:46:36'),(14,'general','site_youtube',0,'\"\"','2024-10-28 13:46:36','2024-10-28 13:46:36'),(15,'general','site_linkedin',0,'\"\"','2024-10-28 13:46:36','2024-10-28 13:46:36'),(16,'general','site_google',0,'\"\"','2024-10-28 13:46:36','2024-10-28 13:46:36'),(17,'shop','shop_tax',0,'0','2024-10-28 13:46:36','2024-10-28 13:46:36'),(18,'shop','shop_default_shipping_fee',0,'0','2024-10-28 13:46:36','2024-10-28 13:46:36'),(19,'shop','shop_currency',0,'\"USD\"','2024-10-28 13:46:36','2024-10-28 13:46:36'),(20,'shop','shop_currency_symbol',0,'\"$\"','2024-10-28 13:46:36','2024-10-28 13:46:36'),(21,'shop','shop_currency_symbol_position',0,'\"left\"','2024-10-28 13:46:36','2024-10-28 13:46:36'),(22,'shop','shop_currency_thousand_separator',0,'\",\"','2024-10-28 13:46:36','2024-10-28 13:46:36'),(23,'shop','shop_currency_decimal_separator',0,'\".\"','2024-10-28 13:46:36','2024-10-28 13:46:36'),(24,'shop','shop_currency_decimal_number',0,'2','2024-10-28 13:46:36','2024-10-28 13:46:36'),(25,'shop','shipping_methods',0,'[{\"name\": \"Standard\", \"price\": 0, \"enabled\": true, \"description\": \"Standard shipping\"}, {\"name\": \"Express\", \"price\": 10, \"enabled\": true, \"description\": \"Express shipping\"}]','2024-10-28 13:46:36','2024-10-28 13:46:36'),(26,'shop','payment_methods',0,'[{\"code\": \"cod\", \"name\": \"Cash on delivery\", \"price\": 0, \"enabled\": true, \"description\": \"Pay with cash upon delivery.\"}, {\"code\": \"paypal\", \"name\": \"Paypal\", \"price\": 0, \"enabled\": true, \"description\": \"Paypal payment\"}, {\"code\": \"credit_card\", \"name\": \"Credit Card\", \"price\": 0, \"enabled\": true, \"description\": \"Credit Card payment\"}]','2024-10-28 13:46:36','2024-10-28 13:46:36'),(27,'general','site_copyright',0,'\"\"','2024-10-28 13:47:55','2024-10-28 13:47:55'),(28,'general','site_footer',0,'null','2024-10-28 13:48:46','2024-10-28 13:48:46'),(29,'shop','shop_tax',0,'0','2024-10-29 03:08:09','2024-10-29 03:08:09'),(30,'shop','shop_default_shipping_fee',0,'0','2024-10-29 03:08:09','2024-10-29 03:08:09'),(31,'shop','shop_currency',0,'\"VND\"','2024-10-29 03:08:09','2024-10-29 03:08:09'),(32,'shop','shop_currency_symbol',0,'\"₫\"','2024-10-29 03:08:09','2024-10-29 03:08:09'),(33,'shop','shop_currency_symbol_position',0,'\"left\"','2024-10-29 03:08:09','2024-10-29 03:08:09'),(34,'shop','shop_currency_thousand_separator',0,'\".\"','2024-10-29 03:08:09','2024-10-29 03:08:09'),(35,'shop','shop_currency_decimal_separator',0,'\",\"','2024-10-29 03:08:09','2024-10-29 03:08:09'),(36,'shop','shop_currency_decimal_number',0,'0','2024-10-29 03:08:09','2024-10-29 03:08:09'),(37,'shop','shipping_methods',0,'[{\"code\": \"COD\", \"name\": \"Standard\", \"price\": 0, \"enabled\": true, \"description\": \"Standard shipping\"}]','2024-10-29 03:08:09','2024-10-29 03:08:09'),(38,'shop','payment_methods',0,'[{\"code\": \"cod\", \"name\": \"COD\", \"image\": null, \"price\": 0, \"enabled\": true, \"description\": \"Pay with cash upon delivery.\"}]','2024-10-29 03:08:09','2024-10-29 03:08:09');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_attribute_options`
--

DROP TABLE IF EXISTS `shop_attribute_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_attribute_options` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `shop_attribute_id` int(11) NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_attribute_options`
--

LOCK TABLES `shop_attribute_options` WRITE;
/*!40000 ALTER TABLE `shop_attribute_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_attribute_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_attributes`
--

DROP TABLE IF EXISTS `shop_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_attributes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_filterable` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_attributes`
--

LOCK TABLES `shop_attributes` WRITE;
/*!40000 ALTER TABLE `shop_attributes` DISABLE KEYS */;
INSERT INTO `shop_attributes` VALUES (1,'Màu',0,'2024-10-28 14:49:41','2024-10-28 14:49:41');
/*!40000 ALTER TABLE `shop_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_brands`
--

DROP TABLE IF EXISTS `shop_brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_brands` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `website` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `position` smallint(5) unsigned NOT NULL DEFAULT '0',
  `is_visible` tinyint(1) NOT NULL DEFAULT '0',
  `seo_title` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_description` varchar(160) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `shop_brands_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_brands`
--

LOCK TABLES `shop_brands` WRITE;
/*!40000 ALTER TABLE `shop_brands` DISABLE KEYS */;
INSERT INTO `shop_brands` VALUES (1,'Thompson-Dickens','thompson-dickens','https://www.okuneva.com','Alice indignantly, and she dropped it hastily, just in time to begin lessons: you\'d only have to whisper a hint to Time, and round the rosetree; for, you see, so many lessons to learn! No, I\'ve made.',0,0,NULL,NULL,NULL,'2023-11-21 15:35:47','2024-09-05 21:56:44');
/*!40000 ALTER TABLE `shop_brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_categories`
--

DROP TABLE IF EXISTS `shop_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `image` text COLLATE utf8mb4_unicode_ci,
  `position` smallint(5) unsigned NOT NULL DEFAULT '0',
  `is_visible` tinyint(1) NOT NULL DEFAULT '0',
  `is_featured` tinyint(1) NOT NULL DEFAULT '0',
  `seo_title` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_description` varchar(160) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `shop_categories_slug_unique` (`slug`),
  KEY `shop_categories_parent_id_foreign` (`parent_id`),
  CONSTRAINT `shop_categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `shop_categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_categories`
--

LOCK TABLES `shop_categories` WRITE;
/*!40000 ALTER TABLE `shop_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_category_product`
--

DROP TABLE IF EXISTS `shop_category_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_category_product` (
  `shop_category_id` bigint(20) unsigned NOT NULL,
  `shop_product_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`shop_category_id`,`shop_product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_category_product`
--

LOCK TABLES `shop_category_product` WRITE;
/*!40000 ALTER TABLE `shop_category_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_category_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_collection_product`
--

DROP TABLE IF EXISTS `shop_collection_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_collection_product` (
  `shop_collection_id` int(10) unsigned NOT NULL,
  `shop_product_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`shop_collection_id`,`shop_product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_collection_product`
--

LOCK TABLES `shop_collection_product` WRITE;
/*!40000 ALTER TABLE `shop_collection_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_collection_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_collections`
--

DROP TABLE IF EXISTS `shop_collections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_collections` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slider_id` int(10) unsigned DEFAULT NULL,
  `is_visible` tinyint(1) NOT NULL DEFAULT '1',
  `position` bigint(20) unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `shop_collections_slug_unique` (`slug`),
  UNIQUE KEY `shop_collections_code_unique` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_collections`
--

LOCK TABLES `shop_collections` WRITE;
/*!40000 ALTER TABLE `shop_collections` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_collections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_order_items`
--

DROP TABLE IF EXISTS `shop_order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_order_items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `sort` int(10) unsigned NOT NULL DEFAULT '0',
  `shop_order_id` bigint(20) unsigned DEFAULT NULL,
  `shop_product_id` bigint(20) unsigned DEFAULT NULL,
  `shop_variant_id` int(11) DEFAULT NULL,
  `shop_variant_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` int(11) NOT NULL,
  `unit_price` decimal(10,2) NOT NULL,
  `subtotal` decimal(18,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `shop_order_items_shop_order_id_foreign` (`shop_order_id`),
  KEY `shop_order_items_shop_product_id_foreign` (`shop_product_id`),
  CONSTRAINT `shop_order_items_shop_order_id_foreign` FOREIGN KEY (`shop_order_id`) REFERENCES `shop_orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `shop_order_items_shop_product_id_foreign` FOREIGN KEY (`shop_product_id`) REFERENCES `shop_products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_order_items`
--

LOCK TABLES `shop_order_items` WRITE;
/*!40000 ALTER TABLE `shop_order_items` DISABLE KEYS */;
INSERT INTO `shop_order_items` VALUES (1,1,1,1,NULL,NULL,3,500000.00,1500000.00,'2024-10-29 00:33:13','2024-10-29 02:35:58');
/*!40000 ALTER TABLE `shop_order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_orders`
--

DROP TABLE IF EXISTS `shop_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_orders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `shop_customer_id` int(11) DEFAULT NULL,
  `number` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subtotal` decimal(12,2) DEFAULT NULL,
  `tax` decimal(8,2) DEFAULT NULL,
  `discount` decimal(12,2) DEFAULT NULL,
  `discount_percent` decimal(8,2) DEFAULT NULL,
  `total_price` decimal(12,2) DEFAULT NULL,
  `status` enum('new','processing','shipped','delivered','cancelled') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new',
  `payment_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_price` decimal(8,2) DEFAULT NULL,
  `shipping_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `shop_orders_number_unique` (`number`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_orders`
--

LOCK TABLES `shop_orders` WRITE;
/*!40000 ALTER TABLE `shop_orders` DISABLE KEYS */;
INSERT INTO `shop_orders` VALUES (1,2,'OR-544392',1500000.00,NULL,50000.00,NULL,1650000.00,'new',NULL,NULL,'vnd',200000.00,NULL,NULL,'2024-10-29 00:29:34','2024-10-29 02:35:58',NULL);
/*!40000 ALTER TABLE `shop_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_payments`
--

DROP TABLE IF EXISTS `shop_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_payments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) unsigned NOT NULL,
  `reference` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(8,2) NOT NULL,
  `currency` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_payments`
--

LOCK TABLES `shop_payments` WRITE;
/*!40000 ALTER TABLE `shop_payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_product_attributes`
--

DROP TABLE IF EXISTS `shop_product_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_product_attributes` (
  `shop_product_id` int(11) NOT NULL,
  `shop_attribute_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_product_attributes`
--

LOCK TABLES `shop_product_attributes` WRITE;
/*!40000 ALTER TABLE `shop_product_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_product_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_product_variant_attribute_options`
--

DROP TABLE IF EXISTS `shop_product_variant_attribute_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_product_variant_attribute_options` (
  `shop_product_variant_id` int(11) NOT NULL,
  `shop_attribute_id` int(11) NOT NULL,
  `shop_attribute_option_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_product_variant_attribute_options`
--

LOCK TABLES `shop_product_variant_attribute_options` WRITE;
/*!40000 ALTER TABLE `shop_product_variant_attribute_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_product_variant_attribute_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_product_variants`
--

DROP TABLE IF EXISTS `shop_product_variants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_product_variants` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `shop_product_id` int(11) NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(8,2) NOT NULL DEFAULT '0.00',
  `old_price` decimal(10,2) DEFAULT NULL,
  `qty` int(11) NOT NULL DEFAULT '0',
  `sku` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `barcode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_visible` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_product_variants`
--

LOCK TABLES `shop_product_variants` WRITE;
/*!40000 ALTER TABLE `shop_product_variants` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_product_variants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_products`
--

DROP TABLE IF EXISTS `shop_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `shop_brand_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sku` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `barcode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `content` text COLLATE utf8mb4_unicode_ci,
  `specifications` json DEFAULT NULL,
  `qty` bigint(20) unsigned NOT NULL DEFAULT '0',
  `security_stock` bigint(20) unsigned NOT NULL DEFAULT '0',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `is_visible` tinyint(1) NOT NULL DEFAULT '0',
  `old_price` decimal(10,2) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `cost` decimal(10,2) DEFAULT NULL,
  `type` enum('deliverable','downloadable') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `backorder` tinyint(1) NOT NULL DEFAULT '0',
  `requires_shipping` tinyint(1) NOT NULL DEFAULT '0',
  `published_at` date DEFAULT NULL,
  `seo_title` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_description` varchar(160) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weight_value` decimal(10,2) unsigned DEFAULT '0.00',
  `weight_unit` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'kg',
  `height_value` decimal(10,2) unsigned DEFAULT '0.00',
  `height_unit` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'cm',
  `width_value` decimal(10,2) unsigned DEFAULT '0.00',
  `width_unit` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'cm',
  `depth_value` decimal(10,2) unsigned DEFAULT '0.00',
  `depth_unit` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'cm',
  `volume_value` decimal(10,2) unsigned DEFAULT '0.00',
  `volume_unit` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'l',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `shop_products_slug_unique` (`slug`),
  UNIQUE KEY `shop_products_sku_unique` (`sku`),
  UNIQUE KEY `shop_products_barcode_unique` (`barcode`),
  KEY `shop_products_shop_brand_id_foreign` (`shop_brand_id`),
  CONSTRAINT `shop_products_shop_brand_id_foreign` FOREIGN KEY (`shop_brand_id`) REFERENCES `shop_brands` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_products`
--

LOCK TABLES `shop_products` WRITE;
/*!40000 ALTER TABLE `shop_products` DISABLE KEYS */;
INSERT INTO `shop_products` VALUES (1,NULL,'Sản phẩm 1','san-pham-1',NULL,NULL,NULL,NULL,'[]',50,0,0,1,60000.00,50000.00,30000.00,NULL,0,0,'2024-10-28',NULL,NULL,0.00,'kg',0.00,'cm',0.00,'cm',0.00,'cm',0.00,'l','2024-10-29 00:29:25','2024-10-29 00:29:25');
/*!40000 ALTER TABLE `shop_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_wishlist`
--

DROP TABLE IF EXISTS `shop_wishlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_wishlist` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `shop_product_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_wishlist`
--

LOCK TABLES `shop_wishlist` WRITE;
/*!40000 ALTER TABLE `shop_wishlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `shop_wishlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slider_items`
--

DROP TABLE IF EXISTS `slider_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `slider_items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `slider_id` bigint(20) unsigned NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci,
  `subtitle` text COLLATE utf8mb4_unicode_ci,
  `link` text COLLATE utf8mb4_unicode_ci,
  `position` bigint(20) unsigned NOT NULL DEFAULT '0',
  `is_visible` tinyint(1) NOT NULL DEFAULT '1',
  `is_alt_style` tinyint(1) NOT NULL DEFAULT '0',
  `is_image_only` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `slider_items_slider_id_foreign` (`slider_id`),
  CONSTRAINT `slider_items_slider_id_foreign` FOREIGN KEY (`slider_id`) REFERENCES `sliders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slider_items`
--

LOCK TABLES `slider_items` WRITE;
/*!40000 ALTER TABLE `slider_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `slider_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sliders`
--

DROP TABLE IF EXISTS `sliders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sliders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_type` enum('slider','grid') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'slider',
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_visible` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sliders_code_unique` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sliders`
--

LOCK TABLES `sliders` WRITE;
/*!40000 ALTER TABLE `sliders` DISABLE KEYS */;
/*!40000 ALTER TABLE `sliders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taggables`
--

DROP TABLE IF EXISTS `taggables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taggables` (
  `tag_id` bigint(20) unsigned NOT NULL,
  `taggable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `taggable_id` bigint(20) unsigned NOT NULL,
  UNIQUE KEY `taggables_tag_id_taggable_id_taggable_type_unique` (`tag_id`,`taggable_id`,`taggable_type`),
  KEY `taggables_taggable_type_taggable_id_index` (`taggable_type`,`taggable_id`),
  CONSTRAINT `taggables_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taggables`
--

LOCK TABLES `taggables` WRITE;
/*!40000 ALTER TABLE `taggables` DISABLE KEYS */;
/*!40000 ALTER TABLE `taggables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` json NOT NULL,
  `slug` json NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_column` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teams` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams`
--

LOCK TABLES `teams` WRITE;
/*!40000 ALTER TABLE `teams` DISABLE KEYS */;
/*!40000 ALTER TABLE `teams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translatable_pages`
--

DROP TABLE IF EXISTS `translatable_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `translatable_pages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` json DEFAULT NULL,
  `intro` json DEFAULT NULL,
  `hero_image_copyright` json DEFAULT NULL,
  `hero_image_title` json DEFAULT NULL,
  `publishing_begins_at` timestamp NULL DEFAULT NULL,
  `publishing_ends_at` timestamp NULL DEFAULT NULL,
  `seo_title` json DEFAULT NULL,
  `seo_description` json DEFAULT NULL,
  `seo_keywords` json DEFAULT NULL,
  `overview_title` json DEFAULT NULL,
  `overview_description` json DEFAULT NULL,
  `content_blocks` json DEFAULT NULL,
  `slug` json DEFAULT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `author_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `translatable_pages_code_unique` (`code`),
  KEY `translatable_pages_publishing_begins_at_index` (`publishing_begins_at`),
  KEY `translatable_pages_publishing_ends_at_index` (`publishing_ends_at`),
  KEY `translatable_pages_author_id_foreign` (`author_id`),
  CONSTRAINT `translatable_pages_author_id_foreign` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translatable_pages`
--

LOCK TABLES `translatable_pages` WRITE;
/*!40000 ALTER TABLE `translatable_pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `translatable_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'customer',
  `birthday` date DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Demo User','admin@filamentphp.com',NULL,NULL,'admin',NULL,'2024-10-28 13:50:43','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','1X8vyRnXMK','2024-10-28 13:50:43','2024-10-28 13:50:43',NULL),(2,'A Thừa','ngocthua92@live.com','0972705273',NULL,'customer',NULL,NULL,'jpSQzkQbcmF5ijzN',NULL,'2024-10-29 00:27:15','2024-10-29 00:34:43',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wards`
--

DROP TABLE IF EXISTS `wards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wards` (
  `code` varchar(20) CHARACTER SET latin1 NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_en` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `full_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `full_name_en` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `code_name` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `district_code` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  `administrative_unit_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`code`),
  KEY `idx_wards_district` (`district_code`),
  KEY `idx_wards_unit` (`administrative_unit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wards`
--

LOCK TABLES `wards` WRITE;
/*!40000 ALTER TABLE `wards` DISABLE KEYS */;
/*!40000 ALTER TABLE `wards` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-29  4:35:30