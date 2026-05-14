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
-- Temporary view structure for view `monthly_sale_statistic_view`
--

DROP TABLE IF EXISTS `monthly_sale_statistic_view`;
/*!50001 DROP VIEW IF EXISTS `monthly_sale_statistic_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `monthly_sale_statistic_view` AS SELECT 
 1 AS `room_type`,
 1 AS `month`,
 1 AS `year`,
 1 AS `receipt_count`,
 1 AS `total_revenue`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `customer_type_regulation_view`
--

DROP TABLE IF EXISTS `customer_type_regulation_view`;
/*!50001 DROP VIEW IF EXISTS `customer_type_regulation_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `customer_type_regulation_view` AS SELECT 
 1 AS `id`,
 1 AS `admin_username`,
 1 AS `customer_type`,
 1 AS `rate`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `room_regulation_view`
--

DROP TABLE IF EXISTS `room_regulation_view`;
/*!50001 DROP VIEW IF EXISTS `room_regulation_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `room_regulation_view` AS SELECT 
 1 AS `regulation_id`,
 1 AS `room_type_name`,
 1 AS `admin_username`,
 1 AS `room_quantity`,
 1 AS `capacity`,
 1 AS `price`,
 1 AS `surcharge`,
 1 AS `deposit_rate`,
 1 AS `distance`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `systemchangelogs`
--

DROP TABLE IF EXISTS `systemchangelogs`;
/*!50001 DROP VIEW IF EXISTS `systemchangelogs`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `systemchangelogs` AS SELECT 
 1 AS `log_id`,
 1 AS `username`,
 1 AS `action_type`,
 1 AS `action_description`,
 1 AS `action_time`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `guesthistory`
--

DROP TABLE IF EXISTS `guesthistory`;
/*!50001 DROP VIEW IF EXISTS `guesthistory`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `guesthistory` AS SELECT 
 1 AS `customer_id`,
 1 AS `customer_name`,
 1 AS `rental_id`,
 1 AS `checkin_date`,
 1 AS `checkout_date`,
 1 AS `room_name`,
 1 AS `nights`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `room_utilization_report_view`
--

DROP TABLE IF EXISTS `room_utilization_report_view`;
/*!50001 DROP VIEW IF EXISTS `room_utilization_report_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `room_utilization_report_view` AS SELECT 
 1 AS `room_name`,
 1 AS `rental_count`,
 1 AS `total_days_rented`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `reportlist`
--

DROP TABLE IF EXISTS `reportlist`;
/*!50001 DROP VIEW IF EXISTS `reportlist`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `reportlist` AS SELECT 
 1 AS `report_id`,
 1 AS `admin_username`,
 1 AS `created_date`,
 1 AS `total_revenue`,
 1 AS `description`,
 1 AS `report_month`,
 1 AS `report_year`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `employeelist`
--

DROP TABLE IF EXISTS `employeelist`;
/*!50001 DROP VIEW IF EXISTS `employeelist`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `employeelist` AS SELECT 
 1 AS `user_id`,
 1 AS `username`,
 1 AS `role`,
 1 AS `email`,
 1 AS `phone`,
 1 AS `gender`,
 1 AS `avatar`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `available_room`
--

DROP TABLE IF EXISTS `available_room`;
/*!50001 DROP VIEW IF EXISTS `available_room`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `available_room` AS SELECT 
 1 AS `room_id`,
 1 AS `room_name`,
 1 AS `room_type`,
 1 AS `image`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `monthly_sale_statistic_view`
--

/*!50001 DROP VIEW IF EXISTS `monthly_sale_statistic_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `monthly_sale_statistic_view` AS select `rt`.`name` AS `room_type`,month(`rp`.`created_date`) AS `month`,year(`rp`.`created_date`) AS `year`,count(`rp`.`id`) AS `receipt_count`,sum(`rp`.`total_price`) AS `total_revenue` from (((`receipt` `rp` join `room_rental` `rr` on((`rp`.`rental_room_id` = `rr`.`id`))) join `room` `r` on((`rr`.`room_id` = `r`.`id`))) join `room_type` `rt` on((`r`.`room_type_id` = `rt`.`id`))) group by `rt`.`name`,month(`rp`.`created_date`),year(`rp`.`created_date`) order by `year` desc,`month` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `customer_type_regulation_view`
--

/*!50001 DROP VIEW IF EXISTS `customer_type_regulation_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `customer_type_regulation_view` AS select `ctr`.`id` AS `id`,`u`.`username` AS `admin_username`,`ct`.`type` AS `customer_type`,`ctr`.`rate` AS `rate` from (((`customer_type_regulation` `ctr` join `customer_type` `ct` on((`ctr`.`customer_type_id` = `ct`.`id`))) join `administrator` `a` on((`ctr`.`admin_id` = `a`.`id`))) join `user` `u` on((`u`.`id` = `a`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `room_regulation_view`
--

/*!50001 DROP VIEW IF EXISTS `room_regulation_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `room_regulation_view` AS select `rr`.`id` AS `regulation_id`,`rt`.`name` AS `room_type_name`,`u`.`username` AS `admin_username`,`rr`.`room_quantity` AS `room_quantity`,`rr`.`capacity` AS `capacity`,`rr`.`price` AS `price`,`rr`.`surcharge` AS `surcharge`,`rr`.`deposit_rate` AS `deposit_rate`,`rr`.`distance` AS `distance` from (((`room_regulation` `rr` join `room_type` `rt` on((`rr`.`room_type_id` = `rt`.`id`))) join `administrator` `a` on((`rr`.`admin_id` = `a`.`id`))) join `user` `u` on((`u`.`id` = `a`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `systemchangelogs`
--

/*!50001 DROP VIEW IF EXISTS `systemchangelogs`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `systemchangelogs` AS select `al`.`id` AS `log_id`,`u`.`username` AS `username`,`al`.`action_type` AS `action_type`,`al`.`action_description` AS `action_description`,`al`.`action_time` AS `action_time` from (`activity_log` `al` join `user` `u` on((`al`.`user_id` = `u`.`id`))) order by `al`.`action_time` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `guesthistory`
--

/*!50001 DROP VIEW IF EXISTS `guesthistory`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `guesthistory` AS select `c`.`customer_id` AS `customer_id`,`c`.`name` AS `customer_name`,`rr`.`id` AS `rental_id`,`rr`.`checkin_date` AS `checkin_date`,`rr`.`checkout_date` AS `checkout_date`,`ro`.`name` AS `room_name`,(to_days(`rr`.`checkout_date`) - to_days(`rr`.`checkin_date`)) AS `nights` from (((`customer` `c` join `room_rental_detail` `rd` on((`c`.`customer_id` = `rd`.`customer_id`))) join `room_rental` `rr` on((`rd`.`room_rental_id` = `rr`.`id`))) join `room` `ro` on((`rr`.`room_id` = `ro`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `room_utilization_report_view`
--

/*!50001 DROP VIEW IF EXISTS `room_utilization_report_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `room_utilization_report_view` AS select `r`.`name` AS `room_name`,count(`rr`.`id`) AS `rental_count`,sum((to_days(`rr`.`checkout_date`) - to_days(`rr`.`checkin_date`))) AS `total_days_rented` from (`room_rental` `rr` join `room` `r` on((`rr`.`room_id` = `r`.`id`))) group by `r`.`name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `reportlist`
--

/*!50001 DROP VIEW IF EXISTS `reportlist`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `reportlist` AS select `rp`.`id` AS `report_id`,`u`.`username` AS `admin_username`,`rp`.`created_date` AS `created_date`,`rp`.`total_revenue` AS `total_revenue`,`rp`.`description` AS `description`,month(`rp`.`created_date`) AS `report_month`,year(`rp`.`created_date`) AS `report_year` from ((`report` `rp` join `administrator` `a` on((`rp`.`admin_id` = `a`.`id`))) join `user` `u` on((`a`.`id` = `u`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `employeelist`
--

/*!50001 DROP VIEW IF EXISTS `employeelist`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `employeelist` AS select `user`.`id` AS `user_id`,`user`.`username` AS `username`,`user`.`role` AS `role`,`user`.`email` AS `email`,`user`.`phone` AS `phone`,`user`.`gender` AS `gender`,`user`.`avatar` AS `avatar` from `user` where (`user`.`role` in ('MANAGER','RECEPTIONIST','ACCOUNTANT','HOUSEKEEPER','SERVICESTAFF')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `available_room`
--

/*!50001 DROP VIEW IF EXISTS `available_room`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `available_room` AS select `r`.`id` AS `room_id`,`r`.`name` AS `room_name`,`rt`.`name` AS `room_type`,`r`.`image` AS `image` from (`room` `r` join `room_type` `rt` on((`r`.`room_type_id` = `rt`.`id`))) where `r`.`id` in (select `room_rental`.`room_id` from `room_rental` where ((`room_rental`.`checkout_date` is null) or (`room_rental`.`is_paid` = 0))) is false */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Dumping events for database 'hoteldb'
--

