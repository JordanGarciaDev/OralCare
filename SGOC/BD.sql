/*
SQLyog Ultimate
MySQL - 10.11.9-MariaDB : Database - u600784253_sgoc
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `ajustes` */

CREATE TABLE `ajustes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_ini` date NOT NULL,
  `fecha_fin` date DEFAULT NULL,
  `empleado_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ajustes_empleados1` (`empleado_id`),
  CONSTRAINT `fk_ajustes_empleados1` FOREIGN KEY (`empleado_id`) REFERENCES `empleados` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

/*Data for the table `ajustes` */

/*Table structure for table `ajustes_asignaciones` */

CREATE TABLE `ajustes_asignaciones` (
  `asignacion_id` int(11) NOT NULL,
  `ajuste_id` int(11) NOT NULL,
  KEY `fk_asignaciones_empleados_asignaciones1` (`asignacion_id`),
  KEY `fk_asignaciones_empleados_ajustes1` (`ajuste_id`),
  CONSTRAINT `fk_asignaciones_empleados_ajustes1` FOREIGN KEY (`ajuste_id`) REFERENCES `ajustes` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_asignaciones_empleados_asignaciones1` FOREIGN KEY (`asignacion_id`) REFERENCES `asignaciones` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

/*Data for the table `ajustes_asignaciones` */

/*Table structure for table `ajustes_deducciones` */

CREATE TABLE `ajustes_deducciones` (
  `deduccion_id` int(11) NOT NULL,
  `ajuste_id` int(11) NOT NULL,
  KEY `fk_deducciones_empleados_deducciones1` (`deduccion_id`),
  KEY `fk_deducciones_empleados_ajustes1` (`ajuste_id`),
  CONSTRAINT `fk_deducciones_empleados_ajustes1` FOREIGN KEY (`ajuste_id`) REFERENCES `ajustes` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_deducciones_empleados_deducciones1` FOREIGN KEY (`deduccion_id`) REFERENCES `deducciones` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

/*Data for the table `ajustes_deducciones` */

/*Table structure for table `asignaciones` */

CREATE TABLE `asignaciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

/*Data for the table `asignaciones` */

insert  into `asignaciones`(`id`,`descripcion`) values (1,'Prima por Reconocimiento');
insert  into `asignaciones`(`id`,`descripcion`) values (2,'Prima por Hogar');
insert  into `asignaciones`(`id`,`descripcion`) values (3,'Prima por Antig?edad');
insert  into `asignaciones`(`id`,`descripcion`) values (4,'Prima por Transporte');
insert  into `asignaciones`(`id`,`descripcion`) values (5,'Prima por Hijos');
insert  into `asignaciones`(`id`,`descripcion`) values (6,'Prima de Nivelaci?n y Eficiencia Profesional');
insert  into `asignaciones`(`id`,`descripcion`) values (7,'Bono Nocturno');
insert  into `asignaciones`(`id`,`descripcion`) values (8,'Recargo Domingos y Dias Feriados');

/*Table structure for table `ausencias` */

CREATE TABLE `ausencias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(45) NOT NULL COMMENT 'Remunerada , No Remunerada',
  `fecha` date NOT NULL,
  `justificacion` text DEFAULT NULL,
  `empleado_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ausencias_empleados1` (`empleado_id`),
  CONSTRAINT `fk_ausencias_empleados1` FOREIGN KEY (`empleado_id`) REFERENCES `empleados` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

/*Data for the table `ausencias` */

/*Table structure for table `candidatos` */

CREATE TABLE `candidatos` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nombre_completo` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tipo_doc` int(10) NOT NULL,
  `num_doc` varchar(100) NOT NULL,
  `lug_exp` int(6) unsigned NOT NULL,
  `fec_nacimiento` date NOT NULL,
  `nacionalidad` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sexo` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `estado_civil` int(10) NOT NULL,
  `dir_residencia` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `barrio_residencia` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ciudad_residencia` int(6) unsigned NOT NULL,
  `tel_movil` bigint(20) NOT NULL,
  `email_personal` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email_empresarial` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `cargo_id` int(10) NOT NULL,
  `salario` bigint(20) NOT NULL,
  `fingreso` date NOT NULL,
  `fretiro` date DEFAULT NULL,
  `tipo_sangre` varchar(5) NOT NULL,
  `cv` text NOT NULL,
  `estado` enum('candidato','activo','retirado') NOT NULL,
  PRIMARY KEY (`id`,`num_doc`),
  KEY `tipo_doc` (`tipo_doc`),
  KEY `cargo` (`cargo_id`),
  KEY `ciudad_residencia` (`ciudad_residencia`),
  KEY `lug_exp` (`lug_exp`),
  KEY `estado_civil` (`estado_civil`)
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_general_ci;

/*Data for the table `candidatos` */

/*Table structure for table `cargos` */

CREATE TABLE `cargos` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `depto_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `depto_id` (`depto_id`),
  CONSTRAINT `cargos_ibfk_1` FOREIGN KEY (`depto_id`) REFERENCES `dep_contratacion` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `cargos` */

insert  into `cargos`(`id`,`nombre`,`depto_id`) values (1,'Asesor Comercial Ventas',1);
insert  into `cargos`(`id`,`nombre`,`depto_id`) values (2,'Anfitrion',1);
insert  into `cargos`(`id`,`nombre`,`depto_id`) values (3,'Auxiliar contable ',2);
insert  into `cargos`(`id`,`nombre`,`depto_id`) values (4,'Coordinadora de Recursos Humanos ',8);
insert  into `cargos`(`id`,`nombre`,`depto_id`) values (5,'Asesor Comercial Seguimiento',1);
insert  into `cargos`(`id`,`nombre`,`depto_id`) values (6,'Mantenimiento',6);
insert  into `cargos`(`id`,`nombre`,`depto_id`) values (7,'Auxiliar de Aseo y Desinfección ',9);
insert  into `cargos`(`id`,`nombre`,`depto_id`) values (8,'Auxiliar de Odontología',4);
insert  into `cargos`(`id`,`nombre`,`depto_id`) values (9,'Odontólogo General',4);
insert  into `cargos`(`id`,`nombre`,`depto_id`) values (10,'Endodoncista',4);
insert  into `cargos`(`id`,`nombre`,`depto_id`) values (11,'Implantólogo Oral',4);
insert  into `cargos`(`id`,`nombre`,`depto_id`) values (12,'Rehabilitador Oral',4);
insert  into `cargos`(`id`,`nombre`,`depto_id`) values (13,'Ortodoncista ',4);
insert  into `cargos`(`id`,`nombre`,`depto_id`) values (14,'Tecnico Electricista',6);
insert  into `cargos`(`id`,`nombre`,`depto_id`) values (15,'Desarrollador Web',7);
insert  into `cargos`(`id`,`nombre`,`depto_id`) values (16,'Gerente Comercial',1);
insert  into `cargos`(`id`,`nombre`,`depto_id`) values (17,'Gerente General',5);
insert  into `cargos`(`id`,`nombre`,`depto_id`) values (18,'Coordinador Administrativo ',3);
insert  into `cargos`(`id`,`nombre`,`depto_id`) values (19,'Coordinador de marketing',1);
insert  into `cargos`(`id`,`nombre`,`depto_id`) values (20,'Recepciónista',3);
insert  into `cargos`(`id`,`nombre`,`depto_id`) values (23,'prueba',3);
insert  into `cargos`(`id`,`nombre`,`depto_id`) values (24,'prueba test',1);

/*Table structure for table `cestatickets` */

CREATE TABLE `cestatickets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_ini` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `fecha_ela` datetime NOT NULL,
  `valor_diario` decimal(19,5) NOT NULL COMMENT '50% - UNIDAD TRIBUTARIA',
  `sueldo_minimo` decimal(19,5) NOT NULL,
  `bloquear` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

/*Data for the table `cestatickets` */

/*Table structure for table `comerciales` */

CREATE TABLE `comerciales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cantidad` decimal(19,5) NOT NULL,
  `fecha` date NOT NULL,
  `empleado_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_comerciales_empleados1` (`empleado_id`),
  CONSTRAINT `fk_comerciales_empleados1` FOREIGN KEY (`empleado_id`) REFERENCES `empleados` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

/*Data for the table `comerciales` */

/*Table structure for table `contratos` */

CREATE TABLE `contratos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_ini` date NOT NULL,
  `fecha_fin` date DEFAULT NULL,
  `modalidad` int(11) NOT NULL COMMENT 'Fijo , Contratado , Eventuales',
  `departamento_id` int(11) NOT NULL,
  `cargo_id` int(11) NOT NULL,
  `empleado_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_asignaciones_departamentos1` (`departamento_id`),
  KEY `fk_asignaciones_cargos1` (`cargo_id`),
  KEY `fk_asignaciones_empleados1` (`empleado_id`),
  KEY `MODALIDAD` (`modalidad`),
  CONSTRAINT `contratos_ibfk_1` FOREIGN KEY (`empleado_id`) REFERENCES `empleados` (`id`),
  CONSTRAINT `contratos_ibfk_2` FOREIGN KEY (`cargo_id`) REFERENCES `cargos` (`id`),
  CONSTRAINT `contratos_ibfk_3` FOREIGN KEY (`modalidad`) REFERENCES `modalidades` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

/*Data for the table `contratos` */

/*Table structure for table `deducciones` */

CREATE TABLE `deducciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

/*Data for the table `deducciones` */

insert  into `deducciones`(`id`,`descripcion`) values (1,'S.S.O (4%)');
insert  into `deducciones`(`id`,`descripcion`) values (2,'R?gimen Prestacional de Empleo (0.50%)');
insert  into `deducciones`(`id`,`descripcion`) values (3,'Fondo de Ahorro Obligatorio de Vivienda (FAOV) (1%)');
insert  into `deducciones`(`id`,`descripcion`) values (4,'Fondo de Pensiones (3%)');
insert  into `deducciones`(`id`,`descripcion`) values (5,'Caja de Ahorros');
insert  into `deducciones`(`id`,`descripcion`) values (6,'Pr?stamo Caja de Ahorros');
insert  into `deducciones`(`id`,`descripcion`) values (7,'Deducciones por Cr?ditos Comerciales');
insert  into `deducciones`(`id`,`descripcion`) values (8,'Deducciones por Tribunales');
insert  into `deducciones`(`id`,`descripcion`) values (9,'Retenci?n del Impuesto Sobre la Renta');
insert  into `deducciones`(`id`,`descripcion`) values (10,'Ley de Vivienda y Habitat (1%)');

/*Table structure for table `dep_contratacion` */

CREATE TABLE `dep_contratacion` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `dep_contratacion` */

insert  into `dep_contratacion`(`id`,`nombre`) values (1,'Marketing');
insert  into `dep_contratacion`(`id`,`nombre`) values (2,'Contabilidad');
insert  into `dep_contratacion`(`id`,`nombre`) values (3,'Administrativo');
insert  into `dep_contratacion`(`id`,`nombre`) values (4,'Asistencial');
insert  into `dep_contratacion`(`id`,`nombre`) values (5,'Gerencia');
insert  into `dep_contratacion`(`id`,`nombre`) values (6,'Mantenimiento');
insert  into `dep_contratacion`(`id`,`nombre`) values (7,'Sistemas');
insert  into `dep_contratacion`(`id`,`nombre`) values (8,'RRHH');
insert  into `dep_contratacion`(`id`,`nombre`) values (9,'Operario');

/*Table structure for table `departamentos` */

CREATE TABLE `departamentos` (
  `id_departamento` int(2) unsigned NOT NULL AUTO_INCREMENT,
  `departamento` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_departamento`),
  CONSTRAINT `departamentos_ibfk_1` FOREIGN KEY (`id_departamento`) REFERENCES `municipios` (`departamento_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `departamentos` */

insert  into `departamentos`(`id_departamento`,`departamento`) values (5,'ANTIOQUIA');
insert  into `departamentos`(`id_departamento`,`departamento`) values (8,'ATLÁNTICO');
insert  into `departamentos`(`id_departamento`,`departamento`) values (11,'BOGOTÁ, D.C.');
insert  into `departamentos`(`id_departamento`,`departamento`) values (13,'BOLÍVAR');
insert  into `departamentos`(`id_departamento`,`departamento`) values (15,'BOYACÁ');
insert  into `departamentos`(`id_departamento`,`departamento`) values (17,'CALDAS');
insert  into `departamentos`(`id_departamento`,`departamento`) values (18,'CAQUETÁ');
insert  into `departamentos`(`id_departamento`,`departamento`) values (19,'CAUCA');
insert  into `departamentos`(`id_departamento`,`departamento`) values (20,'CESAR');
insert  into `departamentos`(`id_departamento`,`departamento`) values (23,'CÓRDOBA');
insert  into `departamentos`(`id_departamento`,`departamento`) values (25,'CUNDINAMARCA');
insert  into `departamentos`(`id_departamento`,`departamento`) values (27,'CHOCÓ');
insert  into `departamentos`(`id_departamento`,`departamento`) values (41,'HUILA');
insert  into `departamentos`(`id_departamento`,`departamento`) values (44,'LA GUAJIRA');
insert  into `departamentos`(`id_departamento`,`departamento`) values (47,'MAGDALENA');
insert  into `departamentos`(`id_departamento`,`departamento`) values (50,'META');
insert  into `departamentos`(`id_departamento`,`departamento`) values (52,'NARIÑO');
insert  into `departamentos`(`id_departamento`,`departamento`) values (54,'NORTE DE SANTANDER');
insert  into `departamentos`(`id_departamento`,`departamento`) values (63,'QUINDIO');
insert  into `departamentos`(`id_departamento`,`departamento`) values (66,'RISARALDA');
insert  into `departamentos`(`id_departamento`,`departamento`) values (68,'SANTANDER');
insert  into `departamentos`(`id_departamento`,`departamento`) values (70,'SUCRE');
insert  into `departamentos`(`id_departamento`,`departamento`) values (73,'TOLIMA');
insert  into `departamentos`(`id_departamento`,`departamento`) values (76,'VALLE DEL CAUCA');
insert  into `departamentos`(`id_departamento`,`departamento`) values (81,'ARAUCA');
insert  into `departamentos`(`id_departamento`,`departamento`) values (85,'CASANARE');
insert  into `departamentos`(`id_departamento`,`departamento`) values (86,'PUTUMAYO');
insert  into `departamentos`(`id_departamento`,`departamento`) values (88,'ARCHIPIÉLAGO DE SAN ANDRÉS, PROVIDENCIA Y SANTA CATALINA');
insert  into `departamentos`(`id_departamento`,`departamento`) values (91,'AMAZONAS');
insert  into `departamentos`(`id_departamento`,`departamento`) values (94,'GUAINÍA');
insert  into `departamentos`(`id_departamento`,`departamento`) values (95,'GUAVIARE');
insert  into `departamentos`(`id_departamento`,`departamento`) values (97,'VAUPÉS');
insert  into `departamentos`(`id_departamento`,`departamento`) values (99,'VICHADA');

/*Table structure for table `detalle_cestatickets` */

CREATE TABLE `detalle_cestatickets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `total` decimal(19,5) NOT NULL,
  `dias_adicionales` int(11) NOT NULL,
  `dias_descontar` int(11) NOT NULL,
  `dias_laborados` int(11) NOT NULL,
  `cargo` varchar(45) NOT NULL,
  `departamento` varchar(45) NOT NULL,
  `modalidad` varchar(45) NOT NULL,
  `empleado_id` int(11) NOT NULL,
  `cestaticket_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_detalle_cestatickets_cestatickets1` (`cestaticket_id`),
  KEY `fk_detalle_cestatickets_empleados1` (`empleado_id`),
  CONSTRAINT `fk_detalle_cestatickets_cestatickets1` FOREIGN KEY (`cestaticket_id`) REFERENCES `cestatickets` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_detalle_cestatickets_empleados1` FOREIGN KEY (`empleado_id`) REFERENCES `empleados` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

/*Data for the table `detalle_cestatickets` */

/*Table structure for table `detalle_eventualidades` */

CREATE TABLE `detalle_eventualidades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `valor` decimal(19,5) NOT NULL,
  `empleado_id` int(11) NOT NULL,
  `eventualidad_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_detalle_eventualidades_empleados1` (`empleado_id`),
  KEY `fk_detalle_eventualidades_eventualidades1` (`eventualidad_id`),
  CONSTRAINT `fk_detalle_eventualidades_empleados1` FOREIGN KEY (`empleado_id`) REFERENCES `empleados` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_detalle_eventualidades_eventualidades1` FOREIGN KEY (`eventualidad_id`) REFERENCES `eventualidades` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

/*Data for the table `detalle_eventualidades` */

/*Table structure for table `detalle_recibos` */

CREATE TABLE `detalle_recibos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `concepto` varchar(13) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `monto` decimal(19,5) NOT NULL,
  `recibo_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_detalle_recibos_recibos1` (`recibo_id`),
  CONSTRAINT `fk_detalle_recibos_recibos1` FOREIGN KEY (`recibo_id`) REFERENCES `recibos` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=43643 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

/*Data for the table `detalle_recibos` */

/*Table structure for table `documentos` */

CREATE TABLE `documentos` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nombre` text DEFAULT NULL,
  `tdoc_id` int(10) DEFAULT NULL,
  `empleado_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tdoc_id` (`tdoc_id`),
  KEY `empleado_id` (`empleado_id`),
  CONSTRAINT `documentos_ibfk_1` FOREIGN KEY (`tdoc_id`) REFERENCES `tipo_docs` (`id`),
  CONSTRAINT `documentos_ibfk_2` FOREIGN KEY (`empleado_id`) REFERENCES `empleados` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `documentos` */

/*Table structure for table `empleados` */

CREATE TABLE `empleados` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nombre_completo` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tipo_doc` int(10) NOT NULL,
  `num_doc` varchar(100) NOT NULL,
  `lug_exp` int(6) unsigned NOT NULL,
  `fec_nacimiento` date NOT NULL,
  `nacionalidad` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sexo` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `estado_civil` int(10) NOT NULL,
  `dir_residencia` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `barrio_residencia` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ciudad_residencia` int(6) unsigned NOT NULL,
  `tel_movil` bigint(20) NOT NULL,
  `email_personal` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email_empresarial` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `cargo_id` int(10) NOT NULL,
  `salario` bigint(20) NOT NULL,
  `fingreso` date NOT NULL,
  `fretiro` date DEFAULT NULL,
  `tipo_sangre` varchar(5) NOT NULL,
  `estado` enum('candidato','activo','retirado') NOT NULL,
  PRIMARY KEY (`id`,`num_doc`),
  KEY `tipo_doc` (`tipo_doc`),
  KEY `cargo` (`cargo_id`),
  KEY `ciudad_residencia` (`ciudad_residencia`),
  KEY `lug_exp` (`lug_exp`),
  KEY `estado_civil` (`estado_civil`),
  CONSTRAINT `empleados_ibfk_1` FOREIGN KEY (`tipo_doc`) REFERENCES `tipo_identificacion` (`id`),
  CONSTRAINT `empleados_ibfk_2` FOREIGN KEY (`cargo_id`) REFERENCES `cargos` (`id`),
  CONSTRAINT `empleados_ibfk_3` FOREIGN KEY (`ciudad_residencia`) REFERENCES `municipios` (`id_municipio`),
  CONSTRAINT `empleados_ibfk_4` FOREIGN KEY (`lug_exp`) REFERENCES `municipios` (`id_municipio`),
  CONSTRAINT `empleados_ibfk_5` FOREIGN KEY (`estado_civil`) REFERENCES `estados_civiles` (`id`),
  CONSTRAINT `empleados_ibfk_6` FOREIGN KEY (`cargo_id`) REFERENCES `cargos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf32 COLLATE=utf32_general_ci;

/*Data for the table `empleados` */

insert  into `empleados`(`id`,`nombre_completo`,`tipo_doc`,`num_doc`,`lug_exp`,`fec_nacimiento`,`nacionalidad`,`sexo`,`estado_civil`,`dir_residencia`,`barrio_residencia`,`ciudad_residencia`,`tel_movil`,`email_personal`,`email_empresarial`,`cargo_id`,`salario`,`fingreso`,`fretiro`,`tipo_sangre`,`estado`) values (1,'Jaime Borja Altamar',8,'12345',88,'1996-08-03','CO','M',1,'CL 123','LAS DELICIAS',88,3045937472,'ing.jordangarcia@gmail.com',NULL,15,11111,'2024-10-21','2024-10-28','O+','candidato');
insert  into `empleados`(`id`,`nombre_completo`,`tipo_doc`,`num_doc`,`lug_exp`,`fec_nacimiento`,`nacionalidad`,`sexo`,`estado_civil`,`dir_residencia`,`barrio_residencia`,`ciudad_residencia`,`tel_movil`,`email_personal`,`email_empresarial`,`cargo_id`,`salario`,`fingreso`,`fretiro`,`tipo_sangre`,`estado`) values (11,'ONCE',15,'554654',8,'2024-10-28','CO','M',1,'dfvdfgfdg','dgfdgfdg',15,5544554,'dfgfd@gmail.com','ssss@gmail.com',17,455454,'0000-00-00','2024-10-28','O+','');
insert  into `empleados`(`id`,`nombre_completo`,`tipo_doc`,`num_doc`,`lug_exp`,`fec_nacimiento`,`nacionalidad`,`sexo`,`estado_civil`,`dir_residencia`,`barrio_residencia`,`ciudad_residencia`,`tel_movil`,`email_personal`,`email_empresarial`,`cargo_id`,`salario`,`fingreso`,`fretiro`,`tipo_sangre`,`estado`) values (12,'eeeee',15,'554654',8,'2024-10-28','CO','M',1,'dfvdfgfdg','dgfdgfdg',15,5544554,'dfgfd@gmail.com','ssss@gmail.com',17,455454,'2024-10-28','2024-10-28','O+','activo');
insert  into `empleados`(`id`,`nombre_completo`,`tipo_doc`,`num_doc`,`lug_exp`,`fec_nacimiento`,`nacionalidad`,`sexo`,`estado_civil`,`dir_residencia`,`barrio_residencia`,`ciudad_residencia`,`tel_movil`,`email_personal`,`email_empresarial`,`cargo_id`,`salario`,`fingreso`,`fretiro`,`tipo_sangre`,`estado`) values (17,'oma',15,'554654',8,'2024-10-28','CO','M',1,'dfvdfgfdg','dgfdgfdg',15,5544554,'dfgfd@gmail.com','ssss@gmail.com',17,455454,'2024-10-28','2024-10-28','O+','activo');
insert  into `empleados`(`id`,`nombre_completo`,`tipo_doc`,`num_doc`,`lug_exp`,`fec_nacimiento`,`nacionalidad`,`sexo`,`estado_civil`,`dir_residencia`,`barrio_residencia`,`ciudad_residencia`,`tel_movil`,`email_personal`,`email_empresarial`,`cargo_id`,`salario`,`fingreso`,`fretiro`,`tipo_sangre`,`estado`) values (18,'ema',15,'554654',8,'2024-10-28','CO','M',1,'dfvdfgfdg','dgfdgfdg',15,5544554,'dfgfd@gmail.com','ssss@gmail.com',17,455454,'2024-10-28','2024-10-28','O+','activo');
insert  into `empleados`(`id`,`nombre_completo`,`tipo_doc`,`num_doc`,`lug_exp`,`fec_nacimiento`,`nacionalidad`,`sexo`,`estado_civil`,`dir_residencia`,`barrio_residencia`,`ciudad_residencia`,`tel_movil`,`email_personal`,`email_empresarial`,`cargo_id`,`salario`,`fingreso`,`fretiro`,`tipo_sangre`,`estado`) values (19,'doce',15,'554654',8,'2024-10-28','CO','M',1,'dfvdfgfdg','dgfdgfdg',15,5544554,'dfgfd@gmail.com','ssss@gmail.com',17,455454,'2024-10-28','2024-10-28','O+','activo');
insert  into `empleados`(`id`,`nombre_completo`,`tipo_doc`,`num_doc`,`lug_exp`,`fec_nacimiento`,`nacionalidad`,`sexo`,`estado_civil`,`dir_residencia`,`barrio_residencia`,`ciudad_residencia`,`tel_movil`,`email_personal`,`email_empresarial`,`cargo_id`,`salario`,`fingreso`,`fretiro`,`tipo_sangre`,`estado`) values (20,'once',15,'554654',8,'2024-10-28','CO','M',1,'dfvdfgfdg','dgfdgfdg',15,5544554,'dfgfd@gmail.com','ssss@gmail.com',17,455454,'2024-10-28','2024-10-28','O+','activo');
insert  into `empleados`(`id`,`nombre_completo`,`tipo_doc`,`num_doc`,`lug_exp`,`fec_nacimiento`,`nacionalidad`,`sexo`,`estado_civil`,`dir_residencia`,`barrio_residencia`,`ciudad_residencia`,`tel_movil`,`email_personal`,`email_empresarial`,`cargo_id`,`salario`,`fingreso`,`fretiro`,`tipo_sangre`,`estado`) values (21,'veinte',15,'554654',8,'2024-10-28','CO','M',1,'dfvdfgfdg','dgfdgfdg',15,5544554,'dfgfd@gmail.com','ssss@gmail.com',17,455454,'2024-10-28','2024-10-28','O+','activo');
insert  into `empleados`(`id`,`nombre_completo`,`tipo_doc`,`num_doc`,`lug_exp`,`fec_nacimiento`,`nacionalidad`,`sexo`,`estado_civil`,`dir_residencia`,`barrio_residencia`,`ciudad_residencia`,`tel_movil`,`email_personal`,`email_empresarial`,`cargo_id`,`salario`,`fingreso`,`fretiro`,`tipo_sangre`,`estado`) values (22,'VEINTE 2',15,'554654',8,'2024-10-28','CO','M',1,'dfvdfgfdg','dgfdgfdg',15,5544554,'dfgfd@gmail.com','ssss@gmail.com',17,455454,'0000-00-00','2024-10-28','O+','');

/*Table structure for table `entrevistas` */

CREATE TABLE `entrevistas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `empleado_id` int(11) NOT NULL,
  `pregunta_id` int(11) NOT NULL,
  `respuesta` text NOT NULL,
  `fechareg` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `pregunta_id` (`pregunta_id`),
  CONSTRAINT `entrevistas_ibfk_1` FOREIGN KEY (`pregunta_id`) REFERENCES `preguntas_entrevistas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `entrevistas` */

insert  into `entrevistas`(`id`,`empleado_id`,`pregunta_id`,`respuesta`,`fechareg`) values (2,1,5,'negro','2024-10-28 09:49:09');
insert  into `entrevistas`(`id`,`empleado_id`,`pregunta_id`,`respuesta`,`fechareg`) values (3,18,5,'blanco','2024-10-29 15:57:16');

/*Table structure for table `estados_civiles` */

CREATE TABLE `estados_civiles` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `estados_civiles` */

insert  into `estados_civiles`(`id`,`nombre`) values (1,'Soltero(a)');
insert  into `estados_civiles`(`id`,`nombre`) values (2,'Casado(a)');
insert  into `estados_civiles`(`id`,`nombre`) values (3,'Viudo(a)');
insert  into `estados_civiles`(`id`,`nombre`) values (4,'Divorciado(a)');
insert  into `estados_civiles`(`id`,`nombre`) values (5,'Unión Libre');
insert  into `estados_civiles`(`id`,`nombre`) values (6,'Separado(a)');

/*Table structure for table `eventualidades` */

CREATE TABLE `eventualidades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) NOT NULL,
  `tipo` varchar(45) NOT NULL COMMENT 'Asignacion o Deduccion',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

