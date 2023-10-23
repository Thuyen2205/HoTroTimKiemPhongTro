-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: quanliphongtro
-- ------------------------------------------------------
-- Server version	8.0.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bai_viet`
--

DROP TABLE IF EXISTS `bai_viet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bai_viet` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ten_bai_viet` varchar(100) DEFAULT NULL,
  `hinh_anh` varchar(500) DEFAULT NULL,
  `noi_dung` longtext,
  `pham_vi_can_tim` varchar(200) DEFAULT NULL,
  `loai_bai_viet` int DEFAULT NULL,
  `ngay_dang` date DEFAULT NULL,
  `id_nguoi_dung` int DEFAULT NULL,
  `so_nguoi` int DEFAULT NULL,
  `gia_thue` decimal(10,0) DEFAULT NULL,
  `dien_tich` varchar(45) DEFAULT NULL,
  `dia_chi_ct` varchar(200) DEFAULT NULL,
  `hinh_anh1` varchar(500) DEFAULT NULL,
  `hinh_anh2` varchar(500) DEFAULT NULL,
  `hinh_anh3` varchar(500) DEFAULT NULL,
  `loai_trang_thai` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `BaiViet_LoaiBaiViet_idx` (`loai_bai_viet`),
  KEY `BaiViet_NguoiDung_idx` (`id_nguoi_dung`),
  KEY `BaiViet_LoaiTrangThai_idx` (`loai_trang_thai`),
  CONSTRAINT `BaiViet_LoaiBaiViet` FOREIGN KEY (`loai_bai_viet`) REFERENCES `loai_bai_viet` (`id`),
  CONSTRAINT `BaiViet_LoaiTrangThai` FOREIGN KEY (`loai_trang_thai`) REFERENCES `trang_thai_bai_viet` (`id`),
  CONSTRAINT `BaiViet_NguoiDung` FOREIGN KEY (`id_nguoi_dung`) REFERENCES `nguoi_dung` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=130 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bai_viet`
--

LOCK TABLES `bai_viet` WRITE;
/*!40000 ALTER TABLE `bai_viet` DISABLE KEYS */;
INSERT INTO `bai_viet` VALUES (2,'Cho thuệ trọ dành cho sinh viên','https://res.cloudinary.com/dpp5kyfae/image/upload/v1694369434/1_qrkpvc.jpg','Cho thuê trọ ở Gò Vấp','Gò Vấp',1,'2023-08-20',2,3,5000000,'25m2','RM27+PQ9, Hoàng Văn Thụ, Phường 2, Tân Bình, Thành phố Hồ Chí Minh 700000, Việt Nam',NULL,NULL,NULL,1),(28,'Tìm Trọ ở Bình Thạnh','https://res.cloudinary.com/dpp5kyfae/image/upload/v1694369434/4_pkcwug.jpg','Bao ăn ởi, điện nước','Gò Vấp',1,'2023-08-20',16,5,4300000,'15m2','Hầm thủ thiêm',NULL,NULL,NULL,1),(32,'Trọ ở Tân Phú','https://res.cloudinary.com/dpp5kyfae/image/upload/v1694369434/3_uv0ixl.jpg','Giá cực rẻ, thủ tục nhanh gọn lẹ','Gò Vấp',1,'2023-08-20',16,5,3900000,'25m2','97 Võ Văn Tần, Vo Thi Sau Ward, Quận 3, Thành phố Hồ Chí Minh','https://res.cloudinary.com/dpp5kyfae/image/upload/v1691978702/vbbwpizqp0icpiwoiegw.jpg','https://res.cloudinary.com/dpp5kyfae/image/upload/v1691978703/t5kjqoxha6uwvih65wns.jpg',NULL,3),(41,'Nhà trọ cao cấp','https://res.cloudinary.com/dpp5kyfae/image/upload/v1694369434/2_ueklro.jpg','Cho thuê trọ ở Gò Vấp','Bình Thạnh',1,'2023-04-20',16,4,3400000,'25m2','Số 1 Công xã Paris, phường Bến Nghé, thuộc Quận 1, Thành phố Hồ Chí Minh',NULL,NULL,NULL,1),(44,'Cho thuê trọ ở Tân Phú','https://res.cloudinary.com/dpp5kyfae/image/upload/v1694369434/5_iowvpq.jpg','Gần đại học OU','Bình Thạnh',1,'2023-08-20',2,4,3200000,'25m2','Vĩnh Lộc A, Hồ Chí Minh, Thành phố Hồ Chí Minh, Việt Nam',NULL,NULL,NULL,1),(45,'Nhà trọ cao cấp nè','https://res.cloudinary.com/dpp5kyfae/image/upload/v1696868261/rebsio4gk1gqaefuxv6o.png',NULL,'Bình Thạnh',1,'2023-08-20',6,5,3100000,'25m2','Số 135 đường Nam Kỳ Khởi Nghĩa, Thành phố Hồ Chí Minh',NULL,NULL,NULL,1),(47,'Trọ ở Tân Phú','https://res.cloudinary.com/dpp5kyfae/image/upload/v1694369434/9_vajaj4.jpg','Giá cực rẻ, thủ tục nhanh gọn lẹ','Tân Phú',1,'2023-04-20',16,5,3400000,'15m2','172 Lý Thường Kiệt, Phường 6, Tân Bình, Thành phố Hồ Chí Minh 700000, Việt Nam',NULL,NULL,NULL,1),(48,'Cho thuệ trọ dành cho sinh viên','https://res.cloudinary.com/dpp5kyfae/image/upload/v1694369435/11_klyy5u.jpg','Trọ ở Tân Phú giá rẻ bất ngờ','Gò Vấp',1,'2023-08-20',16,5,5000000,'25m2',' 12 Đ. Phan Văn Trị, Phường 5, Gò Vấp, Thành phố Hồ Chí Minh',NULL,NULL,NULL,1),(49,'Trọ ở Tân Phú','https://res.cloudinary.com/dpp5kyfae/image/upload/v1694369435/10_vwr5vo.jpg','Trọ giành cho sinh viên OU và IUH','Tân Phú',1,'2023-04-20',16,2,3400000,'15m2','Số 125 Công xã Paris, Bến Nghé, Quận 1',NULL,NULL,NULL,1),(50,'Nhà trọ cao cấp','https://res.cloudinary.com/dpp5kyfae/image/upload/v1694369435/12_htzeb1.jpg','Trọ ở Tân Phú giá rẻ bất ngờ','Tân Phú',1,'2023-08-20',16,2,5000000,'15m2','Điện Biên Phủ, quận Bình Thạnh, Thành phố Hồ Chí Minh',NULL,NULL,NULL,1),(51,'Trọ ở gò vấp rẻ','https://res.cloudinary.com/dpp5kyfae/image/upload/v1694369435/13_qqsq2m.jpg','Trọ giành cho sinh viên OU và IUH','Tân Phú',1,'2023-04-20',16,2,3400000,'15m2','Đại lộ Nguyễn Văn Linh, Khu Phố 6, Quận 8, Thành phố Hồ Chí Minh, Việt Nam',NULL,NULL,NULL,1),(52,'Cho thuê trọ ở Sóc Trăng','https://res.cloudinary.com/dpp5kyfae/image/upload/v1694369435/14_ohogxb.jpg','Quận 7 rẻ bất ngờ','Bình Thạnh',1,'2023-08-20',16,5,5000000,'13m2','Công Trường Lam Sơn, phường Bến Nghé, Quận 1, Thành phố Hồ Chí Minh',NULL,NULL,NULL,1),(53,'Trọ ở gò vấp rẻ','https://res.cloudinary.com/dpp5kyfae/image/upload/v1694369435/15_sgxz4p.jpg','Trọ giành cho sinh viên OU và IUH','Tân Phú',1,'2023-08-20',16,5,3100000,'15m2','268 Đ Tô Hiến Thành, Phường 15, Quận 10, Thành phố Hồ Chí Minh, Việt Nam',NULL,NULL,NULL,1),(56,'Trọ ở gò vấp rẻ','https://res.cloudinary.com/dpp5kyfae/image/upload/v1694369435/16_wcwnia.jpg','Trọ ở Tân Phú giá rẻ bất ngờ','Gò Vấp',1,'2023-04-20',16,3,5000000,'13m2','11 Đ. Sư Vạn Hạnh, Phường 12, Quận 10, Thành phố Hồ Chí Minh, Việt Nam',NULL,NULL,NULL,1),(57,'Cho thuê trọ sinh viên','https://res.cloudinary.com/dpp5kyfae/image/upload/v1694369436/18_scp5ro.jpg','Quận 7 rẻ bất ngờ','Bình Thạnh',1,'2023-09-20',16,2,3100000,'20m2','565 Lạc Long Quân, Phường 10, Tân Bình, Thành phố Hồ Chí Minh 70000, Việt Nam',NULL,NULL,NULL,1),(58,'Cho thuệ trọ dành cho sinh viên','https://res.cloudinary.com/dpp5kyfae/image/upload/v1694369436/19_vsmzpg.jpg','Gần đại học OU','Bình Thạnh',1,'2023-09-20',16,2,3100000,'13m2','97 Võ Văn Tần, Vo Thi Sau Ward, Quận 3, Thành phố Hồ Chí Minh',NULL,NULL,NULL,1),(59,'Trọ ở gò vấp rẻ bất ngờ','https://res.cloudinary.com/dpp5kyfae/image/upload/v1694369436/20_vrxm2t.jpg','Trọ ở Tân Phú giá rẻ bất ngờ','Tân Phú',1,'2023-04-20',16,5,3100000,'13m2','1225 TL43, Bình Chiểu, Thủ Đức, Thành phố Hồ Chí Minh, Việt Nam',NULL,NULL,NULL,1),(61,'Trọ ở gò vấp rẻ bất ngờ','https://res.cloudinary.com/dpp5kyfae/image/upload/v1694369436/17_dn2sdy.jpg','Giá cực rẻ, thủ tục nhanh gọn lẹ','Bình Thạnh',1,'2023-09-21',16,1,5000000,'20m2','QJ73+86P, 809 HL2, Bình Trị Đông A, Bình Tân, Thành phố Hồ Chí Minh 100000, Việt Nam',NULL,NULL,NULL,1),(64,'Cho thuệ trọ dành cho sinh viên','https://res.cloudinary.com/dpp5kyfae/image/upload/v1694369436/21_uwuz8m.jpg','Gần đại học OU','Bình Thạnh',1,'2023-09-20',6,2,3100000,'20m2','2A Đường D10, Tây Thạnh, Tân Phú, Thành phố Hồ Chí Minh, Việt Nam',NULL,NULL,NULL,1),(66,'Cho thuê trọ sinh viên','https://res.cloudinary.com/dpp5kyfae/image/upload/v1694369436/22_nkj9l4.jpg','Bao ăn ởi, điện nước','Bình Thạnh',1,'2023-03-04',6,1,5000000,'20m2','97 Võ Văn Tần, Vo Thi Sau Ward, Quận 3, Thành phố Hồ Chí Minh',NULL,NULL,NULL,1),(67,'Cho thuệ trọ dành cho sinh viên','https://res.cloudinary.com/dpp5kyfae/image/upload/v1694369436/23_pdzx4g.jpg','Quận 4 rẻ bất ngờ','Bình Thạnh',1,'2023-08-22',6,1,3100000,'23m2','Benh vien Quan Y 175, Nguyen Kiem, Phuong 3, Go Vap, Thanh pho Ho Chi Minh',NULL,NULL,NULL,1),(68,'Cho thuê trọ sinh viên','https://res.cloudinary.com/dpp5kyfae/image/upload/v1694369436/25_fqgigr.jpg','Trọ giành cho sinh viên OU và IUH','Quận 12',1,'2023-08-22',6,1,3400000,'20m2','4 Departure Loop, Phường 2, Tân Bình, Thành phố Hồ Chí Minh, Việt Nam',NULL,NULL,NULL,1),(70,'Cho thuệ trọ dành cho sinh viên','https://res.cloudinary.com/dpp5kyfae/image/upload/v1694370667/37_wttf0w.jpg','Quận 7 rẻ bất ngờ','Tân Phú',NULL,'2023-04-04',NULL,1,3900000,'18m2','01 Hoàng Thế Thiện, An Lợi Đông, Thành Phố Thủ Đức, Thành phố Hồ Chí Minh 700000, Việt Nam',NULL,NULL,NULL,1),(73,'Cho thuê trọ ở Tân Phú','https://res.cloudinary.com/dpp5kyfae/image/upload/v1694369437/26_qdbyom.jpg','Trọ giành cho sinh viên OU và IUH','Tân Phú',1,'2023-02-04',16,1,3400000,'20m2','11Z6 Hẻm D16, Tổ 7, Bình Chánh, Thành phố Hồ Chí Minh, Việt Nam',NULL,NULL,NULL,2),(74,'Tim trọ ở Quận 12',NULL,'Gần đại học OU','Tân Phú',2,'2023-09-20',14,3,3900000,'23m2','43 Đ. Lê Đức Thọ, P.7, Gò Vấp, Thành phố Hồ Chí Minh 70000, Việt Nam',NULL,NULL,NULL,3),(75,'Tim trọ ở Quận 1',NULL,'Gần đại học OU','Gò Vấp',2,'2023-03-04',14,4,3400000,'18m2','97 Võ Văn Tần, Vo Thi Sau Ward, Quận 3, Thành phố Hồ Chí Minh',NULL,NULL,NULL,3),(78,'Tim trọ ở gần đại học Mở','https://res.cloudinary.com/dpp5kyfae/image/upload/v1694369437/30_ll0zuq.jpg','Quận 7 rẻ bất ngờ','Quận 12',1,'2023-09-21',14,3,3400000,'18m2','242 Nguyễn Văn Lượng, Phường 10, Gò Vấp, Thành phố Hồ Chí Minh, Việt Nam',NULL,NULL,NULL,1),(79,'Tim trọ ở Tân phú',NULL,'Trọ rẻ nhất Sài gòn','Gò Vấp',2,'2023-03-04',14,4,3400000,'23m2','A1B/54 ấp 1B, Đ. Võ Văn Vân, Vĩnh Lộc B, Bình Chánh, Thành phố Hồ Chí Minh 70000, Việt Nam',NULL,NULL,NULL,3),(81,'Tim trọ ở gần đại học Mở',NULL,'Gần đại học OU','Quận 12',2,'2023-03-04',14,3,3900000,'18m2','97 Võ Văn Tần, Vo Thi Sau Ward, Quận 3, Thành phố Hồ Chí Minh',NULL,NULL,NULL,3),(82,'Tim trọ ở Tân phú',NULL,'Giá cực rẻ, thủ tục nhanh gọn lẹ','Tân Phú',2,'2023-09-04',14,3,3900000,'18m2','Hầm thủ thiêm',NULL,NULL,NULL,3),(83,'Tim tro','https://res.cloudinary.com/dpp5kyfae/image/upload/v1694370667/37_wttf0w.jpg','Bao ăn ởi, điện nước','Gò Vấp',1,'2023-09-04',16,5,5000000,'18m2','17 Đ. Phạm Hùng, Bình Hưng, Bình Chánh, Thành phố Hồ Chí Minh 70000, Việt Nam',NULL,NULL,NULL,3),(86,'Tim trọ ở gần đại học Mở','','Gần đại học OU','Tân Phú',2,'2023-09-04',10,2,2900000,'18m2','97 Võ Văn Tần, Vo Thi Sau Ward, Quận 3, Thành phố Hồ Chí Minh',NULL,NULL,NULL,1),(92,'Tim trọ ở gần đại học Mở',NULL,'Giá hời cho tất cả mọi người','Gò Vấp',2,'2023-09-05',14,3,2900000,'17m2','17 Đ. Phạm Hùng, Bình Hưng, Bình Chánh, Thành phố Hồ Chí Minh 70000, Việt Nam',NULL,NULL,NULL,1),(95,'Tim tro','https://res.cloudinary.com/dpp5kyfae/image/upload/v1694370666/34_s9fk8x.jpg','Trọ ở Tân Phú giá rẻ bất ngờ','Tân Phú',1,'2023-09-07',16,5,2900000,'17m2','Trường Sơn, Phường 2, Tân Bình, Thành phố Hồ Chí Minh, Việt Nam',NULL,NULL,NULL,3),(96,'Trọ ở gò vấp gia trị','https://res.cloudinary.com/dpp5kyfae/image/upload/v1694370666/33_pqvhfy.jpg','Trọ rẻ nhất Sài gòn','Tân Phú',1,'2023-03-04',7,5,2900000,'17m2','381a Tô Ngọc Vân, Thạnh Xuân, Quận 12, Thành phố Hồ Chí Minh 71500, Việt Nam',NULL,NULL,NULL,1),(97,'Cho thuê trọ ở Sóc Trăng','https://res.cloudinary.com/dpp5kyfae/image/upload/v1694370666/31_p9z6lu.jpg','Giá hời cho tất cả mọi người','Quận 12',1,'2023-09-08',7,3,2900000,'23m2','59 Đ. Số 4, Phường 5, Gò Vấp, Thành phố Hồ Chí Minh, Việt Nam',NULL,NULL,NULL,1),(101,'Tim tro','https://res.cloudinary.com/dpp5kyfae/image/upload/v1694370666/32_jsphlz.jpg','Bao điện nước','Bình Thạnh',1,'2023-09-09',2,5,2900000,'17m2','30 Đường Bờ Bao Tân Thắng, Sơn Kỳ, Tân Phú, Thành phố Hồ Chí Minh, Việt Nam',NULL,NULL,NULL,1),(102,'Trọ ở gò vấp gia trị','https://res.cloudinary.com/dpp5kyfae/image/upload/v1694369434/5_iowvpq.jpg','Trọ giành cho sinh viên OU','Tân Phú',1,'2023-03-04',2,2,2900000,'23m2','199 Nguyễn Sơn, Phú Thạnh, Tân Phú, Thành phố Hồ Chí Minh 700000, Việt Nam',NULL,NULL,NULL,1),(103,'Tim tro','https://res.cloudinary.com/dpp5kyfae/image/upload/v1694370667/40_uyhauy.jpg','Bao điện nước','Quận 12',1,'2023-09-09',2,3,2200000,'17m2','RM87+XX, Phường 2, Tân Bình, Thành phố Hồ Chí Minh, Việt Nam',NULL,NULL,NULL,3),(104,'Tim tro','https://res.cloudinary.com/dpp5kyfae/image/upload/v1694370666/36_mxury7.jpg','Giá cực rẻ, thủ tục nhanh gọn lẹ','Quận 12',1,'2023-09-09',7,3,2200000,'23m2','275/75/48 Quang Trung, Phường 10, Gò Vấp, Thành phố Hồ Chí Minh, Việt Nam',NULL,NULL,NULL,1),(105,'Trọ ở gò vấp gia trị','https://res.cloudinary.com/dpp5kyfae/image/upload/v1694370666/31_p9z6lu.jpg','Trọ giành cho sinh viên OU','Bình Thạnh',1,'2023-03-04',7,5,5000000,'23m2','Đ. Số 7, Khu đô Thị Vạn Phúc, Thủ Đức, Thành phố Hồ Chí Minh, Việt Nam',NULL,NULL,NULL,1),(111,'Nhà trọ cao cấp','https://res.cloudinary.com/dpp5kyfae/image/upload/v1694370666/31_p9z6lu.jpg','Bao điện nước','Quận 7',1,'2023-09-10',7,5,2200000,'17m2','87/8p Xuân Thới Thượng, 6 Ấp Xuân Thới Đông, Xuan Thoi Dong 1, Hóc Môn, Thành phố Hồ Chí Minh 700000, Việt Nam',NULL,NULL,NULL,1),(112,'Nhà trọ cao cấp','https://res.cloudinary.com/dpp5kyfae/image/upload/v1694370666/31_p9z6lu.jpg','Trọ giành cho sinh viên OU và IUH','Bình Thạnh',1,'2023-03-04',7,2,2900000,'17m2','308/5c ấp Tam Đông 2, Thới Tam Thôn, Hóc Môn, Thành phố Hồ Chí Minh, Việt Nam',NULL,NULL,NULL,1),(113,'Tim trọ ở Quận 12',NULL,'Giá hời cho tất cả mọi người','Quận 7',2,'2023-09-10',18,3,2900000,'17m2','96 ấp Tân Thới 3, Tân Hiệp, Hóc Môn, Thành phố Hồ Chí Minh, Việt Nam',NULL,NULL,NULL,3),(114,'Tim trọ ở Quận 4',NULL,'Giá cực rẻ, thủ tục nhanh gọn lẹ','Quận 7',2,'2023-09-22',18,3,2200000,'17m2','45 Trường Sơn, Phường 2, Tân Bình, Thành phố Hồ Chí Minh, Việt Nam',NULL,NULL,NULL,1),(115,'Tim trọ ở Quận 7',NULL,'Trọ giành cho sinh viên OU và IUH','Quận 7',2,'2023-09-10',18,4,2900000,'17m2','1 Đại lộ Bình Dương, Khu Phố, Thuận An, Bình Dương, Việt Nam',NULL,NULL,NULL,3),(116,'Tim trọ ở Quận 12',NULL,'Giá cực rẻ, thủ tục nhanh gọn lẹ','Bình Thạnh',2,'2023-09-10',18,5,2900000,'17m2','371 nguyen kiem phuong 3 go vap ',NULL,NULL,NULL,3),(119,'Tìm Trọ ở Bình Thạnh',NULL,'','Bình Thạnh',2,'2023-09-11',10,NULL,NULL,NULL,'Đ. Nguyễn Thị Minh Khai, Tân Bình, Dĩ An, Bình Dương, Việt Nam',NULL,NULL,NULL,1),(120,'Tìm Trọ ở Soc Trang',NULL,'','Soc Trang',2,'2023-09-11',10,NULL,NULL,NULL,'Đ. Võ Thị Sáu, Tân Phước Khánh, Tân Uyên, Bình Dương, Việt Nam',NULL,NULL,NULL,3),(121,'Tìm Trọ ở Bình Thạnh',NULL,'Tro gia re, tim tro gan truong ou','Binh Thanh',2,'2023-09-11',10,NULL,NULL,NULL,'2 Đ.Trương Thị Hoa, Hiệp Thành, Quận 12, Thành phố Hồ Chí Minh, Việt Nam',NULL,NULL,NULL,1),(122,'Cho thuê trọ ở Sóc TrăngTT','https://res.cloudinary.com/dpp5kyfae/image/upload/v1694403123/rpjogocmybue3kwx0xkl.jpg',NULL,'Soc Trang',1,'2023-03-22',2,2,5000000,'23m2','Dia chi gan trung tam soc trang',NULL,NULL,NULL,1),(123,'Cho thuê trọ ở Sóc TrăngTT','https://res.cloudinary.com/dpp5kyfae/image/upload/v1694403219/rtoyfdsfaekrx9r9ygss.jpg',NULL,'Soc Trang',1,'2023-05-13',2,2,5000000,'23m2','253C Hà Huy Giáp, Thạnh Lộc, Quận 12, Thành phố Hồ Chí Minh 71500, Việt Nam',NULL,NULL,NULL,1),(124,'Tìm Trọ ở Bình Thạnh','https://res.cloudinary.com/dpp5kyfae/image/upload/v1694403338/zpukairht3mlwfjhat0o.jpg','','Bình Thạnh',1,'2023-09-11',2,2,5000000,'23m2','331 QL1A, An Phú Đông, Quận 12, Thành phố Hồ Chí Minh, Việt Nam',NULL,NULL,NULL,2),(125,'Tìm Trọ ở Bình Thạnh',NULL,'','Bình Thạnh',2,'2023-09-11',10,NULL,NULL,NULL,'39A Hà Huy Giáp, Thạnh Lộc, Quận 12, Thành phố Hồ Chí Minh 700000, Việt Nam',NULL,NULL,NULL,2),(126,'Cho thuê trọ ở Sóc Trăng','https://res.cloudinary.com/dpp5kyfae/image/upload/v1694403906/waytkwtrffiaga7neau8.jpg','','Bình Thạnh',1,'2023-09-11',2,2,5000000,'23m2','Lê Lợi, Thanh Pho Ho Chi Minh',NULL,NULL,NULL,1),(127,'Cho thuê trọ ở Sóc TrăngTT','https://res.cloudinary.com/dpp5kyfae/image/upload/v1694404078/yaalqnyt7mvp5kmlzshk.jpg','','Bình Thạnh',1,'2023-09-11',2,2,5000000,'23m2','Gan Trung Tam Thanh Pho',NULL,NULL,NULL,1),(128,'Tìm Trọ ở Bình Thạnh','https://res.cloudinary.com/dpp5kyfae/image/upload/v1694412689/tljpeeymglyihi8k2wrd.jpg','','Bình Thạnh',1,'2023-09-11',2,5,5000000,'23','154/4A Lê Hoàng Phái, Phường 17, Gò Vấp, Thành phố Hồ Chí Minh, Việt Nam',NULL,NULL,NULL,1),(129,'Tìm Trọ ở Bình Thạnh','https://res.cloudinary.com/dpp5kyfae/image/upload/v1695212821/oja2dybioana1y5jcg5r.jpg','','Bình Thạnh',1,'2023-09-20',45,5,5000000,'23','4 Đ. Lê Đức Thọ, Phường 7, Gò Vấp, Thành phố Hồ Chí Minh, Việt Nam',NULL,NULL,NULL,2);
/*!40000 ALTER TABLE `bai_viet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `binh_luan`
--

