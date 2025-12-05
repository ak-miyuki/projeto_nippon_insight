/* 
------------------------------ PROJETO INDIVIDUAL - NIPPON INSIGHT -------------------------------

							   Andreia Miyuki Kubota - RA:04252014
--------------------------------------------------------------------------------------------------                        
*/
CREATE DATABASE nipponInsight;
USE nipponInsight;
-- drop database nipponInsight;
-- ---------------- TABELA usuario QUE RECEBE OS DADOS DO FORMULÁRIO DE CADASTRO -----------------
CREATE TABLE usuario (
	idUsuario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    senha VARCHAR(20) NOT NULL
);

INSERT INTO usuario (nome, email, senha) VALUES
	('Ana', 'ana@email.com', '12345aA@'),
	('Breno', 'breno@email.com', '12345aA@');
    
SELECT * FROM usuario;
-- ------------------------------------- FIM TABELA usuario --------------------------------------

-- --------------- TABELA viagem QUE RECEBE OS DADOS DAS ESCOLHAS NO QUESTIONARIO ----------------
CREATE TABLE viagem (
	idViagem INT PRIMARY KEY AUTO_INCREMENT,
    fkUsuario INT NOT NULL,
    estacao VARCHAR(10),
    dtIda DATE,
    dtVolta DATE,
    qtdPessoas INT,
    valorGuardado DECIMAL(10,2),
		CONSTRAINT fkUsuarioViagem
			FOREIGN KEY(fkUsuario)
				REFERENCES usuario(idUsuario)
) AUTO_INCREMENT = 1000;

INSERT INTO viagem VALUES
	(DEFAULT, 1, 'PRIMAVERA', '2026-03-25', '2026-04-08', 1, 5000.00),
	(DEFAULT, 2, 'OUTONO', '2026-10-05', '2026-10-12', 2, 10000.00);
    
SELECT * FROM viagem;
-- ------------------------------------- FIM TABELA viagem ---------------------------------------

-- ------------------ TABELA item QUE RECEBE OS DADOS DOS PREÇOS DE CADA ITEM --------------------
CREATE TABLE item (
	idItem INT PRIMARY KEY AUTO_INCREMENT,
    nomeItem VARCHAR(100) NOT NULL,
    descricao VARCHAR(500),
    preco DECIMAL(10,2) NOT NULL,
	tipo VARCHAR(100) NOT NULL,
    categoria VARCHAR(100) NOT NULL,
    foto VARCHAR(200)
) AUTO_INCREMENT = 5000;


INSERT INTO item (nomeItem, descricao, preco, tipo, categoria, foto) VALUES

