CREATE DATABASE  IF NOT EXISTS `virtual_quiz` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `virtual_quiz`;
-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: virtual_quiz
-- ------------------------------------------------------
-- Server version	5.7.27-log

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
-- Table structure for table `alumno`
--

DROP TABLE IF EXISTS `alumno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alumno` (
  `id_alumno` int(11) NOT NULL AUTO_INCREMENT,
  `estado` varchar(45) DEFAULT NULL,
  `persona_alumno` int(11) NOT NULL,
  `curso_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_alumno`),
  KEY `alumno_persona_alumno_bc924863_fk_persona_id_persona` (`persona_alumno`),
  KEY `alumno_curso_id_bd352814_fk_curso_id_curso` (`curso_id`),
  CONSTRAINT `alumno_curso_id_bd352814_fk_curso_id_curso` FOREIGN KEY (`curso_id`) REFERENCES `curso` (`id_curso`),
  CONSTRAINT `alumno_persona_alumno_bc924863_fk_persona_id_persona` FOREIGN KEY (`persona_alumno`) REFERENCES `persona` (`id_persona`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumno`
--

LOCK TABLES `alumno` WRITE;
/*!40000 ALTER TABLE `alumno` DISABLE KEYS */;
INSERT INTO `alumno` VALUES (1,'ACTIVO',5,2);
/*!40000 ALTER TABLE `alumno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asignar_examen`
--

DROP TABLE IF EXISTS `asignar_examen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asignar_examen` (
  `id_asig_examen` int(11) NOT NULL AUTO_INCREMENT,
  `examen_id` int(11) NOT NULL,
  `estado` varchar(45),
  PRIMARY KEY (`id_asig_examen`),
  KEY `asignar_examen_examen_id_b9454dd3_fk_examen_id_examen` (`examen_id`),
  CONSTRAINT `asignar_examen_examen_id_b9454dd3_fk_examen_id_examen` FOREIGN KEY (`examen_id`) REFERENCES `examen` (`id_examen`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asignar_examen`
--

LOCK TABLES `asignar_examen` WRITE;
/*!40000 ALTER TABLE `asignar_examen` DISABLE KEYS */;
INSERT INTO `asignar_examen` VALUES (2,1,'ACTIVO');
/*!40000 ALTER TABLE `asignar_examen` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add Persona',7,'add_personas'),(26,'Can change Persona',7,'change_personas'),(27,'Can delete Persona',7,'delete_personas'),(28,'Can view Persona',7,'view_personas'),(29,'Can add Menu',8,'add_menu'),(30,'Can change Menu',8,'change_menu'),(31,'Can delete Menu',8,'delete_menu'),(32,'Can view Menu',8,'view_menu'),(33,'Can add Usuario',9,'add_usuario'),(34,'Can change Usuario',9,'change_usuario'),(35,'Can delete Usuario',9,'delete_usuario'),(36,'Can view Usuario',9,'view_usuario'),(37,'Can add Permiso',10,'add_permisos'),(38,'Can change Permiso',10,'change_permisos'),(39,'Can delete Permiso',10,'delete_permisos'),(40,'Can view Permiso',10,'view_permisos'),(41,'Can add (\'Pregunta\',)',11,'add_pregunta'),(42,'Can change (\'Pregunta\',)',11,'change_pregunta'),(43,'Can delete (\'Pregunta\',)',11,'delete_pregunta'),(44,'Can view (\'Pregunta\',)',11,'view_pregunta'),(45,'Can add (\'Examen\',)',12,'add_examen'),(46,'Can change (\'Examen\',)',12,'change_examen'),(47,'Can delete (\'Examen\',)',12,'delete_examen'),(48,'Can view (\'Examen\',)',12,'view_examen'),(49,'Can add Rol',13,'add_roles'),(50,'Can change Rol',13,'change_roles'),(51,'Can delete Rol',13,'delete_roles'),(52,'Can view Rol',13,'view_roles'),(53,'Can add opciones',14,'add_opciones'),(54,'Can change opciones',14,'change_opciones'),(55,'Can delete opciones',14,'delete_opciones'),(56,'Can view opciones',14,'view_opciones'),(57,'Can add alumno',15,'add_alumno'),(58,'Can change alumno',15,'change_alumno'),(59,'Can delete alumno',15,'delete_alumno'),(60,'Can view alumno',15,'view_alumno'),(61,'Can add (\'materia\',)',16,'add_materia'),(62,'Can change (\'materia\',)',16,'change_materia'),(63,'Can delete (\'materia\',)',16,'delete_materia'),(64,'Can view (\'materia\',)',16,'view_materia'),(65,'Can add profesor',17,'add_profesor'),(66,'Can change profesor',17,'change_profesor'),(67,'Can delete profesor',17,'delete_profesor'),(68,'Can view profesor',17,'view_profesor'),(69,'Can add curso',18,'add_curso'),(70,'Can change curso',18,'change_curso'),(71,'Can delete curso',18,'delete_curso'),(72,'Can view curso',18,'view_curso'),(73,'Can add (\'Materia\',)',19,'add_materia'),(74,'Can change (\'Materia\',)',19,'change_materia'),(75,'Can delete (\'Materia\',)',19,'delete_materia'),(76,'Can view (\'Materia\',)',19,'view_materia'),(77,'Can add (\'Anexo\',)',20,'add_anexos'),(78,'Can change (\'Anexo\',)',20,'change_anexos'),(79,'Can delete (\'Anexo\',)',20,'delete_anexos'),(80,'Can view (\'Anexo\',)',20,'view_anexos'),(81,'Can add Asignar examen',21,'add_asignar_examen'),(82,'Can change Asignar examen',21,'change_asignar_examen'),(83,'Can delete Asignar examen',21,'delete_asignar_examen'),(84,'Can view Asignar examen',21,'view_asignar_examen');
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
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$150000$8N4Z0eue0Ebj$zM1R64ou3ptRzJlrq9a466AbpmKv2rAh89h0IhvaI3Q=','2020-03-31 00:13:10.313246',1,'root','','','',1,1,'2020-03-21 18:48:15.375759');
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curso`
--

DROP TABLE IF EXISTS `curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `curso` (
  `id_curso` int(11) NOT NULL AUTO_INCREMENT,
  `curso` varchar(45) NOT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `paralelo` varchar(12) NOT NULL,
  `estado` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_curso`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curso`
--

LOCK TABLES `curso` WRITE;
/*!40000 ALTER TABLE `curso` DISABLE KEYS */;
INSERT INTO `curso` VALUES (1,'Tercero','sin descripcion','B','ACTIVO'),(2,'Cuarto','Ninguna','A','ACTIVO');
/*!40000 ALTER TABLE `curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curso_examenes`
--

DROP TABLE IF EXISTS `curso_examenes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `curso_examenes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `asignar_examen_id` int(11) NOT NULL,
  `curso_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `curso_examenes_asignar_examen_id_curso_id_d4168bba_uniq` (`asignar_examen_id`,`curso_id`),
  KEY `curso_examenes_curso_id_9afc9fd6_fk_curso_id_curso` (`curso_id`),
  CONSTRAINT `curso_examenes_asignar_examen_id_a2a53db2_fk_asignar_e` FOREIGN KEY (`asignar_examen_id`) REFERENCES `asignar_examen` (`id_asig_examen`),
  CONSTRAINT `curso_examenes_curso_id_9afc9fd6_fk_curso_id_curso` FOREIGN KEY (`curso_id`) REFERENCES `curso` (`id_curso`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curso_examenes`
--

LOCK TABLES `curso_examenes` WRITE;
/*!40000 ALTER TABLE `curso_examenes` DISABLE KEYS */;
INSERT INTO `curso_examenes` VALUES (4,2,2);
/*!40000 ALTER TABLE `curso_examenes` ENABLE KEYS */;
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
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2020-03-21 18:57:42.488115','4','admin',1,'[{\"added\": {}}]',7,1),(2,'2020-03-21 18:58:42.865647','4','admin',2,'[{\"changed\": {\"fields\": [\"foto\"]}}]',7,1),(3,'2020-03-21 19:00:56.719909','2','ADMINISTRADOR',1,'[{\"added\": {}}]',13,1),(4,'2020-03-21 19:01:00.390816','1','admin',1,'[{\"added\": {}}]',9,1),(5,'2020-03-21 19:08:37.817303','1','Seguridad',1,'[{\"added\": {}}]',8,1),(6,'2020-03-21 19:09:09.549200','2','roles',1,'[{\"added\": {}}]',8,1),(7,'2020-03-21 19:09:39.170692','3','Usuarios',1,'[{\"added\": {}}]',8,1),(8,'2020-03-21 19:10:23.069239','4','Permisos',1,'[{\"added\": {}}]',8,1),(9,'2020-03-21 19:37:58.605626','1','Permisos object (1)',1,'[{\"added\": {}}]',10,1),(10,'2020-03-22 00:17:59.391730','3','PROFESOR',1,'[{\"added\": {}}]',13,1),(11,'2020-03-22 00:18:03.539444','4','ALUMNO',1,'[{\"added\": {}}]',13,1),(12,'2020-03-22 12:40:48.083926','5','Personas',1,'[{\"added\": {}}]',8,1),(13,'2020-03-22 12:41:20.033386','1','Permisos object (1)',2,'[{\"changed\": {\"fields\": [\"menu\"]}}]',10,1),(14,'2020-03-22 12:41:37.676858','1','Permisos object (1)',2,'[{\"changed\": {\"fields\": [\"menu\"]}}]',10,1),(15,'2020-03-22 12:54:58.115016','5','ROLES',1,'[{\"added\": {}}]',13,1),(16,'2020-03-22 12:57:28.485815','6','Estutiante',1,'[{\"added\": {}}]',8,1),(17,'2020-03-22 12:57:59.075939','6','Sección Estudiante',2,'[{\"changed\": {\"fields\": [\"nombre\"]}}]',8,1),(18,'2020-03-22 12:58:41.893056','7','Cursos',1,'[{\"added\": {}}]',8,1),(19,'2020-03-22 12:59:05.286279','4','Permisos object (4)',2,'[{\"changed\": {\"fields\": [\"menu\"]}}]',10,1),(20,'2020-03-22 12:59:20.312952','3','Permisos object (3)',2,'[{\"changed\": {\"fields\": [\"menu\"]}}]',10,1),(21,'2020-03-22 13:00:24.771795','5','EMPLEADO_ADMINITRATIVO',2,'[{\"changed\": {\"fields\": [\"rol_nombre\"]}}]',13,1),(22,'2020-03-22 13:00:51.313763','5','Permisos object (5)',1,'[{\"added\": {}}]',10,1),(23,'2020-03-22 13:40:12.807206','5','EMPLEADO ADMINITRATIVO',2,'[{\"changed\": {\"fields\": [\"rol_nombre\"]}}]',13,1),(24,'2020-03-22 13:46:31.419202','7','Cursos',2,'[{\"changed\": {\"fields\": [\"url\"]}}]',8,1),(25,'2020-03-22 13:47:11.095996','7','Cursos',2,'[{\"changed\": {\"fields\": [\"url\"]}}]',8,1),(26,'2020-03-22 21:04:00.091179','8','Seccion profesor',1,'[{\"added\": {}}]',8,1),(27,'2020-03-22 21:04:41.160911','7','Cursos',2,'[{\"changed\": {\"fields\": [\"menu_padre\"]}}]',8,1),(28,'2020-03-22 21:05:31.834869','9','Alumnos',1,'[{\"added\": {}}]',8,1),(29,'2020-03-22 21:06:14.366321','10','Examenes',1,'[{\"added\": {}}]',8,1),(30,'2020-03-23 12:27:18.809188','7','Cursos',2,'[{\"changed\": {\"fields\": [\"url\"]}}]',8,1),(31,'2020-03-23 12:31:02.047289','7','Cursos',2,'[]',8,1),(32,'2020-03-23 13:26:43.077719','11','Alumno',1,'[{\"added\": {}}]',8,1),(33,'2020-03-23 13:27:14.612485','11','Alum',2,'[{\"changed\": {\"fields\": [\"nombre\"]}}]',8,1),(34,'2020-03-23 13:27:25.659751','11','Alum',3,'',8,1),(35,'2020-03-23 13:28:08.546977','9','Alumnos',2,'[{\"changed\": {\"fields\": [\"url\"]}}]',8,1),(36,'2020-03-23 15:41:14.088263','9','Alumnos',2,'[{\"changed\": {\"fields\": [\"url\"]}}]',8,1),(37,'2020-03-23 15:52:07.413854','2','Cuarto A descripción: Ninguna',2,'[{\"changed\": {\"fields\": [\"curso\"]}}]',18,1),(38,'2020-03-23 15:52:15.996896','1','Tercero B descripción: sin descripcion',2,'[{\"changed\": {\"fields\": [\"curso\"]}}]',18,1),(39,'2020-03-23 15:53:11.094428','1','Tercero B descripción: sin descripcion',2,'[{\"changed\": {\"fields\": [\"estado\"]}}]',18,1),(40,'2020-03-23 15:54:06.281578','1','Manuel',2,'[{\"changed\": {\"fields\": [\"estado\"]}}]',15,1),(41,'2020-03-24 12:22:09.922706','12','Opciones',1,'[{\"added\": {}}]',8,1),(42,'2020-03-24 12:22:20.333008','13','Preguntas',1,'[{\"added\": {}}]',8,1),(43,'2020-03-24 12:22:39.586160','14','Asignar examenes',1,'[{\"added\": {}}]',8,1),(44,'2020-03-24 12:22:51.846538','15','Anexos',1,'[{\"added\": {}}]',8,1),(45,'2020-03-24 12:23:34.150479','16','Evaluaciones',1,'[{\"added\": {}}]',8,1),(46,'2020-03-24 13:23:26.038176','15','Anexos',2,'[{\"changed\": {\"fields\": [\"url\"]}}]',8,1),(47,'2020-03-24 22:26:24.278658','1','Permisos object (1)',2,'[{\"changed\": {\"fields\": [\"menu\"]}}]',10,1),(48,'2020-03-24 22:26:45.422340','12','Opciones',2,'[{\"changed\": {\"fields\": [\"url\"]}}]',8,1),(49,'2020-03-24 23:17:21.601462','13','Preguntas',2,'[{\"changed\": {\"fields\": [\"url\"]}}]',8,1),(50,'2020-03-24 23:40:49.921002','10','Examenes',2,'[{\"changed\": {\"fields\": [\"url\"]}}]',8,1),(51,'2020-03-25 00:00:59.212340','17','Materias',1,'[{\"added\": {}}]',8,1),(52,'2020-03-25 01:03:56.103124','14','Asignar examenes',2,'[{\"changed\": {\"fields\": [\"url\"]}}]',8,1),(53,'2020-03-25 12:58:23.320274','1','Permisos object (1)',2,'[{\"changed\": {\"fields\": [\"menu\"]}}]',10,1),(54,'2020-03-25 14:15:17.023312','16','Evaluaciones',2,'[{\"changed\": {\"fields\": [\"url\"]}}]',8,1),(55,'2020-03-25 19:19:50.186065','15','Anexos',3,'',8,1),(56,'2020-03-31 00:13:37.971148','16','Realizar Examen',2,'[{\"changed\": {\"fields\": [\"nombre\"]}}]',8,1),(57,'2020-03-31 00:14:01.820343','5','Gerstion de personas',2,'[{\"changed\": {\"fields\": [\"nombre\"]}}]',8,1),(58,'2020-03-31 00:14:23.570033','9','Gestion de estudiantes',2,'[{\"changed\": {\"fields\": [\"nombre\"]}}]',8,1),(59,'2020-03-31 00:14:36.605349','1','Configuraciones',2,'[{\"changed\": {\"fields\": [\"nombre\"]}}]',8,1),(60,'2020-03-31 00:16:24.377512','6','Estudiantes',2,'[{\"changed\": {\"fields\": [\"nombre\"]}}]',8,1),(61,'2020-03-31 00:17:01.666675','10','Gestion de examenes',2,'[{\"changed\": {\"fields\": [\"nombre\"]}}]',8,1),(62,'2020-03-31 00:26:22.324739','18','Examenes',1,'[{\"added\": {}}]',8,1),(63,'2020-03-31 00:27:54.038738','13','Preguntas',2,'[{\"changed\": {\"fields\": [\"menu_padre\"]}}]',8,1),(64,'2020-03-31 00:28:16.374459','12','Opciones',2,'[{\"changed\": {\"fields\": [\"menu_padre\"]}}]',8,1),(65,'2020-03-31 00:28:44.043183','10','Gestion de examenes',2,'[{\"changed\": {\"fields\": [\"menu_padre\"]}}]',8,1),(66,'2020-03-31 00:29:27.876970','3','Crear usuarios',2,'[{\"changed\": {\"fields\": [\"nombre\"]}}]',8,1),(67,'2020-03-31 00:30:22.539612','4','Gestionar permisos',2,'[{\"changed\": {\"fields\": [\"nombre\"]}}]',8,1),(68,'2020-03-31 00:30:45.575503','3','Gestionar usuarios',2,'[{\"changed\": {\"fields\": [\"nombre\"]}}]',8,1),(69,'2020-03-31 00:31:09.690286','5','Gerstionar personas',2,'[{\"changed\": {\"fields\": [\"nombre\"]}}]',8,1),(70,'2020-03-31 00:31:47.891965','12','Crear opciones',2,'[{\"changed\": {\"fields\": [\"nombre\"]}}]',8,1),(71,'2020-03-31 00:32:09.062683','13','Gestion de preguntas',2,'[{\"changed\": {\"fields\": [\"nombre\"]}}]',8,1),(72,'2020-03-31 00:32:20.388206','12','Gestion de opciones',2,'[{\"changed\": {\"fields\": [\"nombre\"]}}]',8,1),(73,'2020-03-31 01:34:55.022895','3','Permisos object (3)',2,'[{\"changed\": {\"fields\": [\"menu\"]}}]',10,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(15,'asignacion','alumno'),(21,'asignacion','asignar_examen'),(18,'asignacion','curso'),(16,'asignacion','materia'),(17,'asignacion','profesor'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(20,'evaluacion','anexos'),(12,'evaluacion','examen'),(19,'evaluacion','materia'),(14,'evaluacion','opciones'),(11,'evaluacion','pregunta'),(8,'seguridad','menu'),(10,'seguridad','permisos'),(7,'seguridad','personas'),(13,'seguridad','roles'),(9,'seguridad','usuario'),(6,'sessions','session');
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
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2020-03-06 00:46:15.606299'),(2,'auth','0001_initial','2020-03-06 00:46:19.634369'),(3,'admin','0001_initial','2020-03-06 00:46:28.954938'),(4,'admin','0002_logentry_remove_auto_add','2020-03-06 00:46:31.312194'),(5,'admin','0003_logentry_add_action_flag_choices','2020-03-06 00:46:31.426095'),(6,'contenttypes','0002_remove_content_type_name','2020-03-06 00:46:32.936213'),(7,'auth','0002_alter_permission_name_max_length','2020-03-06 00:46:33.045592'),(8,'auth','0003_alter_user_email_max_length','2020-03-06 00:46:33.352193'),(9,'auth','0004_alter_user_username_opts','2020-03-06 00:46:33.466261'),(10,'auth','0005_alter_user_last_login_null','2020-03-06 00:46:34.120466'),(11,'auth','0006_require_contenttypes_0002','2020-03-06 00:46:34.203613'),(12,'auth','0007_alter_validators_add_error_messages','2020-03-06 00:46:34.266117'),(13,'auth','0008_alter_user_username_max_length','2020-03-06 00:46:34.427398'),(14,'auth','0009_alter_user_last_name_max_length','2020-03-06 00:46:34.556928'),(15,'auth','0010_alter_group_name_max_length','2020-03-06 00:46:34.702078'),(16,'auth','0011_update_proxy_permissions','2020-03-06 00:46:34.764581'),(17,'seguridad','0001_initial','2020-03-06 01:03:02.013800'),(18,'evaluacion','0001_initial','2020-03-06 01:03:07.724915'),(19,'sessions','0001_initial','2020-03-06 01:03:09.858129'),(20,'seguridad','0002_auto_20200321_1747','2020-03-21 17:47:20.583736'),(21,'seguridad','0003_auto_20200321_1804','2020-03-21 18:05:09.655591'),(22,'seguridad','0004_auto_20200321_1906','2020-03-21 19:06:53.290507'),(23,'seguridad','0005_auto_20200321_1908','2020-03-21 19:08:11.343331'),(24,'seguridad','0006_auto_20200321_1914','2020-03-21 19:14:57.428219'),(25,'seguridad','0007_auto_20200321_1935','2020-03-21 19:35:39.281086'),(26,'seguridad','0008_auto_20200321_1956','2020-03-21 19:56:19.599922'),(27,'seguridad','0009_permisos_estado','2020-03-21 21:56:00.249699'),(28,'seguridad','0010_auto_20200322_0012','2020-03-22 00:12:12.761166'),(29,'seguridad','0011_auto_20200322_0103','2020-03-22 01:03:18.061826'),(30,'seguridad','0012_auto_20200322_1252','2020-03-22 12:52:34.288153'),(31,'seguridad','0013_auto_20200322_1328','2020-03-22 13:28:26.545801'),(32,'seguridad','0014_auto_20200322_1926','2020-03-22 19:27:27.015312'),(33,'asignacion','0001_initial','2020-03-22 19:27:31.624125'),(34,'evaluacion','0002_auto_20200322_1926','2020-03-22 19:27:43.593432'),(35,'evaluacion','0003_auto_20200322_1931','2020-03-22 19:31:20.732064'),(36,'evaluacion','0004_auto_20200322_1932','2020-03-22 19:32:24.005361'),(37,'asignacion','0002_auto_20200323_1141','2020-03-23 11:42:33.142533'),(38,'asignacion','0003_auto_20200323_1318','2020-03-23 13:18:44.594218'),(39,'evaluacion','0005_auto_20200324_1159','2020-03-24 12:00:47.903856'),(40,'asignacion','0004_asignar_examen','2020-03-24 12:09:35.620948'),(41,'evaluacion','0006_anexos_nombre','2020-03-24 13:32:48.518856'),(42,'evaluacion','0007_auto_20200324_1619','2020-03-24 16:19:44.472214'),(43,'evaluacion','0008_auto_20200324_2103','2020-03-24 21:04:03.883893'),(44,'evaluacion','0009_auto_20200324_2108','2020-03-24 21:09:05.651108'),(45,'evaluacion','0010_auto_20200324_2306','2020-03-24 23:06:30.056193'),(46,'asignacion','0005_asignar_examen_estado','2020-03-25 00:47:54.434707'),(47,'seguridad','0015_menu_orden','2020-03-25 01:19:25.265030');
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('1jktbqvl4xnvxbns8wci10icjpcx9lrk','NTkyOGIxOTE0NmViODNkMjgxYmM1MTNjZGM1NDY0YzdiOWVhYTE1Zjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkODk1NDUxMjBlY2Q5OWMwOTgxZTg4NGI1MzhkYTRkOWQ3OGY3NmY5IiwidXN1YXJpbyI6MX0=','2020-04-07 12:24:45.196656'),('8w2c8xi48s5y8m8z72aye0ckmf40pwaf','MWIxMDMzMzEyMmE0MDdhN2MyNzFjNTE0MGFkZTAzYjlkYmEzNzBhNjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkODk1NDUxMjBlY2Q5OWMwOTgxZTg4NGI1MzhkYTRkOWQ3OGY3NmY5IiwidXN1YXJpbyI6M30=','2020-04-14 01:51:51.577484'),('axgl2t92k0vum9jq4942uwaqjuhjo3ch','ZTdhZWRlMWE0NGRlNzI4MTU2Nzg1NGVmMDNlZTIyYTI1NTZiZDZhZjp7InVzdWFyaW8iOjF9','2020-04-09 16:03:58.945424'),('eyo2znisi5a95lg2el1clkixqzweeae2','YWNkNmQzNmYxZjIyN2JmOTM0NzljMDI2YjA2OTkwZTM2ZGM4ZjZiYjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkODk1NDUxMjBlY2Q5OWMwOTgxZTg4NGI1MzhkYTRkOWQ3OGY3NmY5In0=','2020-04-05 13:52:03.749767'),('mc3jkrnohtvo6zh7lfv8sauahm8k969k','NTkyOGIxOTE0NmViODNkMjgxYmM1MTNjZGM1NDY0YzdiOWVhYTE1Zjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkODk1NDUxMjBlY2Q5OWMwOTgxZTg4NGI1MzhkYTRkOWQ3OGY3NmY5IiwidXN1YXJpbyI6MX0=','2020-04-06 16:04:58.231310'),('u3upzzc32kce2r64jv1s7cslibc754ll','YWNkNmQzNmYxZjIyN2JmOTM0NzljMDI2YjA2OTkwZTM2ZGM4ZjZiYjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkODk1NDUxMjBlY2Q5OWMwOTgxZTg4NGI1MzhkYTRkOWQ3OGY3NmY5In0=','2020-04-08 20:21:10.676045'),('xh2ui8ifwafkgdjyxuj0h66onb9yfn8r','ZTdhZWRlMWE0NGRlNzI4MTU2Nzg1NGVmMDNlZTIyYTI1NTZiZDZhZjp7InVzdWFyaW8iOjF9','2020-04-12 19:14:30.731221');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `examen`
--

DROP TABLE IF EXISTS `examen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `examen` (
  `id_examen` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `estado` varchar(45) DEFAULT NULL,
  `materia` int(11) NOT NULL,
  PRIMARY KEY (`id_examen`),
  KEY `examen_materia_d245d964_fk_materia_id_materia` (`materia`),
  CONSTRAINT `examen_materia_d245d964_fk_materia_id_materia` FOREIGN KEY (`materia`) REFERENCES `materia` (`id_materia`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `examen`
--

LOCK TABLES `examen` WRITE;
/*!40000 ALTER TABLE `examen` DISABLE KEYS */;
INSERT INTO `examen` VALUES (1,'Evaluacion de sumas logicas','ACTIVO',1);
/*!40000 ALTER TABLE `examen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materia`
--

DROP TABLE IF EXISTS `materia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `materia` (
  `id_materia` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) NOT NULL,
  `estado` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_materia`),
  UNIQUE KEY `descripcion` (`descripcion`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materia`
--

LOCK TABLES `materia` WRITE;
/*!40000 ALTER TABLE `materia` DISABLE KEYS */;
INSERT INTO `materia` VALUES (1,'Matematicas discretas','ACTIVO');
/*!40000 ALTER TABLE `materia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `id_menu` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `estado` varchar(50) NOT NULL,
  `url` varchar(60) NOT NULL,
  `menu_padre` int(11) DEFAULT NULL,
  `tipo_menu` varchar(45) NOT NULL,
  `orden` int(11) NOT NULL,
  PRIMARY KEY (`id_menu`),
  UNIQUE KEY `descripcion` (`nombre`),
  KEY `menu_menu_padre_74321b51_fk_menu_id_menu` (`menu_padre`),
  CONSTRAINT `menu_menu_padre_74321b51_fk_menu_id_menu` FOREIGN KEY (`menu_padre`) REFERENCES `menu` (`id_menu`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,'Configuraciones','ACTIVO','#',NULL,'PADRE',1),(3,'Gestionar usuarios','ACTIVO','seguridad:usuarios',1,'HIJO',2),(4,'Gestionar permisos','ACTIVO','seguridad:permisos',1,'HIJO',3),(5,'Gerstionar personas','ACTIVO','seguridad:personas',1,'HIJO',1),(6,'Estudiantes','ACTIVO','#',NULL,'PADRE',3),(7,'Cursos','ACTIVO','asignacion:cursos',8,'HIJO',5),(8,'Seccion profesor','ACTIVO','#',NULL,'PADRE',2),(9,'Gestion de estudiantes','ACTIVO','asignacion:alumnos',8,'HIJO',1),(10,'Gestion de examenes','ACTIVO','evaluacion:examenes',18,'HIJO',2),(12,'Gestion de opciones','ACTIVO','evaluacion:opciones',18,'HIJO',3),(13,'Gestion de preguntas','ACTIVO','evaluacion:preguntas',18,'HIJO',4),(14,'Asignar examenes','ACTIVO','asignacion:asignaciones',8,'HIJO',6),(16,'Realizar Examen','ACTIVO','evaluacion:ver_examenes',6,'HIJO',1),(17,'Materias','ACTIVO','evaluacion:materias',8,'HIJO',1),(18,'Examenes','ACTIVO','#',NULL,'PADRE',4);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opciones`
--

DROP TABLE IF EXISTS `opciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `opciones` (
  `id_opcion` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) NOT NULL,
  `estado` varchar(45) DEFAULT NULL,
  `respuesta` varchar(45) NOT NULL,
  PRIMARY KEY (`id_opcion`),
  UNIQUE KEY `opciones_descripcion_849af30b_uniq` (`descripcion`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opciones`
--

LOCK TABLES `opciones` WRITE;
/*!40000 ALTER TABLE `opciones` DISABLE KEYS */;
INSERT INTO `opciones` VALUES (5,'25','ACTIVO','CORRECTA'),(6,'35','ACTIVO','INCORRECTA'),(7,'45','ACTIVO','INCORRECTA'),(8,'2','ACTIVO','INCORRECTA'),(9,'Creo que la respuesta es 8','ACTIVO','CORRECTA'),(10,'La respuesta es 7','ACTIVO','INCORRECTA');
/*!40000 ALTER TABLE `opciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permiso_menu`
--

DROP TABLE IF EXISTS `permiso_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permiso_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permisos_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permiso_menu_permisos_id_menu_id_8b9a46fb_uniq` (`permisos_id`,`menu_id`),
  KEY `permiso_menu_menu_id_86e9674a_fk_menu_id_menu` (`menu_id`),
  CONSTRAINT `permiso_menu_menu_id_86e9674a_fk_menu_id_menu` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id_menu`),
  CONSTRAINT `permiso_menu_permisos_id_2d2c8803_fk_permisos_id_permiso` FOREIGN KEY (`permisos_id`) REFERENCES `permisos` (`id_permiso`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permiso_menu`
--

LOCK TABLES `permiso_menu` WRITE;
/*!40000 ALTER TABLE `permiso_menu` DISABLE KEYS */;
INSERT INTO `permiso_menu` VALUES (11,1,3),(12,1,4),(10,1,5),(36,1,7),(19,1,9),(23,1,10),(21,1,12),(22,1,13),(35,1,14),(24,1,17),(40,3,5),(25,3,7),(26,3,9),(27,3,10),(28,3,12),(29,3,13),(38,3,14),(30,3,17),(34,4,16),(15,5,3),(17,5,5),(31,5,9);
/*!40000 ALTER TABLE `permiso_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permisos`
--

DROP TABLE IF EXISTS `permisos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permisos` (
  `id_permiso` int(11) NOT NULL AUTO_INCREMENT,
  `id_rol` int(11) NOT NULL,
  `estado` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_permiso`),
  UNIQUE KEY `permisos_id_rol_36a0b654_uniq` (`id_rol`),
  CONSTRAINT `permisos_id_rol_36a0b654_fk_rol_id_rol` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permisos`
--

LOCK TABLES `permisos` WRITE;
/*!40000 ALTER TABLE `permisos` DISABLE KEYS */;
INSERT INTO `permisos` VALUES (1,2,'ACTIVO'),(3,3,'ACTIVO'),(4,4,'ACTIVO'),(5,5,'ACTIVO');
/*!40000 ALTER TABLE `permisos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persona`
--

DROP TABLE IF EXISTS `persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `persona` (
  `id_persona` int(11) NOT NULL AUTO_INCREMENT,
  `nombres` varchar(50) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `cedula` varchar(50) NOT NULL,
  `estado` varchar(50) DEFAULT NULL,
  `foto` varchar(100) NOT NULL,
  PRIMARY KEY (`id_persona`),
  UNIQUE KEY `persona_cedula_f74f5552_uniq` (`cedula`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` VALUES (4,'Mauricio','Santillan','0950596353','ACTIVO','usuarios_avatar/luffy.jpg'),(5,'pedro','moncayo','0950596344','ACTIVO','default/default_avatar.png'),(6,'Manuel','fonseca','0950597841','ACTIVO','default/default_avatar.png'),(7,'sdasd','sadasd','0950858778','ACTIVO','default/default_avatar.png');
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pregunta_opciones`
--

DROP TABLE IF EXISTS `pregunta_opciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pregunta_opciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pregunta_id` int(11) NOT NULL,
  `opciones_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pregunta_opciones_pregunta_id_opciones_id_d3f1c527_uniq` (`pregunta_id`,`opciones_id`),
  KEY `pregunta_opciones_opciones_id_8a0e7f09_fk_opciones_id_opcion` (`opciones_id`),
  CONSTRAINT `pregunta_opciones_opciones_id_8a0e7f09_fk_opciones_id_opcion` FOREIGN KEY (`opciones_id`) REFERENCES `opciones` (`id_opcion`),
  CONSTRAINT `pregunta_opciones_pregunta_id_e0695bf8_fk_preguntas_id_pregunta` FOREIGN KEY (`pregunta_id`) REFERENCES `preguntas` (`id_pregunta`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pregunta_opciones`
--

LOCK TABLES `pregunta_opciones` WRITE;
/*!40000 ALTER TABLE `pregunta_opciones` DISABLE KEYS */;
INSERT INTO `pregunta_opciones` VALUES (4,2,5),(5,2,6),(6,2,7),(9,3,6),(7,3,9),(8,3,10);
/*!40000 ALTER TABLE `pregunta_opciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `preguntas`
--

DROP TABLE IF EXISTS `preguntas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `preguntas` (
  `id_pregunta` int(11) NOT NULL AUTO_INCREMENT,
  `pregunta` longtext NOT NULL,
  `id_examen` int(11) NOT NULL,
  `anexo` longtext,
  `estado` varchar(50),
  PRIMARY KEY (`id_pregunta`),
  KEY `preguntas_id_examen_6304a803_fk_examen_id_examen` (`id_examen`),
  CONSTRAINT `preguntas_id_examen_6304a803_fk_examen_id_examen` FOREIGN KEY (`id_examen`) REFERENCES `examen` (`id_examen`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preguntas`
--

LOCK TABLES `preguntas` WRITE;
/*!40000 ALTER TABLE `preguntas` DISABLE KEYS */;
INSERT INTO `preguntas` VALUES (2,'cuanto es 12 + 13',1,'https://www.youtube.com/watch?v=2Iy92z6WOqI','ACTIVO'),(3,'cUAL ES EL RESULTADO DE LA RESTA DE 16 MENOS SU MITAD?',1,'https://www.youtube.com/watch?v=gWKDF592gbc','ACTIVO');
/*!40000 ALTER TABLE `preguntas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rol` (
  `id_rol` int(11) NOT NULL AUTO_INCREMENT,
  `rol_nombre` varchar(45) NOT NULL,
  `rol_estado` varchar(45) NOT NULL,
  PRIMARY KEY (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (2,'ADMINISTRADOR','ACTIVO'),(3,'PROFESOR','ACTIVO'),(4,'ALUMNO','ACTIVO'),(5,'EMPLEADO ADMINITRATIVO','ACTIVO');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(45) NOT NULL,
  `correo` varchar(80) DEFAULT NULL,
  `clave` varchar(45) NOT NULL,
  `estado` varchar(50) DEFAULT NULL,
  `id_persona` int(11) NOT NULL,
  `rol_usuario` int(11) NOT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `usuario_id_persona_dd575d1f_uniq` (`id_persona`),
  KEY `usuario_rol_usuario_c54bbc57_fk_rol_id_rol` (`rol_usuario`),
  CONSTRAINT `usuario_id_persona_dd575d1f_fk_persona_id_persona` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`id_persona`),
  CONSTRAINT `usuario_rol_usuario_c54bbc57_fk_rol_id_rol` FOREIGN KEY (`rol_usuario`) REFERENCES `rol` (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'admin','example@gmail.com','admin','ACTIVO',4,2),(2,'usuario','usuario@gmail.com','usuario','ACTIVO',5,4),(3,'profe','example@gmail.com','profe','ACTIVO',7,3);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'virtual_quiz'
--

--
-- Dumping routines for database 'virtual_quiz'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-03-31  1:54:53
