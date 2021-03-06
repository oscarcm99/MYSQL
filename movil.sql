DROP DATABASE IF EXISTS CALDERONSL;
CREATE DATABASE CALDERONSL;
USE CALDERONSL;
CREATE TABLE CLIENTES (
			DNI CHAR(9), 
			nombre VARCHAR(20), 
			apellidos VARCHAR(30), 
			telefono INT(9), 
			email VARCHAR(30), 
			PRIMARY KEY(DNI), 
			UNIQUE(telefono, email)
			);
CREATE TABLE TIENDAS (
			nombre VARCHAR(20), 
			provincia VARCHAR(20),
			localidad VARCHAR(20), 
			direccion VARCHAR(20), 
			telefono INT(9), 
			diaApertura DATE, 
			diaCierre DATE, 
			horaApertura TIME(4), 
			horaCierre TIME(4), 
			PRIMARY KEY(nombre), 
			UNIQUE(telefono)
			); 
CREATE TABLE OPERADORAS (
			nombre VARCHAR(20), 
			colorLogo VARCHAR(15), 
			porcentajeCobertura VARCHAR(4), 
			frecuenciaGSM VARCHAR(15), 
			paginaWeb VARCHAR(30), 
			PRIMARY KEY(nombre)
			);
CREATE TABLE TARIFAS (
			nombre VARCHAR(20), 
			nombre_OPERADORAS VARCHAR(20), 
			tamañoDatos INT(3), 
			tipoDatos CHAR(2), 
			minutosGratis INT(3), 
			SMSgratis INT(3), 
			PRIMARY KEY(nombre), 
			FOREIGN KEY(nombre_OPERADORAS) REFERENCES OPERADORAS(nombre));
CREATE TABLE MOVIL (
			marca VARCHAR(20),
			modelo VARCHAR(20),
			descripcion VARCHAR(50),
			SO VARCHAR(15),
			RAM INT(3),
			pulgadasPantalla INT(2), 
			camaraMPX INT(2), 	
			PRIMARY KEY(marca,modelo)
			);
CREATE TABLE MOVIL_LIBRE(
			marca_MOVIL VARCHAR(20), 
			modelo_MOVIL VARCHAR(20), 
			precio FLOAT,
                        PRIMARY KEY(modelo_MOVIL), 
			FOREIGN KEY(marca_MOVIL,modelo_MOVIL) REFERENCES MOVIL(marca,modelo)
			);
CREATE TABLE MOVIL_CONTRATO (
			marca_MOVIL VARCHAR(20), 
			modelo_MOVIL VARCHAR(20), 
			nombre_OPERADORAS VARCHAR(20),
			precio FLOAT, 
			PRIMARY KEY(marca_MOVIL, modelo_MOVIL, nombre_OPERADORAS),
			FOREIGN KEY(marca_MOVIL, modelo_MOVIL) REFERENCES MOVIL(marca,modelo), 
			FOREIGN KEY(nombre_OPERADORAS) REFERENCES OPERADORAS(nombre) 
			); 
CREATE TABLE OFERTAS (
			nombre_OPERADORAS_TARIFAS VARCHAR(20), 
			nombre_TARIFAS VARCHAR(20), 
			marca_MOVIL_CONTRATO VARCHAR(20), 
			modelo_MOVIL_CONTRATO VARCHAR(20),
			PRIMARY KEY(nombre_TARIFAS, marca_MOVIL_CONTRATO, modelo_MOVIL_CONTRATO),
			FOREIGN KEY(nombre_OPERADORAS_TARIFAS, nombre_TARIFAS) REFERENCES TARIFAS (nombre_OPERADORAS,nombre),
			FOREIGN KEY(marca_MOVIL_CONTRATO, modelo_MOVIL_CONTRATO) REFERENCES MOVIL_CONTRATO(marca_MOVIL,modelo_MOVIL)
			);
CREATE TABLE COMPRAS (
			DNI_CLIENTES CHAR(9),
			nombre_TIENDAS VARCHAR(20),
			marca_MOVIL_LIBRE VARCHAR(20),
			modelo_MOVIL_LIBRE VARCHAR(20),
			dia DATE,
			PRIMARY KEY(DNI_CLIENTES, nombre_TIENDAS, marca_MOVIL_LIBRE, modelo_MOVIL_LIBRE),
			FOREIGN KEY(DNI_CLIENTES) REFERENCES CLIENTES(DNI),
			FOREIGN KEY(nombre_TIENDAS) REFERENCES TIENDAS(nombre),
			FOREIGN KEY(marca_MOVIL_LIBRE, modelo_MOVIL_LIBRE) REFERENCES MOVIL_LIBRE(marca_MOVIL, modelo_MOVIL)
			);
CREATE TABLE CONTRATOS(DNI_CLIENTES CHAR(9), nombre_TIENDAS VARCHAR(20), nombre_OPERADORAS_TARIFAS_OFERTAS VARCHAR(20), nombre_TARIFAS_OFERTAS VARCHAR(20), marca_MOVIL_OFERTAS VARCHAR(20), modelo_MOVIL_OFERTAS VARCHAR(20), dia DATE, PRIMARY KEY(DNI_CLIENTES, nombre_TIENDAS, nombre_OPERADORAS_TARIFAS_OFERTAS, nombre_TARIFAS_OFERTAS, marca_MOVIL_OFERTAS, modelo_MOVIL_OFERTAS),
FOREIGN KEY(DNI_CLIENTES) REFERENCES CLIENTES(DNI), FOREIGN KEY(nombre_TIENDAS) REFERENCES TIENDAS(nombre), FOREIGN KEY(nombre_OPERADORAS_TARIFAS_OFERTAS, nombre_TARIFAS_OFERTAS, marca_MOVIL_OFERTAS, modelo_MOVIL_OFERTAS) REFERENCES OFERTAS(nombre_OPERADORAS_TARIFAS, nombre_TARIFAS, marca_MOVIL_CONTRATO, modelo_MOVIL_CONTRATO));
