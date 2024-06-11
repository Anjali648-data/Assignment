--assignment 4---

use hr_dataBase

--1. Write a query to display the last name, department number, department name for all employees.

select Employee.Last_name, Employee.department_id, depatment.department_name
from Employee
left join depatment
on Employee.department_id=depatment.department_id


--2.Create a unique list of all jobs that are in department 4. Include the location of the department in the output. 

select employee.job_id,depatment.location_id
from Employee
Join depatment
on Employee.department_id=depatment.department_id
where Employee.department_id = 10;

--3.. Write a query to display the employee last name,department name,location id and city of all employees who earn commission.

select Employee.last_name,depatment.department_name,depatment.location_id,Location1.city
from Employee
Join depatment
on Employee.department_id=depatment.department_id
join Location1
on depatment.location_id=Location1.location_id
where Employee.commission_pct  is not null;

--4.. Display the employee last name and department name of all employees who have an 'a' in their last name

select last_name,department_name
from Employee
left join depatment
on Employee.department_id=depatment.department_id
where last_name like '%a%';

--5.. Write a query to display the last name,job,department number and department name for all employees who work in ATLANTA

select Employee.Last_name,Employee.job_id,depatment.department_name,depatment.department_id
from Employee
join depatment
on Employee.department_id=depatment.department_id
where location_id = (select location_id from Location1 where city = 'Roma' )

--6. Display the employee last name and employee number along with their manager's last name and manager number.

select e.last_name as "employee name", e.employe_id as "employee number",m.last_name as "Manager name",m.manager_id as "manager number"
from Employee as e
join Employee as m
on m.employe_id=e.manager_id

--7.Display the employee last name and employee number along with their manager's last 
--name and manager number (including the employees who have no manager). 

select e.last_name as "employe name" , e.employe_id AS "employee number", m.last_name as "manager name",m.manager_id as "manager number"
from Employee as e
left join Employee as m
on m.employe_id=e.manager_id

--8.. Create a query that displays employees last name,department number,and all the 
--employees who work in the same department as a given employee.

select e.last_name as "Employe_L_Name" , e.department_id as Department_id, m.last_name as "manager_name", e.employe_id as employee_ID
from Employee as e
join Employee as m
on e.department_id=m.department_id

--9. Create a query that displays the name,job,department name,salary,grade for all 
--employees. Derive grade based on salary(>=50000=A, >=30000=B,<30000=C) 

select CONCAT(Employee.first_name , ' ',Employee.Last_name) as employee_name,Employee.job_id,depatment.department_name,Employee.salary,
case
when employee.salary >=50000 then 'A'
when employee.salary>=30000 then 'B'
else
'c'
end as "Grade"
from employee
join depatment
on employee.department_id=depatment.department_id

--10.. Display the names and hire date for all employees who were hired before their 
--managers along withe their manager names and hire date. Label the columns as Employee name, emp_hire_date,manager name,man_hire_date--
 select CONCAT(e.first_name,' ',e.last_name) as Employee_name,e.hire_date,CONCAT(m.first_name,' ',m.last_name) as Manager_name,m.hire_date
 from Employee e
 join Employee m
 on e.manager_id=m.manager_id
 where e.hire_date<m.hire_date;

