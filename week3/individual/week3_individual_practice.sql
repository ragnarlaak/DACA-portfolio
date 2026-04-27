-- INNER JOIN: kliendid koos nende muukidega
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

-- Kirjuta paring, mis uhendab sales ja products tabelid,
-- et naha tootenimesid koos kokku muudud kogustega.
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

-- Kliendid, kes pole kunagi ostnud
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
-- LEFT JOIN hoiab koik customers read alles
-- WHERE s.sale_id IS NULL jatab alles ainult need,
-- kellel ei leitud uhtegi vastet sales tabelis
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
-- kellel on vahemalt uks ost olemas
SELECT
    COUNT(DISTINCT c.customer_id) AS aktiivseid_kliente
FROM sales s
INNER JOIN customers c
    ON s.customer_id = c.customer_id;

-- Loenda koik kliendid customers tabelis
SELECT
    COUNT(*) AS koik_kliendid
FROM customers;

-- Leia tooted, mida pole kunagi muudud
-- Vasak tabel on products, parem tabel on sales
-- Kui s.sale_id on NULL, siis sellele tootele ei leitud uhtegi muuki
SELECT
    p.product_name AS toode,
    p.category AS kategooria,
    p.retail_price AS hind
FROM products p
LEFT JOIN sales s
    ON p.product_id = s.product_id
WHERE s.sale_id IS NULL
ORDER BY p.category, p.retail_price DESC;

-- Loenda, mitu muumata toodet on kokku
SELECT
    COUNT(*) AS muumata_tooteid
FROM products p
LEFT JOIN sales s
    ON p.product_id = s.product_id
WHERE s.sale_id IS NULL;

-- Grupeeri kliendid linna jargi ja naita,
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

-- Uhenda kliendiandmed, muugiandmed ja tooteandmed
-- Naita klient, linn, muugikuupaev, toode, kategooria, kogus, uhikuhind ja rea summa
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

-- Naita, millised tootekategooriad muuvad igas linnas koige rohkem
-- Arvuta esmalt iga linna-kategooria kogumuuk,
-- siis jata alles ainult iga linna parim kategooria
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

-- Naita kliendid, kes ostavad koige kallimaid tooteid
-- Sorteeri uhikuhinna jargi kahanevalt
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

-- Naita TOP kliendid koos tootekategooriatega
-- Grupeeri kliendi ja kategooria jargi
-- SUM arvutab kogumuugi
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

-- Naita kategooriate kaupa, mitu toodet pole kunagi muudud
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

-- Leia TOP 5 tootekategooriat kogumuugi jargi
SELECT
    p.category AS kategooria,
    SUM(s.total_price) AS kogumuuk
FROM products p
INNER JOIN sales s
    ON p.product_id = s.product_id
GROUP BY p.category
ORDER BY kogumuuk DESC
LIMIT 5;
