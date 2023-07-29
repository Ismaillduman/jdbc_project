create TABLE scrumteam(
    emp_id INTEGER primary key ,
    first_name varchar(30) not null ,
    last_name varchar(30) not null ,
    job_title varchar (20),
    salary integer
);

select * FROM scrumteam;
/*
INSERT INTO tableName(column1, column2...)
VALUES(value1, value2 ...)*/
INSERT INTO SCRUMTEAM(emp_id, first_name, last_name, job_title, salary)
VALUES (1,'Albus','Dambildor','Tester',50000);
INSERT INTO SCRUMTEAM(emp_id, first_name, last_name, job_title, salary)
VALUES (2,'Ron','Wissly','Developer',70000);
INSERT INTO SCRUMTEAM(emp_id, first_name, last_name, job_title, salary)
VALUES (3,'Severus','Snape','S.M',50000);
INSERT INTO SCRUMTEAM(emp_id, first_name, last_name, job_title, salary)
VALUES (4,'Herminy','Granger','PO',50000);
INSERT INTO SCRUMTEAM(emp_id, first_name, last_name, job_title, salary)
VALUES (5,'Michael','Scorfield','TestManager',50000);


-- save changes with commit so that other people , connections can get the updates
commit;

select * FROM scrumteam;
-- to update data
UPDATE SCRUMTEAM
SET SALARY=SALARY+5000;

UPDATE SCRUMTEAM
SET SALARY=85000
where emp_id=4;

commit work;

Delete from scrumteam
WHERE EMP_ID=5;
commit ;
--CRUD create(INSERT),read(SELECT),update(UPDATE),Delete(DELETE)

