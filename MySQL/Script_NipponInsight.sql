/* 
------------------------------ PROJETO INDIVIDUAL - NIPPON INSIGHT -------------------------------

							   Andreia Miyuki Kubota - RA:04252014
--------------------------------------------------------------------------------------------------                        
*/

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
				REFERENCES usuario(idUsuario)
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

