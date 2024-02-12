SELECT * FROM departments

SELECT * FROM dept_emp

SELECT * FROM dept_manager

SELECT * FROM employees

SELECT * FROM salaries

SELECT * FROM titles

-- 1. List the employee number, last name, first name, sex, and salary of each employee.
SELECT employees.emp_no, employees.first_name, employees.last_name, employees.sex, salaries.salary
FROM employees
JOIN salaries ON employees.emp_no = salaries.emp_no
ORDER BY emp_no ASC;

-- 2. List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT employees.first_name, employees.last_name, employees.hire_date
FROM employees
WHERE hire_date >= '1986-01-01' AND hire_date < '1987-01-01';

-- 3. List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT employees.first_name, employees.last_name, dept_manager.emp_no, dept_manager.dept_no, departments.dept_name
FROM dept_manager
JOIN departments ON dept_manager.dept_no = departments.dept_no
JOIN employees ON dept_manager.emp_no = employees.emp_no;

-- 4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
CREATE VIEW emp_dept_new AS
SELECT employees.first_name, employees.last_name, dept_emp.emp_no, dept_emp.dept_no, departments.dept_name
FROM dept_emp
JOIN employees ON dept_emp.emp_no = employees.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
ORDER BY emp_no ASC;

-- 5. List the first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT employees.first_name, employees.last_name, employees.sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- 6. List each employee in the Sales department, including their employee number, last name, and first name.
SELECT emp_dept_new.emp_no, emp_dept_new.first_name, emp_dept_new.last_name, emp_dept_new.dept_name
FROM emp_dept_new
WHERE dept_name = 'Sales';

-- 7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT emp_dept_new.emp_no, emp_dept_new.first_name, emp_dept_new.last_name, emp_dept_new.dept_name
FROM emp_dept_new
WHERE dept_name = 'Sales' OR dept_name = 'Development';

-- 8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT employees.last_name, COUNT(employees.last_name) AS "Last Name Count"
FROM employees
GROUP BY employees.last_name
ORDER BY "Last Name Count" DESC;