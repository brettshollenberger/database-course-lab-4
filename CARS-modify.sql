DELETE FROM cars WHERE (weight < 4900 AND (year < 1981 OR (acceleration_time<>14 AND acceleration_time<>15)));
select id AS 'Car', mpg AS "Milage", engine_displacement AS "Engine Displacement", acceleration_time AS "0 to 60mph in...", year AS "Produced in" FROM cars;
select * FROM cars ORDER BY year;
