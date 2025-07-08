/* ───────────────────────────────────────────────────────────────────────────────
   📌 Problem: Compare Employee Salary with Department Average
   📝 Description: For each employee, compare their salary with the average salary 
                  of their department.
   🎯 Difficulty: Easy
   📂 Source: StrataScratch
──────────────────────────────────────────────────────────────────────────────── */

/*
📊 Table Used:

employee
| Column Name     | Data Type |
|------------------|-----------|
| id               | BIGINT    |
| first_name       | TEXT      |
| last_name        | TEXT      |
| department       | TEXT      |
| salary           | BIGINT    |
| employee_title   | TEXT      |
| age              | BIGINT    |
| bonus            | BIGINT    |
| manager_id       | BIGINT    |
| target           | BIGINT    |
| address          | TEXT      |
| city             | TEXT      |
| email            | TEXT      |
| sex              | TEXT      |
*/

/*
📷 Preview of Table:
- employee:
  [Image](/images/employee_preview.jpeg)
*/

/*
🎯 Expected Output:
| department  | first_name | salary | avg_salary |
|-------------|------------|--------|------------|
| Audit       | Shandler   | 1100   | 950        |
| Audit       | Jason      | 1000   | 950        |
| Audit       | Celine     | 1000   | 950        |
| Audit       | Michale    | 700    | 950        |
| Management  | Katty      |150000  |175000      |
...

🖼️ Screenshot:
[Image](/images/compare_salary_output.jpeg)
*/

/*
🧠 Explanation:
- Use the window function `AVG() OVER(PARTITION BY department)` to calculate 
  average salary per department.
- Select each employee's department, name, salary, and the corresponding average.
*/

-- ✅ SQL Query
SELECT 
  department, 
  first_name, 
  salary, 
  AVG(salary) OVER(PARTITION BY department) AS avg_salary
FROM employee;

/* ───────────────────────────────────────────────────────────────────────────────
   ✅ Output: Each employee's salary with department average
──────────────────────────────────────────────────────────────────────────────── */
