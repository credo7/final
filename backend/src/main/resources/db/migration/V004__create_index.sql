-- Additional indexes for reporting queries
CREATE INDEX idx_orders_status_date ON orders(status, date_created);
CREATE INDEX idx_order_product_composite ON order_product(product_id, order_id, quantity);

-- Composite index for revenue calculations
CREATE INDEX idx_product_price_name ON product(price DESC, name);

-- Index for order aggregations by date ranges
CREATE INDEX idx_orders_date_status_partial ON orders(date_created) WHERE status IN ('shipped', 'delivered');

-- Index for popular products analysis
CREATE INDEX idx_order_product_quantity_product ON order_product(product_id, quantity DESC); 