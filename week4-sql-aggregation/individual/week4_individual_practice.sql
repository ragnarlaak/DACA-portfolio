-- =========================================
-- NADAL 4 - SQL AGREGATSIOON
-- =========================================

-- -----------------------------------------
-- OSA 1: GROUP BY
-- -----------------------------------------

-- Harjutus 1A: kuude kaupa muugi kokkuvote 2024. aastal
SELECT
    TO_CHAR(sale_date, 'YYYY-MM') AS kuu,
    COUNT(*) AS tellimusi,
    SUM(total_price) AS kaive,
    ROUND(AVG(total_price), 2) AS keskmine_tellimus
FROM sales
WHERE sale_date >= '2024-01-01'
GROUP BY TO_CHAR(sale_date, 'YYYY-MM')
ORDER BY kuu;

-- Vastus ekraanipildilt:
-- 2024-01 | 312 tellimust | 85618.65 kaive | keskmine tellimus 274.42
-- 2024-02 | 334 tellimust | 90181.83 kaive | keskmine tellimus 270.01
-- 2024-03 | 412 tellimust | 109559.98 kaive | keskmine tellimus 265.92
-- 2024-04 | 411 tellimust | 113838.38 kaive | keskmine tellimus 276.98
-- 2024-05 | 413 tellimust | 116843.02 kaive | keskmine tellimus 282.91
-- 2024-06 | 509 tellimust | 144558.18 kaive | keskmine tellimus 284.00
-- 2024-07 | 510 tellimust | 146800.80 kaive | keskmine tellimus 287.84
-- 2024-08 | 511 tellimust | 144870.17 kaive | keskmine tellimus 283.50
-- 2024-09 | 392 tellimust | 109267.47 kaive | keskmine tellimus 278.74
-- 2024-10 | 391 tellimust | 127622.32 kaive | keskmine tellimus 326.40
-- 2024-11 | 392 tellimust | 110573.94 kaive | keskmine tellimus 282.08
-- 2024-12 | 550 tellimust | 170623.28 kaive | keskmine tellimus 310.22
-- Peamine jareldus: detsembris oli koige suurem kaive ja koige rohkem tellimusi,
-- oktoobris oli koige korgem keskmine tellimuse vaartus.

-- Harjutus 1B: muuk linnade kaupa
SELECT
    c.city AS linn,
    COUNT(s.sale_id) AS tellimuste_arv,
    SUM(s.total_price) AS kogukaive,
    ROUND(AVG(s.total_price), 2) AS keskmine_tellimus
FROM customers c
JOIN sales s
    ON c.customer_id = s.customer_id
GROUP BY c.city
ORDER BY kogukaive DESC;

-- Vastus ekraanipildilt:
-- Tallinn    | 3601 tellimust | 1006252.88 kaive | keskmine tellimus 279.44
-- Tartu      | 1764 tellimust | 523286.64 kaive  | keskmine tellimus 296.65
-- Parnu      | 1231 tellimust | 374005.86 kaive  | keskmine tellimus 303.82
-- Narva      | 438 tellimust  | 122226.14 kaive  | keskmine tellimus 279.06
-- Viljandi   | 359 tellimust  | 102314.94 kaive  | keskmine tellimus 285.00
-- Rakvere    | 338 tellimust  | 93379.03 kaive   | keskmine tellimus 276.27
-- Johvi      | 290 tellimust  | 77601.15 kaive   | keskmine tellimus 267.59
-- Kuressaare | 256 tellimust  | 76509.61 kaive   | keskmine tellimus 298.87
-- Haapsalu   | 252 tellimust  | 73492.83 kaive   | keskmine tellimus 291.64
-- Voru       | 216 tellimust  | 60983.07 kaive   | keskmine tellimus 282.33
-- Valga      | 216 tellimust  | 59530.76 kaive   | keskmine tellimus 275.61
-- Paide      | 169 tellimust  | 53148.87 kaive   | keskmine tellimus 314.49
-- Peamine jareldus: Tallinn juhib selgelt nii kogukaibe kui tellimuste arvuga.
-- Nahtavatest linnadest oli Paidel koige korgem keskmine tellimuse vaartus.

-- Harjutus 1C: oma arikusimus - muuk nadalapaevade kaupa
SELECT
    EXTRACT(DOW FROM sale_date) AS nadalapaev,
    COUNT(sale_id) AS tellimuste_arv,
    SUM(total_price) AS kogukaive,
    ROUND(AVG(total_price), 2) AS keskmine_tellimus
FROM sales
GROUP BY EXTRACT(DOW FROM sale_date)
ORDER BY nadalapaev;

-- Tahelepanek:
-- Kaasas olnud ekraanipilt naitas ainult paringut.
-- Tulemustabelit ei olnud naha, seega siia ei lisatud kontrollitud vastust.

-- -----------------------------------------
-- OSA 2: HAVING
-- -----------------------------------------

-- Harjutus 2A: kliendid, kes on kulutanud ule 500 euro
SELECT
    c.customer_id,
    c.first_name || ' ' || c.last_name AS nimi,
    COUNT(s.sale_id) AS tellimuste_arv,
    SUM(s.total_price) AS kogukaive
