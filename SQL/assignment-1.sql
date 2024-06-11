-------------------first page----------------

use hr_dataBase;

---1. Display all information in the tables EMP and DEPT. --

select * from Employee inner join depatment 
on Employee.department_id= depatment.department_id


--- 2. Display only the hire date and employee name for each employee. ---

select hire_date,CONCAT(first_name, ' ' ,last_name) as employe_name from Employee

--- 3. Display the ename concatenated with the job ID, separated by a comma and space, and name the column Employee and Title ---

select CONCAT(first_name,' ',last_name,',',job_id) as "Employe and Title" from Employee

--- 4. Display the hire date, name and department number for all clerks. ---

select hire_date,department_id,first_name,last_name from Employee;

---- 5. Create a query to display all the data from the EMP table. Separate each column by a comma. Name the column THE OUTPUT ----

select CONCAT_WS(',',employe_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
as "THE OUTPUT" from Employee;


--- 6. Display the names and salaries of all employees with a salary greater than 2000. ---

select CONCAT(first_name,' ',last_name) as employe_name,salary from Employee 
where salary>2000;

--- 7. Display the names and dates of employees with the column headers "Name" and "Start Date"---

select concat(first_name, ' ' , last_name) as "Name", hire_date as "Start Date" from Employee;

---- 8. Display the names and hire dates of all employees in the order they were hired. ----
select concat(first_name, ' ' , last_name) as "Name", hire_date as "Start Date" from Employee 
order by "Start Date";

---- 9. Display the names and salaries of all employees in reverse salary order. ----
select concat(first_name, ' ' , last_name) as "Name", reverse(salary) as salary from Employee;


---- 10. Display 'ename" and "deptno" who are all earned commission and display salary in reverse order. ----
select concat(first_name, ' ', last_name) as "eame", department_id as "deptno" from Employee;

---- 11. Display the last name and job title of all employees who do not have a manager ---

select last_name,job_id from Employee
where manager_id is null;


---- 12. Display the last name, job, and salary for all employees whose job is sales representative or stock clerk and whose salary is not equal to $2,500, $3,500, or $5,000 ---

select last_name,job_id as job,salary from Employee
where (job_id = 'SA_REP' OR job_id = 'ST_CLERK')AND salary not in(2500,3500,5000)

