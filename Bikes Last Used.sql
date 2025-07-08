/* ───────────────────────────────────────────────────────────────────────────────
   📌 Problem: Last Time Each Bike Was Used
   📝 Description: Find the most recent return time (`end_time`) for every unique 
                  bike. Output bike number and date-time of last use.
   🎯 Difficulty: Easy
   📂 Source: StrataScratch
──────────────────────────────────────────────────────────────────────────────── */

/*
📊 Table Used:

dc_bikeshare_q1_2012
| Column Name      | Data Type |
|------------------|-----------|
| id               | BIGINT    |
| duration         | TEXT      |
| duration_seconds | BIGINT    |
| start_time       | TIMESTAMP |
| end_time         | TIMESTAMP |
| start_station    | TEXT      |
| end_station      | TEXT      |
| start_terminal   | BIGINT    |
| end_terminal     | BIGINT    |
| bike_number      | TEXT      |
| rider_type       | TEXT      |
*/

/*
📷 Preview of Table:
- dc_bikeshare_q1_2012:
  [Image](/images/dc_bikeshare_q1_2012_preview.jpeg)
*/

/*
🎯 Expected Output:
| bike_number | last_used          |
|-------------|--------------------|
| W21223      | 2012-03-31 23:59:00|
| ...         | ...                |

🖼️ Screenshot:
[Image](/images/last_bike_use_output.jpeg)
*/

/*
🧠 Explanation:
- Use a window function (RANK) to rank `end_time` values per `bike_number` in 
  descending order (latest first).
- Filter where rank = 1 to get the latest usage.
- Finally, order by `last_used` descending to get the most recently used bikes on top.
*/

-- ✅ SQL Query
WITH cte AS (
  SELECT 
    bike_number,
    end_time,
    RANK() OVER(PARTITION BY bike_number ORDER BY end_time DESC) AS rnk
  FROM dc_bikeshare_q1_2012
)
SELECT 
  bike_number,
  end_time AS last_used
FROM cte
WHERE rnk = 1
ORDER BY last_used DESC;

/* ───────────────────────────────────────────────────────────────────────────────
   ✅ Output: Latest end_time per bike, ordered by most recent usage
──────────────────────────────────────────────────────────────────────────────── */
