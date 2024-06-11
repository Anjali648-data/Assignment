----assignment 3-----
use hr_dataBase;

--1. Write a query that displays the employee's last names only from the string's 2-5th 
 --position with the first letter capitalized and all other letters lowercase, Give each column an appropriate label.--

 select SUBSTRING(UPPER(last_name),2,5) from Employee

  --2 Write a query that displays the employee's first name and last name along with a " in 
--between for e.g.: first name : Ram; last name : Kumar then Ram-Kumar. Also displays the month on which the employee has joined.

select CONCAT(first_name, ' - ',last_name) as Employe_name ,month(hire_date) as joining_month from Employee

--3.. Write a query to display the employee's last name and if half of the salary is greater than 
--ten thousand then increase the salary by 10% else by 11.5% along with the bonus amount of 1500 each. Provide each column an appropriate label. 

select last_name,
case when salary * 0.5 > 10000 then ROUND(salary * 1.1 + 1500,2)
	else ROUND(salary * 1.115 + 1500,2)
	end as final_salary
from Employee

--4.. Display the employee ID by Appending two zeros after 2nd digit and 'E' in the end, 
--department id, salary and the manager name all in Upper case, if the Manager name consists of 'z' replace it with '$! --

SELECT
    SUBSTRING(employe_id,1, 2), '00E' AS Employee_ID,
    UPPER(department_id      ) AS Department_ID,
    salary AS Salary,
    REPLACE(UPPER(CASE WHEN manager_id LIKE '%z%' THEN '$' ELSE manager_id END), 'Z', '$') AS Manager_Name
FROM Employee;

--5. Write a query that displays the employee's last names with the first letter capitalized and 
--all other letters lowercase, and the length of the names, for all employees whose name 
--starts with J, A, or M. Give each column an appropriate label. Sort the results by the employees' last names 

SELECT
    upper(last_name) AS Formatted_Last_Name,
    LEN(last_name) AS Name_Length
FROM Employee
WHERE last_name LIKE 'J%' OR last_name LIKE 'A%' OR last_name LIKE 'M%'
ORDER BY last_name;

--6.. Create a query to display the last name and salary for all employees. Format the salary to 
--be 15 characters long, left-padded with $. Label the column SALARY 


select last_name,
	RIGHT('$' + REPLICATE('0',15-len(cast(salary as varchar))),15) as Salary
	from Employee


--7.Display the employee's name if it is a palindrome --
select first_name from Employee
where first_name = REVERSE(first_name)
group by first_name

--8.Display First names of all employees with initcaps. --

select upper(first_name) as First_name  from Employee;

--9.. From LOCATIONS table, extract the word between first and second space from the STREET ADDRESS column. --
SELECT 
    SUBSTRING(
        street_address, 
        CHARINDEX(' ', street_address) + 1, 
        CHARINDEX(' ', street_address, CHARINDEX(' ', street_address) + 1) - CHARINDEX(' ', street_address) - 1
    ) AS extracted_word
FROM 
    Location1;

--10.. Extract first letter from First Name column and append it with the Last Name. Also add 
--"@systechusa.com" at the end. Name the column as e-mail address. All characters should be in lower case. Display this along with their First Name. 

select LOWER(substring(first_name,1,1) + last_name + '@systechusa.com') as Emailaddress from Employee

--11.Display the names and job titles of all employees with the same job as Trennar. ---

	select Employee.first_name as Employe_Name, job1.job_title
	from Employee
	left join job1
	on Employee.job_id=job1.job_id
	where
	job1.job_title = (select job_title from Employee where job_title = 'Trennar')

--12. Display the names and department name of all employees working in the same city as Trenna. 

select Employee.first_name,depatment.department_name,Location1.city
from Employee
Join depatment
on Employee.department_id=depatment.department_id
join Location1
on depatment.location_id=Location1.location_id
where Employee.first_name = 'Trenna';

--13. Display the name of the employee whose salary is the lowest. 

 select first_name,salary
 from Employee
 where salary = (select min(salary) as Lowest from Employee);

  --14. Display the names of all employees except the lowest paid.

 select
	first_name,salary
from Employee
where salary > (select Min(salary) from Employee);