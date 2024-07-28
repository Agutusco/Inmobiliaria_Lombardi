use proyecto_coder;

-- VISTAS

-- VISTA DE LAS PROPIEDADES OCUPADAS
CREATE OR REPLACE VIEW vw_propiedades_ocupadas AS(
SELECT
    p.propiedadID,
    p.ubicacion,
    p.departamento,
    p.ambientes,
    p.jardin,
    p.banos,
    p.precio,
    p.ocupada,
    p.moneda,
    i.nombre AS nombre_inquilino_viviendo,
    i.email AS email_inquilino
FROM propiedad p
JOIN inquilino i ON p.propiedadID = i.inquilinoID
WHERE p.ocupada = TRUE
);



-- VISTA DE VISITAS YA REALIZADAS
CREATE OR REPLACE VIEW vw_visitas_realizadas AS(
SELECT
    p.propiedadID,
    i.nombre AS nombre_inquilino,
    e.nombre AS nombre_empleado,
    v.fecha
FROM visita v
JOIN propiedad p ON v.propiedadID = p.propiedadID
JOIN empleado e ON v.empleadoID = e.empleadoID
JOIN inquilino i ON v.inquilinoID = i.inquilinoID
WHERE v.fecha < NOW()
ORDER BY p.propiedadID ASC
);


-- VISTA DE INQUILINOS CON GARANTE
CREATE OR REPLACE VIEW vw_inquilinos_con_garante AS(
SELECT
	i.inquilinoID,
	i.nombre AS nombre_inquilino,
    i.email,
    CASE
		WHEN g.garanteID IS NOT NULL THEN "Si"
		ELSE "No"
     END AS tiene_garante
    FROM inquilino i
    LEFT JOIN garante g ON g.garanteID = i.inquilinoID
);
