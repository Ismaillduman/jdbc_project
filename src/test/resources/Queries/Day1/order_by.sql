SELECT *
from EMPLOYEES;

/*
it allows us to sort data based on provided column
As a default it will order the result ASCENDING ORDER (A-Z ; 0-9)
If you want to sort it descending order we need to specify right after column name
*/

select *
from EMPLOYEES
order by SALARY ASC; --ascending order artarak

select *
from EMPLOYEES
order by SALARY DESC; --in descending order azalarak

select *
from EMPLOYEES
order by FIRST_NAME desc;

select *
from EMPLOYEES
order by FIRST_NAME asc;

select *
from EMPLOYEES
where SALARY between 3000 AND 7000
order by SALARY desc ;

select *
from EMPLOYEES
where SALARY between 3000 AND 7000
order by FIRST_NAME asc ;

--display all info where emp id is less than 120 order than based on salary desc

select *
from EMPLOYEES
where EMPLOYEE_ID < 120
order by SALARY desc;

-- display all info from employees and order them based on first name asc and last name desc

select * FROM EMPLOYEES
order by FIRST_NAME ASC , LAST_NAME DESC;