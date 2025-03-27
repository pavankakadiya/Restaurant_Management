#Procedure to Add a New Order
DELIMITER $$

CREATE PROCEDURE AddNewOrder(
    IN waiterId INT,
    OUT newOrderId INT
)
BEGIN
    INSERT INTO orders (waiter_id) VALUES (waiterId);
    SET newOrderId = LAST_INSERT_ID();
END $$

DELIMITER ;

CALL AddNewOrder(2, @orderId);
SELECT @orderId;

#Procedure to Get Total Sales Per Waiter
DELIMITER $$

CREATE PROCEDURE GetTotalSalesPerWaiter()
BEGIN
    SELECT w.username, SUM(d.price * oi.quantity) AS total_sales
    FROM waiters w
    JOIN orders o ON w.id = o.waiter_id
    JOIN order_items oi ON o.order_id = oi.order_id
    JOIN dish d ON oi.dish_name = d.dish_name
    GROUP BY w.username
    ORDER BY total_sales DESC;
END $$

DELIMITER ;

CALL GetTotalSalesPerWaiter();

#Procedure to Get Most Popular Dishes
DELIMITER $$

CREATE PROCEDURE GetTopDishes()
BEGIN
    SELECT oi.dish_name, SUM(oi.quantity) AS total_quantity
    FROM order_items oi
    GROUP BY oi.dish_name
    ORDER BY total_quantity DESC
    LIMIT 5;
END $$

DELIMITER ;

CALL GetTopDishes();


#Procedure to Close an Order and Free the Table
DELIMITER $$

CREATE PROCEDURE CloseOrder(
    IN orderId INT
)
BEGIN
    UPDATE tables 
    SET Status = 0 
    WHERE id = (SELECT order_id FROM orders WHERE order_id = orderId);

    DELETE FROM order_items WHERE order_id = orderId;
    DELETE FROM orders WHERE order_id = orderId;
END $$

DELIMITER ;

CALL CloseOrder(3);
