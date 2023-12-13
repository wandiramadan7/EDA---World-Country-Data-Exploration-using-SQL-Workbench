-- Show each tables
SHOW tables;

-- EDA Country table
-- Show country table
SELECT *
FROM country;

-- 10 negara dengan luas wilayah terluas (Antarctica tidak termasuk)
SELECT  Name, SurfaceArea
FROM country
WHERE Name NOT LIKE "Antarctica"
ORDER BY SurfaceArea DESC 
LIMIT 10 ;

-- 10 Negara dengan Populasi terbanyak dan paling sedikit
SELECT  Code, Name, Population
FROM country
ORDER BY Population DESC 
LIMIT 10 ;

SELECT  Code, Name, Population
FROM country
WHERE Population > 0
ORDER BY Population ASC 
LIMIT 10 ;

-- 10 Negara dengan Angka Harapan Hidup tertinggi dan terrendah
SELECT  Code, Name, LifeExpectancy
FROM country
ORDER BY LifeExpectancy DESC 
LIMIT 10 ;

SELECT  Code, Name, LifeExpectancy
FROM country
WHERE LifeExpectancy > 0
ORDER BY LifeExpectancy ASC
LIMIT 10 ;

-- Negara dengan GNP tertinggi
SELECT  Name, GNP
FROM country
ORDER BY GNP DESC
LIMIT 10 ;

-- Jumlah negara berdasarkan bentuk pemerintahannya
SELECT GovernmentForm, count(Name) AS country
FROM country
GROUP BY GovernmentForm
ORDER BY country DESC
LIMIT 10;

-- EDA Asia
-- Negara dari Asia
SELECT Code, Name
FROM country
WHERE Continent = "Asia"
ORDER BY Name;

-- Rata-rata LifeExpctancy di Asia
SELECT avg(LifeExpectancy) AS LifeExpectancy, AVG(GNP) AS GNP
FROM country
WHERE Continent = "Asia";

-- Jumlah populasi di Asia tenggara
SELECT sum(Population) AS TotalPopulation
FROM country
WHERE Region = "Southeast Asia";

-- Rata-rata LifeExpctancy di Asia tenggara
SELECT avg(LifeExpectancy) AS LifeExpectancy, AVG(GNP) AS GNP
FROM country
WHERE Region = "Southeast Asia";

-- Jumlah negara berdasarkan GovernmentForm di Asia Tenggara
SELECT GovernmentForm , count(Name)
FROM country
WHERE Region = "Southeast Asia"
group by GovernmentForm;

-- EDA Indoesia
-- Jumlah populasi tiap provinsi
SELECT ct.Name, ct.District, ct.Population
FROM city AS ct
LEFT JOIN country ON country.Code = ct.CountryCode
WHERE country.Name = "Indonesia"
ORDER BY Population DESC;

-- Jumlah populasi tiap kabupaten di Jawa Barat
SELECT Name, Population
FROM city
WHERE District = "West Java"
ORDER BY Population;

-- EDA Lenguage
SELECT *
FROM countrylanguage;

SELECT Language, Percentage
FROM countrylanguage
ORDER BY Percentage DESC
LIMIT 10;


-- COMMON QUERY IN SQL
-- SELECT
SELECT Name, District
FROM city ;

-- SELECT DISTINCT
SELECT DISTINCT CountryCode
FROM city;

-- WHERE
SELECT *
FROM city
WHERE CountryCode="NLD";

-- ORDER BY
SELECT *
FROM city
WHERE CountryCode="NLD"
ORDER BY Population ;

-- AND
SELECT *
FROM city
WHERE CountryCode="NLD" AND Population > 120000;

-- OR
SELECT *
FROM city
WHERE CountryCode="NLD" OR Population > 120000;

-- NOT
SELECT * 
FROM city
WHERE NOT CountryCode = "AFG";

-- INSERT INTO
INSERT INTO city
VALUES ("7896","Garut", "NLD", "Wakanda", "235000"), ("7899","Garsel", "NLD", "Wakanda", "235000");

-- NULL
SELECT Name
FROM city
WHERE District IS NULL;

-- NULL
SELECT Name
FROM city
WHERE District IS NOT NULL;

-- UPDATE
UPDATE city
SET Name = "Kota Dodol"
WHERE ID = 7896 ;

-- DELETE
DELETE FROM city
WHERE ID = "7896" AND ID = "7899";

-- LIMIT
SELECT *
FROM city 
LIMIT 10;

-- MIN MAX
SELECT MAX(Population)
FROM city;
SELECT MIN(Population)
FROM city;

-- COUNT
SELECT COUNT(District)
FROM city
WHERE CountryCode = "AGO";

-- AVERAGE
SELECT AVG(Population)
FROM city
WHERE CountryCode = "NLD";

-- SUM
SELECT SUM(Population)
FROM city
WHERE CountryCode = "NLD";

-- LIKE
SELECT *
FROM city
WHERE District LIKE "a%";

SELECT *
FROM city
WHERE District LIKE "%a";

SELECT *
FROM city
WHERE District LIKE "%Q%";

SELECT *
FROM city
WHERE District LIKE "s%a";

SELECT *
FROM city
WHERE District LIKE "%ol%";

SELECT *
FROM city
WHERE District LIKE "_a%";

-- IN
SELECT *
FROM city
WHERE CountryCode IN ("DZA", "NLD", "AFG");

-- BETWEEN
SELECT *
FROM city
WHERE Population BETWEEN 12000 AND 34000 ;

-- ALIASES
SELECT CountryCode AS AreaCode
FROM city ;

-- JOIN / FULL JOIN 
SELECT ci.CountryCode, ci.Name, co.Name AS country, co.Region AS region
FROM city AS ci
JOIN country AS co ON ci.CountryCode = co.Code ;

-- RIGHT JOIN 
SELECT ci.CountryCode, ci.Name, co.Name AS country, co.Region AS region
FROM city AS ci
RIGHT JOIN country AS co ON ci.CountryCode = co.Code ;

-- LEFT JOIN 
SELECT ci.CountryCode, ci.Name, co.Name AS country, co.Region AS region
FROM city AS ci
LEFT JOIN country AS co ON ci.CountryCode = co.Code ;

-- 






