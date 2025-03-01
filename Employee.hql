SELECT * FROM temp_employees WHERE year(join_date) > 2015;

SELECT department, AVG(salary) AS avg_salary
FROM temp_employees
GROUP BY department;

SELECT * FROM temp_employees WHERE project = 'Alpha';

SELECT job_role, COUNT(*) AS num_employees
FROM temp_employees
GROUP BY job_role;

WITH dept_avg AS (
    SELECT department, AVG(salary) AS avg_salary
    FROM temp_employees
    GROUP BY department
)
SELECT e.*
FROM temp_employees e
JOIN dept_avg d ON e.department = d.department
WHERE e.salary > d.avg_salary;

SELECT department, COUNT(*) AS employee_count
FROM temp_employees
GROUP BY department
ORDER BY employee_count DESC
LIMIT 1;

SELECT * FROM temp_employees
WHERE emp_id IS NOT NULL AND name IS NOT NULL AND age IS NOT NULL
AND job_role IS NOT NULL AND salary IS NOT NULL AND project IS NOT NULL
AND join_date IS NOT NULL AND department IS NOT NULL;

SELECT e.*, d.location
FROM temp_employees e
JOIN departments d
ON e.department = d.department_name;

SELECT emp_id, name, department, salary,
RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS salary_rank
FROM temp_employees;

SELECT emp_id, name, department, salary
FROM (
    SELECT emp_id, name, department, salary,
    DENSE_RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS rnk
    FROM temp_employees
) ranked
WHERE rnk <= 3;
