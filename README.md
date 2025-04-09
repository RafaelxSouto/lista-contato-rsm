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
├── src/
│   ├── java/
│   │   ├── dao/                    # Classes de acesso a dados
│   │   │   ├── ContatoDAO.java     # Operações de CRUD para contatos
│   │   │   └── UsuarioDAO.java     # Operações de CRUD para usuários
│   │   ├── database/               # Configurações de banco de dados
│   │   │   └── DatabaseConnection.java  # Gerenciamento de conexões
│   │   ├── model/                  # Classes de domínio
│   │   │   └── Contato.java       # Entidade de contato
│   │   └── util/                   # Classes utilitárias
│   │       ├── apache-tomcat-10.1.34-windows-x64/  # Servidor Tomcat
│   │       └── mysql-connector-j-8.1.0/            # Driver MySQL
│   ├── database/                   # Scripts SQL
│   │   ├── db_login.sql           # Script do banco de autenticação
│   │   └── db_rsm.sql             # Script do banco principal
│   └── conf/
│       └── MANIFEST.MF            # Configurações do manifesto
│
├── web/                           # Arquivos da aplicação web
│   ├── META-INF/
│   │   └── context.xml            # Configurações de contexto
│   ├── WEB-INF/
│   │   └── web.xml                # Configurações da aplicação web
│   ├── js/
│   │   └── validacoes.js          # Validações client-side
│   ├── styles/
│   │   ├── login.css              # Estilos da página de login
│   │   └── styles.css             # Estilos globais
│   ├── database/
│   │   ├── db_login.sql           # Script do banco de autenticação
│   │   ├── db_rsm.sql             # Script do banco principal
│   │   └── inserir_contatos.sql   # Script de dados iniciais
│   ├── error/
│   │   ├── 404.jsp                # Página de erro 404
│   │   └── 500.jsp                # Página de erro 500
│   ├── index.html                 # Página inicial
│   ├── index.jsp                  # Página inicial dinâmica
│   ├── login.jsp                  # Página de login
│   ├── cadastrar.jsp              # Formulário de cadastro
│   ├── listar.jsp                 # Lista de contatos
│   ├── consultar.jsp              # Busca de contatos
│   ├── editar.jsp                 # Edição de contatos
│   ├── excluir.jsp                # Exclusão de contatos
│   ├── autenticar.jsp             # Processamento de login
│   ├── salvar_contato.jsp         # Salvar novo contato
│   ├── atualizar_contato.jsp      # Atualizar contato existente
│   └── logout.jsp                 # Processamento de logout
│
├── build.xml                      # Script de build Ant
└── nbproject/                     # Configurações do NetBeans
    ├── ant-deploy.xml             # Script de deploy
    ├── build-impl.xml             # Implementação do build
    ├── genfiles.properties        # Arquivos gerados
    ├── project.properties         # Propriedades do projeto
    └── project.xml                # Configuração do projeto
```