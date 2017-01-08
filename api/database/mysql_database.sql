CREATE DATABASE  IF NOT EXISTS `domothink` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;
USE `domothink`;

--
-- Table structure for table `storeplugincomments`
--

DROP TABLE IF EXISTS `storeplugincomments`;
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storeplugincomments`
--

LOCK TABLES `storeplugincomments` WRITE;
/*!40000 ALTER TABLE `storeplugincomments` DISABLE KEYS */;
INSERT INTO `storeplugincomments` VALUES (9,'Saluuuut',2.7,'Finallement ...','2016-10-06 13:52:48',12,'6f9b9af3cd6e8b8a73c2cdced37fe9f59226e27d'),(10,'User de test',4.2,'Pas mal ça !','2016-10-12 19:41:11',12,'example'),(11,'User de test',4.2,'Pas mal ça !','2016-10-12 19:41:24',12,'example');
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storeplugins`
--

LOCK TABLES `storeplugins` WRITE;
/*!40000 ALTER TABLE `storeplugins` DISABLE KEYS */;
INSERT INTO `storeplugins` VALUES (12,'node-orm','https://github.com/dresende/node-orm2.git','js ce coup ci','2016-10-06 12:00:35','6f9b9af3cd6e8b8a73c2cdced37fe9f59226e27d'),(13,'node-orm','https://github.com/dresende/node-orm2.git','js ce coup ci','2016-10-11 08:49:02','6f9b9af3cd6e8b8a73c2cdced37fe9f59226e27d');
/*!40000 ALTER TABLE `storeplugins` ENABLE KEYS */;
UNLOCK TABLES;
