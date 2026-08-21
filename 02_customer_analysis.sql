-- Q1: One-time vs Repeat Customers
SELECT
    CASE 
        WHEN customer_orders = 1 THEN 'One-time Customer'
        ELSE 'Repeat Customer'
    END AS customer_type,
    COUNT(*) AS number_of_customers
FROM (
    SELECT 
        c.customer_unique_id,
        COUNT(DISTINCT o.order_id) AS customer_orders
    FROM customers c
    JOIN orders o
        ON c.customer_id = o.customer_id
    WHERE o.order_status NOT IN ('canceled', 'unavailable')
    GROUP BY c.customer_unique_id
) t
GROUP BY customer_type;

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Q2: Top Customers by Total Spend
SELECT
    c.customer_unique_id,
    ROUND(SUM(p.payment_value), 2) AS total_spent,
    COUNT(DISTINCT o.order_id) AS total_orders
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_payments p
    ON o.order_id = p.order_id
WHERE o.order_status NOT IN ('canceled', 'unavailable')
GROUP BY c.customer_unique_id
ORDER BY total_spent DESC
LIMIT 10;

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Q3: RFM Customer Segmentation
SELECT
    customer_segment,
    COUNT(*) AS customer_count
FROM (
    SELECT
        c.customer_unique_id,
        CASE
            WHEN COUNT(DISTINCT o.order_id) >= 5 
                 AND SUM(p.payment_value) >= 1000
                 THEN 'Champions'

            WHEN COUNT(DISTINCT o.order_id) BETWEEN 2 AND 4
                 THEN 'Loyal Customers'

            WHEN COUNT(DISTINCT o.order_id) = 1
                 AND DATEDIFF(
                     (SELECT MAX(order_purchase_timestamp) FROM orders),
                     MAX(o.order_purchase_timestamp)
                 ) > 180
                 THEN 'Lost Customers'

            ELSE 'At Risk'
        END AS customer_segment
    FROM customers c
    JOIN orders o ON c.customer_id = o.customer_id
    JOIN order_payments p ON o.order_id = p.order_id
    WHERE o.order_status NOT IN ('canceled', 'unavailable')
    GROUP BY c.customer_unique_id
) t
GROUP BY customer_segment
ORDER BY customer_count DESC;