FROM customers c
JOIN sales s
    ON c.customer_id = s.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
HAVING SUM(s.total_price) > 500
ORDER BY kogukaive DESC;

-- Vastus ekraanipildilt:
-- Paring tagastas 1722 rida.
-- Suurimad nahtavad kliendid:
-- 3618 | Tiina Parn   | 73 tellimust | 27668.02 kaive
-- 3350 | Priit Rand   | 76 tellimust | 26286.10 kaive
-- 2997 | Kevin Org    | 78 tellimust | 23467.13 kaive
-- 2889 | Laura Tammik | 74 tellimust | 23385.82 kaive
-- 3648 | Erkki Ilves  | 72 tellimust | 22942.42 kaive
-- 3605 | Anu Kuusik   | 77 tellimust | 21626.10 kaive
-- 4206 | Kersti Lill  | 71 tellimust | 21137.47 kaive
-- 2221 | Riina Lill   | 67 tellimust | 20972.33 kaive
-- Peamine jareldus: ule 500 euro kulutanud kliente oli palju
-- ja tipptarbijad joudsid ule 20 000 euro kaibeni.

-- Harjutus 2B: kategooriate muugianaluus HAVING klausliga
SELECT
    p.category AS kategooria,
    SUM(s.quantity) AS muuudud_kokku,
    ROUND(AVG(s.unit_price), 2) AS keskmine_hind,
    COUNT(DISTINCT p.product_id) AS toodete_arv
FROM products p
JOIN sales s
    ON p.product_id = s.product_id
GROUP BY p.category
HAVING SUM(s.quantity) > 50
ORDER BY muuudud_kokku DESC;

-- Vastus ekraanipildilt:
-- meeste_riided | 4121 uhikut | keskmine hind 189.73 | 81 toodet
-- jalanousid    | 3737 uhikut | keskmine hind 215.89 | 71 toodet
-- laste_riided  | 3686 uhikut | keskmine hind 85.11  | 68 toodet
-- naiste_riided | 3604 uhikut | keskmine hind 199.19 | 68 toodet
-- aksessuaarid  | 3231 uhikut | keskmine hind 124.40 | 62 toodet
-- Peamine jareldus: meeste riided muusid koige rohkem uhikuid,
-- aga jalanoudel oli nahtavatest kategooriatest koige korgem keskmine hind.

-- Harjutus 2C: WHERE ja HAVING koos
SELECT
    TO_CHAR(s.sale_date, 'YYYY-MM') AS kuu,
    COUNT(s.sale_id) AS tellimuste_arv,
    SUM(s.total_price) AS kogukaive,
    ROUND(AVG(s.total_price), 2) AS keskmine_tellimus
FROM sales s
WHERE s.sale_date >= '2024-01-01'
  AND s.sale_date < '2024-04-01'
GROUP BY TO_CHAR(s.sale_date, 'YYYY-MM')
HAVING SUM(s.total_price) > 5000
ORDER BY kuu;

-- Vastus ekraanipildilt:
-- 2024-01 | 312 tellimust | 85618.65 kaive | keskmine tellimus 274.42
-- 2024-02 | 334 tellimust | 90181.83 kaive | keskmine tellimus 270.01
-- 2024-03 | 412 tellimust | 109559.98 kaive | keskmine tellimus 265.92
-- Peamine jareldus: koik nahtavad esimese kvartali kuud
-- ulatusid ule 5000 euro HAVING piiri.

-- -----------------------------------------
-- OSA 3: CTE-D JA WINDOW FUNCTION-ID
-- -----------------------------------------

-- Harjutus 3A: kuu kaive ja kuudevaheline kasv
WITH kuu_myyk AS (
    SELECT
        DATE_TRUNC('month', sale_date) AS kuu,
        SUM(total_price) AS kaive
    FROM sales
    WHERE sale_date >= '2024-01-01'
    GROUP BY DATE_TRUNC('month', sale_date)
)
SELECT
    kuu,
    kaive,
    LAG(kaive) OVER (ORDER BY kuu) AS eelmine_kuu,
    kaive - LAG(kaive) OVER (ORDER BY kuu) AS kasv,
    ROUND(
        100.0 * (kaive - LAG(kaive) OVER (ORDER BY kuu))
        / LAG(kaive) OVER (ORDER BY kuu),
        1
    ) AS kasv_protsent
FROM kuu_myyk
ORDER BY kuu;

-- Tahelepanek:
-- Harjutuse 3A jaoks ei olnud tulemuse ekraanipilti,
-- seega siia ei lisatud kontrollitud vastuse kokkuvotet.

