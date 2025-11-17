/* 
------------------------------ PROJETO INDIVIDUAL - NIPPON INSIGHT -------------------------------

							   Andreia Miyuki Kubota - RA:04252014
--------------------------------------------------------------------------------------------------                        
*/
CREATE DATABASE nipponInsight;
USE nipponInsight;

-- ---------------- TABELA usuario QUE RECEBE OS DADOS DO FORMULÁRIO DE CADASTRO -----------------
CREATE TABLE usuario (
	idUsuario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    senha VARCHAR(20) NOT NULL
);

INSERT INTO usuario (nome, email, senha) VALUES
	('Ana', 'ana@email.com', '12345678aA@'),
	('Breno', 'breno@email.com', '12345678aA@');
    
SELECT * FROM usuario;
-- ------------------------------------- FIM TABELA usuario --------------------------------------

-- --------------- TABELA viagem QUE RECEBE OS DADOS DAS ESCOLHAS NO QUESTIONARIO ----------------
CREATE TABLE viagem (
	idViagem INT PRIMARY KEY AUTO_INCREMENT,
    fkUsuario INT NOT NULL,
    estacao VARCHAR(10),
    dtIda DATE,
    dtVolta DATE,
    valorGuardado DECIMAL(10,2),
		CONSTRAINT fkUsuarioViagem
			FOREIGN KEY(fkUsuario)
				REFERENCES usuario(idUsuario)
) AUTO_INCREMENT = 1000;

INSERT INTO viagem VALUES
	(DEFAULT, 1, 'PRIMAVERA', '2026-03-25', '2026-04-08', 5000.00),
	(DEFAULT, 2, 'OUTONO', '2026-10-05', '2026-10-12', 10000.00);
    
SELECT * FROM viagem;
-- ------------------------------------- FIM TABELA viagem ---------------------------------------

-- ------------------ TABELA item QUE RECEBE OS DADOS DOS PREÇOS DE CADA ITEM --------------------
CREATE TABLE item (
	idItem INT PRIMARY KEY AUTO_INCREMENT,
    nomeItem VARCHAR(100) NOT NULL,
    descricao VARCHAR(500),
    preco DECIMAL(10,2) NOT NULL,
	tipo VARCHAR(100) NOT NULL,
    categoria VARCHAR(100) NOT NULL
) AUTO_INCREMENT = 5000;


