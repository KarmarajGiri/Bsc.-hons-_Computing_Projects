-- MariaDB dump 10.19  Distrib 10.4.18-MariaDB, for osx10.10 (x86_64)
--
-- Host: localhost    Database: HOSPITAL
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
-- Table structure for table `Doctor`
--

DROP TABLE IF EXISTS `Doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Doctor` (
  `DoctorID` int(11) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(255) NOT NULL,
  `MiddleName` varchar(255) DEFAULT NULL,
  `LastName` varchar(255) NOT NULL,
  `Specialization` varchar(255) NOT NULL,
  `Qualification` varchar(255) NOT NULL,
  PRIMARY KEY (`DoctorID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Doctor`
--

LOCK TABLES `Doctor` WRITE;
/*!40000 ALTER TABLE `Doctor` DISABLE KEYS */;
INSERT INTO `Doctor` VALUES (1,'Karma','Raj','Giri','Dermatologists','FAAD'),(2,'Yuvvraj','','Adhikari','Ophthalmologists','M.D.'),(3,'Alex','','Gordan','Cardiologists','D.M.'),(4,'Gokarna','Raj','Bista','Gynecologists','Diploma'),(5,'Abikal','Bikram','Saahi','Surgery','M.D. in Surgery'),(6,'Kasham','Jung','Malla','Gastroenterologists','D.O.'),(7,'Bhim','','Bista','Nephrologists','ABIM'),(8,'Sanjay','','Tamang','Urologists','MCAT'),(9,'Abhishek','Kumar','Yadav','Neurologists','GMC'),(10,'Bibek','Raj','Joshi','Psychiatrists','MBBS');
/*!40000 ALTER TABLE `Doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Employee`
--

DROP TABLE IF EXISTS `Employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Employee` (
  `EmployeeID` int(11) NOT NULL,
  `FirstName` varchar(255) DEFAULT NULL,
  `LastName` varchar(255) DEFAULT NULL,
  `Salary` decimal(10,2) DEFAULT NULL,
  `Contactno` int(11) DEFAULT NULL,
  PRIMARY KEY (`EmployeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employee`
--

LOCK TABLES `Employee` WRITE;
/*!40000 ALTER TABLE `Employee` DISABLE KEYS */;
INSERT INTO `Employee` VALUES (111,'Govardhan','Giri',25000.45,9009891),(222,'Gaurav','Gautam',35000.45,900989122),(333,'Ganga','Gurung',45000.45,923423891),(345,'Supriya','Kishori',88867.80,900935891),(444,'Gangajal','Shakya',55000.45,9578891),(555,'Yoddha','Yadav',6745.99,95757),(666,'Gautam','Gulati',65000.45,9006),(777,'Abhishek','Shah',75000.45,90095656),(888,'Amresh','Ghimire',725000.45,900984591),(999,'Goma','Kadari',525000.45,90095891);
/*!40000 ALTER TABLE `Employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MedicalRecord`
--

DROP TABLE IF EXISTS `MedicalRecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MedicalRecord` (
  `RecordID` int(11) NOT NULL,
  `PatientID` int(11) DEFAULT NULL,
  `DoctorID` int(11) DEFAULT NULL,
  `EmployeeID` int(11) DEFAULT NULL,
  `DateOfExamination` date DEFAULT NULL,
  PRIMARY KEY (`RecordID`),
  KEY `PatientID` (`PatientID`),
  KEY `DoctorID` (`DoctorID`),
  KEY `EmployeeID` (`EmployeeID`),
  CONSTRAINT `medicalrecord_ibfk_1` FOREIGN KEY (`PatientID`) REFERENCES `Patient` (`PatientID`),
  CONSTRAINT `medicalrecord_ibfk_2` FOREIGN KEY (`DoctorID`) REFERENCES `Doctor` (`DoctorID`),
  CONSTRAINT `medicalrecord_ibfk_3` FOREIGN KEY (`EmployeeID`) REFERENCES `Employee` (`EmployeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MedicalRecord`
--

LOCK TABLES `MedicalRecord` WRITE;
/*!40000 ALTER TABLE `MedicalRecord` DISABLE KEYS */;
INSERT INTO `MedicalRecord` VALUES (1000,3,1,111,'1990-09-03'),(1001,9,2,222,'1991-10-04'),(1002,11,3,333,'1992-01-05'),(1003,15,4,345,'1993-05-06'),(1004,17,5,444,'1993-07-06'),(1005,19,6,555,'1994-09-04'),(1006,21,7,666,'1994-10-03'),(1007,23,8,777,'1995-01-10'),(1008,25,9,888,'1995-04-11'),(1009,33,10,999,'1996-09-03');
/*!40000 ALTER TABLE `MedicalRecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Medicine`
--

DROP TABLE IF EXISTS `Medicine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Medicine` (
  `Code` int(11) NOT NULL,
  `Price` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `Description` varchar(255) NOT NULL,
  UNIQUE KEY `Code` (`Code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Medicine`
--

LOCK TABLES `Medicine` WRITE;
/*!40000 ALTER TABLE `Medicine` DISABLE KEYS */;
INSERT INTO `Medicine` VALUES (23,299,9,'Pain Killer'),(45,499,10,'Diagnosis'),(909,399,22,'Swelling'),(1231,900,11,'Vitamin'),(98800,245,13,'Nausea'),(202020,676,14,'Vomitting');
/*!40000 ALTER TABLE `Medicine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Patient`
--

DROP TABLE IF EXISTS `Patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Patient` (
  `PatientID` int(11) NOT NULL,
  `FullName` varchar(255) NOT NULL,
  `Phoneno` int(11) NOT NULL,
  `Age` int(11) NOT NULL,
  PRIMARY KEY (`PatientID`),
  UNIQUE KEY `Phoneno` (`Phoneno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Patient`
--

LOCK TABLES `Patient` WRITE;
/*!40000 ALTER TABLE `Patient` DISABLE KEYS */;
INSERT INTO `Patient` VALUES (3,'Raghav Yonjan',983423424,45),(9,'Sundar Pichai',92423234,34),(11,'Sriram Kandel',9409204,29),(15,'Hariram Kadari',95675643,20),(17,'Harke Haldar',932453425,29),(19,'Shyam Sundar',924234,31),(21,'Santosh Bista',91930912,46),(23,'Nitesh Bajacharya',9234265,55),(25,'Subarna Yadav',97567567,56),(33,'Abhinav Das',979789,23);
/*!40000 ALTER TABLE `Patient` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-29 21:23:02
