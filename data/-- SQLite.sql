-- SQLite
select *
from orders
limit 5


--order table 
--order_id is primary key and customer_id is the foreign key 
-- total rows in the table 99441
-- each row contains the details about when the order delivery 
-- take a look at the canceled and unavailable order status to dig deeper into the reasons
-- take a look at rows where estimated delivery date is less than the actual delivery date



select *
from customers
limit 5 

-- customer table 
-- join with orders table on customer_id
-- each row contains the details about the customer location 
--find cities with highest order deliveries for targeted marketing 

select *
from order_payments
limit 5 


--payment table
-- join with orders table on order_id 
-- each row contains details for customer payment 
-- total rows is 103886

select *
from order_items
where order_id = '00010242fe8c5a6d1ba2dd792cb16214'
 
 --order items table
 -- each row contains 112650 rows
 -- join with orders table on order_id 
 -- join with products on product_id
 -- join with sellers on seller_id

 select count(distinct product_id)
 from products 
 limit 5 

 --product table
 -- each row contrains details on the products sold in company
 -- 32951 rows 
 -- product_id is the primary key
 -- join with orders table on product_id




