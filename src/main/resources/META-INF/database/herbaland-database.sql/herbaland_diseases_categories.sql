-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: herbaland
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
-- Table structure for table `diseases_categories`
--

DROP TABLE IF EXISTS `diseases_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diseases_categories` (
  `category_id` int NOT NULL,
  `disease_id` int NOT NULL,
  KEY `category_id` (`category_id`),
  KEY `disease_id` (`disease_id`),
  CONSTRAINT `diseases_categories_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `diseases_categories_ibfk_2` FOREIGN KEY (`disease_id`) REFERENCES `diseases` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diseases_categories`
--

LOCK TABLES `diseases_categories` WRITE;
/*!40000 ALTER TABLE `diseases_categories` DISABLE KEYS */;
INSERT INTO `diseases_categories` VALUES (3,1),(3,3),(3,30),(3,34),(3,39),(3,41),(3,43),(3,46),(3,52),(1,52),(3,10),(3,11),(2,54),(3,55),(3,56),(3,22),(3,31),(2,57),(3,29),(3,14),(3,26),(3,5),(3,58),(1,59),(3,27),(3,17),(3,60),(1,5),(3,62),(1,16),(3,33),(1,60),(1,63),(1,49),(2,64),(3,64),(2,39),(3,65),(2,55),(3,67),(3,66),(3,59),(2,60),(2,71),(2,70),(2,69),(2,68),(3,71),(3,77),(2,77),(3,78),(3,79),(3,81),(3,80),(3,82),(3,83),(3,84),(3,85),(2,81),(3,86),(3,87),(3,88),(3,89),(3,93),(3,94),(3,92),(3,91),(3,90),(3,95),(2,56),(2,34),(3,96);
/*!40000 ALTER TABLE `diseases_categories` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-03 13:58:39
