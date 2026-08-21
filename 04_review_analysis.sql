-- Q1: Review score distribution

SELECT
    review_score,
    COUNT(*) AS total_reviews
FROM order_reviews
GROUP BY review_score
ORDER BY review_score;

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Q2: Delivery time vs review score

SELECT
    r.review_score,
    ROUND(
        AVG(
            DATEDIFF(
                o.order_delivered_customer_date,
                o.order_purchase_timestamp
            )
        ), 2
    ) AS avg_delivery_days
FROM order_reviews r
JOIN orders o
    ON r.order_id = o.order_id
WHERE o.order_status = 'delivered'
  AND o.order_delivered_customer_date IS NOT NULL
GROUP BY r.review_score
ORDER BY r.review_score DESC;

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Q3: States with lowest average review scores

SELECT
    c.customer_state,
    ROUND(AVG(r.review_score), 2) AS avg_review_score,
    COUNT(r.review_id) AS total_reviews
FROM order_reviews r
JOIN orders o
    ON r.order_id = o.order_id
JOIN customers c
    ON o.customer_id = c.customer_id
GROUP BY c.customer_state
HAVING COUNT(r.review_id) >= 50
ORDER BY avg_review_score ASC;
