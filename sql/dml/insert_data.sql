INSERT INTO Product (product_name, price, description)
VALUES
('7-layer Cookie Bar', 4.29, 'A multi-layered bar featuring a graham cracker crust, chocolate chips, butterscotch chips, coconut flakes, chopped walnuts, and a drizzle of sweetened condensed milk'),
('Thick Chocolate Chip Walnut', 3.79, 'A chewy, golden-brown dough loaded with semi-sweet chocolate chips and crunchy walnuts'),
('Mint Chocolate Chip', 4, 'Chocolate Cookie with Mint Frosting & Chocolate Chips on top'),
('Lemon Tart', 3.15, 'Lemon Frosting, Tart Lemon Powder & Fresh Lime'),
('Lemon Raspberry Sugar', 3.15, 'Lemon Frosting & Raspberry Drizzle'),
('Salted Caramel Sugar', 2.95, 'Vanilla Frosting, Caramel & Rock Salt'),
('PB Nutella', 3.15, 'Peanut Butter Cookie with Nutella Frosting'),
('Cookies & Cream', 3.15, 'Vanilla Sugar Cookie with Caramel, Chocolate & Oreo pieces'),
('Lemon Sugar', 2.95, 'Soft Sugar Cookie with Lemon Frosting'),
('Chocolate Chip', 3.15, 'Mounted Milk Chocolate Chip Cookie'),
('Frosted Sugar', 2.95, 'Soft Sugar Cookie with Vanilla Frosting'),
('Peanut Butter', 2.95, 'Peanut Butter Cookie'),
('Twisted Sugar', 2.95, 'Coconut Icing & Fresh Lime'),
('Swizzle Sugar', 3.15, 'Coconut Frosting, Raspberry Drizzle & Fresh Lime'),
('Carmel Sugar', 3.15, 'Vanilla Frosting & Caramel Drizzle'),
('Oatmeal Chocolate Chip', 2.95, 'Oatmeal Chocolate Chip'),
('Sprinkles Sugar', 3.15, 'Cotton Candy Frosting & Sprinkles'),
('Oat Cookie Butter', 3.15, 'Oatmeal Chocolate Chip Cookie with Biscoff'),
('Banana Cream', 3.15, 'Graham Cookie, Banana Frosting & Whipped Topping'),
('Sugardoodle', 3.15, 'Brown Sugar Cinnamon Frosting & Cinn/Sugar Sprinkled on top'),
('Crinkle', 3.15, 'Chocolate Brownie Cookie dusted with Powdered Sugar'),
('Key Lime', 3.15, 'Graham Sugar Cookie with Key Lime Frosting & Whipped Topping dusted with Graham Crumbs'),
('Butter Beer', 3.15, 'Peanut Butter Cookie with Butter Beer Frosting & a Caramel Drizzle'),
('Pumpkin Chocolate Chip Cookie', 3.50, 'Warm Autumn spices join irresitible cholate chips in a moist pumpkin cookie iced with a brown sugar cinnamon frosting'),
('Bookworm Cookie', 3.50, 'Our delectable chocolate cookie is iced with a vanilla cream frosting then topped with Oreo cookie pieces and a gummy worm');

-- Create a temporary table to hold the random data.
CREATE OR REPLACE TEMPORARY TABLE Temp_OrderData (
    random_order_id INTEGER,
    random_product_id INTEGER,
    random_quantity INTEGER
);

-- Populate the temporary table with random data
INSERT INTO Temp_OrderData (random_order_id, random_product_id, random_quantity)
SELECT 
    (ABS(RANDOM()) / 1e16)::INTEGER % 100 + 1, -- Random() function was exhibiting FUNKY behavior, giving astronimcal values rather than values between 0 and 1.
    (ABS(RANDOM()) / 1e16)::INTEGER % 24 + 1,    -- Hardcode a workaround, but the root issue remains.
    (ABS(RANDOM()) / 1e16)::INTEGER % 10 + 1
FROM TABLE(GENERATOR(ROWCOUNT => 200));

-- Move the data from the temporary table to Order_Details table
INSERT INTO Order_Details (order_id, product_id, quantity)
SELECT 
    random_order_id,
    random_product_id,
    random_quantity
FROM Temp_OrderData;

-- Drop the temporary table
DROP TABLE Temp_OrderData;