-- LOCAIS
	('Tokyo (Tóquio)', 'Cidade de Tóquio, capital do Japão, une o tradicional ao moderno, a cidade mais tecnológica do Japão, tem vários bairros famosos como Shibuya, Shinjuku, Ginza, Akihabara, Harajuku e Odaiba', 0, 'Cidade','Lugar', '<img src="../assets/imgs/tokyo_city.jpg" alt="">'), -- Tokyo
	('Yokohama', 'Cidade de Yokohama, importante centro de comércio internacional, moderna e onde muitos filmes e doramas são gravados', 0, 'Cidade','Lugar', '<img src="../assets/imgs/yokohama.jpg" alt="">'), -- Tokyo
	('Kyoto (Quioto)', 'Cidade de Quioto, antiga capital do Japão tem muitos templos e bairros antigos e você pode experimentar muito da cultura tradicional japonesa, comer doces típicos e ver gueixas, ninjas e samurais', 0, 'Cidade','Lugar', '<img src="../assets/imgs/kyoto.jpg" alt="">'), -- Kyoto
	('Osaka', 'Cidade de Osaka, uma das grandes cidades do Japão, tem aeroporto internacional, outlets, e é lá que fica a Universal Studios', 0, 'Cidade','Lugar', '<img src="../assets/imgs/osaka2.jpg" alt="">'), -- Osaka
	('Hiroshima', 'Cidade de Hiroshima, cidade onde caiu uma das bombas nucleares, é possível ver um pouco da história em locais preservados, aprender no museu e presenciar o resultado da restauração da destruição. Ela existe como um símbolo da paz, para nos lembrar dos estragos que ataques nucleares podem causar', 0, 'Cidade','Lugar', '<img src="../assets/imgs/hiroshima.jpg" alt="">'), -- Hiroshima
	('Fukuoka', 'Cidade de Fukuoka, cidade com praias, templos e shopping modernos', 0, 'Cidade','Lugar', '<img src="../assets/imgs/fukuoka_shopping.jpg" alt="">'), -- Fukuoka
	('Sapporo', 'Cidade de Sapporo, conhecida pela gastronomia e pelo famoso festival da neve, onde enormes esculturas de neve e gelo são expostas no início do ano', 0, 'Cidade','Lugar', '<img src="../assets/imgs/sapporo-snow-festival-1536.jpg" alt="">'), -- Sapporo
	('Okinawa', 'Região de praias de areia branca e águas cristalinas com grande variedade de corais e vida submarina.', 0, 'Região','Lugar', '<img src="../assets/imgs/Okinawa-beach-800x532-1.jpg" alt="">'), -- Okinawa
	('Mt. Fuji', 'Monte Fuji, é possível escalar o monte Fuji nos meses de julho a setembro', 140.00, 'Região','Lugar', '<img src="../assets/imgs/Fuji_7.png" alt="">'), -- Mt Fuji
    
	('Tokyo Disneyland', 'A Disneyland do Japão, um parque temático fantástico do reino da fantasia', 270.00, 'Atração','Lugar', '<img src="../assets/imgs/disneyland_3.jpg" alt="">'), -- Tokyo Disneyland
	('Tokyo Skytree', 'A torre mais alta de Tóquio (450 andares)', 105.00, 'Atração','Lugar', '<img src="../assets/imgs/tokyo_skytree.jpg" alt="">'), -- Tokyo Skytree
	('Tokyo Tower', 'A torre mais alta de Tóquio (250 m)', 105.00, 'Atração','Lugar', '<img src="../assets/imgs/tokyo_tower_2.jpg" alt="">'), -- Tokyo Tower
	('Tokyo teamLab - Tokyo', 'Museu de imersão com imagens um conjunto de artistas', 130.00, 'Atração','Lugar', '<img src="../assets/imgs/teamlabs_4.jpg" alt="">'), -- Tokyo teamLab
	('Universal Studios - Osaka', 'A Universal do Japão, um parque temático fantástico com atrações como o castelo do Harry Potter e outros filmes', 830.00, 'Atração','Lugar', '<img src="../assets/imgs/universal_3.jpg" alt="">'), -- Osaka Universal
	('Castelos', 'Castelos e jardins restaurados e preservados para visitação', 40.00, 'Atração','Lugar', '<img src="../assets/imgs/osaka_castle.jpg" alt="">'), -- Castelos
	('Templos', 'Templos abertos para visitação', 20.00, 'Atração','Lugar', '<img src="../assets/imgs/templo_kin.jpg" alt="">'), -- Templos
	('Karaoke', 'Karaokê box para poder cantar até fechar o estabelecimento às 6:00', 25.00, 'Atração','Lugar', '<img src="../assets/imgs/karaoke-shinjuku-japan.jpg" alt="">'), -- Karaoke
    

	('Passagem de avião', 'Passagem de ida', 6500.00, 'Avião','Transporte', '<img src="../assets/imgs/airplane_ana.jpg" alt="">'), -- Passagem avião
	('Passagem de avião',  'Passagem de volta', 6500.00, 'Avião','Transporte', '<img src="../assets/imgs/airplane_ana.jpg" alt="">'),-- Passagem avião
	('JR Rail Pass - 7 DIAS', 'COMUM', 1969.37, 'Trem-bala', 'Transporte', '<img src="../assets/imgs/Shinkansen.jpg" alt="">'), -- JR rail pass
	('JR Rail Pass - 14 DIAS', 'COMUM', 3151.00, 'Trem-bala', 'Transporte', '<img src="../assets/imgs/Shinkansen.jpg" alt="">'), -- JR rail pass
	('JR Rail Pass - 21 DIAS', 'COMUM', 3938.75, 'Trem-bala', 'Transporte', '<img src="../assets/imgs/Shinkansen.jpg" alt="">'), -- JR rail pass
	('Bilhete Metrô/Ônibus',  'Valor gasto em bilhetes por dia', 50.00, 'Metrô/Ônibus','Transporte' , '<img src="../assets/imgs/subway_ticket.jpg" alt="">'), -- Bilhete metrô/ônibus
    
    ('Pocket WiFi - 1 DIA', 'Roteador de bolso', 10.00, 'Internet','Comunicação', '<img src="../assets/imgs/pocket_wifi.jpg" alt="">'), -- Pocket wifi
    ('Pocket WiFi - 7 DIAS', 'Roteador de bolso', 69.00, 'Internet','Comunicação', '<img src="../assets/imgs/pocket_wifi.jpg" alt="">'), -- Pocket wifi
	('Pocket WiFi - 14 DIAS', 'Roteador de bolso', 98.00, 'Internet', 'Comunicação', '<img src="../assets/imgs/pocket_wifi.jpg" alt="">'), -- Pocket wifi
	('Pocket WiFi - 21 DIAS', 'Roteador de bolso', 127.00, 'Internet', 'Comunicação', '<img src="../assets/imgs/pocket_wifi.jpg" alt="">'), -- Pocket wifi
    
	('Diária Capsula **', 'Capsula', 100.00, 'Capsula','Hospedagem', '<img src="../assets/imgs/hotel_capsule.jpg" alt="">'), -- Hotel
	('Diária Hotel ***', 'Quarto solteiro hotel comum', 520.00, 'Hotel', 'Hospedagem', '<img src="../assets/imgs/hotel_apa.jpg" alt="">'), -- Hotel
	('Diária Hotel ****', 'Quarto solteiro hotel comum', 600.00, 'Hotel', 'Hospedagem', '<img src="../assets/imgs/hotel_modern.jpg" alt="">'), -- Hotel
	('Diária Hotel ****', 'Quarto solteiro hotel comum', 1800.00, 'Hotel', 'Hospedagem', '<img src="../assets/imgs/hotel_modern_2.jpg" alt="">'), -- Hotel
	('Diária Ryokan **', 'Quarto solteiro hotel típico japonês', 420.00, 'Ryokan', 'Hospedagem', '<img src="../assets/imgs/ryokan_2.jpg" alt="">'), -- Ryokan
	('Diária Ryokan ***', 'Quarto solteiro hotel típico japonês', 1050.00, 'Ryokan', 'Hospedagem', '<img src="../assets/imgs/ryokan_1.jpg" alt="">'), -- Ryokan
	('Diária Ryokan ****', 'Quarto solteiro hotel típico japonês', 2100.00, 'Ryokan', 'Hospedagem', '<img src="../assets/imgs/ryokan_3.jpg" alt="">'), -- Ryokan
	 
	('Drink Bar (Softdrink)', 'Rodízio de bebida não-alcóolica', 21, 'Bebida', 'Alimentação', '<img src="../assets/imgs/drink_bar_2.jpg" alt="">'), -- Bebibas
	('Drink Bar (Bebida alcoolica)', 'Rodízio de bebida alcóolica', 21, 'Bebida', 'Alimentação', '<img src="../assets/imgs/nomihoudai.jpg" alt="">'), -- Bebibas
	('Café', 'Caneca', 21, 'Bebida', 'Alimentação', '<img src="../assets/imgs/coffee_2.jpg" alt="">'), -- Bebibas
	('Refrigerante', 'Lata', 6, 'Bebida', 'Alimentação', '<img src="../assets/imgs/refrigerante.jpg" alt="">'), -- Bebibas
	('Cerveja', 'lata', 12, 'Bebida', 'Alimentação', '<img src="../assets/imgs/beer_2.jpg" alt="">'), -- Bebibas
	('Suco fresco', 'Copo', 28, 'Bebida', 'Alimentação', '<img src="../assets/imgs/juice_2.jpg" alt="">'), -- Bebibas
	('Bebida de lata', 'Suco em lata', 5.00, 'Bebida', 'Alimentação', '<img src="../assets/imgs/juice_3.jpg" alt="">'), -- Bebibas
	('Bebida de garrafa', 'Suco em garrafa de 300 - 500ml', 7.00, 'Bebida', 'Alimentação', '<img src="../assets/imgs/juice_bottle.jpg" alt="">'), -- Bebibas
    
	('Taiyaki', 'Bolinho frito em formato de peixe com recheio (creme/doce de feijão)', 10, 'Doces', 'Alimentação', '<img src="../assets/imgs/taiyaki.jpg" alt="">'), -- Doces
	('Mochi', 'Bolinho feito com farinha de arroz recheado com doce de feijão', 10, 'Doces', 'Alimentação', '<img src="../assets/imgs/mochi_2.jpg" alt="">'), -- Doces
	('Daifuku', 'Bolinho feito com farinha de arroz recheado com doce de feijão e morango', 10, 'Doces', 'Alimentação', '<img src="../assets/imgs/daifuku_2.jpg" alt="">'), -- Doces
	('Parfait japonês', 'Taça de sorvete com frutas, chantilly e cereal,', 40, 'Doces', 'Alimentação', '<img src="../assets/imgs/parfait_2.jpg" alt="">'), -- Doces
	('Dango', 'Bolinho feito com farinha de arroz e molho doce de shoyu', 10, 'Doces', 'Alimentação', '<img src="../assets/imgs/dango.jpg" alt="">'), -- Doces
	('Cheesecake japonês', 'Cheesecake tradicional', 30, 'Doces', 'Alimentação', '<img src="../assets/imgs/cheesecake.jpg" alt="">'), -- Doces
	('Sorvete', 'Bola de sorvete', 21, 'Doces', 'Alimentação', '<img src="../assets/imgs/chinese_food.jpg" alt="">'), -- Doces
	('Crepe', 'Crepe doce com recheio de chantilly, frutas e caldas', 21, 'Doces', 'Alimentação', '<img src="../assets/imgs/crepe_4.jpg" alt="">'), -- Doces
	('Confeitarias especiais', 'Doces tradicionais japoneses', 40, 'Doces', 'Alimentação', '<img src="../assets/imgs/wahashi.jpg" alt="">'), -- Doces
    
	('Café da manhã simples', 'Sanduíche e café', 25, 'Café da manhã', 'Alimentação', '<img src="../assets/imgs/sandwich_coffee.jpg" alt="">'), -- Café da manhã
	('Café da manhã ocidental',  'Ovos, torradas e bebida', 40, 'Café da manhã', 'Alimentação', '<img src="../assets/imgs/breakfast_ocidental_2.jpg" alt="">'), -- Café da manhã
	('Café da manhã em hotel',  'Buffet à vontade', 100, 'Café da manhã', 'Alimentação', '<img src="../assets/imgs/breakfast_oriental_2.jpg" alt="">'), -- Café da manhã
    
	('Comida chinesa', 'Lamen chinês, arroz frito, gyoza', 52, 'Refeição', 'Alimentação', '<img src="../assets/imgs/chinese_food.jpg" alt="">'), -- Refeição
	('Comida italiana', 'Massa ou pizza individual', 70, 'Refeição', 'Alimentação', '<img src="../assets/imgs/italian_food.jpg" alt="">'), -- Refeição
	('Tabehoudai',  'Rodízio com limite de 90minutos', 125, 'Refeição', 'Alimentação', '<img src="../assets/imgs/tabehoudai_food.jpg" alt="">'), -- Refeição
	('Teishoku', 'Refeição completa tradicional: Arroz + sopa + prato principal + acompanhamentos', 70, 'Refeição', 'Alimentação', '<img src="../assets/imgs/teishoku_food_2.jpg" alt="">'), -- Refeição
	('Sukiyaki', 'Carne cozida na mesa com macarrão, cogumelos, broto de feijão', 122, 'Refeição', 'Alimentação', '<img src="../assets/imgs/sukiyaki_food.jpg" alt="">'), -- Refeição
	('Shabu-shabu', 'Carne fina para hotpot cozida na mesa com macarrão, cogumelos, broto de feijão', 122, 'Refeição', 'Alimentação', '<img src="../assets/imgs/shabushabu_food.jpg" alt="">'), -- Refeição
	('Lámen (Ramen)', 'Macarrão com caldo (à base de frango, porco, shoyu, sal, missô)', 42, 'Refeição', 'Alimentação', '<img src="../assets/imgs/ramen_food.jpg" alt="">'), -- Refeição
	('Soba', 'Macarrão de trigo sarraceno com caldo à base de shoyu e hondashi', 22, 'Refeição', 'Alimentação', '<img src="../assets/imgs/soba_food.jpg" alt="">'), -- Refeição
	('Udon', 'Macarrão grosso tradicional com caldo à base de shoyu e hondashi', 42, 'Refeição', 'Alimentação', '<img src="../assets/imgs/udon_food.jpg" alt="">'), -- Refeição
	('Sushi Tradicional', 'Combo de 8–12 peças', 70, 'Refeição', 'Alimentação', '<img src="../assets/imgs/sushi_food_2.jpg" alt="">'), -- Refeição
	('Sushi de esteira (kaiten sushi)', '1 prato de 2 peças', 12, 'Refeição', 'Alimentação', '<img src="../assets/imgs/sushi_esteira_food.jpg" alt="">'), -- Refeição
	('Curry japonês', 'Curry estilo japonês com batatas, cenouras e algum tipo de proteína', 35, 'Refeição', 'Alimentação', '<img src="../assets/imgs/curry_food.jpg" alt="">'), -- Refeição 
	('Donburi', 'Tigela com arroz e carne/porco', 28, 'Refeição', 'Alimentação', '<img src="../assets/imgs/donburi_food.jpg" alt="">'), -- Refeição
	('fast-food',  'Combo: hambúrguer + batata + bebida', 42, 'Refeição', 'Alimentação', '<img src="../assets/imgs/fast_food.jpg" alt="">'), -- Refeição
	('Bento', 'Marmita pronta', 32, 'Refeição', 'Alimentação', '<img src="../assets/imgs/bento_food.jpg" alt="">'), -- Refeição
	('Okonomiyaki', 'Panqueca japonesa', 52, 'Refeição', 'Alimentação', '<img src="../assets/imgs/okonomiyaki_food.jpg" alt="">'), -- Refeição
	('Tempurá',  'Camarão e legumes empanados', 70, 'Refeição', 'Alimentação', '<img src="../assets/imgs/tempura_food.jpg" alt="">'), -- Refeição
	('Tonkatsu', 'Carne de porco empanada', 52, 'Refeição', 'Alimentação', '<img src="../assets/imgs/tonkatsu_food.jpg" alt="">'), -- Refeição
	('Gyukatsu', 'Contra-filé empanado', 52, 'Refeição', 'Alimentação', '<img src="../assets/imgs/gyukatsu_food.jpg" alt="">'), -- Refeição
	('Okonomiyaki', 'Panqueca japonesa', 52, 'Refeição', 'Alimentação', '<img src="../assets/imgs/okonomiyaki_food.jpg" alt="">'), -- Refeição
	('Wagyu', 'Carne premium', 350, 'Refeição', 'Alimentação', '<img src="../assets/imgs/wagyu_food_2.jpg" alt="">'), -- Refeição
	('Takoyaki', 'Bolinho com recheio de polvo', 28, 'Refeição', 'Alimentação', '<img src="../assets/imgs/takoyaki_japan.jpg" alt="">'), -- Refeição
    ('Yakitori',  'Espetinho de frango', 7, 'Refeição', 'Alimentação', '<img src="../assets/imgs/yakitori_japan.jpg" alt="">'); -- Refeição
    
    
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
	(DEFAULT, 1000, 5007, 1),
	(DEFAULT, 1000, 5010, 1),
	(DEFAULT, 1000, 5014, 1),
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
	(DEFAULT, 1001, 5014, 1),
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

