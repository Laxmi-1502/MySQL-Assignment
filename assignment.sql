CREATE TABLE department(
  dept_id INT PRIMARY KEY,
  dept_name VARCHAR(40),
  location VARCHAR(50)
);

CREATE TABLE employees(
  emp_id INT PRIMARY KEY,
  name VARCHAR(60),
  salary INT,
  dept_id INT,
  city VARCHAR(60),
  FOREIGN KEY (dept_id) REFERENCES department(dept_id)
);

INSERT INTO department VALUES
(1,'HR','Mumbai'),
(2,'Finance','Pune'),
(3,'IT','Bangalore');

INSERT INTO employees VALUES
(101,'Aarav',55000,1,'Mumbai'),
(102,'Kritika',72000,3,'Pune'),
(103,'Riya',48000,2,'Delhi'),
(104,'Manish',90000,3,'Bangalore'),
(105,'Zoya',30000,1,'Mumbai');

SELECT 
  COUNT(*) AS total_employees,
  MIN(salary) AS lowest_salary,
  MAX(salary) AS highest_salary,
  AVG(salary) AS avg_salary,
  SUM(salary) AS total_salary
FROM employees;

SELECT name, UPPER(name) AS upper_name, LOWER(city) AS lower_city 
FROM employees;

SELECT name, LENGTH(name) AS name_length
FROM employees;

SELECT name, SUBSTRING(name,1,3) AS first_three_letters
FROM employees;

SELECT salary,
  ABS(salary) AS abs_salary,
  ROUND(salary/12,2) AS monthly_salary,
  CEIL(salary/10000.0) AS ceil_example,
  FLOOR(salary/10000.0) AS floor_example
FROM employees;

SELECT name, salary,
CASE
  WHEN salary >= 80000 THEN 'A+ Grade'
  WHEN salary >= 60000 THEN 'A Grade'
  WHEN salary >= 40000 THEN 'B Grade'
  ELSE 'C Grade'
END AS Salary_Grade
FROM employees;

SELECT e.name, e.salary, d.dept_name, d.location
FROM employees e
JOIN department d ON e.dept_id = d.dept_id;

SELECT e.name, d.dept_name
FROM employees e
LEFT JOIN department d ON e.dept_id = d.dept_id;

SELECT e.name, d.dept_name
FROM employees e
RIGHT JOIN department d ON e.dept_id = d.dept_id;
