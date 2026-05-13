SELECT
    COUNT(*)
FROM web_logs;

SELECT
    *
FROM web_logs
LIMIT 5;

SELECT
    *
FROM sales
LIMIT 5;

SELECT
    *
FROM customers
LIMIT 5;

-- Roll D, samm 1: turunduskanalite kokkuvote
-- Eesmark: uhendada sales, customers ja web_logs uheks kanalitaseme kokkuvotteks
WITH customer_source AS (
    -- Vii web_logs uhe allikani kliendi kohta
    -- Nii valtime topeltmuugiread juhul, kui kliendil on palju veebikuilastusi
    SELECT
        customer_id,
        MIN(source) AS source
    FROM web_logs
    WHERE customer_id IS NOT NULL
    GROUP BY customer_id
)
SELECT
    -- Turunduskanal ehk liikluse allikas
    cs.source AS turunduskanal,
    -- Unikaalsed kliendid
    COUNT(DISTINCT c.customer_id) AS kliente,
    -- Unikaalsed tellimused
    COUNT(DISTINCT s.sale_id) AS tellimusi,
    -- Kogukaive
    SUM(s.total_price) AS kogukaive,
    -- Keskmine tellimuse vaartus
    ROUND(AVG(s.total_price), 2) AS keskmine_tellimus
FROM sales s
JOIN customers c
    ON s.customer_id = c.customer_id
LEFT JOIN customer_source cs
    ON c.customer_id = cs.customer_id
GROUP BY cs.source
ORDER BY kogukaive DESC;

-- Roll D, samm 1: turunduskanalite kokkuvote
-- Normaliseeritud versioon kanalite uhtlustamisega
WITH customer_source AS (
    -- Vii web_logs uhe allikani kliendi kohta
    -- Uhtlusta erinevad allikanimed uhtseteks kanali gruppideks
    SELECT
        customer_id,
        MIN(
            CASE
                WHEN LOWER(source) IN ('google', 'google_ads') THEN 'google'
                WHEN LOWER(source) IN ('google organic', 'google_organic', 'google_organic ') THEN 'google_organic'
                WHEN LOWER(source) IN ('facebook', 'facebook ads', 'facebook_ads', 'fb', 'fb_ads') THEN 'facebook'
                WHEN LOWER(source) IN ('instagram', 'ig', 'ig_ads') THEN 'instagram'
                WHEN LOWER(source) = 'tiktok' THEN 'tiktok'
                WHEN LOWER(source) = 'email_campaign' THEN 'email_campaign'
                WHEN LOWER(source) = 'direct' THEN 'direct'
                ELSE LOWER(source)
            END
        ) AS source
    FROM web_logs
    WHERE customer_id IS NOT NULL
    GROUP BY customer_id
)
SELECT
    cs.source AS turunduskanal,
    COUNT(DISTINCT c.customer_id) AS kliente,
    COUNT(DISTINCT s.sale_id) AS tellimusi,
    SUM(s.total_price) AS kogukaive,
    ROUND(AVG(s.total_price), 2) AS keskmine_tellimus
FROM sales s
JOIN customers c
    ON s.customer_id = c.customer_id
LEFT JOIN customer_source cs
    ON c.customer_id = cs.customer_id
GROUP BY cs.source
ORDER BY kogukaive DESC;

