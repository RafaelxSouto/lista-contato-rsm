# Sistema de Gerenciamento de Contatos

Este é um sistema web para gerenciamento de contatos pessoais, desenvolvido em Java com JSP (JavaServer Pages). O sistema permite cadastrar, consultar, editar e excluir contatos de forma simples e intuitiva.

## Estrutura do Projeto

### Camadas do Sistema

- **Web (JSP)**: Interface do usuário
  - `login.jsp`: Página de login do sistema
  - `cadastrar.jsp`: Formulário de cadastro de contatos
  - `listar.jsp`: Lista todos os contatos cadastrados
  - `consultar.jsp`: Permite buscar contatos específicos
  - `editar.jsp`: Formulário para atualização de contatos
  - `excluir.jsp`: Processa a exclusão de contatos

- **Model**: Classes que representam as entidades do sistema
  - Contato: Representa os dados de um contato
  - Usuario: Representa os dados de um usuário do sistema

- **DAO (Data Access Object)**: Camada de acesso ao banco de dados
  - ContatoDAO: Gerencia as operações de banco de dados para contatos
  - UsuarioDAO: Gerencia as operações de banco de dados para usuários

### Banco de Dados
- Arquivos SQL localizados em `web/database/`
  - `db_login.sql`: Estrutura da tabela de usuários
  - `db_rsm.sql`: Estrutura da tabela de contatos
  - `inserir_contatos.sql`: Dados iniciais para teste

## Fluxo do Sistema

### 1. Autenticação
- O usuário acessa o sistema através da página de login (`login.jsp`)
- Insere suas credenciais (usuário e senha)
- O sistema valida as credenciais através do `autenticar.jsp`
- Se corretas, cria uma sessão e redireciona para a página inicial
- Se incorretas, exibe mensagem de erro

### 2. Gerenciamento de Contatos

#### Cadastro de Contatos
1. Usuário acessa "Cadastrar Contato" no menu
2. Preenche o formulário com:
   - Primeiro e último nome
   - Endereço completo
   - Telefone (DDD + número)
   - E-mail
   - Mês de nascimento
   - CPF
3. Sistema valida os dados em tempo real (JavaScript)
4. Ao enviar, `salvar_contato.jsp` processa e salva no banco

#### Consulta de Contatos
- **Listar Todos**: Através de `listar.jsp`
- **Busca Específica**: Em `consultar.jsp`
  - Por primeiro nome
  - Por mês de nascimento

#### Atualização de Contatos
1. Usuário seleciona um contato na lista
2. Sistema carrega dados no formulário de edição
3. Usuário faz alterações
4. `atualizar_contato.jsp` processa e atualiza o banco

#### Exclusão de Contatos
1. Usuário seleciona "Excluir" em um contato
2. Sistema pede confirmação
3. `excluir.jsp` remove o registro do banco

## Recursos de Segurança

- Validação de sessão em todas as páginas
- Proteção contra acesso não autorizado
- Validação de dados no cliente e servidor
- Tratamento de erros com feedback visual

## Validações do Sistema

- Campos obrigatórios
- Formato de e-mail
- CPF (11 dígitos numéricos)
- Telefone (formato válido)
- Mês de nascimento (1-12)
- Caracteres permitidos por campo

## Mensagens do Sistema

O sistema fornece feedback claro através de mensagens:
- Sucesso nas operações
- Erros de validação
- Problemas de banco de dados
- Acesso não autorizado

## Interface do Usuário

- Menu de navegação intuitivo
- Formulários organizados
- Feedback visual das ações
- Design responsivo
- Mensagens claras e objetivas

## Considerações Técnicas

- Desenvolvido em Java com JSP
- Banco de dados MySQL
- Validações client-side em JavaScript
- Estilização com CSS
- Arquitetura em camadas (MVC)