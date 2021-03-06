-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: projectdb
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `business_details`
--

DROP TABLE IF EXISTS `business_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `business_details` (
  `bId` int NOT NULL AUTO_INCREMENT,
  `seller` int NOT NULL,
  `bName` varchar(80) NOT NULL,
  `bCategory` varchar(45) NOT NULL,
  `bMobile` bigint NOT NULL,
  `bGST` varchar(15) NOT NULL,
  `bEmail` varchar(45) NOT NULL,
  `bWebsite` varchar(45) DEFAULT NULL,
  `bAddress` varchar(100) NOT NULL,
  `bCity` varchar(45) NOT NULL,
  `bState` varchar(45) NOT NULL,
  `bZip` int NOT NULL,
  `bPhotoId` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`bId`),
  UNIQUE KEY `bMobile` (`bMobile`),
  UNIQUE KEY `bGST` (`bGST`),
  UNIQUE KEY `bEmail` (`bEmail`),
  KEY `sellerBusiness` (`seller`),
  CONSTRAINT `sellerBusiness` FOREIGN KEY (`seller`) REFERENCES `seller_details` (`sId`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `business_details`
--

LOCK TABLES `business_details` WRITE;
/*!40000 ALTER TABLE `business_details` DISABLE KEYS */;
INSERT INTO `business_details` VALUES (32,1051,'Dhoble Mart','Mart',7756901721,'22AAAAA0000A1Z5','dhoblesaurabh35@gmail.com','','PN. 23, DHOBLE MART, MANISH NAGAR','NAGPUR','Maharashtra',440015,'Seller%2F1051%2F32-photo.jpg'),(33,1052,'Tejas Shoppy','Mart',8087630373,'22AAAAA0000A1Z4','tgandhi172@gmail.com','','PN. 47, TEJAS SHOPPY, MANISH NAGAR','NAGPUR','Maharashtra',440015,'Seller%2F1052%2F33-photo.jpg'),(34,1053,'Chavan General Store','Other',7378770771,'22AAAAA0000A1Z3','pc.chavan@gmail.com','','A2, Navi Peth','Solapur','Maharashtra',413002,'Seller%2F1053%2F34-photo.jpg'),(35,1054,'J Store','Mart',7709708626,'22AAAAA0000A1Z2','contact@jaygandhi.tech','www.jaygandhi.tech','A3, Navi Peth','Solapur','Maharashtra',413002,'Seller%2F1054%2F35-photo.jpg');
/*!40000 ALTER TABLE `business_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cust_details`
--

DROP TABLE IF EXISTS `cust_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cust_details` (
  `cId` int NOT NULL AUTO_INCREMENT,
  `cName` varchar(100) NOT NULL,
  `cEmail` varchar(70) NOT NULL,
  `cMobile` bigint NOT NULL,
  `cPincode` int NOT NULL,
  `cPassword` varchar(100) NOT NULL,
  `role` int DEFAULT '1',
  PRIMARY KEY (`cId`),
  UNIQUE KEY `cEmail_UNIQUE` (`cEmail`),
  UNIQUE KEY `cMobile_UNIQUE` (`cMobile`)
) ENGINE=InnoDB AUTO_INCREMENT=800007 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cust_details`
--

