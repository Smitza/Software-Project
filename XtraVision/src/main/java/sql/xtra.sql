-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 01, 2024 at 11:55 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

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
  `address` varchar(35) NOT NULL,
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
  `name` varchar(15) NOT NULL,
  `description` varchar(255) NOT NULL,
  `genre` varchar(20) NOT NULL,
  `developer` varchar(15) NOT NULL,
  `publisher` varchar(15) NOT NULL,
  `platform` varchar(10) NOT NULL,
  `releasedate` date NOT NULL,
  `price` double(8,2) NOT NULL,
  `gamerating` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `movies`
--

DROP TABLE IF EXISTS `movies`;
CREATE TABLE `movies` (
  `movieid` int(11) NOT NULL,
  `name` varchar(25) NOT NULL,
  `description` varchar(255) NOT NULL,
  `genre` varchar(25) NOT NULL,
  `director` varchar(25) NOT NULL,
  `studio` varchar(25) NOT NULL,
  `format` varchar(25) NOT NULL,
  `releasedate` date NOT NULL,
  `price` double(8,2) NOT NULL,
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
-- Table structure for table `tvshows`
--

DROP TABLE IF EXISTS `tvshows`;
CREATE TABLE `tvshows` (
  `tvid` int(11) NOT NULL,
  `name` varchar(15) NOT NULL,
  `description` varchar(255) NOT NULL,
  `genre` varchar(15) NOT NULL,
  `showrunner` varchar(15) NOT NULL,
  `studio` varchar(15) NOT NULL,
  `format` varchar(10) NOT NULL,
  `releasedate` date NOT NULL,
  `price` double(8,2) NOT NULL,
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
  `username` varchar(25) NOT NULL,
  `email` varchar(25) NOT NULL,
  `password` varchar(30) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `firstname` varchar(10) NOT NULL,
  `lastname` varchar(10) NOT NULL,
  `membership` int(8) NOT NULL,
  `isAdmin` tinyint(1) NOT NULL,
  `gameid` int(11) NOT NULL,
  `movieid` int(11) NOT NULL,
  `tvid` int(11) NOT NULL,
  `payid` int(11) NOT NULL
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
-- Indexes for table `tvshows`
--
ALTER TABLE `tvshows`
  ADD PRIMARY KEY (`tvid`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userid`),
  ADD KEY `gameid Foreign` (`gameid`),
  ADD KEY `tvid Foreign` (`tvid`),
  ADD KEY `movieid Foreign` (`movieid`),
  ADD KEY `payid Foreign` (`payid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `delivery`
--
ALTER TABLE `delivery`
  MODIFY `deliveryid` int(15) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `games`
--
ALTER TABLE `games`
  MODIFY `gameid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `movies`
--
ALTER TABLE `movies`
  MODIFY `movieid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `payid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tvshows`
--
ALTER TABLE `tvshows`
  MODIFY `tvid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `gameid Foreign` FOREIGN KEY (`gameid`) REFERENCES `games` (`gameid`),
  ADD CONSTRAINT `movieid Foreign` FOREIGN KEY (`movieid`) REFERENCES `movies` (`movieid`),
  ADD CONSTRAINT `payid Foreign` FOREIGN KEY (`payid`) REFERENCES `payment` (`payid`),
  ADD CONSTRAINT `tvid Foreign` FOREIGN KEY (`tvid`) REFERENCES `tvshows` (`tvid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
