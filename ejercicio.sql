DROP DATABASE IF EXISTS ORDEN;
CREATE DATABASE ORDEN;
USE ORDEN
CREATE TABLE PERSONAS(ID INT, Nombre VARCHAR(30), Apellidos VARCHAR(30), FechaNacimiento DATE, PrecioPujado FLOAT, Ciudad VARCHAR(30), PRIMARY KEY(ID));
CREATE TABLE ORDEN(ID INT,NumeroOrden INT, ID_PERSONAS INT, PRIMARY KEY(ID), CONSTRAINT FK_PERSONAS FOREIGN KEY(ID_PERSONAS) REFERENCES PERSONAS(ID) ON UPDATE CASCADE);
INSERT INTO PERSONAS VALUES(1,'Oscar','Calderon','1999-10-27',234.32,'Madrid'),(2,'Jose','Garcia','1999-12-01',100.82,'Madrid'),(3,'Juan','Fernandez','1999-03-12',500.90,'Madrid'),(4,'Luis','Jimenez','1990-01-03',294.00,'Madrid'),(5,'Lorenzo','Bañol','1995-09-21',100.22,'Madrid');
INSERT INTO ORDEN VALUES(100,34,1),(101,12,2),(102,45,3),(103,50,4),(104,43,5);
UPDATE PERSONAS SET ID = 6 WHERE ID = 1;
DELETE FROM ORDEN WHERE ID_PERSONAS = 6; 
SELECT * FROM ORDEN;
SHOW CREATE TABLE ORDEN;
ALTER TABLE ORDEN DROP FOREIGN KEY FK_PERSONAS;
