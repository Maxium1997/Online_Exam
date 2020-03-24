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
) ENGINE=InnoDB AUTO_INCREMENT=148 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alcpt_answer`
--

LOCK TABLES `alcpt_answer` WRITE;
/*!40000 ALTER TABLE `alcpt_answer` DISABLE KEYS */;
INSERT INTO `alcpt_answer` VALUES (1,2,1,60),(2,2,1,48),(3,2,1,5),(4,3,1,32),(5,2,1,30),(6,2,1,31),(7,1,1,37),(8,1,1,40),(9,2,1,42),(10,2,1,47),(11,1,3,52),(12,1,3,59),(13,1,3,85),(14,3,3,339),(15,3,3,340),(16,1,3,2),(17,2,3,112),(18,2,3,57),(19,1,3,341),(20,2,4,64),(21,-1,4,115),(22,-1,4,40),(23,-1,4,96),(24,-1,4,104),(25,-1,4,48),(26,-1,4,52),(27,-1,4,37),(28,-1,4,6),(29,-1,4,82),(30,-1,4,339),(31,-1,4,111),(32,-1,4,5),(33,-1,4,41),(34,3,4,33),(35,-1,4,106),(36,-1,4,47),(37,-1,4,340),(38,3,4,341),(39,-1,4,29),(40,-1,4,30),(41,-1,4,3),(42,-1,4,1),(43,-1,4,84),(44,4,5,192),(45,1,5,200),(46,3,5,288),(47,3,5,163),(48,4,5,295),(49,2,5,275),(50,4,5,140),(51,2,5,263),(52,3,5,144),(53,2,5,145),(54,1,6,186),(55,2,6,147),(56,3,6,209),(57,4,6,198),(58,3,6,143),(59,3,6,149),(60,4,6,130),(61,2,6,205),(62,3,6,202),(63,2,6,288),(64,2,6,295),(65,3,6,153),(66,4,6,129),(67,1,6,213),(68,2,6,135),(69,1,6,193),(70,4,6,154),(71,3,6,281),(72,2,6,292),(73,1,6,222),(74,3,7,341),(75,4,7,340),(76,1,7,339),(77,3,7,52),(78,-1,8,82),(79,-1,8,5),(80,-1,8,34),(81,-1,8,46),(82,-1,8,32),(83,-1,8,47),(84,-1,8,85),(85,-1,8,91),(86,-1,8,97),(87,-1,8,111),(88,-1,8,41),(89,-1,8,98),(90,-1,8,37),(91,-1,8,59),(92,-1,8,93),(93,-1,8,81),(94,-1,8,69),(95,-1,8,60),(96,-1,8,1),(97,-1,8,30),(98,1,9,167),(99,2,9,144),(100,3,9,217),(101,4,9,211),(102,2,9,208),(103,3,9,220),(104,4,9,195),(105,3,9,276),(106,1,9,139),(107,4,9,198),(108,3,10,270),(109,1,10,304),(110,3,10,180),(111,4,10,183),(112,1,10,128),(113,2,10,182),(114,3,10,130),(115,4,10,292),(116,1,10,178),(117,4,10,211),(118,4,11,33),(119,1,11,340),(120,1,11,93),(121,4,11,90),(122,4,11,343),(123,2,11,88),(124,2,11,5),(125,1,11,32),(126,1,11,345),(127,3,11,346),(128,4,12,34),(129,2,12,31),(130,4,12,35),(131,4,12,29),(132,2,12,43),(133,1,12,37),(134,4,12,33),(135,1,12,32),(136,2,12,30),(137,3,12,41),(138,2,13,45),(139,4,13,1),(140,1,13,93),(141,2,13,78),(142,4,13,46),(143,1,13,70),(144,3,13,36),(145,1,13,105),(146,2,13,88),(147,1,13,42);
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
  CONSTRAINT `alcpt_answersheet_user_id_8e290a44_fk_alcpt_user_id` FOREIGN KEY (`user_id`) REFERENCES `alcpt_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alcpt_answersheet`
--

LOCK TABLES `alcpt_answersheet` WRITE;
/*!40000 ALTER TABLE `alcpt_answersheet` DISABLE KEYS */;
INSERT INTO `alcpt_answersheet` VALUES (1,'2020-02-20 08:52:50.378501',1,50,1,1),(3,'2020-02-20 11:31:37.794206',1,55,2,1),(4,'2020-02-24 11:14:51.190118',0,NULL,3,1),(5,'2020-02-28 02:21:21.846846',1,40,4,1),(6,'2020-02-28 02:48:51.914229',1,20,5,1),(7,'2020-02-28 11:37:59.996372',1,0,6,1),(8,'2020-03-16 02:38:09.397845',0,NULL,20,1),(9,'2020-03-16 21:52:39.857301',1,40,21,10),(10,'2020-03-16 21:53:31.363551',1,70,22,10),(11,'2020-03-16 22:14:40.781320',1,80,23,1),(12,'2020-03-16 22:19:35.419940',1,90,24,1),(13,'2020-03-17 00:31:53.999318',1,70,25,5);
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
) ENGINE=InnoDB AUTO_INCREMENT=1377 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alcpt_choice`
--

