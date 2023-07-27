SELECT *
FROM EMPLOYEES;

SELECT SUBSTR(FIRST_NAME, 1, 1) || '.' || SUBSTR(LAST_NAME, 1, 1) || '.' as initials,
       FIRST_NAME || ' ' || LAST_NAME                                    as full_name
FROM EMPLOYEES;

create view EmployeeInfo as
SELECT SUBSTR(FIRST_NAME, 1, 1) || '.' || SUBSTR(LAST_NAME, 1, 1) || '.' as initials,
       FIRST_NAME || ' ' || LAST_NAME                                    as full_name
FROM EMPLOYEES;

SELECT * FROM EMPLOYEEINFO;

SELECT INITIALS FROM EMPLOYEEINFO;


--drop view terminate
DROP VIEW EmployeeInfo;