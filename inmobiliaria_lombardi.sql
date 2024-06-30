DROP DATABASE IF EXISTS proyecto_coder;

CREATE DATABASE IF NOT EXISTS proyecto_coder;

USE proyecto_coder;

-- Tabla visitas
CREATE TABLE visita(
visitaID INT AUTO_INCREMENT PRIMARY KEY,
inquilinoID INT,
propiedadID INT,
empleadoID INT,
fecha DATETIME,
cancelacion DATETIME DEFAULT NULL
);

-- Tabla Inquilinio
CREATE TABLE inquilino(
inquilinoID INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(60),
email VARCHAR(100) UNIQUE NOT NULL,
tiene_garante BOOLEAN DEFAULT FALSE,
dni INT UNIQUE
);

-- Tabla dueno
CREATE TABLE dueno(
duenoID INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(60),
email VARCHAR(100) UNIQUE NOT NULL
);


-- Tabla contrato
CREATE TABLE contrato(
contratoID INT AUTO_INCREMENT PRIMARY KEY,
fecha_vto DATETIME,
duracion DATETIME
);

-- Tabla inmobiliaria
CREATE TABLE inmobiliaria(
inmobiliariaID INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(60),
telefono VARCHAR(20),
ubicacion VARCHAR(200),
duenoID INT
);

-- Tabla propiedad
CREATE TABLE propiedad(
propiedadID INT AUTO_INCREMENT PRIMARY KEY,
ubicacion VARCHAR(200),
departamento BOOLEAN DEFAULT FALSE,
ambientes VARCHAR(150),
jardin BOOLEAN,
baños INT DEFAULT 1,
dimensiones varchar(220),
contratoID INT,
inmobiliariaID INT
);

-- Tabla empleado
CREATE TABLE empleado(
empleadoID INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(60),
inmobiliariaID INT
);


-- FOREIGN KEYS
ALTER TABLE empleado
	ADD CONSTRAINT fk_empleado
	FOREIGN KEY (inmobiliariaID) REFERENCES inmobiliaria(inmobiliariaID);
    
ALTER TABLE inmobiliaria
		ADD CONSTRAINT fk_dueno
        FOREIGN KEY (duenoID) REFERENCES dueno(duenoID);
    
    
ALTER TABLE propiedad
	ADD CONSTRAINT fk_contrato
    FOREIGN KEY (contratoID) REFERENCES contrato(contratoID);
    
ALTER TABLE propiedad
	ADD CONSTRAINT fk_casa_inmobiliaria
    FOREIGN KEY (inmobiliariaID) REFERENCES inmobiliaria(inmobiliariaID);
    

ALTER TABLE visita
	ADD CONSTRAINT fk_visita_inquilino
    FOREIGN KEY (inquilinoID) REFERENCES inquilino(inquilinoID);
    
ALTER TABLE visita
	ADD CONSTRAINT fk_visita_propiedad
    FOREIGN KEY (propiedadID) REFERENCES propiedad(propiedadID);
    
ALTER TABLE visita
	ADD CONSTRAINT fk_visita_empleado
    FOREIGN KEY (empleadoID) REFERENCES empleado(empleadoID);



