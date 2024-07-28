
use proyecto_coder;

-- STORED PROCEDURES

-- PROCEDURE QUE ME DICE LOS EMPLEADOS QUE TIENEN MAS DE UNA VISITA
DELIMITER //
CREATE PROCEDURE procedure_obtener_empleado_visita()
BEGIN
	SELECT
    e.empleadoID,
    e.nombre AS nombre_empleado,
    COUNT(v.visitaID) AS numero_visita
    FROM empleado e
    JOIN visita v ON e.empleadoID = v.empleadoID
    GROUP BY e.empleadoID, e.nombre
    HAVING COUNT(v.visitaID) > 1
    ORDER BY numero_visita DESC;
    
END;
// DELIMITER ;


CALL procedure_obtener_empleado_visita();


-- PROCEDURE PARA CALCULAR EL TOTAL DE PROPIEDADES POR TIPO (DEPARTAMENTO O CASA)
DELIMITER //
CREATE PROCEDURE procedure_tipo_propiedad()
BEGIN
	SELECT
    CASE WHEN departamento = TRUE THEN 'Departamento' ELSE 'Casa'
     END AS tipo_propiedad,
    COUNT(*) AS total
	FROM propiedad
    GROUP BY departamento;
END;
// DELIMITER ;

CALL procedure_tipo_propiedad();

-- PROCEDURE PARA LISTAR PROPIEDADES EN UN RANGO DE PRECIO
DELIMITER //
CREATE PROCEDURE procedure_listar_propiedades_precio(
 IN precio_min INT,
 IN precio_max INT,
 IN moneda_busqueda ENUM('ARS', 'USD')
)
BEGIN
	SELECT
    propiedadID,
    ubicacion,
    ambientes,
    precio,
    moneda
    FROM propiedad
    WHERE moneda = moneda_busqueda AND precio BETWEEN precio_min AND precio_max
    ORDER BY precio DESC;
END;
// DELIMITER ;


CALL procedure_listar_propiedades_precio(50000, 100000, 'USD');


-- PROCEDURE PARA LISTAR PROPIEDADES PROXIMAS A DESOCUPARSE


DELIMITER //
CREATE PROCEDURE sp_propiedades_a_desocuparse(IN dias_limites INT)
BEGIN
	SELECT
    p.propiedadID,
    p.ubicacion,
    c.fecha_vto
    FROM propiedad p
    JOIN contrato c ON p.contratoID = c.contratoID
    WHERE p.ocupada = TRUE AND DATEDIFF(c.fecha_vto, CURDATE()) <= dias_limites
    ORDER BY c.fecha_vto;
END;
// DELIMITER ;

CALL sp_propiedades_a_desocuparse(1200)