-- Total Quantity Cookies sold for each cookie sorted from highest to lowest
SELECT product_id, SUM(quantity) as total_quantity FROM Order_Details
GROUP BY product_id
ORDER BY total_quantity DESC;

-- Total Quantity Cookies paired with cookie name, highest to lowest
SELECT p.product_name, SUM(od.quantity) as total_quantity
FROM Order_Details od
JOIN Product p on od.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_quantity DESC;

-- Top 5 Most Ordered Cookies
SELECT p.product_name, SUM(od.quantity) as total_quantity
FROM Order_Details od
JOIN Product p on od.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_quantity DESC
LIMIT 5;

-- Orders with More Than 5 Cookies
SELECT p.product_name, od.order_id, SUM(od.quantity) as total_quantity FROM Order_Details od
JOIN Product p on od.product_id = p.product_id
WHERE od.quantity > 5
GROUP BY p.product_name, od.order_id
ORDER BY total_quantity DESC;

-- Average Price of Cookies
SELECT AVG(price) as average_price FROM Product;

-- Average amount of cookies per order
SELECT AVG(SUM(quantity))

-- Cookies Below Average Price


-- Orders with Lemon Cookies


-- Most and Least Ordered Products


-- Total Revenue


-- Orders Placed in the Last 7 Days (NEED to randomize the timestamp for various values historically)

