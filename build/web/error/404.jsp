<%--
    Página de Erro 404 - Página Não Encontrada
    
    Esta página é exibida quando o usuário tenta acessar uma URL que não existe no sistema.
    Principais características:
    - Exibe uma mensagem amigável informando que a página não foi encontrada
    - Mantém o menu de navegação para fácil acesso a outras áreas do sistema
    - Fornece um botão para retornar à página inicial
    - Utiliza estilos consistentes com o resto da aplicação
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Página não encontrada</title>
    <link rel="stylesheet" href="../styles/styles.css">
</head>
<body>
    <div class="nav-menu">
        <div class="container">
            <a href="../index.jsp">Início</a>
            <a href="../cadastrar.jsp">Cadastrar Contato</a>
            <a href="../listar.jsp">Listar Contatos</a>
            <a href="../consultar.jsp">Consultar</a>
            <a href="../logout.jsp">Sair</a>
        </div>
    </div>
    
    <div class="container">
        <div class="error-container">
            <h1>404 - Página não encontrada</h1>
            <p>Desculpe, a página que você está procurando não existe.</p>
            <a href="./index.jsp" class="btn btn-primary">Voltar para a página inicial</a>
        </div>
    </div>
    
    <style>
        .error-container {
            text-align: center;
            padding: 50px 20px;
            margin-top: 50px;
        }
        
        .error-container h1 {
            color: #dc3545;
            margin-bottom: 20px;
        }
        
        .error-container p {
            font-size: 18px;
            margin-bottom: 30px;
        }
    </style>
</body>
</html>