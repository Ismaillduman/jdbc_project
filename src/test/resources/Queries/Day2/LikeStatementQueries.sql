/*
- percent % --> for matching any sequence of characters. (0 or more)
- underscore _ --> for matching any single character.
- contains
-stars with
-ends with
*/

--display all emp where first_name starts with B
SELECT *FROM EMPLOYEES
Where FIRST_NAME LIKE 'E%';

--display all employees where first name stratWith B  and length of it 5 letter

SELECT *FROM EMPLOYEES
WHERE FIRST_NAME like 'B____';

--display 5 letter firstname from employees where middle char is z

SELECT *FROM EMPLOYEES
WHERE FIRST_NAME LIKE '__z__';

--display all emp where first_name endswith B
SELECT * From EMPLOYEES
WHERE FIRST_NAME LIKE '%e';


--display all emp where job id contains IT
Select * from EMPLOYEES
where JOB_ID LIKE '%IT%';

--display all info where first name starts with H ending with l

select *
from EMPLOYEES
where FIRST_NAME LIKE 'H%l';
