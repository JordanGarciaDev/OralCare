/*
SQLyog Ultimate v13.1.1 (64 bit)
MySQL - 10.4.32-MariaDB : Database - sgoc
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`sgoc` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `sgoc`;

/*Table structure for table `empleados` */

DROP TABLE IF EXISTS `empleados`;

CREATE TABLE `empleados` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nombre_completo` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tipo_doc` int(10) NOT NULL,
  `num_doc` varchar(100) NOT NULL,
  `lug_exp` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `fec_nacimiento` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nacionalidad` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sexo` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `estado_civil` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `dir_residencia` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `barrio_residencia` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ciudad_residencia` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tel_movil` bigint(20) NOT NULL,
  `email_personal` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email_empresarial` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `cargo_a_desempeñar` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`,`num_doc`),
  KEY `tipo_doc` (`tipo_doc`),
  CONSTRAINT `empleados_ibfk_1` FOREIGN KEY (`tipo_doc`) REFERENCES `tipo_de_documento` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_general_ci;

/*Data for the table `empleados` */

/*Table structure for table `perfiles` */

DROP TABLE IF EXISTS `perfiles`;

CREATE TABLE `perfiles` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `perfiles` */

insert  into `perfiles`(`id`,`nombre`) values 
(1,'Asesor Comercial Ventas'),
(2,'Anfitrion'),
(3,'Auxiliar contable '),
(4,'Coordinadora de Recursos Humanos '),
(5,'Asesor Comercial Seguimiento'),
(6,'Mantenimiento'),
(7,'Auxiliar de Aseo y Desinfección '),
(8,'Auxiliar de Odontología'),
(9,'Odontólogo General'),
(10,'Endodoncista'),
(11,'Implantólogo Oral'),
(12,'Rehabilitador Oral'),
(13,'Ortodoncista '),
(14,'Tecnico Electricista'),
(15,'Desarrollador Web'),
(16,'Gerente Comercial'),
(17,'Gerente General'),
(18,'Coordinador Administrativo '),
(19,'Coordinador de marketing'),
(20,'Recepciónista');

/*Table structure for table `tipo_de_documento` */

DROP TABLE IF EXISTS `tipo_de_documento`;

CREATE TABLE `tipo_de_documento` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `tipo_de_documento` */

insert  into `tipo_de_documento`(`id`,`nombre`) values 
(1,'Pasaporte'),
(2,'Documento de indetificacién para extranjeros'),
(3,'PEP'),
(4,'Registro Profesional'),
(5,'Carnet Diplomático'),
(6,'Salvocondcuto'),
(7,'Certificado de nacido vivo'),
(8,'Cédula de ciudadanía'),
(9,'NIT de otro país'),
(10,'Tarjeta de identidad'),
(11,'Cédula de extranjeria'),
(12,'Registro civil de nacimiento'),
(13,'Número único de identificación'),
(14,'Menor sin identificar'),
(15,'Adulto sin identificar'),
(16,'NIT');

/*Table structure for table `usuarios` */

DROP TABLE IF EXISTS `usuarios`;

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombres` varchar(200) DEFAULT NULL,
  `apellidos` varchar(200) DEFAULT NULL,
  `usuario` varchar(100) DEFAULT NULL,
  `pass` text DEFAULT NULL,
  `perfil` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `perfil` (`perfil`),
  CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`perfil`) REFERENCES `perfiles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `usuarios` */

insert  into `usuarios`(`id`,`nombres`,`apellidos`,`usuario`,`pass`,`perfil`,`fecha`) values 
(1,'Jordan','Dev','jgarcia','$2y$10$jQIj/EufiIZG03i65kImDuAvZShhlIkAHLE22sq5bhVtVW1TudG32',15,'2024-10-22 11:28:18');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
