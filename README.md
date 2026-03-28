# E-commerce SQL Analysis
This project analyzes customer behavior and revenue trends using SQL.

## Tools
- SQLite
- VS Code

## Project Structure
- data/ → raw data
- queries/ → SQL scripts
- insights/ → findings

## Day 1: Data Understanding

### Objective
Understanding the structure, relationships, and granularity of the dataset before performing any analysis.

### Key Tables Analyzed
* **orders**: Contains one row per order with timestamps and order status
* **order_items**: Contains one row per item within an order
* **payments**: Contains one row per payment transaction (including installments)
* **customers**: Contains customer-level information linked to orders

### Table Granularity (Grain)
* **orders** → 1 row = 1 order
* **order_items** → 1 row = 1 item within an order
* **payments** → 1 row = 1 payment record per order (can be multiple per order)
* **customers** → 1 row = 1 customer record (note: same real-world customer may appear multiple times)

### Table Relationships
* customers ↔ orders → joined using `customer_id`
* orders ↔ order_items → joined using `order_id`
* orders ↔ payments → joined using `order_id`

### Key Observations

* Orders can have multiple items and multiple payment records, leading to potential duplication when joining tables
* Special care is required to aggregate lower-grain tables (order_items, payments) before joining
* Order status can be used to identify canceled orders
* Delivery delays can be identified by comparing actual vs estimated delivery dates

### Data Challenges Identified
* Risk of row duplication due to multiple items and payments per order
* Customer uniqueness is not guaranteed due to dataset structure
* Presence of NULL values in delivery timestamps for non-delivered orders

### Analytical Decisions

* Chose **1 row = 1 order** as the final analysis grain
* Selected **payments table as source of truth for revenue** (actual money       collected)
* Will use **order_items for product-level and expected revenue analysis**


## Day 2: Core Metrics & Monthly Trends

### Objective

Build foundational business metrics and analyze monthly performance trends to understand overall business health.

### Metrics Calculated

* **Total Revenue** (using payments as source of truth)
* **Total Orders**
* **Total Customers** (using customer_unique_id)
* **Average Order Value (AOV)**


### Key SQL Techniques Used

* Common Table Expressions (CTEs) to aggregate payments at order level
* Joins between orders, payments, and customers
* DISTINCT counting to avoid customer duplication
* Date transformation using `strftime` for monthly aggregation


### Monthly Trend Analysis

Created a monthly view of:

* Revenue
* Orders
* Customers

Using `order_purchase_timestamp` to align trends with customer behavior.


### Key Observations

* Significant drop in orders and customers in **December 2016**
* Sharp decline in activity during **September–October 2018**


### Data Considerations

* These drops are likely due to **dataset boundaries (incomplete months)** rather than actual business performance issues
* Reinforces importance of validating data completeness before drawing conclusions


### Analytical Decisions

* Aggregated payments to order-level before joining to avoid duplication
* Used purchase timestamp instead of approval/delivery dates for accurate trend analysis
* Used `customer_unique_id` to represent real customers



