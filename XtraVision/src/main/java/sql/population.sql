-- Insert data into the 'users' table
INSERT INTO `users` (`userid`, `username`, `email`, `password`, `phone`, `name`, `membership`, `isAdmin`) VALUES
                                                                                                              (1, 'user1', 'user1@example.com', 'password1', '123456789', 'User One', 1, 0),
                                                                                                              (2, 'user2', 'user2@example.com', 'password2', '987654321', 'User Two', 2, 0),
                                                                                                              (3, 'admin', 'admin@example.com', 'adminpassword', '111222333', 'Admin User', 3, 1),
                                                                                                              (4, 'john_doe', 'john.doe@example.com', 'johndoe123', '555666777', 'John Doe', 1, 0),
                                                                                                              (5, 'jane_doe', 'jane.doe@example.com', 'janedoe456', '999888777', 'Jane Doe', 2, 0);

-- Insert data into the 'games' table
INSERT INTO `games` (`gameid`, `publisher`, `platform`, `gamerating`) VALUES
                                                                          (1, 'Electronic Arts', 'PC', 'Mature'),
                                                                          (2, 'Ubisoft', 'PlayStatio', 'Teen'),
                                                                          (3, 'Nintendo', 'Switch', 'Everyone'),
                                                                          (4, 'Activision', 'Xbox', 'Mature'),
                                                                          (5, 'Square Enix', 'PlayStatio', 'Teen');

-- Insert data into the 'movies' table
INSERT INTO `movies` (`movieid`, `director`, `format`, `runtime`, `movierating`) VALUES
                                                                                     (1, 'Christopher Nolan', 'Blu-ray', '150 minutes', 'PG-13'),
                                                                                     (2, 'Quentin Tarantino', 'DVD', '180 minutes', 'R'),
                                                                                     (3, 'Steven Spielberg', 'Streaming', '120 minutes', 'PG'),
                                                                                     (4, 'Martin Scorsese', 'Blu-ray', '160 minutes', 'R'),
                                                                                     (5, 'James Cameron', 'DVD', '200 minutes', 'PG-13');

-- Insert data into the 'tvshows' table
INSERT INTO `tvshows` (`tvid`, `showrunner`, `format`, `noofseasons`, `noofepisodes`, `runtime`, `tvrating`) VALUES
                                                                                                                 (1, 'Vince Gilligan', 'Streaming', 5, 62, '45 minutes', 'TV_MA'),
                                                                                                                 (2, 'David Benioff', 'DVD', 8, 73, '60 minutes', 'TV_14'),
                                                                                                                 (3, 'Duffer Brothers', 'Streaming', 3, 25, '50 minutes', 'TV_14'),
                                                                                                                 (4, 'Shonda Rhimes', 'Streaming', 6, 112, '55 minutes', 'TV_14'),
                                                                                                                 (5, 'Matthew Weiner', 'DVD', 7, 92, '47 minutes', 'TV_MA');

-- Insert data into the 'payment' table
INSERT INTO `payment` (`payid`, `amount`, `paymentdate`, `paymentmethod`) VALUES
                                                                              (1, 30, '2024-02-08', 'Credit Card'),
                                                                              (2, 20, '2024-02-08', 'PayPal'),
                                                                              (3, 10, '2024-02-08', 'Google Pay'),
                                                                              (4, 15, '2024-02-08', 'Voucher'),
                                                                              (5, 25, '2024-02-08', 'Credit Card');

-- Insert data into the 'delivery' table
INSERT INTO `delivery` (`deliveryid`, `address`, `phoneno`, `payid`) VALUES
                                                                         (1, '123 Main St', 123456789, 1),
                                                                         (2, '456 Oak St', 987654321, 2),
                                                                         (3, '789 Pine St', 111222333, 3),
                                                                         (4, '101 Elm St', 555666777, 4),
                                                                         (5, '202 Maple St', 999888777, 5);

-- Insert data into the 'products' table
INSERT INTO `products` (`productid`, `name`, `description`, `genre`, `studio`, `releasedate`, `price`, `quantity`, `payid`, `gameid`, `tvid`, `movieid`) VALUES
(1, 'Battlefield 2042', 'WELCOME TO 2042\r\nBattlefield™ 2042 is a first-person shooter that marks the return to the iconic all-out warfare of the franchise. With the help of a cutting-edge arsenal, you can engage in intense, immersive multiplayer battles.\r\n\r\nLead your team to victory!', 'FPS', 'DICE', '2021-11-19', 59.99, 0, 0, 1, NULL, NULL),
(2, 'Assassins Creed Valhalla', 'Experience the epic Viking saga as you raid your enemies, grow your settlement, and build political power in the quest to earn a place among the gods in Valhalla.', 'Action RPG', 'Ubisoft', '2020-11-10', 49.99, 0, 0, 2, NULL, NULL),
(3, 'The Legend of Zelda Breath of the Wild', 'Embark on a journey in Hyrule and explore the vast open world, solve puzzles, defeat enemies, and uncover the secrets of the kingdom.', 'Action-Adventure', 'Nintendo', '2017-03-03', 59.99, 0, 0, 3, NULL, NULL),
(4, 'Call of Duty Warzone', 'Drop into a massive battleground with your squad, collect weapons, and battle it out to be the last team standing in this intense battle royale game.', 'Battle Royale', 'Activision', '2020-03-10', 0.00, 0, 0, 4, NULL, NULL),
(5, 'Final Fantasy VII Remake', 'Relive the classic RPG with stunning visuals, expanded gameplay, and unforgettable characters in this reimagining of the iconic Final Fantasy VII.', 'Action RPG', 'Square Enix', '2020-04-10', 54.99, 0, 0, 5, NULL, NULL);

