-- MySQL dump 10.13  Distrib 5.5.23, for Win64 (x86)
--
-- Host: localhost    Database: food
-- ------------------------------------------------------
-- Server version	5.5.23

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
-- Table structure for table `business`
--

DROP TABLE IF EXISTS `business`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `business` (
  `BUSINESSID` int(6) NOT NULL AUTO_INCREMENT,
  `BUSNAME` varchar(200) DEFAULT NULL,
  `REMARK` text,
  `TYPE` int(1) DEFAULT '0',
  `STATE` int(1) NOT NULL DEFAULT '0',
  `MOBILE` varchar(40) DEFAULT NULL,
  `PHONE` varchar(40) DEFAULT NULL,
  `EMAIL` varchar(40) DEFAULT NULL,
  `ADDRESS` varchar(255) DEFAULT NULL,
  `P_PLATFORM` varchar(40) DEFAULT NULL,
  `create_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `start_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `over_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`BUSINESSID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `business`
--

LOCK TABLES `business` WRITE;
/*!40000 ALTER TABLE `business` DISABLE KEYS */;
/*!40000 ALTER TABLE `business` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chatmsg`
--

DROP TABLE IF EXISTS `chatmsg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chatmsg` (
  `MSGID` int(6) NOT NULL AUTO_INCREMENT,
  `CUSTOMERID` int(6) NOT NULL,
  `USERID` int(6) NOT NULL,
  `BIG_PIC` varchar(1000) DEFAULT NULL,
  `ISREAD` int(1) NOT NULL,
  `MSGINFO` text,
  `CRETEA_DATE` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `USE_DATE` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`MSGID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chatmsg`
--

LOCK TABLES `chatmsg` WRITE;
/*!40000 ALTER TABLE `chatmsg` DISABLE KEYS */;
/*!40000 ALTER TABLE `chatmsg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `CUSTOMERID` int(6) NOT NULL AUTO_INCREMENT,
  `CUSTOMER` varchar(200) NOT NULL,
  `STATE` int(1) NOT NULL,
  `TYPE` int(1) NOT NULL,
  `MOBILE` varchar(40) NOT NULL,
  `EMAIL` varchar(40) NOT NULL,
  `ADDRESS` varchar(500) NOT NULL,
  `DESCRIPT` text,
  `CRETEA_DATE` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `USE_DATE` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `LAST_LOGIN_TIME` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`CUSTOMERID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'张三',0,0,'123456','','',NULL,'2013-01-01 03:11:11','2013-01-01 03:11:11','2013-01-01 03:11:11'),(2,'李四',0,0,'654321','','',NULL,'2013-01-01 03:11:11','2013-01-01 03:11:11','2013-01-01 03:11:11'),(3,'王五',0,0,'456123','','',NULL,'2013-01-01 03:11:11','2013-01-01 03:11:11','2013-01-01 03:11:11');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drinks`
--

DROP TABLE IF EXISTS `drinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drinks` (
  `DRINKSID` int(6) NOT NULL AUTO_INCREMENT,
  `BUSINESSID` int(6) NOT NULL,
  `DRINKS` varchar(100) DEFAULT NULL,
  `SMALL_PIC` varchar(1000) DEFAULT NULL,
  `BIG_PIC` varchar(1000) DEFAULT NULL,
  `PRICE` int(6) NOT NULL,
  `NUM` int(11) NOT NULL,
  `ATTRIBUTE` int(1) NOT NULL,
  `DESCRIPT` text,
  `CREATE_DATE` timestamp NOT NULL DEFAULT '2013-01-01 03:11:11',
  `USE_DATE` timestamp NOT NULL DEFAULT '2013-01-01 03:11:11',
  PRIMARY KEY (`DRINKSID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drinks`
--

LOCK TABLES `drinks` WRITE;
/*!40000 ALTER TABLE `drinks` DISABLE KEYS */;
INSERT INTO `drinks` VALUES (1,0,'茅台','WebRoot/images/img.png','WebRoot/images/img.png',500,0,0,NULL,'2013-01-01 03:11:11','2013-01-01 03:11:11'),(2,0,'五粮液','WebRoot/images/img.png','WebRoot/images/img.png',1000,0,0,NULL,'2013-01-01 03:11:11','2013-01-01 03:11:11'),(3,0,'汾酒','WebRoot/images/img.png','WebRoot/images/img.png',300,0,0,NULL,'2013-01-01 03:11:11','2013-01-01 03:11:11'),(4,0,'二锅头','WebRoot/images/img.png','WebRoot/images/img.png',0,0,0,NULL,'2013-01-01 03:11:11','2013-01-01 03:11:11'),(5,0,'老白干','WebRoot/images/img.png','WebRoot/images/img.png',0,0,0,NULL,'2013-01-01 03:11:11','2013-01-01 03:11:11'),(6,0,'马奶酒','WebRoot/images/img.png','WebRoot/images/img.png',0,0,0,NULL,'2013-01-01 03:11:11','2013-01-01 03:11:11'),(7,0,'女儿红','WebRoot/images/img.png','WebRoot/images/img.png',0,0,0,NULL,'2013-01-01 03:11:11','2013-01-01 03:11:11'),(8,0,'三沟','WebRoot/images/img.png','WebRoot/images/img.png',0,0,0,NULL,'2013-01-01 03:11:11','2013-01-01 03:11:11'),(9,0,'111111',NULL,NULL,0,0,0,NULL,'2013-01-01 03:11:11','2013-01-01 03:11:11'),(10,0,'2222',NULL,NULL,0,0,0,NULL,'2013-01-01 03:11:11','2013-01-01 03:11:11'),(12,0,'44444',NULL,NULL,0,0,0,NULL,'2013-01-01 03:11:11','2013-01-01 03:11:11'),(13,0,'55555',NULL,NULL,0,0,0,NULL,'2013-01-01 03:11:11','2013-01-01 03:11:11');
/*!40000 ALTER TABLE `drinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `food`
--

DROP TABLE IF EXISTS `food`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `food` (
  `FOODID` int(6) NOT NULL AUTO_INCREMENT,
  `BUSINESSID` int(6) NOT NULL DEFAULT '0',
  `FOOD` varchar(100) NOT NULL DEFAULT '',
  `SMALL_PIC` varchar(1000) NOT NULL DEFAULT '',
  `BIG_PIC` varchar(1000) NOT NULL DEFAULT '',
  `PRICE` int(6) DEFAULT '0',
  `NUM` int(11) DEFAULT '0',
  `ISFEATURE` int(1) DEFAULT '0',
  `ATTRIBUTE` int(1) DEFAULT '0',
  `DESCRIPT` text,
  `CREATE_DATE` timestamp NOT NULL DEFAULT '2013-01-01 03:11:11',
  `USE_DATE` timestamp NOT NULL DEFAULT '2013-01-01 03:11:11',
  PRIMARY KEY (`FOODID`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food`
--

LOCK TABLES `food` WRITE;
/*!40000 ALTER TABLE `food` DISABLE KEYS */;
INSERT INTO `food` VALUES (1,0,'面包','','',0,0,0,0,NULL,'2013-01-01 03:11:11','2013-01-01 03:11:11'),(19,0,'1199','','',0,0,0,0,NULL,'2013-01-01 03:11:11','2013-01-01 03:11:11'),(25,0,'132','images/-6945068204742625270.jpg','images/3191192357741597905.jpg',12,21,0,0,'asdqwefsd','2013-10-10 03:12:52','2013-01-01 03:11:11'),(26,0,'321','images/-6833054467051639827.jpg','images/2219988760523001448.jpg',12,22,1,0,'asdadsfsdfg','2013-10-10 03:19:20','2013-01-01 03:11:11'),(27,0,'123','images/2924328963579930024.png','images/-3024500831466288145.png',123,2,1,0,'test modify','2013-10-10 03:29:23','2013-01-01 03:11:11'),(28,0,'234','images/-5873740817500718251.png','images/8753498960101734214.png',234,23,1,0,'ssdfa','2013-10-10 03:34:42','2013-01-01 03:11:11'),(29,0,'123','images/2924328963579930024.png','images/-3024500831466288145.png',123,2,0,0,'','2013-10-10 09:59:09','2013-01-01 03:11:11'),(30,0,'332','images/8073301663562955469.jpg','',11,11,1,0,'1111','2013-10-10 10:00:53','2013-01-01 03:11:11'),(31,0,'asd','','',21,32,1,0,'fasdazxc','2013-10-10 12:59:21','2013-01-01 03:11:11'),(34,0,'123','images/2924328963579930024.png','images/-3024500831466288145.png',321,2,1,0,'test modify','2013-10-10 14:09:36','2013-01-01 03:11:11'),(35,0,'123','images/2924328963579930024.png','images/-3024500831466288145.png',321,2,1,0,'test modify','2013-10-10 14:11:28','2013-01-01 03:11:11');
/*!40000 ALTER TABLE `food` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `information`
--

DROP TABLE IF EXISTS `information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `information` (
  `NUMID` int(6) NOT NULL AUTO_INCREMENT,
  `TYPE` int(1) NOT NULL DEFAULT '0',
  `STATE` int(1) NOT NULL DEFAULT '0',
  `DESCRIPT` text,
  `SEND_TIME` timestamp NOT NULL DEFAULT '2012-12-31 16:00:00',
  `CREATE_DATE` timestamp NOT NULL DEFAULT '2012-12-31 16:00:00',
  `USE_DATE` timestamp NOT NULL DEFAULT '2012-12-31 16:00:00',
  PRIMARY KEY (`NUMID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `information`
--

LOCK TABLES `information` WRITE;
/*!40000 ALTER TABLE `information` DISABLE KEYS */;
INSERT INTO `information` VALUES (1,1,0,'qweasdfer','2012-12-31 16:00:00','2013-10-09 06:51:52','2012-12-31 16:00:00'),(2,3,0,'zxcvfdy','2012-12-31 16:00:00','2013-10-09 06:51:52','2012-12-31 16:00:00'),(3,5,0,'kfghd','2012-12-31 16:00:00','2013-10-09 06:51:52','2012-12-31 16:00:00'),(4,1,0,'1','2012-12-31 16:00:00','2013-10-10 10:00:19','2012-12-31 16:00:00'),(5,2,0,'2','2012-12-31 16:00:00','2013-10-10 10:00:19','2012-12-31 16:00:00'),(6,3,0,'3','2012-12-31 16:00:00','2013-10-10 10:00:19','2012-12-31 16:00:00'),(7,4,0,'4','2012-12-31 16:00:00','2013-10-10 10:00:19','2012-12-31 16:00:00');
/*!40000 ALTER TABLE `information` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_special`
--

DROP TABLE IF EXISTS `order_special`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_special` (
  `ORDERID` int(6) NOT NULL AUTO_INCREMENT,
  `CUSTOMERID` int(11) NOT NULL,
  `BUSINESSID` int(11) NOT NULL,
  `FOODID` int(11) NOT NULL,
  `SPECIALNAME` varchar(100) NOT NULL,
  `PRICE` int(11) NOT NULL,
  `COUNT` int(11) NOT NULL,
  `STATE` int(1) NOT NULL,
  `TYPE` int(1) NOT NULL,
  `CRETEA_DATE` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `UPDATE_DATE` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ORDERID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_special`
--

LOCK TABLES `order_special` WRITE;
/*!40000 ALTER TABLE `order_special` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_special` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quickreplay`
--

DROP TABLE IF EXISTS `quickreplay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quickreplay` (
  `NUMID` int(6) NOT NULL AUTO_INCREMENT,
  `REPLAY` int(6) NOT NULL,
  `CRETEA_DATE` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`NUMID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quickreplay`
--

LOCK TABLES `quickreplay` WRITE;
/*!40000 ALTER TABLE `quickreplay` DISABLE KEYS */;
/*!40000 ALTER TABLE `quickreplay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource`
--

DROP TABLE IF EXISTS `resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resource` (
  `RESID` int(6) NOT NULL AUTO_INCREMENT,
  `BUSINESSID` int(11) NOT NULL,
  `RESURL` varchar(400) NOT NULL,
  `RESPARAM` varchar(200) NOT NULL,
  `RESNAME` varchar(40) NOT NULL,
  `PARENTID` int(10) NOT NULL,
  `RESINFO` varchar(100) NOT NULL,
  `ISTITLE` int(1) NOT NULL,
  `CRETEA_DATE` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `USE_DATE` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`RESID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource`
--

LOCK TABLES `resource` WRITE;
/*!40000 ALTER TABLE `resource` DISABLE KEYS */;
/*!40000 ALTER TABLE `resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource_r_role`
--

DROP TABLE IF EXISTS `resource_r_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resource_r_role` (
  `ROLEID` int(6) NOT NULL AUTO_INCREMENT,
  `RESID` int(11) NOT NULL,
  `CRETEA_DATE` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ROLEID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource_r_role`
--

LOCK TABLES `resource_r_role` WRITE;
/*!40000 ALTER TABLE `resource_r_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `resource_r_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `ROLEID` int(6) NOT NULL AUTO_INCREMENT,
  `ROLENAME` varchar(200) NOT NULL,
  `ROLEINFO` varchar(100) NOT NULL,
  `STATE` int(1) NOT NULL,
  `ADDRESS` varchar(500) NOT NULL,
  `CRETEA_DATE` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `USE_DATE` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ROLEID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staplefood`
--

DROP TABLE IF EXISTS `staplefood`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staplefood` (
  `STAPLEID` int(6) NOT NULL AUTO_INCREMENT,
  `BUSINESSID` int(6) NOT NULL,
  `STAPLEFOOD` varchar(100) DEFAULT NULL,
  `SMALL_PIC` varchar(1000) DEFAULT NULL,
  `BIG_PIC` varchar(1000) DEFAULT NULL,
  `PRICE` int(6) NOT NULL,
  `NUM` int(11) NOT NULL,
  `ATTRIBUTE` int(1) NOT NULL,
  `DESCCRIPT` text,
  `CRETEA_DATE` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `USE_DATE` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`STAPLEID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staplefood`
--

LOCK TABLES `staplefood` WRITE;
/*!40000 ALTER TABLE `staplefood` DISABLE KEYS */;
/*!40000 ALTER TABLE `staplefood` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `USERID` int(6) NOT NULL AUTO_INCREMENT,
  `USERNAME` varchar(200) DEFAULT NULL,
  `PASSWD` varchar(50) DEFAULT NULL,
  `ROLEID` int(11) DEFAULT NULL,
  `BUSINESSID` int(11) DEFAULT NULL,
  `TYPE` int(1) NOT NULL DEFAULT '0',
  `STATE` int(1) NOT NULL DEFAULT '0',
  `MOBILE` varchar(40) DEFAULT NULL,
  `EMAIL` varchar(40) DEFAULT NULL,
  `create_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `use_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`USERID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','123',1,1,0,0,NULL,NULL,'2013-01-01 03:11:11','2013-01-01 03:11:11');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-10-10 22:32:33