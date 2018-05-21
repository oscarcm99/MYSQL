DROP DATABASE IF EXISTS FUNCION;
CREATE DATABASE IF NOT EXISTS FUNCION;
USE FUNCION;
delimiter //
CREATE PROCEDURE meses(num INT, nombre CHAR(20))
BEGIN
label1: LOOP
set num = num + 1;
IF num < 13 THEN
ITERATE label1;
END IF;
LEAVE label1;
END LOOP label1;
SET @año = num;
END //
delimiter ;

CALL meses(@x);
SELECT @x;