/*Data for the table `eventualidades` */

/*Table structure for table `experiencias` */

CREATE TABLE `experiencias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `organismo` varchar(45) NOT NULL,
  `cargo` varchar(45) NOT NULL,
  `fecha_ini` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `observaciones` varchar(60) DEFAULT NULL,
  `empleado_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_experiencias_empleados1` (`empleado_id`),
  CONSTRAINT `fk_experiencias_empleados1` FOREIGN KEY (`empleado_id`) REFERENCES `empleados` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

/*Data for the table `experiencias` */

/*Table structure for table `familiares` */

CREATE TABLE `familiares` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) NOT NULL,
  `parentesco` varchar(45) NOT NULL COMMENT 'Hijo, Hija, Padre, Madre, Hermano, Hermana',
  `discapacidad` varchar(2) NOT NULL DEFAULT 'No' COMMENT 'Si o No',
  `instruccion` varchar(45) NOT NULL DEFAULT 'Ninguna',
  `fecha` date NOT NULL,
  `fecha_efec` date NOT NULL COMMENT 'Fecha en la que se hace efectivo para el sistema',
  `empleado_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_familiares_empleados1` (`empleado_id`),
  CONSTRAINT `fk_familiares_empleados1` FOREIGN KEY (`empleado_id`) REFERENCES `empleados` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

/*Data for the table `familiares` */

/*Table structure for table `feriados` */

CREATE TABLE `feriados` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

/*Data for the table `feriados` */

/*Table structure for table `grupos` */

CREATE TABLE `grupos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

