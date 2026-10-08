-- Retail Business Analytics SQL
-- Revenue by category
SELECT category, SUM(quantity * unit_price * (1-discount)) AS revenue
FROM sales GROUP BY category ORDER BY revenue DESC;

-- Monthly revenue
SELECT EXTRACT(YEAR FROM order_date) AS year,
       EXTRACT(MONTH FROM order_date) AS month,
       SUM(quantity * unit_price * (1-discount)) AS revenue
FROM sales
GROUP BY EXTRACT(YEAR FROM order_date), EXTRACT(MONTH FROM order_date)
ORDER BY year, month;

-- Top products
SELECT product, SUM(quantity * unit_price * (1-discount)) AS revenue
FROM sales GROUP BY product ORDER BY revenue DESC LIMIT 10;

-- Top customers
SELECT customer_id, SUM(quantity * unit_price * (1-discount)) AS revenue
FROM sales GROUP BY customer_id ORDER BY revenue DESC LIMIT 10;

-- Revenue by region
SELECT region, SUM(quantity * unit_price * (1-discount)) AS revenue
FROM sales GROUP BY region ORDER BY revenue DESC;
