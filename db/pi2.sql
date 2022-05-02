/*
SQLyog Community Edition- MySQL GUI v6.54
MySQL - 8.0.21 : Database - pi2
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`pi2` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `pi2`;

/*Table structure for table `cidades` */

DROP TABLE IF EXISTS `cidades`;

CREATE TABLE `cidades` (
  `cid_id` int NOT NULL AUTO_INCREMENT,
  `est_id` int NOT NULL,
  `cid_nome` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`cid_id`),
  KEY `fk_cidades_estados` (`est_id`),
  CONSTRAINT `fk_cidades_estados` FOREIGN KEY (`est_id`) REFERENCES `estados` (`est_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `cidades` */

insert  into `cidades`(`cid_id`,`est_id`,`cid_nome`) values (1,1,'Ituverava'),(2,1,'Guará'),(3,1,'São Joaquim da Barra'),(4,1,'Morro Agudo'),(5,1,'Franca');

/*Table structure for table `estados` */

DROP TABLE IF EXISTS `estados`;

CREATE TABLE `estados` (
  `est_id` int NOT NULL AUTO_INCREMENT,
  `est_sigla` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `est_nome` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`est_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `estados` */

insert  into `estados`(`est_id`,`est_sigla`,`est_nome`) values (1,'SP','São Paulo'),(2,'MG','Minas Gerais'),(3,'AM','Amapá');

/*Table structure for table `tabela` */

DROP TABLE IF EXISTS `tabela`;

CREATE TABLE `tabela` (
  `tab_id` int NOT NULL AUTO_INCREMENT,
  `tab_codigo` int NOT NULL,
  `est_id` int NOT NULL,
  `cid_id` int NOT NULL,
  `tab_data_criacao` datetime NOT NULL,
  `tab_data_modificacao` datetime NOT NULL,
  `tab_numero_casos` int NOT NULL,
  `tab_confirmados` int NOT NULL,
  `tab_analise` int NOT NULL,
  `tab_obitos` int NOT NULL,
  PRIMARY KEY (`tab_id`),
  KEY `fk_tabela_cidades` (`cid_id`),
  KEY `fk_tabela_estados` (`est_id`),
  CONSTRAINT `fk_tabela_cidades` FOREIGN KEY (`cid_id`) REFERENCES `cidades` (`cid_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_tabela_estados` FOREIGN KEY (`est_id`) REFERENCES `estados` (`est_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `tabela` */

insert  into `tabela`(`tab_id`,`tab_codigo`,`est_id`,`cid_id`,`tab_data_criacao`,`tab_data_modificacao`,`tab_numero_casos`,`tab_confirmados`,`tab_analise`,`tab_obitos`) values (1,1,1,1,'2022-05-02 10:01:06','0000-00-00 00:00:00',130,100,30,2),(2,2,1,2,'2022-05-02 10:05:52','0000-00-00 00:00:00',110,100,10,1),(3,3,1,3,'2022-05-02 15:17:49','0000-00-00 00:00:00',251,230,21,2),(4,4,1,4,'2022-05-02 15:18:19','0000-00-00 00:00:00',120,100,20,1),(5,5,1,5,'2022-05-02 15:18:47','0000-00-00 00:00:00',580,550,30,5);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
