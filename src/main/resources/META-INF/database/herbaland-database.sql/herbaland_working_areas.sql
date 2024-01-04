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
-- Table structure for table `working_areas`
--

DROP TABLE IF EXISTS `working_areas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `working_areas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `working_areas`
--

LOCK TABLES `working_areas` WRITE;
/*!40000 ALTER TABLE `working_areas` DISABLE KEYS */;
INSERT INTO `working_areas` VALUES (1,'Brzuch'),(2,'Drogi oddechowe'),(3,'Drogi żółciowe'),(4,'Gardło'),(5,'Gospodarka hormonalna'),(6,'Jelita'),(7,'Nerki'),(8,'Oskrzela'),(9,'Paznokcie'),(10,'Przewód pokarmowy'),(11,'Płuca'),(12,'Skóra'),(13,'Włosy'),(14,'Żołądek'),(15,'Stopy'),(16,'Gospodarka wapniowa'),(17,'Kolagen'),(18,'Układ odpornościowy'),(19,'Temperatura ciała'),(20,'Naczynia krwionośne'),(21,'Naczynia włosowate'),(22,'Jama ustna'),(23,'Pochwa'),(24,'Odbyt'),(25,'Ślinianki'),(26,'Gospodarka mineralna'),(27,'Dłonie'),(28,'Drogi moczowe'),(29,'Wirus HSV - Herpes simplex (z rodziny herpeswirusów / opryszczki)'),(30,'Wirus SARS (z rodziny koronawirusów / grypopodobne)'),(31,'Gospodarka cukrowa (węglowodanowa)'),(32,'Wątroba'),(33,'Krtań'),(34,'Przełyk'),(37,'Gospodarka lipidowa'),(38,'Błona śluzowa'),(39,'Kwas żołądkowy / solny'),(40,'Gospodarka białkowa'),(41,'Stężenie cholesterolu LDL'),(42,'Helicobacter pylori'),(43,'Ciśnienie'),(44,'Gruczoły łojowe'),(45,'Gruczoły potowe'),(46,'Okrężnica'),(47,'Wirus RSV (z rodziny Paramyxoviridae / oddechowy)'),(48,'Wirus HIV'),(49,'Bakteria Propionibacterium acnes'),(50,'Tkanka podskórna'),(71,'Bakteria Haemophilus influenzae'),(72,'Bakteria Streptococcus pneumoniae'),(73,'Bakteria Moraxella catarrhalis'),(74,'Bakteria Staphylococcus aureus'),(75,'Bakteria Streptococcus pyogenes'),(76,'Wirus paragrypy (z rodziny Paramyxoviridae)'),(77,'Adenowirusy'),(78,'Wirus EBV - Epstein-Barr (z rodziny herpeswirusów)'),(79,'Wirusy grypy'),(80,'Wirusy z rodziny Coxsackie'),(81,'Tkanka mięśniowa'),(82,'Stawy okołotkankowe'),(83,'Okostna'),(84,'Naczynia limfatyczne'),(85,'Naczynia żylne / Żyły'),(86,'Naczynia tętnicze / Tętnice'),(87,'Prostata'),(88,'Rogówka'),(89,'Siatkówka'),(90,'Powieki'),(91,'Zatoki'),(92,'Pęcherz moczowy'),(93,'Odbytnica'),(94,' Macica'),(95,'Gazy / Wiatry'),(96,'Ośrodkowy układ nerwowy');
/*!40000 ALTER TABLE `working_areas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-03 13:58:38
