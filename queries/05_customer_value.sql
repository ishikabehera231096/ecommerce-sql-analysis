WITH paymentperorder AS (
    SELECT order_id, SUM(payment_value) AS total_payment
    FROM order_payments_clean
    GROUP BY order_id
),

customer_agg AS (
    SELECT 
        c.customer_unique_id,
        COUNT(DISTINCT o.order_id) AS total_orders,
        SUM(p.total_payment) AS total_revenue
    FROM customers_clean c
    JOIN orders_clean o 
        ON c.customer_id = o.customer_id 
    JOIN paymentperorder p 
        ON o.order_id = p.order_id 
    WHERE o.order_status = 'delivered'
    GROUP BY c.customer_unique_id 
),

cust_percentile AS (
    SELECT 
        *,
        NTILE(100) OVER (ORDER BY total_revenue DESC) AS percentile 
    FROM customer_agg
),

cust_segment AS (
    SELECT 
        *,
        CASE 
            WHEN percentile <= 10 THEN 'Top 10%'
            WHEN percentile <= 30 THEN 'Next 20%'
            ELSE 'Bottom 70%' 
        END AS segment 
    FROM cust_percentile
)

SELECT 
    segment,
    COUNT(*) AS number_of_customers,
    SUM(total_revenue) AS segment_revenue,
    ROUND(100.0 * SUM(total_revenue) / SUM(SUM(total_revenue)) OVER(), 2) AS revenue_percent_contribution
FROM cust_segment
GROUP BY segment;