<%@page import="model.dto.User"%>
<%@page import="model.dao.UserDAO"%>
<%@page import="model.dao.LogsDAO"%>
<%@page import="model.dto.Logs"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Cadastro Realizado!</title>
</head>
<body>

<%
    // Verifica se a requisição é POST (quando o formulário é enviado)
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        // Obtém os dados enviados pelo formulário
        String email = request.getParameter("email");
        String nome = request.getParameter("nome");
        String senha = request.getParameter("senha");
        String telefone = request.getParameter("telefone");
        String endereco = request.getParameter("endereco");

        // Cria o objeto User
        User user = new User(0, email, nome, senha, telefone, endereco);

        // Instancia o DAO e chama o método para criar o usuário
        UserDAO userDAO = new UserDAO();
        userDAO.createUser(user);

        // Agora que o usuário foi criado, cria o log
        User createdUser = userDAO.getUserByEmail(email); // Supondo que você tenha um método que obtém o usuário pelo e-mail

        if (createdUser != null) {
            Logs log = new Logs();
            log.setFkuser_id(createdUser.getId_user());
            log.setAction_user("Cadastro de novo usuário");
            log.setData_time(java.time.LocalDateTime.now().toString());

            LogsDAO logsDAO = new LogsDAO();
            logsDAO.createLog(log);
        }

        // Faz o login automaticamente, colocando o usuário na sessão
        session.setAttribute("user", createdUser);

        // Redireciona para a página inicial após o cadastro (não exibe o popup novamente)
        response.sendRedirect("../index.jsp"); // Ou para a página que você desejar
    }
%>

</body>
</html>
