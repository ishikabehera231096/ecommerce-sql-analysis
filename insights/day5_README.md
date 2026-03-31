## Day 5: Customer Value Segmentation

### Objective

Identify how revenue is distributed across customers and determine whether a small segment drives the majority of revenue.

### Key Analysis Performed

* Aggregated total revenue and total orders at the customer level
* Ranked customers based on total revenue using percentile segmentation
* Segmented customers into:

  * Top 10% (high-value customers)
  * Next 20%
  * Bottom 70%
* Calculated revenue contribution of each segment

### Key SQL Techniques Used

* Multi-step CTE pipelines for structured transformations
* Aggregation at different grains (order-level → customer-level)
* Window functions (`NTILE`) for percentile segmentation
* Window aggregations for revenue contribution calculation


### Key Findings

* Top 10% of customers contribute ~40% of total revenue
* Bottom 70% of customers contribute a relatively small share of revenue
* Revenue distribution is highly skewed


### Business Insights

* The business is highly dependent on a small group of high-value customers
* Majority of customers generate minimal revenue
* Combined with low retention (~97% one-time buyers), this indicates both:

  * Weak customer loyalty
  * High revenue concentration risk


### Recommendations

* Identify and retain high-value customers through targeted strategies
* Improve customer experience to convert one-time buyers into repeat customers
* Develop loyalty programs and personalized engagement campaigns





