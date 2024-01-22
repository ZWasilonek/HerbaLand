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
-- Table structure for table `medicinal_plants`
--

DROP TABLE IF EXISTS `medicinal_plants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medicinal_plants` (
  `id` int NOT NULL AUTO_INCREMENT,
  `polish_plant_id` int NOT NULL,
  `latin_plant_id` int NOT NULL,
  `file_id` int NOT NULL,
  `data_source_links` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `bibliography` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `polish_plant_id` (`polish_plant_id`),
  KEY `latin_plant_id` (`latin_plant_id`),
  KEY `file_id` (`file_id`),
  CONSTRAINT `latin_plant_id` FOREIGN KEY (`latin_plant_id`) REFERENCES `latin_plant_description` (`id`),
  CONSTRAINT `medicinal_plants_ibfk_1` FOREIGN KEY (`file_id`) REFERENCES `files` (`id`),
  CONSTRAINT `polish_plant_id` FOREIGN KEY (`polish_plant_id`) REFERENCES `polish_plant_description` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicinal_plants`
--

LOCK TABLES `medicinal_plants` WRITE;
/*!40000 ALTER TABLE `medicinal_plants` DISABLE KEYS */;
INSERT INTO `medicinal_plants` VALUES (1,1,1,1,'https://www.aromatika.com.pl/pl/p/LUKRECJA-korzen-lukrecji-ciety/345\r\n\r\nhttp://www.farmakognozjaonline.pl/baz_suro/baza.php?jezyk=&klasa=radix&id=61\r\n\r\nhttps://www.plantago-sklep.pl/lukrecja-korzen-ciety.html',''),(2,2,2,2,'http://www.farmakognozjaonline.pl/baz_suro/baza.php?jezyk=&klasa=cortex&id=62\r\n\r\nhttps://www.aromatika.com.pl/pl/p/DAB-KORA/150\r\n\r\nhttps://www.plantago-sklep.pl/kora-debu.html\r\n\r\n',''),(3,3,3,3,'http://www.farmakognozjaonline.pl/baz_suro/baza.php?jezyk=&klasa=radix&id=63\r\n\r\nhttps://www.aromatika.com.pl/pl/p/PRAWOSLAZ-LISC/834\r\n\r\nhttps://www.plantago-sklep.pl/korzen-prawoslazu-.html',''),(4,4,4,4,'http://www.farmakognozjaonline.pl/baz_suro/baza.php?jezyk=&klasa=semen&id=56\r\n\r\nhttps://www.aromatika.com.pl/pl/p/KOZIERADKA-ZIARNO/283\r\n\r\nhttps://www.plantago-sklep.pl/kozieradka-ziarno.html',''),(5,5,5,5,'http://www.farmakognozjaonline.pl/baz_suro/baza.php?jezyk=&klasa=semen&id=57\r\n\r\nhttps://www.aromatika.com.pl/pl/p/SIEMIE-LNIANE-BRAZOWE-ZIARNO/341',''),(6,6,6,6,'https://www.aromatika.com.pl/pl/p/SZALWIA-LEKARSKA-LISC/410\r\n\r\nhttp://www.farmakognozjaonline.pl/baz_suro/baza.php?jezyk=&klasa=folium&id=15\r\n\r\nhttps://www.plantago-sklep.pl/szalwia-lekarska.html',''),(7,7,7,7,'https://www.aromatika.com.pl/pl/p/MELISA-LISC/352\r\n\r\nhttp://www.farmakognozjaonline.pl/baz_suro/baza.php?jezyk=&klasa=folium&id=11\r\n\r\nhttps://www.plantago-sklep.pl/melisa-ziele.html',''),(8,8,8,8,'https://www.aromatika.com.pl/pl/p/KRWAWNIK-ZIELE/336\r\n\r\nhttp://www.farmakognozjaonline.pl/baz_suro/baza.php?jezyk=&klasa=herba&id=39\r\n\r\nhttps://www.plantago-sklep.pl/kwiat-krwawnika.html',''),(9,9,9,9,'http://www.farmakognozjaonline.pl/baz_suro/baza.php?jezyk=&klasa=flos&id=26\r\n\r\nhttps://www.aromatika.com.pl/pl/p/Bez-czarny-kwiat-czarnego-bzu/118\r\n\r\nhttps://www.plantago-sklep.pl/czarny-bez.html',''),(10,10,10,10,'https://www.aromatika.com.pl/pl/p/MECZENNICA-ZIELE/353\r\n\r\nhttp://www.farmakognozjaonline.pl/alkaloid/index.php?alka=harm\r\n\r\nhttps://www.plantago-sklep.pl/passiflora-ziele.html','');
/*!40000 ALTER TABLE `medicinal_plants` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-20 13:00:02
