select * from customers
where contactLastName='King';

SELECT distinct jobTitle,firstName,employeeNumber FROM employees
         where officeCode='1'
ORDER BY employeeNumber asc;

SELECT  jobTitle,firstName,employeeNumber FROM employees
ORDER BY employeeNumber asc;

-- numeric filter and string filter

select * from employees where officeCode='6';
select * from employees where officeCode!='6';

select * from employees where lastName='King';
select * from employees where lastName!='King';

select lastName, firstName, email from employees where jobTitle='SaLes Rep';
select lastName, firstName, employeeNumber from employees where employeeNumber <= 1200;
select lastName, firstName, employeeNumber from employees where employeeNumber >= 1200;