SELECT * FROM item;
 
-- ----------------------------------- FIM TABELA escolha ----------------------------------------

-- ------------------------------------------- SELECTS -------------------------------------------
SELECT * FROM usuario; -- idUsuario, nome, email, senha (AUTO_INCREMENT = 1);
SELECT * FROM viagem; -- idViagem, fkUsuario, estacao, dtIda, dtVolta, qtdPessoas, valorGuardado (AUTO_INCREMENT = 1000);
SELECT * FROM item; -- idItem, nomeItem, descricao, preco, tipo, categoria (AUTO_INCREMENT = 5000);
SELECT * FROM escolha; -- idEscolha, fkViagem, fkItem, qtd (AUTO_INCREMENT = 10000);


/* --------------------------------------- VIEW DA TABELA ESCOLHAS POR USUÁRIO: ---------------------------------------
*/
CREATE OR REPLACE VIEW vw_itensUsuario AS
	SELECT escolha.fkViagem,
			item.*,
			escolha.qtd
		FROM item
        JOIN escolha 
			ON item.idItem = escolha.fkItem
				WHERE escolha.qtd > 0;
            
SELECT * FROM vw_itensUsuario;

/*
`SELECT * FROM vw_itensUsuario where fkViagem = ${idViagem};`
*/
/* --------------------------------------- VIEW DA TABELA VIAGEM POR USUÁRIO: ---------------------------------------
*/
CREATE OR REPLACE VIEW vw_dadosViagem AS
			SELECT v.idViagem, 
					v.fkUsuario,
					v.estacao,
					DATE_FORMAT(v.dtIda, '%d/%m/%Y') AS dtIda,
					DATE_FORMAT(v.dtVolta, '%d/%m/%Y') AS dtVolta,
                    ((TIMESTAMPDIFF(DAY, dtIda, dtVolta)) - 2) AS diasJapao,
					v.qtdPessoas,
					v.valorGuardado,
                    IFNULL(v2.soma, 0) AS valorTotal,
                    CASE WHEN v2.soma IS NULL OR v2.soma = 0 THEN 0
						ELSE ROUND(((v.valorGuardado / v2.soma) * 100), 0)
					END AS percentualGuardado
						FROM viagem AS v
						JOIN usuario AS u ON v.fkUsuario = u.idUsuario
						LEFT JOIN (SELECT e.fkViagem AS idViagem,
									SUM(e.qtd * i.preco) AS soma
								FROM escolha AS e	
								INNER JOIN item AS i ON i.idItem = e.fkItem
								GROUP BY e.fkViagem) AS v2 ON v2.idViagem = v.idViagem;
                            
