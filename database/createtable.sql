CREATE DATABASE restaurant1;

use  restaurant1;

CREATE TABLE waiters (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE dish (
    dish_id INT AUTO_INCREMENT PRIMARY KEY,
    dish_name Varchar(255),
    price INT
);


CREATE TABLE order_items (
    item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT REFERENCES orders(order_id),
    dish_name varchar(255),
    quantity INT
);

CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    waiter_id INT,
    FOREIGN KEY (waiter_id) REFERENCES waiters(id)
);

CREATE TABLE tables (
    id INT PRIMARY KEY AUTO_INCREMENT,
    TableNumber INT NOT NULL,
    Capacity INT NOT NULL,
    Status BOOLEAN NOT NULL DEFAULT 0
);



