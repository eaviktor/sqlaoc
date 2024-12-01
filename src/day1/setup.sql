DROP TABLE IF EXISTS day1_part1;
CREATE TABLE day1_part1 (
  id INT PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
  left_input INT,
  right_input INT
);

\copy day1_part1 (left_input, right_input) FROM PROGRAM 'tr -s " " < ./data/day1_part1' WITH (FORMAT text, DELIMITER ' ');