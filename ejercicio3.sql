DROP DATABASE IF EXISTS SOCIOSL;
CREATE DATABASE SOCIOSL;
USE SOCIOSL
CREATE TABLE SOCIOS(
			nombre VARCHAR(20) NOT NULL, 
			direccion VARCHAR(30), 
			numeroTelefono VARCHAR(15), 
			fechaInscripcion DATE, 
			numeroSocio INT AUTO_INCREMENT, 
			PRIMARY KEY(numeroSocio)
			);
CREATE TABLE LIBROS(
			titulo VARCHAR(30) NOT NULL, 
			autor VARCHAR(20), 
			fechaEditado DATE, 
			numeroLibro BIGINT AUTO_INCREMENT, 
			PRIMARY KEY(numeroLibro)
			);
CREATE TABLE PRESTAMOS(
			fechaRetiro DATE, 
			fechaEntrega DATE, 
			numeroSocio INT, 
			numeroLibro BIGINT, 
			IDPrestamo BIGINT AUTO_INCREMENT, 
			PRIMARY KEY(IDPrestamo)
			);
ALTER TABLE PRESTAMOS ADD CONSTRAINT FK_SOCIO FOREIGN KEY(numeroSocio) REFERENCES SOCIOS(numeroSocio);
ALTER TABLE PRESTAMOS ADD CONSTRAINT FK_LIBRO FOREIGN KEY(numeroLibro) REFERENCES LIBROS(numeroLibro);
INSERT INTO SOCIOS(nombre,direccion,numeroTelefono,fechaInscripcion) VALUES('PEDRO GIL','CANELONES','123 456 789','1984-12-12'),('JOSE M. FORO','MONTEVIDEO','987 654 321','1997-03-02'),('ELBA LAZO','LAS PIEDRAS','666 777 888','2000-06-02'),('MARTA CANA','MONTEVIDEO','600 200 200','1999-08');
