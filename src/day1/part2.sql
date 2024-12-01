SELECT sum(occurrences) FROM (
SELECT 
    left_input * (SELECT COUNT(*) FROM day1_part1 b WHERE b.right_input = a.left_input) as occurrences
FROM day1_part1 a
ORDER BY occurrences DESC)
