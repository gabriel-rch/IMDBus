-- CREATE VIEW SCRIPT
-- author: Gabriel
-- date: 10/06/2024
-- desc: Quantidade de atendimentos de linhas por motorista

CREATE OR REPLACE VIEW vw_linhas_motorista AS
SELECT matricula, nome, numero as linha, COUNT(id_linha) AS atendimentos
FROM Motoristas
LEFT JOIN Viagens USING(id_motorista)
LEFT JOIN Linhas USING(id_linha)
GROUP BY matricula, nome, linha
ORDER BY matricula;