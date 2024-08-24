


-- List the employee number, last name, first name, sex, and salary of each employee.
SELECT employees.emp_no, first_name, last_name, salary
FROM employees
LEFT JOIN salaries ON employees.emp_no = salaries.emp_no
-- List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT employees.emp_no, first_name, last_name, salary, hire_date
FROM employees
LEFT JOIN salaries ON employees.emp_no = salaries.emp_no
WHERE hire_date LIKE '%/1986'
-- List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT DM.dept_no, D.dept_name, DM.emp_no, E.first_name, E.last_name
FROM dept_manager as DM
LEFT JOIN department as D ON DM.dept_no = D.dept_no  
LEFT JOIN employees as E ON DM.emp_no = E.emp_no;
-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT DE.dept_no,E.emp_no,E.last_name,E.first_name,D.dept_name
FROM employees as E
LEFT JOIN dept_emp as DE ON E.emp_no = DE.emp_no
LEFT JOIN department as D ON DE.dept_no = D.dept_no
ORDER BY DE.dept_no;
-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT E.first_name, E.last_name, E.sex
FROM employees as E
WHERE E.first_name = 'Hercules'
AND E.last_name LIKE 'B%';
-- List each employee in the Sales department, including their employee number, last name, and first name.
SELECT E.emp_no,E.first_name,E.last_name,D.dept_name
FROM employees AS E
LEFT JOIN dept_emp AS DE ON E.emp_no = DE.emp_no
LEFT JOIN department AS D ON DE.dept_no = D.dept_no
WHERE D.dept_name = 'Sales';
-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT E.emp_no,E.first_name,E.last_name,D.dept_name
FROM employees AS E
LEFT JOIN dept_emp AS DE ON E.emp_no = DE.emp_no
LEFT JOIN department AS D ON DE.dept_no = D.dept_no
WHERE D.dept_name = 'Sales'
OR D.dept_name = 'Development'
-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT E.last_name, COUNT(*)
FROM employees AS E
GROUP BY E.last_name 
ORDER BY 2 DESC