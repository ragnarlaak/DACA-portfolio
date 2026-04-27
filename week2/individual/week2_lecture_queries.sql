-- Nadal 2 loenguparingud

-- Mitu rida on muugitabelis sales praegu? 15 234
SELECT COUNT(*) AS ridade_arv
FROM sales;

-- Testtabeliga toimetamine

-- Vaata uhte naidisrida olemasolevast test_sales tabelist
SELECT * FROM test_sales LIMIT 1;

-- Kustuta vana testtabel, et saaks selle uuesti puhtalt luua
DROP TABLE test_sales;

-- Loo uus testtabel sales tabeli pohjal
CREATE TABLE test_sales AS
SELECT * FROM sales;

-- Kontrolli, mitu rida test_sales tabelis on
SELECT COUNT(*) FROM test_sales;

-- Kustuta read test_sales tabelist vastavalt tingimusele
DELETE FROM test_sales
WHERE ...;

-- Kustuta test_sales tabelist read, kus poe asukoht on Tartu
DELETE FROM test_sales
WHERE store_location = 'Tartu';

-- Vaata enne kustutamist, millised read vastavad tingimusele
SELECT *
FROM test_sales
WHERE store_location = 'Tartu'
LIMIT 100;

-- TURVALINE! Muudab ainult NULL vaartusi
UPDATE test_sales
SET customer_id = 0
WHERE customer_id IS NULL;

-- OHTLIK! Muudab KOKIK read!
-- ARA KAIVITA SEDA!
-- UPDATE sales
-- SET customer_id = 0;

-- TURVALINE! Muudab ainult NULL vaartusi
UPDATE test_sales
SET customer_id = 0
WHERE customer_id IS NULL;

-- Vaata read, kus customer_id on NULL
SELECT *
FROM test_sales
WHERE customer_id IS NULL
LIMIT 10;

-- Loo testkoopia customers_test
CREATE TABLE customers_test AS
SELECT * FROM customers;

-- Kontrolli: kas arvud on samad?
SELECT COUNT(*) FROM customers_test;
SELECT COUNT(*) FROM customers;

-- Samm 1: leia duplikaatsed invoice_id vaartused
SELECT invoice_id, COUNT(*) AS koopiate_arv
FROM test_sales
GROUP BY invoice_id
HAVING COUNT(*) > 1
ORDER BY koopiate_arv DESC
LIMIT 10;

-- Samm 2: mitu rida on duplikaadid?
-- NB: kasutame id ehk PK, mitte sale_id, sest duplikaatidel on sama sale_id
SELECT COUNT(*) AS duplikaat_read
FROM test_sales
WHERE id NOT IN (
    SELECT MIN(id)
    FROM test_sales
    GROUP BY invoice_id
);

-- Samm 2.5: kontrolli uhte konkreetset duplikaatset invoice_id naidet
SELECT *
FROM test_sales
WHERE invoice_id = 'INV-202301-00005'
LIMIT 5;

-- Samm 3: enne kustutamist kirjuta ules ridade arv
SELECT COUNT(*) AS enne
FROM test_sales;

-- Samm 4: kustuta duplikaadid
DELETE FROM test_sales
WHERE id NOT IN (
    SELECT MIN(id)
    FROM test_sales
    GROUP BY invoice_id
);

-- Samm 5: kontrolli ridade arvu parast kustutamist
SELECT COUNT(*) AS parast
FROM test_sales;

-- COALESCE valib esimese mitte-NULL vaartuse
SELECT COALESCE(NULL, 'Vaikevaartus');
-- Tulemus: 'Vaikevaartus'

SELECT COALESCE('Olemas', 'Vaikevaartus');
-- Tulemus: 'Olemas'

-- Praktiline kasutus: asenda NULL customer_id
UPDATE test_sales
SET customer_id = 0
WHERE customer_id IS NULL;

-- Kontroll: 0 NULL vaartust
SELECT COUNT(*)
FROM test_sales
WHERE customer_id IS NULL;

-- Naita invoice_id ja sale_date ning vordle customer_id algset vaartust
-- COALESCE(customer_id, 0) kuvab NULL asemel 0
SELECT invoice_id, sale_date, COALESCE(customer_id, 0), customer_id
FROM test_sales
LIMIT 50;

-- Valideeri kuupaevad
SELECT sale_id, sale_date,
    CASE
        WHEN sale_date > CURRENT_DATE
            THEN 'TULEVIKUS!'
        WHEN sale_date < '2020-01-01'
            THEN 'LIIGA VANA'
        ELSE 'OK'
    END AS kuupaeva_staatus
FROM test_sales
WHERE sale_date > CURRENT_DATE
   OR sale_date < '2020-01-01';

-- CASE WHEN uldine loogika:
-- kui tingimus1 on toene, siis tagasta tulemus1
-- kui tingimus2 on toene, siis tagasta tulemus2
-- muul juhul tagasta vaikimisi_tulemus
CASE
    WHEN tingimus1 THEN tulemus1
    WHEN tingimus2 THEN tulemus2
    ELSE vaikimisi_tulemus
END;

-- Valideeri kuupaevad
SELECT sale_id, sale_date,
    CASE
        WHEN sale_date > CURRENT_DATE THEN 'TULEVIKUS!'
        WHEN sale_date < '2020-01-01' THEN 'LIIGA VANA'
        ELSE 'OK'
    END AS kuupaeva_staatus
FROM test_sales
WHERE sale_date > CURRENT_DATE
   OR sale_date < '2020-01-01';

-- Leia sales_test tabeli koige varasem sale_date vaartus
SELECT MIN(sale_date)
FROM sales_test;

SELECT COUNT(*) FROM sales;
