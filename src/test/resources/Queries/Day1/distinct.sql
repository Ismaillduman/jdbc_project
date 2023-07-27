/*it show different values from query based provided column
*/

SELECT FIRST_NAME from EMPLOYEES;
SELECT DISTINCT FIRST_NAME from EMPLOYEES; --remove duplicated names with distinct

select * from JOBS;
select DISTINCT JOB_ID from JOBS; --since primary key cannot be duplicate it gives the same result
