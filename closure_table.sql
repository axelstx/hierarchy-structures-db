-- MySQL dump 10.13  Distrib 5.7.20, for Linux (x86_64)
--
-- Host: localhost    Database: closure2
-- ------------------------------------------------------
-- Server version	8.0.19

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `closure`
--

DROP TABLE IF EXISTS `closure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `closure` (
  `id` int NOT NULL AUTO_INCREMENT,
  `parent_id` int DEFAULT NULL,
  `child_id` int DEFAULT NULL,
  `level` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_closure_1_idx` (`parent_id`),
  KEY `fk_closure_2_idx` (`child_id`),
  CONSTRAINT `fk_closure_1` FOREIGN KEY (`parent_id`) REFERENCES `structure` (`id`),
  CONSTRAINT `fk_closure_2` FOREIGN KEY (`child_id`) REFERENCES `structure` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `closure`
--

LOCK TABLES `closure` WRITE;
/*!40000 ALTER TABLE `closure` DISABLE KEYS */;
INSERT INTO `closure` VALUES (1,1,1,1),(2,2,1,2),(3,2,2,2),(4,3,1,2),(5,3,3,2),(6,4,1,3),(7,4,3,3),(8,4,4,3),(9,5,1,4),(10,5,3,4),(11,5,4,4),(12,5,5,4),(13,6,1,4),(14,6,3,4),(15,6,4,4),(16,6,6,4),(17,7,1,3),(18,7,3,3),(19,7,7,3),(20,8,1,4),(21,8,3,4),(22,8,7,4),(23,8,8,4),(24,9,1,4),(25,9,3,4),(26,9,7,4),(27,9,9,4),(28,10,1,3),(29,10,3,3),(30,10,10,3),(31,11,1,4),(32,11,3,4),(33,11,10,4),(34,11,11,4),(35,12,1,4),(36,12,3,4),(37,12,10,4),(38,12,12,4),(39,13,1,2),(40,13,13,2),(41,14,1,3),(42,14,13,3),(43,14,14,3),(44,15,1,3),(45,15,3,3),(46,15,15,3);
/*!40000 ALTER TABLE `closure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `position_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_employee_1_idx` (`position_id`),
  CONSTRAINT `fk_employee_1` FOREIGN KEY (`position_id`) REFERENCES `position` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'Jack Daniels',1),(2,'John Smith',1),(3,'Michael Frost',1),(4,'Set Rogan',2),(5,'Adam Sendler',2),(6,'Joe Birmingham',2),(7,'Nick Fury',3),(8,'Emma Watson',3),(9,'Jessica Jones',3),(10,'Lisa Simpson',4),(11,'Frodo Beggins',4),(12,'Mark Dakascas',4),(13,'Jill Valentine',5),(14,'Lily Brin',6),(15,'Ozzy Osbourne',6),(16,'Neo Matrix',7),(17,'George Ford',7),(18,'Bill Clinton',7),(19,'Vladimir Putin',7),(20,'Kornelius A',7),(21,'Johnny Depp',8),(22,'Alex Turner',8),(23,'Billy Milligan',8);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `position`
--

DROP TABLE IF EXISTS `position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `position` (
  `id` int NOT NULL AUTO_INCREMENT,
  `position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `position`
--

LOCK TABLES `position` WRITE;
/*!40000 ALTER TABLE `position` DISABLE KEYS */;
INSERT INTO `position` VALUES (1,'Junior-developer'),(2,'Middle-developer'),(3,'Senior-developer'),(4,'Tester'),(5,'Marketing Specialist'),(6,'System Integr'),(7,'Supervisor'),(8,'Director');
/*!40000 ALTER TABLE `position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `structure`
--

DROP TABLE IF EXISTS `structure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `structure` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `structure`
--

LOCK TABLES `structure` WRITE;
/*!40000 ALTER TABLE `structure` DISABLE KEYS */;
INSERT INTO `structure` VALUES (1,'КОМПАНИЯ'),(2,'Департамент продаж'),(3,'Департамент реализации проектов'),(4,'Команда \"ONE\"'),(5,'Гуппа разработки \"ONE\"'),(6,'Группа тестирования \"ONE\"'),(7,'Команда \"TWO\"'),(8,'Гуппа разработки \"TWO\"'),(9,'Группа тестирования \"TWO\"'),(10,'Команда \"THREE\"'),(11,'Гуппа разработки \"THREE\"'),(12,'Группа тестирования \"THREE\"'),(13,'Департамент системной интеграции'),(14,'Команда Мониторинга'),(15,'Команда Эксплуатации');
/*!40000 ALTER TABLE `structure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `structure_employee`
--

DROP TABLE IF EXISTS `structure_employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `structure_employee` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structure_id` int DEFAULT NULL,
  `employee_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_structure_employee_1_idx` (`structure_id`),
  KEY `fk_structure_employee_2_idx` (`employee_id`),
  CONSTRAINT `fk_structure_employee_1` FOREIGN KEY (`structure_id`) REFERENCES `structure` (`id`),
  CONSTRAINT `fk_structure_employee_2` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `structure_employee`
--

LOCK TABLES `structure_employee` WRITE;
/*!40000 ALTER TABLE `structure_employee` DISABLE KEYS */;
INSERT INTO `structure_employee` VALUES (1,2,13),(2,2,21),(3,3,22),(4,4,16),(5,5,1),(6,5,4),(7,5,7),(8,6,10),(9,7,17),(10,8,2),(11,8,5),(12,8,8),(13,9,11),(14,10,18),(15,11,3),(16,11,6),(17,11,9),(18,12,12),(19,13,23),(20,14,14),(21,14,19),(22,15,15),(23,15,20);
/*!40000 ALTER TABLE `structure_employee` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-02-13 13:10:43
