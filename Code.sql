CREATE TABLE Orders (
    Order_id INT PRIMARY KEY,
    Order_date DATE,
    Amount DECIMAL(10,2),
    Product_id VARCHAR(10)
);
INSERT INTO Orders (Order_id, Order_date, Amount, Product_id) VALUES
(1001, '2023-01-15', 150.00, 'P001'),
(1002, '2023-01-20', 200.00, 'P002'),
(1003, '2023-02-05', 300.00, 'P003'),
(1004, '2023-02-18', 100.00, 'P001'),
(1005, '2023-03-10', 250.00, 'P004'),
(1006, '2023-03-22', 175.00, 'P002'),
(1007, '2024-01-12', 180.00, 'P001'),
(1008, '2024-01-25', 220.00, 'P005'),
(1009, '2024-02-10', 190.00, 'P002'),
(1010, '2024-02-28', 310.00, 'P003');

SELECT Order_id, strftime('%m', Order_date) AS order_month FROM Orders 
WHERE Order_date BETWEEN '2024-01-01' AND '2024-12-31';

SELECT
  strftime('%Y', Order_date) AS order_year,
  strftime('%m', Order_date) AS order_month,
  SUM(Amount) AS total_revenue,
  COUNT(DISTINCT Order_id) AS total_orders
FROM
  Orders
WHERE
  Order_date BETWEEN '2024-01-01' AND '2024-12-31' -- for limiting the time period.
GROUP BY
  order_year,
  order_month
ORDER BY
  order_year,
  order_month;

