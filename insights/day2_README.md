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

