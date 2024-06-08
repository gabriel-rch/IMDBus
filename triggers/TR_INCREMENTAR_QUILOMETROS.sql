-- CREATE TRIGGER SCRIPT
-- author: Gabriel
-- date: 08/06/2024
-- desc: Trigger Function que incrementa a quilometragem de um ônibus a cada viagem registrada.


CREATE OR REPLACE FUNCTION fn_incrementar_quilometros() RETURNS TRIGGER
AS $tr_incrementar_quilometros$
DECLARE
    km_percorridos INTEGER;
BEGIN
    SELECT extensao_km into km_percorridos 
        FROM Viagens INNER JOIN Linhas USING(id_linha)
        WHERE id_viagem = NEW.id_viagem;
    
    -- SE A VIAGEM FOI REGISTRADA PELA PRIMEIRA VEZ,
    -- INCREMENTAR A QUILOMETRAGEM DO ONIBUS
    IF NEW.id_onibus IS NOT NULL THEN    
        UPDATE Onibus 
            SET quilometragem = quilometragem + km_percorridos
            WHERE id_onibus = NEW.id_onibus;
    END IF;

    -- SE O ONIBUS FOI ALTERADO,
    -- DECREMENTAR A QUILOMETRAGEM DO ONIBUS ANTERIOR
    IF OLD.id_onibus IS NOT NULL THEN
        UPDATE Onibus 
            SET quilometragem = quilometragem + km_percorridos
            WHERE id_onibus = OLD.id_onibus;
    END IF;
	RETURN NEW;
END;
$tr_incrementar_quilometros$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tr_incrementar_quilometros
AFTER UPDATE ON Viagens
FOR EACH ROW
EXECUTE FUNCTION fn_incrementar_quilometros();