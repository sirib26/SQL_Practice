-- 1. Select all records
SELECT * FROM employees;

-- 2. Select specific columns
SELECT name, salary FROM employees;

-- 3. WHERE condition
SELECT * FROM employees WHERE salary > 50000;

-- 4. AND condition
SELECT * FROM employees WHERE salary > 50000 AND department = 'IT';

-- 5. OR condition
SELECT * FROM employees WHERE department = 'HR' OR department = 'Finance';

-- 6. LIKE operator
SELECT * FROM employees WHERE name LIKE 'A%';

-- 7. BETWEEN
SELECT * FROM employees WHERE salary BETWEEN 30000 AND 70000;

-- 8. IN operator
SELECT * FROM employees WHERE department IN ('IT', 'HR');

-- 9. ORDER BY ascending
SELECT * FROM employees ORDER BY salary ASC;

-- 10. ORDER BY descending
SELECT * FROM employees ORDER BY salary DESC;

-- 11. LIMIT
SELECT * FROM employees LIMIT 5;

-- 12. DISTINCT
SELECT DISTINCT department FROM employees;

-- 13. COUNT
SELECT COUNT(*) FROM employees;

-- 14. SUM
SELECT SUM(salary) FROM employees;

-- 15. AVG
SELECT AVG(salary) FROM employees;
