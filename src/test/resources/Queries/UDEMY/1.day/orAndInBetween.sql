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
