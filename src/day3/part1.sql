SELECT 
    sum(first_number::integer * second_number::integer) as result
FROM 
    (SELECT 
        line_number,
        (regexp_matches(raw_data, 'mul\((\d+),(\d+)\)', 'g'))[1]::integer as first_number,
        (regexp_matches(raw_data, 'mul\((\d+),(\d+)\)', 'g'))[2]::integer as second_number
    FROM day3_part1)


