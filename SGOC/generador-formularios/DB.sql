/*
SQLyog Ultimate
MySQL - 10.4.32-MariaDB : Database - formulario
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `academic_history` */

CREATE TABLE `academic_history` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `student_id` int(30) NOT NULL,
  `course_id` int(30) NOT NULL,
  `semester` varchar(200) NOT NULL,
  `year` varchar(200) NOT NULL,
  `school_year` text NOT NULL,
  `status` int(10) NOT NULL DEFAULT 1 COMMENT '1= New,\r\n2= Regular,\r\n3= Returnee,\r\n4= Transferee',
  `end_status` tinyint(3) NOT NULL DEFAULT 0 COMMENT '0=pending,\r\n1=Completed,\r\n2=Dropout,\r\n3=failed,\r\n4=Transferred-out,\r\n5=Graduated',
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `student_id` (`student_id`),
  KEY `course_id` (`course_id`),
  CONSTRAINT `academic_history_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student_list` (`id`) ON DELETE CASCADE,
  CONSTRAINT `academic_history_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `course_list` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `academic_history` */

insert  into `academic_history`(`id`,`student_id`,`course_id`,`semester`,`year`,`school_year`,`status`,`end_status`,`date_created`,`date_updated`) values (1,1,11,'First Semester','1st Year','2018-2019',1,1,'2022-01-27 13:02:36','2022-01-27 13:22:31');
insert  into `academic_history`(`id`,`student_id`,`course_id`,`semester`,`year`,`school_year`,`status`,`end_status`,`date_created`,`date_updated`) values (2,1,11,'Second Semester','1st Year','2018-2019',2,1,'2022-01-27 13:22:24','2022-01-27 13:22:44');
insert  into `academic_history`(`id`,`student_id`,`course_id`,`semester`,`year`,`school_year`,`status`,`end_status`,`date_created`,`date_updated`) values (3,1,11,'Third Semester','1st Year','2018-2019',2,1,'2022-01-27 13:23:32',NULL);
insert  into `academic_history`(`id`,`student_id`,`course_id`,`semester`,`year`,`school_year`,`status`,`end_status`,`date_created`,`date_updated`) values (5,1,11,'First Semester','2nd Year','2019-2020',2,1,'2022-01-27 13:28:01',NULL);
insert  into `academic_history`(`id`,`student_id`,`course_id`,`semester`,`year`,`school_year`,`status`,`end_status`,`date_created`,`date_updated`) values (6,1,11,'Second Semester','2nd Year','2019-2020',2,1,'2022-01-27 13:28:26',NULL);
insert  into `academic_history`(`id`,`student_id`,`course_id`,`semester`,`year`,`school_year`,`status`,`end_status`,`date_created`,`date_updated`) values (7,1,11,'Third Semester','2nd Year','2019-2020',2,2,'2022-01-27 13:28:52',NULL);
insert  into `academic_history`(`id`,`student_id`,`course_id`,`semester`,`year`,`school_year`,`status`,`end_status`,`date_created`,`date_updated`) values (8,3,1,'First Semester','1','1999',1,0,'2022-03-18 21:39:05',NULL);

/*Table structure for table `accounts` */

CREATE TABLE `accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` tinytext NOT NULL,
  `password` text NOT NULL,
  `email` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

/*Data for the table `accounts` */

insert  into `accounts`(`id`,`username`,`password`,`email`) values (1,'configuroweb','1234abcd..','hola@configuroweb.com');

/*Table structure for table `admin` */

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `password` varchar(500) NOT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `admin` */

insert  into `admin`(`admin_id`,`email`,`password`) values (2,'hola@configuroweb.com','1234abcd..');

/*Table structure for table `admit_invo_db` */

CREATE TABLE `admit_invo_db` (
  `Invo_no` int(11) NOT NULL AUTO_INCREMENT,
  `pet_no` int(11) NOT NULL,
  `pet_name` varchar(100) NOT NULL,
  `p_age` int(3) NOT NULL,
  `price_of_med` int(11) NOT NULL,
  `price_of_doc` int(11) NOT NULL,
  `day_count` int(11) NOT NULL,
  `price_of_room` int(11) NOT NULL,
  `ser_char` int(11) NOT NULL,
  `totl` int(11) NOT NULL,
  `invo_date` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`Invo_no`),
  KEY `pet_no` (`pet_no`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `admit_invo_db` */

insert  into `admit_invo_db`(`Invo_no`,`pet_no`,`pet_name`,`p_age`,`price_of_med`,`price_of_doc`,`day_count`,`price_of_room`,`ser_char`,`totl`,`invo_date`) values (1,1,'Juan Galan',26,500,500,20,20000,500,21500,'2020-08-10 18:38:18');
insert  into `admit_invo_db`(`Invo_no`,`pet_no`,`pet_name`,`p_age`,`price_of_med`,`price_of_doc`,`day_count`,`price_of_room`,`ser_char`,`totl`,`invo_date`) values (2,2,'Omar Estrada',27,125000,452000,8,8000,500,585500,'2020-08-11 16:13:32');

/*Table structure for table `admit_pet` */

CREATE TABLE `admit_pet` (
  `admit_petid` int(11) NOT NULL AUTO_INCREMENT,
  `admit_name` varchar(500) NOT NULL,
  `admit_age` int(3) NOT NULL,
  `admit_con` varchar(15) NOT NULL,
  `admit_bg` varchar(3) NOT NULL,
  `admit_rn` varchar(10) NOT NULL,
  `pet_id` int(11) NOT NULL,
  `admit_date` date NOT NULL,
  `pet_des` varchar(100) NOT NULL,
  PRIMARY KEY (`admit_petid`),
  KEY `pet_id` (`pet_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `admit_pet` */

insert  into `admit_pet`(`admit_petid`,`admit_name`,`admit_age`,`admit_con`,`admit_bg`,`admit_rn`,`pet_id`,`admit_date`,`pet_des`) values (5,'Julian Cardozo',34,'+57 301258794','O+','2',3,'2020-08-11','Fatiga');

/*Table structure for table `answer` */

