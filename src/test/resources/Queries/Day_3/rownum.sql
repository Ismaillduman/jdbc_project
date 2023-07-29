SELECT *
FROM EMPLOYEES
where ROWNUM < 11;

--display all info from employees who is getting first 5 highest salary
SELECT SALARY
from EMPLOYEES
order by SALARY DESC;

SELECT SALARY
from (SELECT SALARY
      from EMPLOYEES
      order by SALARY DESC)
WHERE ROWNUM < 6;


/*
***second solving***
create view EmployeeSalaryDEDSC as
SELECT SALARY
from EMPLOYEES
order by SALARY DESC;

SELECT SALARY
from EMPLOYEESALARYDEDSC
where ROWNUM<6;

DROP VIEW EMPLOYEESALARYDEDSC;*/

--display all info who is getting 5th highest salary
SELECT *
FROM (SELECT DISTINCT SALARY from EMPLOYEES order by SALARY DESC)
WHERE ROWNUM < 6;
--first 5 row which have higher 5 salary

SELECT MIN(SALARY)
FROM (SELECT * FROM (SELECT DISTINCT SALARY from EMPLOYEES order by SALARY DESC) WHERE ROWNUM < 6);
--13000 is the 5th salary

SELECT *
FROM EMPLOYEES
WHERE SALARY = (SELECT MIN(SALARY)
                FROM (SELECT * FROM (SELECT DISTINCT SALARY from EMPLOYEES order by SALARY DESC) WHERE ROWNUM < 6));

--IQ How do you find who is making 37.th highest salary
SELECT DISTINCT SALARY FROM EMPLOYEES
order by SALARY DESC;

SELECT DISTINCT SALARY FROM (SELECT DISTINCT SALARY FROM EMPLOYEES
               order by SALARY DESC)
WHERE ROWNUM<38;

SELECT min(SALARY) FROM (SELECT * FROM (SELECT DISTINCT SALARY FROM EMPLOYEES
                              order by SALARY DESC)
               WHERE ROWNUM<38);

SELECT * FROM EMPLOYEES
WHERE SALARY = (SELECT min(SALARY) FROM (SELECT * FROM (SELECT DISTINCT SALARY FROM EMPLOYEES
                                                        order by SALARY DESC)
                                         WHERE ROWNUM<38));

-- display all info who is getting 3th lowest salary

SELECT DISTINCT SALARY FROM EMPLOYEES
order by SALARY ASC;


SELECT * FROM EMPLOYEES
WHERE SALARY = (SELECT max(SALARY) FROM (SELECT * FROM (SELECT DISTINCT SALARY FROM EMPLOYEES
                                                        order by SALARY ASC)
                                         WHERE ROWNUM<4));