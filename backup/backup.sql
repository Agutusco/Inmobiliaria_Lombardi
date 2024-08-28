CREATE DATABASE  IF NOT EXISTS `proyecto_coder` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `proyecto_coder`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: proyecto_coder
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `contrato`
--

DROP TABLE IF EXISTS `contrato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contrato` (
  `contratoID` int NOT NULL AUTO_INCREMENT,
  `fecha_vto` datetime DEFAULT NULL,
  `duracion_en_dias` int DEFAULT NULL,
  PRIMARY KEY (`contratoID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla con informacion sobre el contrato y sus propiedades';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contrato`
--

LOCK TABLES `contrato` WRITE;
/*!40000 ALTER TABLE `contrato` DISABLE KEYS */;
INSERT INTO `contrato` VALUES (1,'2025-01-15 00:00:00',172),(2,'2025-03-30 00:00:00',247),(3,'2025-06-10 00:00:00',319),(4,'2025-08-22 00:00:00',392),(5,'2025-11-05 00:00:00',467),(6,'2026-01-20 00:00:00',543),(7,'2026-04-05 00:00:00',618),(8,'2026-06-18 00:00:00',692),(9,'2026-09-01 00:00:00',767),(10,'2026-11-15 00:00:00',842),(11,'2027-02-01 00:00:00',920),(12,'2027-04-18 00:00:00',996),(13,'2027-07-03 00:00:00',1072),(14,'2027-09-15 00:00:00',1146),(15,'2027-12-01 00:00:00',1223),(16,'2028-02-14 00:00:00',1298);
/*!40000 ALTER TABLE `contrato` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `calcular_duracion_en_dias` BEFORE INSERT ON `contrato` FOR EACH ROW BEGIN
    SET NEW.duracion_en_dias = DATEDIFF(NEW.fecha_vto, CURDATE());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `dueno`
--

DROP TABLE IF EXISTS `dueno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dueno` (
  `duenoID` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`duenoID`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla con informacion del dueno de la inmobiliaria';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dueno`
--

LOCK TABLES `dueno` WRITE;
/*!40000 ALTER TABLE `dueno` DISABLE KEYS */;
INSERT INTO `dueno` VALUES (1,'agustin','agustin@gmail.com'),(2,'felipe','felipe@gmail.com'),(3,'alma','alma@gmail.com');
/*!40000 ALTER TABLE `dueno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleado` (
  `empleadoID` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) DEFAULT NULL,
  `inmobiliariaID` int DEFAULT NULL,
  PRIMARY KEY (`empleadoID`),
  KEY `fk_empleado` (`inmobiliariaID`),
  CONSTRAINT `fk_empleado` FOREIGN KEY (`inmobiliariaID`) REFERENCES `inmobiliaria` (`inmobiliariaID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla con informacion del empleado de la inmobiliaria';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` VALUES (1,'Juan Perez',1),(2,'Maria Rodriguez',1),(3,'Carlos Martinez',1),(4,'Ana Garcia',1),(5,'Pedro Gomez',1),(6,'Sofia Lopez',1);
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `garante`
--

DROP TABLE IF EXISTS `garante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `garante` (
  `garanteID` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `inquilinoID` int DEFAULT NULL,
  PRIMARY KEY (`garanteID`),
  KEY `fk_garante` (`inquilinoID`),
  CONSTRAINT `fk_garante` FOREIGN KEY (`inquilinoID`) REFERENCES `inquilino` (`inquilinoID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla con informacion del garante del inquilino';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `garante`
--

LOCK TABLES `garante` WRITE;
/*!40000 ALTER TABLE `garante` DISABLE KEYS */;
INSERT INTO `garante` VALUES (1,'Esteban','esteban@gmail.com',2),(2,'Guillermo','guillermo@gmail.com',3),(3,'Lola','lola@gmail.com',5),(4,'Gaston','gaston@gmail.com',6),(5,'Lucas','lucas@gmail.com',8),(6,'Amadeo','amadeo@gmail.com',10),(7,'Cinthia','cinthia@gmail.com',12),(8,'Luz','luz@gmail.com',14),(9,'Priscila','priscila@gmail.com',16);
/*!40000 ALTER TABLE `garante` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `confirm_email_garante` BEFORE INSERT ON `garante` FOR EACH ROW BEGIN
	IF fn_revisar_emails_duplicados(NEW.email) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "El email esta duplicado";
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `inmobiliaria`
--

DROP TABLE IF EXISTS `inmobiliaria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inmobiliaria` (
  `inmobiliariaID` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `ubicacion` varchar(200) DEFAULT NULL,
  `duenoID` int DEFAULT NULL,
  PRIMARY KEY (`inmobiliariaID`),
  KEY `fk_dueno` (`duenoID`),
  CONSTRAINT `fk_dueno` FOREIGN KEY (`duenoID`) REFERENCES `dueno` (`duenoID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla con datos sobre la inmobiliaria';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inmobiliaria`
--

LOCK TABLES `inmobiliaria` WRITE;
/*!40000 ALTER TABLE `inmobiliaria` DISABLE KEYS */;
INSERT INTO `inmobiliaria` VALUES (1,'Tu hogar ideal','+54 911 8795-0984','Castelli 345 Buenos Aires',1);
/*!40000 ALTER TABLE `inmobiliaria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inquilino`
--

DROP TABLE IF EXISTS `inquilino`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inquilino` (
  `inquilinoID` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `tiene_garante` tinyint(1) DEFAULT '0',
  `dni` int DEFAULT NULL,
  PRIMARY KEY (`inquilinoID`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `dni` (`dni`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla con informacion de los distintos inquilinos';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inquilino`
--

LOCK TABLES `inquilino` WRITE;
/*!40000 ALTER TABLE `inquilino` DISABLE KEYS */;
INSERT INTO `inquilino` VALUES (1,'Juan','juan@gmail.com',0,30654978),(2,'Maria','maria@gmail.com',1,37400621),(3,'Carlos','carlos@gmail.com',1,40697842),(4,'Sofia','sofia@gmail.com',0,42593427),(5,'Ciro','ciro@gmail.com',1,39716963),(6,'Marcos','marcos@gmail.com',1,30489090),(7,'Ana','ana@gmail.com',0,31234567),(8,'Pedro','pedro@gmail.com',1,38901234),(9,'Lucia','lucia@gmail.com',0,41567890),(10,'Diego','diego@gmail.com',1,32456789),(11,'Valentina','valentina@gmail.com',0,39876543),(12,'Nicolas','nicolas@gmail.com',1,40123456),(13,'Laura','laura@gmail.com',0,33456789),(14,'Mateo','mateo@gmail.com',1,34789012),(15,'Camila','camila@gmail.com',0,35123456),(16,'Benjamin','benjamin@gmail.com',1,36456789);
/*!40000 ALTER TABLE `inquilino` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `confirm_email_inquilino` BEFORE INSERT ON `inquilino` FOR EACH ROW BEGIN
	IF fn_revisar_emails_duplicados(NEW.email) THEN
	    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "El email esta duplicado";
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `propiedad`
--

DROP TABLE IF EXISTS `propiedad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `propiedad` (
  `propiedadID` int NOT NULL AUTO_INCREMENT,
  `ubicacion` varchar(200) DEFAULT NULL,
  `departamento` tinyint(1) DEFAULT '0',
  `ambientes` varchar(150) DEFAULT NULL,
  `jardin` tinyint(1) DEFAULT NULL,
  `banos` int DEFAULT '1',
  `precio` int NOT NULL,
  `ocupada` tinyint(1) NOT NULL,
  `contratoID` int DEFAULT NULL,
  `inmobiliariaID` int DEFAULT NULL,
  `moneda` enum('ARS','USD') NOT NULL DEFAULT 'ARS',
  PRIMARY KEY (`propiedadID`),
  KEY `fk_contrato` (`contratoID`),
  KEY `fk_casa_inmobiliaria` (`inmobiliariaID`),
  CONSTRAINT `fk_casa_inmobiliaria` FOREIGN KEY (`inmobiliariaID`) REFERENCES `inmobiliaria` (`inmobiliariaID`),
  CONSTRAINT `fk_contrato` FOREIGN KEY (`contratoID`) REFERENCES `contrato` (`contratoID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla con informacion sobre la propiedad a visitar';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `propiedad`
--

LOCK TABLES `propiedad` WRITE;
/*!40000 ALTER TABLE `propiedad` DISABLE KEYS */;
INSERT INTO `propiedad` VALUES (1,'Avenida Siempreviva 123 Springfield',0,'Living-comedor cocina 2 dormitorios',1,2,15000000,0,1,1,'ARS'),(2,'Calle de los Suspiros 456 Gotham City',1,'Estudio dormitorio',0,1,80000,1,2,1,'USD'),(3,'Calle de las Flores 789 Metropolis',0,'Living cocina 2 dormitorios dependencia',1,2,200000000,0,3,1,'ARS'),(4,'Callejon sin Salida 10 Ciudad Gotica',0,'Living cocina dormitorio',0,1,100000,1,4,1,'USD'),(5,'Calle Principal 15 Pueblo Pajaro',0,'Living-comedor cocina 3 dormitorios',1,2,180000000,0,5,1,'ARS'),(6,'Avenida Siempreviva 456 Springfield',1,'Estudio dormitorio',0,1,70000,1,6,1,'USD'),(7,'Calle de los Suspiros 789 Gotham City',0,'Living cocina 2 dormitorios',1,2,120000000,0,7,1,'ARS'),(8,'Calle de Flores 10 Metropolis',0,'Living cocina dormitorio',0,1,90000,1,8,1,'USD'),(9,'Callejon sin Salida 15 Ciudad Gotica',0,'Living-comedor cocina 3 dormitorios',1,2,160000000,0,9,1,'ARS'),(10,'Calle Principal 456 Pueblo Pajaro',1,'Estudio dormitorio',0,1,60000,1,10,1,'USD'),(11,'Avenida Siempreviva 789 Springfield',0,'Living cocina 2 dormitorios',1,2,110000000,0,11,1,'ARS'),(12,'Calle de los Suspiros 10 Gotham City',0,'Living cocina dormitorio',0,1,80000,1,12,1,'USD'),(13,'Calle de Flores 15 Metropolis',0,'Living-comedor cocina 3 dormitorios',1,2,150000000,0,13,1,'ARS'),(14,'Callejon sin Salida 456 Ciudad Gotica',1,'Estudio dormitorio',0,1,70000,1,14,1,'USD'),(15,'Calle Principal 789 Pueblo Pajaro',0,'Living cocina 2 dormitorios',1,2,120000000,0,15,1,'ARS'),(16,'Avenida Siempreviva 1010 Springfield',0,'Living comedor cocina 2 dormitorios oficina',1,3,20000000,0,16,1,'ARS');
/*!40000 ALTER TABLE `propiedad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visita`
--

DROP TABLE IF EXISTS `visita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `visita` (
  `visitaID` int NOT NULL AUTO_INCREMENT,
  `inquilinoID` int DEFAULT NULL,
  `propiedadID` int DEFAULT NULL,
  `empleadoID` int DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `cancelacion` datetime DEFAULT NULL,
  PRIMARY KEY (`visitaID`),
  KEY `fk_visita_inquilino` (`inquilinoID`),
  KEY `fk_visita_propiedad` (`propiedadID`),
  KEY `fk_visita_empleado` (`empleadoID`),
  CONSTRAINT `fk_visita_empleado` FOREIGN KEY (`empleadoID`) REFERENCES `empleado` (`empleadoID`),
  CONSTRAINT `fk_visita_inquilino` FOREIGN KEY (`inquilinoID`) REFERENCES `inquilino` (`inquilinoID`),
  CONSTRAINT `fk_visita_propiedad` FOREIGN KEY (`propiedadID`) REFERENCES `propiedad` (`propiedadID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla con información con la visita a las distintas propiedades';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visita`
--

LOCK TABLES `visita` WRITE;
/*!40000 ALTER TABLE `visita` DISABLE KEYS */;
INSERT INTO `visita` VALUES (1,1,1,1,'2023-11-15 10:00:00',NULL),(2,2,2,2,'2023-12-20 14:30:00','2023-12-19 09:15:00'),(3,3,3,3,'2024-01-05 11:45:00',NULL),(4,4,4,4,'2024-02-10 16:00:00',NULL),(5,5,5,5,'2024-03-18 09:30:00',NULL),(6,6,6,6,'2024-04-22 13:15:00',NULL),(7,7,7,1,'2024-05-30 15:45:00',NULL),(8,8,8,2,'2024-06-14 10:30:00',NULL),(9,9,9,3,'2024-07-20 14:00:00',NULL),(10,10,10,4,'2024-08-25 11:00:00',NULL),(11,11,11,5,'2024-09-30 16:30:00',NULL),(12,12,12,6,'2024-10-15 09:45:00',NULL),(13,13,13,1,'2024-11-22 13:30:00',NULL),(14,14,14,2,'2024-12-05 15:15:00',NULL),(15,15,15,3,'2025-01-10 10:15:00',NULL),(16,16,16,4,'2025-02-18 14:45:00',NULL);
/*!40000 ALTER TABLE `visita` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_inquilinos_con_garante`
--

DROP TABLE IF EXISTS `vw_inquilinos_con_garante`;
/*!50001 DROP VIEW IF EXISTS `vw_inquilinos_con_garante`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_inquilinos_con_garante` AS SELECT 
 1 AS `inquilinoID`,
 1 AS `nombre_inquilino`,
 1 AS `email`,
 1 AS `tiene_garante`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_propiedades_ocupadas`
--

DROP TABLE IF EXISTS `vw_propiedades_ocupadas`;
/*!50001 DROP VIEW IF EXISTS `vw_propiedades_ocupadas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_propiedades_ocupadas` AS SELECT 
 1 AS `propiedadID`,
 1 AS `ubicacion`,
 1 AS `departamento`,
 1 AS `ambientes`,
 1 AS `jardin`,
 1 AS `banos`,
 1 AS `precio`,
 1 AS `ocupada`,
 1 AS `moneda`,
 1 AS `nombre_inquilino_viviendo`,
 1 AS `email_inquilino`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_visitas_realizadas`
--

DROP TABLE IF EXISTS `vw_visitas_realizadas`;
/*!50001 DROP VIEW IF EXISTS `vw_visitas_realizadas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_visitas_realizadas` AS SELECT 
 1 AS `propiedadID`,
 1 AS `nombre_inquilino`,
 1 AS `nombre_empleado`,
 1 AS `fecha`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'proyecto_coder'
--

--
-- Dumping routines for database 'proyecto_coder'
--
/*!50003 DROP FUNCTION IF EXISTS `fn_estado_visita` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_estado_visita`(fecha_visita DATETIME, cancelacion DATETIME) RETURNS varchar(20) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
	IF
    cancelacion IS NOT NULL THEN
		RETURN 'Cancelada';
    ELSEIF fecha_visita < NOW() THEN
		RETURN 'Realizada';
    ELSE
		RETURN 'Pendiente';
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_revisar_emails_duplicados` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_revisar_emails_duplicados`(new_email VARCHAR(100)) RETURNS tinyint(1)
    DETERMINISTIC
BEGIN
	DECLARE existing_email BOOLEAN;
		SELECT EXISTS(
        SELECT
        1
        FROM (
				SELECT email FROM inquilino
                UNION ALL
                SELECT email FROM garante
			) AS emails
            WHERE email = new_email
            ) INTO existing_email;
			RETURN existing_email;
 END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `procedure_listar_propiedades_precio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `procedure_listar_propiedades_precio`(
 IN precio_min INT,
 IN precio_max INT,
 IN moneda_busqueda ENUM('ARS', 'USD')
)
BEGIN
	SELECT
    propiedadID,
    ubicacion,
    ambientes,
    precio,
    moneda
    FROM propiedad
    WHERE moneda = moneda_busqueda AND precio BETWEEN precio_min AND precio_max
    ORDER BY precio DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `procedure_obtener_empleado_visita` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `procedure_obtener_empleado_visita`()
BEGIN
	SELECT
    e.empleadoID,
    e.nombre AS nombre_empleado,
    COUNT(v.visitaID) AS numero_visita
    FROM empleado e
    JOIN visita v ON e.empleadoID = v.empleadoID
    GROUP BY e.empleadoID, e.nombre
    HAVING COUNT(v.visitaID) > 1
    ORDER BY numero_visita DESC;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `procedure_tipo_propiedad` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `procedure_tipo_propiedad`()
BEGIN
	SELECT
    CASE WHEN departamento = TRUE THEN 'Departamento' ELSE 'Casa'
     END AS tipo_propiedad,
    COUNT(*) AS total
	FROM propiedad
    GROUP BY departamento;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_propiedades_a_desocuparse` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_propiedades_a_desocuparse`(IN dias_limites INT)
BEGIN
	SELECT
    p.propiedadID,
    p.ubicacion,
    c.fecha_vto
    FROM propiedad p
    JOIN contrato c ON p.contratoID = c.contratoID
    WHERE p.ocupada = TRUE AND DATEDIFF(c.fecha_vto, CURDATE()) <= dias_limites
    ORDER BY c.fecha_vto;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vw_inquilinos_con_garante`
--

/*!50001 DROP VIEW IF EXISTS `vw_inquilinos_con_garante`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_inquilinos_con_garante` AS select `i`.`inquilinoID` AS `inquilinoID`,`i`.`nombre` AS `nombre_inquilino`,`i`.`email` AS `email`,(case when (`g`.`garanteID` is not null) then 'Si' else 'No' end) AS `tiene_garante` from (`inquilino` `i` left join `garante` `g` on((`g`.`garanteID` = `i`.`inquilinoID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_propiedades_ocupadas`
--

/*!50001 DROP VIEW IF EXISTS `vw_propiedades_ocupadas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_propiedades_ocupadas` AS select `p`.`propiedadID` AS `propiedadID`,`p`.`ubicacion` AS `ubicacion`,`p`.`departamento` AS `departamento`,`p`.`ambientes` AS `ambientes`,`p`.`jardin` AS `jardin`,`p`.`banos` AS `banos`,`p`.`precio` AS `precio`,`p`.`ocupada` AS `ocupada`,`p`.`moneda` AS `moneda`,`i`.`nombre` AS `nombre_inquilino_viviendo`,`i`.`email` AS `email_inquilino` from (`propiedad` `p` join `inquilino` `i` on((`p`.`propiedadID` = `i`.`inquilinoID`))) where (`p`.`ocupada` = true) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_visitas_realizadas`
--

/*!50001 DROP VIEW IF EXISTS `vw_visitas_realizadas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_visitas_realizadas` AS select `p`.`propiedadID` AS `propiedadID`,`i`.`nombre` AS `nombre_inquilino`,`e`.`nombre` AS `nombre_empleado`,`v`.`fecha` AS `fecha` from (((`visita` `v` join `propiedad` `p` on((`v`.`propiedadID` = `p`.`propiedadID`))) join `empleado` `e` on((`v`.`empleadoID` = `e`.`empleadoID`))) join `inquilino` `i` on((`v`.`inquilinoID` = `i`.`inquilinoID`))) where (`v`.`fecha` < now()) order by `p`.`propiedadID` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-25 14:48:39
