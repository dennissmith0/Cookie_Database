-- Clear Product Table if adjusting values of cookies
--TRUNCATE TABLE Product;

-- Create a toy-database of cookies as product, and cookies sold as orders
CREATE OR REPLACE TABLE Product (
    product_id NUMBER NOT NULL AUTOINCREMENT,
    product_name VARCHAR(50) NOT NULL,
    price FLOAT NOT NULL,
    description VARCHAR(255),
    sys_create_dttm TIMESTAMP_NTZ NOT NULL DEFAULT CURRENT_TIMESTAMP(),
    CONSTRAINT pk_product_id PRIMARY KEY(product_id)
);

-- Clear Order_Details Table if need to refresh with new random values
--TRUNCATE TABLE Order_Details;
--TRUNCATE TABLE Temp_OrderData;

-- Add table for cookie orders placed
CREATE OR REPLACE TABLE Order_Details (
    order_id NUMBER NOT NULL,
    product_id NUMBER NOT NULL,
    quantity INT NOT NULL,
    CONSTRAINT fk_product_id_order FOREIGN KEY(product_id) REFERENCES Product(product_id),
    CONSTRAINT pk_order_details PRIMARY KEY(order_id, product_id)
);

-- Create a Customer table. Generate random names, count for visits, ... 
CREATE OR REPLACE TABLE Customers (
    cust_id NUMBER NOT NULL,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(50),
    visit_count INT DEFAULT 0,
    last_visit TIMESTAMP_NTZ,
    total_spent FLOAT DEFAULT 0,
    membership_status VARCHAR(50),
    address VARCHAR(255),
    phone_number VARCHAR(20),
    created_at TIMESTAMP_NTZ DEFAULT CURRENT_TIMESTAMP(),
    updated at TIMESTAMP_NTZ,
    CONSTRAINT pk_customer_id PRIMARY KEY(customer_id)
);