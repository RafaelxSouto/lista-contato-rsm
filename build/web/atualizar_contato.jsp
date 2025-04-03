<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dao.ContatoDAO"%>
<%@page import="model.Contato"%>
<%
    try {
        if (session.getAttribute("usuario") == null) {
            response.sendRedirect("login.jsp?error=unauthorized");
            return;
        }
        
        request.setCharacterEncoding("UTF-8");
        
        String cpf = request.getParameter("cpf");
        String endereco = request.getParameter("endereco");
        String cidade = request.getParameter("cidade");
        String estado = request.getParameter("estado");
        String ddd = request.getParameter("ddd");
        String celular = request.getParameter("celular");
        String email = request.getParameter("email");
        
        if (cpf == null || endereco == null || cidade == null || estado == null ||
            ddd == null || celular == null || email == null) {
            response.sendRedirect("editar.jsp?error=Todos os campos são obrigatórios");
            return;
        }
        
        ContatoDAO contatoDAO = new ContatoDAO();
        Contato contato = contatoDAO.buscarPorCPF(cpf);
        
        if (contato == null) {
            response.sendRedirect("editar.jsp?error=Contato não encontrado");
            return;
        }
        
        // Atualiza apenas os campos permitidos
        contato.setEndereco(endereco);
        contato.setCidade(cidade);
        contato.setEstado(estado);
        contato.setDdd(ddd);
        contato.setCelular(celular);
        contato.setEmail(email);
        
        if (!contato.validarDados()) {
            response.sendRedirect("editar.jsp?cpf=" + cpf + "&error=Dados inválidos");
            return;
        }
        
        if (contatoDAO.atualizar(contato)) {
            response.sendRedirect("editar.jsp?success=true");
        } else {
            response.sendRedirect("editar.jsp?cpf=" + cpf + "&error=Erro ao atualizar contato");
        }
    } catch (Exception e) {
        response.sendRedirect("editar.jsp?error=" + e.getMessage());
    }
%>