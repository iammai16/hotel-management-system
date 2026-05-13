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
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `customer_id` int NOT NULL,
  `content` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `room_id` int NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`,`room_id`),
  KEY `customer_id` (`customer_id`),
  KEY `room_id` (`room_id`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`),
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`room_id`) REFERENCES `room` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (2,'Khách sạn này tuyệt vời ',1,'2024-03-31 13:31:00',1),(3,'Thật bất ngờ vì vẻ đẹp của khách sạn',1,'2024-02-04 15:03:00',2),(4,'sẽ ủng hộ nhiều ạ ',2,'2024-05-06 12:04:00',3),(5,'Một trải nghiệm thật tuyệt vời',2,'2023-06-19 21:45:00',4),(6,'I love your Hotel',2,'2024-01-31 08:20:00',5),(2,'chất lượng tuyệt vời',3,'2024-03-01 20:08:00',6),(3,'thoải mái , bình yên , lãng mạn',3,'2024-03-06 15:56:00',7),(4,'Thật là một nơi đáng để nghỉ dưỡng',3,'2023-08-13 17:05:00',8),(5,'Xứng đáng với số tiền bỏ ra',3,'2023-12-12 12:12:00',9),(6,'Nhân viên lễ tân cute xĩu ^^',3,'2023-11-11 11:11:00',10),(2,'địa điểm đáng để chú ý trong kì kĩ dưỡng sắp tới của bạn!',4,'2023-12-21 12:12:00',11),(3,'không có gì để chê',4,'2023-08-08 08:08:00',12),(4,'Nơi này rất thoải mái và tiện nghi, có view đỉnh lắm ạ!',4,'2023-07-07 07:07:00',13),(5,'đi đi mọi người khách sạn tuyệt phẩm',4,'2023-11-30 06:12:00',14),(6,'tư vấn phòng này và trải nghiệm rất tốt',4,'2024-02-09 15:18:00',15),(2,'phòng rộng rãi, sạch sẽ, thơm tho',5,'2024-01-09 17:01:00',16),(3,'thanh toán thật dễ dàng',5,'2024-02-28 12:15:00',17),(4,'Luxury Hotel <3',5,'2023-08-31 09:21:00',18),(2,'good',2,'2025-05-18 17:13:46',19);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
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
