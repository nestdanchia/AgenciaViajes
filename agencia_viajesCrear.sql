-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: agencia_viajes
-- ------------------------------------------------------
-- Server version	8.0.37

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
-- Table structure for table `habitacion`
--
CREATE DATABASE agencia_viajes;
use agencia_viajes;
DROP TABLE IF EXISTS `habitacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `habitacion` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `id_hotel` int unsigned NOT NULL,
  `precio_noche` varchar(20) DEFAULT NULL,
  `plazas_habitacion` int NOT NULL,
  `nombre_hotel` varchar(45) NOT NULL,
  `ocupada` tinyint unsigned NOT NULL,
  `nuemero habitacion` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_habitacion_hotel_idx` (`id_hotel`),
  CONSTRAINT `fk_habita_hotel` FOREIGN KEY (`id_hotel`) REFERENCES `hoteles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `habitacion`
--

LOCK TABLES `habitacion` WRITE;
/*!40000 ALTER TABLE `habitacion` DISABLE KEYS */;
INSERT INTO `habitacion` VALUES (8,1,'100.000$',4,'El Conquistador',0,100),(9,1,'100.000$',4,'El Conquistador',0,101),(10,1,'100.000$',4,'El Conquistador',0,102),(11,1,'100.000$',4,'El Conquistador',0,103),(12,1,'50.000$',2,'El Conquistador',0,104),(13,1,'50.000$',2,'El Conquistador',0,105),(14,1,'50.000$',2,'El Conquistador',0,106),(15,2,'65000$',2,'El Rosal',0,100),(16,2,'65000$',2,'El Rosal',0,101),(17,2,'100.000$',4,'El Rosal',0,102),(18,3,'80.000$',2,'El Austral',0,100),(19,3,'80.000$',2,'El Austral',0,101),(20,3,'80.000$',2,'El Austral',0,102),(21,3,'80.000$',2,'El Austral',0,103),(22,3,'80.000$',2,'El Austral',0,104),(23,4,'750000$',2,'Alazan',0,100),(24,4,'150.000$',4,'Alazan',0,101),(25,4,'750000$',2,'Alazan',0,102),(26,3,'120000$',2,'El Austral',0,100),(27,3,'220000$',4,'El Austral',0,101);
/*!40000 ALTER TABLE `habitacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hoteles`
--

DROP TABLE IF EXISTS `hoteles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hoteles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `id_provincia` int unsigned NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `ciudad` varchar(25) NOT NULL,
  `disponible_plazas` int NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `nombre_hotel` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre_hotel_UNIQUE` (`nombre_hotel`),
  KEY `fk_hotel_provincia_idx` (`id_provincia`),
  CONSTRAINT `fk_hotel_provincia` FOREIGN KEY (`id_provincia`) REFERENCES `provincias` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hoteles`
--

