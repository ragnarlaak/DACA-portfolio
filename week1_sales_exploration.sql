-- Count total rows in sales
SELECT COUNT(*) AS ridade_arv
FROM sales;

-- Count unique invoices and duplicates
SELECT
  COUNT(*) AS ridade_arv,
  COUNT(DISTINCT invoice_id) AS unikaalsed,
  COUNT(*) - COUNT(DISTINCT invoice_id) AS duplikaadid
FROM sales;

-- Count missing customer IDs
SELECT COUNT(*) AS puuduvad_customer_id
FROM sales
WHERE customer_id IS NULL;

-- Count missing store locations
SELECT COUNT(*) AS puuduvad_store_location
FROM sales
WHERE store_location IS NULL;

-- Find smallest and largest transactions
SELECT *
FROM sales
ORDER BY total_price ASC
LIMIT 10;

SELECT *
FROM sales
ORDER BY total_price DESC
LIMIT 10;

-- Show sales channels
SELECT DISTINCT channel
FROM sales;

-- Show store locations
SELECT DISTINCT store_location
FROM sales
WHERE store_location IS NOT NULL;