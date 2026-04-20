-- Anna iga müügitehingu juurde ka kliendi nimi (võtame 10 rida)

SELECT * FROM sales limit 1;
SELECT * FROM customers limit 1;

SELECT s.sale_id, s.invoice_id, s.sale_date, s.product_id, s.total_price, c.first_name, c.last_name, c.email
FROM sales s
INNER JOIN customers c ON s.customer_id = c.customer_id
LIMIT 10;
-- 9624

/*

SELECT väljade loetelu 
FROM tabel1 t1
JOIN tabel2 t2 ON t1.pk = t2.fk   -- sidumistingimus
WHERE total_price > 1000          -- filtreerimistingimus
GROUP BY t1.customer_id           -- grupeerimistingimus
HAVING sum(total_price)> 10000    -- gruppide filtreerimistingimus 

*/


SELECT Count(*) FROM sales limit 1;       -- 10 118
SELECT Count(*) FROM customers limit 1;   --  3 000

SELECT * FROM Sales LIMIT 100;
SELECT * FROM customers ORDER BY customer_id LIMIT 10;


SELECT COUNT(*)
FROM sales s
INNER JOIN customers c
  ON s.customer_id = c.customer_id;
-- 9624 

-- LEFT JOIN: kõik kliendid, ka need kes pole ostnud
SELECT
    c.first_name, c.last_name, c.city,
    s.sale_id, s.total_price
   FROM customers c LEFT JOIN sales s ON c.customer_id = s.customer_id
-- FROM sales s c   RIGHT JOIN customers c ON c.customer_id = s.customer_id
ORDER BY s.total_price DESC NULLS LAST
LIMIT 20;

-- LEFT JOIN: AINULT kliendid, kes pole ostnud
SELECT
    c.first_name, c.last_name, c.city,
    s.sale_id, s.total_price
FROM customers c 
LEFT JOIN sales s ON c.customer_id = s.customer_id
WHERE s.sale_id IS NULL
ORDER BY s.total_price DESC NULLS LAST
LIMIT 20;

-- Mitu klienti on andmebaasis niisuguseid, kes ei ole midagi ostnud 
SELECT Count(*)
FROM sales s
RIGHT JOIN customers c ON s.customer_id = c.customer_id  
WHERE s.sale_id IS NULL;

-- TOP 20 kliendid — Anna esimene küsimus

SELECT
    c.first_name || ' ' || c.last_name AS klient,
    c.city,
    COUNT(s.sale_id) AS ostude_arv,
    SUM(s.total_price) AS kogumuuk
FROM sales s
INNER JOIN customers c
    ON s.customer_id = c.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name, c.city
ORDER BY kogumuuk DESC
LIMIT 20;


-- Müük linnade kaupa:
-- näitab iga linna kohta, mitu erinevat klienti on ostnud,
-- mitu ostu on tehtud ja kui suur on kogumüük kokku

SELECT
    c.city AS linn,
    COUNT(DISTINCT c.customer_id) AS kliente,
    COUNT(s.sale_id) AS oste,
    SUM(s.total_price) AS kogumuuk
FROM sales s
INNER JOIN customers c ON s.customer_id = c.customer_id
GROUP BY c.city
ORDER BY kogumuuk DESC;

-- Leiab kõigi linnade peale kokku tehtud ostude koguarvu
-- Sisemine päring arvutab esmalt iga linna kohta:
-- mitu erinevat klienti ostis, mitu ostu tehti ja kui suur oli kogumüük
-- Välimine päring liidab kokku veeru "oste"

SELECT SUM(oste)
FROM (
    SELECT
        c.city AS linn,
        COUNT(DISTINCT c.customer_id) AS kliente,
        COUNT(s.sale_id) AS oste,
        SUM(s.total_price) AS kogumuuk
    FROM sales s
    INNER JOIN customers c
        ON s.customer_id = c.customer_id
    GROUP BY c.city
    ORDER BY kogumuuk DESC
) AS vahetabel;

-- Leiab kõikide linnade ostude koguarvu kokku
-- Sisemine päring arvutab iga linna kohta:
-- mitu erinevat klienti ostis, mitu ostu tehti ja kui suur oli kogumüük
-- Välimine päring liidab kõigi linnade ostude arvu kokku

SELECT SUM(oste)
FROM (
    SELECT
        c.city AS linn,
        COUNT(DISTINCT c.customer_id) AS kliente,
        COUNT(s.sale_id) AS oste,
        SUM(s.total_price) AS kogumuuk
    FROM sales s
    INNER JOIN customers c
        ON s.customer_id = c.customer_id
    GROUP BY c.city
    ORDER BY kogumuuk DESC
) AS VaheTabel;