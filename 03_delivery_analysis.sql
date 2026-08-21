-- Q1: Average delivery time (in days)

SELECT
    ROUND(
        AVG(
            DATEDIFF(
                order_delivered_customer_date,
                order_purchase_timestamp
            )
        ), 2
    ) AS avg_delivery_days
FROM orders
WHERE order_status = 'delivered'
  AND order_delivered_customer_date IS NOT NULL;

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

 -- Q2: Late vs On-time deliveries

SELECT
    CASE
        WHEN order_delivered_customer_date > order_estimated_delivery_date
            THEN 'Late'
        ELSE 'On Time'
    END AS delivery_status,
    COUNT(*) AS total_orders
FROM orders
WHERE order_status = 'delivered'
  AND order_delivered_customer_date IS NOT NULL
GROUP BY delivery_status;

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Q3: States with highest average delivery delays

SELECT
    c.customer_state,
    ROUND(
        AVG(
            DATEDIFF(
                o.order_delivered_customer_date,
                o.order_estimated_delivery_date
            )
        ), 2
    ) AS avg_delay_days
FROM orders o
JOIN customers c
    ON o.customer_id = c.customer_id
WHERE o.order_status = 'delivered'
  AND o.order_delivered_customer_date IS NOT NULL
GROUP BY c.customer_state
ORDER BY avg_delay_days DESC;