LOCK TABLES `alcpt_choice` WRITE;
/*!40000 ALTER TABLE `alcpt_choice` DISABLE KEYS */;
INSERT INTO `alcpt_choice` VALUES (1,'officer',0,1),(2,'officers',0,1),(3,'a officer',0,1),(4,'an officer',1,1),(5,'ICBM',0,2),(6,'IRBM',1,2),(7,'MRBM',0,2),(8,'SRBM',0,2),(9,'machine gun',0,3),(10,'pistol',1,3),(11,'grenade',0,3),(12,'tank',0,3),(17,'wear',0,5),(18,'had worn',1,5),(19,'wears',0,5),(20,'wearing',0,5),(21,'infantrymen',1,6),(22,'artillerymen',0,6),(23,'paratrooper',0,6),(24,'scout',0,6),(65,'Urban Operations',0,23),(66,'Engineers',0,23),(67,'engagement',1,23),(68,'Armor',0,23),(69,'鄧紫棋',1,28),(70,'林宥嘉',0,28),(71,'吳青峰',0,28),(72,'華晨宇',0,28),(89,'that',0,29),(90,'and',0,29),(91,'but',0,29),(92,'because',1,29),(93,'during',0,30),(94,'since',0,30),(95,'between',0,30),(96,'for',1,30),(97,'likes',0,31),(98,'like',1,31),(99,'are like',0,31),(100,'were alike',0,31),(101,'see',1,32),(102,'sees',0,32),(103,'saw',0,32),(104,'had seen',0,32),(105,'listen to',0,33),(106,'listens by',0,33),(107,'to listen',0,33),(108,'listening to',1,33),(109,'if',0,34),(110,'unless',0,34),(111,'that',0,34),(112,'so',1,34),(113,'May',0,35),(114,'Could',0,35),(115,'If',0,35),(116,'Would',1,35),(117,'did',0,36),(118,'had to',0,36),(119,'ought to',1,36),(120,'would',0,36),(121,'for',1,37),(122,'since',0,37),(123,'during',0,37),(124,'until',0,37),(133,'couldn\'t see very far',1,40),(134,'didn\'t have much money',0,40),(135,'was sick',0,40),(136,'made a bad grade',0,40),(137,'last',0,41),(138,'lowest',0,41),(139,'first',1,41),(140,'slower',0,41),(141,'What',0,42),(142,'It',1,42),(143,'She',0,42),(144,'He',0,42),(145,'for downtown',0,43),(146,'downtown',1,43),(147,'at downtown',0,43),(148,'into downtown',0,43),(149,'good',0,44),(150,'better',1,44),(151,'nice',0,44),(152,'best',0,44),(153,'consider',0,45),(154,'considering',1,45),(155,'considered',0,45),(156,'considers',0,45),(157,'Will use',0,46),(158,'Use',0,46),(159,'To use',1,46),(160,'Using',0,46),(161,'at',0,47),(162,'for',0,47),(163,'during',0,47),(164,'with',1,47),(165,'have',1,48),(166,'had',0,48),(167,'has',0,48),(168,'having',0,48),(169,'rifle',1,49),(170,'commander',0,49),(171,'grenade',0,49),(172,'pistol',0,49),(173,'rifles',0,50),(174,'surrenders',0,50),(175,'service pistols',1,50),(176,'bullets',0,50),(177,'large',0,51),(178,'designed',0,51),(179,'indirect',0,51),(180,'portable',1,51),(181,'They use smoothbore machine guns.',1,52),(182,'They use tracks to travel over rough land.',0,52),(183,'They use three different types of weapons.',0,52),(184,'They can aim their weapons automatically.',0,52),(185,'disappointed',1,53),(186,'satisfied',0,53),(187,'cheerful',0,53),(188,'capable',0,53),(189,'complicated',1,54),(190,'energetic',0,54),(191,'extravagant',0,54),(192,'intelligent',0,54),(193,'cherished',0,55),(194,'easygoing',0,55),(195,'flexible',0,55),(196,'negative',1,55),(197,'is lacking an address',0,56),(198,'is lost among my papers',0,56),(199,'requires your urgent comment',1,56),(200,'has been posted as you requested',0,56),(201,'rented out lately',0,57),(202,'seriously deteriorating',1,57),(203,'well-cared by its tenants',0,57),(204,'unfortunately occupied',0,57),(205,'debated',1,58),(206,'alternated',0,58),(207,'founded',0,58),(208,'inherited',0,58),(209,'discipline',0,59),(210,'facility',0,59),(211,'privacy',1,59),(212,'representation',0,59),(213,'eager',0,60),(214,'liberal ',0,60),(215,'mean',1,60),(216,'inferior',0,60),(217,'conveyed',0,61),(218,'associated',0,61),(219,'interpreted',0,61),(220,'predicted',1,61),(221,'landmarks',0,62),(222,'restrictions',1,62),(223,'percentages',0,62),(224,'circumstances',0,62),(225,'advised',0,63),(226,'occupied',0,63),(227,'proposed',1,63),(228,'recognized',0,63),(229,' sociable',0,64),(230,' expressive',1,64),(231,' reasonable',0,64),(232,' objective',0,64),(233,' particularly',1,65),(234,'sensibly',0,65),(235,'moderately',0,65),(236,' considerably',0,65),(237,' stumble',1,66),(238,' graze',0,66),(239,'navigate',0,66),(240,' dwell',0,66),(241,' initial ',0,67),(242,' annual',1,67),(243,' evident',0,67),(244,' occasional',0,67),(245,' factors',1,68),(246,'outcomes',0,68),(247,' missions',0,68),(248,' identities',0,68),(249,' distantly',0,69),(250,' meaningfully',0,69),(251,' cheerfully',0,69),(252,' vividly',1,69),(253,'napping',0,70),(254,' scooping',0,70),(255,'flipping',0,70),(256,' chirping',1,70),(257,' benefit',0,71),(258,' contact',1,71),(259,' gesture',0,71),(260,' favor',0,71),(261,' causal',0,72),(262,'durable',0,72),(263,' manual ',1,72),(264,'violent',0,72),(265,' mature',0,73),(266,' usual',0,73),(267,' seasonal',1,73),(268,' particular',0,73),(269,' requirements',1,74),(270,' techniques',0,74),(271,' situations',0,74),(272,'principles',0,74),(273,' distribute',0,75),(274,' fulfill',1,75),(275,' convince',0,75),(276,'monitor',0,75),(277,' chilly',0,76),(278,' liberal',0,76),(279,' hollow',1,76),(280,' definite',0,76),(281,'slipped',0,77),(282,'dumped',0,77),(283,' twisted',1,77),(284,'recovered',0,77),(285,' decisions',0,78),(286,' beliefs',1,78),(287,' styles',0,78),(288,' degrees',0,78),(289,' persuasive',0,79),(290,' tolerable',0,79),(291,' suspicious',0,79),(292,' demanding',1,79),(293,' anxiously',1,80),(294,' precisely',0,80),(295,'evidently',0,80),(296,' distinctly',0,80),(297,' deposited',0,81),(298,' reserved',0,81),(299,' vanished',0,81),(300,' surrounded',1,81),(301,' credit',0,82),(302,' impress',1,82),(303,' relieve',0,82),(304,' acquire',0,82),(305,' flake',0,83),(306,' blossom',0,83),(307,' blanket',1,83),(308,' flash',0,83),(309,' angles',0,84),(310,' margins',1,84),(311,' exceptions',0,84),(312,' limitations',0,84),(313,' hardship',0,85),(314,'comment',0,85),(315,' bargain',0,85),(316,'penalty',1,85),(317,' conducted',1,86),(318,' confirmed',0,86),(319,' implied',0,86),(320,' improved',0,86),(321,' efficient',0,87),(322,' reliable',0,87),(323,'massive',1,87),(324,' adequate',0,87),(325,' tenderly',0,88),(326,' properly',1,88),(327,' solidly',0,88),(328,' favorably',0,88),(329,'pursue',1,89),(330,'swear',0,89),(331,' reserve',0,89),(332,'draft',0,89),(333,' native',1,90),(334,'tricky',0,90),(335,' remote',0,90),(336,'vacant',0,90),(337,' appoint',0,91),(338,'eliminate',0,91),(339,' occupy',0,91),(340,' identify',1,91),(341,'relaxing',0,92),(342,' embarrassing',1,92),(343,' appealing',0,92),(344,' defending',0,92),(345,' barely',1,93),(346,' fairly',0,93),(347,' merely',0,93),(348,'readily',0,93),(349,' guide',0,94),(350,' trace',1,94),(351,' code',0,94),(352,'print',0,94),(353,' accessed',0,95),(354,' edited',0,95),(355,' imposed',0,95),(356,' urged',1,95),(357,'constitutions',0,96),(358,'objections',0,96),(359,' sculptures',1,96),(360,'adventures',0,96),(361,' dip',0,97),(362,' beam',1,97),(363,' spark',0,97),(364,' path',0,97),(365,' enclosed',1,98),(366,' installed',0,98),(367,' preserved',0,98),(368,' rewarded',0,98),(369,' signal',0,99),(370,'glory',0,99),(371,'medal',1,99),(372,' profit',0,99),(373,'balanced',0,100),(374,' calculated',0,100),(375,'disguised',1,100),(376,' registered',0,100),(377,' aware',1,101),(378,'ashamed',0,101),(379,'doubtful',0,101),(380,'guilty',0,101),(381,' innocence',0,102),(382,' estimation',0,102),(383,'assurance',0,102),(384,'observation',1,102),(385,' journey',0,103),(386,' traffic',0,103),(387,' concert',1,103),(388,'record',0,103),(389,' awful',0,104),(390,' drowsy',0,104),(391,' tragic',0,104),(392,' upset',1,104),(393,' accent',1,105),(394,' identity',0,105),(395,'gratitude',0,105),(396,'signature',0,105),(397,' ceased',0,106),(398,' committed',0,106),(399,' confined',1,106),(400,' conveyed',0,106),(401,' injury',1,107),(402,' offense',0,107),(403,'sacrifice',0,107),(404,' victim',0,107),(405,'security',0,108),(406,'maturity',0,108),(407,' facility',0,108),(408,' generosity',1,108),(409,' tolerates',0,109),(410,' associates',0,109),(411,' demonstrates',1,109),(412,'exaggerates',0,109),(413,'durable',0,110),(414,'private',0,110),(415,'realistic',0,110),(416,'numerous',1,110),(417,'Occasionally',1,111),(418,'Automatically',0,111),(419,'Enormously',0,111),(420,' Innocently',0,111),(421,' isolation',0,112),(422,' promotion',0,112),(423,' retirement',1,112),(424,' announcement',0,112),(425,' alert',0,113),(426,' itchy',1,113),(427,'steady',0,113),(428,' flexible',0,113),(429,' conquered',1,114),(430,'estimated',0,114),(431,' guaranteed',0,114),(432,' intensified',0,114),(433,' ruined',1,115),(434,'cracked',0,115),(435,'hastened',0,115),(436,'neglected',0,115),(437,' primitive',0,116),(438,'spiritual',0,116),(439,' representative',1,116),(440,' informative',0,116),(441,' liberally',0,117),(442,'individually',0,117),(443,'financially',0,117),(444,'environmentally',1,117),(473,'when there is no danger',0,125),(474,'when the building is on fire',1,125),(475,'when there is a high-ranking visitor',0,125),(476,'when the weather is cold',0,125),(477,'happy',1,126),(478,'sad',0,126),(479,'angry',0,126),(480,'jealous',0,126),(481,'find',0,127),(482,'plan',1,127),(483,'enjoy',0,127),(484,'suggest',0,127),(485,'a leader',0,128),(486,'a commander',0,128),(487,'an instructor',0,128),(488,'a specialist',1,128),(489,'He should increase his speed.',0,129),(490,'He should continue at the same speed.',0,129),(491,'He should decrease his speed.',1,129),(492,'He should stop.',0,129),(493,'to begin',1,130),(494,'to change',0,130),(495,'to process',0,130),(496,'to finish',0,130),(497,'a few',0,131),(498,'none',0,131),(499,'a little',0,131),(500,'a lot',1,131),(501,'It was established.',1,132),(502,'It stopped operating.',0,132),(503,'It was making a lot of money.',0,132),(504,'A new branch office was set up.',0,132),(505,'Were you involved?',1,133),(506,'Did you wash him?',0,133),(507,'Did you assist him?',0,133),(508,'Did you watch what he did?',0,133),(509,'an argument',0,134),(510,'a command',0,134),(511,'a farm',0,134),(512,'a report',1,134),(513,'something expensive',1,135),(514,'something delicious',0,135),(515,'something cheap',0,135),(516,'something heavy',0,135),(517,'The heat should be very hot.',0,136),(518,'The heat should be medium.',1,136),(519,'The heat should be very low.',0,136),(520,'The heat should be turned off.',0,136),(521,'to start again',0,137),(522,'to be stolen',0,137),(523,'to break into pieces',0,137),(524,'to stop working suddenly',1,137),(525,'a stick',1,138),(526,'a ball',0,138),(527,'a hole',0,138),(528,'a box',0,138),(529,'a little hot',1,139),(530,'very warm',0,139),(531,'quite cold',0,139),(532,'freezing',0,139),(533,'on top of the refrigerator',0,140),(534,'in front of the refrigerator',0,140),(535,'behind the refrigerator',1,140),(536,'to the left of the refrigerator',0,140),(537,'houses for sale',0,141),(538,'houses to let',1,141),(539,'houses to buy',0,141),(540,'land to build a house on',0,141),(541,'The wire is not good.',0,142),(542,'The wire is not protected.',1,142),(543,'The wire is not carrying electricity.',0,142),(544,'The wire is not visible.',0,142),(545,'an unusual one',0,143),(546,'the first one',0,143),(547,'an ordinary one',1,143),(548,'the last one',0,143),(549,'It was too expensive.',0,144),(550,'There was a lot of fruit in stock.',0,144),(551,'It had gone bad.',1,144),(552,'She didn\'t feel like eating fruit.',0,144),(553,'I\'ll tell you anything you want to know.',0,145),(554,'I\'ll help in any way I can.',1,145),(555,'I won\'t be able to stop laughing.',0,145),(556,'I haven\'t thought about him in years.',0,145),(557,'The camera is out of order.',0,146),(558,'The film is out of order.',1,146),(559,'There is no film in the camera.',0,146),(560,'The film is sold out.',0,146),(561,'through blood',1,147),(562,'by a human mistake',0,147),(563,'through an animal',0,147),(564,'through food',0,147),(565,'His eye was hit by a baseball.',1,148),(566,'The light of the sun hurt his eyes.',0,148),(567,'He sat through last night\'s game.',0,148),(568,'He was expelled from last night\'s game.',0,148),(569,'I\'d like to have them both.',1,149),(570,'I drink it when it\'s cold.',0,149),(571,'We don\'t have to stay here long.',0,149),(572,'I\'d like a cup of coffee, please.',0,149),(573,'She has just graduated from college.',0,150),(574,'She never graduated from college.',0,150),(575,'She will be studying at college.',0,150),(576,'She is going to graduate from college.',1,150),(577,'They were alternated.',0,151),(578,'They were congratulated.',0,151),(579,'They were discharged.',1,151),(580,'They were graduated.',0,151),(581,'He frightened them.',0,152),(582,'He repelled them.',1,152),(583,'He trusted them.',0,152),(584,'He made friends with them.',0,152),(585,'Her voice is beautiful.',0,153),(586,'Her house is beautiful.',0,153),(587,'Her face is beautiful.',0,153),(588,'Her body shape is beautiful.',1,153),(589,'He was chosen to deal with the crisis.',1,154),(590,'He couldn\'t get out of the trouble.',0,154),(591,'He was blamed for the mistake.',0,154),(592,'He successfully solved the problem.',0,154),(593,'He drew it up.',0,155),(594,'He is against it.',1,155),(595,'He is explaining it.',0,155),(596,'He will carry it out.',0,155),(597,'He is searching for a brand-new car.',1,156),(598,'He is testing his new car.',0,156),(599,'He is shopping for a second-hand car.',0,156),(600,'He is selling a second -hand car.',0,156),(601,'He went ahead of us.',0,157),(602,'He would come with us.',0,157),(603,'He wanted to join us.',1,157),(604,'He could go with us.',0,157),(605,'A schedule was lost.',0,158),(606,'A schedule was destroyed.',0,158),(607,'A schedule was found.',0,158),(608,'A schedule was established.',1,158),(609,'I\'m grateful to you.',1,159),(610,'I think nothing of it.',0,159),(611,'I can\'t wait to have it.',0,159),(612,'I totally agree with you.',0,159),(613,'There is no one in the waiting room.',0,160),(614,'There are a lot of people in the waiting room.',1,160),(615,'There are few people in the waiting room.',0,160),(616,'There are a few people in the waiting room.',0,160),(617,'She must roll it up.',1,161),(618,'She must double it over.',0,161),(619,'She must clean it up.',0,161),(620,'She must read it again.',0,161),(621,'It was raining.',0,162),(622,'There was a lot of snow.',0,162),(623,'It was getting dark.',0,162),(624,'The visibility was poor.',1,162),(625,'She became very happy.',0,163),(626,'She received a surprise.',0,163),(627,'She felt unsteady.',1,163),(628,'She got a good deal.',0,163),(629,'Mr. Johnson is their cousin.',0,164),(630,'Mr. Johnson is their father.',1,164),(631,'Mr. Johnson is their brother.',0,164),(632,'Mr. Johnson is their uncle.',0,164),(633,'Harry wanted a sedan.',0,165),(634,'Harry didn\'t want a sports car.',0,165),(635,'Harry bought a sedan.',1,165),(636,'Harry bought a sports car.',0,165),(637,'They have to receive extensive training.',1,166),(638,'They train lightly because of exhaustion.',0,166),(639,'They skip extensive training.',0,166),(640,'They dislike extensive training.',0,166),(641,'It is just around the corner.',1,167),(642,'It is coming to an end.',0,167),(643,'It is about to finish.',0,167),(644,'It is never too late.',0,167),(645,'It mixed the shells up.',1,168),(646,'It put in the shells.',0,168),(647,'It fired the shells out.',0,168),(648,'It threw away the shells.',0,168),(649,'Their friends won\'t use the seats.',1,169),(650,'Their friends are in the seats.',0,169),(651,'The seats for their friends are cheap.',0,169),(652,'The seats are being held for their friends.',0,169),(653,'He is behind in his schoolwork.',1,170),(654,'He is good at his schoolwork.',0,170),(655,'He is the best student in class.',0,170),(656,'He is sitting in the back row of the classroom.',0,170),(657,'It is not working.',1,171),(658,'It has broken into pieces.',0,171),(659,'It is ready for sale.',0,171),(660,'It was broadcast live.',0,171),(661,'You and I are alike.',0,172),(662,'I think I\'ve seen you before.',1,172),(663,'I know you very well.',0,172),(664,'You look like someone in my family.',0,172),(665,'He is getting a shot.',1,173),(666,'He is getting weighed.',0,173),(667,'He is being examined.',0,173),(668,'He is being rescued.',0,173),(669,'Don\'t forget to write her a letter.',0,174),(670,'Don\'t forget to see her tomorrow.',0,174),(671,'Don\'t forget to send her a telegram.',0,174),(672,'Don\'t forget to telephone her.',1,174),(673,'cost',0,175),(674,'length',0,175),(675,'size',0,175),(676,'temperature',1,175),(677,'a steering device',0,176),(678,'a source of power',1,176),(679,'a job to do',0,176),(680,'a way of stopping',0,176),(681,'show her how to write',0,177),(682,'give her something to do',0,177),(683,'give her a pen to use',1,177),(684,'show her around',0,177),(685,'look for mistakes',1,178),(686,'write it again',0,178),(687,'begin a new job',0,178),(688,'pay him for his work',0,178),(689,'a way into the room',0,179),(690,'a way out of the room',1,179),(691,'a way to go though the window',0,179),(692,'a way to lock the door',0,179),(693,'in a fancy restaurant',0,180),(694,'at a noodle stand',0,180),(695,'in a fast food restaurant',1,180),(696,'in a Chinese restaurant',0,180),(697,'It was just cooked.',1,181),(698,'It was a warm day.',0,181),(699,'I already finished eating.',0,181),(700,'That\'s my favorite meal.',0,181),(701,'The girl looks nothing like her sister',0,182),(702,'The girl looks a lot like the woman\'s sister.',1,182),(703,'The girl acts like she\'s the woman\'s sister.',0,182),(704,'The girl is a little taller.',0,182),(705,'The cars are too heavy.',0,183),(706,'The road is quite wide.',0,183),(707,'The cars cannot go very fast.',0,183),(708,'The cars cannot pass each other.',1,183),(709,'It\'s a good place for exercising.',0,184),(710,'It\'s quiet there.',1,184),(711,'It\'s noisy there.',0,184),(712,'It\'s near their house.',0,184),(717,'slowly',0,186),(718,'fast',1,186),(719,'well',0,186),(720,'straight',0,186),(721,'It will probably rain.',1,187),(722,'It will not rain.',0,187),(723,'It will rain for sure.',0,187),(724,'It is impossible to rain this weekend.',0,187),(725,'They moved to the city.',0,188),(726,'They left the city.',0,188),(727,'They did some sightseeing.',1,188),(728,'The didn\'t like the city.',0,188),(729,'It is very important.',0,189),(730,'It is not woking very well.',1,189),(731,'It is destroyed.',0,189),(732,'It needs to be recharged.',0,189),(733,'A disaster was avoided.',0,190),(734,'A disaster was predicted.',0,190),(735,'A disaster occurred.',1,190),(736,'A disaster passed.',0,190),(737,'We had breakfast.',0,191),(738,'We exercised.',0,191),(739,'We talked.',1,191),(740,'We relaxed.',0,191),(741,'She wants us to stop playing around.',0,192),(742,'She wants us to wake up soon.',0,192),(743,'She wants us not to ride the horses.',1,192),(744,'She wants us to stop hanging around.',0,192),(745,'the dock',1,193),(746,'the raft',0,193),(747,'the truck',0,193),(748,'the swimming pool',0,193),(749,'drink it ',0,194),(750,'rub it on',1,194),(751,'dry it out',0,194),(752,'paint it',0,194),(753,'before they learned English',0,195),(754,'before 2005',0,195),(755,'in 2005',1,195),(756,'to attend flight school',0,195),(757,'a weapon',0,196),(758,'a signal',0,196),(759,'an award',0,196),(760,'an assignment',1,196),(761,'David drilled it.',1,197),(762,'David sewed it.',0,197),(763,'David wrote it.',0,197),(764,'David bought it.',0,197),(765,'He wants to wait before going to the beach.',0,198),(766,'He is excited about going to the beach.',1,198),(767,'He doesn\'t care for being outdoors.',0,198),(768,'He has to wait on the beach.',0,198),(769,'once a day',0,199),(770,'two times a day',1,199),(771,'once each two days',0,199),(772,'three times a day',0,199),(773,'It rains very often.',0,200),(774,'It remains the same.',0,200),(775,'It is always hot.',0,200),(776,'It changes often.',1,200),(777,'Yes, they use traffic lights.',0,201),(778,'Yes, they use helicopters.',1,201),(779,'Yes, they use radios.',0,201),(780,'Yes, they use police cars.',0,201),(781,'handle the books',0,202),(782,'test the magazines',0,202),(783,'have a quick look at them',1,202),(784,'buy a few of them',0,202),(785,'I answer James\' call.',0,203),(786,'I fought with James.',0,203),(787,'I met James',1,203),(788,'I scolded James.',0,203),(789,'Yes, she is happy and carefree.',1,204),(790,'Yes, she is English.',0,204),(791,'Nom she is carefree and happy.',0,204),(792,'No, she is saleswoman.',0,204),(793,'to indicate atmospheric pressure',0,205),(794,'to record air speed',0,205),(795,'to measure precipitation',0,205),(796,'to regulate temperature',1,205),(797,'because the car is rough',0,206),(798,'because the car is hot and dry',0,206),(799,'because the car stops',0,206),(800,'because the car slides easily',1,206),(801,'buy a newspaper',0,207),(802,'take a bus',1,207),(803,'see a doctor',0,207),(804,'go to bed early',0,207),(805,'She thinks she will fail the course.',0,208),(806,'She thinks she will succeed.',1,208),(807,'She wants to drop the course.',0,208),(808,'She wants to take it over.',0,208),(809,'He can\'t see very well.',0,209),(810,'He is mute.',0,209),(811,'Ir is hard to listen to him sing.',0,209),(812,'There is a problem with his hearing.',1,209),(813,'He is worse than David.',0,210),(814,'He is more handsome than David.',0,210),(815,'He is much better than David.',1,210),(816,'He is a better friend than David.',0,210),(817,'He gave them a briefing.',0,211),(818,'He organized their vehicles.',0,211),(819,'He gave them a big hand.',0,211),(820,'He watched them march.',1,211),(821,'You will very likely feel cold.',0,212),(822,'You will very likely feel warm.',0,212),(823,'You will very likely get sick.',1,212),(824,'You will very likely buy a coat.',0,212),(825,'I don\'t like to read.',0,213),(826,'I like to read all the time.',0,213),(827,'I like to read about cars.',0,213),(828,'I like to read when I am free.',1,213),(829,'There was an ambulance behind John.',1,214),(830,'There was a taxi behind John.',0,214),(831,'There was music behind John.',0,214),(832,'There was a bicycle behind John.',0,214),(833,'The weather is bad.',0,215),(834,'The work is too hard.',1,215),(835,'The road is rough.',0,215),(836,'The picture is all right.',0,215),(837,'He took it away.',1,216),(838,'He bought it.',0,216),(839,'He took off its cover.',0,216),(840,'He read it.',0,216),(841,'The solution was unknown.',0,217),(842,'The solution was apparent.',1,217),(843,'The solution was dangerous.',0,217),(844,'The solution was essential.',0,217),(845,'It must be flat.',1,218),(846,'It must be long.',0,218),(847,'It must be square.',0,218),(848,'It must be large.',0,218),(849,'We confused the enemy.',0,219),(850,'We met the enemy.',1,219),(851,'We defeated the enemy.',0,219),(852,'We avoided the enemy.',0,219),(853,'Mary will compete with the female candidate.',0,220),(854,'Mary will choose the female candidate.',1,220),(855,'Mary doesn\'t like the female candidate.',0,220),(856,'Mary will work for the female candidate.',0,220),(857,'It can\'t fit.',1,221),(858,'He doesn\'t own it.',0,221),(859,'It was too heavy for him.',0,221),(860,'He doesn\'t like it.',0,221),(861,'He didn\'t see the passengers.',0,222),(862,'He didn\'t like the noise it made.',0,222),(863,'He didn\'t see the plane landing.',0,222),(864,'He didn\'t know the arrival time.',1,222),(865,'Peter can\'t understand them.',1,223),(866,'Peter can\'t stand up to them.',0,223),(867,'Peter will make them stand up.',0,223),(868,'Peter can\'t tolerate them.',0,223),(869,'They\'re becoming longer.',1,224),(870,'They\'re becoming more interesting.',0,224),(871,'They\'re becoming more rigid.',0,224),(872,'They\'re becoming more important.',0,224),(873,'They saved him.',1,225),(874,'They surrounded him.',0,225),(875,'They located him.',0,225),(876,'They buried him.',0,225),(877,'She doesn\'t know the truth.',1,226),(878,'She wants to tell the truth.',0,226),(879,'She is willing to tell the truth.',0,226),(880,'She doesn\'t want to tell the truth.',0,226),(881,'They neglected his warning.',1,227),(882,'They liked his warning.',0,227),(883,'They forgot his warning.',0,227),(884,'They remembered his warning.',0,227),(885,'this kind of watch is very expensive.',1,228),(886,'This kind of watch breaks easily.',0,228),(887,'You cannot buy this kind of watch anymore.',0,228),(888,'You will not like this kind of watch.',0,228),(889,'It is good for insulation.',1,229),(890,'It burns easily.',0,229),(891,'It is easy to lose.',0,229),(892,'It is very expensive.',0,229),(893,'He dislikes them very much.',1,230),(894,'He makes them angry.',0,230),(895,'He has great trouble working with them.',0,230),(896,'He has a high regard for them.',0,230),(897,'I was sick last night.',1,231),(898,'I finished last night.',0,231),(899,'I went running last night.',0,231),(900,'I was in a rush last night.',0,231),(901,'I don’t want to see your new home.',1,232),(902,'I don’t  want anything in your new home.',0,232),(903,'I really want to see your new home.',0,232),(904,'I would give anything to have a new home.',0,232),(905,'The damage wasn’t necessary.',1,233),(906,'There was only a little damage.',0,233),(907,'No damage was detected.',0,233),(908,'There was major damage.',0,233),(909,'He has enough time',1,234),(910,'He hasn’t enough time.',0,234),(911,'He has extra time. ',0,234),(912,'He has limited time.',0,234),(913,'She wanted to know the cost. ',1,235),(914,'She wanted to know the means.',0,235),(915,'She wanted to know the answer.',0,235),(916,'She wanted to know the reason.',0,235),(917,'a house ',0,236),(918,'a trip',1,236),(919,'a car',0,236),(920,'a friend',0,236),(921,'The man should buy new clothing.',1,237),(922,'The man has poor taste in clothing.',0,237),(923,'The man should try to find his belt.',0,237),(924,'The man should lose weight.',0,237),(925,'It was expanded five months ago.',0,238),(926,'It was started five months ago.',1,238),(927,'It was moved five months ago.',0,238),(928,'It was closed five months ago.',0,238),(929,'It matched her furniture.',1,239),(930,'It was a bargain.',0,239),(931,'It was nice to site in.',0,239),(932,'It was a pretty color.',0,239),(933,'He paid for it ahead of time.',1,240),(934,'He paid for it little by little.',0,240),(935,'He paid for it with a loan.',0,240),(936,'He paid for it with a check.',0,240),(937,'to work',1,241),(938,'on a trip',0,241),(939,'to school',0,241),(940,'on a picnic',0,241),(941,'He wanted to go to bed.',1,242),(942,'He wanted to get cleaned up.',0,242),(943,'He wanted to drink something cold.',0,242),(944,'He wanted to get somewhere fast.',0,242),(945,'His house was pretty.',0,243),(946,'His house was old.',0,243),(947,'His house was big.',1,243),(948,'His house was modern.',0,243),(949,'She was studying how to build things.',1,244),(950,'She was studying how to write stories.',0,244),(951,'She was studying how to teach children.',0,244),(952,'She was studying how to fix teeth.',0,244),(953,'descending',1,245),(954,'shacking',0,245),(955,'rolling',0,245),(956,'climbing',0,245),(957,'He is careless.',1,246),(958,'He is at fault.',0,246),(959,'He is lazy.',0,246),(960,'He likes to criticize.',0,246),(961,'play ball',1,247),(962,'eat supper',0,247),(963,'work',0,247),(964,'sleep',0,247),(965,'putting off the meeting',1,248),(966,'canceling the meeting',0,248),(967,'attending the meeting',0,248),(968,'holding a meeting',0,248),(969,'took some medicine',1,249),(970,'ran away',0,249),(971,'got a ticket',0,249),(972,'said he was sorry',0,249),(973,' in a trailer home',1,250),(974,'far from the base',0,250),(975,'near from the base',0,250),(976,'on the other side of town',0,250),(977,'give them a briefing',1,251),(978,'see how the class was conduct',0,251),(979,'teach the class ',0,251),(980,'interview the student',0,251),(985,'the speed',1,253),(986,'the angle',0,253),(987,'the diameter',0,253),(988,'the circumference',0,253),(989,'decorating a house',1,254),(990,'selling a house',0,254),(991,'building a house',0,254),(992,'tearing down a house',0,254),(993,'to be net',1,255),(994,'to be fair',0,255),(995,'to be truthful',0,255),(996,'to be on time',0,255),(997,'He threw them away.',1,256),(998,'He published them.',0,256),(999,'He put them on.',0,256),(1000,'He kicked them off.',0,256),(1001,'go up and down',1,257),(1002,'stay the same',0,257),(1003,'rise steadily',0,257),(1004,'fall steadily',0,257),(1005,'a sharp mind ',1,258),(1006,'explosives',0,258),(1007,'the desire to succeed',0,258),(1008,'a prolonged illness',0,258),(1009,'come and pick him up',0,259),(1010,'cook some food for him',0,259),(1011,'buy some food',1,259),(1012,'order some food at home',0,259),(1013,'to write to the doctor',0,260),(1014,'to call the doctor',0,260),(1015,'to find out about the doctor',0,260),(1016,'to go see the doctor',1,260),(1017,'She allowed John to take the car.',1,261),(1018,'She warned John not to take the car.',0,261),(1019,'She ordered John to drive the car.',0,261),(1020,'She gave John a ride in the car.',0,261),(1021,'the time of the meeting',1,262),(1022,'how to repair the radio',0,262),(1023,'where Main Street is',0,262),(1024,'what to buy ',0,262),(1025,'She’ll ask for the money.',0,263),(1026,'She’ll complain.',0,263),(1027,'She’ll stop working so hard.',0,263),(1028,'She’ll leave her job.',1,263),(1029,'after a while',0,264),(1030,'within minutes',1,264),(1031,'after a week',0,264),(1032,'in a day',0,264),(1033,'We agree with them.',0,265),(1034,'We employ them.',0,265),(1035,'We unite them.',0,265),(1036,'We contact them.',1,265),(1037,'act like their parents ',1,266),(1038,'help their parents',0,266),(1039,'admire the parents',0,266),(1040,'live with their parents',0,266),(1041,'She turned him down.',0,267),(1042,'She got lost.',0,267),(1043,'She didn’t show up.',1,267),(1044,'She was late.',0,267),(1045,'He found that his work was hard.',0,268),(1046,'He started doing his work.',0,268),(1047,'He started looking for work.',0,268),(1048,'He made sure his work was right.',1,268),(1049,'He was not sure of the scores.',0,269),(1050,'He was unhappy with the scores.',1,269),(1051,'He was studying the scores.',0,269),(1052,'He was evaluating the scores.',0,269),(1053,'There were no results.',0,270),(1054,'There were no expectations.',0,270),(1055,'The results were not what Major Wilson expected.',1,270),(1056,'The results were what Major Wilson expected.',0,270),(1057,'I’m not surprised by the results.',0,271),(1058,'I didn’t I would pass the exam.',0,271),(1059,'I didn’t think I would pass the exam.	',1,271),(1060,'I knew I would pass the exam.',0,271),(1061,'They were praised.',0,272),(1062,'They were congratulated.',0,272),(1063,'They were kicked out.',1,272),(1064,'They graduated.',0,272),(1065,'They repelled it.',1,273),(1066,'They prevented it.',0,273),(1067,'They missed it.',0,273),(1068,'They started it.',0,273),(1069,'There was a traffic jam this morning.',1,274),(1070,'There was a car accident this morning.',0,274),(1071,'Cars were going at a high speed.',0,274),(1072,'The traffic light was out of order.',0,274),(1073,'The song makes her sad.',0,275),(1074,'The song is about love.',0,275),(1075,'She knows the singer very well.',0,275),(1076,'She has memorized the song.',1,275),(1077,'We must feed them.',0,276),(1078,'We must hit them.',0,276),(1079,'We must treat them.',0,276),(1080,'We must locate them.',1,276),(1081,'The washing machine is not working properly.',1,277),(1082,'The machine is user-friendly.',0,277),(1083,'The price of this washing machine is going up.',0,277),(1084,'The washing machine is now for sale.',0,277),(1085,'He won the lottery.',0,278),(1086,'He always thinks of the lottery.',1,278),(1087,'He has never bought any lottery tickets.',0,278),(1088,'Winning the lottery made him rich.',0,278),(1089,'I hailed a taxi.',0,279),(1090,'I was diving taxi.',0,279),(1091,'The taxi almost hit me.',1,279),(1092,'I was waiting for a taxi.',0,279),(1093,'A schedule was destroyed.',0,280),(1094,'A schedule was lost.',0,280),(1095,'A schedule was established.',1,280),(1096,'A schedule was found.',0,280),(1097,'James is confident about himself.',0,281),(1098,'James is proud of them.',0,281),(1099,'James is not true to himself.',0,281),(1100,'James lacks self-confidence.',1,281),(1101,'They had a normal day.',0,282),(1102,'They worked hard during the emergency.',1,282),(1103,'They had a practice drill.',0,282),(1104,'They had a false alarm.',0,282),(1105,'Don’t let her tell.',0,283),(1106,'Don’t tell her.',1,283),(1107,'Don’t talk about her.',0,283),(1108,'Don’t forget to tell her.',0,283),(1109,'It is said that he is having an affair.',1,284),(1110,'We believe he is having an affair.',0,284),(1111,'The rumor is not fair.',0,284),(1112,'We’ve never heard the rumer.',0,284),(1113,'It was raining.',0,285),(1114,'The visibility was poor.',1,285),(1115,'It was getting dark.',0,285),(1116,'There was a lot of snow.',0,285),(1117,'She received a surprise.',0,286),(1118,'She became very happy.',0,286),(1119,'She got a good deal.',0,286),(1120,'She felt unsteady.',1,286),(1121,'That medicine tasted bitter.',0,287),(1122,'That medicine worked miracles.',1,287),(1123,'The medicine tasted like wine.',0,287),(1124,'The medicine was prescribed carefully.',0,287),(1125,'They deserted their children.',0,288),(1126,'They moved because of their children.',1,288),(1127,'Their children didn’t move with them.',0,288),(1128,'They sent their children to Manhattan.',0,288),(1129,'Harry bought a sedan.',1,289),(1130,'Harry bought a sports car.',0,289),(1131,'Harry wanted a sedan.',0,289),(1132,'Harry didn’t want a sports car.',0,289),(1133,'They skip extensive training.',0,290),(1134,'They dislike extensive training.',0,290),(1135,'They have to receive extensive training.',1,290),(1136,'They train lightly because of exhaustion.',0,290),(1137,'You should have called me.',0,291),(1138,'You are supposed to call me after meeting me.',0,291),(1139,'Let me know if you cannot come.',1,291),(1140,'Call me when you arrive.',0,291),(1141,'It pulled in the shells.',0,292),(1142,'It mixed the shells.',0,292),(1143,'It threw out the shells.',1,292),(1144,'It fired the shells.',0,292),(1145,'The table is being held for their friends.',1,293),(1146,'The table for their friends is cheap.',0,293),(1147,'Their friends are in the seats.',0,293),(1148,'Their friends won’t use the seats.',0,293),(1149,'It is good to hear you say that.',0,294),(1150,'It’s getting chilly.',0,294),(1151,'It’s perfect for cooking.',0,294),(1152,'It feels very hot.',1,294),(1153,'Don’t forget to write her a letter.',0,295),(1154,'Don\'t forget to see her tomorrow.',0,295),(1155,'Don\'t forget to send her an e-mail.',0,295),(1156,'Don\'t forget to telephone her.',1,295),(1157,'turn right at the next corner',0,296),(1158,'give the woman a ride',0,296),(1159,'look for the taxi',0,296),(1160,'send a taxi immediately.',1,296),(1161,'She doesn’t like the man.',0,297),(1162,'She doesn’t know how to paint.',0,297),(1163,'It’s in the morning.',0,297),(1164,'She has an appointment to meet someone.',1,297),(1165,'He received a present at the meeting.',0,298),(1166,'He enjoying the meeting.',0,298),(1167,'He attended the meeting.',1,298),(1168,'He was the speaker.',0,298),(1169,'Richard has been standing in the wrong place.',0,299),(1170,'Richard hasn’t heard it correctly.',0,299),(1171,'Richard doesn’t know what it means.',1,299),(1172,'Richard means everything he says.',0,299),(1173,'She should treat him to dinner.',0,300),(1174,'It’s very easy .',0,300),(1175,'He’s hungry.',0,300),(1176,'It’s too difficult for him.',1,300),(1177,'He doesn’t like his new apartment.',1,301),(1178,'Someone is standing behind him.',0,301),(1179,'He back aches.',0,301),(1180,'Someone is trying to kill them.',0,301),(1181,'Colonel Roberts will not to give a speech.',0,302),(1182,'Colonel Roberts will ignore the speaker.',0,302),(1183,'Colonel Roberts will be the main speaker.',1,302),(1184,'Colonel Roberts will introduce the speaker.',0,302),(1185,'a chief',0,303),(1186,'a customer',0,303),(1187,'a waitress ',1,303),(1188,'a janitor',0,303),(1189,'one',1,304),(1190,'a few',0,304),(1191,'Two',0,304),(1192,'none',0,304),(1193,' stop working ',0,305),(1194,'do the work better',0,305),(1195,'continue to work ',1,305),(1196,'do the work over again',0,305),(1329,'Steps to get rid of bedbugs.',0,339),(1330,'Ways to use foggers correctly.',0,339),(1331,'The ineffectiveness of bug bombs.',1,339),(1332,'The problems caused by insects.',0,339),(1333,' It is a creature living inside our ears.',0,340),(1334,'It is a tune memorized in a personal way.',0,340),(1335,'It is a melody repeating in our heads.',1,340),(1336,'It is a commercial recalled through lyrics.',0,340),(1337,'Being a cleaner for other fish.',1,341),(1338,'Being a bodyguard for other fish.',0,341),(1339,'Being a gardener for roots and plants.',0,341),(1340,'Being a caretaker for sponge and algae.',0,341),(1341,'The trees were taller and stronger.',0,342),(1342,'The soil was softer for seeds to sprout.',0,342),(1343,'The climate was warmer and more humid.',1,342),(1344,'The temperature was lower along the Pacific coast.',0,342),(1345,'A Painful Mistake',0,343),(1346,'A Great Adventure',0,343),(1347,'A Lifelong Punishment',0,343),(1348,'A New Direction in Life',1,343),(1349,'Maasai people are a threat to elephants.',1,344),(1350,'Kamba people raise elephants for farming.',0,344),(1351,'Both Kamba and Maasai people are elephant hunters.',0,344),(1352,'Both Kamba and Maasai people traditionally wear red clothing.',0,344),(1353,'Facial expressions.',1,345),(1354,'Physical contact.',0,345),(1355,'Rate of speech.',0,345),(1356,'Eye contact.',0,345),(1357,'They are quick in movement.',0,346),(1358,'They are very active in the daytime.',0,346),(1359,'They are decreasing in number.',1,346),(1360,'They have a short lifespan for insects.',0,346),(1361,'They are part of the graduation ceremony.',0,347),(1362,'They are occasions for teens to show off their limousines.',0,347),(1363,'They are important events for teenagers to learn social skills.',1,347),(1364,'They are formal events in which teens share their traumatic experiences.',0,347),(1365,'personal wearable device',0,348),(1366,'graphic process unit',1,348),(1367,'cloud sharing service',0,348),(1368,'media streaming service',0,348);
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
INSERT INTO `alcpt_department` VALUES (2,'法律系'),(3,'財管系'),(1,'資管系'),(4,'運籌系');
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
  CONSTRAINT `alcpt_exam_testpaper_id_6048fb92_fk_alcpt_testpaper_id` FOREIGN KEY (`testpaper_id`) REFERENCES `alcpt_testpaper` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alcpt_exam`
--

LOCK TABLES `alcpt_exam` WRITE;
/*!40000 ALTER TABLE `alcpt_exam` DISABLE KEYS */;
INSERT INTO `alcpt_exam` VALUES (1,'閱讀練習-2020/02/20 08:50:08',4,0,0,50,NULL,'2020-02-20 08:50:08.581360',0,NULL,0,1,3),(2,'閱讀練習-2020/02/20 11:31:36',4,0,0,55,NULL,'2020-02-20 11:31:36.508692',0,NULL,0,1,4),(3,'閱讀練習-2020/02/24 11:14:44',4,0,0,0,NULL,'2020-02-24 11:14:44.968639',0,NULL,0,1,5),(4,'聽力練習-2020/02/28 02:21:15',3,0,0,40,NULL,'2020-02-28 02:21:15.994879',0,NULL,0,1,7),(5,'聽力練習-2020/02/28 02:48:50',3,0,0,20,NULL,'2020-02-28 02:48:50.639449',0,NULL,0,1,8),(6,'閱讀練習-2020/02/28 11:37:58',4,0,0,0,NULL,'2020-02-28 11:37:58.423912',0,NULL,0,1,9),(19,'First Mock Exam',1,0,0,0,'2020-03-31 16:10:00.000000','2020-03-14 22:40:00.998546',80,'2020-03-31 17:30:00.000000',1,5,25),(20,'閱讀練習-2020/03/16 02:38:05',4,0,0,0,NULL,'2020-03-16 02:38:05.282335',0,NULL,0,1,19),(21,'聽力練習-2020/03/16 21:52:38',3,0,0,40,NULL,'2020-03-16 21:52:38.624866',0,NULL,0,10,20),(22,'聽力練習-2020/03/16 21:53:30',3,0,0,70,NULL,'2020-03-16 21:53:30.325168',0,NULL,0,10,21),(23,'閱讀練習-2020/03/16 22:14:39',4,0,0,80,NULL,'2020-03-16 22:14:39.256387',0,NULL,0,1,22),(24,'閱讀練習-2020/03/16 22:19:34',4,0,0,90,NULL,'2020-03-16 22:19:34.142908',0,NULL,0,1,23),(25,'閱讀練習-2020/03/17 00:31:53',4,0,0,70,NULL,'2020-03-17 00:31:53.086976',0,NULL,0,5,24);
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
) ENGINE=InnoDB AUTO_INCREMENT=202 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alcpt_exam_testeeList`
--

