/*PART 2

--1. Display full addresses from locations table in a single column
SELECT *
from EMPLOYEES;
SELECT STREET_ADDRESS || ' ' || POSTAL_CODE || ' ' ||
       CITY || ' ' || STATE_PROVINCE || ' ' || COUNTRY_ID as full_adresse
FROM LOCATIONS;

--2. Display all informations of the employee who has the minimum salary in employees table
SELECT *
FROM EMPLOYEES
where SALARY = (select MIN(SALARY) FROM EMPLOYEES);

--3. Display the second minimum salary from the employees
SELECT SALARY FROM EMPLOYEES
order by SALARY;

select * from (SELECT SALARY FROM EMPLOYEES
               order by SALARY)
where ROWNUM<3;

select max(SALARY) from (select * from (SELECT DISTINCT SALARY FROM EMPLOYEES
                                        order by SALARY)
                         where ROWNUM<3);

SELECT SALARY FROM EMPLOYEES
WHERE SALARY=(select max(SALARY) from (select * from (SELECT DISTINCT SALARY FROM EMPLOYEES
                                                      order by SALARY)
                                       where ROWNUM<3));


--4. Display all informations of the employee who has the second minimum salary

SELECT * FROM EMPLOYEES
WHERE SALARY=(select max(SALARY) from (select * from (SELECT DISTINCT SALARY FROM EMPLOYEES
                                                      order by SALARY)
                                       where ROWNUM<3));

--5. List all the employees who are making above the average salary;

SELECT ROUND(AVG(SALARY),2) FROM EMPLOYEES;

select * from EMPLOYEES
where SALARY>(SELECT ROUND(AVG(SALARY),2) FROM EMPLOYEES)
order by SALARY;

--6. List all the employees who are making less than the average salary
SELECT ROUND(AVG(SALARY),2) FROM EMPLOYEES;

select * from EMPLOYEES
where SALARY<(SELECT ROUND(AVG(SALARY),2) FROM EMPLOYEES)
order by SALARY;

--7. Display manager name of 'Neena'

select FIRST_NAME from EMPLOYEES
where EMPLOYEE_ID=(SELECT MANAGER_ID FROM EMPLOYEES
                                    WHERE FIRST_NAME='Neena');

--8. Find the 3rd maximum salary from the employees table (do not include duplicates)

SELECT * FROM EMPLOYEES
WHERE SALARY=(select min(SALARY) from (select * from (SELECT DISTINCT SALARY FROM EMPLOYEES
                                                      order by SALARY desc )
                                       where ROWNUM<4));

--9. Find the 5th maximum salary from the employees table (do not include duplicates)
SELECT * FROM EMPLOYEES
WHERE SALARY=(select min(SALARY) from (select * from (SELECT DISTINCT SALARY FROM EMPLOYEES
                                                      order by SALARY desc )
                                       where ROWNUM<6));
--10. Find the 7th maximum salary from the employees table (do not include duplicates)
SELECT * FROM EMPLOYEES
WHERE SALARY=(select min(SALARY) from (select * from (SELECT DISTINCT SALARY FROM EMPLOYEES
                                                      order by SALARY desc )
                                       where ROWNUM<8));
--11. Find the 10th maximum salary from the employees table (do not include duplicates)
SELECT SALARY FROM EMPLOYEES
WHERE SALARY=  (Select min(salary) from ( select salary from (SELECT distinct SALARY from EMPLOYEES
                                                              order by SALARY DESC)
                                                        where ROWNUM<11
) );

--12. Find the 3rd minimum salary from the employees table (do not include duplicates)
SELECT SALARY FROM EMPLOYEES
WHERE SALARY=  (Select MAX(salary) from ( select salary from (SELECT distinct SALARY from EMPLOYEES
                                                              order by SALARY )
                                          where ROWNUM<4
                                        ) );
--13. Find the 5th minimum salary from the employees table (do not include duplicates)*/

select distinct SALARY from EMPLOYEES
order by SALARY;

select SALARY from(select distinct SALARY from EMPLOYEES
                   order by SALARY)
where ROWNUM<6;

select max(SALARY) from (select SALARY from(select distinct SALARY from EMPLOYEES
                                            order by SALARY)
                         where ROWNUM<6);

select SALARY from EMPLOYEES
where SALARY=(select max(SALARY) from (select SALARY from(select distinct SALARY from EMPLOYEES
                                                          order by SALARY)
                                       where ROWNUM<6));