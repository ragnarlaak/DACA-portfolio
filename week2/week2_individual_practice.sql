-- These exercises are for practicing data cleaning

-- Leia duplikaatsed sale_id väärtused
SELECT
    sale_id,
    COUNT(*) AS koopiate_arv
FROM sales
GROUP BY sale_id
HAVING COUNT(*) > 1
ORDER BY koopiate_arv DESC;
-- Vastuseks tuli success, mitte midagi abnormaalset

-- Loendan koik veerud, et naha, kas koik sale_id-d on unikaalsed
SELECT 
    COUNT(*) AS total_rows,
    COUNT(DISTINCT sale_id) AS unique_sale_ids
FROM sales;
-- Seega on kõik sale_id väärtused unikaalsed

-- Anna igale reale number oma grupi sees
SELECT
    sale_id,
    customer_id,
    total_price,
    sale_date,
    ROW_NUMBER() OVER (PARTITION BY sale_id ORDER BY sale_date) AS rn
FROM sales;

-- Leia kõik duplikaatsed sale_id väärtused sales tabelis
SELECT
    sale_id,
    COUNT(*) AS koopiate_arv
FROM sales
GROUP BY sale_id
HAVING COUNT(*) > 1
ORDER BY koopiate_arv DESC
LIMIT 10;
-- Duplikaadid puuduvad

-- Duplikaatide mõju müüginumbritele
SELECT
    COUNT(*) AS ridu_kokku,
    COUNT(DISTINCT sale_id) AS unikaalseid,
    COUNT(*) - COUNT(DISTINCT sale_id) AS duplikaate,
    SUM(total_price) AS summa_duplikaatidega,
    (SELECT SUM(total_price) FROM (
        SELECT DISTINCT ON (sale_id) total_price
        FROM sales
        ORDER BY sale_id, sale_date
    ) unikaalsed) AS summa_ilma_duplikaatideta
FROM sales;
-- Kontrolli tulemusel selgus, et sales tabelis ei ole korduvaid sale_id väärtusi. Seega ei mõjuta sale_id duplikaadid müüginumbreid ega kogusummasid.

-- Leia, kas customers tabelis on dublikaate
SELECT
    customer_id,
    COUNT(*) AS koopiate_arv
FROM customers
GROUP BY customer_id
HAVING COUNT(*) > 1
ORDER BY koopiate_arv DESC;
-- Puuduvad


--Leia tellimused, kus klient on teadmata
SELECT sale_id, customer_id, total_price
FROM sales
WHERE customer_id IS NULL;

--Leia kliendid, kellel ON e-mail olemas
SELECT customer_id, first_name, email
FROM customers
WHERE email IS NOT NULL;

--Asenda puudub kliendi nimi vaikevaartusega
SELECT
    customer_id,
    COALESCE(first_name, 'Tundmatu') AS eesnimi,
    COALESCE(email, 'puudub@urbanstyle.ee') AS email
FROM customers;

--Mitu asendvaartust (valib esimese mitte-NULL vaartuse)
SELECT COALESCE(NULL, NULL, 'Kolmas valik');
--Tulemus: 'Kolmas valik'

-- Nullif vordleb kahte vaartust. Kui need on vordsed, tagastab NULL;
-- NULLIF(a, b): kui a = b, tagastab NULL; muidu tagastab a
SELECT NULLIF(100, 100);
SELECT NULLIF(100, 200);

-- Muuda 0-hinnaga tooted NULL-iks (hind pole tegeleikult 0, vaid puudub)
select
    product_id,
    product_name,
    NULLIF(price, 0) AS puhas_hind
FROM products;

-- OHTLIK : Iga aritmeetiline operatsioon NULL-ga annab NULL
/*SELECT 100 + NULL;     -- Tulemus: NULL
SELECT NULL * 5;       -- Tulemus: NULL
SELECT SUM(total_price) FROM sales;  -- SUM ignoreerib NULL-e!*/

--"Üks NULL vale koha peal ja kogu aruanne näitab vale tulemuse. Seetõttu kontrollime NULL-e ENNE igasugust analüüsi."

-- NULL-ide ülevaade customers tabelis
SELECT
    COUNT(*) AS kliente_kokku,
    COUNT(first_name) AS eesnimi_olemas,
    COUNT(*) - COUNT(first_name) AS eesnimi_puudub,
    COUNT(email) AS email_olemas,
    COUNT(*) - COUNT(email) AS email_puudub,
    COUNT(phone) AS telefon_olemas,
    COUNT(*) - COUNT(phone) AS telefon_puudub
