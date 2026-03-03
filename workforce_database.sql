-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: business_db
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departments` (
  `department_id` int NOT NULL AUTO_INCREMENT,
  `department_name` varchar(50) NOT NULL,
  `department_description` varchar(100) NOT NULL,
  `location` varchar(50) NOT NULL DEFAULT 'head office',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `department_status` enum('Active','Inactive') DEFAULT (_utf8mb4'Active'),
  PRIMARY KEY (`department_id`),
  UNIQUE KEY `department_name` (`department_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (1,'Operations','Handles day to day work','head office','2026-03-02 04:18:48','Active'),(2,'Technical','Handles technical part','head office','2026-03-02 04:18:48','Active'),(3,'Sales','Handles Sales','head office','2026-03-02 04:18:48','Active'),(4,'Analyst','Handles Reports ','head office','2026-03-02 04:18:48','Active');
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `employee_id` int NOT NULL AUTO_INCREMENT,
  `employee_name` varchar(50) NOT NULL,
  `department_id` int NOT NULL,
  `email` varchar(50) NOT NULL,
  `job_title` varchar(100) NOT NULL,
  `base_salary` decimal(10,2) NOT NULL,
  `hiring_date` date DEFAULT NULL,
  PRIMARY KEY (`employee_id`),
  UNIQUE KEY `email` (`email`),
  KEY `fk_users_department` (`department_id`),
  CONSTRAINT `fk_users_department` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'Priyanka',1,'priyanka@gmail.com','Admin',10000.00,'2021-07-17'),(2,'Rudra',2,'rudra@gmail.com','Employee',20000.00,'2022-11-04'),(3,'Simran',3,'sim@gm','Admin',5000.00,'2023-06-01'),(4,'samarth',1,'sam@gm','Employee',5000.00,'2022-05-22'),(5,'Riya Sharma',1,'riya.sharma@company.com','HR Executive',35000.00,'2023-05-12'),(6,'Aman Verma',2,'aman.verma@company.com','Data Analyst',60000.00,'2022-08-20'),(7,'Sneha Patel',3,'sneha.patel@company.com','Finance Executive',50000.00,'2021-11-01'),(8,'Karan Mehta',2,'karan.mehta@company.com','Senior Data Analyst',80000.00,'2020-03-15'),(9,'Neha Gupta',4,'neha.gupta@company.com','Marketing Manager',75000.00,'2022-01-10'),(10,'Arjun Singh',1,'arjun.singh@company.com','HR Manager',90000.00,'2019-07-25');
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salary_transactions`
--

DROP TABLE IF EXISTS `salary_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salary_transactions` (
  `transaction_id` int NOT NULL AUTO_INCREMENT,
  `employee_id` int NOT NULL,
  `payment_month` date NOT NULL,
  `basic_pay` decimal(10,2) NOT NULL,
  `bonus` decimal(10,2) DEFAULT '0.00',
  `deduction` decimal(10,2) DEFAULT '0.00',
  PRIMARY KEY (`transaction_id`),
  UNIQUE KEY `unique_employee_month` (`employee_id`,`payment_month`),
  CONSTRAINT `fk_salary_employee` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `salary_transactions_chk_1` CHECK ((`basic_pay` > 0)),
  CONSTRAINT `salary_transactions_chk_2` CHECK ((`bonus` > 0)),
  CONSTRAINT `salary_transactions_chk_3` CHECK ((`deduction` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salary_transactions`
--

