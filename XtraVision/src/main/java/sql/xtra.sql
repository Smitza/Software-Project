-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 17, 2024 at 09:16 PM
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
-- Table structure for table `billing_information`
--

DROP TABLE IF EXISTS `billing_information`;
CREATE TABLE `billing_information` (
                                       `userId` int(10) NOT NULL UNIQUE,
                                       `Addressline1` varchar(256) NOT NULL,
                                       `Addressline2` varchar(256) DEFAULT NULL,
                                       `CardNumber` int(16) NOT NULL,
                                       `CardHolder` varchar(256) NOT NULL,
                                       `ExpDate` varchar(4) NOT NULL,
                                       `SecNumber` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
                        `cartid` int(11) NOT NULL,
                        `productid` int(11) NOT NULL,
                        `userid` int(11) NOT NULL,
                        `deliveryid` int(11) DEFAULT NULL,
                        `payid` int(11) DEFAULT NULL,
                        `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`cartid`, `productid`, `userid`, `deliveryid`, `payid`, `quantity`) VALUES
                                                                                            (1, 1, 6, NULL, NULL, 1),
                                                                                            (2, 2, 6, NULL, NULL, 1),
                                                                                            (3, 3, 6, NULL, NULL, 1),
                                                                                            (4, 4, 6, NULL, NULL, 1),
                                                                                            (5, 5, 6, NULL, NULL, 1),
                                                                                            (6, 1, 3, NULL, NULL, 1),
                                                                                            (7, 2, 3, NULL, NULL, 1),
                                                                                            (8, 1, 8, NULL, NULL, 1),
                                                                                            (9, 2, 8, NULL, NULL, 1),
                                                                                            (10, 3, 8, NULL, NULL, 1),
                                                                                            (11, 4, 8, NULL, NULL, 1),
                                                                                            (12, 5, 8, NULL, NULL, 1),
                                                                                            (13, 1, 3, NULL, NULL, 1),
                                                                                            (21, 1, 9, NULL, NULL, 2);

-- --------------------------------------------------------

--
-- Table structure for table `delivery`
--

DROP TABLE IF EXISTS `delivery`;
CREATE TABLE `delivery` (
                            `deliveryid` int(15) NOT NULL,
                            `userid` int(11) NOT NULL,
                            `deliverydate` date DEFAULT NULL,
                            `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `delivery`
--

INSERT INTO `delivery` (`deliveryid`, `userid`, `deliverydate`, `status`) VALUES
                                                                              (1, 6, NULL, 'Processing'),
                                                                              (4, 6, NULL, 'Processing'),
                                                                              (5, 6, NULL, 'Processing'),
                                                                              (6, 6, NULL, 'Processing'),
                                                                              (7, 6, NULL, 'Processing'),
                                                                              (8, 3, NULL, 'Processing'),
                                                                              (9, 8, NULL, 'Processing');

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

--
-- Dumping data for table `games`
--

INSERT INTO `games` (`gameid`, `publisher`, `platform`, `gamerating`) VALUES
                                                                          (1, 'Electronic Arts', 'PC', 'Mature'),
                                                                          (2, 'Ubisoft', 'PlayStation', 'Teen'),
                                                                          (3, 'Nintendo', 'Switch', 'Everyone'),
                                                                          (4, 'Activision', 'Xbox', 'Mature'),
                                                                          (5, 'Square Enix', 'PlayStation', 'Teen');

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

--
-- Dumping data for table `movies`
--

INSERT INTO `movies` (`movieid`, `director`, `format`, `runtime`, `movierating`) VALUES
                                                                                     (1, 'Christopher Nolan', 'Blu-ray', '150 minutes', 'PG-13'),
                                                                                     (2, 'Quentin Tarantino', 'DVD', '180 minutes', 'R'),
                                                                                     (3, 'Steven Spielberg', 'Streaming', '120 minutes', 'PG'),
                                                                                     (4, 'Martin Scorsese', 'Blu-ray', '160 minutes', 'R'),
                                                                                     (5, 'James Cameron', 'DVD', '200 minutes', 'PG-13');

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
                            `productimg` blob DEFAULT NULL,
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

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`productid`, `name`, `productimg`, `description`, `genre`, `studio`, `releasedate`, `price`, `quantity`, `gameid`, `tvid`, `movieid`) VALUES
                                                                                                                                                                  (1, 'Battlefield 2042', NULL, 'In Battlefield 2042, players are thrust into the near-future setting of the year 2042, where global superpowers are on the brink of collapse.', 'FPS', 'DICE', '2021-11-19', 59.99, 0, 1, NULL, NULL),
                                                                                                                                                                  (2, 'Assassins Creed Valhalla', NULL, 'Experience the epic Viking saga as you raid your enemies, grow your settlement, and build political power in the quest to earn a place among the gods in Valhalla.', 'Action RPG', 'Ubisoft', '2020-11-10', 49.99, 0, 2, NULL, NULL),
                                                                                                                                                                  (3, 'The Legend of Zelda Breath of the Wild', NULL, 'Embark on a journey in Hyrule and explore the vast open world, solve puzzles, defeat enemies, and uncover the secrets of the kingdom.', 'Action-Adventure', 'Nintendo', '2017-03-03', 59.99, 0, 3, NULL, NULL),
                                                                                                                                                                  (4, 'Call of Duty Warzone', NULL, 'Drop into a massive battleground with your squad, collect weapons, and battle it out to be the last team standing in this intense battle royale game.', 'Battle Royale', 'Activision', '2020-03-10', 0.00, 0, 4, NULL, NULL),
                                                                                                                                                                  (5, 'Final Fantasy VII Remake', NULL, 'Relive the classic RPG with stunning visuals, expanded gameplay, and unforgettable characters in this reimagining of the iconic Final Fantasy VII.', 'Action RPG', 'Square Enix', '2020-04-10', 54.99, 0, 5, NULL, NULL),
                                                                                                                                                                  (6, 'Breaking Bad: The Complete Series', NULL, 'Follow the transformation of Walter White from a mild-mannered chemistry teacher to a ruthless drug lord in this gripping TV series.', 'Drama', 'Sony Pictures Television', '2008-01-20', 79.99, 0, NULL, 1, NULL),
                                                                                                                                                                  (7, 'Game of Thrones: The Complete Collection', NULL, 'Enter the world of Westeros and follow the power struggles, battles, and intrigues of noble families vying for the Iron Throne.', 'Fantasy', 'HBO', '2011-04-17', 99.99, 0, NULL, 2, NULL),
                                                                                                                                                                  (8, 'Stranger Things: Season 1', NULL, 'Experience the supernatural mysteries and adventures of a group of kids in the 1980s as they encounter strange occurrences in their small town.', 'Science Fiction', 'Netflix', '2016-07-15', 29.99, 0, NULL, 3, NULL),
                                                                                                                                                                  (9, 'Grey\'s Anatomy: The Complete Series', NULL, 'Follow the personal and professional lives of surgical interns, residents, and attendings at Grey Sloan Memorial Hospital.', 'Medical Drama', 'ABC Studios', '2005-03-27', 129.99, 0, NULL, 4, NULL),
                                                                                                                                                                  (10, 'Mad Men: Season 1', NULL, 'Step into the world of advertising in the 1960s and witness the personal and professional lives of the employees at Sterling Cooper.', 'Drama', 'Lionsgate Television', '2007-07-19', 19.99, 0, NULL, 5, NULL),
                                                                                                                                                                  (11, 'Inception', NULL, 'Join Dom Cobb as he leads a team of thieves into the world of corporate espionage by entering the dreams of others.', 'Science Fiction', 'Warner Bros. Pictures', '2010-07-08', 14.99, 0, NULL, NULL, 1),
                                                                                                                                                                  (12, 'Pulp Fiction', NULL, 'Experience the intertwining stories of criminals, hitmen, and other characters in Quentin Tarantino\'s non-linear masterpiece.', 'Crime', 'Miramax Films', '1994-10-14', 9.99, 0, NULL, NULL, 2),
                                                                                                                                                                  (13, 'Jurassic Park', NULL, 'Embark on an adventure on Isla Nublar, where dinosaurs roam freely, in this classic film directed by Steven Spielberg.', 'Adventure', 'Universal Pictures', '1993-06-11', 12.99, 0, NULL, NULL, 3),
                                                                                                                                                                  (14, 'The Departed', NULL, 'Witness the cat-and-mouse game between an undercover cop and a mole in this intense crime thriller directed by Martin Scorsese.', 'Crime', 'Warner Bros. Pictures', '2006-10-06', 19.99, 0, NULL, NULL, 4),
                                                                                                                                                                  (15, 'Titanic', NULL, 'Experience the epic romance and tragedy aboard the ill-fated maiden voyage of the RMS Titanic.', 'Romance', '20th Century Studios', '1997-12-19', 24.99, 0, NULL, NULL, 5);