SELECT * FROM vw_dadosViagem;

/* ----------------------- SELECT DA VIEW DOS DADOS DA VIAGEM POR USUÁRIO -----------------------                          
`SELECT * FROM vw_dadosViagem
	WHERE fkUsuario = ${idUsuario};`
-----------------------------------------------------------------------------------------------------------------------
*/
select * from viagem;
/*
--------------------------------------- VIEW DA TABELA USUÁRIO JOIN VIAGEM: ---------------------------------------
*/
CREATE OR REPLACE VIEW vw_dadosUsuario AS
	SELECT idUsuario, 
			nome, 
            email,
            senha,
            idViagem 
		FROM usuario
        LEFT JOIN viagem 
			ON idUsuario = fkUsuario;
			
SELECT * FROM vw_dadosUsuario;

/*
--------------------------------------- VIEW DO VALOR POR CATEGORIA POR USUÁRIO: ---------------------------------------
*/
CREATE OR REPLACE VIEW vw_valorCategoria AS 
	SELECT idUsuario, 
			idViagem, 
			categoria, 
			SUM(preco*qtd) AS valorTotal 
		FROM usuario 
        JOIN viagem ON fkUsuario = idUsuario 
        JOIN escolha ON escolha.fkViagem = viagem.idViagem 
        JOIN item ON fkItem = idItem 
			GROUP BY idUsuario, idViagem, categoria;

