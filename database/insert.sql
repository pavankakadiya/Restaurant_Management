INSERT INTO waiters (username, email, password) VALUES
('john_doe', 'john@example.com', '1234'),
('jane_smith', 'jane@example.com', '1234'),
('alex_jones', 'alex@example.com', '1234'),
('maria_garcia', 'maria@example.com', '1234'),
('robert_brown', 'robert@example.com', '1234'),
('lisa_martin', 'lisa@example.com', '1234'),
('james_taylor', 'james@example.com', '1234'),
('sophia_wilson', 'sophia@example.com', '1234'),
('david_white', 'david@example.com', '1234'),
('olivia_moore', 'olivia@example.com', '1234'),
('chris_hall', 'chris@example.com', '1234'),
('emma_wright', 'emma@example.com', '1234'),
('daniel_adams', 'daniel@example.com', '1234'),
('grace_jackson', 'grace@example.com', '1234'),
('michael_clark', 'michael@example.com', '1234');

INSERT INTO dish (dish_name, price) VALUES
('Pizza', 15),
('Burger', 10),
('Pasta', 12),
('Salad', 8),
('Steak', 25),
('Sandwich', 9),
('Sushi', 20),
('Tacos', 14),
('Burrito', 13),
('Lasagna', 18),
('Chicken Wings', 11),
('Fish & Chips', 16),
('Ramen', 14),
('Curry', 17),
('Dumplings', 12);

INSERT INTO tables (TableNumber, Capacity, Status) VALUES
(1, 4, 0), 
(2, 6, 0), 
(3, 2, 0), 
(4, 8, 0), 
(5, 4, 0),
(6, 6, 0), 
(7, 2, 0), 
(8, 10, 0), 
(9, 4, 0), 
(10, 2, 0),
(11, 6, 0), 
(12, 8, 0), 
(13, 4, 0), 
(14, 10, 0), 
(15, 2, 0);


INSERT INTO orders (waiter_id) VALUES
(1), (2), (3), (4), (5), (6), (7), (8), (9), (10),
(11), (12), (13), (14), (15);

INSERT INTO order_items (order_id, dish_name, quantity) VALUES
(1, 'Pizza', 2),
(2, 'Burger', 1),
(3, 'Pasta', 3),
(4, 'Salad', 2),
(5, 'Steak', 1),
(6, 'Sandwich', 3),
(7, 'Sushi', 2),
(8, 'Tacos', 1),
(9, 'Burrito', 2),
(10, 'Lasagna', 1),
(11, 'Chicken Wings', 3),
(12, 'Fish & Chips', 2),
(13, 'Ramen', 1),
(14, 'Curry', 2),
(15, 'Dumplings', 3);

