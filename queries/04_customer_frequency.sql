WITH noforders AS (
    SELECT customer_unique_id,COUNT(DISTINCT order_id) AS total_orders
    FROM customers AS c
    JOIN orders AS o
    ON c.customer_id = o.customer_id
    WHERE order_status = 'delivered'
    GROUP BY customer_unique_id
),

orderbucket AS (
    SELECT 
        customer_unique_id,
        CASE 
            WHEN total_orders = 1 THEN '1 order'
            WHEN total_orders <= 3 THEN '2-3 orders'
            WHEN total_orders <= 6 THEN '4-6 orders'
            WHEN total_orders <= 10 THEN '7-10 orders'
            ELSE '10+ orders' 
        END AS order_bucket
    FROM noforders
)


SELECT order_bucket,
       COUNT(*) AS number_of_customers,
       ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (),3) AS percentage_of_order_bucket
FROM orderbucket 
GROUP BY order_bucket

