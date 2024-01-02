-- MySQL dump 10.13  Distrib 8.0.34, for macos13 (arm64)
--
-- Host: localhost    Database: blood_test_management
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `appointment`
--

DROP TABLE IF EXISTS `appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment` (
  `appointment_ID` varchar(50) NOT NULL,
  `patient_ID` varchar(50) NOT NULL,
  `nurse_ID` varchar(50) NOT NULL,
  `appointment_date` date NOT NULL,
  `appointment_time` time NOT NULL,
  `appointment_status` varchar(9) NOT NULL,
  PRIMARY KEY (`appointment_ID`),
  KEY `patient_ID` (`patient_ID`),
  KEY `nurse_ID` (`nurse_ID`),
  CONSTRAINT `appointment_ibfk_1` FOREIGN KEY (`patient_ID`) REFERENCES `patient` (`patient_ID`),
  CONSTRAINT `appointment_ibfk_2` FOREIGN KEY (`nurse_ID`) REFERENCES `nurse` (`nurse_ID`),
  CONSTRAINT `appointment_chk_1` CHECK ((`appointment_status` in (_utf8mb4'Scheduled',_utf8mb4'Completed',_utf8mb4'Cancelled')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment`
--

LOCK TABLES `appointment` WRITE;
/*!40000 ALTER TABLE `appointment` DISABLE KEYS */;
INSERT INTO `appointment` VALUES ('A1','P19','N3','2023-10-02','10:00:00','Completed'),('A10','P4','N5','2023-10-23','14:00:00','Completed'),('A11','P10','N3','2023-10-24','12:30:00','Completed'),('A12','P15','N3','2023-10-27','15:15:00','Scheduled'),('A13','P8','N4','2023-10-28','09:00:00','Scheduled'),('A14','P1','N3','2023-10-29','11:15:00','Scheduled'),('A15','P7','N4','2023-10-30','14:30:00','Scheduled'),('A2','P11','N3','2023-10-05','11:30:00','Completed'),('A3','P18','N2','2023-10-08','14:15:00','Completed'),('A4','P16','N5','2023-10-09','09:45:00','Cancelled'),('A5','P12','N2','2023-10-12','12:30:00','Completed'),('A6','P8','N4','2023-10-13','13:15:00','Completed'),('A7','P15','N1','2023-10-15','16:00:00','Completed'),('A8','P13','N3','2023-10-17','09:30:00','Completed'),('A9','P14','N4','2023-10-21','11:45:00','Completed');
/*!40000 ALTER TABLE `appointment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blood_test`
--

DROP TABLE IF EXISTS `blood_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blood_test` (
  `test_name` varchar(50) NOT NULL,
  `test_description` varchar(200) NOT NULL,
  PRIMARY KEY (`test_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blood_test`
--

LOCK TABLES `blood_test` WRITE;
/*!40000 ALTER TABLE `blood_test` DISABLE KEYS */;
INSERT INTO `blood_test` VALUES ('BMP','Basic metabolic panel measures fluid balance, electrolytes and kidney function.'),('CBC','Complete blood count measures levels of different blood cells.'),('CRP','Measures level of C-reactive protein which can be indicative of inflammation or infection.'),('Culture','Tests for bacterial or fungal infection.'),('Ferritin','Measures level of iron.'),('Glucose','Measures level of sugar.'),('Lipase','Measures level of lipase enzyme to check pancreas function.'),('Lipid','Measures levels of different fats including cholesterol and triglycerides.'),('T4','Measures level of thyroxine hormone to check thyroid function.'),('VitD','Measures level of vitamin D.');
/*!40000 ALTER TABLE `blood_test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blood_test_result`
--

DROP TABLE IF EXISTS `blood_test_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blood_test_result` (
  `test_result_ID` varchar(50) NOT NULL,
  `test_name` varchar(50) NOT NULL,
  `appointment_ID` varchar(50) NOT NULL,
  `result` varchar(50) NOT NULL,
  PRIMARY KEY (`test_result_ID`),
  KEY `test_name` (`test_name`),
  KEY `appointment_ID` (`appointment_ID`),
  CONSTRAINT `blood_test_result_ibfk_1` FOREIGN KEY (`test_name`) REFERENCES `blood_test` (`test_name`),
  CONSTRAINT `blood_test_result_ibfk_2` FOREIGN KEY (`appointment_ID`) REFERENCES `appointment` (`appointment_ID`),
  CONSTRAINT `blood_test_result_chk_1` CHECK ((`result` in (_utf8mb4'Normal',_utf8mb4'Abnormal')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blood_test_result`
--

LOCK TABLES `blood_test_result` WRITE;
/*!40000 ALTER TABLE `blood_test_result` DISABLE KEYS */;
INSERT INTO `blood_test_result` VALUES ('BTR1','Culture','A1','Normal'),('BTR10','Glucose','A8','Abnormal'),('BTR11','VitD','A8','Normal'),('BTR12','CBC','A9','Normal'),('BTR13','T4','A10','Abnormal'),('BTR14','BMP','A10','Normal'),('BTR15','CBC','A11','Abnormal'),('BTR2','VitD','A2','Normal'),('BTR3','Ferritin','A2','Abnormal'),('BTR4','BMP','A3','Abnormal'),('BTR5','CRP','A5','Normal'),('BTR6','Glucose','A5','Normal'),('BTR7','Ferritin','A5','Abnormal'),('BTR8','VitD','A6','Abnormal'),('BTR9','CBC','A7','Abnormal');
/*!40000 ALTER TABLE `blood_test_result` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `format_btr_before_insert` BEFORE INSERT ON `blood_test_result` FOR EACH ROW BEGIN
	SET NEW.test_result_ID = CONCAT(UPPER(SUBSTRING(NEW.test_result_ID,1,3)),
							 SUBSTRING(NEW.test_result_ID FROM 4));
	SET NEW.appointment_ID = CONCAT(UPPER(SUBSTRING(NEW.appointment_ID,1,1)),
							 SUBSTRING(NEW.appointment_ID FROM 2));
	SET NEW.result = CONCAT(UPPER(SUBSTRING(NEW.result,1,1)),
					 LOWER(SUBSTRING(NEW.result FROM 2)));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `nurse`
--

DROP TABLE IF EXISTS `nurse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nurse` (
  `nurse_ID` varchar(50) NOT NULL,
  `nurse_first_name` varchar(50) NOT NULL,
  `nurse_surname` varchar(50) NOT NULL,
  `extension_number` varchar(4) NOT NULL,
  PRIMARY KEY (`nurse_ID`),
  CONSTRAINT `nurse_chk_1` CHECK ((length(`extension_number`) = 4))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nurse`
--

LOCK TABLES `nurse` WRITE;
/*!40000 ALTER TABLE `nurse` DISABLE KEYS */;
INSERT INTO `nurse` VALUES ('N1','Jessica','White','2847'),('N2','David','Johnson','3994'),('N3','Mark','Davis','5267'),('N4','Anika','Patel','8901'),('N5','Laura','Wilson','4579');
/*!40000 ALTER TABLE `nurse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient` (
  `patient_ID` varchar(50) NOT NULL,
  `patient_first_name` varchar(50) NOT NULL,
  `patient_surname` varchar(50) NOT NULL,
  `date_of_birth` date NOT NULL,
  `gender` varchar(50) NOT NULL,
  `phone_number` varchar(11) NOT NULL,
  PRIMARY KEY (`patient_ID`),
  CONSTRAINT `patient_chk_1` CHECK ((length(`phone_number`) = 11))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES ('P1','Olivia','Garcia','1990-04-05','Female','07883701567'),('P10','Yuki','Nakamura','1991-05-24','Female','07968535958'),('P11','Joshua','Adams','1974-04-16','Male','07856789778'),('P12','Maria','Rodriguez','1942-01-26','Female','07856789778'),('P13','Elijah','Williams','1980-12-25','Male','07858774435'),('P14','Leila','Gonzalez','1996-11-29','Female','07893553296'),('P15','Fatima','Ali','1989-07-08','Female','07897536321'),('P16','Katarzyna','Nowak','1973-10-22','Female','07856789778'),('P17','James','Baker','1978-09-29','Male','07849864942'),('P18','Sarah','Jones','1992-08-15','Female','07523462527'),('P19','Ahmed','Hussein','1963-03-28','Male','07492167425'),('P2','Aisha','Williams ','1988-11-02','Female','07756789212'),('P20','Alex','Wong','1988-03-15','Male','07860352685'),('P3','Michael','Brown','1975-03-20','Male','07828971834'),('P4','Daniel','Evans','1982-02-14','Male','07439356673'),('P5','Ava','Martinez','1993-12-12','Female','07859013745'),('P6','Malik','Khan','1981-06-05','Male','07856789778'),('P7','Matthew','Cooper','1946-11-25','Male','07856789778'),('P8','Sophie','Lewis','1961-02-21','Female','07856789778'),('P9','Isabella','Russo','1994-09-15','Female','07887460312');
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `result_appointment_nurse`
--

DROP TABLE IF EXISTS `result_appointment_nurse`;
/*!50001 DROP VIEW IF EXISTS `result_appointment_nurse`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `result_appointment_nurse` AS SELECT 
 1 AS `test_result_ID`,
 1 AS `test_name`,
 1 AS `result`,
 1 AS `appointment_ID`,
 1 AS `appointment_date`,
 1 AS `appointment_time`,
 1 AS `nurse_ID`,
 1 AS `nurse_first_name`,
 1 AS `nurse_surname`,
 1 AS `extension_number`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `result_test_appointment_patient`
--

DROP TABLE IF EXISTS `result_test_appointment_patient`;
/*!50001 DROP VIEW IF EXISTS `result_test_appointment_patient`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `result_test_appointment_patient` AS SELECT 
 1 AS `test_result_ID`,
 1 AS `test_name`,
 1 AS `result`,
 1 AS `test_description`,
 1 AS `appointment_ID`,
 1 AS `appointment_date`,
 1 AS `appointment_time`,
 1 AS `patient_ID`,
 1 AS `patient_first_name`,
 1 AS `patient_surname`,
 1 AS `date_of_birth`,
 1 AS `gender`,
 1 AS `phone_number`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'blood_test_management'
--

--
-- Dumping routines for database 'blood_test_management'
--
/*!50003 DROP FUNCTION IF EXISTS `age_calculator` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `age_calculator`(date_of_birth DATE) RETURNS int
    DETERMINISTIC
BEGIN
	DECLARE age INT;
	SET age = FLOOR((DATEDIFF(CURDATE(), date_of_birth))/365.25);
	RETURN age;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_appointment_status` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_appointment_status`()
BEGIN
	UPDATE appointment
	SET appointment_status = CASE
		WHEN appointment_date < CURDATE() AND appointment_time < CURTIME() AND appointment_status = "Scheduled" THEN "Completed"
        ELSE appointment_status
	END;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `result_appointment_nurse`
--

/*!50001 DROP VIEW IF EXISTS `result_appointment_nurse`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `result_appointment_nurse` AS select `btr`.`test_result_ID` AS `test_result_ID`,`btr`.`test_name` AS `test_name`,`btr`.`result` AS `result`,`a`.`appointment_ID` AS `appointment_ID`,`a`.`appointment_date` AS `appointment_date`,`a`.`appointment_time` AS `appointment_time`,`n`.`nurse_ID` AS `nurse_ID`,`n`.`nurse_first_name` AS `nurse_first_name`,`n`.`nurse_surname` AS `nurse_surname`,`n`.`extension_number` AS `extension_number` from ((`blood_test_result` `btr` left join `appointment` `a` on((`btr`.`appointment_ID` = `a`.`appointment_ID`))) left join `nurse` `n` on((`a`.`nurse_ID` = `n`.`nurse_ID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `result_test_appointment_patient`
--

/*!50001 DROP VIEW IF EXISTS `result_test_appointment_patient`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `result_test_appointment_patient` AS select `btr`.`test_result_ID` AS `test_result_ID`,`btr`.`test_name` AS `test_name`,`btr`.`result` AS `result`,`bt`.`test_description` AS `test_description`,`a`.`appointment_ID` AS `appointment_ID`,`a`.`appointment_date` AS `appointment_date`,`a`.`appointment_time` AS `appointment_time`,`p`.`patient_ID` AS `patient_ID`,`p`.`patient_first_name` AS `patient_first_name`,`p`.`patient_surname` AS `patient_surname`,`p`.`date_of_birth` AS `date_of_birth`,`p`.`gender` AS `gender`,`p`.`phone_number` AS `phone_number` from (((`blood_test_result` `btr` left join `blood_test` `bt` on((`btr`.`test_name` = `bt`.`test_name`))) left join `appointment` `a` on((`btr`.`appointment_ID` = `a`.`appointment_ID`))) left join `patient` `p` on((`a`.`patient_ID` = `p`.`patient_ID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-21 21:32:11
