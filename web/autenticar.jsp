<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dao.UsuarioDAO"%>
<%
    request.setCharacterEncoding("UTF-8");
    
    String usuario = request.getParameter("usuario");
    String senha = request.getParameter("senha");
    
    if (usuario == null || senha == null || usuario.trim().isEmpty() || senha.trim().isEmpty()) {
        response.sendRedirect("login.jsp?error=invalid");
        return;
    }
    
    UsuarioDAO usuarioDAO = new UsuarioDAO();
    
    if (usuarioDAO.autenticar(usuario, senha)) {
        session.setAttribute("usuario", usuario);
        response.sendRedirect("index.jsp");
    } else {
        response.sendRedirect("login.jsp?error=invalid");
    }
%>