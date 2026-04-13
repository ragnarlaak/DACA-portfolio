--Group project

--Loo uus testtabel
CREATE TABLE test_customers AS
SELECT * FROM customers;

DROP TABLE test_customers;

SELECT COUNT(*) AS ridade_arv FROM test_customers; --15234 rida

-- Leia duplikaatsed e-mailid:
SELECT email, COUNT(*) AS koopiate_arv
  FROM test_customers
  GROUP BY email
  HAVING COUNT(*) > 1
  ORDER BY koopiate_arv DESC;
-- 380 dublikaatset emaili

-- Leia puuduvad nimed
select
  COUNT(*) FILTER (WHERE first_name IS NULL OR first_name = '') AS null_eesnimi,
  COUNT(*) FILTER (WHERE last_name IS NULL OR last_name = '') AS null_perenimi
FROM customers_test;
-- 0 NULL eesnime ja 0 NULL perenime

-- Kontrolli linnade nimekujusid - kas on ebajarjekindlusi?
SELECT city, COUNT(*) AS arv
FROM customers_test
GROUP BY city
ORDER BY city;
-- Tulemus:
-- Jah on kyll.

-- Leia, mitu variatsiooni on igal linnal
SELECT INITCAP(TRIM(city)) AS puhas_linn,
       COUNT(DISTINCT city) AS erinevaid_kujusi
FROM test_customers
WHERE city IS NOT NULL
GROUP BY INITCAP(TRIM(city))
ORDER BY erinevaid_kujusi DESC, puhas_linn;
-- Tulemused:
-- Kuressaare = 5 erinevat nimekuju
-- Paide = 5 erinevat nimekuju
-- Pärnu = 5 erinevat nimekuju
-- Rakvere = 5 erinevat nimekuju
-- Tallinn = 5 erinevat nimekuju
-- Tartu = 5 erinevat nimekuju
-- Viljandi = 5 erinevat nimekuju
-- Võru = 5 erinevat nimekuju
-- Haapsalu = 4 erinevat nimekuju
-- Jõhvi = 4 erinevat nimekuju
-- Narva = 4 erinevat nimekuju
-- Valga = 2 erinevat nimekuju

-- Kontrolli kontaktandmeid — puuduvad telefoninumbrid ja e-mailid:
SELECT
    COUNT(*) FILTER (WHERE phone IS NULL OR phone = '') AS null_telefon,
    COUNT(*) FILTER (WHERE email IS NULL OR email = '') AS null_email
FROM test_customers;
-- Tulemus:
-- Puuduvaid telefoninumbreid = 0
-- Puuduvaid e-maile = 380

--Leia duplikaatsed e-mailid (ära arvesta NULL e-maile)
SELECT email, COUNT(*) AS koopiate_arv
FROM customers_test
WHERE email IS NOT NULL
GROUP BY email
HAVING COUNT(*) > 1
ORDER BY koopiate_arv DESC;

---- Mitu erinevat duplikaatset e-maili on?
SELECT COUNT(*) AS duplikaatseid_emaile
FROM (
    SELECT email
    FROM customers_test
    WHERE email IS NOT NULL
    GROUP BY email
    HAVING COUNT(*) > 1
) t;


-- Puhastamisraporti kokkuvõte:
-- Duplikaatsed e-mailid = 128
-- NULL eesnimi = 0
-- NULL perenimi = 0
-- Ebajärjekindlad linnanimed = 12 linna
-- NULL telefon = 0
-- NULL e-mail = 380
-- KOKKU probleeme = 520

-- Kõige rohkem mõjutab igapäevast tööd puuduv e-mail,
-- sest see raskendab kliendiga ühenduse võtmist.