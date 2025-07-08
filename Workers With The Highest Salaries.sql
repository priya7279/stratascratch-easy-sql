/* ───────────────────────────────────────────────────────────────────────────────
   📌 Problem: Job Titles of Highest Paid Employees
   📝 Description: Find the job titles of employees earning the highest salary. 
                  Include all titles if multiple employees share the max salary.
   🎯 Difficulty: Easy
   📂 Source: StrataScratch
──────────────────────────────────────────────────────────────────────────────── */

/*
📊 Tables Used:

worker
| Column Name   | Data Type |
|---------------|-----------|
| worker_id     | BIGINT    |
| first_name    | TEXT      |
| last_name     | TEXT      |
| department    | TEXT      |
| salary        | BIGINT    |
| joining_date  | DATE      |

title
| Column Name     | Data Type |
|------------------|-----------|
| worker_ref_id    | BIGINT    |
| worker_title     | TEXT      |
| affected_from    | DATE      |
*/

/*
📷 Preview of Tables:
- worker:
  [Image](/images/worker_preview.jpeg)

- title:
  [Image](/images/title_preview.jpeg)
*/

/*
🎯 Expected Output:
| worker_title      |
|-------------------|
| Senior Developer  |
| Lead Engineer      |
... (if multiple share the same salary)

🖼️ Screenshot:
[Image](/images/highest_salary_title_output.jpeg)
*/

/*
🧠 Explanation:
- Join the `worker` and `title` tables using worker_id.
- Filter rows where salary equals the maximum salary in the worker table.
- This ensures all highest-paid employees’ titles are returned.
*/

-- ✅ Approach 1: With CTE
WITH cte AS (
  SELECT * 
  FROM worker w
  INNER JOIN title t ON w.worker_id = t.worker_ref_id
)
SELECT worker_title
FROM cte
WHERE salary = (SELECT MAX(salary) FROM worker);

-- ✅ Approach 2: Direct Join
SELECT t.worker_title
FROM worker w
JOIN title t ON w.worker_id = t.worker_ref_id
WHERE w.salary = (SELECT MAX(salary) FROM worker);

/* ───────────────────────────────────────────────────────────────────────────────
   ✅ Output: All job titles of the highest-paid employees
──────────────────────────────────────────────────────────────────────────────── */
