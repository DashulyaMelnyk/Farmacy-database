-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: farmacy
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `LastName` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Ivan','Petrov','097-32-43-238'),(2,'Kate','Myasnikova','063-59-80-300'),(3,'Ruslan','Savin','073-76-90-875');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicine`
--

DROP TABLE IF EXISTS `medicine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medicine` (
  `ID_Med` int NOT NULL AUTO_INCREMENT,
  `NameMed` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Instruction` text,
  PRIMARY KEY (`ID_Med`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicine`
--

LOCK TABLES `medicine` WRITE;
/*!40000 ALTER TABLE `medicine` DISABLE KEYS */;
INSERT INTO `medicine` VALUES (1,'Aspirin','Таблетки белого цвета, круглые, слегка двояковыпуклые, скошенные к краю, с оттиском в виде фирменного знака'),(2,'Korvalol','Комбинированный препарат, действие которого обусловлено свойствами входящих в его состав веществ. Оказывает седативное и спазмолитическое действие. Облегчает наступление естественного сна.'),(3,'Drugs','Принимать не рекомендуем)))');
/*!40000 ALTER TABLE `medicine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pharmacist`
--

DROP TABLE IF EXISTS `pharmacist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pharmacist` (
  `ID_Pharm` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `LastName` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `FathersName` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Phone` varchar(20) DEFAULT NULL,
  `Adress` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`ID_Pharm`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pharmacist`
--

LOCK TABLES `pharmacist` WRITE;
/*!40000 ALTER TABLE `pharmacist` DISABLE KEYS */;
INSERT INTO `pharmacist` VALUES (1,'Daria','Melyk','Andreevna','067-723-32-05','Fontanska, 14'),(2,'Irina','Kompan','Igorevna','080-678-98-76','Poskot, 1');
/*!40000 ALTER TABLE `pharmacist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provider`
--

DROP TABLE IF EXISTS `provider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `provider` (
  `ID_Prov` int NOT NULL AUTO_INCREMENT,
  `NameProv` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Phone` varchar(20) DEFAULT NULL,
  `Email` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID_Prov`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provider`
--

LOCK TABLES `provider` WRITE;
/*!40000 ALTER TABLE `provider` DISABLE KEYS */;
INSERT INTO `provider` VALUES (1,'Darnitsa','042-33-15','darnitsa15@gmail.com'),(2,'Cure','080-90-87','cere87@gmail.com'),(3,'Lechim','090-99-66','lechim66@ukr.net');
/*!40000 ALTER TABLE `provider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reportcard`
--

DROP TABLE IF EXISTS `reportcard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reportcard` (
  `ID_Card` int NOT NULL AUTO_INCREMENT,
  `ID_Pharm` int NOT NULL,
  `DateWork` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Shift` int DEFAULT NULL,
  PRIMARY KEY (`ID_Card`),
  KEY `ID_Pharm` (`ID_Pharm`),
  CONSTRAINT `reportcard_ibfk_1` FOREIGN KEY (`ID_Pharm`) REFERENCES `pharmacist` (`ID_Pharm`),
  CONSTRAINT `reportcard_chk_1` CHECK (((`Shift` > 0) and (`Shift` < 5)))
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reportcard`
--

LOCK TABLES `reportcard` WRITE;
/*!40000 ALTER TABLE `reportcard` DISABLE KEYS */;
INSERT INTO `reportcard` VALUES (1,1,'2019-05-27 00:00:00',1),(2,1,'2021-04-18 00:00:00',3),(3,2,'2021-01-15 00:00:00',4),(4,1,'2021-03-08 00:00:00',1);
/*!40000 ALTER TABLE `reportcard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sklad`
--

DROP TABLE IF EXISTS `sklad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sklad` (
  `ID_Sklad` int NOT NULL AUTO_INCREMENT,
  `Adress` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`ID_Sklad`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sklad`
--

LOCK TABLES `sklad` WRITE;
/*!40000 ALTER TABLE `sklad` DISABLE KEYS */;
INSERT INTO `sklad` VALUES (1,'Shevchenko, 666');
/*!40000 ALTER TABLE `sklad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supmedicine`
--

DROP TABLE IF EXISTS `supmedicine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supmedicine` (
  `ID_SupMed` int NOT NULL AUTO_INCREMENT,
  `Amount` int NOT NULL,
  `PricePerOne` float DEFAULT NULL,
  `ID_Med` int NOT NULL,
  `ID_Supply` int NOT NULL,
  `OutOfDate` date NOT NULL,
  PRIMARY KEY (`ID_SupMed`),
  KEY `ID_Med` (`ID_Med`),
  KEY `ID_Supply` (`ID_Supply`),
  CONSTRAINT `supmedicine_ibfk_1` FOREIGN KEY (`ID_Med`) REFERENCES `medicine` (`ID_Med`),
  CONSTRAINT `supmedicine_ibfk_2` FOREIGN KEY (`ID_Supply`) REFERENCES `supply` (`ID_Supply`),
  CONSTRAINT `supmedicine_chk_1` CHECK ((`Amount` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supmedicine`
--

LOCK TABLES `supmedicine` WRITE;
/*!40000 ALTER TABLE `supmedicine` DISABLE KEYS */;
INSERT INTO `supmedicine` VALUES (1,3,13.4,3,1,'2022-12-02'),(2,1,22.99,1,1,'2023-09-08'),(3,2,34.45,1,1,'2020-12-13'),(4,2,23,1,2,'2023-07-12');
/*!40000 ALTER TABLE `supmedicine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supply`
--

DROP TABLE IF EXISTS `supply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supply` (
  `ID_Supply` int NOT NULL AUTO_INCREMENT,
  `ID_Prov` int NOT NULL,
  `ID_Sklad` int NOT NULL,
  `DateSupply` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID_Supply`),
  KEY `ID_Prov` (`ID_Prov`),
  KEY `ID_Sklad` (`ID_Sklad`),
  CONSTRAINT `supply_ibfk_1` FOREIGN KEY (`ID_Prov`) REFERENCES `provider` (`ID_Prov`),
  CONSTRAINT `supply_ibfk_2` FOREIGN KEY (`ID_Sklad`) REFERENCES `sklad` (`ID_Sklad`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supply`
--

LOCK TABLES `supply` WRITE;
/*!40000 ALTER TABLE `supply` DISABLE KEYS */;
INSERT INTO `supply` VALUES (1,2,1,'2021-04-18 00:00:00'),(2,3,1,'2020-01-13 00:00:00');
/*!40000 ALTER TABLE `supply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zakaz`
--

DROP TABLE IF EXISTS `zakaz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zakaz` (
  `ID_Zakaz` int NOT NULL AUTO_INCREMENT,
  `ID_Customer` int NOT NULL,
  `ID_Pharm` int NOT NULL,
  `DateZakaz` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `NameZakaz` varchar(70) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID_Zakaz`),
  KEY `ID_Customer` (`ID_Customer`),
  KEY `ID_Pharm` (`ID_Pharm`),
  CONSTRAINT `zakaz_ibfk_1` FOREIGN KEY (`ID_Customer`) REFERENCES `customer` (`ID`),
  CONSTRAINT `zakaz_ibfk_2` FOREIGN KEY (`ID_Pharm`) REFERENCES `pharmacist` (`ID_Pharm`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zakaz`
--

LOCK TABLES `zakaz` WRITE;
/*!40000 ALTER TABLE `zakaz` DISABLE KEYS */;
INSERT INTO `zakaz` VALUES (1,1,2,'2019-05-27 20:14:00',NULL),(2,1,1,'2018-05-27 20:14:13',NULL),(3,3,2,'2020-05-27 23:14:21',NULL),(4,2,1,'2020-05-27 23:14:21',NULL);
/*!40000 ALTER TABLE `zakaz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zakazmed`
--

DROP TABLE IF EXISTS `zakazmed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zakazmed` (
  `ID_ZakazMed` int NOT NULL AUTO_INCREMENT,
  `ID_Med` int NOT NULL,
  `ID_Zakaz` int NOT NULL,
  `PriceOne` float NOT NULL,
  `AmountZakaz` int DEFAULT NULL,
  PRIMARY KEY (`ID_ZakazMed`),
  KEY `ID_Med` (`ID_Med`),
  KEY `ID_Zakaz` (`ID_Zakaz`),
  CONSTRAINT `zakazmed_ibfk_1` FOREIGN KEY (`ID_Med`) REFERENCES `medicine` (`ID_Med`),
  CONSTRAINT `zakazmed_ibfk_2` FOREIGN KEY (`ID_Zakaz`) REFERENCES `zakaz` (`ID_Zakaz`),
  CONSTRAINT `zakazmed_chk_1` CHECK ((`AmountZakaz` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zakazmed`
--

LOCK TABLES `zakazmed` WRITE;
/*!40000 ALTER TABLE `zakazmed` DISABLE KEYS */;
INSERT INTO `zakazmed` VALUES (1,1,3,11,4),(2,2,4,45,5),(3,3,1,56,6),(4,1,2,12,1),(5,3,2,13,3);
/*!40000 ALTER TABLE `zakazmed` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-27 13:13:40
