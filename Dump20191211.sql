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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alcpt_answer`
--

LOCK TABLES `alcpt_answer` WRITE;
/*!40000 ALTER TABLE `alcpt_answer` DISABLE KEYS */;
INSERT INTO `alcpt_answer` VALUES (1,2,1,1);
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
  `score` smallint(5) unsigned NOT NULL,
  `exam_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `alcpt_answersheet_exam_id_147bc9a1_fk_alcpt_exam_id` (`exam_id`),
  KEY `alcpt_answersheet_user_id_8e290a44_fk_alcpt_student_id` (`user_id`),
  CONSTRAINT `alcpt_answersheet_exam_id_147bc9a1_fk_alcpt_exam_id` FOREIGN KEY (`exam_id`) REFERENCES `alcpt_exam` (`id`),
  CONSTRAINT `alcpt_answersheet_user_id_8e290a44_fk_alcpt_student_id` FOREIGN KEY (`user_id`) REFERENCES `alcpt_student` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alcpt_answersheet`
--

LOCK TABLES `alcpt_answersheet` WRITE;
/*!40000 ALTER TABLE `alcpt_answersheet` DISABLE KEYS */;
INSERT INTO `alcpt_answersheet` VALUES (1,'2019-05-19 22:21:43.643000',0,0,7,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alcpt_choice`
--

