--drop table departments
create table departments(
dept_no char(4),
dept_name varchar(60),
primary key (dept_no));
select * from departments 

--drop table dept_emp
create table dept_emp(
emp_no INT Not Null,
dept_no char(4),
Primary Key (dept_no, emp_no));
Select * from dept_emp

--drop table dept_manager
Create table dept_manager(
dept_no char(4),
Emp_no int not null,
Primary Key (dept_no, emp_no));
select * from dept_manager

--drop table employees
create table employees(
emp_no Int not null,
emp_title_id char(5),
brith_date DATE not null,
first_name varchar(60),
last_name varchar(60),
gender varchar(60),
hire_date DATE not null,
Primary Key (emp_no));
Select * from employees

--drop table salaries
create table salaries(
emp_no INT not null,
salary INT not null,
Primary Key (emp_no))
Select * from salaries

--drop table titles
create table titles(
title_id Char(5),
title Varchar(60),
Primary key (title_id))
select * from titles

Select 
e.emp_no,
e.last_name,
e.first_name,
e.gender,
s.salary
From employees e
join salaries s 
on e.emp_no = s.emp_no;

SELECT * FROM employees
WHERE DATE_PART('year',hire_date) = 1986
ORDER BY emp_no;


select * from dept_manager

/*SELECT dept_manager.dept_no, 
	   departments.dept_name,
	   dept_manager.emp_no,
	   employees.last_name,
	   employees.first_name,
FROM dept_manager
INNER JOIN departments ON
dept_manager.dept_no = departments.dept_no
INNER JOIN Employees ON
dept_manager.emp_no = employees.emp_no;*/

Select employees.emp_no,
employees.last_name,
employees.first_name,
departments.dept_name
FROM employees 
INNER JOIN dept_emp ON employees.emp_no=dept_emp.emp_no
INNER JOIN departments ON departments.dept_no=dept_emp.dept_no
order by emp_no;

Select * from employees 
where first_name = 'Hercules' and last_name like 'B%';

SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
JOIN employees
ON dept_emp.emp_no = employees.emp_no
JOIN departments
ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales';

SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
JOIN employees
ON dept_emp.emp_no = employees.emp_no
JOIN departments
ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales'
or departments.dept_name = 'Development';

SELECT last_name, COUNT(*) AS freq_count
FROM employees
GROUP BY last_name
ORDER BY freq_count DESC;