/*Data for the table `grupos` */

insert  into `grupos`(`id`,`nombre`) values (1,'Empleado');
insert  into `grupos`(`id`,`nombre`) values (2,'Obrero');

/*Table structure for table `historiales` */

CREATE TABLE `historiales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sueldo_base` decimal(19,5) NOT NULL,
  `fecha_ini` date NOT NULL COMMENT 'Inicio ',
  `fecha_fin` date DEFAULT NULL COMMENT 'Fin',
  `fecha_ret` date DEFAULT NULL COMMENT 'Fecha desde donde se va a pagar el sueldo retroactivo',
  `cargo_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_historiales_cargos1` (`cargo_id`),
  CONSTRAINT `fk_historiales_cargos1` FOREIGN KEY (`cargo_id`) REFERENCES `cargos` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

/*Data for the table `historiales` */

/*Table structure for table `horas_extras` */

CREATE TABLE `horas_extras` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(45) NOT NULL COMMENT 'Nocturno, Domingos y Feriados',
  `fecha` date NOT NULL,
  `comentario` varchar(45) DEFAULT NULL,
  `empleado_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_horasextras_empleados1` (`empleado_id`),
  CONSTRAINT `fk_horasextras_empleados1` FOREIGN KEY (`empleado_id`) REFERENCES `empleados` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

/*Data for the table `horas_extras` */

/*Table structure for table `islr` */

