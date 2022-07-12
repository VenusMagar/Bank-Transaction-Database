-- MariaDB dump 10.19  Distrib 10.4.18-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: Bank
-- ------------------------------------------------------
-- Server version	10.4.18-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts` (
  `AccountID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(30) NOT NULL,
  `Balance` decimal(15,2) NOT NULL,
  `Type` varchar(15) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  PRIMARY KEY (`AccountID`),
  KEY `CustomerID` (`CustomerID`),
  CONSTRAINT `accounts_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customers` (`CustomerID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` VALUES (1,'Jenish Amatya',200000.00,'Fixed',1),(2,'Dipesh Khadka',1234500.00,'Saving',2),(3,'Jenish Amatya',200000.00,'Saving',1),(4,'Pratik Poudel',3500000.00,'Saving',10),(5,'Aayush Karki',250550.50,'Saving',7),(6,'Seema Rai',658500.25,'Fixed',4),(7,'Manisha Koirala',7545065.00,'Fixed',9),(8,'Shadikshya Mehta',45129875.75,'Saving',5),(9,'Pradip Magar',56127850.50,'Fixed',3),(10,'Kiran Shrestha',6550250.00,'Fixed',8),(11,'Pradip Magar',85565050.50,'Saving',3),(12,'Sajesh Bachracharya',2565585.00,'Fixed',6),(13,'Shadikshya Mehta',6585645.50,'Fixed',5);
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branches`
--

DROP TABLE IF EXISTS `branches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `branches` (
  `BranchID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  `Address` varchar(20) NOT NULL,
  `Phone` varchar(10) DEFAULT NULL,
  `Email` varchar(25) DEFAULT 'info@nabilbank.com',
  PRIMARY KEY (`BranchID`),
  UNIQUE KEY `Phone` (`Phone`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branches`
--

LOCK TABLES `branches` WRITE;
/*!40000 ALTER TABLE `branches` DISABLE KEYS */;
INSERT INTO `branches` VALUES (1,'Nabil Bank - New Road','Kathmandu','01-4224583','info@nabilbank.com'),(2,'Nabil Bank Ltd. Swoyambhu Branch','Kathmandu','01-4033553','info@nabilbank.com'),(3,'Nabil Bank - Tripureshwor','Kathmandu','01-4227181','info@nabilbank.com'),(4,'Nabil Bank - Pulchowk','Lalitpur','01-5542891','info@nabilbank.com'),(5,'Nabil Bank Ltd. Gwarko Branch','Lalitpur','01-5186090','info@nabilbank.com'),(6,'Nabil Bank Kumaripati Branch','Lalitpur','01-5632542','info@nabilbank.com'),(7,'Nabil Bank - Baneshwor','Kathmandu','01-4485212','info@nabilbank.com');
/*!40000 ALTER TABLE `branches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers` (
  `CustomerID` int(11) NOT NULL AUTO_INCREMENT,
  `Fname` varchar(15) NOT NULL,
  `Lname` varchar(15) NOT NULL,
  `Age` int(3) NOT NULL,
  `Gender` varchar(12) NOT NULL,
  `Phone` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`CustomerID`),
  UNIQUE KEY `Phone` (`Phone`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Jenish','Amatya',21,'Male','9845164448'),(2,'Dipesh','Khadka',35,'Male','9862154845'),(3,'Pradip','Magar',26,'Male','9814653245'),(4,'Seema','Rai',42,'Female','9861875454'),(5,'Shadikshya','Mehta',19,'Female','9841584515'),(6,'Sajesh','Bachracharya',32,'Male','9847451848'),(7,'Aayush','Karki',56,'Male','98316484564'),(8,'Kiran','Shrestha',21,'Male','9865155518'),(9,'Manisha','Koirala',31,'Female','9865124568'),(10,'Pratik','Poudel',64,'Male','9816486718');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employees` (
  `EmployeeID` int(11) NOT NULL AUTO_INCREMENT,
  `Fname` varchar(15) NOT NULL,
  `Lname` varchar(15) NOT NULL,
  `Gender` varchar(12) NOT NULL,
  `Email` varchar(30) DEFAULT NULL,
  `BranchID` int(11) NOT NULL,
  PRIMARY KEY (`EmployeeID`),
  UNIQUE KEY `Email` (`Email`),
  KEY `BranchID` (`BranchID`),
  CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`BranchID`) REFERENCES `branches` (`BranchID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'Prakash','Joshi','Male','prakash.joshi@nabilbank.com',1),(2,'Deepika','Shrestha','Female','deepika.shrestha@nabilbank.com',6),(3,'Anish','Pradhan','Male','anish.pradhan@nabilbank.com',6),(4,'Rojan','Devkota','Male','rojan.devkota@nabilbank.com',3),(5,'Bibek','Magar','Male','bibek.magar@nabilbank.com',7),(6,'Phurpa','Tamang','Male','phurpa.tamang@nabilbank.com',2),(7,'Rejina','Maharjan','Female','rejina.maharjan@nabilbank.com',5),(8,'Reenku','Lama','Female','reenku.lama@nabilbank.com',4),(9,'Sailesh','Yadav','Male','sailesh.yadav@nabilbank.com',1),(10,'Sabhya','Rai','Female','sabhya.rai@nabilbank.com',6);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transactions` (
  `TransactionID` int(11) NOT NULL AUTO_INCREMENT,
  `AMOUNT` decimal(10,2) NOT NULL,
  `Date` date NOT NULL,
  `EmployeeID` int(11) NOT NULL,
  `AccountID` int(11) NOT NULL,
  PRIMARY KEY (`TransactionID`),
  KEY `EmployeeID` (`EmployeeID`),
  KEY `AccountID` (`AccountID`),
  CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`EmployeeID`) REFERENCES `employees` (`EmployeeID`),
  CONSTRAINT `transactions_ibfk_2` FOREIGN KEY (`AccountID`) REFERENCES `accounts` (`AccountID`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
INSERT INTO `transactions` VALUES (1,50000.00,'2021-04-01',2,3),(2,120000.00,'2021-03-25',7,5),(3,75000.00,'2021-03-13',1,2),(4,210000.00,'2021-02-17',4,13),(5,123540.50,'2021-02-05',3,9),(6,43250.75,'2021-01-23',10,4),(7,154550.00,'2020-12-15',8,10),(8,200000.00,'2020-11-04',5,7),(9,95750.50,'2020-11-04',10,1),(10,236570.00,'2020-11-01',6,11),(11,24000.50,'2020-10-18',9,6),(12,657565.00,'2020-10-03',3,12),(13,15645.50,'2020-10-01',9,3),(14,65845.75,'2020-10-01',3,7),(15,98450.00,'2020-10-01',4,1),(16,125650.50,'2020-09-13',7,8),(17,98645.00,'2020-08-15',1,4),(18,165850.00,'2020-08-14',1,6),(19,865450.50,'2020-08-08',5,11),(20,756525.75,'2020-08-01',3,7),(21,6530.00,'2020-07-23',5,10),(22,89540.75,'2020-07-11',3,6),(23,13565.50,'2020-07-11',7,7);
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-27 23:03:35
