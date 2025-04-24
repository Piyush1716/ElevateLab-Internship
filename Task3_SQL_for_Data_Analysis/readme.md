
# Task 3: SQL for Data Analysis

This task demonstrates how to extract, manipulate, and analyze e-commerce sales data using SQL.

## 📂 File Structure
```
Task3_SQL_for_Data_Analysis/
├── outputs_Screen_Shots/     # output ss
├── ecommerce_analysis.sql    # Database and queries
├── README.md                 # Task overview and explanation
```

## 📜 What’s Inside?

### 1. `schema_and_data.sql`
Sets up an e-commerce database:
- `customers`: User details
- `products`: Item catalog
- `orders`: Order history
- `order_items`: Products within each order

### 2. `task3_queries.sql`
Covers key SQL concepts:

- **Basic Queries**
  ```sql
  SELECT ... FROM ... WHERE ... ORDER BY ...
  ```
  Filters and sorts completed orders.

- **JOINs & Aggregation**
  ```sql
  JOIN + GROUP BY + SUM()
  ```
  Calculates total order values with customer names.

- **Aggregate Functions**
  ```sql
  SUM(), AVG()
  ```
  Computes revenue and average order values.

- **GROUP BY + HAVING**
  ```sql
  GROUP BY ... HAVING SUM(...) > value
  ```
  Finds best-selling products.

- **Subqueries**
  ```sql
  SELECT FROM (...) AS subquery
  ```
  Identifies customers spending above average.

- **Views**
  ```sql
  CREATE VIEW
  ```
  Creates a reusable summary of customer spending.

- **Indexing**
  ```sql
  CREATE INDEX
  ```
  Optimizes query performance on large datasets.

---