LOCK TABLES `alcpt_choice` WRITE;
/*!40000 ALTER TABLE `alcpt_choice` DISABLE KEYS */;
INSERT INTO `alcpt_choice` VALUES (1,'officer',0,1),(2,'officers',0,1),(3,'a officer',0,1),(4,'an officer',1,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alcpt_department`
--

LOCK TABLES `alcpt_department` WRITE;
/*!40000 ALTER TABLE `alcpt_department` DISABLE KEYS */;
INSERT INTO `alcpt_department` VALUES (1,'法律系'),(4,'財管系'),(2,'資管系'),(3,'運籌系');
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
  `finish_time` datetime(6) NOT NULL,
  `is_public` tinyint(1) NOT NULL,
  `created_by_id` int(11) NOT NULL,
  `group_id` int(11) DEFAULT NULL,
  `testpaper_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `alcpt_exam_created_by_id_3e8088e6_fk_alcpt_user_id` (`created_by_id`),
  KEY `alcpt_exam_group_id_6d1403ce_fk_alcpt_group_id` (`group_id`),
  KEY `alcpt_exam_testpaper_id_6048fb92_fk_alcpt_testpaper_id` (`testpaper_id`),
  CONSTRAINT `alcpt_exam_created_by_id_3e8088e6_fk_alcpt_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `alcpt_user` (`id`),
  CONSTRAINT `alcpt_exam_group_id_6d1403ce_fk_alcpt_group_id` FOREIGN KEY (`group_id`) REFERENCES `alcpt_group` (`id`),
  CONSTRAINT `alcpt_exam_testpaper_id_6048fb92_fk_alcpt_testpaper_id` FOREIGN KEY (`testpaper_id`) REFERENCES `alcpt_testpaper` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alcpt_exam`
--

LOCK TABLES `alcpt_exam` WRITE;
/*!40000 ALTER TABLE `alcpt_exam` DISABLE KEYS */;
INSERT INTO `alcpt_exam` VALUES (7,'第六次',1,0,0,'2019-11-19 21:49:00.000000','2019-05-19 21:53:29.086000',100,'2019-11-11 06:46:30.942000',0,1,1,1);
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
INSERT INTO `alcpt_optionlist` VALUES (1,'2019-12-11 15:22:32.000001',1,4),(2,'2019-12-11 15:22:32.000002',1,3),(3,'2019-12-11 15:22:32.000003',1,1),(4,'2019-12-11 15:22:32.000004',1,2);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alcpt_proclamation`
--

LOCK TABLES `alcpt_proclamation` WRITE;
/*!40000 ALTER TABLE `alcpt_proclamation` DISABLE KEYS */;
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
  PRIMARY KEY (`id`),
  KEY `alcpt_question_created_by_id_2c7db757_fk_alcpt_user_id` (`created_by_id`),
  KEY `alcpt_question_last_updated_by_id_7e7caa2c_fk_alcpt_user_id` (`last_updated_by_id`),
  CONSTRAINT `alcpt_question_created_by_id_2c7db757_fk_alcpt_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `alcpt_user` (`id`),
  CONSTRAINT `alcpt_question_last_updated_by_id_7e7caa2c_fk_alcpt_user_id` FOREIGN KEY (`last_updated_by_id`) REFERENCES `alcpt_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alcpt_question`
--

LOCK TABLES `alcpt_question` WRITE;
/*!40000 ALTER TABLE `alcpt_question` DISABLE KEYS */;
INSERT INTO `alcpt_question` VALUES (1,4,NULL,'He is ____ in the military service.',1,0,0,'2019-05-19 16:18:54.592000','2019-05-19 16:18:54.592000',0,0,1,1);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alcpt_question_used_to`
--

LOCK TABLES `alcpt_question_used_to` WRITE;
/*!40000 ALTER TABLE `alcpt_question_used_to` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alcpt_student`
--

LOCK TABLES `alcpt_student` WRITE;
/*!40000 ALTER TABLE `alcpt_student` DISABLE KEYS */;
INSERT INTO `alcpt_student` VALUES (1,'1090630218',109,2,3,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alcpt_testpaper`
--

LOCK TABLES `alcpt_testpaper` WRITE;
/*!40000 ALTER TABLE `alcpt_testpaper` DISABLE KEYS */;
INSERT INTO `alcpt_testpaper` VALUES (1,'109','2019-05-19 20:08:58.486000',1,'2019-05-22 14:08:11.816000',1,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alcpt_user`
--

LOCK TABLES `alcpt_user` WRITE;
/*!40000 ALTER TABLE `alcpt_user` DISABLE KEYS */;
INSERT INTO `alcpt_user` VALUES (1,'pbkdf2_sha256$36000$4zEHqf8SAJFQ$OKTlAhNLNfeYxlM107ZYk9LDhOy+SsndWBQx5N2QwBY=','2019-12-10 11:39:12.816615','1090630218','蘇典煒',0,1,'2019-10-15 12:44:32.551000','2019-11-13 12:05:08.798616');
/*!40000 ALTER TABLE `alcpt_user` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add answer',7,'add_answer'),(20,'Can change answer',7,'change_answer'),(21,'Can delete answer',7,'delete_answer'),(22,'Can add answer sheet',8,'add_answersheet'),(23,'Can change answer sheet',8,'change_answersheet'),(24,'Can delete answer sheet',8,'delete_answersheet'),(25,'Can add choice',9,'add_choice'),(26,'Can change choice',9,'change_choice'),(27,'Can delete choice',9,'delete_choice'),(28,'Can add department',10,'add_department'),(29,'Can change department',10,'change_department'),(30,'Can delete department',10,'delete_department'),(31,'Can add exam',11,'add_exam'),(32,'Can change exam',11,'change_exam'),(33,'Can delete exam',11,'delete_exam'),(34,'Can add group',12,'add_group'),(35,'Can change group',12,'change_group'),(36,'Can delete group',12,'delete_group'),(37,'Can add proclamation',13,'add_proclamation'),(38,'Can change proclamation',13,'change_proclamation'),(39,'Can delete proclamation',13,'delete_proclamation'),(40,'Can add question',14,'add_question'),(41,'Can change question',14,'change_question'),(42,'Can delete question',14,'delete_question'),(43,'Can add squadron',15,'add_squadron'),(44,'Can change squadron',15,'change_squadron'),(45,'Can delete squadron',15,'delete_squadron'),(46,'Can add student',16,'add_student'),(47,'Can change student',16,'change_student'),(48,'Can delete student',16,'delete_student'),(49,'Can add test paper',17,'add_testpaper'),(50,'Can change test paper',17,'change_testpaper'),(51,'Can delete test paper',17,'delete_testpaper'),(52,'Can add user',18,'add_user'),(53,'Can change user',18,'change_user'),(54,'Can delete user',18,'delete_user'),(55,'Can add option list',19,'add_optionlist'),(56,'Can change option list',19,'change_optionlist'),(57,'Can delete option list',19,'delete_optionlist');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(7,'alcpt','answer'),(8,'alcpt','answersheet'),(9,'alcpt','choice'),(10,'alcpt','department'),(11,'alcpt','exam'),(12,'alcpt','group'),(19,'alcpt','optionlist'),(13,'alcpt','proclamation'),(14,'alcpt','question'),(15,'alcpt','squadron'),(16,'alcpt','student'),(17,'alcpt','testpaper'),(18,'alcpt','user'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session');
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2019-12-11 06:45:06.093900'),(2,'auth','0001_initial','2019-12-11 06:45:06.386045'),(3,'admin','0001_initial','2019-12-11 06:45:06.469952'),(4,'admin','0002_logentry_remove_auto_add','2019-12-11 06:45:06.493655'),(5,'alcpt','0001_initial','2019-12-11 06:45:07.580557'),(6,'contenttypes','0002_remove_content_type_name','2019-12-11 06:45:07.656881'),(7,'auth','0002_alter_permission_name_max_length','2019-12-11 06:45:07.693015'),(8,'auth','0003_alter_user_email_max_length','2019-12-11 06:45:07.730940'),(9,'auth','0004_alter_user_username_opts','2019-12-11 06:45:07.753866'),(10,'auth','0005_alter_user_last_login_null','2019-12-11 06:45:07.791635'),(11,'auth','0006_require_contenttypes_0002','2019-12-11 06:45:07.794423'),(12,'auth','0007_alter_validators_add_error_messages','2019-12-11 06:45:07.812398'),(13,'auth','0008_alter_user_username_max_length','2019-12-11 06:45:07.852193'),(14,'sessions','0001_initial','2019-12-11 06:45:07.876841'),(15,'alcpt','0002_auto_20191211_1515','2019-12-11 07:15:28.993398');
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

-- Dump completed on 2019-12-11 15:29:08