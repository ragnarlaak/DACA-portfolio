-- Grupiprojekt

-- Loo uus testtabel.
DROP TABLE IF EXISTS test_customers;

CREATE TABLE test_customers AS
SELECT
    *
FROM customers;

-- Kontrolli ridade arvu customers testkoopias.
SELECT
    COUNT(*) AS ridade_arv
FROM test_customers;

-- Leia duplikaatsed e-mailid
SELECT
    email,
    COUNT(*) AS koopiate_arv
FROM test_customers
WHERE email IS NOT NULL
GROUP BY email
HAVING COUNT(*) > 1
ORDER BY koopiate_arv DESC;

-- Leia puuduvad nimed
SELECT
    COUNT(*) FILTER (
        WHERE first_name IS NULL OR first_name = ''
    ) AS null_eesnimi,
    COUNT(*) FILTER (
        WHERE last_name IS NULL OR last_name = ''
    ) AS null_perenimi
FROM test_customers;
-- 0 NULL eesnime ja 0 NULL perenime

-- Kontrolli linnade nimekujusid, kas on ebajaarjekindlusi
SELECT
    city,
    COUNT(*) AS arv
FROM test_customers
GROUP BY city
ORDER BY city;
-- Tulemus:
-- Jah, on kull.

-- Leia, mitu variatsiooni on igal linnal
SELECT
    INITCAP(TRIM(city)) AS puhas_linn,
    COUNT(DISTINCT city) AS erinevaid_kujusi
FROM test_customers
WHERE city IS NOT NULL
GROUP BY INITCAP(TRIM(city))
ORDER BY erinevaid_kujusi DESC, puhas_linn;
-- Tulemused:
-- Kuressaare = 5 erinevat nimekuju
-- Paide = 5 erinevat nimekuju
-- Parnu = 5 erinevat nimekuju
-- Rakvere = 5 erinevat nimekuju
-- Tallinn = 5 erinevat nimekuju
-- Tartu = 5 erinevat nimekuju
-- Viljandi = 5 erinevat nimekuju
-- Voru = 5 erinevat nimekuju
-- Haapsalu = 4 erinevat nimekuju
-- Johvi = 4 erinevat nimekuju
-- Narva = 4 erinevat nimekuju
-- Valga = 2 erinevat nimekuju

-- Kontrolli kontaktandmeid, puuduvad telefoninumbrid ja e-mailid
SELECT
    COUNT(*) FILTER (WHERE phone IS NULL OR phone = '') AS null_telefon,
    COUNT(*) FILTER (WHERE email IS NULL OR email = '') AS null_email
FROM test_customers;
-- Tulemus:
-- Puuduvaid telefoninumbreid = 0
-- Puuduvaid e-maile = 380

-- Leia duplikaatsed e-mailid, ara arvesta NULL e-maile
SELECT
    email,
    COUNT(*) AS koopiate_arv
FROM test_customers
WHERE email IS NOT NULL
GROUP BY email
HAVING COUNT(*) > 1
ORDER BY koopiate_arv DESC;

-- Mitu erinevat duplikaatset e-maili on?
SELECT
    COUNT(*) AS duplikaatseid_emaile
FROM (
    SELECT email
    FROM test_customers
    WHERE email IS NOT NULL
    GROUP BY email
    HAVING COUNT(*) > 1
) t;

-- Puhastamisraporti kokkuvote:
-- Duplikaatsed e-mailid = 128
-- NULL eesnimi = 0
-- NULL perenimi = 0
-- Ebajaarjekindlad linnanimed = 12 linna
-- NULL telefon = 0
-- NULL e-mail = 380
-- KOKKU probleeme = 520

-- Koige rohkem mojutas igapaevast tood puuduv e-mail,
-- sest see raskendab kliendiga uhenduse votmist.
