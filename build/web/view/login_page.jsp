<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.dao.UserDAO" %>
<%@ page import="model.dto.User" %>
<%@ page import="java.io.*" %>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Arasaka</title>
    <link rel="icon" href="../images/logo2.png" sizes="32x32" type="image/png">
    <link href="../css/login.css" rel="stylesheet" type="text/css"/>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
</head>
<body>
    <div class="container">
        <div class="logo">
            <img src="../images/logo.png" alt="Arasaka Logo">
            <h1 class="logo-h1">Arasaka</h1>
            <h2 class="logo-h2">あらさか</h2>
        </div>

        <!-- Formulário de Login -->
        <form action="../controller/login.jsp" method="POST">
            <div class="inputs">
                <label for="email" class="label-email">E-mail</label>
                <input type="email" id="email" name="email" class="input-email" required>

                <label for="senha" class="label-senha">Senha</label>
                <input type="password" id="senha" name="senha" class="input-senha" required>
            </div>

            <div class="button-container">
                <button type="submit" class="button">ENTRAR</button>
                <a href="../index.jsp"><button type="button" class="button-cancelar">CANCELAR</button></a>
            </div>
        </form>

        <%-- Processamento do login --%>
        <%
            if ("POST".equalsIgnoreCase(request.getMethod())) {
                // Obtém os parâmetros do formulário
                String email = request.getParameter("email");
                String senha = request.getParameter("senha");

                // Instancia o DAO para buscar o usuário pelo e-mail
                UserDAO userDAO = new UserDAO();
                User user = userDAO.getUserByEmail(email);

                // Verifica se o usuário foi encontrado e se a senha está correta
                if (user != null && user.getPassword_user().equals(senha)) {
                    // Login bem-sucedido, redireciona para a página principal ou para o painel
                    session.setAttribute("user", user);  // Armazena o usuário na sessão
                    response.sendRedirect("../index.jsp");  // Redireciona para a página principal
                } else {
                    // Exibe uma mensagem de erro
                    out.println("<p style='color:red;'>E-mail ou senha incorretos. Tente novamente.</p>");
                }
            }
        %>

        <footer>
            <p>Morbi vel metus odio</p>
        </footer>
    </div>
</body>
</html>
