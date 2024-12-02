WITH 
lag_seq AS (
    SELECT 
        sequence_id,
        value - LAG(value)  OVER (
            PARTITION BY sequence_id 
        )  as difference
    FROM day2_part2_sequences_values
) 
SELECT COUNT(sequence_id)
FROM 
    (SELECT 
        sequence_id,
        MIN(SIGN(difference)) >= 0 as all_positive,
        MAX(SIGN(difference)) <= 0 as all_negative,
        bool_and(ABS(difference)  <= 3 AND ABS(difference) > 0) as in_range
    FROM lag_seq
    GROUP BY sequence_id)
WHERE (all_positive OR all_negative) AND in_range;