-- Harjutus 3B: kliendisegmentide analuus CTE abil
WITH kliendi_kokkuvote AS (
    SELECT
        c.customer_id,
        c.first_name || ' ' || c.last_name AS nimi,
        c.city,
        COUNT(s.sale_id) AS tellimuste_arv,
        SUM(s.total_price) AS kogukaive
    FROM customers c
    JOIN sales s
        ON c.customer_id = s.customer_id
    GROUP BY c.customer_id, c.first_name, c.last_name, c.city
),
segmendid AS (
    SELECT
        nimi,
        city,
        tellimuste_arv,
        kogukaive,
        CASE
            WHEN kogukaive > 1000 THEN 'VIP'
            WHEN kogukaive > 500 THEN 'Aktiivne'
            ELSE 'Tavaline'
        END AS segment
    FROM kliendi_kokkuvote
)
SELECT
    segment,
    COUNT(*) AS kliente,
    ROUND(AVG(kogukaive), 2) AS keskmine_kaive
FROM segmendid
GROUP BY segment
ORDER BY keskmine_kaive DESC;

-- Vastus ekraanipildilt:
-- VIP      | 936 klienti | keskmine kaive 1952.63
-- Aktiivne | 786 klienti | keskmine kaive 739.53
-- Tavaline | 829 klienti | keskmine kaive 257.90
-- Peamine jareldus: VIP oli suurim nahtav segment
-- ja selle keskmine kaive oli selgelt koige suurem.

-- Harjutus 3C: iga kategooria TOP 3 toodet muudud koguse jargi
WITH toote_myyk AS (
    SELECT
        p.category,
        p.product_name,
        SUM(s.quantity) AS muuudud_kogus,
        ROW_NUMBER() OVER (
            PARTITION BY p.category
            ORDER BY SUM(s.quantity) DESC
        ) AS koht
    FROM products p
    JOIN sales s
        ON p.product_id = s.product_id
    GROUP BY p.category, p.product_name
)
SELECT
    category,
    product_name,
    muuudud_kogus,
    koht
FROM toote_myyk
WHERE koht <= 3
ORDER BY category, koht;

-- Vastus ekraanipildilt, nahtavad read:
-- aksessuaarid:
--   1. Stiilne puust muts - 78
--   2. Praktiline nahkne sormus - 75
--   3. Boheemlaslik kangast kangasvoo - 70
-- jalanousid:
--   1. Moodne seemisnahkne oxfordid - 83
--   2. Ohuline synteetiline korge kontsaga kingad - 79
--   3. Minimalistlik seemisnahkne chelsea botased - 71
-- laste_riided:
--   1. Minimalistlik villane puhapaevakleit - 81
--   2. Luksuslik softshell komplekt - 80
--   3. Vintage villane puksid - 73
-- meeste_riided:
--   1. Elegantne flanellne cargo puksid - 73
--   2. Luksuslik puuvillane linane sark - 73
--   3. Praktiline puuvillane ylikond - 72
-- Peamine jareldus: paring reastas toodete TOP 3 edukalt kategooriate sees
-- ja toi valja iga kategooria koige enam muudud tooted.

-- -----------------------------------------
-- SYNTEES: CEO RAPORT
-- -----------------------------------------

-- TOP 5 linna kogukaibe jargi koos jarjestusega
WITH linna_myyk AS (
    SELECT
        c.city AS linn,
        COUNT(DISTINCT s.sale_id) AS tellimusi,
        SUM(s.total_price) AS kogukaive,
        ROUND(AVG(s.total_price), 2) AS keskmine_tellimus
    FROM customers c
    JOIN sales s
        ON c.customer_id = s.customer_id
    WHERE s.sale_date >= '2024-01-01'
    GROUP BY c.city
    HAVING COUNT(DISTINCT s.sale_id) > 5
),
linna_jarjestus AS (
    SELECT
        linn,
        tellimusi,
        kogukaive,
        keskmine_tellimus,
        ROW_NUMBER() OVER (ORDER BY kogukaive DESC) AS koht
    FROM linna_myyk
)
SELECT *
FROM linna_jarjestus
WHERE koht <= 5
ORDER BY koht;

-- Vastus ekraanipildilt:
-- 1. Tallinn  | 2062 tellimust | 571649.39 kaive | keskmine tellimus 277.23
-- 2. Tartu    | 1011 tellimust | 292500.31 kaive | keskmine tellimus 289.32
-- 3. Parnu    | 755 tellimust  | 226008.72 kaive | keskmine tellimus 299.35
-- 4. Narva    | 233 tellimust  | 67458.67 kaive  | keskmine tellimus 289.52
-- 5. Viljandi | 215 tellimust  | 60339.62 kaive  | keskmine tellimus 280.65
-- Peamine jareldus: Tallinn oli selge liider kogukaibe poolest.

-- -----------------------------------------
-- TEADMISTE KONTROLL - KUSIMUS 10
-- TOP 3 kategooriat kogumuugi jargi
-- -----------------------------------------

SELECT
    p.category,
    SUM(s.quantity * s.unit_price) AS kogumuuk
FROM products p
JOIN sales s
    ON p.product_id = s.product_id
GROUP BY p.category
ORDER BY kogumuuk DESC
LIMIT 3;

-- Vastus ekraanipildilt:
-- 1. jalanousid    - 807385.21
-- 2. meeste_riided - 785356.73
-- 3. naiste_riided - 712176.92
-- Peamine jareldus: jalanoud genereerisid koige suurema kogumuugi.