INSERT INTO item (nomeItem, descricao, preco, tipo, categoria) VALUES
	('Passagem de avião', 'Passagem de ida', 6500.00, 'Avião','Transporte'), -- Passagem avião
	('Passagem de avião',  'Passagem de volta', 6500.00, 'Avião','Transporte'),-- Passagem avião
	('JR Rail Pass - 7 DIAS', 'COMUM (ADULTO)', 1969.37, 'Trem-bala', 'Transporte'), -- JR rail pass
	('JR Rail Pass - 14 DIAS', 'COMUM (ADULTO)', 3151.00, 'Trem-bala', 'Transporte'), -- JR rail pass
	('JR Rail Pass - 21 DIAS', 'COMUM (ADULTO)', 3938.75, 'Trem-bala', 'Transporte'), -- JR rail pass
	('JR Rail Pass - 7 DIAS', 'LUXO (ADULTO)', 2757.12, 'Trem-bala', 'Transporte'), -- JR rail pass
	('JR Rail Pass - 14 DIAS', 'LUXO (ADULTO)', 4332.62, 'Trem-bala', 'Transporte'), -- JR rail pass
	('JR Rail Pass - 21 DIAS', 'LUXO (ADULTO)', 5514.25, 'Trem-bala', 'Transporte'), -- JR rail pass
	('JR Rail Pass - 7 DIAS', 'COMUM (CRIANÇA)', 984.69, 'Trem-bala', 'Transporte'), -- JR rail pass
	('JR Rail Pass - 14 DIAS', 'COMUM (CRIANÇA)', 1575.50, 'Trem-bala', 'Transporte'), -- JR rail pass
	('JR Rail Pass - 21 DIAS', 'COMUM (CRIANÇA)', 1969.37, 'Trem-bala', 'Transporte'), -- JR rail pass
	('JR Rail Pass - 7 DIAS', 'LUXO (CRIANÇA)', 1378.56, 'Trem-bala', 'Transporte'), -- JR rail pass
	('JR Rail Pass - 14 DIAS', 'LUXO (CRIANÇA)', 2166.31, 'Trem-bala', 'Transporte'), -- JR rail pass
	('JR Rail Pass - 21 DIAS', 'LUXO (CRIANÇA)', 2757.12, 'Trem-bala', 'Transporte'), -- JR rail pass
	('Bilhete Metrô/Ônibus',  'Valor gasto em bilhetes por dia', 50.00, 'Metrô/Ônibus','Transporte'), -- Bilhete metrô/ônibus
    
    ('Pocket WiFi - 7 DIAS', 'Roteador de bolso', 69.00, 'Internet','Comunicação'), -- Pocket wifi
	('Pocket WiFi - 14 DIAS', 'Roteador de bolso', 98.00, 'Internet', 'Comunicação'), -- Pocket wifi
	('Pocket WiFi - 21 DIAS', 'Roteador de bolso', 127.00, 'Internet', 'Comunicação'), -- Pocket wifi
    
	('Diária Hotel **', 'Quarto solteiro hotel comum', 300.00, 'Hotel','Hospedagem'), -- Hotel
	('Diária Hotel ***', 'Quarto solteiro hotel comum', 520.00, 'Hotel', 'Hospedagem'), -- Hotel
	('Diária Hotel ****', 'Quarto solteiro hotel comum', 600.00, 'Hotel', 'Hospedagem'), -- Hotel
	('Diária Hotel ****', 'Quarto solteiro hotel comum', 1800.00, 'Hotel', 'Hospedagem'), -- Hotel
	('Diária Ryokan **', 'Quarto solteiro hotel típico japonês', 420.00, 'Ryokan', 'Hospedagem'), -- Ryokan
	('Diária Ryokan ***', 'Quarto solteiro hotel típico japonês', 1050.00, 'Ryokan', 'Hospedagem'), -- Ryokan
	('Diária Ryokan ****', 'Quarto solteiro hotel típico japonês', 2100.00, 'Ryokan', 'Hospedagem'), -- Ryokan
	 
	('Drink Bar (Softdrink)', 'Rodízio de bebida não-alcóolica', 21, 'Bebida', 'Alimentação'), -- Bebibas
	('Drink Bar (Bebida alcoolica)', 'Rodízio de bebida alcóolica', 21, 'Bebida', 'Alimentação'), -- Bebibas
	('Café', 'Caneca', 21, 'Bebida', 'Alimentação'), -- Bebibas
	('Refrigerante', 'Lata', 6, 'Bebida', 'Alimentação'), -- Bebibas
	('Cerveja', 'lata', 12, 'Bebida', 'Alimentação'), -- Bebibas
	('Suco fresco', 'Copo', 28, 'Bebida', 'Alimentação'), -- Bebibas
	('Suco garrafa', 'Suco em garrafa de 300 - 500ml', 6.00, 'Bebida', 'Alimentação'), -- Bebibas
	
    
	('Taiyaki', 'Bolinho frito em formato de peixe com recheio (creme/doce de feijão)', 10, 'Doces', 'Alimentação'), -- Doces
	('Mochi', 'Bolinho feito com farinha de arroz recheado com doce de feijão', 10, 'Doces', 'Alimentação'), -- Doces
	('Daifuku', 'Bolinho feito com farinha de arroz recheado com doce de feijão e morango', 10, 'Doces', 'Alimentação'), -- Doces
	('Parfait japonês', 'Taça de sorvete com frutas, chantilly e cereal,', 40, 'Doces', 'Alimentação'), -- Doces
	('Dango', 'Bolinho feito com farinha de arroz e molho doce de shoyu', 10, 'Doces', 'Alimentação'), -- Doces
	('Cheesecake japonês', 'Cheesecake tradicional', 30, 'Doces', 'Alimentação'), -- Doces
	('Sorvete', 'Bola de sorvete', 21, 'Doces', 'Alimentação'), -- Doces
	('Crepe', 'Crepe doce com recheio de chantilly, frutas e caldas', 21, 'Doces', 'Alimentação'), -- Doces
	('Confeitarias especiais', 'Doces tradicionais japoneses', 40, 'Doces', 'Alimentação'), -- Doces
    
	('Café da manhã simples', 'Sanduíche e café', 25, 'Café da manhã', 'Alimentação'), -- Café da manhã
	('Café da manhã ocidental',  'Ovos, torradas e bebida', 40, 'Café da manhã', 'Alimentação'), -- Café da manhã
	('Café da manhã em hotel',  'Buffet à vontade', 100, 'Café da manhã', 'Alimentação'), -- Café da manhã
    
	('Comida chinesa', 'Lamen chinês, arroz frito, gyoza', 52, 'Refeição', 'Alimentação'), -- Refeição
	('Comida italiana', 'Massa ou pizza individual', 70, 'Refeição', 'Alimentação'), -- Refeição
	('Tabehoudai',  'Rodízio com limite de 90minutos', 125, 'Refeição', 'Alimentação'), -- Refeição
	('Teishoku', 'Refeição completa tradicional: Arroz + sopa + prato principal + acompanhamentos', 70, 'Refeição', 'Alimentação'), -- Refeição
	('Sukiyaki', 'Carne cozida na mesa com macarrão, cogumelos, broto de feijão', 122, 'Refeição', 'Alimentação'), -- Refeição
	('Shabu-shabu', 'Carne fina para hotpot cozida na mesa com macarrão, cogumelos, broto de feijão', 122, 'Refeição', 'Alimentação'), -- Refeição
	('Lámen (Ramen)', 'Macarrão com caldo (à base de frango, porco, shoyu, sal, missô)', 42, 'Refeição', 'Alimentação'), -- Refeição
	('Soba', 'Macarrão de trigo sarraceno com caldo à base de shoyu e hondashi', 22, 'Refeição', 'Alimentação'), -- Refeição
	('Udon', 'Macarrão grosso tradicional com caldo à base de shoyu e hondashi', 42, 'Refeição', 'Alimentação'), -- Refeição
	('Sushi Tradicional', 'Combo de 8–12 peças', 70, 'Refeição', 'Alimentação'), -- Refeição
	('Sushi de esteira (kaiten sushi)', '1 prato de 2 peças', 12, 'Refeição', 'Alimentação'), -- Refeição
	('Curry japonês', 'Curry estilo japonês com batatas, cenouras e algum tipo de proteína', 35, 'Refeição', 'Alimentação'), -- Refeição
	('Donburi', 'Tigela com arroz e carne/porco', 28, 'Refeição', 'Alimentação'), -- Refeição
	('fast-food',  'Combo: hambúrguer + batata + bebida', 42, 'Refeição', 'Alimentação'), -- Refeição
	('Bento', 'Marmita pronta', 32, 'Refeição', 'Alimentação'), -- Refeição
	('Okonomiyaki', 'Panqueca japonesa', 52, 'Refeição', 'Alimentação'), -- Refeição
	('Tempurá',  'Camarão e legumes empanados', 70, 'Refeição', 'Alimentação'), -- Refeição
	('Tonkatsu', 'Carne de porco empanada', 52, 'Refeição', 'Alimentação'), -- Refeição
	('Gyukatsu', 'Contra-filé empanado', 52, 'Refeição', 'Alimentação'), -- Refeição
	('Okonomiyaki', 'Panqueca japonesa', 52, 'Refeição', 'Alimentação'), -- Refeição
	('Wagyu', 'Carne premium', 350, 'Refeição', 'Alimentação'), -- Refeição
	('Takoyaki', 'Bolinho com recheio de polvo', 28, 'Refeição', 'Alimentação'), -- Refeição
    ('Yakitori',  'Espetinho de frango', 7, 'Refeição', 'Alimentação'); -- Refeição
    
    
