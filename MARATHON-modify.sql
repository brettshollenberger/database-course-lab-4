DELETE FROM runners WHERE place > 4;
START TRANSACTION;
ALTER TABLE runners DROP COLUMN group_place;
ALTER TABLE runners DROP COLUMN group_name;
ALTER TABLE runners DROP COLUMN age;
ALTER TABLE runners DROP COLUMN sex;
ALTER TABLE runners DROP COLUMN bib_number;
ALTER TABLE runners DROP COLUMN first_name;
ALTER TABLE runners DROP COLUMN last_name;
ALTER TABLE runners DROP COLUMN town;
ALTER TABLE runners DROP COLUMN state;
COMMIT;
ALTER TABLE runners MODIFY COLUMN id integer;
ALTER TABLE runners DROP PRIMARY KEY;
ALTER TABLE runners ADD PRIMARY KEY (`place`);
ALTER TABLE runners DROP INDEX `place`;
ALTER TABLE runners DROP COLUMN id;
SELECT * FROM runners ORDER BY place;
SELECT DATE_FORMAT(time, "%H %i %s") FROM runners ORDER BY place;
UPDATE runners SET run_time_in_seconds=TIME_TO_SEC(time);
SELECT * FROM runners ORDER BY place;