<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.dao.UserDAO" %>
<%@ page import="model.dto.User" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cadastro - Arasaka</title>
    <link rel="icon" href="../images/logo2.png" sizes="32x32" type="image/png">
    <link href="../css/registro.css" rel="stylesheet" type="text/css"/>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
</head>
<body>
    <div class="container">
        <div class="logo">
            <img src="../images/logo.png" alt="Arasaka Logo">
            <h1 class="logo-h1">Arasaka</h1>
            <h2 class="logo-h2">あらさか</h2>
        </div>
        <div class="social-icons">
            <img src="../images/whatsapp (1).png" class="whatsapp-img" alt="WhatsApp">
            <img src="../images/instagram.png" class="instagram-img" alt="Instagram">
        </div>
        
        <!-- Formulário que envia os dados para a própria página -->
        <form action="../controller/cadastro.jsp" method="POST">
            <div class="inputs">
                <label for="email" class="label-email">E-mail</label>
                <input type="email" id="email" name="email" class="input-email" required>

                <label for="nome" class="label-nome">Nome completo</label>
                <input type="text" id="nome" name="nome" class="input-nome" required>

                <label for="senha" class="label-senha">Senha</label>
                <input type="password" id="senha" name="senha" class="input-senha" required>

                <label for="telefone" class="label-telefone">Telefone</label>
                <input type="tel" id="telefone" name="telefone" class="input-telefone" required>

                <label for="endereco" class="label-endereco">Endereço</label>
                <input type="text" id="endereco" name="endereco" class="input-endereco" required>
            </div>

            <div class="button-container">
                <button type="submit" class="button">CADASTRE-SE</button>
                    <a href="../index.jsp"><button type="button" class="button-cancelar">CANCELAR</button></a>
            </div>
        </form>
        
         <%
        if ("POST".equalsIgnoreCase(request.getMethod())) {
            String email = request.getParameter("email");
            String nome = request.getParameter("nome");
            String senha = request.getParameter("senha");
            String telefone = request.getParameter("telefone");
            String endereco = request.getParameter("endereco");

            User user = new User(0, email, nome, senha, telefone, endereco);
            UserDAO userDAO = new UserDAO();
            userDAO.createUser(user);
        }
    %>

        <div class="image-container">
            <img src="../images/fan (2).png" alt="Logo pequeno" class="fan-img">
        </div>

        <footer>
            <p>Morbi vel metus odio</p>
        </footer>
    </div>
</body>
</html>
