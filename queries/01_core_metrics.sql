---revenue calculation 

WITH paymentperorder AS (
    SELECT order_id,SUM(payment_value) AS total_payment_value_per_order
    FROM order_payments
    GROUP BY order_id
)

SELECT SUM(total_payment_value_per_order) AS total_revenue
FROM paymentperorder


--customer count

SELECT COUNT(DISTINCT customer_unique_id) AS total_customers
FROM customers AS c
JOIN orders AS o 
ON c.customer_id = o.customer_id



--Average order value

WITH paymentperorder AS (
SELECT order_id,SUM(payment_value) AS total_payment_per_order
FROM order_payments
GROUP BY order_id
)

SELECT SUM(total_payment_per_order) * 1.0/COUNT(order_id) AS average_order_value
FROM paymentperorder


