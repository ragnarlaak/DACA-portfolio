-- ROLL C - Tooted + inventuur (LEFT JOIN)

-- 1. Leia tooted, mis pole kunagi müüdud
SELECT
    p.product_name,
    p.category,
    p.subcategory,
    p.retail_price,
    s.sale_id
FROM products p
LEFT JOIN sales s
    ON p.product_id = s.product_id
WHERE s.sale_id IS NULL;

-- 2. Loe müümata toodete koguarv
SELECT
    COUNT(*) AS muumata_tooteid
FROM products p
LEFT JOIN sales s
    ON p.product_id = s.product_id
WHERE s.sale_id IS NULL;
-- Vastus: 12

-- 3. Leia enim müüdud tooted
-- COUNT(s.sale_id) = mitu müügirida tootega seotud on
-- SUM(s.total_price) = kogumüük eurodes
SELECT
    p.product_name,
    p.category,
    p.subcategory,
    COUNT(s.sale_id) AS muugikordi,
    SUM(s.total_price) AS kogumuuk
FROM products p
INNER JOIN sales s
    ON p.product_id = s.product_id
GROUP BY
    p.product_id,
    p.product_name,
    p.category,
    p.subcategory
ORDER BY kogumuuk DESC
LIMIT 10;

-- 4. Analüüsi kategooriate kaupa
-- COUNT(DISTINCT p.product_id) = mitu erinevat toodet kategoorias
-- COUNT(s.sale_id) = mitu müüki kategooria toodetel kokku
-- SUM(s.total_price) = kategooria kogumüük
SELECT
    p.category,
    COUNT(DISTINCT p.product_id) AS tooteid,
    COUNT(s.sale_id) AS muuke,
    SUM(s.total_price) AS kogumuuk
FROM products p
LEFT JOIN sales s
    ON p.product_id = s.product_id
GROUP BY p.category
ORDER BY kogumuuk DESC NULLS LAST;

-- 5. Ühenda inventuuriga
-- Näita, millised tooted on laos ja kas neid tuleks juurde tellida
SELECT
    p.product_name,
    p.category,
    i.location,
    i.quantity_available,
    i.reorder_point,
    CASE
        WHEN i.quantity_available IS NULL THEN 'INVENTUUR PUUDUB'
        WHEN i.quantity_available <= i.reorder_point THEN 'TELLI JUURDE'
        ELSE 'OK'
    END AS staatus
FROM products p
LEFT JOIN inventory i
    ON p.product_id = i.product_id
ORDER BY i.quantity_available ASC NULLS LAST;

-- 6. Leia tooted, mis on laos olemas, aga pole kunagi müüdud
SELECT
    p.product_name,
    p.category,
    p.retail_price,
    i.quantity_available,
    (p.retail_price * i.quantity_available) AS kinni_olev_raha
FROM products p
LEFT JOIN sales s
    ON p.product_id = s.product_id
LEFT JOIN inventory i
    ON p.product_id = i.product_id
WHERE s.sale_id IS NULL
  AND i.quantity_available > 0
ORDER BY kinni_olev_raha DESC;

-- Päring ei tagastanud ühtegi rida, mis tähendab, et hetkel ei ole laos selliseid tooteid,
-- mis oleksid müümata ja samal ajal positiivse laoseisuga. See viitab sellele, et müümata
-- tooted ei seo praegu otseselt laoraha.
