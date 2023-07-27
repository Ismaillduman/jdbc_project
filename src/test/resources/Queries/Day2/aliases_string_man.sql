--the query below second column name is ROUND(AVG(SALARY)) which is not nice

/*
1. column aliases --> it s temporary name to show in display
2. table aliases which we will learn later
Employees --> E
*/
select DEPARTMENT_ID, ROUND(AVG(SALARY)) as "Average_salary" --i can fix that with as key word
FROM EMPLOYEES
where DEPARTMENT_ID is not null
group by DEPARTMENT_ID
having AVG(SALARY) > 6000;

--manager is asking display annual salary for all employees as annual salary

SELECT FIRST_NAME, SALARY * 12 as "Annual_salary"
FROM EMPLOYEES;

---------------------------------String Manipulation---------------------------------

/*
CONCAT
--java --> + first_name+""+last_name
--sql --> || first_name ||''|| last_name or ve can use CONCAT function
*/
-- I want to get full_name column where we have first name +''+last_name

SELECT FIRST_NAME || ' ' || LAST_NAME as Full_name
FROM EMPLOYEES;

--add @cydeo.com to all the emails in the employee table

select EMAIL || '' || '@cydeo.com'
from EMPLOYEES;

SELECT CONCAT(EMAIL, '@cydeo.com')
FROM EMPLOYEES;

SELECT lower(CONCAT(EMAIL, '@cydeo.com'))
FROM EMPLOYEES;

SELECT upper(CONCAT(EMAIL, '@cydeo.com'))
FROM EMPLOYEES;

--INITCAP
-- It makes first letter uppercase

SELECT INITCAP(CONCAT(EMAIL, '@cydeo.com'))
FROM EMPLOYEES;

--LENGTH
SELECT INITCAP(CONCAT(EMAIL, '@cydeo.com')) as "EMAIL", length(INITCAP(CONCAT(EMAIL, '@cydeo.com'))) as "LENGTH"
FROM EMPLOYEES;

--Display all employees where first_name length equals 6

SELECT FIRST_NAME
from EMPLOYEES
where (length(FIRST_NAME)) = 6;

--another solution
SELECT FIRST_NAME
FROM EMPLOYEES
WHERE FIRST_NAME LIKE '______';

--how many

SELECT COUNT(*)
FROM EMPLOYEES
WHERE FIRST_NAME LIKE '______';

-- Display initial from first_name and last_name --> S.K

--substr(column_name, beginning_index,numberOfChar)
SELECT SUBSTR(FIRST_NAME,0,1)||'.'||SUBSTR(LAST_NAME,0,1)||'.' as initials
FROM EMPLOYEES;

SELECT SUBSTR(FIRST_NAME,1,1)||'.'||SUBSTR(LAST_NAME,1,1)||'.' as initials
FROM EMPLOYEES; -- same result like above

select FIRST_NAME,SUBSTR(FIRST_NAME,-2,2)
FROM EMPLOYEES; -- -2 means select the last two char

select FIRST_NAME,SUBSTR(FIRST_NAME,-3,2)
FROM EMPLOYEES; -- -3 means select two last char of the last 3 char