-- Roll D, samm 2: kanali tohusus CTE-dega
-- Arvutab turunduskanali kaive kliendi kohta
WITH customer_source AS (
    SELECT
        customer_id,
        MIN(
            CASE
                WHEN LOWER(source) IN ('google', 'google_ads') THEN 'google'
                WHEN LOWER(source) IN ('google organic', 'google_organic') THEN 'google_organic'
                WHEN LOWER(source) IN ('facebook', 'facebook ads', 'facebook_ads', 'fb', 'fb_ads') THEN 'facebook'
                WHEN LOWER(source) IN ('instagram', 'ig', 'ig_ads') THEN 'instagram'
                WHEN LOWER(source) = 'tiktok' THEN 'tiktok'
                WHEN LOWER(source) = 'email_campaign' THEN 'email_campaign'
                WHEN LOWER(source) = 'direct' THEN 'direct'
                ELSE LOWER(source)
            END
        ) AS source
    FROM web_logs
    WHERE customer_id IS NOT NULL
    GROUP BY customer_id
),
channel_sales AS (
    SELECT
        cs.source AS turunduskanal,
        SUM(s.total_price) AS kogukaive,
        COUNT(DISTINCT s.sale_id) AS tellimusi,
        ROUND(AVG(s.total_price), 2) AS keskmine_tellimus
    FROM sales s
    JOIN customers c
        ON s.customer_id = c.customer_id
    LEFT JOIN customer_source cs
        ON c.customer_id = cs.customer_id
    GROUP BY cs.source
),
channel_customers AS (
    SELECT
        cs.source AS turunduskanal,
        COUNT(DISTINCT c.customer_id) AS kliente
    FROM customers c
    LEFT JOIN customer_source cs
        ON c.customer_id = cs.customer_id
    GROUP BY cs.source
)
SELECT
    s.turunduskanal,
    c.kliente,
    s.tellimusi,
    s.kogukaive,
    s.keskmine_tellimus,
    ROUND(s.kogukaive / NULLIF(c.kliente, 0), 2) AS kaive_kliendi_kohta
FROM channel_sales s
JOIN channel_customers c
    ON s.turunduskanal IS NOT DISTINCT FROM c.turunduskanal
WHERE s.kogukaive > 20000
ORDER BY kaive_kliendi_kohta DESC;

-- Roll D, samm 3: kuupohised kampaaniatrendid
-- Naitab kaivet ja unikaalseid kliente kanali ja kuu kaupa
WITH customer_source AS (
    -- Uks puhastatud allikas iga kliendi kohta
    SELECT
        customer_id,
        MIN(
            CASE
                WHEN LOWER(source) IN ('google', 'google_ads') THEN 'google'
                WHEN LOWER(source) IN ('google organic', 'google_organic') THEN 'google_organic'
                WHEN LOWER(source) IN ('facebook', 'facebook ads', 'facebook_ads', 'fb', 'fb_ads') THEN 'facebook'
                WHEN LOWER(source) IN ('instagram', 'ig', 'ig_ads') THEN 'instagram'
                WHEN LOWER(source) = 'tiktok' THEN 'tiktok'
                WHEN LOWER(source) = 'email_campaign' THEN 'email_campaign'
                WHEN LOWER(source) = 'direct' THEN 'direct'
                ELSE LOWER(source)
            END
        ) AS source
    FROM web_logs
    WHERE customer_id IS NOT NULL
    GROUP BY customer_id
)
SELECT
    cs.source AS turunduskanal,
    DATE_TRUNC('month', s.sale_date) AS kuu,
    COUNT(DISTINCT c.customer_id) AS kliente,
    SUM(s.total_price) AS kogukaive
FROM sales s
JOIN customers c
    ON s.customer_id = c.customer_id
LEFT JOIN customer_source cs
    ON c.customer_id = cs.customer_id
GROUP BY cs.source, DATE_TRUNC('month', s.sale_date)
HAVING SUM(s.total_price) > 20000
ORDER BY kuu, kogukaive DESC;

-- Tulemused / vastused:
-- 1. Direct oli kogumahu jargi tugevaim kanal:
--    1,079,910.51 eurot kaivet, 3,864 tellimust, 1,173 klienti.
--
-- 2. Facebook oli kaibe-kliendi-kohta mootes koige tohusam kanal:
--    1,052.81 eurot kliendi kohta.
--
-- 3. Email campaign oli samuti vaga tugev:
--    482,552.82 eurot kaivet, 1,622 tellimust, 1,003.23 eurot kliendi kohta.
--
-- 4. Google ja google_organic koos toid ule 405,000 euro kaivet,
--    kuid jaid nii mahult kui tohususelt Facebookist ja email_campaignist maha.
--
-- 5. Osa muuke jai NULL kategooriasse,
--    mis tahendab, et koiki kliente voi tellimusi ei saanud kindla turundusallikaga siduda.
