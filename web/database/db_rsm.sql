-- Criação do banco de dados principal do sistema
CREATE DATABASE IF NOT EXISTS db_rsm;
USE db_rsm;

-- Tabela de estados brasileiros
-- Armazena as siglas dos estados para validação e relacionamento
CREATE TABLE IF NOT EXISTS tb_estado_rsm (
    id INT AUTO_INCREMENT PRIMARY KEY,
    sigla CHAR(2) NOT NULL UNIQUE
);

-- Inserção de estados brasileiros
INSERT INTO tb_estado_rsm (sigla) VALUES
('AC'), ('AL'), ('AP'), ('AM'), ('BA'), ('CE'), ('DF'), ('ES'), ('GO'),
('MA'), ('MT'), ('MS'), ('MG'), ('PA'), ('PB'), ('PR'), ('PE'), ('PI'),
('RJ'), ('RN'), ('RS'), ('RO'), ('RR'), ('SC'), ('SP'), ('SE'), ('TO');

-- Tabela de DDDs brasileiros
-- Armazena os códigos DDD válidos para validação e relacionamento
CREATE TABLE IF NOT EXISTS tb_ddd_rsm (
    id INT AUTO_INCREMENT PRIMARY KEY,
    ddd CHAR(2) NOT NULL UNIQUE
);

-- Inserção de DDDs regulamentados
INSERT INTO tb_ddd_rsm (ddd) VALUES
('11'), ('12'), ('13'), ('14'), ('15'), ('16'), ('17'), ('18'), ('19'),
('21'), ('22'), ('24'), ('27'), ('28'), ('31'), ('32'), ('33'), ('34'),
('35'), ('37'), ('38'), ('41'), ('42'), ('43'), ('44'), ('45'), ('46'),
('47'), ('48'), ('49'), ('51'), ('53'), ('54'), ('55'), ('61'), ('62'),
('63'), ('64'), ('65'), ('66'), ('67'), ('68'), ('69'), ('71'), ('73'),
('74'), ('75'), ('77'), ('79'), ('81'), ('82'), ('83'), ('84'), ('85'),
('86'), ('87'), ('88'), ('89'), ('91'), ('92'), ('93'), ('94'), ('95'),
('96'), ('97'), ('98'), ('99');

-- Tabela principal de contatos
-- Armazena as informações pessoais e de contato dos registros
-- Possui relacionamentos com as tabelas de estado e DDD para garantir a integridade dos dados
CREATE TABLE IF NOT EXISTS tb_contato_rsm (
    id INT AUTO_INCREMENT PRIMARY KEY,
    primeiro_nome VARCHAR(50) NOT NULL,
    ultimo_nome VARCHAR(50) NOT NULL,
    endereco VARCHAR(100) NOT NULL,
    cidade VARCHAR(50) NOT NULL,
    estado CHAR(2) NOT NULL,
    ddd CHAR(2) NOT NULL,
    celular CHAR(11) NOT NULL,
    email VARCHAR(100) NOT NULL,
    mes_nascimento TINYINT(2) NOT NULL,
    cpf CHAR(11) NOT NULL UNIQUE,
    FOREIGN KEY (estado) REFERENCES tb_estado_rsm(sigla) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (ddd) REFERENCES tb_ddd_rsm(ddd) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Criando Trigger para validar mes_nascimento
DELIMITER $$

CREATE TRIGGER validar_mes_nascimento
BEFORE INSERT ON tb_contato_rsm
FOR EACH ROW
BEGIN
    IF NEW.mes_nascimento < 1 OR NEW.mes_nascimento > 12 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Erro: mes_nascimento deve estar entre 1 e 12.';
    END IF;
END $$

DELIMITER ;
