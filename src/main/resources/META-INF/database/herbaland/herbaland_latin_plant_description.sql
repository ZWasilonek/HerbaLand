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
-- Table structure for table `latin_plant_description`
--

DROP TABLE IF EXISTS `latin_plant_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `latin_plant_description` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `family` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `species` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `raw_material` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `properties` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `synonyms` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `latin_plant_description`
--

LOCK TABLES `latin_plant_description` WRITE;
/*!40000 ALTER TABLE `latin_plant_description` DISABLE KEYS */;
INSERT INTO `latin_plant_description` VALUES (1,'Glycyrrhizae radix','Fabaceae (Papilionaceae)','Glycyrrhizae','Glycyrrhiza glabra L., Glycyrrhiza uralensis Fisch., Glycyrrhiza inflata Bat.','Radix','Expectorans, antiulcerosum, antiphlogisticum.','Liquiritiae'),(2,'Quercus cortex','Fagaceae','Quercus','Quercus robur L. (Q. pedunculata Ehrh.), Quercus petraea (Matt.)Liebl. (Q. sessilis Salisb.), Quercus pubescens Willd.','Cortex','Antidiarrhoicum, antisepticum, anthiphlogisticum, hemostaticum',''),(3,'Althaeae radix','Malvaceae','Althaea','Althaea officinalis','Radix','Antibechicum, protectivum, emoliens.','Althaea taurinensis DC.'),(4,'Trigonellae semen','Fabaceae (Papilionaceae)','Trigonella','Trigonella foenum graecum L.','Semen','Antiulcerosum, antiphlogisticum, metabolicum, dermaticum.',''),(5,'Lini semen','Linaceae','Linum','Linum usitatissimum L.','Semen','Antiulcerosum, laxans, dermaticum.',''),(6,'Salviae folium','Lamiaceae (Labiatae)','Salvia','Salvia officinalis L.','Folium','Antihydroticum, antiphlogisticum, stomachicum, antisepticum, antidiabeticum.',''),(7,'Melissae folium','Lamiaceae (Labiatae)','Melissa','Melissa officinalis L.','Folium','Sedativum, antispasmoticum.',''),(8,'Millefolii herba','Asteraceae (Compositae)','Achillea','Achillea millefolium L.','Herba','Stomachicum, spasmolyticum, antiphlogisticum, haemostaticum.',''),(9,'Sambuci flos','Adoxaceae','Sambucus','Sambucus nigra L.','Flos','Antipyreticum, diureticum, vasotonicum.',''),(10,'Herba Passiflorae','Passifloracae','Passiflora','Passiflora incarnata','Herba','Sedativum, spasmoliticum.','');
/*!40000 ALTER TABLE `latin_plant_description` ENABLE KEYS */;
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
