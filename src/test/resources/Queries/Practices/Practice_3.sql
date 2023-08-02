select * from employees;
--PART 3

--1. FIND OUT COUNTRY NAME AND REGION NAME FROM COUNTRIES AND
--REGION TABLE
SELECT COUNTRY_NAME,REGION_NAME
FROM COUNTRIES C JOIN REGIONS R on C.REGION_ID=R.REGION_ID;

--2. FIND OUT FIRST_NAME AND JOB_TITLE FROM JOBS AND EMPLOYEES TABLE
select FIRST_NAME,JOB_TITLE
FROM EMPLOYEES E JOIN JOBS J ON E.JOB_ID=J.JOB_ID;
--3. FIND OUT DEPARTMENT_NAME AND CITY
select DEPARTMENT_NAME,CITY
from DEPARTMENTS d join LOCATIONS l on d.LOCATION_ID=l.LOCATION_ID;

--4. FIND OUT ALL CITIES AND COUNTRY NAMES
select CITY,COUNTRY_NAME
from LOCATIONS l full join COUNTRIES c on l.COUNTRY_ID=c.COUNTRY_ID;
--5. FIND OUT FIRST_NAME, LAST NAME, DEPARTMENT ID , DEPARTMENT NAME
--FOR DEPARTMENT ID 80 OR 40

select FIRST_NAME,LAST_NAME,d.DEPARTMENT_ID,DEPARTMENT_NAME
from EMPLOYEES e join DEPARTMENTS d on e.DEPARTMENT_ID=d.DEPARTMENT_ID
where d.DEPARTMENT_ID in(80,40);

--6. FIND OUT CITY , COUNTRY_NAME OF THAT CITY , REGION_NAME OF THAT CITY
select CITY,COUNTRY_NAME,REGION_NAME
from COUNTRIES c join LOCATIONS l on c.COUNTRY_ID=l.COUNTRY_ID
join REGIONS r on c.REGION_ID = r.REGION_ID;
--7. FIND OUT EMPLOYEES FIRST_NAME , JOB_TITLE , DEPARTMENT_NAME , CITY
select FIRST_NAME,JOB_TITLE,DEPARTMENT_NAME,CITY
from EMPLOYEES e join JOBS J on e.JOB_ID = J.JOB_ID
join DEPARTMENTS d on e.DEPARTMENT_ID = d.DEPARTMENT_ID
join LOCATIONS l on d.LOCATION_ID = l.LOCATION_ID;
--8. FIND OUT EMPLOYEES FIRST_NAME , JOB_TITLE , DEPARTMENT_NAME , CITY ,
--COUNTRY_NAME , REGION_NAME
select FIRST_NAME,JOB_TITLE,DEPARTMENT_NAME,CITY,COUNTRY_NAME,REGION_NAME
from EMPLOYEES join JOBS J on EMPLOYEES.JOB_ID = J.JOB_ID
join DEPARTMENTS on EMPLOYEES.DEPARTMENT_ID = DEPARTMENTS.DEPARTMENT_ID
join LOCATIONS l on DEPARTMENTS.LOCATION_ID = l.LOCATION_ID
join COUNTRIES C2 on l.COUNTRY_ID = C2.COUNTRY_ID
join REGIONS r on C2.REGION_ID = r.REGION_ID;
--9. FIND OUR EMPLOYEES FIRST_NAME, LAST NAME, DEPARTMENT ID AND ALL
--DEPARTMENTS INCLUDING WHERE DO NOT HAVE ANY EMPLOYEE.
select FIRST_NAME,LAST_NAME,d.DEPARTMENT_ID
from EMPLOYEES e right join DEPARTMENTS d on e.DEPARTMENT_ID = d.DEPARTMENT_ID;

--10. FIND OUT ALL DEPARTMENT_NAME , LOCATION_ID , AND COUNTRY_ID
--INCLUDING THOSE LOCATIONS WITH NO DEPARTMENT
select DEPARTMENT_NAME, d.LOCATION_ID,COUNTRY_ID
from DEPARTMENTS d right join LOCATIONS l on d.LOCATION_ID = l.LOCATION_ID;

--11.FIND OUT DEPARTMENT_NAME , LOCATION_ID , AND COUNTRY_NAME
--INCLUDING THOSE COUNTRIES WITH NO DEPARTMENT

SELECT DEPARTMENT_NAME, l.LOCATION_ID, COUNTRY_NAME
FROM COUNTRIES c
         LEFT JOIN LOCATIONS l ON c.COUNTRY_ID = l.COUNTRY_ID
       left join DEPARTMENTS d on l.LOCATION_ID = d.LOCATION_ID;





--12. FIND OUT EMPLOYEES FIRST_NAME, DEPARTMENT ID AND DEPARTMENT
--NAME INCLUDING THOSE DOES NOT HAVE DEPARTMENT, INCLUDING THOSE
--DEPARTMENTS DOES NOT HAVE ANY MATCHING EMPLOYEES

select FIRST_NAME,e.DEPARTMENT_ID,DEPARTMENT_NAME
from DEPARTMENTS d  full join EMPLOYEES e on d.DEPARTMENT_ID = e.DEPARTMENT_ID;
