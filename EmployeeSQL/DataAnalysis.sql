-- 1. List following details ....
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

-- 2. List fn, ln, hiredate for employees heired in 1986

SELECT 
   employees.first_name, 
   employees.last_name, 
   employees.hire_date
FROM
   employees
WHERE extract(year FROM employees.hire_date) = 1986 
ORDER BY employees.last_name, employees.first_name
;


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

-- 4. 	 
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

-- 5.
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

-- 6.
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

-- 7.
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

-- 8.
SELECT
	employees.last_name,
	COUNT (employees.last_name) AS name_count
	FROM employees
	GROUP BY employees.last_name
	ORDER BY name_count desc
;

	