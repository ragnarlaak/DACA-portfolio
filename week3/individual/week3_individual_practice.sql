-- INNER JOIN: kliendid koos nende müükidega
SELECT
    c.first_name,
    c.last_name,
    c.city,
    s.sale_id,
    s.sale_date,
    s.total_price
FROM sales s
INNER JOIN customers c ON s.customer_id = c.customer_id
ORDER BY s.total_price DESC
LIMIT 20;

-- Kirjuta päring, mis ühendab sales ja products tabelid,
-- et näha tootenimesid koos kokku müüdud kogustega.

SELECT
    p.product_name,
    p.category,
    SUM(s.quantity) AS muudud_kogus,
    SUM(s.total_price) AS kogumuuk
FROM products p
INNER JOIN sales s
    ON s.product_id = p.product_id
GROUP BY
    p.product_id,
    p.product_name,
    p.category
ORDER BY muudud_kogus DESC, kogumuuk DESC
LIMIT 15;

-- Kliendid, kes pole KUNAGI ostnud
SELECT
    c.first_name,
    c.last_name,
    c.email,
    c.city,
    c.registration_date
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
WHERE s.sale_id IS NULL;

-- Leia kliendid, kes pole kunagi ostnud
-- LEFT JOIN hoiab kõik customers read alles
-- WHERE s.sale_id IS NULL jätab alles ainult need,
-- kellel ei leitud ühtegi vastet sales tabelis

SELECT
    c.customer_id,
    c.first_name || ' ' || c.last_name AS nimi,
    c.email,
    c.city,
    c.registration_date
FROM customers c
LEFT JOIN sales s
    ON c.customer_id = s.customer_id
WHERE s.sale_id IS NULL
ORDER BY c.registration_date DESC;


-- Loenda aktiivsed kliendid ehk need,
-- kellel on vähemalt üks ost olemas

SELECT
    COUNT(DISTINCT c.customer_id) AS aktiivseid_kliente
FROM sales s
INNER JOIN customers c
    ON s.customer_id = c.customer_id;


-- Loenda kõik kliendid customers tabelis

SELECT
    COUNT(*) AS koik_kliendid
FROM customers;


-- Leia tooted, mida pole kunagi müüdud
-- Vasak tabel on products, parem tabel on sales
-- Kui s.sale_id on NULL, siis sellele tootele ei leitud ühtegi müüki

SELECT
    p.product_name AS toode,
    p.category AS kategooria,
    p.retail_price AS hind
FROM products p
LEFT JOIN sales s
    ON p.product_id = s.product_id
WHERE s.sale_id IS NULL
ORDER BY p.category, p.retail_price DESC;


-- Loenda, mitu müümata toodet on kokku

SELECT
    COUNT(*) AS muumata_tooteid
FROM products p
LEFT JOIN sales s
    ON p.product_id = s.product_id
WHERE s.sale_id IS NULL;


-- Grupeeri kliendid linna järgi ja näita,
-- mitu klienti igast linnast pole kunagi ostnud

SELECT
    c.city AS linn,
    COUNT(*) AS kadunud_kliente
FROM customers c
LEFT JOIN sales s
    ON c.customer_id = s.customer_id
WHERE s.sale_id IS NULL
GROUP BY c.city
ORDER BY kadunud_kliente DESC, c.city;


-- Ühenda kliendiandmed, müügiandmed ja tooteandmed
-- Näita klient, linn, müügikuupäev, toode, kategooria, kogus, ühikuhind ja rea summa

SELECT
    c.first_name || ' ' || c.last_name AS klient,
    c.city AS linn,
    s.sale_date AS muugi_kuupaev,
    p.product_name AS toode,
    p.category AS kategooria,
    s.quantity AS kogus,
    s.unit_price AS uhikuhind,
    s.total_price AS rea_summa
FROM sales s
INNER JOIN customers c
    ON s.customer_id = c.customer_id
INNER JOIN products p
    ON s.product_id = p.product_id
ORDER BY rea_summa DESC
LIMIT 20;


-- Näita, millised tootekategooriad müüvad igas linnas kõige rohkem
-- Arvuta esmalt iga linna-kategooria kogumüük,
-- siis jäta alles ainult iga linna parim kategooria

WITH category_sales AS (
    SELECT
        c.city AS linn,
        p.category AS kategooria,
        COUNT(s.sale_id) AS muuke,
        SUM(s.total_price) AS kogumuuk
    FROM sales s
    INNER JOIN customers c
        ON s.customer_id = c.customer_id
    INNER JOIN products p
        ON s.product_id = p.product_id
    GROUP BY c.city, p.category
),
ranked_categories AS (
    SELECT
        linn,
        kategooria,
        muuke,
        kogumuuk,
        ROW_NUMBER() OVER (
            PARTITION BY linn
            ORDER BY kogumuuk DESC
        ) AS rn
    FROM category_sales
)
SELECT
    linn,
    kategooria,
    muuke,
    kogumuuk
FROM ranked_categories
WHERE rn = 1
ORDER BY kogumuuk DESC;


-- Näita kliendid, kes ostavad kõige kallimaid tooteid
-- Sorteeri ühikuhinna järgi kahanevalt

SELECT
    c.first_name || ' ' || c.last_name AS klient,
    c.city AS linn,
    p.product_name AS toode,
    p.category AS kategooria,
    s.unit_price AS uhikuhind,
    s.total_price AS rea_summa
FROM sales s
INNER JOIN customers c
    ON s.customer_id = c.customer_id
INNER JOIN products p
    ON s.product_id = p.product_id
ORDER BY s.unit_price DESC
LIMIT 20;


-- Näita TOP kliendid koos tootekategooriatega
-- Grupeeri kliendi ja kategooria järgi
-- SUM arvutab kogumüügi

SELECT
    c.first_name || ' ' || c.last_name AS klient,
    c.city AS linn,
    p.category AS kategooria,
    SUM(s.total_price) AS kogumuuk
FROM sales s
INNER JOIN customers c
    ON s.customer_id = c.customer_id
INNER JOIN products p
    ON s.product_id = p.product_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name,
    c.city,
    p.category
ORDER BY kogumuuk DESC
LIMIT 20;


-- Näita kategooriate kaupa, mitu toodet pole kunagi müüdud
-- Lisaks arvuta nende toodete keskmine hind

SELECT
    p.category AS kategooria,
    COUNT(*) AS muumata_tooteid,
    ROUND(AVG(p.retail_price), 2) AS keskmine_hind
FROM products p
LEFT JOIN sales s
    ON p.product_id = s.product_id
WHERE s.sale_id IS NULL
GROUP BY p.category
ORDER BY muumata_tooteid DESC;


-- Leia TOP 5 tootekategooriat kogumüügi järgi

SELECT
    p.category AS kategooria,
    SUM(s.total_price) AS kogumuuk
FROM products p
INNER JOIN sales s
    ON p.product_id = s.product_id
GROUP BY p.category
ORDER BY kogumuuk DESC
LIMIT 5;