SELECT * FROM item;
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

INSERT INTO escolha VALUES
	(DEFAULT, 1000, 5000, 1),
	(DEFAULT, 1000, 5001, 1),
	(DEFAULT, 1000, 5002, 1),
	(DEFAULT, 1000, 5014, 7),
	(DEFAULT, 1000, 5015, 1),
	(DEFAULT, 1000, 5019, 6),
	(DEFAULT, 1000, 5050, 3),
	(DEFAULT, 1000, 5051, 1),
	(DEFAULT, 1000, 5053, 1),
	(DEFAULT, 1000, 5054, 10),
	(DEFAULT, 1000, 5041, 5),
	(DEFAULT, 1000, 5042, 1),
	(DEFAULT, 1000, 5043, 1),
	(DEFAULT, 1000, 5038, 4),
	(DEFAULT, 1000, 5039, 1),
	(DEFAULT, 1001, 5000, 1),
	(DEFAULT, 1001, 5001, 1),
	(DEFAULT, 1001, 5002, 1),
	(DEFAULT, 1001, 5014, 7),
	(DEFAULT, 1001, 5015, 1),
	(DEFAULT, 1001, 5019, 6),
	(DEFAULT, 1001, 5050, 3),
	(DEFAULT, 1001, 5051, 1),
	(DEFAULT, 1001, 5053, 1),
	(DEFAULT, 1001, 5046, 2),
	(DEFAULT, 1001, 5041, 5),
	(DEFAULT, 1001, 5042, 1),
	(DEFAULT, 1001, 5043, 1),
	(DEFAULT, 1001, 5038, 4),
	(DEFAULT, 1001, 5039, 1);
    
