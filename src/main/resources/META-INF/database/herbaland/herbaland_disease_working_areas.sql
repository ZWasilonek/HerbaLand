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
-- Table structure for table `disease_working_areas`
--

DROP TABLE IF EXISTS `disease_working_areas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `disease_working_areas` (
  `disease_id` int NOT NULL,
  `working_area_id` int NOT NULL,
  KEY `working_area_id` (`working_area_id`),
  KEY `disease_id` (`disease_id`),
  CONSTRAINT `disease_working_areas_ibfk_1` FOREIGN KEY (`working_area_id`) REFERENCES `working_areas` (`id`) ON DELETE CASCADE,
  CONSTRAINT `disease_working_areas_ibfk_2` FOREIGN KEY (`disease_id`) REFERENCES `diseases` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disease_working_areas`
--

LOCK TABLES `disease_working_areas` WRITE;
/*!40000 ALTER TABLE `disease_working_areas` DISABLE KEYS */;
INSERT INTO `disease_working_areas` VALUES (1,2),(1,4),(1,12),(1,18),(3,1),(3,16),(3,6),(3,10),(3,26),(30,22),(30,6),(30,20),(30,21),(30,24),(30,12),(30,14),(22,4),(22,22),(22,6),(22,23),(22,10),(22,12),(22,18),(34,12),(39,27),(39,12),(39,15),(41,6),(41,6),(43,28),(43,3),(43,6),(43,8),(43,14),(31,29),(31,30),(46,10),(46,14),(49,32),(46,38),(52,5),(52,37),(53,5),(53,37),(10,2),(10,4),(10,33),(10,8),(10,34),(10,11),(11,2),(11,4),(11,33),(11,34),(5,31),(54,12),(54,13),(55,12),(56,12),(22,28),(22,33),(22,14),(57,5),(57,13),(29,1),(14,10),(14,14),(26,2),(26,4),(26,33),(26,34),(58,39),(59,5),(59,37),(27,3),(27,6),(27,39),(27,10),(27,14),(59,18),(17,18),(57,12),(53,41),(52,41),(60,32),(46,42),(62,43),(62,20),(62,21),(16,31),(33,38),(33,28),(33,22),(33,9),(33,23),(33,12),(33,15),(33,18),(22,42),(60,38),(60,12),(64,44),(64,12),(39,45),(65,6),(65,46),(66,12),(67,12),(46,12),(22,24),(31,18),(31,48),(31,47),(60,20),(68,12),(69,49),(69,12),(69,50),(70,12),(71,18),(68,50),(77,12),(77,18),(22,71),(22,73),(22,49),(22,74),(22,72),(22,75),(31,77),(31,78),(31,76),(31,79),(31,80),(78,77),(78,71),(78,73),(78,74),(78,72),(78,75),(78,2),(78,4),(78,33),(78,78),(78,29),(78,76),(78,30),(78,79),(78,80),(79,20),(79,50),(80,20),(80,21),(80,83),(80,82),(80,81),(80,50),(82,43),(82,20),(83,28),(83,7),(82,86),(82,21),(84,20),(84,86),(85,28),(85,87),(71,12),(81,90),(86,19),(86,18),(86,45),(17,45),(87,2),(87,91),(82,28),(88,12),(43,94),(43,93),(43,92),(29,94),(27,95),(89,96),(90,96),(91,96),(92,96),(93,96),(94,96),(95,96),(82,96),(29,96),(43,20),(29,81),(96,96);
/*!40000 ALTER TABLE `disease_working_areas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-20 13:00:01
