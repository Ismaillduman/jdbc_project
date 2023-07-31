SELECT *
from EMPLOYEES;

select DEPARTMENT_NAME
from DEPARTMENTS;

select FIRST_NAME, LAST_NAME, DEPARTMENT_ID, SALARY
FROM EMPLOYEES;


select FIRST_NAME, LAST_NAME, DEPARTMENT_ID, SALARY
FROM EMPLOYEES
where SALARY > 9000;

--TASK 4
select FIRST_NAME, LAST_NAME, DEPARTMENT_ID, SALARY
FROM EMPLOYEES
where SALARY between 9000 and 15000
order by SALARY;

--TASK_5
select FIRST_NAME, LAST_NAME, DEPARTMENT_ID, SALARY
FROM EMPLOYEES
where SALARY > 5000
  AND FIRST_NAME = 'Peter'
order by SALARY desc;

--Task6
SELECT COUNTRY_ID, COUNTRY_NAME, REGION_ID
from COUNTRIES
where REGION_ID in (2, 4)
order by REGION_ID desc, COUNTRY_NAME;

--task7
SELECT FIRST_NAME || ' ' || LAST_NAME as Full_name, SALARY * 12 as annual_salary, JOB_ID
from EMPLOYEES
where JOB_ID
          like 'S%';

--task8
select COUNTRY_ID, COUNTRY_NAME
from COUNTRIES
where COUNTRY_NAME LIKE '%a';

--IQ give me the even number of emp_id
select *
FROM EMPLOYEES
WHERE MOD(EMPLOYEE_ID, 2) = 0;

---task_9
SELECT COUNTRY_ID, COUNTRY_NAME
FROM COUNTRIES
WHERE COUNTRY_NAME like '__i%a';



------ INTERVIEW QUESTION  -->
/*
    Write a query to print first_name and salary for all employees in the Employee table
    who earn a salary larger than 3000
    Sort your results in ascending order of the last 3 characters in the employees first_name
    if two or more employees have first_names ending with same 3 characters, then sort them by highest salary
*/
--IQ
SELECT FIRST_NAME, salary
FROM EMPLOYEES
WHERE salary > 3000
ORDER BY SUBSTR(FIRST_NAME, -3), salary DESC;



--------------- GROUP BY, HAVING  -------------------

-- TASK 10- 1 -  how many city we have in each country from locations table
select COUNTRY_ID, COUNT(CITY)
FROM LOCATIONS
group by COUNTRY_ID;

-- TASK 10- 2  - order them based on city count in desc
select COUNTRY_ID, COUNT(CITY)
FROM LOCATIONS
group by COUNTRY_ID
order by count(CITY) DESC;


-- TASK 10- 3 -  filter result where country id starts with C

select COUNTRY_ID, COUNT(CITY)
FROM LOCATIONS
WHERE COUNTRY_ID LIKE 'C%'
group by COUNTRY_ID
order by count(CITY) DESC;

-- TASK 10- 4 -  display country id if city count is bigger than 1
select COUNTRY_ID, COUNT(CITY)
FROM LOCATIONS
group by COUNTRY_ID
having COUNT(CITY) > 1
order by count(CITY) DESC;
-- TASK 11 -1  How many employees is working for each department
SELECT DEPARTMENT_ID, COUNT(EMPLOYEE_ID)
FROM EMPLOYEES
group by DEPARTMENT_ID;


-- TASK 11 -2  ignore null departments
SELECT DEPARTMENT_ID, COUNT(EMPLOYEE_ID)
FROM EMPLOYEES
WHERE DEPARTMENT_ID IS NOT NULL
group by DEPARTMENT_ID;


-- TASK 11 -3  display department id where employees count is less than 5

SELECT DEPARTMENT_ID, COUNT(EMPLOYEE_ID)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING COUNT(EMPLOYEE_ID) < 5;

------- SUBQUERY -------

-- TASK 12 - Display those employees firstname,lastname and salary
--           who get higher salary than the employee whose employee_id is 104
select FIRST_NAME, LAST_NAME, SALARY
from EMPLOYEES
where SALARY > (select SALARY FROM EMPLOYEES where EMPLOYEE_ID = 104)
order by SALARY;

