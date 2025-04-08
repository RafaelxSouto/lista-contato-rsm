<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dao.ContatoDAO"%>
<%@page import="model.Contato"%>
<%
    if (session.getAttribute("usuario") == null) {
        response.sendRedirect("login.jsp?error=unauthorized");
        return;
    }
    
    String cpf = request.getParameter("cpf");
    String confirmar = request.getParameter("confirmar");
    ContatoDAO contatoDAO = new ContatoDAO();
    Contato contato = null;
    String mensagem = null;
    String tipo = null;
    
    if (cpf != null && !cpf.trim().isEmpty()) {
        if ("true".equals(confirmar)) {
            if (contatoDAO.excluir(cpf)) {
                mensagem = "Contato excluído com sucesso!";
                tipo = "success";
                cpf = null; // Limpa o CPF para mostrar o formulário novamente
            } else {
                mensagem = "Erro ao excluir o contato.";
                tipo = "error";
            }
        } else {
            contato = contatoDAO.buscarPorCPF(cpf);
            if (contato == null) {
                mensagem = "Contato não encontrado.";
                tipo = "error";
                cpf = null;
            }
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Excluir Contato</title>
    <link rel="stylesheet" href="styles/styles.css">
    <script src="js/validacoes.js"></script>
</head>
<body>
    <div class="nav-menu">
        <div class="container">
            <a href="index.jsp">Início</a>
            <a href="cadastrar.jsp">Cadastrar Contato</a>
            <a href="listar.jsp">Listar Contatos</a>
            <a href="consultar.jsp">Consultar</a>
            <a href="editar.jsp">Editar</a>
            <a href="excluir.jsp" class="active">Excluir</a>
            <a href="logout.jsp">Sair</a>
        </div>
    </div>
    
    <div class="container">
        <div class="form-container">
            <h2>Excluir Contato</h2>
            
            <% if (mensagem != null) { %>
                <div class="message <%= tipo %>"><%= mensagem %></div>
            <% } %>
            
            <% if (contato == null) { %>
                <!-- Formulário de busca por CPF -->
                <form action="excluir.jsp" method="get" class="form-group">
                    <div class="form-group">
                        <label for="cpf">CPF do contato a ser excluído:</label>
                        <input type="text" id="cpf" name="cpf" maxlength="11" pattern="[0-9]{11}"
                               title="Digite 11 números" required>
                    </div>
                    <button type="submit" class="btn btn-primary">Buscar Contato</button>
                </form>
            <% } else { %>
                <!-- Confirmação de exclusão -->
                <div class="confirmation-box">
                    <h3>Confirmar Exclusão</h3>
                    <p>Você está prestes a excluir o seguinte contato:</p>
                    
                    <div class="contact-info">
                        <p><strong>Nome:</strong> <%= contato.getPrimeiroNome() + " " + contato.getUltimoNome() %></p>
                        <p><strong>CPF:</strong> <%= contato.getCpf() %></p>
                        <p><strong>Email:</strong> <%= contato.getEmail() %></p>
                        <p><strong>Telefone:</strong> (<%= contato.getDdd() %>) <%= contato.getCelular() %></p>
                    </div>
                    
                    <p class="warning">Esta ação não pode ser desfeita. Deseja continuar?</p>
                    
                    <div class="button-group">
                        <form action="excluir.jsp" method="get" style="display: inline;">
                            <input type="hidden" name="cpf" value="<%= contato.getCpf() %>">
                            <input type="hidden" name="confirmar" value="true">
                            <button type="submit" class="btn btn-danger">Confirmar Exclusão</button>
                        </form>
                        <a href="excluir.jsp" class="btn" style="margin-left: 10px;">Cancelar</a>
                    </div>
                </div>
            <% } %>
        </div>
    </div>
    
    <style>
        .confirmation-box {
            background-color: #f8f9fa;
            padding: 20px;
            border-radius: 8px;
            border: 1px solid #ddd;
            margin-top: 20px;
        }
        
        .contact-info {
            background-color: white;
            padding: 15px;
            border-radius: 4px;
            margin: 15px 0;
        }
        
        .contact-info p {
            margin: 5px 0;
        }
        
        .warning {
            color: #dc3545;
            font-weight: bold;
            margin: 15px 0;
        }
        
        .button-group {
            margin-top: 20px;
        }
    </style>
</body>
</html>