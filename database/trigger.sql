#Trigger to Update tables Status on Order Placement
CREATE TRIGGER update_table_status
AFTER INSERT ON orders
FOR EACH ROW
UPDATE tables 
SET Status = 1 
WHERE id = NEW.order_id;

#Trigger to Update updated_at in waiters Table
CREATE TRIGGER update_waiter_timestamp
BEFORE UPDATE ON waiters
FOR EACH ROW
SET NEW.updated_at = CURRENT_TIMESTAMP;

#Trigger to Calculate Total Order Cost
ALTER TABLE orders ADD COLUMN total_cost DECIMAL(10,2) DEFAULT 0;

CREATE TRIGGER update_order_total
AFTER INSERT ON order_items
FOR EACH ROW
UPDATE orders 
SET total_cost = (SELECT SUM(d.price * oi.quantity)
                  FROM order_items oi
                  JOIN dish d ON oi.dish_name = d.dish_name
                  WHERE oi.order_id = NEW.order_id)
WHERE order_id = NEW.order_id;


#Trigger to Archive Deleted Orders
CREATE TABLE orders_archive (
    order_id INT, 
    waiter_id INT, 
    deleted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TRIGGER archive_deleted_orders
BEFORE DELETE ON orders
FOR EACH ROW
INSERT INTO orders_archive (order_id, waiter_id)
VALUES (OLD.order_id, OLD.waiter_id);
