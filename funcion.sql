DROP DATABASE IF EXISTS meses;
CREATE DATABASE IF NOT EXISTS meses;
USE meses;

CREATE TABLE month(numero INT, nombre VARCHAR(20));
INSERT INTO month VALUES(1,'Enero'),(2,'Febrero'),(3,'Marzo'),(4,'Abril'),(5,'Mayo'),(6,'Junio'),(7,'Julio'),(8,'Agosto'),(9,'Septiembre'),(10,'Octubre'),(11,'Noviembre'),(12,'Diciembre');

CREATE FUNCTION dameMes(n INT)
RETURNS VARCHAR(20) DETERMINISTIC
RETURN (SELECT nombre FROM month WHERE numero = n);
SELECT dameMes(12);

delimiter //
CREATE PROCEDURE imprimeMeses()
BEGIN
SELECT * FROM month;
END //
delimiter ;
call imprimeMeses;

/*
show function status;
funciones
procedimiento en jaridneria actualización limite credito. Tabla LimiteCredito(Fecha,CodigoCliente,Incremento,Incremento total) para incrementar el porcentaje en un 15% que se aplique a clientes mas antiguos del 2010
procedimiento facturacion tabla Faturas(ID,CodigoCliente,CodigoPedido,PrecioTotal)
*/