LOCK TABLES `alcpt_exam_testeeList` WRITE;
/*!40000 ALTER TABLE `alcpt_exam_testeeList` DISABLE KEYS */;
INSERT INTO `alcpt_exam_testeeList` VALUES (119,19,1),(120,19,2),(122,19,4),(123,19,5),(124,19,6),(125,19,7),(126,19,8),(127,19,9),(128,19,10),(129,19,11);
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alcpt_group`
--

LOCK TABLES `alcpt_group` WRITE;
/*!40000 ALTER TABLE `alcpt_group` DISABLE KEYS */;
INSERT INTO `alcpt_group` VALUES (1,'資管系','2020-02-11 13:39:37.002878','2020-02-11 13:39:37.001069',1),(2,'法律','2020-02-17 10:34:03.283456','2020-02-17 10:34:03.278746',1),(3,'109年班','2020-02-24 23:11:28.996531','2020-02-24 23:11:28.984803',1),(5,'法律系109年班','2020-03-14 02:12:08.553797','2020-03-14 02:12:08.540768',1),(6,'法律系110年班','2020-03-14 02:13:15.706336','2020-03-14 02:13:15.703872',1),(9,'資管系110年班','2020-03-19 00:59:41.772846','2020-03-19 00:59:41.768574',1),(10,'資管系109年班','2020-03-19 01:00:30.974127','2020-03-19 01:00:30.972082',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alcpt_group_member`
--

LOCK TABLES `alcpt_group_member` WRITE;
/*!40000 ALTER TABLE `alcpt_group_member` DISABLE KEYS */;
INSERT INTO `alcpt_group_member` VALUES (45,1,1),(30,1,2),(48,1,4),(90,1,5),(32,1,6),(33,1,7),(34,1,8),(35,1,9),(95,1,15),(5,3,1),(10,3,6),(11,3,7),(76,9,2),(77,9,5),(78,9,8),(79,9,9),(80,10,1),(81,10,6),(82,10,7),(86,10,15);
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
  `is_public` tinyint(1) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `is_read` tinyint(1) NOT NULL,
  `recipient_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `alcpt_proclamation_created_by_id_02e079a0_fk_alcpt_user_id` (`created_by_id`),
  KEY `alcpt_proclamation_recipient_id_dc91a846_fk_alcpt_user_id` (`recipient_id`),
  CONSTRAINT `alcpt_proclamation_created_by_id_02e079a0_fk_alcpt_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `alcpt_user` (`id`),
  CONSTRAINT `alcpt_proclamation_recipient_id_dc91a846_fk_alcpt_user_id` FOREIGN KEY (`recipient_id`) REFERENCES `alcpt_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alcpt_proclamation`
--

