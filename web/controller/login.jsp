<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.dao.UserDAO" %>
<%@ page import="model.dto.User" %>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            margin-top: 50px;
        }
        .message {
            font-size: 20px;
            color: #333;
        }
        .success {
            color: green;
        }
        .error {
            color: red;
        }
    </style>
    <script>
        setTimeout(function() {
            window.location.href = "../index.jsp"; // Redireciona após 3 segundos
        }, 3000);
    </script>
</head>
<body>

<%
    // Verifica se o usuário já está logado
    User userSession = (User) session.getAttribute("user");

    // Se o usuário estiver logado, redireciona para o index
    if (userSession != null) {
        response.sendRedirect("index.jsp");
    } else {
        // Processamento do Login
        String email = request.getParameter("email");
        String senha = request.getParameter("senha");

        UserDAO userDAO = new UserDAO();
        User user = userDAO.getUserByEmail(email);

        if (user != null && user.getPassword_user().equals(senha)) {
            session.setAttribute("user", user); // Armazena o usuário na sessão
%>
            <p class="message success">✅ Login realizado com sucesso! Redirecionando...</p>
<%
            response.setHeader("Refresh", "3; URL=../index.jsp"); // Redireciona após 3 segundos
        } else {
%>
            <p class="message error">❌ E-mail ou senha incorretos. Redirecionando...</p>
<%
            response.setHeader("Refresh", "3; URL=login.jsp"); // Redireciona após 3 segundos
        }
    }
%>
</body>
</html>
