-- CREATE TRIGGER SCRIPT
-- author: Gabriel
-- date: 06/05/2024
-- desc: Trigger Function que detecta se um passageiro embarcou múltiplas vezes em uma mesma viagem.

CREATE OR REPLACE FUNCTION fn_detectar_fraude()
RETURNS TRIGGER AS $tr_detectar_fraude$
DECLARE
    qtd_embarques integer;
BEGIN
    SELECT count(*) INTO qtd_embarques
    FROM Embarques
    WHERE id_passageiro = NEW.id_passageiro 
      AND id_viagem = NEW.id_viagem;
    
    IF qtd_embarques > 2 THEN
        RAISE WARNING 'Passageiro %, de CPF %, embarcou múltiplas vezes na viagem de ID %', NEW.nome, NEW.cpf, NEW.id_viagem;
    END IF;
    
    RETURN NEW;
END
$tr_detectar_fraude$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER tr_detectar_fraude
AFTER INSERT ON Embarques
FOR EACH ROW
EXECUTE FUNCTION fn_detectar_fraude();