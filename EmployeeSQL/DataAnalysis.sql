--
/*
select 
   <list of fields>
from 
    <data sources>
where
    <conditions>
group by
    <list of fields>
having 
    <conditions>
order by 
    <list of fields>
;
*/
-- 1. List employee number, last name, first name, sex, and salary.
SELECT 
   employees.emp_no, 
   employees.last_name, 
   employees.first_name, 
   employees.sex, 
   salaries.salary
FROM
   employees join salaries
     on employees.emp_no = salaries.emp_no
;

-- 2. List first name, last name, and hire date for employees who were hired in 1986

SELECT 
   employees.first_name, 
   employees.last_name, 
   employees.hire_date
FROM
   employees
WHERE extract(year FROM employees.hire_date) = 1986 
ORDER BY employees.last_name, employees.first_name
;

-- 3. List department number, department name, the manager's employee number, last name, first name.
SELECT
	departments.dept_no,
	departments.dept_name,
	department_manager.emp_no,
	employees.last_name,
	employees.first_name
FROM
	(departments JOIN department_manager
	ON departments.dept_no = department_manager.dept_no)
	JOIN
	employees 
	ON
	department_manager.emp_no = employees.emp_no
;

-- 4. List employee number, last name, first name, and department name. 
SELECT
	employees.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_name
FROM
	(employees JOIN department_employee
	ON employees.emp_no = department_employee.emp_no)
	JOIN
	departments 
	ON
	department_employee.dept_no = departments.dept_no
;

-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT
	employees.first_name,
	employees.last_name,
	employees.sex
FROM
	employees 
	WHERE
	employees.first_name = 'Hercules'
	AND
	employees.last_name LIKE 'B%'
;

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT
	employees.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_name
FROM
	(employees JOIN department_employee
	ON employees.emp_no = department_employee.emp_no)
	JOIN
	departments 
	ON
	department_employee.dept_no = departments.dept_no
	WHERE
	departments.dept_name = 'Sales'
;

-- Select * from departments

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT
	employees.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_name
FROM
	(employees JOIN department_employee
	ON employees.emp_no = department_employee.emp_no)
	JOIN
	departments 
	ON
	department_employee.dept_no = departments.dept_no
	WHERE
	--departments.dept_name = 'Sales'
	--OR
	--departments.dept_name = 'Development'
	departments.dept_name IN ('Sales', 'Development')
;

-- 8. List the frequency count of employee last names and in descending order
SELECT
	employees.last_name,
	COUNT (employees.last_name) AS name_count
	FROM employees
	GROUP BY employees.last_name
	ORDER BY name_count desc
;

	