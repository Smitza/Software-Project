-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 04, 2024 at 08:24 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

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
-- Table structure for table `delivery`
--

DROP TABLE IF EXISTS `delivery`;
CREATE TABLE `delivery` (
  `deliveryid` int(15) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phoneno` int(30) NOT NULL,
  `payid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `games`
--

DROP TABLE IF EXISTS `games`;
CREATE TABLE `games` (
  `gameid` int(11) NOT NULL,
  `publisher` varchar(255) NOT NULL,
  `platform` varchar(50) NOT NULL,
  `gamerating` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `movies`
--

DROP TABLE IF EXISTS `movies`;
CREATE TABLE `movies` (
  `movieid` int(11) NOT NULL,
  `director` varchar(255) NOT NULL,
  `format` varchar(25) NOT NULL,
  `runtime` varchar(25) NOT NULL,
  `movierating` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
CREATE TABLE `payment` (
  `payid` int(11) NOT NULL,
  `amount` int(10) NOT NULL,
  `paymentdate` varchar(30) NOT NULL,
  `paymentmethod` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `productid` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `genre` varchar(40) NOT NULL,
  `studio` varchar(80) NOT NULL,
  `releasedate` date NOT NULL,
  `price` double(8,2) NOT NULL,
  `quantity` int(20) DEFAULT NULL,
  `gameid` int(11) DEFAULT NULL,
  `tvid` int(11) DEFAULT NULL,
  `movieid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products_users`
--

DROP TABLE IF EXISTS `products_users`;
CREATE TABLE `products_users` (
  `productid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `payid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tvshows`
--

DROP TABLE IF EXISTS `tvshows`;
CREATE TABLE `tvshows` (
  `tvid` int(11) NOT NULL,
  `showrunner` varchar(80) NOT NULL,
  `format` varchar(25) NOT NULL,
  `noofseasons` int(10) NOT NULL,
  `noofepisodes` int(10) NOT NULL,
  `runtime` varchar(15) NOT NULL,
  `tvrating` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `userid` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(30) NOT NULL,
  `name` varchar(60) NOT NULL,
  `membership` int(8) NOT NULL,
  `isAdmin` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


--
-- Indexes for dumped tables
--

--
-- Indexes for table `delivery`
--
ALTER TABLE `delivery`
  ADD PRIMARY KEY (`deliveryid`),
  ADD UNIQUE KEY `payid` (`payid`);

--
-- Indexes for table `games`
--
ALTER TABLE `games`
  ADD PRIMARY KEY (`gameid`);

--
-- Indexes for table `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`movieid`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payid`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`productid`),
  ADD KEY `gameid FOREIGN` (`gameid`),
  ADD KEY `tvid FOREIGN` (`tvid`),
  ADD KEY `movieid FOREIGN` (`movieid`);

--
-- Indexes for table `products_users`
--
ALTER TABLE `products_users`
  ADD KEY `productid FOREIGN` (`productid`),
  ADD KEY `userid FOREIGN` (`userid`),
  ADD KEY `payid FOREIGN` (`payid`);

--
-- Indexes for table `tvshows`
--
ALTER TABLE `tvshows`
  ADD PRIMARY KEY (`tvid`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `delivery`
--
ALTER TABLE `delivery`
  MODIFY `deliveryid` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `games`
--
ALTER TABLE `games`
  MODIFY `gameid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `movies`
--
ALTER TABLE `movies`
  MODIFY `movieid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `payid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `productid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tvshows`
--
ALTER TABLE `tvshows`
  MODIFY `tvid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

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
  ADD CONSTRAINT `payid FOREIGN` FOREIGN KEY (`payid`) REFERENCES `payment` (`payid`),
  ADD CONSTRAINT `productid FOREIGN` FOREIGN KEY (`productid`) REFERENCES `products` (`productid`),
  ADD CONSTRAINT `userid FOREIGN` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
