-- Create Customers Table
CREATE TABLE customer (
    id SERIAL PRIMARY KEY,
    email VARCHAR(45) NOT NULL,
    pwd VARCHAR(200) NOT NULL,
    role VARCHAR(45) NOT NULL
);
