<%--
    Página de Login do Sistema
    
    Esta página implementa o processo de autenticação:
    - Formulário de login com validação de campos obrigatórios
    - Tratamento de diferentes tipos de erros de autenticação
    - Redirecionamento após autenticação bem-sucedida
    - Layout responsivo e amigável
    
    Fluxo de autenticação:
    1. Usuário preenche credenciais
    2. Dados são enviados para autenticar.jsp
    3. Se autenticado, redireciona para index.jsp
    4. Se houver erro, exibe mensagem apropriada
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Lista de Contatos</title>
    <link rel="stylesheet" href="styles/login.css">
</head>
<body>
    <div class="login-container">
        <form action="autenticar.jsp" method="post" class="login-form">
            <h2>Login</h2>
            
            <% 
                String error = request.getParameter("error");
                if (error != null) {
                    if (error.equals("invalid")) {
            %>
                        <div class="error-message">Usuário ou senha inválidos!</div>
            <%
                    } else if (error.equals("unauthorized")) {
            %>
                        <div class="error-message">Acesso não autorizado. Por favor, faça login.</div>
            <%
                    }
                }
            %>
            
            <div class="form-group">
                <label for="usuario">Usuário:</label>
                <input type="text" id="usuario" name="usuario" required>
            </div>
            
            <div class="form-group">
                <label for="senha">Senha:</label>
                <input type="password" id="senha" name="senha" required>
            </div>
            <button type="submit">Entrar</button>
        </form>
    </div>
</body>
</html>