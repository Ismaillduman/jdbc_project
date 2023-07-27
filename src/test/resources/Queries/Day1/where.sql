SELECT *
From EMPLOYEES;

--where statements are used to filter to rows returned from the select statement
--display all information of where first name is david
select *
from EMPLOYEES
where FIRST_NAME = 'David'
-- whatever inside '' is key sensitive
select *
from EMPLOYEES
where FIRST_NAME = 'David'
  AND LAST_NAME = 'Lee';

select FIRST_NAME, LAST_NAME, SALARY
from EMPLOYEES
where FIRST_NAME = 'Peter';


--display all information where salary is bigger than 6000
select *
from EMPLOYEES
where SALARY > 6000;

--display email of who is making less than 5000

select EMAIL
from EMPLOYEES
where SALARY < 5000;

--display all info from employees who is making more than 7000 and department id is 60
select *
from EMPLOYEES
where SALARY > 7000
  and DEPARTMENT_ID = 60;

--display all info from emp where salary equal or more than 3000 and salary equals or less then 7000
select *
FROM EMPLOYEES
where SALARY >= 3000
  and SALARY <= 7000;

select *
from EMPLOYEES
where SALARY between 3000 and 7000;

select *
from EMPLOYEES
where JOB_ID = 'IT_PROG'
   OR JOB_ID = 'MK_MAN';

select *
from EMPLOYEES
where JOB_ID in ('IT_PROG', 'MK_MAN');


--display all info where employee id 121, 142, 154 ,165 , 187
--solution 1
select *
from EMPLOYEES
where EMPLOYEE_ID = '121'
   or EMPLOYEE_ID = '142'
   or EMPLOYEE_ID = '165'
   or EMPLOYEE_ID = '187';

--solution 2 with in list
select *
from EMPLOYEES
where EMPLOYEE_ID IN (121, 142, 165, 187);

--display all info where country id is US and IT
select *
from COUNTRIES
where COUNTRY_ID in ('US', 'IT');

--display all info expect where country id is US and IT
select *
from COUNTRIES
where COUNTRY_ID not in ('US', 'IT');

--IS NULL
SELECT *
FROM EMPLOYEES
WHERE DEPARTMENT_ID IS NULL;


SELECT *
FROM EMPLOYEES
WHERE MANAGER_ID IS NULL;

SELECT *
FROM EMPLOYEES
WHERE MANAGER_ID IS NOT NULL;
