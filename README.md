# Monthly-Sales-Trend-Analysis-Using-SQL
Analyze online sales data to calculate monthly revenue and order volume. Learn how to use SQL aggregations, GROUP BY, and date functions for time-based analysis.
# Online Sales Data Analysis (SQL Project)

This project demonstrates how to analyze monthly revenue and order volume using SQL.  
A sample `online_sales` table is created, populated with transaction data, and queried to extract meaningful business insights.

---

## 📁 Project Structure

- **Database:** `sa`
- **Table:** `online_sales`
- **Records:** 8 sample transactions
- **Tools Used:** MySQL / MariaDB

---

## 🛠️ SQL Steps Performed

### 1. **Database & Table Creation**
The project starts with creating a database and defining the `online_sales` table, which contains:
- `order_id`
- `order_date`
- `amount`
- `product_id`

### 2. **Data Insertion**
Sample sales data from January to March 2023 is inserted to simulate online transactions.

### 3. **Monthly Revenue & Order Volume Analysis**
A SQL query is executed to calculate:
- **Monthly Revenue:** `SUM(amount)`
- **Order Volume:** `COUNT(DISTINCT order_id)`
- Grouped by **Year** and **Month**

---

## 📊 Output Summary

| Year | Month | Monthly Revenue | Order Volume |
|------|--------|------------------|---------------|
| 2023 | 1 | 285.75 | 3 |
| 2023 | 2 | 350.00 | 2 |
| 2023 | 3 | 475.50 | 3 |


### 📌 Key Learnings

How to use EXTRACT(), SUM(), and COUNT() for time-based analysis

Grouping data by month and year

Creating a simple analytical dataset for SQL practice

---

## 🧾 Full SQL Script

```sql
CREATE DATABASE sa;
USE sa;

CREATE TABLE online_sales (
    order_id INT,
    order_date DATE,
    amount DECIMAL(10,2),
    product_id INT
);

INSERT INTO online_sales (order_id, order_date, amount, product_id) VALUES
(1, '2023-01-05', 120.50, 101),
(2, '2023-01-10', 90.00, 102),
(3, '2023-01-15', 75.25, 103),
(4, '2023-02-01', 150.00, 101),
(5, '2023-02-15', 200.00, 103),
(6, '2023-03-03', 175.00, 104),
(7, '2023-03-10', 220.00, 102),
(8, '2023-03-20', 80.50, 101);

SELECT
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    SUM(amount) AS monthly_revenue,
    COUNT(DISTINCT order_id) AS order_volume
FROM online_sales
GROUP BY
    EXTRACT(YEAR FROM order_date),
    EXTRACT(MONTH FROM order_date)
ORDER BY
    year, month;



