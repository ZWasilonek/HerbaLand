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
-- Table structure for table `diseases`
--

DROP TABLE IF EXISTS `diseases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diseases` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diseases`
--

LOCK TABLES `diseases` WRITE;
/*!40000 ALTER TABLE `diseases` DISABLE KEYS */;
INSERT INTO `diseases` VALUES (1,'Alergia'),(93,'Alkoholizm / Uzależnienie od alkoholu'),(78,'Angina'),(2,'Astma'),(71,'AZS / Atopowe zapalenie skóry'),(95,'Bezsenność'),(3,'Biegunka'),(29,'Ból'),(53,'Cholesterolowa'),(46,'Choroba wrzodowa / Owrzodzenie'),(26,'Chrypa'),(5,'Cukrzyca'),(56,'Czyrak'),(89,'Depresja'),(55,'Egzema'),(86,'Gorączka'),(17,'Grypa / Przeziębienie'),(7,'Hashimoto'),(49,'Hepatoprotekcyjna'),(52,'Hipercholesterolemia'),(39,'Hiperhydroza / Nadmierna potliwość / Nadpotliwość'),(4,'Hipertensja / Hipertonia / Nadciśnienie'),(82,'Hipertonia / Nadciśnienie'),(63,'Hipokaliemia (Niedobór potasu)'),(62,'Hipotensja / Hipotonia / Niedociśnienie'),(22,'Infekcja bakteryjna / Zakażenie bakteryjne'),(33,'Infekcja grzybicza / Zakażenie grzybicze'),(31,'Infekcja wirusowa / Zakażenie wirusowe'),(83,'Kamica moczowa / nerkowa'),(10,'Kaszel mokry'),(11,'Kaszel suchy'),(87,'Katar'),(30,'Krwawienie'),(79,'Krwiak / Siniak'),(94,'Lekomania / Uzależnienie od leków'),(12,'Menopauza'),(13,'Miażdżyca'),(43,'Napięcie mięśni gładkich'),(92,'Narkomania / Uzależnienie od narkotyków'),(14,'Nieżyt żołądka'),(91,'Nikotynizm / Uzależnienie od nikotyny'),(15,'Nudności'),(81,'Obrzęk / Opuchlizna'),(41,'Obstrukcja / Zaparcie / Zatwardzenie'),(36,'Odbijanie (pustym, gorzkim lub kwaśnym)'),(67,'Odparzenie'),(66,'Oparzenie'),(28,'Osteoporoza'),(16,'Otyłość'),(70,'Przebarwienia'),(85,'Przerost prostaty'),(18,'Refluks'),(60,'Regeneracja komórek'),(35,'Ślinotok'),(59,'Stan osłabienia'),(96,'Stan pobudzenia'),(34,'Stan zapalny'),(90,'Stany lękowe'),(80,'Stłuczenie'),(88,'Świąd'),(69,'Trądzik'),(37,'Uczucie pieczenia w mostku'),(20,'Wrzody żołądka'),(54,'Wypadanie włosów'),(21,'Wysypka'),(65,'Zaburzenia perystaltyki jelit'),(27,'Zaburzenia trawienia'),(58,'Zaburzenia łaknienia'),(84,'Zakrzepica / Żylaki'),(23,'Zaparcie'),(38,'Zarzucanie treści pokarmowej do przełyku'),(24,'Zgaga'),(68,'Zmarszczki'),(64,'Łojotok / Nadmierne wydzielanie łoju'),(77,'Łuszczyca'),(57,'Łysienie');
/*!40000 ALTER TABLE `diseases` ENABLE KEYS */;
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