LOCK TABLES `salary_transactions` WRITE;
/*!40000 ALTER TABLE `salary_transactions` DISABLE KEYS */;
INSERT INTO `salary_transactions` VALUES (1,10,'2026-03-01',90000.00,656.98,773.79),(2,9,'2026-03-01',75000.00,2701.46,1081.54),(3,8,'2026-03-01',80000.00,414.86,1585.10),(4,7,'2026-03-01',50000.00,3569.22,383.13),(5,6,'2026-03-01',60000.00,4081.50,1013.61),(6,5,'2026-03-01',35000.00,425.59,1810.35),(7,4,'2026-03-01',5000.00,1352.58,1274.11),(8,3,'2026-03-01',5000.00,1868.68,1915.02),(9,2,'2026-03-01',20000.00,3331.72,918.39),(10,1,'2026-03-01',10000.00,1484.66,214.16),(11,10,'2026-02-01',90000.00,3223.05,1803.61),(12,9,'2026-02-01',75000.00,2875.95,341.08),(13,8,'2026-02-01',80000.00,635.66,248.08),(14,7,'2026-02-01',50000.00,1194.00,1643.76),(15,6,'2026-02-01',60000.00,1964.96,998.66),(16,5,'2026-02-01',35000.00,1588.35,180.73),(17,4,'2026-02-01',5000.00,2494.07,445.94),(18,3,'2026-02-01',5000.00,3092.09,846.35),(19,2,'2026-02-01',20000.00,1303.08,67.12),(20,1,'2026-02-01',10000.00,1929.73,1658.11),(21,10,'2026-01-01',90000.00,4937.22,900.10),(22,9,'2026-01-01',75000.00,1439.54,178.79),(23,8,'2026-01-01',80000.00,2916.31,1296.23),(24,7,'2026-01-01',50000.00,2453.97,1019.25),(25,6,'2026-01-01',60000.00,378.66,1699.59),(26,5,'2026-01-01',35000.00,108.90,1119.02),(27,4,'2026-01-01',5000.00,3661.06,1965.07),(28,3,'2026-01-01',5000.00,3580.16,1265.11),(29,2,'2026-01-01',20000.00,73.40,351.48),(30,1,'2026-01-01',10000.00,4173.25,1292.07),(31,10,'2025-12-01',90000.00,3631.11,1386.02),(32,9,'2025-12-01',75000.00,1431.89,705.73),(33,8,'2025-12-01',80000.00,4525.99,934.77),(34,7,'2025-12-01',50000.00,3106.69,1409.06),(35,6,'2025-12-01',60000.00,3293.16,359.16),(36,5,'2025-12-01',35000.00,4609.95,142.43),(37,4,'2025-12-01',5000.00,2950.53,1473.77),(38,3,'2025-12-01',5000.00,4570.49,719.68),(39,2,'2025-12-01',20000.00,284.51,409.98),(40,1,'2025-12-01',10000.00,4271.22,1312.51),(41,10,'2025-11-01',90000.00,3592.66,1247.80),(42,9,'2025-11-01',75000.00,4819.57,1895.73),(43,8,'2025-11-01',80000.00,4237.96,788.72),(44,7,'2025-11-01',50000.00,2145.15,1924.13),(45,6,'2025-11-01',60000.00,2616.17,1459.96),(46,5,'2025-11-01',35000.00,400.94,422.01),(47,4,'2025-11-01',5000.00,4072.29,878.55),(48,3,'2025-11-01',5000.00,3764.98,894.31),(49,2,'2025-11-01',20000.00,4883.96,1084.99),(50,1,'2025-11-01',10000.00,3910.50,566.03),(51,10,'2025-10-01',90000.00,343.89,989.69),(52,9,'2025-10-01',75000.00,1339.43,1709.80),(53,8,'2025-10-01',80000.00,2354.21,1579.02),(54,7,'2025-10-01',50000.00,2675.10,613.14),(55,6,'2025-10-01',60000.00,4638.93,1438.44),(56,5,'2025-10-01',35000.00,4063.75,1812.16),(57,4,'2025-10-01',5000.00,460.83,1485.16),(58,3,'2025-10-01',5000.00,2181.98,1908.49),(59,2,'2025-10-01',20000.00,2310.14,894.82),(60,1,'2025-10-01',10000.00,4254.89,1825.30),(61,10,'2025-09-01',90000.00,51.61,627.31),(62,9,'2025-09-01',75000.00,2686.58,1491.22),(63,8,'2025-09-01',80000.00,580.50,687.34),(64,7,'2025-09-01',50000.00,1850.29,1638.55),(65,6,'2025-09-01',60000.00,4930.96,946.29),(66,5,'2025-09-01',35000.00,2035.72,1232.57),(67,4,'2025-09-01',5000.00,4299.97,902.23),(68,3,'2025-09-01',5000.00,3377.98,49.27),(69,2,'2025-09-01',20000.00,481.97,816.13),(70,1,'2025-09-01',10000.00,3755.65,1062.92),(71,10,'2025-08-01',90000.00,2019.61,850.44),(72,9,'2025-08-01',75000.00,4571.69,592.05),(73,8,'2025-08-01',80000.00,3685.61,1595.06),(74,7,'2025-08-01',50000.00,3881.46,977.74),(75,6,'2025-08-01',60000.00,577.31,221.40),(76,5,'2025-08-01',35000.00,1035.62,1407.03),(77,4,'2025-08-01',5000.00,4481.00,740.91),(78,3,'2025-08-01',5000.00,818.37,1414.02),(79,2,'2025-08-01',20000.00,220.16,198.24),(80,1,'2025-08-01',10000.00,1817.59,1040.44),(81,10,'2025-07-01',90000.00,2552.72,1984.12),(82,9,'2025-07-01',75000.00,2143.38,334.40),(83,8,'2025-07-01',80000.00,2749.84,496.48),(84,7,'2025-07-01',50000.00,2956.48,423.53),(85,6,'2025-07-01',60000.00,1424.66,1578.73),(86,5,'2025-07-01',35000.00,460.15,184.12),(87,4,'2025-07-01',5000.00,920.99,1289.63),(88,3,'2025-07-01',5000.00,3357.43,845.97),(89,2,'2025-07-01',20000.00,502.35,466.78),(90,1,'2025-07-01',10000.00,4327.68,1255.03),(91,10,'2025-06-01',90000.00,2704.81,1644.53),(92,9,'2025-06-01',75000.00,2442.26,1950.91),(93,8,'2025-06-01',80000.00,2059.57,266.42),(94,7,'2025-06-01',50000.00,2151.56,1503.85),(95,6,'2025-06-01',60000.00,2343.49,175.42),(96,5,'2025-06-01',35000.00,162.31,1798.35),(97,4,'2025-06-01',5000.00,1992.48,589.91),(98,3,'2025-06-01',5000.00,1396.37,1023.02),(99,2,'2025-06-01',20000.00,3598.64,128.22),(100,1,'2025-06-01',10000.00,806.79,1228.93),(101,10,'2025-05-01',90000.00,2941.30,195.81),(102,9,'2025-05-01',75000.00,3623.66,659.90),(103,8,'2025-05-01',80000.00,2377.81,775.92),(104,7,'2025-05-01',50000.00,2565.54,803.32),(105,6,'2025-05-01',60000.00,2344.91,279.86),(106,5,'2025-05-01',35000.00,1463.47,87.38),(107,4,'2025-05-01',5000.00,1701.80,1141.47),(108,3,'2025-05-01',5000.00,4162.99,901.56),(109,2,'2025-05-01',20000.00,3780.51,856.35),(110,1,'2025-05-01',10000.00,4362.83,156.61),(111,10,'2025-04-01',90000.00,3869.11,1268.40),(112,9,'2025-04-01',75000.00,4247.68,690.17),(113,8,'2025-04-01',80000.00,884.01,1697.52),(114,7,'2025-04-01',50000.00,3567.02,41.47),(115,6,'2025-04-01',60000.00,4817.35,1510.28),(116,5,'2025-04-01',35000.00,4426.50,322.14),(117,4,'2025-04-01',5000.00,747.31,528.18),(118,3,'2025-04-01',5000.00,4360.31,1136.09),(119,2,'2025-04-01',20000.00,1120.19,832.11),(120,1,'2025-04-01',10000.00,2040.81,1585.28);
/*!40000 ALTER TABLE `salary_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_department_monthly_payroll`
--

DROP TABLE IF EXISTS `vw_department_monthly_payroll`;
/*!50001 DROP VIEW IF EXISTS `vw_department_monthly_payroll`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_department_monthly_payroll` AS SELECT 
 1 AS `department_id`,
 1 AS `payment_month`,
 1 AS `department_monthly_payroll`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_employee_salary_rank`
--

DROP TABLE IF EXISTS `vw_employee_salary_rank`;
/*!50001 DROP VIEW IF EXISTS `vw_employee_salary_rank`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_employee_salary_rank` AS SELECT 
 1 AS `employee_id`,
 1 AS `total_salary`,
 1 AS `salary_rank`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_employee_total_salary`
--

DROP TABLE IF EXISTS `vw_employee_total_salary`;
/*!50001 DROP VIEW IF EXISTS `vw_employee_total_salary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_employee_total_salary` AS SELECT 
 1 AS `employee_id`,
 1 AS `total_salary`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_monthly_payroll`
--

DROP TABLE IF EXISTS `vw_monthly_payroll`;
/*!50001 DROP VIEW IF EXISTS `vw_monthly_payroll`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_monthly_payroll` AS SELECT 
 1 AS `payment_month`,
 1 AS `total_payroll`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_running_company_payroll`
--

DROP TABLE IF EXISTS `vw_running_company_payroll`;
/*!50001 DROP VIEW IF EXISTS `vw_running_company_payroll`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_running_company_payroll` AS SELECT 
 1 AS `payment_month`,
 1 AS `monthly_payroll`,
 1 AS `running_payroll`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vw_department_monthly_payroll`
--

/*!50001 DROP VIEW IF EXISTS `vw_department_monthly_payroll`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_department_monthly_payroll` AS select `e`.`department_id` AS `department_id`,`s`.`payment_month` AS `payment_month`,sum(((`s`.`basic_pay` + `s`.`bonus`) - `s`.`deduction`)) AS `department_monthly_payroll` from (`salary_transactions` `s` join `employees` `e` on((`s`.`employee_id` = `e`.`employee_id`))) group by `e`.`department_id`,`s`.`payment_month` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_employee_salary_rank`
--

/*!50001 DROP VIEW IF EXISTS `vw_employee_salary_rank`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_employee_salary_rank` AS select `vw_employee_total_salary`.`employee_id` AS `employee_id`,`vw_employee_total_salary`.`total_salary` AS `total_salary`,rank() OVER (ORDER BY `vw_employee_total_salary`.`total_salary` desc )  AS `salary_rank` from `vw_employee_total_salary` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_employee_total_salary`
--

/*!50001 DROP VIEW IF EXISTS `vw_employee_total_salary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_employee_total_salary` AS select `salary_transactions`.`employee_id` AS `employee_id`,sum(((`salary_transactions`.`basic_pay` + `salary_transactions`.`bonus`) - `salary_transactions`.`deduction`)) AS `total_salary` from `salary_transactions` group by `salary_transactions`.`employee_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_monthly_payroll`
--

/*!50001 DROP VIEW IF EXISTS `vw_monthly_payroll`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_monthly_payroll` AS select `salary_transactions`.`payment_month` AS `payment_month`,sum(((`salary_transactions`.`basic_pay` + `salary_transactions`.`bonus`) - `salary_transactions`.`deduction`)) AS `total_payroll` from `salary_transactions` group by `salary_transactions`.`payment_month` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_running_company_payroll`
--

/*!50001 DROP VIEW IF EXISTS `vw_running_company_payroll`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_running_company_payroll` AS select `salary_transactions`.`payment_month` AS `payment_month`,sum(((`salary_transactions`.`basic_pay` + `salary_transactions`.`bonus`) - `salary_transactions`.`deduction`)) AS `monthly_payroll`,sum(sum(((`salary_transactions`.`basic_pay` + `salary_transactions`.`bonus`) - `salary_transactions`.`deduction`))) OVER (ORDER BY `salary_transactions`.`payment_month` )  AS `running_payroll` from `salary_transactions` group by `salary_transactions`.`payment_month` */;
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

-- Dump completed on 2026-03-03 12:20:05
