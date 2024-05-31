-- CREATE VIEW SCRIPT
-- author: Gabriel
-- date: 27/05/2024
-- desc: Visualização que permite verificar a carga horária total cumprida por cada motorista.

CREATE OR REPLACE VIEW vw_ch_motorista AS
SELECT nome, SUM(duracao) AS CH
FROM Motoristas
JOIN Viagens USING(id_motorista)
JOIN Linhas USING(id_linha)
GROUP BY id_motorista;