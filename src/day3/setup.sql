DROP TABLE IF EXISTS day1_part1;

CREATE TABLE day1_part1(
    line_number SERIAL,
    raw_data TEXT
);


\copy day1_part1(raw_data) FROM './data/day1' WITH (FORMAT text);