LOCK TABLES `alcpt_proclamation` WRITE;
/*!40000 ALTER TABLE `alcpt_proclamation` DISABLE KEYS */;
INSERT INTO `alcpt_proclamation` VALUES (1,'ALCPT Online Practice Platform Enabled','1. This practice system is suitable for anyone related to military schools.\r\n2. This system is developing for improving language ability. All user must use your time to do some exercise through the system.\r\n3. Do not cheat yourself.',1,'2020-02-29 13:23:53.290260',1,1,NULL),(2,'Email Verification','Please check out your email to complete the email verification.\n\nThank you for your cooperation.',0,'2020-03-18 23:59:30.109996',1,1,1);
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
  `faulted_reason` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `alcpt_question_created_by_id_2c7db757_fk_alcpt_user_id` (`created_by_id`),
  KEY `alcpt_question_last_updated_by_id_7e7caa2c_fk_alcpt_user_id` (`last_updated_by_id`),
  CONSTRAINT `alcpt_question_created_by_id_2c7db757_fk_alcpt_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `alcpt_user` (`id`),
  CONSTRAINT `alcpt_question_last_updated_by_id_7e7caa2c_fk_alcpt_user_id` FOREIGN KEY (`last_updated_by_id`) REFERENCES `alcpt_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=353 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alcpt_question`
--

LOCK TABLES `alcpt_question` WRITE;
/*!40000 ALTER TABLE `alcpt_question` DISABLE KEYS */;
INSERT INTO `alcpt_question` VALUES (1,3,NULL,'He is ____ in the military service.',1,4,0,'2019-05-19 16:18:54.592000','2020-03-17 00:31:53.041229',0,1,1,1,NULL),(2,4,NULL,'What kind of missile that distance is from 1000 km to 3000km?',1,1,0,'2019-12-13 12:34:07.004452','2020-02-20 11:31:36.466127',0,1,1,1,''),(3,4,NULL,'Which of the following options matches accuracy, durability, and fitness?',1,1,0,'2019-12-14 06:48:42.496852','2020-02-24 11:14:44.887823',0,1,1,1,''),(5,3,NULL,'If he  ____ his sweater, he wouldn’t have caught a cold.',1,5,0,'2019-12-17 12:03:07.417097','2020-03-16 22:14:39.204742',0,1,1,1,''),(6,4,NULL,'\"Victory is still measured by foot.\" is a common saying in the Indian Army.\r\nThis means that, while many types of units fight in a war, it is the __________ who ultimately win or lose wars.',1,1,0,'2019-12-17 14:22:04.373493','2020-02-24 11:14:44.903003',0,1,1,1,''),(23,4,NULL,'The rule of ______ in UO are often very strict in order to minimize collateral damage.',1,0,0,'2019-12-18 13:19:04.544839','2020-01-05 00:04:41.045340',0,1,1,1,''),(28,1,'/media/question_28',NULL,1,0,0,'2019-12-18 16:30:52.424219','2019-12-31 07:54:35.203196',0,1,1,1,'鄧紫棋太正'),(29,3,NULL,'I can\'t go with you ______ I\'m busy.',1,2,0,'2019-12-18 12:24:40.346544','2020-03-16 22:19:34.108504',0,1,1,1,''),(30,3,NULL,'They have been waiting for me ______ 5 o\'clock.',1,4,0,'2019-12-18 12:26:59.413803','2020-03-16 22:19:34.115622',0,1,1,1,''),(31,3,NULL,'Most people ______ to red newspapers.',1,2,0,'2019-12-18 12:29:04.000232','2020-03-16 22:19:34.102614',0,1,1,1,''),(32,3,NULL,'John would have called the police if he ____ the accident.',1,4,0,'2019-12-18 12:41:20.098003','2020-03-16 22:19:34.081787',0,1,1,1,''),(33,3,NULL,'He finished _____ his tape.',1,4,0,'2019-12-18 12:44:37.305665','2020-03-16 22:19:34.091520',0,1,1,1,''),(34,3,NULL,'He left the office early ____ he could do some shopping.',1,2,0,'2019-12-18 12:46:07.538020','2020-03-16 22:19:34.117850',0,1,1,1,''),(35,3,NULL,'______ you mind closing the window?',1,2,0,'2019-12-18 12:46:52.892223','2020-03-16 22:19:34.113342',0,1,1,1,''),(36,3,NULL,'You ______ review this lesson before you take the test.',1,2,0,'2019-12-18 12:50:56.110807','2020-03-17 00:31:53.039062',0,1,1,1,''),(37,3,NULL,'He has been studying English _____ four years.',1,5,0,'2019-12-18 12:52:35.977609','2020-03-16 22:19:34.105947',0,1,1,1,''),(40,3,NULL,'The visibility was poor yesterday. I _______.',1,3,0,'2019-12-18 13:09:06.167496','2020-02-24 11:14:44.878850',0,1,1,1,''),(41,3,NULL,'Howard finished ________ because he was the fastest.',1,3,0,'2019-12-18 13:11:47.679947','2020-03-16 22:19:34.099926',0,1,1,1,''),(42,3,NULL,'Get the red book. _______ is on the shelf.',1,2,0,'2019-12-18 13:14:11.897504','2020-03-17 00:31:53.044835',0,1,1,1,''),(43,3,NULL,'I am going _______ to buy a new car.',1,2,0,'2019-12-18 13:15:43.150014','2020-03-16 22:19:34.110542',0,1,1,1,''),(44,3,NULL,'The weather is ______ today than it was last night.',1,0,0,'2019-12-18 13:16:38.833223','2020-02-16 22:31:39.420014',0,1,1,1,''),(45,3,NULL,'In the U.S., conversation is _______ proper during meals.',1,1,0,'2019-12-18 13:34:36.708340','2020-03-17 00:31:53.036478',0,1,1,1,''),(46,3,NULL,'______ spears for weapons, the men hunted wild animals.',1,2,0,'2019-12-18 13:38:41.449990','2020-03-17 00:31:53.043134',0,1,1,1,''),(47,3,NULL,'Aircraft pilots communicate ______ control towers.',1,3,0,'2019-12-18 13:39:49.363301','2020-03-16 02:38:05.207422',0,1,1,1,''),(48,3,NULL,'Did the students ______ a lot of homework last night?',1,3,0,'2019-12-18 13:40:48.026545','2020-02-24 11:14:44.869925',0,1,1,1,''),(49,4,NULL,'The ______ is a common military firearm. Soldiers fire it from the shoulder. It has a built-in sight.',1,0,0,'2019-12-20 06:58:58.709023','2020-01-05 00:04:41.057392',0,1,1,1,''),(50,4,NULL,'In fact, ________ have great symbolic meaning. When a unit is defeated, the commanding officer often gives his sidearm to the enemy commander.',1,0,0,'2019-12-20 07:02:22.291929','2020-02-16 22:13:51.768638',0,1,1,1,''),(51,4,NULL,'Small mortars are _______ and used by infantry units.',1,0,0,'2019-12-20 07:20:14.774868','2020-01-05 21:24:59.105996',0,1,1,1,''),(52,5,NULL,'What does the passage say about tanks?',1,3,0,'2019-12-20 07:24:04.722459','2020-02-28 11:37:58.376740',0,1,1,1,''),(53,4,NULL,'Joe could not find a job that he really wanted. Therefore, he felt very _______.',1,0,0,'2019-12-21 19:15:16.742985','2020-02-16 22:13:51.775885',0,1,1,1,''),(54,4,NULL,'I need someone to help me solve this _______ math problem. It is not easy for me to understand.',1,0,0,'2019-12-21 19:17:11.091771','2020-02-16 22:13:51.734820',0,1,1,1,''),(55,4,NULL,'When you are depressed, try to replace all your _______ thoughts with positive ones.',1,0,0,'2019-12-21 19:18:18.603990','2019-12-22 06:04:24.235730',0,1,1,1,''),(56,4,NULL,'The letter _______, so you should reply to it as soon as possible.',1,0,0,'2019-12-21 19:20:47.518982','2020-02-16 22:29:44.658914',0,1,1,1,''),(57,4,NULL,'The old building has been discovered to be _______. It is vacant precisely for this reason.',1,1,0,'2019-12-21 19:22:11.623838','2020-02-20 11:31:36.457369',0,1,1,1,''),(58,4,NULL,'Scientists have _______ that the greenhouse effect caused global warming.',1,0,0,'2019-12-21 19:24:19.309120','2020-02-16 22:13:51.726872',0,1,1,1,''),(59,4,NULL,'Bobby cared a lot about his _____ at home and asked his parents not to go through his things without his permission.',1,2,0,'2019-12-21 19:32:03.154157','2020-03-16 02:38:05.230902',0,1,1,1,''),(60,3,NULL,'The new manager is a real gentleman. He is  kind and humble, totally different from the former manager,\r\nwho was _____ and bossy.',1,3,0,'2019-12-21 19:33:47.066982','2020-03-16 02:38:05.210184',0,1,1,1,''),(61,4,NULL,'The weather bureau _____ that the typhoon would bring strong winds and heavy rains, and warned everyone of the possible danger.',1,0,0,'2019-12-21 19:35:38.516608','2020-01-05 21:24:59.107983',0,1,1,1,''),(62,4,NULL,'Different airlines have different _____ for carry-on luggage, but many international airlines limit a carry-on piece to 7 kilograms.',1,0,0,'2019-12-22 03:06:55.597684','2020-01-05 00:04:41.041391',0,1,1,1,''),(63,4,NULL,'To reach the goal of making her company a market leader, Michelle _______ a plan to open ten new stores around the country this year.',1,0,0,'2019-12-24 12:54:51.363684','2020-02-16 22:29:44.667440',0,1,1,1,''),(64,4,NULL,'Silence in some way is as _____ as speech. It can be used to show, for example, disagreement or lack\r\nof interest.',1,1,0,'2019-12-25 08:09:16.845920','2020-02-24 11:14:44.885972',0,1,1,1,''),(65,4,NULL,'This TV program is designed for children, _____ for those under five. It contains no violence or strong language.',1,0,0,'2019-12-25 08:10:20.484738','2019-12-31 07:36:05.334955',0,1,1,1,''),(66,4,NULL,'Tommy, please put away the toys in the box, or you might _____ on them and hurt yourself.\r\n',1,0,0,'2019-12-25 08:11:09.275821','2020-02-16 22:31:39.445495',0,1,1,1,''),(67,4,NULL,'The _____ costume party, held every September, is one of the biggest events of the school year.',1,0,0,'2019-12-25 08:12:06.799790','2020-02-16 22:13:51.764830',0,1,1,1,''),(68,4,NULL,'In a job interview, attitude and personality are usually important _____ that influence the decision of the interviewers.',1,0,0,'2019-12-25 08:13:02.205312','2020-02-16 22:29:44.679837',0,1,1,1,''),(69,4,NULL,'The snow-capped mountain is described so _____ in the book that the scene seems to come alive in\r\nfront of the reader’s eyes.',1,1,0,'2019-12-25 08:14:17.086109','2020-03-16 02:38:05.233540',0,1,1,1,''),(70,4,NULL,'. Surrounded by flowers blooming and birds _____ merrily, the Wangs had a good time hiking in the\r\nnational park.\r\n',1,1,0,'2019-12-25 08:15:19.386222','2020-03-17 00:31:53.051285',0,1,1,1,''),(71,4,NULL,'It is essential for us to maintain constant _____ with our friends to ensure that we have someone to talk to in times of need.',1,0,0,'2019-12-25 08:16:08.286657','2020-02-16 22:13:51.738979',0,1,1,1,''),(72,4,NULL,'The young generation in this country has shown less interest in factory work and other _____ labor jobs, such as house construction and fruit picking.',1,0,0,'2019-12-25 08:17:04.767922','2020-02-16 22:31:39.458588',0,1,1,1,''),(73,4,NULL,'Mangoes are a _____ fruit here in Taiwan; most of them reach their peak of sweetness in July.',1,0,0,'2019-12-25 08:18:41.941366','2019-12-31 06:34:15.717730',0,1,1,1,''),(74,4,NULL,'Writing term papers and giving oral reports are typical course _____ for college students.',1,0,0,'2019-12-25 08:21:44.015877','2019-12-29 07:00:09.861395',0,1,1,1,''),(75,4,NULL,'If we work hard to _____ our dreams when we are young, we will not feel that we missed out on\r\nsomething when we get old.',1,0,0,'2019-12-25 08:23:09.645550','2020-02-16 22:13:51.721653',0,1,1,1,''),(76,4,NULL,'Few people will trust you if you continue making _____ promises and never make efforts to keep them.',1,0,0,'2019-12-25 08:24:12.164544','2020-02-16 22:13:51.743378',0,1,1,1,''),(77,4,NULL,'Becky _____ her ankle while she was playing tennis last week. Now it still hurts badly.',1,0,0,'2019-12-25 08:25:01.108884','2019-12-29 08:03:38.745798',0,1,1,1,''),(78,4,NULL,'Research shows that men and women usually think differently. For example, they have quite different\r\n_____ about what marriage means in their life.',1,1,0,'2019-12-25 08:26:18.111187','2020-03-17 00:31:53.053037',0,1,1,1,''),(79,4,NULL,'The new manager is very _____. For instance, the employees are given much shorter deadlines for the\r\nsame tasks than before.',1,0,0,'2019-12-25 08:27:04.893096','2020-01-05 21:24:59.092478',0,1,1,1,''),(80,4,NULL,'While the couple were looking _____ for their missing children, the kids were actually having fun in\r\nthe woods nearby.',1,0,0,'2019-12-25 08:28:00.176428','2020-02-16 22:13:51.753504',0,1,1,1,''),(81,4,NULL,'After delivering a very powerful speech, the award winner was _____ by a group of fans asking for her signature.',1,1,0,'2019-12-25 08:29:05.623123','2020-03-16 02:38:05.235488',0,1,1,1,''),(82,4,NULL,'The interviewees were trying very hard to _____ the interviewers that they were very capable and\r\nshould be given the job.',1,2,0,'2019-12-25 08:30:01.784400','2020-03-16 02:38:05.226377',0,1,1,1,''),(83,4,NULL,'After the first snow of the year, the entire grassland disappeared under a _____ of snow.\r\n',1,0,0,'2019-12-25 08:31:04.892996','2019-12-29 08:05:37.761839',0,1,1,1,''),(84,4,NULL,'Peter likes books with wide _____, which provide him with enough space to write notes.',1,1,0,'2019-12-25 08:31:57.216138','2020-02-24 11:14:44.894880',0,1,1,1,''),(85,4,NULL,'At the beginning of the semester, the teacher told the students that late assignments would receive a low grade as a _____.',1,2,0,'2019-12-25 08:32:54.928532','2020-03-16 02:38:05.237619',0,1,1,1,''),(86,4,NULL,'Various studies have been _____ in this hospital to explore the link between a high-fat diet and cancer.',1,0,0,'2019-12-25 08:33:54.946537','2020-02-16 22:13:51.707041',0,1,1,1,''),(87,4,NULL,'Intense, fast-moving fires raged across much of California last week. The _____ firestorm has claimed the lives of thirty people.',1,0,0,'2019-12-25 08:35:05.531916','2020-02-16 22:13:51.762678',0,1,1,1,''),(88,4,NULL,'John’s clock is not functioning _____. The alarm rings even when it’s not set to go off.',1,2,0,'2019-12-25 23:49:18.117495','2020-03-17 00:31:53.054818',0,1,1,1,''),(89,4,NULL,'Michael has decided to _____ a career in physics and has set his mind on becoming a professor.',1,0,0,'2019-12-25 23:50:17.718596','2020-01-05 00:04:41.062973',0,1,1,1,''),(90,4,NULL,'Peter plans to hike in a _____ part of Africa, where he might not meet another human being for days.',1,1,0,'2019-12-25 23:51:05.015013','2020-03-16 22:14:39.213731',0,1,1,1,''),(91,4,NULL,'People in this community tend to _____ with the group they belong to, and often put group interests\r\nbefore personal ones.',1,1,0,'2019-12-25 23:51:50.144780','2020-03-16 02:38:05.222633',0,1,1,1,''),(92,4,NULL,'I mistook the man for a well-known actor and asked for his autograph; it was really _____.',1,0,0,'2019-12-25 23:52:38.895877','2020-01-04 23:49:20.856671',0,1,1,1,''),(93,4,NULL,'After spending most of her salary on rent and food, Amelia _____ had any money left for\r\nentertainment and other expenses.',1,3,0,'2019-12-25 23:53:25.278731','2020-03-17 00:31:53.049550',0,1,1,1,''),(94,4,NULL,'In the Bermuda Triangle, a region in the western part of the North Atlantic Ocean, some airplanes and ships were reported to have mysteriously disappeared without a _____.',1,0,0,'2019-12-25 23:54:19.531493','2020-02-16 22:31:39.454291',0,1,1,1,''),(95,4,NULL,'Shouting greetings and waving a big sign, Tony _____ the passing shoppers to visit his shop and buy\r\nthe freshly baked bread.',1,0,0,'2019-12-25 23:55:00.695972','2020-02-16 22:13:51.701170',0,1,1,1,''),(96,4,NULL,'With a continuous 3 km stretch of golden sand, the beach attracts artists around the world each\r\nsummer to create amazing _____ with its fine soft sand.\r\n',1,1,0,'2019-12-25 23:55:58.308430','2020-02-24 11:14:44.892568',0,1,1,1,''),(97,4,NULL,'The clouds parted and a _____ of light fell on the church, through the windows, and onto the floor.',1,1,0,'2019-12-25 23:56:54.583673','2020-03-16 02:38:05.239438',0,1,1,1,''),(98,4,NULL,'. Instead of a gift, Tim’s grandmother always _____ some money in the birthday card she gave him.',1,1,0,'2019-12-25 23:57:42.612180','2020-03-16 02:38:05.224701',0,1,1,1,''),(99,4,NULL,'While winning a gold _____ is what every Olympic athlete dreams of, it becomes meaningless if it is\r\nachieved by cheating.',1,0,0,'2019-12-25 23:58:36.839143','2020-01-04 21:29:45.164267',0,1,1,1,''),(100,4,NULL,'The thief went into the apartment building and stole some jewelry. He then _____ himself as a\r\nsecurity guard and walked out the front gate.',1,0,0,'2019-12-25 23:59:21.652007','2020-02-16 22:31:39.439309',0,1,1,1,''),(101,4,NULL,'Due to numerous accidents that occurred while people were playing Pokémon GO, players were\r\nadvised to be _____ of possible dangers in the environment.',1,0,0,'2019-12-26 00:00:17.186295','2019-12-29 08:02:40.199485',0,1,1,1,''),(102,4,NULL,'Sherlock Holmes, a detective in a popular fiction series, has impressed readers with his amazing\r\npowers of _____ and his knowledge of trivial facts.',1,0,0,'2019-12-26 00:01:02.927972','2020-02-16 22:29:44.674138',0,1,1,1,''),(103,4,NULL,'Posters of the local rock band were displayed in store windows to promote the sale of their _____ tickets.',1,0,0,'2019-12-26 00:02:19.550592','2019-12-29 07:52:45.445505',0,1,1,1,''),(104,4,NULL,'Maria didn’t want to deliver the bad news to David about his failing the job interview. She herself was quite _____ about it.',1,1,0,'2019-12-26 00:03:11.445915','2020-02-24 11:14:44.890368',0,1,1,1,''),(105,4,NULL,'The newcomer speaks with a strong Irish _____; he must be from Ireland.',1,1,0,'2019-12-26 00:03:58.416180','2020-03-17 00:31:53.047010',0,1,1,1,''),(106,4,NULL,'Although Maggie has been physically _____ to her wheelchair since the car accident, she does not limit herself to indoor activities.',1,1,0,'2019-12-26 00:04:53.752826','2020-02-24 11:14:44.897399',0,1,1,1,''),(107,4,NULL,'All passengers riding in cars are required to fasten their seatbelts in order to reduce the risk of _____ in case of an accident.',1,0,0,'2019-12-26 00:05:52.019692','2020-02-16 22:29:44.670378',0,1,1,1,''),(108,4,NULL,'The principal of this school is a man of exceptional _____. He sets aside a part of his salary for a\r\nscholarship fund for children from needy families.',1,0,0,'2019-12-26 00:15:53.205410','2019-12-31 07:36:05.384021',0,1,1,1,''),(109,4,NULL,'The science teacher always _____ the use of the laboratory equipment before she lets her students use it on their own.',1,0,0,'2019-12-26 00:16:45.679511','2020-02-16 22:31:39.456825',0,1,1,1,''),(110,4,NULL,'Most of the area is covered by woods, where bird species are so _____ that it is a paradise for\r\nbirdwatchers.',1,0,0,'2019-12-26 00:17:32.236214','2019-12-29 07:55:33.491791',0,1,1,1,''),(111,4,NULL,'In most cases, the committee members can reach agreement quickly. _____, however, they differ\r\ngreatly in opinion and have a hard time making decisions.\r\n',1,2,0,'2019-12-26 00:18:10.994916','2020-03-16 02:38:05.241126',0,1,1,1,''),(112,4,NULL,'Many people try to save a lot of money before _____, since having enough money would give them a\r\nsense of security for their future.',1,1,0,'2019-12-26 00:18:52.005813','2020-02-20 11:31:36.459718',0,1,1,1,''),(113,4,NULL,'In winter, our skin tends to become dry and _____, a problem which is usually treated by applying\r\nlotions or creams.',1,0,0,'2019-12-26 00:19:29.820016','2020-02-16 22:31:39.460666',0,1,1,1,''),(114,4,NULL,'Benson married Julie soon after he had _____ her heart and gained her parents’ approval.',1,0,0,'2019-12-26 00:20:11.296244','2020-02-16 22:29:44.641026',0,1,1,1,''),(115,4,NULL,'The recent flood completely _____ my parents’ farm. The farmhouse and fruit trees were all gone and\r\nnothing was left.',1,1,0,'2019-12-26 00:20:51.224284','2020-02-24 11:14:44.904903',0,1,1,1,''),(116,4,NULL,'The results of this survey are not reliable because the people it questioned were not a typical or _____ sample of the entire population that was studied.',1,0,0,'2019-12-26 00:21:34.775035','2020-02-16 22:29:44.677404',0,1,1,1,''),(117,4,NULL,'In line with the worldwide green movement, carmakers have been working hard to make their new\r\nmodels more _____ friendly to reduce pollution.',1,0,0,'2019-12-26 00:22:25.904673','2020-01-04 21:29:45.178508',0,1,1,1,''),(125,1,'/media/question_125',NULL,1,0,0,'2019-12-26 03:09:41.553574','2019-12-31 07:18:27.200229',0,1,1,1,''),(126,1,'/media/question_126',NULL,1,0,0,'2019-12-26 03:22:19.579554','2020-01-13 11:38:10.342565',0,1,1,1,''),(127,1,'/media/question_127',NULL,1,0,0,'2019-12-26 03:27:43.982979','2019-12-31 07:18:27.211187',0,1,1,1,''),(128,1,'/media/question_128',NULL,1,1,0,'2019-12-26 03:30:18.122344','2020-03-16 21:53:30.283845',0,1,1,1,''),(129,1,'/media/question_129',NULL,1,1,0,'2019-12-26 03:33:19.089663','2020-02-28 02:48:50.565330',0,1,1,1,''),(130,1,'/media/question_130',NULL,1,2,0,'2019-12-26 03:37:09.229280','2020-03-16 21:53:30.279518',0,1,1,1,''),(131,1,'/media/question_131',NULL,1,0,0,'2019-12-26 06:04:50.722261','2019-12-31 07:18:27.222232',0,1,1,1,''),(132,1,'/media/question_132',NULL,1,0,0,'2019-12-26 06:08:58.012976','2019-12-29 08:11:47.317205',0,1,1,1,''),(133,1,'/media/question_133',NULL,1,0,0,'2019-12-26 06:11:53.890894','2020-01-04 12:34:56.776363',0,1,1,1,''),(134,1,'/media/question_134',NULL,1,0,0,'2019-12-26 06:17:00.972463','2020-01-13 11:38:10.355838',0,1,1,1,''),(135,1,'/media/question_135',NULL,1,1,0,'2019-12-26 06:20:19.431249','2020-02-28 02:48:50.532459',0,1,1,1,''),(136,1,'/media/question_136',NULL,1,0,0,'2019-12-26 06:23:48.337419','2020-02-11 11:07:12.842519',0,1,1,1,''),(137,1,'/media/question_137',NULL,1,0,0,'2019-12-26 06:26:58.197782','2019-12-31 07:54:35.212413',0,1,1,1,''),(138,1,'/media/question_138',NULL,1,0,0,'2019-12-26 06:32:30.462517','2019-12-29 08:19:41.911807',0,2,1,1,'聽不太懂'),(139,1,'/media/question_139',NULL,1,1,0,'2019-12-26 06:35:12.781862','2020-03-16 21:52:38.578517',0,1,1,1,''),(140,1,'/media/question_140',NULL,1,1,0,'2019-12-26 06:39:23.967520','2020-02-28 02:21:15.942931',0,1,1,1,''),(141,1,'/media/question_141',NULL,1,0,0,'2019-12-26 06:42:31.268421','2020-02-11 11:07:12.832445',0,1,1,1,''),(142,1,'/media/question_142',NULL,1,0,0,'2019-12-26 06:46:30.796314','2020-01-04 12:34:56.783912',0,1,1,1,''),(143,1,'/media/question_143',NULL,1,1,0,'2019-12-26 06:49:39.177467','2020-02-28 02:48:50.541024',0,1,1,1,''),(144,1,'/media/question_144',NULL,1,2,0,'2019-12-26 06:54:08.787461','2020-03-16 21:52:38.576177',0,1,1,1,''),(145,1,'/media/question_145',NULL,1,1,0,'2019-12-26 07:07:02.339676','2020-02-28 02:21:15.945941',0,1,1,1,''),(146,1,'/media/question_146',NULL,1,0,0,'2019-12-26 07:13:59.679023','2020-02-12 00:36:29.358770',0,1,1,1,''),(147,1,'/media/question_147',NULL,1,1,0,'2019-12-26 07:17:00.663406','2020-02-28 02:48:50.563758',0,1,1,1,''),(148,1,'/media/question_148',NULL,1,0,0,'2019-12-26 07:23:00.514240','2020-02-11 11:07:12.839935',0,1,1,1,''),(149,1,'/media/question_149',NULL,1,1,0,'2019-12-26 07:26:47.400984','2020-02-28 02:48:50.549349',0,1,1,1,''),(150,1,'/media/question_150',NULL,1,0,0,'2019-12-26 07:41:56.109196','2020-02-17 22:49:36.025898',0,1,1,1,'雖然可以選出答案，但是音檔缺少問句的部分'),(151,1,'/media/question_151',NULL,1,0,0,'2019-12-26 07:45:42.139566','2019-12-29 08:31:26.014425',0,1,1,1,''),(152,1,'/media/question_152',NULL,1,0,0,'2019-12-26 07:50:29.395450','2020-01-04 12:34:56.789016',0,1,1,1,''),(153,1,'/media/question_153',NULL,1,1,0,'2019-12-26 07:53:08.891499','2020-02-28 02:48:50.535106',0,1,1,1,''),(154,1,'/media/question_154',NULL,1,1,0,'2019-12-26 07:58:00.692136','2020-02-28 02:48:50.520625',0,1,1,1,''),(155,1,'/media/question_155',NULL,1,0,0,'2019-12-31 00:46:56.236122','2020-02-12 00:36:29.378932',0,1,1,1,''),(156,1,'/media/question_156',NULL,1,0,0,'2019-12-31 00:54:23.533230','2020-02-17 22:49:36.041641',0,1,1,1,''),(157,1,'/media/question_157',NULL,1,0,0,'2019-12-31 00:55:37.802431','2020-01-05 15:12:37.081029',0,1,1,1,''),(158,1,'/media/question_158',NULL,1,0,0,'2019-12-31 00:57:01.360611','2020-01-13 11:38:10.340016',0,1,1,1,''),(159,1,'/media/question_159',NULL,1,0,0,'2019-12-31 00:58:11.312295','2020-02-17 09:55:58.395627',0,1,1,1,''),(160,1,'/media/question_160',NULL,1,0,0,'2019-12-31 01:00:01.545383','2020-02-17 22:49:36.066243',0,1,1,1,''),(161,1,'/media/question_161',NULL,1,0,0,'2019-12-31 01:01:05.176691','2020-01-05 15:22:34.277400',0,2,1,1,'聽不太懂'),(162,1,'/media/question_162',NULL,1,0,0,'2019-12-31 01:02:07.772268','2020-01-05 15:17:20.256638',0,1,1,1,''),(163,1,'/media/question_163',NULL,1,1,0,'2019-12-31 01:03:17.137776','2020-02-28 02:21:15.952967',0,1,1,1,''),(164,1,'/media/question_164',NULL,1,0,0,'2019-12-31 01:04:38.150599','2020-01-05 15:19:45.097489',0,1,1,1,''),(165,1,'/media/question_165',NULL,1,0,0,'2019-12-31 01:06:13.342088','2020-01-05 15:18:19.750306',0,1,1,1,''),(166,1,'/media/question_166',NULL,1,0,0,'2019-12-31 01:08:24.370943','2020-02-12 00:36:29.362661',0,1,1,1,''),(167,1,'/media/question_167',NULL,1,1,0,'2019-12-31 01:10:05.525811','2020-03-16 21:52:38.561857',0,1,1,1,''),(168,1,'/media/question_168',NULL,1,0,0,'2019-12-31 01:11:33.647824','2020-01-05 15:20:26.266459',0,2,1,1,'重複了'),(169,1,'/media/question_169',NULL,1,0,0,'2019-12-31 01:15:53.747340','2020-01-05 15:21:00.423631',0,2,1,1,'重複了'),(170,1,'/media/question_170',NULL,1,0,0,'2019-12-31 01:17:55.752327','2020-01-05 15:22:23.947015',0,2,1,1,'聽不太懂\r\n\r\n'),(171,1,'/media/question_171',NULL,1,0,0,'2019-12-31 01:19:06.620106','2020-02-17 22:49:36.063477',0,1,1,1,''),(172,1,'/media/question_172',NULL,1,0,0,'2019-12-31 01:20:07.903854','2020-01-05 15:22:49.883061',0,1,1,1,''),(173,1,'/media/question_173',NULL,1,0,0,'2019-12-31 01:21:08.906488','2020-01-13 11:38:10.353336',0,1,1,1,''),(174,1,'/media/question_174',NULL,1,0,0,'2019-12-31 01:22:37.554419','2020-03-02 19:58:25.632799',0,6,1,1,'重複'),(175,2,'/media/question_175',NULL,1,0,0,'2019-12-31 01:25:08.452279','2020-01-05 15:24:20.447007',0,1,1,1,''),(176,2,'/media/question_176',NULL,1,0,0,'2019-12-31 01:35:26.171595','2020-01-05 15:24:52.591109',0,1,1,1,''),(177,2,'/media/question_177',NULL,1,0,0,'2019-12-31 01:36:23.550289','2020-01-05 15:25:17.372542',0,1,1,1,''),(178,2,'/media/question_178',NULL,1,1,0,'2019-12-31 03:09:49.996004','2020-03-16 21:53:30.288794',0,1,1,1,''),(179,2,'/media/question_179',NULL,1,0,0,'2019-12-31 03:22:18.400906','2020-01-05 15:25:50.164400',0,1,1,1,''),(180,2,'/media/question_180',NULL,1,1,0,'2019-12-31 03:36:34.520015','2020-03-16 21:53:30.298072',0,1,1,1,''),(181,2,'/media/question_181',NULL,1,0,0,'2019-12-31 03:37:49.760395','2020-01-05 15:26:21.594083',0,1,1,1,''),(182,2,'/media/question_182',NULL,1,1,0,'2019-12-31 03:40:20.103403','2020-03-16 21:53:30.293221',0,1,1,1,''),(183,2,'/media/question_183',NULL,1,1,0,'2019-12-31 03:41:32.399519','2020-03-16 21:53:30.290916',0,1,1,1,''),(184,2,'/media/question_184',NULL,1,0,0,'2019-12-31 03:43:09.988883','2020-01-05 15:27:52.779861',0,1,1,1,''),(186,1,'/media/question_186',NULL,1,1,0,'2020-01-01 16:02:50.237482','2020-02-28 02:48:50.552126',0,1,1,1,''),(187,1,'/media/question_187',NULL,1,0,0,'2020-01-01 16:05:52.080960','2020-01-05 15:28:38.978722',0,1,1,1,''),(188,1,'/media/question_188',NULL,1,0,0,'2020-01-01 16:07:35.962083','2020-02-17 09:55:58.379100',0,1,1,1,''),(189,1,'/media/question_189',NULL,1,0,0,'2020-01-01 16:10:14.396142','2020-01-05 15:29:24.297734',0,1,1,1,''),(190,1,'/media/question_190',NULL,1,0,0,'2020-01-01 16:11:52.280240','2020-01-05 15:29:40.840022',0,1,1,1,''),(191,1,'/media/question_191',NULL,1,0,0,'2020-01-01 16:13:13.976888','2020-01-05 15:29:57.669338',0,1,1,1,''),(192,1,'/media/question_192',NULL,1,1,0,'2020-01-01 16:15:31.756286','2020-02-28 02:21:15.939692',0,1,1,1,''),(193,1,'/media/question_193',NULL,1,1,0,'2020-01-01 16:16:28.205044','2020-02-28 02:48:50.524329',0,1,1,1,''),(194,1,'/media/question_194',NULL,1,0,0,'2020-01-01 16:17:21.729672','2020-03-09 21:01:20.329743',0,1,1,1,''),(195,1,'/media/question_195',NULL,1,1,0,'2020-01-01 16:19:14.579817','2020-03-16 21:52:38.568658',0,1,1,1,''),(196,1,'/media/question_196',NULL,1,0,0,'2020-01-01 16:20:05.224447','2020-02-17 09:55:58.403071',0,1,1,1,''),(197,1,'/media/question_197',NULL,1,0,0,'2020-01-01 16:22:03.613290','2020-01-07 18:49:53.086362',0,1,1,1,''),(198,1,'/media/question_198',NULL,1,2,0,'2020-01-01 16:23:41.872538','2020-03-16 21:52:38.566458',0,1,1,1,''),(199,1,'/media/question_199',NULL,1,0,0,'2020-01-01 16:24:42.730861','2020-01-05 15:35:01.591084',0,1,1,1,''),(200,1,'/media/question_200',NULL,1,1,0,'2020-01-01 16:25:42.844632','2020-02-28 02:21:15.949000',0,1,1,1,''),(201,1,'/media/question_201',NULL,1,0,0,'2020-01-01 23:47:09.940770','2020-01-05 15:37:08.170545',0,1,1,1,''),(202,1,'/media/question_202',NULL,1,1,0,'2020-01-01 23:48:31.777422','2020-02-28 02:48:50.567157',0,1,1,1,''),(203,1,'/media/question_203',NULL,1,0,0,'2020-01-01 23:49:40.747913','2020-02-11 11:07:12.847174',0,1,1,1,''),(204,1,'/media/question_204',NULL,1,0,0,'2020-01-01 23:51:07.607177','2020-01-07 18:49:55.693550',0,1,1,1,''),(205,1,'/media/question_205',NULL,1,1,0,'2020-01-02 00:12:15.013826','2020-02-28 02:48:50.562081',0,1,1,1,''),(206,1,'/media/question_206',NULL,1,0,0,'2020-01-02 00:15:34.706242','2020-02-12 00:36:29.368854',0,1,1,1,''),(207,1,'/media/question_207',NULL,1,0,0,'2020-01-02 00:16:36.994048','2020-02-17 09:55:58.388113',0,1,1,1,''),(208,1,'/media/question_208',NULL,1,1,0,'2020-01-02 00:18:15.199358','2020-03-16 21:52:38.571309',0,1,1,1,''),(209,1,'/media/question_209',NULL,1,1,0,'2020-01-02 00:19:25.499366','2020-02-28 02:48:50.546761',0,1,1,1,''),(210,1,'/media/question_210',NULL,1,0,0,'2020-01-02 03:13:02.891840','2020-01-05 15:44:15.737317',0,1,1,1,''),(211,1,'/media/question_211',NULL,1,2,0,'2020-01-02 03:16:06.203910','2020-03-16 21:53:30.281549',0,1,1,1,''),(212,1,'/media/question_212',NULL,1,0,0,'2020-01-02 03:18:03.862115','2020-01-05 15:45:15.955899',0,1,1,1,''),(213,1,'/media/question_213',NULL,1,1,0,'2020-01-02 03:20:28.900512','2020-02-28 02:48:50.558144',0,1,1,1,''),(214,1,'/media/question_214',NULL,1,0,0,'2020-01-02 03:22:59.682877','2020-01-05 15:46:17.296623',0,1,1,1,''),(215,1,'/media/question_215',NULL,1,0,0,'2020-01-02 03:25:33.637488','2020-01-13 11:38:10.351524',0,1,1,1,''),(216,1,'/media/question_216',NULL,1,0,0,'2020-01-02 03:27:29.396692','2020-01-02 03:27:36.175487',0,3,1,NULL,''),(217,1,'/media/question_217',NULL,1,1,0,'2020-01-02 03:29:05.277246','2020-03-16 21:52:38.563896',0,1,1,1,''),(218,1,'/media/question_218',NULL,1,0,0,'2020-01-02 03:30:11.193289','2020-01-05 15:53:10.375314',0,1,1,1,''),(219,1,'/media/question_219',NULL,1,0,0,'2020-01-02 03:31:42.891768','2020-01-05 15:49:41.582991',0,1,1,1,''),(220,1,'/media/question_220',NULL,1,1,0,'2020-01-02 03:35:04.615173','2020-03-16 21:52:38.557838',0,1,1,1,''),(221,1,'/media/question_221',NULL,1,0,0,'2020-01-02 03:43:08.392012','2020-01-02 03:43:16.942765',0,3,1,NULL,''),(222,1,'/media/question_222',NULL,1,1,0,'2020-01-02 14:32:19.212100','2020-02-28 02:48:50.560134',0,1,1,1,''),(223,1,'/media/question_223',NULL,1,0,0,'2020-01-02 14:34:10.631745','2020-01-02 14:34:18.504946',0,3,1,NULL,''),(224,1,'/media/question_224',NULL,1,0,0,'2020-01-02 14:35:55.005009','2020-01-02 14:36:03.328703',0,3,1,NULL,''),(225,1,'/media/question_225',NULL,1,0,0,'2020-01-02 14:37:26.922694','2020-02-17 18:39:57.367232',0,1,1,1,''),(226,1,'/media/question_226',NULL,1,0,0,'2020-01-02 14:39:47.878449','2020-01-02 14:39:56.723049',0,3,1,NULL,''),(227,1,'/media/question_227',NULL,1,0,0,'2020-01-02 14:43:14.930114','2020-01-02 14:43:22.563619',0,3,1,NULL,''),(228,1,'/media/question_228',NULL,1,0,0,'2020-01-02 14:46:26.029960','2020-01-02 14:46:33.900555',0,3,1,NULL,''),(229,1,'/media/question_229',NULL,1,0,0,'2020-01-02 15:18:20.186313','2020-01-02 15:18:31.958765',0,3,1,NULL,''),(230,1,'/media/question_230',NULL,1,0,0,'2020-01-02 15:19:26.414794','2020-01-02 15:19:33.347365',0,3,1,NULL,''),(231,1,'/media/question_231',NULL,1,0,0,'2020-01-02 15:20:12.842126','2020-01-02 15:31:09.071994',0,3,1,NULL,''),(232,1,'/media/question_232',NULL,1,0,0,'2020-01-02 15:21:07.245042','2020-01-02 15:31:06.483094',0,3,1,NULL,''),(233,1,'/media/question_233',NULL,1,0,0,'2020-01-02 15:21:45.726040','2020-01-02 15:31:04.107501',0,3,1,NULL,''),(234,1,'/media/question_234',NULL,1,0,0,'2020-01-02 15:22:44.457560','2020-01-02 15:31:01.780248',0,3,1,NULL,''),(235,2,'/media/question_235',NULL,1,0,0,'2020-01-02 15:23:58.097504','2020-01-02 15:30:59.106867',0,3,1,NULL,''),(236,2,'/media/question_236',NULL,1,0,0,'2020-01-02 15:24:37.810894','2020-02-17 18:36:15.394533',0,1,1,1,''),(237,2,'/media/question_237',NULL,1,0,0,'2020-01-02 15:25:48.764638','2020-01-02 15:30:53.710312',0,3,1,NULL,''),(238,2,'/media/question_238',NULL,1,0,0,'2020-01-02 15:26:27.477890','2020-02-17 18:37:42.008539',0,1,1,1,''),(239,2,'/media/question_239',NULL,1,0,0,'2020-01-02 15:27:22.088590','2020-01-02 15:30:47.934735',0,3,1,NULL,''),(240,2,'/media/question_240',NULL,1,0,0,'2020-01-02 15:28:04.153013','2020-01-02 15:30:45.457853',0,3,1,NULL,''),(241,2,'/media/question_241',NULL,1,0,0,'2020-01-02 15:28:41.584090','2020-01-02 15:30:42.867420',0,3,1,NULL,''),(242,2,'/media/question_242',NULL,1,0,0,'2020-01-02 15:29:17.535518','2020-01-02 15:30:40.322843',0,3,1,NULL,''),(243,2,'/media/question_243',NULL,1,0,0,'2020-01-02 15:29:50.534627','2020-02-17 18:38:38.051368',0,1,1,1,''),(244,2,'/media/question_244',NULL,1,0,0,'2020-01-02 15:30:25.738837','2020-01-02 15:30:34.744566',0,3,1,NULL,''),(245,1,'/media/question_245',NULL,1,0,0,'2020-01-02 16:24:50.751925','2020-01-02 16:24:58.264385',0,3,1,NULL,''),(246,1,'/media/question_246',NULL,1,0,0,'2020-01-02 16:25:25.555041','2020-01-02 16:25:31.265698',0,3,1,NULL,''),(247,1,'/media/question_247',NULL,1,0,0,'2020-01-02 16:26:05.587564','2020-01-02 16:26:11.366827',0,3,1,NULL,''),(248,1,'/media/question_248',NULL,1,0,0,'2020-01-02 16:26:43.678631','2020-01-02 16:26:48.644293',0,3,1,NULL,''),(249,1,'/media/question_249',NULL,1,0,0,'2020-01-02 16:27:15.779198','2020-01-02 16:27:20.239834',0,3,1,NULL,''),(250,1,'/media/question_250',NULL,1,0,0,'2020-01-02 16:27:57.094970','2020-01-02 16:28:03.161953',0,3,1,NULL,''),(251,1,'/media/question_251',NULL,1,0,0,'2020-01-02 16:28:31.802595','2020-01-02 16:28:37.276263',0,3,1,NULL,''),(253,1,'/media/question_253',NULL,1,0,0,'2020-01-02 16:29:13.338635','2020-01-02 16:29:19.424392',0,3,1,NULL,''),(254,1,'/media/question_254',NULL,1,0,0,'2020-01-02 16:34:51.251249','2020-01-02 16:34:56.158289',0,3,1,NULL,''),(255,1,'/media/question_255',NULL,1,0,0,'2020-01-02 16:35:21.544493','2020-01-02 16:35:27.366406',0,3,1,NULL,''),(256,1,'/media/question_256',NULL,1,0,0,'2020-01-02 16:35:57.793308','2020-02-17 22:49:36.051229',0,1,1,1,''),(257,1,'/media/question_257',NULL,1,0,0,'2020-01-02 16:36:45.200118','2020-01-07 18:49:50.847223',0,1,1,1,''),(258,1,'/media/question_258',NULL,1,0,0,'2020-01-02 16:37:18.785821','2020-01-05 14:26:38.306852',0,1,1,1,''),(259,1,'/media/question_259',NULL,1,0,0,'2020-01-02 16:37:58.174302','2020-01-05 14:27:02.097501',0,1,1,1,''),(260,1,'/media/question_260',NULL,1,0,0,'2020-01-02 16:38:37.076677','2020-01-05 14:27:29.898205',0,1,1,1,''),(261,1,'/media/question_261',NULL,1,0,0,'2020-01-02 16:39:14.654273','2020-01-05 14:28:05.744955',0,1,1,1,''),(262,1,'/media/question_262',NULL,1,0,0,'2020-01-02 16:39:54.846016','2020-01-05 14:29:09.118173',0,1,1,1,''),(263,1,'/media/question_263',NULL,1,1,0,'2020-01-02 16:40:40.790361','2020-02-28 02:21:15.951204',0,1,1,1,''),(264,1,'/media/question_264',NULL,1,0,0,'2020-01-02 16:41:21.842370','2020-02-17 09:55:58.390935',0,1,1,1,''),(265,1,'/media/question_265',NULL,1,0,0,'2020-01-02 16:41:58.145047','2020-01-05 14:30:33.512520',0,1,1,1,''),(266,1,'/media/question_266',NULL,1,0,0,'2020-01-02 16:42:40.402035','2020-01-05 14:30:49.633600',0,1,1,1,''),(267,1,'/media/question_267',NULL,1,0,0,'2020-01-02 16:43:18.001049','2020-01-05 14:32:13.156813',0,1,1,1,''),(268,1,'/media/question_268',NULL,1,0,0,'2020-01-02 16:43:53.009901','2020-02-12 00:36:29.356200',0,1,1,1,''),(269,1,'/media/question_269',NULL,1,0,0,'2020-01-02 16:44:28.553077','2020-01-13 11:38:10.336864',0,1,1,1,''),(270,1,'/media/question_270',NULL,1,1,0,'2020-01-02 16:45:11.022337','2020-03-16 21:53:30.275447',0,1,1,1,''),(271,1,'/media/question_271',NULL,1,0,0,'2020-01-02 16:45:52.218651','2020-01-05 14:34:35.582578',0,1,1,1,''),(272,1,'/media/question_272',NULL,1,0,0,'2020-01-02 16:46:26.843378','2020-01-05 14:34:58.416253',0,1,1,1,''),(273,1,'/media/question_273',NULL,1,0,0,'2020-01-02 16:47:05.133520','2020-01-05 14:36:24.626508',0,1,1,1,''),(274,1,'/media/question_274',NULL,1,0,0,'2020-01-02 16:47:38.563030','2020-01-05 14:37:07.882842',0,1,1,1,''),(275,1,'/media/question_275',NULL,1,1,0,'2020-01-02 16:48:19.844277','2020-02-28 02:21:15.956365',0,1,1,1,''),(276,1,'/media/question_276',NULL,1,1,0,'2020-01-02 16:48:57.950132','2020-03-16 21:52:38.559924',0,1,1,1,''),(277,1,'/media/question_277',NULL,1,0,0,'2020-01-02 16:49:54.338822','2020-02-17 09:55:58.410582',0,1,1,1,''),(278,1,'/media/question_278',NULL,1,0,0,'2020-01-02 16:53:59.921940','2020-02-11 11:07:12.829189',0,1,1,1,''),(279,1,'/media/question_279',NULL,1,0,0,'2020-01-02 16:54:39.007154','2020-02-12 00:36:29.375132',0,1,1,1,''),(280,1,'/media/question_280',NULL,1,0,0,'2020-01-02 16:55:17.770811','2020-01-05 14:40:42.951139',0,1,1,1,''),(281,1,'/media/question_281',NULL,1,1,0,'2020-01-02 16:55:49.089345','2020-02-28 02:48:50.569053',0,1,1,1,''),(282,1,'/media/question_282',NULL,1,0,0,'2020-01-02 16:56:20.370296','2020-01-05 14:41:24.244081',0,1,1,1,''),(283,1,'/media/question_283',NULL,1,0,0,'2020-01-02 16:56:54.991254','2020-01-05 14:41:42.752586',0,1,1,1,''),(284,1,'/media/question_284',NULL,1,0,0,'2020-01-02 16:57:23.739157','2020-02-12 00:36:29.340379',0,1,1,1,''),(285,1,'/media/question_285',NULL,1,0,0,'2020-01-02 16:57:55.602738','2020-01-05 14:42:54.888778',0,1,1,1,''),(286,1,'/media/question_286',NULL,1,0,0,'2020-01-02 16:58:25.652093','2020-01-05 14:46:25.212666',0,1,1,1,''),(287,1,'/media/question_287',NULL,1,0,0,'2020-01-02 16:59:01.474151','2020-01-05 14:46:50.852417',0,1,1,1,''),(288,1,'/media/question_288',NULL,1,2,0,'2020-01-02 16:59:36.062098','2020-02-28 02:48:50.527400',0,1,1,1,''),(289,1,'/media/question_289',NULL,1,0,0,'2020-01-02 17:00:08.406622','2020-01-05 14:47:43.930236',0,1,1,1,''),(290,1,'/media/question_290',NULL,1,0,0,'2020-01-02 17:00:46.717024','2020-01-05 14:48:07.703677',0,1,1,1,''),(291,1,'/media/question_291',NULL,1,0,0,'2020-01-02 17:01:34.535043','2020-02-12 00:36:29.372657',0,1,1,1,''),(292,1,'/media/question_292',NULL,1,2,0,'2020-01-02 17:02:13.898856','2020-03-16 21:53:30.285925',0,1,1,1,''),(293,1,'/media/question_293',NULL,1,0,0,'2020-01-02 17:02:47.136140','2020-01-05 14:50:52.765982',0,1,1,1,''),(294,1,'/media/question_294',NULL,1,0,0,'2020-01-02 17:03:19.339940','2020-01-05 14:51:10.830035',0,1,1,1,''),(295,1,'/media/question_295',NULL,1,2,0,'2020-01-02 17:03:56.039821','2020-02-28 02:48:50.529144',0,1,1,1,''),(296,2,'/media/question_296',NULL,1,0,0,'2020-01-02 17:06:48.471096','2020-01-05 14:57:03.195584',0,1,1,1,''),(297,2,'/media/question_297',NULL,1,0,0,'2020-01-02 17:07:23.639309','2020-01-05 14:57:32.881618',0,1,1,1,''),(298,2,'/media/question_298',NULL,1,0,0,'2020-01-02 17:07:59.474161','2020-01-05 14:58:10.046530',0,1,1,1,''),(299,2,'/media/question_299',NULL,1,0,0,'2020-01-02 17:09:02.910464','2020-01-05 14:58:30.180194',0,1,1,1,''),(300,2,'/media/question_300',NULL,1,0,0,'2020-01-02 17:09:37.001828','2020-01-05 14:58:57.977910',0,1,1,1,''),(301,2,'/media/question_301',NULL,1,0,0,'2020-01-02 17:10:09.957856','2020-02-27 13:33:25.949282',0,3,1,1,'He back aches.選項有問題'),(302,2,'/media/question_302',NULL,1,0,0,'2020-01-02 17:10:43.221566','2020-01-05 15:08:05.127164',0,1,1,1,''),(303,2,'/media/question_303',NULL,1,0,0,'2020-01-02 17:11:27.349246','2020-01-05 15:08:22.777899',0,1,1,1,''),(304,2,'/media/question_304',NULL,1,1,0,'2020-01-02 17:12:00.584808','2020-03-16 21:53:30.295627',0,1,1,1,''),(305,2,'/media/question_305',NULL,1,0,0,'2020-01-02 17:12:35.417227','2020-01-05 15:10:39.790291',0,1,1,1,''),(339,5,NULL,'Got a bug bite problem? Many people who are troubled by skin rashes caused by bug bites use\r\n“foggers,” or “bug bombs,” to get rid of the annoying crawlers in their homes. Many people think these bug killers or pesticides will penetrate every place where the insects hide. Actually, quite the opposite is true. Once the pests detect the chemical fog in the room, they’ll hide themselves in walls or other hideaways, where you’ll never be able to treat them effectively.\r\nOhio State University researchers tested three commercially sold foggers in a study on the effect of foggers on bedbugs. After testing these brands on five different groups of live bedbugs for two hours, the scientists saw that the foggers had little—if any—effect on the insects. The researchers said bedbugs hide in cracks and crevices such as under sheets and mattresses, or deep in carpets where foggers won’t reach. Moreover, bugs that do come in contact with the mist may be resistant to the pesticide.\r\nFoggers, or bug bombs, should really be a measure of last resort. First of all, the gases used in bug bombs are highly flammable and thus pose a serious risk of fire or explosion if the product is not used properly. Second, once a bug bomb is used, every surface in your home will be covered with the toxic pesticide. When you use a bug bomb, a chemical mixture rains down on your counters, furniture, floors, and walls, leaving behind oily and toxic substances. Your health might thus be endangered. Therefore, it is suggested that people leave the problem to the professionals.\r\n\r\nWhat is this passage mainly about?',1,3,0,'2020-02-20 10:27:20.702517','2020-02-28 11:37:58.383105',0,1,1,1,''),(340,5,NULL,'Earworms often take the form of song fragments rather than entire songs, and the song is usually a familiar one. Researchers are not sure why some songs are more likely to get stuck in our heads than others, but everyone has their own tunes. Often those songs have a simple, upbeat melody and catchy, repetitive lyrics, such as popular commercial jingles and slightly annoying radio hits. Recent or repeated exposure to a song or even a small part of a song can also trigger earworms, as can word associations, such as a phrase similar to the lyrics of a song.\r\nWhile earworms might be annoying, most people who experience them nevertheless report that they are pleasant or at least neutral. Only a third of people are disturbed by the song in their heads. How people cope with their earworms seems to depend on how they feel about them. Those who have positive feelings about their stuck songs prefer to just “let them be,” while those with negative feelings turn to more behavioral responses, which include coping strategies such as singing, talking, or even praying.\r\n\r\nAccording to the passage, which of the following is true about an earworm?',1,4,0,'2020-02-20 11:03:59.831897','2020-03-16 22:14:39.224458',0,1,1,1,''),(341,5,NULL,'Angelfish, often found in the warm seas and coral reefs, are among the most brightly colored fish of\r\nthe ocean. Brilliant colors and stripes form amazing patterns on their body. These patterns actually help the fish to hide from danger among roots and plants. At night, when these fish become inactive, their colors may become pale. Often, the young ones are differently colored than the adults. Some scientists believe that the color difference between the young and the old indicates their different social positions.\r\nAnother interesting fact about angelfish is that they have an occupation in the fish world. Most of them act as cleaners for other fish and pick dead tissue from their bodies. This is not their food, though. Their diet consists mainly of sponge and algae.\r\n\r\nWhat is the job of an angelfish in the sea?',1,3,0,'2020-02-20 11:27:34.292146','2020-02-28 11:37:58.314740',0,1,1,1,''),(342,5,NULL,'Redwood trees are the tallest plants on the earth, reaching heights of up to 100 meters. They are also known for their longevity, typically 500 to 1000 years, but sometimes more than 2000 years. A hundred million years ago, in the age of dinosaurs, redwoods were common in the forests of a much more moist and tropical North America. As the climate became drier and colder, they retreated to a narrow strip along the Pacific coast of Northern California.\r\nThe trunk of redwood trees is very stout and usually forms a single straight column. It is covered with a beautiful soft, spongy bark. This bark can be pretty thick, well over two feet in the more mature trees. It gives the older trees a certain kind of protection from insects, but the main benefit is that it keeps the center of the tree intact from moderate forest fires because of its thickness. This fire resistant quality explains why the giant redwood grows to live that long. While most other types of trees are destroyed by forest fires, the giant redwood actually prospers because of them. Moderate fires will clear the ground of competing plant life, and the rising heat dries and opens the ripe cones of the redwood, releasing many thousands of seeds onto the ground below.\r\nNew trees are often produced from sprouts, little baby trees, which form at the base of the trunk. These sprouts grow slowly, nourished by the root system of the “mother” tree. When the main tree dies, the sprouts are then free to grow as full trees, forming a “fairy ring” of trees around the initial tree. These trees, in turn, may give rise to more sprouts, and the cycle continues.\r\n\r\nWhy were redwood trees more prominent in the forests of North America millions of years ago?',1,0,0,'2020-02-29 15:34:53.444568','2020-02-29 17:45:13.521720',0,1,1,5,''),(343,5,NULL,'It was something she had dreamed of since she was five. Finally, after years of training and intensive workouts, Deborah Duffey was going to compete in her first high school basketball game. The goals of becoming an outstanding player and playing college ball were never far from Deborah’s mind.\r\nThe game was against Mills High School. With 1:42 minutes left in the game, Deborah’s team led by one point. A player of Mills had possession of the ball, and Deborah ran to guard against her. As Deborah shuffled sideways to block the player, her knee went out and she collapsed on the court in burning pain. Just like that, Deborah’s season was over.\r\nAfter suffering the bad injury, Deborah found that, for the first time in her life, she was in a situation beyond her control. Game after game, she could do nothing but sit on the sidelines watching others play the game that she loved so much.\r\nInjuries limited Deborah’s time on the court as she hurt her knees three more times in the next five years. She had to spend countless hours in a physical therapy clinic to receive treatment. Her frequent visits there gave her a passion and respect for the profession. And Deborah began to see a new light in her life.\r\nCurrently a senior in college, Deborah focuses on pursuing a degree in physical therapy. After she graduates, Deborah plans to use her knowledge to educate people how to best take care of their bodies\r\nand cope with the feelings of hopelessness that she remembers so well.\r\n\r\nWhat is the best title for this passage?',1,1,0,'2020-02-29 15:39:29.093587','2020-03-16 22:14:39.219206',0,1,1,5,''),(344,5,NULL,'It is easy for us to tell our friends from our enemies. But can other animals do the same? Elephants\r\ncan! They can use their sense of vision and smell to tell the difference between people who pose a threat and those who do not.\r\nIn Kenya, researchers found that elephants react differently to clothing worn by men of the Maasai and Kamba ethnic groups. Young Maasai men spear animals and thus pose a threat to elephants; Kamba men are mainly farmers and are not a danger to elephants.\r\nIn an experiment conducted by animal scientists, elephants were first presented with clean clothing or clothing that had been worn for five days by either a Maasai or a Kamba man. When the elephants detected the smell of clothing worn by a Maasai man, they moved away from the smell faster and took longer to relax than when they detected the smells of either clothing worn by Kamba men or clothing that had not been worn at all.\r\nGarment color also plays a role, though in a different way. In the same study, when the elephants saw red clothing not worn before, they reacted angrily, as red is typically worn by Maasai men. Rather than running away as they did with the smell, the elephants acted aggressively toward the red clothing.\r\nThe researchers believe that the elephants’ emotional reactions are due to their different interpretations of the smells and the sights. Smelling a potential danger means that a threat is nearby and the best thing to do is run away and hide. Seeing a potential threat without its smell means that risk is low. Therefore, instead of showing fear and running away, the elephants express their anger and become aggressive.\r\n\r\nAccording to the passage, which of the following statements is true about Kamba and Maasai people?',1,0,0,'2020-02-29 15:48:45.946223','2020-02-29 17:45:17.732332',0,1,1,5,''),(345,5,NULL,'There is a long-held belief that when meeting someone, the more eye contact we have with the\r\nperson, the better. The result is an unfortunate tendency for people making initial contact—in a job interview, for example—to stare fixedly at the other individual. However, this behavior is likely to make the interviewer feel very uncomfortable. Most of us are comfortable with eye contact lasting a few seconds. But eye contact which persists longer than that can make us nervous.\r\nAnother widely accepted belief is that powerful people in a society—often men—show their dominance over others by touching them in a variety of ways. In fact, research shows that in almost all cases, lower-status people initiate touch. Women also initiate touch more often than men do.\r\nThe belief that rapid speech and lying go together is also widespread and enduring. We react strongly—and suspiciously—to fast talk. However, the opposite is a greater cause for suspicion. Speech that is slow, because it is laced with pauses or errors, is a more reliable indicator of lying than the opposite.\r\n\r\nWhich of the following is NOT discussed in the passage?',1,1,0,'2020-02-29 15:55:36.145688','2020-03-16 22:14:39.226580',0,1,1,5,''),(346,5,NULL,'On the island of New Zealand, there is a grasshopper-like species of insect that is found nowhere else on earth. New Zealanders have given it the nickname weta, which is a native Maori word meaning “god of bad looks.” It’s easy to see why anyone would call this insect a bad-looking bug. Most people feel disgusted at the sight of these bulky, slow-moving creatures.\r\nWetas are nocturnal creatures; they come out of their caves and holes only after dark. A giant weta can grow to over three inches long and weigh as much as 1.5 ounces. Giant wetas can hop up to two feet at a time. Some of them live in trees, and others live in caves. They are very long-lived for insects, and some adult wetas can live as long as two years. Just like their cousins grasshoppers and crickets, wetas are able to “sing” by rubbing their leg parts together, or against their lower bodies.\r\nMost people probably don’t feel sympathy for these endangered creatures, but they do need protecting. The slow and clumsy wetas have been around on the island since the times of the dinosaurs, and have evolved and survived in an environment where they had no enemies until rats came to the island with European immigrants. Since rats love to hunt and eat wetas, the rat population on the island has grown into a real problem for many of the native species that are unaccustomed to its presence, and poses a serious threat to the native weta population.\r\n\r\nWhich of the following descriptions of wetas is accurate?',1,1,0,'2020-02-29 16:42:12.673107','2020-03-16 22:14:39.222141',0,1,1,5,''),(347,5,NULL,'The high school prom is the first formal social event for most American teenagers. It has also been a\r\nrite of passage for young Americans for nearly a century.\r\nThe word “prom” was first used in the 1890s, referring to formal dances in which the guests of a\r\nparty would display their fashions and dancing skills during the evening’s grand march. In the United States, parents and educators have come to regard the prom as an important lesson in social skills. Therefore, proms have been held every year in high schools for students to learn proper social behavior.\r\nThe first high school proms were held in the 1920s in America. By the 1930s, proms were common across the country. For many older Americans, the prom was a modest, home-grown affair in the school gymnasium. Prom-goers were well dressed but not fancily dressed up for the occasion: boys wore jackets and ties and girls their Sunday dresses. Couples danced to music provided by a local amateur band or a record player. After the 1960s, and especially since the 1980s, the high school prom in many areas has become a serious exercise in excessive consumption, with boys renting expensive tuxedos and girls wearing designer gowns. Stretch limousines were hired to drive the prom-goers to expensive restaurants or discos for an all-night extravaganza.\r\nWhether simple or lavish, proms have always been more or less traumatic events for adolescents who worry about self-image and fitting in with their peers. Prom night can be a dreadful experience for socially awkward teens or for those who do not secure dates. Since the 1990s, alternative proms have been organized in some areas to meet the needs of particular students. For example, proms organized by and for homeless youth were reported. There were also “couple-free” proms to which all students are welcome.\r\n\r\nIn what way are high school proms significant to American teenagers?',1,0,0,'2020-02-29 16:48:27.820614','2020-02-29 17:45:11.681537',0,1,1,5,''),(348,5,NULL,'Apple Inc. is an American multinational technology company headquartered in Cupertino, California, that designs, develops, and sells consumer electronics, computer software, and online services. It is considered one of the Big Four technology companies, alongside Amazon, Google, and Facebook.\r\n\r\nThe company\'s hardware products include the iPhone smartphone, the iPad tablet computer, the Mac personal computer, the iPod portable media player, the Apple Watch smartwatch, the Apple TV digital media player, the AirPods wireless earbuds and the HomePod smart speaker. Apple\'s software includes the macOS, iOS, iPadOS, watchOS, and tvOS operating systems, the iTunes media player, the Safari web browser, the Shazam acoustic fingerprint utility, and the iLife and iWork creativity and productivity suites, as well as professional applications like Final Cut Pro, Logic Pro, and Xcode. Its online services include the iTunes Store, the iOS App Store, Mac App Store, Apple Music, Apple TV+, iMessage, and iCloud. Other services include Apple Store, Genius Bar, AppleCare, Apple Pay, Apple Pay Cash, and Apple Card.\r\n\r\nwhich of the following product may not offer by Apple?',1,0,0,'2020-02-29 17:43:24.715578','2020-02-29 17:45:19.261592',0,1,1,5,'');
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
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alcpt_reply`
--