CREATE TABLE `answer` (
  `qid` text NOT NULL,
  `ansid` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `answer` */

insert  into `answer`(`qid`,`ansid`) values ('5f87bb9fb8c08','5f87bb9fb92e8');
insert  into `answer`(`qid`,`ansid`) values ('5f87bb9fbadb5','5f87bb9fbb1e6');
insert  into `answer`(`qid`,`ansid`) values ('5f87bb9fbc859','5f87bb9fbd53b');
insert  into `answer`(`qid`,`ansid`) values ('5f87bb9fbeb8d','5f87bb9fbefe8');
insert  into `answer`(`qid`,`ansid`) values ('5f87bb9fc0bb9','5f87bb9fc10e8');
insert  into `answer`(`qid`,`ansid`) values ('5f88b43712884','5f88b43714dbe');
insert  into `answer`(`qid`,`ansid`) values ('5f88b43761aa1','5f88b437621f3');

/*Table structure for table `appointments` */

CREATE TABLE `appointments` (
  `appointment_id` int(5) NOT NULL AUTO_INCREMENT,
  `date_created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `client_id` int(5) NOT NULL,
  `employee_id` int(2) NOT NULL,
  `start_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `end_time_expected` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `canceled` tinyint(1) NOT NULL DEFAULT 0,
  `cancellation_reason` text DEFAULT NULL,
  PRIMARY KEY (`appointment_id`),
  KEY `FK_client_appointment` (`client_id`),
  KEY `FK_employee_appointment` (`employee_id`),
  CONSTRAINT `FK_client_appointment` FOREIGN KEY (`client_id`) REFERENCES `clients` (`client_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_employee_appointment` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `appointments` */

insert  into `appointments`(`appointment_id`,`date_created`,`client_id`,`employee_id`,`start_time`,`end_time_expected`,`canceled`,`cancellation_reason`) values (10,'2021-02-06 08:40:00',11,3,'2021-02-08 04:30:00','2021-02-08 04:50:00',0,NULL);
insert  into `appointments`(`appointment_id`,`date_created`,`client_id`,`employee_id`,`start_time`,`end_time_expected`,`canceled`,`cancellation_reason`) values (11,'2021-03-20 03:22:00',12,3,'2021-03-22 01:00:00','2021-03-22 01:20:00',0,NULL);
insert  into `appointments`(`appointment_id`,`date_created`,`client_id`,`employee_id`,`start_time`,`end_time_expected`,`canceled`,`cancellation_reason`) values (12,'2022-09-19 23:32:00',15,2,'2022-09-24 09:15:00','2022-09-24 09:25:00',0,NULL);
insert  into `appointments`(`appointment_id`,`date_created`,`client_id`,`employee_id`,`start_time`,`end_time_expected`,`canceled`,`cancellation_reason`) values (13,'2022-09-20 17:11:00',16,1,'2022-09-21 09:15:00','2022-09-21 09:35:00',0,NULL);
insert  into `appointments`(`appointment_id`,`date_created`,`client_id`,`employee_id`,`start_time`,`end_time_expected`,`canceled`,`cancellation_reason`) values (14,'2022-09-20 23:34:00',17,1,'2022-09-22 09:45:00','2022-09-22 10:00:00',0,NULL);

/*Table structure for table `author` */

CREATE TABLE `author` (
  `authorid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `status` enum('Enable','Disable') NOT NULL,
  PRIMARY KEY (`authorid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `author` */

insert  into `author`(`authorid`,`name`,`status`) values (2,'Alan Forbes','Enable');
insert  into `author`(`authorid`,`name`,`status`) values (3,'Lynn Beighley &amp; Michael Morrison','Enable');
insert  into `author`(`authorid`,`name`,`status`) values (4,'Luis Miguel Cabezas Granado','Enable');

/*Table structure for table `barber_admin` */

CREATE TABLE `barber_admin` (
  `admin_id` int(5) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `full_name` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`admin_id`),
  UNIQUE KEY `username` (`username`,`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `barber_admin` */

insert  into `barber_admin`(`admin_id`,`username`,`email`,`full_name`,`password`) values (1,'configuroweb','hola@configuroweb.com','Mauricio Sevilla','ad4bedc9f4f98e0513315bcfd543e4f8e2c00a77');

/*Table structure for table `book` */

CREATE TABLE `book` (
  `bookid` int(11) NOT NULL AUTO_INCREMENT,
  `categoryid` int(11) NOT NULL,
  `authorid` int(11) NOT NULL,
  `rackid` int(11) NOT NULL,
  `name` text NOT NULL,
  `picture` varchar(250) NOT NULL,
  `publisherid` int(11) NOT NULL,
  `isbn` varchar(30) NOT NULL,
  `no_of_copy` int(5) NOT NULL,
  `status` enum('Enable','Disable') NOT NULL,
  `added_on` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_on` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`bookid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `book` */

insert  into `book`(`bookid`,`categoryid`,`authorid`,`rackid`,`name`,`picture`,`publisherid`,`isbn`,`no_of_copy`,`status`,`added_on`,`updated_on`) values (1,2,2,2,'The Joy of PHP Programming','joy-php.jpg',8,'B00BALXN70',10,'Enable','2022-06-12 11:12:48','2022-06-12 11:13:27');
insert  into `book`(`bookid`,`categoryid`,`authorid`,`rackid`,`name`,`picture`,`publisherid`,`isbn`,`no_of_copy`,`status`,`added_on`,`updated_on`) values (2,2,3,2,'Head First PHP &amp;amp; MySQL','header-first-php.jpg',9,'0596006306',10,'Enable','2022-06-12 11:16:01','2022-06-12 11:16:01');
insert  into `book`(`bookid`,`categoryid`,`authorid`,`rackid`,`name`,`picture`,`publisherid`,`isbn`,`no_of_copy`,`status`,`added_on`,`updated_on`) values (3,2,4,2,'Curso de PHP 8 Y MySQL 8: Manual Imprescindible','',10,'9788441543720',23,'Enable','2022-06-12 13:29:14','2022-06-12 13:29:14');

/*Table structure for table `book_issue_log` */

CREATE TABLE `book_issue_log` (
  `issue_id` int(11) NOT NULL AUTO_INCREMENT,
  `member` varchar(20) NOT NULL,
  `book_isbn` varchar(13) NOT NULL,
  `due_date` date NOT NULL,
  `last_reminded` date DEFAULT NULL,
  PRIMARY KEY (`issue_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `book_issue_log` */

/*Table structure for table `branch` */

CREATE TABLE `branch` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `branch` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `detail` text NOT NULL,
  `delete_status` enum('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `branch` */

insert  into `branch`(`id`,`branch`,`address`,`detail`,`delete_status`) values (1,'Banco Falabella','Calle 54 N 35 23','Excelente banco no cobra por cuota de manejo ni por sacar el dinero de cajeros automáticos.','0');
insert  into `branch`(`id`,`branch`,`address`,`detail`,`delete_status`) values (2,'Banco Colpatria','Calle 88 N 123 - 12','Excelente bancos, tampoco cobra cuota de manejo, ni por sacar dinero de sus cajero automáticos.','0');
insert  into `branch`(`id`,`branch`,`address`,`detail`,`delete_status`) values (6,'Bancolombia','Calle 34 N 18 - 14','Es el banco que tiene más personas en Colombia, tiene cajeros y sucursales en todas partes, pero tiene cargos en sus cuentas, por movimientos y por cuota de manejo.','0');

/*Table structure for table `brands` */

CREATE TABLE `brands` (
  `brand_id` int(11) NOT NULL AUTO_INCREMENT,
  `brand_name` varchar(255) NOT NULL,
  `brand_active` int(11) NOT NULL DEFAULT 0,
  `brand_status` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`brand_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `brands` */

insert  into `brands`(`brand_id`,`brand_name`,`brand_active`,`brand_status`) values (1,'Cipla',1,1);
insert  into `brands`(`brand_id`,`brand_name`,`brand_active`,`brand_status`) values (2,'Mankind',1,1);
insert  into `brands`(`brand_id`,`brand_name`,`brand_active`,`brand_status`) values (3,'Sunpharma',1,1);
insert  into `brands`(`brand_id`,`brand_name`,`brand_active`,`brand_status`) values (4,'MicroLabs',1,1);
insert  into `brands`(`brand_id`,`brand_name`,`brand_active`,`brand_status`) values (5,'Pfizer',1,1);

/*Table structure for table `categories` */

CREATE TABLE `categories` (
  `categories_id` int(11) NOT NULL AUTO_INCREMENT,
  `categories_name` varchar(255) NOT NULL,
  `categories_active` int(11) NOT NULL DEFAULT 0,
  `categories_status` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`categories_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `categories` */

insert  into `categories`(`categories_id`,`categories_name`,`categories_active`,`categories_status`) values (1,'Dulceria',1,1);
insert  into `categories`(`categories_id`,`categories_name`,`categories_active`,`categories_status`) values (2,'Picantes',1,1);
insert  into `categories`(`categories_id`,`categories_name`,`categories_active`,`categories_status`) values (3,'Salados',1,1);
insert  into `categories`(`categories_id`,`categories_name`,`categories_active`,`categories_status`) values (4,'Salsas',1,1);
insert  into `categories`(`categories_id`,`categories_name`,`categories_active`,`categories_status`) values (5,'Especias',1,1);
insert  into `categories`(`categories_id`,`categories_name`,`categories_active`,`categories_status`) values (6,'Verduras',1,1);
insert  into `categories`(`categories_id`,`categories_name`,`categories_active`,`categories_status`) values (7,'Frutas',1,1);

/*Table structure for table `category` */

CREATE TABLE `category` (
  `categoryid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `status` enum('Enable','Disable') NOT NULL,
  PRIMARY KEY (`categoryid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `category` */

insert  into `category`(`categoryid`,`name`,`status`) values (1,'Web Design','Enable');
insert  into `category`(`categoryid`,`name`,`status`) values (2,'Programming','Enable');
insert  into `category`(`categoryid`,`name`,`status`) values (3,'Commerce','Enable');
insert  into `category`(`categoryid`,`name`,`status`) values (4,'Math','Enable');
insert  into `category`(`categoryid`,`name`,`status`) values (6,'Web Development','Enable');

/*Table structure for table `chatbot` */

CREATE TABLE `chatbot` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `queries` varchar(300) NOT NULL,
  `replies` varchar(300) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `chatbot` */

insert  into `chatbot`(`id`,`queries`,`replies`) values (1,'Hola me podrías ayudar? Tengo una consulta','Claro estoy para servirte en lo que requieras');
insert  into `chatbot`(`id`,`queries`,`replies`) values (2,'No tengo acceso a Internet','Vale te pregunto, donde te encuentras ahora, ¿hay más dispositivos conectados a tu red local?');
insert  into `chatbot`(`id`,`queries`,`replies`) values (3,'Si claro tengo dos teléfonos, pero ninguno tiene acceso a Internet tampoco','Tienes algún ordenador conectado por cable');
insert  into `chatbot`(`id`,`queries`,`replies`) values (4,'Si, claro, requieres que lo encienda?','Si por favor y me confirmas si no tienes acceso a Internet, en tu ordenador cuando encienda');
insert  into `chatbot`(`id`,`queries`,`replies`) values (5,'Te confirmo que tampoco tiene Internet','Reinicia tu modem, espera 10 minutos y reintenta, me confirmas');
insert  into `chatbot`(`id`,`queries`,`replies`) values (6,'Ya me funciona el Internet, muchas gracias','Excelente me alegro mucho, gracias por comunicarte con Soporte Técnico ChatBot ConfiguroWeb');

/*Table structure for table `clientes` */

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `address` text NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `status` enum('1','0') NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `clientes` */

insert  into `clientes`(`id`,`name`,`email`,`phone`,`address`,`created`,`modified`,`status`) values (1,'ConfiguroWeb','hola@configuroweb.com','3022589741','Cali','2022-02-17 08:21:25','2018-02-17 08:21:25','1');

/*Table structure for table `clients` */

CREATE TABLE `clients` (
  `client_id` int(5) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `phone_number` varchar(30) NOT NULL,
  `client_email` varchar(50) NOT NULL,
  PRIMARY KEY (`client_id`),
  UNIQUE KEY `client_email` (`client_email`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `clients` */

insert  into `clients`(`client_id`,`first_name`,`last_name`,`phone_number`,`client_email`) values (1,'Juan','Cliente','3052589741','jcliente@cweb.com');
insert  into `clients`(`client_id`,`first_name`,`last_name`,`phone_number`,`client_email`) values (2,'Andres','Cliente','3125896471','acliente@cweb.com');
insert  into `clients`(`client_id`,`first_name`,`last_name`,`phone_number`,`client_email`) values (3,'Diego','Cliente','3052467194','dcliente@cweb.com');
insert  into `clients`(`client_id`,`first_name`,`last_name`,`phone_number`,`client_email`) values (4,'Adriana','Cliente','3064589741','adcliente@cweb.com');
insert  into `clients`(`client_id`,`first_name`,`last_name`,`phone_number`,`client_email`) values (5,'Demetrio','Clemente','3125467141','dclemente@cweb.com');
insert  into `clients`(`client_id`,`first_name`,`last_name`,`phone_number`,`client_email`) values (7,'Artemio','Lucian','3236205984','alucian@cweb.com');
insert  into `clients`(`client_id`,`first_name`,`last_name`,`phone_number`,`client_email`) values (8,'Emiliano','Sanchez','3069857431','esanchez@cweb.com');
insert  into `clients`(`client_id`,`first_name`,`last_name`,`phone_number`,`client_email`) values (11,'Carlos','Garcia','3159874161','cgarcia@cweb.com');
insert  into `clients`(`client_id`,`first_name`,`last_name`,`phone_number`,`client_email`) values (12,'Jhon','Juan','3056489721','jjuan@cweb.com');
insert  into `clients`(`client_id`,`first_name`,`last_name`,`phone_number`,`client_email`) values (15,'Pedro','Usuario','3025897410','pusuario@cweb.com');
insert  into `clients`(`client_id`,`first_name`,`last_name`,`phone_number`,`client_email`) values (16,'Martin','Estudiante','3052659784','mestudiante@cweb.com');
insert  into `clients`(`client_id`,`first_name`,`last_name`,`phone_number`,`client_email`) values (17,'Rafael','Pereira','3062589437','rpereira@cweb.com');

/*Table structure for table `course_list` */

CREATE TABLE `course_list` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `department_id` int(30) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `department_id` (`department_id`),
  CONSTRAINT `course_list_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `department_list` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `course_list` */

insert  into `course_list`(`id`,`department_id`,`name`,`description`,`status`,`delete_flag`,`date_created`,`date_updated`) values (1,2,'Teatro','El teatro (del griego “lugar para contemplar”) es la rama del arte escénico relacionada con la actuación, que representa historias frente a una audiencia usando una combinación de discurso, gestos, escenografía, música, sonido y espectáculo',1,0,'2022-01-27 10:03:25','2022-03-18 21:52:08');
insert  into `course_list`(`id`,`department_id`,`name`,`description`,`status`,`delete_flag`,`date_created`,`date_updated`) values (2,4,'Administración Empresas','La administración de empresas es un método y práctica organizacional basado en la gestión de sociedades mercantiles con el objetivo de llevarlas a su mayor optimización posible.',1,0,'2022-01-27 10:06:43','2022-03-18 21:47:26');
insert  into `course_list`(`id`,`department_id`,`name`,`description`,`status`,`delete_flag`,`date_created`,`date_updated`) values (3,4,'Gestión Negocios','Gestión de Negocios',1,0,'2022-01-27 10:07:21','2022-03-18 21:51:32');
insert  into `course_list`(`id`,`department_id`,`name`,`description`,`status`,`delete_flag`,`date_created`,`date_updated`) values (4,4,'Danza','“La danza es un movimiento puesto en forma rítmica y espacial, una sucesión de movimientos que comienza, se desarrolla y finaliza”. (Murray, 1974). “Cualquier forma de movimiento que no tenga otra intención para alén de la expresión de sentimientos, de sensaciones o pensamientos, puede ser considerada como danza”.',1,0,'2022-01-27 10:07:52','2022-03-18 21:57:45');
insert  into `course_list`(`id`,`department_id`,`name`,`description`,`status`,`delete_flag`,`date_created`,`date_updated`) values (5,4,'Administración Hotelera','La Administración Hotelera y Gastronómica es una profesión que permite desarrollar múltiples competencias de gestión y dirección estratégica de empresas hoteleras y otras asociadas con el turismo.',1,0,'2022-01-27 10:08:21','2022-03-18 22:01:08');
insert  into `course_list`(`id`,`department_id`,`name`,`description`,`status`,`delete_flag`,`date_created`,`date_updated`) values (6,1,'Enfermería','La enfermería abarca abarca los cuidados autónomos y en colaboración que se prestan a las personas de todas las edades, familias, grupos y comunidades, enfermas o sanas, en todos los contextos, e incluye la promoción de la salud, la prevención de la enfermedad y los cuidados de los enfermos, discapacitados y personas moribundas. Funciones esenciales de la enfermería son la defensa, el fomento de un entorno seguro, la investigación, la participación en las políticas de salud y en la gestión de los pacientes y los sistemas de salud, y la formación. (CIE, 2002)',1,0,'2022-01-27 10:08:48','2022-03-18 21:49:27');
insert  into `course_list`(`id`,`department_id`,`name`,`description`,`status`,`delete_flag`,`date_created`,`date_updated`) values (7,3,'Física','El autor se centra en la apariencia externa del personaje, es decir, describe las características físicas de una persona. Este tipo de descripción también se denomina prosopografía.',1,0,'2022-01-27 10:09:00','2022-03-18 21:59:39');
insert  into `course_list`(`id`,`department_id`,`name`,`description`,`status`,`delete_flag`,`date_created`,`date_updated`) values (8,1,'Medicina','Bachelor of Science in Chemical Engineering',1,0,'2022-01-27 10:09:35','2022-03-18 21:47:59');
insert  into `course_list`(`id`,`department_id`,`name`,`description`,`status`,`delete_flag`,`date_created`,`date_updated`) values (9,1,'Quimico','La química es el estudio científico de la materia.  Cómo se hicieron o estudiar la composición de una viga de acero para determinar su resistencia.',1,0,'2022-01-27 10:10:16','2022-03-18 21:58:58');
insert  into `course_list`(`id`,`department_id`,`name`,`description`,`status`,`delete_flag`,`date_created`,`date_updated`) values (10,1,'Veterinaria','La función principal del/la médico/a veterinario/a es la de diagnosticar, pronosticar, tratar y prevenir las enfermedades que afectan a los animales domésticos, de experimentación, exóticos, salvajes y ganaderos.',1,0,'2022-01-27 10:10:39','2022-03-18 21:52:46');
insert  into `course_list`(`id`,`department_id`,`name`,`description`,`status`,`delete_flag`,`date_created`,`date_updated`) values (11,1,'Psicología','La psicología es la ciencia que estudia los procesos mentales. La palabra proviene del griego: psico- (alma o actividad mental) y -logía (estudio). Esta disciplina analiza las tres dimensiones de los mencionados procesos: cognitiva, afectiva y conductual.',1,0,'2022-01-27 10:12:23','2022-03-18 21:50:44');
insert  into `course_list`(`id`,`department_id`,`name`,`description`,`status`,`delete_flag`,`date_created`,`date_updated`) values (12,1,'Bio Fisica','La biofísica estudia la vida en todos sus niveles, desde los átomos y moleculas hasta las células, organismoa y ambiente. A medida que progresa la física y la biología, los biofísicos encuentran nuevas áreas para explorar y aplicar su experiencia, crear nuevas herramientas y sobre todo aprender.',1,0,'2022-01-27 10:12:35','2022-03-18 22:00:21');

/*Table structure for table `courses` */

CREATE TABLE `courses` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `course` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `level` varchar(150) NOT NULL,
  `total_amount` float NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `courses` */

insert  into `courses`(`id`,`course`,`description`,`level`,`total_amount`,`date_created`) values (1,'Trabajo en Alturas','Se explican las bases mínimas para realizar a nivel básico el trabajo sobre alturas.','I',6200,'2022-05-09 22:47:56');
insert  into `courses`(`id`,`course`,`description`,`level`,`total_amount`,`date_created`) values (2,'Tratamiento de Alimentos','Se explica la ética de tratamientos mínimos para gestionar alimentos.','2',5000,'2022-05-16 17:13:05');

/*Table structure for table `department_list` */

CREATE TABLE `department_list` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `department_list` */

insert  into `department_list`(`id`,`name`,`description`,`status`,`delete_flag`,`date_created`,`date_updated`) values (1,'Salud','Salud',1,0,'2022-01-27 09:22:31','2022-03-18 21:42:51');
insert  into `department_list`(`id`,`name`,`description`,`status`,`delete_flag`,`date_created`,`date_updated`) values (2,'Artes','Artes Integradas',1,0,'2022-01-27 09:22:54','2022-03-18 21:41:25');
insert  into `department_list`(`id`,`name`,`description`,`status`,`delete_flag`,`date_created`,`date_updated`) values (3,'Ciencias E','Ciencias Naturales y Exactas',1,0,'2022-01-27 09:23:20','2022-03-18 21:41:52');
insert  into `department_list`(`id`,`name`,`description`,`status`,`delete_flag`,`date_created`,`date_updated`) values (4,'Ciencias A','Ciencias de la Administración',1,0,'2022-01-27 09:25:42','2022-03-18 21:42:17');
insert  into `department_list`(`id`,`name`,`description`,`status`,`delete_flag`,`date_created`,`date_updated`) values (5,'Ciencias S','Ciencias Sociales y Económicas',1,0,'2022-01-27 09:26:35','2022-03-18 21:43:24');
insert  into `department_list`(`id`,`name`,`description`,`status`,`delete_flag`,`date_created`,`date_updated`) values (6,'Sample101','Deleted Department',1,1,'2022-01-27 09:27:17','2022-01-27 09:27:28');

/*Table structure for table `employees` */

CREATE TABLE `employees` (
  `employee_id` int(2) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `phone_number` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `employees` */

insert  into `employees`(`employee_id`,`first_name`,`last_name`,`phone_number`,`email`) values (1,'Juan','Peluquero','3025894671','jpeluquero@cweb.com');
insert  into `employees`(`employee_id`,`first_name`,`last_name`,`phone_number`,`email`) values (2,'Pedro','Peluquero','3052589741','ppeluquero@cweb.com');
insert  into `employees`(`employee_id`,`first_name`,`last_name`,`phone_number`,`email`) values (3,'Adriana','Peluquera','3052589741','apeluquera@cweb.com');

/*Table structure for table `employees_schedule` */

CREATE TABLE `employees_schedule` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `employee_id` int(2) NOT NULL,
  `day_id` tinyint(1) NOT NULL,
  `from_hour` time NOT NULL,
  `to_hour` time NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_emp` (`employee_id`),
  CONSTRAINT `FK_emp` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `employees_schedule` */

insert  into `employees_schedule`(`id`,`employee_id`,`day_id`,`from_hour`,`to_hour`) values (41,1,1,'09:00:00','18:00:00');
insert  into `employees_schedule`(`id`,`employee_id`,`day_id`,`from_hour`,`to_hour`) values (42,1,2,'14:00:00','22:00:00');
insert  into `employees_schedule`(`id`,`employee_id`,`day_id`,`from_hour`,`to_hour`) values (43,1,3,'09:00:00','18:00:00');
insert  into `employees_schedule`(`id`,`employee_id`,`day_id`,`from_hour`,`to_hour`) values (44,1,4,'00:00:00','20:00:00');
insert  into `employees_schedule`(`id`,`employee_id`,`day_id`,`from_hour`,`to_hour`) values (45,1,5,'09:00:00','18:00:00');
insert  into `employees_schedule`(`id`,`employee_id`,`day_id`,`from_hour`,`to_hour`) values (46,1,6,'09:00:00','18:00:00');
insert  into `employees_schedule`(`id`,`employee_id`,`day_id`,`from_hour`,`to_hour`) values (47,1,7,'09:00:00','18:00:00');
insert  into `employees_schedule`(`id`,`employee_id`,`day_id`,`from_hour`,`to_hour`) values (55,3,1,'09:00:00','18:00:00');
insert  into `employees_schedule`(`id`,`employee_id`,`day_id`,`from_hour`,`to_hour`) values (56,3,2,'09:00:00','18:00:00');
insert  into `employees_schedule`(`id`,`employee_id`,`day_id`,`from_hour`,`to_hour`) values (57,3,3,'09:00:00','18:00:00');
insert  into `employees_schedule`(`id`,`employee_id`,`day_id`,`from_hour`,`to_hour`) values (58,3,4,'09:00:00','18:00:00');
insert  into `employees_schedule`(`id`,`employee_id`,`day_id`,`from_hour`,`to_hour`) values (59,3,5,'09:00:00','18:00:00');
insert  into `employees_schedule`(`id`,`employee_id`,`day_id`,`from_hour`,`to_hour`) values (60,3,6,'09:00:00','18:00:00');
insert  into `employees_schedule`(`id`,`employee_id`,`day_id`,`from_hour`,`to_hour`) values (61,3,7,'09:00:00','17:00:00');
insert  into `employees_schedule`(`id`,`employee_id`,`day_id`,`from_hour`,`to_hour`) values (62,2,1,'09:00:00','17:00:00');
insert  into `employees_schedule`(`id`,`employee_id`,`day_id`,`from_hour`,`to_hour`) values (63,2,2,'09:00:00','18:00:00');
insert  into `employees_schedule`(`id`,`employee_id`,`day_id`,`from_hour`,`to_hour`) values (64,2,3,'09:00:00','18:00:00');
insert  into `employees_schedule`(`id`,`employee_id`,`day_id`,`from_hour`,`to_hour`) values (65,2,4,'09:00:00','18:00:00');
insert  into `employees_schedule`(`id`,`employee_id`,`day_id`,`from_hour`,`to_hour`) values (66,2,5,'09:00:00','18:00:00');
insert  into `employees_schedule`(`id`,`employee_id`,`day_id`,`from_hour`,`to_hour`) values (67,2,6,'09:00:00','18:00:00');
insert  into `employees_schedule`(`id`,`employee_id`,`day_id`,`from_hour`,`to_hour`) values (68,2,7,'09:00:00','18:00:00');

/*Table structure for table `feedback` */

CREATE TABLE `feedback` (
  `id` text NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `subject` varchar(500) NOT NULL,
  `feedback` varchar(500) NOT NULL,
  `date` date NOT NULL,
  `time` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `feedback` */

insert  into `feedback`(`id`,`name`,`email`,`subject`,`feedback`,`date`,`time`) values ('5f87ca01c593b','Usuario','configuroweb@gmail.com','problemas con la pregunta 3','no estoy de acuerdo con la pregunta 3, no me parece una opción exacta, sería mejor una pregunta abierta.','2020-10-15','06:03:13am');
insert  into `feedback`(`id`,`name`,`email`,`subject`,`feedback`,`date`,`time`) values ('5f88c9bea1954','Juan Ramón','jramon@cweb.com','tengo problemas para registrarme','Realizo el proceso, pero no puedo acceder tal vez estoy haciendo algo mal, saludos.','2020-10-16','12:14:22am');

/*Table structure for table `feedbacks` */

CREATE TABLE `feedbacks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_student_id` int(11) NOT NULL,
  `user_professor_id` int(11) NOT NULL,
  `msg` text NOT NULL,
  `grade` varchar(100) NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `feedbacks` */

insert  into `feedbacks`(`id`,`user_student_id`,`user_professor_id`,`msg`,`grade`,`created`) values (16,8,9,'Muy buena persona, con mucho conocimiento.','Muy bueno','2016-03-20 16:55:05');
insert  into `feedbacks`(`id`,`user_student_id`,`user_professor_id`,`msg`,`grade`,`created`) values (17,10,10,'Dicta su catedra con viejos estándares, nos gustaría se esforzara en enseñarnos algo mejor.','Excelente','2016-04-23 18:22:15');
insert  into `feedbacks`(`id`,`user_student_id`,`user_professor_id`,`msg`,`grade`,`created`) values (18,11,9,'Buen profesor, buena persona !!','Excelente','2016-04-23 20:12:40');
insert  into `feedbacks`(`id`,`user_student_id`,`user_professor_id`,`msg`,`grade`,`created`) values (19,12,10,'Merece un ascenso, nos encanta como profesor','Excelente','2016-04-24 08:57:31');
insert  into `feedbacks`(`id`,`user_student_id`,`user_professor_id`,`msg`,`grade`,`created`) values (20,15,10,'Soy fan de sus clases, ando muy pendiente de sus enseñanzas','Bueno','2016-05-26 12:01:51');
insert  into `feedbacks`(`id`,`user_student_id`,`user_professor_id`,`msg`,`grade`,`created`) values (21,14,10,'Es un buen profesor','Bueno','2016-05-26 12:07:34');
insert  into `feedbacks`(`id`,`user_student_id`,`user_professor_id`,`msg`,`grade`,`created`) values (22,16,10,'Conoce muy bien su trabajo','Bueno','2016-05-26 12:20:00');
insert  into `feedbacks`(`id`,`user_student_id`,`user_professor_id`,`msg`,`grade`,`created`) values (23,16,10,'Lo recomiendo','Excelente','2016-05-26 12:36:39');
insert  into `feedbacks`(`id`,`user_student_id`,`user_professor_id`,`msg`,`grade`,`created`) values (24,16,10,'Tiene una muy buena actitud como docente.','Bueno','2016-05-26 12:39:47');
insert  into `feedbacks`(`id`,`user_student_id`,`user_professor_id`,`msg`,`grade`,`created`) values (25,17,10,'Muy buena profesora !!1','Bueno','2020-05-30 21:53:01');
insert  into `feedbacks`(`id`,`user_student_id`,`user_professor_id`,`msg`,`grade`,`created`) values (26,18,9,'Hasta ahora no se ha destacado como docente, pero no tengo tampoco ningún observación negativa de la profesora.','Promedio','2020-05-31 01:06:29');
insert  into `feedbacks`(`id`,`user_student_id`,`user_professor_id`,`msg`,`grade`,`created`) values (27,19,10,'Muy buen profesor nada que decir me encanta su clase.','Muy bueno','2020-06-02 06:25:04');
insert  into `feedbacks`(`id`,`user_student_id`,`user_professor_id`,`msg`,`grade`,`created`) values (28,20,10,'Es un muy buen profesor !!!','Bueno','2020-06-02 21:52:15');
insert  into `feedbacks`(`id`,`user_student_id`,`user_professor_id`,`msg`,`grade`,`created`) values (29,9,20,'No se ha acoplado con nosotros. No explica bien. Sin embargo tiene un muy buen programa.','Promedio','2020-06-02 23:08:25');

/*Table structure for table `fees` */

CREATE TABLE `fees` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `course_id` int(30) NOT NULL,
  `description` varchar(200) NOT NULL,
  `amount` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `fees` */

insert  into `fees`(`id`,`course_id`,`description`,`amount`) values (1,1,'Tution Fee',5000);
insert  into `fees`(`id`,`course_id`,`description`,`amount`) values (2,1,'Uniform Fee',1200);
insert  into `fees`(`id`,`course_id`,`description`,`amount`) values (3,2,'Uniform Fee',5000);

/*Table structure for table `fees_transaction` */

CREATE TABLE `fees_transaction` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `stdid` varchar(255) NOT NULL,
  `paid` int(255) NOT NULL,
  `submitdate` datetime NOT NULL,
  `transcation_remark` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `fees_transaction` */

insert  into `fees_transaction`(`id`,`stdid`,`paid`,`submitdate`,`transcation_remark`) values (11,'10',100000,'2020-08-20 00:00:00','Estudiante Generado para posible intercambio con colegio Alemán');
insert  into `fees_transaction`(`id`,`stdid`,`paid`,`submitdate`,`transcation_remark`) values (12,'10',100000,'2020-08-20 00:00:00','Pagado por adelantado');
insert  into `fees_transaction`(`id`,`stdid`,`paid`,`submitdate`,`transcation_remark`) values (13,'10',100000,'2020-08-20 00:00:00','Pago adelantado');
insert  into `fees_transaction`(`id`,`stdid`,`paid`,`submitdate`,`transcation_remark`) values (14,'11',0,'2020-08-21 00:00:00','En la semana que viene el estudiante promete realizar el primer pago.');
insert  into `fees_transaction`(`id`,`stdid`,`paid`,`submitdate`,`transcation_remark`) values (15,'11',120000,'2020-08-21 00:00:00','Pudo realizar el pago antes de lo acordado.');

/*Table structure for table `files` */

CREATE TABLE `files` (
  `id` int(30) unsigned NOT NULL AUTO_INCREMENT,
  `label` varchar(250) NOT NULL,
  `path` text DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `files` */

insert  into `files`(`id`,`label`,`path`,`created_at`,`updated_at`) values (1,'Sistema Generador de Facturas en Python','../uploads/1667314547_80db939bc190d62cc184.jpg','2022-11-01 09:55:47','2022-11-01 10:09:14');

/*Table structure for table `form_list` */

CREATE TABLE `form_list` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `form_code` varchar(100) NOT NULL,
  `title` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `fname` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `form_list` */

insert  into `form_list`(`id`,`form_code`,`title`,`description`,`fname`,`date_created`,`date_updated`) values (7,'2425059741','Examen PHP','Con este sistema de preguntar vamos a concluir tus conocimientos en PHP','2425059741.html','2021-07-02 12:34:49',NULL);
insert  into `form_list`(`id`,`form_code`,`title`,`description`,`fname`,`date_created`,`date_updated`) values (8,'7929514222','Entrevista de trabajo','Única pregunta abierta','7929514222.html','2021-07-03 09:55:35',NULL);

/*Table structure for table `history` */

CREATE TABLE `history` (
  `email` varchar(50) NOT NULL,
  `eid` text NOT NULL,
  `score` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `sahi` int(11) NOT NULL,
  `wrong` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `history` */

insert  into `history`(`email`,`eid`,`score`,`level`,`sahi`,`wrong`,`date`) values ('usuario@cweb.com','5f87b7b0e5928',1,5,3,2,'2020-10-14 22:58:39');
insert  into `history`(`email`,`eid`,`score`,`level`,`sahi`,`wrong`,`date`) values ('operador@cweb.com','5f87b7b0e5928',1,5,3,2,'2020-10-14 23:25:31');

/*Table structure for table `hospi_room` */

CREATE TABLE `hospi_room` (
  `room_id` int(11) NOT NULL AUTO_INCREMENT,
  `room_name` varchar(100) NOT NULL,
  `room_avilabl` varchar(20) DEFAULT NULL,
  `rc_time_mo` varchar(10) NOT NULL DEFAULT '11.30 AM',
  `rc_time_ev` varchar(10) DEFAULT '06.30 PM',
  `room_drid` int(11) DEFAULT NULL,
  `eroom_drid` int(11) DEFAULT NULL,
  `room_petID` varchar(11) DEFAULT 'No Patient',
  PRIMARY KEY (`room_id`),
  KEY `room_drid` (`room_drid`),
  KEY `eroom_id` (`eroom_drid`),
  KEY `room_petID` (`room_petID`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `hospi_room` */

insert  into `hospi_room`(`room_id`,`room_name`,`room_avilabl`,`rc_time_mo`,`rc_time_ev`,`room_drid`,`eroom_drid`,`room_petID`) values (1,'Cuarto No: 1','AV','11.30 AM','06.30 PM',6,1,'No Patient');
insert  into `hospi_room`(`room_id`,`room_name`,`room_avilabl`,`rc_time_mo`,`rc_time_ev`,`room_drid`,`eroom_drid`,`room_petID`) values (2,'Cuarto No: 2','NAV','11.30 AM','06.30 PM',NULL,NULL,'3');
insert  into `hospi_room`(`room_id`,`room_name`,`room_avilabl`,`rc_time_mo`,`rc_time_ev`,`room_drid`,`eroom_drid`,`room_petID`) values (3,'Cuarto No: 3','AV','11.30 AM','06.30 PM',NULL,NULL,'No Patient');
insert  into `hospi_room`(`room_id`,`room_name`,`room_avilabl`,`rc_time_mo`,`rc_time_ev`,`room_drid`,`eroom_drid`,`room_petID`) values (4,'Cuarto No: 4','AV','11.30 AM','06.30 PM',NULL,NULL,'No Patient');
insert  into `hospi_room`(`room_id`,`room_name`,`room_avilabl`,`rc_time_mo`,`rc_time_ev`,`room_drid`,`eroom_drid`,`room_petID`) values (5,'Cuarto No: 5','AV','11.30 AM','06.30 PM',NULL,NULL,'No Patient');
insert  into `hospi_room`(`room_id`,`room_name`,`room_avilabl`,`rc_time_mo`,`rc_time_ev`,`room_drid`,`eroom_drid`,`room_petID`) values (6,'Cuarto No: 6','AV','11.30 AM','06.30 PM',NULL,NULL,'No Patient');
insert  into `hospi_room`(`room_id`,`room_name`,`room_avilabl`,`rc_time_mo`,`rc_time_ev`,`room_drid`,`eroom_drid`,`room_petID`) values (7,'Cuarto No: 7','AV','11.30 AM','06.30 PM',NULL,NULL,'No Patient');
insert  into `hospi_room`(`room_id`,`room_name`,`room_avilabl`,`rc_time_mo`,`rc_time_ev`,`room_drid`,`eroom_drid`,`room_petID`) values (8,'Cuarto No: 8','AV','11.30 AM','06.30 PM',NULL,NULL,'No Patient');
insert  into `hospi_room`(`room_id`,`room_name`,`room_avilabl`,`rc_time_mo`,`rc_time_ev`,`room_drid`,`eroom_drid`,`room_petID`) values (9,'Cuarto No: 9','AV','11.30 AM','06.30 PM',NULL,NULL,'No Patient');
insert  into `hospi_room`(`room_id`,`room_name`,`room_avilabl`,`rc_time_mo`,`rc_time_ev`,`room_drid`,`eroom_drid`,`room_petID`) values (10,'Cuarto No: 10','AV','11.30 AM','06.30 PM',1,6,'No Patient');

/*Table structure for table `ims_brand` */

CREATE TABLE `ims_brand` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoryid` int(11) NOT NULL,
  `bname` varchar(250) NOT NULL,
  `status` enum('active','inactive') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `ims_brand` */

insert  into `ims_brand`(`id`,`categoryid`,`bname`,`status`) values (1,2,'Brand 1','active');
insert  into `ims_brand`(`id`,`categoryid`,`bname`,`status`) values (2,2,'Brand 2','active');
insert  into `ims_brand`(`id`,`categoryid`,`bname`,`status`) values (3,2,'Brand 3','active');
insert  into `ims_brand`(`id`,`categoryid`,`bname`,`status`) values (4,1,'Brand 201','active');
insert  into `ims_brand`(`id`,`categoryid`,`bname`,`status`) values (5,1,'Brand 202','active');
insert  into `ims_brand`(`id`,`categoryid`,`bname`,`status`) values (6,1,'Brand 203','active');
insert  into `ims_brand`(`id`,`categoryid`,`bname`,`status`) values (7,3,'Brand 301','active');
insert  into `ims_brand`(`id`,`categoryid`,`bname`,`status`) values (8,3,'Brand 302','active');
insert  into `ims_brand`(`id`,`categoryid`,`bname`,`status`) values (9,3,'Brand 303','active');
insert  into `ims_brand`(`id`,`categoryid`,`bname`,`status`) values (10,4,'Samsung','active');

/*Table structure for table `ims_category` */

CREATE TABLE `ims_category` (
  `categoryid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `status` enum('active','inactive') NOT NULL,
  PRIMARY KEY (`categoryid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `ims_category` */

insert  into `ims_category`(`categoryid`,`name`,`status`) values (1,'Hogar','active');
insert  into `ims_category`(`categoryid`,`name`,`status`) values (2,'Ferretería','active');
insert  into `ims_category`(`categoryid`,`name`,`status`) values (3,'Prendas de Vestir','active');
insert  into `ims_category`(`categoryid`,`name`,`status`) values (4,'Dispositivos Electrónicos','active');

/*Table structure for table `ims_customer` */

CREATE TABLE `ims_customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `address` text NOT NULL,
  `mobile` int(50) NOT NULL,
  `balance` double(10,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `ims_customer` */

insert  into `ims_customer`(`id`,`name`,`address`,`mobile`,`balance`) values (1,'Diana Cliente','Calle 34 N 20 91',2147483647,2585000.00);
insert  into `ims_customer`(`id`,`name`,`address`,`mobile`,`balance`) values (2,'Pedro Cliente','Calle 90 N 23 19',2147483647,3545000.00);
insert  into `ims_customer`(`id`,`name`,`address`,`mobile`,`balance`) values (3,'Juan Cliente','Calle 98 15 47',2147483647,1200000.00);

/*Table structure for table `ims_order` */

CREATE TABLE `ims_order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` varchar(255) NOT NULL,
  `total_shipped` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `ims_order` */

insert  into `ims_order`(`order_id`,`product_id`,`total_shipped`,`customer_id`,`order_date`) values (1,'1',5,1,'2022-06-20 03:20:40');
insert  into `ims_order`(`order_id`,`product_id`,`total_shipped`,`customer_id`,`order_date`) values (2,'2',3,2,'2022-06-20 03:20:48');
insert  into `ims_order`(`order_id`,`product_id`,`total_shipped`,`customer_id`,`order_date`) values (3,'4',15,3,'2022-06-25 22:13:01');

/*Table structure for table `ims_product` */

CREATE TABLE `ims_product` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `categoryid` int(11) NOT NULL,
  `brandid` int(11) NOT NULL,
  `pname` varchar(300) NOT NULL,
  `model` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `quantity` int(11) NOT NULL,
  `unit` varchar(150) NOT NULL,
  `base_price` double(10,2) NOT NULL,
  `tax` decimal(4,2) NOT NULL,
  `minimum_order` double(10,2) NOT NULL,
  `supplier` int(11) NOT NULL,
  `status` enum('active','inactive') NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `ims_product` */

insert  into `ims_product`(`pid`,`categoryid`,`brandid`,`pname`,`model`,`description`,`quantity`,`unit`,`base_price`,`tax`,`minimum_order`,`supplier`,`status`,`date`) values (1,2,1,'Product 101','P-1001','usce auctor faucibus efficitur.',10,'Bottles',500.00,12.00,1.00,1,'active','0000-00-00');
insert  into `ims_product`(`pid`,`categoryid`,`brandid`,`pname`,`model`,`description`,`quantity`,`unit`,`base_price`,`tax`,`minimum_order`,`supplier`,`status`,`date`) values (2,1,4,'Product 102','P-1002','Proin vehicula mi pulvinar ipsum ornare tincidunt.',15,'Box',7500.00,12.00,1.00,2,'active','0000-00-00');
insert  into `ims_product`(`pid`,`categoryid`,`brandid`,`pname`,`model`,`description`,`quantity`,`unit`,`base_price`,`tax`,`minimum_order`,`supplier`,`status`,`date`) values (3,3,7,'Product 103','P-1003','Integer interdum, odio eget mattis venenatis',20,'Bags',350.00,12.00,1.00,3,'active','0000-00-00');
insert  into `ims_product`(`pid`,`categoryid`,`brandid`,`pname`,`model`,`description`,`quantity`,`unit`,`base_price`,`tax`,`minimum_order`,`supplier`,`status`,`date`) values (4,4,10,'Galaxy A32','E12 32','Mantente siempre conectado con tu Galaxy A32, gracias a su batería de 5000 mAh. Cuenta con una memoria RAM de 4GB y alto almacenamiento de 128GB que te permite disfrutar tus aplicaciones ágilmente y llevar contigo la información que necesites. Su display de 6.4 pulgadas te permite tener una experiencia visual inigualable con el mejor contenido.',50,'Packet',2500000.00,23.00,1.00,4,'active','0000-00-00');

/*Table structure for table `ims_purchase` */

CREATE TABLE `ims_purchase` (
  `purchase_id` int(11) NOT NULL AUTO_INCREMENT,
  `supplier_id` varchar(255) NOT NULL,
  `product_id` varchar(255) NOT NULL,
  `quantity` varchar(255) NOT NULL,
  `purchase_date` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`purchase_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `ims_purchase` */

insert  into `ims_purchase`(`purchase_id`,`supplier_id`,`product_id`,`quantity`,`purchase_date`) values (1,'1','1','25','2022-06-20 03:20:07');
insert  into `ims_purchase`(`purchase_id`,`supplier_id`,`product_id`,`quantity`,`purchase_date`) values (2,'2','2','35','2022-06-20 03:20:14');
insert  into `ims_purchase`(`purchase_id`,`supplier_id`,`product_id`,`quantity`,`purchase_date`) values (3,'3','3','10','2022-06-20 03:20:29');
insert  into `ims_purchase`(`purchase_id`,`supplier_id`,`product_id`,`quantity`,`purchase_date`) values (4,'4','4','50','2022-06-25 22:12:36');

/*Table structure for table `ims_supplier` */

CREATE TABLE `ims_supplier` (
  `supplier_id` int(11) NOT NULL AUTO_INCREMENT,
  `supplier_name` varchar(200) NOT NULL,
  `mobile` varchar(50) NOT NULL,
  `address` text NOT NULL,
  `status` enum('active','inactive') NOT NULL,
  PRIMARY KEY (`supplier_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `ims_supplier` */

insert  into `ims_supplier`(`supplier_id`,`supplier_name`,`mobile`,`address`,`status`) values (1,'Alkosto','3052874691','Calle 98 N 21 02','active');
insert  into `ims_supplier`(`supplier_id`,`supplier_name`,`mobile`,`address`,`status`) values (2,'Almacenes Exito','3052879417','Calle 23 10 09','active');
insert  into `ims_supplier`(`supplier_id`,`supplier_name`,`mobile`,`address`,`status`) values (3,'Falabella','3192102091','Calle  87 82 01','active');
insert  into `ims_supplier`(`supplier_id`,`supplier_name`,`mobile`,`address`,`status`) values (4,'Katronix','3025874637','Calle 90 46 74','active');

/*Table structure for table `ims_user` */

CREATE TABLE `ims_user` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `name` varchar(200) NOT NULL,
  `type` enum('admin','member') NOT NULL,
  `status` enum('Active','Inactive') NOT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `ims_user` */

insert  into `ims_user`(`userid`,`email`,`password`,`name`,`type`,`status`) values (1,'hola@configuroweb.com','4b67deeb9aba04a5b54632ad19934f26','ConfiguroWeb','admin','Active');

/*Table structure for table `invoice_meta_tbl` */

CREATE TABLE `invoice_meta_tbl` (
  `id` bigint(30) NOT NULL AUTO_INCREMENT,
  `invoice_id` bigint(30) NOT NULL,
  `item` text NOT NULL,
  `price` float(12,2) NOT NULL,
  `qty` float NOT NULL,
  `unit` varchar(50) NOT NULL,
  `total` float(12,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `invoice_id_fk` (`invoice_id`),
  CONSTRAINT `invoice_id_fk` FOREIGN KEY (`invoice_id`) REFERENCES `invoices_tbl` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `invoice_meta_tbl` */

insert  into `invoice_meta_tbl`(`id`,`invoice_id`,`item`,`price`,`qty`,`unit`,`total`) values (17,13,'Cartera Moda Italiana',1520.00,1,'1',1520.00);
insert  into `invoice_meta_tbl`(`id`,`invoice_id`,`item`,`price`,`qty`,`unit`,`total`) values (18,13,'Mochila Moxo',2560.00,1,'1',2560.00);

/*Table structure for table `invoice_order` */

CREATE TABLE `invoice_order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `order_receiver_name` varchar(250) NOT NULL,
  `order_receiver_address` text NOT NULL,
  `order_total_before_tax` decimal(10,2) NOT NULL,
  `order_total_tax` decimal(10,2) NOT NULL,
  `order_tax_per` varchar(250) NOT NULL,
  `order_total_after_tax` double(10,2) NOT NULL,
  `order_amount_paid` decimal(10,2) NOT NULL,
  `order_total_amount_due` decimal(10,2) NOT NULL,
  `note` text NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=685 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `invoice_order` */

insert  into `invoice_order`(`order_id`,`user_id`,`order_date`,`order_receiver_name`,`order_receiver_address`,`order_total_before_tax`,`order_total_tax`,`order_tax_per`,`order_total_after_tax`,`order_amount_paid`,`order_total_amount_due`,`note`) values (682,123456,'2022-06-06 20:18:03','La Super Mega Empresa','Calle 98 25 46',25000.00,4000.00,'16',29000.00,30000.00,-1000.00,'Se realiza el proceso sin ningún inconveniente.');
insert  into `invoice_order`(`order_id`,`user_id`,`order_date`,`order_receiver_name`,`order_receiver_address`,`order_total_before_tax`,`order_total_tax`,`order_tax_per`,`order_total_after_tax`,`order_amount_paid`,`order_total_amount_due`,`note`) values (683,123456,'2022-06-07 14:16:49','Tu Tienda y Punto','Calle 9 N 34 10',78000.00,9360.00,'12',87360.00,88000.00,-640.00,'');
insert  into `invoice_order`(`order_id`,`user_id`,`order_date`,`order_receiver_name`,`order_receiver_address`,`order_total_before_tax`,`order_total_tax`,`order_tax_per`,`order_total_after_tax`,`order_amount_paid`,`order_total_amount_due`,`note`) values (684,123456,'2022-06-07 14:27:37','Pedro Cliente','Calle 33 N 21 09',450000.00,85500.00,'19',535500.00,540000.00,-4500.00,'');

/*Table structure for table `invoice_order_item` */

CREATE TABLE `invoice_order_item` (
  `order_item_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `item_code` varchar(250) NOT NULL,
  `item_name` varchar(250) NOT NULL,
  `order_item_quantity` decimal(10,2) NOT NULL,
  `order_item_price` decimal(10,2) NOT NULL,
  `order_item_final_amount` decimal(10,2) NOT NULL,
  PRIMARY KEY (`order_item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4370 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `invoice_order_item` */

insert  into `invoice_order_item`(`order_item_id`,`order_id`,`item_code`,`item_name`,`order_item_quantity`,`order_item_price`,`order_item_final_amount`) values (4367,682,'15','12',1.00,25000.00,25000.00);
insert  into `invoice_order_item`(`order_item_id`,`order_id`,`item_code`,`item_name`,`order_item_quantity`,`order_item_price`,`order_item_final_amount`) values (4368,683,'1200','Zapatos Tiger 1 220-500',1.00,78000.00,78000.00);
insert  into `invoice_order_item`(`order_item_id`,`order_id`,`item_code`,`item_name`,`order_item_quantity`,`order_item_price`,`order_item_final_amount`) values (4369,684,'1500','Teléfono Celular Raspberry PI 468',1.00,450000.00,450000.00);

/*Table structure for table `invoice_user` */

CREATE TABLE `invoice_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `mobile` bigint(20) NOT NULL,
  `address` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=123457 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `invoice_user` */

insert  into `invoice_user`(`id`,`email`,`password`,`first_name`,`last_name`,`mobile`,`address`) values (123456,'hola@configuroweb.com','1234abcd..','ConfiguroWeb','',3025897431,'Calle 95 78 58');

/*Table structure for table `invoices_tbl` */

CREATE TABLE `invoices_tbl` (
  `id` bigint(30) NOT NULL AUTO_INCREMENT,
  `invoice_code` varchar(50) NOT NULL,
  `customer` text NOT NULL,
  `cashier` text NOT NULL,
  `total_amount` float(12,2) NOT NULL,
  `discount_percentage` float NOT NULL,
  `discount_amount` float(12,2) NOT NULL,
  `tendered_amount` float(12,2) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `invoices_tbl` */

insert  into `invoices_tbl`(`id`,`invoice_code`,`customer`,`cashier`,`total_amount`,`discount_percentage`,`discount_amount`,`tendered_amount`,`created_at`,`updated_at`) values (13,'1217','Luis Cliente','Cajero 3',4080.00,3,122.40,4000.00,'2023-12-03 20:59:17',NULL);

/*Table structure for table `issued_book` */

CREATE TABLE `issued_book` (
  `issuebookid` int(11) NOT NULL AUTO_INCREMENT,
  `bookid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `issue_date_time` datetime NOT NULL DEFAULT current_timestamp(),
  `expected_return_date` datetime NOT NULL,
  `return_date_time` datetime NOT NULL,
  `status` enum('Issued','Returned','Not Return') NOT NULL,
  PRIMARY KEY (`issuebookid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `issued_book` */

insert  into `issued_book`(`issuebookid`,`bookid`,`userid`,`issue_date_time`,`expected_return_date`,`return_date_time`,`status`) values (1,2,2,'2022-06-12 15:33:45','2022-06-15 16:27:59','2022-06-16 16:27:59','Issued');
insert  into `issued_book`(`issuebookid`,`bookid`,`userid`,`issue_date_time`,`expected_return_date`,`return_date_time`,`status`) values (3,3,3,'2022-06-12 18:46:07','2022-06-30 18:46:02','2022-06-12 18:46:14','Returned');

/*Table structure for table `librarian` */

CREATE TABLE `librarian` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` char(40) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `librarian` */

insert  into `librarian`(`id`,`username`,`password`) values (1,'configuroweb','AD4BEDC9F4F98E0513315BCFD543E4F8E2C00A77');

/*Table structure for table `link` */

CREATE TABLE `link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(1000) DEFAULT NULL,
  `code` varchar(20) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `link` */

insert  into `link`(`id`,`url`,`code`,`created`) values (2,'https://configuroweb.com/','5yc1u','2023-09-23 20:12:29');
insert  into `link`(`id`,`url`,`code`,`created`) values (3,'https://www.google.com/','google','2023-09-23 20:13:51');
insert  into `link`(`id`,`url`,`code`,`created`) values (4,'https://configuroweb.com/','mi-pagina','2023-09-23 20:14:35');
insert  into `link`(`id`,`url`,`code`,`created`) values (5,'https://www.youtube.com/','yt','2023-09-23 20:27:25');
insert  into `link`(`id`,`url`,`code`,`created`) values (6,'https://www.youtube.com/channel/UCVnrMbml3wUIuwz-oSaIUnA','mi-canal','2023-09-23 20:39:46');
insert  into `link`(`id`,`url`,`code`,`created`) values (7,'https://twitter.com/configuroweb','twitter','2023-09-24 18:21:58');

/*Table structure for table `lvl2_admin` */

CREATE TABLE `lvl2_admin` (
  `lvtwname` varchar(100) NOT NULL,
  `lvtwusern` varchar(100) NOT NULL,
  `lvtwemail` varchar(200) NOT NULL,
  `lvtwpass` varchar(50) NOT NULL,
  `lvtwid` int(11) NOT NULL AUTO_INCREMENT,
  `lvtwcdate` date NOT NULL,
  PRIMARY KEY (`lvtwid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `lvl2_admin` */

insert  into `lvl2_admin`(`lvtwname`,`lvtwusern`,`lvtwemail`,`lvtwpass`,`lvtwid`,`lvtwcdate`) values ('usuario','BasicAdmin','usuario@cweb.com','4b67deeb9aba04a5b54632ad19934f26',1,'2017-10-04');

/*Table structure for table `manage_website` */

CREATE TABLE `manage_website` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(600) NOT NULL,
  `short_title` varchar(600) NOT NULL,
  `logo` text NOT NULL,
  `footer` text NOT NULL,
  `currency_code` varchar(600) NOT NULL,
  `currency_symbol` varchar(600) NOT NULL,
  `login_logo` text NOT NULL,
  `invoice_logo` text NOT NULL,
  `background_login_image` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `manage_website` */

insert  into `manage_website`(`id`,`title`,`short_title`,`logo`,`footer`,`currency_code`,`currency_symbol`,`login_logo`,`invoice_logo`,`background_login_image`) values (1,'Admin Panel by ','9090908080','logo.jpg','Admin PanelÂ ','India','â‚¹','logo.png','logo.jpg','logo.jpg');

/*Table structure for table `member` */

CREATE TABLE `member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` char(40) NOT NULL,
  `name` varchar(80) NOT NULL,
  `email` varchar(80) NOT NULL,
  `balance` int(4) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `member` */

insert  into `member`(`id`,`username`,`password`,`name`,`email`,`balance`) values (8,'mauron','ad4bedc9f4f98e0513315bcfd543e4f8e2c00a77','Mauricio Sevilla','configuroweb@gmail.com',80529);

/*Table structure for table `members` */

CREATE TABLE `members` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `contact` varchar(50) NOT NULL,
  `address` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `members` */

insert  into `members`(`id`,`name`,`contact`,`address`,`created_at`,`updated_at`) values (1,'Juan Pedro Molina','3029874651','Calle 98 N 23 12','2022-11-12 11:11:50','2022-11-16 11:18:56');
insert  into `members`(`id`,`name`,`contact`,`address`,`created_at`,`updated_at`) values (2,'García Galeano','3052589741','Calle 45 23 12','2022-11-12 11:13:38','2022-11-16 11:03:53');
insert  into `members`(`id`,`name`,`contact`,`address`,`created_at`,`updated_at`) values (3,'Octavio Cruz','3259874164','Carrera 23 12','2022-11-12 11:33:49','2022-11-16 11:03:59');
insert  into `members`(`id`,`name`,`contact`,`address`,`created_at`,`updated_at`) values (4,'Rafael Patricio','3108526497','Avenida 502 58 98','2022-11-12 11:52:58','2022-11-16 11:04:06');
insert  into `members`(`id`,`name`,`contact`,`address`,`created_at`,`updated_at`) values (5,'Tomás Veleno','3136985679','Av 54 N 23 12','2022-11-12 11:54:47','2022-11-16 11:04:18');
insert  into `members`(`id`,`name`,`contact`,`address`,`created_at`,`updated_at`) values (6,'Francisco Petro','3087946587','Calle 22  N 10 90','2022-11-12 12:57:58','2022-11-16 11:04:28');
insert  into `members`(`id`,`name`,`contact`,`address`,`created_at`,`updated_at`) values (8,'Pedro Méndez','3082954671','Calle 90 85 64','2022-11-12 13:05:51','2022-11-16 11:05:25');
insert  into `members`(`id`,`name`,`contact`,`address`,`created_at`,`updated_at`) values (9,'Tobías Robira','3063574187','Av 34 21 12','2022-11-12 13:09:28','2022-11-16 11:05:19');
insert  into `members`(`id`,`name`,`contact`,`address`,`created_at`,`updated_at`) values (10,'Sofia Tamayo','3056987418','Carrera 55 N 85 94','2022-11-12 13:10:17','2022-11-16 11:05:12');
insert  into `members`(`id`,`name`,`contact`,`address`,`created_at`,`updated_at`) values (11,'Katherine Mendoza','3256847931','Calle 22 N 10 90','2022-11-12 13:13:12','2022-11-16 11:05:02');
insert  into `members`(`id`,`name`,`contact`,`address`,`created_at`,`updated_at`) values (12,'Sebastián Andeluz','3163968574','Calle 2312 09 89','2022-11-12 13:14:03','2022-11-16 11:04:54');
insert  into `members`(`id`,`name`,`contact`,`address`,`created_at`,`updated_at`) values (13,'Andrés Tobón','3059876498','Calle 28 34 17','2022-11-12 13:15:59','2022-11-16 11:04:45');
insert  into `members`(`id`,`name`,`contact`,`address`,`created_at`,`updated_at`) values (15,'Pedro Tobías Milano','3142190756','Calle 23 14 01','2022-11-16 11:18:31',NULL);

/*Table structure for table `messages` */

CREATE TABLE `messages` (
  `msg_id` int(11) NOT NULL AUTO_INCREMENT,
  `incoming_msg_id` int(255) NOT NULL,
  `outgoing_msg_id` int(255) NOT NULL,
  `msg` varchar(1000) NOT NULL,
  PRIMARY KEY (`msg_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `messages` */

insert  into `messages`(`msg_id`,`incoming_msg_id`,`outgoing_msg_id`,`msg`) values (1,1622688038,340066300,'hola man');
insert  into `messages`(`msg_id`,`incoming_msg_id`,`outgoing_msg_id`,`msg`) values (2,340066300,1622688038,'bien');
insert  into `messages`(`msg_id`,`incoming_msg_id`,`outgoing_msg_id`,`msg`) values (3,1622688038,340066300,'hola');
insert  into `messages`(`msg_id`,`incoming_msg_id`,`outgoing_msg_id`,`msg`) values (4,340066300,1622688038,'hola');
insert  into `messages`(`msg_id`,`incoming_msg_id`,`outgoing_msg_id`,`msg`) values (5,440971576,1622688038,'hola pedro, necesito tu ayuda');
insert  into `messages`(`msg_id`,`incoming_msg_id`,`outgoing_msg_id`,`msg`) values (6,1622688038,440971576,'hola Mauricio, claro, dime !!');

/*Table structure for table `mis_productos` */

CREATE TABLE `mis_productos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `price` float(10,2) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `status` enum('1','0') NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `mis_productos` */

insert  into `mis_productos`(`id`,`name`,`description`,`price`,`created`,`modified`,`status`) values (1,'Teléfono Za1b','Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.',15000.00,'2016-08-17 08:21:25','2016-08-17 08:21:25','1');
insert  into `mis_productos`(`id`,`name`,`description`,`price`,`created`,`modified`,`status`) values (2,'Camiseta Pedro Catarín','Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.',25300.00,'2016-08-17 08:21:25','2016-08-17 08:21:25','1');
insert  into `mis_productos`(`id`,`name`,`description`,`price`,`created`,`modified`,`status`) values (3,'Perfume Zantorín','Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.',17000.00,'2016-08-17 08:21:25','2016-08-17 08:21:25','1');
insert  into `mis_productos`(`id`,`name`,`description`,`price`,`created`,`modified`,`status`) values (4,'Jarabe Joala','Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.',21500.00,'2016-08-17 08:21:25','2016-08-17 08:21:25','1');

/*Table structure for table `options` */

CREATE TABLE `options` (
  `qid` varchar(50) NOT NULL,
  `option` varchar(5000) NOT NULL,
  `optionid` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `options` */

insert  into `options`(`qid`,`option`,`optionid`) values ('5f87bb9fb8c08','si','5f87bb9fb92e8');
insert  into `options`(`qid`,`option`,`optionid`) values ('5f87bb9fb8c08','no','5f87bb9fb92f5');
insert  into `options`(`qid`,`option`,`optionid`) values ('5f87bb9fb8c08','son lenguajes similares que conservan ciertas diferencias en la ejecución','5f87bb9fb92f6');
insert  into `options`(`qid`,`option`,`optionid`) values ('5f87bb9fb8c08','la opción a y la opción c son ciertas','5f87bb9fb92f7');
insert  into `options`(`qid`,`option`,`optionid`) values ('5f87bb9fbadb5','Es un lenguaje de máquina','5f87bb9fbb1e4');
insert  into `options`(`qid`,`option`,`optionid`) values ('5f87bb9fbadb5','Es un lenguaje interpretado','5f87bb9fbb1e6');
insert  into `options`(`qid`,`option`,`optionid`) values ('5f87bb9fbadb5','Es un lenguaje orientado a objetos','5f87bb9fbb1e7');
insert  into `options`(`qid`,`option`,`optionid`) values ('5f87bb9fbadb5','No es un lenguaje de último nivel','5f87bb9fbb1e8');
insert  into `options`(`qid`,`option`,`optionid`) values ('5f87bb9fbc859','Verdadero','5f87bb9fbd537');
insert  into `options`(`qid`,`option`,`optionid`) values ('5f87bb9fbc859','Falso','5f87bb9fbd53b');
insert  into `options`(`qid`,`option`,`optionid`) values ('5f87bb9fbc859','Javascript tiene funciones que solo retornan valores','5f87bb9fbd53c');
insert  into `options`(`qid`,`option`,`optionid`) values ('5f87bb9fbc859','Javascript es un lenguaje de programación orientada a objetos','5f87bb9fbd53d');
insert  into `options`(`qid`,`option`,`optionid`) values ('5f87bb9fbeb8d','Los comentarios en javascript se habilitan con dos diagonales seguidas //','5f87bb9fbefe5');
insert  into `options`(`qid`,`option`,`optionid`) values ('5f87bb9fbeb8d','Los comentarios se utilizan para poder darle claridad a los demás desarrolladores sobre el código','5f87bb9fbefe7');
insert  into `options`(`qid`,`option`,`optionid`) values ('5f87bb9fbeb8d','La afirmación del planteamiento es totalmente falsa','5f87bb9fbefe8');
insert  into `options`(`qid`,`option`,`optionid`) values ('5f87bb9fbeb8d','La afirmación del planteamiento es totalmente cierta','5f87bb9fbefe9');
insert  into `options`(`qid`,`option`,`optionid`) values ('5f87bb9fc0bb9','La afirmación del planteamiento es totalmente cierta','5f87bb9fc10e5');
insert  into `options`(`qid`,`option`,`optionid`) values ('5f87bb9fc0bb9','Javascript solo se utiliza para el usuario final','5f87bb9fc10e8');
insert  into `options`(`qid`,`option`,`optionid`) values ('5f87bb9fc0bb9','Javascript se compila en un archivo ejecutable','5f87bb9fc10e9');
insert  into `options`(`qid`,`option`,`optionid`) values ('5f87bb9fc0bb9','Javascript es un lenguaje muy similar a PHP y está orientado al servidor exclusivamente','5f87bb9fc10ea');
insert  into `options`(`qid`,`option`,`optionid`) values ('5f88b43712884','p','5f88b43714dba');
insert  into `options`(`qid`,`option`,`optionid`) values ('5f88b43712884','print','5f88b43714dbe');
insert  into `options`(`qid`,`option`,`optionid`) values ('5f88b43712884','echo','5f88b43714dbf');
insert  into `options`(`qid`,`option`,`optionid`) values ('5f88b43712884','console.log','5f88b43714dc0');
insert  into `options`(`qid`,`option`,`optionid`) values ('5f88b43761aa1','#','5f88b437621f3');
insert  into `options`(`qid`,`option`,`optionid`) values ('5f88b43761aa1','*','5f88b437621f8');
insert  into `options`(`qid`,`option`,`optionid`) values ('5f88b43761aa1','//','5f88b437621fa');
insert  into `options`(`qid`,`option`,`optionid`) values ('5f88b43761aa1','--','5f88b437621fb');

/*Table structure for table `orden` */

CREATE TABLE `orden` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `total_price` float(10,2) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `status` enum('1','0') NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `orden_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `clientes` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `orden` */

insert  into `orden`(`id`,`customer_id`,`total_price`,`created`,`modified`,`status`) values (6,1,25.00,'2022-06-12 12:46:58','2022-06-12 12:46:58','1');
insert  into `orden`(`id`,`customer_id`,`total_price`,`created`,`modified`,`status`) values (7,1,40.00,'2022-06-12 13:08:08','2022-06-12 13:08:08','1');

/*Table structure for table `orden_articulos` */

CREATE TABLE `orden_articulos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(5) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `orden_articulos_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orden` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `orden_articulos` */

insert  into `orden_articulos`(`id`,`order_id`,`product_id`,`quantity`) values (1,6,2,1);
insert  into `orden_articulos`(`id`,`order_id`,`product_id`,`quantity`) values (2,7,3,1);
insert  into `orden_articulos`(`id`,`order_id`,`product_id`,`quantity`) values (3,7,4,1);

/*Table structure for table `order_item` */

CREATE TABLE `order_item` (
  `order_item_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL DEFAULT 0,
  `product_id` int(11) NOT NULL DEFAULT 0,
  `quantity` varchar(255) NOT NULL,
  `rate` varchar(255) NOT NULL,
  `total` varchar(255) NOT NULL,
  `order_item_status` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`order_item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `order_item` */

insert  into `order_item`(`order_item_id`,`order_id`,`product_id`,`quantity`,`rate`,`total`,`order_item_status`) values (3,2,1,'2','175','350.00',1);
insert  into `order_item`(`order_item_id`,`order_id`,`product_id`,`quantity`,`rate`,`total`,`order_item_status`) values (4,2,4,'5','140','700.00',1);
insert  into `order_item`(`order_item_id`,`order_id`,`product_id`,`quantity`,`rate`,`total`,`order_item_status`) values (5,3,9,'1','70','70.00',1);
insert  into `order_item`(`order_item_id`,`order_id`,`product_id`,`quantity`,`rate`,`total`,`order_item_status`) values (6,3,7,'2','180','360.00',1);
insert  into `order_item`(`order_item_id`,`order_id`,`product_id`,`quantity`,`rate`,`total`,`order_item_status`) values (7,4,4,'1','140','140.00',1);
insert  into `order_item`(`order_item_id`,`order_id`,`product_id`,`quantity`,`rate`,`total`,`order_item_status`) values (8,1,7,'1','180','180.00',1);
insert  into `order_item`(`order_item_id`,`order_id`,`product_id`,`quantity`,`rate`,`total`,`order_item_status`) values (9,1,8,'3','222','666.00',1);
insert  into `order_item`(`order_item_id`,`order_id`,`product_id`,`quantity`,`rate`,`total`,`order_item_status`) values (10,5,1,'1','175','175.00',1);
insert  into `order_item`(`order_item_id`,`order_id`,`product_id`,`quantity`,`rate`,`total`,`order_item_status`) values (11,5,3,'1','140','140.00',1);

/*Table structure for table `orders` */

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_date` date NOT NULL,
  `client_name` varchar(255) NOT NULL,
  `client_contact` varchar(255) NOT NULL,
  `sub_total` varchar(255) NOT NULL,
  `vat` varchar(255) NOT NULL,
  `total_amount` varchar(255) NOT NULL,
  `discount` varchar(255) NOT NULL,
  `grand_total` varchar(255) NOT NULL,
  `paid` varchar(255) NOT NULL,
  `due` varchar(255) NOT NULL,
  `payment_type` int(11) NOT NULL,
  `payment_status` int(11) NOT NULL,
  `payment_place` int(11) NOT NULL,
  `gstn` varchar(255) NOT NULL,
  `order_status` int(11) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL,
  `file` varchar(100) NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `orders` */

insert  into `orders`(`order_id`,`order_date`,`client_name`,`client_contact`,`sub_total`,`vat`,`total_amount`,`discount`,`grand_total`,`paid`,`due`,`payment_type`,`payment_status`,`payment_place`,`gstn`,`order_status`,`user_id`,`file`) values (1,'2022-09-25','1','3052689471','846.00','152.28','998.28','5','993.28','993','0.28',2,1,1,'152.28',1,1,'Presentación Salud Niños Comida Nutricionista Ilustrada Colorida.png');
insert  into `orders`(`order_id`,`order_date`,`client_name`,`client_contact`,`sub_total`,`vat`,`total_amount`,`discount`,`grand_total`,`paid`,`due`,`payment_type`,`payment_status`,`payment_place`,`gstn`,`order_status`,`user_id`,`file`) values (2,'2022-09-25','1','8090809080','1050.00','189.00','1239.00','','1239.00','1239','0.00',2,1,1,'189.00',1,1,'');
insert  into `orders`(`order_id`,`order_date`,`client_name`,`client_contact`,`sub_total`,`vat`,`total_amount`,`discount`,`grand_total`,`paid`,`due`,`payment_type`,`payment_status`,`payment_place`,`gstn`,`order_status`,`user_id`,`file`) values (3,'2022-09-25','1','8090809080','430.00','77.40','507.40','','507.40','507','0.40',4,1,1,'77.40',1,1,'');
insert  into `orders`(`order_id`,`order_date`,`client_name`,`client_contact`,`sub_total`,`vat`,`total_amount`,`discount`,`grand_total`,`paid`,`due`,`payment_type`,`payment_status`,`payment_place`,`gstn`,`order_status`,`user_id`,`file`) values (4,'2023-01-16','1','3052689471','140.00','25.20','165.20','','165.20','180','-14.80',2,1,1,'25.20',1,1,'banner restaurante python configuroweb.jpg');
insert  into `orders`(`order_id`,`order_date`,`client_name`,`client_contact`,`sub_total`,`vat`,`total_amount`,`discount`,`grand_total`,`paid`,`due`,`payment_type`,`payment_status`,`payment_place`,`gstn`,`order_status`,`user_id`,`file`) values (5,'2023-01-17','2','3059877414','315.00','56.70','371.70','10','361.70','370','-8.30',2,1,1,'56.70',1,1,'');

/*Table structure for table `patient` */

CREATE TABLE `patient` (
  `pet_id` int(11) NOT NULL AUTO_INCREMENT,
  `pet_reg_date` datetime DEFAULT current_timestamp(),
  `pet_fn` varchar(100) DEFAULT NULL,
  `pet_sn` varchar(100) DEFAULT NULL,
  `pet_addr` varchar(500) DEFAULT NULL,
  `pet_ac` varchar(3) DEFAULT '+57',
  `pet_con` int(10) DEFAULT NULL,
  `pet_em` varchar(1000) DEFAULT NULL,
  `pet_gen` varchar(10) DEFAULT NULL,
  `pet_bd` date DEFAULT NULL,
  `pet_age` int(3) DEFAULT NULL,
  `pet_bg` varchar(3) DEFAULT NULL,
  `Pet_opdid` int(11) DEFAULT NULL,
  `Insert_admunname` varchar(100) DEFAULT NULL,
  `Update_sadmunname` varchar(100) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`pet_id`),
  KEY `Pet_opdid` (`Pet_opdid`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `patient` */

insert  into `patient`(`pet_id`,`pet_reg_date`,`pet_fn`,`pet_sn`,`pet_addr`,`pet_ac`,`pet_con`,`pet_em`,`pet_gen`,`pet_bd`,`pet_age`,`pet_bg`,`Pet_opdid`,`Insert_admunname`,`Update_sadmunname`,`update_date`) values (1,'2020-08-09 13:44:22','Juan','Galan','Calle 34 Carrera 17-23','+94',315462174,'jgalan@cweb.com','Male','1994-06-23',26,'A+',1,'configuroweb',NULL,NULL);
insert  into `patient`(`pet_id`,`pet_reg_date`,`pet_fn`,`pet_sn`,`pet_addr`,`pet_ac`,`pet_con`,`pet_em`,`pet_gen`,`pet_bd`,`pet_age`,`pet_bg`,`Pet_opdid`,`Insert_admunname`,`Update_sadmunname`,`update_date`) values (2,'2020-08-11 14:59:13','Omar','Estrada','Carrera 22 N 23 14','+57',2147483647,'oestrada@cweb.com','Male','1993-06-08',27,'O+',4,'configuroweb',NULL,NULL);
insert  into `patient`(`pet_id`,`pet_reg_date`,`pet_fn`,`pet_sn`,`pet_addr`,`pet_ac`,`pet_con`,`pet_em`,`pet_gen`,`pet_bd`,`pet_age`,`pet_bg`,`Pet_opdid`,`Insert_admunname`,`Update_sadmunname`,`update_date`) values (3,'2020-08-11 15:02:33','Julian','Cardozo','Calle 54 N 23 23','+57',301258794,'jcardozo@cweb.com','Male','1986-06-03',34,'O+',2,'configuroweb',NULL,NULL);
insert  into `patient`(`pet_id`,`pet_reg_date`,`pet_fn`,`pet_sn`,`pet_addr`,`pet_ac`,`pet_con`,`pet_em`,`pet_gen`,`pet_bd`,`pet_age`,`pet_bg`,`Pet_opdid`,`Insert_admunname`,`Update_sadmunname`,`update_date`) values (4,'2020-08-11 15:05:06','Gustavo','Polania','Calle 101 N 23-234','+57',301654877,'gpolania@cweb.com','Male','1993-08-24',27,'B-',6,'configuroweb',NULL,NULL);

/*Table structure for table `payments` */

CREATE TABLE `payments` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `ef_id` int(30) NOT NULL,
  `amount` float NOT NULL,
  `remarks` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `payments` */

insert  into `payments`(`id`,`ef_id`,`amount`,`remarks`,`date_created`) values (1,1,5000,'Pago a través de Cuenta Bancaria','2022-05-28 23:51:33');
insert  into `payments`(`id`,`ef_id`,`amount`,`remarks`,`date_created`) values (2,1,200,'Sin novedad','2022-05-28 23:51:42');
insert  into `payments`(`id`,`ef_id`,`amount`,`remarks`,`date_created`) values (3,2,50000,'Primera instalación','2022-05-28 23:52:02');
insert  into `payments`(`id`,`ef_id`,`amount`,`remarks`,`date_created`) values (4,2,10000,'Se realiza el pago sin inconvenientes','2022-05-28 23:52:20');
insert  into `payments`(`id`,`ef_id`,`amount`,`remarks`,`date_created`) values (5,2,7000,'Se realiza el pago sin observaciones','2022-05-28 18:15:33');
insert  into `payments`(`id`,`ef_id`,`amount`,`remarks`,`date_created`) values (6,3,8000,'Se realiza el pago sin observaciones','2022-05-28 18:19:57');

/*Table structure for table `pending_book_requests` */

CREATE TABLE `pending_book_requests` (
  `request_id` int(11) NOT NULL AUTO_INCREMENT,
  `member` varchar(20) NOT NULL,
  `book_isbn` varchar(13) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`request_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `pending_book_requests` */

/*Table structure for table `pending_registrations` */

CREATE TABLE `pending_registrations` (
  `username` varchar(20) NOT NULL,
  `password` char(40) NOT NULL,
  `name` varchar(80) NOT NULL,
  `email` varchar(80) NOT NULL,
  `balance` int(4) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `pending_registrations` */

/*Table structure for table `pet_invo` */

CREATE TABLE `pet_invo` (
  `invo_id` int(11) NOT NULL AUTO_INCREMENT,
  `invo_Pet_name` varchar(500) NOT NULL,
  `invo_pet_id` int(100) NOT NULL DEFAULT 1,
  `invo_pet_age` int(3) NOT NULL,
  `invo_date` date NOT NULL,
  `medi_charge` int(10) NOT NULL,
  `doc_charge` int(10) NOT NULL,
  `hos_charge` int(10) NOT NULL DEFAULT 1500,
  `total_charge` int(10) NOT NULL,
  PRIMARY KEY (`invo_id`),
  KEY `invo_pet_id` (`invo_pet_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `pet_invo` */

insert  into `pet_invo`(`invo_id`,`invo_Pet_name`,`invo_pet_id`,`invo_pet_age`,`invo_date`,`medi_charge`,`doc_charge`,`hos_charge`,`total_charge`) values (1,'Juan Galan',1,26,'2020-08-10',50000,150000,500,200500);
insert  into `pet_invo`(`invo_id`,`invo_Pet_name`,`invo_pet_id`,`invo_pet_age`,`invo_date`,`medi_charge`,`doc_charge`,`hos_charge`,`total_charge`) values (2,'Julian Cardozo',3,34,'2020-08-11',125000,254000,500,379500);

/*Table structure for table `posts` */

CREATE TABLE `posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(250) NOT NULL,
  `content` text NOT NULL,
  `meta_description` text NOT NULL,
  `author` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=233 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `posts` */

insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (101,'Personalización de Plantilla de Instabot - ConfiguroWeb','El proceso se explica a cabalidad en el vídeo a continuación: El presente post se puede tomar como la continuidad de una publicación previa donde explicaba el paso a paso de como realizar la instalación de Instabot Si llegaste hasta acá por accidente y aun no has hecho la instalación de este b...','desarrollo','ConfiguroWeb','2022-11-13 18:19:04',NULL);
insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (102,'Software Parqueadero Básico en Javascript Bootstrap HTML y CSS','Parqueadero ConfiguroWeb Página Sencilla Para Registro de Carros en un Parqueadero [Se Comparte el Código]En el siguiente enlace está toda la información a l...','PHP','Mauricio Sevilla Britto','2022-11-13 18:19:04',NULL);
insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (103,'Sistema de Control de Pagos Colegio','Este sistema lista los estudiantes ingresados, los pagos realizados, la deuda inicial, su balance respectivo. Se pueden gestionar los bancos relacionados con...','contenido','ConfiguroWeb','2022-11-13 18:19:04',NULL);
insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (104,'Sistema Web de Pedidos en PHP y MySQL - ConfiguroWeb','Como es habitual se explica el proceso de la puesta a punto del proyecto en un servidor local en el siguiente vídeo: Repositorio GitHub Entregas El enlace de descarga del repositorio en GitHub es el siguiente: Gestión de la Base de Datos Se debe crear una base de datos con el nombre smss_db y lueg...','marketing','Mauricio Sevilla Britto','2022-11-13 18:19:04',NULL);
insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (105,'IFTTT','Get started with IFTTT, the easiest way to do more with your favorite apps and devices for free. Make your home more relaxing. Make your work more productive. Keep your data private and secure. We believe every thing works better together.','contenido','Mauricio Sevilla Britto','2022-11-13 18:19:04',NULL);
insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (106,'CRUD PHP MySQL para descargar, con Javascript y Bootstrap Comparto el Codigo - ConfiguroWeb','Para tener el CRUD desarrollado en PHP y MySQL basta con descargar los archivos en cualquier de los siguientes enlaces: https://github.com/configuroweb/crud-php https://drive.google.com/drive/folders/1Azk30EA-3eU2jI0-INp2jORS7Ssf2NkV?usp=sharing Descargar he instalar XAMPP en el siguiente enlace: ht...','marketing','Mauricio Sevilla Britto','2022-11-13 18:19:04',NULL);
insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (107,'Software de Gestión para Peluquerías Centros de Estética Belleza y SPA Full Gratis!!','Sistema integral de Gestión para Peluquerías Centros de Estética Belleza y SPAS incluyendo CMS, se puede modificar sin skilles de programación la página de A...','contenido','ConfiguroWeb','2022-11-13 18:19:04',NULL);
insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (108,'Programa para Parqueaderos 2019 con Código Libre en PHP, Bootstrap y Java Script - ConfiguroWeb','Está todo muy claramente explicado en el vídeo subido a continuación, en adición expongo el paso a paso para que el programa quede funcional en tu ordenador a nivel local. Lo primero es descargar XAMPP, en el siguiente enlace: https://www.apachefriends.org/es/index.html Después lo instalamos de...','marketing','ConfiguroWeb','2022-11-13 18:19:04',NULL);
insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (109,'Programa para Parqueaderos 2019 con Código Libre en PHP, Bootstrap y Java Script - ConfiguroWeb','Está todo muy claramente explicado en el vídeo subido a continuación, en adición expongo el paso a paso para que el programa quede funcional en tu ordenador a nivel local. Lo primero es descargar XAMPP, en el siguiente enlace: https://www.apachefriends.org/es/index.html Después lo instalamos de...','contenido','Mauricio Sevilla Britto','2022-11-13 18:19:04',NULL);
insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (110,'Sistema POS, Se Comparte Código, Se explica, Instalación Local y Subida a Heroku, Incluyendo la Configuración de la Base de Datos MySQL. - ConfiguroWeb','En el vídeo a continuación, se explica el código y los procesos necesarios para llevar a feliz término la implementación de la aplicación tanto a nivel local, como la subida a Heroku, todo el proceso totalmente gratis. Enlaces de descarga Sistema POS ConfiguroWeb A continuación se muestra el ...','marketing','ConfiguroWeb','2022-11-13 18:19:04',NULL);
insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (111,'Programa para Parqueaderos 2019 con Código Libre en PHP, Bootstrap y Java Script - ConfiguroWeb','Está todo muy claramente explicado en el vídeo subido a continuación, en adición expongo el paso a paso para que el programa quede funcional en tu ordenador a nivel local. Lo primero es descargar XAMPP, en el siguiente enlace: https://www.apachefriends.org/es/index.html Después lo instalamos de...','PHP','ConfiguroWeb','2022-11-13 18:19:04',NULL);
insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (112,'Sistema Web de Inventario Simple en PHP MySQL','Sistema web super ligero diseñado en PHP y MySQL, consiste básicamente en un crud de usuario y otro crud de producto, donde se pueden agregar, eliminar, actu...','desarrollo','Mauricio Sevilla Britto','2022-11-13 18:19:04',NULL);
insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (113,'Programa para Parqueaderos 2019 con Código Libre en PHP, Bootstrap y Java Script - ConfiguroWeb','Está todo muy claramente explicado en el vídeo subido a continuación, en adición expongo el paso a paso para que el programa quede funcional en tu ordenador a nivel local. Lo primero es descargar XAMPP, en el siguiente enlace: https://www.apachefriends.org/es/index.html Después lo instalamos de...','marketing','ConfiguroWeb','2022-11-13 18:19:04',NULL);
insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (114,'SISTEMA HOTELERO Pensión Estudiantil, desarrollada en PHP y MySQL [Comparto el Código] - ConfiguroWeb','El proceso de implementación y funcionalidad de la aplicación, se explica en el vídeo a continuación: Enlaces de descarga del SISTEMA HOTELERO Pensión Estudiantil PHP en PHP y MySQL Enlace GitHub https://github.com/configuroweb/pension Enlace Google Drive https://drive.google.com/open?id=1lfwZp...','javascript','ConfiguroWeb','2022-11-13 18:19:04',NULL);
insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (115,'Programa para Parqueaderos 2019 con Código Libre en PHP, Bootstrap y Java Script - ConfiguroWeb','Está todo muy claramente explicado en el vídeo subido a continuación, en adición expongo el paso a paso para que el programa quede funcional en tu ordenador a nivel local. Lo primero es descargar XAMPP, en el siguiente enlace: https://www.apachefriends.org/es/index.html Después lo instalamos de...','contenido','ConfiguroWeb','2022-11-13 18:19:04',NULL);
insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (116,'Control de Asistencia y Sistema de Nómina - ConfiguroWeb','El proceso se explica completamente en el vídeo a continuación Este software de control de asistencia y sistema de nómina gestiona los pagos por hora según el perfil de tus empleados, incluyendo deducciones como podrían ser el pago del 4% de la remuneración mensual del empleado en Colombia por...','PHP','ConfiguroWeb','2022-11-13 18:19:04',NULL);
insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (117,'Programa para Parqueaderos 2019 con Código Libre en PHP, Bootstrap y Java Script - ConfiguroWeb','Está todo muy claramente explicado en el vídeo subido a continuación, en adición expongo el paso a paso para que el programa quede funcional en tu ordenador a nivel local. Lo primero es descargar XAMPP, en el siguiente enlace: https://www.apachefriends.org/es/index.html Después lo instalamos de...','marketing','ConfiguroWeb','2022-11-13 18:19:04',NULL);
insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (118,'Sistema Administrativo de Hospitales ConfiguroWeb - ConfiguroWeb','Vídeo explicación de los aspectos funcionales de la aplicación y su puesta a punto en un servidor local Pantalla de Ingreso al sistema administrativo de hospitales Para acceder al sistema, solo es poner tus credenciales de usuario y contraseña. Como es habitual en todos mis proyectos de desarrol...','marketing','Mauricio Sevilla Britto','2022-11-13 18:19:04',NULL);
insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (119,'Programa para Parqueaderos 2019 con Código Libre en PHP, Bootstrap y Java Script - ConfiguroWeb','Está todo muy claramente explicado en el vídeo subido a continuación, en adición expongo el paso a paso para que el programa quede funcional en tu ordenador a nivel local. Lo primero es descargar XAMPP, en el siguiente enlace: https://www.apachefriends.org/es/index.html Después lo instalamos de...','desarrollo','ConfiguroWeb','2022-11-13 18:19:04',NULL);
insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (120,'Chatbot en PHP y MySQL ConfiguroWeb','Chatbot desarrollado en PHP y MySQL totalmente funcional, sencillo de utilizarEn el blog a continuación están todos los enlaces a los que hago referencia en ...','marketing','ConfiguroWeb','2022-11-13 18:19:04',NULL);
insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (121,'Sistema de Matrículas de Estudiantes en PHP [comparto el código] - ConfiguroWeb','Esta vez les comparto un sistema básico de gestión de matrículas de estudiantes en PHP. El proceso se explica completamente en el vídeo a continuación: Acceso directo a las instalación del proyecto en un servidor local Si deseas puedes acceder inmediatamente al apartado de la puesta a punto de...','contenido','Mauricio Sevilla Britto','2022-11-13 18:19:04',NULL);
insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (122,'Programa para Parqueaderos 2019 con Código Libre en PHP, Bootstrap y Java Script - ConfiguroWeb','Está todo muy claramente explicado en el vídeo subido a continuación, en adición expongo el paso a paso para que el programa quede funcional en tu ordenador a nivel local. Lo primero es descargar XAMPP, en el siguiente enlace: https://www.apachefriends.org/es/index.html Después lo instalamos de...','javascript','ConfiguroWeb','2022-11-13 18:19:04',NULL);
insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (123,'Programa para Parqueaderos 2019 con Código Libre en PHP, Bootstrap y Java Script - ConfiguroWeb','Está todo muy claramente explicado en el vídeo subido a continuación, en adición expongo el paso a paso para que el programa quede funcional en tu ordenador a nivel local. Lo primero es descargar XAMPP, en el siguiente enlace: https://www.apachefriends.org/es/index.html Después lo instalamos de...','PHP','Mauricio Sevilla Britto','2022-11-13 18:19:04',NULL);
insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (124,'Sistema de Inventario ConfiguroWeb - ConfiguroWeb','Sistema de Inventario para gestionar la información de Clientes Proveedores, Productos así como las compras y ventas de tu negocio','javascript','ConfiguroWeb','2022-11-13 18:19:04',NULL);
insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (125,'Programa para Parqueaderos 2019 con Código Libre en PHP, Bootstrap y Java Script - ConfiguroWeb','Está todo muy claramente explicado en el vídeo subido a continuación, en adición expongo el paso a paso para que el programa quede funcional en tu ordenador a nivel local. Lo primero es descargar XAMPP, en el siguiente enlace: https://www.apachefriends.org/es/index.html Después lo instalamos de...','PHP','Mauricio Sevilla Britto','2022-11-13 18:19:04',NULL);
insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (126,'Sistema de Matrículas de Estudiantes en PHP','En el siguiente enlace está la base de datos y todas las herramientas a las que hago referencia en el vídeohttps://configuroweb.com/sistema-de-matriculas...','contenido','Mauricio Sevilla Britto','2022-11-13 18:19:04',NULL);
insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (127,'Programa para Parqueaderos 2019 con Código Libre en PHP, Bootstrap y Java Script - ConfiguroWeb','Está todo muy claramente explicado en el vídeo subido a continuación, en adición expongo el paso a paso para que el programa quede funcional en tu ordenador a nivel local. Lo primero es descargar XAMPP, en el siguiente enlace: https://www.apachefriends.org/es/index.html Después lo instalamos de...','javascript','ConfiguroWeb','2022-11-13 18:19:04',NULL);
insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (128,'Sistema de Gestión de Tareas de Empleados en PHP y MySQL - ConfiguroWeb','El Sistema de Gestión de Tareas de Empleados permite gestionar en orden las diferentes tareas que puede tener un funcionario de alguna empresa','javascript','ConfiguroWeb','2022-11-13 18:19:04',NULL);
insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (129,'Programa para Parqueaderos 2019 con Código Libre en PHP, Bootstrap y Java Script - ConfiguroWeb','Está todo muy claramente explicado en el vídeo subido a continuación, en adición expongo el paso a paso para que el programa quede funcional en tu ordenador a nivel local. Lo primero es descargar XAMPP, en el siguiente enlace: https://www.apachefriends.org/es/index.html Después lo instalamos de...','contenido','ConfiguroWeb','2022-11-13 18:19:04',NULL);
insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (130,'Como enviar correos gmail desde PHP con la función mail() en localhost con XAMPP - ConfiguroWeb','Si tienes familiaridad con lo que buscas puedes entrar directamente en materia desde la configuración del archivo php.ini En el vídeo a continuación se explica el proceso completo paso a paso: Muchos de mis proyectos llegan al punto de enviar un correo y ahí toca tener imaginación porque no se ...','javascript','Mauricio Sevilla Britto','2022-11-13 18:19:04',NULL);
insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (131,'Cómo hacer un Listador de Ítems en Javascript - ConfiguroWeb','Aprende cómo hacer un listador de ítems en Javascript, comparto el código.','desarrollo','Mauricio Sevilla Britto','2022-11-13 18:19:04',NULL);
insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (132,'Programa para Parqueaderos 2019 con Código Libre en PHP, Bootstrap y Java Script - ConfiguroWeb','Está todo muy claramente explicado en el vídeo subido a continuación, en adición expongo el paso a paso para que el programa quede funcional en tu ordenador a nivel local. Lo primero es descargar XAMPP, en el siguiente enlace: https://www.apachefriends.org/es/index.html Después lo instalamos de...','javascript','ConfiguroWeb','2022-11-13 18:19:04',NULL);
insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (133,'Registro de Usuario, Login y Cambio de Contraseña en PHP y MySQL - ConfiguroWeb','Dándole continuidad al proceso de se explica como enviar correos gmail desde PHP con la función mail() en localhost con XAMPP ahora se implementa un sistema de olvidé mi contraseña que te envía un correo electrónico a tu buzón con un enlace para reiniciar tu contraseña. Sencillamente pones t...','desarrollo','ConfiguroWeb','2022-11-13 18:19:04',NULL);
insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (134,'Programa para Parqueaderos 2019 con Código Libre en PHP, Bootstrap y Java Script - ConfiguroWeb','Está todo muy claramente explicado en el vídeo subido a continuación, en adición expongo el paso a paso para que el programa quede funcional en tu ordenador a nivel local. Lo primero es descargar XAMPP, en el siguiente enlace: https://www.apachefriends.org/es/index.html Después lo instalamos de...','PHP','Mauricio Sevilla Britto','2022-11-13 18:19:04',NULL);
insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (135,'Programa para Parqueaderos 2019 con Código Libre en PHP, Bootstrap y Java Script - ConfiguroWeb','Está todo muy claramente explicado en el vídeo subido a continuación, en adición expongo el paso a paso para que el programa quede funcional en tu ordenador a nivel local. Lo primero es descargar XAMPP, en el siguiente enlace: https://www.apachefriends.org/es/index.html Después lo instalamos de...','PHP','Mauricio Sevilla Britto','2022-11-13 18:19:04',NULL);
insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (136,'Como enviar correos gmail desde PHP con la función mail en localhost con XAMPP','Se explica todo el proceso incluyendo la configuración del documento php.ini el sendmail.ini y las validaciones necesarias del lado de Gmail.En el enlace a c...','javascript','Mauricio Sevilla Britto','2022-11-13 18:19:04',NULL);
insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (137,'Programa para Parqueaderos 2019 con Código Libre en PHP, Bootstrap y Java Script - ConfiguroWeb','Está todo muy claramente explicado en el vídeo subido a continuación, en adición expongo el paso a paso para que el programa quede funcional en tu ordenador a nivel local. Lo primero es descargar XAMPP, en el siguiente enlace: https://www.apachefriends.org/es/index.html Después lo instalamos de...','PHP','Mauricio Sevilla Britto','2022-11-13 18:19:04',NULL);
insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (138,'Sistema de Inventario ConfiguroWeb','El sistema organiza la gestión de clientes, distribuidores, productos, control de existencias, compras y ventas.En el enlace a continuación se muestran todas...','desarrollo','ConfiguroWeb','2022-11-13 18:19:04',NULL);
insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (139,'Descargar archivos CSV de tabla con PHP y MySQL - ConfiguroWeb','Se comparte aplicación que permite descargar archivos CSV de tabla con PHP y MySQL se explica brevemente el proceso','contenido','Mauricio Sevilla Britto','2022-11-13 18:19:04',NULL);
insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (140,'¿Cómo Instalar WordPress en Local con Xampp? [2020]','Para instalar WordPress en un servidor local con XAMPP es necesario descargar WordPress en el siguiente enlace:https://es-co.wordpress.org/Del mismo modo se ...','PHP','ConfiguroWeb','2022-11-13 18:19:04',NULL);
insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (141,'Proyecto de Red Social en PHP y MySQL [comparto el código] - ConfiguroWeb','Se diseñó una red social en PHP con el gestor de base de datos Maria DB de XAMPP, se comparte el código en GitHub y se explica el proceso a cabalidad desde la descarga de cada aplicación su instalación y la puesta a punto en un ordenador con un sistema operativo de Windows 10 y […]','desarrollo','ConfiguroWeb','2022-11-13 18:19:04',NULL);
insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (142,'Cómo dar Like Automático por Palabra Clave en Twitter con Python - ConfiguroWeb','En el vídeo a continuación se explica en Twitter, como dar like automático desde tu ordenador por palabra clave, con Python, en adición se explica como hacer el proceso de retweet. En aras de ser muy claro en el proceso, se explica todo lo necesario, desde la instalación de Python, la sugerenci...','marketing','ConfiguroWeb','2022-11-13 18:19:04',NULL);
insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (143,'Sistema Completo para Colegios [Comparto el Código] - ConfiguroWeb','El proceso se explica por completo en el vídeo a continuación: Para la puesta a punto del proyecto, se debe implementar un servidor local y con un gestor de repositorios descargar el proyecto de GitHub. Descarga he instalación de XAMPP Para la implementación del servidor local, se debe descargar...','javascript','Mauricio Sevilla Britto','2022-11-13 18:19:04',NULL);
insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (144,'Parqueadero ConfiguroWeb Página Sencilla Para Registro de Carros en un Parqueadero [Se Comparte el Código] - ConfiguroWeb','En el siguiente vídeo se explica el proceso para la descarga del proyecto y puesta a punto. La pagina está operativa en GitHub Pages en el siguiente enlace: https://configuroweb.github.io/parkingcw/ Previamente había hecho un blog post sobre un software administrador de parqueaderos implementado ...','javascript','Mauricio Sevilla Britto','2022-11-13 18:19:04',NULL);
insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (145,'Sistema de gestión de asistencia usando PHP y MySQL','El sistema es bastante robusto, tiene el apartado de Unidad y Cursos, se pueden gestionar estudiantes y realizar de manera efectiva el control de asistencia....','marketing','ConfiguroWeb','2022-11-13 18:19:04',NULL);
insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (146,'Operaciones Matemáticas en PHP - Curso PHP ConfiguroWeb - 14','El presente tutorial sobre PHP desde básico hasta avanzado, se lanza en este canal, para ayudar a la mayor cantidad de personas posibles de manera gratuita.E...','marketing','Mauricio Sevilla Britto','2022-11-13 18:19:04',NULL);
insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (147,'Sistema de Votación en PHP y MySQL [comparto el código] - ConfiguroWeb','El proceso se explica a cabalidad en el vídeo relacionado: Descarga del Proyecto del Sistema de Votación El enlace del repositorio de GitHub relacionado es el siguiente: https://github.com/configuroweb/votaciononline Aplicaciones necesarias para el funcionamiento local del proyecto Descarga he Ins...','desarrollo','Mauricio Sevilla Britto','2022-11-13 18:19:04',NULL);
insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (148,'Programa para Gimnasios Titan Gym Comparto el Código en PHP y MySQL - ConfiguroWeb','En el vídeo a continuación se explica la funcionalidad del programa y su puesta a punto en un servidor local, con XAMPP y GIT, para la descarga del proyecto de mi repositorio en GitHub. Proceso de Descarga he Instalación de XAMPP El enlace de descarga de XAMPP es el siguiente: https://www.apachef...','desarrollo','Mauricio Sevilla Britto','2022-11-13 18:19:04',NULL);
insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (149,'Generador QR en PHP Comparto el Código - ConfiguroWeb','El proceso se explica en su totalidad en el vídeo a continuación. Que es un generador QR Un código QR es la versión avanzada de los códigos de barras podría decirse que es un código de barras bi dimensional. Los códigos QR tienen la facultad de grabar direcciones web, pueden gestionar correo...','marketing','Mauricio Sevilla Britto','2022-11-13 18:19:04',NULL);
insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (150,'Sistema de Control de Pagos Colegio','Este sistema lista los estudiantes ingresados, los pagos realizados, la deuda inicial, su balance respectivo. Se pueden gestionar los bancos relacionados con...','PHP','ConfiguroWeb','2022-11-13 18:19:04',NULL);
insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (151,'Sistema Web de Pedidos en PHP y MySQL - ConfiguroWeb','Como es habitual se explica el proceso de la puesta a punto del proyecto en un servidor local en el siguiente vídeo: Repositorio GitHub Entregas El enlace de descarga del repositorio en GitHub es el siguiente: Gestión de la Base de Datos Se debe crear una base de datos con el nombre smss_db y lueg...','javascript','Mauricio Sevilla Britto','2022-11-13 18:19:04',NULL);
insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (152,'Get Started - IFTTT','Sign up for a free IFTTT account to connect Google, Alexa, Twitter, Instagram, Fitbit, Slack, and hundreds more of your favorite apps and devices.','marketing','ConfiguroWeb','2022-11-13 18:19:04',NULL);
insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (153,'Software de Gestión para Peluquerías Centros de Estética Belleza y SPA Full Gratis!!','Sistema integral de Gestión para Peluquerías Centros de Estética Belleza y SPAS incluyendo CMS, se puede modificar sin skilles de programación la página de A...','javascript','ConfiguroWeb','2022-11-13 18:19:04',NULL);
insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (154,'Sistema POS, Se Comparte Código, Se explica, Instalación Local y Subida a Heroku, Incluyendo la Configuración de la Base de Datos MySQL. - ConfiguroWeb','En el vídeo a continuación, se explica el código y los procesos necesarios para llevar a feliz término la implementación de la aplicación tanto a nivel local, como la subida a Heroku, todo el proceso totalmente gratis. Enlaces de descarga Sistema POS ConfiguroWeb A continuación se muestra el ...','javascript','ConfiguroWeb','2022-11-13 18:19:04',NULL);
insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (155,'Sistema Web de Inventario Simple en PHP MySQL','Sistema web super ligero diseñado en PHP y MySQL, consiste básicamente en un crud de usuario y otro crud de producto, donde se pueden agregar, eliminar, actu...','javascript','ConfiguroWeb','2022-11-13 18:19:04',NULL);
insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (156,'SISTEMA HOTELERO Pensión Estudiantil, desarrollada en PHP y MySQL [Comparto el Código] - ConfiguroWeb','El proceso de implementación y funcionalidad de la aplicación, se explica en el vídeo a continuación: Enlaces de descarga del SISTEMA HOTELERO Pensión Estudiantil PHP en PHP y MySQL Enlace GitHub https://github.com/configuroweb/pension Enlace Google Drive https://drive.google.com/open?id=1lfwZp...','javascript','Mauricio Sevilla Britto','2022-11-13 18:19:04',NULL);
insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (157,'Control de Asistencia y Sistema de Nómina - ConfiguroWeb','El proceso se explica completamente en el vídeo a continuación Este software de control de asistencia y sistema de nómina gestiona los pagos por hora según el perfil de tus empleados, incluyendo deducciones como podrían ser el pago del 4% de la remuneración mensual del empleado en Colombia por...','desarrollo','ConfiguroWeb','2022-11-13 18:19:04',NULL);
insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (158,'Sistema Administrativo de Hospitales ConfiguroWeb - ConfiguroWeb','Vídeo explicación de los aspectos funcionales de la aplicación y su puesta a punto en un servidor local Pantalla de Ingreso al sistema administrativo de hospitales Para acceder al sistema, solo es poner tus credenciales de usuario y contraseña. Como es habitual en todos mis proyectos de desarrol...','javascript','ConfiguroWeb','2022-11-13 18:19:04',NULL);
insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (159,'Sistema de Matrículas de Estudiantes en PHP [comparto el código] - ConfiguroWeb','Esta vez les comparto un sistema básico de gestión de matrículas de estudiantes en PHP. El proceso se explica completamente en el vídeo a continuación: Acceso directo a las instalación del proyecto en un servidor local Si deseas puedes acceder inmediatamente al apartado de la puesta a punto de...','javascript','Mauricio Sevilla Britto','2022-11-13 18:19:04',NULL);
insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (160,'Sistema de Inventario ConfiguroWeb - ConfiguroWeb','Sistema de Inventario para gestionar la información de Clientes Proveedores, Productos así como las compras y ventas de tu negocio','javascript','ConfiguroWeb','2022-11-13 18:19:04',NULL);
insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (161,'Sistema de Matrículas de Estudiantes en PHP','En el siguiente enlace está la base de datos y todas las herramientas a las que hago referencia en el vídeohttps://configuroweb.com/46-aplicaciones-gratu...','desarrollo','Mauricio Sevilla Britto','2022-11-13 18:19:04',NULL);
insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (162,'Sistema de Gestión de Tareas de Empleados en PHP y MySQL - ConfiguroWeb','El Sistema de Gestión de Tareas de Empleados permite gestionar en orden las diferentes tareas que puede tener un funcionario de alguna empresa','marketing','ConfiguroWeb','2022-11-13 18:19:04',NULL);
insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (163,'Como enviar correos gmail desde PHP con la función mail() en localhost con XAMPP - ConfiguroWeb','Si tienes familiaridad con lo que buscas puedes entrar directamente en materia desde la configuración del archivo php.ini En el vídeo a continuación se explica el proceso completo paso a paso: Muchos de mis proyectos llegan al punto de enviar un correo y ahí toca tener imaginación porque no se ...','PHP','Mauricio Sevilla Britto','2022-11-13 18:19:04',NULL);
insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (164,'Cómo hacer un Listador de Ítems en Javascript - ConfiguroWeb','Aprende cómo hacer un listador de ítems en Javascript, comparto el código.','contenido','ConfiguroWeb','2022-11-13 18:19:04',NULL);
insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (165,'Registro de Usuario, Login y Cambio de Contraseña en PHP y MySQL - ConfiguroWeb','Dándole continuidad al proceso de se explica como enviar correos gmail desde PHP con la función mail() en localhost con XAMPP ahora se implementa un sistema de olvidé mi contraseña que te envía un correo electrónico a tu buzón con un enlace para reiniciar tu contraseña. Sencillamente pones t...','javascript','ConfiguroWeb','2022-11-13 18:19:04',NULL);
insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (166,'Como enviar correos gmail desde PHP con la función mail en localhost con XAMPP','Se explica todo el proceso incluyendo la configuración del documento php.ini el sendmail.ini y las validaciones necesarias del lado de Gmail.En el enlace a c...','javascript','Mauricio Sevilla Britto','2022-11-13 18:19:04',NULL);
insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (167,'Sistema de Inventario ConfiguroWeb','El sistema organiza la gestión de clientes, distribuidores, productos, control de existencias, compras y ventas.En el enlace a continuación se muestran todas...','contenido','ConfiguroWeb','2022-11-13 18:19:04',NULL);
insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (168,'Descargar archivos CSV de tabla con PHP y MySQL - ConfiguroWeb','Se comparte aplicación que permite descargar archivos CSV de tabla con PHP y MySQL se explica brevemente el proceso','desarrollo','ConfiguroWeb','2022-11-13 18:19:04',NULL);
insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (169,'¿Cómo Instalar WordPress en Local con Xampp? [2020]','Para instalar WordPress en un servidor local con XAMPP es necesario descargar WordPress en el siguiente enlace:https://es-co.wordpress.org/Del mismo modo se ...','javascript','ConfiguroWeb','2022-11-13 18:19:04',NULL);
insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (170,'Programación Orientada a Objetos en PHP - Tutorial ConfiguroWeb - 26 Parte 1','El presente tutorial sobre PHP desde básico hasta avanzado, se lanza en este canal, para ayudar a la mayor cantidad de personas posibles de manera gratuita.E...','desarrollo','ConfiguroWeb','2022-11-13 18:19:04',NULL);
insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (171,'Proyecto de Red Social en PHP y MySQL [comparto el código] - ConfiguroWeb','Se diseñó una red social en PHP con el gestor de base de datos Maria DB de XAMPP, se comparte el código en GitHub y se explica el proceso a cabalidad desde la descarga de cada aplicación su instalación y la puesta a punto en un ordenador con un sistema operativo de Windows 10 y […]','contenido','Mauricio Sevilla Britto','2022-11-13 18:19:04',NULL);
insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (172,'Cómo dar Like Automático por Palabra Clave en Twitter con Python - ConfiguroWeb','En el vídeo a continuación se explica en Twitter, como dar like automático desde tu ordenador por palabra clave, con Python, en adición se explica como hacer el proceso de retweet. En aras de ser muy claro en el proceso, se explica todo lo necesario, desde la instalación de Python, la sugerenci...','contenido','Mauricio Sevilla Britto','2022-11-13 18:19:04',NULL);
insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (173,'Sistema Completo para Colegios [Comparto el Código] - ConfiguroWeb','El proceso se explica por completo en el vídeo a continuación: Para la puesta a punto del proyecto, se debe implementar un servidor local y con un gestor de repositorios descargar el proyecto de GitHub. Descarga he instalación de XAMPP Para la implementación del servidor local, se debe descargar...','PHP','Mauricio Sevilla Britto','2022-11-13 18:19:04',NULL);
insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (174,'Parqueadero ConfiguroWeb Página Sencilla Para Registro de Carros en un Parqueadero [Se Comparte el Código] - ConfiguroWeb','En el siguiente vídeo se explica el proceso para la descarga del proyecto y puesta a punto. La pagina está operativa en GitHub Pages en el siguiente enlace: https://configuroweb.github.io/parkingcw/ Previamente había hecho un blog post sobre un software administrador de parqueaderos implementado ...','PHP','ConfiguroWeb','2022-11-13 18:19:04',NULL);
insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (175,'Sistema de gestión de asistencia usando PHP y MySQL','El sistema es bastante robusto, tiene el apartado de Unidad y Cursos, se pueden gestionar estudiantes y realizar de manera efectiva el control de asistencia....','desarrollo','ConfiguroWeb','2022-11-13 18:19:04',NULL);
insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (176,'Operaciones Matemáticas en PHP - Curso PHP ConfiguroWeb - 14','El presente tutorial sobre PHP desde básico hasta avanzado, se lanza en este canal, para ayudar a la mayor cantidad de personas posibles de manera gratuita.E...','marketing','ConfiguroWeb','2022-11-13 18:19:04',NULL);
insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (177,'Programa para Gimnasios Titan Gym Comparto el Código en PHP y MySQL - ConfiguroWeb','En el vídeo a continuación se explica la funcionalidad del programa y su puesta a punto en un servidor local, con XAMPP y GIT, para la descarga del proyecto de mi repositorio en GitHub. Proceso de Descarga he Instalación de XAMPP El enlace de descarga de XAMPP es el siguiente: https://www.apachef...','contenido','Mauricio Sevilla Britto','2022-11-13 18:19:04',NULL);
insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (178,'Sistema de Votación en PHP y MySQL [comparto el código] - ConfiguroWeb','El proceso se explica a cabalidad en el vídeo relacionado: Descarga del Proyecto del Sistema de Votación El enlace del repositorio de GitHub relacionado es el siguiente: https://github.com/configuroweb/votaciononline Aplicaciones necesarias para el funcionamiento local del proyecto Descarga he Ins...','PHP','ConfiguroWeb','2022-11-13 18:19:04',NULL);
insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (179,'Generador QR en PHP Comparto el Código - ConfiguroWeb','El proceso se explica en su totalidad en el vídeo a continuación. Que es un generador QR Un código QR es la versión avanzada de los códigos de barras podría decirse que es un código de barras bi dimensional. Los códigos QR tienen la facultad de grabar direcciones web, pueden gestionar correo...','marketing','Mauricio Sevilla Britto','2022-11-13 18:19:04',NULL);
insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (180,'Sistema de Control de Pagos Colegio','Este sistema lista los estudiantes ingresados, los pagos realizados, la deuda inicial, su balance respectivo. Se pueden gestionar los bancos relacionados con...','marketing','ConfiguroWeb','2022-11-13 18:19:04',NULL);
insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (181,'Sistema Web de Pedidos en PHP y MySQL - ConfiguroWeb','Como es habitual se explica el proceso de la puesta a punto del proyecto en un servidor local en el siguiente vídeo: Repositorio GitHub Entregas El enlace de descarga del repositorio en GitHub es el siguiente: Gestión de la Base de Datos Se debe crear una base de datos con el nombre smss_db y lueg...','marketing','Mauricio Sevilla Britto','2022-11-13 18:19:04',NULL);
insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (182,'IFTTT','Get started with IFTTT, the easiest way to do more with your favorite apps and devices for free. Make your home more relaxing. Make your work more productive. Keep your data private and secure. We believe every thing works better together.','PHP','ConfiguroWeb','2022-11-13 18:19:04',NULL);
insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (183,'Software de Gestión para Peluquerías Centros de Estética Belleza y SPA Full Gratis!!','Sistema integral de Gestión para Peluquerías Centros de Estética Belleza y SPAS incluyendo CMS, se puede modificar sin skilles de programación la página de A...','javascript','ConfiguroWeb','2022-11-13 18:19:04',NULL);
insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (184,'Sistema POS, Se Comparte Código, Se explica, Instalación Local y Subida a Heroku, Incluyendo la Configuración de la Base de Datos MySQL. - ConfiguroWeb','En el vídeo a continuación, se explica el código y los procesos necesarios para llevar a feliz término la implementación de la aplicación tanto a nivel local, como la subida a Heroku, todo el proceso totalmente gratis. Enlaces de descarga Sistema POS ConfiguroWeb A continuación se muestra el ...','javascript','ConfiguroWeb','2022-11-13 18:19:04',NULL);
insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (185,'Sistema Web de Inventario Simple en PHP MySQL','Sistema web super ligero diseñado en PHP y MySQL, consiste básicamente en un crud de usuario y otro crud de producto, donde se pueden agregar, eliminar, actu...','javascript','ConfiguroWeb','2022-11-13 18:19:04',NULL);
insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (186,'SISTEMA HOTELERO Pensión Estudiantil, desarrollada en PHP y MySQL [Comparto el Código] - ConfiguroWeb','El proceso de implementación y funcionalidad de la aplicación, se explica en el vídeo a continuación: Enlaces de descarga del SISTEMA HOTELERO Pensión Estudiantil PHP en PHP y MySQL Enlace GitHub https://github.com/configuroweb/pension Enlace Google Drive https://drive.google.com/open?id=1lfwZp...','desarrollo','Mauricio Sevilla Britto','2022-11-13 18:19:04',NULL);
insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (187,'Control de Asistencia y Sistema de Nómina - ConfiguroWeb','El proceso se explica completamente en el vídeo a continuación Este software de control de asistencia y sistema de nómina gestiona los pagos por hora según el perfil de tus empleados, incluyendo deducciones como podrían ser el pago del 4% de la remuneración mensual del empleado en Colombia por...','contenido','ConfiguroWeb','2022-11-13 18:19:04',NULL);
insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (188,'Sistema Administrativo de Hospitales ConfiguroWeb - ConfiguroWeb','Vídeo explicación de los aspectos funcionales de la aplicación y su puesta a punto en un servidor local Pantalla de Ingreso al sistema administrativo de hospitales Para acceder al sistema, solo es poner tus credenciales de usuario y contraseña. Como es habitual en todos mis proyectos de desarrol...','javascript','ConfiguroWeb','2022-11-13 18:19:04',NULL);
insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (189,'Sistema de Matrículas de Estudiantes en PHP [comparto el código] - ConfiguroWeb','Esta vez les comparto un sistema básico de gestión de matrículas de estudiantes en PHP. El proceso se explica completamente en el vídeo a continuación: Acceso directo a las instalación del proyecto en un servidor local Si deseas puedes acceder inmediatamente al apartado de la puesta a punto de...','contenido','Mauricio Sevilla Britto','2022-11-13 18:19:04',NULL);
insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (190,'Sistema de Inventario ConfiguroWeb - ConfiguroWeb','Sistema de Inventario para gestionar la información de Clientes Proveedores, Productos así como las compras y ventas de tu negocio','PHP','Mauricio Sevilla Britto','2022-11-13 18:19:04',NULL);
insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (191,'Sistema de Matrículas de Estudiantes en PHP','En el siguiente enlace está la base de datos y todas las herramientas a las que hago referencia en el vídeohttps://configuroweb.com/46-aplicaciones-gratu...','javascript','ConfiguroWeb','2022-11-13 18:19:04',NULL);
insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (192,'Sistema de Gestión de Tareas de Empleados en PHP y MySQL - ConfiguroWeb','El Sistema de Gestión de Tareas de Empleados permite gestionar en orden las diferentes tareas que puede tener un funcionario de alguna empresa','contenido','ConfiguroWeb','2022-11-13 18:19:04',NULL);
insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (193,'Como enviar correos gmail desde PHP con la función mail() en localhost con XAMPP - ConfiguroWeb','Si tienes familiaridad con lo que buscas puedes entrar directamente en materia desde la configuración del archivo php.ini En el vídeo a continuación se explica el proceso completo paso a paso: Muchos de mis proyectos llegan al punto de enviar un correo y ahí toca tener imaginación porque no se ...','PHP','Mauricio Sevilla Britto','2022-11-13 18:19:04',NULL);
insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (194,'Cómo hacer un Listador de Ítems en Javascript - ConfiguroWeb','Aprende cómo hacer un listador de ítems en Javascript, comparto el código.','contenido','ConfiguroWeb','2022-11-13 18:19:04',NULL);
insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (195,'Registro de Usuario, Login y Cambio de Contraseña en PHP y MySQL - ConfiguroWeb','Dándole continuidad al proceso de se explica como enviar correos gmail desde PHP con la función mail() en localhost con XAMPP ahora se implementa un sistema de olvidé mi contraseña que te envía un correo electrónico a tu buzón con un enlace para reiniciar tu contraseña. Sencillamente pones t...','desarrollo','Mauricio Sevilla Britto','2022-11-13 18:19:04',NULL);
insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (196,'Como enviar correos gmail desde PHP con la función mail en localhost con XAMPP','Se explica todo el proceso incluyendo la configuración del documento php.ini el sendmail.ini y las validaciones necesarias del lado de Gmail.En el enlace a c...','contenido','Mauricio Sevilla Britto','2022-11-13 18:19:04',NULL);
insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (197,'Sistema de Inventario ConfiguroWeb','El sistema organiza la gestión de clientes, distribuidores, productos, control de existencias, compras y ventas.En el enlace a continuación se muestran todas...','javascript','Mauricio Sevilla Britto','2022-11-13 18:19:04',NULL);
insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (198,'Descargar archivos CSV de tabla con PHP y MySQL - ConfiguroWeb','Se comparte aplicación que permite descargar archivos CSV de tabla con PHP y MySQL se explica brevemente el proceso','PHP','Mauricio Sevilla Britto','2022-11-13 18:19:04',NULL);
insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (199,'¿Cómo Instalar WordPress en Local con Xampp? [2020]','Para instalar WordPress en un servidor local con XAMPP es necesario descargar WordPress en el siguiente enlace:https://es-co.wordpress.org/Del mismo modo se ...','marketing','Mauricio Sevilla Britto','2022-11-13 18:19:04',NULL);
insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (200,'Programación Orientada a Objetos en PHP - Tutorial ConfiguroWeb - 26 Parte 1','El presente tutorial sobre PHP desde básico hasta avanzado, se lanza en este canal, para ayudar a la mayor cantidad de personas posibles de manera gratuita.E...','marketing','ConfiguroWeb','2022-11-13 18:19:04',NULL);
insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (201,'Proyecto de Red Social en PHP y MySQL [comparto el código] - ConfiguroWeb','Se diseñó una red social en PHP con el gestor de base de datos Maria DB de XAMPP, se comparte el código en GitHub y se explica el proceso a cabalidad desde la descarga de cada aplicación su instalación y la puesta a punto en un ordenador con un sistema operativo de Windows 10 y...','desarrollo','ConfiguroWeb','2022-11-13 18:19:04',NULL);
insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (202,'Cómo dar Like Automático por Palabra Clave en Twitter con Python - ConfiguroWeb','En el vídeo a continuación se explica en Twitter, como dar like automático desde tu ordenador por palabra clave, con Python, en adición se explica como hacer el proceso de retweet. En aras de ser muy claro en el proceso, se explica todo lo necesario, desde la instalación de Python, la sugerenci...','javascript','ConfiguroWeb','2022-11-13 18:19:04',NULL);
insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (203,'Sistema Completo para Colegios [Comparto el Código] - ConfiguroWeb','El proceso se explica por completo en el vídeo a continuación: Para la puesta a punto del proyecto, se debe implementar un servidor local y con un gestor de repositorios descargar el proyecto de GitHub. Descarga he instalación de XAMPP Para la implementación del servidor local, se debe descargar...','contenido','Mauricio Sevilla Britto','2022-11-13 18:19:04',NULL);
insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (204,'Parqueadero ConfiguroWeb Página Sencilla Para Registro de Carros en un Parqueadero [Se Comparte el Código] - ConfiguroWeb','En el siguiente vídeo se explica el proceso para la descarga del proyecto y puesta a punto. La pagina está operativa en GitHub Pages en el siguiente enlace: https://configuroweb.github.io/parkingcw/ Previamente había hecho un blog post sobre un software administrador de parqueaderos implementado ...','PHP','ConfiguroWeb','2022-11-13 18:19:04',NULL);
insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (205,'Sistema de gestión de asistencia usando PHP y MySQL','El sistema es bastante robusto, tiene el apartado de Unidad y Cursos, se pueden gestionar estudiantes y realizar de manera efectiva el control de asistencia....','marketing','ConfiguroWeb','2022-11-13 18:19:04',NULL);
insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (206,'Operaciones Matemáticas en PHP - Curso PHP ConfiguroWeb - 14','El presente tutorial sobre PHP desde básico hasta avanzado, se lanza en este canal, para ayudar a la mayor cantidad de personas posibles de manera gratuita.E...','javascript','ConfiguroWeb','2022-11-13 18:19:04',NULL);
insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (207,'Sistema de Votación en PHP y MySQL [comparto el código] - ConfiguroWeb','El proceso se explica a cabalidad en el vídeo relacionado: Descarga del Proyecto del Sistema de Votación El enlace del repositorio de GitHub relacionado es el siguiente: https://github.com/configuroweb/votaciononline Aplicaciones necesarias para el funcionamiento local del proyecto Descarga he Ins...','PHP','ConfiguroWeb','2022-11-13 18:19:04',NULL);
insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (208,'Programa para Gimnasios Titan Gym Comparto el Código en PHP y MySQL - ConfiguroWeb','En el vídeo a continuación se explica la funcionalidad del programa y su puesta a punto en un servidor local, con XAMPP y GIT, para la descarga del proyecto de mi repositorio en GitHub. Proceso de Descarga he Instalación de XAMPP El enlace de descarga de XAMPP es el siguiente: https://www.apachef...','javascript','Mauricio Sevilla Britto','2022-11-13 18:19:04',NULL);
insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (209,'Generador QR en PHP Comparto el Código - ConfiguroWeb','El proceso se explica en su totalidad en el vídeo a continuación. Que es un generador QR Un código QR es la versión avanzada de los códigos de barras podría decirse que es un código de barras bi dimensional. Los códigos QR tienen la facultad de grabar direcciones web, pueden gestionar correo...','desarrollo','Mauricio Sevilla Britto','2022-11-13 18:19:04',NULL);
insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (210,'Sistema de Control de Pagos Colegio','Este sistema lista los estudiantes ingresados, los pagos realizados, la deuda inicial, su balance respectivo. Se pueden gestionar los bancos relacionados con...','contenido','ConfiguroWeb','2022-11-13 18:19:04',NULL);
insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (211,'Sistema Web de Pedidos en PHP y MySQL - ConfiguroWeb','Como es habitual se explica el proceso de la puesta a punto del proyecto en un servidor local en el siguiente vídeo: Repositorio GitHub Entregas El enlace de descarga del repositorio en GitHub es el siguiente: Gestión de la Base de Datos Se debe crear una base de datos con el nombre smss_db y lueg...','contenido','Mauricio Sevilla Britto','2022-11-13 18:19:04',NULL);
insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (212,'IFTTT','Get started with IFTTT, the easiest way to do more with your favorite apps and devices for free. Make your home more relaxing. Make your work more productive. Keep your data private and secure. We believe every thing works better together.','marketing','Mauricio Sevilla Britto','2022-11-13 18:19:04',NULL);
insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (213,'Software de Gestión para Peluquerías Centros de Estética Belleza y SPA Full Gratis!!','Sistema integral de Gestión para Peluquerías Centros de Estética Belleza y SPAS incluyendo CMS, se puede modificar sin skilles de programación la página de A...','marketing','Mauricio Sevilla Britto','2022-11-13 18:19:04',NULL);
insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (214,'Sistema POS, Se Comparte Código, Se explica, Instalación Local y Subida a Heroku, Incluyendo la Configuración de la Base de Datos MySQL. - ConfiguroWeb','En el vídeo a continuación, se explica el código y los procesos necesarios para llevar a feliz término la implementación de la aplicación tanto a nivel local, como la subida a Heroku, todo el proceso totalmente gratis. Enlaces de descarga Sistema POS ConfiguroWeb A continuación se muestra el ...','contenido','Mauricio Sevilla Britto','2022-11-13 18:19:04',NULL);
insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (215,'Sistema Web de Inventario Simple en PHP MySQL','Sistema web super ligero diseñado en PHP y MySQL, consiste básicamente en un crud de usuario y otro crud de producto, donde se pueden agregar, eliminar, actu...','contenido','Mauricio Sevilla Britto','2022-11-13 18:19:04',NULL);
insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (216,'SISTEMA HOTELERO Pensión Estudiantil, desarrollada en PHP y MySQL [Comparto el Código] - ConfiguroWeb','El proceso de implementación y funcionalidad de la aplicación, se explica en el vídeo a continuación: Enlaces de descarga del SISTEMA HOTELERO Pensión Estudiantil PHP en PHP y MySQL Enlace GitHub https://github.com/configuroweb/pension Enlace Google Drive https://drive.google.com/open?id=1lfwZp...','desarrollo','ConfiguroWeb','2022-11-13 18:19:04',NULL);
insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (217,'Control de Asistencia y Sistema de Nómina - ConfiguroWeb','El proceso se explica completamente en el vídeo a continuación Este software de control de asistencia y sistema de nómina gestiona los pagos por hora según el perfil de tus empleados, incluyendo deducciones como podrían ser el pago del 4% de la remuneración mensual del empleado en Colombia por...','contenido','ConfiguroWeb','2022-11-13 18:19:04',NULL);
insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (218,'Sistema Administrativo de Hospitales ConfiguroWeb - ConfiguroWeb','Vídeo explicación de los aspectos funcionales de la aplicación y su puesta a punto en un servidor local Pantalla de Ingreso al sistema administrativo de hospitales Para acceder al sistema, solo es poner tus credenciales de usuario y contraseña. Como es habitual en todos mis proyectos de desarrol...','contenido','ConfiguroWeb','2022-11-13 18:19:04',NULL);
insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (219,'Sistema de Matrículas de Estudiantes en PHP [comparto el código] - ConfiguroWeb','Esta vez les comparto un sistema básico de gestión de matrículas de estudiantes en PHP. El proceso se explica completamente en el vídeo a continuación: Acceso directo a las instalación del proyecto en un servidor local Si deseas puedes acceder inmediatamente al apartado de la puesta a punto de...','contenido','Mauricio Sevilla Britto','2022-11-13 18:19:04',NULL);
insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (220,'Sistema de Inventario ConfiguroWeb - ConfiguroWeb','Sistema de Inventario para gestionar la información de Clientes Proveedores, Productos así como las compras y ventas de tu negocio','marketing','Mauricio Sevilla Britto','2022-11-13 18:19:04',NULL);
insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (221,'Sistema de Matrículas de Estudiantes en PHP','En el siguiente enlace está la base de datos y todas las herramientas a las que hago referencia en el vídeohttps://configuroweb.com/46-aplicaciones-gratu...','contenido','ConfiguroWeb','2022-11-13 18:19:04',NULL);
insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (222,'Sistema de Gestión de Tareas de Empleados en PHP y MySQL - ConfiguroWeb','El Sistema de Gestión de Tareas de Empleados permite gestionar en orden las diferentes tareas que puede tener un funcionario de alguna empresa','contenido','ConfiguroWeb','2022-11-13 18:19:04',NULL);
insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (223,'Como enviar correos gmail desde PHP con la función mail() en localhost con XAMPP - ConfiguroWeb','Si tienes familiaridad con lo que buscas puedes entrar directamente en materia desde la configuración del archivo php.ini En el vídeo a continuación se explica el proceso completo paso a paso: Muchos de mis proyectos llegan al punto de enviar un correo y ahí toca tener imaginación porque no se ...','marketing','Mauricio Sevilla Britto','2022-11-13 18:19:04',NULL);
insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (224,'Cómo hacer un Listador de Ítems en Javascript - ConfiguroWeb','Aprende cómo hacer un listador de ítems en Javascript, comparto el código.','marketing','ConfiguroWeb','2022-11-13 18:19:04',NULL);
insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (225,'Registro de Usuario, Login y Cambio de Contraseña en PHP y MySQL - ConfiguroWeb','Dándole continuidad al proceso de se explica como enviar correos gmail desde PHP con la función mail() en localhost con XAMPP ahora se implementa un sistema de olvidé mi contraseña que te envía un correo electrónico a tu buzón con un enlace para reiniciar tu contraseña. Sencillamente pones t...','marketing','ConfiguroWeb','2022-11-13 18:19:04',NULL);
insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (226,'Como enviar correos gmail desde PHP con la función mail en localhost con XAMPP','Se explica todo el proceso incluyendo la configuración del documento php.ini el sendmail.ini y las validaciones necesarias del lado de Gmail.En el enlace a c...','marketing','Mauricio Sevilla Britto','2022-11-13 18:19:04',NULL);
insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (227,'Sistema de Inventario ConfiguroWeb','El sistema organiza la gestión de clientes, distribuidores, productos, control de existencias, compras y ventas.En el enlace a continuación se muestran todas...','desarrollo','Mauricio Sevilla Britto','2022-11-13 18:19:04',NULL);
insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (228,'Descargar archivos CSV de tabla con PHP y MySQL - ConfiguroWeb','Se comparte aplicación que permite descargar archivos CSV de tabla con PHP y MySQL se explica brevemente el proceso','marketing','Mauricio Sevilla Britto','2022-11-13 18:19:04',NULL);
insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (229,'¿Cómo Instalar WordPress en Local con Xampp? [2020]','Para instalar WordPress en un servidor local con XAMPP es necesario descargar WordPress en el siguiente enlace:https://es-co.wordpress.org/Del mismo modo se ...','PHP','Mauricio Sevilla Britto','2022-11-13 18:19:04',NULL);
insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (230,'Chatbot en PHP y MySQL ConfiguroWeb - ConfiguroWeb','Este sistema Chatbot en PHP y MySQL está listo para su implementación en un servidor local o en hosting y tiene un coste de 20 USD','contenido','Mauricio Sevilla Britto','2022-11-13 18:19:04',NULL);
insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (231,'Programación Orientada a Objetos en PHP - Tutorial ConfiguroWeb - 26 Parte 1','El presente tutorial sobre PHP desde básico hasta avanzado, se lanza en este canal, para ayudar a la mayor cantidad de personas posibles de manera gratuita.E...','marketing','ConfiguroWeb','2022-11-13 18:19:04',NULL);
insert  into `posts`(`id`,`title`,`content`,`meta_description`,`author`,`created_at`,`updated_at`) values (232,'Sistema de Gestión de Tareas de Empleados en PHP y MySQL - ConfiguroWeb','El Sistema de Gestión de Tareas de Empleados permite gestionar en orden las diferentes tareas que puede tener un funcionario de alguna empresa','desarrollo','ConfiguroWeb','2022-11-13 18:19:04',NULL);

/*Table structure for table `prequest` */

CREATE TABLE `prequest` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `contactno` varchar(11) DEFAULT NULL,
  `company` varchar(255) DEFAULT NULL,
  `services` text DEFAULT NULL,
  `others` varchar(255) DEFAULT NULL,
  `query` longtext DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `posting_date` date DEFAULT NULL,
  `remark` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `prequest` */

insert  into `prequest`(`id`,`name`,`email`,`contactno`,`company`,`services`,`others`,`query`,`status`,`posting_date`,`remark`) values (1,'Mark Cooper','pcliente@cweb.com','3052589471','ConfiguroWeb','[\\\"Recuperaci\\\\u00f3n de Informaci\\\\u00f3n\\\"]','','Se solicita ayuda analizando el disco duro',0,'2022-11-29','Registro Observaciones');
insert  into `prequest`(`id`,`name`,`email`,`contactno`,`company`,`services`,`others`,`query`,`status`,`posting_date`,`remark`) values (2,'Juan Cliente','jcliente@cweb.com','3025897461','ConfiguroWeb','[\\\"Recuperaci\\\\u00f3n de Informaci\\\\u00f3n\\\"]','','Se solicita ayuda analizando el disco duro, para recuperar información, ya que fue eliminada.',0,'2023-01-11','Se realiza el proceso solicitado a satisfacción.');
insert  into `prequest`(`id`,`name`,`email`,`contactno`,`company`,`services`,`others`,`query`,`status`,`posting_date`,`remark`) values (3,'Juan Cliente','jcliente@cweb.com','3025897461','ConfiguroWeb','[\\\"Recuperaci\\\\u00f3n de Informaci\\\\u00f3n\\\"]','','Se necesita buscar información en el tel que previamente fue eliminado.',0,'2023-01-12','Se realiza el proceso solicitado.');
insert  into `prequest`(`id`,`name`,`email`,`contactno`,`company`,`services`,`others`,`query`,`status`,`posting_date`,`remark`) values (4,'Equis','ecorreo@cweb.com','3052589741','ConfiguroWeb','[\\\" Formateo de Dispositivo\\\"]','','Se solicita el formateo del teléfono',0,'2023-01-14','Se ejecuta el servicio solicitado efectivamente.');

/*Table structure for table `product` */

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(255) NOT NULL,
  `product_image` text NOT NULL,
  `brand_id` int(11) NOT NULL,
  `categories_id` int(11) NOT NULL,
  `quantity` varchar(255) NOT NULL,
  `rate` varchar(255) NOT NULL,
  `active` int(11) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `product` */

insert  into `product`(`product_id`,`product_name`,`product_image`,`brand_id`,`categories_id`,`quantity`,`rate`,`active`,`status`) values (1,'Bombon Figuritas','',0,1,'557','175',1,1);
insert  into `product`(`product_id`,`product_name`,`product_image`,`brand_id`,`categories_id`,`quantity`,`rate`,`active`,`status`) values (2,'Pastrami Rojo','',0,1,'125','140',2,1);
insert  into `product`(`product_id`,`product_name`,`product_image`,`brand_id`,`categories_id`,`quantity`,`rate`,`active`,`status`) values (3,'Wasaby Nova','',0,2,'233','140',1,1);
insert  into `product`(`product_id`,`product_name`,`product_image`,`brand_id`,`categories_id`,`quantity`,`rate`,`active`,`status`) values (4,'Chile Nasro','',0,2,'348','140',1,1);
insert  into `product`(`product_id`,`product_name`,`product_image`,`brand_id`,`categories_id`,`quantity`,`rate`,`active`,`status`) values (5,'Tamarindo Trucha','',0,3,'556','180',1,1);
insert  into `product`(`product_id`,`product_name`,`product_image`,`brand_id`,`categories_id`,`quantity`,`rate`,`active`,`status`) values (6,'Patacón ASO','',0,3,'545','170',2,1);
insert  into `product`(`product_id`,`product_name`,`product_image`,`brand_id`,`categories_id`,`quantity`,`rate`,`active`,`status`) values (7,'Can-Greco Mollina','',0,2,'341','180',1,1);
insert  into `product`(`product_id`,`product_name`,`product_image`,`brand_id`,`categories_id`,`quantity`,`rate`,`active`,`status`) values (8,'Paprica Verde Germina','',0,2,'438','222',1,1);
insert  into `product`(`product_id`,`product_name`,`product_image`,`brand_id`,`categories_id`,`quantity`,`rate`,`active`,`status`) values (9,'Aguacate Mill','',0,4,'432','70',1,1);

/*Table structure for table `professors` */

CREATE TABLE `professors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `department` varchar(200) NOT NULL,
  `designation` varchar(200) NOT NULL,
  `specification` varchar(500) NOT NULL,
  `status` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `professors` */

insert  into `professors`(`id`,`user_id`,`department`,`designation`,`specification`,`status`,`created`,`modified`) values (5,9,'CSE','Professor','Redes de Computadora',1,'2016-03-20 16:54:10','2016-03-20 16:54:10');
insert  into `professors`(`id`,`user_id`,`department`,`designation`,`specification`,`status`,`created`,`modified`) values (6,10,'IT','Profesor Asistente','Inteligencia Artificial',1,'2016-04-19 17:13:48','2016-04-19 17:13:48');
insert  into `professors`(`id`,`user_id`,`department`,`designation`,`specification`,`status`,`created`,`modified`) values (7,20,'CIVIL','Profesor','Ingeniero Civil',1,'2020-06-02 22:11:00','2020-06-02 22:22:26');

/*Table structure for table `publisher` */

CREATE TABLE `publisher` (
  `publisherid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `status` enum('Enable','Disable') NOT NULL,
  PRIMARY KEY (`publisherid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `publisher` */

insert  into `publisher`(`publisherid`,`name`,`status`) values (2,'Amazon publishing','Enable');
insert  into `publisher`(`publisherid`,`name`,`status`) values (3,'Penguin books ltd.','Enable');
insert  into `publisher`(`publisherid`,`name`,`status`) values (4,'Vintage Publishing','Enable');
insert  into `publisher`(`publisherid`,`name`,`status`) values (5,'Macmillan Publishers','Enable');
insert  into `publisher`(`publisherid`,`name`,`status`) values (6,'Simon &amp; Schuster','Enable');
insert  into `publisher`(`publisherid`,`name`,`status`) values (7,'HarperCollins','Enable');
insert  into `publisher`(`publisherid`,`name`,`status`) values (8,'Plum Island','Enable');
insert  into `publisher`(`publisherid`,`name`,`status`) values (9,'O’Reilly','Enable');
insert  into `publisher`(`publisherid`,`name`,`status`) values (10,'Anaya Multimedia','Enable');

/*Table structure for table `questions` */

CREATE TABLE `questions` (
  `eid` text NOT NULL,
  `qid` text NOT NULL,
  `qns` text NOT NULL,
  `choice` int(10) NOT NULL,
  `sn` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `questions` */

insert  into `questions`(`eid`,`qid`,`qns`,`choice`,`sn`) values ('5f87b7b0e5928','5f87bb9fb8c08','¿Javascript y Java son lo mismo?',4,1);
insert  into `questions`(`eid`,`qid`,`qns`,`choice`,`sn`) values ('5f87b7b0e5928','5f87bb9fbadb5','¿Javascript es un lenguaje de alto nivel?',4,2);
insert  into `questions`(`eid`,`qid`,`qns`,`choice`,`sn`) values ('5f87b7b0e5928','5f87bb9fbc859','Una función en Javascript no es un tramo de código diseñado para ejecutar una tarea específica',4,3);
insert  into `questions`(`eid`,`qid`,`qns`,`choice`,`sn`) values ('5f87b7b0e5928','5f87bb9fbeb8d','Los comentarios en Javascript se utilizan para optimizar la ejecución de sus scripts',4,4);
insert  into `questions`(`eid`,`qid`,`qns`,`choice`,`sn`) values ('5f87b7b0e5928','5f87bb9fc0bb9','Javascript es un lenguaje de programación que se puede utilizar desde el lado del servidor',4,5);
insert  into `questions`(`eid`,`qid`,`qns`,`choice`,`sn`) values ('5f88b3cd0a5d9','5f88b43712884','Para mostrar texto en la consola usamos el comando',4,1);
insert  into `questions`(`eid`,`qid`,`qns`,`choice`,`sn`) values ('5f88b3cd0a5d9','5f88b43761aa1','¿Qué símbolo se utiliza para comentar una línea de código?',4,2);

/*Table structure for table `quiz` */

CREATE TABLE `quiz` (
  `eid` text NOT NULL,
  `title` varchar(100) NOT NULL,
  `sahi` int(11) NOT NULL,
  `wrong` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `time` bigint(20) NOT NULL,
  `intro` text NOT NULL,
  `tag` varchar(100) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `quiz` */

insert  into `quiz`(`eid`,`title`,`sahi`,`wrong`,`total`,`time`,`intro`,`tag`,`date`) values ('5f87b7b0e5928','Examen De Javascript',1,1,5,5,'Examen de certificación de primer nivel de javascript','#javascripttest','2020-10-14 21:45:04');
insert  into `quiz`(`eid`,`title`,`sahi`,`wrong`,`total`,`time`,`intro`,`tag`,`date`) values ('5f88b3cd0a5d9','Python Básico',1,1,2,5,'Examen básico de Python','#pythontest','2020-10-15 16:24:50');

/*Table structure for table `rack` */

CREATE TABLE `rack` (
  `rackid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `status` enum('Enable','Disable') NOT NULL DEFAULT 'Enable',
  PRIMARY KEY (`rackid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `rack` */

insert  into `rack`(`rackid`,`name`,`status`) values (1,'R1','Enable');
insert  into `rack`(`rackid`,`name`,`status`) values (2,'R2','Enable');

/*Table structure for table `rank` */

CREATE TABLE `rank` (
  `email` varchar(50) NOT NULL,
  `score` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `rank` */

insert  into `rank`(`email`,`score`,`time`) values ('usuario@cweb.com',1,'2020-10-14 22:58:39');
insert  into `rank`(`email`,`score`,`time`) values ('operador@cweb.com',1,'2020-10-14 23:25:31');

/*Table structure for table `response_list` */

CREATE TABLE `response_list` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `form_code` varchar(100) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `response_list` */

insert  into `response_list`(`id`,`form_code`,`date_created`) values (14,'2425059741','2021-07-02 12:38:08');
insert  into `response_list`(`id`,`form_code`,`date_created`) values (15,'2425059741','2024-11-01 16:05:28');

/*Table structure for table `responses` */

CREATE TABLE `responses` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `rl_id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `responses` */

insert  into `responses`(`id`,`rl_id`,`meta_field`,`meta_value`) values (2,1,'1','Ingresar Opción,Ingresar Opción');
insert  into `responses`(`id`,`rl_id`,`meta_field`,`meta_value`) values (14,14,'0','PHP (acrónimo recursivo de PHP: Hypertext Preprocessor) es un lenguaje de código abierto muy popular especialmente adecuado para el desarrollo web y que puede ser incrustado en HTML.');
insert  into `responses`(`id`,`rl_id`,`meta_field`,`meta_value`) values (15,14,'1','Ingresar Opción, Ingresar Opción, Ingresar Opción');
insert  into `responses`(`id`,`rl_id`,`meta_field`,`meta_value`) values (16,14,'2','Ingresar Opción');
insert  into `responses`(`id`,`rl_id`,`meta_field`,`meta_value`) values (17,14,'3','1625247488_1.pdf');
insert  into `responses`(`id`,`rl_id`,`meta_field`,`meta_value`) values (18,15,'0','gfdgfdfdg');
insert  into `responses`(`id`,`rl_id`,`meta_field`,`meta_value`) values (19,15,'1','Enter Option');
insert  into `responses`(`id`,`rl_id`,`meta_field`,`meta_value`) values (20,15,'2','Enter Option');
insert  into `responses`(`id`,`rl_id`,`meta_field`,`meta_value`) values (21,15,'3','1730495128_IMG_2200.JPG');

/*Table structure for table `service_categories` */

CREATE TABLE `service_categories` (
  `category_id` int(2) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(50) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `service_categories` */

insert  into `service_categories`(`category_id`,`category_name`) values (2,'Afeitado');
insert  into `service_categories`(`category_id`,`category_name`) values (3,'Mascarilla facial');
insert  into `service_categories`(`category_id`,`category_name`) values (4,'Uncategorized');
insert  into `service_categories`(`category_id`,`category_name`) values (6,'Corte');

/*Table structure for table `services` */

CREATE TABLE `services` (
  `service_id` int(5) NOT NULL AUTO_INCREMENT,
  `service_name` varchar(50) NOT NULL,
  `service_description` varchar(255) NOT NULL,
  `service_price` decimal(6,2) NOT NULL,
  `service_duration` int(5) NOT NULL,
  `category_id` int(2) NOT NULL,
  PRIMARY KEY (`service_id`),
  KEY `FK_service_category` (`category_id`),
  CONSTRAINT `FK_service_category` FOREIGN KEY (`category_id`) REFERENCES `service_categories` (`category_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `services` */

insert  into `services`(`service_id`,`service_name`,`service_description`,`service_price`,`service_duration`,`category_id`) values (1,'Corte de Cabello','El peluquero es una persona cuya ocupación es principalmente cortar, vestir al estilo del novio y afeitar a los hombres.',21.00,20,6);
insert  into `services`(`service_id`,`service_name`,`service_description`,`service_price`,`service_duration`,`category_id`) values (2,'Peinado','El peluquero es una persona cuya ocupación es principalmente cortar, vestir al estilo del novio y afeitar a los hombres.',9.00,15,6);
insert  into `services`(`service_id`,`service_name`,`service_description`,`service_price`,`service_duration`,`category_id`) values (3,'Recorte de cabello','El peluquero es una persona cuya ocupación es principalmente cortar, vestir al estilo del novio y afeitar a los hombres.',10.00,10,6);
insert  into `services`(`service_id`,`service_name`,`service_description`,`service_price`,`service_duration`,`category_id`) values (4,'Afeitado Limpio','El peluquero es una persona cuya ocupación es principalmente cortar, vestir al estilo del novio y afeitar a los hombres.',20.00,20,2);
insert  into `services`(`service_id`,`service_name`,`service_description`,`service_price`,`service_duration`,`category_id`) values (5,'Recorte de barba','El peluquero es una persona cuya ocupación es principalmente cortar, vestir al estilo del novio y afeitar a los hombres.',20.00,15,2);
insert  into `services`(`service_id`,`service_name`,`service_description`,`service_price`,`service_duration`,`category_id`) values (6,'Afeitado suave','El peluquero es una persona cuya ocupación es principalmente cortar, vestir al estilo del novio y afeitar a los hombres.',15.00,20,2);
insert  into `services`(`service_id`,`service_name`,`service_description`,`service_price`,`service_duration`,`category_id`) values (7,'Facial blanca','El peluquero es una persona cuya ocupación es principalmente cortar, vestir al estilo del novio y afeitar a los hombres.',16.00,15,3);
insert  into `services`(`service_id`,`service_name`,`service_description`,`service_price`,`service_duration`,`category_id`) values (8,'Limpieza de Rostro','El peluquero es una persona cuya ocupación es principalmente cortar, vestir al estilo del novio y afeitar a los hombres.',20.00,20,3);
insert  into `services`(`service_id`,`service_name`,`service_description`,`service_price`,`service_duration`,`category_id`) values (9,'Afinación brillante','El peluquero es una persona cuya ocupación es principalmente cortar, vestir al estilo del novio y afeitar a los hombres.',14.00,20,3);

/*Table structure for table `services_booked` */

CREATE TABLE `services_booked` (
  `appointment_id` int(5) NOT NULL,
  `service_id` int(5) NOT NULL,
  PRIMARY KEY (`appointment_id`,`service_id`),
  KEY `FK_SB_service` (`service_id`),
  CONSTRAINT `FK_SB_appointment` FOREIGN KEY (`appointment_id`) REFERENCES `appointments` (`appointment_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_SB_service` FOREIGN KEY (`service_id`) REFERENCES `services` (`service_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_appointment` FOREIGN KEY (`appointment_id`) REFERENCES `appointments` (`appointment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `services_booked` */

insert  into `services_booked`(`appointment_id`,`service_id`) values (10,9);
insert  into `services_booked`(`appointment_id`,`service_id`) values (11,9);
insert  into `services_booked`(`appointment_id`,`service_id`) values (12,3);
insert  into `services_booked`(`appointment_id`,`service_id`) values (13,1);
insert  into `services_booked`(`appointment_id`,`service_id`) values (14,2);

/*Table structure for table `settings_tbl` */

CREATE TABLE `settings_tbl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `settings_tbl` */

insert  into `settings_tbl`(`id`,`meta_field`,`meta_value`,`created_at`,`updated_at`) values (1,'store_name','Empresa de Ropa ConfiguroWeb','2023-11-15 15:37:40','2023-12-03 19:27:32');
insert  into `settings_tbl`(`id`,`meta_field`,`meta_value`,`created_at`,`updated_at`) values (2,'store_address','Calle 87 N 23 12','2023-11-15 15:37:40','2023-12-03 19:27:32');
insert  into `settings_tbl`(`id`,`meta_field`,`meta_value`,`created_at`,`updated_at`) values (3,'store_contact','+57 316 243 00 81','2023-11-15 15:37:40','2023-12-03 19:27:32');
insert  into `settings_tbl`(`id`,`meta_field`,`meta_value`,`created_at`,`updated_at`) values (4,'footer_note','Somos la mejor empresa de Latinoamérica','2023-11-15 15:37:40','2023-12-03 19:27:32');

/*Table structure for table `staff` */

CREATE TABLE `staff` (
  `staffID` int(11) NOT NULL AUTO_INCREMENT,
  `smfname` varchar(50) NOT NULL,
  `smlname` varchar(50) NOT NULL,
  `smtype` varchar(20) NOT NULL,
  `smbd` date NOT NULL,
  `telcode` varchar(3) NOT NULL DEFAULT '+57',
  `smtel` varchar(15) NOT NULL,
  `smemail` varchar(200) NOT NULL,
  `smgender` varchar(6) NOT NULL,
  `smwoti` varchar(10) NOT NULL,
  `smaddr` varchar(600) NOT NULL,
  `instetd_by` varchar(100) DEFAULT NULL,
  `insterted_date` timestamp NULL DEFAULT current_timestamp(),
  `update_by` varchar(100) DEFAULT NULL,
  `update_date` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`staffID`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `staff` */

insert  into `staff`(`staffID`,`smfname`,`smlname`,`smtype`,`smbd`,`telcode`,`smtel`,`smemail`,`smgender`,`smwoti`,`smaddr`,`instetd_by`,`insterted_date`,`update_by`,`update_date`) values (1,'Dilan','Camargo','Doctor','1997-06-10','+57','3162584694','dcamargo@cweb.com','Male','Full','Calle 90 Carrera 22-70','configuroweb','2020-08-09 13:42:42','configuroweb','2020-08-10 00:19:38');
insert  into `staff`(`staffID`,`smfname`,`smlname`,`smtype`,`smbd`,`telcode`,`smtel`,`smemail`,`smgender`,`smwoti`,`smaddr`,`instetd_by`,`insterted_date`,`update_by`,`update_date`) values (2,'Juan','Cabrera','Doctor','1981-06-01','+57','3164578412','jcabrera@cweb.com','Male','Mañana','Calle 90 N 34-12','configuroweb','2020-08-11 11:21:47',NULL,'2020-08-11 11:21:47');
insert  into `staff`(`staffID`,`smfname`,`smlname`,`smtype`,`smbd`,`telcode`,`smtel`,`smemail`,`smgender`,`smwoti`,`smaddr`,`instetd_by`,`insterted_date`,`update_by`,`update_date`) values (3,'Juan','Curubita','Doctor','1975-09-22','+57','3124568749','jcurubita@cweb.com','Male','Tarde','Calle 32 N 12.12','configuroweb','2020-08-11 11:24:29',NULL,'2020-08-11 11:24:29');
insert  into `staff`(`staffID`,`smfname`,`smlname`,`smtype`,`smbd`,`telcode`,`smtel`,`smemail`,`smgender`,`smwoti`,`smaddr`,`instetd_by`,`insterted_date`,`update_by`,`update_date`) values (4,'Rosa','Almarales','Doctor','1981-02-11','+57','3018521234','ralmarales@cweb.com','Female','Tarde','Av 45 N 23-23','configuroweb','2020-08-11 11:31:04',NULL,'2020-08-11 11:31:04');
insert  into `staff`(`staffID`,`smfname`,`smlname`,`smtype`,`smbd`,`telcode`,`smtel`,`smemail`,`smgender`,`smwoti`,`smaddr`,`instetd_by`,`insterted_date`,`update_by`,`update_date`) values (5,'Patricia','Perez','Enfermera','1993-03-02','+57','3169874657','pperez@cweb.com','Female','Mañana','Calle 45 N 18 18','configuroweb','2020-08-11 11:47:04',NULL,'2020-08-11 11:47:04');
insert  into `staff`(`staffID`,`smfname`,`smlname`,`smtype`,`smbd`,`telcode`,`smtel`,`smemail`,`smgender`,`smwoti`,`smaddr`,`instetd_by`,`insterted_date`,`update_by`,`update_date`) values (6,'Karina','Corrales','Doctor','1996-06-11','+57','3235468719','kcorrales@cweb.com','Female','Full','Carrera 45 N 17-22','configuroweb','2020-08-11 12:05:06',NULL,'2020-08-11 12:05:06');
insert  into `staff`(`staffID`,`smfname`,`smlname`,`smtype`,`smbd`,`telcode`,`smtel`,`smemail`,`smgender`,`smwoti`,`smaddr`,`instetd_by`,`insterted_date`,`update_by`,`update_date`) values (7,'Felipe','Clavel','Other','1981-11-25','+57','3012659870','fclavel@cweb.com','Male','Evening','Calle 12 N 12 12','configuroweb','2020-08-11 15:07:44',NULL,'2020-08-11 15:07:44');

/*Table structure for table `student` */

CREATE TABLE `student` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `id_no` varchar(100) NOT NULL,
  `name` text NOT NULL,
  `contact` varchar(100) NOT NULL,
  `address` text NOT NULL,
  `email` varchar(200) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `student` */

insert  into `student`(`id`,`id_no`,`name`,`contact`,`address`,`email`,`date_created`) values (1,'1','Juan Estudiante','314','Calle 98 N 34 21','jestudiante@cweb.com','2022-05-09 22:47:02');
insert  into `student`(`id`,`id_no`,`name`,`contact`,`address`,`email`,`date_created`) values (2,'2','Pedrito Estudiante','3065824617','Avenida 23 124 N 22','pestudiante@cweb.com','2022-05-16 17:11:16');
insert  into `student`(`id`,`id_no`,`name`,`contact`,`address`,`email`,`date_created`) values (3,'3','Daniel Estudiante','3242120210','Carrera 45 N 17 82','destudiante@cweb.com','2022-05-28 18:09:30');

/*Table structure for table `student_ef_list` */

CREATE TABLE `student_ef_list` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `student_id` int(30) NOT NULL,
  `ef_no` varchar(200) NOT NULL,
  `course_id` int(30) NOT NULL,
  `total_fee` float NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `student_ef_list` */

insert  into `student_ef_list`(`id`,`student_id`,`ef_no`,`course_id`,`total_fee`,`date_created`) values (1,1,'1',1,6200,'2022-05-09 22:48:20');
insert  into `student_ef_list`(`id`,`student_id`,`ef_no`,`course_id`,`total_fee`,`date_created`) values (2,2,'2',2,66600,'2022-05-16 17:13:25');
insert  into `student_ef_list`(`id`,`student_id`,`ef_no`,`course_id`,`total_fee`,`date_created`) values (3,3,'1',1,6200,'2022-05-28 18:19:22');

/*Table structure for table `student_info` */

CREATE TABLE `student_info` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `roll` int(6) NOT NULL,
  `class` varchar(7) NOT NULL,
  `city` varchar(15) NOT NULL,
  `pcontact` varchar(11) NOT NULL,
  `photo` varchar(50) NOT NULL,
  `datetime` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `roll` (`roll`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

/*Data for the table `student_info` */

insert  into `student_info`(`id`,`name`,`roll`,`class`,`city`,`pcontact`,`photo`,`datetime`) values (48,'Emiliano Zapata',234109,'Primero','Carrera 54 N 12','3162453578','2341092020-08-14-08-34.png','2020-08-14 10:23:34');
insert  into `student_info`(`id`,`name`,`roll`,`class`,`city`,`pcontact`,`photo`,`datetime`) values (49,'Rafael Castro',234110,'Segundo','Calle 78 N 19 1','3145648712','2341102020-08-14-08-13.png','2020-08-14 10:38:13');
insert  into `student_info`(`id`,`name`,`roll`,`class`,`city`,`pcontact`,`photo`,`datetime`) values (50,'Julia Barón',234111,'Tercero','Calle 20 N 17 8','3215468719','2341112020-08-14-08-27.jpg','2020-08-14 12:19:16');
insert  into `student_info`(`id`,`name`,`roll`,`class`,`city`,`pcontact`,`photo`,`datetime`) values (51,'Natalia Cardona',234112,'Cuarto','Carrera 54 N 12','3015824671','2341122020-08-14-08-22.png','2020-08-14 14:54:22');
insert  into `student_info`(`id`,`name`,`roll`,`class`,`city`,`pcontact`,`photo`,`datetime`) values (52,'Sofia Tamayo',234113,'Quinto','Carrera 55 N 97','3147894512','2341132020-08-14-08-22.png','2020-08-14 16:51:22');

/*Table structure for table `student_list` */

CREATE TABLE `student_list` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `roll` varchar(100) NOT NULL,
  `firstname` text NOT NULL,
  `middlename` text DEFAULT NULL,
  `lastname` text NOT NULL,
  `gender` varchar(100) NOT NULL,
  `contact` text NOT NULL,
  `present_address` text NOT NULL,
  `permanent_address` text NOT NULL,
  `dob` date NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `student_list` */

insert  into `student_list`(`id`,`roll`,`firstname`,`middlename`,`lastname`,`gender`,`contact`,`present_address`,`permanent_address`,`dob`,`status`,`delete_flag`,`date_created`,`date_updated`) values (1,'231415061007','Pedro','','Estudiante','Male','09123456789','Calle 45 34 2','Carrera 32 3 24','2007-06-23',1,0,'2022-01-27 11:14:07','2022-03-18 22:19:05');
insert  into `student_list`(`id`,`roll`,`firstname`,`middlename`,`lastname`,`gender`,`contact`,`present_address`,`permanent_address`,`dob`,`status`,`delete_flag`,`date_created`,`date_updated`) values (3,'121212121','Juan','','Estudiante','Male','3022587436','Calle 59 59 59','Calle 98 98 98','2013-06-18',1,0,'2022-03-18 21:36:00',NULL);

/*Table structure for table `students` */

CREATE TABLE `students` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `roll_no` varchar(50) NOT NULL,
  `branch` varchar(200) NOT NULL,
  `start_year` int(11) NOT NULL,
  `end_year` int(11) NOT NULL,
  `semester` varchar(200) NOT NULL,
  `status` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `students` */

insert  into `students`(`id`,`user_id`,`roll_no`,`branch`,`start_year`,`end_year`,`semester`,`status`,`created`,`modified`) values (5,8,'123456','CSE',2013,2017,'Cuarto',1,'2016-03-20 16:47:12','2016-03-20 16:47:12');
insert  into `students`(`id`,`user_id`,`roll_no`,`branch`,`start_year`,`end_year`,`semester`,`status`,`created`,`modified`) values (6,10,'0188IT121020','IT',2012,2016,'Octavo',1,'2016-04-19 17:01:04','2016-04-19 17:01:04');
insert  into `students`(`id`,`user_id`,`roll_no`,`branch`,`start_year`,`end_year`,`semester`,`status`,`created`,`modified`) values (7,11,'CS81','CSE',2012,2016,'Octavo',1,'2016-04-23 19:32:47','2016-05-14 08:17:53');
insert  into `students`(`id`,`user_id`,`roll_no`,`branch`,`start_year`,`end_year`,`semester`,`status`,`created`,`modified`) values (8,12,'IT57','IT',2012,2016,'Octavo',1,'2016-04-24 08:56:56','2016-04-24 08:56:56');
insert  into `students`(`id`,`user_id`,`roll_no`,`branch`,`start_year`,`end_year`,`semester`,`status`,`created`,`modified`) values (9,13,'0188it121008','CSE',2010,2014,'Sexto',1,'2016-04-25 14:09:52','2016-04-25 14:09:52');
insert  into `students`(`id`,`user_id`,`roll_no`,`branch`,`start_year`,`end_year`,`semester`,`status`,`created`,`modified`) values (10,14,'0188it121026','IT',2012,2016,'Octavo',1,'2016-05-18 14:33:49','2016-05-18 14:35:01');
insert  into `students`(`id`,`user_id`,`roll_no`,`branch`,`start_year`,`end_year`,`semester`,`status`,`created`,`modified`) values (11,15,'0188cs111021','IT',2011,2015,'Cuarto',1,'2016-05-26 10:52:45','2016-05-26 10:56:08');
insert  into `students`(`id`,`user_id`,`roll_no`,`branch`,`start_year`,`end_year`,`semester`,`status`,`created`,`modified`) values (12,16,'0188IT121050','IT',2012,2016,'Octavo',1,'2016-05-26 12:19:15','2016-05-26 12:19:15');
insert  into `students`(`id`,`user_id`,`roll_no`,`branch`,`start_year`,`end_year`,`semester`,`status`,`created`,`modified`) values (13,17,'0188it121029','IT',2013,2017,'Tercero',1,'2020-05-30 21:52:37','2020-05-30 21:52:37');
insert  into `students`(`id`,`user_id`,`roll_no`,`branch`,`start_year`,`end_year`,`semester`,`status`,`created`,`modified`) values (14,18,'0188it12130','CSE',2016,2021,'Séptimo',1,'2020-05-31 01:05:43','2020-05-31 01:05:43');
insert  into `students`(`id`,`user_id`,`roll_no`,`branch`,`start_year`,`end_year`,`semester`,`status`,`created`,`modified`) values (15,19,'175487','IT',2020,2025,'Quinto',1,'2020-06-02 06:12:02','2020-06-02 20:05:20');
insert  into `students`(`id`,`user_id`,`roll_no`,`branch`,`start_year`,`end_year`,`semester`,`status`,`created`,`modified`) values (16,20,'175491','IT',2022,2025,'Segundo',1,'2020-06-02 21:51:47','2020-06-02 21:51:47');
insert  into `students`(`id`,`user_id`,`roll_no`,`branch`,`start_year`,`end_year`,`semester`,`status`,`created`,`modified`) values (17,9,'175575','CIVIL',2015,2020,'Octavo',1,'2020-06-02 23:07:34','2020-06-02 23:07:34');

/*Table structure for table `subjects` */

CREATE TABLE `subjects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `subjects` */

/*Table structure for table `sup_admin` */

CREATE TABLE `sup_admin` (
  `sadid` int(11) NOT NULL AUTO_INCREMENT,
  `sadiun` varchar(20) NOT NULL,
  `sadipw` varchar(500) NOT NULL,
  `sadem` varchar(50) NOT NULL,
  `saname` varchar(100) DEFAULT NULL,
  `cret_date` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`sadid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `sup_admin` */

insert  into `sup_admin`(`sadid`,`sadiun`,`sadipw`,`sadem`,`saname`,`cret_date`) values (1,'configuroweb','4b67deeb9aba04a5b54632ad19934f26','msevillab@gmail.com','Mauricio Sevilla','2017-10-04 22:49:20');

/*Table structure for table `system_info` */

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `system_info` */

insert  into `system_info`(`id`,`meta_field`,`meta_value`) values (1,'name','Sistema de Información de Estudiantes en PHP y MySQL');
insert  into `system_info`(`id`,`meta_field`,`meta_value`) values (6,'short_name','SIE');
insert  into `system_info`(`id`,`meta_field`,`meta_value`) values (11,'logo','../uploads/logo-1647660173.png');
insert  into `system_info`(`id`,`meta_field`,`meta_value`) values (13,'user_avatar','../uploads/user_avatar.jpg');
insert  into `system_info`(`id`,`meta_field`,`meta_value`) values (14,'cover','../uploads/cover-1647660173.png');

/*Table structure for table `system_settings` */

CREATE TABLE `system_settings` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `email` varchar(200) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `cover_img` text NOT NULL,
  `about_content` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `system_settings` */

/*Table structure for table `tbl_budget` */

CREATE TABLE `tbl_budget` (
  `tbl_budget_id` int(11) NOT NULL,
  `monthly_budget` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `tbl_budget` */

insert  into `tbl_budget`(`tbl_budget_id`,`monthly_budget`) values (1,10000);

/*Table structure for table `tbl_category` */

CREATE TABLE `tbl_category` (
  `tbl_category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` text NOT NULL,
  PRIMARY KEY (`tbl_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `tbl_category` */

insert  into `tbl_category`(`tbl_category_id`,`category_name`) values (1,'Desayuno');
insert  into `tbl_category`(`tbl_category_id`,`category_name`) values (2,'Almuerzo');
insert  into `tbl_category`(`tbl_category_id`,`category_name`) values (3,'Cena');
insert  into `tbl_category`(`tbl_category_id`,`category_name`) values (4,'Aperitivo');
insert  into `tbl_category`(`tbl_category_id`,`category_name`) values (7,'Postre');
insert  into `tbl_category`(`tbl_category_id`,`category_name`) values (8,'Comida rápida');

/*Table structure for table `tbl_client` */

CREATE TABLE `tbl_client` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `gender` varchar(150) NOT NULL,
  `mob_no` varchar(150) NOT NULL,
  `reffering` varchar(150) NOT NULL,
  `address` varchar(250) NOT NULL,
  `created_date_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `delete_status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `tbl_client` */

insert  into `tbl_client`(`id`,`name`,`gender`,`mob_no`,`reffering`,`address`,`created_date_time`,`delete_status`) values (1,'Pedro Cliente','Masculino','3052689471','Barranquilla','Calle 28 9 71','2023-01-17 14:31:12',0);
insert  into `tbl_client`(`id`,`name`,`gender`,`mob_no`,`reffering`,`address`,`created_date_time`,`delete_status`) values (2,'Juan Cliente','Masculino','3059877414','Cali','Calle 98 99 76','2023-01-17 14:31:05',0);
insert  into `tbl_client`(`id`,`name`,`gender`,`mob_no`,`reffering`,`address`,`created_date_time`,`delete_status`) values (3,'Daniela Cliente','Femenino','3109638741','Cali','Calle 98 90 99','2023-01-17 14:30:30',1);

/*Table structure for table `tbl_customers` */

CREATE TABLE `tbl_customers` (
  `CustomerID` int(11) NOT NULL AUTO_INCREMENT,
  `Username` varchar(30) DEFAULT NULL,
  `PASSWORD` varchar(30) DEFAULT NULL,
  `Role` varchar(30) DEFAULT NULL,
  `Firstname` varchar(30) DEFAULT NULL,
  `Middlename` varchar(30) DEFAULT NULL,
  `Lastname` varchar(30) DEFAULT NULL,
  `Address` varchar(30) DEFAULT NULL,
  `EmailAddress` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`CustomerID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `tbl_customers` */

insert  into `tbl_customers`(`CustomerID`,`Username`,`PASSWORD`,`Role`,`Firstname`,`Middlename`,`Lastname`,`Address`,`EmailAddress`) values (3,'ConfiguroWeb','1234abcd..','admin','admin','admin',NULL,'Calle 14','hola@cnofiguroweb.com');
insert  into `tbl_customers`(`CustomerID`,`Username`,`PASSWORD`,`Role`,`Firstname`,`Middlename`,`Lastname`,`Address`,`EmailAddress`) values (5,'comprador','1234abcd..','User','Daniel','Pachon','Gutierrez','Calle con Carrera','comprador@cweb.com');
insert  into `tbl_customers`(`CustomerID`,`Username`,`PASSWORD`,`Role`,`Firstname`,`Middlename`,`Lastname`,`Address`,`EmailAddress`) values (6,'mansev','1234abcd..','User','Mauricio','Sevilla','Britto','Valle del Cauca','msevillab@gmail.com');
insert  into `tbl_customers`(`CustomerID`,`Username`,`PASSWORD`,`Role`,`Firstname`,`Middlename`,`Lastname`,`Address`,`EmailAddress`) values (7,'marce','1234abcd..','User','Marcela','Castro','Paez','Cualquier Dirección','mcastro@cweb.com');

/*Table structure for table `tbl_email_config` */

CREATE TABLE `tbl_email_config` (
  `e_id` int(21) NOT NULL AUTO_INCREMENT,
  `name` varchar(500) NOT NULL,
  `mail_driver_host` varchar(5000) NOT NULL,
  `mail_port` int(50) NOT NULL,
  `mail_username` varchar(50) NOT NULL,
  `mail_password` varchar(30) NOT NULL,
  `mail_encrypt` varchar(300) NOT NULL,
  PRIMARY KEY (`e_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `tbl_email_config` */

/*Table structure for table `tbl_expense` */

CREATE TABLE `tbl_expense` (
  `tbl_expense_id` int(11) NOT NULL AUTO_INCREMENT,
  `tbl_expense_category_id` int(11) NOT NULL,
  `expense_name` text NOT NULL,
  `expense_date` date NOT NULL,
  `expense_spent` int(11) NOT NULL,
  `expense_description` text NOT NULL,
  PRIMARY KEY (`tbl_expense_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `tbl_expense` */

insert  into `tbl_expense`(`tbl_expense_id`,`tbl_expense_category_id`,`expense_name`,`expense_date`,`expense_spent`,`expense_description`) values (5,3,'Perro caliente','2023-09-06',500,'Perro caliente con los niños');
insert  into `tbl_expense`(`tbl_expense_id`,`tbl_expense_category_id`,`expense_name`,`expense_date`,`expense_spent`,`expense_description`) values (6,5,'Transporte hacía la oficina','2023-09-07',25,'Gasto transporte a la oficina');
insert  into `tbl_expense`(`tbl_expense_id`,`tbl_expense_category_id`,`expense_name`,`expense_date`,`expense_spent`,`expense_description`) values (7,3,'Comida Familiar Restaurante','2023-09-08',1500,'Comida Familiar');

/*Table structure for table `tbl_expense_category` */

CREATE TABLE `tbl_expense_category` (
  `tbl_expense_category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` text NOT NULL,
  `category_budget` int(11) NOT NULL,
  PRIMARY KEY (`tbl_expense_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `tbl_expense_category` */

insert  into `tbl_expense_category`(`tbl_expense_category_id`,`category_name`,`category_budget`) values (3,'Comida',2000);
insert  into `tbl_expense_category`(`tbl_expense_category_id`,`category_name`,`category_budget`) values (5,'Transporte',400);
insert  into `tbl_expense_category`(`tbl_expense_category_id`,`category_name`,`category_budget`) values (7,'Salud y Bienestar',2500);
insert  into `tbl_expense_category`(`tbl_expense_category_id`,`category_name`,`category_budget`) values (8,'Pago Universidad',2000);

/*Table structure for table `tbl_member` */

CREATE TABLE `tbl_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(200) NOT NULL,
  `email` varchar(255) NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `tbl_member` */

insert  into `tbl_member`(`id`,`username`,`password`,`email`,`create_at`) values (1,'configuroweb','$2y$10$Ee5AvRodBskPff0WPt1e4.C91prdF3bQzRmIP2ODwtCvuVILDZd2.','hola@configuroweb.com','2023-10-07 11:06:15');
insert  into `tbl_member`(`id`,`username`,`password`,`email`,`create_at`) values (2,'musuario','$2y$10$5nnz/AkDHD0TnLUxcff5hOBf7z/D6juQygUOv0M/eXIje9vP.ot6m','musuario@cweb.com','2023-10-07 11:14:01');

/*Table structure for table `tbl_order` */

CREATE TABLE `tbl_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `currency` varchar(255) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `tbl_order` */

insert  into `tbl_order`(`id`,`order_id`,`name`,`email`,`currency`,`amount`,`create_at`) values (1,'h8vqThCQV7','Mauricio Sevilla','msevillab@gmail.com','USD',1500.00,'2022-06-14 14:42:13');
insert  into `tbl_order`(`id`,`order_id`,`name`,`email`,`currency`,`amount`,`create_at`) values (2,'vw2WFNlUo1','Mauricio Sevilla','msevillab@gmail.com','USD',1500.00,'2022-06-14 15:03:47');
insert  into `tbl_order`(`id`,`order_id`,`name`,`email`,`currency`,`amount`,`create_at`) values (3,'mpE0zYale1','Mauricio Sevilla','msevillab@gmail.com','COP',1500.00,'2022-06-14 15:47:21');
insert  into `tbl_order`(`id`,`order_id`,`name`,`email`,`currency`,`amount`,`create_at`) values (4,'avInb9hSQ7','Mauricio Sevilla','msevillab@gmail.com','COP',1500.00,'2022-06-14 16:27:16');
insert  into `tbl_order`(`id`,`order_id`,`name`,`email`,`currency`,`amount`,`create_at`) values (5,'fjh6cVSckJ','Mauricio Sevilla','msevillab@gmail.com','COP',1500.00,'2022-06-14 16:33:09');
insert  into `tbl_order`(`id`,`order_id`,`name`,`email`,`currency`,`amount`,`create_at`) values (6,'fgBYdGvSBZ','Pedro Varela','msevillab@gmail.com','COP',1500.00,'2022-06-14 16:35:11');
insert  into `tbl_order`(`id`,`order_id`,`name`,`email`,`currency`,`amount`,`create_at`) values (7,'CDzTlwsBVy','Mauricio Sevilla','msevillab@gmail.com','COP',1500.00,'2022-06-14 16:37:10');
insert  into `tbl_order`(`id`,`order_id`,`name`,`email`,`currency`,`amount`,`create_at`) values (8,'GNT54XStQt','Mauricio Sevilla','msevillab@gmail.com','COP',1500.00,'2022-06-14 20:52:51');

/*Table structure for table `tbl_order_items` */

CREATE TABLE `tbl_order_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `item_price` decimal(10,2) NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `tbl_order_items` */

insert  into `tbl_order_items`(`id`,`order_id`,`name`,`quantity`,`item_price`,`create_at`) values (1,'h8vqThCQV7','FinePix Pro2 3D Camera',1,1500.00,'2022-06-14 14:42:13');
insert  into `tbl_order_items`(`id`,`order_id`,`name`,`quantity`,`item_price`,`create_at`) values (2,'vw2WFNlUo1','FinePix Pro2 3D Camera',1,1500.00,'2022-06-14 15:03:47');
insert  into `tbl_order_items`(`id`,`order_id`,`name`,`quantity`,`item_price`,`create_at`) values (3,'mpE0zYale1','Sistema de Gestión de Clientes en PHP y MySQL',1,1500.00,'2022-06-14 15:47:21');
insert  into `tbl_order_items`(`id`,`order_id`,`name`,`quantity`,`item_price`,`create_at`) values (4,'avInb9hSQ7','Sistema de Gestión de Clientes en PHP y MySQL',5,1500.00,'2022-06-14 16:27:16');
insert  into `tbl_order_items`(`id`,`order_id`,`name`,`quantity`,`item_price`,`create_at`) values (5,'fjh6cVSckJ','Sistema de Gestión de Clientes en PHP y MySQL',1,1500.00,'2022-06-14 16:33:09');
insert  into `tbl_order_items`(`id`,`order_id`,`name`,`quantity`,`item_price`,`create_at`) values (6,'fgBYdGvSBZ','Sistema de Gestión de Clientes en PHP y MySQL',1,1500.00,'2022-06-14 16:35:11');
insert  into `tbl_order_items`(`id`,`order_id`,`name`,`quantity`,`item_price`,`create_at`) values (7,'CDzTlwsBVy','Sistema de Gestión de Clientes en PHP y MySQL',1,1500.00,'2022-06-14 16:37:10');
insert  into `tbl_order_items`(`id`,`order_id`,`name`,`quantity`,`item_price`,`create_at`) values (8,'GNT54XStQt','Sistema de Gestión de Clientes en PHP y MySQL',1,1500.00,'2022-06-14 20:52:51');

/*Table structure for table `tbl_orders` */

CREATE TABLE `tbl_orders` (
  `OrderID` int(11) NOT NULL AUTO_INCREMENT,
  `ProductID` int(11) DEFAULT NULL,
  `CustomerID` int(11) DEFAULT NULL,
  `Size` varchar(30) DEFAULT NULL,
  `Color` varchar(30) DEFAULT NULL,
  `DateOrdered` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `ProductID` (`ProductID`),
  KEY `CustomerID` (`CustomerID`),
  CONSTRAINT `tbl_orders_ibfk_1` FOREIGN KEY (`ProductID`) REFERENCES `tbl_products` (`ProductID`),
  CONSTRAINT `tbl_orders_ibfk_2` FOREIGN KEY (`CustomerID`) REFERENCES `tbl_customers` (`CustomerID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `tbl_orders` */

insert  into `tbl_orders`(`OrderID`,`ProductID`,`CustomerID`,`Size`,`Color`,`DateOrdered`) values (2,8,5,'161,3 mm de alto por 76,4 mm d','Azul','2020/04/25');
insert  into `tbl_orders`(`OrderID`,`ProductID`,`CustomerID`,`Size`,`Color`,`DateOrdered`) values (3,8,6,'No Aplica','Azul','2020/04/25');

/*Table structure for table `tbl_product` */

CREATE TABLE `tbl_product` (
  `tbl_product_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(255) NOT NULL,
  `product_code` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`tbl_product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `tbl_product` */

insert  into `tbl_product`(`tbl_product_id`,`product_name`,`product_code`,`quantity`,`price`,`date`) values (1,'Zapatos Goal','12121',24,5800,'2024-01-01 15:11:25');

/*Table structure for table `tbl_products` */

CREATE TABLE `tbl_products` (
  `ProductID` int(11) NOT NULL AUTO_INCREMENT,
  `Productname` varchar(30) DEFAULT NULL,
  `ProductBrand` varchar(30) DEFAULT NULL,
  `ProductSize` varchar(30) DEFAULT NULL,
  `ProductColor` varchar(30) DEFAULT NULL,
  `ProductPrice` varchar(30) DEFAULT NULL,
  `ProductCategory` varchar(30) DEFAULT NULL,
  `ProductImageName` varchar(50) DEFAULT NULL,
  `ProductImage` text DEFAULT NULL,
  PRIMARY KEY (`ProductID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `tbl_products` */

insert  into `tbl_products`(`ProductID`,`Productname`,`ProductBrand`,`ProductSize`,`ProductColor`,`ProductPrice`,`ProductCategory`,`ProductImageName`,`ProductImage`) values (6,'Samsung Galaxy A50 128GB - Neg','Samsung Galaxy A50','161,3 mm de alto por 76,4 mm d','Negro, Azul, Plata','649900','Celulares','celular3.png','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');
insert  into `tbl_products`(`ProductID`,`Productname`,`ProductBrand`,`ProductSize`,`ProductColor`,`ProductPrice`,`ProductCategory`,`ProductImageName`,`ProductImage`) values (7,'Redmi Note 8 64 GB Negro - XIA','Xiaomi','161,3 mm de alto por 76,4 mm d','Negro, Azul, Plata','642000','Celulares','celulares 4.jpg','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');
insert  into `tbl_products`(`ProductID`,`Productname`,`ProductBrand`,`ProductSize`,`ProductColor`,`ProductPrice`,`ProductCategory`,`ProductImageName`,`ProductImage`) values (8,'Huawei Y9 2019','HUAWEI','6,53 pulgadas','Azul','626.948','Celulares','celulares 5.jpg','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');

/*Table structure for table `tbl_recipe` */

CREATE TABLE `tbl_recipe` (
  `tbl_recipe_id` int(11) NOT NULL AUTO_INCREMENT,
  `tbl_category_id` int(11) NOT NULL,
  `recipe_image` text NOT NULL,
  `recipe_name` text NOT NULL,
  `recipe_ingredients` text NOT NULL,
  `recipe_procedure` text NOT NULL,
  PRIMARY KEY (`tbl_recipe_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `tbl_recipe` */

insert  into `tbl_recipe`(`tbl_recipe_id`,`tbl_category_id`,`recipe_image`,`recipe_name`,`recipe_ingredients`,`recipe_procedure`) values (1,1,'frenchtoast.jpg','Tostada francesa','- 4 huevos grandes\n- 2/3 taza de leche\n- 2 cucharaditas de canela\n- Nuez moscada pizca\n- 8 rebanadas gruesas de pan italiano ligeramente duro de ¾ de pulgada\n- 2 cucharadas de mantequilla derretida o aceite neutro\n- Jarabe de arce, mantequilla, fruta y azúcar glass para servir','1. Batir los huevos, la leche, la canela y la nuez moscada en un tazón mediano. Agregue otras especias o condimentos en este momento; Puedes agregar una pizca de cardamomo molido o pimienta de Jamaica si lo deseas para darle un toque extra. Batir la mezcla de huevo hasta que esté bien mezclada y verter en un tazón ancho y poco profundo o en un molde para pasteles.\n\n2. Coloque cada rebanada de pan en la mezcla de huevo, sumergiendo el pan y dejándolo en remojo durante 1 minuto.\n\n3. Derrita la mantequilla en una sartén grande a fuego medio-alto. Levante el pan de la mezcla de huevo y deje escurrir el exceso de huevo antes de colocar el pan en la sartén. Fríe las tostadas francesas hasta que se doren por un lado, aproximadamente 2 minutos. Voltee y dore por el otro lado, aproximadamente 2 minutos. Repita con el pan restante. Sirva las tostadas francesas calientes con mantequilla, jarabe de arce y/o bayas frescas u otras frutas. Espolvoree con azúcar glass si lo desea.');
insert  into `tbl_recipe`(`tbl_recipe_id`,`tbl_category_id`,`recipe_image`,`recipe_name`,`recipe_ingredients`,`recipe_procedure`) values (5,1,'Croque Madame.jpg','Madame croque','- 4 rebanadas de pan de sándwich blanco firme y de buena calidad (1/2 pulgada de grosor)','1. Precaliente el horno para asar con una rejilla a unas 8 pulgadas de la fuente de calor. Calienta una sartén antiadherente grande a fuego medio-alto. Unte 1 lado de las rebanadas de pan de manera uniforme con 1 cucharada de mantequilla. Coloque las rebanadas de pan, con el lado untado con mantequilla hacia abajo, en una sartén; cocine hasta que esté tostado y dorado, de 2 a 4 minutos. Transfiera el pan a una superficie de trabajo. Limpia la sartén.\n2. Derrita 1 cucharada de mantequilla en una cacerola pequeña a fuego medio hasta que esté espumosa. Incorpora la harina; cocine, batiendo constantemente, hasta que esté ligeramente dorado, aproximadamente 1 minuto y 30 segundos. Incorpora poco a poco la leche; llevar a fuego lento a fuego medio, batiendo constantemente. Reduzca el fuego a bajo; cocine, batiendo con frecuencia, hasta que espese, aproximadamente 3 minutos. Alejar del calor. Agrega 1/4 taza de Gruyère rallado y bate hasta que se derrita. Agrega sal, pimienta y nuez moscada a la salsa Mornay. (Si no la usa inmediatamente, cubra la superficie de la salsa directamente con una envoltura de plástico por hasta 1 hora).\n3. Coloque 2 de las rebanadas de pan sobre una superficie de trabajo, con el lado tostado hacia abajo. En cada rebanada, esparza 2 cucharadas de salsa Mornay de manera uniforme para cubrir la superficie. Espolvorea con 1/4 taza de gruyere rallado y cubre con 2 rebanadas de jamón. Unte la mostaza de manera uniforme sobre los lados sin tostar de las 2 rebanadas de pan restantes; colóquelo, con la mostaza hacia abajo, encima de las rebanadas cubiertas de jamón. Unte el resto de la salsa Mornay de manera uniforme sobre los sándwiches y luego cubra con el 1/4 de taza restante de gruyere rallado.\n4. Transfiera los sándwiches a una bandeja para hornear con borde y ase en el horno precalentado hasta que el queso se derrita y la parte superior burbujee y se dore en algunas partes, de 5 a 7 minutos.\n5. Mientras tanto, derrita la cucharada de mantequilla restante en una sartén antiadherente limpia a fuego medio-alto. Rompe los huevos en una sartén; cocine, sin tocar, hasta que las claras estén cuajadas pero las yemas líquidas, aproximadamente 3 minutos.\n6. Cubra cada sándwich con un huevo frito; decore con cebollino, sal marina en escamas y pimienta adicional.');
insert  into `tbl_recipe`(`tbl_recipe_id`,`tbl_category_id`,`recipe_image`,`recipe_name`,`recipe_ingredients`,`recipe_procedure`) values (6,1,'Egg Bhurji.jpg','Huevo Bhurji','- 2 cucharadas de ghee o mantequilla- ½ cup chopped onion\n- 2 teaspoons 1finely chopped green chile\n- 1 teaspoon grated peeled fresh ginger\n- 1 teaspoon finely chopped garlic\n- ½ cup chopped tomatoes\n- 1 teaspoon ground coriander\n- ½ teaspoon ground turmeric powder\n- ½ teaspoon garam masala\n- ½ teaspoon kashmiri chile powder or other red chile powder\n- Kosher salt to taste\n- 4 large eggs, lightly beaten\n- 1 teaspoon fresh lemon juice\n- 2 tablespoons chopped fresh cilantro, for serving','1. En una sartén mediana, caliente el ghee a fuego medio. Agregue la cebolla, el chile, el jengibre y el ajo y cocine, revolviendo con frecuencia, hasta que las cebollas estén traslúcidas, aproximadamente 4 minutos. Agregue los tomates y las especias y cocine, revolviendo con frecuencia, hasta que las especias estén tostadas y los tomates se ablanden, de 2 a 3 minutos.');
insert  into `tbl_recipe`(`tbl_recipe_id`,`tbl_category_id`,`recipe_image`,`recipe_name`,`recipe_ingredients`,`recipe_procedure`) values (7,1,'Eggs Benedict Toast.jpg','Tostadas Benedict De Huevos','- 3 yemas de huevo grandes\n- 1 cucharada de agua fría\n- 1 cucharadita de maicena\n- 1 cucharadita de mostaza Dijon\n- 1 ½ cucharadas de jugo de limón fresco, cantidad dividida\n- 1 cucharadita de sal kosher, cantidad dividida\n- 12 cucharadas de mantequilla sin sal (6 onzas), derretida, más 2 cucharadas de mantequilla fría sin sal, cantidad dividida\n- ⅛ cucharadita de pimienta de cayena\n- Agua tibia, según sea necesario\n- 4 huevos grandes fríos\n- 4 rebanadas de pan de masa madre (1/2 pulgada de grosor), tostadas\n- 8 rebanadas finas de prosciutto o speck (aproximadamente 4 onzas)\n- 2 cucharadas de hierbas suaves frescas picadas (como estragón y cebollino)\n- Pimienta negra recién molida (opcional)','1. Batir las yemas de huevo en una cacerola pequeña hasta que queden suaves, aproximadamente 1 minuto. Agrega 1 cucharada de agua fría, maicena, Dijon, 1 cucharada de jugo de limón y 1/2 cucharadita de sal; batir hasta que esté bien combinado. Prepare un recipiente con agua helada lo suficientemente grande como para sumergir el fondo de la cacerola; dejar de lado.');
insert  into `tbl_recipe`(`tbl_recipe_id`,`tbl_category_id`,`recipe_image`,`recipe_name`,`recipe_ingredients`,`recipe_procedure`) values (8,1,'Cinnamon Pancake.jpg','Panqueques De Canela','- 1 1/4 tazas de harina para todo uso','1. En un bol batir la harina con la harina de maíz, el azúcar, la canela, el polvo para hornear, el bicarbonato y la sal. En un bol batir el buttermilk con los huevos, el aceite de oliva y el agua. Batir los ingredientes líquidos con los ingredientes secos, dejando pequeños grumos.');
insert  into `tbl_recipe`(`tbl_recipe_id`,`tbl_category_id`,`recipe_image`,`recipe_name`,`recipe_ingredients`,`recipe_procedure`) values (9,2,'lunch1.jpg','Katsu Sando','- 6 hamburguesas crujientes CDO\n- 3 rebanadas de pan sabroso cortadas por la mitad\n- 1 taza de repollo rallado\n- 1/4 taza de salsa katsu\n- 3 cucharadas de mantequilla\n- 2 cucharadas de aceite de cocina\n- 3 cucharadas de mayonesa','1. Calienta el aceite de cocina en una sartén. Freír ambos lados de las hamburguesas CDO Crispy a fuego medio hasta que estén crujientes. Dejar de lado\n2. Coge 2 rebanadas de pan. Unte mantequilla en un lado de la primera rebanada de pan y mayonesa en un lado de la segunda rebanada de pan.\n3. Coloque la rebanada de pan con mantequilla sobre una superficie plana (con la mantequilla hacia arriba). Cubra con repollo rallado y salsa tonkatsu.\n4. Coloque 2 CDO Crispy Burgers encima y luego cubra con más repollo rallado y salsa tonkatsu. Termine cubriendo con la otra rebanada de pan (con el lado de la mayonesa hacia abajo).\n5. Coloque el Crispy Burger Sando en un plato para servir. Atender. ¡Comparte y Disfruta!');
insert  into `tbl_recipe`(`tbl_recipe_id`,`tbl_category_id`,`recipe_image`,`recipe_name`,`recipe_ingredients`,`recipe_procedure`) values (10,2,'Igado.jpg','Igado','- 1/2 libra. lomo de cerdo cortado en tiras de 2 pulgadas\n- 1/2 libra de hígado de cerdo cortado en tiras de 2 pulgadas\n- 1/2 libra de riñón de cerdo\n- 1 Cubo de Cerdo Knorr\n- 1 pimiento rojo cortado en tiras\n- 1/2 taza de guisantes\n- 1 zanahoria en juliana\n- 3 hojas de laurel\n- 1 cebolla picada\n- 5 dientes de ajo picados\n- 6 cucharadas de salsa de soja\n- 5 cucharadas de vinagre blanco\n- 1 1/4 taza de agua\n- 4 cucharadas de aceite de cocina\n- Sal y pimienta para probar','1. Hervir el riñón con 4 pulgares de jengibre durante al menos 30 minutos. Déjelo enfriar y córtelo en tiras de 2 pulgadas. Dejar de lado.\n2. Calienta 2 cucharadas de aceite de cocina en una sartén. Saltear el hígado de cerdo durante 2 minutos. Retirar de la sartén y reservar.\n3.Vierta el aceite restante en la sartén. Una vez caliente, sofreír el ajo y la cebolla hasta que se ablanden.\n4. Añade el riñón de cerdo. Cocine por 1 minuto.\n5. Añade el lomo de cerdo. Saltee hasta que la capa exterior adquiera un color marrón claro.\n6. Vierta la salsa de soja y el vinagre en la sartén. Deja que el líquido hierva. Remover.\n7. Agrega las hojas de laurel y vierte agua. Dejar hervir. Reduzca el fuego entre bajo y medio. Continuar cocinando durante 40 minutos.\n8. Agregue el cubo de cerdo Knorr. Cocine por 8 minutos.\n9. Vuelva a agregar el hígado a la sartén. Revuelva y continúe cocinando por 3 minutos.\n10. Ponga el pimiento morrón, la zanahoria y los guisantes.\n11. Sazone con sal y pimienta negra molida. Cocine por 2 minutos. Transfiera a un tazón para servir. Servir caliente con arroz.\n12. ¡Comparte y disfruta!');
insert  into `tbl_recipe`(`tbl_recipe_id`,`tbl_category_id`,`recipe_image`,`recipe_name`,`recipe_ingredients`,`recipe_procedure`) values (11,2,'Pork Adobo.jpg','Pork Adobo','- 2 libras de panceta de cerdo (nota 1)\n- 2 cucharadas de ajo (nota 2)\n- 5 hojas de laurel secas (nota 3)\n- 4 cucharadas de vinagre (nota 4)\n- 1/2 taza de salsa de soja (nota 5)\n- 1 cucharada de pimienta en grano (nota 6)\n- 2 tazas de agua\n- Sal al gusto','1. Combine la panceta de cerdo, la salsa de soja y el ajo y luego deje marinar durante al menos 1 hora.\n2. Calentar la olla y poner la panceta de cerdo marinada y cocinar por unos minutos.\n3. Vierta el resto de la marinada, incluido el ajo.\n4. Agregue agua, pimienta entera y hojas de laurel secas y luego deje hervir. Cocine a fuego lento durante 40 minutos a 1 hora.\n5. Agregue el vinagre y cocine a fuego lento durante 12 a 15 minutos.\n6. Agrega sal al gusto\n7. Servir caliente. ¡Comparte y Disfruta!');
insert  into `tbl_recipe`(`tbl_recipe_id`,`tbl_category_id`,`recipe_image`,`recipe_name`,`recipe_ingredients`,`recipe_procedure`) values (12,2,'Chicken Curry.jpg','Pollo al curry','- 2 libras. pollo cortado en trozos para servir\n- 1 cucharada de curry en polvo\n- 1 pieza de papa en cubitos\n- 4 dientes de ajo picados\n- 2 tallos de apio cortados en rodajas\n- 1 pieza de pimiento rojo en rodajas\n- 2 piezas de pimiento verde largo\n- 1 pieza de cebolla picada\n- 2 pulgares de jengibre cortados en tiras\n- 2 tazas de leche de coco\n- 1/2 taza de crema para todo uso opcional\n- 1 taza de agua\n- salsa de pescado y pimienta negra molida al gusto','1. Calentar aceite en una sartén. Freír las patatas durante 1 minuto por lado. Retirar de la sartén. Dejar de lado.\n2. Con el aceite restante, saltee el ajo, la cebolla, el apio y el jengibre hasta que la cebolla se ablande.\n3. Agrega los trozos de pollo. Saltee hasta que la parte exterior del pollo adquiera un color marrón claro.\n4. Agrega 1 cucharada de salsa de pescado. Continúe salteando durante 1 minuto.\n5. Vierta la leche de coco y el agua. Dejar hervir.\n6. Agregue el curry en polvo. Revuelva hasta que el polvo esté completamente diluido. Tapa la olla y continúa cocinando a fuego medio bajo hasta que el líquido se reduzca a la mitad.\n7. Agregue el pimiento rojo y las patatas fritas. Cocine por 5 minutos.\n8. Sazone con salsa de pescado y pimienta negra molida según sea necesario. También puedes agregar crema para todo uso si lo deseas.\n9. Transfiera a un tazón para servir. ¡Servir y disfrutar!');
insert  into `tbl_recipe`(`tbl_recipe_id`,`tbl_category_id`,`recipe_image`,`recipe_name`,`recipe_ingredients`,`recipe_procedure`) values (13,2,'Bulalo.jpg','Bulalo','- 2 libras de pierna de res\n- ½ hoja entera de col desprendida individualmente\n- 1 paquete de bok choy\n- 2 mazorcas de maíz cada una cortadas en 3 partes\n- 2 Cucharadas de pimienta entera\n- 1/2 taza de cebollas verdes cortadas en trozos de 1 1/2 pulgada\n- 1 cebolla\n- 3/4 onzas de agua\n- salsa de pescado al gusto opcional','1. En una olla grande, vierta agua y deje hervir.\n2. Coloque la pierna de res seguida de la cebolla y el pimiento entero y luego cocine a fuego lento durante 1,5 horas (30 minutos si usa una olla a presión) o hasta que la carne esté tierna.\n3. Agrega el maíz y cocina a fuego lento por otros 10 minutos.\n4. Agrega la salsa de pescado, el repollo, el pechay y la cebolla de verdeo (puerros encebollados).\n5. Sirva caliente. ¡Comparte y Disfruta!');
insert  into `tbl_recipe`(`tbl_recipe_id`,`tbl_category_id`,`recipe_image`,`recipe_name`,`recipe_ingredients`,`recipe_procedure`) values (14,3,'Chicken and Broccoli Alfredo.jpg','Chicken Alfredo','- 8 onzas de fettuccine, crudo\n- 2 tazas de floretes de brócoli frescos\n- ¼ de taza de aderezo italiano Kraft Zesty\n- 1 libra de pechugas de pollo deshuesadas y sin piel, cortadas en trozos pequeños\n- 1 ⅔ tazas de leche\n- 4 onzas de queso crema Philadelphia, en cubos\n- ¼ taza de queso parmesano rallado Kraft\n- ½ cucharadita de hojas secas de albahaca','1. Cocine la pasta como se indica en el paquete, agregando el brócoli al agua hirviendo durante los últimos 2 minutos del tiempo de cocción de la pasta. Escurrir la mezcla de pasta.\n2. Mientras tanto, caliente el aderezo en una sartén antiadherente grande a fuego medio-alto. Agregue el pollo y cocine hasta que ya no esté rosado en el centro, revolviendo ocasionalmente, aproximadamente de 5 a 7 minutos.\n3. Agregue la leche, el queso crema, el queso parmesano y la albahaca. Hacer hervir removiendo constantemente. Cocine hasta que la salsa esté bien mezclada y bien caliente, aproximadamente de 1 a 2 minutos.\n4. Agrega la mezcla de pollo a la mezcla de pasta; mezclar ligeramente.');
insert  into `tbl_recipe`(`tbl_recipe_id`,`tbl_category_id`,`recipe_image`,`recipe_name`,`recipe_ingredients`,`recipe_procedure`) values (15,3,'Chicken Bhuna.jpg','Chicken Bhuna','- 2 cucharadas de aceite vegetal\n- 3 cebollas medianas, finamente picadas\n- 1 cucharadita de sal\n- 4 dientes de ajo machacados\n- 1 cucharada de jengibre fresco picado\n- 1/4 taza de agua caliente\n- 1 cucharadita de chile en polvo\n- 1 cucharadita de cilantro molido\n- 1 cucharadita de comino molido\n- 1/2 cucharadita de cúrcuma molida\n- 2 tomates medianos, picados\n- 2 chiles verdes, cortados por la mitad a lo largo (Opcional)\n- 2 mitades de pechuga de pollo deshuesadas y sin piel, cortadas en cubos\n- 1 cucharadita de pasta de curry, como la de Patak\n- 1/4 taza de hojas de cilantro fresco, picadas','1. Calienta el aceite en una sartén antiadherente a fuego alto. Agrega la cebolla y la sal; cocine y revuelva hasta que la cebolla se ablande, aproximadamente 5 minutos.\n2. Reduzca el fuego a bajo; agregue el ajo y el jengibre hasta que estén fragantes. Agrega agua caliente; tape y cocine, revolviendo ocasionalmente, hasta que el agua se haya evaporado, aproximadamente 5 minutos.\n3. Agregue el chile en polvo, el cilantro molido, el comino y la cúrcuma; cocine y revuelva a fuego alto hasta que las especias estén tostadas, aproximadamente 5 minutos. Agrega los tomates y los chiles verdes; tape y cocine a fuego lento durante 5 minutos.\n4. Agrega el pollo; cocine y revuelva a fuego alto hasta que se dore, de 5 a 7 minutos. Agrega la pasta de curry; reduzca el fuego a bajo, cubra y cocine hasta que el pollo esté bien cocido, agregando un poco de agua si es necesario, aproximadamente 5 minutos. Comprobar sazón y espolvorear con cilantro recién picado.');
insert  into `tbl_recipe`(`tbl_recipe_id`,`tbl_category_id`,`recipe_image`,`recipe_name`,`recipe_ingredients`,`recipe_procedure`) values (16,3,'Corned Beef.jpeg','Corned Beef','- 1 (5 1/2 libras) de pechuga de res en conserva con paquete de especias\n- 7 patatas pequeñas, peladas y cortadas en cubitos\n- 4 zanahorias medianas, peladas y cortadas en cubitos\n- 1 cebolla mediana, picada\n- 3 dientes de ajo, picados','1. Precalienta el horno a 300 grados F (150 grados C).\n2. Coloque la pechuga de carne en conserva en el centro de una fuente para asar. Coloque las papas y las zanahorias a los lados, luego esparza la cebolla y el ajo por encima. Espolvoree el paquete de condimentos sobre la carne y luego vierta agua hasta que las papas estén casi cubiertas. Cubra con una tapa o papel de aluminio grueso.\n3. Ase en el horno precalentado hasta que la carne en conserva esté tan tierna que se pueda desmenuzar con un tenedor, aproximadamente de 5 a 6 horas.');
insert  into `tbl_recipe`(`tbl_recipe_id`,`tbl_category_id`,`recipe_image`,`recipe_name`,`recipe_ingredients`,`recipe_procedure`) values (17,4,'Frito Pie.jpeg','Frito Pie','- 1/2 libra de carne molida\n- 1/4 taza de agua\n- 1 cucharada de pasta de tomate\n- 1 cucharada de chile en polvo o al gusto\n- 1/2 cucharadita de comino molido\n- 1/4 cucharadita de cebolla en polvo\n- 1/4 cucharadita de ajo en polvo\n- 1/4 taza de frijoles con chile','1. Calienta una sartén grande a fuego medio-alto. Cocine y revuelva la carne molida en la sartén caliente hasta que se dore y se desmorone, de 5 a 7 minutos. Escurrir y desechar la grasa. Agregue el agua, la pasta de tomate, el chile en polvo, el comino, la cebolla en polvo y el ajo en polvo. Agrega los frijoles; cocine hasta que esté completamente caliente, aproximadamente 3 minutos.\n2. Divida los chips de maíz en 4 tazones, cubra con la mezcla de chile y luego espolvoree con cebolla picada, rodajas de jalapeño y queso cheddar. Servir inmediatamente.');
insert  into `tbl_recipe`(`tbl_recipe_id`,`tbl_category_id`,`recipe_image`,`recipe_name`,`recipe_ingredients`,`recipe_procedure`) values (18,4,'Meatball Crackers.jpg','Meatball Crackers','- 1/2 libra de solomillo molido\n- 2 cucharadas de cebolla picada\n- 1 diente de ajo picado\n- 3 cucharadas de leche o mitad y mitad\n- 1 cucharadita de sal kosher\n- 1/2 cucharadita de pimienta negra recién molida\n- 1 cucharadita de albahaca seca\n- 1/2 cucharadita de orégano seco\n- 1 huevo grande, ligeramente batido','1. Precalienta el horno a 325 grados F (165 grados C).\n2. Combine el solomillo, la cebolla, el ajo, la leche, la sal, la pimienta, la albahaca, el orégano y el huevo en un bol y mezcle. Agregue el pan rallado hasta que esté bien combinado. carne para untar\nMezcle en una capa fina uniformemente sobre 24 galletas. Cubra con una rodaja de queso mozzarella y una segunda galleta.\n3. Coloque las galletas en una bandeja para hornear y unte la parte superior uniformemente con aceite de oliva.\nHornee en el horno precalentado hasta que la carne esté dorada en los bordes y bien cocida y el queso se derrita, de 10 a 12 minutos.\n4. Sirva con salsa marinara tibia para mojar.');
insert  into `tbl_recipe`(`tbl_recipe_id`,`tbl_category_id`,`recipe_image`,`recipe_name`,`recipe_ingredients`,`recipe_procedure`) values (19,7,'French Apple Cake.jpg','French Apple Cake','- 3 manzanas grandes para hornear (como Honeycrisp®), cortadas en cubitos (aproximadamente 4 tazas)\n- 2 cucharaditas de vinagre de manzana\n- 1 taza de harina para todo uso\n- 1 cucharadita de polvo para hornear\n- 1 cucharadita de sal kosher\n- 1 barra de mantequilla sin sal, a temperatura ambiente\n- 1/2 taza de azúcar blanca\n- 2 cucharadas de azúcar moreno claro\n- 2 huevos grandes','1. Precalienta el horno a 350 grados F (175 grados C). Engrase un molde para pastel redondo de 9 pulgadas con mantequilla y cubra el fondo con papel pergamino.\n2. Pele, descorazone las manzanas y córtelas en cubos de entre 1/4 y 3/8 de pulgada de tamaño. Un poco más pequeños está bien, pero si los cubos son más grandes, no quedarán lo suficientemente tiernos cuando se horneen. Agréguelo a un tazón grande y mezcle con vinagre de sidra de manzana.\n3. Mezcle la harina, el polvo para hornear y la sal en un tazón pequeño.\n4. En otro tazón, bata la mantequilla, 1/2 taza de azúcar blanca y azúcar morena con una batidora eléctrica hasta que esté suave y esponjosa. Batir 1 huevo a velocidad alta hasta que esté completamente incorporado y la mezcla esté suave. Agrega el segundo huevo y repite. Incorpora el ron, el extracto de vainilla y la mitad de la mezcla de harina. Cuando la harina desaparezca añadir el resto e incorporar con una espátula.');
insert  into `tbl_recipe`(`tbl_recipe_id`,`tbl_category_id`,`recipe_image`,`recipe_name`,`recipe_ingredients`,`recipe_procedure`) values (20,8,'mcdo banner.jpg','McDonald\'s Fries','- 8 patatas, peladas y cortadas en patatas fritas de 1/4 de pulgada de grosor\n- ¼ taza de azúcar blanca\n- 2 cucharadas de jarabe de maíz\n- 1 litro de aceite de canola, o según sea necesario\n- sal marina al gusto','- 8 patatas, peladas y cortadas en patatas fritas de 1/4 de pulgada de grosor\n- ¼ taza de azúcar blanca\n- 2 cucharadas de jarabe de maíz\n- 1 litro de aceite de canola, o según sea necesario\n- sal marina al gusto');

/*Table structure for table `tbl_subject` */

CREATE TABLE `tbl_subject` (
  `tbl_subject_id` int(11) NOT NULL AUTO_INCREMENT,
  `subject_name` varchar(255) NOT NULL,
  `subject_teacher` varchar(255) NOT NULL,
  PRIMARY KEY (`tbl_subject_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `tbl_subject` */

insert  into `tbl_subject`(`tbl_subject_id`,`subject_name`,`subject_teacher`) values (1,'Matemáticas','Profe Matemáticas');
insert  into `tbl_subject`(`tbl_subject_id`,`subject_name`,`subject_teacher`) values (2,'Ciencias','Profe Ciencias');
insert  into `tbl_subject`(`tbl_subject_id`,`subject_name`,`subject_teacher`) values (3,'Sociales','Profe Sociales');
insert  into `tbl_subject`(`tbl_subject_id`,`subject_name`,`subject_teacher`) values (4,'Física','Profe Física');
insert  into `tbl_subject`(`tbl_subject_id`,`subject_name`,`subject_teacher`) values (5,'Estadística','Profe Estadística');
insert  into `tbl_subject`(`tbl_subject_id`,`subject_name`,`subject_teacher`) values (6,'Arte','Profe Arte');
insert  into `tbl_subject`(`tbl_subject_id`,`subject_name`,`subject_teacher`) values (14,'Ética','Profe Ética');
insert  into `tbl_subject`(`tbl_subject_id`,`subject_name`,`subject_teacher`) values (15,'Economía','Profe Economía');

/*Table structure for table `tbl_task` */

CREATE TABLE `tbl_task` (
  `tbl_task_id` int(11) NOT NULL AUTO_INCREMENT,
  `tbl_subject_id` int(11) NOT NULL,
  `task_name` varchar(255) NOT NULL,
  `task_status` varchar(255) NOT NULL,
  `task_deadline` datetime NOT NULL,
  PRIMARY KEY (`tbl_task_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `tbl_task` */

insert  into `tbl_task`(`tbl_task_id`,`tbl_subject_id`,`task_name`,`task_status`,`task_deadline`) values (3,1,'Taller de trigonometría','Pendiente','2023-10-06 23:59:00');
insert  into `tbl_task`(`tbl_task_id`,`tbl_subject_id`,`task_name`,`task_status`,`task_deadline`) values (4,2,'Química inorgánica I','Pendiente','2023-10-13 23:59:00');
insert  into `tbl_task`(`tbl_task_id`,`tbl_subject_id`,`task_name`,`task_status`,`task_deadline`) values (5,3,'Historia moderna','En progreso','2023-10-20 23:59:00');
insert  into `tbl_task`(`tbl_task_id`,`tbl_subject_id`,`task_name`,`task_status`,`task_deadline`) values (6,3,'Gestión de Expresidentes','Completado','2023-10-02 12:00:00');
insert  into `tbl_task`(`tbl_task_id`,`tbl_subject_id`,`task_name`,`task_status`,`task_deadline`) values (7,4,'Energía Cinética Aplicada','En progreso','2023-10-06 23:59:00');
insert  into `tbl_task`(`tbl_task_id`,`tbl_subject_id`,`task_name`,`task_status`,`task_deadline`) values (8,6,'Vida y obra de Davinci','Completado','2023-10-02 23:59:00');
insert  into `tbl_task`(`tbl_task_id`,`tbl_subject_id`,`task_name`,`task_status`,`task_deadline`) values (9,5,'Estadística Cualitativa','Completado','2023-10-03 23:59:00');
insert  into `tbl_task`(`tbl_task_id`,`tbl_subject_id`,`task_name`,`task_status`,`task_deadline`) values (10,15,'Taller de elasticidad de la demanda','Completado','2023-10-20 08:00:00');

/*Table structure for table `tbl_user` */

CREATE TABLE `tbl_user` (
  `tbl_user_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  PRIMARY KEY (`tbl_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `tbl_user` */

insert  into `tbl_user`(`tbl_user_id`,`name`,`username`,`password`,`role`) values (1,'Mauricio Sevilla','configuroweb','1234abcd..','admin');
insert  into `tbl_user`(`tbl_user_id`,`name`,`username`,`password`,`role`) values (3,'Juan Usuari@','jusuario','1234abcd..','user');
insert  into `tbl_user`(`tbl_user_id`,`name`,`username`,`password`,`role`) values (4,'Juan Administrador','jadministrador','1234abcd..','admin');
insert  into `tbl_user`(`tbl_user_id`,`name`,`username`,`password`,`role`) values (5,'','configuroweb','1234abcd..','-seleccionar-');

/*Table structure for table `tbladmin` */

CREATE TABLE `tbladmin` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `AdminName` varchar(50) DEFAULT NULL,
  `UserName` varchar(50) DEFAULT NULL,
  `MobileNumber` bigint(10) DEFAULT NULL,
  `Email` varchar(120) DEFAULT NULL,
  `Password` varchar(200) DEFAULT NULL,
  `AdminRegdate` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `tbladmin` */

insert  into `tbladmin`(`ID`,`AdminName`,`UserName`,`MobileNumber`,`Email`,`Password`,`AdminRegdate`) values (1,'Admin','configuroweb',573124569876,'hola@cweb.com','4b67deeb9aba04a5b54632ad19934f26','2019-11-29 07:54:53');

/*Table structure for table `tblcategory` */

CREATE TABLE `tblcategory` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `Category` varchar(100) DEFAULT NULL,
  `CreationDate` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ID`),
  KEY `Category` (`Category`),
  KEY `CreationDate` (`CreationDate`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `tblcategory` */

insert  into `tblcategory`(`ID`,`Category`,`CreationDate`) values (1,'Mucama','2019-11-28 19:42:22');
insert  into `tblcategory`(`ID`,`Category`,`CreationDate`) values (2,'Conductor','2019-11-30 00:43:18');
insert  into `tblcategory`(`ID`,`Category`,`CreationDate`) values (3,'Cocinero','2019-11-30 00:43:27');
insert  into `tblcategory`(`ID`,`Category`,`CreationDate`) values (4,'Lechero','2019-11-30 00:43:36');
insert  into `tblcategory`(`ID`,`Category`,`CreationDate`) values (5,'Repartidor de Periódico','2019-11-30 00:43:46');
insert  into `tblcategory`(`ID`,`Category`,`CreationDate`) values (6,'Limpiador de Carro','2019-11-30 00:43:58');
insert  into `tblcategory`(`ID`,`Category`,`CreationDate`) values (7,'Niñera','2019-11-30 00:44:05');
insert  into `tblcategory`(`ID`,`Category`,`CreationDate`) values (8,'Profesor','2019-11-30 00:44:18');
insert  into `tblcategory`(`ID`,`Category`,`CreationDate`) values (9,'Instructor de Gimnasio','2019-11-30 00:44:29');
insert  into `tblcategory`(`ID`,`Category`,`CreationDate`) values (10,'Plomero','2019-11-30 00:44:39');
insert  into `tblcategory`(`ID`,`Category`,`CreationDate`) values (11,'Instructor de Basketball','2019-11-30 00:44:56');
insert  into `tblcategory`(`ID`,`Category`,`CreationDate`) values (12,'Electrónico','2019-11-30 00:45:30');
insert  into `tblcategory`(`ID`,`Category`,`CreationDate`) values (13,'Ensamblador','2019-11-30 00:45:42');
insert  into `tblcategory`(`ID`,`Category`,`CreationDate`) values (14,'Carpintero','2019-11-30 00:45:52');
insert  into `tblcategory`(`ID`,`Category`,`CreationDate`) values (15,'Limpiador de Casas','2019-11-30 00:46:05');
insert  into `tblcategory`(`ID`,`Category`,`CreationDate`) values (16,'Pintor','2019-11-30 00:46:14');
insert  into `tblcategory`(`ID`,`Category`,`CreationDate`) values (17,'Vendedor de Tienda','2019-11-30 00:46:24');
insert  into `tblcategory`(`ID`,`Category`,`CreationDate`) values (18,'Dóctor','2019-11-30 00:46:37');
insert  into `tblcategory`(`ID`,`Category`,`CreationDate`) values (19,'Fisioterapeuta','2019-11-30 00:47:02');
insert  into `tblcategory`(`ID`,`Category`,`CreationDate`) values (20,'Enfermera','2019-11-30 00:47:12');
insert  into `tblcategory`(`ID`,`Category`,`CreationDate`) values (21,'Lavandero','2019-11-30 00:47:29');
insert  into `tblcategory`(`ID`,`Category`,`CreationDate`) values (22,'Jardinero','2019-11-30 00:47:41');
insert  into `tblcategory`(`ID`,`Category`,`CreationDate`) values (23,'Mensajero','2019-11-30 00:47:55');
insert  into `tblcategory`(`ID`,`Category`,`CreationDate`) values (24,'Sastre','2019-11-30 00:48:10');
insert  into `tblcategory`(`ID`,`Category`,`CreationDate`) values (25,'Otro','2019-11-30 00:48:22');
insert  into `tblcategory`(`ID`,`Category`,`CreationDate`) values (26,'Filosofo','2019-12-10 11:56:20');
insert  into `tblcategory`(`ID`,`Category`,`CreationDate`) values (27,'Pintor Industrial','2020-05-05 22:48:09');

/*Table structure for table `tblclass` */

CREATE TABLE `tblclass` (
  `ID` int(5) NOT NULL AUTO_INCREMENT,
  `ClassName` varchar(50) DEFAULT NULL,
  `Section` varchar(20) DEFAULT NULL,
  `CreationDate` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `tblclass` */

insert  into `tblclass`(`ID`,`ClassName`,`Section`,`CreationDate`) values (1,'Primer Grado','A','2023-02-12 04:47:47');
insert  into `tblclass`(`ID`,`ClassName`,`Section`,`CreationDate`) values (2,'Segundo Grado','A','2023-02-12 04:48:29');
insert  into `tblclass`(`ID`,`ClassName`,`Section`,`CreationDate`) values (3,'Tercer Año','A','2023-02-12 04:49:06');

/*Table structure for table `tblclasses` */

CREATE TABLE `tblclasses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` varchar(80) DEFAULT NULL,
  `ClassNameNumeric` int(4) DEFAULT NULL,
  `Section` varchar(5) DEFAULT NULL,
  `CreationDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `tblclasses` */

insert  into `tblclasses`(`id`,`ClassName`,`ClassNameNumeric`,`Section`,`CreationDate`,`UpdationDate`) values (1,'Primer Año',1,'A','2022-09-04 03:31:45',NULL);
insert  into `tblclasses`(`id`,`ClassName`,`ClassNameNumeric`,`Section`,`CreationDate`,`UpdationDate`) values (63,'Segundo Año',2,'A','2022-09-04 04:55:02',NULL);

/*Table structure for table `tblexpense` */

CREATE TABLE `tblexpense` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `UserId` int(10) NOT NULL,
  `ExpenseDate` date DEFAULT NULL,
  `ExpenseItem` varchar(200) DEFAULT NULL,
  `ExpenseCost` varchar(200) DEFAULT NULL,
  `NoteDate` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `tblexpense` */

insert  into `tblexpense`(`ID`,`UserId`,`ExpenseDate`,`ExpenseItem`,`ExpenseCost`,`NoteDate`) values (36,11,'2024-08-29','Camiseta Rock','25','2024-08-29 04:22:42');
insert  into `tblexpense`(`ID`,`UserId`,`ExpenseDate`,`ExpenseItem`,`ExpenseCost`,`NoteDate`) values (37,8,'2024-08-29','Libro Arte Valencia','25','2024-08-29 05:29:35');
insert  into `tblexpense`(`ID`,`UserId`,`ExpenseDate`,`ExpenseItem`,`ExpenseCost`,`NoteDate`) values (38,8,'2024-08-28','Ropa Turka','17','2024-08-29 05:30:21');
insert  into `tblexpense`(`ID`,`UserId`,`ExpenseDate`,`ExpenseItem`,`ExpenseCost`,`NoteDate`) values (39,8,'2024-08-29','Chancla Natu','34','2024-08-29 21:49:26');
insert  into `tblexpense`(`ID`,`UserId`,`ExpenseDate`,`ExpenseItem`,`ExpenseCost`,`NoteDate`) values (40,8,'2024-08-29','Chaqueta Bli','33','2024-08-29 21:56:59');
insert  into `tblexpense`(`ID`,`UserId`,`ExpenseDate`,`ExpenseItem`,`ExpenseCost`,`NoteDate`) values (41,8,'2024-09-06','Prenda Caat','58','2024-08-30 03:31:23');
insert  into `tblexpense`(`ID`,`UserId`,`ExpenseDate`,`ExpenseItem`,`ExpenseCost`,`NoteDate`) values (42,8,'2024-08-30','Aparato Electrónico','58','2024-08-30 03:40:20');

/*Table structure for table `tblnotice` */

CREATE TABLE `tblnotice` (
  `ID` int(5) NOT NULL AUTO_INCREMENT,
  `noticeTitle` varchar(255) DEFAULT NULL,
  `noticeDetails` mediumtext DEFAULT NULL,
  `postingDate` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `tblnotice` */

insert  into `tblnotice`(`ID`,`noticeTitle`,`noticeDetails`,`postingDate`) values (3,'Estimado Estudiante','Se debe leer y aprobar el examen relacionado del manual de convivencia.','2022-10-22 12:27:55');

/*Table structure for table `tblpage` */

CREATE TABLE `tblpage` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `PageType` varchar(50) DEFAULT NULL,
  `PageTitle` varchar(200) DEFAULT NULL,
  `PageDescription` mediumtext DEFAULT NULL,
  `Email` varchar(200) DEFAULT NULL,
  `MobileNumber` bigint(10) DEFAULT NULL,
  `UpdationDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `tblpage` */

insert  into `tblpage`(`ID`,`PageType`,`PageTitle`,`PageDescription`,`Email`,`MobileNumber`,`UpdationDate`) values (1,'aboutus','Nosotros','<div><font color=\"#6a6a6a\" face=\"arial, sans-serif\"><span style=\"font-size: 14px;\"><b>La búsqueda local es el uso de motores de búsqueda especializados en Internet que permiten a los usuarios enviar búsquedas restringidas geográficamente en una base de datos estructurada de negocios locales.</b></span></font></div>',NULL,NULL,'2020-05-05 21:59:15');
insert  into `tblpage`(`ID`,`PageType`,`PageTitle`,`PageDescription`,`Email`,`MobileNumber`,`UpdationDate`) values (2,'contactus','Contacto','Ciudad Cali Colombia','msevillab@gmail.com',3162430081,'2020-05-05 22:16:09');

/*Table structure for table `tblperson` */

CREATE TABLE `tblperson` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `Category` varchar(200) DEFAULT NULL,
  `Name` varchar(200) DEFAULT NULL,
  `Picture` varchar(200) DEFAULT NULL,
  `MobileNumber` bigint(10) DEFAULT NULL,
  `Address` mediumtext DEFAULT NULL,
  `City` varchar(200) NOT NULL,
  `RegDate` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ID`),
  KEY `Category` (`Category`),
  KEY `Category_2` (`Category`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `tblperson` */

insert  into `tblperson`(`ID`,`Category`,`Name`,`Picture`,`MobileNumber`,`Address`,`City`,`RegDate`) values (1,'Mucama','Alicia Benavides','f8f739456cbea88ff65ac2e6758ae0431588733438.jpg',573166874951,'Calle 50 N 12-34','Barranquilla','2019-11-30 02:01:53');
insert  into `tblperson`(`ID`,`Category`,`Name`,`Picture`,`MobileNumber`,`Address`,`City`,`RegDate`) values (2,'Mucama','Miriam Galindo','c19c33a4106c0a2709086aa37e5772971588733565.jpg',573184752013,'Avenida 34 N 34-90','Ciénaga','2019-12-01 23:37:21');
insert  into `tblperson`(`ID`,`Category`,`Name`,`Picture`,`MobileNumber`,`Address`,`City`,`RegDate`) values (3,'Mucama','Karina Galvez','6731dfdad8d8cb3fed05450789ed4fe31588733639.jpg',573196423187,'Carrera 93 N 34-43','Cali','2019-12-01 23:38:59');
insert  into `tblperson`(`ID`,`Category`,`Name`,`Picture`,`MobileNumber`,`Address`,`City`,`RegDate`) values (4,'Conductor','Juan Becerra','1e6ae4ada992769567b71815f124fac51575261598.jpg',573215748120,'Transversal 90 N 13-72','Bogotá','2019-12-01 23:39:58');
insert  into `tblperson`(`ID`,`Category`,`Name`,`Picture`,`MobileNumber`,`Address`,`City`,`RegDate`) values (5,'Conductor','Rafael Velandia','55ccf27d26d7b23839986b6ae2e447ab1575261706.jpg',573048574103,'Calle 29 N 12-70','Medellín','2019-12-01 23:41:46');
insert  into `tblperson`(`ID`,`Category`,`Name`,`Picture`,`MobileNumber`,`Address`,`City`,`RegDate`) values (6,'Conductor','Mauricio Garcia','7fdc1a630c238af0815181f9faa190f51575261743.jpg',573126489731,'Carrera 56 N 92-23','Cucuta','2019-12-01 23:42:23');
insert  into `tblperson`(`ID`,`Category`,`Name`,`Picture`,`MobileNumber`,`Address`,`City`,`RegDate`) values (7,'Cocinero','Roberto Meriño','efc1a80c391be252d7d777a437f868701575261793.jpg',573156989754,'Avenida 98 N 23-23','Cartagena','2019-12-01 23:43:13');
insert  into `tblperson`(`ID`,`Category`,`Name`,`Picture`,`MobileNumber`,`Address`,`City`,`RegDate`) values (8,'Cocinero','Dilan Camargo','efc1a80c391be252d7d777a437f868701575261837.jpg',573236748497,'Calle 56 N 43-23','Sabanalarga','2019-12-01 23:43:57');
insert  into `tblperson`(`ID`,`Category`,`Name`,`Picture`,`MobileNumber`,`Address`,`City`,`RegDate`) values (9,'Lechero','Daniel Mendoza','1e6ae4ada992769567b71815f124fac51575261908.jpg',573164879754,'Carrera 98 N 23-13','Cartagena','2019-12-01 23:45:08');
insert  into `tblperson`(`ID`,`Category`,`Name`,`Picture`,`MobileNumber`,`Address`,`City`,`RegDate`) values (10,'Lechero','Julio Gonzalez','1e6ae4ada992769567b71815f124fac51575274951.jpg',573147528497,'Calle 34 N 34-29','Barranquilla','2019-12-01 23:46:01');
insert  into `tblperson`(`ID`,`Category`,`Name`,`Picture`,`MobileNumber`,`Address`,`City`,`RegDate`) values (11,'Repartidor de Periódico','Esteban Pérez','7fdc1a630c238af0815181f9faa190f51575262022.jpg',573026748749,'Carrera 9 N 24-25','Cali','2019-12-01 23:47:02');
insert  into `tblperson`(`ID`,`Category`,`Name`,`Picture`,`MobileNumber`,`Address`,`City`,`RegDate`) values (12,'Limpiador de Carro','Armando Valencia','55ccf27d26d7b23839986b6ae2e447ab1575262079.jpg',573165656565,'Carrera 78 N 34-25','Bogotá','2019-12-01 23:47:59');
insert  into `tblperson`(`ID`,`Category`,`Name`,`Picture`,`MobileNumber`,`Address`,`City`,`RegDate`) values (13,'Niñera','Jasmin Florez','efc1a80c391be252d7d777a437f868701575262135.jpg',573146346873,'Calle 98 N 12-02','Medellín','2019-12-01 23:48:55');
insert  into `tblperson`(`ID`,`Category`,`Name`,`Picture`,`MobileNumber`,`Address`,`City`,`RegDate`) values (14,'Profesor','Emilio Pedraza','efc1a80c391be252d7d777a437f868701575262207.jpg',573165486742,'Avenida Gloria N 97-12 Apto 200','Ciénaga','2019-12-01 23:50:07');
insert  into `tblperson`(`ID`,`Category`,`Name`,`Picture`,`MobileNumber`,`Address`,`City`,`RegDate`) values (15,'Profesor','Julián Román','7fdc1a630c238af0815181f9faa190f51575262248.jpg',573155646878,'Calle 14 N 23-19','Cali','2019-12-01 23:50:48');
insert  into `tblperson`(`ID`,`Category`,`Name`,`Picture`,`MobileNumber`,`Address`,`City`,`RegDate`) values (16,'Profesor','Eduardo Galán','efc1a80c391be252d7d777a437f868701575262299.jpg',573198765498,'Carrera 25 N 18-90','Santamarta','2019-12-01 23:51:39');
insert  into `tblperson`(`ID`,`Category`,`Name`,`Picture`,`MobileNumber`,`Address`,`City`,`RegDate`) values (17,'Profesor','Luis Páez','efc1a80c391be252d7d777a437f868701575262345.jpg',573145464654,'Calle 45 N 23-90','Soledad','2019-12-01 23:52:25');
insert  into `tblperson`(`ID`,`Category`,`Name`,`Picture`,`MobileNumber`,`Address`,`City`,`RegDate`) values (18,'Instructor de Gimnasio','Jorge Rana','1e6ae4ada992769567b71815f124fac51575262395.jpg',573068744574,'Avenida Los Martirez N 76-34','Bogotá','2019-12-01 23:53:15');
insert  into `tblperson`(`ID`,`Category`,`Name`,`Picture`,`MobileNumber`,`Address`,`City`,`RegDate`) values (19,'Instructor de Gimnasio','Diego Ladrón','55ccf27d26d7b23839986b6ae2e447ab1575262429.jpg',573148032687,'Calle 12 N 23-90','Ciénaga','2019-12-01 23:53:49');
insert  into `tblperson`(`ID`,`Category`,`Name`,`Picture`,`MobileNumber`,`Address`,`City`,`RegDate`) values (20,'Plomero','Ricardo Cornejo','1e6ae4ada992769567b71815f124fac51575262482.jpg',573167867278,'Calle 87 N 12-12','Cartagena','2019-12-01 23:54:42');
insert  into `tblperson`(`ID`,`Category`,`Name`,`Picture`,`MobileNumber`,`Address`,`City`,`RegDate`) values (21,'Plomero','Francisco Piernagorda','7fdc1a630c238af0815181f9faa190f51575621536.jpg',573189895496,'Carrera 24 N 56-20','Cali','2019-12-06 03:38:56');
insert  into `tblperson`(`ID`,`Category`,`Name`,`Picture`,`MobileNumber`,`Address`,`City`,`RegDate`) values (22,'Traductor','Pedro Francia','3de6c2fdd28f94768b423d0c95ae91bc1575997039.png',573193778033,'Calle 23 N 23-90','Barranquilla','2019-12-10 11:57:19');

/*Table structure for table `tblpublicnotice` */

CREATE TABLE `tblpublicnotice` (
  `ID` int(5) NOT NULL AUTO_INCREMENT,
  `NoticeTitle` varchar(200) DEFAULT NULL,
  `NoticeMessage` mediumtext DEFAULT NULL,
  `CreationDate` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `tblpublicnotice` */

insert  into `tblpublicnotice`(`ID`,`NoticeTitle`,`NoticeMessage`,`CreationDate`) values (1,'Jean Day','<b style=\"color: rgb(32, 33, 36); font-family: arial, sans-serif;\">Se informa que el día de hoy abrá jean day, favor traer ropa casual</b><br>','2023-02-12 05:27:07');

/*Table structure for table `tblresult` */

CREATE TABLE `tblresult` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `StudentId` int(11) DEFAULT NULL,
  `ClassId` int(11) DEFAULT NULL,
  `SubjectId` int(11) DEFAULT NULL,
  `marks` int(11) DEFAULT NULL,
  `PostingDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `tblresult` */

insert  into `tblresult`(`id`,`StudentId`,`ClassId`,`SubjectId`,`marks`,`PostingDate`,`UpdationDate`) values (1,1,1,2,89,'2022-09-04 03:41:18',NULL);
insert  into `tblresult`(`id`,`StudentId`,`ClassId`,`SubjectId`,`marks`,`PostingDate`,`UpdationDate`) values (2,1,1,3,87,'2022-09-04 03:41:18',NULL);
insert  into `tblresult`(`id`,`StudentId`,`ClassId`,`SubjectId`,`marks`,`PostingDate`,`UpdationDate`) values (3,1,1,5,66,'2022-09-04 03:41:18',NULL);
insert  into `tblresult`(`id`,`StudentId`,`ClassId`,`SubjectId`,`marks`,`PostingDate`,`UpdationDate`) values (4,1,1,1,78,'2022-09-04 03:41:18',NULL);
insert  into `tblresult`(`id`,`StudentId`,`ClassId`,`SubjectId`,`marks`,`PostingDate`,`UpdationDate`) values (5,1,1,4,90,'2022-09-04 03:41:18',NULL);
insert  into `tblresult`(`id`,`StudentId`,`ClassId`,`SubjectId`,`marks`,`PostingDate`,`UpdationDate`) values (6,3,1,2,80,'2022-09-04 04:56:54',NULL);
insert  into `tblresult`(`id`,`StudentId`,`ClassId`,`SubjectId`,`marks`,`PostingDate`,`UpdationDate`) values (7,3,1,3,66,'2022-09-04 04:56:54',NULL);
insert  into `tblresult`(`id`,`StudentId`,`ClassId`,`SubjectId`,`marks`,`PostingDate`,`UpdationDate`) values (8,3,1,5,87,'2022-09-04 04:56:54',NULL);
insert  into `tblresult`(`id`,`StudentId`,`ClassId`,`SubjectId`,`marks`,`PostingDate`,`UpdationDate`) values (9,3,1,1,76,'2022-09-04 04:56:54',NULL);
insert  into `tblresult`(`id`,`StudentId`,`ClassId`,`SubjectId`,`marks`,`PostingDate`,`UpdationDate`) values (10,3,1,4,55,'2022-09-04 04:56:54',NULL);
insert  into `tblresult`(`id`,`StudentId`,`ClassId`,`SubjectId`,`marks`,`PostingDate`,`UpdationDate`) values (11,4,1,2,85,'2022-10-19 16:21:47',NULL);
insert  into `tblresult`(`id`,`StudentId`,`ClassId`,`SubjectId`,`marks`,`PostingDate`,`UpdationDate`) values (12,4,1,3,90,'2022-10-19 16:21:47',NULL);
insert  into `tblresult`(`id`,`StudentId`,`ClassId`,`SubjectId`,`marks`,`PostingDate`,`UpdationDate`) values (13,4,1,5,85,'2022-10-19 16:21:47',NULL);
insert  into `tblresult`(`id`,`StudentId`,`ClassId`,`SubjectId`,`marks`,`PostingDate`,`UpdationDate`) values (14,4,1,1,80,'2022-10-19 16:21:47',NULL);
insert  into `tblresult`(`id`,`StudentId`,`ClassId`,`SubjectId`,`marks`,`PostingDate`,`UpdationDate`) values (15,4,1,4,75,'2022-10-19 16:21:47',NULL);
insert  into `tblresult`(`id`,`StudentId`,`ClassId`,`SubjectId`,`marks`,`PostingDate`,`UpdationDate`) values (16,5,63,6,98,'2022-10-21 17:29:10',NULL);
insert  into `tblresult`(`id`,`StudentId`,`ClassId`,`SubjectId`,`marks`,`PostingDate`,`UpdationDate`) values (17,5,63,7,97,'2022-10-21 17:29:10',NULL);
insert  into `tblresult`(`id`,`StudentId`,`ClassId`,`SubjectId`,`marks`,`PostingDate`,`UpdationDate`) values (18,5,63,6,98,'2022-10-21 17:29:42',NULL);
insert  into `tblresult`(`id`,`StudentId`,`ClassId`,`SubjectId`,`marks`,`PostingDate`,`UpdationDate`) values (19,5,63,7,97,'2022-10-21 17:29:42',NULL);

/*Table structure for table `tblstudent` */

CREATE TABLE `tblstudent` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `StudentName` varchar(200) DEFAULT NULL,
  `StudentEmail` varchar(200) DEFAULT NULL,
  `StudentClass` varchar(100) DEFAULT NULL,
  `Gender` varchar(50) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `StuID` varchar(200) DEFAULT NULL,
  `FatherName` mediumtext DEFAULT NULL,
  `MotherName` mediumtext DEFAULT NULL,
  `ContactNumber` bigint(10) DEFAULT NULL,
  `AltenateNumber` bigint(10) DEFAULT NULL,
  `Address` mediumtext DEFAULT NULL,
  `UserName` varchar(200) DEFAULT NULL,
  `Password` varchar(200) DEFAULT NULL,
  `Image` varchar(200) DEFAULT NULL,
  `DateofAdmission` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `tblstudent` */

insert  into `tblstudent`(`ID`,`StudentName`,`StudentEmail`,`StudentClass`,`Gender`,`DOB`,`StuID`,`FatherName`,`MotherName`,`ContactNumber`,`AltenateNumber`,`Address`,`UserName`,`Password`,`Image`,`DateofAdmission`) values (3,'Pedro Estudiante','pestudiante@cweb.com','2','Male','2016-05-18','1212121B','Pedro Padre','Pedro Madre',3052589471,3056987417,'Calle 98 82 14','pestudiante@cweb.com','1234abcd..','95c5502bbf65990e7e123938e99452451679501667.png','2023-03-22 11:14:27');
insert  into `tblstudent`(`ID`,`StudentName`,`StudentEmail`,`StudentClass`,`Gender`,`DOB`,`StuID`,`FatherName`,`MotherName`,`ContactNumber`,`AltenateNumber`,`Address`,`UserName`,`Password`,`Image`,`DateofAdmission`) values (4,'Juan Estudiante','jestudiante@cweb.com','2','Male','2015-06-11','1212121A','Juan Padre','Juana Madre',3056986743,3162587410,'Calle 98 N 23 01','jestudiante','1234abcd..','c03a59a990928bbda605ffccddc3ef791679512169.png','2023-03-22 14:09:29');

/*Table structure for table `tblstudents` */

CREATE TABLE `tblstudents` (
  `StudentId` int(11) NOT NULL AUTO_INCREMENT,
  `StudentName` varchar(100) DEFAULT NULL,
  `RollId` varchar(100) DEFAULT NULL,
  `StudentEmail` varchar(100) DEFAULT NULL,
  `Gender` varchar(10) DEFAULT NULL,
  `DOB` varchar(100) DEFAULT NULL,
  `ClassId` int(11) DEFAULT NULL,
  `RegDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL,
  `Status` int(1) DEFAULT NULL,
  PRIMARY KEY (`StudentId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `tblstudents` */

insert  into `tblstudents`(`StudentId`,`StudentName`,`RollId`,`StudentEmail`,`Gender`,`DOB`,`ClassId`,`RegDate`,`UpdationDate`,`Status`) values (1,'Juan Estudiante','12125','jestudiante@cweb.com','Male','1991-09-06',1,'2022-09-04 03:38:05',NULL,1);
insert  into `tblstudents`(`StudentId`,`StudentName`,`RollId`,`StudentEmail`,`Gender`,`DOB`,`ClassId`,`RegDate`,`UpdationDate`,`Status`) values (2,'Patricia Cruz','12124','pcruz@cweb.com','Female','1992-08-31',1,'2022-09-04 03:38:32',NULL,1);
insert  into `tblstudents`(`StudentId`,`StudentName`,`RollId`,`StudentEmail`,`Gender`,`DOB`,`ClassId`,`RegDate`,`UpdationDate`,`Status`) values (3,'Andrea Valencia','12123','avalencia@cweb.com','Male','1998-09-02',1,'2022-09-04 04:56:15',NULL,1);
insert  into `tblstudents`(`StudentId`,`StudentName`,`RollId`,`StudentEmail`,`Gender`,`DOB`,`ClassId`,`RegDate`,`UpdationDate`,`Status`) values (4,'Pedro Estudiante','12121','pestudiante@cweb.com','Male','2000-06-06',1,'2022-10-19 16:21:16',NULL,1);
insert  into `tblstudents`(`StudentId`,`StudentName`,`RollId`,`StudentEmail`,`Gender`,`DOB`,`ClassId`,`RegDate`,`UpdationDate`,`Status`) values (5,'Pedro Molina','12122','pmolina@cweb.com','Male','1999-06-16',63,'2022-10-20 16:24:19',NULL,1);

/*Table structure for table `tblsubjectcombination` */

CREATE TABLE `tblsubjectcombination` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ClassId` int(11) DEFAULT NULL,
  `SubjectId` int(11) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `CreationDate` timestamp NULL DEFAULT current_timestamp(),
  `Updationdate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `tblsubjectcombination` */

insert  into `tblsubjectcombination`(`id`,`ClassId`,`SubjectId`,`status`,`CreationDate`,`Updationdate`) values (1,1,1,1,'2022-09-04 03:37:16','2022-10-21 09:57:29');
insert  into `tblsubjectcombination`(`id`,`ClassId`,`SubjectId`,`status`,`CreationDate`,`Updationdate`) values (2,1,2,1,'2022-09-04 03:40:16',NULL);
insert  into `tblsubjectcombination`(`id`,`ClassId`,`SubjectId`,`status`,`CreationDate`,`Updationdate`) values (3,1,3,1,'2022-09-04 03:40:25',NULL);
insert  into `tblsubjectcombination`(`id`,`ClassId`,`SubjectId`,`status`,`CreationDate`,`Updationdate`) values (4,1,4,1,'2022-09-04 03:40:32',NULL);
insert  into `tblsubjectcombination`(`id`,`ClassId`,`SubjectId`,`status`,`CreationDate`,`Updationdate`) values (5,1,5,1,'2022-09-04 03:40:40',NULL);
insert  into `tblsubjectcombination`(`id`,`ClassId`,`SubjectId`,`status`,`CreationDate`,`Updationdate`) values (6,63,6,1,'2022-09-04 04:55:40',NULL);
insert  into `tblsubjectcombination`(`id`,`ClassId`,`SubjectId`,`status`,`CreationDate`,`Updationdate`) values (7,63,7,1,'2022-10-21 17:25:52',NULL);
insert  into `tblsubjectcombination`(`id`,`ClassId`,`SubjectId`,`status`,`CreationDate`,`Updationdate`) values (8,63,7,0,'2022-10-21 17:26:25','2022-10-21 17:27:32');

/*Table structure for table `tblsubjects` */

CREATE TABLE `tblsubjects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `SubjectName` varchar(100) NOT NULL,
  `SubjectCode` varchar(100) DEFAULT NULL,
  `Creationdate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `tblsubjects` */

insert  into `tblsubjects`(`id`,`SubjectName`,`SubjectCode`,`Creationdate`,`UpdationDate`) values (1,'Ingeniería de Software','IS','2022-09-04 03:36:08',NULL);
insert  into `tblsubjects`(`id`,`SubjectName`,`SubjectCode`,`Creationdate`,`UpdationDate`) values (2,'Ciencia de Datos Introducción','CDI','2022-09-04 03:39:32',NULL);
insert  into `tblsubjects`(`id`,`SubjectName`,`SubjectCode`,`Creationdate`,`UpdationDate`) values (3,'Inglés Conversacional','ICL','2022-09-04 03:39:44',NULL);
insert  into `tblsubjects`(`id`,`SubjectName`,`SubjectCode`,`Creationdate`,`UpdationDate`) values (4,'Domótica','DMT','2022-09-04 03:39:53',NULL);
insert  into `tblsubjects`(`id`,`SubjectName`,`SubjectCode`,`Creationdate`,`UpdationDate`) values (5,'Sistemas Operativos Avanzados','SOA','2022-09-04 03:40:03',NULL);
insert  into `tblsubjects`(`id`,`SubjectName`,`SubjectCode`,`Creationdate`,`UpdationDate`) values (6,'Diseño UX','DUX','2022-09-04 04:55:25',NULL);
insert  into `tblsubjects`(`id`,`SubjectName`,`SubjectCode`,`Creationdate`,`UpdationDate`) values (7,'Fonética y Morfología Aplicada','FFMA','2022-10-21 17:25:02',NULL);
insert  into `tblsubjects`(`id`,`SubjectName`,`SubjectCode`,`Creationdate`,`UpdationDate`) values (8,'Fonética y Morfología Aplicada','FFMA','2022-10-21 17:25:24',NULL);

/*Table structure for table `tbluser` */

CREATE TABLE `tbluser` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `FullName` varchar(150) DEFAULT NULL,
  `Email` varchar(200) DEFAULT NULL,
  `MobileNumber` bigint(10) DEFAULT NULL,
  `Password` varchar(200) DEFAULT NULL,
  `RegDate` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `tbluser` */

insert  into `tbluser`(`ID`,`FullName`,`Email`,`MobileNumber`,`Password`,`RegDate`) values (8,'Mauricio Sevilla','hola@configuroweb.com',3162430081,'4b67deeb9aba04a5b54632ad19934f26','2019-05-17 00:34:16');
insert  into `tbluser`(`ID`,`FullName`,`Email`,`MobileNumber`,`Password`,`RegDate`) values (10,'Pedro Usuario','pusuario@cweb.com',3256849767,'f925916e2754e5e03f75dd58a5733251','2019-05-18 00:34:53');
insert  into `tbluser`(`ID`,`FullName`,`Email`,`MobileNumber`,`Password`,`RegDate`) values (11,'Juan Usuario','jusuario@cweb.com',3056847512,'75bc4f9d5ddcc951c9686b9780ed48c5','2024-08-29 04:21:15');
insert  into `tbluser`(`ID`,`FullName`,`Email`,`MobileNumber`,`Password`,`RegDate`) values (12,'Pedro Usuario','pusuario@cweb.com',3056243157,'4b67deeb9aba04a5b54632ad19934f26','2024-08-29 05:38:24');

/*Table structure for table `ticket` */

CREATE TABLE `ticket` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ticket_id` varchar(11) DEFAULT NULL,
  `email_id` varchar(300) DEFAULT NULL,
  `subject` varchar(300) DEFAULT NULL,
  `task_type` varchar(300) DEFAULT NULL,
  `prioprity` varchar(300) DEFAULT NULL,
  `ticket` longtext DEFAULT NULL,
  `attachment` varchar(300) DEFAULT NULL,
  `status` varchar(300) DEFAULT NULL,
  `admin_remark` longtext DEFAULT NULL,
  `posting_date` date DEFAULT NULL,
  `admin_remark_date` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `ticket` */

insert  into `ticket`(`id`,`ticket_id`,`email_id`,`subject`,`task_type`,`prioprity`,`ticket`,`attachment`,`status`,`admin_remark`,`posting_date`,`admin_remark_date`) values (13,'6','pcliente@cweb.com','Fallo con el Servidor IDPROD 26','Fallo a Nivel de Servidor','importante','Es necesario reiniciar la máquina de estados',NULL,'closed','Se realiza el proceso solicitado a satisfacción.','2022-11-29','2023-01-11 17:28:16');
insert  into `ticket`(`id`,`ticket_id`,`email_id`,`subject`,`task_type`,`prioprity`,`ticket`,`attachment`,`status`,`admin_remark`,`posting_date`,`admin_remark_date`) values (14,'7','pcliente@cweb.com','Fallo con el Servidor IDPROD 26','Fallo a Nivel de Servidor','non-urgent','Es necesario reiniciar la máquina de estados',NULL,'closed','Se realiza el proceso solicitado a satisfacción.','2022-11-29','2023-01-11 17:28:20');
insert  into `ticket`(`id`,`ticket_id`,`email_id`,`subject`,`task_type`,`prioprity`,`ticket`,`attachment`,`status`,`admin_remark`,`posting_date`,`admin_remark_date`) values (15,'1','jcliente@cweb.com','Fallo con el Servidor IDPROD 26','Fallo a Nivel de Servidor','Importante','Es necesario reiniciar la máquina de estados',NULL,'closed','Se realiza el proceso solicitado a satisfacción.','2023-01-11','2023-01-11 16:31:11');
insert  into `ticket`(`id`,`ticket_id`,`email_id`,`subject`,`task_type`,`prioprity`,`ticket`,`attachment`,`status`,`admin_remark`,`posting_date`,`admin_remark_date`) values (16,'2','jcliente@cweb.com','Fallo en consulta','Error capa de aplicación','Urgente-(Problema Funcional)','Se confirma que en la consulta se envía un json, con un campo en NULL',NULL,'closed','Se realiza en ajuste en la consulta, se procede al cierre del ticket.','2023-01-12','2023-01-12 11:12:12');
insert  into `ticket`(`id`,`ticket_id`,`email_id`,`subject`,`task_type`,`prioprity`,`ticket`,`attachment`,`status`,`admin_remark`,`posting_date`,`admin_remark_date`) values (17,'3','ecorreo@cweb.com','Fallo consulta','Incidente Lógica','Importante','La consulta de cédula de cliente no arroja resultados, esto para la operación por completo.',NULL,'closed','Se soluciona el fallo efectivamente, se confirma la resolución, se procede al cierre','2023-01-14','2023-01-14 09:50:48');

/*Table structure for table `tickets` */

CREATE TABLE `tickets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `name` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `tickets` */

insert  into `tickets`(`id`,`code`,`name`) values (20,'1212121B','Juan Jugador');

/*Table structure for table `upload` */

CREATE TABLE `upload` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `upload` */

insert  into `upload`(`id`,`name`,`date`) values (25,'3 Formas de acceder a MySQL por Consola en XAMPP.png','2021-10-06 06:41:27');
insert  into `upload`(`id`,`name`,`date`) values (26,'Registro-y-Control-de-Notas-para-Estudiantes-en-PHP-y-MySQL.jpg','2021-10-06 06:41:52');

/*Table structure for table `user` */

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `mobile` int(11) NOT NULL,
  `address` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `user` */

insert  into `user`(`id`,`email`,`password`,`first_name`,`last_name`,`mobile`,`address`) values (2,'hola@configuroweb.com','4b67deeb9aba04a5b54632ad19934f26','Mauricio','Sevilla',2147483647,'Calle 98 N 12 21');

/*Table structure for table `user_gallery` */

CREATE TABLE `user_gallery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `image_title` varchar(255) NOT NULL,
  `image_description` varchar(255) NOT NULL,
  `image_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `user_gallery` */

insert  into `user_gallery`(`id`,`user_id`,`image_title`,`image_description`,`image_name`) values (22,2,'Pacote de gerenciamento de projetos PHP','Pacote de gerenciamento de projetos PHP','Fbi3qCeXwAs0PCZ.jpg');
insert  into `user_gallery`(`id`,`user_id`,`image_title`,`image_description`,`image_name`) values (24,2,'meme 1','meme 1','298812137_769041044333769_6109347309285719005_n.jpg');

/*Table structure for table `usercheck` */

CREATE TABLE `usercheck` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `logindate` varchar(255) DEFAULT '',
  `logintime` varchar(255) DEFAULT '',
  `user_id` int(11) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT '',
  `ip` varbinary(16) DEFAULT NULL,
  `mac` varbinary(16) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `usercheck` */

insert  into `usercheck`(`id`,`logindate`,`logintime`,`user_id`,`username`,`email`,`ip`,`mac`,`city`,`country`) values (4,'2022/11/29','09:36:21am',2,'Pedro Cliente','pcliente@cweb.com','::1','00-0B-2B-02-65-D','','');
insert  into `usercheck`(`id`,`logindate`,`logintime`,`user_id`,`username`,`email`,`ip`,`mac`,`city`,`country`) values (3,'2022/11/29','09:01:36am',2,'Pedro Cliente','pcliente@cweb.com','::1','00-0B-2B-02-65-D','','');
insert  into `usercheck`(`id`,`logindate`,`logintime`,`user_id`,`username`,`email`,`ip`,`mac`,`city`,`country`) values (5,'2023/01/10','04:00:59am',3,'Juan Cliente','jcliente@cweb.com','127.0.0.1','Nombre de host. ','','');
insert  into `usercheck`(`id`,`logindate`,`logintime`,`user_id`,`username`,`email`,`ip`,`mac`,`city`,`country`) values (6,'2023/01/11','10:17:10pm',3,'Juan Cliente','jcliente@cweb.com','::1','Nombre de host. ','','');
insert  into `usercheck`(`id`,`logindate`,`logintime`,`user_id`,`username`,`email`,`ip`,`mac`,`city`,`country`) values (7,'2023/01/11','02:38:50am',3,'Juan Cliente','jcliente@cweb.com','::1','Nombre de host. ','','');
insert  into `usercheck`(`id`,`logindate`,`logintime`,`user_id`,`username`,`email`,`ip`,`mac`,`city`,`country`) values (8,'2023/01/11','02:40:06am',3,'Juan Cliente','jcliente@cweb.com','::1','Nombre de host. ','','');
insert  into `usercheck`(`id`,`logindate`,`logintime`,`user_id`,`username`,`email`,`ip`,`mac`,`city`,`country`) values (9,'2023/01/11','03:23:15am',3,'Juan Cliente','jcliente@cweb.com','127.0.0.1','Nombre de host. ','','');
insert  into `usercheck`(`id`,`logindate`,`logintime`,`user_id`,`username`,`email`,`ip`,`mac`,`city`,`country`) values (10,'2023/01/12','07:54:47pm',4,'Lorena Cliente','lcliente@cweb.com','::1','Nombre de host. ','','');
insert  into `usercheck`(`id`,`logindate`,`logintime`,`user_id`,`username`,`email`,`ip`,`mac`,`city`,`country`) values (11,'2023/01/14','08:14:36pm',5,'Equis','ecorreo@cweb.com','::1','Nombre de host. ','','');

/*Table structure for table `users` */

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `users` */

insert  into `users`(`user_id`,`username`,`password`,`email`) values (1,'configuroweb','4b67deeb9aba04a5b54632ad19934f26','hola@configuroweb.com');

/*Table structure for table `usertable` */

CREATE TABLE `usertable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `code` mediumint(50) NOT NULL,
  `status` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `usertable` */

insert  into `usertable`(`id`,`name`,`email`,`password`,`code`,`status`) values (2,'Mauricio Sevilla','msevillab@gmail.com','$2y$10$aF5MDCUaXxdfnPYFp028SOjzJXX6FLks31eK45HcwOh/1v4qn1hia',0,'verified');
insert  into `usertable`(`id`,`name`,`email`,`password`,`code`,`status`) values (3,'Mauricio Sevilla','hola@configuroweb.com','$2y$10$xl68zfqMTFVqe.VvlHG6k.ALime97/Zrcc9cm2vqm/UBxKL6uQqfe',0,'verified');

/*Table structure for table `usuarios` */

CREATE TABLE `usuarios` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `nombre` text NOT NULL,
  `apellido` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

/*Data for the table `usuarios` */

insert  into `usuarios`(`id`,`nombre`,`apellido`) values (1,'Mauricio','Britto');

/*Table structure for table `winners` */

CREATE TABLE `winners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ticket_id` int(11) NOT NULL,
  `draw` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ticket_id_fk` (`ticket_id`),
  CONSTRAINT `ticket_id_fk` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `winners` */

insert  into `winners`(`id`,`ticket_id`,`draw`) values (14,20,1);

/* Trigger structure for table `book_issue_log` */

DELIMITER $$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `issue_book` BEFORE INSERT ON `book_issue_log` FOR EACH ROW BEGIN
	SET NEW.due_date = DATE_ADD(CURRENT_DATE, INTERVAL 7 DAY);
    UPDATE member SET balance = balance - (SELECT price FROM book WHERE isbn = NEW.book_isbn) WHERE username = NEW.member;
    UPDATE book SET copies = copies - 1 WHERE isbn = NEW.book_isbn;
    DELETE FROM pending_book_requests WHERE member = NEW.member AND book_isbn = NEW.book_isbn;
END */$$


DELIMITER ;

/* Trigger structure for table `book_issue_log` */

DELIMITER $$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `return_book` BEFORE DELETE ON `book_issue_log` FOR EACH ROW BEGIN
    UPDATE member SET balance = balance + (SELECT price FROM book WHERE isbn = OLD.book_isbn) WHERE username = OLD.member;
    UPDATE book SET copies = copies + 1 WHERE isbn = OLD.book_isbn;
END */$$


DELIMITER ;

/* Trigger structure for table `member` */

DELIMITER $$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `add_member` AFTER INSERT ON `member` FOR EACH ROW DELETE FROM pending_registrations WHERE username = NEW.username */$$


DELIMITER ;

/* Trigger structure for table `member` */

DELIMITER $$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `remove_member` AFTER DELETE ON `member` FOR EACH ROW DELETE FROM pending_book_requests WHERE member = OLD.username */$$


DELIMITER ;

/* Procedure structure for procedure `generate_due_list` */

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `generate_due_list`()
    NO SQL
SELECT I.issue_id, M.email, B.isbn, B.title
FROM book_issue_log I INNER JOIN member M on I.member = M.username INNER JOIN book B ON I.book_isbn = B.isbn
WHERE DATEDIFF(CURRENT_DATE, I.due_date) >= 0 AND DATEDIFF(CURRENT_DATE, I.due_date) % 5 = 0 AND (I.last_reminded IS NULL OR DATEDIFF(I.last_reminded, CURRENT_DATE) <> 0) */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
