-- CREATE TABLE SCRIPT
-- author: Gabriel
-- date: 23/05/2024

CREATE TABLE Motoristas (
	id_motorista SERIAL PRIMARY KEY,
	matricula CHAR(5) UNIQUE NOT NULL,
	cpf CHAR(11) UNIQUE NOT NULL,
	nome VARCHAR(100),
	data_nascimento DATE
);

CREATE TABLE Passageiros (
	id_passageiro SERIAL PRIMARY KEY,
	cpf CHAR(11) UNIQUE NOT NULL,
	nome VARCHAR(100),
	data_nascimento DATE NOT NULL,
	beneficio VARCHAR(10) CHECK(beneficio IN ('INTEIRA', 'MEIA', 'GRATUITA'))
);

CREATE TABLE Onibus (
	id_onibus SERIAL PRIMARY KEY,
	placa VARCHAR(10) UNIQUE NOT NULL,
	marca VARCHAR(50),
	modelo VARCHAR(50),
	quilometragem INT,
	status VARCHAR(10) CHECK(status IN ('DISPONIVEL', 'EM VIAGEM', 'MANUTENCAO'))
);

CREATE TABLE Tarifas (
	id_tarifa SERIAL PRIMARY KEY,
	descricao VARCHAR(50),
	valor_inteira MONEY NOT NULL,
	valor_meia MONEY NOT NULL
);

CREATE TABLE Linhas (
	id_linha SERIAL PRIMARY KEY,
	numero VARCHAR(10) NOT NULL,
	origem VARCHAR(50),
	destino VARCHAR(50),
	duracao INTERVAL NOT NULL,
	extensao_km INT NOT NULL,
	id_tarifa INT REFERENCES Tarifas
);

CREATE TABLE Viagens (
	id_viagem SERIAL PRIMARY KEY,
	hora_viagem TIMESTAMP NOT NULL,
	id_linha INT NOT NULL REFERENCES Linhas,
	id_onibus INT REFERENCES Onibus,
	id_motorista INT REFERENCES Motoristas
);

CREATE TABLE Embarques (
	id_embarque SERIAL PRIMARY KEY,
	hora_embarque TIMESTAMP NOT NULL,
	id_viagem INT NOT NULL REFERENCES Viagens,
	id_passageiro INT NOT NULL REFERENCES Passageiros
);