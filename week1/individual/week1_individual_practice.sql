-- Week 1 individual SQL practice
-- Personal SQL exercises completed during week 1

-- 10 esimest rida Tartu müükidest, kus summa on mitte rohkem kui 200
SELECT *
FROM sales
WHERE total_price <= 200
  AND store_location = 'Tartu'
LIMIT 10;

-- Sorteerime mitme tunnuse järgi
SELECT
  invoice_id,
  total_price,
  channel,
  store_location,
  payment_method
FROM sales
ORDER BY total_price DESC, payment_method
LIMIT 50;

-- Anna sales tabeli ridade arv
SELECT COUNT(*) AS sales_ridade_arv
FROM sales;

-- Näita unikaalsed poeasukohad
SELECT DISTINCT store_location
FROM sales
WHERE store_location IS NOT NULL
ORDER BY store_location
LIMIT 10;

-- Linnade arv
SELECT COUNT(DISTINCT store_location) AS "Linnade Arv"
FROM sales
WHERE store_location IS NOT NULL;

-- Toomase dublikaatide mure:
-- arvete koguarv, unikaalsete arvete arv ja dublikaadid
SELECT
  COUNT(*) AS ridade_arv,
  COUNT(DISTINCT invoice_id) AS unikaalsed,
  COUNT(*) - COUNT(DISTINCT invoice_id) AS dublikaate
FROM sales;

-- Päring 1: tabeli üldpilt
SELECT
  COUNT(*) AS ridade_arv,
  COUNT(customer_id) AS klientidega,
  COUNT(*) - COUNT(customer_id) AS puudub_klient,
  COUNT(DISTINCT customer_id) AS unikaalseid_kliente
FROM sales;

/* Kirjuta tulemused siia:
Ridu kokku: 15234
Klientidega tellimusi: 13747
Puuduvaid kliente: 1487
Unikaalseid kliente: 2558
*/

-- Päring 2: unikaalsed kanalid
SELECT DISTINCT channel
FROM sales
ORDER BY channel;
-- Millised kanalid on esindatud? Online ja pood.

-- Päring 3: unikaalsed staatused
SELECT DISTINCT status
FROM sales
ORDER BY status;
-- Millised staatused on esindatud? Puudub column "status".

-- Päring, et vaadata sales tabeli kõik veerud üle
SELECT column_name
FROM information_schema.columns
WHERE table_name = 'sales'
ORDER BY ordinal_position;
