-- MySQL dump 10.13  Distrib 5.6.13, for osx10.6 (i386)
--
-- Host: localhost    Database: datawarehouse
-- ------------------------------------------------------
-- Server version	5.5.29-log

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
-- Table structure for table `affiliations`
--

DROP TABLE IF EXISTS `affiliations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `affiliations` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `affiliations`
--

LOCK TABLES `affiliations` WRITE;
/*!40000 ALTER TABLE `affiliations` DISABLE KEYS */;
INSERT INTO `affiliations` VALUES (1,'Stark'),(2,'Baratheon'),(3,'Targaryen'),(4,'Lannister'),(5,'Martell'),(6,'Tully'),(8,'Florent'),(9,'Bolton'),(10,'Night\'s Watch'),(11,'Dothraki'),(12,'Wildling'),(13,'King\'s Landing'),(14,'Greyjoy'),(15,'Arryn'),(16,'Tyrell');
/*!40000 ALTER TABLE `affiliations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `books` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (1,'None',-1),(2,'Pre-Series',0),(3,'A Game of Thrones',1),(4,'A Clash of Kings',2),(5,'A Storm of Swords',3),(6,'A Feast for Crows',4),(7,'A Dance with Dragons',5);
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `characters`
--

DROP TABLE IF EXISTS `characters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `characters` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `gender` int(11) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `characters`
--

LOCK TABLES `characters` WRITE;
/*!40000 ALTER TABLE `characters` DISABLE KEYS */;
INSERT INTO `characters` VALUES (1,'Sandor Clegan',1,29),(2,'Benjen Stark',1,35),(3,'Syrio Forel',1,41),(4,'Tysha',0,29),(5,'Jeyne Pool',0,12),(6,'Imry Florent',1,35),(7,'Sorcerer in the Box',1,60),(8,'Jhiqui',0,17),(9,'Stevron Frey',1,66),(10,'Cohollo',1,36),(11,'Bharbo',1,62),(12,'Tomard',1,47),(13,'Craster\'s Younger Wife',0,23),(14,'Palla',0,18),(15,'Craster\'s Medium Wife',0,45),(16,'Shella Whent',0,75),(17,'Hallis Mollen',1,40),(18,'Haggo',1,35),(19,'Jacks',1,35),(20,'Masha Heddle',0,50),(21,'Willem Frey',1,10),(22,'Leo Lefford',1,64),(23,'Quent',1,28),(24,'Adrack Humble',1,39),(25,'Aegon Blackfyre',1,13),(26,'Aegon III Targaryen',1,37),(27,'Aegon II Targaryen',1,24),(28,'Aegon IV Targaryen',1,46),(29,'Aegon I Targaryen',1,64),(30,'Aegon Targaryen',1,19),(31,'Aegon V Targaryen',1,60),(32,'Aegor Rivers',1,33),(33,'Aemon Blackfyre',1,13),(34,'Aemon Targaryen',1,36),(35,'Aenys Targaryen',1,36),(36,'Aerion Targaryen',1,40),(37,'Aerys II Targaryen',1,41),(38,'Aerys I Targaryen',1,48),(39,'Cleos Frey',1,33),(40,'Amory Lorch',1,52),(41,'Argalia Baratheon',0,56),(42,'Axell Florent',1,59),(43,'Baelor Targaryen',1,28),(44,'Bannen',1,23),(45,'Barra',0,1),(46,'Billy',1,10),(47,'Biter',1,33),(48,'Ebben',1,45),(49,'Brandon Stark',1,21),(50,'Brynden Rivers',1,78),(51,'Cassana Baratheon',0,19),(52,'Catelyn Stark',0,35),(53,'Catspaw Assassin',1,37),(54,'Craster',1,65),(55,'Cressen',1,79),(56,'Daemon Blackfyre',1,27),(57,'Daemon II Blackfyre',1,23),(58,'Daena Targaryen',0,39),(59,'Daeron II Targaryen',1,57),(60,'Daeron I Targaryen',1,18),(61,'Dagmer',1,43),(62,'Damon Lannister',1,31),(63,'Domeric Bolton',1,17),(64,'Donnel Hill',1,26),(65,'Dontos Hollard',1,38),(66,'Doreah',0,24),(67,'Drennan',1,25),(68,'Drogo',1,32),(69,'Duncan Targaryen',1,42),(70,'Duncan the Tall',1,67),(71,'Eddard Stark',1,37),(72,'Edric Baratheon',1,0),(73,'Elaena Targaryen',0,75),(74,'Elia Martell',0,27),(75,'Gared',1,59),(76,'Gelmarr',1,21),(77,'Gerold Hightower',1,48),(78,'Grazdan mo Ullhor',1,51),(79,'Grenn',1,19),(80,'Gwayne Gaunt',1,39),(81,'Harren Hoare',1,60),(82,'Harrion Karstark',1,17),(83,'High Septon',1,55),(84,'Hoster Tully',1,60),(85,'Hugh',1,16),(86,'Irri',0,14),(87,'Jack Bulwer',1,17),(88,'Jaehaerys I Targaryen',1,70),(89,'Jafer Flowers',1,28),(90,'Jeor Mormont',1,69),(91,'Joanna Lannister',0,29),(92,'Joffrey Baratheon',1,14),(93,'Jojen Reed',1,14),(94,'John Arryn',1,79),(95,'Jon Connington',1,26),(96,'Jory Cassel',1,37),(97,'Joyeuse Erenford',0,16),(98,'Kaeth',1,82),(99,'Clubfoot Karl',1,37),(100,'Kegs',1,40),(101,'Kings Landing Rioter',1,48),(102,'Kraznys mo Nakloz',1,54),(103,'Kurleket',1,25),(104,'Lannister Guardsmen',1,24),(105,'Vargo Hoat',1,44),(106,'Lommy',1,8),(107,'Lorren',1,47),(108,'Luther Tyrell',1,35),(109,'Luwin',1,67),(110,'Lyanna Stark',0,16),(111,'Lysa Arryn',0,33),(112,'Maegor Targaryen',1,36),(113,'Maekar I Targaryen',1,60),(114,'Mago',1,23),(115,'Mandron Moore',1,43),(116,'Maron Greyjoy',1,14),(117,'Martyn Lannister',1,13),(118,'Mathos Seaworth',1,24),(119,'Mero',1,36),(120,'Minisa Tully',0,31),(121,'Mirri Maz Duur',0,40),(122,'Mordane',0,64),(123,'Mully',1,50),(124,'Mycah',1,13),(125,'Myriah Martell',0,54),(126,'Naerys Targaryen',0,44),(127,'Oberyn Martell',1,42),(128,'Old Nan',0,85),(129,'Orell',1,41),(130,'Orys Baratheon',1,58),(131,'Othor',1,31),(132,'Oznak zo Pahl',1,27),(133,'Petyr Baratheon',1,0),(134,'Polliner',1,30),(135,'Prendahl na Ghezn',1,46),(136,'Pyat Pree',1,55),(137,'Pypar',1,17),(138,'Qhorin',1,60),(139,'Qotho',1,32),(140,'Jhogo',1,16),(141,'Ralf Kenning',1,48),(142,'Rast',1,18),(143,'Renly Baratheon',1,22),(144,'Rhaegar Targaryen',1,24),(145,'Rhaego',1,0),(146,'Rhaella Targaryen',0,44),(147,'Rhaena Targaryen',0,54),(148,'Rhaenyra Targaryen',0,33),(149,'Rhaenys Targaryen',0,4),(150,'Rhaenys Targaryen',0,31),(151,'Rickard Karstark',1,60),(152,'Rickard Stark',1,55),(153,'Robar Royce',1,22),(154,'Robb Stark',1,16),(155,'Robert Baratheon',1,35),(156,'Rodrik Cassel',1,57),(157,'Rodrik Greyjoy',1,15),(158,'Serena Blackfyre',0,27),(159,'Shae',0,19),(160,'Stableboy',1,11),(161,'Stafford Lannister',1,59),(162,'Steffon Baratheon',1,40),(163,'Stiv',1,36),(164,'Stonesnake',1,48),(165,'Styr',1,34),(166,'Tansy/Kyra',0,19),(167,'Tommard Baratheon',1,0),(168,'Torrhen Karstark',1,13),(169,'Tytos Lannister',1,38),(170,'Tywin Lannister',1,67),(171,'Vardis Egen',1,34),(172,'Varly',1,38),(173,'Vayon Poole',1,65),(174,'Visenya Targaryen',0,66),(175,'Viserys II Targaryen',1,50),(176,'Viserys I Targaryen',1,52),(177,'Viserys Targaryen',1,23),(178,'Waymar Royce',1,19),(179,'Wendel Manderly',1,41),(180,'Wex Pyke',1,12),(181,'Will',1,27),(182,'Willem Darry',1,67),(183,'Willem Lannister',1,13),(184,'Wineseller',1,47),(185,'Wylla',0,36),(186,'Xaro Xhoan Daxos',1,33),(187,'Ygritte',0,19),(188,'Yoren',1,43),(189,'Zalla',0,3),(190,'Addam Marbrand',1,35),(191,'Aeron Greyjoy',1,28),(192,'Aggo',1,19),(193,'Alannys Greyjoy',0,47),(194,'Alerie Tyrell',0,40),(195,'Alliser Thorne',1,53),(196,'Anguy',1,31),(197,'Anya Waynwood',0,68),(198,'Areo Hotah',1,44),(199,'Arya Stark',0,14),(200,'Balon Greyjoy',1,67),(201,'Barbrey Dustin',0,45),(202,'Barristan Selmy',1,63),(203,'Bethany Redwyne',0,33),(204,'Larra Blackmont',0,37),(205,'Bran Stark',1,13),(206,'Brienne of Tarth',0,20),(207,'Bron',1,51),(208,'Brynden Tully',1,55),(209,'Calla',0,7),(210,'Captain\'s Daughter',0,20),(211,'Cersei Lannister',0,34),(212,'Chella',0,25),(213,'Colen',1,25),(214,'Crastor\'s Last Son',1,1),(215,'Daario Naharis',1,33),(216,'Daemon Sand',1,22),(217,'Daenerys Targaryen',0,17),(218,'Davos Seaworth',1,40),(219,'Denys Mallister',1,44),(220,'Roland Crakehall',1,28),(221,'Donnel Waynwood',1,23),(222,'Doran Martell',1,52),(223,'Dorea Sand',0,8),(224,'Dorna Lannister',0,45),(225,'Eddison Tollett',1,30),(226,'Edmure Tully',1,40),(227,'Elia Sand',0,14),(228,'Ellaria Sand',0,35),(229,'Eon Hunter',1,80),(230,'Falyse Stokeworth',1,35),(231,'First Mate',1,38),(232,'Galbart Glover',1,50),(233,'Garlan Tyrell',1,23),(234,'Gendry',1,16),(235,'Gerald',1,63),(236,'Gilly',0,15),(237,'Goatherd\'s Son',1,7),(238,'Goatherd',1,30),(239,'Goatherd 2',1,33),(240,'Goldcloak on Kingsroad',1,41),(241,'Gregor Clegane',1,34),(242,'Grey Worm',1,24),(243,'Halder',1,16),(244,'Hallyne',1,91),(245,'Harys Swyft',1,65),(246,'High Sparrow',1,67),(247,'Hizdahr zo Loraq',1,25),(248,'Hodor',1,25),(249,'Hot Pie',1,15),(250,'Howland Reed',1,37),(251,'Illyrio Mopatis',1,61),(252,'Illyn Payne',1,67),(253,'Innkeeper',1,40),(254,'Innkeeper\'s Daughter',0,18),(255,'Jaime Lannister',1,34),(256,'Janos Slynt',1,40),(257,'Jaqen H\'ghar',1,38),(258,'Jason Mallister',1,45),(259,'Jon Snow',1,20),(260,'Jon Umber',1,57),(261,'Jonos Bracken',1,46),(262,'Jorah Mormont',1,46),(263,'Joss',1,40),(264,'Joss Stilwood',1,23),(265,'Kevan Lannister',1,66),(266,'King\'s Landing Urchin',1,11),(267,'Lancel Lannister',1,18),(268,'Lannister captain',1,38),(269,'Lannister Guardsmen',1,32),(270,'Lannister messenger',1,24),(271,'Lannister soldier',1,41),(272,'Lollys Stokeworth',0,35),(273,'Loras Tyrell',1,18),(274,'Lord of Bones',1,47),(275,'Lordsport dockhand',1,55),(276,'Loreza Sand',0,7),(277,'Lothar Frey',1,36),(278,'Lynesse Hightower',0,30),(279,'Mace Tyrell',1,44),(280,'Maege Marmont',0,55),(281,'Mance Rayder',1,61),(282,'Marei',0,20),(283,'Margaery\'s handmaiden',0,17),(284,'Margaery Tyrell',0,17),(285,'Marianne Vance',0,18),(286,'Marillion',1,21),(287,'Matthar',1,18),(288,'Meera Reed',0,17),(289,'Melessa Tarly',0,45),(290,'Melisandre',0,37),(291,'Merry Frey',0,12),(292,'Meryn Trant',1,40),(293,'Mhaegen',0,21),(294,'Mikken',1,55),(295,'Mink',1,16),(296,'Missandei',0,12),(297,'Morag',0,52),(298,'Mord',1,40),(299,'Musician',1,38),(300,'Musician 1',1,37),(301,'Musician 2',1,38),(302,'Myrcella Baratheon',0,11),(303,'Night\'s Watch Man',1,44),(304,'Nymeria Sand',0,26),(305,'Obara Sand',0,28),(306,'Obella Sand',0,12),(307,'Olenna Tyrell',0,65),(308,'Olyvar Frey',1,19),(309,'Osha',0,28),(310,'Othell Yarwyck',1,60),(311,'Paxter Redwyne',1,45),(312,'Petyr Baelish',1,32),(313,'Podrick Payne',1,15),(314,'Pycelle',1,84),(315,'Quaithe',0,31),(316,'Qyburn',1,85),(317,'Ramsay Bolton',1,29),(318,'Randyll Tarly',1,42),(319,'Rickon Stark',1,9),(320,'Robin Arryn',1,8),(321,'Roose Bolton',1,45),(322,'Roslin Frey',0,19),(323,'Ryger Rivers',1,47),(324,'Salladhor Saan',1,38),(325,'Gilly\'s Baby',1,1),(326,'Samwell Tarly',1,21),(327,'Sansa Stark',0,15),(328,'Sarella Sand',0,19),(329,'Sarra Frey',0,14),(330,'Selwyn Tarth',1,54),(331,'Selyse Baratheon',0,47),(332,'Serra Frey',1,14),(333,'Shagga',1,50),(334,'Shireen Baratheon',0,6),(335,'Shirei Frey',0,14),(336,'Stannis Baratheon',1,36),(337,'Lord Stokeworth',1,60),(338,'Theon Greyjoy',1,22),(339,'Thoros',1,49),(340,'Timett',1,20),(341,'Toad',1,15),(342,'Tobho Mott',1,60),(343,'Tommen Baratheon',1,12),(344,'Tormund',1,36),(345,'Trystane Martell',1,13),(346,'Tycho Nestoris',1,48),(347,'Tyene Sand',0,23),(348,'Tyrion Lannister',1,36),(349,'Varys',1,50),(350,'Victarion Greyjoy',1,45),(351,'Fat Walda Bolton',0,16),(352,'Walder Frey',1,92),(353,'Walder Rivers',1,34),(354,'Waldron Frey',1,10),(355,'Weese',1,37),(356,'Willas Tyrell',1,30),(357,'Asha Greyjoy',0,25),(358,'Yezzan zo Qaggaz',1,30),(359,'Yohn Royce',1,56);
/*!40000 ALTER TABLE `characters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facts`
--

DROP TABLE IF EXISTS `facts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `facts` (
  `id` int(11) NOT NULL,
  `region_id` int(11) DEFAULT NULL,
  `character_id` int(11) NOT NULL,
  `affiliation_id` int(11) DEFAULT NULL,
  `religion_id` int(11) DEFAULT NULL,
  `book_id` int(11) DEFAULT NULL,
  `is_dead` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facts`
--

LOCK TABLES `facts` WRITE;
/*!40000 ALTER TABLE `facts` DISABLE KEYS */;
INSERT INTO `facts` VALUES (1,1,1,4,12,1,1),(2,2,2,10,1,3,1),(3,3,3,1,9,3,1),(4,0,4,4,0,2,0),(5,2,5,1,1,1,1),(6,4,6,2,4,4,1),(7,3,7,0,6,6,1),(8,5,8,3,7,1,0),(9,6,9,6,2,5,1),(10,5,10,11,7,3,1),(11,5,11,11,7,2,1),(12,2,12,1,1,3,1),(13,7,13,12,1,1,0),(14,2,14,1,1,1,0),(15,7,15,12,1,5,1),(16,6,16,13,2,6,1),(17,2,17,1,1,1,0),(18,5,18,11,7,3,1),(19,2,19,1,1,1,0),(20,6,20,0,2,3,1),(21,6,21,6,2,1,0),(22,8,22,4,2,4,1),(23,2,23,1,1,1,0),(24,9,24,14,3,7,1),(25,1,25,3,2,2,1),(26,1,26,3,2,2,1),(27,1,27,3,2,2,1),(28,1,28,3,2,2,1),(29,1,29,3,2,2,1),(30,1,30,3,2,1,0),(31,1,31,3,2,2,1),(32,1,32,3,2,2,1),(33,1,33,3,2,2,1),(34,1,34,3,2,6,1),(35,1,35,3,2,2,1),(36,1,36,3,2,2,1),(37,1,37,3,2,2,1),(38,1,38,3,2,2,1),(39,6,39,4,2,5,1),(40,8,40,4,2,4,1),(41,10,41,2,2,2,1),(42,4,42,8,4,1,1),(43,1,43,3,2,2,1),(44,7,44,10,2,5,1),(45,1,45,2,0,4,1),(46,6,46,1,2,2,1),(47,1,47,4,0,6,1),(48,7,48,10,2,4,1),(49,2,49,1,1,1,1),(50,1,50,1,2,2,1),(51,10,51,2,2,2,1),(52,6,52,1,2,5,1),(53,0,53,2,0,3,1),(54,7,54,12,1,5,1),(55,1,55,2,2,5,1),(56,1,56,3,2,2,1),(57,1,57,3,2,2,1),(58,1,58,3,2,2,1),(59,1,59,3,2,2,1),(60,1,60,3,2,2,1),(61,9,61,14,3,1,1),(62,1,62,4,2,2,1),(63,2,63,9,2,2,1),(64,7,64,10,2,1,1),(65,1,65,1,2,5,1),(66,11,66,3,0,4,1),(67,9,67,14,3,4,1),(68,5,68,11,7,3,1),(69,1,69,3,2,2,1),(70,1,70,3,2,2,1),(71,2,71,1,1,3,1),(72,10,72,2,2,1,1),(73,1,73,3,2,2,1),(74,12,74,5,2,2,1),(75,7,75,10,1,3,1),(76,9,76,14,3,4,1),(77,4,77,13,2,2,1),(78,13,78,0,13,5,1),(79,7,79,10,2,1,1),(80,1,80,13,2,2,1),(81,9,81,13,3,2,1),(82,2,82,1,2,1,1),(83,0,83,13,2,1,1),(84,6,84,6,2,5,1),(85,14,85,15,2,3,1),(86,5,86,3,7,1,1),(87,4,87,10,2,7,1),(88,1,88,3,2,2,1),(89,4,89,10,2,2,1),(90,2,90,10,2,5,1),(91,8,91,4,2,2,1),(92,1,92,2,2,5,1),(93,2,93,1,1,7,1),(94,14,94,15,2,2,1),(95,10,95,3,2,1,1),(96,2,96,1,1,3,1),(97,6,97,6,2,1,1),(98,1,98,3,2,2,1),(99,7,99,10,2,7,1),(100,7,100,10,2,1,1),(101,1,101,13,2,4,1),(102,13,102,13,13,7,1),(103,6,103,6,2,3,1),(104,0,104,4,0,2,1),(105,11,105,9,14,5,1),(106,6,106,13,2,4,1),(107,9,107,14,3,4,1),(108,4,108,16,2,2,1),(109,2,109,13,1,4,1),(110,2,110,1,1,2,1),(111,14,111,6,2,5,1),(112,1,112,3,2,2,1),(113,1,113,3,2,2,1),(114,5,114,11,7,1,1),(115,1,115,15,2,4,1),(116,9,116,14,3,2,1),(117,1,117,4,2,1,1),(118,1,118,2,4,4,1),(119,3,119,13,9,5,1),(120,6,120,6,2,2,1),(121,5,121,0,6,3,1),(122,2,122,1,2,3,1),(123,7,123,10,0,1,1),(124,6,124,1,0,3,1),(125,12,125,5,2,2,1),(126,1,126,3,2,2,1),(127,12,127,5,2,5,1),(128,2,128,1,1,7,1),(129,7,129,12,1,4,1),(130,10,130,2,2,2,1),(131,7,131,10,0,2,1),(132,13,132,0,13,5,1),(133,10,133,2,2,2,1),(134,6,134,4,2,5,1),(135,13,135,0,13,5,1),(136,11,136,13,0,1,1),(137,7,137,10,2,1,1),(138,7,138,10,1,4,1),(139,5,139,11,7,3,1),(140,5,140,3,7,1,0),(141,9,141,14,3,7,1),(142,7,142,10,2,5,1),(143,1,143,2,2,4,1),(144,1,144,3,2,2,1),(145,5,145,3,7,3,1),(146,1,146,3,2,2,1),(147,1,147,3,2,2,1),(148,1,148,3,2,2,1),(149,1,149,3,2,2,1),(150,1,150,3,2,2,1),(151,2,151,1,1,5,1),(152,2,152,1,1,2,1),(153,14,153,2,2,4,1),(154,2,154,1,2,5,1),(155,10,155,2,2,3,1),(156,2,156,1,1,4,1),(157,9,157,14,3,2,1),(158,1,158,3,2,2,1),(159,1,159,4,0,5,1),(160,0,160,0,0,3,1),(161,1,161,4,2,4,1),(162,10,162,2,2,2,1),(163,7,163,10,1,3,1),(164,7,164,10,2,1,1),(165,7,165,12,1,4,1),(166,6,166,9,2,1,1),(167,1,167,2,2,2,1),(168,2,168,1,2,3,1),(169,1,169,4,2,2,1),(170,1,170,4,2,5,1),(171,14,171,15,2,3,1),(172,2,172,1,2,3,1),(173,2,173,1,2,3,1),(174,1,174,3,2,2,1),(175,5,175,3,2,3,1),(176,1,176,3,2,2,1),(177,1,177,3,2,2,1),(178,7,178,10,2,3,1),(179,2,179,1,2,5,1),(180,9,180,14,3,1,1),(181,7,181,10,2,3,1),(182,6,182,3,2,2,1),(183,1,183,4,2,5,1),(184,5,184,0,2,3,1),(185,12,185,1,2,2,1),(186,11,186,0,0,1,1),(187,7,187,12,1,5,1),(188,6,188,10,2,4,1),(189,13,189,0,6,7,1),(190,8,190,4,2,1,0),(191,9,191,14,3,1,0),(192,5,192,3,7,1,0),(193,9,193,14,3,1,0),(194,4,194,16,2,1,0),(195,7,195,10,2,1,0),(196,4,196,1,4,1,0),(197,14,197,15,2,1,0),(198,12,198,5,0,1,0),(199,2,199,1,12,1,0),(200,9,200,14,3,5,1),(201,2,201,1,2,1,0),(202,1,202,3,2,1,0),(203,4,203,6,2,1,0),(204,12,204,5,2,1,0),(205,2,205,1,1,1,0),(206,10,206,2,2,1,0),(207,1,207,2,12,1,0),(208,6,208,6,2,1,0),(209,0,209,3,0,1,0),(210,0,210,14,0,1,0),(211,1,211,4,2,1,0),(212,7,212,4,1,1,0),(213,10,213,2,2,1,0),(214,7,214,12,1,1,1),(215,3,215,3,0,1,0),(216,12,216,5,2,1,0),(217,5,217,3,2,1,0),(218,1,218,2,2,1,0),(219,7,219,10,2,1,0),(220,8,220,2,2,1,0),(221,14,221,15,2,1,0),(222,12,222,5,2,1,0),(223,12,223,5,2,1,0),(224,1,224,4,2,1,0),(225,7,225,10,2,1,0),(226,6,226,6,2,1,0),(227,12,227,5,2,1,0),(228,12,228,5,2,1,0),(229,14,229,15,2,1,0),(230,1,230,2,2,1,0),(231,0,231,14,0,1,0),(232,2,232,1,2,1,0),(233,4,233,16,2,1,0),(234,1,234,2,4,1,0),(235,1,235,2,2,1,0),(236,7,236,12,1,1,0),(237,5,237,0,6,1,0),(238,5,238,0,6,1,0),(239,5,239,0,6,1,0),(240,1,240,2,2,1,0),(241,1,241,4,2,1,0),(242,13,242,3,8,1,0),(243,7,243,10,2,1,0),(244,1,244,4,2,1,0),(245,1,245,4,2,1,0),(246,1,246,13,2,1,0),(247,13,247,3,13,1,0),(248,2,248,1,2,1,0),(249,6,249,1,4,1,0),(250,2,250,1,1,1,0),(251,3,251,3,0,1,0),(252,1,252,2,2,1,0),(253,6,253,0,2,1,0),(254,6,254,0,2,1,0),(255,1,255,4,2,1,0),(256,7,256,2,2,1,0),(257,3,257,1,9,1,0),(258,6,258,6,2,1,0),(259,7,259,10,1,1,0),(260,2,260,1,2,1,0),(261,6,261,6,2,1,0),(262,2,262,3,2,1,0),(263,6,263,6,2,1,0),(264,1,264,3,2,1,0),(265,1,265,4,2,1,0),(266,1,266,0,2,1,0),(267,1,267,4,2,1,0),(268,1,268,4,2,1,0),(269,1,269,4,2,1,0),(270,1,270,4,2,1,0),(271,1,271,4,2,1,0),(272,1,272,2,2,1,0),(273,4,273,16,2,1,0),(274,7,274,12,1,7,1),(275,9,275,0,3,1,0),(276,12,276,5,2,1,0),(277,6,277,6,2,1,0),(278,4,278,16,2,1,0),(279,4,279,16,2,1,0),(280,2,280,1,2,1,0),(281,7,281,12,1,1,0),(282,1,282,4,2,1,0),(283,1,283,16,2,1,0),(284,4,284,16,2,1,0),(285,6,285,6,2,1,0),(286,14,286,0,2,1,0),(287,7,287,10,2,1,0),(288,2,288,1,1,1,0),(289,4,289,16,2,1,0),(290,11,290,2,4,1,0),(291,6,291,6,2,1,0),(292,1,292,2,2,1,0),(293,1,293,2,2,4,1),(294,2,294,1,2,4,1),(295,0,295,10,0,1,0),(296,13,296,3,0,1,0),(297,0,297,12,0,1,0),(298,14,298,15,2,1,0),(299,0,299,0,0,1,0),(300,0,300,0,0,1,0),(301,0,301,0,0,1,0),(302,12,302,2,2,1,0),(303,7,303,10,2,1,0),(304,12,304,5,2,1,0),(305,12,305,5,2,1,0),(306,12,306,5,2,1,0),(307,4,307,16,2,1,0),(308,6,308,1,2,1,0),(309,2,309,12,1,1,0),(310,7,310,10,2,1,0),(311,4,311,16,2,1,0),(312,6,312,15,2,1,0),(313,1,313,4,2,1,0),(314,1,314,4,2,7,1),(315,11,315,0,0,1,0),(316,1,316,4,2,1,0),(317,2,317,2,2,1,0),(318,4,318,16,2,1,0),(319,2,319,1,1,1,0),(320,14,320,6,2,1,0),(321,2,321,2,2,1,0),(322,6,322,6,2,1,0),(323,6,323,6,2,1,0),(324,13,324,2,0,1,0),(325,7,325,12,1,1,0),(326,7,326,10,1,1,0),(327,2,327,1,2,1,0),(328,12,328,5,2,1,0),(329,6,329,6,2,1,0),(330,10,330,2,2,1,0),(331,1,331,2,4,1,0),(332,6,332,5,2,1,0),(333,2,333,4,1,1,0),(334,1,334,2,4,1,0),(335,6,335,6,2,1,0),(336,10,336,2,4,1,0),(337,1,337,2,2,1,0),(338,9,338,14,3,1,0),(339,3,339,13,4,1,0),(340,2,340,4,1,1,0),(341,7,341,10,2,1,0),(342,1,342,1,2,1,0),(343,1,343,2,2,1,0),(344,7,344,12,1,1,0),(345,12,345,5,2,1,0),(346,3,346,2,8,1,0),(347,12,347,5,2,1,0),(348,1,348,4,2,1,0),(349,1,349,13,0,1,0),(350,9,350,14,3,1,0),(351,2,351,6,2,1,0),(352,6,352,6,2,1,0),(353,6,353,6,2,1,0),(354,6,354,6,2,1,0),(355,6,355,4,2,1,0),(356,4,356,16,2,1,0),(357,9,357,14,3,1,0),(358,13,358,13,0,7,1),(359,14,359,15,2,1,0);
/*!40000 ALTER TABLE `facts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `regions`
--

DROP TABLE IF EXISTS `regions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `regions` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regions`
--

LOCK TABLES `regions` WRITE;
/*!40000 ALTER TABLE `regions` DISABLE KEYS */;
INSERT INTO `regions` VALUES (1,'The Crownlands'),(2,'The North'),(3,'Free Cities'),(4,'The Reach'),(5,'Dothraki Sea'),(6,'The Riverlands'),(7,'Beyond the Wall'),(8,'The Westerlands'),(9,'The Iron Islands'),(10,'The Stormlands'),(11,'Essos'),(12,'Dorne'),(13,'Slaver\'s Bay'),(14,'The Vale');
/*!40000 ALTER TABLE `regions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `religions`
--

DROP TABLE IF EXISTS `religions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `religions` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `religions`
--

LOCK TABLES `religions` WRITE;
/*!40000 ALTER TABLE `religions` DISABLE KEYS */;
INSERT INTO `religions` VALUES (1,'The Old Gods'),(2,'The Faith of the Seven'),(3,'The Drowned God'),(4,'R\'hllor'),(5,'Mother Rhoyne'),(6,'The Great Shepherd'),(7,'The Horse God'),(8,'Lady of Spears'),(9,'Many-Faced God of Braavos'),(10,'The Merling King'),(11,'The Moon-Pale Maiden'),(12,'Atheist'),(13,'The Harpy'),(14,'The Black Goat of Qohor');
/*!40000 ALTER TABLE `religions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-12-03 13:37:20
