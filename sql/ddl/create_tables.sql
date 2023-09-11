-- Create a toy-database of cookies as product, and cookies sold as orders
CREATE OR REPLACE TABLE Product (
    product_id NUMBER NOT NULL AUTOINCREMENT,
    product_name VARCHAR(50) NOT NULL,
    price FLOAT NOT NULL,
    description VARCHAR(255),
    sys_create_dttm TIMESTAMP_NTZ NOT NULL DEFAULT CURRENT_TIMESTAMP(),
    CONSTRAINT pk_product_id PRIMARY KEY(product_id)
);

-- Add table for cookie orders placed
CREATE OR REPLACE TABLE Order_Details (
    order_id NUMBER NOT NULL,
    product_id NUMBER NOT NULL,
    quantity INT NOT NULL,
    CONSTRAINT fk_product_id_order FOREIGN KEY(product_id) REFERENCES Product(product_id),
    CONSTRAINT pk_order_details PRIMARY KEY(order_id, product_id)
);

-- Create a temporary table to hold the random data.
CREATE OR REPLACE TEMPORARY TABLE Temp_OrderData (
    random_order_id INTEGER,
    random_product_id INTEGER,
    random_quantity INTEGER
);

-- Drop the temporary table
DROP TABLE Temp_OrderData;