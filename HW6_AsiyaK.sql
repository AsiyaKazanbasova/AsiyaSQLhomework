/*
Асия Казанбасова
Домашняя работа №6
Создайте процедуру, которая принимает кол-во секунд
и возвращает их в формате: кол-во дней, часов, минут и секунд.
Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds'.
*/
DROP PROCEDURE IF EXISTS sec_breakdown;
DELIMITER $$
CREATE PROCEDURE sec_breakdown(seconds INT)
BEGIN
    DECLARE days INT default 0;
    DECLARE hours INT default 0;
    DECLARE minutes INT default 0;

    WHILE seconds >= 86400 DO
    SET days = FLOOR(seconds / 86400);
    SET seconds = seconds % 86400;
    END WHILE;

    WHILE seconds >= 3600 DO
    SET hours = FLOOR(seconds / 3600);
    SET seconds = seconds % 3600;
    END WHILE;

    WHILE seconds >= 60 DO
    SET minutes = FLOOR(seconds / 60);
    SET seconds = seconds % 60;
    END WHILE;

SELECT days, hours, minutes, seconds;
END $$
DELIMITER ;

CALL sec_breakdown(123456);
