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


