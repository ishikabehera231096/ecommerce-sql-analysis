-- New vs Returning customers 

WITH noforders AS (
    SELECT customer_unique_id,COUNT(DISTINCT order_id) AS total_orders
    FROM customers AS c
    JOIN orders_clean AS o
    ON c.customer_id = o.customer_id
    WHERE order_status = 'delivered'
    GROUP BY customer_unique_id
    ORDER BY total_orders DESC
),

typeofcustomer AS (
    SELECT CASE WHEN total_orders > 1 THEN 'Returning'
            WHEN total_orders = 1 THEN 'New'
            ELSE NULL
            END AS customer_type
    FROM noforders
)
             

SELECT customer_type,
       COUNT(*) AS number_of_customers,
       ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (), 2) AS percentage_of_customer_type
FROM typeofcustomer 
GROUP BY customer_type