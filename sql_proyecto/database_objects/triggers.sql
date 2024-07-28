use proyecto_coder;

-- CREACION DE TRIGGERS

-- TRIGGER QUE  VERIFICA QUE LOS EMAIL NO SE REPITAN

DROP TRIGGER IF EXISTS confirm_email_inquilino;

DELIMITER //
CREATE TRIGGER confirm_email_inquilino
BEFORE INSERT ON inquilino
FOR EACH ROW
BEGIN
	IF fn_revisar_emails_duplicados(NEW.email) THEN
	    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "El email esta duplicado";
	END IF;
END;
// DELIMITER ;


DROP TRIGGER IF EXISTS confirm_email_garante;

DELIMITER //
CREATE TRIGGER confirm_email_garante
BEFORE INSERT ON garante
FOR EACH ROW
BEGIN
	IF fn_revisar_emails_duplicados(NEW.email) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "El email esta duplicado";
	END IF;
END;
// DELIMITER ;



-- TRIGGER QUE PERMITE CALCULAR LA DURACION DE DIAS A PARTIR DE UNA FECHA

DROP TRIGGER IF EXISTS calcular_duracion_en_dias;

DELIMITER //
CREATE TRIGGER calcular_duracion_en_dias
BEFORE INSERT ON contrato
FOR EACH ROW
BEGIN
    SET NEW.duracion_en_dias = DATEDIFF(NEW.fecha_vto, CURDATE());
END;
// DELIMITER ;

