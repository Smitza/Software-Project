-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 16, 2024 at 08:00 PM
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

--
-- Dumping data for table `games`
--

INSERT INTO `games` (`gameid`, `publisher`, `platform`, `gamerating`) VALUES
(1, 'Electronic Arts', 'PC', 'Mature'),
(2, 'Ubisoft', 'PlayStation', 'Teen'),
(3, 'Nintendo', 'Switch', 'Everyone'),
(4, 'Activision', 'Xbox', 'Mature'),
(5, 'Square Enix', 'PlayStation', 'Teen');

--
-- Dumping data for table `movies`
--

INSERT INTO `movies` (`movieid`, `director`, `format`, `runtime`, `movierating`) VALUES
(1, 'Christopher Nolan', 'Blu-ray', '150 minutes', 'PG-13'),
(2, 'Quentin Tarantino', 'DVD', '180 minutes', 'R'),
(3, 'Steven Spielberg', 'Streaming', '120 minutes', 'PG'),
(4, 'Martin Scorsese', 'Blu-ray', '160 minutes', 'R'),
(5, 'James Cameron', 'DVD', '200 minutes', 'PG-13');

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`productid`, `name`, `description`, `genre`, `studio`, `releasedate`, `price`, `quantity`, `gameid`, `tvid`, `movieid`) VALUES
(1, 'Battlefield 2042', 'In Battlefield 2042, players are thrust into the near-future setting of the year 2042, where global superpowers are on the brink of collapse.', 'FPS', 'DICE', '2021-11-19', 59.99, 0, 1, NULL, NULL),
(2, 'Assassins Creed Valhalla', 'Experience the epic Viking saga as you raid your enemies, grow your settlement, and build political power in the quest to earn a place among the gods in Valhalla.', 'Action RPG', 'Ubisoft', '2020-11-10', 49.99, 0, 2, NULL, NULL),
(3, 'The Legend of Zelda Breath of the Wild', 'Embark on a journey in Hyrule and explore the vast open world, solve puzzles, defeat enemies, and uncover the secrets of the kingdom.', 'Action-Adventure', 'Nintendo', '2017-03-03', 59.99, 0, 3, NULL, NULL),
(4, 'Call of Duty Warzone', 'Drop into a massive battleground with your squad, collect weapons, and battle it out to be the last team standing in this intense battle royale game.', 'Battle Royale', 'Activision', '2020-03-10', 0.00, 0, 4, NULL, NULL),
(5, 'Final Fantasy VII Remake', 'Relive the classic RPG with stunning visuals, expanded gameplay, and unforgettable characters in this reimagining of the iconic Final Fantasy VII.', 'Action RPG', 'Square Enix', '2020-04-10', 54.99, 0, 5, NULL, NULL),
(6, 'Breaking Bad: The Complete Series', 'Follow the transformation of Walter White from a mild-mannered chemistry teacher to a ruthless drug lord in this gripping TV series.', 'Drama', 'Sony Pictures Television', '2008-01-20', 79.99, 0, NULL, 1, NULL),
(7, 'Game of Thrones: The Complete Collection', 'Enter the world of Westeros and follow the power struggles, battles, and intrigues of noble families vying for the Iron Throne.', 'Fantasy', 'HBO', '2011-04-17', 99.99, 0, NULL, 2, NULL),
(8, 'Stranger Things: Season 1', 'Experience the supernatural mysteries and adventures of a group of kids in the 1980s as they encounter strange occurrences in their small town.', 'Science Fiction', 'Netflix', '2016-07-15', 29.99, 0, NULL, 3, NULL),
(9, 'Grey\'s Anatomy: The Complete Series', 'Follow the personal and professional lives of surgical interns, residents, and attendings at Grey Sloan Memorial Hospital.', 'Medical Drama', 'ABC Studios', '2005-03-27', 129.99, 0, NULL, 4, NULL),
(10, 'Mad Men: Season 1', 'Step into the world of advertising in the 1960s and witness the personal and professional lives of the employees at Sterling Cooper.', 'Drama', 'Lionsgate Television', '2007-07-19', 19.99, 0, NULL, 5, NULL),
(11, 'Inception', 'Join Dom Cobb as he leads a team of thieves into the world of corporate espionage by entering the dreams of others.', 'Science Fiction', 'Warner Bros. Pictures', '2010-07-08', 14.99, 0, NULL, NULL, 1),
(12, 'Pulp Fiction', 'Experience the intertwining stories of criminals, hitmen, and other characters in Quentin Tarantino\'s non-linear masterpiece.', 'Crime', 'Miramax Films', '1994-10-14', 9.99, 0, NULL, NULL, 2),
(13, 'Jurassic Park', 'Embark on an adventure on Isla Nublar, where dinosaurs roam freely, in this classic film directed by Steven Spielberg.', 'Adventure', 'Universal Pictures', '1993-06-11', 12.99, 0, NULL, NULL, 3),
(14, 'The Departed', 'Witness the cat-and-mouse game between an undercover cop and a mole in this intense crime thriller directed by Martin Scorsese.', 'Crime', 'Warner Bros. Pictures', '2006-10-06', 19.99, 0, NULL, NULL, 4),
(15, 'Titanic', 'Experience the epic romance and tragedy aboard the ill-fated maiden voyage of the RMS Titanic.', 'Romance', '20th Century Studios', '1997-12-19', 24.99, 0, NULL, NULL, 5);

--
-- Dumping data for table `tvshows`
--

INSERT INTO `tvshows` (`tvid`, `showrunner`, `format`, `noofseasons`, `noofepisodes`, `runtime`, `tvrating`) VALUES
(1, 'Vince Gilligan', 'Streaming', 5, 62, '45 minutes', 'TV_MA'),
(2, 'David Benioff', 'DVD', 8, 73, '60 minutes', 'TV_14'),
(3, 'Duffer Brothers', 'Streaming', 3, 25, '50 minutes', 'TV_14'),
(4, 'Shonda Rhimes', 'Streaming', 6, 112, '55 minutes', 'TV_14'),
(5, 'Matthew Weiner', 'DVD', 7, 92, '47 minutes', 'TV_MA');

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userid`, `username`, `email`, `password`, `phone`, `name`, `membership`, `isAdmin`) VALUES
(1, 'user1', 'user1@example.com', '$2a$10$D6C9jRdaQVV6JYY1Bv7jwOBMqgrRICUp1bTsZIBrO8IUyyK2v7G4y', '123456789', 'User One', 1, 0),
(2, 'user2', 'user2@example.com', '$2a$10$mBaFu5RTtL6hYfTFB08SfuwrSt4rSPRACey8d/RQXgloiq.eLcyPy', '987654321', 'User Two', 2, 0),
(3, 'admin', 'admin@example.com', '$2a$10$YYLoNAifKuitaOjg9CNghu86FdqHNlXZyw.azxdlvN00SJqHkEf4e', '111222333', 'Admin User', 3, 1),
(4, 'john_doe', 'john.doe@example.com', '$2a$10$7K4J0N1rztfc1dPZ7wx/w.vajQUY/BdOpkxMCx4RFUGEEX7TGjqKC', '555666777', 'John Doe', 1, 0),
(5, 'jane_doe', 'jane.doe@example.com', '$2a$10$YKC7XIYDlTVXpedc/kuTK.DB.cXLo9o2PMR42F6smkqm2p/KRQkVe', '999888777', 'Jane Doe', 2, 0);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
