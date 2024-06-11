-----------assignment 5 ---------------

use hr_dataBase;

--1.Write a query to display the last name and hire date of any employee in the same department as SALES. 

select Last_name,hire_date
from Employee
where department_id = (select department_id from depatment where department_name = 'Sales')

--2. Create a query to display the employee numbers and last names of all employees who 
--earn more than the average salary. Sort the results in ascending order of salary.

select employe_id,last_name,salary from Employee
where salary >(select avg(salary) from Employee)
group by employe_id,last_name,salary
order by salary asc;

--3. Write a query that displays the employee numbers and last names of all employees who 
--work in a department with any employee whose last name contains a' u 

select employe_id, last_name,department_name 
from Employee 
left join depatment
on Employee.department_id  = depatment.department_id 
where last_name like '%a';

-- 4. Display the last name, department number, and job ID of all employees whose department location is ATLANTA.

select Employee.Last_name,depatment.department_id,Employee.job_id,Location1.city
from Employee 
left join depatment on Employee.department_id = depatment.department_id
left join Location1 on depatment.location_id = Location1.location_id
where city = 'Tokyo';

-- 5. Display the last name and salary of every employee who reports to FILLMORE.

-- 6. Display the department number, last name, and job ID for every employee in the OPERATIONS department.

select d.department_id, e.last_name, e.job_id, d.department_name 
from Employee e  right join depatment d on e.department_id = d.department_id where department_name = 'Operations';

-- 7. Modify the above query to display the employee numbers, last names, and salaries of all employees who earn more than the average salary and who work in a department with any
-- employee with a 'u'in their name.

select employe_id as "Employee Number", last_name, salary from Employee 
where salary > (select avg(salary) from Employee) and last_name like 'u%';

-- 8. Display the names of all employees whose job title is the same as anyone in the sales dept.

select CONCAT(first_name,' ',last_name) as "full name",depatment.department_id 
from Employee right join depatment
on Employee.department_id =depatment.department_id
 where depatment.department_id=(select department_id from depatment where department_name = 'Sales');


 -- 9. Write a compound query to produce a list of employees showing raise percentages, employee IDs, and salaries. Employees in department 10 and 30 are given a 5% raise,
-- employees in department 20 are given a 10% raise, employees in departments 40 and 50 are given a 15% raise, and employees in department 60 are not given a raise.
select first_name, employe_id,salary,department_id,
case
when department_id in (10, 30) then '0.5%'
when department_id in (20) then '0.10%'
when department_id in (40,50) then '0.15%'
 else 'no raise'
end as "raise percentages"
from Employee;

-- 10. Write a query to display the top three earners in the EMPLOYEES table. Display their last names and salaries.

SELECT TOP 3 last_name, salary
FROM Employee
ORDER BY salary DESC;

--11. Display the names of all employees with their salary and commission earned. Employees with a null commission should have O in the commission column

SELECT first_name AS Employee_Name,
       salary AS "Salary",
       COALESCE(commission_pct, 0) AS Commission
FROM Employee;

--12. Display the Managers (name) with top three salaries along with their salaries and department information.

select TOP 3 Employee.first_name as Managers,Employee.salary,depatment.department_name
from Employee
  Join depatment
on Employee.department_id=depatment.department_id;


