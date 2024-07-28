DROP DATABASE IF EXISTS proyecto_coder;

CREATE DATABASE IF NOT EXISTS proyecto_coder;

USE proyecto_coder;

-- TABLA VISITA
CREATE TABLE visita(
visitaID INT AUTO_INCREMENT PRIMARY KEY,
inquilinoID INT,
propiedadID INT,
empleadoID INT,
fecha DATETIME,
cancelacion DATETIME DEFAULT NULL
)COMMENT "Tabla con información con la visita a las distintas propiedades";


-- TABLA INQUILINO
CREATE TABLE inquilino(
inquilinoID INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(60),
email VARCHAR(100) UNIQUE NOT NULL,
tiene_garante BOOLEAN DEFAULT FALSE,
dni INT UNIQUE
)COMMENT "Tabla con informacion de los distintos inquilinos";

-- TABLA DUEÑO
CREATE TABLE dueno(
duenoID INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(60),
email VARCHAR(100) UNIQUE NOT NULL
)COMMENT "Tabla con informacion del dueno de la inmobiliaria";


-- TABLA CONTRATO
CREATE TABLE contrato(
contratoID INT AUTO_INCREMENT PRIMARY KEY,
fecha_vto DATETIME
)COMMENT "Tabla con informacion sobre el contrato y sus propiedades";

-- TALA INMOBILIARIA
CREATE TABLE inmobiliaria(
inmobiliariaID INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(60),
telefono VARCHAR(20),
ubicacion VARCHAR(200),
duenoID INT
)COMMENT "Tabla con datos sobre la inmobiliaria";

-- TABLA PROPIEDAD
CREATE TABLE propiedad(
propiedadID INT AUTO_INCREMENT PRIMARY KEY,
ubicacion VARCHAR(200),
departamento BOOLEAN DEFAULT FALSE,
ambientes VARCHAR(150),
jardin BOOLEAN,
banos INT DEFAULT 1,
contratoID INT,
inmobiliariaID INT
)COMMENT "Tabla con informacion sobre la propiedad a visitar";

-- TABLA EMPLEADO
CREATE TABLE empleado(
empleadoID INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(60),
inmobiliariaID INT
)COMMENT "Tabla con informacion del empleado de la inmobiliaria";


-- TABLA GARANTE
CREATE TABLE garante(
garanteID INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(60),
email VARCHAR(100),
inquilinoID INT
)COMMENT "Tabla con informacion del garante del inquilino";


-- FOREIGN KEYS Y ALTERACIONES
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

ALTER TABLE garante
	ADD CONSTRAINT fk_garante
    FOREIGN KEY (inquilinoID) REFERENCES inquilino(inquilinoID);

ALTER TABLE propiedad
	ADD COLUMN precio INT NOT NULL
    AFTER banos;
    
ALTER TABLE	propiedad
	ADD COLUMN ocupada BOOLEAN NOT NULL
    AFTER precio;
    
ALTER TABLE propiedad
	ADD moneda ENUM('ARS', 'USD') NOT NULL DEFAULT 'ARS'
    AFTER precio;
    
ALTER TABLE contrato
	ADD COLUMN duracion_en_dias INT
	AFTER fecha_vto
