-- CREATE FUNCTION SCRIPT
-- author: Gabriel
-- date: 09/06/2024
-- desc: Função que atualiza benefícios de passageiros que completaram ano.

CREATE OR REPLACE FUNCTION fn_atualizar_beneficio()
RETURNS TABLE (cpf CHAR(11), nome VARCHAR(100), beneficio VARCHAR(10)) AS $$
DECLARE
	passageiro RECORD;
	idade INTEGER;
BEGIN
	CREATE TEMPORARY TABLE temp_passageiros (
		cpf CHAR(11),
		nome VARCHAR(100),
		beneficio VARCHAR(10)
	);

	FOR passageiro IN 
		SELECT * FROM Passageiros
    	WHERE EXTRACT(YEAR FROM AGE(data_nascimento)) = 18 
       	   OR EXTRACT(YEAR FROM AGE(data_nascimento)) = 65
    LOOP
		idade := EXTRACT(YEAR FROM AGE(passageiro.data_nascimento));
	
		IF idade = 18 AND passageiro.beneficio = 'MEIA' THEN
			UPDATE Passageiros
			SET beneficio = 'INTEIRA'
			WHERE passageiro.id_passageiro = id_passageiro;
			
			INSERT INTO temp_passageiros
			SELECT PA.cpf, PA.nome, PA.beneficio
			FROM Passageiros PA
			WHERE passageiro.id_passageiro = PA.id_passageiro;
		END IF;
		
		IF idade = 65 AND passageiro.beneficio = 'INTEIRA' THEN
			UPDATE Passageiros
			SET beneficio = 'GRATUITA'
			WHERE passageiro.id_passageiro = id_passageiro;
			
			INSERT INTO temp_passageiros
			SELECT PA.cpf, PA.nome, PA.beneficio
			FROM Passageiros PA
			WHERE passageiro.id_passageiro = PA.id_passageiro;
		END IF;
	END LOOP;
	
	RETURN QUERY 
	SELECT TP.cpf AS CPF, TP.nome AS nome, TP.beneficio AS novo_beneficio 
	FROM temp_passageiros TP;
	
	DROP TABLE temp_passageiros;
END;
$$ LANGUAGE plpgsql;