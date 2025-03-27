UPDATE waiters 
SET email = 'henil@email.com' 
WHERE id = 3;

UPDATE tables 
SET Status = 1 
WHERE TableNumber = 5;

UPDATE order_items 
SET quantity = 4 
WHERE order_id = 10 AND dish_name = 'Pizza';

UPDATE dish 
SET price = 25
WHERE dish_name = 'Pasta';
