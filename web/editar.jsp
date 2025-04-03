<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dao.ContatoDAO"%>
<%@page import="model.Contato"%>
<%
    if (session.getAttribute("usuario") == null) {
        response.sendRedirect("login.jsp?error=unauthorized");
        return;
    }
    
    ContatoDAO contatoDAO = new ContatoDAO();
    String cpf = request.getParameter("cpf");
    Contato contato = null;
    
    if (cpf != null && !cpf.trim().isEmpty()) {
        contato = contatoDAO.buscarPorCPF(cpf);
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editar Contato</title>
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
            <a href="logout.jsp">Sair</a>
        </div>
    </div>
    
    <div class="container">
        <div class="form-container">
            <h2>Editar Contato</h2>
            
            <% 
                String error = request.getParameter("error");
                if (error != null) {
            %>
                    <div class="message error"><%= error %></div>
            <%
                }
                String success = request.getParameter("success");
                if ("true".equals(success)) {
            %>
                    <div class="message success">Contato atualizado com sucesso!</div>
            <%
                }
            %>
            
            <!-- Formulário de busca por CPF -->
            <% if (contato == null) { %>
                <form action="editar.jsp" method="get" class="form-group">
                    <div class="form-group">
                        <label for="cpf">CPF do contato:</label>
                        <input type="text" id="cpf" name="cpf" maxlength="11" pattern="[0-9]{11}"
                               title="Digite 11 números" required>
                    </div>
                    <button type="submit" class="btn btn-primary">Buscar Contato</button>
                </form>
            <% } else { %>
                <!-- Formulário de edição -->
                <form action="atualizar_contato.jsp" method="post" onsubmit="return validarFormulario()">
                    <input type="hidden" name="cpf" value="<%= contato.getCpf() %>">
                    
                    <div class="form-group">
                        <label>Primeiro Nome:</label>
                        <input type="text" value="<%= contato.getPrimeiroNome() %>" disabled>
                    </div>
                    
                    <div class="form-group">
                        <label>Último Nome:</label>
                        <input type="text" value="<%= contato.getUltimoNome() %>" disabled>
                    </div>
                    
                    <div class="form-group">
                        <label for="endereco">Endereço:</label>
                        <input type="text" id="endereco" name="endereco" 
                               value="<%= contato.getEndereco() %>" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="cidade">Cidade:</label>
                        <input type="text" id="cidade" name="cidade" pattern="[A-Za-z ]+"
                               title="Apenas letras e espaços são permitidos"
                               value="<%= contato.getCidade() %>" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="estado">Estado:</label>
                        <select id="estado" name="estado" required>
                            <option value="AC" <%= "AC".equals(contato.getEstado()) ? "selected" : "" %>>Acre</option>
                            <option value="AL" <%= "AL".equals(contato.getEstado()) ? "selected" : "" %>>Alagoas</option>
                            <option value="AP" <%= "AP".equals(contato.getEstado()) ? "selected" : "" %>>Amapá</option>
                            <option value="AM" <%= "AM".equals(contato.getEstado()) ? "selected" : "" %>>Amazonas</option>
                            <option value="BA" <%= "BA".equals(contato.getEstado()) ? "selected" : "" %>>Bahia</option>
                            <option value="CE" <%= "CE".equals(contato.getEstado()) ? "selected" : "" %>>Ceará</option>
                            <option value="DF" <%= "DF".equals(contato.getEstado()) ? "selected" : "" %>>Distrito Federal</option>
                            <option value="ES" <%= "ES".equals(contato.getEstado()) ? "selected" : "" %>>Espírito Santo</option>
                            <option value="GO" <%= "GO".equals(contato.getEstado()) ? "selected" : "" %>>Goiás</option>
                            <option value="MA" <%= "MA".equals(contato.getEstado()) ? "selected" : "" %>>Maranhão</option>
                            <option value="MT" <%= "MT".equals(contato.getEstado()) ? "selected" : "" %>>Mato Grosso</option>
                            <option value="MS" <%= "MS".equals(contato.getEstado()) ? "selected" : "" %>>Mato Grosso do Sul</option>
                            <option value="MG" <%= "MG".equals(contato.getEstado()) ? "selected" : "" %>>Minas Gerais</option>
                            <option value="PA" <%= "PA".equals(contato.getEstado()) ? "selected" : "" %>>Pará</option>
                            <option value="PB" <%= "PB".equals(contato.getEstado()) ? "selected" : "" %>>Paraíba</option>
                            <option value="PR" <%= "PR".equals(contato.getEstado()) ? "selected" : "" %>>Paraná</option>
                            <option value="PE" <%= "PE".equals(contato.getEstado()) ? "selected" : "" %>>Pernambuco</option>
                            <option value="PI" <%= "PI".equals(contato.getEstado()) ? "selected" : "" %>>Piauí</option>
                            <option value="RJ" <%= "RJ".equals(contato.getEstado()) ? "selected" : "" %>>Rio de Janeiro</option>
                            <option value="RN" <%= "RN".equals(contato.getEstado()) ? "selected" : "" %>>Rio Grande do Norte</option>
                            <option value="RS" <%= "RS".equals(contato.getEstado()) ? "selected" : "" %>>Rio Grande do Sul</option>
                            <option value="RO" <%= "RO".equals(contato.getEstado()) ? "selected" : "" %>>Rondônia</option>
                            <option value="RR" <%= "RR".equals(contato.getEstado()) ? "selected" : "" %>>Roraima</option>
                            <option value="SC" <%= "SC".equals(contato.getEstado()) ? "selected" : "" %>>Santa Catarina</option>
                            <option value="SP" <%= "SP".equals(contato.getEstado()) ? "selected" : "" %>>São Paulo</option>
                            <option value="SE" <%= "SE".equals(contato.getEstado()) ? "selected" : "" %>>Sergipe</option>
                            <option value="TO" <%= "TO".equals(contato.getEstado()) ? "selected" : "" %>>Tocantins</option>
                        </select>
                    </div>
                    
                    <div class="form-group">
                        <label for="ddd">DDD:</label>
                        <select id="ddd" name="ddd" required>
                            <% 
                                String[] ddds = {"11", "12", "13", "14", "15", "16", "17", "18", "19",
                                                "21", "22", "24", "27", "28", "31", "32", "33", "34",
                                                "35", "37", "38", "41", "42", "43", "44", "45", "46",
                                                "47", "48", "49", "51", "53", "54", "55", "61", "62",
                                                "63", "64", "65", "66", "67", "68", "69", "71", "73",
                                                "74", "75", "77", "79", "81", "82", "83", "84", "85",
                                                "86", "87", "88", "89", "91", "92", "93", "94", "95",
                                                "96", "97", "98", "99"};
                                for (String ddd : ddds) {
                            %>
                                <option value="<%= ddd %>" <%= ddd.equals(contato.getDdd()) ? "selected" : "" %>>
                                    <%= ddd %>
                                </option>
                            <% } %>
                        </select>
                    </div>
                    
                    <div class="form-group">
                        <label for="celular">Celular:</label>
                        <input type="text" id="celular" name="celular" maxlength="9" pattern="[0-9]{9}"
                               title="Digite 9 números" value="<%= contato.getCelular() %>" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="email">E-mail:</label>
                        <input type="email" id="email" name="email" 
                               value="<%= contato.getEmail() %>" required>
                    </div>
                    
                    <div class="form-group">
                        <label>Mês de Nascimento:</label>
                        <input type="number" value="<%= contato.getMesNascimento() %>" disabled>
                    </div>
                    
                    <div class="form-group">
                        <label>CPF:</label>
                        <input type="text" value="<%= contato.getCpf() %>" disabled>
                    </div>
                    
                    <button type="submit" class="btn btn-primary">Atualizar</button>
                    <a href="editar.jsp" class="btn" style="margin-left: 10px;">Cancelar</a>
                </form>
            <% } %>
        </div>
    </div>
</body>
</html>