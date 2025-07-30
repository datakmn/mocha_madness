-- MySQL dump 10.13  Distrib 8.0.42, for macos15 (arm64)
--
-- Host: localhost    Database: mocha_madness
-- ------------------------------------------------------
-- Server version	8.0.42

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
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `customer_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `address` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Alice','Johnson','alice.j@mochamadness.com','714-555-0101','123 Maple St, Anaheim, CA 92802'),(2,'Bob','Smith','bob.smith@mochamadness.com','714-555-0102','456 Oak Ave, Santa Ana, CA 92701'),(3,'Charlie','Brown','charlie.b@mochamadness.com','714-555-0103','789 Pine Dr, Orange, CA 92866'),(4,'Diana','Lee','diana.lee@mochamadness.com','714-555-0104','321 Birch St, Fullerton, CA 92831'),(5,'Ethan','Garcia','ethan.garcia@mochamadness.com','714-555-0105','654 Spruce Ln, Irvine, CA 92612'),(6,'Fiona','Nguyen','fiona.ng@mochamadness.com','714-555-0106','987 Willow Ct, Garden Grove, CA 92843'),(7,'George','Kim','george.kim@mochamadness.com','714-555-0107','246 Palm Dr, Tustin, CA 92780'),(8,'Hannah','Martinez','hannah.m@mochamadness.com','714-555-0108','135 Sycamore Rd, Brea, CA 92821'),(9,'Isaac','Lopez','isaac.lopez@mochamadness.com','714-555-0109','864 Chestnut St, Costa Mesa, CA 92626'),(10,'Julia','Wang','julia.wang@mochamadness.com','714-555-0110','753 Redwood Blvd, Buena Park, CA 90620');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `employee_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `position` varchar(50) NOT NULL,
  `store_id` int NOT NULL,
  PRIMARY KEY (`employee_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (11,'Emily','Taylor','emily.taylor@mochamadness.com','714-555-1001','Barista',1),(12,'James','Anderson','james.anderson@mochamadness.com','714-555-1002','Manager',1),(13,'Sophia','Lee','sophia.lee@mochamadness.com','714-555-1003','Cashier',2),(14,'Daniel','Kim','daniel.kim@mochamadness.com','714-555-1004','Barista',2),(15,'Olivia','Martinez','olivia.martinez@mochamadness.com','714-555-1005','Shift Supervisor',3),(16,'Ethan','Nguyen','ethan.nguyen@mochamadness.com','714-555-1006','Barista',3),(17,'Isabella','Brown','isabella.brown@mochamadness.com','714-555-1007','Cashier',4),(18,'Liam','Wilson','liam.wilson@mochamadness.com','714-555-1008','Manager',4),(19,'Mia','Lopez','mia.lopez@mochamadness.com','714-555-1009','Barista',5),(20,'Noah','Davis','noah.davis@mochamadness.com','714-555-1010','Barista',5);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `order_item_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  PRIMARY KEY (`order_item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (1,1,1,2),(2,1,3,1),(3,2,2,1),(4,3,4,2),(5,3,1,1),(6,4,5,1),(7,5,6,3),(8,6,2,2),(9,7,3,1),(10,8,1,2),(11,9,5,1),(12,10,4,2),(13,10,6,1);
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
  `customer_id` int DEFAULT NULL,
  `store_id` int DEFAULT NULL,
  `employee_id` int DEFAULT NULL,
  `order_date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`order_id`),
  KEY `fk_customer` (`customer_id`),
  CONSTRAINT `fk_customer` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,2,3,'2025-07-15 08:15:00'),(2,2,4,1,'2025-07-15 09:05:00'),(3,3,1,2,'2025-07-15 09:45:00'),(4,4,3,4,'2025-07-15 10:30:00'),(5,5,2,1,'2025-07-16 08:20:00'),(6,6,5,2,'2025-07-16 09:10:00'),(7,7,4,3,'2025-07-16 10:05:00'),(8,8,1,5,'2025-07-17 11:30:00'),(9,9,3,4,'2025-07-17 12:45:00'),(10,10,2,2,'2025-07-18 08:55:00');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `payment_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int DEFAULT NULL,
  `payment_type` varchar(50) DEFAULT NULL,
  `amount` decimal(6,2) DEFAULT NULL,
  `payment_date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`payment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (1,1,'Credit Card',8.50,'2025-07-15 09:15:23'),(2,2,'Cash',5.25,'2025-07-15 10:42:17'),(3,3,'Mobile Payment',12.00,'2025-07-15 11:03:50'),(4,4,'Credit Card',9.75,'2025-07-16 08:30:00'),(5,5,'Credit Card',7.00,'2025-07-16 09:45:12'),(6,6,'Cash',4.95,'2025-07-16 12:15:29'),(7,7,'Mobile Payment',10.25,'2025-07-17 14:20:45'),(8,8,'Credit Card',11.60,'2025-07-17 15:05:32'),(9,9,'Cash',6.80,'2025-07-17 16:40:10'),(10,10,'Mobile Payment',8.90,'2025-07-18 08:25:00');
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `product_name` varchar(100) NOT NULL,
  `category` varchar(50) NOT NULL,
  `price` decimal(5,2) NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Caffe Latte','Coffee',4.25),(2,'Cappuccino','Coffee',4.00),(3,'Espresso','Coffee',3.00),(4,'Iced Coffee','Cold Drink',3.75),(5,'Vanilla Latte','Coffee',4.50),(6,'Matcha Latte','Tea',4.75),(7,'Chai Tea Latte','Tea',4.50),(8,'Hot Chocolate','Beverage',3.50),(9,'Blueberry Muffin','Bakery',2.75),(10,'Croissant','Bakery',3.25);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales`
