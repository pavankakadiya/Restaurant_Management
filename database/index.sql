#Index on email for quick lookup of waiters
CREATE INDEX idx_waiter_email ON waiters(email);

#Index on waiter_id to speed up order lookups
CREATE INDEX idx_order_waiter ON orders(waiter_id);

#Index on dish_name for quick searches
CREATE INDEX idx_dish_name ON dish(dish_name);

#Index on order_items.dish_name to optimize queries
CREATE INDEX idx_order_items_dish ON order_items(dish_name);

#Composite index for faster searches in order_items table
CREATE INDEX idx_order_items_order_dish ON order_items(order_id, dish_name);
