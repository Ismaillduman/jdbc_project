SELECT *
FROM EMPLOYEES;

/*
AGGREGATE FUNCTIONS - MULTI ROWS - GROUP FUNCTIONS
- Count  --> it will count rows
-max --> it will max value
-min--> it will min value
-sum --> it will give total value
--avg  --> it wil give me average value
Aggregate functions takes multi row and return one result
All of them ignore null values
*/

select *
from DEPARTMENTS;

--how many departments we have
select count(*)
from DEPARTMENTS;

--how many location we have

select count(*)
from LOCATIONS;

select count(DEPARTMENT_ID)
FROM EMPLOYEES;

--how many different first name we have?
select count(distinct FIRST_NAME)
from EMPLOYEES;

--how many employees working IT_PROG or SAR_EP

select count(*)
from EMPLOYEES
WHERE JOB_ID IN ('IT_PROG', 'SAR_EP');

select max(SALARY)
from EMPLOYEES;

select min(SALARY)
from EMPLOYEES;

select AVG(SALARY)
from EMPLOYEES;

select ROUND(AVG(SALARY), 2)
from EMPLOYEES;

select ROUND(AVG(SALARY), 4)
from EMPLOYEES;

select ROUND(AVG(SALARY), 6)
from EMPLOYEES;


SELECT sum(SALARY) from EMPLOYEES;