DROP TABLE IF EXISTS `binh_luan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `binh_luan` (
  `id` int NOT NULL AUTO_INCREMENT,
  `noi_dung` varchar(1000) DEFAULT NULL,
  `ngay_binh_luan` date DEFAULT NULL,
  `id_nguoi_dung` int DEFAULT NULL,
  `id_bai_viet` int DEFAULT NULL,
  `hoi_dap` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `BinhLuan_NguoiDung_idx` (`id_nguoi_dung`),
  KEY `BinhLuan_BaiViet_idx` (`id_bai_viet`),
  CONSTRAINT `BinhLuan_BaiViet` FOREIGN KEY (`id_bai_viet`) REFERENCES `bai_viet` (`id`),
  CONSTRAINT `BinhLuan_NguoiDung` FOREIGN KEY (`id_nguoi_dung`) REFERENCES `nguoi_dung` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=813 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `binh_luan`
--

LOCK TABLES `binh_luan` WRITE;
/*!40000 ALTER TABLE `binh_luan` DISABLE KEYS */;
INSERT INTO `binh_luan` VALUES (25,'Giá rẻ nhất Gò Vấp',NULL,7,28,NULL),(617,'Trọ ở Tân Phú giá rẻ bất ngờ','2023-08-17',16,41,NULL),(687,'Cần tìm trọ giá rẻ cho sinh viên ở Tân Phú gần Aeon Tân Phú','2023-09-05',14,68,NULL),(690,'Giá rẻ nhất Gò Vấp','2023-09-05',14,68,NULL),(691,'Giá rẻ nhất Gò Vấp','2023-09-05',14,68,NULL),(692,'Giá rẻ nhất Gò Vấp','2023-09-05',14,68,NULL),(693,'Giá rẻ nhất Gò Vấp','2023-09-05',14,68,NULL),(723,'Rẻ thật','2023-09-05',14,66,NULL),(727,'Trọ ở Tân Phú giá rẻ bất ngờ','2023-09-05',14,66,NULL),(730,'Giá rẻ nhất Gò Vấp','2023-09-05',14,66,NULL),(737,'Giá rẻ nhất ở Sóc Trăng','2023-09-06',20,64,NULL),(748,'Trọ cho sinh viên ở Bình Thạnh','2023-09-06',2,64,NULL),(762,'Trọ cho sinh viên ở Bình Thạnh','2023-09-07',16,28,NULL),(763,'Trọ cho sinh viên ở Bình Thạnh','2023-09-07',7,48,NULL),(771,'Cần tìm trọ giá rẻ cho sinh viên ở Tân Phú gần Aeon Tân Phú','2023-09-07',7,2,619),(773,'Cần tìm trọ giá rẻ cho sinh viên ở Tân Phú gần Aeon Tân Phú','2023-09-07',7,2,620),(774,'Trọ cho sinh viên ở Bình Thạnh','2023-09-07',7,2,620),(775,'Trọ cho sinh viên ở Bình Thạnh','2023-09-08',7,2,774),(776,'Giá rẻ nhất ở Sóc Trăng','2023-09-08',7,2,771),(777,'Trọ cho sinh viên ở Bình Thạnh','2023-09-08',7,2,773),(778,'Trọ ở','2023-09-08',7,2,NULL),(782,'ghgdf','2023-09-08',7,2,780),(783,'Thiệt hông','2023-09-08',2,2,780),(791,'Cần tìm trọ giá rẻ cho sinh viên ở Tân Phú gần Aeon Tân Phú','2023-09-08',2,2,789),(793,'Giá rẻ nhất Gò Vấp','2023-09-08',7,28,25),(794,'Cần tìm trọ giá rẻ cho sinh viên ở Tân Phú gần Aeon Tân Phú','2023-09-08',7,49,NULL),(795,'Trọ ở Tân Phú giá rẻ bất ngờ','2023-09-08',7,49,794),(798,'Giá rẻ nhất ở Sóc Trăng','2023-09-09',7,2,796),(799,'Giá rẻ nhất ở Sóc Trăng','2023-09-09',7,2,791),(805,'Trọ ở Tân Phú giá rẻ bất ngờ','2023-09-11',10,2,791),(809,'Trọ ở Tân Phú giá rẻ bất ngờ','2023-09-11',10,50,NULL),(811,'Cần tìm trọ giá rẻ cho sinh viên ở Tân Phú gần Aeon Tân Phú','2023-09-25',2,114,NULL),(812,'Giá rẻ nhất Gò Vấp','2023-10-08',2,78,NULL);
/*!40000 ALTER TABLE `binh_luan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `follow`
--

