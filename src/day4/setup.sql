DROP TABLE IF EXISTS day4_part1;

CREATE TABLE day4_part1(
    line_number SERIAL,
    raw_data TEXT
);


\copy day4_part1(raw_data) FROM './data/day4' WITH (FORMAT text);

