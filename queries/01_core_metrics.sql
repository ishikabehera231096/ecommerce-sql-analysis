---revenue calculation 

WITH paymentperorder AS (
    SELECT order_id,SUM(payment_value) AS total_payment_value_per_order
    FROM order_payments_clean
    GROUP BY order_id
)

SELECT SUM(total_payment_value_per_order) AS total_revenue
FROM paymentperorder;


--customer count

SELECT COUNT(DISTINCT customer_unique_id) AS total_customers
FROM customers_clean AS c
JOIN orders_clean AS o 
ON c.customer_id = o.customer_id;



--Average order value

WITH paymentperorder AS (
SELECT order_id,SUM(payment_value) AS total_payment_per_order
FROM order_payments_clean
GROUP BY order_id
)

SELECT SUM(total_payment_per_order) * 1.0/COUNT(order_id) AS average_order_value
FROM paymentperorder;


