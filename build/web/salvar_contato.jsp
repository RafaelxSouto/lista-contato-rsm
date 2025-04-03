<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="database.DatabaseConnection"%>

<%
    if (session.getAttribute("usuario") == null) {
        response.sendRedirect("login.jsp?error=unauthorized");
        return;
    }

    // Recupera os dados do formulário
    String primeiroNome = request.getParameter("primeiroNome");
    String ultimoNome = request.getParameter("ultimoNome");
    String endereco = request.getParameter("endereco");
    String cidade = request.getParameter("cidade");
    String estado = request.getParameter("estado");
    String ddd = request.getParameter("ddd");
    String celular = request.getParameter("celular");
    String telefone = ddd + celular;
    String email = request.getParameter("email");
    String cpf = request.getParameter("cpf");
    String mesNascimentoStr = request.getParameter("mesNascimento");
    int mesNascimento;
    try {
        mesNascimento = Integer.parseInt(mesNascimentoStr);
        if (mesNascimento < 1 || mesNascimento > 12) {
            response.sendRedirect("cadastrar.jsp?error=invalid_month");
            return;
        }
    } catch (NumberFormatException e) {
        response.sendRedirect("cadastrar.jsp?error=invalid_month");
        return;
    }

    // Validação básica dos campos
    if (primeiroNome == null || ultimoNome == null || endereco == null || 
        cidade == null || estado == null || ddd == null || celular == null || 
        email == null || cpf == null || mesNascimentoStr == null || 
        primeiroNome.trim().isEmpty() || ultimoNome.trim().isEmpty() || 
        endereco.trim().isEmpty() || cidade.trim().isEmpty() || 
        estado.trim().isEmpty() || ddd.trim().isEmpty() || celular.trim().isEmpty() || 
        email.trim().isEmpty() || cpf.trim().isEmpty() || 
        mesNascimentoStr.trim().isEmpty()) {
        
        response.sendRedirect("cadastrar.jsp?error=missing_fields");
        return;
    }

    Connection conn = null;
    PreparedStatement stmt = null;

    try {
        // Estabelece conexão com o banco de dados
        conn = DatabaseConnection.getContatosConnection();

        // Prepara a query SQL para inserção
        String sql = "INSERT INTO tb_contato_rsm (primeiro_nome, ultimo_nome, endereco, cidade, estado, ddd, celular, email, cpf, mes_nascimento) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";        
        stmt = conn.prepareStatement(sql);

        // Define os parâmetros
        stmt.setString(1, primeiroNome);
        stmt.setString(2, ultimoNome);
        stmt.setString(3, endereco);
        stmt.setString(4, cidade);
        stmt.setString(5, estado);
        stmt.setString(6, ddd);
        stmt.setString(7, celular);
        stmt.setString(8, email);
        stmt.setString(9, cpf);
        stmt.setInt(10, mesNascimento);

        // Executa a inserção
        stmt.executeUpdate();

        // Redireciona com mensagem de sucesso
        response.sendRedirect("cadastrar.jsp?success=true");

    } catch (SQLException e) {
        // Em caso de erro, redireciona com mensagem de erro
        response.sendRedirect("cadastrar.jsp?error=database");
        e.printStackTrace();
    } finally {
        // Fecha os recursos
        try {
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>