USE proyecto_coder;

-- IMPORTANTE PARA QUE ENTIENDA QUE DEBE HACER LA IMPORTACION
SET GLOBAL local_infile = true;

-- IMPORTACIÓN DE DATOS DESDE ARCHIVO CSV

LOAD DATA LOCAL INFILE '/sql_proyecto/data_csv/contrato.csv'
INTO TABLE contrato
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(contratoID, fecha_vto, duracion_en_dias);

LOAD DATA LOCAL INFILE '/sql_proyecto/data_csv/dueno.csv'
INTO TABLE dueno
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(duenoID, nombre, email);

LOAD DATA LOCAL INFILE '/sql_proyecto/data_csv/inmobiliaria.csv'
INTO TABLE inmobiliaria
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(inmobiliariaID, nombre, telefono, ubicacion, duenoID);

LOAD DATA LOCAL INFILE '/sql_proyecto/data_csv/propiedad.csv'
INTO TABLE propiedad
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(propiedadID, ubicacion, departamento, ambientes, jardin, banos, precio, ocupada, contratoID, inmobiliariaID, moneda);

LOAD DATA LOCAL INFILE '/sql_proyecto/data_csv/empleado.csv'
INTO TABLE empleado
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(empleadoID, nombre, inmobiliariaID);

LOAD DATA LOCAL INFILE '/sql_proyecto/data_csv/visita.csv'
INTO TABLE visita
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(visitaID, inquilinoID, propiedadID, empleadoID, fecha, cancelacion);

LOAD DATA LOCAL INFILE '/sql_proyecto/data_csv/inquilino.csv'
INTO TABLE inquilino
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(inquilinoID, nombre, email, tiene_garante, dni);

LOAD DATA LOCAL INFILE '/sql_proyecto/data_csv/garante.csv'
INTO TABLE garante
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(garanteID, nombre, email, inquilinoID);
