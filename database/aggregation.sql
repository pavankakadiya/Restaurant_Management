#Total Sales per waiter
SELECT w.username, SUM(d.price * oi.quantity) AS total_sales
FROM waiters w
JOIN orders o ON w.id = o.waiter_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN dish d ON oi.dish_name = d.dish_name
GROUP BY w.username
ORDER BY total_sales DESC;

# total orders per table
SELECT t.TableNumber, COUNT(o.order_id) AS total_orders
FROM tables t
LEFT JOIN orders o ON t.id = o.order_id
GROUP BY t.TableNumber
ORDER BY total_orders DESC;

#Most ordered dish
SELECT oi.dish_name, SUM(oi.quantity) AS total_quantity
FROM order_items oi
GROUP BY oi.dish_name
ORDER BY total_quantity DESC
LIMIT 5;

#Average order value per waiter
SELECT w.username, 
       COUNT(o.order_id) AS total_orders, 
       SUM(d.price * oi.quantity) / COUNT(o.order_id) AS avg_order_value
FROM waiters w
JOIN orders o ON w.id = o.waiter_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN dish d ON oi.dish_name = d.dish_name
GROUP BY w.username
ORDER BY avg_order_value DESC;

#Total revenue per table
