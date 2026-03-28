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

## Day 3: Customer Behavior Analysis

### Objective

Analyze customer purchasing patterns to understand retention and repeat behavior.

---

### Key Analysis Performed

* Calculated total number of orders per customer
* Classified customers into:

  * **New customers** (1 order)
  * **Returning customers** (>1 orders)
* Analyzed distribution of customer types

### Key SQL Techniques Used

* CTEs for step-by-step transformations
* DISTINCT counting to avoid duplication
* CASE statements for customer segmentation
* Aggregations for customer-level metrics

### Key Findings

* ~97% of customers are **one-time buyers**
* Only ~3% of customers are **returning customers**


### Business Insights

* The business is heavily reliant on **new customer acquisition**
* Customer retention is extremely low, indicating weak repeat engagement
* Revenue growth may be unstable due to lack of a loyal customer base

### Recommendations

* Investigate customer experience issues (delivery delays, product quality, etc.)
* Collect and analyze customer feedback to identify pain points
* Implement retention strategies such as:

  * Loyalty programs
  * Personalized offers
  * Post-purchase engagement campaigns


  ## Day 4: Customer Purchase Frequency Analysis

### Objective

Analyze how frequently customers make purchases to evaluate engagement and retention depth.

---

### Key Analysis Performed

* Calculated total number of orders per customer
* Segmented customers into purchase frequency buckets:

  * 1 order
  * 2–3 orders
  * 4–6 orders
  * 7–10 orders
  * 10+ orders
* Computed distribution and percentage of customers in each segment

### Key SQL Techniques Used

* CTEs for customer-level aggregation
* CASE statements for segmentation
* DISTINCT counting to ensure accurate order counts
* Window functions for percentage calculation

### Key Findings

* ~97% of customers made only **one purchase**
* ~3% of customers made **2–3 purchases**
* Less than 1% of customers made **more than 3 purchases**

### Business Insights

* Customer engagement is extremely shallow, with very few repeat buyers
* Even among repeat customers, most show low purchase frequency
* The business lacks a strong base of high-frequency, loyal customers

### Implications

* Revenue is likely driven by new customers rather than repeat behavior
* Customer lifetime value is low
* Growth may be unsustainable without improving retention




