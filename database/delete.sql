DELETE FROM waiters 
WHERE id = 5;

DELETE FROM order_items 
WHERE order_id = 8 AND dish_name = 'Burger';
	
DELETE FROM order_items WHERE order_id = 15;
DELETE FROM orders WHERE order_id = 15;

DELETE FROM dish WHERE dish_name = 'Salad';
