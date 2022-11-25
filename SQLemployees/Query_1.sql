-- List the employee number, last name, first name, sex, and salary of each employee.
select employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
from employees
inner join salaries on
salaries.emp_no = employees.emp_no;

--List the first name, last name, and hire date for the employees who were hired in 1986.
select employees.first_name, employees.last_name, employees.hire_date
from employees
where extract(year from hire_date) = 1986
order by "hire_date";

--List the manager of each department along with their department number, 
--department name, employee number, last name, and first name.
 SELECT departments.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
 from departments
 inner join dept_manager on
 departments.dept_no = dept_manager.dept_no
 inner join employees on
 employees.emp_no = dept_manager.emp_no;
 
 --List the department number for each employee along with that employee’s employee number, 
 --last name, first name, and department name.
SELECT departments.dept_no, departments.dept_name, dept_emp.emp_no, employees.first_name, employees.last_name
from departments
inner join dept_emp on
departments.dept_no = dept_emp.dept_no
inner join employees on
employees.emp_no = dept_emp.emp_no;

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
select employees.first_name, employees.last_name, employees.sex
from employees
where first_name in ('Hercules') and last_name like 'B%'
order by "last_name";

--List each employee in the Sales department, including their employee number, last name, and first name.
SELECT departments.dept_name, dept_emp.emp_no, employees.last_name, employees.first_name
from departments
inner join dept_emp on
departments.dept_no = dept_emp.dept_no
inner join employees on
employees.emp_no = dept_emp.emp_no
where dept_name in ('Sales');

--List each employee in the Sales and Development departments, including their employee number, 
--last name, first name, and department name.
SELECT departments.dept_name, dept_emp.emp_no, employees.last_name, employees.first_name
from departments
inner join dept_emp on
departments.dept_no = dept_emp.dept_no
inner join employees on
employees.emp_no = dept_emp.emp_no
where dept_name in ('Sales', 'Development')
order by "dept_name";

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
Select employees.last_name, count(last_name) as frequency
from employees
group by employees.last_name
order by "last_name";



