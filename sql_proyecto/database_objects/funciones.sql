use proyecto_coder;


-- FUNCIONES 

-- FUNCION PARA OBTENER EL ESTADO DE UNA VISITA

DELIMITER //
CREATE FUNCTION fn_estado_visita(fecha_visita DATETIME, cancelacion DATETIME)
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
	IF
    cancelacion IS NOT NULL THEN
		RETURN 'Cancelada';
    ELSEIF fecha_visita < NOW() THEN
		RETURN 'Realizada';
    ELSE
		RETURN 'Pendiente';
	END IF;
END;
 // DELIMITER ;

-- CONTAR VISTAS POR ESTADO
SELECT
	fn_estado_visita(fecha, cancelacion) AS estado_visita,
    COUNT(*) AS total_visitas
    FROM visita
    GROUP BY fn_estado_visita(fecha, cancelacion)
    

-- FUNCION PARA VERIFICAR QUE LOS EMAILS DE LOS INQUILINOS Y LOS GARANTES NO SE DUPLIQUEN

DELIMITER //
 CREATE FUNCTION fn_revisar_emails_duplicados (new_email VARCHAR(100))
 RETURNS BOOLEAN
 DETERMINISTIC
 BEGIN
	DECLARE existing_email BOOLEAN;
		SELECT EXISTS(
        SELECT
        1
        FROM (
				SELECT email FROM inquilino
                UNION ALL
                SELECT email FROM garante
			) AS emails
            WHERE email = new_email
            ) INTO existing_email;
			RETURN existing_email;
 END;
//DELIMITER ;
