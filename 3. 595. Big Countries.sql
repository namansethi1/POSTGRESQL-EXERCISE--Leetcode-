-- Query to select the name, population, and area of countries with an area >= 3,000,000 or a population >= 25,000,000
SELECT name, population, area 
FROM world 
WHERE area >= 3000000 OR population >= 25000000;
