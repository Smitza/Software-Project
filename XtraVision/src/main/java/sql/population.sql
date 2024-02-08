-- Insert data into the 'users' table
INSERT INTO `users` (`username`, `email`, `password`, `phone`, `name`, `membership`, `isAdmin`)
VALUES
    ('user1', 'user1@example.com', 'password1', '123456789', 'User One', 1, 0),
    ('user2', 'user2@example.com', 'password2', '987654321', 'User Two', 2, 0),
    ('admin', 'admin@example.com', 'adminpassword', '111222333', 'Admin User', 3, 1),
    ('john_doe', 'john.doe@example.com', 'johndoe123', '555666777', 'John Doe', 1, 0),
    ('jane_doe', 'jane.doe@example.com', 'janedoe456', '999888777', 'Jane Doe', 2, 0);

-- Insert data into the 'games' table
INSERT INTO `games` (`publisher`, `platform`, `gamerating`)
VALUES
    ('EA Sports', 'PlayStation', 'E'),
    ('Ubisoft', 'Xbox', 'T'),
    ('Activision', 'PC', 'M'),
    ('Nintendo', 'Switch', 'E10+'),
    ('Sony', 'PlayStation', 'M');

-- Insert data into the 'movies' table
INSERT INTO `movies` (`director`, `format`, `runtime`, `movierating`)
VALUES
    ('Christopher Nolan', 'Blu-ray', '150 minutes', 'PG-13'),
    ('Quentin Tarantino', 'DVD', '180 minutes', 'R'),
    ('Steven Spielberg', 'Streaming', '120 minutes', 'PG'),
    ('Martin Scorsese', 'Blu-ray', '160 minutes', 'R'),
    ('James Cameron', 'DVD', '200 minutes', 'PG-13');

-- Insert data into the 'tvshows' table
INSERT INTO `tvshows` (`showrunner`, `format`, `noofseasons`, `noofepisodes`, `runtime`, `tvrating`)
VALUES
    ('Vince Gilligan', 'Streaming', 5, 62, '45 minutes', 'TV_MA'),
    ('David Benioff', 'DVD', 8, 73, '60 minutes', 'TV_14'),
    ('Duffer Brothers', 'Streaming', 3, 25, '50 minutes', 'TV_14'),
    ('Shonda Rhimes', 'Streaming', 6, 112, '55 minutes', 'TV_14'),
    ('Matthew Weiner', 'DVD', 7, 92, '47 minutes', 'TV_MA');

-- Insert data into the 'payment' table
INSERT INTO `payment` (`amount`, `paymentdate`, `paymentmethod`)
VALUES
    (29.99, '2024-02-08', 'Credit Card'),
    (19.99, '2024-02-08', 'PayPal'),
    (9.99, '2024-02-08', 'Google Pay'),
    (14.99, '2024-02-08', 'Voucher'),
    (24.99, '2024-02-08', 'Credit Card');

-- Insert data into the 'delivery' table
INSERT INTO `delivery` (`address`, `phoneno`, `payid`)
VALUES
    ('123 Main St', 123456789, 1),
    ('456 Oak St', 987654321, 2),
    ('789 Pine St', 111222333, 3),
    ('101 Elm St', 555666777, 4),
    ('202 Maple St', 999888777, 5);

-- Insert data into the 'products' table
INSERT INTO `products` (`name`, `description`, `genre`, `studio`, `releasedate`, `price`, `payid`, `gameid`, `tvid`, `movieid`)
VALUES
    ('Product One', 'Description One', 'Genre One', 'Studio One', '2024-02-08', 49.99, 1, 1, 1, 1),
    ('Product Two', 'Description Two', 'Genre Two', 'Studio Two', '2024-02-08', 39.99, 2, 2, 2, 2),
    ('Product Three', 'Description Three', 'Genre Three', 'Studio Three', '2024-02-08', 29.99, 3, 3, 3, 3),
    ('Product Four', 'Description Four', 'Genre Four', 'Studio Four', '2024-02-08', 19.99, 4, 4, 4, 4),
    ('Product Five', 'Description Five', 'Genre Five', 'Studio Five', '2024-02-08', 24.99, 5, 5, 5, 5);

-- Insert data into the 'products_users' table
INSERT INTO `products_users` (`productid`, `userid`, `payid`)
VALUES
    (1, 1, 1),
    (2, 2, 2),
    (3, 3, 3),
    (4, 4, 4),
    (5, 5, 5);
