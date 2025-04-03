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
    String primeiroNome = request.getParameter("primeiroNome");
    String mesStr = request.getParameter("mes");
    Contato contato = null;
    List<Contato> contatosPorMes = null;
    
    if (primeiroNome != null && !primeiroNome.trim().isEmpty()) {
        contato = contatoDAO.buscarPorPrimeiroNome(primeiroNome);
    } else if (mesStr != null && !mesStr.trim().isEmpty()) {
        try {
            int mes = Integer.parseInt(mesStr);
            if (mes >= 1 && mes <= 12) {
                contatosPorMes = contatoDAO.buscarPorMesAniversario(mes);
            }
        } catch (NumberFormatException e) {}
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Consultar Contatos</title>
    <link rel="stylesheet" href="styles/styles.css">
</head>
<body>
    <div class="nav-menu">
        <div class="container">
            <a href="index.jsp">Início</a>
            <a href="cadastrar.jsp">Cadastrar Contato</a>
            <a href="listar.jsp">Listar Contatos</a>
            <a href="consultar.jsp" class="active">Consultar</a>
            <a href="logout.jsp">Sair</a>
        </div>
    </div>
    
    <div class="container">
        <div class="form-container">
            <h2>Consultar Contatos</h2>
            
            <!-- Consulta por Primeiro Nome -->
            <form action="consultar.jsp" method="get" class="form-group">
                <h3>Buscar por Primeiro Nome</h3>
                <div class="form-group">
                    <label for="primeiroNome">Primeiro Nome:</label>
                    <input type="text" id="primeiroNome" name="primeiroNome" 
                           value="<%= primeiroNome != null ? primeiroNome : "" %>">
                </div>
                <button type="submit" class="btn btn-primary">Buscar por Nome</button>
            </form>
            
            <!-- Resultado da busca por nome -->
            <% if (primeiroNome != null && !primeiroNome.trim().isEmpty()) { %>
                <div class="table-container" style="margin-top: 20px;">
                    <% if (contato != null) { %>
                        <table>
                            <thead>
                                <tr>
                                    <th>Endereço</th>
                                    <th>Cidade</th>
                                    <th>DDD</th>
                                    <th>Celular</th>
                                    <th>Email</th>
                                    <th>CPF</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td><%= contato.getEndereco() %></td>
                                    <td><%= contato.getCidade() %></td>
                                    <td><%= contato.getDdd() %></td>
                                    <td><%= contato.getCelular() %></td>
                                    <td><%= contato.getEmail() %></td>
                                    <td><%= contato.getCpf() %></td>
                                </tr>
                            </tbody>
                        </table>
                    <% } else { %>
                        <div class="message error">Nenhum contato encontrado com este nome.</div>
                    <% } %>
                </div>
            <% } %>
            
            <!-- Consulta por Mês de Aniversário -->
            <form action="consultar.jsp" method="get" class="form-group" style="margin-top: 30px;">
                <h3>Buscar por Mês de Aniversário</h3>
                <div class="form-group">
                    <label for="mes">Mês (1-12):</label>
                    <input type="number" id="mes" name="mes" min="1" max="12" 
                           value="<%= mesStr != null ? mesStr : "" %>">
                </div>
                <button type="submit" class="btn btn-primary">Buscar por Mês</button>
            </form>
            
            <!-- Resultado da busca por mês -->
            <% if (mesStr != null && !mesStr.trim().isEmpty()) { %>
                <div class="table-container" style="margin-top: 20px;">
                    <% if (contatosPorMes != null && !contatosPorMes.isEmpty()) { %>
                        <table>
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Nome Completo</th>
                                    <th>Endereço</th>
                                    <th>Cidade</th>
                                    <th>Estado</th>
                                    <th>DDD</th>
                                    <th>Celular</th>
                                    <th>Email</th>
                                    <th>CPF</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% for (Contato c : contatosPorMes) { %>
                                    <tr>
                                        <td><%= c.getId() %></td>
                                        <td><%= c.getPrimeiroNome() + " " + c.getUltimoNome() %></td>
                                        <td><%= c.getEndereco() %></td>
                                        <td><%= c.getCidade() %></td>
                                        <td><%= c.getEstado() %></td>
                                        <td><%= c.getDdd() %></td>
                                        <td><%= c.getCelular() %></td>
                                        <td><%= c.getEmail() %></td>
                                        <td><%= c.getCpf() %></td>
                                    </tr>
                                <% } %>
                            </tbody>
                        </table>
                    <% } else { %>
                        <div class="message error">Nenhum contato encontrado para este mês.</div>
                    <% } %>
                </div>
            <% } %>
        </div>
    </div>
</body>
</html>