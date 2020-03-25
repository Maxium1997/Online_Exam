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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alcpt_answer`
--

LOCK TABLES `alcpt_answer` WRITE;
/*!40000 ALTER TABLE `alcpt_answer` DISABLE KEYS */;
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
  KEY `alcpt_answersheet_user_id_8e290a44_fk_alcpt_user_id` (`user_id`),
  CONSTRAINT `alcpt_answersheet_exam_id_147bc9a1_fk_alcpt_exam_id` FOREIGN KEY (`exam_id`) REFERENCES `alcpt_exam` (`id`),
  CONSTRAINT `alcpt_answersheet_user_id_8e290a44_fk_alcpt_user_id` FOREIGN KEY (`user_id`) REFERENCES `alcpt_user` (`id`),
  CONSTRAINT `alcpt_answersheet_chk_1` CHECK ((`score` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alcpt_answersheet`
--

LOCK TABLES `alcpt_answersheet` WRITE;
/*!40000 ALTER TABLE `alcpt_answersheet` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alcpt_choice`
--

LOCK TABLES `alcpt_choice` WRITE;
/*!40000 ALTER TABLE `alcpt_choice` DISABLE KEYS */;
INSERT INTO `alcpt_choice` VALUES (9,'Modern flip-flops originated from Indian toe knob sandals.',0,1),(10,'Americans loved the Japanese flip-flop because of its bright colors.',0,1),(11,'Rubber became the major material of the flip-flop before World War II.',0,1),(12,'The sandals American soldiers brought home from Japan later became modern flip-flops.',1,1),(13,'A special profession.',1,2),(14,'Shipping and trading.',0,2),(15,'Guidelines for safe docking.',0,2),(16,'Protection of the marine environment.',0,2),(17,'It is free from any bitter flavor.',0,3),(18,'It is refined to remove its impurities.',0,3),(19,'It requires mixing of more than one kind of oil.',0,3),(20,'It has a lower acidity rate than virgin olive oil.',1,3),(21,'Flashing lights.',0,4),(22,'Barking speakers.',0,4),(23,'Noisy train tracks.',1,4),(24,'Lion face paintings.',0,4);
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
INSERT INTO `alcpt_department` VALUES (3,'法律學系'),(2,'財務管理學系'),(1,'資訊管理學系'),(4,'運籌管理學系');
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
  `average_score` double NOT NULL,
  `start_time` datetime(6) DEFAULT NULL,
  `created_time` datetime(6) NOT NULL,
  `duration` smallint(5) unsigned NOT NULL,
  `finish_time` datetime(6) DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL,
  `created_by_id` int(11) NOT NULL,
  `testpaper_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `alcpt_exam_created_by_id_3e8088e6_fk_alcpt_user_id` (`created_by_id`),
  KEY `alcpt_exam_testpaper_id_6048fb92_fk_alcpt_testpaper_id` (`testpaper_id`),
  CONSTRAINT `alcpt_exam_created_by_id_3e8088e6_fk_alcpt_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `alcpt_user` (`id`),
  CONSTRAINT `alcpt_exam_testpaper_id_6048fb92_fk_alcpt_testpaper_id` FOREIGN KEY (`testpaper_id`) REFERENCES `alcpt_testpaper` (`id`),
  CONSTRAINT `alcpt_exam_chk_1` CHECK ((`exam_type` >= 0)),
  CONSTRAINT `alcpt_exam_chk_2` CHECK ((`duration` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alcpt_exam`
--

LOCK TABLES `alcpt_exam` WRITE;
/*!40000 ALTER TABLE `alcpt_exam` DISABLE KEYS */;
/*!40000 ALTER TABLE `alcpt_exam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alcpt_exam_testeeList`
--

DROP TABLE IF EXISTS `alcpt_exam_testeeList`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alcpt_exam_testeeList` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exam_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `alcpt_exam_testeeList_exam_id_user_id_3c6f3f1f_uniq` (`exam_id`,`user_id`),
  KEY `alcpt_exam_testeeList_user_id_465cf978_fk_alcpt_user_id` (`user_id`),
  CONSTRAINT `alcpt_exam_testeeList_exam_id_3b6c9639_fk_alcpt_exam_id` FOREIGN KEY (`exam_id`) REFERENCES `alcpt_exam` (`id`),
  CONSTRAINT `alcpt_exam_testeeList_user_id_465cf978_fk_alcpt_user_id` FOREIGN KEY (`user_id`) REFERENCES `alcpt_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alcpt_exam_testeeList`
--

LOCK TABLES `alcpt_exam_testeeList` WRITE;
/*!40000 ALTER TABLE `alcpt_exam_testeeList` DISABLE KEYS */;
/*!40000 ALTER TABLE `alcpt_exam_testeeList` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alcpt_group`
--

LOCK TABLES `alcpt_group` WRITE;
/*!40000 ALTER TABLE `alcpt_group` DISABLE KEYS */;
INSERT INTO `alcpt_group` VALUES (1,'資管系','2020-03-25 00:46:35.800139','2020-03-24 21:46:23.807707',1),(2,'資管系109年班','2020-03-25 00:46:56.256357','2020-03-25 00:46:51.958703',1),(4,'資管系110年班','2020-03-25 00:47:19.237532','2020-03-25 00:47:15.151029',1);
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
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `alcpt_group_member_group_id_user_id_5bfb75ae_uniq` (`group_id`,`user_id`),
  KEY `alcpt_group_member_user_id_6268bc82_fk_alcpt_user_id` (`user_id`),
  CONSTRAINT `alcpt_group_member_group_id_b62cbe32_fk_alcpt_group_id` FOREIGN KEY (`group_id`) REFERENCES `alcpt_group` (`id`),
  CONSTRAINT `alcpt_group_member_user_id_6268bc82_fk_alcpt_user_id` FOREIGN KEY (`user_id`) REFERENCES `alcpt_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alcpt_group_member`
--

LOCK TABLES `alcpt_group_member` WRITE;
/*!40000 ALTER TABLE `alcpt_group_member` DISABLE KEYS */;
INSERT INTO `alcpt_group_member` VALUES (1,1,1),(3,1,2),(4,1,3),(5,1,4),(6,1,5),(7,1,6),(8,1,7),(9,1,8),(10,2,1),(11,2,2),(12,2,3),(13,2,4),(14,4,5),(15,4,6),(16,4,7),(17,4,8);
/*!40000 ALTER TABLE `alcpt_group_member` ENABLE KEYS */;
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
  `is_read` tinyint(1) NOT NULL,
  `is_public` tinyint(1) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `recipient_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `alcpt_proclamation_created_by_id_02e079a0_fk_alcpt_user_id` (`created_by_id`),
  KEY `alcpt_proclamation_recipient_id_dc91a846_fk_alcpt_user_id` (`recipient_id`),
  CONSTRAINT `alcpt_proclamation_created_by_id_02e079a0_fk_alcpt_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `alcpt_user` (`id`),
  CONSTRAINT `alcpt_proclamation_recipient_id_dc91a846_fk_alcpt_user_id` FOREIGN KEY (`recipient_id`) REFERENCES `alcpt_user` (`id`)
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
  `q_file` varchar(100) DEFAULT NULL,
  `q_content` longtext,
  `difficulty` smallint(5) unsigned NOT NULL,
  `issued_freq` int(11) NOT NULL,
  `correct_freq` int(11) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `is_valid` tinyint(1) NOT NULL,
  `faulted_reason` varchar(255) DEFAULT NULL,
  `state` smallint(6) NOT NULL,
  `created_by_id` int(11) NOT NULL,
  `last_updated_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `alcpt_question_created_by_id_2c7db757_fk_alcpt_user_id` (`created_by_id`),
  KEY `alcpt_question_last_updated_by_id_7e7caa2c_fk_alcpt_user_id` (`last_updated_by_id`),
  CONSTRAINT `alcpt_question_created_by_id_2c7db757_fk_alcpt_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `alcpt_user` (`id`),
  CONSTRAINT `alcpt_question_last_updated_by_id_7e7caa2c_fk_alcpt_user_id` FOREIGN KEY (`last_updated_by_id`) REFERENCES `alcpt_user` (`id`),
  CONSTRAINT `alcpt_question_chk_1` CHECK ((`q_type` >= 0)),
  CONSTRAINT `alcpt_question_chk_2` CHECK ((`difficulty` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alcpt_question`
--

LOCK TABLES `alcpt_question` WRITE;
/*!40000 ALTER TABLE `alcpt_question` DISABLE KEYS */;
INSERT INTO `alcpt_question` VALUES (1,5,'','The flip-flop is the simplest shoe on the planet. It consists of a piece of rubber, plastic, leather, or woven material in the outline of a foot, with a strap holding the sandal to a wearer’s toes. The name comes from the sound the sandals make when they slap the walking feet.\r\nThe earliest record of people wearing the flip-flop comes from Egypt, but many ancient cultures had their own variants of the footwear. In the Greek version, the toe strap ran between the first and second toes, while Roman sandals had the strap between the second and third toes. The Mesopotamians wore the strap between the third and fourth toes. In India, “toe knob” sandals had a knob between the first and second toes. \r\nModern flip-flops derive from Japanese zōris, which were often worn with socks dividing the big toe from the rest, and were typically made of rice straw. During World War II, Japan seized much of Southeast Asia’s rubber. In 1945, devastated from the war, the country set about establishing a cheap industry that could rebuild its economy. The Japanese used their rubber reserves from the war to mass-produce the simplest Japanese footwear. Rubber thus replaced rice straw as the major material for the flip-flop. \r\nIn the 1950s, flip-flops became popular in the United States as soldiers returning from occupied Japan brought zōris home. The sandals have subsequently undergone redesign, often appearing in bright colors in line with Californian beach culture. They have remained popular due to their convenience, and are often worn with bathing suits or summer clothing. Some people also wear dressy versions for more formal occasions.\r\nDespite their popularity, flip-flops provoke some questions. Their simple design is responsible for many foot injuries. Another issue is the suitability of exposing feet on the street and places other than the beach. But even more serious is their environmental impact: Millions of plastic discards end up in landfills or the ocean, releasing chemicals and at the same time taking centuries to decompose.\r\n\r\nWhich of the following is true about the modern development of the flip-flop?',1,0,0,'2020-03-25 08:19:17.996896','2020-03-25 08:26:35.398052',0,'',1,1,1),(2,5,'','Ships are the lifeline of trade among countries. Almost everything, from food to machinery, comes by way of the sea in huge ships piloted by captains. But the captain of a ship is responsible for guiding the vessel until they hit a port, waiting to enter the harbor. The task of bringing the ship into the harbor and anchoring it is taken up by a different captain. This captain is called a marine pilot.\r\nA marine pilot is a boat pilot with specialized knowledge of a particular port or harbor. The pilot is needed to direct large ships into a port, where there are often deep water channels surrounded by shallower seabeds. Without the services of a marine pilot, docking ships would be hazardous. There would be a real chance of running aground and damaging the ship and the cargo, some of which might be dangerous if released into a water-based ecosystem. \r\nIn addition to the shallower seabeds, tide and wind pose further challenges for bringing ships into a port. During different tides, currents may change from one direction to the other. The same strategy for docking a vessel during an incoming tide may not work during an outgoing tide. Also, the wind can significantly alter the direction of the ship and how it reacts, adding to the difficulty of anchoring the ship.\r\nMarine pilotage is a job that requires a high degree of proficiency as well as quick and independent thinking. Above all, it is about risk management. A marine pilot goes on board at a crucial time and controls the vessel based on his or her knowledge of the port and the situation at hand. The pilot is responsible for not only the safety of the ship but also the protection of the port and the marine environment.\r\n\r\nWhat is the passage mainly about?',1,0,0,'2020-03-25 08:20:44.136131','2020-03-25 08:26:37.792611',0,'',1,1,1),(3,5,'','Probably the most widely used oil in cooking, olive oil is made by crushing olives with stone or steel blades to release the oil. Extra virgin oil, the finest grade, is made from the first pressing of the olives and has a very low acidity rate (under 1%). To be qualified as “extra virgin,” the oil must also pass both an official test in a laboratory and a sensory evaluation by a trained tasting panel. It must be free from impurity, while exhibiting some fruitiness and creating a pleasant bitter flavor along with a peppery sensation in the mouth. Second on the ranking is virgin olive oil. It is also a first pressing, but has a slightly higher acidity level (under 2%). Lastly, pure olive oil is the cheapest olive oil. It is refined to remove its impurities and blended to improve flavor, and is recommended for all-purpose cooking.\r\nPackaging and storage also have an impact on the quality of olive oil. Olive oil spoils quickly when exposed to direct sunlight, so it should be stored in the dark at 16-18°C. Moisture and oxygen promote oxidation and therefore limit its shelf life. Plastic containers usually do not provide adequate protection from light, heat, or moisture; additionally, small particles in plastics can leak into the oil, which further reduces its quality.\r\nOlive oil tasters have long adopted descriptive terms such as “pure” and “light” to evaluate the quality of olive oil. Recently, however, the International Olive Council (IOC) is seeking input on test methods to improve the transparency of the testing process and boost the accuracy of the results. A redefinition of the term “olive oil” is also proposed to make a clear distinction between virgin olive oil and pure olive oil. Industry members of the IOC hope to promote the trade of olive oil by initiating these changes.\r\n\r\nWhich of the following statements is true about extra virgin olive oil?',1,0,0,'2020-03-25 08:22:17.711529','2020-03-25 08:26:46.032397',0,'',1,1,1),(4,5,'','Researchers in Japan have installed on a train a speaker that barks like a dog and snorts like a deer in order to prevent collisions with animals on the tracks.\r\nThe country has been troubled by a problem with trains colliding with deer on its railways. According to Japan’s transport ministry, there were 613 cases of train services suspended or delayed for at least 30 minutes resulting from collisions with deer and other wild animals in 2016-17.\r\nDeer are attracted to railway lines because of a need for iron in their diets. They lick the rails to pick up iron filings caused by the action of wheels against tracks. This dietary need has led to a constant battle to keep the deer separate from the unforgiving nature of tons of onrushing rolling stock. In the past, flashing red lights and even lion faces have been unsuccessfully trialed in an attempt to keep deer off the tracks.\r\nThis new device has been invented by a team at the country’s Railway Technical Research Institute (RTRI). RTRI officials explain that deer have a habit of repeatedly snorting short, shrill sounds to alert other deer when they perceive danger. The barking of the hound, which drives deer to panic, strengthens the effect of the warning noise, according to the RTRI. When the deer hear a combination of a 3-second-long recording of a deer’s snort and 20 seconds of a barking dog, they panic and flee rapidly.\r\nRTRI researchers say late-night tests, at times when deer are most frequently seen by railway tracks, have resulted in a 45 percent reduction of deer sighting. Future plans include static barking sites where deer are commonly seen, but “the noises will not be blared in areas where people live beside the tracks.”\r\n\r\nWhat device has NOT been used to solve the railway problem in Japan?',1,0,0,'2020-03-25 08:23:29.096358','2020-03-25 08:26:41.425731',0,'',1,1,1);
/*!40000 ALTER TABLE `alcpt_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alcpt_reply`
--

DROP TABLE IF EXISTS `alcpt_reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alcpt_reply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` longtext NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `source_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `alcpt_reply_created_by_id_40250197_fk_alcpt_user_id` (`created_by_id`),
  KEY `alcpt_reply_source_id_0390ee54_fk_alcpt_report_id` (`source_id`),
  CONSTRAINT `alcpt_reply_created_by_id_40250197_fk_alcpt_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `alcpt_user` (`id`),
  CONSTRAINT `alcpt_reply_source_id_0390ee54_fk_alcpt_report_id` FOREIGN KEY (`source_id`) REFERENCES `alcpt_report` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alcpt_reply`
--

LOCK TABLES `alcpt_reply` WRITE;
/*!40000 ALTER TABLE `alcpt_reply` DISABLE KEYS */;
/*!40000 ALTER TABLE `alcpt_reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alcpt_report`
--

DROP TABLE IF EXISTS `alcpt_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alcpt_report` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_notification` tinyint(1) NOT NULL,
  `staff_notification` tinyint(1) NOT NULL,
  `supplement_note` longtext NOT NULL,
  `state` smallint(6) NOT NULL,
  `created_time` datetime(6) DEFAULT NULL,
  `resolved_time` datetime(6) DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `created_by_id` int(11) NOT NULL,
  `question_id` int(11) DEFAULT NULL,
  `resolved_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `alcpt_report_category_id_108323c9_fk_alcpt_reportcategory_id` (`category_id`),
  KEY `alcpt_report_created_by_id_82b9f434_fk_alcpt_user_id` (`created_by_id`),
  KEY `alcpt_report_question_id_171cd9d9_fk_alcpt_question_id` (`question_id`),
  KEY `alcpt_report_resolved_by_id_4dc90590_fk_alcpt_user_id` (`resolved_by_id`),
  CONSTRAINT `alcpt_report_category_id_108323c9_fk_alcpt_reportcategory_id` FOREIGN KEY (`category_id`) REFERENCES `alcpt_reportcategory` (`id`),
  CONSTRAINT `alcpt_report_created_by_id_82b9f434_fk_alcpt_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `alcpt_user` (`id`),
  CONSTRAINT `alcpt_report_question_id_171cd9d9_fk_alcpt_question_id` FOREIGN KEY (`question_id`) REFERENCES `alcpt_question` (`id`),
  CONSTRAINT `alcpt_report_resolved_by_id_4dc90590_fk_alcpt_user_id` FOREIGN KEY (`resolved_by_id`) REFERENCES `alcpt_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alcpt_report`
--

LOCK TABLES `alcpt_report` WRITE;
/*!40000 ALTER TABLE `alcpt_report` DISABLE KEYS */;
/*!40000 ALTER TABLE `alcpt_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alcpt_reportcategory`
--

DROP TABLE IF EXISTS `alcpt_reportcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alcpt_reportcategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `responsibility` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  CONSTRAINT `alcpt_reportcategory_chk_1` CHECK ((`responsibility` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alcpt_reportcategory`
--

LOCK TABLES `alcpt_reportcategory` WRITE;
/*!40000 ALTER TABLE `alcpt_reportcategory` DISABLE KEYS */;
INSERT INTO `alcpt_reportcategory` VALUES (1,'帳號問題',32),(2,'權限問題',32),(3,'成績問題',16),(4,'試題問題',8),(5,'其他',32);
/*!40000 ALTER TABLE `alcpt_reportcategory` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alcpt_squadron`
--

LOCK TABLES `alcpt_squadron` WRITE;
/*!40000 ALTER TABLE `alcpt_squadron` DISABLE KEYS */;
INSERT INTO `alcpt_squadron` VALUES (1,'學生一中隊'),(3,'學生三中隊'),(2,'學生二中隊'),(4,'學生四中隊'),(5,'實習旅部');
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
  `stu_id` varchar(50) NOT NULL,
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
  CONSTRAINT `alcpt_student_user_id_c43c5a79_fk_alcpt_user_id` FOREIGN KEY (`user_id`) REFERENCES `alcpt_user` (`id`),
  CONSTRAINT `alcpt_student_chk_1` CHECK ((`grade` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alcpt_student`
--

LOCK TABLES `alcpt_student` WRITE;
/*!40000 ALTER TABLE `alcpt_student` DISABLE KEYS */;
INSERT INTO `alcpt_student` VALUES (1,'1090630218',109,1,3,1),(2,'1090630204',109,1,3,2),(3,'1090630220',109,1,3,3),(4,'1090630212',109,1,3,4),(5,'1100630224',110,1,3,5),(6,'1100630210',110,1,3,6),(7,'1100630220',110,1,3,7),(9,'1100630204',110,1,3,8);
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
  `is_used` tinyint(1) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `valid` tinyint(1) NOT NULL,
  `created_by_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `alcpt_testpaper_created_by_id_def16d7a_fk_alcpt_user_id` (`created_by_id`),
  CONSTRAINT `alcpt_testpaper_created_by_id_def16d7a_fk_alcpt_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `alcpt_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alcpt_testpaper`
--

LOCK TABLES `alcpt_testpaper` WRITE;
/*!40000 ALTER TABLE `alcpt_testpaper` DISABLE KEYS */;
/*!40000 ALTER TABLE `alcpt_testpaper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alcpt_testpaper_question_list`
--

DROP TABLE IF EXISTS `alcpt_testpaper_question_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alcpt_testpaper_question_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `testpaper_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `alcpt_testpaper_question_testpaper_id_question_id_88653a3a_uniq` (`testpaper_id`,`question_id`),
  KEY `alcpt_testpaper_ques_question_id_980638fa_fk_alcpt_que` (`question_id`),
  CONSTRAINT `alcpt_testpaper_ques_question_id_980638fa_fk_alcpt_que` FOREIGN KEY (`question_id`) REFERENCES `alcpt_question` (`id`),
  CONSTRAINT `alcpt_testpaper_ques_testpaper_id_6848bb19_fk_alcpt_tes` FOREIGN KEY (`testpaper_id`) REFERENCES `alcpt_testpaper` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alcpt_testpaper_question_list`
--

LOCK TABLES `alcpt_testpaper_question_list` WRITE;
/*!40000 ALTER TABLE `alcpt_testpaper_question_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `alcpt_testpaper_question_list` ENABLE KEYS */;
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
  `photo` varchar(100) DEFAULT NULL,
  `reg_id` varchar(50) NOT NULL,
  `email` varchar(254) DEFAULT NULL,
  `email_is_verified` tinyint(1) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `gender` smallint(5) unsigned DEFAULT NULL,
  `privilege` smallint(5) unsigned NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `identity` smallint(5) unsigned DEFAULT NULL,
  `introduction` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `reg_id` (`reg_id`),
  CONSTRAINT `alcpt_user_chk_1` CHECK ((`gender` >= 0)),
  CONSTRAINT `alcpt_user_chk_2` CHECK ((`privilege` >= 0)),
  CONSTRAINT `alcpt_user_chk_3` CHECK ((`identity` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alcpt_user`
--

LOCK TABLES `alcpt_user` WRITE;
/*!40000 ALTER TABLE `alcpt_user` DISABLE KEYS */;
INSERT INTO `alcpt_user` VALUES (1,'pbkdf2_sha256$180000$oTBTGig3RK5k$FhXD0UVPuiTiM+u6BsWeJA4pis6KlnTCIPlN6Z4b/2Q=','2020-03-24 20:34:56.682194','photos/Maxium1997_S__145940541.jpg','Maxium1997','wei860925@gmail.com',1,'蘇典煒',1,59,'2020-03-24 00:05:13.801950','2020-03-25 08:32:11.733296',2,'National Defense University'),(2,'pbkdf2_sha256$180000$yLuqnSIkcoYy$q0KUINQrSnio0TisYRYK4IBkfF/7UsgMnm7dtN+du74=',NULL,'','1090630204','terry90209@gmail.com',0,'楊家齊',1,59,'2020-03-25 00:30:10.783946','2020-03-25 00:30:57.596218',2,NULL),(3,'pbkdf2_sha256$180000$b96fVSWxy6MZ$b3PFQ5aMLayM53RMH7pPzYMuM9hVJerCMab1Hw2AcbU=',NULL,'','1090630220','smile100226@gmail.com',0,'傅晴俞',2,59,'2020-03-25 00:31:41.416825','2020-03-25 00:32:23.344164',2,NULL),(4,'pbkdf2_sha256$180000$K503qiiizglb$Xn/qPX0Njlgxq0udqMFvBGPF3xgUg2m3wM1qXsuzjZw=',NULL,'','1090630212','gmvup4xjp6@gmail.com',0,'陳信綸',1,59,'2020-03-25 00:33:10.233400','2020-03-25 00:34:00.109168',2,NULL),(5,'pbkdf2_sha256$180000$2kCvh3NqIf7c$9BDPZI0IkbIOWPtx17pucsTVtjdhnS7E7urkNCPOV4w=',NULL,'','1100630224','joy9517538246@gmail.com',0,'劉昀昕',2,59,'2020-03-25 00:34:37.778762','2020-03-25 00:35:05.504691',2,NULL),(6,'pbkdf2_sha256$180000$4lYkTUsEktJV$Ut8fuT8tU86Ovogr/bw00vxUn7RsRLHTL6I2965bk/o=',NULL,'','1100630210','qaz74159@yahoo.com.tw',0,'黃柏豪',1,59,'2020-03-25 00:41:31.694581','2020-03-25 00:42:32.323499',2,NULL),(7,'pbkdf2_sha256$180000$aH40ETsW6Zc3$b5WL4x9FXJXiroDOp6Qbrw+5zXvx8igIjOxsFy6fEIg=',NULL,'','1100630220','mayou66321@gmail.com',0,'賴昱婷',2,59,'2020-03-25 00:43:03.609348','2020-03-25 00:43:37.863002',2,NULL),(8,'pbkdf2_sha256$180000$VcCiPpvnms8b$evjoUhP59wtJKZQvMNxT41S7gsaoDkqnschPQk1OIAI=',NULL,'','1100630204','haungzhiyou@gmail.com',0,'黃子祐',1,59,'2020-03-25 00:44:17.876327','2020-03-25 00:45:00.999118',2,NULL);
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
  `name` varchar(150) NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add user',6,'add_user'),(22,'Can change user',6,'change_user'),(23,'Can delete user',6,'delete_user'),(24,'Can view user',6,'view_user'),(25,'Can add department',7,'add_department'),(26,'Can change department',7,'change_department'),(27,'Can delete department',7,'delete_department'),(28,'Can view department',7,'view_department'),(29,'Can add question',8,'add_question'),(30,'Can change question',8,'change_question'),(31,'Can delete question',8,'delete_question'),(32,'Can view question',8,'view_question'),(33,'Can add report category',9,'add_reportcategory'),(34,'Can change report category',9,'change_reportcategory'),(35,'Can delete report category',9,'delete_reportcategory'),(36,'Can view report category',9,'view_reportcategory'),(37,'Can add squadron',10,'add_squadron'),(38,'Can change squadron',10,'change_squadron'),(39,'Can delete squadron',10,'delete_squadron'),(40,'Can view squadron',10,'view_squadron'),(41,'Can add test paper',11,'add_testpaper'),(42,'Can change test paper',11,'change_testpaper'),(43,'Can delete test paper',11,'delete_testpaper'),(44,'Can view test paper',11,'view_testpaper'),(45,'Can add student',12,'add_student'),(46,'Can change student',12,'change_student'),(47,'Can delete student',12,'delete_student'),(48,'Can view student',12,'view_student'),(49,'Can add report',13,'add_report'),(50,'Can change report',13,'change_report'),(51,'Can delete report',13,'delete_report'),(52,'Can view report',13,'view_report'),(53,'Can add reply',14,'add_reply'),(54,'Can change reply',14,'change_reply'),(55,'Can delete reply',14,'delete_reply'),(56,'Can view reply',14,'view_reply'),(57,'Can add proclamation',15,'add_proclamation'),(58,'Can change proclamation',15,'change_proclamation'),(59,'Can delete proclamation',15,'delete_proclamation'),(60,'Can view proclamation',15,'view_proclamation'),(61,'Can add group',16,'add_group'),(62,'Can change group',16,'change_group'),(63,'Can delete group',16,'delete_group'),(64,'Can view group',16,'view_group'),(65,'Can add exam',17,'add_exam'),(66,'Can change exam',17,'change_exam'),(67,'Can delete exam',17,'delete_exam'),(68,'Can view exam',17,'view_exam'),(69,'Can add choice',18,'add_choice'),(70,'Can change choice',18,'change_choice'),(71,'Can delete choice',18,'delete_choice'),(72,'Can view choice',18,'view_choice'),(73,'Can add answer sheet',19,'add_answersheet'),(74,'Can change answer sheet',19,'change_answersheet'),(75,'Can delete answer sheet',19,'delete_answersheet'),(76,'Can view answer sheet',19,'view_answersheet'),(77,'Can add answer',20,'add_answer'),(78,'Can change answer',20,'change_answer'),(79,'Can delete answer',20,'delete_answer'),(80,'Can view answer',20,'view_answer'),(81,'Can add captcha store',21,'add_captchastore'),(82,'Can change captcha store',21,'change_captchastore'),(83,'Can delete captcha store',21,'delete_captchastore'),(84,'Can view captcha store',21,'view_captchastore');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `captcha_captchastore`
--

DROP TABLE IF EXISTS `captcha_captchastore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `captcha_captchastore` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `challenge` varchar(32) NOT NULL,
  `response` varchar(32) NOT NULL,
  `hashkey` varchar(40) NOT NULL,
  `expiration` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hashkey` (`hashkey`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `captcha_captchastore`
--

LOCK TABLES `captcha_captchastore` WRITE;
/*!40000 ALTER TABLE `captcha_captchastore` DISABLE KEYS */;
/*!40000 ALTER TABLE `captcha_captchastore` ENABLE KEYS */;
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
  KEY `django_admin_log_user_id_c564eba6_fk_alcpt_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_alcpt_user_id` FOREIGN KEY (`user_id`) REFERENCES `alcpt_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(20,'alcpt','answer'),(19,'alcpt','answersheet'),(18,'alcpt','choice'),(7,'alcpt','department'),(17,'alcpt','exam'),(16,'alcpt','group'),(15,'alcpt','proclamation'),(8,'alcpt','question'),(14,'alcpt','reply'),(13,'alcpt','report'),(9,'alcpt','reportcategory'),(10,'alcpt','squadron'),(12,'alcpt','student'),(11,'alcpt','testpaper'),(6,'alcpt','user'),(3,'auth','group'),(2,'auth','permission'),(21,'captcha','captchastore'),(4,'contenttypes','contenttype'),(5,'sessions','session');
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2020-03-24 20:29:17.990082'),(2,'alcpt','0001_initial','2020-03-24 20:29:18.447435'),(3,'admin','0001_initial','2020-03-24 20:29:19.418852'),(4,'admin','0002_logentry_remove_auto_add','2020-03-24 20:29:19.510852'),(5,'admin','0003_logentry_add_action_flag_choices','2020-03-24 20:29:19.528100'),(6,'contenttypes','0002_remove_content_type_name','2020-03-24 20:29:19.606753'),(7,'auth','0001_initial','2020-03-24 20:29:19.697787'),(8,'auth','0002_alter_permission_name_max_length','2020-03-24 20:29:19.850283'),(9,'auth','0003_alter_user_email_max_length','2020-03-24 20:29:19.858357'),(10,'auth','0004_alter_user_username_opts','2020-03-24 20:29:19.865974'),(11,'auth','0005_alter_user_last_login_null','2020-03-24 20:29:19.875848'),(12,'auth','0006_require_contenttypes_0002','2020-03-24 20:29:19.878990'),(13,'auth','0007_alter_validators_add_error_messages','2020-03-24 20:29:19.895816'),(14,'auth','0008_alter_user_username_max_length','2020-03-24 20:29:19.903666'),(15,'auth','0009_alter_user_last_name_max_length','2020-03-24 20:29:19.915846'),(16,'auth','0010_alter_group_name_max_length','2020-03-24 20:29:19.947503'),(17,'auth','0011_update_proxy_permissions','2020-03-24 20:29:19.968517'),(18,'captcha','0001_initial','2020-03-24 20:29:19.991107'),(19,'sessions','0001_initial','2020-03-24 20:29:20.011826');
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
INSERT INTO `django_session` VALUES ('kqrk1l6v2ct7c7ub2ahyov59rgipbvkt','OTEwOTA3ODQzOWFiM2QwZGRkMDUwN2Q0YWMwNjM5NTU0MDkyZTExYzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwYjU1ZGY4ZjdlMzhiNjRkMDVkM2M4MTMyZDZlODRiZTVkMTAyYWFmIn0=','2020-04-07 20:34:56.691468');
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

-- Dump completed on 2020-03-25  8:34:24
