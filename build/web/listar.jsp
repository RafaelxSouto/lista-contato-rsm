<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dao.ContatoDAO"%>
<%@page import="model.Contato"%>
<%@page import="java.util.List"%>
<%
    if (session.getAttribute("usuario") == null) {
        response.sendRedirect("login.jsp?error=unauthorized");
        return;
    }
    
    ContatoDAO contatoDAO = new ContatoDAO();
    String orderBy = request.getParameter("orderBy");
    List<Contato> contatos;
    
    if ("estado".equals(orderBy)) {
        contatos = contatoDAO.listarPorEstado();
    } else {
        contatos = contatoDAO.listarTodos();
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Listar Contatos</title>
    <link rel="stylesheet" href="styles/styles.css">
</head>
<body>
    <div class="nav-menu">
        <div class="container">
            <a href="index.jsp">Início</a>
            <a href="cadastrar.jsp">Cadastrar Contato</a>
            <a href="listar.jsp" class="active">Listar Contatos</a>
            <a href="consultar.jsp">Consultar</a>
            <a href="logout.jsp">Sair</a>
        </div>
    </div>
    
    <div class="container">
        <h2>Lista de Contatos</h2>
        
        <div class="form-container">
            <div class="form-group">
                <label>Ordenar por:</label>
                <div style="margin-top: 10px;">
                    <a href="listar.jsp" class="btn <%= orderBy == null ? "btn-primary" : "" %>" style="margin-right: 10px;">
                        Nome
                    </a>
                    <a href="listar.jsp?orderBy=estado" class="btn <%= "estado".equals(orderBy) ? "btn-primary" : "" %>">
                        Estado
                    </a>
                </div>
            </div>
            
            <div class="table-container">
                <table>
                    <thead>
                        <tr>
                            <% if ("estado".equals(orderBy)) { %>
                                <th>ID</th>
                                <th>Primeiro Nome</th>
                                <th>Endereço</th>
                                <th>Cidade</th>
                                <th>Estado</th>
                                <th>Email</th>
                            <% } else { %>
                                <th>CPF</th>
                                <th>Primeiro Nome</th>
                                <th>DDD</th>
                                <th>Celular</th>
                                <th>Email</th>
                                <th>Mês Nascimento</th>
                            <% } %>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (Contato contato : contatos) { %>
                            <tr>
                                <% if ("estado".equals(orderBy)) { %>
                                    <td><%= contato.getId() %></td>
                                    <td><%= contato.getPrimeiroNome() %></td>
                                    <td><%= contato.getEndereco() %></td>
                                    <td><%= contato.getCidade() %></td>
                                    <td><%= contato.getEstado() %></td>
                                    <td><%= contato.getEmail() %></td>
                                <% } else { %>
                                    <td><%= contato.getCpf() %></td>
                                    <td><%= contato.getPrimeiroNome() %></td>
                                    <td><%= contato.getDdd() %></td>
                                    <td><%= contato.getCelular() %></td>
                                    <td><%= contato.getEmail() %></td>
                                    <td><%= contato.getMesNascimento() %></td>
                                <% } %>
                            </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>