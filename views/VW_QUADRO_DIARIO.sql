-- CREATE VIEW SCRIPT
-- author: Gabriel
-- date: 31/05/2024

CREATE OR REPLACE VIEW vw_quadro_diario AS
SELECT hora_viagem AS horario, numero AS linha, registro AS onibus, nome AS Motorista
FROM Viagens
INNER JOIN Linhas USING(id_linha)
INNER JOIN Motoristas USING(id_motorista)
INNER JOIN Onibus USING(id_onibus)
WHERE hora_viagem::date = CURRENT_DATE;