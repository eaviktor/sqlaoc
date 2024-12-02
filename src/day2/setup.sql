DROP TABLE IF EXISTS day2_part2_sequences_values;

CREATE TABLE day2_part2_sequences_values (
    value_id SERIAL PRIMARY KEY,
    sequence_id INTEGER,
    position INTEGER NOT NULL,
    value NUMERIC NOT NULL,
);

CREATE TEMP TABLE raw (
    line_number SERIAL,
    raw_data TEXT
);

\copy raw (raw_data) FROM './data/day2' WITH (FORMAT text);

INSERT INTO day2_part2_sequences_values (sequence_id, position, value)
SELECT 
    r.line_number as sequence_id,
    row_number() OVER (PARTITION BY r.line_number) as position,
    trim(split.value)::numeric as value
FROM raw r
CROSS JOIN LATERAL unnest(string_to_array(r.raw_data, ' ')) AS split(value)
WHERE trim(split.value) != '';

DROP TABLE raw
