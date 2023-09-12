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
SELECT AVG(quantity) FROM Order_Details;

-- Cookies Above Average Price
SELECT product_name, price FROM Product
WHERE price > (SELECT AVG(price) FROM Product);

-- Orders with Lemon Cookies
SELECT p.product_name, od.order_id, od.quantity FROM Order_Details od
JOIN Product p ON od.product_id = p.product_id
WHERE p.product_name LIKE 'Lemon%'
ORDER BY od.order_id;

-- Most and Least Ordered Products
(SELECT p.product_name, SUM(od.quantity) as most_and_least_ordered FROM Order_Details od
JOIN Product p ON od.product_id = p.product_id
GROUP BY p.product_name
ORDER BY most_and_least_ordered DESC
LIMIT 1)

UNION ALL

(SELECT p.product_name, SUM(od.quantity) as least_ordered FROM Order_Details od
JOIN Product p ON od.product_id = p.product_id
GROUP BY p.product_name
ORDER BY least_ordered ASC
LIMIT 1);  --The column name in the resulting dataset will be most_and_least_ordered, as determined by the first query. The second query contributes a row to this dataset but does not change the column names. The underlying database engine takes care of matching up the columns by their position in the query, not by their names. So, the first column of the first query matches up with the first column of the second query, the second with the second, and so on. Therefore, it's essential that the queries in the UNION have the same number of columns, and that those columns are of compatible data types.

-- Total Revenue
-- Let's build up to it. First amount per cookie in each order
SELECT p.product_name, od.order_id, (p.price * od.quantity) as amount_per_order FROM Order_Details od
JOIN Product p ON od.product_id = p.product_id
ORDER BY amount_per_order DESC;

-- Second, verify
SELECT od.order_id, p.product_name, od.quantity, p.price FROM Order_Details od
JOIN Product p ON od.product_id = p.product_id
ORDER BY od.order_id;

-- Third, total amount per order
SELECT od.order_id, SUM(p.price * od.quantity) as amount_per_order FROM Order_Details od
JOIN Product p ON od.product_id = p.product_id
GROUP BY od.order_id
ORDER BY amount_per_order DESC;

-- Fourth, simplify
SELECT SUM(p.price * od.quantity) as total_revenue FROM Order_Details od
JOIN Product p ON od.product_id = p.product_id;

-- Orders Placed in the Last 7 Days (NEED to randomize the timestamp for various values historically)

