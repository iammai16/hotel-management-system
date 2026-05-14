-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: hoteldb
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('MANAGER','RECEPTIONIST','ACCOUNTANT','HOUSEKEEPER','SERVICESTAFF','ADMIN','CUSTOMER') COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` tinyint(1) DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('linh23','e10adc3949ba59abbe56e057f20f883e','ADMIN','khanhlinh4201@gmail.com','0375290878','https://res.cloudinary.com/dur0bydiv/image/upload/v1747547623/hotel/sqbdpbsxmdtnxbrxnoig.jpg',1,1),('tung05','e10adc3949ba59abbe56e057f20f883e','CUSTOMER','dinhtung@ou.edu.vn','0123456789','https://res.cloudinary.com/dur0bydiv/image/upload/v1747547627/hotel/iqnluakeur3yxdxzcrlz.png',1,2),('vananh21','e10adc3949ba59abbe56e057f20f883e','CUSTOMER','vananh21@ou.edu.vn','7312936921','https://res.cloudinary.com/dur0bydiv/image/upload/v1747547635/hotel/lp0c4wctgjmss2fzp3wc.jpg',1,3),('dieuthuy27','e10adc3949ba59abbe56e057f20f883e','CUSTOMER','dieuthuy27@gmail.com','3485692348','https://res.cloudinary.com/dg1zsnywc/image/upload/v1715772103/il4g2k9ndrvvj187vkqg.jpg',1,4),('huyhuy12','e10adc3949ba59abbe56e057f20f883e','CUSTOMER','huyhuy12@gmail.com','31231234124','https://res.cloudinary.com/dur0bydiv/image/upload/v1747547640/hotel/fg6y1w4cxfcfpxb6l09u.jpg',1,5),('thanhtung13','e10adc3949ba59abbe56e057f20f883e','CUSTOMER','thanhtung13@gmail.com','56978560756','https://res.cloudinary.com/dur0bydiv/image/upload/v1747547637/hotel/izmrnufhyjvtu5h3yp45.jpg',1,6),('minhanh88','e10adc3949ba59abbe56e057f20f883e','RECEPTIONIST','minhanh88@gmail.com','8354084534324','https://res.cloudinary.com/dg1zsnywc/image/upload/v1715800302/avt_zrf6wj.jpg',0,7),('tranminhhaiduong','e10adc3949ba59abbe56e057f20f883e','HOUSEKEEPER','haiduongminhtran@gmail.com','23345434','https://res.cloudinary.com/dg1zsnywc/image/upload/v1715800302/avt_zrf6wj.jpg',0,8),('tung0576','e10adc3949ba59abbe56e057f20f883e','CUSTOMER','vubuidinhtung@gmail.com','0338808538','https://res.cloudinary.com/dg1zsnywc/image/upload/v1715800302/avt_zrf6wj.jpg',1,9),('tung05345','e10adc3949ba59abbe56e057f20f883e','CUSTOMER','vubuidinhtung2@gmail.com','03388085382','https://res.cloudinary.com/dg1zsnywc/image/upload/v1715800302/avt_zrf6wj.jpg',1,11),('tung051212','e10adc3949ba59abbe56e057f20f883e','CUSTOMER','vubuidinhtung22@gmail.com','03388085381121','https://res.cloudinary.com/dg1zsnywc/image/upload/v1715800302/avt_zrf6wj.jpg',1,12),('vutu','e10adc3949ba59abbe56e057f20f883e','CUSTOMER','vubuidinhtung12@gmail.com','033880853823124','https://res.cloudinary.com/dg1zsnywc/image/upload/v1715800302/avt_zrf6wj.jpg',1,14);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-18 20:51:35
