select * from EMPLOYEES;

create table Developers(
                           Id_Number Integer primary key,
                           Names varchar(30),
                           Salary Integer
);

select * from DEVELOPERS;

create table Testers(
                        Id_Number Integer primary key,
                        Names varchar(30),
                        Salary Integer
);
select * from Testers;

insert into developers values (1, 'Mike', 155000);
insert into developers values (2, 'John', 142000);
insert into developers values (3, 'Steven', 850000);
insert into developers values (4, 'Maria', 120000);
insert into testers values (1, 'Steven', 110000);
insert into testers values(2, 'Adam', 105000);
insert into testers values (3, 'Lex', 100000);

commit work;

select * from DEVELOPERS
union
select * from TESTERS;

select Names from DEVELOPERS
union --combine two queries and remove duplicate and order by asc as default
select Names from TESTERS;

select Names from DEVELOPERS
union all -- combine two queries and not remove duplicate and not order as default
select Names from TESTERS;

select Names FROM DEVELOPERS
MINUS
SELECT NAMES FROM TESTERS;

select Names FROM TESTERS
MINUS
SELECT NAMES FROM DEVELOPERS;

--intersect show common records from queries

select NAMES from TESTERS
intersect
select names from DEVELOPERS;
