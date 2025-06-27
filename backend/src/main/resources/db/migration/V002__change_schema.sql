-- Add indexes for better performance
CREATE INDEX idx_order_product_order_id ON order_product(order_id);
CREATE INDEX idx_order_product_product_id ON order_product(product_id);
CREATE INDEX idx_orders_date_created ON orders(date_created);
CREATE INDEX idx_orders_status ON orders(status);

-- Add constraints for data integrity
ALTER TABLE orders ADD CONSTRAINT check_status 
    CHECK (status IN ('pending', 'shipped', 'cancelled', 'delivered'));

-- Ensure positive quantities and prices
ALTER TABLE order_product ADD CONSTRAINT check_quantity_positive 
    CHECK (quantity > 0);

ALTER TABLE product ADD CONSTRAINT check_price_positive 
    CHECK (price > 0); 