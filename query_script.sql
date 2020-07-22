-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.
-- For this, I can query the above information, using the right join from 'employees' to 'salaries' to get the salary column
select 
	e.emp_no,
	e.first_name,
	e.last_name,
	e.sex,
	s.salary
from employees as e
right join salaries as s
on e.emp_no=s.emp_no
limit 10;
-- 2. List first name, last name, and hire date for employees who were hired in 1986.
-- Using the extract(field from source) or date_part('field',source) to find employees hired in 1986
select
	first_name,
	last_name,
	hire_date
from employees
where date_part('year',hire_date)=1986
-- where extract(year from hire_date)=1986
-- this line of code returns the same output.
limit 10;

-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
-- I will need three tables for this query: departments,dept_manager and employees. 
-- From the departments left join with dept_manager to get dept_no,dept_name and manager's employee number,
-- then inner or left join with employees table to get first_name,last_name
select 
	d.dept_no,
	d.dept_name,
	dm.emp_no,
	e.last_name,
	e.first_name
from departments as d
left join dept_manager as dm
on d.dept_no=dm.dept_no
inner join employees as e
on dm.emp_no=e.emp_no
limit 10;
 
-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
-- I still need three tables for this query: departments, dept_emp and employees.
-- Perform left join from departments to dept_emp to get the department name and department number
-- Perform inner or left join to get the employee number and first_name, last_name
-- I notice when I perform right join with employees, the output is missing some employee.
select
	e.emp_no,
	e.first_name,
	e.last_name,
	d.dept_name,
	de.dept_no
from departments as d
left join dept_emp as de
on d.dept_no=de.dept_no
inner join employees as e
on de.emp_no=e.emp_no
limit 10;
	
-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
-- This query is straight forward. I use the employees table, and combine two conditions for first_name and last_name
select 
	e.first_name,
	e.last_name,
	e.sex
from employees as e
where (first_name ='Hercules') and (last_name like 'B%')
limit 10;

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
-- This query is almost like the fourth query, where I can just put in condition for Sales department.
select
	e.emp_no,
	e.first_name,
	e.last_name,
	d.dept_name,
	de.dept_no
from departments as d
left join dept_emp as de
on d.dept_no=de.dept_no
inner join employees as e
on de.emp_no=e.emp_no
where (dept_name='Sales')
limit 10;	
-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
-- Same as the sixth query; however, the condition should be 'or' to catch the two departments.
select
	e.emp_no,
	e.first_name,
	e.last_name,
	d.dept_name,
	de.dept_no
from departments as d
left join dept_emp as de
on d.dept_no=de.dept_no
inner join employees as e
on de.emp_no=e.emp_no
where (dept_name='Development') or (dept_name='Sales')
limit 15;
	
-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
-- Using count, group by and order by function to get the output.
select
	last_name,
	count(last_name) as name_count
from employees
group by last_name
order by name_count desc
limit 10;

SELECT *
FROM pg_settings
WHERE name = 'port';
