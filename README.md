# Sistema de Gerenciamento de Contatos

## Visão Geral
Sistema web para gerenciamento de contatos pessoais, desenvolvido em Java com JSP (JavaServer Pages). Permite realizar operações de cadastro, consulta, edição e exclusão de contatos de forma simples e intuitiva.

## Stack Tecnológica
- **Backend:** Java
- **Frontend:** JSP, JavaScript, CSS
- **Banco de Dados:** MySQL
- **Servidor:** Apache Tomcat
- **Arquitetura:** MVC (Model-View-Controller)

## Arquitetura do Sistema

### Estrutura MVC
- **Model**
  - Classes de domínio e regras de negócio
  - Entidades principais:
    - Contato: Representa os dados de um contato
    - Usuario: Representa os dados de um usuário do sistema

- **View (JSP)**
  - `login.jsp`: Autenticação de usuários
  - `cadastrar.jsp`: Formulário de cadastro de contatos
  - `listar.jsp`: Visualização de todos os contatos
  - `consultar.jsp`: Busca de contatos específicos
  - `editar.jsp`: Atualização de contatos
  - `excluir.jsp`: Remoção de contatos

- **Controller**
  - Servlets para controle de fluxo da aplicação
  - Gerenciamento de requisições e respostas

### Banco de Dados
- Tabela de usuários para autenticação
- Tabela de contatos para armazenamento dos dados principais

## Funcionalidades

### Sistema de Autenticação
- Login com validação de credenciais
- Gerenciamento de sessão de usuário
- Logout seguro

### Gerenciamento de Contatos
- Cadastro de novos contatos
- Listagem completa de contatos
- Sistema de busca e consulta
- Atualização de informações
- Exclusão de registros

## Aspectos Técnicos

### Segurança
- Proteção contra SQL Injection
- Validação de dados em múltiplas camadas
- Controle de acesso baseado em sessão
- Feedback apropriado ao usuário

### Frontend
- Validações client-side com JavaScript
- Interface responsiva com CSS
- Páginas de erro personalizadas (404, 500)

### Backend
- Conexão segura com banco de dados
- Tratamento robusto de erros e exceções
- Camada DAO para abstração do acesso aos dados

## Equipe de Desenvolvimento
- Maria Clara
- Rafael Rosa
- Rafael Souto

## Estrutura de Arquivos
```
web/
├── META-INF/
├── WEB-INF/
├── js/
│   └── validacoes.js
├── styles/
│   ├── login.css
│   └── styles.css
├── database/
│   ├── db_login.sql
│   ├── db_rsm.sql
│   └── inserir_contatos.sql
├── error/
│   ├── 404.jsp
│   └── 500.jsp
└── [arquivos JSP principais]
```