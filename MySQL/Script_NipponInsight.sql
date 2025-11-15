/* 
------------------------------ PROJETO INDIVIDUAL - NIPPON INSIGHT -------------------------------

							   Andreia Miyuki Kubota - RA:04252014
--------------------------------------------------------------------------------------------------                        
*/

USE nipponInsight;

-- ---------------- TABELA usuario QUE RECEBE OS DADOS DO FORMULÁRIO DE CADASTRO -----------------
CREATE TABLE usuario (
	idUsuario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    senha VARCHAR(20) NOT NULL
);
-- ------------------------------------- FIM TABELA usuario --------------------------------------

-- --------------- TABELA viagem QUE RECEBE OS DADOS DAS ESCOLHAS NO QUESTIONARIO ----------------
CREATE TABLE viagem (
	idViagem INT PRIMARY KEY AUTO_INCREMENT,
    fkUsuario INT NOT NULL,
    estacao VARCHAR(10) NOT NULL,
    dtIda DATE,
    dtVolta DATE,
    valorTotal DECIMAL(10,2),
		CONSTRAINT fkUsuarioViagem
			FOREIGN KEY(fkUsuario)
				REFERENCES usuario(id)
) AUTO_INCREMENT = 1000;
-- ------------------------------------- FIM TABELA viagem ---------------------------------------

-- ------------------ TABELA item QUE RECEBE OS DADOS DOS PREÇOS DE CADA ITEM --------------------
CREATE TABLE item (
	idItem INT PRIMARY KEY AUTO_INCREMENT,
    nomeItem VARCHAR(100) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
	tipo VARCHAR(100)
) AUTO_INCREMENT = 5000;
-- ------------------------------------- FIM TABELA item -----------------------------------------

INSERT INTO item (nomeItem, preco, tipo) VALUES
	('Passagem de avião ida', 6500.00, 'transporte'), -- passagem avião
	('Passagem de avião volta', 6500.00, 'transporte'),-- passagem avião
	('JR Rail Pass - COMUM (ADULTO) - 7 DIAS', 1969.37, 'transporte'), -- JR rail pass
	('JR Rail Pass - COMUM (ADULTO) - 14 DIAS', 3151.00, 'transporte'),
	('JR Rail Pass - COMUM (ADULTO) - 21 DIAS', 3938.75, 'transporte'),
	('JR Rail Pass - LUXO (ADULTO) - 7 DIAS', 2757.12, 'transporte'),
	('JR Rail Pass - LUXO (ADULTO) - 14 DIAS', 4332.62, 'transporte'),
	('JR Rail Pass - LUXO (ADULTO) - 21 DIAS', 5514.25, 'transporte'),
	('JR Rail Pass - COMUM (CRIANÇA) - 7 DIAS', 984.69, 'transporte'),
	('JR Rail Pass - COMUM (CRIANÇA) - 14 DIAS', 1575.50, 'transporte'),
	('JR Rail Pass - COMUM (CRIANÇA) - 21 DIAS', 1969.37, 'transporte'),
	('JR Rail Pass - LUXO (CRIANÇA) - 7 DIAS', 1378.56, 'transporte'),
	('JR Rail Pass - LUXO (CRIANÇA) - 14 DIAS', 2166.31, 'transporte'),
	('JR Rail Pass - LUXO (CRIANÇA) - 21 DIAS', 2757.12, 'transporte'), -- JR rail pass
	('Pocket WiFi - 7 DIAS', 69.00, 'comunicação'), -- pocket wifi
	('Pocket WiFi - 14 DIAS', 98.00, 'comunicação'),
	('Pocket WiFi - 21 DIAS', 127.00, 'comunicação'), -- pocket wifi
	('Pocket WiFi - 21 DIAS', 127.00, 'hospedagem'), -- hotel


	('Ticket Pocket Wi-fi', 6500.00, 'transporte'),
    

-- ------------------- TABELA escolha QUE RECEBE AS QUANTIDADES DE CADA ITEM ---------------------
CREATE TABLE escolha (
	idEscolha INT AUTO_INCREMENT,
    fkViagem INT,
    fkItem INT,
	qtd INT DEFAULT 1,
		CONSTRAINT pkComposta
			PRIMARY KEY (idEscolha, fkViagem, fkItem),
		CONSTRAINT fkViagemEscolha
			FOREIGN KEY(fkViagem) REFERENCES viagem(idViagem),
		CONSTRAINT fkItemEscolha
			FOREIGN KEY(fkItem) REFERENCES item(idItem)
) AUTO_INCREMENT = 10000;
-- ----------------------------------- FIM TABELA escolha ----------------------------------------





-- TABELAS AQUATECH

CREATE TABLE empresa (
	id INT PRIMARY KEY AUTO_INCREMENT,
	razao_social VARCHAR(50),
	cnpj CHAR(14),
	codigo_ativacao VARCHAR(50)
);

CREATE TABLE usuario (
	id INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(50),
	email VARCHAR(50),
	senha VARCHAR(50),
	fk_empresa INT,
	FOREIGN KEY (fk_empresa) REFERENCES empresa(id)
);

CREATE TABLE aviso (
	id INT PRIMARY KEY AUTO_INCREMENT,
	titulo VARCHAR(100),
	descricao VARCHAR(150),
	fk_usuario INT,
	FOREIGN KEY (fk_usuario) REFERENCES usuario(id)
);

create table aquario (
/* em nossa regra de negócio, um aquario tem apenas um sensor */
	id INT PRIMARY KEY AUTO_INCREMENT,
	descricao VARCHAR(300),
	fk_empresa INT,
	FOREIGN KEY (fk_empresa) REFERENCES empresa(id)
);

/* esta tabela deve estar de acordo com o que está em INSERT de sua API do arduino - dat-acqu-ino */

create table medida (
	id INT PRIMARY KEY AUTO_INCREMENT,
	dht11_umidade DECIMAL,
	dht11_temperatura DECIMAL,
	luminosidade DECIMAL,
	lm35_temperatura DECIMAL,
	chave TINYINT,
	momento DATETIME,
	fk_aquario INT,
	FOREIGN KEY (fk_aquario) REFERENCES aquario(id)
);

insert into empresa (razao_social, codigo_ativacao) values ('Empresa 1', 'ED145B');
insert into empresa (razao_social, codigo_ativacao) values ('Empresa 2', 'A1B2C3');
insert into aquario (descricao, fk_empresa) values ('Aquário de Estrela-do-mar', 1);
insert into aquario (descricao, fk_empresa) values ('Aquário de Peixe-dourado', 2);

