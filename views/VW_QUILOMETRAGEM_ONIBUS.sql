-- CREATE VIEW SCRIPT
-- author: Gabriel
-- date: 05/06/2024
-- desc: Tabela informando a quilometragem e tempo rodado por cada ônibus

CREATE OR REPLACE VIEW vw_quilometragem_onibus AS
SELECT placa as onibus, quilometragem, sum(duracao) as tempo_rodado
FROM Onibus
LEFT JOIN Viagens USING(id_onibus)
LEFT JOIN Linhas USING(id_linha)
GROUP BY placa, quilometragem
ORDER BY quilometragem DESC;