-- 31. ROW_NUMBER
SELECT name, salary,
ROW_NUMBER() OVER (ORDER BY salary DESC) AS rank
FROM employees;

-- 32. RANK
SELECT name, salary,
RANK() OVER (ORDER BY salary DESC) AS rank
FROM employees;

-- 33. DENSE_RANK
SELECT name, salary,
DENSE_RANK() OVER (ORDER BY salary DESC) AS rank
FROM employees;

-- 34. LEAD
SELECT name, salary,
LEAD(salary) OVER (ORDER BY salary) AS next_salary
FROM employees;

-- 35. LAG
SELECT name, salary,
LAG(salary) OVER (ORDER BY salary) AS prev_salary
FROM employees;

-- 36. Running total
SELECT name, salary,
SUM(salary) OVER (ORDER BY salary) AS running_total
FROM employees;

-- 37. Partition by
SELECT department, name, salary,
SUM(salary) OVER (PARTITION BY department) AS dept_total
FROM employees;

-- 38. Top 3 salaries
SELECT * FROM (
    SELECT name, salary,
    ROW_NUMBER() OVER (ORDER BY salary DESC) AS rn
    FROM employees
) t WHERE rn <= 3;

-- 39. Second highest salary
SELECT MAX(salary)
FROM employees
WHERE salary < (SELECT MAX(salary) FROM employees);

-- 40. Duplicate records
SELECT name, COUNT(*)
FROM employees
GROUP BY name
HAVING COUNT(*) > 1;

-- 41. Remove duplicates
DELETE FROM employees
WHERE id NOT IN (
    SELECT MIN(id)
    FROM employees
    GROUP BY name
);

-- 42. Recursive CTE
WITH RECURSIVE emp_hierarchy AS (
    SELECT id, name, manager_id
    FROM employees
    WHERE manager_id IS NULL
    UNION ALL
    SELECT e.id, e.name, e.manager_id
    FROM employees e
    JOIN emp_hierarchy eh ON e.manager_id = eh.id
)
SELECT * FROM emp_hierarchy;

-- 43. Pivot (basic)
SELECT department,
SUM(CASE WHEN gender = 'M' THEN 1 ELSE 0 END) AS male_count,
SUM(CASE WHEN gender = 'F' THEN 1 ELSE 0 END) AS female_count
FROM employees
GROUP BY department;

-- 44. Window avg
SELECT name, salary,
AVG(salary) OVER () AS avg_salary
FROM employees;

-- 45. CTE
WITH high_paid AS (
    SELECT * FROM employees WHERE salary > 60000
)
SELECT * FROM high_paid;
