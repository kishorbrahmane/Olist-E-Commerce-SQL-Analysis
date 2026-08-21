-- QUE1. Monthly trend of orders & revenue
SELECT 
    DATE_FORMAT(o.order_purchase_timestamp, '%Y-%m') AS month,
    COUNT(DISTINCT o.order_id) AS total_orders,
    ROUND(SUM(p.payment_value), 2) AS total_revenue
FROM orders o
JOIN order_payments p
    ON o.order_id = p.order_id
WHERE o.order_status NOT IN ('canceled', 'unavailable')
GROUP BY month
ORDER BY month;

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- QUE2. Top product categories by revenue 
SELECT 
    pc.product_category_name_english AS category,
    ROUND(SUM(p.payment_value), 2) AS total_revenue
FROM orders o
JOIN order_payments p
    ON o.order_id = p.order_id
JOIN order_items oi
    ON o.order_id = oi.order_id
JOIN products pr
    ON oi.product_id = pr.product_id
JOIN product_category pc
    ON pr.product_category_name = pc.product_category_name
WHERE o.order_status NOT IN ('canceled', 'unavailable')
GROUP BY pc.product_category_name_english
ORDER BY total_revenue DESC;

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- QUE3. Top products by total sales 

SELECT 
    pr.product_id,
    ROUND(SUM(p.payment_value), 2) AS total_revenue
FROM orders o
JOIN order_payments p
    ON o.order_id = p.order_id
JOIN order_items oi
    ON o.order_id = oi.order_id
JOIN products pr
    ON oi.product_id = pr.product_id
WHERE o.order_status NOT IN ('canceled', 'unavailable')
GROUP BY pr.product_id
ORDER BY total_revenue DESC
LIMIT 10;

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- QUE4. Peak order day & hour
-- Q4a: Peak Order Day
SELECT 
    DAYNAME(order_purchase_timestamp) AS order_day,
    COUNT(order_id) AS total_orders
FROM orders
WHERE order_status NOT IN ('canceled', 'unavailable')
GROUP BY order_day
ORDER BY total_orders DESC;

-- Q4b: Peak Order Hour
SELECT 
    HOUR(order_purchase_timestamp) AS order_hour,
    COUNT(order_id) AS total_orders
FROM orders
WHERE order_status NOT IN ('canceled', 'unavailable')
GROUP BY order_hour
ORDER BY total_orders DESC;
