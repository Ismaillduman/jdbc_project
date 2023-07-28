SELECT * FROM EMPLOYEES;
--Task: how many locations we have for each country

SELECT COUNTRY_ID ,COUNT(LOCATION_ID)
FROM LOCATIONS
where COUNTRY_ID in('US','UK','CA')
GROUP BY COUNTRY_ID
ORDER BY COUNTRY_ID DESC;
--Display where location count is bigger than 2
SELECT COUNTRY_ID ,COUNT(LOCATION_ID)
FROM LOCATIONS
where COUNTRY_ID in('US','UK','CA')
GROUP BY COUNTRY_ID
having  count(*)>2
ORDER BY COUNTRY_ID DESC;

--Task2: Display all employees salary in following format as column name EMPLOYEES_SALARY
--STEVEN MAKES 24000
--NEENA MAKES 17000

SELECT FIRST_NAME||' makes '|| SALARY FROM EMPLOYEES;