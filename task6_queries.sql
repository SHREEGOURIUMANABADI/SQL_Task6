-- Task 6: Subqueries and Nested Queries
-- Author: [Your Name]
-- Tool used: MySQL Workbench / SQLite

-- 1. Scalar Subquery Example
SELECT name, salary,
    (SELECT AVG(salary) FROM employees) AS average_salary
FROM employees;

-- 2. Correlated Subquery Example
SELECT e1.name, e1.salary
FROM employees e1
WHERE e1.salary > (
    SELECT AVG(e2.salary)
    FROM employees e2
    WHERE e1.department = e2.department
);

-- 3. Subquery with IN
SELECT name
FROM employees
WHERE department_id IN (
    SELECT department_id
    FROM departments
    WHERE location = 'New York'
);

-- 4. Subquery with EXISTS
SELECT name
FROM employees e
WHERE EXISTS (
    SELECT 1
    FROM projects p
    WHERE p.employee_id = e.id
);

-- 5. Subquery in FROM (Derived Table)
SELECT dept, avg_salary
FROM (
    SELECT department AS dept, AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department
) AS dept_avg;
