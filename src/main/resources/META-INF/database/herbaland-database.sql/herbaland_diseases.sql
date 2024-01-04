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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diseases`
--

LOCK TABLES `diseases` WRITE;
/*!40000 ALTER TABLE `diseases` DISABLE KEYS */;
INSERT INTO `diseases` VALUES (1,'Alergia'),(2,'Astma'),(3,'Biegunka'),(4,'Hipertensja / Hipertonia / Nadciśnienie'),(5,'Cukrzyca'),(7,'Hashimoto'),(10,'Kaszel mokry'),(11,'Kaszel suchy'),(12,'Menopauza'),(13,'Miażdżyca'),(14,'Nieżyt żołądka'),(15,'Nudności'),(16,'Otyłość'),(17,'Grypa / Przeziębienie'),(18,'Refluks'),(19,'Trądzik'),(20,'Wrzody żołądka'),(21,'Wysypka'),(22,'Infekcja bakteryjna / Zakażenie bakteryjne'),(23,'Zaparcie'),(24,'Zgaga'),(26,'Chrypa'),(27,'Zaburzenia trawienia'),(28,'Osteoporoza'),(29,'Ból'),(30,'Krwawienie'),(31,'Infekcja wirusowa / Zakażenie wirusowe'),(33,'Infekcja grzybicza / Zakażenie grzybicze'),(34,'Stan zapalny'),(35,'Ślinotok'),(36,'Odbijanie (pustym, gorzkim lub kwaśnym)'),(37,'Uczucie pieczenia w mostku'),(38,'Zarzucanie treści pokarmowej do przełyku'),(39,'Hiperhydroza / Nadmierna potliwość / Nadpotliwość'),(41,'Obstrukcja / Zaparcie / Zatwardzenie'),(43,'Napięcie mięśni gładkich'),(46,'Choroba wrzodowa / Owrzodzenie'),(49,'Hepatoprotekcyjna'),(52,'Hipercholesterolemia'),(53,'Cholesterolowa'),(54,'Wypadanie włosów'),(55,'Egzema'),(56,'Czyrak'),(57,'Łysienie'),(58,'Zaburzenia łaknienia'),(59,'Stan osłabienia'),(60,'Regeneracja komórek'),(62,'Hipotensja / Hipotonia / Niedociśnienie'),(63,'Hipokaliemia (Niedobór potasu)'),(64,'Łojotok / Nadmierne wydzielanie łoju'),(65,'Zaburzenia perystaltyki jelit'),(66,'Oparzenie'),(67,'Odparzenie'),(68,'Zmarszczki'),(69,'Trądzik'),(70,'Przebarwienia'),(71,'AZS / Atopowe zapalenie skóry'),(77,'Łuszczyca'),(78,'Angina'),(79,'Krwiak / Siniak'),(80,'Stłuczenie'),(81,'Obrzęk / Opuchlizna'),(82,'Hipertonia / Nadciśnienie'),(83,'Kamica moczowa / nerkowa'),(84,'Zakrzepica / Żylaki'),(85,'Przerost prostaty'),(86,'Gorączka'),(87,'Katar'),(88,'Świąd'),(89,'Depresja'),(90,'Stany lękowe'),(91,'Nikotynizm / Uzależnienie od nikotyny'),(92,'Narkomania / Uzależnienie od narkotyków'),(93,'Alkoholizm / Uzależnienie od alkoholu'),(94,'Lekomania / Uzależnienie od leków'),(95,'Bezsenność'),(96,'Stan pobudzenia');
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

-- Dump completed on 2024-01-03 13:58:39
