CREATE DATABASE  IF NOT EXISTS `domothink` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;
USE `domothink`;
-- MySQL dump 10.13  Distrib 5.7.12, for osx10.9 (x86_64)
--
-- Host: api-domothink.timekube.net    Database: domothink
-- ------------------------------------------------------
-- Server version	5.5.53-0+deb8u1

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
-- Table structure for table `apiversion`
--

DROP TABLE IF EXISTS `apiversion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `apiversion` (
  `version` varchar(15) COLLATE utf8_bin NOT NULL,
  `password` varchar(45) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apiversion`
--

LOCK TABLES `apiversion` WRITE;
/*!40000 ALTER TABLE `apiversion` DISABLE KEYS */;
INSERT INTO `apiversion` VALUES ('1.0.0','helloworld');
/*!40000 ALTER TABLE `apiversion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storeplugincomments`
--

DROP TABLE IF EXISTS `storeplugincomments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `storeplugincomments` (
  `idComment` int(11) NOT NULL AUTO_INCREMENT,
  `author` varchar(45) COLLATE utf8_bin NOT NULL,
  `rate` double NOT NULL,
  `comment` varchar(255) COLLATE utf8_bin DEFAULT '',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `storeplugins_idPlugin` int(11) NOT NULL,
  `keyLoginHash` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`idComment`),
  KEY `storeplugins_idPlugin_idx` (`storeplugins_idPlugin`),
  CONSTRAINT `idPlugin` FOREIGN KEY (`storeplugins_idPlugin`) REFERENCES `storeplugins` (`idPlugin`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storeplugincomments`
--

LOCK TABLES `storeplugincomments` WRITE;
/*!40000 ALTER TABLE `storeplugincomments` DISABLE KEYS */;
INSERT INTO `storeplugincomments` VALUES (9,'Saluuuut',2.7,'Finallement ...','2016-10-06 13:52:48',12,'6f9b9af3cd6e8b8a73c2cdced37fe9f59226e27d'),(10,'User de test',4.2,'Pas mal ça !','2016-10-12 19:41:11',12,'example'),(11,'User de test',4.2,'Pas mal ça !','2016-10-12 19:41:24',12,'example'),(12,'ANTOINE',4.2,'UPDATE','2017-01-09 21:15:10',12,'antoine'),(14,'User de testHASH',4.2,'POUT','2017-01-09 22:08:41',12,'HASH');
/*!40000 ALTER TABLE `storeplugincomments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storeplugins`
--

DROP TABLE IF EXISTS `storeplugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `storeplugins` (
  `idPlugin` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8_bin NOT NULL,
  `repository` varchar(255) COLLATE utf8_bin NOT NULL,
  `language` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `keyLoginHash` varchar(255) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`idPlugin`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storeplugins`
--

LOCK TABLES `storeplugins` WRITE;
/*!40000 ALTER TABLE `storeplugins` DISABLE KEYS */;
INSERT INTO `storeplugins` VALUES (12,'node-orm','https://github.com/dresende/node-orm2.git','pas du tout js THIBAULT','2017-01-09 21:58:48','6f9b9af3cd6e8b8a73c2cdced37fe9f59226e27d'),(13,'node-orm','https://github.com/dresende/node-orm2.git','js ce coup ci','2016-10-11 08:49:02','6f9b9af3cd6e8b8a73c2cdced37fe9f59226e27d'),(14,'test','https://github.com/dresende/node-orm2.git','test','2017-01-08 16:29:22','test');
/*!40000 ALTER TABLE `storeplugins` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-01-10 23:43:25
