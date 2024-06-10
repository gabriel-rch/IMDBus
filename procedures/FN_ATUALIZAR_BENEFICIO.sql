CREATE OR REPLACE FUNCTION fn_atualizar_beneficio()
RETURNS VOID AS $$
DECLARE
    passageiros_atualizados RECORD;
BEGIN
    SELEcT INTO passageiros_atualizados *
    FROM Passageiros
    WHERE EXTRACT(YEAR FROM AGE(data_nascimento)) = 18 
       OR EXTRACT(YEAR FROM AGE(data_nascimento)) = 65;

    UPDATE Passageiros
    SET beneficio = 'INTEIRA'
    WHERE beneficio = 'MEIA'
    AND passageiros_atualizados.id_passageiro = id_passageiro;

    UPDATE Passageiros
    SET beneficio = 'GRATUITA'
    WHERE beneficio = 'INTEIRA'
    AND passageiros_atualizados.id_passageiro = id_passageiro;
END;
$$ LANGUAGE plpgsql;