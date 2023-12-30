select * from customers;

select * from customers
where customers.contactFirstName like 'C%';

select * from customers
where customers.contactLastName like '%D';

select *
from customers where customerName like '%co.';

select *
from customers where customerName like 'C%co.';

select * from  customers where addressLine1 like '%63%';
select * from  customers where addressLine1 like '%ee%';
select * from  customers where addressLine1 like '%e%e%';

select * from customers where customerName like 'C%e%e%';

select * from customers where customerName like '__s%';
-- third character _ represent exactly one character
select  * from customers where customerName like 'C%s____';

select * from customers where contactFirstName like '_e%e_';
select * from customers where contactFirstName like '_____';
select * from customers where contactFirstName like '%_______%';

select sum(creditLimit) from customers;
select count(customerNumber) from customers;
select (select sum(creditLimit) from customers) / (select count(customerNumber) 'Avarege' from customers);

select * from customers
where creditLimit >= (select (select sum(creditLimit) from customers)
                                 / (select count(customerNumber) from customers));

select avg(creditLimit) from customers;
select * from customers where creditLimit>= (select avg(creditLimit) from customers);