/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/10.1.34
 * Generated at: 2025-03-30 23:11:59 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.jsp.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.*;
import java.sql.ResultSet;

public final class consultar_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports,
                 org.apache.jasper.runtime.JspSourceDirectives {

  private static final jakarta.servlet.jsp.JspFactory _jspxFactory =
          jakarta.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.LinkedHashSet<>(6);
    _jspx_imports_packages.add("java.sql");
    _jspx_imports_packages.add("jakarta.servlet");
    _jspx_imports_packages.add("jakarta.servlet.http");
    _jspx_imports_packages.add("jakarta.servlet.jsp");
    _jspx_imports_classes = new java.util.LinkedHashSet<>(4);
    _jspx_imports_classes.add("java.sql.Connection");
    _jspx_imports_classes.add("java.sql.ResultSet");
    _jspx_imports_classes.add("java.sql.DriverManager");
  }

  private volatile jakarta.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public boolean getErrorOnELNotFound() {
    return false;
  }

  public jakarta.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final jakarta.servlet.http.HttpServletRequest request, final jakarta.servlet.http.HttpServletResponse response)
      throws java.io.IOException, jakarta.servlet.ServletException {

    if (!jakarta.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET, POST or HEAD. Jasper also permits OPTIONS");
        return;
      }
    }

    final jakarta.servlet.jsp.PageContext pageContext;
    jakarta.servlet.http.HttpSession session = null;
    final jakarta.servlet.ServletContext application;
    final jakarta.servlet.ServletConfig config;
    jakarta.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    jakarta.servlet.jsp.JspWriter _jspx_out = null;
    jakarta.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");

    if (session.getAttribute("usuario") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("    <meta charset=\"UTF-8\">\r\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n");
      out.write("    <title>Consultar Contatos</title>\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"styles.css\">\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("    <div class=\"nav-menu\">\r\n");
      out.write("        <div class=\"container\">\r\n");
      out.write("            <a href=\"index.jsp\">InÃ­cio</a>\r\n");
      out.write("            <a href=\"cadastrar.jsp\">Cadastrar Contato</a>\r\n");
      out.write("            <a href=\"listar.jsp\">Listar Contatos</a>\r\n");
      out.write("            <a href=\"consultar.jsp\">Consultar</a>\r\n");
      out.write("            <a href=\"logout.jsp\">Sair</a>\r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("    \r\n");
      out.write("    <div class=\"container\">\r\n");
      out.write("        <h2>Consultar Contatos</h2>\r\n");
      out.write("        \r\n");
      out.write("        <div style=\"margin-bottom: 20px;\">\r\n");
      out.write("            <form method=\"get\">\r\n");
      out.write("                <div class=\"form-group\">\r\n");
      out.write("                    <label>Tipo de Consulta:</label>\r\n");
      out.write("                    <select name=\"tipo\" onchange=\"this.form.submit()\">\r\n");
      out.write("                        <option value=\"nome\" ");
      out.print( request.getParameter("tipo") == null || request.getParameter("tipo").equals("nome") ? "selected" : "" );
      out.write(">Por Primeiro Nome</option>\r\n");
      out.write("                        <option value=\"mes\" ");
      out.print( request.getParameter("tipo") != null && request.getParameter("tipo").equals("mes") ? "selected" : "" );
      out.write(">Por MÃªs de AniversÃ¡rio</option>\r\n");
      out.write("                    </select>\r\n");
      out.write("                </div>\r\n");
      out.write("                \r\n");
      out.write("                ");
 if (request.getParameter("tipo") == null || request.getParameter("tipo").equals("nome")) { 
      out.write("\r\n");
      out.write("                    <div class=\"form-group\">\r\n");
      out.write("                        <label for=\"primeiro_nome\">Primeiro Nome:</label>\r\n");
      out.write("                        <input type=\"text\" name=\"primeiro_nome\" id=\"primeiro_nome\" value=\"");
      out.print( request.getParameter("primeiro_nome") != null ? request.getParameter("primeiro_nome") : "" );
      out.write("\">\r\n");
      out.write("                    </div>\r\n");
      out.write("                ");
 } else { 
      out.write("\r\n");
      out.write("                    <div class=\"form-group\">\r\n");
      out.write("                        <label for=\"mes\">MÃªs de AniversÃ¡rio (1-12):</label>\r\n");
      out.write("                        <input type=\"number\" name=\"mes\" id=\"mes\" min=\"1\" max=\"12\" value=\"");
      out.print( request.getParameter("mes") != null ? request.getParameter("mes") : "" );
      out.write("\">\r\n");
      out.write("                    </div>\r\n");
      out.write("                ");
 } 
      out.write("\r\n");
      out.write("                \r\n");
      out.write("                <button type=\"submit\">Consultar</button>\r\n");
      out.write("            </form>\r\n");
      out.write("        </div>\r\n");
      out.write("        \r\n");
      out.write("        ");

            String tipo = request.getParameter("tipo");
            String nome = request.getParameter("primeiro_nome");
            String mes = request.getParameter("mes");
            
            if ((tipo == null || tipo.equals("nome")) && nome != null && !nome.trim().isEmpty()) {
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection conexao = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_contatos", "root", "");
                    
                    String sql = "SELECT endereco, cidade, ddd, celular, email, cpf FROM tb_contato WHERE primeiro_nome = ?";
                    PreparedStatement stmt = conexao.prepareStatement(sql);
                    stmt.setString(1, nome);
                    
                    ResultSet rs = stmt.executeQuery();
                    
                    if (rs.next()) {
                        
      out.write("\r\n");
      out.write("                        <table>\r\n");
      out.write("                            <tr>\r\n");
      out.write("                                <th>EndereÃ§o</th>\r\n");
      out.write("                                <th>Cidade</th>\r\n");
      out.write("                                <th>DDD</th>\r\n");
      out.write("                                <th>Celular</th>\r\n");
      out.write("                                <th>Email</th>\r\n");
      out.write("                                <th>CPF</th>\r\n");
      out.write("                            </tr>\r\n");
      out.write("                            <tr>\r\n");
      out.write("                                <td>");
      out.print( rs.getString("endereco") );
      out.write("</td>\r\n");
      out.write("                                <td>");
      out.print( rs.getString("cidade") );
      out.write("</td>\r\n");
      out.write("                                <td>");
      out.print( rs.getString("ddd") );
      out.write("</td>\r\n");
      out.write("                                <td>");
      out.print( rs.getString("celular") );
      out.write("</td>\r\n");
      out.write("                                <td>");
      out.print( rs.getString("email") );
      out.write("</td>\r\n");
      out.write("                                <td>");
      out.print( rs.getString("cpf") );
      out.write("</td>\r\n");
      out.write("                            </tr>\r\n");
      out.write("                        </table>\r\n");
      out.write("                        ");

                    } else {
                        out.println("<p class='error-message'>Nenhum contato encontrado com este nome.</p>");
                    }
                    
                    conexao.close();
                } catch (Exception e) {
                    out.println("<p class='error-message'>Erro ao consultar contatos: " + e.getMessage() + "</p>");
                }
            } else if (tipo != null && tipo.equals("mes") && mes != null && !mes.trim().isEmpty()) {
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection conexao = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_contatos", "root", "");
                    
                    String sql = "SELECT * FROM tb_contato WHERE mes_nascimento = ? ORDER BY primeiro_nome";
                    PreparedStatement stmt = conexao.prepareStatement(sql);
                    stmt.setInt(1, Integer.parseInt(mes));
                    
                    ResultSet rs = stmt.executeQuery();
                    
                    boolean encontrou = false;
                    
      out.write("\r\n");
      out.write("                    <table>\r\n");
      out.write("                        <tr>\r\n");
      out.write("                            <th>ID</th>\r\n");
      out.write("                            <th>Primeiro Nome</th>\r\n");
      out.write("                            <th>Ãltimo Nome</th>\r\n");
      out.write("                            <th>EndereÃ§o</th>\r\n");
      out.write("                            <th>Cidade</th>\r\n");
      out.write("                            <th>Estado</th>\r\n");
      out.write("                            <th>DDD</th>\r\n");
      out.write("                            <th>Celular</th>\r\n");
      out.write("                            <th>Email</th>\r\n");
      out.write("                            <th>CPF</th>\r\n");
      out.write("                        </tr>\r\n");
      out.write("                        ");
 while (rs.next()) { 
                            encontrou = true;
                        
      out.write("\r\n");
      out.write("                            <tr>\r\n");
      out.write("                                <td>");
      out.print( rs.getInt("id") );
      out.write("</td>\r\n");
      out.write("                                <td>");
      out.print( rs.getString("primeiro_nome") );
      out.write("</td>\r\n");
      out.write("                                <td>");
      out.print( rs.getString("ultimo_nome") );
      out.write("</td>\r\n");
      out.write("                                <td>");
      out.print( rs.getString("endereco") );
      out.write("</td>\r\n");
      out.write("                                <td>");
      out.print( rs.getString("cidade") );
      out.write("</td>\r\n");
      out.write("                                <td>");
      out.print( rs.getString("estado") );
      out.write("</td>\r\n");
      out.write("                                <td>");
      out.print( rs.getString("ddd") );
      out.write("</td>\r\n");
      out.write("                                <td>");
      out.print( rs.getString("celular") );
      out.write("</td>\r\n");
      out.write("                                <td>");
      out.print( rs.getString("email") );
      out.write("</td>\r\n");
      out.write("                                <td>");
      out.print( rs.getString("cpf") );
      out.write("</td>\r\n");
      out.write("                            </tr>\r\n");
      out.write("                        ");
 } 
      out.write("\r\n");
      out.write("                    </table>\r\n");
      out.write("                    ");

                    if (!encontrou) {
                        out.println("<p class='error-message'>Nenhum contato encontrado para este mÃªs.</p>");
                    }
                    
                    conexao.close();
                } catch (Exception e) {
                    out.println("<p class='error-message'>Erro ao consultar contatos: " + e.getMessage() + "</p>");
                }
            }
        
      out.write("\r\n");
      out.write("    </div>\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof jakarta.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
