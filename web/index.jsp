<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("usuario") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lista de Contatos</title>
    <link rel="stylesheet" href="styles/styles.css">
</head>
<body>
    <div class="nav-menu">
        <div class="container">
            <a href="index.jsp" class="active">Início</a>
            <a href="cadastrar.jsp">Cadastrar Contato</a>
            <a href="listar.jsp">Listar Contatos</a>
            <a href="consultar.jsp">Consultar</a>
            <a href="editar.jsp">Editar</a>
            <a href="excluir.jsp">Excluir</a>
            <a href="logout.jsp">Sair</a>
        </div>
    </div>
    
    <div class="container">
        <h1>Bem-vindo ao Sistema de Lista de Contatos</h1>
        <p class="user-info">Usuário logado: <%= session.getAttribute("usuario") %></p>
        
        <div class="menu-options">
            <h2>Menu Principal</h2>
            <p>Selecione uma das opções abaixo:</p>
            <div class="options-grid">
                <a href="cadastrar.jsp" class="menu-card">
                    <h3>Cadastrar</h3>
                    <p>Adicionar novo contato</p>
                </a>
                <a href="listar.jsp" class="menu-card">
                    <h3>Listar</h3>
                    <p>Ver todos os contatos</p>
                </a>
                <a href="consultar.jsp" class="menu-card">
                    <h3>Consultar</h3>
                    <p>Buscar contatos específicos</p>
                </a>
                <a href="editar.jsp" class="menu-card">
                    <h3>Editar</h3>
                    <p>Modificar informações</p>
                </a>
                <a href="excluir.jsp" class="menu-card">
                    <h3>Excluir</h3>
                    <p>Remover contatos</p>
                </a>
            </div>
        </div>
    </div>
</body>
</html>