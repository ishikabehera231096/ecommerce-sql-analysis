--monthly aggregation 
--calculated monthly revenue, monthly orders and monthly customers

WITH paymentperorder AS (
    SELECT order_id, SUM(payment_value) AS total_payment
    FROM order_payments
    GROUP BY order_id
)

SELECT 
    strftime('%Y-%m', o.order_purchase_timestamp) AS order_month,
    SUM(p.total_payment) AS total_revenue,
    COUNT(DISTINCT o.order_id) AS total_orders,
    COUNT(DISTINCT c.customer_unique_id) AS total_customers
FROM orders o
JOIN paymentperorder p 
    ON o.order_id = p.order_id
JOIN customers c
    ON o.customer_id = c.customer_id
WHERE o.order_purchase_timestamp IS NOT NULL
GROUP BY order_month
ORDER BY order_month;




