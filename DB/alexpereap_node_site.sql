-- MySQL dump 10.13  Distrib 8.0.12, for osx10.13 (x86_64)
--
-- Host: localhost    Database: alexpereap_node_site
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL,
  `Slug` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_CATEGORIES` (`Name`,`Slug`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Servers','servers','2019-04-23 01:57:07','2019-04-23 01:57:07'),(2,'Node JS','nodejs','2019-04-23 01:57:18','2019-04-23 01:58:19');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_store`
--

DROP TABLE IF EXISTS `core_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `core_store` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) DEFAULT NULL,
  `value` longtext,
  `type` varchar(255) DEFAULT NULL,
  `environment` varchar(255) DEFAULT NULL,
  `tag` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_CORE_STORE` (`key`,`value`,`type`,`environment`,`tag`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_store`
--

LOCK TABLES `core_store` WRITE;
/*!40000 ALTER TABLE `core_store` DISABLE KEYS */;
INSERT INTO `core_store` VALUES (1,'db_model_upload_file','{\"name\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"hash\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"sha256\":{\"type\":\"string\",\"configurable\":false},\"ext\":{\"type\":\"string\",\"configurable\":false},\"mime\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"size\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"url\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"provider\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"public_id\":{\"type\":\"string\",\"configurable\":false},\"related\":{\"collection\":\"*\",\"filter\":\"field\",\"configurable\":false},\"created_at\":{\"type\":\"timestamp\"},\"updated_at\":{\"type\":\"timestampUpdate\"}}','object',NULL,NULL),(2,'db_model_users-permissions_user','{\"username\":{\"type\":\"string\",\"minLength\":3,\"unique\":true,\"configurable\":false,\"required\":true},\"email\":{\"type\":\"email\",\"minLength\":6,\"configurable\":false,\"required\":true},\"provider\":{\"type\":\"string\",\"configurable\":false},\"password\":{\"type\":\"password\",\"minLength\":6,\"configurable\":false,\"private\":true},\"resetPasswordToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true},\"confirmed\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false},\"blocked\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false},\"role\":{\"model\":\"role\",\"via\":\"users\",\"plugin\":\"users-permissions\",\"configurable\":false}}','object',NULL,NULL),(3,'db_model_users-permissions_permission','{\"type\":{\"type\":\"string\",\"required\":true,\"configurable\":false},\"controller\":{\"type\":\"string\",\"required\":true,\"configurable\":false},\"action\":{\"type\":\"string\",\"required\":true,\"configurable\":false},\"enabled\":{\"type\":\"boolean\",\"required\":true,\"configurable\":false},\"policy\":{\"type\":\"string\",\"configurable\":false},\"role\":{\"model\":\"role\",\"via\":\"permissions\",\"plugin\":\"users-permissions\",\"configurable\":false}}','object',NULL,NULL),(4,'db_model_core_store','{\"key\":{\"type\":\"string\"},\"value\":{\"type\":\"text\"},\"type\":{\"type\":\"string\"},\"environment\":{\"type\":\"string\"},\"tag\":{\"type\":\"string\"}}','object',NULL,NULL),(5,'db_model_users-permissions_role','{\"name\":{\"type\":\"string\",\"minLength\":3,\"required\":true,\"configurable\":false},\"description\":{\"type\":\"string\",\"configurable\":false},\"type\":{\"type\":\"string\",\"unique\":true,\"configurable\":false},\"permissions\":{\"collection\":\"permission\",\"via\":\"role\",\"plugin\":\"users-permissions\",\"configurable\":false,\"isVirtual\":true},\"users\":{\"collection\":\"user\",\"via\":\"role\",\"configurable\":false,\"plugin\":\"users-permissions\",\"isVirtual\":true}}','object',NULL,NULL),(6,'db_model_upload_file_morph','{\"upload_file_id\":{\"type\":\"integer\"},\"related_id\":{\"type\":\"integer\"},\"related_type\":{\"type\":\"text\"},\"field\":{\"type\":\"text\"}}','object',NULL,NULL),(7,'plugin_content-manager_schema','{\"generalSettings\":{\"search\":true,\"filters\":true,\"bulkActions\":true,\"pageEntries\":10},\"models\":{\"plugins\":{\"upload\":{\"file\":{\"label\":\"File\",\"labelPlural\":\"Files\",\"orm\":\"bookshelf\",\"search\":true,\"filters\":true,\"bulkActions\":true,\"pageEntries\":10,\"defaultSort\":\"id\",\"sort\":\"ASC\",\"options\":{\"timestamps\":[\"created_at\",\"updated_at\"]},\"editDisplay\":{\"availableFields\":{\"name\":{\"label\":\"Name\",\"type\":\"string\",\"description\":\"\",\"name\":\"name\",\"editable\":true,\"placeholder\":\"\"},\"hash\":{\"label\":\"Hash\",\"type\":\"string\",\"description\":\"\",\"name\":\"hash\",\"editable\":true,\"placeholder\":\"\"},\"sha256\":{\"label\":\"Sha256\",\"type\":\"string\",\"description\":\"\",\"name\":\"sha256\",\"editable\":true,\"placeholder\":\"\"},\"ext\":{\"label\":\"Ext\",\"type\":\"string\",\"description\":\"\",\"name\":\"ext\",\"editable\":true,\"placeholder\":\"\"},\"mime\":{\"label\":\"Mime\",\"type\":\"string\",\"description\":\"\",\"name\":\"mime\",\"editable\":true,\"placeholder\":\"\"},\"size\":{\"label\":\"Size\",\"type\":\"string\",\"description\":\"\",\"name\":\"size\",\"editable\":true,\"placeholder\":\"\"},\"url\":{\"label\":\"Url\",\"type\":\"string\",\"description\":\"\",\"name\":\"url\",\"editable\":true,\"placeholder\":\"\"},\"provider\":{\"label\":\"Provider\",\"type\":\"string\",\"description\":\"\",\"name\":\"provider\",\"editable\":true,\"placeholder\":\"\"},\"public_id\":{\"label\":\"Public_id\",\"type\":\"string\",\"description\":\"\",\"name\":\"public_id\",\"editable\":true,\"placeholder\":\"\"}},\"displayedField\":\"id\",\"fields\":[\"name\",\"hash\",\"sha256\",\"ext\",\"mime\",\"size\",\"url\",\"provider\",\"public_id\"],\"relations\":[]},\"info\":{\"name\":\"file\",\"description\":\"\"},\"connection\":\"default\",\"collectionName\":\"upload_file\",\"attributes\":{\"name\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"hash\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"sha256\":{\"type\":\"string\",\"configurable\":false},\"ext\":{\"type\":\"string\",\"configurable\":false},\"mime\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"size\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"url\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"provider\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"public_id\":{\"type\":\"string\",\"configurable\":false},\"related\":{\"collection\":\"*\",\"filter\":\"field\",\"configurable\":false}},\"globalId\":\"UploadFile\",\"globalName\":\"UploadFile\",\"primaryKey\":\"id\",\"associations\":[{\"alias\":\"related\",\"type\":\"collection\",\"related\":[],\"nature\":\"manyMorphToMany\",\"autoPopulate\":true,\"filter\":\"field\"}],\"fields\":{\"name\":{\"label\":\"Name\",\"description\":\"\",\"type\":\"string\",\"disabled\":false,\"name\":\"name\",\"sortable\":true,\"searchable\":true},\"hash\":{\"label\":\"Hash\",\"description\":\"\",\"type\":\"string\",\"disabled\":false,\"name\":\"hash\",\"sortable\":true,\"searchable\":true},\"sha256\":{\"label\":\"Sha256\",\"description\":\"\",\"type\":\"string\",\"disabled\":false,\"name\":\"sha256\",\"sortable\":true,\"searchable\":true},\"ext\":{\"label\":\"Ext\",\"description\":\"\",\"type\":\"string\",\"disabled\":false,\"name\":\"ext\",\"sortable\":true,\"searchable\":true},\"mime\":{\"label\":\"Mime\",\"description\":\"\",\"type\":\"string\",\"disabled\":false,\"name\":\"mime\",\"sortable\":true,\"searchable\":true},\"size\":{\"label\":\"Size\",\"description\":\"\",\"type\":\"string\",\"disabled\":false,\"name\":\"size\",\"sortable\":true,\"searchable\":true},\"url\":{\"label\":\"Url\",\"description\":\"\",\"type\":\"string\",\"disabled\":false,\"name\":\"url\",\"sortable\":true,\"searchable\":true},\"provider\":{\"label\":\"Provider\",\"description\":\"\",\"type\":\"string\",\"disabled\":false,\"name\":\"provider\",\"sortable\":true,\"searchable\":true},\"public_id\":{\"label\":\"Public_id\",\"description\":\"\",\"type\":\"string\",\"disabled\":false,\"name\":\"public_id\",\"sortable\":true,\"searchable\":true}},\"listDisplay\":[{\"name\":\"id\",\"label\":\"Id\",\"type\":\"string\",\"sortable\":true,\"searchable\":true},{\"label\":\"Name\",\"description\":\"\",\"type\":\"string\",\"disabled\":false,\"name\":\"name\",\"sortable\":true,\"searchable\":true},{\"label\":\"Hash\",\"description\":\"\",\"type\":\"string\",\"disabled\":false,\"name\":\"hash\",\"sortable\":true,\"searchable\":true},{\"label\":\"Sha256\",\"description\":\"\",\"type\":\"string\",\"disabled\":false,\"name\":\"sha256\",\"sortable\":true,\"searchable\":true},{\"label\":\"Ext\",\"description\":\"\",\"type\":\"string\",\"disabled\":false,\"name\":\"ext\",\"sortable\":true,\"searchable\":true}],\"relations\":{\"related\":{\"alias\":\"related\",\"type\":\"collection\",\"related\":[],\"nature\":\"manyMorphToMany\",\"autoPopulate\":true,\"filter\":\"field\",\"description\":\"\",\"label\":\"Related\",\"displayedAttribute\":\"id\"}}}},\"users-permissions\":{\"permission\":{\"label\":\"Permission\",\"labelPlural\":\"Permissions\",\"orm\":\"bookshelf\",\"search\":true,\"filters\":true,\"bulkActions\":true,\"pageEntries\":10,\"defaultSort\":\"id\",\"sort\":\"ASC\",\"options\":{\"timestamps\":false},\"editDisplay\":{\"availableFields\":{\"type\":{\"label\":\"Type\",\"type\":\"string\",\"description\":\"\",\"name\":\"type\",\"editable\":true,\"placeholder\":\"\"},\"controller\":{\"label\":\"Controller\",\"type\":\"string\",\"description\":\"\",\"name\":\"controller\",\"editable\":true,\"placeholder\":\"\"},\"action\":{\"label\":\"Action\",\"type\":\"string\",\"description\":\"\",\"name\":\"action\",\"editable\":true,\"placeholder\":\"\"},\"enabled\":{\"label\":\"Enabled\",\"type\":\"boolean\",\"description\":\"\",\"name\":\"enabled\",\"editable\":true,\"placeholder\":\"\"},\"policy\":{\"label\":\"Policy\",\"type\":\"string\",\"description\":\"\",\"name\":\"policy\",\"editable\":true,\"placeholder\":\"\"}},\"displayedField\":\"id\",\"fields\":[\"type\",\"controller\",\"action\",\"enabled\",\"policy\"],\"relations\":[\"role\"]},\"info\":{\"name\":\"permission\",\"description\":\"\"},\"connection\":\"default\",\"collectionName\":\"users-permissions_permission\",\"attributes\":{\"type\":{\"type\":\"string\",\"required\":true,\"configurable\":false},\"controller\":{\"type\":\"string\",\"required\":true,\"configurable\":false},\"action\":{\"type\":\"string\",\"required\":true,\"configurable\":false},\"enabled\":{\"type\":\"boolean\",\"required\":true,\"configurable\":false},\"policy\":{\"type\":\"string\",\"configurable\":false},\"role\":{\"model\":\"role\",\"via\":\"permissions\",\"plugin\":\"users-permissions\",\"configurable\":false}},\"globalId\":\"UsersPermissionsPermission\",\"globalName\":\"UsersPermissionsPermission\",\"primaryKey\":\"id\",\"associations\":[{\"alias\":\"role\",\"type\":\"model\",\"model\":\"role\",\"via\":\"permissions\",\"nature\":\"manyToOne\",\"autoPopulate\":true,\"dominant\":true,\"plugin\":\"users-permissions\"}],\"fields\":{\"type\":{\"label\":\"Type\",\"description\":\"\",\"type\":\"string\",\"disabled\":false,\"name\":\"type\",\"sortable\":true,\"searchable\":true},\"controller\":{\"label\":\"Controller\",\"description\":\"\",\"type\":\"string\",\"disabled\":false,\"name\":\"controller\",\"sortable\":true,\"searchable\":true},\"action\":{\"label\":\"Action\",\"description\":\"\",\"type\":\"string\",\"disabled\":false,\"name\":\"action\",\"sortable\":true,\"searchable\":true},\"enabled\":{\"label\":\"Enabled\",\"description\":\"\",\"type\":\"boolean\",\"disabled\":false,\"name\":\"enabled\",\"sortable\":true,\"searchable\":true},\"policy\":{\"label\":\"Policy\",\"description\":\"\",\"type\":\"string\",\"disabled\":false,\"name\":\"policy\",\"sortable\":true,\"searchable\":true}},\"listDisplay\":[{\"name\":\"id\",\"label\":\"Id\",\"type\":\"string\",\"sortable\":true,\"searchable\":true},{\"label\":\"Type\",\"description\":\"\",\"type\":\"string\",\"disabled\":false,\"name\":\"type\",\"sortable\":true,\"searchable\":true},{\"label\":\"Controller\",\"description\":\"\",\"type\":\"string\",\"disabled\":false,\"name\":\"controller\",\"sortable\":true,\"searchable\":true},{\"label\":\"Action\",\"description\":\"\",\"type\":\"string\",\"disabled\":false,\"name\":\"action\",\"sortable\":true,\"searchable\":true},{\"label\":\"Enabled\",\"description\":\"\",\"type\":\"boolean\",\"disabled\":false,\"name\":\"enabled\",\"sortable\":true,\"searchable\":true}],\"relations\":{\"role\":{\"alias\":\"role\",\"type\":\"model\",\"model\":\"role\",\"via\":\"permissions\",\"nature\":\"manyToOne\",\"autoPopulate\":true,\"dominant\":true,\"plugin\":\"users-permissions\",\"description\":\"\",\"label\":\"Role\",\"displayedAttribute\":\"name\"}}},\"role\":{\"label\":\"Role\",\"labelPlural\":\"Roles\",\"orm\":\"bookshelf\",\"search\":true,\"filters\":true,\"bulkActions\":true,\"pageEntries\":10,\"defaultSort\":\"id\",\"sort\":\"ASC\",\"options\":{\"timestamps\":false},\"editDisplay\":{\"availableFields\":{\"name\":{\"label\":\"Name\",\"type\":\"string\",\"description\":\"\",\"name\":\"name\",\"editable\":true,\"placeholder\":\"\"},\"description\":{\"label\":\"Description\",\"type\":\"string\",\"description\":\"\",\"name\":\"description\",\"editable\":true,\"placeholder\":\"\"},\"type\":{\"label\":\"Type\",\"type\":\"string\",\"description\":\"\",\"name\":\"type\",\"editable\":true,\"placeholder\":\"\"}},\"displayedField\":\"id\",\"fields\":[\"name\",\"description\",\"type\"],\"relations\":[\"permissions\",\"users\"]},\"info\":{\"name\":\"role\",\"description\":\"\"},\"connection\":\"default\",\"collectionName\":\"users-permissions_role\",\"attributes\":{\"name\":{\"type\":\"string\",\"minLength\":3,\"required\":true,\"configurable\":false},\"description\":{\"type\":\"string\",\"configurable\":false},\"type\":{\"type\":\"string\",\"unique\":true,\"configurable\":false},\"permissions\":{\"collection\":\"permission\",\"via\":\"role\",\"plugin\":\"users-permissions\",\"configurable\":false,\"isVirtual\":true},\"users\":{\"collection\":\"user\",\"via\":\"role\",\"configurable\":false,\"plugin\":\"users-permissions\",\"isVirtual\":true}},\"globalId\":\"UsersPermissionsRole\",\"globalName\":\"UsersPermissionsRole\",\"primaryKey\":\"id\",\"associations\":[{\"alias\":\"permissions\",\"type\":\"collection\",\"collection\":\"permission\",\"via\":\"role\",\"nature\":\"oneToMany\",\"autoPopulate\":true,\"dominant\":true,\"plugin\":\"users-permissions\"},{\"alias\":\"users\",\"type\":\"collection\",\"collection\":\"user\",\"via\":\"role\",\"nature\":\"oneToMany\",\"autoPopulate\":true,\"dominant\":true,\"plugin\":\"users-permissions\"}],\"fields\":{\"name\":{\"label\":\"Name\",\"description\":\"\",\"type\":\"string\",\"disabled\":false,\"name\":\"name\",\"sortable\":true,\"searchable\":true},\"description\":{\"label\":\"Description\",\"description\":\"\",\"type\":\"string\",\"disabled\":false,\"name\":\"description\",\"sortable\":true,\"searchable\":true},\"type\":{\"label\":\"Type\",\"description\":\"\",\"type\":\"string\",\"disabled\":false,\"name\":\"type\",\"sortable\":true,\"searchable\":true}},\"listDisplay\":[{\"name\":\"id\",\"label\":\"Id\",\"type\":\"string\",\"sortable\":true,\"searchable\":true},{\"label\":\"Name\",\"description\":\"\",\"type\":\"string\",\"disabled\":false,\"name\":\"name\",\"sortable\":true,\"searchable\":true},{\"label\":\"Description\",\"description\":\"\",\"type\":\"string\",\"disabled\":false,\"name\":\"description\",\"sortable\":true,\"searchable\":true},{\"label\":\"Type\",\"description\":\"\",\"type\":\"string\",\"disabled\":false,\"name\":\"type\",\"sortable\":true,\"searchable\":true}],\"relations\":{\"permissions\":{\"alias\":\"permissions\",\"type\":\"collection\",\"collection\":\"permission\",\"via\":\"role\",\"nature\":\"oneToMany\",\"autoPopulate\":true,\"dominant\":true,\"plugin\":\"users-permissions\",\"description\":\"\",\"label\":\"Permissions\",\"displayedAttribute\":\"type\"},\"users\":{\"alias\":\"users\",\"type\":\"collection\",\"collection\":\"user\",\"via\":\"role\",\"nature\":\"oneToMany\",\"autoPopulate\":true,\"dominant\":true,\"plugin\":\"users-permissions\",\"description\":\"\",\"label\":\"Users\",\"displayedAttribute\":\"username\"}}},\"user\":{\"label\":\"User\",\"labelPlural\":\"Users\",\"orm\":\"bookshelf\",\"search\":true,\"filters\":true,\"bulkActions\":true,\"pageEntries\":10,\"defaultSort\":\"id\",\"sort\":\"ASC\",\"options\":{\"timestamps\":false},\"editDisplay\":{\"availableFields\":{\"username\":{\"label\":\"Username\",\"type\":\"string\",\"description\":\"\",\"name\":\"username\",\"editable\":true,\"placeholder\":\"\"},\"email\":{\"label\":\"Email\",\"type\":\"email\",\"description\":\"\",\"name\":\"email\",\"editable\":true,\"placeholder\":\"\"},\"provider\":{\"label\":\"Provider\",\"type\":\"string\",\"description\":\"\",\"name\":\"provider\",\"editable\":true,\"placeholder\":\"\"},\"password\":{\"label\":\"Password\",\"type\":\"password\",\"description\":\"\",\"name\":\"password\",\"editable\":true,\"placeholder\":\"\"},\"confirmed\":{\"label\":\"Confirmed\",\"type\":\"boolean\",\"description\":\"\",\"name\":\"confirmed\",\"editable\":true,\"placeholder\":\"\"},\"blocked\":{\"label\":\"Blocked\",\"type\":\"boolean\",\"description\":\"\",\"name\":\"blocked\",\"editable\":true,\"placeholder\":\"\"}},\"displayedField\":\"id\",\"fields\":[\"username\",\"email\",\"provider\",\"password\",\"confirmed\",\"blocked\"],\"relations\":[\"role\"]},\"info\":{\"name\":\"user\",\"description\":\"\"},\"connection\":\"default\",\"collectionName\":\"users-permissions_user\",\"attributes\":{\"username\":{\"type\":\"string\",\"minLength\":3,\"unique\":true,\"configurable\":false,\"required\":true},\"email\":{\"type\":\"email\",\"minLength\":6,\"configurable\":false,\"required\":true},\"provider\":{\"type\":\"string\",\"configurable\":false},\"password\":{\"type\":\"password\",\"minLength\":6,\"configurable\":false,\"private\":true},\"confirmed\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false},\"blocked\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false},\"role\":{\"model\":\"role\",\"via\":\"users\",\"plugin\":\"users-permissions\",\"configurable\":false}},\"globalId\":\"UsersPermissionsUser\",\"globalName\":\"UsersPermissionsUser\",\"primaryKey\":\"id\",\"associations\":[{\"alias\":\"role\",\"type\":\"model\",\"model\":\"role\",\"via\":\"users\",\"nature\":\"manyToOne\",\"autoPopulate\":true,\"dominant\":true,\"plugin\":\"users-permissions\"}],\"fields\":{\"username\":{\"label\":\"Username\",\"description\":\"\",\"type\":\"string\",\"disabled\":false,\"name\":\"username\",\"sortable\":true,\"searchable\":true},\"email\":{\"label\":\"Email\",\"description\":\"\",\"type\":\"email\",\"disabled\":false,\"name\":\"email\",\"sortable\":true,\"searchable\":true},\"provider\":{\"label\":\"Provider\",\"description\":\"\",\"type\":\"string\",\"disabled\":false,\"name\":\"provider\",\"sortable\":true,\"searchable\":true},\"password\":{\"label\":\"Password\",\"description\":\"\",\"type\":\"password\",\"disabled\":false,\"name\":\"password\",\"sortable\":true,\"searchable\":true},\"confirmed\":{\"label\":\"Confirmed\",\"description\":\"\",\"type\":\"boolean\",\"disabled\":false,\"name\":\"confirmed\",\"sortable\":true,\"searchable\":true},\"blocked\":{\"label\":\"Blocked\",\"description\":\"\",\"type\":\"boolean\",\"disabled\":false,\"name\":\"blocked\",\"sortable\":true,\"searchable\":true}},\"listDisplay\":[{\"name\":\"id\",\"label\":\"Id\",\"type\":\"string\",\"sortable\":true,\"searchable\":true},{\"label\":\"Username\",\"description\":\"\",\"type\":\"string\",\"disabled\":false,\"name\":\"username\",\"sortable\":true,\"searchable\":true},{\"label\":\"Email\",\"description\":\"\",\"type\":\"email\",\"disabled\":false,\"name\":\"email\",\"sortable\":true,\"searchable\":true},{\"label\":\"Provider\",\"description\":\"\",\"type\":\"string\",\"disabled\":false,\"name\":\"provider\",\"sortable\":true,\"searchable\":true},{\"label\":\"Password\",\"description\":\"\",\"type\":\"password\",\"disabled\":false,\"name\":\"password\",\"sortable\":true,\"searchable\":true}],\"relations\":{\"role\":{\"alias\":\"role\",\"type\":\"model\",\"model\":\"role\",\"via\":\"users\",\"nature\":\"manyToOne\",\"autoPopulate\":true,\"dominant\":true,\"plugin\":\"users-permissions\",\"description\":\"\",\"label\":\"Role\",\"displayedAttribute\":\"name\"}}}}},\"language\":{\"label\":\"Language\",\"labelPlural\":\"Languages\",\"orm\":\"bookshelf\",\"search\":true,\"filters\":true,\"bulkActions\":true,\"pageEntries\":10,\"defaultSort\":\"id\",\"sort\":\"ASC\",\"options\":{\"increments\":true,\"timestamps\":[\"created_at\",\"updated_at\"],\"comment\":\"\"},\"editDisplay\":{\"availableFields\":{\"Name\":{\"label\":\"Name\",\"type\":\"string\",\"description\":\"\",\"name\":\"Name\",\"editable\":true,\"placeholder\":\"\"},\"Code\":{\"label\":\"Code\",\"type\":\"string\",\"description\":\"\",\"name\":\"Code\",\"editable\":true,\"placeholder\":\"\"}},\"displayedField\":\"id\",\"fields\":[\"Name\",\"Code\"],\"relations\":[]},\"info\":{\"name\":\"language\",\"description\":\"\"},\"connection\":\"default\",\"collectionName\":\"languages\",\"attributes\":{\"Name\":{\"unique\":true,\"required\":true,\"type\":\"string\"},\"Code\":{\"unique\":true,\"required\":true,\"type\":\"string\"}},\"globalId\":\"Language\",\"globalName\":\"Language\",\"primaryKey\":\"id\",\"associations\":[],\"fields\":{\"Name\":{\"label\":\"Name\",\"description\":\"\",\"type\":\"string\",\"disabled\":false,\"name\":\"Name\",\"sortable\":true,\"searchable\":true},\"Code\":{\"label\":\"Code\",\"description\":\"\",\"type\":\"string\",\"disabled\":false,\"name\":\"Code\",\"sortable\":true,\"searchable\":true}},\"listDisplay\":[{\"name\":\"id\",\"label\":\"Id\",\"type\":\"string\",\"sortable\":true,\"searchable\":true},{\"label\":\"Name\",\"description\":\"\",\"type\":\"string\",\"disabled\":false,\"name\":\"Name\",\"sortable\":true,\"searchable\":true},{\"label\":\"Code\",\"description\":\"\",\"type\":\"string\",\"disabled\":false,\"name\":\"Code\",\"sortable\":true,\"searchable\":true}],\"relations\":{}},\"category\":{\"label\":\"Category\",\"labelPlural\":\"Categories\",\"orm\":\"bookshelf\",\"search\":true,\"filters\":true,\"bulkActions\":true,\"pageEntries\":10,\"defaultSort\":\"id\",\"sort\":\"ASC\",\"options\":{\"increments\":true,\"timestamps\":[\"created_at\",\"updated_at\"],\"comment\":\"\"},\"editDisplay\":{\"availableFields\":{\"Name\":{\"label\":\"Name\",\"type\":\"string\",\"description\":\"\",\"name\":\"Name\",\"editable\":true,\"placeholder\":\"\"},\"Slug\":{\"label\":\"Slug\",\"type\":\"string\",\"description\":\"\",\"name\":\"Slug\",\"editable\":true,\"placeholder\":\"\"}},\"displayedField\":\"id\",\"fields\":[\"Name\",\"Slug\"],\"relations\":[]},\"info\":{\"name\":\"category\",\"description\":\"\"},\"connection\":\"default\",\"collectionName\":\"categories\",\"attributes\":{\"Name\":{\"type\":\"string\",\"unique\":true,\"required\":true},\"Slug\":{\"required\":true,\"unique\":true,\"type\":\"string\"}},\"globalId\":\"Category\",\"globalName\":\"Category\",\"primaryKey\":\"id\",\"associations\":[],\"fields\":{\"Name\":{\"label\":\"Name\",\"description\":\"\",\"type\":\"string\",\"disabled\":false,\"name\":\"Name\",\"sortable\":true,\"searchable\":true},\"Slug\":{\"label\":\"Slug\",\"description\":\"\",\"type\":\"string\",\"disabled\":false,\"name\":\"Slug\",\"sortable\":true,\"searchable\":true}},\"listDisplay\":[{\"name\":\"id\",\"label\":\"Id\",\"type\":\"string\",\"sortable\":true,\"searchable\":true},{\"label\":\"Name\",\"description\":\"\",\"type\":\"string\",\"disabled\":false,\"name\":\"Name\",\"sortable\":true,\"searchable\":true},{\"label\":\"Slug\",\"description\":\"\",\"type\":\"string\",\"disabled\":false,\"name\":\"Slug\",\"sortable\":true,\"searchable\":true}],\"relations\":{}},\"post\":{\"label\":\"Post\",\"labelPlural\":\"Posts\",\"orm\":\"bookshelf\",\"search\":true,\"filters\":true,\"bulkActions\":true,\"pageEntries\":10,\"defaultSort\":\"id\",\"sort\":\"ASC\",\"options\":{\"increments\":true,\"timestamps\":[\"created_at\",\"updated_at\"],\"comment\":\"\"},\"editDisplay\":{\"availableFields\":{\"title_en\":{\"label\":\"Title_en\",\"type\":\"string\",\"description\":\"\",\"name\":\"title_en\",\"editable\":true,\"placeholder\":\"\"},\"title_es\":{\"label\":\"Title_es\",\"type\":\"string\",\"description\":\"\",\"name\":\"title_es\",\"editable\":true,\"placeholder\":\"\"},\"content_en\":{\"label\":\"Content_en\",\"type\":\"text\",\"description\":\"\",\"name\":\"content_en\",\"editable\":true,\"placeholder\":\"\"},\"content_es\":{\"label\":\"Content_es\",\"type\":\"text\",\"description\":\"\",\"name\":\"content_es\",\"editable\":true,\"placeholder\":\"\"}},\"displayedField\":\"id\",\"fields\":[\"title_en\",\"title_es\",\"content_en\",\"content_es\"],\"relations\":[\"category\"]},\"info\":{\"name\":\"post\",\"description\":\"\"},\"connection\":\"default\",\"collectionName\":\"posts\",\"attributes\":{\"category\":{\"model\":\"category\"},\"title_en\":{\"type\":\"string\",\"required\":true},\"title_es\":{\"type\":\"string\"},\"content_en\":{\"type\":\"text\"},\"content_es\":{\"type\":\"text\"}},\"globalId\":\"Post\",\"globalName\":\"Post\",\"primaryKey\":\"id\",\"associations\":[{\"alias\":\"category\",\"type\":\"model\",\"model\":\"category\",\"nature\":\"oneWay\",\"autoPopulate\":true,\"dominant\":true}],\"fields\":{\"title_en\":{\"label\":\"Title_en\",\"description\":\"\",\"type\":\"string\",\"disabled\":false,\"name\":\"title_en\",\"sortable\":true,\"searchable\":true},\"title_es\":{\"label\":\"Title_es\",\"description\":\"\",\"type\":\"string\",\"disabled\":false,\"name\":\"title_es\",\"sortable\":true,\"searchable\":true},\"content_en\":{\"label\":\"Content_en\",\"description\":\"\",\"type\":\"text\",\"disabled\":false,\"name\":\"content_en\",\"sortable\":true,\"searchable\":true},\"content_es\":{\"label\":\"Content_es\",\"description\":\"\",\"type\":\"text\",\"disabled\":false,\"name\":\"content_es\",\"sortable\":true,\"searchable\":true}},\"listDisplay\":[{\"name\":\"id\",\"label\":\"Id\",\"type\":\"string\",\"sortable\":true,\"searchable\":true}],\"relations\":{\"category\":{\"alias\":\"category\",\"type\":\"model\",\"model\":\"category\",\"nature\":\"oneWay\",\"autoPopulate\":true,\"dominant\":true,\"description\":\"\",\"label\":\"Category\",\"displayedAttribute\":\"Name\"}}}},\"layout\":{\"user\":{\"actions\":{\"create\":\"User.create\",\"update\":\"User.update\",\"destroy\":\"User.destroy\",\"deleteall\":\"User.destroyAll\"},\"attributes\":{\"username\":{\"className\":\"col-md-6\"},\"email\":{\"className\":\"col-md-6\"},\"resetPasswordToken\":{\"className\":\"d-none\"},\"role\":{\"className\":\"d-none\"}}},\"language\":{\"attributes\":{}},\"category\":{\"attributes\":{}},\"post\":{\"attributes\":{\"content_en\":{\"appearance\":\"WYSIWYG\"},\"content_es\":{\"appearance\":\"WYSIWYG\"}}}}}','object','',''),(8,'core_application','{\"name\":\"Default Application\",\"description\":\"This API is going to be awesome!\"}','object','',''),(9,'plugin_users-permissions_grant','{\"email\":{\"enabled\":true,\"icon\":\"envelope\"},\"discord\":{\"enabled\":false,\"icon\":\"comments\",\"key\":\"\",\"secret\":\"\",\"callback\":\"/auth/discord/callback\",\"scope\":[\"identify\",\"email\"]},\"facebook\":{\"enabled\":false,\"icon\":\"facebook-official\",\"key\":\"\",\"secret\":\"\",\"callback\":\"/auth/facebook/callback\",\"scope\":[\"email\"]},\"google\":{\"enabled\":false,\"icon\":\"google\",\"key\":\"\",\"secret\":\"\",\"callback\":\"/auth/google/callback\",\"scope\":[\"email\"]},\"github\":{\"enabled\":false,\"icon\":\"github\",\"key\":\"\",\"secret\":\"\",\"redirect_uri\":\"/auth/github/callback\",\"scope\":[\"user\",\"user:email\"]},\"microsoft\":{\"enabled\":false,\"icon\":\"windows\",\"key\":\"\",\"secret\":\"\",\"callback\":\"/auth/microsoft/callback\",\"scope\":[\"user.read\"]},\"twitter\":{\"enabled\":false,\"icon\":\"twitter\",\"key\":\"\",\"secret\":\"\",\"callback\":\"/auth/twitter/callback\"}}','object','',''),(10,'plugin_email_provider','{\"provider\":\"sendmail\",\"name\":\"Sendmail\",\"auth\":{\"sendmail_default_from\":{\"label\":\"Sendmail Default From\",\"type\":\"text\"},\"sendmail_default_replyto\":{\"label\":\"Sendmail Default Reply-To\",\"type\":\"text\"}}}','object','development',''),(11,'plugin_upload_provider','{\"provider\":\"local\",\"name\":\"Local server\",\"enabled\":true,\"sizeLimit\":1000000}','object','development',''),(12,'plugin_users-permissions_email','{\"reset_password\":{\"display\":\"Email.template.reset_password\",\"icon\":\"refresh\",\"options\":{\"from\":{\"name\":\"Administration Panel\",\"email\":\"no-reply@strapi.io\"},\"response_email\":\"\",\"object\":\"­Reset password\",\"message\":\"<p>We heard that you lost your password. Sorry about that!</p>\\n\\n<p>But don’t worry! You can use the following link to reset your password:</p>\\n\\n<p><%= URL %>?code=<%= TOKEN %></p>\\n\\n<p>Thanks.</p>\"}},\"email_confirmation\":{\"display\":\"Email.template.email_confirmation\",\"icon\":\"check-square-o\",\"options\":{\"from\":{\"name\":\"Administration Panel\",\"email\":\"no-reply@strapi.io\"},\"response_email\":\"\",\"object\":\"Account confirmation\",\"message\":\"<p>Thank you for registering!</p>\\n\\n<p>You have to confirm your email address. Please click on the link below.</p>\\n\\n<p><%= URL %>?confirmation=<%= CODE %></p>\\n\\n<p>Thanks.</p>\"}}}','object','',''),(13,'plugin_users-permissions_advanced','{\"unique_email\":true,\"allow_register\":true,\"email_confirmation\":false,\"email_confirmation_redirection\":\"http://localhost:1337/admin\",\"default_role\":\"authenticated\"}','object','',''),(14,'db_model_languages','{\"Name\":{\"unique\":true,\"required\":true,\"type\":\"string\"},\"Code\":{\"unique\":true,\"required\":true,\"type\":\"string\"},\"created_at\":{\"type\":\"timestamp\"},\"updated_at\":{\"type\":\"timestampUpdate\"}}','object',NULL,NULL),(15,'db_model_categories','{\"Name\":{\"type\":\"string\",\"unique\":true,\"required\":true},\"Slug\":{\"required\":true,\"unique\":true,\"type\":\"string\"},\"created_at\":{\"type\":\"timestamp\"},\"updated_at\":{\"type\":\"timestampUpdate\"}}','object',NULL,NULL),(16,'db_model_posts','{\"category\":{\"model\":\"category\"},\"title_en\":{\"type\":\"string\",\"required\":true},\"title_es\":{\"type\":\"string\"},\"content_en\":{\"type\":\"text\"},\"content_es\":{\"type\":\"text\"},\"created_at\":{\"type\":\"timestamp\"},\"updated_at\":{\"type\":\"timestampUpdate\"}}','object',NULL,NULL),(17,'db_model_posttranslations','{\"language\":{\"model\":\"language\"},\"post\":{\"model\":\"post\"},\"Title\":{\"unique\":true,\"required\":true,\"type\":\"string\"},\"created_at\":{\"type\":\"timestamp\"},\"updated_at\":{\"type\":\"timestampUpdate\"}}','object',NULL,NULL);
/*!40000 ALTER TABLE `core_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL,
  `Code` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_LANGUAGES` (`Name`,`Code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages`
--

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
INSERT INTO `languages` VALUES (1,'English','en-US','2019-04-23 01:47:27','2019-04-23 01:47:27'),(2,'Español','es-ES','2019-04-23 01:47:36','2019-04-23 01:47:36');
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `title_en` varchar(255) NOT NULL,
  `title_es` varchar(255) DEFAULT NULL,
  `content_en` longtext,
  `content_es` longtext,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_POSTS` (`title_en`,`title_es`,`content_en`,`content_es`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,1,'2019-04-23 02:04:45','2019-04-23 02:42:39','How to install LAMP on Ubuntu 16.04','Como instalar LAMP en Ubuntu 16.04','<h2>What is LAMP ?</h2>\r\n\r\n<p>Lamp stands for linux, apache, MySql and PHP. When we talk about installing LAMP, we\'re referring to install this group of software over a linux environment, which is typically used to host websites or applications that use PHP such as Wordpress, Drupal, or the Laravel framework. In this guide we\'ll be installing and configuring each of these components one by one to achieve what is called a LAMP stack. In the other hand there are prepared packages that include these three software components (apache, mysql, php) already configured  like XAMP, more typically used in local development environments, if you\'re more interested in installing XAMP follow this link.</p>\r\n\r\n<h2>Installing Apache</h2>\r\n\r\n<p>First things first, we need to update the available packages lists from the ubuntu software repositories and then install apache. Open the terminal with CTRL+ALT+T keys combination and type the following:</p>\r\n\r\n<pre><code>sudo apt-get update\r\nsudo apt-get install apache2\r\n</code></pre>\r\n\r\n<p>Bear in mind that using sudo will run these commands under root / admin privileges. it will ask your password to do so.</p>\r\n\r\n<p>After the install completes type the following to restart apache:</p>\r\n\r\n<pre><code>sudo /etc/init.d/apache2 restart\r\n</code></pre>\r\n\r\n<h3>Checking apache is working</h3>\r\n\r\n<p>Type in the web browser http://localhost or http://yourIpAddress it should load the apache2 default page:</p>',NULL);
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posttranslations`
--

DROP TABLE IF EXISTS `posttranslations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `posttranslations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language` int(11) DEFAULT NULL,
  `post` int(11) DEFAULT NULL,
  `Title` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_POSTTRANSLATIONS` (`Title`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posttranslations`
--

LOCK TABLES `posttranslations` WRITE;
/*!40000 ALTER TABLE `posttranslations` DISABLE KEYS */;
/*!40000 ALTER TABLE `posttranslations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `upload_file`
--

DROP TABLE IF EXISTS `upload_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `upload_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `hash` varchar(255) NOT NULL,
  `sha256` varchar(255) DEFAULT NULL,
  `ext` varchar(255) DEFAULT NULL,
  `mime` varchar(255) NOT NULL,
  `size` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `provider` varchar(255) NOT NULL,
  `public_id` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_UPLOAD_FILE` (`name`,`hash`,`sha256`,`ext`,`mime`,`size`,`url`,`provider`,`public_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `upload_file`
--

LOCK TABLES `upload_file` WRITE;
/*!40000 ALTER TABLE `upload_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `upload_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `upload_file_morph`
--

DROP TABLE IF EXISTS `upload_file_morph`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `upload_file_morph` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `upload_file_id` int(11) DEFAULT NULL,
  `related_id` int(11) DEFAULT NULL,
  `related_type` longtext,
  `field` longtext,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_UPLOAD_FILE_MORPH` (`related_type`,`field`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `upload_file_morph`
--

LOCK TABLES `upload_file_morph` WRITE;
/*!40000 ALTER TABLE `upload_file_morph` DISABLE KEYS */;
/*!40000 ALTER TABLE `upload_file_morph` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users-permissions_permission`
--

DROP TABLE IF EXISTS `users-permissions_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `users-permissions_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `controller` varchar(255) NOT NULL,
  `action` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `policy` varchar(255) DEFAULT NULL,
  `role` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_USERS_PERMISSIONS_PERMISSION` (`type`,`controller`,`action`,`policy`)
) ENGINE=InnoDB AUTO_INCREMENT=298 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users-permissions_permission`
--

LOCK TABLES `users-permissions_permission` WRITE;
/*!40000 ALTER TABLE `users-permissions_permission` DISABLE KEYS */;
INSERT INTO `users-permissions_permission` VALUES (1,'content-manager','contentmanager','models',1,'',1),(2,'content-manager','contentmanager','find',1,'',1),(3,'content-manager','contentmanager','count',1,'',1),(4,'content-manager','contentmanager','findone',1,'',1),(5,'content-manager','contentmanager','create',1,'',1),(6,'content-manager','contentmanager','update',1,'',1),(7,'content-manager','contentmanager','updatesettings',1,'',1),(8,'content-manager','contentmanager','delete',1,'',1),(9,'content-manager','contentmanager','deleteall',1,'',1),(10,'content-type-builder','contenttypebuilder','getmodels',1,'',1),(11,'content-type-builder','contenttypebuilder','getmodel',1,'',1),(12,'content-type-builder','contenttypebuilder','getconnections',1,'',1),(13,'content-type-builder','contenttypebuilder','createmodel',1,'',1),(14,'content-type-builder','contenttypebuilder','updatemodel',1,'',1),(15,'content-type-builder','contenttypebuilder','deletemodel',1,'',1),(16,'content-type-builder','contenttypebuilder','autoreload',1,'',1),(17,'content-type-builder','contenttypebuilder','checktableexists',1,'',1),(18,'email','email','send',1,'',1),(19,'email','email','getenvironments',1,'',1),(20,'email','email','getsettings',1,'',1),(21,'email','email','updatesettings',1,'',1),(22,'settings-manager','settingsmanager','menu',1,'',1),(23,'settings-manager','settingsmanager','environments',1,'',1),(24,'settings-manager','settingsmanager','languages',1,'',1),(25,'settings-manager','settingsmanager','databases',1,'',1),(26,'settings-manager','settingsmanager','database',1,'',1),(27,'settings-manager','settingsmanager','databasemodel',1,'',1),(28,'settings-manager','settingsmanager','get',1,'',1),(29,'settings-manager','settingsmanager','update',1,'',1),(30,'settings-manager','settingsmanager','createlanguage',1,'',1),(31,'settings-manager','settingsmanager','deletelanguage',1,'',1),(32,'settings-manager','settingsmanager','createdatabase',1,'',1),(33,'settings-manager','settingsmanager','updatedatabase',1,'',1),(34,'settings-manager','settingsmanager','deletedatabase',1,'',1),(35,'settings-manager','settingsmanager','autoreload',1,'',1),(36,'upload','upload','upload',1,'',1),(37,'upload','upload','getenvironments',1,'',1),(38,'upload','upload','getsettings',1,'',1),(39,'upload','upload','updatesettings',1,'',1),(40,'upload','upload','find',1,'',1),(41,'upload','upload','findone',1,'',1),(42,'upload','upload','count',1,'',1),(43,'upload','upload','destroy',1,'',1),(44,'upload','upload','search',1,'',1),(45,'users-permissions','auth','callback',1,'',1),(46,'users-permissions','auth','changepassword',1,'',1),(47,'users-permissions','auth','connect',1,'',1),(48,'users-permissions','auth','forgotpassword',1,'',1),(49,'users-permissions','auth','register',1,'',1),(50,'users-permissions','auth','emailconfirmation',1,'',1),(51,'users-permissions','user','find',1,'',1),(52,'users-permissions','user','me',1,'',1),(53,'users-permissions','user','findone',1,'',1),(54,'users-permissions','user','create',1,'',1),(55,'users-permissions','user','update',1,'',1),(56,'users-permissions','user','destroy',1,'',1),(57,'users-permissions','user','destroyall',1,'',1),(58,'users-permissions','userspermissions','createrole',1,'',1),(59,'users-permissions','userspermissions','deleteprovider',1,'',1),(60,'users-permissions','userspermissions','deleterole',1,'',1),(61,'users-permissions','userspermissions','getpermissions',1,'',1),(62,'users-permissions','userspermissions','getpolicies',1,'',1),(63,'users-permissions','userspermissions','getrole',1,'',1),(64,'users-permissions','userspermissions','getroles',1,'',1),(65,'users-permissions','userspermissions','getroutes',1,'',1),(66,'users-permissions','userspermissions','index',1,'',1),(67,'users-permissions','userspermissions','init',1,'',1),(68,'users-permissions','userspermissions','searchusers',1,'',1),(69,'users-permissions','userspermissions','updaterole',1,'',1),(70,'users-permissions','userspermissions','getemailtemplate',1,'',1),(71,'users-permissions','userspermissions','updateemailtemplate',1,'',1),(72,'users-permissions','userspermissions','getadvancedsettings',1,'',1),(73,'users-permissions','userspermissions','updateadvancedsettings',1,'',1),(74,'users-permissions','userspermissions','getproviders',1,'',1),(75,'users-permissions','userspermissions','updateproviders',1,'',1),(76,'content-manager','contentmanager','models',0,'',2),(77,'content-manager','contentmanager','find',0,'',2),(78,'content-manager','contentmanager','count',0,'',2),(79,'content-manager','contentmanager','findone',0,'',2),(80,'content-manager','contentmanager','create',0,'',2),(81,'content-manager','contentmanager','update',0,'',2),(82,'content-manager','contentmanager','updatesettings',0,'',2),(83,'content-manager','contentmanager','delete',0,'',2),(84,'content-manager','contentmanager','deleteall',0,'',2),(85,'content-type-builder','contenttypebuilder','getmodels',0,'',2),(86,'content-type-builder','contenttypebuilder','getmodel',0,'',2),(87,'content-type-builder','contenttypebuilder','getconnections',0,'',2),(88,'content-type-builder','contenttypebuilder','createmodel',0,'',2),(89,'content-type-builder','contenttypebuilder','updatemodel',0,'',2),(90,'content-type-builder','contenttypebuilder','deletemodel',0,'',2),(91,'content-type-builder','contenttypebuilder','autoreload',1,'',2),(92,'content-type-builder','contenttypebuilder','checktableexists',0,'',2),(93,'email','email','send',0,'',2),(94,'email','email','getenvironments',0,'',2),(95,'email','email','getsettings',0,'',2),(96,'email','email','updatesettings',0,'',2),(97,'settings-manager','settingsmanager','menu',0,'',2),(98,'settings-manager','settingsmanager','environments',0,'',2),(99,'settings-manager','settingsmanager','languages',0,'',2),(100,'settings-manager','settingsmanager','databases',0,'',2),(101,'settings-manager','settingsmanager','database',0,'',2),(102,'settings-manager','settingsmanager','databasemodel',0,'',2),(103,'settings-manager','settingsmanager','get',0,'',2),(104,'settings-manager','settingsmanager','update',0,'',2),(105,'settings-manager','settingsmanager','createlanguage',0,'',2),(106,'settings-manager','settingsmanager','deletelanguage',0,'',2),(107,'settings-manager','settingsmanager','createdatabase',0,'',2),(108,'settings-manager','settingsmanager','updatedatabase',0,'',2),(109,'settings-manager','settingsmanager','deletedatabase',0,'',2),(110,'settings-manager','settingsmanager','autoreload',1,'',2),(111,'upload','upload','upload',0,'',2),(112,'upload','upload','getenvironments',0,'',2),(113,'upload','upload','getsettings',0,'',2),(114,'upload','upload','updatesettings',0,'',2),(115,'upload','upload','find',0,'',2),(116,'upload','upload','findone',0,'',2),(117,'upload','upload','count',0,'',2),(118,'upload','upload','destroy',0,'',2),(119,'upload','upload','search',0,'',2),(120,'users-permissions','auth','callback',0,'',2),(121,'users-permissions','auth','changepassword',0,'',2),(122,'users-permissions','auth','connect',1,'',2),(123,'users-permissions','auth','forgotpassword',0,'',2),(124,'users-permissions','auth','register',0,'',2),(125,'users-permissions','auth','emailconfirmation',0,'',2),(126,'users-permissions','user','find',0,'',2),(127,'users-permissions','user','me',1,'',2),(128,'users-permissions','user','findone',0,'',2),(129,'users-permissions','user','create',0,'',2),(130,'users-permissions','user','update',0,'',2),(131,'users-permissions','user','destroy',0,'',2),(132,'users-permissions','user','destroyall',0,'',2),(133,'users-permissions','userspermissions','createrole',0,'',2),(134,'users-permissions','userspermissions','deleteprovider',0,'',2),(135,'users-permissions','userspermissions','deleterole',0,'',2),(136,'users-permissions','userspermissions','getpermissions',0,'',2),(137,'users-permissions','userspermissions','getpolicies',0,'',2),(138,'users-permissions','userspermissions','getrole',0,'',2),(139,'users-permissions','userspermissions','getroles',0,'',2),(140,'users-permissions','userspermissions','getroutes',0,'',2),(141,'users-permissions','userspermissions','index',0,'',2),(142,'users-permissions','userspermissions','init',1,'',2),(143,'users-permissions','userspermissions','searchusers',0,'',2),(144,'users-permissions','userspermissions','updaterole',0,'',2),(145,'users-permissions','userspermissions','getemailtemplate',0,'',2),(146,'users-permissions','userspermissions','updateemailtemplate',0,'',2),(147,'users-permissions','userspermissions','getadvancedsettings',0,'',2),(148,'users-permissions','userspermissions','updateadvancedsettings',0,'',2),(149,'users-permissions','userspermissions','getproviders',0,'',2),(150,'users-permissions','userspermissions','updateproviders',0,'',2),(151,'content-manager','contentmanager','models',0,'',3),(152,'content-manager','contentmanager','find',0,'',3),(153,'content-manager','contentmanager','count',0,'',3),(154,'content-manager','contentmanager','findone',0,'',3),(155,'content-manager','contentmanager','create',0,'',3),(156,'content-manager','contentmanager','update',0,'',3),(157,'content-manager','contentmanager','updatesettings',0,'',3),(158,'content-manager','contentmanager','delete',0,'',3),(159,'content-manager','contentmanager','deleteall',0,'',3),(160,'content-type-builder','contenttypebuilder','getmodels',0,'',3),(161,'content-type-builder','contenttypebuilder','getmodel',0,'',3),(162,'content-type-builder','contenttypebuilder','getconnections',0,'',3),(163,'content-type-builder','contenttypebuilder','createmodel',0,'',3),(164,'content-type-builder','contenttypebuilder','updatemodel',0,'',3),(165,'content-type-builder','contenttypebuilder','deletemodel',0,'',3),(166,'content-type-builder','contenttypebuilder','autoreload',1,'',3),(167,'content-type-builder','contenttypebuilder','checktableexists',0,'',3),(168,'email','email','send',0,'',3),(169,'email','email','getenvironments',0,'',3),(170,'email','email','getsettings',0,'',3),(171,'email','email','updatesettings',0,'',3),(172,'settings-manager','settingsmanager','menu',0,'',3),(173,'settings-manager','settingsmanager','environments',0,'',3),(174,'settings-manager','settingsmanager','languages',0,'',3),(175,'settings-manager','settingsmanager','databases',0,'',3),(176,'settings-manager','settingsmanager','database',0,'',3),(177,'settings-manager','settingsmanager','databasemodel',0,'',3),(178,'settings-manager','settingsmanager','get',0,'',3),(179,'settings-manager','settingsmanager','update',0,'',3),(180,'settings-manager','settingsmanager','createlanguage',0,'',3),(181,'settings-manager','settingsmanager','deletelanguage',0,'',3),(182,'settings-manager','settingsmanager','createdatabase',0,'',3),(183,'settings-manager','settingsmanager','updatedatabase',0,'',3),(184,'settings-manager','settingsmanager','deletedatabase',0,'',3),(185,'settings-manager','settingsmanager','autoreload',1,'',3),(186,'upload','upload','upload',0,'',3),(187,'upload','upload','getenvironments',0,'',3),(188,'upload','upload','getsettings',0,'',3),(189,'upload','upload','updatesettings',0,'',3),(190,'upload','upload','find',0,'',3),(191,'upload','upload','findone',0,'',3),(192,'upload','upload','count',0,'',3),(193,'upload','upload','destroy',0,'',3),(194,'upload','upload','search',0,'',3),(195,'users-permissions','auth','callback',1,'',3),(196,'users-permissions','auth','changepassword',1,'',3),(197,'users-permissions','auth','connect',1,'',3),(198,'users-permissions','auth','forgotpassword',1,'',3),(199,'users-permissions','auth','register',1,'',3),(200,'users-permissions','auth','emailconfirmation',1,'',3),(201,'users-permissions','user','find',0,'',3),(202,'users-permissions','user','me',1,'',3),(203,'users-permissions','user','findone',0,'',3),(204,'users-permissions','user','create',0,'',3),(205,'users-permissions','user','update',0,'',3),(206,'users-permissions','user','destroy',0,'',3),(207,'users-permissions','user','destroyall',0,'',3),(208,'users-permissions','userspermissions','createrole',0,'',3),(209,'users-permissions','userspermissions','deleteprovider',0,'',3),(210,'users-permissions','userspermissions','deleterole',0,'',3),(211,'users-permissions','userspermissions','getpermissions',0,'',3),(212,'users-permissions','userspermissions','getpolicies',0,'',3),(213,'users-permissions','userspermissions','getrole',0,'',3),(214,'users-permissions','userspermissions','getroles',0,'',3),(215,'users-permissions','userspermissions','getroutes',0,'',3),(216,'users-permissions','userspermissions','index',0,'',3),(217,'users-permissions','userspermissions','init',1,'',3),(218,'users-permissions','userspermissions','searchusers',0,'',3),(219,'users-permissions','userspermissions','updaterole',0,'',3),(220,'users-permissions','userspermissions','getemailtemplate',0,'',3),(221,'users-permissions','userspermissions','updateemailtemplate',0,'',3),(222,'users-permissions','userspermissions','getadvancedsettings',0,'',3),(223,'users-permissions','userspermissions','updateadvancedsettings',0,'',3),(224,'users-permissions','userspermissions','getproviders',0,'',3),(225,'users-permissions','userspermissions','updateproviders',0,'',3),(226,'application','language','find',1,'',1),(227,'application','language','findone',1,'',1),(228,'application','language','count',1,'',1),(229,'application','language','create',1,'',1),(230,'application','language','update',1,'',1),(231,'application','language','destroy',1,'',1),(232,'application','language','find',0,'',2),(233,'application','language','findone',0,'',2),(234,'application','language','count',0,'',2),(235,'application','language','create',0,'',2),(236,'application','language','update',0,'',2),(237,'application','language','destroy',0,'',2),(238,'application','language','find',0,'',3),(239,'application','language','findone',0,'',3),(240,'application','language','count',0,'',3),(241,'application','language','create',0,'',3),(242,'application','language','update',0,'',3),(243,'application','language','destroy',0,'',3),(244,'application','category','find',1,'',1),(245,'application','category','findone',1,'',1),(246,'application','category','count',1,'',1),(247,'application','category','create',1,'',1),(248,'application','category','update',1,'',1),(249,'application','category','destroy',1,'',1),(250,'application','category','find',0,'',2),(251,'application','category','findone',0,'',2),(252,'application','category','count',0,'',2),(253,'application','category','create',0,'',2),(254,'application','category','update',0,'',2),(255,'application','category','destroy',0,'',2),(256,'application','category','find',0,'',3),(257,'application','category','findone',0,'',3),(258,'application','category','count',0,'',3),(259,'application','category','create',0,'',3),(260,'application','category','update',0,'',3),(261,'application','category','destroy',0,'',3),(262,'application','post','find',1,'',1),(263,'application','post','findone',1,'',1),(264,'application','post','count',1,'',1),(265,'application','post','create',1,'',1),(266,'application','post','update',1,'',1),(267,'application','post','destroy',1,'',1),(268,'application','post','find',0,'',2),(269,'application','post','findone',0,'',2),(270,'application','post','count',0,'',2),(271,'application','post','create',0,'',2),(272,'application','post','update',0,'',2),(273,'application','post','destroy',0,'',2),(274,'application','post','find',0,'',3),(275,'application','post','findone',0,'',3),(276,'application','post','count',0,'',3),(277,'application','post','create',0,'',3),(278,'application','post','update',0,'',3),(279,'application','post','destroy',0,'',3);
/*!40000 ALTER TABLE `users-permissions_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users-permissions_role`
--

DROP TABLE IF EXISTS `users-permissions_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `users-permissions_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_USERS_PERMISSIONS_ROLE` (`name`,`description`,`type`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users-permissions_role`
--

LOCK TABLES `users-permissions_role` WRITE;
/*!40000 ALTER TABLE `users-permissions_role` DISABLE KEYS */;
INSERT INTO `users-permissions_role` VALUES (1,'Administrator','These users have all access in the project.','root'),(2,'Authenticated','Default role given to authenticated user.','authenticated'),(3,'Public','Default role given to unauthenticated user.','public');
/*!40000 ALTER TABLE `users-permissions_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users-permissions_user`
--

DROP TABLE IF EXISTS `users-permissions_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `users-permissions_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `resetPasswordToken` varchar(255) DEFAULT NULL,
  `confirmed` tinyint(1) DEFAULT NULL,
  `blocked` tinyint(1) DEFAULT NULL,
  `role` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_USERS_PERMISSIONS_USER` (`username`,`provider`,`resetPasswordToken`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users-permissions_user`
--

LOCK TABLES `users-permissions_user` WRITE;
/*!40000 ALTER TABLE `users-permissions_user` DISABLE KEYS */;
INSERT INTO `users-permissions_user` VALUES (1,'alexpereap','ing.alexperea@gmail.com','local','$2a$10$2JR6XzqIctSEWKkHzLOEeOn6ZtlW0v4XrD/fTLkd1UzqBWuDGGk5i',NULL,1,NULL,1);
/*!40000 ALTER TABLE `users-permissions_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-23  6:29:20
