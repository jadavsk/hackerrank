/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/
select  CITY.NAME
FROM CITY CITY 
INNER JOIN COUNTRY COUNTRY  ON CITY.CountryCode = COUNTRY.Code
WHERE COUNTRY.CONTINENT = 'Africa'
