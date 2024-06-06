-- CREATE VIEW SCRIPT
-- author: Gabriel
-- date: 05/06/2024
-- desc: Receita total gerada por cada linha em viagens realizadas

CREATE OR REPLACE VIEW vw_receita_viagens AS
SELECT numero as linha, sum(valor) as receita
FROM Viagens
INNER JOIN Embarques USING(id_viagem)
INNER JOIN Passageiros USING(id_passageiro)
-- TODO
-- TODO
ORDER BY receita DESC;