LOCK TABLES `alcpt_reply` WRITE;
/*!40000 ALTER TABLE `alcpt_reply` DISABLE KEYS */;
INSERT INTO `alcpt_reply` VALUES (1,'關我什麼事啊，呵','2020-02-23 01:33:50.539113',1,2),(2,'那我問你幹嘛，低能兒','2020-02-23 01:37:50.539113',5,2),(3,'哎呦，很兇喔！！','2020-02-23 02:11:24.491418',1,2),(4,'到底幫不幫我改啊？','2020-02-23 02:12:30.746804',5,2),(5,'請不要做無意義的回報＠＠','2020-02-23 19:02:49.435326',5,3),(6,'哎呀！用錯人的帳號回覆了，呵','2020-02-23 19:04:20.493221',1,3),(7,'好啦！我知道胖呆企鵝很呆嘛，有必要這樣嗎','2020-02-23 19:05:13.131043',1,3),(8,'好啦！妳想要改什麼名字？','2020-02-23 19:07:40.002028',1,2),(9,'「胖呆企鵝」，呵＠＠','2020-02-23 19:09:34.361760',5,2),(10,'好啦！改好了啦！去看看有沒有變','2020-02-23 19:10:23.881758',1,2),(11,'好啦，有了啦！！','2020-02-23 19:11:01.403308',5,2),(12,'你又要幹嘛啊？','2020-02-24 08:15:21.392032',1,4),(13,'哈哈，沒改到程式碼，沒回到勒，可憐。','2020-02-24 08:22:32.870789',1,4),(14,'你真的是在哭誒，這次該有了吧！','2020-02-24 08:23:10.172645',5,4),(15,'好啦，有了啦，所以你到底要幹嘛啊？','2020-02-24 08:24:19.367790',1,4),(16,'沒幹嘛啊，呵','2020-02-24 08:26:58.854206',5,4),(17,'真的是耍我誒＠＠','2020-02-24 08:32:48.351819',1,4),(18,'你要幹嘛？','2020-02-25 10:41:54.539318',5,6),(19,'不要做沒意義的回報。','2020-02-25 10:42:05.030990',5,6),(20,'哦哦，你管我，好爽喔，呵','2020-02-25 11:03:00.948225',10,6),(21,'我看到了，呵','2020-02-25 11:26:09.148192',5,6),(22,'啊你就，菜啊。','2020-02-25 11:39:43.723612',1,5),(23,'供三小？？','2020-02-25 11:40:30.205109',10,5),(24,'那，你好＠＠','2020-02-25 11:40:40.928889',10,6),(25,'關我屁事啊，呵＠＠','2020-02-27 10:22:01.151197',1,8),(26,'嗨！你好啊＃w＃','2020-02-27 10:22:46.092587',1,6),(27,'試試看而已嘛＠＠','2020-03-03 15:01:09.841416',1,3),(28,'那表示我們系統做得不錯吧','2020-03-12 18:42:42.519036',4,10),(29,'<script>alert(\'Hi\');</script>','2020-03-16 16:19:55.240275',1,5),(30,'<script>\r\n\r\n  alert(\"Hello! I am an alert box!\");\r\n\r\n</script>','2020-03-16 16:24:12.609974',10,6),(31,'你閉嘴','2020-03-17 11:29:44.479837',1,11),(32,'可以的喔，我們會盡快協助您做身份的更改。','2020-03-19 01:06:15.147093',1,13),(33,'已經完成更改，請您再次確認並更改相關資訊，謝謝您。','2020-03-19 01:09:13.024576',1,13),(34,'好的，謝謝喔！','2020-03-19 01:10:03.134981',15,13),(35,'謝謝您的回報，希望您在本系統有更好的體驗＠＠','2020-03-19 01:11:05.106092',1,13);
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alcpt_report`
--

LOCK TABLES `alcpt_report` WRITE;
/*!40000 ALTER TABLE `alcpt_report` DISABLE KEYS */;
INSERT INTO `alcpt_report` VALUES (2,0,0,'我帳號沒辦法改名字。',3,'2020-02-23 00:56:50.539113','2020-02-23 23:09:00.618303',1,1,NULL,NULL),(3,0,0,'很呆很呆',2,'2020-02-23 01:04:09.863238','2020-03-03 15:01:09.869150',4,1,NULL,NULL),(4,0,0,'嗨！我是胖呆企鵝，呵',3,'2020-02-24 08:14:39.841530','2020-02-24 09:06:46.826453',4,5,NULL,1),(5,0,0,'我怎麼沒什麼權限，我也想要其他權限。',3,'2020-02-25 10:29:50.109394','2020-03-16 16:20:22.344427',1,10,NULL,1),(6,0,0,'我想要一直回報，我就是這麼機掰。',2,'2020-02-25 10:33:39.692174','2020-03-16 16:24:12.613466',2,10,NULL,NULL),(7,0,0,'我找不到其他問題，目前。',2,'2020-02-25 11:40:58.862520','2020-02-25 14:18:27.930339',3,10,NULL,NULL),(8,1,0,'我都看不到成績。',2,'2020-02-25 11:41:13.832346','2020-02-27 10:22:01.157678',2,10,NULL,NULL),(9,0,0,'熊熊想回報一下＠＠',2,'2020-02-29 16:44:42.328166','2020-03-02 10:28:50.515720',3,1,NULL,NULL),(10,0,0,'最近都沒遇到什麼問題好回報的誒。',2,'2020-03-12 08:20:31.614809','2020-03-12 18:42:42.543443',3,1,NULL,NULL),(11,0,0,'rytfyfgjygkhkjhikhkihkljkjhihil',3,'2020-03-17 11:26:34.115962','2020-03-17 11:29:46.911882',1,1,NULL,1),(12,0,0,'knjkhjkhjkhkjhkhkhknkknjkhjkhjkhkjhkhkhknkknjkhjkhjkhkjhkhkhknkknjkhjkhjkhkjhkhkhknkknjkhjkhjkhkjhkhkhknkknjkhjkhjkhkjhkhkhknkknjkhjkhjkhkjhkhkhknkknjkhjkhjkhkjhkhkhknkknjkhjkhjkhkjhkhkhknkknjkhjkhjkhkjhkhkhknkknjkhjkhjkhkjhkhkhknkknjkhjkhjkhkjhkhkhknkknjkhjkhjkhkjhkhkhknkknjkhjkhjkhkjhkhkhknkknjkhjkhjkhkjhkhkhknkknjkhjkhjkhkjhkhkhknkknjkhjkhjkhkjhkhkhknkknjkhjkhjkhkjhkhkhknkknjkhjkhjkhkjhkhkhknkknjkhjkhjkhkjhkhkhknkknjkhjkhjkhkjhkhkhknkknjkhjkhjkhkjhkhkhknkknjkhjkhjkhkjhkhkhknkknjkhjkhjkhkjhkhkhknkknjkhjkhjkhkjhkhkhknkknjkhjkhjkhkjhkhkhknkknjkhjkhjkhkjhkhkhknkknjkhjkhjkhkjhkhkhknkknjkhjkhjkhkjhkhkhknkknjkhjkhjkhkjhkhkhknkknjkhjkhjkhkjhkhkhknkknjkhjkhjkhkjhkhkhknkknjkhjkhjkhkjhkhkhknkknjkhjkhjkhkjhkhkhknkknjkhjkhjkhkjhkhkhknkknjkhjkhjkhkjhkhkhknkknjkhjkhjkhkjhkhkhknkknjkhjkhjkhkjhkhkhknkknjkhjkhjkhkjhkhkhknkknjkhjkhjkhkjhkhkhknkknjkhjkhjkhkjhkhkhknkknjkhjkhjkhkjhkhkhknkknjkhjkhjkhkjhkhkhknkknjkhjkhjkhkjhkhkhknkknjkhjkhjkhkjhkhkhknkknjkhjkhjkhkjhkhkhknkknjkhjkhjkhkjhkhkhknkknjkhjkhjkhkjhkhkhknk',2,'2020-03-17 11:27:06.393456','2020-03-17 11:52:57.294338',2,1,NULL,NULL),(13,1,0,'我的Identity是「Vistor」，但我是學生，可以做更改嗎？',3,'2020-03-19 01:05:07.514573','2020-03-19 01:11:07.155966',3,15,NULL,1);
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
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alcpt_reportcategory`
--