--

DROP TABLE IF EXISTS `sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales` (
  `sale_id` int NOT NULL AUTO_INCREMENT,
  `store_id` int DEFAULT NULL,
  `sale_month` varchar(20) DEFAULT NULL,
  `sale_year` int DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`sale_id`),
  KEY `store_id` (`store_id`),
  CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `stores` (`store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales`
--

LOCK TABLES `sales` WRITE;
/*!40000 ALTER TABLE `sales` DISABLE KEYS */;
INSERT INTO `sales` VALUES (1,1,'January',2025,56231.50),(2,2,'January',2025,48912.75),(3,3,'January',2025,53298.40),(4,4,'January',2025,47012.10),(5,5,'January',2025,51560.20),(6,6,'January',2025,49877.60),(7,7,'January',2025,47652.90),(8,8,'January',2025,49028.00),(9,9,'January',2025,52590.80),(10,10,'January',2025,45218.95),(11,1,'February',2025,55526.02),(12,2,'February',2025,51117.32),(13,3,'February',2025,54534.89),(14,4,'February',2025,47475.91),(15,5,'February',2025,49786.63),(16,6,'February',2025,48161.78),(17,7,'February',2025,45547.04),(18,8,'February',2025,50823.29),(19,9,'February',2025,53122.57),(20,10,'February',2025,46159.83),(21,1,'March',2025,53034.74),(22,2,'March',2025,51319.11),(23,3,'March',2025,52902.25),(24,4,'March',2025,48295.80),(25,5,'March',2025,51708.69),(26,6,'March',2025,47247.57),(27,7,'March',2025,43935.98),(28,8,'March',2025,49830.11),(29,9,'March',2025,51281.51),(30,10,'March',2025,45843.31),(31,1,'April',2025,54177.93),(32,2,'April',2025,52582.64),(33,3,'April',2025,50954.65),(34,4,'April',2025,50085.49),(35,5,'April',2025,52723.83),(36,6,'April',2025,45893.81),(37,7,'April',2025,41752.99),(38,8,'April',2025,50562.82),(39,9,'April',2025,50629.88),(40,10,'April',2025,44136.73),(41,1,'May',2025,55279.75),(42,2,'May',2025,54146.51),(43,3,'May',2025,53149.30),(44,4,'May',2025,51551.74),(45,5,'May',2025,51960.74),(46,6,'May',2025,47254.75),(47,7,'May',2025,43247.13),(48,8,'May',2025,50746.31),(49,9,'May',2025,48726.64),(50,10,'May',2025,45306.31),(51,1,'June',2025,54866.30),(52,2,'June',2025,54371.22),(53,3,'June',2025,52498.92),(54,4,'June',2025,50824.12),(55,5,'June',2025,52348.26),(56,6,'June',2025,49425.73),(57,7,'June',2025,42763.43),(58,8,'June',2025,49370.47),(59,9,'June',2025,49068.10),(60,10,'June',2025,44948.47),(61,1,'July',2025,56505.92),(62,2,'July',2025,56389.44),(63,3,'July',2025,52919.38),(64,4,'July',2025,50575.41),(65,5,'July',2025,52217.44),(66,6,'July',2025,51887.45),(67,7,'July',2025,44498.94),(68,8,'July',2025,51607.30),(69,9,'July',2025,47907.98),(70,10,'July',2025,43998.74);
/*!40000 ALTER TABLE `sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stores`
--

DROP TABLE IF EXISTS `stores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stores` (
  `store_id` int NOT NULL AUTO_INCREMENT,
  `store_name` varchar(100) NOT NULL,
  `location` varchar(255) NOT NULL,
  PRIMARY KEY (`store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stores`
--

LOCK TABLES `stores` WRITE;
/*!40000 ALTER TABLE `stores` DISABLE KEYS */;
INSERT INTO `stores` VALUES (1,'Moch Madness - Downtown','123 Main St, Anaheim, CA 92801'),(2,'Moch Madness - GardenWalk','400 Disney Way, Anaheim, CA 92802'),(3,'Moch Madness - Santa Ana Central','789 Civic Center Dr, Santa Ana, CA 92701'),(4,'Moch Madness - Orange Circle','101 Plaza Sq, Orange, CA 92866'),(5,'Moch Madness - Irvine Spectrum','670 Spectrum Center Dr, Irvine, CA 92618'),(6,'Moch Madness - Huntington Beach','200 Beach Blvd, Huntington Beach, CA 92648'),(7,'Moch Madness - Fullerton Station','345 Harbor Blvd, Fullerton, CA 92832'),(8,'Moch Madness - Tustin Legacy','1201 Tustin Ranch Rd, Tustin, CA 92782'),(9,'Moch Madness - Costa Mesa','560 Newport Blvd, Costa Mesa, CA 92627'),(10,'Moch Madness - Brea Mall','200 Brea Mall, Brea, CA 92821');
/*!40000 ALTER TABLE `stores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'mocha_madness'
--

--
-- Dumping routines for database 'mocha_madness'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-29 21:05:04
