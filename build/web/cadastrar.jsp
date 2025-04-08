<%--
    Página de Cadastro de Contatos
    
    Esta página implementa o formulário de cadastro de contatos:
    - Validação de sessão do usuário
    - Formulário com todos os campos necessários
    - Validações client-side via JavaScript
    - Tratamento de diferentes tipos de erro
    - Integração com o banco de dados
    
    Fluxo de cadastro:
    1. Validação de autenticação do usuário
    2. Preenchimento do formulário com validações em tempo real
    3. Envio dos dados para salvar_contato.jsp
    4. Feedback visual do resultado da operação
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("usuario") == null) {
        response.sendRedirect("login.jsp?error=unauthorized");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cadastrar Contato</title>
    <link rel="stylesheet" href="styles/styles.css">
    <script src="js/validacoes.js"></script>
</head>
<body>
    <div class="nav-menu">
        <div class="container">
            <a href="index.jsp">Início</a>
            <a href="cadastrar.jsp" class="active">Cadastrar Contato</a>
            <a href="listar.jsp">Listar Contatos</a>
            <a href="consultar.jsp">Consultar</a>
            <a href="editar.jsp">Editar</a>
            <a href="excluir.jsp">Excluir</a>
            <a href="logout.jsp">Sair</a>
        </div>
    </div>
    
    <div class="container">
        <div class="form-container">
            <h2>Cadastrar Novo Contato</h2>
            
            <% 
                String error = request.getParameter("error");
                if (error != null) {
                    String mensagem = "";
                    switch(error) {
                        case "missing_fields":
                            mensagem = "Todos os campos são obrigatórios!";
                            break;
                        case "invalid_month":
                            mensagem = "Mês de nascimento inválido!";
                            break;
                        case "database":
                            mensagem = "Erro ao cadastrar contato!";
                            break;
                        default:
                            mensagem = error;
                    }
            %>
                    <div class="message error"><%= mensagem %></div>
            <%
                }
                String success = request.getParameter("success");
                if ("true".equals(success)) {
            %>
                    <div class="message success">Contato cadastrado com sucesso!</div>
            <%
                }
            %>
            
            <form action="salvar_contato.jsp" method="post" onsubmit="return validarFormulario()">
                <div class="form-group">
                    <label for="primeiroNome">Primeiro Nome:</label>
                    <input type="text" id="primeiroNome" name="primeiroNome" pattern="[A-Za-z]+" 
                           title="Apenas letras são permitidas" required>
                </div>
                
                <div class="form-group">
                    <label for="ultimoNome">Último Nome:</label>
                    <input type="text" id="ultimoNome" name="ultimoNome" pattern="[A-Za-z]+"
                           title="Apenas letras são permitidas" required>
                </div>
                
                <div class="form-group">
                    <label for="endereco">Endereço:</label>
                    <input type="text" id="endereco" name="endereco" required>
                </div>
                
                <div class="form-group">
                    <label for="cidade">Cidade:</label>
                    <input type="text" id="cidade" name="cidade" pattern="[A-Za-z ]+"
                           title="Apenas letras (sem acentuações) e espaços são permitidos" required>
                </div>
                
                <div class="form-group">
                    <label for="estado">Estado:</label>
                    <select id="estado" name="estado" required>
                        <option value="">Selecione...</option>
                        <option value="AC">Acre</option>
                        <option value="AL">Alagoas</option>
                        <option value="AP">Amapá</option>
                        <option value="AM">Amazonas</option>
                        <option value="BA">Bahia</option>
                        <option value="CE">Ceará</option>
                        <option value="DF">Distrito Federal</option>
                        <option value="ES">Espírito Santo</option>
                        <option value="GO">Goiás</option>
                        <option value="MA">Maranhão</option>
                        <option value="MT">Mato Grosso</option>
                        <option value="MS">Mato Grosso do Sul</option>
                        <option value="MG">Minas Gerais</option>
                        <option value="PA">Pará</option>
                        <option value="PB">Paraíba</option>
                        <option value="PR">Paraná</option>
                        <option value="PE">Pernambuco</option>
                        <option value="PI">Piauí</option>
                        <option value="RJ">Rio de Janeiro</option>
                        <option value="RN">Rio Grande do Norte</option>
                        <option value="RS">Rio Grande do Sul</option>
                        <option value="RO">Rondônia</option>
                        <option value="RR">Roraima</option>
                        <option value="SC">Santa Catarina</option>
                        <option value="SP">São Paulo</option>
                        <option value="SE">Sergipe</option>
                        <option value="TO">Tocantins</option>
                    </select>
                </div>
                
                <div class="form-group">
                    <label for="ddd">DDD:</label>
                    <select id="ddd" name="ddd" required>
                        <option value="">Selecione...</option>
                        <option value="11">11</option>
                        <option value="12">12</option>
                        <option value="13">13</option>
                        <option value="14">14</option>
                        <option value="15">15</option>
                        <option value="16">16</option>
                        <option value="17">17</option>
                        <option value="18">18</option>
                        <option value="19">19</option>
                        <option value="21">21</option>
                        <option value="22">22</option>
                        <option value="24">24</option>
                        <option value="27">27</option>
                        <option value="28">28</option>
                        <option value="31">31</option>
                        <option value="32">32</option>
                        <option value="33">33</option>
                        <option value="34">34</option>
                        <option value="35">35</option>
                        <option value="37">37</option>
                        <option value="38">38</option>
                        <option value="41">41</option>
                        <option value="42">42</option>
                        <option value="43">43</option>
                        <option value="44">44</option>
                        <option value="45">45</option>
                        <option value="46">46</option>
                        <option value="47">47</option>
                        <option value="48">48</option>
                        <option value="49">49</option>
                        <option value="51">51</option>
                        <option value="53">53</option>
                        <option value="54">54</option>
                        <option value="55">55</option>
                        <option value="61">61</option>
                        <option value="62">62</option>
                        <option value="63">63</option>
                        <option value="64">64</option>
                        <option value="65">65</option>
                        <option value="66">66</option>
                        <option value="67">67</option>
                        <option value="68">68</option>
                        <option value="69">69</option>
                        <option value="71">71</option>
                        <option value="73">73</option>
                        <option value="74">74</option>
                        <option value="75">75</option>
                        <option value="77">77</option>
                        <option value="79">79</option>
                        <option value="81">81</option>
                        <option value="82">82</option>
                        <option value="83">83</option>
                        <option value="84">84</option>
                        <option value="85">85</option>
                        <option value="86">86</option>
                        <option value="87">87</option>
                        <option value="88">88</option>
                        <option value="89">89</option>
                        <option value="91">91</option>
                        <option value="92">92</option>
                        <option value="93">93</option>
                        <option value="94">94</option>
                        <option value="95">95</option>
                        <option value="96">96</option>
                        <option value="97">97</option>
                        <option value="98">98</option>
                        <option value="99">99</option>
                    </select>
                </div>
                
                <div class="form-group">
                    <label for="celular">Celular:</label>
                    <input type="text" id="celular" name="celular" maxlength="9" pattern="[0-9]{9}"
                           title="Digite 9 números" required>
                </div>
                
                <div class="form-group">
                    <label for="email">E-mail:</label>
                    <input type="email" id="email" name="email" required>
                </div>
                
                <div class="form-group">
                    <label for="mesNascimento">Mês de Nascimento (1-12):</label>
                    <input type="number" id="mesNascimento" name="mesNascimento" min="1" max="12" required>
                </div>
                
                <div class="form-group">
                    <label for="cpf">CPF:</label>
                    <input type="text" id="cpf" name="cpf" maxlength="11" pattern="[0-9]{11}"
                           title="Digite 11 números" required>
                </div>
                
                <button type="submit" class="btn btn-primary">Cadastrar</button>
            </form>
        </div>
    </div>
</body>
</html>