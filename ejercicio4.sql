DROP DATABASE IF EXISTS Starwars;
CREATE DATABASE Starwars;
USE Starwars;
CREATE TABLE ACTORES(	
			codigo INTEGER,
			nombre VARCHAR(40), 
			fecha DATE, 
			nacionalidad VARCHAR(20),
			PRIMARY KEY(codigo));
CREATE TABLE PERSONAJES(
			codigo INTEGER, 
			nombre VARCHAR(30), 
			raza VARCHAR(30), 
			grado VARCHAR(20), 
			codigoActor INTEGER, 
			PRIMARY KEY(codigo), 
			CONSTRAINT FK_ACTORES FOREIGN KEY(codigoActor) REFERENCES ACTORES(codigo) ON UPDATE CASCADE);
INSERT INTO ACTORES VALUES(1,'Jedi','2015-02-03','Noruega'),(2,'Chewbacca','2009-01-31','Sueca');
INSERT INTO PERSONAJES VALUES(100,'Juan','Merchero','Genio',1),(101,'Olga','Nose','Genia',2);
UPDATE ACTORES SET codigo = 3 WHERE codigo = 1;
DELETE FROM PERSONAJES WHERE codigoActor=2;
ALTER TABLE PERSONAJES CHANGE codigo numero INTEGER;
SELECT numero,nombre,codigoActor FROM PERSONAJES;
SELECT * FROM ACTORES WHERE codigo = 3;
