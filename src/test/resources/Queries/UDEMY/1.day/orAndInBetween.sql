select * from customers;
select * from employees where officeCode=1 or officeCode= 2;
select * from employees where officeCode=1 or jobTitle!='Sales rep';

select * from employees where jobTitle!='Sales rep' or employeeNumber<1500 or firstName='ABCD';


select * from employees where jobTitle!='Sales rep' and employeeNumber<1500;
select * from employees where jobTitle!='Sales rep' and employeeNumber>1500;

select  * from employees where employeeNumber between 1100 and 1300;
select  * from employees where employeeNumber>= 1100 and employeeNumber<= 1300;


-- IN and Between
select * from customers where country='USA' or country='Germany' or country='spain' or country='france';

select * from customers where country IN('USA','spain','Germany','France','Poland');
select * from customers where country NOT IN('USA','spain','Germany','France','Poland');

select * From customers where creditLimit between 60300 and 85100;
select * From customers where creditLimit NOT between 60300 and 85100;
select * from customers where creditLimit IN('138500','100600');

-- uniqe value fetch

select distinct officeCode from employees;
select distinct jobTitle from employees;

desc employees; -- give me column name and value type

select  employeeNumber as 'Employee Code', lastName, firstName,officeCode from employees;
select  employeeNumber as 'Employee Code',
        lastName, firstName,officeCode, extension as "Phone Extension" from employees;

select  employeeNumber 'Employee Code',
        lastName, firstName,officeCode, extension "Phone Extension" from employees;

-- as keyword is optional to define alias
select  employeeNumber 'Employee Code',
        concat(firstName,' ',lastName) as 'Full Name',officeCode, extension "Phone Extension" from employees;

-- concat to combine two columns

select  employeeNumber 'Employee Code',
        lastName, firstName,officeCode, extension "Phone Extension" from employees
order by firstName desc ;
select  employeeNumber 'Employee Code',
        lastName, firstName,officeCode, extension "Phone Extension" from employees
order by firstName asc;

select * from customers order by country asc, state desc;

-- when i want to more than one column order i define the order by with comma.
-- But i have to look out that when i run the query, it will be execute sequentially.

