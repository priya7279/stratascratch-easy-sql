/* ───────────────────────────────────────────────────────────────────────────────
   📌 Problem: Current Salary of Each Employee
   📝 Description: From a table containing multiple salary records per employee, 
                  retrieve the latest salary (highest) per employee.
   🎯 Difficulty: Easy
   📂 Source: StrataScratch
──────────────────────────────────────────────────────────────────────────────── */

/*
📊 Table Used:

ms_employee_salary
| Column Name   | Data Type |
|---------------|-----------|
| id            | BIGINT    |
| first_name    | TEXT      |
| last_name     | TEXT      |
| department_id | BIGINT    |
| salary        | BIGINT    |
*/

/*
📷 Preview of Table:
- ms_employee_salary:
  [Image](/images/ms_employee_salary_preview.jpeg)
*/

/*
🎯 Expected Output:
| id | first_name | last_name | department_id | salary |
|----|------------|-----------|----------------|--------|
| 1  | John       | Smith     | 2              | 80000  |
... (and so on)

*/

/*
🧠 Explanation:
- Since salary increases each year, the highest salary for each employee is the most recent one.
- We use ROW_NUMBER() to rank salaries per employee in descending order.
- Then we filter to keep only the latest (row_num = 1).
- Alternative solution: use MAX(salary) with GROUP BY.
*/

-- ✅ Approach 1: Using ROW_NUMBER()
WITH ranked_salaries AS (
  SELECT id, first_name, last_name, department_id, salary,
         ROW_NUMBER() OVER(PARTITION BY id ORDER BY salary DESC) AS row_num
  FROM ms_employee_salary
)
SELECT id, first_name, last_name, department_id, salary
FROM ranked_salaries
WHERE row_num = 1
ORDER BY id;

-- ✅ Approach 2: Using MAX()
SELECT id, first_name, last_name, department_id, MAX(salary) AS max_salary
FROM ms_employee_salary
GROUP BY id, first_name, last_name, department_id
ORDER BY id;

/* ───────────────────────────────────────────────────────────────────────────────
   ✅ Output: One row per employee with their latest salary
──────────────────────────────────────────────────────────────────────────────── */