--
-- Dumping routines for database 'hoteldb'
--
/*!50003 DROP PROCEDURE IF EXISTS `add_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_user`(
    IN p_customer_type_id INT,
    IN p_name VARCHAR(50),
    IN p_username VARCHAR(50),
    IN p_password_md5 VARCHAR(32),
    IN p_phone VARCHAR(50),
    IN p_id_num VARCHAR(15),
    IN p_email VARCHAR(50),
    IN p_avatar VARCHAR(100),
    IN p_gender TINYINT(1)
)
BEGIN
    DECLARE user_id INT;

    INSERT INTO hoteldb.user(username, password, role, email, phone, avatar, gender)
    VALUES (p_username, p_password_md5, 'CUSTOMER', p_email, p_phone, p_avatar, p_gender);

    SET user_id = LAST_INSERT_ID();

    INSERT INTO hoteldb.customer(id, name, identification, customer_type_id)
    VALUES (user_id, p_name, p_id_num, p_customer_type_id);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `calculate_total_reservation_price` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `calculate_total_reservation_price`(
    IN p_reservation_id INT,
    OUT p_total_price FLOAT
)
BEGIN
    DECLARE v_room_id INT;
    DECLARE v_deposit_rate FLOAT DEFAULT 0;
    DECLARE v_surcharge FLOAT DEFAULT 0;
    DECLARE v_customer_rate FLOAT DEFAULT 0;
    DECLARE v_base_price FLOAT DEFAULT 0;
    DECLARE v_total_services FLOAT DEFAULT 0;
    DECLARE v_total_room FLOAT DEFAULT 0;
    DECLARE v_room_rental_id INT;

    -- Lấy room_id từ reservation
    SELECT room_id INTO v_room_id
    FROM hoteldb.reservation
    WHERE id = p_reservation_id;

    -- Lấy room_rental_id tương ứng (nếu có liên kết)
    SELECT id INTO v_room_rental_id
    FROM hoteldb.room_rental
    WHERE room_id = v_room_id AND reservation_id = p_reservation_id
    LIMIT 1;

    -- Lấy thông tin room_regulation
    SELECT deposit_rate, surcharge, price
    INTO v_deposit_rate, v_surcharge, v_base_price
    FROM hoteldb.room_regulation
    WHERE room_type_id = (SELECT room_type_id FROM hoteldb.room WHERE id = v_room_id)
    ORDER BY id DESC
    LIMIT 1;

    -- Tính hệ số trung bình của loại khách hàng trong reservation
    SELECT AVG(ctr.rate)
    INTO v_customer_rate
    FROM hoteldb.customer_type_regulation ctr
    JOIN hoteldb.reservation_detail rd ON ctr.customer_type_id = (
        SELECT customer_type_id FROM hoteldb.customer WHERE customer_id = rd.customer_id LIMIT 1
    )
    WHERE rd.reservation_id = p_reservation_id;

    -- Tính tiền phòng đã điều chỉnh
    SET v_total_room = (v_base_price * v_customer_rate) + v_surcharge;

    -- Tính tổng tiền dịch vụ theo room_rental_id (nếu có)
    IF v_room_rental_id IS NOT NULL THEN
        SELECT IFNULL(SUM(total_price), 0)
        INTO v_total_services
        FROM hoteldb.room_service
        WHERE room_rental_id = v_room_rental_id;
    ELSE
        SET v_total_services = 0;
    END IF;

    -- Tổng cộng = phòng + dịch vụ
    SET p_total_price = v_total_room + v_total_services;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `check_customer_existence` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `check_customer_existence`(
    IN p_identifications TEXT,
    OUT exists_flag BOOLEAN
)
BEGIN
    DECLARE found_count INT;

    -- Sử dụng prepared statement (giới hạn tính năng của MySQL nên dùng cách sau)
    SET @query = CONCAT('SELECT COUNT(*) INTO @found_count FROM hoteldb.customer WHERE identification IN (', p_identifications, ')');
    PREPARE stmt FROM @query;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;

    IF @found_count > 0 THEN
        SET exists_flag = TRUE;
    ELSE
        SET exists_flag = FALSE;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `check_login` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `check_login`(IN p_username VARCHAR(50), IN p_password_md5 VARCHAR(32))
BEGIN
    SELECT * FROM hoteldb.user
    WHERE username = p_username AND password = p_password_md5;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `check_reservation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `check_reservation`(
    IN p_checkin DATETIME,
    IN p_checkout DATETIME,
    IN p_room_id INT,
    OUT is_available BOOLEAN
)
BEGIN
    DECLARE conflict_count INT;

    SELECT COUNT(*) INTO conflict_count
    FROM (
        SELECT checkin_date, checkout_date FROM hoteldb.reservation
        WHERE room_id = p_room_id AND (
            (checkin_date < p_checkout AND checkout_date > p_checkin)
        )
        UNION ALL
        SELECT checkin_date, checkout_date FROM hoteldb.room_rental
        WHERE room_id = p_room_id AND (
            (checkin_date < p_checkout AND checkout_date > p_checkin)
        )
    ) AS conflicts;

    IF conflict_count = 0 THEN
        SET is_available = TRUE;
    ELSE
        SET is_available = FALSE;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_available_rooms` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_available_rooms`(
    IN p_checkin DATETIME,
    IN p_checkout DATETIME,
    IN p_room_type_id INT,
    IN p_keyword VARCHAR(100)
)
BEGIN
    SELECT 
        r.id AS room_id,
        r.name AS room_name,
        rt.name AS room_type,
        rt.id AS room_type_id,
        r.image,
        rr.price,
        rr.room_quantity,
        rr.capacity,
        rr.distance
    FROM room r
    JOIN room_type rt ON r.room_type_id = rt.id
    LEFT JOIN room_regulation rr ON rr.room_type_id = rt.id  
    WHERE r.id NOT IN (
        SELECT room_id
        FROM room_rental
        WHERE
            (checkout_date IS NULL OR is_paid = 0)
            OR (
                p_checkin IS NOT NULL AND p_checkout IS NOT NULL
                AND (p_checkin < checkout_date AND p_checkout > checkin_date)
            )
    )
    AND (p_room_type_id IS NULL OR rt.id = p_room_type_id)
    AND (
        p_keyword IS NULL 
        OR r.name LIKE CONCAT('%', p_keyword, '%') 
        OR rt.name LIKE CONCAT('%', p_keyword, '%')
    );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_booked_rooms_by_identification` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_booked_rooms_by_identification`(IN p_identification VARCHAR(15))
BEGIN
    SELECT r.name AS room_name, res.checkin_date, res.checkout_date, res.deposit
    FROM hoteldb.customer c
    JOIN hoteldb.reservation_detail rd ON c.customer_id = rd.customer_id
    JOIN hoteldb.reservation res ON res.id = rd.reservation_id
    JOIN hoteldb.room r ON res.room_id = r.id
    WHERE c.identification = p_identification AND res.is_checkin = 0;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_customers_by_name` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_customers_by_name`(IN p_name VARCHAR(50))
BEGIN
    SELECT c.name, c.identification, u.avatar, ct.type
    FROM hoteldb.customer c
    JOIN hoteldb.customer_type ct ON c.customer_type_id = ct.id
    LEFT JOIN hoteldb.user u ON c.id = u.id
    WHERE p_name IS NULL OR c.name LIKE CONCAT('%', p_name, '%');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_customer_by_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_customer_by_user`(IN p_user_id INT)
BEGIN
    SELECT c.*, ct.type
    FROM hoteldb.customer c
    JOIN hoteldb.customer_type ct ON c.customer_type_id = ct.id
    WHERE c.id = p_user_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_cus_type_by_identification` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_cus_type_by_identification`(IN p_identification VARCHAR(15))
BEGIN
    SELECT ct.type
    FROM hoteldb.customer c
    JOIN hoteldb.customer_type ct ON c.customer_type_id = ct.id
    WHERE c.identification = p_identification;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_rented_rooms_by_identification` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_rented_rooms_by_identification`(IN p_identification VARCHAR(15))
BEGIN
    SELECT r.name AS room_name, rr.checkin_date, rr.checkout_date, rr.deposit
    FROM hoteldb.customer c
    JOIN hoteldb.room_rental_detail rrd ON c.customer_id = rrd.customer_id
    JOIN hoteldb.room_rental rr ON rr.id = rrd.room_rental_id
    JOIN hoteldb.room r ON rr.room_id = r.id
    WHERE c.identification = p_identification AND rr.is_paid = 0;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_user_by_email` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_user_by_email`(IN p_email VARCHAR(50))
BEGIN
    SELECT * FROM hoteldb.user WHERE email = p_email;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_user_by_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_user_by_id`(IN p_user_id INT)
BEGIN
    SELECT * FROM hoteldb.user WHERE id = p_user_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_user_by_phone` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_user_by_phone`(IN p_phone VARCHAR(50))
BEGIN
    SELECT * FROM hoteldb.user WHERE phone = p_phone;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_user_by_username` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_user_by_username`(IN p_username VARCHAR(50))
BEGIN
    SELECT * FROM hoteldb.user WHERE username = p_username;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-18 20:51:36
