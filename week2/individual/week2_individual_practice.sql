-- Need harjutused on andmete puhastamise harjutamiseks

-- Leia duplikaatsed sale_id vaartused
SELECT
    sale_id,
    COUNT(*) AS koopiate_arv
FROM sales
GROUP BY sale_id
HAVING COUNT(*) > 1
ORDER BY koopiate_arv DESC;
-- Vastuseks tuli success, midagi ebanormaalset ei olnud

-- Loendan koik read, et naha, kas koik sale_id-d on unikaalsed
SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT sale_id) AS unique_sale_ids
FROM sales;
-- Seega on koik sale_id vaartused unikaalsed

-- Anna igale reale number oma grupi sees
SELECT
    sale_id,
    customer_id,
    total_price,
    sale_date,
    ROW_NUMBER() OVER (PARTITION BY sale_id ORDER BY sale_date) AS rn
FROM sales;

-- Leia koik duplikaatsed sale_id vaartused sales tabelis
SELECT
    sale_id,
    COUNT(*) AS koopiate_arv
FROM sales
GROUP BY sale_id
HAVING COUNT(*) > 1
ORDER BY koopiate_arv DESC
LIMIT 10;
-- Duplikaadid puuduvad

-- Duplikaatide moju muuginumbritele
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
-- Kontrolli tulemusel selgus, et sales tabelis ei ole korduvaid sale_id vaartusi.
-- Seega ei mojuta sale_id duplikaadid muuginumbreid ega kogusummasid.

-- Leia, kas customers tabelis on duplikaate
SELECT
    customer_id,
    COUNT(*) AS koopiate_arv
FROM customers
GROUP BY customer_id
HAVING COUNT(*) > 1
ORDER BY koopiate_arv DESC;
-- Puuduvad

-- Leia tellimused, kus klient on teadmata
SELECT sale_id, customer_id, total_price
FROM sales
WHERE customer_id IS NULL;

-- Leia kliendid, kellel on e-mail olemas
SELECT customer_id, first_name, email
FROM customers
WHERE email IS NOT NULL;

-- Asenda puuduv kliendi nimi vaikevaartusega
SELECT
    customer_id,
    COALESCE(first_name, 'Tundmatu') AS eesnimi,
    COALESCE(email, 'puudub@urbanstyle.ee') AS email
FROM customers;

-- Mitu asendusvaartust, valitakse esimene mitte-NULL vaartus
SELECT COALESCE(NULL, NULL, 'Kolmas valik');
-- Tulemus: 'Kolmas valik'

-- NULLIF vordleb kahte vaartust. Kui need on vordsed, tagastab NULL.
-- NULLIF(a, b): kui a = b, tagastab NULL, muidu tagastab a
SELECT NULLIF(100, 100);
SELECT NULLIF(100, 200);

-- Muuda 0-hinnaga tooted NULL-iks, kui hind tegelikult puudub
SELECT
    product_id,
    product_name,
    NULLIF(price, 0) AS puhas_hind
FROM products;

-- OHTLIK: iga aritmeetiline operatsioon NULL-ga annab NULL
/*SELECT 100 + NULL;     -- Tulemus: NULL
SELECT NULL * 5;       -- Tulemus: NULL
SELECT SUM(total_price) FROM sales;  -- SUM ignoreerib NULL-e!*/

-- Uks NULL vales kohas ja kogu aruanne naitab valet tulemust.
-- Seetottu kontrollime NULL-e enne igasugust analyysi.

-- NULL-ide ulevaade customers tabelis
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
WHERE first_name IS NULL
    OR last_name IS NULL
    OR email IS NULL
ORDER BY customer_id
LIMIT 15;

-- Liis Koppel tahab naha koiki kliente, aga tuhjade nimede asemel
-- peaks kuvama "Tundmatu klient". Kasutan COALESCE funktsiooni.
SELECT customer_id,
    COALESCE(first_name, 'Tundmatu') AS eesnimi,
    COALESCE(last_name, 'Tundmatu') AS perekonnanimi,
    COALESCE(email, 'Tundmatu') AS email,
    COALESCE(phone, 'Tundmatu') AS phone
FROM customers;

-- Mitu klienti vajab COALESCE asendusvaartust?
SELECT COUNT(*) AS vajavad_coalesce
FROM customers
WHERE first_name IS NULL
   OR last_name IS NULL
   OR email IS NULL
   OR phone IS NULL;

-- Andmeformaadid ja tuubikonversioonid

-- Kaks viisi tuubi muutmiseks
-- CAST syntaks, standardne SQL
SELECT CAST('125.50' AS NUMERIC);  -- Tekst -> number
SELECT CAST('2024-01-15' AS DATE); -- Tekst -> kuupaev

-- :: syntaks, PostgreSQL-i kiirviis
SELECT '125.50'::NUMERIC;          -- Sama tulemus
SELECT '2024-01-15'::DATE;        -- Sama tulemus

-- TO_CHAR() muudab kuupaeva tekstiformaati
-- Kuupaev erinevates formaatides
SELECT
    sale_date,
    TO_CHAR(sale_date, 'DD.MM.YYYY') AS eesti_formaat,
    TO_CHAR(sale_date, 'YYYY-MM-DD') AS iso_formaat,
    TO_CHAR(sale_date, 'DD. Month YYYY') AS pikk_formaat
FROM sales
LIMIT 5;

-- TO_DATE() muudab teksti kuupaevaks
-- Tekst -> kuupaev, pead utlema millises formaadis tekst on
SELECT TO_DATE('15/03/2024', 'DD/MM/YYYY');  -- Tulemus: 2024-03-15
SELECT TO_DATE('2024-01-15', 'YYYY-MM-DD');  -- Tulemus: 2024-01-15

-- Tekstifunktsioonid: TRIM(), UPPER(), LOWER()
-- TRIM() eemaldab tuhikud teksti algusest ja lopust
SELECT TRIM('  Tallinn  ');  -- Tulemus: 'Tallinn'
SELECT TRIM('  ');           -- Tulemus: '' ehk tuhi string
-- UPPER() ja LOWER() muudavad teksti suurtahteks ja vaiketahteks
SELECT UPPER('tallinn');   -- Tulemus: 'TALLINN'
SELECT LOWER('TALLINN');   -- Tulemus: 'tallinn'

-- Kuupaevade vormindamine UrbanStyle andmetes
SELECT
    sale_id,
    sale_date,
    TO_CHAR(sale_date, 'DD.MM.YYYY') AS eesti_kuupaev,
    TO_CHAR(sale_date, 'Day') AS nadalapaev,
    TO_CHAR(sale_date, 'YYYY-"Q"Q') AS kvartal,
    EXTRACT(DOW FROM sale_date) AS paev_nr
FROM sales
ORDER BY sale_date DESC
LIMIT 10;

-- Linnade uhtlustamise diagnostika
SELECT
    city AS originaal,
    TRIM(city) AS trimitud,
    INITCAP(TRIM(city)) AS puhastatud,
    COUNT(*) AS kliente
FROM customers
GROUP BY city
ORDER BY city;

-- Kontrolli hinnaveeru tuupi ja vaartusi
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
