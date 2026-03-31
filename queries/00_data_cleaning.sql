DROP TABLE IF EXISTS orders_clean;

CREATE TABLE orders_clean AS
SELECT
    order_id,
    customer_id,
    order_status,
    datetime(order_purchase_timestamp) AS order_purchase_timestamp,
    datetime(order_approved_at) AS order_approved_at,
    datetime(order_delivered_carrier_date) AS order_delivered_carrier_date,
    datetime(order_delivered_customer_date) AS order_delivered_customer_date,
    datetime(order_estimated_delivery_date) AS order_estimated_delivery_date
FROM orders;

DROP TABLE IF EXISTS order_payments_clean;

CREATE TABLE order_payments_clean AS
SELECT
    order_id,
    payment_sequential,
    payment_type,
    payment_installments,
    CAST(payment_value AS REAL) AS payment_value
FROM order_payments;

DROP TABLE IF EXISTS order_items_clean;

CREATE TABLE order_items_clean AS
SELECT
    order_id,
    order_item_id,
    product_id,
    seller_id,
    datetime(shipping_limit_date) AS shipping_limit_date,
    CAST(price AS REAL) AS price,
    CAST(freight_value AS REAL) AS freight_value
FROM order_items;

DROP TABLE IF EXISTS customers_clean;

CREATE TABLE customers_clean AS
SELECT *
FROM customers;