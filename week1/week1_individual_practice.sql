-- Week 1 individual SQL practice
-- Personal query practice separate from sales exploration

-- Total sales amount by channel
SELECT
  channel,
  SUM(total_price) AS total_sales
FROM sales
GROUP BY channel
ORDER BY total_sales DESC;

-- Average transaction value by store location
SELECT
  store_location,
  AVG(total_price) AS avg_transaction_value
FROM sales
WHERE store_location IS NOT NULL
GROUP BY store_location
ORDER BY avg_transaction_value DESC;

-- Customers with the most invoices
SELECT
  customer_id,
  COUNT(DISTINCT invoice_id) AS invoice_count
FROM sales
WHERE customer_id IS NOT NULL
GROUP BY customer_id
ORDER BY invoice_count DESC
LIMIT 10;

-- Number of transactions by channel
SELECT
  channel,
  COUNT(*) AS transaction_count
FROM sales
GROUP BY channel
ORDER BY transaction_count DESC;
