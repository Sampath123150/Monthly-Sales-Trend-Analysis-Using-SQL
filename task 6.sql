CREATE DATABASE samp;
USE samp;

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
