DROP DATABASE IF EXISTS star;
CREATE DATABASE star;
USE star
CREATE TABLE ACTOR(
			codigo INT, 
			nombre VARCHAR(40), 
			fecha DATE, 
			nacionalidad VARCHAR(20), 
			PRIMARY KEY(codigo)
			);
CREATE TABLE PERSONAJE(
			codigo INT, 
			nombre VARCHAR(40), 
			raza VARCHAR(40), 
			codigo_ACTOR INT, 
			codigoSuperior_Personaje INT, 
			PRIMARY KEY(codigo,codigo_ACTOR), 
			FOREIGN KEY(codigo_ACTOR) REFERENCES ACTOR(codigo)
				);
CREATE TABLE PLANETA (
			codigo INT, 
			galaxia VARCHAR(20), 
			nombre VARCHAR(20), 
			PRIMARY KEY(codigo)
				);
CREATE TABLE PELICULA (
				codigo INT, 
				titulo VARCHAR(20), 
				director VARCHAR(40), 
				año INT, 
				PRIMARY KEY(codigo)
				);
CREATE TABLE NAVE(
				codigo INT, 
				nºtripulantes INT , 
				nombre VARCHAR(20), 
				PRIMARY KEY(codigo)
				);
CREATE TABLE PERSONAJEPELICULA (
				codigo_PERSONAJE INT, 
				codigo_PELICULA INT,
				PRIMARY KEY(codigo_PERSONAJE,codigo_PELICULA), 
				FOREIGN KEY(codigo_PERSONAJE) REFERENCES PERSONAJE(codigo), 
				FOREIGN KEY(codigo_PELICULA) REFERENCES PELICULA(codigo)
				);
CREATE TABLE VISITA(
				codigo_NAVE INT, 
				codigo_PLANETA INT, 
				codigo_PELICULA INT, 
				PRIMARY KEY(codigo_NAVE, codigo_PLANETA, codigo_PELICULA), 
				FOREIGN KEY(codigo_NAVE) REFERENCES NAVE(codigo), 
				FOREIGN KEY(codigo_PLANETA) REFERENCES PLANETA(codigo), 
				FOREIGN KEY(codigo_PELICULA) REFERENCES PELICULA(codigo)
				);
INSERT INTO ACTOR VALUES 
				('1001','Ewan Mc Gregor','1971-03-31','Escoces'),
				('1002','Harrison Ford','1942-07-13','Estadounidense'),
				('1003','Brad Pitt','1962-04-23','Estadounidense'),
				('1004','Santiago Segura','1959-10-31','Castellana'),
				('1005','Vin diesel','1967-02-02','Estadounidense');
INSERT INTO PERSONAJE VALUES
				('100','Jeluchu','Extremeño','1001','1'),
				('101','SrtoSanz','Merchero','1002','2'),
				('102','Cesaaar','Bulgara','1003','3'),
				('103','Chewbacca','Peluda','1004','4'),
				('104','Bicho','Portuguesa','1005','5');
INSERT INTO PLANETA VALUES 
				('10000','Via Lactea','Pluton'),
				('10001','Via Osea','Peiton'),
				('10002','Via Cobre','Cupertino'),
				('10003','Via Lactea','Urano'),
				('10004','Via Alcoholica','Cacique');
INSERT INTO PELICULA VALUES
				('10','Torrente','Spielgberg','1999'),
				('11','El rey leon','Svodkar','2001'),
				('12','Titanic','Di Caprio','1998'),
				('13','Cantinflas','Luis Martin','1939'),
				('14','Bladerunner','Vangelis','1989');
INSERT INTO NAVE  VALUES 
				('1','15','Granada'),
				('2','8','Voladora'),
				('3','5','Facha'),
				('4','3','Lombarda'),
				('5','12','g-FOR');
INSERT INTO PERSONAJEPELICULA VALUES
				('100','10'),
				('104','11'),
				('103','12'),
				('102','13'),
				('101','14');
INSERT INTO VISITA VALUES
				('1','10004','11'),
				('3','10002','12'),
				('4','10000','14'),
				('5','10003','10'),
				('2','10001','13');
					
