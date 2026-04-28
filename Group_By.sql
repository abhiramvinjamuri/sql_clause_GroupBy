use practice;
show tables;
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50) NOT NULL,
    department VARCHAR(50),
    job_role VARCHAR(50),
    salary INT,
    age INT,
    manager_id INT
);

INSERT INTO employees VALUES
(1, 'Abhiram', 'IT', 'Developer', 50000, 25, 101),
(2, 'Anjali', 'HR', 'Recruiter', 35000, 28, 102),
(3, 'Arjun', 'Finance', 'Analyst', 45000, 32, 103),
(4, 'Bhanu', 'IT', 'Tester', 30000, 27, 101),
(5, 'Charan', 'HR', 'Manager', 60000, 40, NULL),
(6, 'Deepika', 'Finance', 'Clerk', 25000, 30, 103),
(7, 'Akhil', 'IT', 'Developer', 70000, 29, 101),
(8, 'Divya', 'Marketing', 'Executive', 28000, 26, NULL),
(9, 'Aravind', 'IT', 'Manager', 80000, 38, NULL),
(10, 'Esha', 'Finance', 'Analyst', 55000, 33, 103),
(11, 'Ananya', 'HR', 'Executive', 32000, 24, 102),
(12, 'Kiran', 'IT', 'Developer', 42000, 31, 101),
(13, 'Lokesh', 'Marketing', 'Manager', 65000, 36, NULL),
(14, 'Ajay', 'Finance', 'Manager', 75000, 41, NULL),
(15, 'Sneha', 'HR', 'Recruiter', 31000, 29, 102);

-- 1.Fetch all employees who earn more than ₹40,000.
SELECT emp_name,salary FROM employees
WHERE salary>40000;

-- 2. Get all employees whose names start with the letter 'A'.
SELECT emp_name FROM employees
WHERE emp_name LIKE 'A%';

-- 3. Retrieve all employees where the department is either 'HR' or 'Finance'.
SELECT emp_id,emp_name,department FROM employees
WHERE department IN ('HR','Finance');

-- 4. Find all employees where the manager field has no value (is NULL).
SELECT emp_id,emp_name FROM employees
WHERE manager_id IS NULL;

-- 5.Count the number of employees in each department, but only include employees earning more than ₹30,000
SELECT department,COUNT(*) 
FROM employees
WHERE salary >30000
GROUP BY department;

-- 6.Find the average salary for each job_role in the 'IT' department
SELECT department,job_role, avg(salary)
from employees
WHERE department = 'IT'
group by department,job_role;

-- 7.Show the total salary paid per department and per job_role for employees aged under 35.
SELECT department,job_role, sum(salary) as pay_per_dept
from employees
where age < 35
group by department,job_role;

-- 8.Find the total salary paid to employees in each department.
SELECT department,sum(salary)
from employees
group by department;

-- 9. Count the total number of employees in each department.
SELECT department,count(department)
from employees
group by department;

-- 10. Find the average salary of employees in each department.
SELECT department,avg(salary)
from employees
group by department;

-- 11. Show the count of employees for each department and job_role combination.
SELECT department,job_role,count(*) as total_emp
from employees
group by department,job_role;

