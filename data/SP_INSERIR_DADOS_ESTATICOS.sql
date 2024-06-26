-- INSERT SCRIPT
-- author: Gabriel
-- date: 10/06/2024

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
    ('Circular', 0.50, 0.25),
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

    INSERT INTO Passageiros (cpf, nome, data_nascimento) VALUES
    ('41211048446', 'Rafaela Souza', '1953-10-15'),
    ('97545047436', 'Gabriela Almeida', '2011-2-3'),
    ('51557791739', 'Ana Oliveira', '1974-9-13'),
    ('56277347199', 'Ricardo Souza', '1944-11-25'),
    ('46350130123', 'Gabriela Rocha', '1958-8-4'),
    ('22981438686', 'Camila Silva', '1941-7-4'),
    ('56495615742', 'Carlos Ferreira', '1952-2-4'),
    ('40078334706', 'Rafael Ferreira', '2010-8-23'),
    ('18441410121', 'Rafael Rocha', '1950-2-22'),
    ('96783939895', 'Rafaela Martins', '2010-12-26'),
    ('32435022783', 'Carlos Melo', '1940-1-12'),
    ('20734998211', 'Fernanda Moreira', '1949-3-22'),
    ('65838627105', 'Rafael Pereira', '1945-8-26'),
    ('38103798300', 'Carlos Souza', '1974-1-20'),
    ('38189986601', 'Amanda Melo', '2011-12-7'),
    ('39855676367', 'Pedro Cardoso', '1944-8-25'),
    ('35760915978', 'Felipe Souza', '1945-1-15'),
    ('92510414784', 'Marcos Cardoso', '1975-12-27'),
    ('80329904725', 'Maria Nascimento', '1979-7-10'),
    ('77706770508', 'Mariana Ribeiro', '1959-8-6'),
    ('11575784928', 'Paulo Barros', '1963-8-28'),
    ('93165718776', 'Lucas Costa', '1956-12-1'),
    ('34836218955', 'Mariana Gomes', '1975-7-26'),
    ('51844290594', 'Lucas Batista', '1952-4-1'),
    ('81041487938', 'Gabriela Melo', '1955-12-19'),
    ('71826269141', 'Ana Monteiro', '2009-1-27'),
    ('24047997982', 'Luiz Oliveira', '1975-8-7'),
    ('27795796588', 'Rafael Batista', '1946-4-6'),
    ('66485941170', 'Ana Pereira', '1962-3-13'),
    ('33797484760', 'Lucas Rodrigues', '1955-10-4'),
    ('61927433689', 'Luiz Almeida', '1940-12-14'),
    ('77096895294', 'Felipe Ribeiro', '1958-2-15'),
    ('90943748787', 'Carlos Costa', '2002-4-16'),
    ('50173666778', 'Mariana Batista', '2009-4-11'),
    ('70844812172', 'Felipe Silva', '1994-7-9'),
    ('59554967977', 'Fernanda Ribeiro', '1997-2-24'),
    ('49843657106', 'Paulo Santos', '2012-1-24'),
    ('82251378659', 'Amanda Martins', '1964-4-14'),
    ('71266437912', 'Mariana Lima', '1948-8-4'),
    ('23837362904', 'Carlos Ferreira', '1949-9-21'),
    ('86408005043', 'Carlos Ferreira', '2007-11-25'),
    ('19263632427', 'Rafael Almeida', '1941-9-26'),
    ('50698351725', 'Camila Ferreira', '2011-7-7'),
    ('31220090118', 'Amanda Martins', '2008-9-27'),
    ('92785396479', 'Isabela Gomes', '1963-9-10'),
    ('49095820147', 'Marcos Souza', '1951-7-4'),
    ('23460856504', 'Ana Rocha', '1979-11-2'),
    ('23446065351', 'Juliana Ribeiro', '1948-11-28'),
    ('84545280150', 'Rafael Monteiro', '2010-4-9'),
    ('87177029191', 'Ricardo Lima', '2012-10-16'),
    ('46936609447', 'Rafaela Melo', '1950-11-21'),
    ('21413660663', 'Lucas Moreira', '2007-7-15'),
    ('17525020960', 'Gabriela Santos', '2007-2-9'),
    ('87187150976', 'Mariana Ribeiro', '1940-3-19'),
    ('36859152918', 'Rafael Souza', '2010-2-1'),
    ('91372811136', 'Fernanda Ferreira', '1944-5-18'),
    ('50592155117', 'Lucas Carvalho', '1951-3-5'),
    ('26347661269', 'Luiz Oliveira', '1996-3-20'),
    ('55436458206', 'Ana Melo', '2000-8-10'),
    ('77683785304', 'Paulo Monteiro', '1974-12-20'),
    ('86433153930', 'Lucas Carvalho', '1967-6-17'),
    ('96130030904', 'Camila Gomes', '1954-11-15'),
    ('41610557889', 'Fernanda Silva', '2009-3-25'),
    ('90245260872', 'Carlos Mendes', '1977-7-7'),
    ('77372511546', 'Maria Pereira', '2009-9-23'),
    ('47763413956', 'Maria Cardoso', '1958-3-15'),
    ('51147133503', 'Ana Ribeiro', '1995-1-25'),
    ('54860109456', 'Pedro Ferreira', '1955-11-23'),
    ('57455975212', 'Rafael Monteiro', '1974-5-1'),
    ('84625677806', 'Gustavo Carvalho', '2012-8-2'),
    ('15776188517', 'Pedro Nascimento', '1986-7-4'),
    ('11613057180', 'Marcos Alves', '1988-1-5'),
    ('26511299398', 'Carlos Ferreira', '1963-9-19'),
    ('13460693843', 'Paulo Pereira', '1941-10-9'),
    ('48053310711', 'Marcos Pereira', '2007-9-17'),
    ('15220646838', 'Ricardo Pereira', '2009-6-14'),
    ('40940051179', 'Amanda Mendes', '2007-2-20'),
    ('99673429792', 'Rafael Alves', '1999-11-6'),
    ('55208032545', 'Mariana Santos', '1964-3-8'),
    ('62972652604', 'Gustavo Ribeiro', '2005-11-21'),
    ('87304102696', 'Rafael Alves', '2009-12-15'),
    ('74101283239', 'Luiz Rocha', '2008-4-16'),
    ('27885303079', 'Mariana Rocha', '1941-9-26'),
    ('52122708739', 'Ana Batista', '1978-2-16'),
    ('38235347828', 'Paulo Monteiro', '2008-4-15'),
    ('79351752508', 'Maria Almeida', '2003-10-16'),
    ('72665079152', 'Lucas Ferreira', '2010-8-1'),
    ('38943786434', 'Ana Santos', '1985-3-7'),
    ('66431821365', 'Luiz Martins', '1991-8-11'),
    ('95547122590', 'Pedro Silva', '1963-5-3'),
    ('95175040138', 'Amanda Rocha', '2009-11-18'),
    ('13453564522', 'Pedro Carvalho', '1997-11-3'),
    ('49542973249', 'Marcos Pereira', '2008-9-26'),
    ('26975763497', 'Marcos Carvalho', '2004-6-16'),
    ('69136075258', 'Amanda Ferreira', '2004-3-9'),
    ('36074467362', 'Luiz Santos', '1951-10-5'),
    ('90214112142', 'Felipe Ferreira', '1952-11-16'),
    ('33723937648', 'Rafael Souza', '2006-11-26'),
    ('18213505490', 'Rafael Santos', '2006-5-12'),
    ('37348166166', 'Fernanda Moreira', '2008-12-17'),
    ('84829073660', 'Gustavo Pereira', '2012-2-7'),
    ('31265841601', 'Ana Batista', '1985-1-21'),
    ('14623501388', 'Gabriela Nascimento', '1985-12-1'),
    ('80683485753', 'Maria Santos', '2009-9-5'),
    ('29127723888', 'Pedro Ferreira', '2008-11-6'),
    ('21996605006', 'Rafael Lima', '1971-12-20'),
    ('65948145420', 'Maria Carvalho', '1975-11-16'),
    ('30490764917', 'Isabela Souza', '2009-10-18'),
    ('12306742102', 'Maria Ferreira', '2007-4-25'),
    ('68589175839', 'Carlos Costa', '2011-10-10'),
    ('73332869376', 'Maria Carvalho', '2007-8-22'),
    ('18781264210', 'Rafael Melo', '2011-8-14'),
    ('95098248432', 'Amanda Rodrigues', '2011-3-1'),
    ('84775246987', 'Gabriela Ribeiro', '2011-4-10'),
    ('75166111308', 'Marcos Moreira', '1974-10-27'),
    ('49311829820', 'Camila Lima', '1951-2-18'),
    ('48919730066', 'Rafaela Melo', '1997-8-4'),
    ('66822355279', 'Ana Barros', '2008-7-9'),
    ('32268781006', 'Amanda Cardoso', '1989-12-13'),
    ('62488871756', 'Rafael Moreira', '1949-8-4'),
    ('79919916738', 'Luiz Melo', '1950-3-21'),
    ('69185484069', 'Rafael Martins', '2012-9-25'),
    ('39122855302', 'Ana Santos', '2007-3-3'),
    ('95198649070', 'Amanda Oliveira', '2011-4-12'),
    ('75494013044', 'Amanda Lima', '2011-1-28'),
    ('21851383604', 'Isabela Oliveira', '1994-10-24'),
    ('59505654092', 'Isabela Barros', '1940-1-10'),
    ('49643583786', 'Isabela Lima', '1973-11-6'),
    ('59467014726', 'Lucas Santos', '1969-9-22'),
    ('16734190562', 'Pedro Ribeiro', '1945-1-13'),
    ('45803641821', 'Isabela Batista', '1987-6-28'),
    ('63052788543', 'Maria Rocha', '1952-8-19'),
    ('12039944930', 'Amanda Martins', '1941-6-20'),
    ('47313540120', 'Camila Rocha', '1994-4-9'),
    ('72679051616', 'Ricardo Santos', '2012-9-16'),
    ('61391984005', 'Maria Martins', '2007-5-27'),
    ('67178743074', 'Amanda Oliveira', '1944-2-12'),
    ('94603639732', 'Rafaela Rodrigues', '1982-1-8'),
    ('75026294624', 'Isabela Rocha', '1940-3-14'),
    ('30736695997', 'Rafaela Martins', '2008-1-18'),
    ('54660396228', 'Fernanda Mendes', '1986-7-21'),
    ('85991393963', 'Fernanda Souza', '1957-9-4'),
    ('33964399975', 'Ricardo Pereira', '2012-1-20'),
    ('81217819328', 'Felipe Batista', '2008-11-10'),
    ('26336069048', 'Rafael Mendes', '1997-10-6'),
    ('25349914260', 'Mariana Batista', '1976-1-18'),
    ('37533956264', 'Rafaela Batista', '2008-1-26'),
    ('78911268448', 'Carlos Oliveira', '1954-9-16'),
    ('58141096230', 'Juliana Silva', '2011-4-22'),
    ('71643424414', 'Ricardo Cardoso', '2011-11-19'),
    ('92121503107', 'Ana Souza', '1941-8-27'),
    ('62045572907', 'Mariana Costa', '2012-11-14'),
    ('53990860043', 'Gustavo Martins', '2007-12-20'),
    ('73829027424', 'Pedro Monteiro', '1949-8-19'),
    ('89880380855', 'Isabela Mendes', '1950-3-25'),
    ('28455308745', 'Luiz Melo', '2011-8-19'),
    ('11894131099', 'Carlos Rocha', '2009-9-22'),
    ('67611773162', 'Ricardo Carvalho', '1940-2-17'),
    ('19485299358', 'Gustavo Lima', '1986-11-15'),
    ('41062454939', 'Gabriela Cardoso', '2008-9-14'),
    ('17836381298', 'Rafael Nascimento', '2008-9-13'),
    ('72595247278', 'Gabriela Moreira', '2012-11-19'),
    ('62216277793', 'Felipe Souza', '2011-12-17'),
    ('71869932610', 'Ricardo Martins', '1955-8-21'),
    ('53684251589', 'Isabela Santos', '1966-8-22'),
    ('43385636867', 'Luiz Batista', '2009-9-21'),
    ('52499397759', 'Juliana Souza', '2011-11-26'),
    ('99273290425', 'Isabela Ferreira', '2012-2-7'),
    ('65339124352', 'Rafael Rocha', '1958-10-19'),
    ('94311585976', 'Fernanda Ribeiro', '1950-2-20'),
    ('53013151493', 'Camila Monteiro', '1999-4-21'),
    ('27445772270', 'Juliana Costa', '2007-11-16'),
    ('96494740475', 'Marcos Santos', '1952-11-1'),
    ('40796163622', 'Amanda Martins', '1956-8-14'),
    ('90653270453', 'Carlos Ferreira', '1977-11-27'),
    ('62355821386', 'Luiz Oliveira', '2009-11-4'),
    ('38817135652', 'Luiz Cardoso', '2001-3-2'),
    ('81891449815', 'Ana Batista', '2007-9-7'),
    ('18173820941', 'Fernanda Lima', '2010-9-17'),
    ('60157717490', 'Juliana Batista', '1943-6-27'),
    ('53736200127', 'Isabela Batista', '1976-3-12'),
    ('84426033520', 'Isabela Almeida', '1994-5-15'),
    ('24101067776', 'Gustavo Monteiro', '2008-10-19'),
    ('34540785234', 'Mariana Ferreira', '1970-10-19'),
    ('95585607269', 'Paulo Gomes', '2011-9-23'),
    ('62044725570', 'Mariana Martins', '1996-5-26'),
    ('73549181530', 'Fernanda Carvalho', '1953-1-28'),
    ('61055503273', 'Isabela Almeida', '2003-1-17'),
    ('43463703835', 'Mariana Ferreira', '1954-9-5'),
    ('60037690284', 'Fernanda Melo', '2008-2-3'),
    ('41564702576', 'Carlos Santos', '1957-1-2'),
    ('70265733682', 'Mariana Martins', '2011-5-27'),
    ('22024914267', 'Maria Barros', '2011-5-20'),
    ('17343825377', 'Amanda Melo', '2012-11-22'),
    ('64683184711', 'Carlos Barros', '1966-6-20'),
    ('15515538597', 'Carlos Silva', '2010-7-1'),
    ('26444898722', 'Rafael Costa', '1946-11-4'),
    ('46485848280', 'Isabela Moreira', '2012-8-18'),
    ('58728515713', 'Ana Costa', '2012-10-21'),
    ('18823302988', 'Gabriela Silva', '2011-5-11'),
    ('79413659663', 'Ricardo Costa', '2001-8-10'),
    ('32800195808', 'Marcos Gomes', '2009-5-19'),
    ('14429204004', 'Ana Costa', '1956-9-2'),
    ('50827415039', 'Maria Moreira', '1975-7-18'),
    ('59295467401', 'Gustavo Monteiro', '1980-9-5'),
    ('41251356437', 'Carlos Monteiro', '1941-11-22'),
    ('96376920843', 'Luiz Gomes', '1942-1-12'),
    ('71507385767', 'Lucas Batista', '1951-7-10'),
    ('40106284117', 'Gustavo Ribeiro', '1995-4-24'),
    ('12980771884', 'Felipe Mendes', '1955-11-18'),
    ('36713542179', 'Rafael Melo', '1998-1-28'),
    ('20891730519', 'Marcos Rocha', '2005-1-3'),
    ('87824794293', 'Juliana Lima', '2009-1-2'),
    ('64502685755', 'Pedro Souza', '2011-5-9'),
    ('93340315986', 'Rafaela Monteiro', '1982-3-2'),
    ('15973508964', 'Rafael Ferreira', '2012-2-23'),
    ('24790526508', 'Mariana Cardoso', '2011-3-1'),
    ('63307498124', 'Gabriela Cardoso', '1952-3-18'),
    ('32462965256', 'Rafael Almeida', '1955-8-12'),
    ('88224318829', 'Gabriela Batista', '1955-1-18'),
    ('36830983960', 'Maria Batista', '1982-12-5'),
    ('41332215093', 'Lucas Oliveira', '2007-8-1'),
    ('78542611345', 'Luiz Barros', '2008-7-16'),
    ('96795255883', 'Gustavo Ribeiro', '1952-3-25'),
    ('89427212718', 'Luiz Moreira', '1950-10-20'),
    ('40116390763', 'Lucas Monteiro', '1952-8-27'),
    ('72583292763', 'Marcos Oliveira', '1965-12-2'),
    ('29111269577', 'Pedro Monteiro', '2011-11-12'),
    ('20086069795', 'Mariana Carvalho', '2008-10-3'),
    ('14132492517', 'Ricardo Souza', '2007-11-5'),
    ('11202076021', 'Juliana Cardoso', '2009-12-19'),
    ('93110899207', 'Maria Pereira', '1960-12-6'),
    ('13674090495', 'Ana Lima', '2007-9-4'),
    ('30800897964', 'Carlos Mendes', '1949-4-9'),
    ('60830620806', 'Carlos Ribeiro', '2010-6-21'),
    ('35601181069', 'Felipe Costa', '1941-8-23'),
    ('32018607337', 'Isabela Oliveira', '2012-11-19'),
    ('29469271028', 'Luiz Cardoso', '1998-1-26'),
    ('64450692090', 'Gustavo Rocha', '1963-9-28'),
    ('69331152625', 'Maria Monteiro', '1958-11-2'),
    ('23340643962', 'Ricardo Mendes', '2000-9-9'),
    ('43980033091', 'Fernanda Gomes', '1946-3-17'),
    ('27085867203', 'Felipe Cardoso', '1957-6-2'),
    ('16388716029', 'Luiz Ferreira', '1955-6-14'),
    ('33912412747', 'Rafael Ferreira', '2011-8-11'),
    ('99861574581', 'Marcos Gomes', '1955-5-11'),
    ('34832244116', 'Ricardo Oliveira', '2010-5-3'),
    ('44813098497', 'Ricardo Carvalho', '1943-11-3'),
    ('74807607964', 'Ricardo Barros', '1942-2-21'),
    ('44788632372', 'Paulo Nascimento', '1980-5-16'),
    ('24442857546', 'Pedro Souza', '2012-8-23'),
    ('34876612485', 'Rafael Oliveira', '1970-4-19'),
    ('67208641622', 'Mariana Nascimento', '2009-12-12'),
    ('94302712909', 'Gustavo Ribeiro', '2012-11-3'),
    ('52217598825', 'Rafaela Santos', '1946-4-9'),
    ('13945230555', 'Carlos Moreira', '1974-11-22'),
    ('77426930166', 'Isabela Rodrigues', '2001-7-16'),
    ('87482098442', 'Rafael Silva', '1954-10-8'),
    ('42030809089', 'Carlos Carvalho', '1951-4-2'),
    ('41520121178', 'Camila Monteiro', '1977-1-21'),
    ('46239428669', 'Amanda Nascimento', '1975-5-23'),
    ('54413255987', 'Carlos Monteiro', '1989-5-2'),
    ('34808429504', 'Carlos Nascimento', '2006-2-19'),
    ('28163126068', 'Amanda Rodrigues', '1962-9-5'),
    ('28868146015', 'Felipe Gomes', '1957-8-26'),
    ('24077661479', 'Rafaela Rodrigues', '1958-12-23'),
    ('17305324045', 'Paulo Monteiro', '1988-11-9'),
    ('38042802092', 'Paulo Silva', '1999-5-8'),
    ('73607313336', 'Paulo Silva', '1965-2-21'),
    ('79989925701', 'Carlos Gomes', '2004-11-10'),
    ('29755542880', 'Juliana Cardoso', '1947-2-7'),
    ('66366072239', 'Gabriela Carvalho', '2010-3-15'),
    ('52649636514', 'Felipe Melo', '1981-6-3'),
    ('87262965432', 'Isabela Melo', '2010-12-5'),
    ('76762375405', 'Mariana Oliveira', '1942-11-16'),
    ('81328378296', 'Carlos Alves', '1964-4-10'),
    ('48622722770', 'Fernanda Rocha', '1995-3-14'),
    ('46619422699', 'Maria Moreira', '1949-9-2'),
    ('40098414651', 'Ana Almeida', '1991-2-18'),
    ('63939121184', 'Carlos Souza', '1940-9-9'),
    ('35496345140', 'Rafael Cardoso', '1982-3-12'),
    ('25753890272', 'Ricardo Carvalho', '2012-8-24'),
    ('62309792726', 'Amanda Moreira', '1949-2-15'),
    ('75794862276', 'Isabela Lima', '2011-2-3'),
    ('93738409682', 'Camila Silva', '1961-7-17'),
    ('47577254486', 'Camila Gomes', '2011-11-17'),
    ('21267535011', 'Fernanda Costa', '2006-5-13'),
    ('22634369273', 'Lucas Costa', '1978-6-26'),
    ('33998315883', 'Lucas Costa', '2008-4-21'),
    ('35949085617', 'Lucas Ferreira', '1940-9-20'),
    ('56046639905', 'Rafaela Souza', '1943-7-14'),
    ('60768553388', 'Lucas Santos', '1955-6-12'),
    ('90577217746', 'Rafaela Costa', '1942-2-16'),
    ('23043748852', 'Rafaela Oliveira', '2008-4-15'),
    ('32024400485', 'Fernanda Monteiro', '2007-1-22'),
    ('13840473362', 'Amanda Ribeiro', '2007-5-3'),
    ('45221173699', 'Juliana Rocha', '2009-4-8'),
    ('94952220383', 'Camila Melo', '1976-3-16'),
    ('82001807771', 'Camila Barros', '2011-4-13'),
    ('45119675622', 'Maria Lima', '1956-2-7'),
    ('49732539508', 'Paulo Lima', '2010-4-1'),
    ('13401768812', 'Marcos Carvalho', '2011-1-10'),
    ('69780229209', 'Ricardo Cardoso', '1946-2-16'),
    ('89787665767', 'Juliana Ribeiro', '1950-4-24'),
    ('34200142655', 'Amanda Rocha', '1944-6-4'),
    ('73343411699', 'Amanda Alves', '1957-3-3'),
    ('29918468667', 'Gabriela Oliveira', '1958-3-4'),
    ('58232552109', 'Isabela Silva', '1944-9-12'),
    ('69939441599', 'Pedro Pereira', '2002-12-1'),
    ('69059476482', 'Fernanda Oliveira', '1945-2-15'),
    ('50171904827', 'Lucas Rodrigues', '1940-8-16'),
    ('40409421851', 'Paulo Melo', '1990-3-11'),
    ('17113999575', 'Isabela Costa', '1988-3-23'),
    ('69866252801', 'Carlos Silva', '2007-9-2'),
    ('12975637260', 'Ricardo Moreira', '2010-1-15'),
    ('58141491033', 'Lucas Silva', '2008-3-13'),
    ('48795778145', 'Maria Souza', '1945-10-5'),
    ('13323443077', 'Camila Cardoso', '1951-3-4'),
    ('82530575931', 'Mariana Batista', '2011-6-12'),
    ('30223157797', 'Maria Martins', '1963-7-22'),
    ('13060735018', 'Mariana Barros', '2010-11-5'),
    ('22829687470', 'Gustavo Cardoso', '1961-1-23'),
    ('24599065124', 'Luiz Barros', '1999-3-8'),
    ('18136674660', 'Ricardo Silva', '1947-3-10'),
    ('65079174197', 'Marcos Moreira', '1960-12-3'),
    ('56883380265', 'Ana Monteiro', '1965-9-22'),
    ('86865461093', 'Isabela Melo', '1968-6-10'),
    ('19845105000', 'Marcos Rocha', '2010-6-20'),
    ('47214346704', 'Rafaela Barros', '1946-8-19'),
    ('33626222447', 'Pedro Costa', '1959-1-22'),
    ('84750410349', 'Ricardo Mendes', '2009-11-13'),
    ('19219255803', 'Amanda Martins', '1953-6-2'),
    ('14839439535', 'Marcos Monteiro', '2005-10-28'),
    ('67041174011', 'Lucas Cardoso', '2012-9-25'),
    ('28021896004', 'Mariana Carvalho', '1940-9-25'),
    ('75644529393', 'Amanda Rocha', '1970-10-25'),
    ('15546145077', 'Felipe Batista', '1952-8-13'),
    ('22268198416', 'Rafaela Lima', '1992-1-10'),
    ('43802440669', 'Paulo Oliveira', '1990-9-6'),
    ('54291046897', 'Gustavo Melo', '1987-7-18'),
    ('83436047592', 'Juliana Alves', '1971-7-1'),
    ('39725188839', 'Juliana Gomes', '1947-11-12'),
    ('81206743959', 'Luiz Melo', '2009-5-20'),
    ('72165098249', 'Juliana Carvalho', '1950-8-6'),
    ('38523497855', 'Juliana Souza', '1987-2-24'),
    ('24270065826', 'Ana Alves', '2001-3-7'),
    ('79994458505', 'Gustavo Nascimento', '2010-5-24'),
    ('13377343269', 'Rafaela Costa', '1979-7-4'),
    ('24544541099', 'Carlos Silva', '2011-5-23'),
    ('38163268236', 'Rafael Ferreira', '2012-9-13'),
    ('70493041473', 'Isabela Pereira', '1942-2-2'),
    ('18834799415', 'Carlos Rodrigues', '1992-7-20'),
    ('31633803064', 'Marcos Martins', '2011-9-2'),
    ('58339071855', 'Mariana Ribeiro', '2011-8-22'),
    ('54250600186', 'Amanda Martins', '1945-5-24'),
    ('15658150679', 'Lucas Pereira', '1976-10-15'),
    ('37165259502', 'Gustavo Silva', '2008-6-8'),
    ('97513587062', 'Gustavo Ribeiro', '2006-12-7'),
    ('42168757964', 'Gustavo Souza', '1942-10-16'),
    ('47818880177', 'Carlos Martins', '1954-11-23'),
    ('49889851167', 'Carlos Alves', '2010-1-26'),
    ('85139390385', 'Camila Martins', '2005-1-28'),
    ('41739259885', 'Isabela Melo', '2010-10-12'),
    ('57516267013', 'Isabela Costa', '2005-1-24'),
    ('85056555592', 'Isabela Oliveira', '2007-11-14'),
    ('80719482463', 'Rafaela Rocha', '1985-1-21'),
    ('44994378942', 'Amanda Lima', '1974-12-22'),
    ('96919230953', 'Juliana Monteiro', '1971-1-28'),
    ('91292005072', 'Pedro Melo', '1954-4-4'),
    ('29418938364', 'Camila Souza', '1952-8-24'),
    ('20357835281', 'Luiz Rodrigues', '2009-9-7'),
    ('92992203485', 'Paulo Moreira', '1953-5-11'),
    ('83025735518', 'Amanda Oliveira', '1950-7-8'),
    ('52138350554', 'Carlos Oliveira', '1963-12-24'),
    ('83015487966', 'Marcos Souza', '2011-10-4'),
    ('88231800890', 'Gustavo Rodrigues', '1985-6-9'),
    ('62846130743', 'Camila Gomes', '1959-10-1'),
    ('71093399181', 'Paulo Martins', '1975-4-6'),
    ('45242607158', 'Marcos Costa', '2011-7-10'),
    ('13997305020', 'Mariana Melo', '2008-3-23'),
    ('83261811773', 'Luiz Gomes', '2007-1-21'),
    ('43793126959', 'Felipe Carvalho', '1955-1-18'),
    ('75569250050', 'Gabriela Melo', '1971-1-20'),
    ('66136641466', 'Lucas Silva', '1947-3-4'),
    ('86952819625', 'Paulo Alves', '1956-12-10'),
    ('19446612599', 'Gabriela Ribeiro', '1948-9-3'),
    ('74480279926', 'Marcos Santos', '1940-4-4'),
    ('89173582631', 'Isabela Souza', '1948-2-13'),
    ('45505321955', 'Amanda Ferreira', '1947-2-3'),
    ('35445037910', 'Mariana Moreira', '1946-3-9'),
    ('13525123084', 'Rafaela Batista', '2009-6-12'),
    ('55916138383', 'Maria Melo', '1993-5-27'),
    ('88191018771', 'Carlos Almeida', '1979-7-9'),
    ('85185804335', 'Mariana Silva', '1980-3-15'),
    ('45808687170', 'Juliana Batista', '1957-6-22'),
    ('57174699095', 'Luiz Costa', '2009-4-21'),
    ('35749503417', 'Marcos Gomes', '2011-4-11'),
    ('37035329602', 'Marcos Carvalho', '2010-5-4'),
    ('41432418368', 'Paulo Monteiro', '1945-12-28'),
    ('87348939967', 'Pedro Cardoso', '1956-4-5'),
    ('68116123435', 'Lucas Oliveira', '1978-8-8'),
    ('91981729596', 'Mariana Monteiro', '2011-12-5'),
    ('74603205875', 'Amanda Costa', '2012-2-9'),
    ('26269890155', 'Lucas Lima', '2008-10-21'),
    ('13864118999', 'Camila Ferreira', '2003-5-3'),
    ('66003842245', 'Gabriela Gomes', '1946-2-1'),
    ('87402187430', 'Isabela Ferreira', '1945-7-13'),
    ('54027432479', 'Maria Costa', '2007-3-5'),
    ('78416860382', 'Felipe Souza', '2012-8-24'),
    ('76577379419', 'Felipe Santos', '2008-1-15'),
    ('12673987893', 'Fernanda Rodrigues', '2007-4-19'),
    ('44986645617', 'Maria Barros', '2009-9-26'),
    ('86134526943', 'Ricardo Oliveira', '2001-1-12'),
    ('94102816648', 'Paulo Silva', '1986-6-9'),
    ('24370051522', 'Ana Barros', '1945-5-12'),
    ('15620687744', 'Juliana Moreira', '2012-2-2'),
    ('36718544634', 'Rafael Gomes', '1955-4-20'),
    ('19037161064', 'Camila Pereira', '2007-11-23'),
    ('13603643324', 'Isabela Silva', '1957-1-9'),
    ('92041829400', 'Marcos Ferreira', '1960-10-2'),
    ('43305476278', 'Maria Rocha', '2011-9-15'),
    ('62154333453', 'Carlos Oliveira', '1951-3-23'),
    ('82286375622', 'Camila Barros', '1978-6-12'),
    ('84168137791', 'Ana Gomes', '2003-9-14'),
    ('99696463715', 'Pedro Barros', '2007-2-12'),
    ('19526200299', 'Gabriela Rodrigues', '1974-2-24'),
    ('47092252055', 'Fernanda Carvalho', '1978-2-2'),
    ('84331714497', 'Isabela Silva', '1970-2-11'),
    ('60984434717', 'Isabela Moreira', '2009-11-25'),
    ('72816564645', 'Ricardo Silva', '2009-12-13'),
    ('23037704641', 'Ricardo Pereira', '2010-12-26'),
    ('42698977708', 'Camila Alves', '1994-4-24'),
    ('98140327275', 'Carlos Costa', '2010-9-28'),
    ('80328479651', 'Ricardo Carvalho', '1952-10-10'),
    ('59913754169', 'Juliana Cardoso', '1985-4-26'),
    ('14511426545', 'Carlos Pereira', '1941-1-22'),
    ('56619060229', 'Mariana Ribeiro', '1955-12-19'),
    ('24732732826', 'Maria Santos', '2010-5-7'),
    ('28082610732', 'Isabela Moreira', '1999-2-8'),
    ('81335782541', 'Juliana Batista', '2004-9-19'),
    ('91449416091', 'Camila Souza', '1946-12-13'),
    ('84156856293', 'Mariana Rocha', '2008-1-3'),
    ('82035121971', 'Ricardo Oliveira', '1983-10-20'),
    ('72296661385', 'Camila Rocha', '1948-11-9'),
    ('72973806118', 'Fernanda Barros', '1990-7-11'),
    ('80245993818', 'Rafaela Nascimento', '2009-9-27'),
    ('94125253310', 'Ana Martins', '2008-12-22'),
    ('31898559859', 'Camila Souza', '2010-4-11'),
    ('15502451780', 'Isabela Mendes', '1957-12-20'),
    ('94906068374', 'Carlos Ferreira', '1993-9-22'),
    ('73164032437', 'Felipe Gomes', '1951-11-6'),
    ('57153753616', 'Ana Nascimento', '1967-9-19'),
    ('57760273858', 'Rafaela Ferreira', '1978-8-25'),
    ('50072288972', 'Juliana Mendes', '2000-7-3'),
    ('95841576643', 'Rafaela Carvalho', '1960-6-11'),
    ('46776258895', 'Amanda Nascimento', '1954-7-15'),
    ('65779552625', 'Maria Martins', '1948-12-20'),
    ('11970787228', 'Ricardo Almeida', '1982-7-11'),
    ('85969786455', 'Maria Melo', '1991-5-17'),
    ('11705439020', 'Gustavo Rocha', '1952-5-23'),
    ('88340871171', 'Marcos Silva', '2009-9-25'),
    ('90455570087', 'Juliana Barros', '1940-1-21'),
    ('87155669179', 'Fernanda Souza', '2009-2-13'),
    ('68088474192', 'Paulo Mendes', '1964-6-6'),
    ('58431447922', 'Fernanda Ribeiro', '1954-1-22'),
    ('53133276198', 'Camila Ferreira', '1966-8-7'),
    ('78601564709', 'Fernanda Alves', '2009-1-9'),
    ('51255685790', 'Felipe Alves', '2007-1-28'),
    ('74065749680', 'Gabriela Rocha', '2010-1-23'),
    ('99934367176', 'Lucas Ferreira', '1974-10-6'),
    ('53118400680', 'Gustavo Mendes', '1982-7-13'),
    ('46209152002', 'Amanda Melo', '1991-12-6'),
    ('23862368675', 'Isabela Silva', '2008-11-18'),
    ('15503887282', 'Marcos Barros', '1972-7-22'),
    ('57280227627', 'Rafaela Lima', '1994-4-5'),
    ('18480580900', 'Juliana Souza', '2002-1-28'),
    ('28058881546', 'Fernanda Santos', '1946-5-16'),
    ('21797091280', 'Gabriela Mendes', '1960-5-8'),
    ('16541375374', 'Luiz Melo', '1983-11-20'),
    ('55680960625', 'Marcos Moreira', '2007-8-10'),
    ('47391683431', 'Pedro Mendes', '1949-9-4'),
    ('17585533467', 'Gabriela Pereira', '1952-11-24'),
    ('41539923106', 'Maria Monteiro', '2011-8-15'),
    ('93273676393', 'Isabela Ribeiro', '1948-4-24'),
    ('97976052463', 'Juliana Ferreira', '1945-10-24'),
    ('34256453996', 'Pedro Almeida', '1974-11-1'),
    ('82108673253', 'Fernanda Melo', '2010-9-7'),
    ('72345876393', 'Ricardo Ribeiro', '2010-6-11'),
    ('92386639691', 'Felipe Alves', '2011-2-6'),
    ('26333242268', 'Juliana Souza', '2012-7-22'),
    ('81107489461', 'Fernanda Batista', '1957-10-12'),
    ('49352427493', 'Camila Mendes', '1968-4-11'),
    ('79411184324', 'Ana Carvalho', '1948-3-19'),
    ('77853880020', 'Luiz Ferreira', '1956-10-25'),
    ('26489970025', 'Amanda Carvalho', '1955-6-18'),
    ('93625943015', 'Rafaela Martins', '1976-8-28'),
    ('98612705547', 'Carlos Carvalho', '1976-2-25'),
    ('96106838244', 'Mariana Pereira', '1991-5-8'),
    ('71428037095', 'Mariana Batista', '1957-12-4'),
    ('50357550879', 'Ana Mendes', '1950-12-6');
END; $$;