LOCK TABLES `alcpt_reportcategory` WRITE;
/*!40000 ALTER TABLE `alcpt_reportcategory` DISABLE KEYS */;
INSERT INTO `alcpt_reportcategory` VALUES (1,'帳號問題',32),(2,'成績問題',16),(3,'其他',32),(4,'胖呆企鵝',18);
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
  CONSTRAINT `alcpt_student_user_id_c43c5a79_fk_alcpt_user_id` FOREIGN KEY (`user_id`) REFERENCES `alcpt_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alcpt_student`
--

LOCK TABLES `alcpt_student` WRITE;
/*!40000 ALTER TABLE `alcpt_student` DISABLE KEYS */;
INSERT INTO `alcpt_student` VALUES (4,'1090630231',109,1,3,12),(5,'Test456',109,2,3,11),(7,'1100630224',110,1,3,5),(8,'Test123',109,1,3,10),(9,'Maxium1997',109,1,3,1),(10,'qaz74159',109,NULL,NULL,2),(12,'FishYi',109,NULL,NULL,7),(13,'1100630220',110,1,3,8),(14,'1100630204',109,NULL,NULL,9),(15,'TerryChi0118',109,1,3,15);
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
  `is_used` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `alcpt_testpaper_created_by_id_def16d7a_fk_alcpt_user_id` (`created_by_id`),
  CONSTRAINT `alcpt_testpaper_created_by_id_def16d7a_fk_alcpt_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `alcpt_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alcpt_testpaper`
--

LOCK TABLES `alcpt_testpaper` WRITE;
/*!40000 ALTER TABLE `alcpt_testpaper` DISABLE KEYS */;
INSERT INTO `alcpt_testpaper` VALUES (1,'第一次模擬考','2020-02-18 10:19:37.503884',1,'2020-03-18 16:23:08.088019',1,1,1),(2,'閱讀練習-2020/02/20 08:49:16','2020-02-20 08:49:16.350835',0,'2020-02-20 08:49:16.367871',0,1,0),(3,'閱讀練習-2020/02/20 08:50:08','2020-02-20 08:50:08.554756',0,'2020-02-20 08:50:08.556261',0,1,0),(4,'閱讀練習-2020/02/20 11:31:36','2020-02-20 11:31:36.477774',0,'2020-02-20 11:31:36.480409',0,1,0),(5,'閱讀練習-2020/02/24 11:14:44','2020-02-24 11:14:44.915616',0,'2020-02-24 11:14:44.917496',0,1,0),(7,'聽力練習-2020/02/28 02:21:15','2020-02-28 02:21:15.959677',0,'2020-02-28 02:21:15.962413',0,1,0),(8,'聽力練習-2020/02/28 02:48:50','2020-02-28 02:48:50.571043',0,'2020-02-28 02:48:50.572613',0,1,0),(9,'閱讀練習-2020/02/28 11:37:58','2020-02-28 11:37:58.386258',0,'2020-02-28 11:37:58.403682',0,1,0),(11,'第二次模擬考','2020-03-04 00:50:08.296303',1,'2020-03-13 09:33:37.883568',0,1,0),(18,'第三次模擬考','2020-03-13 15:17:06.924339',1,'2020-03-13 15:17:06.927349',0,5,0),(19,'閱讀練習-2020/03/16 02:38:05','2020-03-16 02:38:05.243209',0,'2020-03-16 02:38:05.246497',0,1,0),(20,'聽力練習-2020/03/16 21:52:38','2020-03-16 21:52:38.581340',0,'2020-03-16 21:52:38.582753',0,10,0),(21,'聽力練習-2020/03/16 21:53:30','2020-03-16 21:53:30.300390',0,'2020-03-16 21:53:30.302494',0,10,0),(22,'閱讀練習-2020/03/16 22:14:39','2020-03-16 22:14:39.229487',0,'2020-03-16 22:14:39.231647',0,1,0),(23,'閱讀練習-2020/03/16 22:19:34','2020-03-16 22:19:34.120691',0,'2020-03-16 22:19:34.122534',0,1,0),(24,'閱讀練習-2020/03/17 00:31:53','2020-03-17 00:31:53.056974',0,'2020-03-17 00:31:53.058324',0,5,0),(25,'First Mock Exam','2020-03-17 11:46:58.592069',1,'2020-03-18 14:50:57.167763',1,1,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=449 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alcpt_testpaper_question_list`
--

