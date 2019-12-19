-- MySQL dump 10.13  Distrib 8.0.18, for macos10.14 (x86_64)
--
-- Host: 127.0.0.1    Database: alcpt2
-- ------------------------------------------------------
-- Server version	8.0.18

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
-- Table structure for table `alcpt_answer`
--

DROP TABLE IF EXISTS `alcpt_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alcpt_answer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `selected` smallint(6) NOT NULL,
  `answer_sheet_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `alcpt_answer_answer_sheet_id_c4fe1234_fk_alcpt_answersheet_id` (`answer_sheet_id`),
  KEY `alcpt_answer_question_id_af4ab1ab_fk_alcpt_question_id` (`question_id`),
  CONSTRAINT `alcpt_answer_answer_sheet_id_c4fe1234_fk_alcpt_answersheet_id` FOREIGN KEY (`answer_sheet_id`) REFERENCES `alcpt_answersheet` (`id`),
  CONSTRAINT `alcpt_answer_question_id_af4ab1ab_fk_alcpt_question_id` FOREIGN KEY (`question_id`) REFERENCES `alcpt_question` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alcpt_answer`
--

LOCK TABLES `alcpt_answer` WRITE;
/*!40000 ALTER TABLE `alcpt_answer` DISABLE KEYS */;
INSERT INTO `alcpt_answer` VALUES (2,1,3,46),(3,2,3,30),(4,3,3,44),(5,1,3,45),(6,2,3,5),(7,1,3,43),(8,3,3,41),(9,1,3,1),(10,2,3,48),(11,4,3,47),(12,2,4,3),(13,2,4,2),(14,3,4,23),(15,1,4,6),(16,4,5,35),(17,2,5,44),(18,1,5,40),(19,1,5,32),(20,4,5,5),(21,4,5,34),(22,1,5,37),(23,3,5,33),(24,1,5,48),(25,2,5,47),(26,4,6,35),(27,2,6,44),(28,2,6,45),(29,4,6,29),(30,2,6,43),(31,3,6,41),(32,2,6,34),(33,1,6,42),(34,2,6,48),(35,3,6,47);
/*!40000 ALTER TABLE `alcpt_answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alcpt_answersheet`
--

DROP TABLE IF EXISTS `alcpt_answersheet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alcpt_answersheet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `finish_time` datetime(6) NOT NULL,
  `is_finished` tinyint(1) NOT NULL,
  `score` smallint(5) unsigned DEFAULT NULL,
  `exam_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `alcpt_answersheet_exam_id_147bc9a1_fk_alcpt_exam_id` (`exam_id`),
  KEY `alcpt_answersheet_user_id_8e290a44_fk_alcpt_student_id` (`user_id`),
  CONSTRAINT `alcpt_answersheet_exam_id_147bc9a1_fk_alcpt_exam_id` FOREIGN KEY (`exam_id`) REFERENCES `alcpt_exam` (`id`),
  CONSTRAINT `alcpt_answersheet_user_id_8e290a44_fk_alcpt_student_id` FOREIGN KEY (`user_id`) REFERENCES `alcpt_student` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alcpt_answersheet`
--

