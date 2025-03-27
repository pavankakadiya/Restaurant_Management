CREATE DATABASE  IF NOT EXISTS `restaurant` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `restaurant`;
-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: restaurant
-- ------------------------------------------------------
-- Server version	8.4.4

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
-- Table structure for table `dish`
--

DROP TABLE IF EXISTS `dish`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dish` (
  `dish_id` int NOT NULL AUTO_INCREMENT,
  `dish_name` varchar(255) DEFAULT NULL,
  `price` int DEFAULT NULL,
  PRIMARY KEY (`dish_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dish`
--

LOCK TABLES `dish` WRITE;
/*!40000 ALTER TABLE `dish` DISABLE KEYS */;
INSERT INTO `dish` VALUES (1,'Pizza',12),(2,'Burger',7),(3,'Sandwich',10),(4,'French Fries',5),(5,'Hotdog',6),(6,'Pizza',15),(7,'Burger',10),(8,'Pasta',12),(9,'Salad',8),(10,'Steak',25),(11,'Sandwich',9),(12,'Sushi',20),(13,'Tacos',14),(14,'Burrito',13),(15,'Lasagna',18),(16,'Chicken Wings',11),(17,'Fish & Chips',16),(18,'Ramen',14),(19,'Curry',17),(20,'Dumplings',12);
/*!40000 ALTER TABLE `dish` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `item_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int DEFAULT NULL,
  `dish_name` varchar(255) DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `price` int DEFAULT '0',
  `dish_id` int DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `fk_dish` (`dish_id`),
  CONSTRAINT `fk_dish` FOREIGN KEY (`dish_id`) REFERENCES `dish` (`dish_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (1,1,'Pizza',2,0,NULL),(2,2,'Burger',1,0,NULL),(3,3,'Pasta',3,0,NULL),(4,4,'Salad',2,0,NULL),(5,5,'Steak',1,0,NULL),(6,6,'Sandwich',3,0,NULL),(7,7,'Sushi',2,0,NULL),(8,8,'Tacos',1,0,NULL),(9,9,'Burrito',2,0,NULL),(10,10,'Lasagna',1,0,NULL),(11,11,'Chicken Wings',3,0,NULL),(12,12,'Fish & Chips',2,0,NULL),(13,13,'Ramen',1,0,NULL),(14,14,'Curry',2,0,NULL),(15,15,'Dumplings',3,0,NULL);
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `waiter_id` int DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `waiter_id` (`waiter_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`waiter_id`) REFERENCES `waiters` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tables`
--

DROP TABLE IF EXISTS `tables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tables` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tablenumber` int NOT NULL,
  `Capacity` int NOT NULL,
  `Status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tables`
--

LOCK TABLES `tables` WRITE;
/*!40000 ALTER TABLE `tables` DISABLE KEYS */;
INSERT INTO `tables` VALUES (1,1,4,0),(2,2,6,0),(3,3,2,0),(4,4,8,0),(5,5,4,0),(6,6,6,0),(7,7,2,0),(8,8,10,0),(9,9,4,0),(10,10,2,0),(11,11,6,0),(12,12,8,0),(13,13,4,0),(14,14,10,0),(15,15,2,0);
/*!40000 ALTER TABLE `tables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `waiters`
--

DROP TABLE IF EXISTS `waiters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `waiters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `waiters`
--

LOCK TABLES `waiters` WRITE;
/*!40000 ALTER TABLE `waiters` DISABLE KEYS */;
INSERT INTO `waiters` VALUES (1,'John Doe','johndoe@example.com','hashed_password123','2025-03-16 21:39:32','2025-03-16 21:39:32'),(2,'nikhil','1234','nikhil@gmail.com','2025-03-17 22:44:11','2025-03-17 22:44:11'),(3,'pavan','pavan@gmail.com','1234','2025-03-25 21:41:28','2025-03-25 21:41:28'),(4,'avi','avi@gmail.com','1234','2025-03-25 21:49:25','2025-03-25 21:49:25'),(8,'ketan,ketan','ketan@gmail.com,ketan@gmail.com','1234,1234','2025-03-27 01:39:30','2025-03-27 01:39:30'),(9,'john_doe','john@example.com','1234','2025-03-27 10:25:32','2025-03-27 10:25:32'),(10,'jane_smith','jane@example.com','1234','2025-03-27 10:25:32','2025-03-27 10:25:32'),(11,'alex_jones','alex@example.com','1234','2025-03-27 10:25:32','2025-03-27 10:25:32'),(12,'maria_garcia','maria@example.com','1234','2025-03-27 10:25:32','2025-03-27 10:25:32'),(13,'robert_brown','robert@example.com','1234','2025-03-27 10:25:32','2025-03-27 10:25:32'),(14,'lisa_martin','lisa@example.com','1234','2025-03-27 10:25:32','2025-03-27 10:25:32'),(15,'james_taylor','james@example.com','1234','2025-03-27 10:25:32','2025-03-27 10:25:32'),(16,'sophia_wilson','sophia@example.com','1234','2025-03-27 10:25:32','2025-03-27 10:25:32'),(17,'david_white','david@example.com','1234','2025-03-27 10:25:32','2025-03-27 10:25:32'),(18,'olivia_moore','olivia@example.com','1234','2025-03-27 10:25:32','2025-03-27 10:25:32'),(19,'chris_hall','chris@example.com','1234','2025-03-27 10:25:32','2025-03-27 10:25:32'),(20,'emma_wright','emma@example.com','1234','2025-03-27 10:25:32','2025-03-27 10:25:32'),(21,'daniel_adams','daniel@example.com','1234','2025-03-27 10:25:32','2025-03-27 10:25:32'),(22,'grace_jackson','grace@example.com','1234','2025-03-27 10:25:32','2025-03-27 10:25:32'),(23,'michael_clark','michael@example.com','1234','2025-03-27 10:25:32','2025-03-27 10:25:32');
/*!40000 ALTER TABLE `waiters` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-27 12:29:05
