-- CREATE TRIGGER SCRIPT
-- author: Gabriel
-- date: 27/05/2024
-- desc: Trigger Function que preenche informações default de um ônibus novo.

CREATE OR REPLACE FUNCTION fn_cadastrar_onibus()
RETURNS TRIGGER AS $tr_cadastrar_onibus$
BEGIN
	IF NEW.quilometragem IS NULL THEN
		NEW.quilometragem := 0;
	END IF;
	
	IF NEW.status IS NULL THEN
		NEW.status := 'DISPONIVEL';
	END IF;
	RETURN NEW;
END
$tr_cadastrar_onibus$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tr_cadastrar_onibus
BEFORE INSERT ON Onibus
FOR EACH ROW
EXECUTE FUNCTION fn_cadastrar_onibus();