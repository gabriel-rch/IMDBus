-- CREATE TRIGGER SCRIPT
-- author: Gabriel
-- date: 27/05/2024
-- desc: Trigger Function que define o bilhete do passageiro baseado na idade.
-- 		 idade < 18: MEIA
--		 idade entre 18 e 65: INTEIRA
--		 idade > 65: GRATUITA

CREATE OR REPLACE FUNCTION fn_registrar_passageiro()
RETURNS TRIGGER AS $tr_registrar_passageiro$
DECLARE idade INTEGER := EXTRACT(YEAR FROM AGE(NEW.data_nascimento));
BEGIN
	IF NEW.beneficio IS NULL THEN
		IF idade < 18 THEN
			NEW.beneficio := 'MEIA';
		ELSIF idade < 65 THEN
			NEW.beneficio := 'INTEIRA';
		ELSE
			NEW.beneficio := 'GRATUITA';
		END IF;
	END IF;
	RETURN NEW;
END
$tr_registrar_passageiro$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tr_registrar_passageiro
BEFORE INSERT ON Passageiros
FOR EACH ROW
EXECUTE FUNCTION fn_registrar_passageiro();