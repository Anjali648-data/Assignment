
-----------------------------------assignment 2-----------------------------

use hr_dataBase;

/*----- 1. Display the maximum,minimum and avrage salary and commision earned. -----*/

select * from Employee;

select max(salary) as Max_salary,
     min(salary) as Min_salary,
	 AVG(salary) as Average_salary,
	 max(commission_pct) as Max_commission,
	 MIN(commission_pct) as Min_commission,
	 AVG(commission_pct) as Average_commission
	 from Employee;

--- 2. Display the department number, total salary payout and total commison payout for each department.--
select department_id, sum(salary) as "Total salary"
from Employee 
group by department_id;

/*----- 3. Display the department number and number of employees in each department. -----*/
select department_id as "Department No", count(employe_id) as "no of employees" from Employee group by department_id;

/*----- 4) Display the department number and total salary of employees in each department. -----*/
select department_id as "Department No", sum(salary) as "Total Salary" from Employee group by department_id;


/*----- 5) Display the employee's name who doesn't earn a commission. Order the result set without using the column name -----*/
select concat(first_name,' ', last_name) as ' ' from Employee where commission_pct IS NULL;

/*----- 6) Display the employees name, department id and commission. If an Employee doesn't
		earn the commission, then display as 'No commission'. Name the columns appropriately. -----*/

select CONCAT(first_name, ' ',last_name) as Employees_name,department_id,isnull(Null,'No commission') as Commission from Employee;

/*----- 7) Display the employee's name, salary and commission multiplied by 2. If an Employee doesn't earn the commission, then display as 'No commission. Name the columns
appropriately. -----*/

select CONCAT(first_name, ' ',last_name) as Employees_name,department_id,isnull(Null,'No commission') 
as Commission,(commission_pct * 2) from Employee;


/********************----- 8) Display the employee's name, department id who have the first name same as another employee in the same department-----*/

select Employee.first_name,Employee.Last_name,depatment.department_id from Employee
inner join depatment on Employee.department_id=depatment.department_id;

/*----- 9) Display the sum of salaries of the employees working under each Manager.-----*/

select manager_id,sum(salary) as total_salary from Employee
group by manager_id

--10. Select the Managers name, the count of employees working under and the department ---

select manager_id,count(employe_id) as Employee_working,department_id from Employee
group by manager_id,department_id;

--11. Select the employee name, department id, and the salary. Group the result with the manager name and the employee last name should have second letter 'a! ---

select CONCAT(first_name, ' ' , last_name) as employee_name,department_id,salary,manager_id from Employee
where SUBSTRING(last_name,2,1)='a'
order by manager_id;

--12 Display the average of sum of the salaries and group the result with the department id. Order the result with the department id.--

select department_id,AVG(sum_salary) as avarage_salary from(
select department_id, SUM(salary) as  sum_salary from Employee
group by department_id) sum_salaries
group by department_id
order by department_id;

--13.Select the maximum salary of each department along with the department id --
select department_id,Max(salary) as maximum_salary from Employee
group by department_id;

--14. Display the commission, if not null display 10% of salary, if null display a default value 1--

select commission_pct,isnull(null,1) as commission,(salary *0.1) as adjust_commission from Employee;
