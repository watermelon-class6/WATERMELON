-- MySQL dump 10.13  Distrib 5.6.42, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: watermelon
-- ------------------------------------------------------
-- Server version	5.6.42-log

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
-- Table structure for table `ben_email`
--

DROP TABLE IF EXISTS `ben_email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ben_email` (
  `email` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ben_email` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`email`,`ben_email`),
  KEY `be_be_fk` (`ben_email`),
  CONSTRAINT `be_be_fk` FOREIGN KEY (`ben_email`) REFERENCES `members` (`email`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `be_em_fk` FOREIGN KEY (`email`) REFERENCES `members` (`email`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ben_email`
--

LOCK TABLES `ben_email` WRITE;
/*!40000 ALTER TABLE `ben_email` DISABLE KEYS */;
/*!40000 ALTER TABLE `ben_email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `charge`
--

DROP TABLE IF EXISTS `charge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `charge` (
  `num` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cost` int(10) DEFAULT NULL,
  `date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`num`),
  KEY `ch_em_fk` (`email`),
  CONSTRAINT `ch_em_fk` FOREIGN KEY (`email`) REFERENCES `members` (`email`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `charge`
--

LOCK TABLES `charge` WRITE;
/*!40000 ALTER TABLE `charge` DISABLE KEYS */;
/*!40000 ALTER TABLE `charge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment_commu`
--

DROP TABLE IF EXISTS `comment_commu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment_commu` (
  `num` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `date` datetime DEFAULT CURRENT_TIMESTAMP,
  `content` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `com_num` int(11) DEFAULT NULL,
  PRIMARY KEY (`num`),
  KEY `cm_em_fk` (`email`),
  KEY `cm_num_fk` (`com_num`),
  CONSTRAINT `cm_em_fk` FOREIGN KEY (`email`) REFERENCES `members` (`email`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cm_num_fk` FOREIGN KEY (`com_num`) REFERENCES `community` (`num`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment_commu`
--

LOCK TABLES `comment_commu` WRITE;
/*!40000 ALTER TABLE `comment_commu` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment_commu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment_music`
--

DROP TABLE IF EXISTS `comment_music`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment_music` (
  `num` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `date` datetime DEFAULT CURRENT_TIMESTAMP,
  `content` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `mu_num` int(11) NOT NULL,
  PRIMARY KEY (`num`),
  KEY `cm_mn_fk` (`mu_num`),
  CONSTRAINT `cm_mn_fk` FOREIGN KEY (`mu_num`) REFERENCES `musics` (`num`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment_music`
--

LOCK TABLES `comment_music` WRITE;
/*!40000 ALTER TABLE `comment_music` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment_music` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `community`
--

DROP TABLE IF EXISTS `community`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `community` (
  `email` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `num` int(11) NOT NULL AUTO_INCREMENT,
  `photo` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `good` int(10) DEFAULT '0',
  `date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`num`),
  KEY `cn_em_fk` (`email`),
  CONSTRAINT `cn_em_fk` FOREIGN KEY (`email`) REFERENCES `streamer` (`email`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `community`
--

LOCK TABLES `community` WRITE;
/*!40000 ALTER TABLE `community` DISABLE KEYS */;
/*!40000 ALTER TABLE `community` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `follow`
--

DROP TABLE IF EXISTS `follow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `follow` (
  `email` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `streamer` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`email`,`streamer`),
  KEY `fl_se_fk` (`streamer`),
  CONSTRAINT `fl_em_fk` FOREIGN KEY (`email`) REFERENCES `members` (`email`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fl_se_fk` FOREIGN KEY (`streamer`) REFERENCES `streamer` (`email`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `follow`
--

LOCK TABLES `follow` WRITE;
/*!40000 ALTER TABLE `follow` DISABLE KEYS */;
/*!40000 ALTER TABLE `follow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `free_board`
--

DROP TABLE IF EXISTS `free_board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `free_board` (
  `num` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` datetime DEFAULT CURRENT_TIMESTAMP,
  `mu_num` int(11) DEFAULT NULL,
  PRIMARY KEY (`num`),
  KEY `fb_em_fk` (`email`),
  KEY `fb_mn_fk` (`mu_num`),
  CONSTRAINT `fb_em_fk` FOREIGN KEY (`email`) REFERENCES `members` (`email`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fb_mn_fk` FOREIGN KEY (`mu_num`) REFERENCES `musics` (`num`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `free_board`
--

LOCK TABLES `free_board` WRITE;
/*!40000 ALTER TABLE `free_board` DISABLE KEYS */;
/*!40000 ALTER TABLE `free_board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `members` (
  `email` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `gender` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `birth` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `like` int(1) DEFAULT '0',
  `streamer` int(1) DEFAULT '0',
  `point` int(11) DEFAULT '0',
  `profile_img` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` VALUES ('hello@daum.net','1234','hello','male','960205',0,0,0,NULL),('mem123@naver.com','1212','mem','male','930720',0,0,0,NULL),('test@naver.com','test','test','female','950318',0,0,0,NULL),('world@naver.com','1234','world','female','940505',0,0,0,NULL);
/*!40000 ALTER TABLE `members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message` (
  `num` int(11) NOT NULL AUTO_INCREMENT,
  `receive_email` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `send_email` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `content` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`num`),
  KEY `ms_re_fk` (`receive_email`),
  KEY `ms_se_fk` (`send_email`),
  CONSTRAINT `ms_re_fk` FOREIGN KEY (`receive_email`) REFERENCES `members` (`email`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `ms_se_fk` FOREIGN KEY (`send_email`) REFERENCES `members` (`email`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `musics`
--

DROP TABLE IF EXISTS `musics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `musics` (
  `email` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `num` int(11) NOT NULL AUTO_INCREMENT,
  `music_title` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `album` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` datetime DEFAULT CURRENT_TIMESTAMP,
  `music_file` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `genre` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cnt` int(10) DEFAULT '0',
  `good` int(10) DEFAULT '0',
  `content` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`num`),
  KEY `mu_em_fk` (`email`),
  CONSTRAINT `mu_em_fk` FOREIGN KEY (`email`) REFERENCES `members` (`email`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `musics`
--

LOCK TABLES `musics` WRITE;
/*!40000 ALTER TABLE `musics` DISABLE KEYS */;
/*!40000 ALTER TABLE `musics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paid_streamer`
--

DROP TABLE IF EXISTS `paid_streamer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paid_streamer` (
  `email` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `start_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `end_date` datetime DEFAULT NULL,
  PRIMARY KEY (`email`),
  CONSTRAINT `ps_em_fk` FOREIGN KEY (`email`) REFERENCES `streamer` (`email`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paid_streamer`
--

LOCK TABLES `paid_streamer` WRITE;
/*!40000 ALTER TABLE `paid_streamer` DISABLE KEYS */;
/*!40000 ALTER TABLE `paid_streamer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlist`
--

DROP TABLE IF EXISTS `playlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `playlist` (
  `num` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` datetime DEFAULT CURRENT_TIMESTAMP,
  `mu_num` int(11) DEFAULT NULL,
  PRIMARY KEY (`num`),
  KEY `pl_em_fk` (`email`),
  KEY `pl_mn_fk` (`mu_num`),
  CONSTRAINT `pl_em_fk` FOREIGN KEY (`email`) REFERENCES `members` (`email`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pl_mn_fk` FOREIGN KEY (`mu_num`) REFERENCES `musics` (`num`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlist`
--

LOCK TABLES `playlist` WRITE;
/*!40000 ALTER TABLE `playlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `playlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reason`
--

DROP TABLE IF EXISTS `reason`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reason` (
  `num` int(11) NOT NULL AUTO_INCREMENT,
  `cause` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reason`
--

LOCK TABLES `reason` WRITE;
/*!40000 ALTER TABLE `reason` DISABLE KEYS */;
/*!40000 ALTER TABLE `reason` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sponsor`
--

DROP TABLE IF EXISTS `sponsor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sponsor` (
  `num` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `streamer` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `cost` int(10) NOT NULL,
  `date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`num`),
  KEY `sp_em_pk` (`streamer`),
  CONSTRAINT `sp_em_pk` FOREIGN KEY (`streamer`) REFERENCES `streamer` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sponsor`
--

LOCK TABLES `sponsor` WRITE;
/*!40000 ALTER TABLE `sponsor` DISABLE KEYS */;
/*!40000 ALTER TABLE `sponsor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `streamer`
--

DROP TABLE IF EXISTS `streamer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `streamer` (
  `email` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `music_cnt` int(10) NOT NULL,
  `com_cnt` int(10) DEFAULT NULL,
  `point` int(11) DEFAULT NULL,
  PRIMARY KEY (`email`),
  CONSTRAINT `st_em_fk` FOREIGN KEY (`email`) REFERENCES `members` (`email`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `streamer`
--

LOCK TABLES `streamer` WRITE;
/*!40000 ALTER TABLE `streamer` DISABLE KEYS */;
/*!40000 ALTER TABLE `streamer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userlike`
--

DROP TABLE IF EXISTS `userlike`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userlike` (
  `email` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `genre` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`email`),
  CONSTRAINT `ul_em_fk` FOREIGN KEY (`email`) REFERENCES `members` (`email`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userlike`
--

LOCK TABLES `userlike` WRITE;
/*!40000 ALTER TABLE `userlike` DISABLE KEYS */;
/*!40000 ALTER TABLE `userlike` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `warning`
--

DROP TABLE IF EXISTS `warning`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `warning` (
  `num` int(11) NOT NULL AUTO_INCREMENT,
  `warn_email` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` datetime DEFAULT CURRENT_TIMESTAMP,
  `cause` int(11) DEFAULT NULL,
  PRIMARY KEY (`num`),
  KEY `wn_we_fk` (`warn_email`),
  KEY `wn_ca_fk` (`cause`),
  CONSTRAINT `wn_ca_fk` FOREIGN KEY (`cause`) REFERENCES `reason` (`num`),
  CONSTRAINT `wn_we_fk` FOREIGN KEY (`warn_email`) REFERENCES `members` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warning`
--

LOCK TABLES `warning` WRITE;
/*!40000 ALTER TABLE `warning` DISABLE KEYS */;
/*!40000 ALTER TABLE `warning` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-08-07 11:32:25