DROP TABLE IF EXISTS `follow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `follow` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_khach_hang` int DEFAULT NULL,
  `id_chu_tro` int DEFAULT NULL,
  `trang_thai` varchar(45) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `Follow_KhachHang_idx` (`id_khach_hang`),
  KEY `Follow_ChuTro_idx` (`id_chu_tro`),
  CONSTRAINT `Follow_ChuTro` FOREIGN KEY (`id_chu_tro`) REFERENCES `nguoi_dung` (`id`),
  CONSTRAINT `Follow_KhachHang` FOREIGN KEY (`id_khach_hang`) REFERENCES `nguoi_dung` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=668 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `follow`
--

LOCK TABLES `follow` WRITE;
/*!40000 ALTER TABLE `follow` DISABLE KEYS */;
INSERT INTO `follow` VALUES (596,14,12,'1'),(603,18,12,'0'),(610,20,NULL,NULL),(613,21,NULL,NULL),(615,14,6,'1'),(617,22,NULL,NULL),(618,15,NULL,'0'),(620,23,NULL,NULL),(621,24,NULL,NULL),(622,25,NULL,NULL),(625,28,NULL,NULL),(628,32,NULL,NULL),(629,10,11,NULL),(630,34,NULL,NULL),(631,35,NULL,NULL),(634,14,16,'1'),(635,37,NULL,NULL),(636,16,NULL,'0'),(637,2,NULL,'0'),(638,7,NULL,'0'),(639,38,NULL,NULL),(640,18,2,'1'),(641,39,NULL,NULL),(642,40,NULL,NULL),(643,6,NULL,'0'),(645,41,NULL,NULL),(646,41,2,'1'),(649,42,NULL,NULL),(650,43,NULL,NULL),(651,8,NULL,'0'),(652,23,NULL,'0'),(653,37,NULL,'0'),(654,10,39,'0'),(656,43,NULL,'0'),(658,6,NULL,'0'),(659,44,NULL,NULL),(660,45,NULL,NULL),(661,46,NULL,NULL),(662,47,NULL,NULL),(663,48,NULL,NULL),(664,49,NULL,NULL),(666,8,16,'1');
/*!40000 ALTER TABLE `follow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hinh_anh`
--

DROP TABLE IF EXISTS `hinh_anh`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hinh_anh` (
  `id` int NOT NULL AUTO_INCREMENT,
  `duong_dan` varchar(500) DEFAULT NULL,
  `id_bai_viet` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `HinhAnh_BaiViet_idx` (`id_bai_viet`),
  CONSTRAINT `HinhAnh_BaiViet` FOREIGN KEY (`id_bai_viet`) REFERENCES `bai_viet` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hinh_anh`
--

LOCK TABLES `hinh_anh` WRITE;
/*!40000 ALTER TABLE `hinh_anh` DISABLE KEYS */;
INSERT INTO `hinh_anh` VALUES (1,NULL,53),(4,'https://res.cloudinary.com/dpp5kyfae/image/upload/v1692517040/ze0omhyf6rxdl2shien0.jpg',56),(5,'https://res.cloudinary.com/dpp5kyfae/image/upload/v1692517136/jnxtegpkndwumfibcnw0.jpg',57),(6,'https://res.cloudinary.com/dpp5kyfae/image/upload/v1692517236/jjz2js01pl7fnxiyygy6.jpg',58),(7,'https://res.cloudinary.com/dpp5kyfae/image/upload/v1692637868/w8sv5y6hk4zsygcwjyoa.jpg',59),(9,'https://res.cloudinary.com/dpp5kyfae/image/upload/v1692640526/jzcazythjzezz82fezpx.jpg',61),(12,'https://res.cloudinary.com/dpp5kyfae/image/upload/v1692687496/lwbzyxaqcy2eqlll4jxg.jpg',64),(14,'https://res.cloudinary.com/dpp5kyfae/image/upload/v1692691164/xbgezoupz1s9d96nbgtq.jpg',66),(15,'https://res.cloudinary.com/dpp5kyfae/image/upload/v1692691574/ubttxc2yzokoep2qhyms.jpg',67),(16,'https://res.cloudinary.com/dpp5kyfae/image/upload/v1692691626/lwsjner5cywmnrkx2hsz.jpg',68),(20,'https://res.cloudinary.com/dpp5kyfae/image/upload/v1693428779/jyiqi3lnhy5wwvk3t2xw.jpg',73),(21,NULL,74),(22,NULL,75),(25,NULL,79),(27,NULL,81),(28,NULL,82),(29,'https://res.cloudinary.com/dpp5kyfae/image/upload/v1693770656/tf2sjq2f1qj69jx6fvrk.jpg',83),(32,NULL,86),(38,NULL,92),(41,'https://res.cloudinary.com/dpp5kyfae/image/upload/v1694043067/hjpluh5fnwj6efzypsr9.jpg',95),(42,'https://res.cloudinary.com/dpp5kyfae/image/upload/v1694073198/w1ywbue7atspmysn0wfb.jpg',96),(43,'https://res.cloudinary.com/dpp5kyfae/image/upload/v1694125998/kfh6jyunt3crvqjv2e1d.jpg',97),(47,'https://res.cloudinary.com/dpp5kyfae/image/upload/v1694196076/tw2lfg9l1ozyvip8vlnq.jpg',101),(48,'https://res.cloudinary.com/dpp5kyfae/image/upload/v1694196297/miojahi4rpyicansxtwp.jpg',102),(49,NULL,103),(50,'https://res.cloudinary.com/dpp5kyfae/image/upload/v1694199262/gvvy95by8ftb70t8x7fv.jpg',104),(51,'https://res.cloudinary.com/dpp5kyfae/image/upload/v1694205693/xmhxe9hvabfrkqvro8zv.jpg',105),(57,'https://res.cloudinary.com/dpp5kyfae/image/upload/v1694348191/gttrcxjipo5tyb4h1hf7.jpg',111),(58,'https://res.cloudinary.com/dpp5kyfae/image/upload/v1694348334/mtsdfxacoamhdfg91gxk.jpg',112),(59,NULL,113),(60,NULL,114),(61,NULL,115),(62,NULL,116),(64,NULL,119),(65,NULL,120),(66,NULL,121),(67,'https://res.cloudinary.com/dpp5kyfae/image/upload/v1694402987/auwrzy8dpai5dk58scpl.jpg',122),(68,'https://res.cloudinary.com/dpp5kyfae/image/upload/v1694403206/cbbe15rb9ruvdujwoaev.jpg',123),(69,'https://res.cloudinary.com/dpp5kyfae/image/upload/v1694403338/zpukairht3mlwfjhat0o.jpg',124),(70,NULL,125),(71,'https://res.cloudinary.com/dpp5kyfae/image/upload/v1694403906/waytkwtrffiaga7neau8.jpg',126),(72,'https://res.cloudinary.com/dpp5kyfae/image/upload/v1694404078/yaalqnyt7mvp5kmlzshk.jpg',127),(73,'https://res.cloudinary.com/dpp5kyfae/image/upload/v1694412689/tljpeeymglyihi8k2wrd.jpg',128),(74,'https://res.cloudinary.com/dpp5kyfae/image/upload/v1695212821/oja2dybioana1y5jcg5r.jpg',129);
/*!40000 ALTER TABLE `hinh_anh` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loai_bai_viet`
--

DROP TABLE IF EXISTS `loai_bai_viet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loai_bai_viet` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ten_loai_bai_viet` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loai_bai_viet`
--

LOCK TABLES `loai_bai_viet` WRITE;
/*!40000 ALTER TABLE `loai_bai_viet` DISABLE KEYS */;
INSERT INTO `loai_bai_viet` VALUES (1,'CHO_THUE_TRO'),(2,'TIM_TRO');
/*!40000 ALTER TABLE `loai_bai_viet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loai_tai_khoan`
--

DROP TABLE IF EXISTS `loai_tai_khoan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loai_tai_khoan` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ten_loai_tai_khoan` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loai_tai_khoan`
--

LOCK TABLES `loai_tai_khoan` WRITE;
/*!40000 ALTER TABLE `loai_tai_khoan` DISABLE KEYS */;
INSERT INTO `loai_tai_khoan` VALUES (1,'ROLE_ADMIN'),(2,'ROLE_CHUTRO'),(3,'ROLE_KHACHHANG');
/*!40000 ALTER TABLE `loai_tai_khoan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `luu_tin`
--

DROP TABLE IF EXISTS `luu_tin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `luu_tin` (
  `id` int NOT NULL,
  `id_bai_viet` int DEFAULT NULL,
  `id_nguoi_dung` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `LuuTin_BaiViet_idx` (`id_bai_viet`),
  KEY `LuuTin_NguoiDung_idx` (`id_nguoi_dung`),
  CONSTRAINT `LuuTin_BaiViet` FOREIGN KEY (`id_bai_viet`) REFERENCES `bai_viet` (`id`),
  CONSTRAINT `LuuTin_NguoiDung` FOREIGN KEY (`id_nguoi_dung`) REFERENCES `nguoi_dung` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `luu_tin`
--

LOCK TABLES `luu_tin` WRITE;
/*!40000 ALTER TABLE `luu_tin` DISABLE KEYS */;
/*!40000 ALTER TABLE `luu_tin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nguoi_dung`
--

DROP TABLE IF EXISTS `nguoi_dung`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nguoi_dung` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ten_nguoi_dung` varchar(100) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `sdt` varchar(45) DEFAULT NULL,
  `ten_tai_khoan` varchar(100) DEFAULT NULL,
  `mat_khau` varchar(200) DEFAULT NULL,
  `id_loai_tai_khoan` int DEFAULT NULL,
  `avatar` varchar(500) DEFAULT NULL,
  `hinh_anh` varchar(500) DEFAULT NULL,
  `ngay_tao` date DEFAULT NULL,
  `kiem_duyet` varchar(45) DEFAULT NULL,
  `kinhDo` double DEFAULT NULL,
  `viDo` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ten_tai_khoan_UNIQUE` (`ten_tai_khoan`),
  KEY `NguoiDung_LoaiTaiKhoan_idx` (`id_loai_tai_khoan`),
  CONSTRAINT `NguoiDung_LoaiTaiKhoan` FOREIGN KEY (`id_loai_tai_khoan`) REFERENCES `loai_tai_khoan` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nguoi_dung`
--

LOCK TABLES `nguoi_dung` WRITE;
/*!40000 ALTER TABLE `nguoi_dung` DISABLE KEYS */;
INSERT INTO `nguoi_dung` VALUES (2,'NguyenThanhThuyen','2051050488thuyen@ou.edu.vn','0962539434','ThanhThuyen','$2a$10$HoaHUDdTHEnq43.6AnVf6.0pkJwOPBEg85ho829G4WnFuO0RFGt4q',2,'https://res.cloudinary.com/dpp5kyfae/image/upload/v1694367993/3_ebtity.png',NULL,'2022-08-22','KIEM_DUYET_2',10.828643178866932,106.62000323039034),(6,'NguyenThanhHuy','nnguyenthuyenn2205@gmail.com','0962539433','ThanhHuy','$2a$10$WwD7lX844x/gDkvkK2jN9OmuXNAih6QEdo5Lf5TnwGU0ssQzPzqcm',2,'https://res.cloudinary.com/dpp5kyfae/image/upload/v1694367997/4_wnphtb.png',NULL,'2020-03-22','KIEM_DUYET_2',10.817084542141892,106.67711564199301),(7,'CaoTienHieu','2051050488thanh@ou.edu.vn','0962339434','TienHieu','$2a$10$Y0EBC0RRWHUR.BjrAcdaDuE/Fw8IxBHyatfqDnUtmbak235yY7iNe',3,'https://res.cloudinary.com/dpp5kyfae/image/upload/v1694367999/5_i7kj5f.png',NULL,'2023-09-10','KIEM_DUYET_2',NULL,NULL),(8,'HuynhMinhHoang','2051050488hoang@ou.edu.vn','0962522434','MinhHoang','$2a$10$D86k7w1qSUYwYXIZMbdXROVXrpITsg.5a31lHVbdYZnyyUq8B/qPO',3,'https://res.cloudinary.com/dpp5kyfae/image/upload/v1694368002/6_rrl0ra.png',NULL,'2023-05-22','KIEM_DUYET_2',NULL,NULL),(10,'NguyenToanMy','nguyennthuyenn2205@gmail.com','0962539459','ToanMy','$2a$10$Nl/GeOzZY8u3tix3AOnSauR81NEN.3sXMtEZjLXIH6ChICP6jXVu6',3,'https://res.cloudinary.com/dpp5kyfae/image/upload/v1694403768/zny2op5di8jqhdy711b2.png',NULL,'2023-09-11','KIEM_DUYET_2',NULL,NULL),(11,'LeVanLam','2051050488lam@ou.edu.vn','0938232594','VanLam','$2a$10$xBD12RwaNUIgs/nuKYv7PeUJBk7qX97wscNF7IsvOTdO8UqKL4Ygq',2,'https://res.cloudinary.com/dpp5kyfae/image/upload/v1694368002/6_rrl0ra.png',NULL,'2020-04-22','KIEM_DUYET_2',NULL,NULL),(12,'ThaiTanPhat','2051050343phat@ou.edu.vn','0945432423','TanPhat','$2a$10$CuqnpqUzee.VbVK0KwyLo.cksMfe8qwq8GstN4WLzVYZXabdJCe4u',3,'https://res.cloudinary.com/dpp5kyfae/image/upload/v1691656188/szez6hmng6ig5zkv3kae.jpg',NULL,'2021-04-22','KIEM_DUYET_2',NULL,NULL),(13,'PhanThiYenVi','2051050488vi@ou.edu.vn','0332214434','YenVi','$2a$10$DOaBpuRhPHtW1FVopegld.2Kadad2arLTaK./oj/VYTBmn2FnbZqG',3,'https://res.cloudinary.com/dpp5kyfae/image/upload/v1694368004/7_xdxyfv.png',NULL,'2020-05-22','KIEM_DUYET_2',NULL,NULL),(14,'NguyenThiNgocYen','nnguyenthuyenn@gmail.com','0983264273','NgocYen',NULL,NULL,NULL,NULL,NULL,'KIEM_DUYET_2',NULL,NULL),(15,'ThaiTanPhat','2051050343phat@ou.edu.vn','0965667795','TanPhatAG','$2a$10$njhzpbdEEU8H1vJ92kiwBeZzco5qAKz1isNGDTq5Wt5ICb0eLpDE2',1,'https://res.cloudinary.com/dpp5kyfae/image/upload/v1694368008/9_u7kpxy.png',NULL,'2021-05-22','KIEM_DUYET_2',NULL,NULL),(16,'BaChu','2051050488tro@ou.edu.vn','09083453411','BaChu2','$2a$10$nCZm4.Y1olb5Mzxxw2UiuOuHJRU/egM2qjYhAINCm5lD8LgQdN0K2',2,'https://res.cloudinary.com/dpp5kyfae/image/upload/v1691811680/avatar_df5sev.webp',NULL,'2022-08-22','KIEM_DUYET_2',NULL,NULL),(18,'NguyenThanhHuy2106','nnguyenthuyenn2205@gmail.com','09083453411','ThanhHuy2106','$2a$10$TSNHnVZEYPwI9dX/7J1h2OOCqN1F4gI5bTOW0BCGKwTYFwxdvJMhG',3,'https://res.cloudinary.com/dpp5kyfae/image/upload/v1691904433/bu3txhbqaxc5glhiquzs.png',NULL,'2023-08-22','KIEM_DUYET_2',NULL,NULL),(20,'BaChu3','thuyenhuy1234@gmail.com','09083453411','BaChu3','$2a$10$bodo38y7qEp58aGyPToGLexiG2eNiNeq1zQYI76CLwHe/7DnX6dzK',2,'https://res.cloudinary.com/dpp5kyfae/image/upload/v1691904433/bu3txhbqaxc5glhiquzs.png',NULL,'2023-09-06','KIEM_DUYET_2',NULL,NULL),(21,'ThaiTanPhat','2051050488thuyen@ou.edu.vn','0965667795','ThaiTanPhat','$2a$10$Age71foBfLZ5O9wjB0vojehl0QnVwfyexyUDaXTcJys.dRuwuIdsS',3,'https://res.cloudinary.com/dpp5kyfae/image/upload/v1692640763/whfoxi2gavsbefdgwqep.jpg',NULL,'2023-07-22','KIEM_DUYET_2',NULL,NULL),(22,'DuongHuuThanh11','2051050488thuyen@ou.edu.vn','09083453411','ThanhThuyen22082022','$2a$10$zGt5f7dScnRBBnlnwGobD.Ea/.W0PfEWA/wbJp8llHeGJTVnSELCq',3,'https://res.cloudinary.com/dpp5kyfae/image/upload/v1692693715/dcrybx5dnx2gxyoopt5g.jpg',NULL,'2023-08-22','KIEM_DUYET_2',NULL,NULL),(23,'KhachLa','thuyenhuy1234@gmail.com','09083453411','BaChuMoi','$2a$10$0gmaak9Gi6OUUoXaLibjd.kRIpD9tKCORtSuSpl.eZUg7HfgoqRXy',2,'https://res.cloudinary.com/dpp5kyfae/image/upload/v1693781491/uiwtwcti3gmx7qyxynks.jpg',NULL,'2023-09-04','KIEM_DUYET_2',NULL,NULL),(24,'NguyenThiTro','nnguyenthuyenn2205@gmail.com','09083453411','tha222','$2a$10$D7otHeipgbb9ARuYf6UH8uz41mes3wQ1U1OXr.YU.JZjxwCXOdR4.',2,'https://res.cloudinary.com/dpp5kyfae/image/upload/v1693817306/ba3c4tqfxzdc7saq9u5w.jpg',NULL,'2023-09-04','KIEM_DUYET_2',NULL,NULL),(25,'ThaiTanPhat','thuyenhuy1234@gmail.com','09083453411','TanPhat102','$2a$10$MgOHptBpR3xYF9Ms/qa9eef1PBaPJp7F3Xu/ftgChZE3yUR3IdoTq',2,'https://res.cloudinary.com/dpp5kyfae/image/upload/v1693818764/vvvajbjbu8bvjeypwo23.jpg',NULL,'2023-09-04','KIEM_DUYET_2',NULL,NULL),(28,'ThaiTanPhat','thuyenhuy1234@gmail.com','09083453411','ThanhThuyen99','$2a$10$rdBVmPLNkGZeGDcUpEE5oOW53B7fIXtilC52dBW2KPwErOAq0YYay',3,'https://res.cloudinary.com/dpp5kyfae/image/upload/v1693822514/uhgmh1voodliskmi3eh5.jpg',NULL,'2023-09-04','KIEM_DUYET_2',NULL,NULL),(32,'BaChu','thuyenhuy1234@gmail.com','09083453411','tha12','$2a$10$/j9Li2OiG9RS7xCoUaSZROsJJzmvF.W4241gtrkn9v32YtCnRpNFq',3,'https://res.cloudinary.com/dpp5kyfae/image/upload/v1693824509/vsun0aozt4i1oxsbrefs.jpg',NULL,'2023-09-04','KIEM_DUYET_2',NULL,NULL),(33,'BaChu','2051050488thuyen@ou.edu.vn','09083453411','ThanhThuyen2212','$2a$10$EdKObBgvBctvST.OQS/ETOz4i6lWcCxRfbQKq3yKNIXRyNQfq69CG',3,'https://res.cloudinary.com/dpp5kyfae/image/upload/v1693826228/t9cmbabna13vhx6gouax.jpg',NULL,'2023-09-04','KIEM_DUYET_2',NULL,NULL),(34,'ThaiTanPhat','nnguyenthuyenn2205@gmail.com','09083453411','ThanhThuyen2232','$2a$10$HygbEIVRpVKJ1cB5FDYnSOvg2Xc6.Fl3PTuHrHnGHAhl68SvvUS56',2,'https://res.cloudinary.com/dpp5kyfae/image/upload/v1693826270/vjxkhpkdb21uoyzkethp.jpg','https://res.cloudinary.com/dpp5kyfae/image/upload/v1693826272/arwky7i7ud5kii0gqeq1.jpg','2023-09-04','KIEM_DUYET_2',NULL,NULL),(35,'ThaiTanPhat','2051050488thuyen@ou.edu.vn','09083453411','ThanhThuyen43','$2a$10$X4ZTr7TVuBzH8K15ooVm8eCl61LYmSlWYQvlzTCA8UNruKEu31NSe',2,'https://res.cloudinary.com/dpp5kyfae/image/upload/v1693851055/jmptpcjfz4uds3zcgcje.jpg','https://res.cloudinary.com/dpp5kyfae/image/upload/v1693851056/zbchcyekg6whbzuznkp1.jpg','2023-09-05','KIEM_DUYET_2',NULL,NULL),(37,'BaChu','2051050488thuyen@ou.edu.vn','09083453411','ThanhThuyen90','$2a$10$H3llVgG4iZGYFo1Qs2ooe.FtlmDM0jQr9bhuEVtA0EViMPeBppoVa',2,'https://res.cloudinary.com/dpp5kyfae/image/upload/v1693913808/h8xkp5mbis0ju2o50jci.jpg','https://res.cloudinary.com/dpp5kyfae/image/upload/v1693913811/ahho8csnz5wvmgn9ro07.jpg','2023-09-05','KIEM_DUYET_2',NULL,NULL),(38,'NguyenThiTro123','nnguyenthuyenn2205@gmail.com','09083453411','ThanhThuyen2222','$2a$10$g.e3hGjyJQ.SJtrMoWzEoOKTjvkC0CpEuAWWLf5Hs9/8btIykr2/e',2,'https://res.cloudinary.com/dpp5kyfae/image/upload/v1694193990/kcypzbp7wkonz5xxnbzt.jpg','https://res.cloudinary.com/dpp5kyfae/image/upload/v1694193992/dcyvjisa6okew325jpuf.jpg','2023-09-09','KIEM_DUYET_2',NULL,NULL),(39,'','2051050488thuyen@ou.edu.vn','09083453411','','$2a$10$RBGCIl/mAsNRt5SpIeW6iukHdXDJMzsdN3CjN7FJMowSUQ.ZVkh1.',3,'https://res.cloudinary.com/dpp5kyfae/image/upload/v1694348895/ztas2olz6lwzibcufsvt.jpg',NULL,'2023-09-10','KIEM_DUYET_2',NULL,NULL),(40,'ThaiTanPhat','thuyenhuy1234@gmail.com','09083453411','ThanhThuyen97','$2a$10$qjGpi4/1iIVMNgEVd0v3xevDcX48SENo2HKv2YXK0SxWySqR/H0iS',3,'https://res.cloudinary.com/dpp5kyfae/image/upload/v1694349405/xuivhxnzrvrzaxzzmjqg.jpg',NULL,'2023-09-10','KIEM_DUYET_2',NULL,NULL),(41,'NguyenThanhHai','2051050488hai@ou.edu.vn','0965667795','ThanhHai','$2a$10$NZLn0k4yIkxMK3ptijipvOBvD8L44NX2vvOLhLCYH/YV327573KMW',3,'https://res.cloudinary.com/dpp5kyfae/image/upload/v1694373294/ocikingelcm1wpeynqtl.png',NULL,'2023-09-11','KIEM_DUYET_2',NULL,NULL),(42,'NguyenDucHoang','nguyennthuyenn2205@gmail.com','0987534297','DucHoang','$2a$10$m.f85dGWeQ4F6R6nMHzEjeV5vhCBB9DH6yEJIzB50dZ5s.YX589J6',2,'https://res.cloudinary.com/dpp5kyfae/image/upload/v1694405297/evk9env6c95u5d4lzxcn.png','https://res.cloudinary.com/dpp5kyfae/image/upload/v1694405298/wivwqavpoak9qdlm5c85.png','2023-09-11','KIEM_DUYET_2',NULL,NULL),(43,'PhamPhiHoan','nguyennthuyenn2205@gmail.com','09083453411','PhiHoan','$2a$10$bM5xwVtv3wh9FyUwJuVBg.69rccUqdJIntqTyo1Mf9ZlGz55zdmyq',2,'https://res.cloudinary.com/dpp5kyfae/image/upload/v1694405744/mk7peeql0cuvirbtbirs.png','https://res.cloudinary.com/dpp5kyfae/image/upload/v1694369434/2_ueklro.jpg','2023-09-11','KIEM_DUYET_1',NULL,NULL),(44,'TrinhBaoDuy','nguyennthuyen2205@gmail.com','09083453411','BaoDuy','$2a$10$VZoBxdyxJ43NWarqBYk5cOli5UQErChYW6Jp7IsvUSuhuBsR6gjKm',2,'https://res.cloudinary.com/dpp5kyfae/image/upload/v1694412609/q9llegf8rsdrw5qttlqx.png','https://res.cloudinary.com/dpp5kyfae/image/upload/v1694412611/wjmxdj1ucfd4qn89agtp.png','2023-09-11','KIEM_DUYET_2',NULL,NULL),(45,'nguyenthanhthuyen','2051050488thuyen@ou.edu.vn','09083453411','tha2233','$2a$10$JxcK72t4dty929my7r/mye6E5ZOeq/WxYmD27lM4oijf8IGkEJl7S',2,'https://res.cloudinary.com/dpp5kyfae/image/upload/v1695212734/nhcrz3jpvmpumm5xkasz.png','https://res.cloudinary.com/dpp5kyfae/image/upload/v1695212735/jvtqz6kb2hwpgdjwaczc.png','2023-09-20','KIEM_DUYET_2',NULL,NULL),(46,'BaChu','2051050488thuyen@ou.edu.vn','09083453411','BaChu123','$2a$10$JkLxURrrB8pknEACuU/yfuUU3HfOlI05n33Xl3IXaK5KBgRCzRwSW',3,'https://res.cloudinary.com/dpp5kyfae/image/upload/v1695359886/aravcuinkuzrrdcag9lp.png',NULL,'2023-09-22','KIEM_DUYET_2',9.7060809,106.0522731),(47,'NguyenThanhHuy','2051050488thuyen@ou.edu.vn','09083453411','ThanhHuy2905','$2a$10$PyTfLN4..woUawNMe5evIOZpRUsYEUzWqZqfDVJElTvB.2OrQVzxO',3,'https://res.cloudinary.com/dpp5kyfae/image/upload/v1695375935/drp7jgnkzyylsrkt07p9.png',NULL,'2023-09-22','KIEM_DUYET_2',9.7060809,106.0522731),(48,'VoVanA','2051050488thuyen@ou.edu.vn','09083453411','VoVanA','$2a$10$f.zGZPmds/WFqwD5iPNSOuKti5uqcZBPBQ/sA67hdD4U4skcCGXFa',3,'https://res.cloudinary.com/dpp5kyfae/image/upload/v1695554624/a0b55mukyabmogmaxtf7.png',NULL,'2023-09-24','KIEM_DUYET_2',NULL,NULL),(49,'VoVanB','2051050488thuyen@ou.edu.vn','0965667795','VoVanB','$2a$10$MToASEuBJW4AQkGlW1riYOKKY0ScI9iKk1PUrKtRXzyegRCQKvc7a',3,'https://res.cloudinary.com/dpp5kyfae/image/upload/v1695554754/gq7du3nvnlnsjvg7ufxy.png',NULL,'2023-09-24','KIEM_DUYET_2',9.7060809,106.0522731);
/*!40000 ALTER TABLE `nguoi_dung` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `thong_bao`
--

DROP TABLE IF EXISTS `thong_bao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `thong_bao` (
  `id` int NOT NULL AUTO_INCREMENT,
  `noi_dung` varchar(200) DEFAULT NULL,
  `id_nguoi_dung` int DEFAULT NULL,
  `id_bai_viet` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ThongBao_NguoiDung_idx` (`id_nguoi_dung`),
  KEY `ThongBao_BaiViet_idx` (`id_bai_viet`),
  CONSTRAINT `ThongBao_BaiViet` FOREIGN KEY (`id_bai_viet`) REFERENCES `bai_viet` (`id`),
  CONSTRAINT `ThongBao_NguoiDung` FOREIGN KEY (`id_nguoi_dung`) REFERENCES `nguoi_dung` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thong_bao`
--

LOCK TABLES `thong_bao` WRITE;
/*!40000 ALTER TABLE `thong_bao` DISABLE KEYS */;
/*!40000 ALTER TABLE `thong_bao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tieu_chi`
--

DROP TABLE IF EXISTS `tieu_chi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tieu_chi` (
  `id` int NOT NULL AUTO_INCREMENT,
  `dia_chi_mong_muon` varchar(200) DEFAULT NULL,
  `so_nguoi_mong_muon` int DEFAULT NULL,
  `gia_mong_muon` decimal(10,0) DEFAULT NULL,
  `id_nguoi_dung` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `TieuChi_NguoiDung_idx` (`id_nguoi_dung`),
  CONSTRAINT `TieuChi_NguoiDung` FOREIGN KEY (`id_nguoi_dung`) REFERENCES `nguoi_dung` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tieu_chi`
--

LOCK TABLES `tieu_chi` WRITE;
/*!40000 ALTER TABLE `tieu_chi` DISABLE KEYS */;
/*!40000 ALTER TABLE `tieu_chi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trang_thai_bai_viet`
--

DROP TABLE IF EXISTS `trang_thai_bai_viet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trang_thai_bai_viet` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ten_loai_trang_thai` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trang_thai_bai_viet`
--

LOCK TABLES `trang_thai_bai_viet` WRITE;
/*!40000 ALTER TABLE `trang_thai_bai_viet` DISABLE KEYS */;
INSERT INTO `trang_thai_bai_viet` VALUES (1,'DA_XAC_NHAN'),(2,'DANG_CHO'),(3,'BI_TU_CHOI');
/*!40000 ALTER TABLE `trang_thai_bai_viet` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-11 21:08:28
