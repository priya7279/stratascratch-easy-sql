/* ───────────────────────────────────────────────────────────────────────────────
   📌 Problem: Salary Difference Between Marketing and Engineering
   📝 Description: Calculates the absolute difference between the highest salaries 
                  in the Marketing and Engineering departments.
   🎯 Difficulty: Easy
   📂 Source: StrataScratch
──────────────────────────────────────────────────────────────────────────────── */

/*
📊 Tables Used:

db_employee
| Column Name   | Data Type |
|---------------|-----------|
| id            | BIGINT    |
| first_name    | TEXT      |
| last_name     | TEXT      |
| salary        | BIGINT    |
| department_id | BIGINT    |

db_dept
| Column Name | Data Type |
|-------------|-----------|
| id          | BIGINT    |
| department  | TEXT      |
*/

/*
📷 Preview of Tables:
- db_employee:
  
- db_dept:
  
*/

/*
🎯 Expected Output:
| absolute_salary_difference |
|----------------------------|
| 2400                       |
*/

/*
🧠 Explanation:
- Join `db_employee` and `db_dept` using department_id to access department names.
- Use conditional aggregation (CASE + MAX) to get the top salary in each department.
- Subtract and wrap with ABS() to ensure a positive result.
- Returns a single column: absolute_salary_difference.
*/

SELECT ABS(
  MAX(CASE WHEN d.department = 'Marketing' THEN e.salary END) -
  MAX(CASE WHEN d.department = 'Engineering' THEN e.salary END)
) AS absolute_salary_difference
FROM db_employee e
JOIN db_dept d ON e.department_id = d.id
WHERE d.department IN ('Marketing', 'Engineering');

/* ───────────────────────────────────────────────────────────────────────────────
   ✅ Output: A single number representing the absolute difference
──────────────────────────────────────────────────────────────────────────────── */
