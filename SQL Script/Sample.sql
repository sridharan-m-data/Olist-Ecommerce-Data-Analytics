USE olist_project;

SHOW DATABASES;
SHOW TABLES;

SELECT ROUND(SUM(payment_value),2) AS Total_Revenue
FROM payments;
SELECT COUNT(*) AS Total_Orders
FROM orders;
SELECT COUNT(DISTINCT customer_unique_id) AS Total_Customers
FROM customers;

SELECT
customer_state,
COUNT(*) AS Orders
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY customer_state
ORDER BY Orders DESC
LIMIT 10;

SELECT
pct.product_category_name_english,
ROUND(SUM(p.payment_value),2) AS Revenue
FROM products pr
JOIN category_translation pct
ON pr.product_category_name = pct.product_category_name
JOIN order_items oi
ON pr.product_id = oi.product_id
JOIN payments p
ON oi.order_id = p.order_id
GROUP BY pct.product_category_name_english
ORDER BY Revenue DESC
LIMIT 10;

SELECT
seller_id,
COUNT(order_id) AS Orders
FROM order_items
GROUP BY seller_id
ORDER BY Orders DESC
LIMIT 10;

SELECT
ROUND(AVG(review_score),2) AS Avg_Rating
FROM reviews;

SELECT
review_score,
COUNT(*) AS Count_Reviews
FROM reviews
GROUP BY review_score
ORDER BY review_score;

SELECT
ROUND(SUM(payment_value) /
COUNT(DISTINCT order_id),2)
AS Average_Order_Value
FROM payments;

SELECT
payment_type,
ROUND(SUM(payment_value),2) AS Revenue
FROM payments
GROUP BY payment_type
ORDER BY Revenue DESC;

SELECT
c.customer_unique_id,
COUNT(DISTINCT o.order_id) AS Orders,
ROUND(SUM(p.payment_value),2) AS Revenue
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
JOIN payments p
ON o.order_id = p.order_id
GROUP BY c.customer_unique_id
ORDER BY Revenue DESC
LIMIT 5;