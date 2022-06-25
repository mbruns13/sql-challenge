-- List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
JOIN salaries
    ON employees.emp_no = salaries.emp_no;


-- List first name, last name, and hire date for employees who were hired in 1986.
SELECT employees.first_name, employees.last_name, employees.hire_date
FROM employees
WHERE employees.hire_date LIKE '%1986';


-- List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, last name, first name.
SELECT dept_manager.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
FROM dept_manager
JOIN departments
    ON departments.dept_no = dept_manager.dept_no
JOIN employees
    ON dept_manager.emp_no = employees.emp_no;


-- List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
JOIN dept_emp
    ON employees.emp_no = dept_emp.emp_no
JOIN departments
    ON dept_emp.dept_no = departments.dept_no;


-- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT employees.first_name, employees.last_name, employees.sex
FROM employees
WHERE employees.first_name = 'Hercules' AND employees.last_name LIKE 'B%';


-- List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
JOIN dept_emp
    ON employees.emp_no = dept_emp.emp_no
JOIN departments
    ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales';


-- List all employees in the Sales and Development departments, 
-- including their employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
JOIN dept_emp
    ON employees.emp_no = dept_emp.emp_no
JOIN departments
    ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales' OR departments.dept_name = 'Development';


-- List the frequency count of employee last names (i.e., how many employees share each last name) in descending order.
SELECT employees.last_name, COUNT(employees.last_name) AS "Frequency Count of Employee Last Name"
FROM employees
GROUP BY employees.last_name
ORDER BY "Frequency Count of Employee Last Name" DESC;



-- BONUS
-- create joined view of salary and title to use for bar chart in JupyterLab file
CREATE VIEW salary_titles AS
SELECT salaries.salary, titles.title
FROM salaries
JOIN employees
    ON employees.emp_no = salaries.emp_no
JOIN titles
    ON employees.emp_title_id = titles.title_id;

SELECT * FROM salary_titles;