-- --------------------------------------------------------

--
-- Table structure for table `products_users`
--

DROP TABLE IF EXISTS `products_users`;
CREATE TABLE `products_users` (
                                  `id` int(11) NOT NULL,
                                  `userid` int(11) NOT NULL,
                                  `productid` int(11) NOT NULL,
                                  `quantity` int(11) NOT NULL,
                                  `orderdate` date NOT NULL
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

--
-- Dumping data for table `tvshows`
--

INSERT INTO `tvshows` (`tvid`, `showrunner`, `format`, `noofseasons`, `noofepisodes`, `runtime`, `tvrating`) VALUES
                                                                                                                 (1, 'Vince Gilligan', 'Streaming', 5, 62, '45 minutes', 'TV_MA'),
                                                                                                                 (2, 'David Benioff', 'DVD', 8, 73, '60 minutes', 'TV_14'),
                                                                                                                 (3, 'Duffer Brothers', 'Streaming', 3, 25, '50 minutes', 'TV_14'),
                                                                                                                 (4, 'Shonda Rhimes', 'Streaming', 6, 112, '55 minutes', 'TV_14'),
                                                                                                                 (5, 'Matthew Weiner', 'DVD', 7, 92, '47 minutes', 'TV_MA');

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
-- Dumping data for table `users`
--

INSERT INTO `users` (`userid`, `username`, `email`, `password`, `phone`, `name`, `membership`, `isAdmin`) VALUES
                                                                                                              (1, 'user1', 'user1@example.com', '$2a$10$D6C9jRdaQVV6JYY1Bv7jwOBMqgrRICUp1bTsZIBrO8IUyyK2v7G4y', '123456789', 'User One', 1, 0),
                                                                                                              (2, 'user2', 'user2@example.com', '$2a$10$mBaFu5RTtL6hYfTFB08SfuwrSt4rSPRACey8d/RQXgloiq.eLcyPy', '987654321', 'User Two', 2, 0),
                                                                                                              (3, 'admin', 'admin@example.com', '$2a$10$YYLoNAifKuitaOjg9CNghu86FdqHNlXZyw.azxdlvN00SJqHkEf4e', '111222333', 'Admin User', 3, 1),
                                                                                                              (4, 'john_doe', 'john.doe@example.com', '$2a$10$7K4J0N1rztfc1dPZ7wx/w.vajQUY/BdOpkxMCx4RFUGEEX7TGjqKC', '555666777', 'John Doe', 1, 0),
                                                                                                              (5, 'jane_doe', 'jane.doe@example.com', '$2a$10$YKC7XIYDlTVXpedc/kuTK.DB.cXLo9o2PMR42F6smkqm2p/KRQkVe', '999888777', 'Jane Doe', 2, 0),
                                                                                                              (6, 'Zach', 'zach@yahoo.ie', '$2a$10$jCUpZ9pN3jV5YQuA7vQA8eXPB/TRC2ulipvro4jvuQn9/FsCXUpbu', '0892102298', 'Zach Affron', 1, 1),
                                                                                                              (7, 'Test', 'test@hello.com', '$2a$10$JyLOXENxuKZtlb66yaAHIu2WVRkhmq/IQECi.f.Pw86hA2gGXiNMO', '086273823', 'Test Person', 1, 0),
                                                                                                              (8, 'Danchuck', 'danchuck@Meshi.com', '$2a$10$ezlqHnYEc2FXOTTwxPJXBeVbz9ZgLbGKuFnlT5HUDJmzzrP69yOia', '1', 'Danchuck', 1, 1),
                                                                                                              (9, 'Leo', 'Leo@Gay.com', '$2a$10$s/catfg0GXwSjn4AtTytxuTDLNrEXy7UkXeGSSsoQVCN5z1uIREmy', '0987654321', 'leo lion', 1, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
    ADD PRIMARY KEY (`cartid`),
    ADD KEY `productid FOREIGN` (`productid`),
    ADD KEY `userid FOREIGN` (`userid`),
    ADD KEY `deliveryid FOREIGN` (`deliveryid`),
    ADD KEY `payid FOREIGN` (`payid`);

--
-- Indexes for table `delivery`
--
ALTER TABLE `delivery`
    ADD PRIMARY KEY (`deliveryid`),
    ADD KEY `userid` (`userid`);

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
    ADD PRIMARY KEY (`id`),
    ADD UNIQUE KEY `userid` (`userid`),
    ADD KEY `productid` (`productid`) USING BTREE;

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
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
    MODIFY `cartid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `delivery`
--
ALTER TABLE `delivery`
    MODIFY `deliveryid` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

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
    MODIFY `payid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
    MODIFY `productid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `products_users`
--
ALTER TABLE `products_users`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tvshows`
--
ALTER TABLE `tvshows`
    MODIFY `tvid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
    MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

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
