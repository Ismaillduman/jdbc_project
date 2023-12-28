-- TASK 1
-- From the employees table, find those employees whose first name
-- contains the letters C, Y, or D. Return all fields.
select *
from employees
where lower(FIRST_NAME) like '%c%'
   or lower(FIRST_NAME) like '%y%'
   or lower(FIRST_NAME) like '%d%';

-- TASK 2
-- From the employees table, find those employees whose first name does not contain the letter ‘M’.
-- Sort the result-set in ascending order by department ID.
-- Return full name (first and last name together), salary and department_id.
select FIRST_NAME, LAST_NAME as fullname, SALARY, DEPARTMENT_ID
from EMPLOYEES
where FIRST_NAME not like '%m%'
order by DEPARTMENT_ID;

-- TASK 3
-- From the job history table, find those employees
-- who worked more than two jobs in the past. Return employee id.
select EMPLOYEE_ID, count(*)
from JOB_HISTORY
group by EMPLOYEE_ID
HAVING COUNT(*) > 1;

SELECT *
FROM JOB_HISTORY
ORDER BY EMPLOYEE_ID;

SELECT EMPLOYEE_ID, COUNT(*)
FROM JOB_HISTORY
GROUP BY EMPLOYEE_ID
HAVING COUNT(*) > 1
ORDER BY EMPLOYEE_ID;
-- TASK 4
-- Get me how many employees getting more than employees avg
select round(avg(SALARY), 2)
from EMPLOYEES;

select count(*)
from EMPLOYEES
where SALARY > (select round(avg(SALARY), 2) from EMPLOYEES);



-- TASK 5
-- Get me all employees who is jobtitle is  'Sales Manager'
select *
from EMPLOYEES
         join JOBS J on EMPLOYEES.JOB_ID = J.JOB_ID
where JOB_TITLE = 'Sales Manager';

--get me all employees firstname and jobtitle

select FIRST_NAME, JOB_TITLE
from EMPLOYEES
         join JOBS J on J.JOB_ID = EMPLOYEES.JOB_ID;

-- TASK 6
-- Get me all employees who is manager name is Neena Kocchar
select MANAGER_ID
from EMPLOYEES
where FIRST_NAME = 'Neena';

select FIRST_NAME, LAST_NAME
from EMPLOYEES
where EMPLOYEE_ID = (select MANAGER_ID
                     from EMPLOYEES
                     where FIRST_NAME = 'Neena');



--- JOINS
-- TASK  1
-- From the employees and jobs tables,
-- find the difference between maximum salary of the job and
-- salary of the employees.
-- Return job title, employee name, and salary difference.


SELECT JOB_TITLE, FIRST_NAME, MAX_SALARY - SALARY AS SALARY_DIFF
FROM EMPLOYEES
         join JOBS J on J.JOB_ID = EMPLOYEES.JOB_ID
order by SALARY_DIFF;


--TASK 2-1
-- From the departments and locations tables,
-- display the department name, city, and state province for each department.
select DEPARTMENT_NAME, CITY, STATE_PROVINCE
from DEPARTMENTS
         join LOCATIONS L on DEPARTMENTS.LOCATION_ID = L.LOCATION_ID;

--TASK 2-2
-- display only department names ends with Sales
select DEPARTMENT_NAME, CITY, STATE_PROVINCE
from DEPARTMENTS
         join LOCATIONS L on DEPARTMENTS.LOCATION_ID = L.LOCATION_ID
where DEPARTMENT_NAME like'%Sales';
--TASK 2-3
-- How many department we have for each city

select COUNT(DEPARTMENT_NAME) , city from (select  DEPARTMENT_NAME, CITY
                                  from DEPARTMENTS
 join LOCATIONS L on DEPARTMENTS.LOCATION_ID = L.LOCATION_ID)
GROUP BY CITY;

-- LEFT OUTER JOIN or LEFT JOIN

SELECT DEPARTMENT_NAME,CITY,STATE_PROVINCE
FROM DEPARTMENTS D
         LEFT  JOIN  LOCATIONS L ON D.LOCATION_ID=L.LOCATION_ID;
-- We have still 27 results
-- Reason --> there is no department without any location information


SELECT * FROM LOCATIONS; --23 different
SELECT * FROM DEPARTMENTS;

SELECT DEPARTMENT_NAME,CITY,STATE_PROVINCE
FROM LOCATIONS L LEFT JOIN DEPARTMENTS D
                           ON L.LOCATION_ID=D.LOCATION_ID;
-- MATCHING = 27
-- UNIQUE L = 43 - 27 = 16 LOCATION DOES NOT HAVE ANY DEPARTMENT

SELECT LOCATION_ID FROM LOCATIONS; --23
SELECT DISTINCT LOCATION_ID FROM DEPARTMENTS; --7
-- 23-7 LOCATIONS WITHOUT DEPARTMENT



-- RIGHT OUTER JOIN or RIGHT JOIN
SELECT DEPARTMENT_NAME,CITY,STATE_PROVINCE
FROM LOCATIONS L
         RIGHT  JOIN  DEPARTMENTS D ON D.LOCATION_ID=L.LOCATION_ID;

SELECT DEPARTMENT_NAME,CITY,STATE_PROVINCE
FROM DEPARTMENTS D RIGHT JOIN LOCATIONS L
                              ON L.LOCATION_ID=D.LOCATION_ID;


--task 2-4
-- get me city names where we have more than one department
select CITY,count(*)
from DEPARTMENTS
         join LOCATIONS L on DEPARTMENTS.LOCATION_ID = L.LOCATION_ID
group by CITY
having COUNt(*)> 1;

-- TASK 3
-- From employees, departments, and locations tables,
-- find those employees whose first name contains a letter 'z'.
-- Return first name, last name, department, city, and state province.
select FIRST_NAME, LAST_NAME, DEPARTMENT_NAME,CITY,STATE_PROVINCE
from EMPLOYEES join DEPARTMENTS D on D.DEPARTMENT_ID = EMPLOYEES.DEPARTMENT_ID
join LOCATIONS L on L.LOCATION_ID = D.LOCATION_ID
where FIRST_NAME like '%a%' or
      FIRST_NAME like'%z%';

--TASK 3-1
-- how many employees are working for each city
select CITY,count(*)
from EMPLOYEES join DEPARTMENTS D on D.DEPARTMENT_ID = EMPLOYEES.DEPARTMENT_ID
               join LOCATIONS L on L.LOCATION_ID = D.LOCATION_ID
group by CITY;


--TASK 3-2
-- get me cities where we have more than 10 employees
select CITY,count(*)
from EMPLOYEES join DEPARTMENTS D on D.DEPARTMENT_ID = EMPLOYEES.DEPARTMENT_ID
               join LOCATIONS L on L.LOCATION_ID = D.LOCATION_ID
group by CITY
having count(*)>10;

--TASK 3-3
-- From the employees, departments, and locations tables,
-- find full name (first and last name), and salary of those employees
-- who work in any department located in Oxford .

select  FIRST_NAME||' '|| LAST_NAME as full_name , SALARY, CITY from EMPLOYEES
join DEPARTMENTS D on D.DEPARTMENT_ID = EMPLOYEES.DEPARTMENT_ID
join LOCATIONS L on D.LOCATION_ID = L.LOCATION_ID
where CITY='Oxford';