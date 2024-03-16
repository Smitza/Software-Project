-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 16, 2024 at 07:51 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `xtra`
--
CREATE DATABASE IF NOT EXISTS `xtra` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `xtra`;

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
CREATE TABLE IF NOT EXISTS `cart` (
  `cartid` int(11) NOT NULL,
  `productid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `deliveryid` int(11) NOT NULL,
  `payid` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`cartid`),
  KEY `productid FOREIGN` (`productid`),
  KEY `userid FOREIGN` (`userid`),
  KEY `deliveryid FOREIGN` (`deliveryid`),
  KEY `payid FOREIGN` (`payid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delivery`
--

DROP TABLE IF EXISTS `delivery`;
CREATE TABLE IF NOT EXISTS `delivery` (
  `deliveryid` int(15) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `deliverydate` date NOT NULL,
  `status` varchar(50) NOT NULL,
  PRIMARY KEY (`deliveryid`),
  UNIQUE KEY `userid` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `games`
--

DROP TABLE IF EXISTS `games`;
CREATE TABLE IF NOT EXISTS `games` (
  `gameid` int(11) NOT NULL AUTO_INCREMENT,
  `publisher` varchar(255) NOT NULL,
  `platform` varchar(50) NOT NULL,
  `gamerating` varchar(10) NOT NULL,
  PRIMARY KEY (`gameid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `movies`
--

DROP TABLE IF EXISTS `movies`;
CREATE TABLE IF NOT EXISTS `movies` (
  `movieid` int(11) NOT NULL AUTO_INCREMENT,
  `director` varchar(255) NOT NULL,
  `format` varchar(25) NOT NULL,
  `runtime` varchar(25) NOT NULL,
  `movierating` varchar(25) NOT NULL,
  PRIMARY KEY (`movieid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
CREATE TABLE IF NOT EXISTS `payment` (
  `payid` int(11) NOT NULL AUTO_INCREMENT,
  `amount` int(10) NOT NULL,
  `paymentdate` varchar(30) NOT NULL,
  `paymentmethod` varchar(25) NOT NULL,
  PRIMARY KEY (`payid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `productid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `genre` varchar(40) NOT NULL,
  `studio` varchar(80) NOT NULL,
  `releasedate` date NOT NULL,
  `price` double(8,2) NOT NULL,
  `quantity` int(20) DEFAULT NULL,
  `gameid` int(11) DEFAULT NULL,
  `tvid` int(11) DEFAULT NULL,
  `movieid` int(11) DEFAULT NULL,
  PRIMARY KEY (`productid`),
  KEY `gameid FOREIGN` (`gameid`),
  KEY `tvid FOREIGN` (`tvid`),
  KEY `movieid FOREIGN` (`movieid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products_users`
--

DROP TABLE IF EXISTS `products_users`;
CREATE TABLE IF NOT EXISTS `products_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `productid` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `orderdate` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `userid` (`userid`),
  KEY `productid` (`productid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tvshows`
--

DROP TABLE IF EXISTS `tvshows`;
CREATE TABLE IF NOT EXISTS `tvshows` (
  `tvid` int(11) NOT NULL AUTO_INCREMENT,
  `showrunner` varchar(80) NOT NULL,
  `format` varchar(25) NOT NULL,
  `noofseasons` int(10) NOT NULL,
  `noofepisodes` int(10) NOT NULL,
  `runtime` varchar(15) NOT NULL,
  `tvrating` varchar(15) NOT NULL,
  PRIMARY KEY (`tvid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(30) NOT NULL,
  `name` varchar(60) NOT NULL,
  `membership` int(8) NOT NULL,
  `isAdmin` tinyint(1) NOT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `deliveryid FOREIGN` FOREIGN KEY (`deliveryid`) REFERENCES `delivery` (`deliveryid`),
  ADD CONSTRAINT `payid FOREIGN` FOREIGN KEY (`payid`) REFERENCES `payment` (`payid`),
  ADD CONSTRAINT `productid FOREIGN` FOREIGN KEY (`productid`) REFERENCES `products` (`productid`),
  ADD CONSTRAINT `userid FOREIGN` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`);

--
-- Constraints for table `delivery`
--
ALTER TABLE `delivery`
  ADD CONSTRAINT `userid FOREIGN delivery` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `gameid FOREIGN` FOREIGN KEY (`gameid`) REFERENCES `games` (`gameid`),
  ADD CONSTRAINT `movieid FOREIGN` FOREIGN KEY (`movieid`) REFERENCES `movies` (`movieid`),
  ADD CONSTRAINT `tvid FOREIGN` FOREIGN KEY (`tvid`) REFERENCES `tvshows` (`tvid`);

--
-- Constraints for table `products_users`
--
ALTER TABLE `products_users`
  ADD CONSTRAINT `productid` FOREIGN KEY (`productid`) REFERENCES `products` (`productid`),
  ADD CONSTRAINT `userid` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
