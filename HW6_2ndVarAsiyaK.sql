/*
Асия Казанбасова
Домашняя работа №6
2-ой вариант решения задания
*/
DROP PROCEDURE IF EXISTS convert_seconds_to_time;
DELIMITER $$
CREATE PROCEDURE convert_seconds_to_time(IN seconds INT)
BEGIN
    DECLARE days INT;
    DECLARE hours INT;
    DECLARE minutes INT;
    
    SET days = seconds DIV (24 * 60 * 60);
    SET seconds = seconds - (days * 24 * 60 * 60);
    SET hours = seconds DIV (60 * 60);
    SET seconds = seconds - (hours * 60 * 60);
    SET minutes = seconds DIV 60;
    SET seconds = seconds - (minutes * 60);

    SELECT CONCAT(days, ':', LPAD(hours, 2, '0'), ':', LPAD(minutes, 2, '0'), ':', LPAD(seconds, 2, '0')) AS time_formatted;
END $$
DELIMITER ;

CALL convert_seconds_to_time(123456);