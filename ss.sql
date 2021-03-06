DROP DATABASE IF EXISTS VOYVOLANDO;
CREATE DATABASE VOYVOLANDO;
USE VOYVOLANDO
CREATE TABLE AEROPUERTO(CodIATA CHAR(3), Nombre VARCHAR(50), Ciudad VARCHAR(30), Pais VARCHAR(30));
CREATE TABLE TERMINAL(Numero INT,  CodIATA CHAR(3), Ciudad VARCHAR(30));
CREATE TABLE VUELO(CodVuelo VARCHAR(7), Codcompañia CHAR(3), AeropuertoOrigen VARCHAR(50), AeropuertoDestino VARCHAR(50), Estado ENUM('Situado','Cancelado','Retrasado'), Embarque INT);
CREATE TABLE ASIENTO(CodAsiento VARCHAR(3), TipoClase ENUM('Business','Turista'));
CREATE TABLE PASAJERO(DNI CHAR(9), Nombre VARCHAR(30), Apellido1 VARCHAR(30), Apellido2 VARCHAR(30));
CREATE TABLE RESERVA(Localizador VARCHAR(20),DNI CHAR(9),Precio FLOAT);
CREATE TABLE RESERVA_VUELO(Localizador VARCHAR(20), CodVuelo VARCHAR(7));
CREATE TABLE COMPAÑIA(CodCompañia CHAR(3), Nombre VARCHAR(30), Logo BLOB);
CREATE TABLE HORARIO(CodVuelo VARCHAR(7), HoraFechaSalida TIMESTAMP, HoraFechaLlegada TIMESTAMP);
CREATE TABLE FACTURACION(Mostrador INT, NumeroTerminal INT, CiudadAeropuerto VARCHAR(30), HoraLimite TIME, Fecha DATE);

