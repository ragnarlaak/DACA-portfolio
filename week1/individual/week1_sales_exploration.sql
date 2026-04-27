-- Loe kokku koik read sales tabelis
SELECT COUNT(*) AS ridade_arv
FROM sales;

-- Loe unikaalsed arved ja duplikaadid
SELECT
  COUNT(*) AS ridade_arv,
  COUNT(DISTINCT invoice_id) AS unikaalsed,
  COUNT(*) - COUNT(DISTINCT invoice_id) AS duplikaadid
FROM sales;

-- Loe puuduva customer_id-ga read
SELECT COUNT(*) AS puuduvad_customer_id
FROM sales
WHERE customer_id IS NULL;

-- Loe puuduva store_location-ga read
SELECT COUNT(*) AS puuduvad_store_location
FROM sales
WHERE store_location IS NULL;

-- Leia koige vaiksemad tehingud
SELECT *
FROM sales
ORDER BY total_price ASC
LIMIT 10;

-- Leia koige suuremad tehingud
SELECT *
FROM sales
ORDER BY total_price DESC
LIMIT 10;

-- Naita muugikanalid
SELECT DISTINCT channel
FROM sales;

-- Naita poeasukohad
SELECT DISTINCT store_location
FROM sales
WHERE store_location IS NOT NULL;
