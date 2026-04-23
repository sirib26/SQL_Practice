-- 16. GROUP BY
SELECT department, COUNT(*) FROM employees GROUP BY department;

-- 17. HAVING
SELECT department, AVG(salary)
FROM employees
GROUP BY department
HAVING AVG(salary) > 50000;

-- 18. INNER JOIN
SELECT e.name, d.department_name
FROM employees e
INNER JOIN departments d
ON e.department_id = d.id;

-- 19. LEFT JOIN
SELECT e.name, d.department_name
FROM employees e
LEFT JOIN departments d
ON e.department_id = d.id;

-- 20. RIGHT JOIN
SELECT e.name, d.department_name
FROM employees e
RIGHT JOIN departments d
ON e.department_id = d.id;

-- 21. Self Join
SELECT e1.name, e2.name AS manager
FROM employees e1
JOIN employees e2
ON e1.manager_id = e2.id;

-- 22. Subquery
SELECT name FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

-- 23. EXISTS
SELECT name FROM employees e
WHERE EXISTS (
    SELECT 1 FROM departments d WHERE d.id = e.department_id
);

-- 24. CASE
SELECT name,
CASE
    WHEN salary > 70000 THEN 'High'
    WHEN salary > 40000 THEN 'Medium'
    ELSE 'Low'
END AS salary_level
FROM employees;

-- 25. COALESCE
SELECT name, COALESCE(bonus, 0) FROM employees;

-- 26. UNION
SELECT name FROM employees
UNION
SELECT name FROM managers;

-- 27. UNION ALL
SELECT name FROM employees
UNION ALL
SELECT name FROM managers;

-- 28. VIEW
CREATE VIEW high_salary AS
SELECT * FROM employees WHERE salary > 60000;

-- 29. UPDATE
UPDATE employees SET salary = salary + 5000 WHERE department = 'IT';

-- 30. DELETE
DELETE FROM employees WHERE salary < 20000;
