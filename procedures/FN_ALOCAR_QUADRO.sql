CREATE OR REPLACE FUNCTION fn_alocar_quadro(data_quadro date)
RETURNS VOID AS $$
DECLARE
	viagem RECORD;
	current_motorista INTEGER;
	current_onibus INTEGER;
	duracao_viagem INTERVAL;
BEGIN
	DROP TABLE IF EXISTS temp_motoristas;
	CREATE TEMPORARY TABLE temp_motoristas (
		id_motorista integer,
		hora_disponivel timestamp
	);
	
	DROP TABLE IF EXISTS temp_onibus;
	CREATE TEMPORARY TABLE temp_onibus (
		id_onibus integer,
		hora_disponivel timestamp
	);

	-- PREENCHER TABELAS TEMPORARIAS COM MOTORISTAS E ONIBUS DISPONIVEIS
	INSERT INTO temp_motoristas
	SELECT id_motorista, data_quadro
	FROM Motoristas 
	LEFT JOIN vw_ch_motorista USING(matricula)
	ORDER BY ch ASC;

	INSERT INTO temp_onibus
	SELECT id_onibus, data_quadro
	FROM Onibus
	WHERE status = 'DISPONIVEL'
	ORDER BY quilometragem ASC;

    FOR viagem IN
        SELECT * FROM Viagens 
        WHERE hora_viagem::date = data_quadro
		ORDER BY hora_viagem ASC
    LOOP
		-- ESCOLHE O PRIMEIRO MOTORISTA DISPONIVEL
		SELECT INTO current_motorista id_motorista
		FROM temp_motoristas
		WHERE viagem.hora_viagem > hora_disponivel
		ORDER BY hora_disponivel ASC
		LIMIT 1; 

		-- ALTERA A DISPONIBILIDADE DO MOTORISTA
		UPDATE temp_motoristas
		SET hora_disponivel = hora_disponivel + duracao_viagem
		WHERE id_motorista = current_motorista;

		-- ESCOLHE O PRIMEIRO ONIBUS DISPONIVEL
		SELECT INTO current_onibus id_onibus
		FROM temp_onibus
		WHERE viagem.hora_viagem > hora_disponivel
		ORDER BY hora_disponivel ASC
		LIMIT 1;

		SELECT duracao INTO duracao_viagem
		FROM Viagens
		INNER JOIN Linhas USING(id_linha)
		WHERE id_viagem = viagem.id_viagem;

		-- ALTERA A DISPONIBILIDADE DO ONIBUS
		UPDATE temp_onibus
		SET hora_disponivel = hora_disponivel + duracao_viagem
		WHERE id_onibus = current_onibus;

		-- ALOCA MOTORISTA E ONIBUS PARA A VIAGEM
		UPDATE Viagens
		SET id_motorista = current_motorista, id_onibus = current_onibus
		WHERE id_viagem = viagem.id_viagem;
    END LOOP;
END;
$$ LANGUAGE plpgsql;