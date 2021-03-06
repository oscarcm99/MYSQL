DROP DATABASE IF EXISTS HUMAN;
CREATE DATABASE HUMAN;
USE HUMAN;
CREATE TABLE PERSONA (
			nombre VARCHAR(15),
			apellido1 VARCHAR(15), 
			apellido2 VARCHAR(15), 
			edad TINYINT UNSIGNED,  
			nacimiento DATE NOT NULL, 
			PRIMARY KEY(nombre,apellido1,apellido2)
			);
CREATE TABLE PRODUCTO (
			id INT auto_increment, 
			nombre VARCHAR(15) UNIQUE, 
			descripcion TEXT, 
			imagen BLOB, 
			precio FLOAT NOT NULL, 
			PRIMARY KEY(id)
			);
CREATE TABLE PEDIDO (
			cantidad INT, 
			nombre_PERSONA VARCHAR(15), 
			apellido1_PERSONA VARCHAR(15), 
			apellido2_PERSONA VARCHAR(15), 
			id_PRODUCTO INT, 
			FOREIGN KEY (nombre_PERSONA, apellido1_PERSONA, apellido2_PERSONA) REFERENCES 				PERSONA(nombre, apellido1, apellido2), 
			FOREIGN KEY(id_PRODUCTO) REFERENCES PRODUCTO(id)
                        );
ALTER TABLE PEDIDO DROP FOREIGN KEY PEDIDO_ibfk_1;
ALTER TABLE PEDIDO ADD CONSTRAINT FOREIGN KEY (nombre_PERSONA) REFERENCES PERSONA(nombre) ON UPDATE NO ACTION;
ALTER TABLE PEDIDO ADD CONSTRAINT FOREIGN KEY (apellido1_PERSONA) REFERENCES PERSONA(apellido1) ON UPDATE RESTRICT;
