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
  `BUSINESSID` int(6) NOT NULL DEFAULT '0',
  `DRINKS` varchar(100) DEFAULT NULL,
  `SMALL_PIC` varchar(1000) DEFAULT NULL,
  `BIG_PIC` varchar(1000) DEFAULT NULL,
  `PRICE` int(6) NOT NULL,
  `NUM` int(11) NOT NULL,
  `ATTRIBUTE` int(1) NOT NULL DEFAULT '0',
  `DESCRIPT` text,
  `CREATE_DATE` timestamp NOT NULL DEFAULT '2013-01-01 03:11:11',
  `USE_DATE` timestamp NOT NULL DEFAULT '2013-01-01 03:11:11',
  PRIMARY KEY (`DRINKSID`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drinks`
--

LOCK TABLES `drinks` WRITE;
/*!40000 ALTER TABLE `drinks` DISABLE KEYS */;
INSERT INTO `drinks` VALUES (1,0,'茅台','WebRoot/images/img.png','WebRoot/images/img.png',500,34,0,NULL,'2013-01-01 03:11:11','2013-01-01 03:11:11'),(2,0,'五粮液','WebRoot/images/img.png','WebRoot/images/img.png',1000,23,0,NULL,'2013-01-01 03:11:11','2013-01-01 03:11:11'),(3,0,'汾酒','WebRoot/images/img.png','WebRoot/images/img.png',300,23,0,NULL,'2013-01-01 03:11:11','2013-01-01 03:11:11'),(4,0,'二锅头','WebRoot/images/img.png','WebRoot/images/img.png',0,2,0,NULL,'2013-01-01 03:11:11','2013-01-01 03:11:11'),(5,0,'老白干','WebRoot/images/img.png','WebRoot/images/img.png',0,12,0,NULL,'2013-01-01 03:11:11','2013-01-01 03:11:11'),(6,0,'马奶酒','WebRoot/images/img.png','WebRoot/images/img.png',0,0,0,NULL,'2013-01-01 03:11:11','2013-01-01 03:11:11'),(7,0,'女儿红','WebRoot/images/img.png','WebRoot/images/img.png',0,0,0,NULL,'2013-01-01 03:11:11','2013-01-01 03:11:11'),(8,0,'三沟','images/-7059869585075280282.png','images/-413336769536885846.png',123,123,0,'test modify drinks','2013-01-01 03:11:11','2013-01-01 03:11:11'),(9,0,'111111',NULL,NULL,0,0,0,NULL,'2013-01-01 03:11:11','2013-01-01 03:11:11'),(10,0,'2222',NULL,NULL,0,0,0,NULL,'2013-01-01 03:11:11','2013-01-01 03:11:11'),(13,0,'55555',NULL,NULL,0,0,0,NULL,'2013-01-01 03:11:11','2013-01-01 03:11:11'),(14,0,'qwe','images/-3713567433547818117.png','images/-3387340990448685939.png',123,21,0,'test add drinks','2013-10-11 04:21:18','2013-01-01 03:11:11'),(15,0,'dfdfg','images/-1708899676249080847.png','images/7237209600112743493.jpg',12,12,0,'sdfgtydfg','2013-10-24 09:13:17','2013-01-01 03:11:11'),(17,0,NULL,'images/1013914772118532757.png','images/-6167885494313671798.png',12,12,0,'qweradfrtrtytry','2013-11-04 12:50:11','2013-01-01 03:11:11');
/*!40000 ALTER TABLE `drinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feedback` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) NOT NULL DEFAULT '',
  `isshow` int(1) NOT NULL DEFAULT '1',
  `create_date` timestamp NOT NULL DEFAULT '2012-12-31 16:00:00',
  `update_date` timestamp NOT NULL DEFAULT '2012-12-31 16:00:00',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` VALUES (1,'wqer',0,'2013-11-04 07:12:01','2012-12-31 16:00:00'),(2,'etwet',0,'2012-12-31 16:00:00','2012-12-31 16:00:00'),(3,'sfdgert',1,'2013-11-04 07:59:16','2012-12-31 16:00:00'),(4,'tgsrtyt',1,'2013-11-04 07:59:21','2012-12-31 16:00:00'),(5,'tgsrtyt',1,'2013-11-04 08:44:43','2012-12-31 16:00:00');
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food`
--

LOCK TABLES `food` WRITE;
/*!40000 ALTER TABLE `food` DISABLE KEYS */;
INSERT INTO `food` VALUES (29,0,'123','images/-7213942456950524769.png','images/-3024500831466288145.png',123,2,0,0,'','2013-10-10 09:59:09','2013-01-01 03:11:11'),(30,0,'332','images/8073301663562955469.jpg','',11,11,1,0,'1111','2013-10-10 10:00:53','2013-01-01 03:11:11'),(31,0,'asd','images/-7213942456950524769.png','',21,32,0,0,'fasdazxc','2013-10-10 12:59:21','2013-01-01 03:11:11'),(34,0,'123','images/2924328963579930024.png','images/-3024500831466288145.png',321,2,1,0,'test modify check','2013-10-10 14:09:36','2013-01-01 03:11:11'),(35,0,'123','images/2924328963579930024.png','images/-3024500831466288145.png',321,2,1,0,'test modify','2013-10-10 14:11:28','2013-01-01 03:11:11'),(36,0,'qwe','images/-7213942456950524769.png','',12,23,1,0,'asddfggjghjjlkk','2013-10-11 03:17:25','2013-01-01 03:11:11'),(37,0,'1111','images/-7213942456950524769.png','',0,0,0,0,NULL,'2013-01-01 03:11:11','2013-01-01 03:11:11'),(38,0,'2222','images/-7213942456950524769.png','',12,20,2,0,NULL,'2013-01-01 03:11:11','2013-01-01 03:11:11'),(39,0,'3333','images/-7213942456950524769.png','',32,4,2,0,NULL,'2013-01-01 03:11:11','2013-01-01 03:11:11'),(40,0,'4444','images/-7213942456950524769.png','',0,0,0,0,NULL,'2013-01-01 03:11:11','2013-01-01 03:11:11'),(41,0,'5555','images/-7213942456950524769.png','',65,5,2,0,NULL,'2013-01-01 03:11:11','2013-01-01 03:11:11'),(42,0,'6666','images/-7213942456950524769.png','',0,0,2,0,NULL,'2013-01-01 03:11:11','2013-01-01 03:11:11'),(43,0,'7777','images/-7213942456950524769.png','',0,0,2,0,NULL,'2013-01-01 03:11:11','2013-01-01 03:11:11'),(44,0,'8888','images/-7213942456950524769.png','',0,0,2,0,NULL,'2013-01-01 03:11:11','2013-01-01 03:11:11'),(45,0,'9999','images/-7213942456950524769.png','',0,0,2,0,NULL,'2013-01-01 03:11:11','2013-01-01 03:11:11'),(46,0,'0000','images/-7213942456950524769.png','',0,0,0,0,NULL,'2013-01-01 03:11:11','2013-01-01 03:11:11'),(47,0,'asd','images/-7213942456950524769.png','images/-8958177490262151202.png',23,2,1,0,'sfg','2013-10-17 03:23:47','2013-01-01 03:11:11'),(48,0,'gsretert','images/-15047063357528246.jpg','images/-1986436417318317494.jpg',12,12,2,0,'afwer','2013-10-24 09:07:44','2013-01-01 03:11:11'),(49,0,'sdgsert','images/-1687822151689830613.png','images/3483285160078285697.png',12,12,0,0,'fwer','2013-11-04 08:49:17','2013-01-01 03:11:11');
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
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message` (
  `msgid` int(11) NOT NULL AUTO_INCREMENT,
  `fromuser` varchar(50) NOT NULL DEFAULT '',
  `touser` varchar(50) NOT NULL DEFAULT '',
  `content` text,
  `isread` int(1) NOT NULL DEFAULT '0',
  `create_date` timestamp NOT NULL DEFAULT '2012-12-31 16:00:00',
  PRIMARY KEY (`msgid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_special`
--

DROP TABLE IF EXISTS `order_special`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_special` (
  `ORDERID` int(6) NOT NULL AUTO_INCREMENT,
  `CUSTOMERID` int(11) NOT NULL DEFAULT '0',
  `tempcus` varchar(50) NOT NULL DEFAULT '',
  `BUSINESSID` int(11) NOT NULL DEFAULT '0',
  `FOODID` int(11) NOT NULL,
  `food` varchar(200) NOT NULL DEFAULT '',
  `SPECIALNAME` varchar(100) DEFAULT '',
  `PRICE` int(11) NOT NULL,
  `SMALL_PIC` varchar(255) NOT NULL DEFAULT '',
  `COUNT` int(11) NOT NULL,
  `STATE` int(1) NOT NULL,
  `TYPE` int(1) NOT NULL,
  `CREATE_DATE` timestamp NOT NULL DEFAULT '2012-12-31 16:00:00',
  `UPDATE_DATE` timestamp NOT NULL DEFAULT '2012-12-31 16:00:00',
  PRIMARY KEY (`ORDERID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_special`
--

LOCK TABLES `order_special` WRITE;
/*!40000 ALTER TABLE `order_special` DISABLE KEYS */;
INSERT INTO `order_special` VALUES (1,0,'A9F9DBA0277CF9D9DE0E89F68521B35C',0,1,'qweasd','',12,'images/-7213942456950524769.png',1,0,1,'2013-11-07 14:48:35','2012-12-31 16:00:00');
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
  `REPLAY` varchar(500) NOT NULL DEFAULT '0',
  `CRETEA_DATE` timestamp NOT NULL DEFAULT '2012-12-31 16:00:00',
  PRIMARY KEY (`NUMID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quickreplay`
--

LOCK TABLES `quickreplay` WRITE;
/*!40000 ALTER TABLE `quickreplay` DISABLE KEYS */;
INSERT INTO `quickreplay` VALUES (1,'好的，马上送到！','2012-12-31 16:00:00'),(2,'对不起，请稍等！','2012-12-31 16:00:00'),(3,'对不起，暂时没货！','2012-12-31 16:00:00');
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
  `BUSINESSID` int(6) NOT NULL DEFAULT '0',
  `STAPLEFOOD` varchar(100) DEFAULT NULL,
  `SMALL_PIC` varchar(1000) DEFAULT NULL,
  `BIG_PIC` varchar(1000) DEFAULT NULL,
  `PRICE` int(6) NOT NULL,
  `NUM` int(11) NOT NULL,
  `ATTRIBUTE` int(1) NOT NULL DEFAULT '0',
  `DESCRIPT` text,
  `CREATE_DATE` timestamp NOT NULL DEFAULT '2012-12-31 16:00:00',
  `USE_DATE` timestamp NOT NULL DEFAULT '2012-12-31 16:00:00',
  PRIMARY KEY (`STAPLEID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staplefood`
--

LOCK TABLES `staplefood` WRITE;
/*!40000 ALTER TABLE `staplefood` DISABLE KEYS */;
INSERT INTO `staplefood` VALUES (1,0,'qweasd','images/-7213942456950524769.png','images/-7213942456950524769.png',12,21,0,'dwqe','2012-12-31 16:00:00','2012-12-31 16:00:00'),(2,0,'qweert','images/-729325709557358011.png','images/3434655586732718009.png',123,21,0,'asdffghfgyu','2013-11-04 12:54:25','2012-12-31 16:00:00'),(3,0,'sfdrt','images/-7213942456950524769.png','images/-7213942456950524769.png',12,12,0,'afwer','2012-12-31 16:00:00','2012-12-31 16:00:00'),(4,0,'sdfgret','images/-7213942456950524769.png','images/-7213942456950524769.png',12,34,0,'test modify','2012-12-31 16:00:00','2012-12-31 16:00:00'),(6,0,'qweert','images/-729325709557358011.png','images/3434655586732718009.png',123,21,0,'asdffghfgyu','2013-11-04 12:57:28','2012-12-31 16:00:00');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','123',1,1,0,0,NULL,NULL,'2013-01-01 03:11:11','2013-01-01 03:11:11'),(2,'user1','123',1,1,0,0,NULL,NULL,'2013-01-01 03:11:11','2013-01-01 03:11:11');
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

-- Dump completed on 2013-11-07 23:17:16
