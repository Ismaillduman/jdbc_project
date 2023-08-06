SELECT *
FROM EMPLOYEES;

---- PRACTICE 1 ----


--4. List all the different region_ids in countries table
SELECT DISTINCT REGION_ID
FROM COUNTRIES;

select distinct FIRST_NAME
from EMPLOYEES;
--5. Display the salary of the employee Grant Douglas (lastName: Grant, firstName: Douglas)
select salary
from EMPLOYEES
where FIRST_NAME = 'Douglas'
  and LAST_NAME = 'Grant';
--6. Display all department information from departments table
-- if the department name values are as below
-- IT , Public Relations , Sales , Executive

select *
from DEPARTMENTS
where DEPARTMENT_NAME in ('IT', 'Public Relations', 'Sales', 'Executive');

--Display all department information from departments table
-- if the department name values are NOT  as below
-- IT , Public Relations , Sales , Executive
select *
from DEPARTMENTS
where DEPARTMENT_NAME NOT in ('IT', 'Public Relations', 'Sales', 'Executive');

-- 16 . Display all unique job_id that end with CLERK in employee table
select distinct JOB_ID
from EMPLOYEES
where JOB_ID LIKE ('%CLERK');

select JOB_ID
from JOBS --in jobs table all of job id is uniq why job_id is primary_key
where JOB_ID LIKE ('%CLERK');
-- 20-4 How many employees are there in each group that have minimum
-- salary of 5000 ?

select SALARY, count(*)
from EMPLOYEES
where SALARY >= 5000
group by SALARY
order by SALARY DESC;


-- 21. display all job_id and average salary who work as any of these jobs
-- IT_PROG,SA_REP, FI_ACCOUNT, AD_VP

SELECT JOB_ID, AVG(SALARY)
FROM EMPLOYEES
WHERE JOB_ID IN ('IT_PROG', 'SA_REP', 'FI_ACCOUNT', 'AD_VP')
group by JOB_ID;

SELECT JOB_ID, AVG(SALARY)
FROM EMPLOYEES
WHERE JOB_ID IN ('IT_PROG', 'SA_REP', 'FI_ACCOUNT', 'AD_VP')
group by JOB_ID
HAVING AVG(SALARY) < 10000;

-- 23. Display total salary for each department except department_id 50, and where
select DEPARTMENT_ID, sum(SALARY)
FROM EMPLOYEES
WHERE DEPARTMENT_ID <> ('50') --not in means <>
group by DEPARTMENT_ID
HAVING SUM(SALARY) > 30000;


---- PRACTICE 2 ----
--8.  Find the 3rd maximum salary from the employees table (do not include duplicates)
select distinct SALARY
FROM EMPLOYEES
order by SALARY DESC;
SELECT *
FROM (select distinct SALARY
      FROM EMPLOYEES
      order by SALARY DESC)
where ROWNUM < 4;

SELECT SALARY
from EMPLOYEES
where SALARY = (SELECT MIN(SALARY)
                FROM (SELECT SALARY
                      FROM (select distinct SALARY
                            FROM EMPLOYEES
                            order by SALARY DESC)
                      where ROWNUM < 4));

--12. Find the 3rd minimum salary from the employees table (do not include duplicates)
SELECT DISTINCT SALARY
from EMPLOYEES
where SALARY = (SELECT max(SALARY)
                FROM (SELECT SALARY
                      FROM (select distinct SALARY
                            FROM EMPLOYEES
                            order by SALARY)
                      where ROWNUM < 4));

---- PRACTICE 3 ----
-- 1. FIND OUT COUNTRY NAME AND REGION NAME FROM COUNTRIES AND  REGION TABLE
select COUNTRY_NAME, REGION_NAME
from COUNTRIES
         join REGIONS on COUNTRIES.REGION_ID = REGIONS.REGION_ID;


-- 3.  FIND OUT DEPARTMENT_NAME AND CITY
select DEPARTMENT_NAME, CITY
from DEPARTMENTS
         join LOCATIONS L on DEPARTMENTS.LOCATION_ID = L.LOCATION_ID;

select CITY, count(*)
from DEPARTMENTS
         join LOCATIONS L on DEPARTMENTS.LOCATION_ID = L.LOCATION_ID
GROUP BY CITY;


-- 5.  FIND OUT FIRST_NAME, LAST NAME, DEPARTMENT ID , DEPARTMENT NAME FOR DEPARTMENT ID 80 OR 40
select FIRST_NAME, LAST_NAME, e.DEPARTMENT_ID, DEPARTMENT_NAME
from EMPLOYEES e
         join DEPARTMENTS d on e.DEPARTMENT_ID = d.DEPARTMENT_ID
where e.DEPARTMENT_ID in ('80', '90');

-- 7. FIND OUT EMPLOYEES FIRST_NAME , JOB_TITLE , DEPARTMENT_NAME ,  CITY
select FIRST_NAME, JOB_TITLE, DEPARTMENT_NAME, CITY
from EMPLOYEES
         join JOBS J on EMPLOYEES.JOB_ID = J.JOB_ID
         join DEPARTMENTS on EMPLOYEES.DEPARTMENT_ID = DEPARTMENTS.DEPARTMENT_ID
         join LOCATIONS on DEPARTMENTS.LOCATION_ID = LOCATIONS.LOCATION_ID;

-- 8. FIND OUT EMPLOYEES FIRST_NAME , JOB_TITLE , DEPARTMENT_NAME ,CITY , COUNTRY_NAME , REGION_NAME
select FIRST_NAME, JOB_TITLE, DEPARTMENT_NAME, CITY, COUNTRY_NAME, REGION_NAME
from EMPLOYEES
         join JOBS J on EMPLOYEES.JOB_ID = J.JOB_ID
         join DEPARTMENTS on EMPLOYEES.DEPARTMENT_ID = DEPARTMENTS.DEPARTMENT_ID
         join LOCATIONS on DEPARTMENTS.LOCATION_ID = LOCATIONS.LOCATION_ID
         join COUNTRIES on LOCATIONS.COUNTRY_ID = COUNTRIES.COUNTRY_ID
         join REGIONS on COUNTRIES.REGION_ID = REGIONS.REGION_ID;

-- 11 .FIND OUT DEPARTMENT_NAME , LOCATION_ID , AND COUNTRY_NAME INCLUDING THOSE COUNTRIES WITH NO DEPARTMENT
select DEPARTMENT_NAME, l.LOCATION_ID, COUNTRY_NAME
from DEPARTMENTS d
         right join LOCATIONS l on d.LOCATION_ID = l.LOCATION_ID
         left join COUNTRIES c on l.COUNTRY_ID = c.COUNTRY_ID;


--self joins
SELECT distinct e.FIRST_NAME, e.LAST_NAME, e.MANAGER_ID, m.EMPLOYEE_ID, m.FIRST_NAME, m.LAST_NAME
FROM EMPLOYEES e
         left JOIN EMPLOYEES m ON e.MANAGER_ID = m.EMPLOYEE_ID;


--given the employee table write a sql query that finds out employees who earn than their managers
SELECT distinct e.FIRST_NAME, e.LAST_NAME, e.MANAGER_ID, m.EMPLOYEE_ID, m.FIRST_NAME, m.LAST_NAME
FROM EMPLOYEES e
         left JOIN EMPLOYEES m ON e.MANAGER_ID = m.EMPLOYEE_ID
where e.SALARY>m.SALARY;

