/*PART 2




4. Display all informations of the employee who has the second minimum salary
5. List all the employees who are making above the average salary;
6. List all the employees who are making less than the average salary
7. Display manager name of 'Neena'
8. Find the 3rd maximum salary from the employees table (do not include duplicates)
9. Find the 5th maximum salary from the employees table (do not include duplicates)
10. Find the 7th maximum salary from the employees table (do not include duplicates)
11. Find the 10th maximum salary from the employees table (do not include duplicates)
12. Find the 3rd minimum salary from the employees table (do not include duplicates)
13. Find the 5th minimum salary from the employees table (do not include duplicates)*/

--1. Display full addresses from locations table in a single column
SELECT *
from EMPLOYEES;
SELECT STREET_ADDRESS || ' ' || POSTAL_CODE || ' ' ||
       CITY || ' ' || STATE_PROVINCE || ' ' || COUNTRY_ID as full_adresse
FROM LOCATIONS;

--2. Display all informations of the employee who has the minimum salary in employees table
SELECT *
FROM EMPLOYEES
where SALARY = (select MIN(SALARY) FROM EMPLOYEES);

--3. Display the second minimum salary from the employees
SELECT * FROM EMPLOYEES


