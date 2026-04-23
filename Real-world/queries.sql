-- 46. Monthly sales
SELECT MONTH(order_date), SUM(amount)
FROM orders
GROUP BY MONTH(order_date);

-- 47. Top customer
SELECT customer_id, SUM(amount) AS total_spent
FROM orders
GROUP BY customer_id
ORDER BY total_spent DESC
LIMIT 1;

-- 48. Customers with no orders
SELECT c.name
FROM customers c
LEFT JOIN orders o ON c.id = o.customer_id
WHERE o.id IS NULL;

-- 49. Product with highest sales
SELECT product_id, SUM(quantity) AS total
FROM order_items
GROUP BY product_id
ORDER BY total DESC
LIMIT 1;

-- 50. Daily active users
SELECT DATE(login_time), COUNT(DISTINCT user_id)
FROM logins
GROUP BY DATE(login_time);