SELECT * FROM vw_valorCategoria;

/*
`SELECT * FROM vw_valorCategoria WHERE idViagem = ${idViagem};`
*/


/* --------------------------- ATUALIZAÇÃO DO VALOR GUARDADO NA TABELA VIAGEM POR USUÁRIO: ----------------------------
`UPDATE viagem SET valorGuardado = ${valorGuardado} 
	WHERE fkUsuario = ${idUsuario};`
-----------------------------------------------------------------------------------------------------------------------
*/

/*
------------------------------ VIEW DOS LOCAIS MAIS ESCOLHIDOS P/ GRÁFICO DE BARRAS -----------------------------------
*/
-- item (nomeItem, descricao, preco, tipo, categoria, foto)

CREATE OR REPLACE VIEW vw_votosLugares AS
	SELECT nomeItem AS lugar, 
		COUNT(fkViagem) AS votos
			FROM item i
            JOIN escolha e ON e.fkItem = i.idItem
				WHERE categoria = 'Lugar'
					GROUP BY nomeItem
						ORDER BY COUNT(fkViagem) DESC
							LIMIT 7;
                    
SELECT * FROM vw_votosLugares;


/*
-----------------------------------------------------------------------------------------------------------------------
*/
SELECT idUsuario,
		nome,
        categoria,
        tipo,
        SUM(preco*qtd) AS valorPorTipo
			FROM usuario
            JOIN viagem ON fkUsuario = idUsuario
            JOIN escolha ON fkViagem = idViagem
            JOIN item ON fkItem = idItem
				GROUP BY idUsuario, nome, categoria, tipo;
        
					
                

                
/* ------------------------------------------------------------------------
`SELECT id AS idUsuario,
		cat AS 'Categoria',
		soma DIV dias AS 'Valor médio por dia'  
			FROM vw_valor_dia
				WHERE idUsuario = ${idUsuario};`
-- ------------------------------------------------------------------------
*/



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

select * from usuario;

select * from viagem;

select * from escolha;



