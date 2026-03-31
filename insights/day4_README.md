## Day 4: Customer Purchase Frequency Analysis

### Objective

Analyze how frequently customers make purchases to evaluate engagement and retention depth.

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

