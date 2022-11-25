# SQL-challenge
Module 9 Homework GT DV Boot Camp

This challenge was analyzing 6 different databases and performing inner joins to display results.

I used the QuickSQLDB website at https://www.quickdatabasediagrams.com/ and have uploaded a picture of my final ERD:

![QuickDBD-Free Diagram](https://user-images.githubusercontent.com/112498067/204038516-2b8caa28-9613-4700-bcf6-d632a51300da.png)

The code generated is as follows:

CREATE TABLE "titles" (
    "title_id" VARCHAR   NOT NULL,
    "title" VARCHAR   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "title_id"
     )
);

CREATE TABLE "employees" (
    "emp_no" INT   NOT NULL,
    "title_id" VARCHAR   NOT NULL,
    "birth_date" DATE   NOT NULL,
    "first_name" VARCHAR   NOT NULL,
    "last_name" VARCHAR   NOT NULL,
    "sex" VARCHAR   NOT NULL,
    "hire_date" DATE   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "salaries" (
    "emp_no" INT   NOT NULL,
    "salary" VARCHAR   NOT NULL,
    CONSTRAINT "pk_salaries" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "departments" (
    "dept_no" VARCHAR   NOT NULL,
    "dept_name" VARCHAR   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "dept_manager" (
    "dept_no" VARCHAR   NOT NULL,
    "emp_no" INT   NOT NULL,
    CONSTRAINT "pk_dept_manager" PRIMARY KEY (
        "dept_no","emp_no"
     )
);

CREATE TABLE "dept_emp" (
    "emp_no" INT   NOT NULL,
    "dept_no" VARCHAR   NOT NULL,
    CONSTRAINT "pk_dept_emp" PRIMARY KEY (
        "emp_no","dept_no"
     )
);

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_title_id" FOREIGN KEY("title_id")
REFERENCES "titles" ("title_id");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

I then performed queries per the instructions and returned the correct results. Here is the code:

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