FROM customers;

-- Kliendid, kellel puudub nimi voi email
SELECT customer_id, first_name, last_name, email, city
FROM customers
WHERE first_name IS null
    OR last_name is null
    OR email is null
ORDER BY customer_id
LIMIT 15;



--Liis Koppel tahab näha kõiki kliente, aga tühjade nimede asemel peaks kuvama "Tundmatu klient". Kirjuta päring, mis kasutab COALESCE funktsiooni.

SELECT customer_id,
    COALESCE(first_name, 'Tundmatu') AS eesnimi,
    COALESCE(last_name, 'Tundmatu') AS perekonnanimi,
    COALESCE(email, 'Tundmatu') AS email,
    COALESCE(phone, 'Tundmatu') AS phone
FROM customers;

-- Mitu klienti vajab COALESCE asendusväärtust?
SELECT COUNT(*) AS vajavad_coalesce
FROM customers
WHERE first_name IS NULL
   OR last_name IS NULL
   OR email IS NULL
   OR phone IS NULL;


--ANDMEFORMAADID ja TYYPKONVERSIOONID

--Kaks viisi tyybi muutmiseks
-- CAST süntaks (standardne SQL)
SELECT CAST('125.50' AS NUMERIC);  -- Tekst -> number
SELECT CAST('2024-01-15' AS DATE); -- Tekst -> kuupäev

-- :: süntaks (PostgreSQL-i kiirviis)
SELECT '125.50'::NUMERIC;          -- Sama tulemus
SELECT '2024-01-15'::DATE;        -- Sama tulemus

--TO_CHAR() muudab kuupaeva tekstiformaati
-- Kuupäev erinevates formaatides
SELECT
    sale_date,
    TO_CHAR(sale_date, 'DD.MM.YYYY') AS eesti_formaat,
    TO_CHAR(sale_date, 'YYYY-MM-DD') AS iso_formaat,
    TO_CHAR(sale_date, 'DD. Month YYYY') AS pikk_formaat
FROM sales
LIMIT 5;

--TO_DATE() muudab teksti kuupaevaks
-- Tekst -> kuupäev (pead ütlema, millises formaadis tekst on)
SELECT TO_DATE('15/03/2024', 'DD/MM/YYYY');  -- Tulemus: 2024-03-15
SELECT TO_DATE('2024-01-15', 'YYYY-MM-DD');  -- Tulemus: 2024-01-15

--Tekstifunktsioonid - TRIM(), UPPER(), LOWER()
--TRIM() eemaldab tyhikud teksti algusest ja lopust
SELECT TRIM('  Tallinn  ');  -- Tulemus: 'Tallinn'
SELECT TRIM('  ');           -- Tulemus: '' (tühi string)
--UPPER() ja LOWER() muudavad teksti suurtahtedeks ja vaiketahtedeks
SELECT UPPER('tallinn');   -- Tulemus: 'TALLINN'
SELECT LOWER('TALLINN');   -- Tulemus: 'tallinn'

-- Kuupäevade formateerimine UrbanStyle'i andmetes
SELECT
    sale_id,
    sale_date,
    TO_CHAR(sale_date, 'DD.MM.YYYY') AS eesti_kuupaev,
    TO_CHAR(sale_date, 'Day') AS nadalapäev,
    TO_CHAR(sale_date, 'YYYY-"Q"Q') AS kvartal,
    EXTRACT(DOW FROM sale_date) AS paev_nr
FROM sales
ORDER BY sale_date DESC
LIMIT 10;

-- Linnade ühtlustamise diagnostika
SELECT
    city AS originaal,
    TRIM(city) AS trimitud,
    INITCAP(TRIM(city)) AS puhastatud,
    COUNT(*) AS kliente
FROM customers
GROUP BY city
ORDER BY city;

-- Kontrolli hinnaveeru tüüpi ja väärtusi
SELECT
    product_id,
    product_name,
    price,
    CASE
        WHEN price IS NULL THEN 'NULL'
        WHEN price = 0 THEN 'NULL (0 = puudub?)'
        WHEN price < 0 THEN 'NEGATIIVNE!'
        ELSE 'OK'
    END AS hinna_staatus
FROM products
WHERE price IS NULL OR price <= 0
ORDER BY price;