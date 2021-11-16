-- Adminer 4.7.2 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP DATABASE IF EXISTS `test`;
CREATE DATABASE `test` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `test`;

DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `price` float NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `products` (`product_id`, `name`, `price`, `created`) VALUES
(1,	'Produkt 1',	33.33,	'2021-04-04 10:44:31'),
(2,	'Produkt 2',	45,	'2021-04-04 10:44:35'),
(3,	'Produkt 3',	2,	'2021-04-04 10:44:41');



DROP TABLE IF EXISTS `stats`;
CREATE TABLE `stats` (
`stat_id` int(11) NOT NULL AUTO_INCREMENT,
`time` float NOT NULL,
PRIMARY KEY (`stat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