LOCK TABLES `alcpt_answersheet` WRITE;
/*!40000 ALTER TABLE `alcpt_answersheet` DISABLE KEYS */;
INSERT INTO `alcpt_answersheet` VALUES (3,'2019-12-19 08:08:49.682437',1,30,10,1),(4,'2019-12-19 12:53:43.225769',1,100,11,1),(5,'2019-12-19 13:00:32.849824',1,70,12,1),(6,'2019-12-19 13:02:52.619729',1,60,13,1);
/*!40000 ALTER TABLE `alcpt_answersheet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alcpt_choice`
--

DROP TABLE IF EXISTS `alcpt_choice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alcpt_choice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `c_content` varchar(255) NOT NULL,
  `is_answer` tinyint(1) NOT NULL,
  `question_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `alcpt_choice_question_id_cdc3736d_fk_alcpt_question_id` (`question_id`),
  CONSTRAINT `alcpt_choice_question_id_cdc3736d_fk_alcpt_question_id` FOREIGN KEY (`question_id`) REFERENCES `alcpt_question` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=169 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alcpt_choice`
--

LOCK TABLES `alcpt_choice` WRITE;
/*!40000 ALTER TABLE `alcpt_choice` DISABLE KEYS */;
INSERT INTO `alcpt_choice` VALUES (1,'officer',0,1),(2,'officers',0,1),(3,'a officer',0,1),(4,'an officer',1,1),(5,'ICBM',0,2),(6,'IRBM',1,2),(7,'MRBM',0,2),(8,'SRBM',0,2),(9,'machine gun',0,3),(10,'pistol',1,3),(11,'grenade',0,3),(12,'tank',0,3),(17,'wear',0,5),(18,'had worn',1,5),(19,'wears',0,5),(20,'wearing',0,5),(21,'infantrymen',1,6),(22,'artillerymen',0,6),(23,'paratrooper',0,6),(24,'scout',0,6),(65,'Urban Operations',0,23),(66,'Engineers',0,23),(67,'engagement',1,23),(68,'Armor',0,23),(85,'1',0,28),(86,'2',1,28),(87,'3',0,28),(88,'4',0,28),(89,'that',0,29),(90,'and',0,29),(91,'but',0,29),(92,'because',1,29),(93,'during',0,30),(94,'since',0,30),(95,'between',0,30),(96,'for',1,30),(97,'likes',0,31),(98,'like',1,31),(99,'are like',0,31),(100,'were alike',0,31),(101,'see',1,32),(102,'sees',0,32),(103,'saw',0,32),(104,'had seen',0,32),(105,'listen to',0,33),(106,'listens by',0,33),(107,'to listen',0,33),(108,'listening to',1,33),(109,'if',0,34),(110,'unless',0,34),(111,'that',0,34),(112,'so',1,34),(113,'May',0,35),(114,'Could',0,35),(115,'If',0,35),(116,'Would',1,35),(117,'did',0,36),(118,'had to',0,36),(119,'ought to',1,36),(120,'would',0,36),(121,'for',1,37),(122,'since',0,37),(123,'during',0,37),(124,'until',0,37),(133,'couldn\'t see very far',1,40),(134,'didn\'t have much money',0,40),(135,'was sick',0,40),(136,'made a bad grade',0,40),(137,'last',0,41),(138,'lowest',0,41),(139,'first',1,41),(140,'slower',0,41),(141,'What',0,42),(142,'It',1,42),(143,'She',0,42),(144,'He',0,42),(145,'for downtown',0,43),(146,'downtown',1,43),(147,'at downtown',0,43),(148,'into downtown',0,43),(149,'good',0,44),(150,'better',1,44),(151,'nice',0,44),(152,'best',0,44),(153,'consider',0,45),(154,'considering',1,45),(155,'considered',0,45),(156,'considers',0,45),(157,'Will use',0,46),(158,'Use',0,46),(159,'To use',1,46),(160,'Using',0,46),(161,'at',0,47),(162,'for',0,47),(163,'during',0,47),(164,'with',1,47),(165,'have',1,48),(166,'had',0,48),(167,'has',0,48),(168,'having',0,48);
/*!40000 ALTER TABLE `alcpt_choice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alcpt_department`
--

DROP TABLE IF EXISTS `alcpt_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alcpt_department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alcpt_department`
--

LOCK TABLES `alcpt_department` WRITE;
/*!40000 ALTER TABLE `alcpt_department` DISABLE KEYS */;
INSERT INTO `alcpt_department` VALUES (1,'法律系'),(4,'財管系'),(5,'資工系'),(2,'資管系'),(3,'運籌系');
/*!40000 ALTER TABLE `alcpt_department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alcpt_exam`
--

DROP TABLE IF EXISTS `alcpt_exam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alcpt_exam` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `exam_type` smallint(5) unsigned NOT NULL,
  `use_freq` int(11) NOT NULL,
  `modified_times` int(11) NOT NULL,
  `start_time` datetime(6) DEFAULT NULL,
  `created_time` datetime(6) NOT NULL,
  `duration` smallint(5) unsigned NOT NULL,
  `finish_time` datetime(6) DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL,
  `created_by_id` int(11) NOT NULL,
  `group_id` int(11) DEFAULT NULL,
  `testpaper_id` int(11) DEFAULT NULL,
  `average_score` double NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `alcpt_exam_created_by_id_3e8088e6_fk_alcpt_user_id` (`created_by_id`),
  KEY `alcpt_exam_group_id_6d1403ce_fk_alcpt_group_id` (`group_id`),
  KEY `alcpt_exam_testpaper_id_6048fb92_fk_alcpt_testpaper_id` (`testpaper_id`),
  CONSTRAINT `alcpt_exam_created_by_id_3e8088e6_fk_alcpt_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `alcpt_user` (`id`),
  CONSTRAINT `alcpt_exam_group_id_6d1403ce_fk_alcpt_group_id` FOREIGN KEY (`group_id`) REFERENCES `alcpt_group` (`id`),
  CONSTRAINT `alcpt_exam_testpaper_id_6048fb92_fk_alcpt_testpaper_id` FOREIGN KEY (`testpaper_id`) REFERENCES `alcpt_testpaper` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alcpt_exam`
--

LOCK TABLES `alcpt_exam` WRITE;
/*!40000 ALTER TABLE `alcpt_exam` DISABLE KEYS */;
INSERT INTO `alcpt_exam` VALUES (10,'閱讀練習-practice-1090630218-2019-12-19 11:11:16.584208',4,0,0,NULL,'2019-12-19 03:11:16.629833',0,NULL,0,1,NULL,10,30),(11,'閱讀練習-practice-1090630218-2019-12-19 19:08:47.418520',4,0,0,NULL,'2019-12-19 11:08:47.441227',0,NULL,0,1,NULL,11,100),(12,'閱讀練習-practice-1090630218-2019-12-19 20:58:00.977096',4,0,0,NULL,'2019-12-19 12:58:01.021252',0,NULL,0,1,NULL,12,70),(13,'閱讀練習-practice-1090630218-2019-12-19 21:00:03.583008',4,0,0,NULL,'2019-12-19 13:00:03.627403',0,NULL,0,1,NULL,13,60);
/*!40000 ALTER TABLE `alcpt_exam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alcpt_group`
--

DROP TABLE IF EXISTS `alcpt_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alcpt_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `created_by_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `alcpt_group_created_by_id_f15e6b32_fk_alcpt_user_id` (`created_by_id`),
  CONSTRAINT `alcpt_group_created_by_id_f15e6b32_fk_alcpt_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `alcpt_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alcpt_group`
--

LOCK TABLES `alcpt_group` WRITE;
/*!40000 ALTER TABLE `alcpt_group` DISABLE KEYS */;
INSERT INTO `alcpt_group` VALUES (1,'109','2019-05-19 20:07:54.047000','2019-05-19 20:07:54.033000',1);
/*!40000 ALTER TABLE `alcpt_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alcpt_group_member`
--

DROP TABLE IF EXISTS `alcpt_group_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alcpt_group_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `alcpt_group_member_group_id_student_id_1f63dedb_uniq` (`group_id`,`student_id`),
  KEY `alcpt_group_member_student_id_14cba179_fk_alcpt_student_id` (`student_id`),
  CONSTRAINT `alcpt_group_member_group_id_b62cbe32_fk_alcpt_group_id` FOREIGN KEY (`group_id`) REFERENCES `alcpt_group` (`id`),
  CONSTRAINT `alcpt_group_member_student_id_14cba179_fk_alcpt_student_id` FOREIGN KEY (`student_id`) REFERENCES `alcpt_student` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alcpt_group_member`
--

LOCK TABLES `alcpt_group_member` WRITE;
/*!40000 ALTER TABLE `alcpt_group_member` DISABLE KEYS */;
/*!40000 ALTER TABLE `alcpt_group_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alcpt_optionlist`
--

DROP TABLE IF EXISTS `alcpt_optionlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alcpt_optionlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `added_time` datetime(6) NOT NULL,
  `answer_id` int(11) NOT NULL,
  `choice_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `alcpt_optionlist_answer_id_a63ecefe_fk_alcpt_answer_id` (`answer_id`),
  KEY `alcpt_optionlist_choice_id_f03826ca_fk_alcpt_choice_id` (`choice_id`),
  CONSTRAINT `alcpt_optionlist_answer_id_a63ecefe_fk_alcpt_answer_id` FOREIGN KEY (`answer_id`) REFERENCES `alcpt_answer` (`id`),
  CONSTRAINT `alcpt_optionlist_choice_id_f03826ca_fk_alcpt_choice_id` FOREIGN KEY (`choice_id`) REFERENCES `alcpt_choice` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alcpt_optionlist`
--

LOCK TABLES `alcpt_optionlist` WRITE;
/*!40000 ALTER TABLE `alcpt_optionlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `alcpt_optionlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alcpt_proclamation`
--

DROP TABLE IF EXISTS `alcpt_proclamation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alcpt_proclamation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` longtext NOT NULL,
  `text` longtext NOT NULL,
  `is_public` tinyint(1) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `created_by_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `alcpt_proclamation_created_by_id_02e079a0_fk_alcpt_user_id` (`created_by_id`),
  CONSTRAINT `alcpt_proclamation_created_by_id_02e079a0_fk_alcpt_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `alcpt_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alcpt_proclamation`
--

LOCK TABLES `alcpt_proclamation` WRITE;
/*!40000 ALTER TABLE `alcpt_proclamation` DISABLE KEYS */;
INSERT INTO `alcpt_proclamation` VALUES (5,'12月份體測','1、12月份體測已公布，各教授班確認好施測時間。\r\n2、所有人務必做好自身暖身，勿有受傷情事。\r\n3、請各位同學務必遵守榮譽信條，勿有謊報成績之情事。',1,'2019-12-15 16:02:43.579695',1);
/*!40000 ALTER TABLE `alcpt_proclamation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alcpt_question`
--

DROP TABLE IF EXISTS `alcpt_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alcpt_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `q_type` smallint(5) unsigned NOT NULL,
  `q_file` longtext,
  `q_content` longtext,
  `difficulty` smallint(5) unsigned NOT NULL,
  `issued_freq` int(11) NOT NULL,
  `correct_freq` int(11) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `is_valid` tinyint(1) NOT NULL,
  `state` smallint(6) NOT NULL,
  `created_by_id` int(11) NOT NULL,
  `last_updated_by_id` int(11) DEFAULT NULL,
  `faulted_reason` varchar(255),
  PRIMARY KEY (`id`),
  KEY `alcpt_question_created_by_id_2c7db757_fk_alcpt_user_id` (`created_by_id`),
  KEY `alcpt_question_last_updated_by_id_7e7caa2c_fk_alcpt_user_id` (`last_updated_by_id`),
  CONSTRAINT `alcpt_question_created_by_id_2c7db757_fk_alcpt_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `alcpt_user` (`id`),
  CONSTRAINT `alcpt_question_last_updated_by_id_7e7caa2c_fk_alcpt_user_id` FOREIGN KEY (`last_updated_by_id`) REFERENCES `alcpt_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alcpt_question`
--

LOCK TABLES `alcpt_question` WRITE;
/*!40000 ALTER TABLE `alcpt_question` DISABLE KEYS */;
INSERT INTO `alcpt_question` VALUES (1,3,NULL,'He is ____ in the military service.',1,0,0,'2019-05-19 16:18:54.592000','2019-12-13 11:47:06.039081',0,1,1,1,NULL),(2,4,NULL,'What kind of missile that distance is from 1000 km to 3000km?',1,0,0,'2019-12-13 12:34:07.004452','2019-12-18 13:15:01.232836',0,1,1,1,''),(3,4,NULL,'Which of the following options matches accuracy, durability, and fitness?',1,0,0,'2019-12-14 06:48:42.496852','2019-12-14 10:04:25.072662',0,1,1,1,''),(5,3,NULL,'If he  ____ his sweater, he wouldn’t have caught a cold.',1,0,0,'2019-12-17 12:03:07.417097','2019-12-18 15:42:02.604089',0,1,1,1,''),(6,4,NULL,'\"Victory is still measured by foot.\" is a common saying in the Indian Army.\r\nThis means that, while many types of units fight in a war, it is the __________ who ultimately win or lose wars.',1,0,0,'2019-12-17 14:22:04.373493','2019-12-18 13:15:04.479447',0,1,1,1,''),(23,4,NULL,'The rule of ______ in UO are often very strict in order to minimize collateral damage.',1,0,0,'2019-12-18 13:19:04.544839','2019-12-18 13:22:51.832546',0,1,1,1,''),(28,1,'/media/question_28',NULL,1,0,0,'2019-12-18 16:30:52.424219','2019-12-18 16:35:38.741953',0,1,1,1,'鄧紫棋太正'),(29,3,NULL,'I can\'t go with you ______ I\'m busy.',1,0,0,'2019-12-18 12:24:40.346544','2019-12-18 15:42:05.833057',0,1,1,1,''),(30,3,NULL,'They have been waiting for me ______ 5 o\'clock.',1,0,0,'2019-12-18 12:26:59.413803','2019-12-18 15:41:45.476830',0,1,1,1,''),(31,3,NULL,'Most people ______ to red newspapers.',1,0,0,'2019-12-18 12:29:04.000232','2019-12-18 15:41:55.623821',0,1,1,1,''),(32,3,NULL,'John would have called the police if he ____ the accident.',1,0,0,'2019-12-18 12:41:20.098003','2019-12-18 15:41:57.993632',0,1,1,1,''),(33,3,NULL,'He finished _____ his tape.',1,0,0,'2019-12-18 12:44:37.305665','2019-12-18 15:42:19.091650',0,1,1,1,''),(34,3,NULL,'He left the office early ____ he could do some shopping.',1,0,0,'2019-12-18 12:46:07.538020','2019-12-18 15:42:13.810031',0,1,1,1,''),(35,3,NULL,'______ you mind closing the window?',1,0,0,'2019-12-18 12:46:52.892223','2019-12-18 15:41:36.363890',0,1,1,1,''),(36,3,NULL,'You ______ review this lesson before you take the test.',1,0,0,'2019-12-18 12:50:56.110807','2019-12-18 15:41:42.966523',0,1,1,1,''),(37,3,NULL,'He has been studying English _____ four years.',1,0,0,'2019-12-18 12:52:35.977609','2019-12-18 15:42:16.400897',0,1,1,1,''),(40,3,NULL,'The visibility was poor yesterday. I _______.',1,0,0,'2019-12-18 13:09:06.167496','2019-12-18 15:41:51.914290',0,1,1,1,''),(41,3,NULL,'Howard finished ________ because he was the fastest.',1,0,0,'2019-12-18 13:11:47.679947','2019-12-18 15:42:11.037096',0,1,1,1,''),(42,3,NULL,'Get the red book. _______ is on the shelf.',1,0,0,'2019-12-18 13:14:11.897504','2019-12-18 15:42:21.790703',0,1,1,1,''),(43,3,NULL,'I am going _______ to buy a new car.',1,0,0,'2019-12-18 13:15:43.150014','2019-12-18 15:42:08.479255',0,1,1,1,''),(44,3,NULL,'The weather is ______ today than it was last night.',1,0,0,'2019-12-18 13:16:38.833223','2019-12-18 15:41:48.012049',0,1,1,1,''),(45,3,NULL,'In the U.S., conversation is _______ proper during meals.',1,0,0,'2019-12-18 13:34:36.708340','2019-12-18 15:42:00.439067',0,1,1,1,''),(46,3,NULL,'______ spears for weapons, the men hunted wild animals.',1,0,0,'2019-12-18 13:38:41.449990','2019-12-18 15:41:40.099520',0,1,1,1,''),(47,3,NULL,'Aircraft pilots communicate ______ control towers.',1,0,0,'2019-12-18 13:39:49.363301','2019-12-18 15:42:28.320508',0,1,1,1,''),(48,3,NULL,'Did the students ______ a lot of homework last night?',1,0,0,'2019-12-18 13:40:48.026545','2019-12-18 15:42:25.171126',0,1,1,1,'');
/*!40000 ALTER TABLE `alcpt_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alcpt_question_used_to`
--

DROP TABLE IF EXISTS `alcpt_question_used_to`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alcpt_question_used_to` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) NOT NULL,
  `testpaper_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `alcpt_question_used_to_question_id_testpaper_id_b10ac272_uniq` (`question_id`,`testpaper_id`),
  KEY `alcpt_question_used__testpaper_id_0baa5adc_fk_alcpt_tes` (`testpaper_id`),
  CONSTRAINT `alcpt_question_used__testpaper_id_0baa5adc_fk_alcpt_tes` FOREIGN KEY (`testpaper_id`) REFERENCES `alcpt_testpaper` (`id`),
  CONSTRAINT `alcpt_question_used_to_question_id_b6cbbeef_fk_alcpt_question_id` FOREIGN KEY (`question_id`) REFERENCES `alcpt_question` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alcpt_question_used_to`
--

LOCK TABLES `alcpt_question_used_to` WRITE;
/*!40000 ALTER TABLE `alcpt_question_used_to` DISABLE KEYS */;
INSERT INTO `alcpt_question_used_to` VALUES (76,1,10),(82,2,11),(84,3,11),(77,5,10),(93,5,12),(83,6,11),(81,23,11),(98,29,13),(78,30,10),(88,32,12),(94,33,12),(90,34,12),(99,34,13),(91,35,12),(97,35,13),(92,37,12),(86,40,12),(71,41,10),(102,41,13),(103,42,13),(72,43,10),(100,43,13),(73,44,10),(87,44,12),(96,44,13),(74,45,10),(101,45,13),(79,46,10),(75,47,10),(85,47,12),(104,47,13),(80,48,10),(89,48,12),(95,48,13);
/*!40000 ALTER TABLE `alcpt_question_used_to` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alcpt_squadron`
--

DROP TABLE IF EXISTS `alcpt_squadron`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alcpt_squadron` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alcpt_squadron`
--

LOCK TABLES `alcpt_squadron` WRITE;
/*!40000 ALTER TABLE `alcpt_squadron` DISABLE KEYS */;
INSERT INTO `alcpt_squadron` VALUES (1,'學生一中隊'),(3,'學生三中隊'),(2,'學生二中隊'),(4,'學生四中隊');
/*!40000 ALTER TABLE `alcpt_squadron` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alcpt_student`
--

DROP TABLE IF EXISTS `alcpt_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alcpt_student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stu_id` varchar(10) NOT NULL,
  `grade` smallint(5) unsigned NOT NULL,
  `department_id` int(11) DEFAULT NULL,
  `squadron_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `stu_id` (`stu_id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `alcpt_student_department_id_257bfbd3_fk_alcpt_department_id` (`department_id`),
  KEY `alcpt_student_squadron_id_4bbcc05a_fk_alcpt_squadron_id` (`squadron_id`),
  CONSTRAINT `alcpt_student_department_id_257bfbd3_fk_alcpt_department_id` FOREIGN KEY (`department_id`) REFERENCES `alcpt_department` (`id`),
  CONSTRAINT `alcpt_student_squadron_id_4bbcc05a_fk_alcpt_squadron_id` FOREIGN KEY (`squadron_id`) REFERENCES `alcpt_squadron` (`id`),
  CONSTRAINT `alcpt_student_user_id_c43c5a79_fk_alcpt_user_id` FOREIGN KEY (`user_id`) REFERENCES `alcpt_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alcpt_student`
--

LOCK TABLES `alcpt_student` WRITE;
/*!40000 ALTER TABLE `alcpt_student` DISABLE KEYS */;
INSERT INTO `alcpt_student` VALUES (1,'1090630218',109,2,3,1),(4,'1090630201',108,NULL,NULL,12),(5,'1090630202',108,NULL,NULL,13);
/*!40000 ALTER TABLE `alcpt_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alcpt_testpaper`
--

DROP TABLE IF EXISTS `alcpt_testpaper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alcpt_testpaper` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `is_testpaper` tinyint(1) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `valid` tinyint(1) NOT NULL,
  `created_by_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `alcpt_testpaper_created_by_id_def16d7a_fk_alcpt_user_id` (`created_by_id`),
  CONSTRAINT `alcpt_testpaper_created_by_id_def16d7a_fk_alcpt_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `alcpt_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alcpt_testpaper`
--

LOCK TABLES `alcpt_testpaper` WRITE;
/*!40000 ALTER TABLE `alcpt_testpaper` DISABLE KEYS */;
INSERT INTO `alcpt_testpaper` VALUES (10,'閱讀練習-practice-1090630218-2019-12-19 11:11:16.584208','2019-12-19 03:11:16.591815',0,'2019-12-19 03:11:16.591862',0,1),(11,'閱讀練習-practice-1090630218-2019-12-19 19:08:47.418520','2019-12-19 11:08:47.426459',0,'2019-12-19 11:08:47.426507',0,1),(12,'閱讀練習-practice-1090630218-2019-12-19 20:58:00.977096','2019-12-19 12:58:00.984450',0,'2019-12-19 12:58:00.984508',0,1),(13,'閱讀練習-practice-1090630218-2019-12-19 21:00:03.583008','2019-12-19 13:00:03.590973',0,'2019-12-19 13:00:03.591020',0,1);
/*!40000 ALTER TABLE `alcpt_testpaper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alcpt_user`
--

DROP TABLE IF EXISTS `alcpt_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alcpt_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `reg_id` varchar(50) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `gender` smallint(5) unsigned DEFAULT NULL,
  `privilege` smallint(5) unsigned NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `reg_id` (`reg_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alcpt_user`
--

LOCK TABLES `alcpt_user` WRITE;
/*!40000 ALTER TABLE `alcpt_user` DISABLE KEYS */;
INSERT INTO `alcpt_user` VALUES (1,'pbkdf2_sha256$36000$4zEHqf8SAJFQ$OKTlAhNLNfeYxlM107ZYk9LDhOy+SsndWBQx5N2QwBY=','2019-12-19 09:45:30.750649','1090630218','蘇典煒',0,63,'2019-10-15 12:44:32.551000','2019-11-13 12:05:08.798616'),(2,'pbkdf2_sha256$36000$yoX8FUYBKEBE$0SpUdzLVt1A+ipbOutYamo03sVbKui4P3YelCIlialU=','2019-05-19 20:08:08.429000','mcndu01','教師',0,27,'2019-05-19 18:41:47.152000','2019-05-19 18:42:18.440000'),(12,'pbkdf2_sha256$36000$7EVGxGb00JYI$kJtP5tBX8El7tULJCwzM3qpevI1BPHRbREAbbCFu78s=',NULL,'1090630201',NULL,NULL,1,'2019-12-16 13:22:40.739726','2019-12-16 13:22:40.739759'),(13,'pbkdf2_sha256$36000$BxXsKtylZDp3$foYRyg+hDEON6Id81qT7QrlAvUaMj72NhlllFK1OQ3M=',NULL,'1090630202',NULL,NULL,1,'2019-12-16 13:22:40.739788','2019-12-16 13:22:40.739800'),(14,'pbkdf2_sha256$36000$nRWB1MwQSFDm$FuzO9v3Wvt3xxPIgM6Xr/vZUuffCrR2UuY3nTmmjlVA=',NULL,'mcndu0001',NULL,NULL,26,'2019-12-16 13:42:44.546743','2019-12-16 13:42:44.559293');
/*!40000 ALTER TABLE `alcpt_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audio_file`
--

DROP TABLE IF EXISTS `audio_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audio_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `audio_file` varchar(100) NOT NULL,
  `created_date` datetime(6) NOT NULL,
  `updated_date` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `audio_file_user_id_ada556f9_fk_alcpt_user_id` (`user_id`),
  CONSTRAINT `audio_file_user_id_ada556f9_fk_alcpt_user_id` FOREIGN KEY (`user_id`) REFERENCES `alcpt_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audio_file`
--

LOCK TABLES `audio_file` WRITE;
/*!40000 ALTER TABLE `audio_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `audio_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add answer',7,'add_answer'),(20,'Can change answer',7,'change_answer'),(21,'Can delete answer',7,'delete_answer'),(22,'Can add answer sheet',8,'add_answersheet'),(23,'Can change answer sheet',8,'change_answersheet'),(24,'Can delete answer sheet',8,'delete_answersheet'),(25,'Can add choice',9,'add_choice'),(26,'Can change choice',9,'change_choice'),(27,'Can delete choice',9,'delete_choice'),(28,'Can add department',10,'add_department'),(29,'Can change department',10,'change_department'),(30,'Can delete department',10,'delete_department'),(31,'Can add exam',11,'add_exam'),(32,'Can change exam',11,'change_exam'),(33,'Can delete exam',11,'delete_exam'),(34,'Can add group',12,'add_group'),(35,'Can change group',12,'change_group'),(36,'Can delete group',12,'delete_group'),(37,'Can add proclamation',13,'add_proclamation'),(38,'Can change proclamation',13,'change_proclamation'),(39,'Can delete proclamation',13,'delete_proclamation'),(40,'Can add question',14,'add_question'),(41,'Can change question',14,'change_question'),(42,'Can delete question',14,'delete_question'),(43,'Can add squadron',15,'add_squadron'),(44,'Can change squadron',15,'change_squadron'),(45,'Can delete squadron',15,'delete_squadron'),(46,'Can add student',16,'add_student'),(47,'Can change student',16,'change_student'),(48,'Can delete student',16,'delete_student'),(49,'Can add test paper',17,'add_testpaper'),(50,'Can change test paper',17,'change_testpaper'),(51,'Can delete test paper',17,'delete_testpaper'),(52,'Can add user',18,'add_user'),(53,'Can change user',18,'change_user'),(54,'Can delete user',18,'delete_user'),(55,'Can add option list',19,'add_optionlist'),(56,'Can change option list',19,'change_optionlist'),(57,'Can delete option list',19,'delete_optionlist'),(58,'Can add audio file',20,'add_audiofile'),(59,'Can change audio file',20,'change_audiofile'),(60,'Can delete audio file',20,'delete_audiofile'),(61,'can see Audio Files',20,'view_audiofile');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$36000$NR3ItP0hMf3C$gpm4p9l5r6Y+20rzeD4lte1tOsuN9nQPgPNgooeQJsY=','2019-12-18 08:11:02.232747',1,'d.wsu','','','wei860925@gmail.com',1,1,'2019-12-18 08:10:55.194024');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(7,'alcpt','answer'),(8,'alcpt','answersheet'),(9,'alcpt','choice'),(10,'alcpt','department'),(11,'alcpt','exam'),(12,'alcpt','group'),(19,'alcpt','optionlist'),(13,'alcpt','proclamation'),(14,'alcpt','question'),(15,'alcpt','squadron'),(16,'alcpt','student'),(17,'alcpt','testpaper'),(18,'alcpt','user'),(20,'audiofield','audiofile'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2019-12-11 06:45:06.093900'),(2,'auth','0001_initial','2019-12-11 06:45:06.386045'),(3,'admin','0001_initial','2019-12-11 06:45:06.469952'),(4,'admin','0002_logentry_remove_auto_add','2019-12-11 06:45:06.493655'),(5,'alcpt','0001_initial','2019-12-11 06:45:07.580557'),(6,'contenttypes','0002_remove_content_type_name','2019-12-11 06:45:07.656881'),(7,'auth','0002_alter_permission_name_max_length','2019-12-11 06:45:07.693015'),(8,'auth','0003_alter_user_email_max_length','2019-12-11 06:45:07.730940'),(9,'auth','0004_alter_user_username_opts','2019-12-11 06:45:07.753866'),(10,'auth','0005_alter_user_last_login_null','2019-12-11 06:45:07.791635'),(11,'auth','0006_require_contenttypes_0002','2019-12-11 06:45:07.794423'),(12,'auth','0007_alter_validators_add_error_messages','2019-12-11 06:45:07.812398'),(13,'auth','0008_alter_user_username_max_length','2019-12-11 06:45:07.852193'),(14,'sessions','0001_initial','2019-12-11 06:45:07.876841'),(15,'alcpt','0002_auto_20191211_1515','2019-12-11 07:15:28.993398'),(16,'alcpt','0003_auto_20191213_1715','2019-12-13 09:15:13.751913'),(17,'alcpt','0002_exam_total_score','2019-12-16 23:48:36.954443'),(18,'alcpt','0002_exam_average_score','2019-12-17 14:43:52.199762'),(19,'audiofield','0001_initial','2019-12-18 12:47:40.669675'),(20,'audiofield','0002_auto_20180121_0750','2019-12-18 12:47:40.687705'),(21,'alcpt','0003_auto_20191218_1541','2019-12-18 15:41:45.384870'),(22,'alcpt','0004_auto_20191219_1608','2019-12-19 08:08:41.653631');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('0veeoeji3wb2nfuc6qe9oqmgq8mz2aw3','YWFiNTRjNjE4NjI0MGY2NjAzZDY5ZTk2MzE0NWUzZmRkMzFjOGQ2Nzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5MzBkNWM3NzA3NTYzYjkzNzc3MmIzYTk1MjIwOWU1NTY1Y2E5ZmNiIn0=','2019-12-29 04:00:07.817450'),('3arwht0j8v0qs7s2cqgkyfwg9m7x0ks7','YWFiNTRjNjE4NjI0MGY2NjAzZDY5ZTk2MzE0NWUzZmRkMzFjOGQ2Nzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5MzBkNWM3NzA3NTYzYjkzNzc3MmIzYTk1MjIwOWU1NTY1Y2E5ZmNiIn0=','2019-12-25 13:30:13.580620'),('4i9xub4ez2yah5ei9wnfgywqk6p6pnqn','YWFiNTRjNjE4NjI0MGY2NjAzZDY5ZTk2MzE0NWUzZmRkMzFjOGQ2Nzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5MzBkNWM3NzA3NTYzYjkzNzc3MmIzYTk1MjIwOWU1NTY1Y2E5ZmNiIn0=','2019-12-29 04:02:51.062693'),('5r8zdvtgcwm7owy47k90c7ac0n44k9nn','YWFiNTRjNjE4NjI0MGY2NjAzZDY5ZTk2MzE0NWUzZmRkMzFjOGQ2Nzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5MzBkNWM3NzA3NTYzYjkzNzc3MmIzYTk1MjIwOWU1NTY1Y2E5ZmNiIn0=','2019-12-25 23:42:41.863050'),('5x42pyn4akdhn50m4c8bypn3e583x254','YWFiNTRjNjE4NjI0MGY2NjAzZDY5ZTk2MzE0NWUzZmRkMzFjOGQ2Nzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5MzBkNWM3NzA3NTYzYjkzNzc3MmIzYTk1MjIwOWU1NTY1Y2E5ZmNiIn0=','2019-12-27 03:55:48.773107'),('6t66gm6pkv2ut582fgvjh8qxm84m3yoa','YWFiNTRjNjE4NjI0MGY2NjAzZDY5ZTk2MzE0NWUzZmRkMzFjOGQ2Nzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5MzBkNWM3NzA3NTYzYjkzNzc3MmIzYTk1MjIwOWU1NTY1Y2E5ZmNiIn0=','2019-12-30 12:31:42.054066'),('70im5puoo9q1ug2tz63h0gm9khkoxxxp','YWFiNTRjNjE4NjI0MGY2NjAzZDY5ZTk2MzE0NWUzZmRkMzFjOGQ2Nzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5MzBkNWM3NzA3NTYzYjkzNzc3MmIzYTk1MjIwOWU1NTY1Y2E5ZmNiIn0=','2019-12-27 07:49:34.063181'),('8nsgozlc40m8hb520qf1s0sptk3mnb02','YWFiNTRjNjE4NjI0MGY2NjAzZDY5ZTk2MzE0NWUzZmRkMzFjOGQ2Nzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5MzBkNWM3NzA3NTYzYjkzNzc3MmIzYTk1MjIwOWU1NTY1Y2E5ZmNiIn0=','2019-12-25 13:03:30.343816'),('8va3pu44hiazp3aptza48ngkksyt5drt','YWFiNTRjNjE4NjI0MGY2NjAzZDY5ZTk2MzE0NWUzZmRkMzFjOGQ2Nzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5MzBkNWM3NzA3NTYzYjkzNzc3MmIzYTk1MjIwOWU1NTY1Y2E5ZmNiIn0=','2019-12-27 09:05:21.239909'),('9i0sscl0wrcjmpgwzii7peum2ewanih9','YWFiNTRjNjE4NjI0MGY2NjAzZDY5ZTk2MzE0NWUzZmRkMzFjOGQ2Nzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5MzBkNWM3NzA3NTYzYjkzNzc3MmIzYTk1MjIwOWU1NTY1Y2E5ZmNiIn0=','2019-12-30 07:41:16.558036'),('9ib1668m2oydtis2dzvg0av043sjkosf','YWFiNTRjNjE4NjI0MGY2NjAzZDY5ZTk2MzE0NWUzZmRkMzFjOGQ2Nzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5MzBkNWM3NzA3NTYzYjkzNzc3MmIzYTk1MjIwOWU1NTY1Y2E5ZmNiIn0=','2019-12-27 09:18:26.510459'),('a3a6a4nayglc9x65rnwuy74rb930pv8e','YWFiNTRjNjE4NjI0MGY2NjAzZDY5ZTk2MzE0NWUzZmRkMzFjOGQ2Nzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5MzBkNWM3NzA3NTYzYjkzNzc3MmIzYTk1MjIwOWU1NTY1Y2E5ZmNiIn0=','2019-12-26 06:52:50.816391'),('askluw19rj93wutaf2ht3sfdk26adlrz','YWFiNTRjNjE4NjI0MGY2NjAzZDY5ZTk2MzE0NWUzZmRkMzFjOGQ2Nzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5MzBkNWM3NzA3NTYzYjkzNzc3MmIzYTk1MjIwOWU1NTY1Y2E5ZmNiIn0=','2020-01-01 09:43:05.037648'),('awozklgrqpswfpeail11nnvlx54fko7p','YWFiNTRjNjE4NjI0MGY2NjAzZDY5ZTk2MzE0NWUzZmRkMzFjOGQ2Nzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5MzBkNWM3NzA3NTYzYjkzNzc3MmIzYTk1MjIwOWU1NTY1Y2E5ZmNiIn0=','2019-12-27 16:18:15.418631'),('ayz9o0e3rdc4b3a6orjwgz13m0q161fd','YWFiNTRjNjE4NjI0MGY2NjAzZDY5ZTk2MzE0NWUzZmRkMzFjOGQ2Nzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5MzBkNWM3NzA3NTYzYjkzNzc3MmIzYTk1MjIwOWU1NTY1Y2E5ZmNiIn0=','2020-01-01 16:51:53.622254'),('b2pwnuhnp6i515ns9nyqxejryl5vvpbb','YWFiNTRjNjE4NjI0MGY2NjAzZDY5ZTk2MzE0NWUzZmRkMzFjOGQ2Nzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5MzBkNWM3NzA3NTYzYjkzNzc3MmIzYTk1MjIwOWU1NTY1Y2E5ZmNiIn0=','2019-12-27 16:01:37.234928'),('b6mavq95pukmduk7v9cdzgkgmlqmt40o','YWFiNTRjNjE4NjI0MGY2NjAzZDY5ZTk2MzE0NWUzZmRkMzFjOGQ2Nzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5MzBkNWM3NzA3NTYzYjkzNzc3MmIzYTk1MjIwOWU1NTY1Y2E5ZmNiIn0=','2019-12-27 16:09:07.941016'),('df4w13zo0j1sl5khxf2tx7f2v6z39qbu','YWFiNTRjNjE4NjI0MGY2NjAzZDY5ZTk2MzE0NWUzZmRkMzFjOGQ2Nzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5MzBkNWM3NzA3NTYzYjkzNzc3MmIzYTk1MjIwOWU1NTY1Y2E5ZmNiIn0=','2019-12-29 15:45:12.540765'),('ecss2clo5mrcz6umznj74swtk4dht63c','YWFiNTRjNjE4NjI0MGY2NjAzZDY5ZTk2MzE0NWUzZmRkMzFjOGQ2Nzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5MzBkNWM3NzA3NTYzYjkzNzc3MmIzYTk1MjIwOWU1NTY1Y2E5ZmNiIn0=','2019-12-28 06:05:50.043900'),('epe94oagt6sdx7dx2yh4tlqvud7qad5v','YWFiNTRjNjE4NjI0MGY2NjAzZDY5ZTk2MzE0NWUzZmRkMzFjOGQ2Nzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5MzBkNWM3NzA3NTYzYjkzNzc3MmIzYTk1MjIwOWU1NTY1Y2E5ZmNiIn0=','2019-12-27 00:36:11.355384'),('fpfx9ctjnld0anr7gpomfqdilopzzl9n','YWFiNTRjNjE4NjI0MGY2NjAzZDY5ZTk2MzE0NWUzZmRkMzFjOGQ2Nzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5MzBkNWM3NzA3NTYzYjkzNzc3MmIzYTk1MjIwOWU1NTY1Y2E5ZmNiIn0=','2020-01-01 00:14:19.591255'),('hai90iaz8fo3ldjhfzi6jeeio2mis4sf','YWFiNTRjNjE4NjI0MGY2NjAzZDY5ZTk2MzE0NWUzZmRkMzFjOGQ2Nzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5MzBkNWM3NzA3NTYzYjkzNzc3MmIzYTk1MjIwOWU1NTY1Y2E5ZmNiIn0=','2020-01-01 11:39:49.207978'),('hefyq6q6bj479tj9ak2veaeh87fav49h','YWFiNTRjNjE4NjI0MGY2NjAzZDY5ZTk2MzE0NWUzZmRkMzFjOGQ2Nzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5MzBkNWM3NzA3NTYzYjkzNzc3MmIzYTk1MjIwOWU1NTY1Y2E5ZmNiIn0=','2019-12-26 06:59:54.520278'),('ia83pzla8zdf2p4x54qc8nye6u45jq2r','YWFiNTRjNjE4NjI0MGY2NjAzZDY5ZTk2MzE0NWUzZmRkMzFjOGQ2Nzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5MzBkNWM3NzA3NTYzYjkzNzc3MmIzYTk1MjIwOWU1NTY1Y2E5ZmNiIn0=','2019-12-26 07:32:17.685807'),('iu2e1mhr434dmgrrhrch24cqpm9pe3sy','YWFiNTRjNjE4NjI0MGY2NjAzZDY5ZTk2MzE0NWUzZmRkMzFjOGQ2Nzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5MzBkNWM3NzA3NTYzYjkzNzc3MmIzYTk1MjIwOWU1NTY1Y2E5ZmNiIn0=','2019-12-30 05:05:43.889120'),('jhyh2qe53modfleljqmbf5lk13bnbb7h','YWFiNTRjNjE4NjI0MGY2NjAzZDY5ZTk2MzE0NWUzZmRkMzFjOGQ2Nzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5MzBkNWM3NzA3NTYzYjkzNzc3MmIzYTk1MjIwOWU1NTY1Y2E5ZmNiIn0=','2019-12-27 05:46:25.319505'),('lh1rrroa0r4tnfnsvq117i99rv9b8981','YWFiNTRjNjE4NjI0MGY2NjAzZDY5ZTk2MzE0NWUzZmRkMzFjOGQ2Nzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5MzBkNWM3NzA3NTYzYjkzNzc3MmIzYTk1MjIwOWU1NTY1Y2E5ZmNiIn0=','2019-12-26 00:12:48.959859'),('ln6dhjj2te29f9xflszgo99u7sbgj55o','YWFiNTRjNjE4NjI0MGY2NjAzZDY5ZTk2MzE0NWUzZmRkMzFjOGQ2Nzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5MzBkNWM3NzA3NTYzYjkzNzc3MmIzYTk1MjIwOWU1NTY1Y2E5ZmNiIn0=','2019-12-25 14:57:08.825304'),('m7yqla1oc9w0tb414qr5nruf0n3kity5','YWFiNTRjNjE4NjI0MGY2NjAzZDY5ZTk2MzE0NWUzZmRkMzFjOGQ2Nzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5MzBkNWM3NzA3NTYzYjkzNzc3MmIzYTk1MjIwOWU1NTY1Y2E5ZmNiIn0=','2020-01-02 09:45:30.753687'),('na3leiq48g0l5sfvtol10xx3prk83poz','YWFiNTRjNjE4NjI0MGY2NjAzZDY5ZTk2MzE0NWUzZmRkMzFjOGQ2Nzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5MzBkNWM3NzA3NTYzYjkzNzc3MmIzYTk1MjIwOWU1NTY1Y2E5ZmNiIn0=','2019-12-27 07:39:44.767182'),('nepusmzc9te3isbn01dch3w4g4nmcsa8','YWFiNTRjNjE4NjI0MGY2NjAzZDY5ZTk2MzE0NWUzZmRkMzFjOGQ2Nzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5MzBkNWM3NzA3NTYzYjkzNzc3MmIzYTk1MjIwOWU1NTY1Y2E5ZmNiIn0=','2020-01-01 16:30:39.886947'),('pn6t9kviqnthm23dhbmuwdve6o8j4wt1','YWFiNTRjNjE4NjI0MGY2NjAzZDY5ZTk2MzE0NWUzZmRkMzFjOGQ2Nzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5MzBkNWM3NzA3NTYzYjkzNzc3MmIzYTk1MjIwOWU1NTY1Y2E5ZmNiIn0=','2019-12-27 02:57:54.328539'),('pynpainw5v2nfe1o9rjo8n4o9l32qpcr','YWFiNTRjNjE4NjI0MGY2NjAzZDY5ZTk2MzE0NWUzZmRkMzFjOGQ2Nzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5MzBkNWM3NzA3NTYzYjkzNzc3MmIzYTk1MjIwOWU1NTY1Y2E5ZmNiIn0=','2019-12-25 15:18:24.177363'),('q902zu5e1y09jklszy6vr36baprv4s7b','YWFiNTRjNjE4NjI0MGY2NjAzZDY5ZTk2MzE0NWUzZmRkMzFjOGQ2Nzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5MzBkNWM3NzA3NTYzYjkzNzc3MmIzYTk1MjIwOWU1NTY1Y2E5ZmNiIn0=','2019-12-26 06:39:06.200696'),('qjx73fkh69h4z7ko19wd6vwg32u5jo3l','YWFiNTRjNjE4NjI0MGY2NjAzZDY5ZTk2MzE0NWUzZmRkMzFjOGQ2Nzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5MzBkNWM3NzA3NTYzYjkzNzc3MmIzYTk1MjIwOWU1NTY1Y2E5ZmNiIn0=','2020-01-01 15:29:45.587402'),('sf0tmmb5oj2hikvlmnm92tzqqbmgkr2m','YWFiNTRjNjE4NjI0MGY2NjAzZDY5ZTk2MzE0NWUzZmRkMzFjOGQ2Nzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5MzBkNWM3NzA3NTYzYjkzNzc3MmIzYTk1MjIwOWU1NTY1Y2E5ZmNiIn0=','2019-12-30 07:46:32.409752'),('t4jbhqp9yawgxbgus7rlziz6mwthoa1q','YWFiNTRjNjE4NjI0MGY2NjAzZDY5ZTk2MzE0NWUzZmRkMzFjOGQ2Nzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5MzBkNWM3NzA3NTYzYjkzNzc3MmIzYTk1MjIwOWU1NTY1Y2E5ZmNiIn0=','2019-12-27 04:40:52.917480'),('t51q3pan3c14p39sldec0nv6lj4e96uj','YWFiNTRjNjE4NjI0MGY2NjAzZDY5ZTk2MzE0NWUzZmRkMzFjOGQ2Nzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5MzBkNWM3NzA3NTYzYjkzNzc3MmIzYTk1MjIwOWU1NTY1Y2E5ZmNiIn0=','2019-12-27 01:01:16.083843'),('u29or6l9f0r9o8xmvc80152uhd27i2wn','YWFiNTRjNjE4NjI0MGY2NjAzZDY5ZTk2MzE0NWUzZmRkMzFjOGQ2Nzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5MzBkNWM3NzA3NTYzYjkzNzc3MmIzYTk1MjIwOWU1NTY1Y2E5ZmNiIn0=','2019-12-26 10:36:56.565146'),('uer56k0e08wvkclf2j3fcufwetavh1m2','YWFiNTRjNjE4NjI0MGY2NjAzZDY5ZTk2MzE0NWUzZmRkMzFjOGQ2Nzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5MzBkNWM3NzA3NTYzYjkzNzc3MmIzYTk1MjIwOWU1NTY1Y2E5ZmNiIn0=','2020-01-01 16:18:42.962437'),('uwq7a7mh3wtzxscqkgrkeshidzvdz0aa','YWFiNTRjNjE4NjI0MGY2NjAzZDY5ZTk2MzE0NWUzZmRkMzFjOGQ2Nzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5MzBkNWM3NzA3NTYzYjkzNzc3MmIzYTk1MjIwOWU1NTY1Y2E5ZmNiIn0=','2019-12-27 16:08:55.779832'),('v5vbleenm1f0k3nitxza5u95x6vw0zk0','YWFiNTRjNjE4NjI0MGY2NjAzZDY5ZTk2MzE0NWUzZmRkMzFjOGQ2Nzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5MzBkNWM3NzA3NTYzYjkzNzc3MmIzYTk1MjIwOWU1NTY1Y2E5ZmNiIn0=','2019-12-25 15:10:29.676317'),('v7i387yl9x45vgylqaeybft8bwzrw6ve','YWFiNTRjNjE4NjI0MGY2NjAzZDY5ZTk2MzE0NWUzZmRkMzFjOGQ2Nzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5MzBkNWM3NzA3NTYzYjkzNzc3MmIzYTk1MjIwOWU1NTY1Y2E5ZmNiIn0=','2019-12-27 15:48:18.491601'),('vumpp4uwy37ubimm2t23aolojp74v03n','YWFiNTRjNjE4NjI0MGY2NjAzZDY5ZTk2MzE0NWUzZmRkMzFjOGQ2Nzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5MzBkNWM3NzA3NTYzYjkzNzc3MmIzYTk1MjIwOWU1NTY1Y2E5ZmNiIn0=','2019-12-25 23:39:57.936251'),('xcus9ip3yh7ucffym1d0g2hrczvolb9g','YWFiNTRjNjE4NjI0MGY2NjAzZDY5ZTk2MzE0NWUzZmRkMzFjOGQ2Nzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5MzBkNWM3NzA3NTYzYjkzNzc3MmIzYTk1MjIwOWU1NTY1Y2E5ZmNiIn0=','2019-12-26 08:41:28.550917'),('y59b0h25h70moal7wjxqvhjv7ibpcolj','YWFiNTRjNjE4NjI0MGY2NjAzZDY5ZTk2MzE0NWUzZmRkMzFjOGQ2Nzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5MzBkNWM3NzA3NTYzYjkzNzc3MmIzYTk1MjIwOWU1NTY1Y2E5ZmNiIn0=','2019-12-26 02:05:54.531797'),('z01u2t1b0oa858unkpx4587khcdc9cdf','YWFiNTRjNjE4NjI0MGY2NjAzZDY5ZTk2MzE0NWUzZmRkMzFjOGQ2Nzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5MzBkNWM3NzA3NTYzYjkzNzc3MmIzYTk1MjIwOWU1NTY1Y2E5ZmNiIn0=','2019-12-26 09:09:51.560080');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-19 21:08:28