select SALARY
FROM EMPLOYEES
where EMPLOYEE_ID = 104;

-- TASK 13 -  Display Manager firstname,lastname of Peter,Vargas from employees table

SELECT MANAGER_ID
FROM EMPLOYEES
WHERE FIRST_NAME = 'Peter'
  AND LAST_NAME = 'Vargas';

select *
from EMPLOYEES
where EMPLOYEE_ID = (SELECT MANAGER_ID
                     FROM EMPLOYEES
                     WHERE FIRST_NAME = 'Peter'
                       AND LAST_NAME = 'Vargas');


-- TASK 14 -  display all information who is getting 11th highest salary


select *
from EMPLOYEES
where SALARY = (SELECT MIN(SALARY)
                from (SELECT *
                      FROM (SELECT DISTINCT SALARY
                            FROM EMPLOYEES
                            ORDER BY SALARY DESC)
                      WHERE ROWNUM < 12));

-- TASK 15 - Display employees first_name,last_name who is working in Marketing department
SELECT *
FROM DEPARTMENTS
WHERE DEPARTMENT_NAME = 'Marketing';

select FIRST_NAME, LAST_NAME
FROM EMPLOYEES
where DEPARTMENT_ID = (SELECT DEPARTMENTS.DEPARTMENT_ID
                       FROM DEPARTMENTS
                       WHERE DEPARTMENT_NAME = 'Marketing');



--- DDL / DML ---

-- DQL --> DATA QUERY LANGUAGE  --> SELECT
-- DML --> DATA MANIPULATION LANGUAGE
-- DDL --> DATA DEFINITION LANGUAGE


----- JOINS ----

-- INNER JOIN RETURN ONLY THE DATA THAT MATCH FROM BOTH TABLE ACCORDING TO CONDITION
-- Display all first_name and  related department_name

SELECT * FROM EMPLOYEES;
SELECT * FROM DEPARTMENTS;

--steven Executive
--David  IT
--.....
--.....
select FIRST_NAME ,DEPARTMENT_NAME FROM EMPLOYEES
INNER JOIN DEPARTMENTS on EMPLOYEES.DEPARTMENT_ID = DEPARTMENTS.DEPARTMENT_ID;

--table aliases
select FIRST_NAME ,DEPARTMENT_NAME,D.DEPARTMENT_ID FROM EMPLOYEES E
                                            INNER JOIN DEPARTMENTS D on E.DEPARTMENT_ID = D.DEPARTMENT_ID;



-- LEFT OUTER JOIN RETURN EVERYTHING THAT MATCH + UNIQUE FOR LEFT
-- Display all first_name and department_name including the  employee without department

select FIRST_NAME ,DEPARTMENT_NAME,D.DEPARTMENT_ID FROM EMPLOYEES E
                                                   left JOIN DEPARTMENTS D on E.DEPARTMENT_ID = D.DEPARTMENT_ID;

--DISPLAY EMPLOYEES WHO IS WORKING FOR DEPARTMENT THAT STARS WITH S

select FIRST_NAME ,DEPARTMENT_NAME,D.DEPARTMENT_ID FROM EMPLOYEES E
                                                            left JOIN DEPARTMENTS D on E.DEPARTMENT_ID = D.DEPARTMENT_ID
WHERE DEPARTMENT_NAME LIKE 'S%';





-- RIGHT OUTER JOIN RETURN EVERYTHING THAT MATCH + UNIQUE FOR RIGHT
-- Display all first_name and department_name including the department without employee
select FIRST_NAME ,DEPARTMENT_NAME,D.DEPARTMENT_ID FROM DEPARTMENTS D
                                                            right JOIN EMPLOYEES E on E.DEPARTMENT_ID = D.DEPARTMENT_ID;

-- FULL OUTER JOIN RETURNS EVERYTHING
-- Display all firstname and department name including the department without employees
-- and also employees without the department
SELECT FIRST_NAME, D.DEPARTMENT_NAME, E.DEPARTMENT_ID
FROM EMPLOYEES E
         FULL OUTER JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID;


----- SELF JOIN ---
-- Display all managers and their managers information

-- Given the Employee table, write a SQL query that finds out employees who earn more than their managers.