LOCK TABLES `alcpt_testpaper_question_list` WRITE;
/*!40000 ALTER TABLE `alcpt_testpaper_question_list` DISABLE KEYS */;
INSERT INTO `alcpt_testpaper_question_list` VALUES (29,1,1),(17,1,3),(32,1,5),(19,1,6),(34,1,29),(100,1,30),(33,1,31),(31,1,32),(97,1,33),(108,1,35),(37,1,37),(36,1,40),(35,1,41),(28,1,44),(106,1,45),(101,1,47),(93,1,48),(14,1,52),(25,1,53),(155,1,56),(20,1,59),(26,1,63),(22,1,70),(24,1,78),(16,1,80),(18,1,86),(13,1,96),(15,1,99),(23,1,108),(21,1,109),(92,1,110),(74,1,130),(94,1,133),(67,1,135),(68,1,137),(98,1,140),(83,1,141),(82,1,146),(62,1,149),(73,1,150),(85,1,151),(61,1,152),(84,1,155),(63,1,156),(69,1,157),(72,1,166),(51,1,175),(47,1,176),(39,1,177),(40,1,178),(42,1,179),(46,1,180),(48,1,181),(49,1,182),(43,1,183),(41,1,184),(64,1,186),(54,1,187),(56,1,188),(87,1,190),(90,1,191),(66,1,192),(79,1,196),(58,1,201),(81,1,205),(78,1,207),(91,1,208),(89,1,211),(50,1,236),(45,1,238),(96,1,243),(57,1,256),(88,1,257),(59,1,260),(80,1,266),(70,1,269),(75,1,270),(55,1,275),(77,1,276),(60,1,280),(65,1,285),(76,1,288),(71,1,292),(86,1,293),(103,1,297),(104,1,299),(44,1,300),(105,1,302),(53,1,303),(52,1,304),(102,1,305),(152,1,339),(154,1,340),(153,1,341),(190,1,342),(194,1,343),(191,1,344),(193,1,345),(195,1,347),(192,1,348),(111,3,5),(115,3,30),(110,3,31),(112,3,32),(116,3,37),(118,3,40),(113,3,42),(109,3,47),(114,3,48),(117,3,60),(123,4,2),(124,4,52),(120,4,57),(122,4,59),(119,4,85),(121,4,112),(126,4,339),(125,4,340),(127,4,341),(130,5,1),(140,5,3),(128,5,5),(146,5,6),(133,5,29),(137,5,30),(129,5,33),(131,5,37),(136,5,40),(135,5,41),(134,5,47),(132,5,48),(148,5,52),(139,5,64),(138,5,82),(143,5,84),(142,5,96),(141,5,104),(144,5,106),(145,5,111),(147,5,115),(150,5,339),(151,5,340),(149,5,341),(158,7,140),(165,7,144),(159,7,145),(162,7,163),(157,7,192),(160,7,200),(161,7,263),(164,7,275),(163,7,288),(156,7,295),(183,8,129),(174,8,130),(170,8,135),(173,8,143),(182,8,147),(176,8,149),(171,8,153),(166,8,154),(177,8,186),(167,8,193),(172,8,198),(184,8,202),(181,8,205),(175,8,209),(179,8,213),(180,8,222),(185,8,281),(168,8,288),(178,8,292),(169,8,295),(187,9,52),(189,9,339),(188,9,340),(186,9,341),(221,11,1),(208,11,23),(224,11,30),(223,11,31),(214,11,33),(220,11,34),(222,11,35),(217,11,37),(228,11,40),(227,11,41),(218,11,42),(216,11,44),(226,11,45),(215,11,46),(225,11,48),(199,11,51),(235,11,52),(207,11,53),(209,11,54),(203,11,55),(219,11,60),(206,11,63),(202,11,65),(210,11,67),(211,11,69),(198,11,80),(201,11,92),(213,11,99),(200,11,104),(204,11,112),(196,11,113),(237,11,339),(236,11,340),(238,11,341),(230,11,342),(232,11,343),(231,11,344),(229,11,345),(233,11,347),(234,11,348),(239,19,1),(247,19,5),(246,19,30),(248,19,32),(245,19,34),(242,19,37),(241,19,41),(240,19,46),(243,19,47),(253,19,59),(244,19,60),(254,19,69),(255,19,81),(251,19,82),(256,19,85),(249,19,91),(252,19,93),(257,19,97),(250,19,98),(258,19,111),(268,20,139),(267,20,144),(261,20,167),(264,20,195),(263,20,198),(265,20,208),(266,20,211),(262,20,217),(259,20,220),(260,20,276),(272,21,128),(270,21,130),(274,21,178),(278,21,180),(276,21,182),(275,21,183),(271,21,211),(269,21,270),(273,21,292),(277,21,304),(279,22,5),(281,22,32),(280,22,33),(284,22,88),(283,22,90),(282,22,93),(287,22,340),(285,22,343),(288,22,345),(286,22,346),(294,23,29),(297,23,30),(292,23,31),(289,23,32),(290,23,33),(298,23,34),(296,23,35),(293,23,37),(291,23,41),(295,23,43),(301,24,1),(300,24,36),(303,24,42),(299,24,45),(302,24,46),(306,24,70),(307,24,78),(308,24,88),(305,24,93),(304,24,105),(395,25,1),(413,25,3),(402,25,29),(400,25,30),(391,25,31),(396,25,32),(393,25,33),(397,25,34),(389,25,37),(394,25,40),(399,25,41),(392,25,42),(401,25,43),(398,25,46),(403,25,47),(441,25,52),(418,25,54),(416,25,55),(390,25,60),(414,25,63),(411,25,68),(408,25,72),(406,25,74),(417,25,82),(409,25,91),(415,25,95),(407,25,96),(405,25,99),(410,25,103),(404,25,106),(412,25,117),(348,25,144),(333,25,145),(314,25,147),(332,25,150),(322,25,151),(319,25,158),(328,25,163),(317,25,164),(324,25,171),(341,25,172),(428,25,175),(429,25,176),(425,25,177),(421,25,178),(433,25,179),(424,25,180),(434,25,181),(426,25,182),(435,25,183),(427,25,184),(325,25,186),(309,25,188),(343,25,189),(315,25,199),(387,25,201),(342,25,202),(344,25,205),(340,25,207),(347,25,208),(327,25,213),(338,25,215),(339,25,219),(311,25,222),(326,25,225),(432,25,236),(420,25,238),(430,25,243),(388,25,257),(346,25,262),(334,25,266),(318,25,267),(335,25,268),(329,25,271),(312,25,272),(310,25,273),(336,25,275),(323,25,278),(337,25,279),(321,25,280),(320,25,285),(330,25,287),(313,25,289),(345,25,291),(431,25,296),(419,25,297),(422,25,300),(437,25,302),(438,25,303),(436,25,304),(423,25,305),(448,25,339),(439,25,340),(446,25,341),(447,25,342),(444,25,343),(440,25,344),(442,25,345),(443,25,346),(445,25,348);
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
  `reg_id` varchar(50) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `gender` smallint(5) unsigned DEFAULT NULL,
  `identity` smallint(5) unsigned DEFAULT NULL,
  `privilege` smallint(5) unsigned NOT NULL,
  `email` varchar(254) DEFAULT NULL,
  `email_is_verified` tinyint(1) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `introduction` longtext,
  `photo` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `reg_id` (`reg_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alcpt_user`
--

LOCK TABLES `alcpt_user` WRITE;
/*!40000 ALTER TABLE `alcpt_user` DISABLE KEYS */;
INSERT INTO `alcpt_user` VALUES (1,'pbkdf2_sha256$180000$oTBTGig3RK5k$FhXD0UVPuiTiM+u6BsWeJA4pis6KlnTCIPlN6Z4b/2Q=','Maxium1997','蘇典煒',1,2,55,'wei860925@gmail.com',1,'2020-03-19 01:10:37.932159','2019-10-15 12:44:32.551000','2020-03-19 01:10:37.929158','1090630218\r\nNational Defense University\r\nInformation Management','/media/photo_Maxium1997'),(2,'pbkdf2_sha256$36000$TUIs91DOxZeV$E1ZIH0SMU7b5RXdihn2uuskQvEsXbzPT1Q1nsXlAULM=','qaz74159','黃柏豪',1,2,63,'huang@ndu.edu.tw',0,'2020-03-16 23:12:12.033190','2020-02-11 13:02:52.789648',NULL,NULL,NULL),(4,'pbkdf2_sha256$180000$pSz5ws6jqokY$ElB2cOb0dAXOVhZS7qBWBwk5Iv4uAgL0zDBcK2xkQvE=','mcndu0001','袁葆宏',1,3,63,'max_yuan_i@gmail.com',0,'2020-03-12 18:42:01.285952','2020-02-11 14:47:59.132463','2020-03-12 18:42:01.274899',NULL,NULL),(5,'pbkdf2_sha256$180000$NVhxOOrvaAS7$ewf6p5YESu9CRjvd5iccw9T+6ygaTj0MiDeA15DgqwY=','1100630224','劉昀昕',2,2,3,'joy9517538246@gmail.com',0,'2020-03-19 00:59:59.031281','2020-02-12 13:07:00.411616','2020-03-18 15:48:26.485819','<null>',NULL),(6,'pbkdf2_sha256$36000$elhlPtzTiIGd$jDBjm8g0Oex6yslLx0nBbZCCrxxBtprN/DAo6Tm1nrM=','TonyChen9305','陳信綸',1,2,63,'TonyChen9305@gmail.com',0,'2020-03-16 23:14:50.556610','2020-02-12 13:12:58.230412',NULL,NULL,NULL),(7,'pbkdf2_sha256$180000$mGWgaVkhdl5T$w2Ae2vzEAXxUSJUm0ZqlI6+x+sP8/WPRrUvZhg0F/HQ=','FishYi','傅晴俞',2,2,63,'smile@gmail.com',0,'2020-03-18 02:41:31.007248','2020-02-12 13:16:21.354390','2020-03-18 02:41:31.005087',NULL,NULL),(8,'pbkdf2_sha256$36000$PhHNHCjr4bFo$ybfcalycCXj7K22bz4EC5Tk2iEhTT/o24jqJkPLntvk=','1100630220','賴昱婷',2,2,63,'yu_ting_lai@gmail.com',0,'2020-03-18 23:49:18.174857','2020-02-14 13:24:38.246472',NULL,NULL,NULL),(9,'pbkdf2_sha256$36000$qKnoRyVpNbcy$XtOh5uRYoRdxmxQ4wT9Ty1Ao1w9PJrp1bqTmZHyE7WM=','1100630204','黃子祐',1,2,63,'zi_you_huang@gmail.com',0,'2020-03-16 23:15:28.553702','2020-02-14 13:25:18.142812',NULL,NULL,NULL),(10,'pbkdf2_sha256$180000$Ae090oPvathV$qbD8qhzNo3hhMK1KQcLqPmz54a+AxERZ8d/aPItUUBU=','Test123','測試者123',3,2,1,'Tester123@gmail.com',0,'2020-03-16 22:09:04.411429','2020-02-21 23:23:21.723706','2020-03-16 21:52:28.072542',NULL,NULL),(11,'pbkdf2_sha256$180000$krgO3fN1fRQm$LD+m17ZgvzFa5jZLmbGDu9dqa+RXyhw9P+rSJchzbKo=','Test456','測試者',3,2,1,'Unknown@gmail.com',0,'2020-03-11 01:07:39.108755','2020-02-21 23:27:04.621059','2020-03-11 01:07:39.106222','',NULL),(12,'pbkdf2_sha256$36000$RHpg4CF6Qxtc$bWe+2WrxQdC3uHL4ii+/sf/8/hZ6XmKG4gjLVj/fE60=','1090630231',NULL,NULL,2,9,NULL,0,'2020-02-21 23:28:28.556968','2020-02-21 23:28:28.538993',NULL,NULL,NULL),(13,'pbkdf2_sha256$36000$0SdaE2VVOSlh$4bdf3g+zwpXK95PFsb/2Hacoze0GBPOpdqCHYhqEIrc=','Maximum1998',NULL,NULL,3,1,NULL,0,'2020-02-21 23:35:40.264908','2020-02-21 23:35:40.256010',NULL,NULL,NULL),(14,'pbkdf2_sha256$36000$jR0J9F6qdYNr$NKLRSvbTBDYgGwMLoSrrpMjMOIKSU5FD2mBwhAxcMdM=','Maxium2000',NULL,NULL,3,17,NULL,0,'2020-02-22 11:00:20.556177','2020-02-22 11:00:20.512268',NULL,NULL,NULL),(15,'pbkdf2_sha256$180000$UxGqLrZnZSDU$5N60fls8VBBuQcJW2vh3Te8LaMGk9Dzrux7m8mm2VUY=','TerryChi0118','楊家齊',1,2,35,'terry90209@gmail.com',0,'2020-03-19 01:10:17.992785','2020-03-18 15:31:27.930608','2020-03-19 01:09:38.244295','',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add content type',4,'add_contenttype'),(11,'Can change content type',4,'change_contenttype'),(12,'Can delete content type',4,'delete_contenttype'),(13,'Can add session',5,'add_session'),(14,'Can change session',5,'change_session'),(15,'Can delete session',5,'delete_session'),(16,'Can add user',6,'add_user'),(17,'Can change user',6,'change_user'),(18,'Can delete user',6,'delete_user'),(19,'Can add answer',7,'add_answer'),(20,'Can change answer',7,'change_answer'),(21,'Can delete answer',7,'delete_answer'),(22,'Can add answer sheet',8,'add_answersheet'),(23,'Can change answer sheet',8,'change_answersheet'),(24,'Can delete answer sheet',8,'delete_answersheet'),(25,'Can add choice',9,'add_choice'),(26,'Can change choice',9,'change_choice'),(27,'Can delete choice',9,'delete_choice'),(28,'Can add department',10,'add_department'),(29,'Can change department',10,'change_department'),(30,'Can delete department',10,'delete_department'),(31,'Can add exam',11,'add_exam'),(32,'Can change exam',11,'change_exam'),(33,'Can delete exam',11,'delete_exam'),(34,'Can add group',12,'add_group'),(35,'Can change group',12,'change_group'),(36,'Can delete group',12,'delete_group'),(37,'Can add option list',13,'add_optionlist'),(38,'Can change option list',13,'change_optionlist'),(39,'Can delete option list',13,'delete_optionlist'),(40,'Can add proclamation',14,'add_proclamation'),(41,'Can change proclamation',14,'change_proclamation'),(42,'Can delete proclamation',14,'delete_proclamation'),(43,'Can add question',15,'add_question'),(44,'Can change question',15,'change_question'),(45,'Can delete question',15,'delete_question'),(46,'Can add report',16,'add_report'),(47,'Can change report',16,'change_report'),(48,'Can delete report',16,'delete_report'),(49,'Can add report category',17,'add_reportcategory'),(50,'Can change report category',17,'change_reportcategory'),(51,'Can delete report category',17,'delete_reportcategory'),(52,'Can add squadron',18,'add_squadron'),(53,'Can change squadron',18,'change_squadron'),(54,'Can delete squadron',18,'delete_squadron'),(55,'Can add student',19,'add_student'),(56,'Can change student',19,'change_student'),(57,'Can delete student',19,'delete_student'),(58,'Can add test paper',20,'add_testpaper'),(59,'Can change test paper',20,'change_testpaper'),(60,'Can delete test paper',20,'delete_testpaper'),(61,'Can add captcha store',21,'add_captchastore'),(62,'Can change captcha store',21,'change_captchastore'),(63,'Can delete captcha store',21,'delete_captchastore'),(64,'Can add testee list',22,'add_testeelist'),(65,'Can change testee list',22,'change_testeelist'),(66,'Can delete testee list',22,'delete_testeelist'),(67,'Can add reply',23,'add_reply'),(68,'Can change reply',23,'change_reply'),(69,'Can delete reply',23,'delete_reply'),(70,'Can view log entry',1,'view_logentry'),(71,'Can view permission',2,'view_permission'),(72,'Can view group',3,'view_group'),(73,'Can view content type',4,'view_contenttype'),(74,'Can view session',5,'view_session'),(75,'Can view user',6,'view_user'),(76,'Can view answer',7,'view_answer'),(77,'Can view answer sheet',8,'view_answersheet'),(78,'Can view choice',9,'view_choice'),(79,'Can view department',10,'view_department'),(80,'Can view exam',11,'view_exam'),(81,'Can view group',12,'view_group'),(82,'Can view proclamation',14,'view_proclamation'),(83,'Can view question',15,'view_question'),(84,'Can view report',16,'view_report'),(85,'Can view report category',17,'view_reportcategory'),(86,'Can view squadron',18,'view_squadron'),(87,'Can view student',19,'view_student'),(88,'Can view test paper',20,'view_testpaper'),(89,'Can view testee list',22,'view_testeelist'),(90,'Can view reply',23,'view_reply'),(91,'Can view captcha store',21,'view_captchastore'),(92,'Can add notification',24,'add_notification'),(93,'Can change notification',24,'change_notification'),(94,'Can delete notification',24,'delete_notification'),(95,'Can view notification',24,'view_notification');
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
) ENGINE=InnoDB AUTO_INCREMENT=312 DEFAULT CHARSET=utf8;
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
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_alcpt_user_id` FOREIGN KEY (`user_id`) REFERENCES `alcpt_user` (`id`)
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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(7,'alcpt','answer'),(8,'alcpt','answersheet'),(9,'alcpt','choice'),(10,'alcpt','department'),(11,'alcpt','exam'),(12,'alcpt','group'),(24,'alcpt','notification'),(13,'alcpt','optionlist'),(14,'alcpt','proclamation'),(15,'alcpt','question'),(23,'alcpt','reply'),(16,'alcpt','report'),(17,'alcpt','reportcategory'),(18,'alcpt','squadron'),(19,'alcpt','student'),(22,'alcpt','testeelist'),(20,'alcpt','testpaper'),(6,'alcpt','user'),(3,'auth','group'),(2,'auth','permission'),(21,'captcha','captchastore'),(4,'contenttypes','contenttype'),(5,'sessions','session');
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
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2020-02-11 12:55:28.154105'),(2,'alcpt','0001_initial','2020-02-11 12:55:29.436003'),(3,'admin','0001_initial','2020-02-11 12:55:29.523835'),(4,'admin','0002_logentry_remove_auto_add','2020-02-11 12:55:29.551044'),(5,'contenttypes','0002_remove_content_type_name','2020-02-11 12:55:29.627345'),(6,'auth','0001_initial','2020-02-11 12:55:29.799531'),(7,'auth','0002_alter_permission_name_max_length','2020-02-11 12:55:29.834748'),(8,'auth','0003_alter_user_email_max_length','2020-02-11 12:55:29.852611'),(9,'auth','0004_alter_user_username_opts','2020-02-11 12:55:29.861920'),(10,'auth','0005_alter_user_last_login_null','2020-02-11 12:55:29.871194'),(11,'auth','0006_require_contenttypes_0002','2020-02-11 12:55:29.873803'),(12,'auth','0007_alter_validators_add_error_messages','2020-02-11 12:55:29.887929'),(13,'auth','0008_alter_user_username_max_length','2020-02-11 12:55:29.896072'),(14,'captcha','0001_initial','2020-02-11 12:55:29.918277'),(15,'sessions','0001_initial','2020-02-11 12:55:29.945620'),(16,'alcpt','0002_auto_20200211_1457','2020-02-11 14:57:20.133290'),(17,'alcpt','0002_auto_20200212_2312','2020-02-12 23:13:10.729115'),(18,'alcpt','0003_testpaper_is_used','2020-02-12 23:32:05.156396'),(19,'alcpt','0004_auto_20200214_0950','2020-02-14 09:50:44.665963'),(20,'alcpt','0005_auto_20200216_0016','2020-02-18 11:44:28.056102'),(21,'alcpt','0006_remove_question_used_freq','2020-02-18 11:44:28.218210'),(22,'alcpt','0007_auto_20200219_0102','2020-02-19 01:02:20.889312'),(23,'alcpt','0008_auto_20200220_0855','2020-02-20 08:55:12.109729'),(24,'alcpt','0009_auto_20200223_0054','2020-02-23 00:54:56.335952'),(25,'alcpt','0010_user_introduction','2020-02-24 01:48:36.068849'),(26,'alcpt','0011_auto_20200228_0224','2020-02-28 02:24:43.896742'),(27,'alcpt','0012_user_photo','2020-03-02 11:23:51.184589'),(28,'admin','0003_logentry_add_action_flag_choices','2020-03-06 00:28:02.820436'),(29,'auth','0009_alter_user_last_name_max_length','2020-03-06 00:28:02.858645'),(30,'auth','0010_alter_group_name_max_length','2020-03-06 00:28:02.935353'),(31,'auth','0011_update_proxy_permissions','2020-03-06 00:28:02.962196'),(32,'alcpt','0013_exam_testeelist','2020-03-12 00:41:54.833163'),(33,'alcpt','0014_delete_testeelist','2020-03-12 00:41:54.982885'),(34,'alcpt','0015_notification','2020-03-17 19:04:42.665041'),(35,'alcpt','0015_auto_20200318_0845','2020-03-18 08:45:45.492761'),(36,'alcpt','0016_auto_20200318_1708','2020-03-19 01:08:23.122393'),(37,'alcpt','0017_auto_20200319_0108','2020-03-19 01:08:23.212788');
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
INSERT INTO `django_session` VALUES ('00be7hpe2kbt6ou9tooaep5vxc6m9hna','NjRiMzliZGY5YTg2ZDI3ZTE4YTFkODViMGRhMzE0ZDhjODRkNTRmOTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyN2MzNWRlNzNjMzZhODcxNzQ4OWNhMzlmZGQ5M2Y1ZGQyNDEzNTFmIn0=','2020-04-01 16:20:28.787148'),('10mp5574oxf8eq4egr1wvoqwpsgwfl54','NjZiYTM5NzNiNDUwNzk4NDgyMWRjZTBhNzliZDQ3N2RlZmU4ZTViNDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmY2RiNzE3NTNiZmE1OGEyYTVjYjBlYTZkMWIzYmE4NjM5ODgxNjMxIn0=','2020-03-18 19:58:36.227155'),('2stzviqbmsosxnu9uzw7n6kfaz9t6mop','ZTIyY2QxNDIzNjcxMzVhYTNkMGRlMmJmZGY1YTI3OTFmMjNmNmMzYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzMWQ4MzMxOGM2ZDlkODM2YzE1NTVmYmU5ZWJiZWIwODdmYTI3OWUzIn0=','2020-02-27 16:35:15.282861'),('7g5gt377if0wratijhgqstk9p76lhacq','ZjNiZmNiYzAxOWZkNzdhZDk1MmYyOGQzOWQ3ZmJiOWNmZDg0OWQ4Yzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzNmUyY2NmMjJlOTE1MDBkZTdmNmRjY2QyMWM5Y2Q4NTliMjI3YTIwIn0=','2020-03-16 16:39:20.849575'),('a3d2ulqe9nfz1i8zsxt02o13gebszblt','ZjNiZmNiYzAxOWZkNzdhZDk1MmYyOGQzOWQ3ZmJiOWNmZDg0OWQ4Yzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzNmUyY2NmMjJlOTE1MDBkZTdmNmRjY2QyMWM5Y2Q4NTliMjI3YTIwIn0=','2020-03-16 10:26:33.142668'),('da8qatewgj3o7iz7umr7xogrcpx4w5dd','OTEwOTA3ODQzOWFiM2QwZGRkMDUwN2Q0YWMwNjM5NTU0MDkyZTExYzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwYjU1ZGY4ZjdlMzhiNjRkMDVkM2M4MTMyZDZlODRiZTVkMTAyYWFmIn0=','2020-04-02 01:10:37.935014'),('flibkl1869ftlhzdtdvzfgg7og1exp02','ZTIyY2QxNDIzNjcxMzVhYTNkMGRlMmJmZGY1YTI3OTFmMjNmNmMzYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzMWQ4MzMxOGM2ZDlkODM2YzE1NTVmYmU5ZWJiZWIwODdmYTI3OWUzIn0=','2020-03-09 10:03:41.905289'),('gnt1lppycz8z2v0p6ch1tttq94iborq2','MmMzMzBlMDA2MjE5MmRiZGJjNzIyMWNjZTBjY2RlMmVlNWMyYzYzODp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMmVkNjlmMzdlOGQwYmRlYjk1MWI0ZGYwZWVkYjc5OTkxYTlhMjljIn0=','2020-02-26 00:55:55.517976'),('mb43m678gya5be2qiovq7gozzry16b2p','ZjNiZmNiYzAxOWZkNzdhZDk1MmYyOGQzOWQ3ZmJiOWNmZDg0OWQ4Yzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzNmUyY2NmMjJlOTE1MDBkZTdmNmRjY2QyMWM5Y2Q4NTliMjI3YTIwIn0=','2020-03-16 16:18:44.410010'),('mggmzfjyy58cm334ch9ubs34xl7prbio','NjZiYTM5NzNiNDUwNzk4NDgyMWRjZTBhNzliZDQ3N2RlZmU4ZTViNDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmY2RiNzE3NTNiZmE1OGEyYTVjYjBlYTZkMWIzYmE4NjM5ODgxNjMxIn0=','2020-03-18 20:24:33.063765'),('nabun9yq5v1b14pb8c7lsofkfk7100eg','ZjNiZmNiYzAxOWZkNzdhZDk1MmYyOGQzOWQ3ZmJiOWNmZDg0OWQ4Yzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzNmUyY2NmMjJlOTE1MDBkZTdmNmRjY2QyMWM5Y2Q4NTliMjI3YTIwIn0=','2020-03-17 20:36:56.194636'),('qd8ir1ggzn0gsviulku0ja6fhun4ruz0','NjZiYTM5NzNiNDUwNzk4NDgyMWRjZTBhNzliZDQ3N2RlZmU4ZTViNDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmY2RiNzE3NTNiZmE1OGEyYTVjYjBlYTZkMWIzYmE4NjM5ODgxNjMxIn0=','2020-03-18 20:13:43.094693'),('yubs6nefayz2wfof5ng1hoat6qge53kz','NjZiYTM5NzNiNDUwNzk4NDgyMWRjZTBhNzliZDQ3N2RlZmU4ZTViNDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmY2RiNzE3NTNiZmE1OGEyYTVjYjBlYTZkMWIzYmE4NjM5ODgxNjMxIn0=','2020-03-18 13:51:42.386922'),('z3elbd8e2233fftjfaen22cyclpc1iu3','ZTIyY2QxNDIzNjcxMzVhYTNkMGRlMmJmZGY1YTI3OTFmMjNmNmMzYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzMWQ4MzMxOGM2ZDlkODM2YzE1NTVmYmU5ZWJiZWIwODdmYTI3OWUzIn0=','2020-02-28 13:20:20.652045');
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

-- Dump completed on 2020-03-19  1:21:21