SELECT *
FROM EMPLOYEES;

--display all info who is making max salary

SELECT max(SALARY)
FROM EMPLOYEES;

SELECT *
from EMPLOYEES
where SALARY = (SELECT max(SALARY)
                FROM EMPLOYEES);

--Task Give me all info who is getting min salary

Select * from EMPLOYEES
where SALARY =(SELECT min(SALARY)
               from EMPLOYEES);

--display all info who is getting second highest salary?

SELECT max(SALARY)
from EMPLOYEES;

SELECT Max(SALARY) from EMPLOYEES
where SALARY<(SELECT max(SALARY)
              from EMPLOYEES); --17000

SELECT * FROM EMPLOYEES
WHERE SALARY = (SELECT Max(SALARY) from EMPLOYEES
                where SALARY<(SELECT max(SALARY)
                              from EMPLOYEES)); --17000
 -- Task: Display all information who is getting more than average?
SELECT ROUND(AVG(SALARY),2) FROM EMPLOYEES; --6461.83

SELECT * FROM EMPLOYEES
WHERE SALARY> (SELECT AVG(SALARY) FROM EMPLOYEES)
order by SALARY asc;