with pairs AS (SELECT left_input, right_input,
  ROW_NUMBER() OVER (ORDER BY left_input, id) as left_num,
  ROW_NUMBER() OVER (ORDER BY right_input, id) as right_num
from day1_part1 
),

matched_pairs AS (
    SELECT 
        a.left_input,
        b.right_input,
        ABS(a.left_input - b.right_input) as distance
    FROM 
        (SELECT DISTINCT left_input, left_num
         FROM pairs 
         ORDER BY left_num) a
    JOIN 
        (SELECT DISTINCT right_input, right_num
         FROM pairs
         ORDER BY right_num) b
    ON a.left_num = b.right_num
)
SELECT 
    SUM(distance) as distance
FROM matched_pairs;