CREATE TABLE `islr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `porcentaje` decimal(19,5) NOT NULL,
  `fecha` date NOT NULL,
  `empleado_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_islr_empleados1` (`empleado_id`),
  CONSTRAINT `fk_islr_empleados1` FOREIGN KEY (`empleado_id`) REFERENCES `empleados` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

/*Data for the table `islr` */

/*Table structure for table `localizaciones` */

CREATE TABLE `localizaciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `departamento_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_localizaciones_departamentos1` (`departamento_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

/*Data for the table `localizaciones` */

/*Table structure for table `modalidades` */

CREATE TABLE `modalidades` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `modalidades` */

insert  into `modalidades`(`id`,`nombre`) values (1,'Presencial');
insert  into `modalidades`(`id`,`nombre`) values (2,'Remoto');

/*Table structure for table `municipios` */

CREATE TABLE `municipios` (
  `id_municipio` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `municipio` varchar(255) NOT NULL DEFAULT '',
  `departamento_id` int(2) unsigned NOT NULL,
  PRIMARY KEY (`id_municipio`),
  KEY `departamento_id` (`departamento_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `municipios` */

insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (1,'Abriaquí',5);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (2,'Acacías',50);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (3,'Acandí',27);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (4,'Acevedo',41);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (5,'Achí',13);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (6,'Agrado',41);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (7,'Agua de Dios',25);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (8,'Aguachica',20);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (9,'Aguada',68);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (10,'Aguadas',17);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (11,'Aguazul',85);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (12,'Agustín Codazzi',20);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (13,'Aipe',41);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (14,'Albania',18);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (15,'Albania',44);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (16,'Albania',68);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (17,'Albán',25);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (18,'Albán (San José)',52);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (19,'Alcalá',76);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (20,'Alejandria',5);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (21,'Algarrobo',47);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (22,'Algeciras',41);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (23,'Almaguer',19);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (24,'Almeida',15);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (25,'Alpujarra',73);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (26,'Altamira',41);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (27,'Alto Baudó (Pie de Pato)',27);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (28,'Altos del Rosario',13);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (29,'Alvarado',73);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (30,'Amagá',5);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (31,'Amalfi',5);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (32,'Ambalema',73);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (33,'Anapoima',25);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (34,'Ancuya',52);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (35,'Andalucía',76);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (36,'Andes',5);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (37,'Angelópolis',5);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (38,'Angostura',5);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (39,'Anolaima',25);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (40,'Anorí',5);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (41,'Anserma',17);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (42,'Ansermanuevo',76);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (43,'Anzoátegui',73);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (44,'Anzá',5);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (45,'Apartadó',5);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (46,'Apulo',25);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (47,'Apía',66);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (48,'Aquitania',15);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (49,'Aracataca',47);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (50,'Aranzazu',17);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (51,'Aratoca',68);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (52,'Arauca',81);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (53,'Arauquita',81);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (54,'Arbeláez',25);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (55,'Arboleda (Berruecos)',52);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (56,'Arboledas',54);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (57,'Arboletes',5);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (58,'Arcabuco',15);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (59,'Arenal',13);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (60,'Argelia',5);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (61,'Argelia',19);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (62,'Argelia',76);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (63,'Ariguaní (El Difícil)',47);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (64,'Arjona',13);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (65,'Armenia',5);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (66,'Armenia',63);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (67,'Armero (Guayabal)',73);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (68,'Arroyohondo',13);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (69,'Astrea',20);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (70,'Ataco',73);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (71,'Atrato (Yuto)',27);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (72,'Ayapel',23);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (73,'Bagadó',27);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (74,'Bahía Solano (Mútis)',27);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (75,'Bajo Baudó (Pizarro)',27);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (76,'Balboa',19);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (77,'Balboa',66);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (78,'Baranoa',8);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (79,'Baraya',41);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (80,'Barbacoas',52);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (81,'Barbosa',5);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (82,'Barbosa',68);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (83,'Barichara',68);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (84,'Barranca de Upía',50);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (85,'Barrancabermeja',68);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (86,'Barrancas',44);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (87,'Barranco de Loba',13);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (88,'Barranquilla',8);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (89,'Becerríl',20);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (90,'Belalcázar',17);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (91,'Bello',5);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (92,'Belmira',5);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (93,'Beltrán',25);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (94,'Belén',15);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (95,'Belén',52);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (96,'Belén de Bajirá',27);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (97,'Belén de Umbría',66);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (98,'Belén de los Andaquíes',18);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (99,'Berbeo',15);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (100,'Betania',5);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (101,'Beteitiva',15);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (102,'Betulia',5);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (103,'Betulia',68);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (104,'Bituima',25);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (105,'Boavita',15);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (106,'Bochalema',54);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (107,'Bogotá D.C.',11);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (108,'Bojacá',25);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (109,'Bojayá (Bellavista)',27);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (110,'Bolívar',5);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (111,'Bolívar',19);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (112,'Bolívar',68);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (113,'Bolívar',76);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (114,'Bosconia',20);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (115,'Boyacá',15);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (116,'Briceño',5);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (117,'Briceño',15);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (118,'Bucaramanga',68);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (119,'Bucarasica',54);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (120,'Buenaventura',76);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (121,'Buenavista',15);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (122,'Buenavista',23);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (123,'Buenavista',63);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (124,'Buenavista',70);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (125,'Buenos Aires',19);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (126,'Buesaco',52);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (127,'Buga',76);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (128,'Bugalagrande',76);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (129,'Burítica',5);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (130,'Busbanza',15);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (131,'Cabrera',25);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (132,'Cabrera',68);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (133,'Cabuyaro',50);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (134,'Cachipay',25);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (135,'Caicedo',5);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (136,'Caicedonia',76);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (137,'Caimito',70);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (138,'Cajamarca',73);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (139,'Cajibío',19);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (140,'Cajicá',25);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (141,'Calamar',13);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (142,'Calamar',95);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (143,'Calarcá',63);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (144,'Caldas',5);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (145,'Caldas',15);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (146,'Caldono',19);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (147,'California',68);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (148,'Calima (Darién)',76);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (149,'Caloto',19);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (150,'Calí',76);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (151,'Campamento',5);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (152,'Campo de la Cruz',8);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (153,'Campoalegre',41);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (154,'Campohermoso',15);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (155,'Canalete',23);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (156,'Candelaria',8);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (157,'Candelaria',76);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (158,'Cantagallo',13);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (159,'Cantón de San Pablo',27);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (160,'Caparrapí',25);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (161,'Capitanejo',68);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (162,'Caracolí',5);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (163,'Caramanta',5);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (164,'Carcasí',68);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (165,'Carepa',5);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (166,'Carmen de Apicalá',73);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (167,'Carmen de Carupa',25);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (168,'Carmen de Viboral',5);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (169,'Carmen del Darién (CURBARADÓ)',27);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (170,'Carolina',5);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (171,'Cartagena',13);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (172,'Cartagena del Chairá',18);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (173,'Cartago',76);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (174,'Carurú',97);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (175,'Casabianca',73);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (176,'Castilla la Nueva',50);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (177,'Caucasia',5);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (178,'Cañasgordas',5);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (179,'Cepita',68);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (180,'Cereté',23);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (181,'Cerinza',15);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (182,'Cerrito',68);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (183,'Cerro San Antonio',47);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (184,'Chachaguí',52);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (185,'Chaguaní',25);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (186,'Chalán',70);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (187,'Chaparral',73);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (188,'Charalá',68);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (189,'Charta',68);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (190,'Chigorodó',5);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (191,'Chima',68);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (192,'Chimichagua',20);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (193,'Chimá',23);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (194,'Chinavita',15);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (195,'Chinchiná',17);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (196,'Chinácota',54);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (197,'Chinú',23);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (198,'Chipaque',25);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (199,'Chipatá',68);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (200,'Chiquinquirá',15);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (201,'Chiriguaná',20);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (202,'Chiscas',15);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (203,'Chita',15);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (204,'Chitagá',54);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (205,'Chitaraque',15);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (206,'Chivatá',15);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (207,'Chivolo',47);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (208,'Choachí',25);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (209,'Chocontá',25);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (210,'Chámeza',85);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (211,'Chía',25);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (212,'Chíquiza',15);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (213,'Chívor',15);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (214,'Cicuco',13);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (215,'Cimitarra',68);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (216,'Circasia',63);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (217,'Cisneros',5);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (218,'Ciénaga',15);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (219,'Ciénaga',47);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (220,'Ciénaga de Oro',23);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (221,'Clemencia',13);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (222,'Cocorná',5);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (223,'Coello',73);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (224,'Cogua',25);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (225,'Colombia',41);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (226,'Colosó (Ricaurte)',70);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (227,'Colón',86);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (228,'Colón (Génova)',52);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (229,'Concepción',5);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (230,'Concepción',68);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (231,'Concordia',5);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (232,'Concordia',47);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (233,'Condoto',27);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (234,'Confines',68);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (235,'Consaca',52);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (236,'Contadero',52);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (237,'Contratación',68);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (238,'Convención',54);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (239,'Copacabana',5);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (240,'Coper',15);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (241,'Cordobá',63);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (242,'Corinto',19);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (243,'Coromoro',68);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (244,'Corozal',70);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (245,'Corrales',15);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (246,'Cota',25);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (247,'Cotorra',23);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (248,'Covarachía',15);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (249,'Coveñas',70);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (250,'Coyaima',73);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (251,'Cravo Norte',81);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (252,'Cuaspud (Carlosama)',52);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (253,'Cubarral',50);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (254,'Cubará',15);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (255,'Cucaita',15);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (256,'Cucunubá',25);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (257,'Cucutilla',54);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (258,'Cuitiva',15);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (259,'Cumaral',50);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (260,'Cumaribo',99);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (261,'Cumbal',52);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (262,'Cumbitara',52);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (263,'Cunday',73);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (264,'Curillo',18);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (265,'Curití',68);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (266,'Curumaní',20);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (267,'Cáceres',5);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (268,'Cáchira',54);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (269,'Cácota',54);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (270,'Cáqueza',25);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (271,'Cértegui',27);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (272,'Cómbita',15);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (273,'Córdoba',13);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (274,'Córdoba',52);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (275,'Cúcuta',54);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (276,'Dabeiba',5);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (277,'Dagua',76);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (278,'Dibulla',44);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (279,'Distracción',44);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (280,'Dolores',73);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (281,'Don Matías',5);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (282,'Dos Quebradas',66);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (283,'Duitama',15);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (284,'Durania',54);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (285,'Ebéjico',5);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (286,'El Bagre',5);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (287,'El Banco',47);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (288,'El Cairo',76);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (289,'El Calvario',50);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (290,'El Carmen',54);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (291,'El Carmen',68);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (292,'El Carmen de Atrato',27);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (293,'El Carmen de Bolívar',13);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (294,'El Castillo',50);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (295,'El Cerrito',76);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (296,'El Charco',52);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (297,'El Cocuy',15);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (298,'El Colegio',25);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (299,'El Copey',20);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (300,'El Doncello',18);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (301,'El Dorado',50);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (302,'El Dovio',76);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (303,'El Espino',15);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (304,'El Guacamayo',68);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (305,'El Guamo',13);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (306,'El Molino',44);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (307,'El Paso',20);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (308,'El Paujil',18);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (309,'El Peñol',52);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (310,'El Peñon',13);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (311,'El Peñon',68);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (312,'El Peñón',25);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (313,'El Piñon',47);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (314,'El Playón',68);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (315,'El Retorno',95);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (316,'El Retén',47);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (317,'El Roble',70);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (318,'El Rosal',25);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (319,'El Rosario',52);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (320,'El Tablón de Gómez',52);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (321,'El Tambo',19);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (322,'El Tambo',52);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (323,'El Tarra',54);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (324,'El Zulia',54);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (325,'El Águila',76);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (326,'Elías',41);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (327,'Encino',68);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (328,'Enciso',68);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (329,'Entrerríos',5);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (330,'Envigado',5);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (331,'Espinal',73);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (332,'Facatativá',25);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (333,'Falan',73);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (334,'Filadelfia',17);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (335,'Filandia',63);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (336,'Firavitoba',15);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (337,'Flandes',73);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (338,'Florencia',18);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (339,'Florencia',19);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (340,'Floresta',15);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (341,'Florida',76);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (342,'Floridablanca',68);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (343,'Florián',68);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (344,'Fonseca',44);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (345,'Fortúl',81);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (346,'Fosca',25);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (347,'Francisco Pizarro',52);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (348,'Fredonia',5);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (349,'Fresno',73);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (350,'Frontino',5);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (351,'Fuente de Oro',50);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (352,'Fundación',47);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (353,'Funes',52);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (354,'Funza',25);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (355,'Fusagasugá',25);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (356,'Fómeque',25);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (357,'Fúquene',25);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (358,'Gachalá',25);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (359,'Gachancipá',25);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (360,'Gachantivá',15);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (361,'Gachetá',25);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (362,'Galapa',8);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (363,'Galeras (Nueva Granada)',70);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (364,'Galán',68);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (365,'Gama',25);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (366,'Gamarra',20);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (367,'Garagoa',15);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (368,'Garzón',41);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (369,'Gigante',41);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (370,'Ginebra',76);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (371,'Giraldo',5);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (372,'Girardot',25);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (373,'Girardota',5);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (374,'Girón',68);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (375,'Gonzalez',20);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (376,'Gramalote',54);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (377,'Granada',5);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (378,'Granada',25);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (379,'Granada',50);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (380,'Guaca',68);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (381,'Guacamayas',15);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (382,'Guacarí',76);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (383,'Guachavés',52);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (384,'Guachené',19);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (385,'Guachetá',25);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (386,'Guachucal',52);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (387,'Guadalupe',5);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (388,'Guadalupe',41);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (389,'Guadalupe',68);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (390,'Guaduas',25);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (391,'Guaitarilla',52);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (392,'Gualmatán',52);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (393,'Guamal',47);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (394,'Guamal',50);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (395,'Guamo',73);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (396,'Guapota',68);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (397,'Guapí',19);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (398,'Guaranda',70);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (399,'Guarne',5);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (400,'Guasca',25);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (401,'Guatapé',5);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (402,'Guataquí',25);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (403,'Guatavita',25);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (404,'Guateque',15);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (405,'Guavatá',68);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (406,'Guayabal de Siquima',25);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (407,'Guayabetal',25);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (408,'Guayatá',15);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (409,'Guepsa',68);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (410,'Guicán',15);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (411,'Gutiérrez',25);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (412,'Guática',66);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (413,'Gámbita',68);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (414,'Gámeza',15);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (415,'Génova',63);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (416,'Gómez Plata',5);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (417,'Hacarí',54);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (418,'Hatillo de Loba',13);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (419,'Hato',68);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (420,'Hato Corozal',85);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (421,'Hatonuevo',44);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (422,'Heliconia',5);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (423,'Herrán',54);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (424,'Herveo',73);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (425,'Hispania',5);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (426,'Hobo',41);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (427,'Honda',73);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (428,'Ibagué',73);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (429,'Icononzo',73);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (430,'Iles',52);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (431,'Imúes',52);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (432,'Inzá',19);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (433,'Inírida',94);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (434,'Ipiales',52);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (435,'Isnos',41);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (436,'Istmina',27);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (437,'Itagüí',5);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (438,'Ituango',5);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (439,'Izá',15);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (440,'Jambaló',19);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (441,'Jamundí',76);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (442,'Jardín',5);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (443,'Jenesano',15);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (444,'Jericó',5);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (445,'Jericó',15);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (446,'Jerusalén',25);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (447,'Jesús María',68);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (448,'Jordán',68);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (449,'Juan de Acosta',8);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (450,'Junín',25);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (451,'Juradó',27);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (452,'La Apartada y La Frontera',23);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (453,'La Argentina',41);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (454,'La Belleza',68);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (455,'La Calera',25);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (456,'La Capilla',15);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (457,'La Ceja',5);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (458,'La Celia',66);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (459,'La Cruz',52);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (460,'La Cumbre',76);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (461,'La Dorada',17);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (462,'La Esperanza',54);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (463,'La Estrella',5);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (464,'La Florida',52);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (465,'La Gloria',20);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (466,'La Jagua de Ibirico',20);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (467,'La Jagua del Pilar',44);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (468,'La Llanada',52);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (469,'La Macarena',50);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (470,'La Merced',17);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (471,'La Mesa',25);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (472,'La Montañita',18);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (473,'La Palma',25);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (474,'La Paz',68);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (475,'La Paz (Robles)',20);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (476,'La Peña',25);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (477,'La Pintada',5);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (478,'La Plata',41);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (479,'La Playa',54);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (480,'La Primavera',99);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (481,'La Salina',85);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (482,'La Sierra',19);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (483,'La Tebaida',63);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (484,'La Tola',52);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (485,'La Unión',5);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (486,'La Unión',52);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (487,'La Unión',70);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (488,'La Unión',76);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (489,'La Uvita',15);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (490,'La Vega',19);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (491,'La Vega',25);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (492,'La Victoria',15);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (493,'La Victoria',17);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (494,'La Victoria',76);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (495,'La Virginia',66);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (496,'Labateca',54);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (497,'Labranzagrande',15);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (498,'Landázuri',68);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (499,'Lebrija',68);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (500,'Leiva',52);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (501,'Lejanías',50);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (502,'Lenguazaque',25);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (503,'Leticia',91);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (504,'Liborina',5);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (505,'Linares',52);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (506,'Lloró',27);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (507,'Lorica',23);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (508,'Los Córdobas',23);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (509,'Los Palmitos',70);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (510,'Los Patios',54);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (511,'Los Santos',68);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (512,'Lourdes',54);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (513,'Luruaco',8);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (514,'Lérida',73);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (515,'Líbano',73);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (516,'López (Micay)',19);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (517,'Macanal',15);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (518,'Macaravita',68);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (519,'Maceo',5);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (520,'Machetá',25);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (521,'Madrid',25);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (522,'Magangué',13);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (523,'Magüi (Payán)',52);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (524,'Mahates',13);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (525,'Maicao',44);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (526,'Majagual',70);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (527,'Malambo',8);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (528,'Mallama (Piedrancha)',52);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (529,'Manatí',8);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (530,'Manaure',44);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (531,'Manaure Balcón del Cesar',20);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (532,'Manizales',17);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (533,'Manta',25);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (534,'Manzanares',17);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (535,'Maní',85);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (536,'Mapiripan',50);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (537,'Margarita',13);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (538,'Marinilla',5);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (539,'Maripí',15);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (540,'Mariquita',73);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (541,'Marmato',17);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (542,'Marquetalia',17);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (543,'Marsella',66);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (544,'Marulanda',17);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (545,'María la Baja',13);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (546,'Matanza',68);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (547,'Medellín',5);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (548,'Medina',25);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (549,'Medio Atrato',27);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (550,'Medio Baudó',27);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (551,'Medio San Juan (ANDAGOYA)',27);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (552,'Melgar',73);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (553,'Mercaderes',19);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (554,'Mesetas',50);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (555,'Milán',18);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (556,'Miraflores',15);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (557,'Miraflores',95);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (558,'Miranda',19);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (559,'Mistrató',66);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (560,'Mitú',97);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (561,'Mocoa',86);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (562,'Mogotes',68);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (563,'Molagavita',68);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (564,'Momil',23);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (565,'Mompós',13);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (566,'Mongua',15);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (567,'Monguí',15);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (568,'Moniquirá',15);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (569,'Montebello',5);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (570,'Montecristo',13);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (571,'Montelíbano',23);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (572,'Montenegro',63);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (573,'Monteria',23);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (574,'Monterrey',85);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (575,'Morales',13);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (576,'Morales',19);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (577,'Morelia',18);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (578,'Morroa',70);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (579,'Mosquera',25);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (580,'Mosquera',52);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (581,'Motavita',15);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (582,'Moñitos',23);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (583,'Murillo',73);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (584,'Murindó',5);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (585,'Mutatá',5);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (586,'Mutiscua',54);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (587,'Muzo',15);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (588,'Málaga',68);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (589,'Nariño',5);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (590,'Nariño',25);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (591,'Nariño',52);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (592,'Natagaima',73);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (593,'Nechí',5);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (594,'Necoclí',5);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (595,'Neira',17);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (596,'Neiva',41);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (597,'Nemocón',25);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (598,'Nilo',25);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (599,'Nimaima',25);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (600,'Nobsa',15);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (601,'Nocaima',25);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (602,'Norcasia',17);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (603,'Norosí',13);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (604,'Novita',27);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (605,'Nueva Granada',47);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (606,'Nuevo Colón',15);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (607,'Nunchía',85);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (608,'Nuquí',27);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (609,'Nátaga',41);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (610,'Obando',76);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (611,'Ocamonte',68);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (612,'Ocaña',54);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (613,'Oiba',68);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (614,'Oicatá',15);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (615,'Olaya',5);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (616,'Olaya Herrera',52);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (617,'Onzaga',68);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (618,'Oporapa',41);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (619,'Orito',86);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (620,'Orocué',85);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (621,'Ortega',73);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (622,'Ospina',52);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (623,'Otanche',15);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (624,'Ovejas',70);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (625,'Pachavita',15);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (626,'Pacho',25);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (627,'Padilla',19);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (628,'Paicol',41);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (629,'Pailitas',20);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (630,'Paime',25);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (631,'Paipa',15);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (632,'Pajarito',15);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (633,'Palermo',41);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (634,'Palestina',17);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (635,'Palestina',41);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (636,'Palmar',68);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (637,'Palmar de Varela',8);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (638,'Palmas del Socorro',68);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (639,'Palmira',76);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (640,'Palmito',70);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (641,'Palocabildo',73);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (642,'Pamplona',54);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (643,'Pamplonita',54);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (644,'Pandi',25);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (645,'Panqueba',15);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (646,'Paratebueno',25);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (647,'Pasca',25);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (648,'Patía (El Bordo)',19);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (649,'Pauna',15);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (650,'Paya',15);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (651,'Paz de Ariporo',85);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (652,'Paz de Río',15);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (653,'Pedraza',47);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (654,'Pelaya',20);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (655,'Pensilvania',17);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (656,'Peque',5);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (657,'Pereira',66);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (658,'Pesca',15);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (659,'Peñol',5);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (660,'Piamonte',19);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (661,'Pie de Cuesta',68);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (662,'Piedras',73);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (663,'Piendamó',19);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (664,'Pijao',63);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (665,'Pijiño',47);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (666,'Pinchote',68);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (667,'Pinillos',13);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (668,'Piojo',8);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (669,'Pisva',15);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (670,'Pital',41);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (671,'Pitalito',41);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (672,'Pivijay',47);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (673,'Planadas',73);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (674,'Planeta Rica',23);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (675,'Plato',47);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (676,'Policarpa',52);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (677,'Polonuevo',8);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (678,'Ponedera',8);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (679,'Popayán',19);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (680,'Pore',85);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (681,'Potosí',52);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (682,'Pradera',76);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (683,'Prado',73);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (684,'Providencia',52);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (685,'Providencia',88);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (686,'Pueblo Bello',20);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (687,'Pueblo Nuevo',23);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (688,'Pueblo Rico',66);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (689,'Pueblorrico',5);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (690,'Puebloviejo',47);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (691,'Puente Nacional',68);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (692,'Puerres',52);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (693,'Puerto Asís',86);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (694,'Puerto Berrío',5);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (695,'Puerto Boyacá',15);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (696,'Puerto Caicedo',86);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (697,'Puerto Carreño',99);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (698,'Puerto Colombia',8);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (699,'Puerto Concordia',50);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (700,'Puerto Escondido',23);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (701,'Puerto Gaitán',50);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (702,'Puerto Guzmán',86);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (703,'Puerto Leguízamo',86);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (704,'Puerto Libertador',23);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (705,'Puerto Lleras',50);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (706,'Puerto López',50);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (707,'Puerto Nare',5);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (708,'Puerto Nariño',91);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (709,'Puerto Parra',68);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (710,'Puerto Rico',18);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (711,'Puerto Rico',50);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (712,'Puerto Rondón',81);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (713,'Puerto Salgar',25);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (714,'Puerto Santander',54);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (715,'Puerto Tejada',19);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (716,'Puerto Triunfo',5);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (717,'Puerto Wilches',68);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (718,'Pulí',25);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (719,'Pupiales',52);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (720,'Puracé (Coconuco)',19);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (721,'Purificación',73);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (722,'Purísima',23);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (723,'Pácora',17);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (724,'Páez',15);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (725,'Páez (Belalcazar)',19);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (726,'Páramo',68);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (727,'Quebradanegra',25);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (728,'Quetame',25);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (729,'Quibdó',27);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (730,'Quimbaya',63);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (731,'Quinchía',66);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (732,'Quipama',15);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (733,'Quipile',25);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (734,'Ragonvalia',54);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (735,'Ramiriquí',15);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (736,'Recetor',85);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (737,'Regidor',13);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (738,'Remedios',5);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (739,'Remolino',47);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (740,'Repelón',8);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (741,'Restrepo',50);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (742,'Restrepo',76);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (743,'Retiro',5);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (744,'Ricaurte',25);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (745,'Ricaurte',52);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (746,'Rio Negro',68);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (747,'Rioblanco',73);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (748,'Riofrío',76);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (749,'Riohacha',44);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (750,'Risaralda',17);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (751,'Rivera',41);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (752,'Roberto Payán (San José)',52);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (753,'Roldanillo',76);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (754,'Roncesvalles',73);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (755,'Rondón',15);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (756,'Rosas',19);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (757,'Rovira',73);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (758,'Ráquira',15);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (759,'Río Iró',27);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (760,'Río Quito',27);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (761,'Río Sucio',17);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (762,'Río Viejo',13);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (763,'Río de oro',20);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (764,'Ríonegro',5);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (765,'Ríosucio',27);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (766,'Sabana de Torres',68);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (767,'Sabanagrande',8);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (768,'Sabanalarga',5);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (769,'Sabanalarga',8);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (770,'Sabanalarga',85);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (771,'Sabanas de San Angel (SAN ANGEL)',47);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (772,'Sabaneta',5);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (773,'Saboyá',15);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (774,'Sahagún',23);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (775,'Saladoblanco',41);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (776,'Salamina',17);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (777,'Salamina',47);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (778,'Salazar',54);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (779,'Saldaña',73);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (780,'Salento',63);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (781,'Salgar',5);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (782,'Samacá',15);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (783,'Samaniego',52);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (784,'Samaná',17);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (785,'Sampués',70);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (786,'San Agustín',41);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (787,'San Alberto',20);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (788,'San Andrés',68);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (789,'San Andrés Sotavento',23);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (790,'San Andrés de Cuerquía',5);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (791,'San Antero',23);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (792,'San Antonio',73);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (793,'San Antonio de Tequendama',25);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (794,'San Benito',68);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (795,'San Benito Abad',70);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (796,'San Bernardo',25);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (797,'San Bernardo',52);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (798,'San Bernardo del Viento',23);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (799,'San Calixto',54);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (800,'San Carlos',5);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (801,'San Carlos',23);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (802,'San Carlos de Guaroa',50);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (803,'San Cayetano',25);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (804,'San Cayetano',54);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (805,'San Cristobal',13);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (806,'San Diego',20);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (807,'San Eduardo',15);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (808,'San Estanislao',13);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (809,'San Fernando',13);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (810,'San Francisco',5);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (811,'San Francisco',25);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (812,'San Francisco',86);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (813,'San Gíl',68);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (814,'San Jacinto',13);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (815,'San Jacinto del Cauca',13);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (816,'San Jerónimo',5);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (817,'San Joaquín',68);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (818,'San José',17);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (819,'San José de Miranda',68);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (820,'San José de Montaña',5);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (821,'San José de Pare',15);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (822,'San José de Uré',23);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (823,'San José del Fragua',18);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (824,'San José del Guaviare',95);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (825,'San José del Palmar',27);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (826,'San Juan de Arama',50);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (827,'San Juan de Betulia',70);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (828,'San Juan de Nepomuceno',13);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (829,'San Juan de Pasto',52);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (830,'San Juan de Río Seco',25);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (831,'San Juan de Urabá',5);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (832,'San Juan del Cesar',44);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (833,'San Juanito',50);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (834,'San Lorenzo',52);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (835,'San Luis',73);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (836,'San Luís',5);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (837,'San Luís de Gaceno',15);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (838,'San Luís de Palenque',85);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (839,'San Marcos',70);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (840,'San Martín',20);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (841,'San Martín',50);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (842,'San Martín de Loba',13);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (843,'San Mateo',15);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (844,'San Miguel',68);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (845,'San Miguel',86);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (846,'San Miguel de Sema',15);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (847,'San Onofre',70);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (848,'San Pablo',13);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (849,'San Pablo',52);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (850,'San Pablo de Borbur',15);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (851,'San Pedro',5);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (852,'San Pedro',70);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (853,'San Pedro',76);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (854,'San Pedro de Cartago',52);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (855,'San Pedro de Urabá',5);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (856,'San Pelayo',23);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (857,'San Rafael',5);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (858,'San Roque',5);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (859,'San Sebastián',19);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (860,'San Sebastián de Buenavista',47);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (861,'San Vicente',5);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (862,'San Vicente del Caguán',18);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (863,'San Vicente del Chucurí',68);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (864,'San Zenón',47);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (865,'Sandoná',52);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (866,'Santa Ana',47);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (867,'Santa Bárbara',5);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (868,'Santa Bárbara',68);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (869,'Santa Bárbara (Iscuandé)',52);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (870,'Santa Bárbara de Pinto',47);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (871,'Santa Catalina',13);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (872,'Santa Fé de Antioquia',5);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (873,'Santa Genoveva de Docorodó',27);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (874,'Santa Helena del Opón',68);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (875,'Santa Isabel',73);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (876,'Santa Lucía',8);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (877,'Santa Marta',47);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (878,'Santa María',15);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (879,'Santa María',41);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (880,'Santa Rosa',13);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (881,'Santa Rosa',19);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (882,'Santa Rosa de Cabal',66);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (883,'Santa Rosa de Osos',5);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (884,'Santa Rosa de Viterbo',15);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (885,'Santa Rosa del Sur',13);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (886,'Santa Rosalía',99);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (887,'Santa Sofía',15);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (888,'Santana',15);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (889,'Santander de Quilichao',19);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (890,'Santiago',54);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (891,'Santiago',86);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (892,'Santo Domingo',5);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (893,'Santo Tomás',8);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (894,'Santuario',5);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (895,'Santuario',66);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (896,'Sapuyes',52);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (897,'Saravena',81);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (898,'Sardinata',54);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (899,'Sasaima',25);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (900,'Sativanorte',15);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (901,'Sativasur',15);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (902,'Segovia',5);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (903,'Sesquilé',25);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (904,'Sevilla',76);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (905,'Siachoque',15);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (906,'Sibaté',25);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (907,'Sibundoy',86);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (908,'Silos',54);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (909,'Silvania',25);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (910,'Silvia',19);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (911,'Simacota',68);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (912,'Simijaca',25);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (913,'Simití',13);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (914,'Sincelejo',70);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (915,'Sincé',70);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (916,'Sipí',27);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (917,'Sitionuevo',47);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (918,'Soacha',25);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (919,'Soatá',15);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (920,'Socha',15);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (921,'Socorro',68);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (922,'Socotá',15);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (923,'Sogamoso',15);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (924,'Solano',18);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (925,'Soledad',8);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (926,'Solita',18);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (927,'Somondoco',15);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (928,'Sonsón',5);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (929,'Sopetrán',5);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (930,'Soplaviento',13);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (931,'Sopó',25);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (932,'Sora',15);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (933,'Soracá',15);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (934,'Sotaquirá',15);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (935,'Sotara (Paispamba)',19);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (936,'Sotomayor (Los Andes)',52);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (937,'Suaita',68);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (938,'Suan',8);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (939,'Suaza',41);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (940,'Subachoque',25);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (941,'Sucre',19);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (942,'Sucre',68);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (943,'Sucre',70);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (944,'Suesca',25);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (945,'Supatá',25);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (946,'Supía',17);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (947,'Suratá',68);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (948,'Susa',25);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (949,'Susacón',15);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (950,'Sutamarchán',15);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (951,'Sutatausa',25);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (952,'Sutatenza',15);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (953,'Suárez',19);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (954,'Suárez',73);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (955,'Sácama',85);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (956,'Sáchica',15);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (957,'Tabio',25);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (958,'Tadó',27);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (959,'Talaigua Nuevo',13);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (960,'Tamalameque',20);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (961,'Tame',81);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (962,'Taminango',52);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (963,'Tangua',52);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (964,'Taraira',97);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (965,'Tarazá',5);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (966,'Tarqui',41);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (967,'Tarso',5);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (968,'Tasco',15);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (969,'Tauramena',85);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (970,'Tausa',25);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (971,'Tello',41);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (972,'Tena',25);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (973,'Tenerife',47);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (974,'Tenjo',25);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (975,'Tenza',15);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (976,'Teorama',54);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (977,'Teruel',41);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (978,'Tesalia',41);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (979,'Tibacuy',25);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (980,'Tibaná',15);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (981,'Tibasosa',15);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (982,'Tibirita',25);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (983,'Tibú',54);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (984,'Tierralta',23);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (985,'Timaná',41);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (986,'Timbiquí',19);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (987,'Timbío',19);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (988,'Tinjacá',15);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (989,'Tipacoque',15);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (990,'Tiquisio (Puerto Rico)',13);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (991,'Titiribí',5);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (992,'Toca',15);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (993,'Tocaima',25);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (994,'Tocancipá',25);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (995,'Toguí',15);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (996,'Toledo',5);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (997,'Toledo',54);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (998,'Tolú',70);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (999,'Tolú Viejo',70);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (1000,'Tona',68);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (1001,'Topagá',15);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (1002,'Topaipí',25);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (1003,'Toribío',19);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (1004,'Toro',76);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (1005,'Tota',15);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (1006,'Totoró',19);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (1007,'Trinidad',85);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (1008,'Trujillo',76);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (1009,'Tubará',8);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (1010,'Tuchín',23);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (1011,'Tulúa',76);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (1012,'Tumaco',52);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (1013,'Tunja',15);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (1014,'Tunungua',15);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (1015,'Turbaco',13);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (1016,'Turbaná',13);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (1017,'Turbo',5);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (1018,'Turmequé',15);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (1019,'Tuta',15);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (1020,'Tutasá',15);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (1021,'Támara',85);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (1022,'Támesis',5);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (1023,'Túquerres',52);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (1024,'Ubalá',25);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (1025,'Ubaque',25);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (1026,'Ubaté',25);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (1027,'Ulloa',76);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (1028,'Une',25);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (1029,'Unguía',27);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (1030,'Unión Panamericana (ÁNIMAS)',27);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (1031,'Uramita',5);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (1032,'Uribe',50);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (1033,'Uribia',44);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (1034,'Urrao',5);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (1035,'Urumita',44);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (1036,'Usiacuri',8);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (1037,'Valdivia',5);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (1038,'Valencia',23);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (1039,'Valle de San José',68);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (1040,'Valle de San Juan',73);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (1041,'Valle del Guamuez',86);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (1042,'Valledupar',20);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (1043,'Valparaiso',5);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (1044,'Valparaiso',18);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (1045,'Vegachí',5);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (1046,'Venadillo',73);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (1047,'Venecia',5);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (1048,'Venecia (Ospina Pérez)',25);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (1049,'Ventaquemada',15);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (1050,'Vergara',25);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (1051,'Versalles',76);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (1052,'Vetas',68);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (1053,'Viani',25);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (1054,'Vigía del Fuerte',5);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (1055,'Vijes',76);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (1056,'Villa Caro',54);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (1057,'Villa Rica',19);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (1058,'Villa de Leiva',15);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (1059,'Villa del Rosario',54);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (1060,'Villagarzón',86);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (1061,'Villagómez',25);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (1062,'Villahermosa',73);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (1063,'Villamaría',17);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (1064,'Villanueva',13);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (1065,'Villanueva',44);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (1066,'Villanueva',68);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (1067,'Villanueva',85);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (1068,'Villapinzón',25);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (1069,'Villarrica',73);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (1070,'Villavicencio',50);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (1071,'Villavieja',41);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (1072,'Villeta',25);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (1073,'Viotá',25);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (1074,'Viracachá',15);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (1075,'Vista Hermosa',50);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (1076,'Viterbo',17);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (1077,'Vélez',68);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (1078,'Yacopí',25);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (1079,'Yacuanquer',52);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (1080,'Yaguará',41);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (1081,'Yalí',5);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (1082,'Yarumal',5);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (1083,'Yolombó',5);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (1084,'Yondó (Casabe)',5);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (1085,'Yopal',85);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (1086,'Yotoco',76);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (1087,'Yumbo',76);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (1088,'Zambrano',13);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (1089,'Zapatoca',68);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (1090,'Zapayán (PUNTA DE PIEDRAS)',47);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (1091,'Zaragoza',5);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (1092,'Zarzal',76);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (1093,'Zetaquirá',15);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (1094,'Zipacón',25);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (1095,'Zipaquirá',25);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (1096,'Zona Bananera (PRADO - SEVILLA)',47);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (1097,'Ábrego',54);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (1098,'Íquira',41);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (1099,'Úmbita',15);
insert  into `municipios`(`id_municipio`,`municipio`,`departamento_id`) values (1100,'Útica',25);

/*Table structure for table `nominas` */

CREATE TABLE `nominas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_ini` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `quincena` varchar(45) NOT NULL COMMENT 'Primera Quincena , Segunda',
  `fecha_ela` datetime NOT NULL COMMENT 'Fecha de Elaboracion de la nomina',
  `sueldo_minimo` decimal(19,5) NOT NULL,
  `bloquear` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

/*Data for the table `nominas` */

/*Table structure for table `ofertas_laborales` */

CREATE TABLE `ofertas_laborales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo_oferta` varchar(200) DEFAULT NULL,
  `beneficios_oferta` text DEFAULT NULL,
  `condiciones_oferta` text DEFAULT NULL,
  `depto_id` int(10) DEFAULT NULL,
  `tipo_contrato` int(10) DEFAULT NULL,
  `salario` bigint(20) DEFAULT NULL,
  `documento` text DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `usu_reg` int(10) DEFAULT NULL,
  `fechareg` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `depto_id` (`depto_id`),
  KEY `tipo_contrato` (`tipo_contrato`),
  KEY `usu_reg` (`usu_reg`),
  CONSTRAINT `ofertas_laborales_ibfk_1` FOREIGN KEY (`depto_id`) REFERENCES `dep_contratacion` (`id`),
  CONSTRAINT `ofertas_laborales_ibfk_2` FOREIGN KEY (`tipo_contrato`) REFERENCES `tipos_contratos` (`id`),
  CONSTRAINT `ofertas_laborales_ibfk_3` FOREIGN KEY (`usu_reg`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `ofertas_laborales` */

insert  into `ofertas_laborales`(`id`,`titulo_oferta`,`beneficios_oferta`,`condiciones_oferta`,`depto_id`,`tipo_contrato`,`salario`,`documento`,`estado`,`usu_reg`,`fechareg`) values (3,'Se solicita mesero con 20 años de experiencia','Tendrá un uniforme de trabajo limpio cada semana','Se requiere urgente un mesero con buena presentación personal, con especialización en cocina buffe y con el curso de manipulación de alimentos al día emitido desde ayer. \r\nDebe trabajar las 24 horas al dia de 4am - 4am',2,1,1200000,'',1,1,'2024-10-29 21:28:37');
insert  into `ofertas_laborales`(`id`,`titulo_oferta`,`beneficios_oferta`,`condiciones_oferta`,`depto_id`,`tipo_contrato`,`salario`,`documento`,`estado`,`usu_reg`,`fechareg`) values (4,'Se solicita doctor con 20 años de experiencia','Un año de netflix gratis','Se requiere urgente',3,2,600000,'672199d5a287d.pdf',0,1,'2024-10-29 21:28:37');
insert  into `ofertas_laborales`(`id`,`titulo_oferta`,`beneficios_oferta`,`condiciones_oferta`,`depto_id`,`tipo_contrato`,`salario`,`documento`,`estado`,`usu_reg`,`fechareg`) values (37,'adsfasdsa','asdsadas','asdsadsa',8,1,695126351,'6722360527dbe.JPG',1,3,'2024-10-30 13:35:01');
insert  into `ofertas_laborales`(`id`,`titulo_oferta`,`beneficios_oferta`,`condiciones_oferta`,`depto_id`,`tipo_contrato`,`salario`,`documento`,`estado`,`usu_reg`,`fechareg`) values (38,'adsfasdsa','asdsadas','asdsadsa',8,1,695126351,NULL,0,3,'2024-10-30 13:42:45');

/*Table structure for table `preguntas_entrevistas` */

CREATE TABLE `preguntas_entrevistas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pregunta` text NOT NULL,
  `tpregunta` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tpregunta` (`tpregunta`),
  CONSTRAINT `preguntas_entrevistas_ibfk_1` FOREIGN KEY (`tpregunta`) REFERENCES `tipos_preguntas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `preguntas_entrevistas` */

insert  into `preguntas_entrevistas`(`id`,`pregunta`,`tpregunta`) values (5,'Cuál es tu color favorio?',2);

/*Table structure for table `preguntas_pruebas_tecnicas` */

CREATE TABLE `preguntas_pruebas_tecnicas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pregunta` text NOT NULL,
  `cargo_id` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tpregunta` (`cargo_id`),
  CONSTRAINT `preguntas_pruebas_tecnicas_ibfk_1` FOREIGN KEY (`cargo_id`) REFERENCES `cargos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `preguntas_pruebas_tecnicas` */

insert  into `preguntas_pruebas_tecnicas`(`id`,`pregunta`,`cargo_id`) values (1,'1. ¿Qué lenguajes de programación dominas?',15);
insert  into `preguntas_pruebas_tecnicas`(`id`,`pregunta`,`cargo_id`) values (4,'2. ¿Cómo manejas un proyecto web de principio a fin?',15);
insert  into `preguntas_pruebas_tecnicas`(`id`,`pregunta`,`cargo_id`) values (5,'3. Describe una solución innovadora que implementaste.',15);

/*Table structure for table `prestamos` */

CREATE TABLE `prestamos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cantidad` decimal(19,5) NOT NULL,
  `fecha` date NOT NULL,
  `empleado_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_prestamos_empleados1` (`empleado_id`),
  CONSTRAINT `fk_prestamos_empleados1` FOREIGN KEY (`empleado_id`) REFERENCES `empleados` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

/*Data for the table `prestamos` */

/*Table structure for table `programacion_entrevistas` */

CREATE TABLE `programacion_entrevistas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `empleado_id` int(11) NOT NULL,
  `cargo_id` int(10) NOT NULL,
  `fechapro` date NOT NULL,
  `horapro` time NOT NULL,
  `fechareg` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `empleado_id` (`empleado_id`),
  KEY `cargo_id` (`cargo_id`),
  CONSTRAINT `programacion_entrevistas_ibfk_1` FOREIGN KEY (`empleado_id`) REFERENCES `empleados` (`id`),
  CONSTRAINT `programacion_entrevistas_ibfk_2` FOREIGN KEY (`cargo_id`) REFERENCES `cargos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `programacion_entrevistas` */

insert  into `programacion_entrevistas`(`id`,`empleado_id`,`cargo_id`,`fechapro`,`horapro`,`fechareg`) values (4,1,3,'2024-10-28','18:45:00','2024-10-28 13:46:42');
insert  into `programacion_entrevistas`(`id`,`empleado_id`,`cargo_id`,`fechapro`,`horapro`,`fechareg`) values (5,1,12,'2024-10-30','16:40:00','2024-10-28 16:40:47');
insert  into `programacion_entrevistas`(`id`,`empleado_id`,`cargo_id`,`fechapro`,`horapro`,`fechareg`) values (6,1,8,'2024-10-30','09:52:00','2024-10-30 14:52:43');

/*Table structure for table `programas` */

CREATE TABLE `programas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `tipo` varchar(45) NOT NULL COMMENT 'Actividad  /  Proyecto',
  `numero` int(11) NOT NULL COMMENT 'Numero de la Actividad o Proyecto',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

/*Data for the table `programas` */

/*Table structure for table `pruebas_tecnicas` */

CREATE TABLE `pruebas_tecnicas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `empleado_id` int(11) NOT NULL,
  `pregunta_id` int(11) NOT NULL,
  `respuesta` text NOT NULL,
  `fechareg` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `pregunta_id` (`pregunta_id`),
  KEY `empleado_id` (`empleado_id`),
  CONSTRAINT `pruebas_tecnicas_ibfk_1` FOREIGN KEY (`empleado_id`) REFERENCES `empleados` (`id`),
  CONSTRAINT `pruebas_tecnicas_ibfk_2` FOREIGN KEY (`pregunta_id`) REFERENCES `preguntas_pruebas_tecnicas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `pruebas_tecnicas` */

insert  into `pruebas_tecnicas`(`id`,`empleado_id`,`pregunta_id`,`respuesta`,`fechareg`) values (1,1,1,'Tigre','2024-10-29 08:26:44');

/*Table structure for table `recibos` */

CREATE TABLE `recibos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cargo` varchar(45) DEFAULT NULL,
  `departamento` varchar(45) DEFAULT NULL,
  `modalidad` varchar(45) DEFAULT NULL,
  `sueldo_base` decimal(19,5) DEFAULT NULL,
  `dias_laborados` int(11) DEFAULT NULL,
  `nomina_id` int(11) NOT NULL,
  `empleado_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_recibos_nominas1` (`nomina_id`),
  KEY `fk_recibos_empleados1` (`empleado_id`),
  CONSTRAINT `fk_recibos_empleados1` FOREIGN KEY (`empleado_id`) REFERENCES `empleados` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_recibos_nominas1` FOREIGN KEY (`nomina_id`) REFERENCES `nominas` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2991 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

/*Data for the table `recibos` */

/*Table structure for table `tipo_docs` */

CREATE TABLE `tipo_docs` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `tipo_docs` */

insert  into `tipo_docs`(`id`,`nombre`) values (1,'Fotocopia RUT con responsabilidad de IVA definida');
insert  into `tipo_docs`(`id`,`nombre`) values (2,'Fotocopia cédula de ciudadanía');
insert  into `tipo_docs`(`id`,`nombre`) values (3,'Hoja de vida Firmada Ingrese información');
insert  into `tipo_docs`(`id`,`nombre`) values (4,'Certificado bancario o formato Autorización de transferencia electrónica');
insert  into `tipo_docs`(`id`,`nombre`) values (5,'Nivel Técnico. Copia de Resolución');
insert  into `tipo_docs`(`id`,`nombre`) values (6,'Copia del Acta de Grado');
insert  into `tipo_docs`(`id`,`nombre`) values (7,'Copia del Diploma');
insert  into `tipo_docs`(`id`,`nombre`) values (8,'Copia del Carnet de Vacunación Covid');
insert  into `tipo_docs`(`id`,`nombre`) values (9,'Copia del Carnet de Vacunación esquema Hepatitis B');
insert  into `tipo_docs`(`id`,`nombre`) values (10,'Copia del Carnet de Vacunación esquema Tétano');
insert  into `tipo_docs`(`id`,`nombre`) values (11,'Copia del Carnet de Vacunación esquema Influenza');
insert  into `tipo_docs`(`id`,`nombre`) values (12,'Tarjeta Profesional que lo acredite');
insert  into `tipo_docs`(`id`,`nombre`) values (13,'Certificado de afiliación de Seguridad Social (salud, pensiones y riesgos laborales)');
insert  into `tipo_docs`(`id`,`nombre`) values (14,'Certificados de aptitud médica ocupacional de acuerdo al oficio o actividad a desarrollar,cuya vigencia debe ser inferior a 3 años');
insert  into `tipo_docs`(`id`,`nombre`) values (15,'Convalidación de título en caso de haber realizado la especialización en el exterior');
insert  into `tipo_docs`(`id`,`nombre`) values (16,'Examen de Salud Ocupacional');

/*Table structure for table `tipo_identificacion` */

CREATE TABLE `tipo_identificacion` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `tipo_identificacion` */

insert  into `tipo_identificacion`(`id`,`nombre`) values (1,'Pasaporte');
insert  into `tipo_identificacion`(`id`,`nombre`) values (2,'Documento de identificación para extranjeros');
insert  into `tipo_identificacion`(`id`,`nombre`) values (3,'PEP');
insert  into `tipo_identificacion`(`id`,`nombre`) values (4,'Registro Profesional');
insert  into `tipo_identificacion`(`id`,`nombre`) values (5,'Carnet Diplomático');
insert  into `tipo_identificacion`(`id`,`nombre`) values (6,'Salvocondcuto');
insert  into `tipo_identificacion`(`id`,`nombre`) values (7,'Certificado de nacido vivo');
insert  into `tipo_identificacion`(`id`,`nombre`) values (8,'Cédula de ciudadanía');
insert  into `tipo_identificacion`(`id`,`nombre`) values (9,'NIT de otro país');
insert  into `tipo_identificacion`(`id`,`nombre`) values (10,'Tarjeta de identidad');
insert  into `tipo_identificacion`(`id`,`nombre`) values (11,'Cédula de extranjeria');
insert  into `tipo_identificacion`(`id`,`nombre`) values (12,'Registro civil de nacimiento');
insert  into `tipo_identificacion`(`id`,`nombre`) values (13,'Número único de identificación');
insert  into `tipo_identificacion`(`id`,`nombre`) values (14,'Menor sin identificar');
insert  into `tipo_identificacion`(`id`,`nombre`) values (15,'Adulto sin identificar');
insert  into `tipo_identificacion`(`id`,`nombre`) values (16,'NIT');

/*Table structure for table `tipos_contratos` */

CREATE TABLE `tipos_contratos` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `tipos_contratos` */

insert  into `tipos_contratos`(`id`,`nombre`) values (1,'Contrato a termino fijo');
insert  into `tipos_contratos`(`id`,`nombre`) values (2,'Contrato de prestacion de servicios');
insert  into `tipos_contratos`(`id`,`nombre`) values (3,'Contrato a termino indefinido');

/*Table structure for table `tipos_preguntas` */

CREATE TABLE `tipos_preguntas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `tipos_preguntas` */

insert  into `tipos_preguntas`(`id`,`nombre`) values (1,'Psicologica');
insert  into `tipos_preguntas`(`id`,`nombre`) values (2,'Personales');

/*Table structure for table `titulos` */

CREATE TABLE `titulos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(45) NOT NULL COMMENT 'T.S.U , Profesional Universitario , Post-Grado , Maestria , Doctorado',
  `especialidad` varchar(45) NOT NULL,
  `institucion` varchar(60) NOT NULL,
  `fecha` date NOT NULL,
  `empleado_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_titulos_empleados1` (`empleado_id`),
  CONSTRAINT `fk_titulos_empleados1` FOREIGN KEY (`empleado_id`) REFERENCES `empleados` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

/*Data for the table `titulos` */

/*Table structure for table `tribunales` */

CREATE TABLE `tribunales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cantidad` decimal(19,5) NOT NULL,
  `fecha` date NOT NULL,
  `empleado_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tribunales_empleados1` (`empleado_id`),
  CONSTRAINT `fk_tribunales_empleados1` FOREIGN KEY (`empleado_id`) REFERENCES `empleados` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

/*Data for the table `tribunales` */

/*Table structure for table `usuarios` */

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombres` varchar(200) DEFAULT NULL,
  `apellidos` varchar(200) DEFAULT NULL,
  `usuario` varchar(100) DEFAULT NULL,
  `pass` text DEFAULT NULL,
  `cargo_id` int(11) DEFAULT NULL,
  `foto` text DEFAULT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `usuarios_ibfk_2` (`cargo_id`),
  CONSTRAINT `usuarios_ibfk_2` FOREIGN KEY (`cargo_id`) REFERENCES `cargos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `usuarios` */

insert  into `usuarios`(`id`,`nombres`,`apellidos`,`usuario`,`pass`,`cargo_id`,`foto`,`fecha`) values (1,'Jordan','Garcia Dev','jgarcia','$2y$10$u6A9QIDdEEd0phFs2S1hyOmONJhTJRzJDLLmCiAfDV.s2YTGEocCu',15,'','2024-10-22 11:28:18');
insert  into `usuarios`(`id`,`nombres`,`apellidos`,`usuario`,`pass`,`cargo_id`,`foto`,`fecha`) values (2,'Daniel','Marquez','dmarquez','$2y$10$6GjLTQ5kq/JtaXgtw5I6n.PhQ/Nuo0FX7Gf24Wvu8IPVJVK1Dj7Qa',15,'6719aa93f2dc6.jpeg','2024-10-23 14:29:34');
insert  into `usuarios`(`id`,`nombres`,`apellidos`,`usuario`,`pass`,`cargo_id`,`foto`,`fecha`) values (3,'Orlando','Marquez','omarquez','$2y$10$6GjLTQ5kq/JtaXgtw5I6n.PhQ/Nuo0FX7Gf24Wvu8IPVJVK1Dj7Qa',15,'671a51fa4e0e3.png','2024-10-23 14:29:34');
insert  into `usuarios`(`id`,`nombres`,`apellidos`,`usuario`,`pass`,`cargo_id`,`foto`,`fecha`) values (4,'Diego','Salas','dsalas','$2y$10$6GjLTQ5kq/JtaXgtw5I6n.PhQ/Nuo0FX7Gf24Wvu8IPVJVK1Dj7Qa',15,'671a51fa4e0e3.png','2024-10-23 14:29:34');
insert  into `usuarios`(`id`,`nombres`,`apellidos`,`usuario`,`pass`,`cargo_id`,`foto`,`fecha`) values (5,'Jaime','Borja','jborja','$2y$10$6GjLTQ5kq/JtaXgtw5I6n.PhQ/Nuo0FX7Gf24Wvu8IPVJVK1Dj7Qa',15,'672247812d339.jpg','2024-10-23 14:29:34');
insert  into `usuarios`(`id`,`nombres`,`apellidos`,`usuario`,`pass`,`cargo_id`,`foto`,`fecha`) values (6,'Jimmy','Borja Altamar','Jimmy','$2y$10$9v2U3odadVNkxPlo6N79BeeqOZ9Ia1IOzpdGjkiT8mFiHkREzIgDe',12,'6722463870deb.png','2024-10-30 14:44:08');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
