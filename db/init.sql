-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: f1_fan_tracker
-- ------------------------------------------------------
-- Server version	8.0.41

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `driver_season_points`
--

SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS `driver_season_points`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `driver_season_points` (
  `driver_id` int NOT NULL,
  `season_id` int NOT NULL,
  `points` int DEFAULT NULL,
  PRIMARY KEY (`driver_id`,`season_id`),
  KEY `season_id` (`season_id`),
  CONSTRAINT `driver_season_points_ibfk_1` FOREIGN KEY (`driver_id`) REFERENCES `drivers` (`id`),
  CONSTRAINT `driver_season_points_ibfk_2` FOREIGN KEY (`season_id`) REFERENCES `seasons` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `driver_season_points`
--

LOCK TABLES `driver_season_points` WRITE;
/*!40000 ALTER TABLE `driver_season_points` DISABLE KEYS */;
INSERT INTO `driver_season_points` VALUES (1,1,347),(1,2,387),(1,3,240),(1,4,234),(1,5,223),(1,6,156),(2,1,223),(2,2,226),(2,3,49),(2,4,10),(2,5,0),(3,1,214),(3,2,395),(3,3,454),(3,4,575),(3,5,437),(3,6,421),(4,1,125),(4,2,190),(4,3,305),(4,4,285),(4,5,152),(5,1,119),(5,2,115),(5,3,37),(5,4,6),(5,5,12),(6,1,105),(6,2,164),(6,3,246),(6,4,200),(6,5,290),(6,6,64),(7,1,105),(7,3,4),(7,4,27),(7,5,12),(7,6,73),(8,1,98),(8,2,159),(8,3,308),(8,4,206),(8,5,356),(8,6,242),(9,1,97),(9,2,160),(9,3,122),(9,4,205),(9,5,374),(9,6,423),(10,1,75),(10,2,110),(10,3,23),(10,4,62),(10,5,42),(10,6,22),(11,1,75),(11,2,34),(11,3,18),(11,4,74),(11,5,24),(11,6,33),(12,1,62),(12,2,74),(12,3,92),(12,4,58),(12,5,23),(12,6,38),(13,1,33),(13,2,43),(13,3,37),(14,1,32),(15,1,10),(15,3,0),(15,4,9),(15,5,41),(15,6,51),(16,1,4),(16,2,10),(17,1,4),(17,2,3),(18,1,3),(18,2,16),(18,3,275),(18,4,175),(18,5,245),(18,6,319),(19,1,2),(20,1,1),(20,3,25),(20,4,3),(20,5,16),(21,1,0),(21,2,7),(21,3,2),(22,1,0),(23,1,0),(24,2,81),(24,3,81),(24,4,206),(24,5,70),(24,6,56),(25,2,32),(25,3,12),(25,4,17),(25,5,30),(25,6,33),(26,2,0),(26,3,12),(27,2,0),(28,2,0),(29,3,6),(29,4,6),(29,5,4),(30,3,2),(30,4,0),(31,4,97),(31,5,292),(31,6,410),(32,4,2),(32,5,4),(32,6,38),(33,4,1),(33,5,0),(34,5,7),(34,6,41),(35,5,5),(35,6,0),(36,5,0),(36,6,0),(37,6,150),(38,6,51),(39,6,19);
/*!40000 ALTER TABLE `driver_season_points` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drivers`
--

DROP TABLE IF EXISTS `drivers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drivers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `team_id` int DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `team_id` (`team_id`),
  CONSTRAINT `drivers_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drivers`
--

LOCK TABLES `drivers` WRITE;
/*!40000 ALTER TABLE `drivers` DISABLE KEYS */;
INSERT INTO `drivers` VALUES (1,'Lewis Hamilton',1,NULL),(2,'Valtteri Bottas',1,NULL),(3,'Max Verstappen',2,NULL),(4,'Sergio Pérez',3,NULL),(5,'Daniel Ricciardo',4,NULL),(6,'Carlos Sainz',5,NULL),(7,'Alexander Albon',2,NULL),(8,'Charles Leclerc',6,NULL),(9,'Lando Norris',5,NULL),(10,'Pierre Gasly',7,NULL),(11,'Lance Stroll',3,NULL),(12,'Esteban Ocon',4,NULL),(13,'Sebastian Vettel',6,NULL),(14,'Daniil Kvyat',7,NULL),(15,'Nico Hülkenberg',3,NULL),(16,'Kimi Räikkönen',8,NULL),(17,'Antonio Giovinazzi',8,NULL),(18,'George Russell',9,NULL),(19,'Romain Grosjean',10,NULL),(20,'Kevin Magnussen',10,NULL),(21,'Nicholas Latifi',9,NULL),(22,'Jack Aitken',9,NULL),(23,'Pietro Fittipaldi',10,NULL),(24,'Fernando Alonso',11,NULL),(25,'Yuki Tsunoda',7,NULL),(26,'Mick Schumacher',10,NULL),(27,'Robert Kubica',8,NULL),(28,'Nikita Mazepin',10,NULL),(29,'Guanyu Zhou',8,NULL),(30,'Nyck de Vries',9,NULL),(31,'Oscar Piastri',5,NULL),(32,'Liam Lawson',7,NULL),(33,'Logan Sargeant',9,NULL),(34,'Oliver Bearman',6,NULL),(35,'Franco Colapinto',9,NULL),(36,'Jack Doohan',11,NULL),(37,'Andrea Kimi Antonelli',1,NULL),(38,'Isack Hadjar',13,NULL),(39,'Gabriel Bortoleto',8,NULL);
/*!40000 ALTER TABLE `drivers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorites`
--

DROP TABLE IF EXISTS `favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favorites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `item_type` enum('driver','team') NOT NULL,
  `item_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_favorite` (`user_id`,`item_type`,`item_id`),
  CONSTRAINT `favorites_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorites`
--

LOCK TABLES `favorites` WRITE;
/*!40000 ALTER TABLE `favorites` DISABLE KEYS */;
INSERT INTO `favorites` VALUES (1,3,'driver',3,'2026-01-24 11:06:10');
/*!40000 ALTER TABLE `favorites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seasons`
--

DROP TABLE IF EXISTS `seasons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seasons` (
  `id` int NOT NULL AUTO_INCREMENT,
  `year` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `year` (`year`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seasons`
--

LOCK TABLES `seasons` WRITE;
/*!40000 ALTER TABLE `seasons` DISABLE KEYS */;
INSERT INTO `seasons` VALUES (1,2020),(2,2021),(3,2022),(4,2023),(5,2024),(6,2025);
/*!40000 ALTER TABLE `seasons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team_season_points`
--

DROP TABLE IF EXISTS `team_season_points`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `team_season_points` (
  `team_id` int NOT NULL,
  `season_id` int NOT NULL,
  `points` int DEFAULT NULL,
  PRIMARY KEY (`team_id`,`season_id`),
  KEY `season_id` (`season_id`),
  CONSTRAINT `team_season_points_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`),
  CONSTRAINT `team_season_points_ibfk_2` FOREIGN KEY (`season_id`) REFERENCES `seasons` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team_season_points`
--

LOCK TABLES `team_season_points` WRITE;
/*!40000 ALTER TABLE `team_season_points` DISABLE KEYS */;
INSERT INTO `team_season_points` VALUES (1,1,573),(1,2,613),(1,3,515),(1,4,409),(1,5,468),(1,6,469),(2,1,319),(2,2,585),(2,3,759),(2,4,860),(2,5,589),(2,6,451),(3,1,195),(4,1,181),(5,1,202),(5,2,275),(5,3,159),(5,4,302),(5,5,666),(5,6,833),(6,1,131),(6,2,323),(6,3,554),(6,4,406),(6,5,652),(6,6,398),(7,1,107),(7,2,142),(7,3,35),(7,4,25),(8,1,8),(8,2,13),(8,3,55),(8,4,16),(8,5,4),(8,6,70),(9,1,0),(9,2,23),(9,3,8),(9,4,28),(9,5,17),(9,6,137),(10,1,3),(10,2,0),(10,3,37),(10,4,12),(10,5,58),(10,6,79),(11,2,155),(11,3,173),(11,4,120),(11,5,65),(11,6,22),(12,2,77),(12,3,55),(12,4,280),(12,5,94),(12,6,89),(13,5,46),(13,6,92);
/*!40000 ALTER TABLE `team_season_points` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teams` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `color_hex` varchar(7) DEFAULT NULL,
  `logo_url` varchar(255) DEFAULT NULL,
  `car_image_url` varchar(255) DEFAULT NULL,
  `team_principal` varchar(100) DEFAULT NULL,
  `slug` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams`
--

LOCK TABLES `teams` WRITE;
/*!40000 ALTER TABLE `teams` DISABLE KEYS */;
INSERT INTO `teams` VALUES (1,'Mercedes','#00D2BE',NULL,NULL,'Toto Wolff','mercedes'),(2,'Red Bull Racing','#0600EF',NULL,NULL,'Christian Horner','red_bull_racing'),(3,'Aston Martin','#006F62',NULL,NULL,'Mike Krack','aston_martin'),(4,'Alpine','#0090FF',NULL,NULL,'Bruno Famin','alpine'),(5,'McLaren','#FF8700',NULL,NULL,'Andrea Stella','mclaren'),(6,'Ferrari','#DC0000',NULL,NULL,'Frédéric Vasseur','ferrari'),(7,'AlphaTauri','#2B4562',NULL,NULL,'Laurent Mekies','alpha_tauri'),(8,'Sauber','#52E252',NULL,NULL,'Alessandro Alunni Bravi','sauber'),(9,'Williams','#005AFF',NULL,NULL,'James Vowles','williams'),(10,'Haas','#FFFFFF',NULL,NULL,'Ayao Komatsu','haas'),(11,'Renault','#0090FF',NULL,NULL,'Bruno Famin','renault'),(13,'RB','#2B4562',NULL,NULL,'Laurent Mekies','rb');
/*!40000 ALTER TABLE `teams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_favorite_drivers`
--

DROP TABLE IF EXISTS `user_favorite_drivers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_favorite_drivers` (
  `user_id` int NOT NULL,
  `driver_id` int NOT NULL,
  PRIMARY KEY (`user_id`,`driver_id`),
  KEY `driver_id` (`driver_id`),
  CONSTRAINT `user_favorite_drivers_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_favorite_drivers_ibfk_2` FOREIGN KEY (`driver_id`) REFERENCES `drivers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_favorite_drivers`
--

LOCK TABLES `user_favorite_drivers` WRITE;
/*!40000 ALTER TABLE `user_favorite_drivers` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_favorite_drivers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_favorite_teams`
--

DROP TABLE IF EXISTS `user_favorite_teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_favorite_teams` (
  `user_id` int NOT NULL,
  `team_id` int NOT NULL,
  PRIMARY KEY (`user_id`,`team_id`),
  KEY `team_id` (`team_id`),
  CONSTRAINT `user_favorite_teams_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_favorite_teams_ibfk_2` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_favorite_teams`
--

LOCK TABLES `user_favorite_teams` WRITE;
/*!40000 ALTER TABLE `user_favorite_teams` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_favorite_teams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (2,'Karthik Allamraju','agpvsk@outlook.com','scrypt:32768:8:1$dnJCOtLtctSVh8gl$1a2d55decfcf00f3b42346409147595d3b0c43e389f7f8f4ad7cbeef7c6043da9eae05910d6cfb21ca7220ac5dd4f163636fe5071a318dacb3d616f3723c8585','2026-01-24 10:39:33'),(3,'karthik','something@gmail.com','scrypt:32768:8:1$FmJuuHRYwKm9x9XK$763bed51b1eb71c5a44b92a73f74d2bf37d52cce79fffa3d31e0641ab3245afebcbfb11e6eb127960db85166f72595b612279952aa5d3f19ea87ccfe58a60a2d','2026-01-24 10:47:24');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'f1_fan_tracker'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-26  9:04:20
SET FOREIGN_KEY_CHECKS = 1;