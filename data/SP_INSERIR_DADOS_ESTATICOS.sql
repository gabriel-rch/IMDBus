DO $$
DECLARE
    circular_id_tarifa INT;
    urbano_id_tarifa INT;
    intermunicipal_id_tarifa INT;
BEGIN
    DELETE FROM Linhas;
    DELETE FROM Onibus;
    DELETE FROM Tarifas;
    DELETE FROM Motoristas;
    DELETE FROM Passageiros;

    INSERT INTO Motoristas (matricula, cpf, nome, data_nascimento) VALUES
    ('38415',  '11591309530',  'Fernanda Gomes', '1955-5-11'),
    ('35950',  '81982929573',  'Pedro Pereira', '1992-8-15'),
    ('93690',  '34487426972',  'Mariana Ferreira', '1962-3-19'),
    ('45418',  '83807738617',  'Patrícia Almeida', '1965-4-23'),
    ('26880',  '23235071074',  'Carlos Alves', '1976-2-25'),
    ('51990',  '80800885688',  'Carlos Ribeiro', '1962-12-23'),
    ('27796',  '34365668226',  'João Pereira', '1997-9-4'),
    ('95355',  '34176545702',  'Marisa Gomes', '1983-11-26'),
    ('13288',  '49463670240',  'Natália Alves', '1961-3-24'),
    ('64341',  '47817122293',  'Luiz Costa', '1994-12-6'),
    ('46691',  '94598563969',  'Marcos Santos', '1984-4-1'),
    ('91341',  '50692983333',  'Pedro Melo', '1977-4-2'),
    ('84536',  '37133042074',  'Rafael Araújo', '1995-8-19'),
    ('95552',  '11713084399',  'Emanuel Oliveira', '1956-11-17'),
    ('60248',  '65969797102',  'Isabela Melo', '1984-3-6'),
    ('12481',  '83569945568',  'Fernanda Pereira', '1989-10-7'),
    ('47574',  '25241202971',  'Felipe Costa', '1992-2-7'),
    ('22927',  '40749757938',  'Rafaela Pereira', '1990-8-11'),
    ('89226',  '22813747204',  'Pedro Gomes', '1977-7-6'),
    ('54663',  '70189235726',  'Miguel Barros', '1973-6-10'),
    ('90364',  '71988504361',  'Afonso Silva', '1987-6-3'),
    ('92717',  '33159695575',  'Gabriela Ribeiro', '1983-8-20'),
    ('67990',  '16896720475',  'Ricardo Monteiro', '1959-9-20'),
    ('22960',  '31631032461',  'Antônio Santos', '2001-11-15'),
    ('64139',  '61139866189',  'Mariana Carvalho', '1993-2-2');

    INSERT INTO Onibus (placa, marca, modelo) VALUES
    ('LOJ-6037', 'Iveco', 'DW7'),
    ('YED-1297', 'Marcopolo', 'THUNDER'),
    ('ZEU-1000', 'Mercedes', 'CAMPIONE'),
    ('SIR-7689', 'Marcopolo', 'GRAN MIDI'),
    ('MIJ-2735', 'Mercedes', 'GRAN MIDI'),
    ('KIJ-5430', 'Volksbus', 'THUNDER'),
    ('PHU-8765', 'Marcopolo', 'W9'),
    ('BYA-8710', 'Iveco', 'SPRINTER'),
    ('LLS-7210', 'Mercedes', 'GRANVIA'),
    ('KNB-1991', 'Mercedes', 'DW7'),
    ('ORJ-6952', 'Volvo', 'CAMPIONE'),
    ('VBL-8479', 'Mercedes', 'FOZ'),
    ('HAR-9584', 'Marcopolo', 'FOZ'),
    ('QJQ-3398', 'Volvo', 'W9'),
    ('XWV-8163', 'Mercedes', 'THUNDER'),
    ('GTE-1799', 'Scania', 'FOZ'),
    ('KNK-1287', 'Iveco', 'CAMPIONE'),
    ('YIV-7015', 'Mercedes', 'GRANVIA'),
    ('GSW-5773', 'Marcopolo', 'APACHE U'),
    ('OKF-3619', 'Scania', 'TORINO'),
    ('YJR-8820', 'Marcopolo', 'ESORE'),
    ('YPS-4447', 'Volksbus', 'MB28'),
    ('DNX-3130', 'Volvo', 'ESORE'),
    ('AFK-3456', 'Scania', 'CAMPIONE'),
    ('VMX-7394', 'Iveco', 'GRANVIA'),
    ('WJK-6714', 'Scania', 'FOZ'),
    ('AZG-5396', 'Marcopolo', 'ESORE'),
    ('YOZ-2366', 'Mercedes', 'GRANVIA'),
    ('IXY-9463', 'Iveco', 'FOZ'),
    ('QMI-9910', 'Scania', 'W9');

    INSERT INTO Tarifas (descricao, valor_inteira, valor_meia) VALUES
    ('Circular', 2.20, 1.10),
    ('Urbano', 3.50, 1.75),
    ('Intermunicipal', 4.0, 2.0);

    SELECT id_tarifa INTO circular_id_tarifa FROM Tarifas WHERE descricao = 'Circular';
    SELECT id_tarifa INTO urbano_id_tarifa FROM Tarifas WHERE descricao = 'Urbano';
    SELECT id_tarifa INTO intermunicipal_id_tarifa FROM Tarifas WHERE descricao = 'Intermunicipal';

    INSERT INTO Linhas (numero, origem, destino, duracao, extensao_km, id_tarifa) VALUES
    ('U-75', 'Terminal Norte', 'Shopping Central', '40 minutes', 12, urbano_id_tarifa),
    ('U-80', 'Terminal Norte', 'Hospital Geral', '60 minutes', 18, urbano_id_tarifa),
    ('U-95', 'Terminal Norte', 'Parque dos Pássaros', '35 minutes', 10, urbano_id_tarifa),
    ('C-05', 'Terminal Sul', 'Universidade Estadual', '10 minutes', 2, circular_id_tarifa),
    ('C-10', 'Terminal Sul', 'Instituto Federal', '20 minutes', 5, circular_id_tarifa),
    ('C-20', 'Terminal Sul', 'Universidade Federal', '25 minutes', 7, circular_id_tarifa),
    ('I-105', 'Terminal Oeste', 'Fazenda Campos', '80 minutes', 20, intermunicipal_id_tarifa),
    ('I-130', 'Terminal Oeste', 'Parque Industrial', '120 minutes', 34, intermunicipal_id_tarifa),
    ('I-150', 'Terminal Oeste', 'Centro Comercial', '95 minutes', 28, intermunicipal_id_tarifa);
END; $$;