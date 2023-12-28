select * from customers;
select * from employees where officeCode=1 or officeCode= 2;
select * from employees where officeCode=1 or jobTitle!='Sales rep';

select * from employees where jobTitle!='Sales rep' or employeeNumber<1500 or firstName='ABCD';


select * from employees where jobTitle!='Sales rep' and employeeNumber<1500;
select * from employees where jobTitle!='Sales rep' and employeeNumber>1500;

select  * from employees where employeeNumber between 1100 and 1300;
select  * from employees where employeeNumber>= 1100 and employeeNumber<= 1300;