LOCK TABLES `hoteles` WRITE;
/*!40000 ALTER TABLE `hoteles` DISABLE KEYS */;
INSERT INTO `hoteles` VALUES (1,1,'Belgrano 145','Mar Del Plata',50,'0223-4995700','El Conquistador'),(2,14,'San Martin 20','Mendoza',20,'02635678900','El Rosal'),(3,21,'Roca 564','Rio Gallegos',12,'02966-444950','El Austral'),(4,7,'Luis Maria Campos ','Cordoba',100,'957-298311','Alazan ');
/*!40000 ALTER TABLE `hoteles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pago`
--

DROP TABLE IF EXISTS `pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pago` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `tarjeta` varchar(45) DEFAULT NULL,
  `numero_tarjeta` varchar(50) DEFAULT NULL,
  `pago_confirmado` tinyint(1) DEFAULT '0',
  `id_reserva` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_reserva_UNIQUE` (`id_reserva`),
  KEY `fk_pago_reserva_idx` (`id_reserva`),
  CONSTRAINT `fk_pago_reserva` FOREIGN KEY (`id_reserva`) REFERENCES `reservas` (`id_reserva`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pago`
--

LOCK TABLES `pago` WRITE;
/*!40000 ALTER TABLE `pago` DISABLE KEYS */;
INSERT INTO `pago` VALUES (1,'mastercard','5879897568594521',1,1),(2,'visa','6889784512574587',1,2),(3,'master card','5689785445125623',1,3),(4,NULL,NULL,0,4),(5,NULL,NULL,0,5),(6,NULL,NULL,0,6);
/*!40000 ALTER TABLE `pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `precio` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provincias`
--

DROP TABLE IF EXISTS `provincias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `provincias` (
  `id` int unsigned NOT NULL,
  `provincia` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provincias`
--

LOCK TABLES `provincias` WRITE;
/*!40000 ALTER TABLE `provincias` DISABLE KEYS */;
INSERT INTO `provincias` VALUES (1,'Buenos Aires'),(2,'Buenos Aires-GBA'),(3,'Capital Federal'),(4,'Catamarca'),(5,'Chaco'),(6,'Chubut'),(7,'Córdoba'),(8,'Corrientes'),(9,'Entre Ríos'),(10,'Formosa'),(11,'Jujuy'),(12,'La Pampa'),(13,'La Rioja'),(14,'Mendoza'),(15,'Misiones'),(16,'Neuquén'),(17,'Río Negro'),(18,'Salta'),(19,'San Juan'),(20,'San Luis'),(21,'Santa Cruz'),(22,'Santa Fe'),(23,'Santiago del Estero'),(24,'Tierra del Fuego'),(25,'Tucumán');
/*!40000 ALTER TABLE `provincias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservas`
--

DROP TABLE IF EXISTS `reservas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservas` (
  `id_reserva` int unsigned NOT NULL AUTO_INCREMENT,
  `id_hotel` int unsigned NOT NULL,
  `id_turista` int unsigned NOT NULL,
  `fecha_entrada` datetime NOT NULL,
  `fecha_salida` datetime NOT NULL,
  `cantidad_personas` int NOT NULL,
  `id_habitacion` int unsigned NOT NULL,
  `precio_noche` varchar(25) NOT NULL,
  PRIMARY KEY (`id_reserva`,`id_hotel`,`id_turista`),
  KEY `fk_turista_idx` (`id_turista`),
  KEY `fk_hotel_idx` (`id_hotel`),
  KEY `fk_reservas_habitacion_idx` (`id_habitacion`),
  CONSTRAINT `fk_hotel` FOREIGN KEY (`id_hotel`) REFERENCES `hoteles` (`id`),
  CONSTRAINT `fk_reservation_habitacion` FOREIGN KEY (`id_habitacion`) REFERENCES `habitacion` (`id`),
  CONSTRAINT `fk_turista` FOREIGN KEY (`id_turista`) REFERENCES `turista` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservas`
--

LOCK TABLES `reservas` WRITE;
/*!40000 ALTER TABLE `reservas` DISABLE KEYS */;
INSERT INTO `reservas` VALUES (1,1,1,'2024-08-27 00:00:00','2024-08-12 00:00:00',2,12,'50000'),(2,3,2,'2024-09-15 00:00:00','2024-09-25 00:00:00',2,21,'80000'),(3,4,3,'2024-09-01 00:00:00','2024-09-15 00:00:00',4,24,'150000'),(4,3,4,'2024-10-16 00:00:00','2024-10-21 00:00:00',4,27,'220000'),(5,4,1,'2024-10-05 00:00:00','2024-10-21 00:00:00',4,24,'150000'),(6,3,1,'2024-11-21 00:00:00','2024-11-29 00:00:00',2,21,'800000');
/*!40000 ALTER TABLE `reservas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `turista`
--

DROP TABLE IF EXISTS `turista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `turista` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `telefono` varchar(9) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `turista`
--

LOCK TABLES `turista` WRITE;
/*!40000 ALTER TABLE `turista` DISABLE KEYS */;
INSERT INTO `turista` VALUES (1,'Juan','Perez','Dorrego 202 CABA ','4943-1520'),(2,'Pedro ','Rodriguez','Avda Libertador 4500 CABA ','4774-8956'),(3,'Francisco ','Fonseca','Avda Cabildo 2200 CABA ','4774-8957'),(4,'Julian','Giimenez','Arce 650 CABA ','4774-9065'),(9,'Josehp','Four','Ugly 23',NULL),(10,'Angelica','Sol','El Salvador 125',NULL),(11,'Monica ','Gutierrez','Nazca 124',NULL),(12,'Fernando ','Alegria','Las Risas 456',NULL),(13,'Pablo ','Unico','Dos 639',NULL),(14,'MIguel Angel ','Lorenz','Maure 36',NULL),(15,'roberto ','Perri','Los Olmos 56',NULL);
/*!40000 ALTER TABLE `turista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_login`
--

DROP TABLE IF EXISTS `user_login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_login` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(90) NOT NULL,
  `user_password` varchar(90) NOT NULL,
  `user_email` varchar(90) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_login`
--

LOCK TABLES `user_login` WRITE;
/*!40000 ALTER TABLE `user_login` DISABLE KEYS */;
INSERT INTO `user_login` VALUES (1,'Nestor','nestor01','ndchiariello@gmail.com'),(2,'Fede','fede01','fede@gmail.com');
/*!40000 ALTER TABLE `user_login` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-06 17:58:11
