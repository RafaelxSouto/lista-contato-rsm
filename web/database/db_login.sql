-- Criação do banco de dados de login
CREATE DATABASE IF NOT EXISTS db_login;
USE db_login;

-- Criação da tabela de login
CREATE TABLE IF NOT EXISTS tb_login (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario VARCHAR(50) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL
);

-- Inserir um usuário padrão para teste (senha: admin123)
INSERT INTO tb_login (usuario, senha) VALUES ('rafael', 'eunaosei');