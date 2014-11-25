START TRANSACTION;

ALTER TABLE students ADD COLUMN gpa float;

DELIMITER $$

CREATE TRIGGER `before_insert_students` BEFORE INSERT ON `students`
FOR EACH ROW
BEGIN
    IF NEW.gpa < 0.0 OR NEW.gpa > 5.0 THEN
        SIGNAL SQLSTATE '12345' set message_text = "GPA cannot be less than 0.0 or greater than 5.0";
    END IF;
END$$

DELIMITER;

DELIMITER $$
CREATE TRIGGER `before_update_students` BEFORE UPDATE on `students`
FOR EACH ROW
BEGIN
	IF NEW.gpa < 0.0 OR NEW.gpa > 5.0 THEN
		SIGNAL SQLSTATE '12345' set message_text="GPA less than 0.0 or greater than 5.0";
	END IF;
END$$
DELIMITER ;

UPDATE students SET gpa=4.0 WHERE grade=0;
UPDATE students SET gpa=2.8 WHERE classroom=112;
UPDATE students SET gpa=3.0 WHERE grade=1 AND classroom <> 102;
UPDATE students SET gpa=3.2 WHERE gpa IS NULL;
UPDATE students SET gpa=4.0 WHERE (first_name="Elton" AND last_name="Fulvio") OR (first_name="Anika" AND last_name="Yuen") OR (first_name="Janee" AND last_name="Danese");

SELECT * FROM students ORDER BY last_name;

COMMIT;
