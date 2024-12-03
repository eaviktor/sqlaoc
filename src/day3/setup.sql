DROP TABLE IF EXISTS day3_part1;

CREATE TABLE day3_part1(
    line_number SERIAL,
    raw_data TEXT
);


\copy day3_part1(raw_data) FROM './data/day3' WITH (FORMAT text);

