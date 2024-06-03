-- CREATE VIEW SCRIPT
-- author: Gabriel
-- date: 31/05/2024

CREATE OR REPLACE VIEW vw_quadro_diario AS
SELECT hora_viagem AS horario, numero AS linha, placa AS onibus, nome AS Motorista
FROM Viagens
LEFT JOIN Linhas USING(id_linha)
LEFT JOIN Motoristas USING(id_motorista)
LEFT JOIN Onibus USING(id_onibus)
WHERE hora_viagem::date = CURRENT_DATE;