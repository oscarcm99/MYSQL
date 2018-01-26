DROP DATABASE IF EXISTS CALDERONSL;
CREATE DATABASE CALDERONSL;
USE CALDERONSL;
CREATE TABLE CLIENTES (DNI CHAR(9), nombre VARCHAR(20), apellidos VARCHAR(30), telefono INT(9), email VARCHAR(30), PRIMARY KEY(DNI), UNIQUE(telefono, email));
CREATE TABLE TIENDAS (nombre VARCHAR(20), provincia VARCHAR(20),localidad VARCHAR(20), direccion VARCHAR(20), telefono INT(9), diaApertura DATE, diaCierre DATE, horaApertura TIME(4), horaCierre TIME(4), PRIMARY KEY(nombre), UNIQUE(telefono)); 
CREATE TABLE OPERADORAS (nombre VARCHAR(20), colorLogo VARCHAR(15), porcentajeCobertura VARCHAR(4), frecuenciaGSM VARCHAR(15), paginaWeb VARCHAR(30), PRIMARY KEY(nombre));
CREATE TABLE TARIFAS (nombre VARCHAR(20), nombre_OPERADORAS VARCHAR(20), tamañoDatos INT(3), tipoDatos CHAR(2), minutosGratis INT(3), SMSgratis INT(3), PRIMARY KEY(nombre), FOREIGN KEY(nombre_OPERADORAS) REFERENCES OPERADORAS(nombre));
CREATE TABLE MOVILES (marca VARCHAR(20),modelo VARCHAR(20),descripcion VARCHAR(50),SO VARCHAR(15),RAM INT(3),pulgadasPantalla INT(2), camaraMPX INT(2), PRIMARY KEY(marca,modelo));
