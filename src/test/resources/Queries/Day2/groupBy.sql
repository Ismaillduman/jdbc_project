SELECT *
from EMPLOYEES;

--get me average salary for IT_PROG

SELECT AVG(SALARY)
from EMPLOYEES
where JOB_ID = 'IT_PROG';

--get me average salary for AC_ACCOUNT
SELECT AVG(SALARY)
from EMPLOYEES
where JOB_ID = 'AC_ACCOUNT';

--get me average salary for AD_ASST
SELECT AVG(SALARY)
from EMPLOYEES
where JOB_ID = 'AD_ASST';

--how can i take in one-shot all avg salary for each job_id

SELECT DEPARTMENT_ID, ROUND(AVG(SALARY), 3), COUNT(*), SUM(SALARY), max(SALARY), min(SALARY)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;

SELECT JOB_ID, ROUND(AVG(SALARY), 3), COUNT(*), SUM(SALARY), max(SALARY), min(SALARY)
FROM EMPLOYEES
GROUP BY JOB_ID;

--display how many department we have in each location
select LOCATION_ID, COUNT(*)
FROM DEPARTMENTS
GROUP BY LOCATION_ID;


--order result based on number of departments in desc
select LOCATION_ID, COUNT(*)
FROM DEPARTMENTS
GROUP BY LOCATION_ID
order by count(*) desc;

select LOCATION_ID, COUNT(*)
FROM DEPARTMENTS
GROUP BY LOCATION_ID
order by 2 desc;
-- 2 represent count(*) 1.row LOCATION_ID and 2.row is count(*)

--display how many countries we have in each regions

SELECT REGION_ID, count(*)
FROM COUNTRIES
GROUP BY REGION_ID
order by count(*) asc;

--get me total salary for each department from employees table

select DEPARTMENT_ID, sum(SALARY), count(*)
From EMPLOYEES
where DEPARTMENT_ID is not null
GROUP BY DEPARTMENT_ID;

select DEPARTMENT_ID, sum(SALARY), count(*)
From EMPLOYEES
where 1 is not null -- to remove null id from the result
GROUP BY DEPARTMENT_ID;

--display job ids where their avg salary more then 5k

select JOB_ID, AVG(SALARY)
FROM EMPLOYEES
where SALARY > 5000 --where before the group id
group by JOB_ID;


select JOB_ID, AVG(SALARY)
FROM EMPLOYEES
group by JOB_ID
HAVING AVG(SALARY) > 5000; -- having after the group id

select JOB_ID, ROUND(AVG(SALARY))
FROM EMPLOYEES
group by JOB_ID
HAVING AVG(SALARY) > 6000;

-- display departments where avg salary is more than 6k
select DEPARTMENT_ID, ROUND(AVG(SALARY))
FROM EMPLOYEES
where DEPARTMENT_ID is not null
group by DEPARTMENT_ID
having AVG(SALARY) > 6000;

select DEPARTMENT_ID, ROUND(AVG(SALARY))
FROM EMPLOYEES
group by DEPARTMENT_ID
HAVING DEPARTMENT_ID is not null
   and AVG(SALARY) > 6000
order by 2 asc;

--display duplicate (more than one ) first name from employees table

SELECT FIRST_NAME, count(FIRST_NAME)
from EMPLOYEES
group by FIRST_NAME
having count(FIRST_NAME) > 1;


--display department id where employees count is bigger than 5

select DEPARTMENT_ID, count(*)
from EMPLOYEES
group by DEPARTMENT_ID
having count(*) > 5
order by 2;

--the query below second column name is ROUND(AVG(SALARY)) which is not nice

select DEPARTMENT_ID, ROUND(AVG(SALARY)) as "Average_salary" --i can fix that with as key word
FROM EMPLOYEES
where DEPARTMENT_ID is not null
group by DEPARTMENT_ID
having AVG(SALARY) > 6000;