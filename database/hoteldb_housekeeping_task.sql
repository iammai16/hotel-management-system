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
-- Table structure for table `housekeeping_task`
--

DROP TABLE IF EXISTS `housekeeping_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `housekeeping_task` (
  `id` int NOT NULL AUTO_INCREMENT,
  `housekeeper_id` int NOT NULL,
  `room_id` int NOT NULL,
  `rental_id` int NOT NULL,
  `assigned_date` datetime NOT NULL,
  `completed_date` datetime DEFAULT NULL,
  `status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `housekeeper_id` (`housekeeper_id`),
  KEY `room_id` (`room_id`),
  KEY `rental_id` (`rental_id`),
  CONSTRAINT `housekeeping_task_ibfk_1` FOREIGN KEY (`housekeeper_id`) REFERENCES `user` (`id`),
  CONSTRAINT `housekeeping_task_ibfk_2` FOREIGN KEY (`room_id`) REFERENCES `room` (`id`),
  CONSTRAINT `housekeeping_task_ibfk_3` FOREIGN KEY (`rental_id`) REFERENCES `room_rental` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `housekeeping_task`
--

LOCK TABLES `housekeeping_task` WRITE;
/*!40000 ALTER TABLE `housekeeping_task` DISABLE KEYS */;
INSERT INTO `housekeeping_task` VALUES (1,8,1,1,'2024-05-20 09:00:00','2024-05-20 12:00:00','completed','Làm sạch sàn và thay ga trải giường'),(2,8,2,2,'2024-05-21 10:00:00',NULL,'assigned','Chuẩn bị khăn tắm và nước suối'),(3,8,3,3,'2024-05-22 08:30:00','2024-05-22 10:00:00','completed','Khử mùi phòng và kiểm tra thiết bị');
/*!40000 ALTER TABLE `housekeeping_task` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-18 20:51:36
