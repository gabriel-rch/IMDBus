-- CREATE VIEW SCRIPT
-- author: Gabriel
-- date: 05/06/2024
-- desc: Receita total gerada por cada linha em viagens realizadas

CREATE OR REPLACE VIEW vw_receita_viagens AS
SELECT linha, SUM(receita) as receita, SUM(embarques) as embarques
FROM (
    SELECT numero as linha, COUNT(*) as embarques, SUM(valor_inteira) as receita
    FROM Passageiros
    INNER JOIN Embarques USING(id_passageiro)
    INNER JOIN Viagens USING(id_viagem)
    INNER JOIN Linhas USING(id_linha)
    INNER JOIN Tarifas USING(id_tarifa)
    WHERE beneficio = 'INTEIRA'
    GROUP BY numero
    UNION
    SELECT numero as linha, COUNT(*) as embarques, SUM(valor_meia) as receita
    FROM Passageiros
    INNER JOIN Embarques USING(id_passageiro)
    INNER JOIN Viagens USING(id_viagem)
    INNER JOIN Linhas USING(id_linha)
    INNER JOIN Tarifas USING(id_tarifa)
    WHERE beneficio = 'MEIA'
    GROUP BY numero
) 
GROUP BY linha
ORDER BY receita DESC;