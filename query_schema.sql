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
limit 10
-- 2. List first name, last name, and hire date for employees who were hired in 1986.
select
	first_name,
	last_name
from employees
where (extract year from hire_date) = '1986'
limit 10


-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
select 
	d.dept_no,
	d.dept_name,
	dm.emp_no,
	e.last_name,
	e.first_name
from employees as e
left join dept_manager as dm
on e.emp_no=dm.emp_no
 join employees as e
on d.dept_no=e.emp_no

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.




-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."




-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.




-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.




-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.


