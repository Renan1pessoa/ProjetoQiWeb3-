<%@ page import="model.dao.LogsDAO" %>
<%@ page import="model.dao.UserDAO" %>
<%@ page import="model.dto.Logs" %>
<%@ page import="model.dto.User" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Salvar Alteração do Log</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>

<header class="container jumbotron">
    <a href="../view/lista_logs.jsp" class="btn btn-danger">Voltar</a>
    <h1>Alterar Log</h1>
</header>

<main class="container">

<%
    // Recebe os dados do formulário de edição
    int logId = Integer.parseInt(request.getParameter("id_log"));
    String actionUser = request.getParameter("action_user");
    int userId = Integer.parseInt(request.getParameter("user_id"));

    LogsDAO logsDAO = new LogsDAO();
    Logs log = logsDAO.getLogById(logId);

    // Verifica se o log foi encontrado
    if (log == null) {
        out.println("<p>Log não encontrado.</p>");
        return;
    }

    // Atualiza os dados do log
    log.setAction_user(actionUser);
    log.setData_time(java.time.LocalDateTime.now().toString());

    // Atualiza o log no banco de dados
    try {
        logsDAO.updateLog(log);
        
        // Atualiza os dados do usuário (caso haja alteração)
        UserDAO userDAO = new UserDAO();
        User user = userDAO.getUserById(userId);
        
        if (user != null) {
            // Aqui você pode atualizar os dados do usuário, por exemplo:
            String userName = request.getParameter("user_name");
            String userEmail = request.getParameter("user_email");
            String userPhone = request.getParameter("user_phone");
            String userAddress = request.getParameter("user_address");

            user.setName_user(userName);
            user.setEmail_user(userEmail);
            user.setPhonenumber_user(userPhone);
            user.setAddress_user(userAddress);
            
            userDAO.updateUser(user); // Atualiza o usuário no banco de dados
        }
        
        out.println("<p>Alteração realizada com sucesso!</p>");
        out.println("<a href='lista_logs.jsp' class='btn btn-primary'>Voltar para a lista</a>");
    } catch (Exception e) {
        out.println("<p>Erro ao atualizar log: " + e.getMessage() + "</p>");
    }
%>

</main>

</body>
</html>
