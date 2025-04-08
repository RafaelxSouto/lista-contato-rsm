-- Script para inserção de dados de exemplo na tabela de contatos
USE db_rsm;

-- Campos da tabela:
-- primeiro_nome: Nome do contato
-- ultimo_nome: Sobrenome do contato
-- endereco: Endereço completo
-- cidade: Cidade de residência
-- estado: Sigla do estado (referência à tabela tb_estado_rsm)
-- ddd: Código DDD do telefone (referência à tabela tb_ddd_rsm)
-- celular: Número do celular sem DDD
-- email: Endereço de e-mail
-- mes_nascimento: Mês de nascimento (1-12)
-- cpf: CPF único do contato

-- Inserção de contatos de exemplo para teste do sistema
INSERT INTO tb_contato_rsm (primeiro_nome, ultimo_nome, endereco, cidade, estado, ddd, celular, email, mes_nascimento, cpf) VALUES
('Maria', 'Silva', 'Rua das Flores 123', 'São Paulo', 'SP', '11', '987654321', 'maria.silva@email.com', 3, '12345678901'),
('João', 'Santos', 'Av Brasil 456', 'Rio de Janeiro', 'RJ', '21', '976543210', 'joao.santos@email.com', 5, '23456789012'),
('Ana', 'Oliveira', 'Rua XV 789', 'Curitiba', 'PR', '41', '965432109', 'ana.oliveira@email.com', 7, '34567890123'),
('Pedro', 'Souza', 'Av Paulista 1011', 'São Paulo', 'SP', '11', '954321098', 'pedro.souza@email.com', 9, '45678901234'),
('Carla', 'Ferreira', 'Rua Bahia 1213', 'Belo Horizonte', 'MG', '31', '943210987', 'carla.ferreira@email.com', 11, '56789012345'),
('Lucas', 'Costa', 'Av Amazonas 1415', 'Manaus', 'AM', '92', '932109876', 'lucas.costa@email.com', 2, '67890123456'),
('Julia', 'Pereira', 'Rua Ceará 1617', 'Fortaleza', 'CE', '85', '921098765', 'julia.pereira@email.com', 4, '78901234567'),
('Marcos', 'Lima', 'Av Goiás 1819', 'Goiânia', 'GO', '62', '910987654', 'marcos.lima@email.com', 6, '89012345678'),
('Patricia', 'Rodrigues', 'Rua Pará 2021', 'Belém', 'PA', '91', '909876543', 'patricia.rodrigues@email.com', 8, '90123456789'),
('Gabriel', 'Almeida', 'Av Maranhão 2223', 'São Luis', 'MA', '98', '898765432', 'gabriel.almeida@email.com', 10, '01234567890'),
('Beatriz', 'Martins', 'Rua Piauí 2425', 'Teresina', 'PI', '86', '887654321', 'beatriz.martins@email.com', 12, '12345098765'),
('Rafael', 'Cardoso', 'Av Paraíba 2627', 'João Pessoa', 'PB', '83', '876543210', 'rafael.cardoso@email.com', 1, '23456109876'),
('Amanda', 'Ribeiro', 'Rua Sergipe 2829', 'Aracaju', 'SE', '79', '865432109', 'amanda.ribeiro@email.com', 3, '34567210987'),
('Felipe', 'Gomes', 'Av Alagoas 3031', 'Maceió', 'AL', '82', '854321098', 'felipe.gomes@email.com', 5, '45678321098'),
('Isabela', 'Santos', 'Rua Acre 3233', 'Rio Branco', 'AC', '68', '843210987', 'isabela.santos@email.com', 7, '56789432109'),
('Thiago', 'Fernandes', 'Av Roraima 3435', 'Boa Vista', 'RR', '95', '832109876', 'thiago.fernandes@email.com', 9, '67890543210'),
('Laura', 'Oliveira', 'Rua Amapá 3637', 'Macapá', 'AP', '96', '821098765', 'laura.oliveira@email.com', 11, '78901654321'),
('Bruno', 'Silva', 'Av Tocantins 3839', 'Palmas', 'TO', '63', '810987654', 'bruno.silva@email.com', 2, '89012765432'),
('Carolina', 'Costa', 'Rua Rondônia 4041', 'Porto Velho', 'RO', '69', '809876543', 'carolina.costa@email.com', 4, '90123876543'),
('Diego', 'Pereira', 'Av Mato Grosso 4243', 'Cuiabá', 'MT', '65', '798765432', 'diego.pereira@email.com', 6, '01234987654');