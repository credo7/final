-- Create product table
CREATE TABLE product (
    id BIGINT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    picture_url VARCHAR(500),
    price DECIMAL(19,2) NOT NULL
);

-- Create orders table
CREATE TABLE orders (
    id BIGINT PRIMARY KEY,
    status VARCHAR(50) NOT NULL,
    date_created DATE NOT NULL
);

-- Create order_product junction table
CREATE TABLE order_product (
    id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    quantity INTEGER NOT NULL,
    order_id BIGINT NOT NULL,
    product_id BIGINT NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES product(id)
); 