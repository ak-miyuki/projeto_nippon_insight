/* 
------------------------------ PROJETO INDIVIDUAL - NIPPON INSIGHT -------------------------------

							   Andreia Miyuki Kubota - RA:04252014
--------------------------------------------------------------------------------------------------                        
*/

-- ---------------- TABELA usuario QUE RECEBE OS DADOS DO FORMULÁRIO DE CADASTRO -----------------

CREATE TABLE usuario (
	idUsuario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    email VARCHAR(100),
    senha VARCHAR(20)
);
-- ------------------------------------- FIM TABELA usuario --------------------------------------