SELECT * FROM escolha;


 
-- ----------------------------------- FIM TABELA escolha ----------------------------------------

-- ------------------------------------------- SELECTS -------------------------------------------
SELECT * FROM usuario; -- idUsuario, nome, email, senha (AUTO_INCREMENT = 1);
SELECT * FROM viagem; -- idViagem, fkUsuario, estacao, dtIda, dtVolta, valorGuardado (AUTO_INCREMENT = 1000);
SELECT * FROM item; -- idItem, nomeItem, descricao, preco, tipo, categoria (AUTO_INCREMENT = 5000);
SELECT * FROM escolha; -- idEscolha, fkViagem, fkItem, qtd (AUTO_INCREMENT = 10000);

SELECT idUsuario AS id,
		nome AS 'Usuario',
		timestampdiff(DAY, dtIda, dtVolta) AS 'Dias no Japão',
		estacao AS Estação,
        CONCAT('R$ ', valorGuardado) AS 'Valor Guardado'
        FROM usuario
		JOIN viagem ON idUsuario = fkUsuario;
        
SELECT idUsuario AS id,
		nome AS usuario,
        categoria,
        tipo,
        SUM(preco*qtd) AS valor_tipo
			FROM usuario
            JOIN viagem ON fkUsuario = idUsuario
            JOIN escolha ON fkViagem = idViagem
            JOIN item ON fkItem = idItem
				GROUP BY id, usuario, categoria, tipo;
        
SELECT idUsuario AS id,
		nome AS 'Usuario',
		categoria AS 'Tipo de gasto',
		SUM(preco*qtd) AS 'Valor total por categoria',
        TRUNCATE(AVG(preco),2) AS 'Preço médio por categoria'
			FROM usuario
            JOIN viagem ON fkUsuario = idUsuario
            JOIN escolha ON fkViagem = idViagem
            JOIN item ON fkItem = idItem
				GROUP BY idViagem, categoria, nome;
                
CREATE VIEW vw_valor_dia AS
	SELECT idUsuario AS id,
			nome AS usuario,
			timestampdiff(DAY, dtIda, dtVolta) AS dias,
			categoria AS cat,
			SUM(preco*qtd) AS soma
				FROM usuario
				JOIN viagem ON fkUsuario = idUsuario
				JOIN escolha ON fkViagem = idViagem
				JOIN item ON fkItem = idItem
					GROUP BY idViagem, categoria, nome;

SELECT * FROM vw_valor_dia;
desc vw_valor_dia;

SELECT id AS 'Id do usuario',
		cat AS 'Categoria',
		soma DIV dias AS 'Valor médio por dia'  
			FROM vw_valor_dia
				WHERE id = 1;

SELECT idUsuario AS id,
		nome AS 'Usuario',
		SUM(preco*qtd) AS 'Valor total da viagem'
			FROM usuario
            JOIN viagem ON fkUsuario = idUsuario
            JOIN escolha ON fkViagem = idViagem
            JOIN item ON fkItem = idItem
				GROUP BY idViagem, nome;
			


-- ----------------------------------------- SELECTS END -----------------------------------------

SELECT * FROM viagem WHERE IFNULL(fkUsuario, 1);

UPDATE usuario SET nome = 'Dante', email = 'dante@email.com' where idUsuario = 3;

select * from usuario;

DELETE FROM escolha WHERE fkViagem = 1001 AND fkItem = 5039;

