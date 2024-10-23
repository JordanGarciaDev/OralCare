/*
SQLyog Ultimate
MySQL - 10.4.32-MariaDB : Database - sgoc
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`sgoc` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci */;

/*Table structure for table `usuarios` */

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombres` varchar(200) DEFAULT NULL,
  `apellidos` varchar(200) DEFAULT NULL,
  `usuario` varchar(100) DEFAULT NULL,
  `pass` text DEFAULT NULL,
  `perfil` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `usuarios` */

insert  into `usuarios`(`id`,`nombres`,`apellidos`,`usuario`,`pass`,`perfil`,`fecha`) values (1,'Jordan','Dev','jgarcia','$2y$10$jQIj/EufiIZG03i65kImDuAvZShhlIkAHLE22sq5bhVtVW1TudG32',0,'2024-10-22 11:28:18');
insert  into `usuarios`(`id`,`nombres`,`apellidos`,`usuario`,`pass`,`perfil`,`fecha`) values (2,'Daniel','Marquez','dmarquez',NULL,0,'2024-10-23 14:29:34');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