LOCK TABLES `cust_details` WRITE;
/*!40000 ALTER TABLE `cust_details` DISABLE KEYS */;
INSERT INTO `cust_details` VALUES (800003,'Sanyukta Patil','sp.patil@gmail.com',9146632518,440015,'10b8e822d03fb4fd946188e852a4c3e2',1),(800004,'Ajay Phade','ap.phade@gmail.com',9422129600,413002,'10b8e822d03fb4fd946188e852a4c3e2',1),(800005,'Akshay Kumar','ak.kumar@gmail.com',9145598626,413002,'10b8e822d03fb4fd946188e852a4c3e2',1),(800006,'SAURABH SHASHANK DHOBLE','dhoblesaurabh35@gmail.com',7756901721,440015,'10b8e822d03fb4fd946188e852a4c3e2',1);
/*!40000 ALTER TABLE `cust_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory` (
  `iId` int NOT NULL AUTO_INCREMENT,
  `sellerPrice` float NOT NULL,
  `stockAvailable` int NOT NULL,
  `sId` int DEFAULT NULL,
  `pId` int DEFAULT NULL,
  `iDelivery` char(1) NOT NULL,
  `iSize` varchar(50) DEFAULT NULL,
  `iDescription` varchar(500) NOT NULL,
  `iDeliveryCharges` int NOT NULL DEFAULT '0',
  `iTags` varchar(400) DEFAULT NULL,
  PRIMARY KEY (`iId`),
  UNIQUE KEY `sId` (`sId`,`pId`),
  KEY `pId` (`pId`),
  CONSTRAINT `inventory_ibfk_1` FOREIGN KEY (`sId`) REFERENCES `seller_details` (`sId`),
  CONSTRAINT `inventory_ibfk_2` FOREIGN KEY (`pId`) REFERENCES `products` (`pId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory`
--

LOCK TABLES `inventory` WRITE;
/*!40000 ALTER TABLE `inventory` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_details` (
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `product_qty` int NOT NULL,
  `price` float NOT NULL,
  `savedAmt` float NOT NULL,
  `product_size` varchar(20) DEFAULT NULL,
  `delivery_method` varchar(45) NOT NULL,
  `prod_status` varchar(45) NOT NULL,
  PRIMARY KEY (`order_id`,`product_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`pId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_details`
--

LOCK TABLES `order_details` WRITE;
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_payment_details`
--

DROP TABLE IF EXISTS `order_payment_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_payment_details` (
  `orderId` int NOT NULL,
  `razorpayOrderId` varchar(100) NOT NULL,
  `razorpayPaymentId` varchar(100) NOT NULL,
  `paymentMethod` varchar(45) NOT NULL,
  `paymentEmail` varchar(45) NOT NULL,
  `paymentPhone` varchar(45) NOT NULL,
  `amount` float NOT NULL,
  `paymentTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `refundId` varchar(100) DEFAULT NULL,
  `refundTimeStamp` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`orderId`,`razorpayPaymentId`),
  CONSTRAINT `order_payment_details_ibfk_1` FOREIGN KEY (`orderId`) REFERENCES `orders` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_payment_details`
--

LOCK TABLES `order_payment_details` WRITE;
/*!40000 ALTER TABLE `order_payment_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_payment_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `delivery_address` varchar(100) DEFAULT NULL,
  `order_zip` int NOT NULL,
  `seller_id` int NOT NULL,
  `cust_id` int NOT NULL,
  `delivery_charges` int DEFAULT '0',
  `total_amount` float NOT NULL,
  `ordered_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `delivered_timestamp` timestamp NULL DEFAULT NULL,
  `seller_comment` varchar(200) DEFAULT NULL,
  `cust_feedback` varchar(200) DEFAULT NULL,
  `delivery_phone` bigint NOT NULL,
  `order_status` varchar(100) NOT NULL,
  `del_fname` varchar(45) DEFAULT NULL,
  `del_lname` varchar(45) DEFAULT NULL,
  `paymentMethod` varchar(45) NOT NULL,
  `paymentStatus` varchar(45) NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `seller_id` (`seller_id`),
  KEY `cust_id` (`cust_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`seller_id`) REFERENCES `seller_details` (`sId`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`cust_id`) REFERENCES `cust_details` (`cId`)
) ENGINE=InnoDB AUTO_INCREMENT=4000068 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_categories`
--

DROP TABLE IF EXISTS `product_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_categories` (
  `catId` int NOT NULL AUTO_INCREMENT,
  `catName` varchar(100) NOT NULL,
  PRIMARY KEY (`catId`)
) ENGINE=InnoDB AUTO_INCREMENT=2000023 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_categories`
--

LOCK TABLES `product_categories` WRITE;
/*!40000 ALTER TABLE `product_categories` DISABLE KEYS */;
INSERT INTO `product_categories` VALUES (2000001,'Clothing'),(2000002,'Fashion Accessories'),(2000003,'Footware'),(2000004,'Travel Equipments'),(2000005,'Electronic Accessories'),(2000006,'Electronics & Appliances'),(2000007,'Mobile & Accessories'),(2000008,'Electricals'),(2000009,'Stationary'),(2000010,'Home & Decor'),(2000011,'Kitchen Items'),(2000012,'Tools & Utilities'),(2000013,'Toys'),(2000014,'Beauty & Personal care'),(2000015,'Auto Accessories'),(2000016,'Furniture'),(2000017,'Baby Care'),(2000018,'Books'),(2000019,'Musical Instruments'),(2000020,'Sports & Fitness'),(2000021,'Covid Safety'),(2000022,'Grocery');
/*!40000 ALTER TABLE `product_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_subcategories`
--

DROP TABLE IF EXISTS `product_subcategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_subcategories` (
  `subCatId` int NOT NULL AUTO_INCREMENT,
  `subCatName` varchar(200) NOT NULL,
  `catId` int DEFAULT NULL,
  PRIMARY KEY (`subCatId`),
  KEY `product_subcategories_ibfk_1` (`catId`),
  CONSTRAINT `product_subcategories_ibfk_1` FOREIGN KEY (`catId`) REFERENCES `product_categories` (`catId`)
) ENGINE=InnoDB AUTO_INCREMENT=3000261 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_subcategories`
--

LOCK TABLES `product_subcategories` WRITE;
/*!40000 ALTER TABLE `product_subcategories` DISABLE KEYS */;
INSERT INTO `product_subcategories` VALUES (3000001,'Men Casual',2000001),(3000002,'Men\'s Formal',2000001),(3000003,'Men\'s Bottom Wear',2000001),(3000004,'Men\'s Night wear',2000001),(3000005,'Men Ethnic',2000001),(3000006,'Women\'s Formal',2000001),(3000007,'Women\'s Night wear',2000001),(3000008,'Women\'s Casual',2000001),(3000009,'Women Ethnic',2000001),(3000010,'Other Clothing',2000001),(3000011,'Boys',2000001),(3000012,'Girls',2000001),(3000013,'Kids ',2000001),(3000014,'Artificial jewellery',2000002),(3000015,'Wallets',2000002),(3000016,'Purse',2000002),(3000017,'Men\'s Watch',2000002),(3000018,'Women\'s watch',2000002),(3000019,'Bracelets',2000002),(3000020,'Keychains & Lockets',2000002),(3000021,'Frames & Lenses',2000002),(3000022,'Men\'s Boot',2000003),(3000023,'Men\'s Sneakers',2000003),(3000024,'Men\'s Casual',2000003),(3000025,'Men\'s Formal',2000003),(3000026,'Men\'s Loafers',2000003),(3000027,'Men\'s Sports',2000003),(3000028,'Men\'s Ethnic',2000003),(3000029,'Men\'s Slippers',2000003),(3000030,'Men\'s Sandals',2000003),(3000031,'Women\'s Slipper',2000003),(3000032,'Women\'s ethnic',2000003),(3000033,'Women\'s heels',2000003),(3000034,'Women\'s sandals',2000003),(3000035,'Women\'s boots',2000003),(3000036,'Women\'s Ballerinas',2000003),(3000037,'Travel Bag',2000004),(3000038,'Trekking Backpack',2000004),(3000039,'Trollies',2000004),(3000040,'Backpack',2000004),(3000041,'Suitcase',2000004),(3000042,'Pouch',2000004),(3000043,'Laptop bag',2000004),(3000044,'Sleeping Bag',2000004),(3000045,'Laptop',2000005),(3000046,'Tablet',2000005),(3000047,'Speakers',2000005),(3000048,'Desktop',2000005),(3000049,'Monitor',2000005),(3000050,'Mouse',2000005),(3000051,'Pd',2000005),(3000052,'Printer & Ink cartridges',2000005),(3000053,'Scanner',2000005),(3000054,'Console',2000005),(3000055,'Keyboard',2000005),(3000056,'Mouse pad',2000005),(3000057,'Laptop adapter & cable',2000005),(3000058,'HeadSet',2000005),(3000059,'Cooling Pad',2000005),(3000060,'HDD',2000005),(3000061,'Webcam',2000005),(3000062,'Cameras & Lenses',2000005),(3000063,'PS & Xbox',2000005),(3000064,'Refrigerator',2000006),(3000065,'AC',2000006),(3000066,'Washing Machine',2000006),(3000067,'Oven',2000006),(3000068,'Toaster',2000006),(3000069,'Sandwich Maker',2000006),(3000070,'Heater',2000006),(3000071,'Gyser',2000006),(3000072,'Air cooler',2000006),(3000073,'Fan',2000006),(3000074,'Mixer',2000006),(3000075,'Juicer',2000006),(3000076,'Kettle',2000006),(3000077,'Water Purifier',2000006),(3000078,'TV',2000006),(3000079,'Vacuuum cleaner',2000006),(3000080,'Dish washer',2000006),(3000081,'Sewing Machine',2000006),(3000082,'Voltage Stabilizer',2000006),(3000083,'Induction',2000006),(3000084,'Iron',2000006),(3000085,'Inverter',2000006),(3000086,'Blender',2000006),(3000087,'Exhaust Fan',2000006),(3000088,'Smart Phones',2000007),(3000089,'Basic Phones',2000007),(3000090,'Tab',2000007),(3000091,'Charger',2000007),(3000092,'Cables',2000007),(3000093,'USB',2000007),(3000094,'OTG',2000007),(3000095,'Wireless Charging Pad',2000007),(3000096,'Earphones',2000007),(3000097,'Headphones & Earphones',2000007),(3000098,'Screen guard',2000007),(3000099,'Back Cover',2000007),(3000100,'Lamination',2000007),(3000101,'Batteries',2000007),(3000102,'Memory card',2000007),(3000103,'Phone parts',2000007),(3000104,'Powerbank',2000007),(3000105,'Phone holders',2000007),(3000106,'VR glasses',2000007),(3000107,'Tripod & Gimble',2000007),(3000108,'Wires',2000008),(3000109,'Plugs',2000008),(3000110,'Bulbs',2000008),(3000111,'Switches',2000008),(3000112,'Extension Board',2000008),(3000113,'Tube lights',2000008),(3000114,'Sockets',2000008),(3000115,'IC',2000008),(3000116,'Ammeter',2000008),(3000117,'Voltmeter',2000008),(3000118,'Lamp',2000008),(3000119,'Torch',2000008),(3000120,'Batteries & cells',2000008),(3000121,'Capacitors',2000008),(3000122,'Regulator',2000008),(3000123,'Ring Light',2000008),(3000124,'Buzzer',2000008),(3000125,'Door bells',2000008),(3000126,'Transformer',2000008),(3000127,'Generator',2000008),(3000128,'School supplies',2000009),(3000129,'Home essentails',2000009),(3000130,'Drawing & painting',2000009),(3000131,'Calculator',2000009),(3000132,'Office essentials',2000009),(3000133,'Xerox papers',2000009),(3000134,'Files & folders',2000009),(3000135,'Vase',2000010),(3000136,'Curtains',2000010),(3000137,'Mirror',2000010),(3000138,'Bed sheets & Pillow cover',2000010),(3000139,'Wall arts & Frames',2000010),(3000140,'Lamps',2000010),(3000141,'Carpets',2000010),(3000142,'Wallpapers',2000010),(3000143,'Chandilier',2000010),(3000144,'Clock',2000010),(3000145,'Floor Covering',2000010),(3000146,'Mattress',2000010),(3000147,'Bean Bag',2000010),(3000148,'Shower',2000010),(3000149,'Toilet & Bathroom',2000010),(3000150,'Tap',2000010),(3000151,'Basin',2000010),(3000152,'Dinner Set',2000011),(3000153,'Vessels',2000011),(3000154,'Chimney',2000011),(3000155,'Cutting Equipment',2000011),(3000156,'Cutlery',2000011),(3000157,'Storage Containers',2000011),(3000158,'Pan',2000011),(3000159,'Racks',2000011),(3000160,'Stove',2000011),(3000161,'Tiffin box',2000011),(3000162,'Kitchen Trolley',2000011),(3000163,'Wrench',2000012),(3000164,'Drilling Machine',2000012),(3000165,'Cutting tools',2000012),(3000166,'Hammer',2000012),(3000167,'Screw driver',2000012),(3000168,'Ladder',2000012),(3000169,'Tapes',2000012),(3000170,'Toolbox',2000012),(3000171,'Screw & Nails',2000012),(3000172,'Vice',2000012),(3000173,'Sand papers',2000012),(3000174,'Nut bolt & Washers',2000012),(3000175,'Others',2000012),(3000176,'Remote control toys',2000013),(3000177,'Educational toys',2000013),(3000178,'Soft toys',2000013),(3000179,'Board games',2000013),(3000180,'Outdoor toys',2000013),(3000181,'Musical toys',2000013),(3000182,'Dolls',2000013),(3000183,'Puzzles',2000013),(3000184,'Action figures',2000013),(3000185,'Cars',2000013),(3000186,'Toy guns',2000013),(3000187,'Cosmetics',2000014),(3000188,'Makeup Tools & Brushes',2000014),(3000189,'Trimmer',2000014),(3000190,'Hair care & Appliances',2000014),(3000191,'Skin care & Appliances',2000014),(3000192,'Deo & Perfumes',2000014),(3000193,'Shaving & After shave',2000014),(3000194,'Car accessories',2000015),(3000195,'Bike accessories',2000015),(3000196,'Helment',2000015),(3000197,'Riding gears',2000015),(3000198,'Washing equipment',2000015),(3000199,'Sofa set',2000016),(3000200,'Chairs',2000016),(3000201,'Tables',2000016),(3000202,'Wardrobe & Almirah',2000016),(3000203,'Dinning Table set',2000016),(3000204,'Bed',2000016),(3000205,'Chaurang',2000016),(3000206,'Shelves',2000016),(3000207,'Stool',2000016),(3000208,'Diapers & Wipes',2000017),(3000209,'Baby bath',2000017),(3000210,'Baby Oral Care',2000017),(3000211,'Baby Bedding',2000017),(3000212,'Baby Feeding & Accessories',2000017),(3000213,'Baby Grooming',2000017),(3000214,'Skin Care',2000017),(3000215,'Acedemic Books',2000018),(3000216,'Novels',2000018),(3000217,'Short Stories',2000018),(3000218,'Comics',2000018),(3000219,'Magazines',2000018),(3000220,'Encyclopedia',2000018),(3000221,'Percussion',2000019),(3000222,'Woodwind',2000019),(3000223,'String',2000019),(3000224,'Brass and Keyboard',2000019),(3000225,'Health Suppliment',2000020),(3000226,'Gym Equipment',2000020),(3000227,'Aerobic Equipment',2000020),(3000228,'Outdoor Games Equipment',2000020),(3000229,'Indoor Games Equipment',2000020),(3000230,'Swimming Equipments',2000020),(3000231,'Smart Watches & Fitness Bands',2000020),(3000232,'Stopwatch & Timer',2000020),(3000233,'Sports Wear',2000020),(3000234,'Fitness Kit',2000020),(3000235,'Face Masks',2000021),(3000236,'PPE Kit',2000021),(3000237,'Sanitizer',2000021),(3000238,'Pulse-Oximeter',2000021),(3000239,'Thermometer',2000021),(3000240,'Gloves',2000021),(3000241,'Face Shield',2000021),(3000242,'Thermal Gun',2000021),(3000243,'Handwash',2000021),(3000244,'Steamer',2000021),(3000245,'Snacks & Drinks',2000022),(3000246,'Instant Food',2000022),(3000247,'Grain',2000022),(3000248,'Flour',2000022),(3000249,'Dry Fruits',2000022),(3000250,'Salt & Spices',2000022),(3000251,'Coffee/ Tea/ Sugar',2000022),(3000252,'Frozen Food',2000022),(3000253,'Cleaning Supplies',2000022),(3000254,'Toiletries/ Personal Hygiene',2000022),(3000255,'Disposables',2000022),(3000256,'Household',2000022),(3000257,'Pooja Items',2000022),(3000258,'Diary Products',2000022),(3000259,'None',NULL);
/*!40000 ALTER TABLE `product_subcategories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `pId` int NOT NULL AUTO_INCREMENT,
  `pName` varchar(100) NOT NULL,
  `pMrp` float NOT NULL,
  `pCategory` int NOT NULL,
  `pPhotoId` varchar(100) DEFAULT NULL,
  `pSubCategory` int DEFAULT NULL,
  `pBrand` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`pId`),
  KEY `pCategory` (`pCategory`),
  KEY `pSubCategory` (`pSubCategory`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`pCategory`) REFERENCES `product_categories` (`catId`),
  CONSTRAINT `products_ibfk_2` FOREIGN KEY (`pSubCategory`) REFERENCES `product_subcategories` (`subCatId`)
) ENGINE=InnoDB AUTO_INCREMENT=50054 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seller_details`
--

DROP TABLE IF EXISTS `seller_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seller_details` (
  `sId` int NOT NULL AUTO_INCREMENT,
  `sName` varchar(45) NOT NULL,
  `sPhoneNo` bigint NOT NULL,
  `sDOB` date NOT NULL,
  `sGender` char(1) NOT NULL,
  `sAddress` varchar(100) NOT NULL,
  `sCity` varchar(45) NOT NULL,
  `sState` varchar(45) NOT NULL,
  `sZip` int NOT NULL,
  `sAadhar` bigint NOT NULL,
  `sPAN` char(10) NOT NULL,
  `sPassword` varchar(100) NOT NULL,
  `role` int DEFAULT '0',
  PRIMARY KEY (`sId`),
  UNIQUE KEY `sPhoneNo` (`sPhoneNo`),
  UNIQUE KEY `sAadhar` (`sAadhar`),
  UNIQUE KEY `sPAN` (`sPAN`)
) ENGINE=InnoDB AUTO_INCREMENT=1055 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seller_details`
--

LOCK TABLES `seller_details` WRITE;
/*!40000 ALTER TABLE `seller_details` DISABLE KEYS */;
INSERT INTO `seller_details` VALUES (1051,'Saurabh Dhoble',7756901721,'2000-06-28','M','Pt. No. 23, Manish Nagar, Nagpur - 15','Nagpur','Maharashtra',440015,787898985252,'ABCDE1234F','10b8e822d03fb4fd946188e852a4c3e2',0),(1052,'Tejas Gandhi',8087630373,'2000-12-22','M','Pt. No. 47, Manish Nagar, Nagpur - 15','Nagpur','Maharashtra',440015,525265656363,'FGHIJ1234K','10b8e822d03fb4fd946188e852a4c3e2',0),(1053,'Pooja Chavan',7378770771,'2000-01-23','F','A2-90, Mantri Chandak Nagar, Solapur','Solapur','Maharashtra',413002,323265652525,'LMNOP1234Q','10b8e822d03fb4fd946188e852a4c3e2',0),(1054,'Jay Gandhi',7709708626,'2000-06-29','M','Sujay Nagar, Solapur','Solapur','Maharashtra',413002,656236326563,'RSTUV1234W','10b8e822d03fb4fd946188e852a4c3e2',0);
/*!40000 ALTER TABLE `seller_details` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-14 16:32:18
