/*APARTADO A*/
DROP DATABASE IF EXISTS ZOO;
CREATE DATABASE ZOO;
USE ZOO
CREATE TABLE ZOO(
			nombre VARCHAR(30), 
			ciudad VARCHAR(30), 
			pais VARCHAR(30), 
			tamaño ENUM('Categoria A','Categoria B'), 
			presupuesto FLOAT UNSIGNED, 
			PRIMARY KEY(nombre)
			);
CREATE TABLE ESPECIE(
			nomcientifico VARCHAR(40), 
			nomvulgar VARCHAR(30) NOT NULL, 
			familia VARCHAR(20), 
			peligro VARCHAR(30), 
			PRIMARY KEY(nomcientifico)
			);
CREATE TABLE ANIMAL(
			ID INT, 
			nomzoo VARCHAR(30), 
			nomespecie VARCHAR(40), 
			sexo ENUM('m','h'), 
			añonacim YEAR, 
			pais VARCHAR(30), 
			continente VARCHAR(20), 
			PRIMARY KEY(ID), 
			CONSTRAINT FK_ZOO FOREIGN KEY(nomzoo) REFERENCES ZOO(nombre), 
			CONSTRAINT FK_ESPECIE FOREIGN KEY(nomespecie) REFERENCES ESPECIE(nomcientifico)
			);
/*APARTADO B*/
ALTER TABLE ANIMAL MODIFY ID INT AUTO_INCREMENT;
ALTER TABLE ANIMAL DROP FOREIGN KEY FK_ZOO;
ALTER TABLE ANIMAL ADD CONSTRAINT FK_ZOO FOREIGN KEY (nomzoo) REFERENCES ZOO(nombre) ON DELETE SET NULL ON UPDATE CASCADE;
/*APARTADO C*/
INSERT INTO ZOO VALUES('Zoo Madrid','Madrid','España','Categoria A',0);
INSERT INTO ESPECIE VALUES('Panthera tigris','Tigre','Felinos','Alto');
INSERT INTO ANIMAL (nomzoo,nomespecie,sexo,añonacim,pais,continente) VALUES('Zoo Madrid','Panthera tigris','m',2023,'India','Asia');
/*APARTADO D*/
UPDATE ZOO SET nombre = 'Zoo Madrid-Vodafone' WHERE nombre='Zoo Madrid';
SELECT * FROM ZOO;
SELECT * FROM ANIMAL;


