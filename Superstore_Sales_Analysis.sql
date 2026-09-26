-- Superstore Sales Analysis
-- SQL Business Analysis
-- Project 2


-- 1. Preview the data
SELECT *
FROM `superstore-sql-project-509512.superstore_data.sales_data`
LIMIT 5;


-- 2. Total Sales
SELECT SUM(Sales) AS total_sales
FROM `superstore-sql-project-509512.superstore_data.sales_data`;


-- 3. Total Profit
SELECT SUM(Profit) AS total_profit
FROM `superstore-sql-project-509512.superstore_data.sales_data`;


-- 4. Total Quantity Sold
SELECT SUM(Quantity) AS total_quantity
FROM `superstore-sql-project-509512.superstore_data.sales_data`;


-- 5. Sales by Category
SELECT
  Category,
  SUM(Sales) AS total_sales
FROM `superstore-sql-project-509512.superstore_data.sales_data`
GROUP BY Category
ORDER BY total_sales DESC;


-- 6. Profit by Category
SELECT
  Category,
  SUM(Profit) AS total_profit
FROM `superstore-sql-project-509512.superstore_data.sales_data`
GROUP BY Category
ORDER BY total_profit DESC;


-- 7. Sales by Region
SELECT
  Region,
  SUM(Sales) AS total_sales
FROM `superstore-sql-project-509512.superstore_data.sales_data`
GROUP BY Region
ORDER BY total_sales DESC;


-- 8. Profit by Region
SELECT
  Region,
  SUM(Profit) AS total_profit
FROM `superstore-sql-project-509512.superstore_data.sales_data`
GROUP BY Region
ORDER BY total_profit DESC;


-- 9. Sales by Customer Segment
SELECT
  Segment,
  SUM(Sales) AS total_sales
FROM `superstore-sql-project-509512.superstore_data.sales_data`
GROUP BY Segment
ORDER BY total_sales DESC;


-- 10. Profit by Customer Segment
SELECT
  Segment,
  SUM(Profit) AS total_profit
FROM `superstore-sql-project-509512.superstore_data.sales_data`
GROUP BY Segment
ORDER BY total_profit DESC;


-- 11. Top 5 Products by Sales
SELECT
  `Product Name`,
  SUM(Sales) AS total_sales
FROM `superstore-sql-project-509512.superstore_data.sales_data`
GROUP BY `Product Name`
ORDER BY total_sales DESC
LIMIT 5;


-- 12. Top 5 Products by Profit
SELECT
  `Product Name`,
  SUM(Profit) AS total_profit
FROM `superstore-sql-project-509512.superstore_data.sales_data`
GROUP BY `Product Name`
ORDER BY total_profit DESC
LIMIT 5;


-- 13. Sales by Sub-Category
SELECT
  `Sub-Category`,
  SUM(Sales) AS total_sales
FROM `superstore-sql-project-509512.superstore_data.sales_data`
GROUP BY `Sub-Category`
ORDER BY total_sales DESC;


-- 14. Profit by Sub-Category
SELECT
  `Sub-Category`,
  SUM(Profit) AS total_profit
FROM `superstore-sql-project-509512.superstore_data.sales_data`
GROUP BY `Sub-Category`
ORDER BY total_profit DESC;


-- 15. Loss-Making Sub-Categories
SELECT
  `Sub-Category`,
  SUM(Profit) AS total_profit
FROM `superstore-sql-project-509512.superstore_data.sales_data`
GROUP BY `Sub-Category`
HAVING SUM(Profit) < 0
ORDER BY total_profit ASC;


-- 16. Discount vs Average Profit
SELECT
  CASE
    WHEN Discount = 0 THEN '0%'
    WHEN Discount <= 0.20 THEN '1-20%'
    WHEN Discount <= 0.40 THEN '21-40%'
    WHEN Discount <= 0.60 THEN '41-60%'
    ELSE '61%+'
  END AS discount_band,
  AVG(Profit) AS average_profit
FROM `superstore-sql-project-509512.superstore_data.sales_data`
GROUP BY discount_band
ORDER BY average_profit DESC;


-- 17. Top 5 States by Sales
SELECT
  State,
  SUM(Sales) AS total_sales
FROM `superstore-sql-project-509512.superstore_data.sales_data`
GROUP BY State
ORDER BY total_sales DESC
LIMIT 5;


-- 18. Top 5 Loss-Making States
SELECT
  State,
  SUM(Profit) AS total_profit
FROM `superstore-sql-project-509512.superstore_data.sales_data`
GROUP BY State
HAVING SUM(Profit) < 0
ORDER BY total_profit ASC
LIMIT 5;


-- 19. Sales by Year
SELECT
  EXTRACT(YEAR FROM `Order Date`) AS order_year,
  SUM(Sales) AS total_sales
FROM `superstore-sql-project-509512.superstore_data.sales_data`
GROUP BY order_year
ORDER BY order_year;