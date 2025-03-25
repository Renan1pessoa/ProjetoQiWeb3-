<%@ page import="model.dao.LogsDAO" %>
<%@ page import="model.dao.UserDAO" %>
<%@ page import="model.dto.Logs" %>
<%@ page import="model.dto.User" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Alterar Log</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>

<header class="container jumbotron">
    <a href="lista_logs.jsp" class="btn btn-danger">Voltar</a>
    <h1>Alterar Log</h1>
</header>

<main class="container">

<%
    int logId = Integer.parseInt(request.getParameter("id"));
    LogsDAO logsDAO = new LogsDAO();
    Logs log = logsDAO.getLogById(logId);
    
    if (log == null) {
        out.println("<p>Log não encontrado.</p>");
        return;
    }
    
    UserDAO userDAO = new UserDAO();
    User user = userDAO.getUserById(log.getFkuser_id());
%>

<form action="salvar-ediçao_log.jsp" method="post">
    <input type="hidden" name="id_log" value="<%= log.getId_log() %>">
    <input type="hidden" name="user_id" value="<%= user.getId_user() %>">

    <div class="form-group">
        <label for="user_name">Nome do Usuário:</label>
        <input type="text" class="form-control" id="user_name" name="user_name" value="<%= user.getName_user() %>" required>
    </div>
    
    <div class="form-group">
        <label for="user_email">Email:</label>
        <input type="email" class="form-control" id="user_email" name="user_email" value="<%= user.getEmail_user() %>" required>
    </div>

    <div class="form-group">
        <label for="user_phone">Telefone:</label>
        <input type="text" class="form-control" id="user_phone" name="user_phone" value="<%= user.getPhonenumber_user() %>" required>
    </div>

    <div class="form-group">
        <label for="user_address">Endereço:</label>
        <input type="text" class="form-control" id="user_address" name="user_address" value="<%= user.getAddress_user() %>" required>
    </div>

    <div class="form-group">
        <label for="action_user">Ação do Usuário:</label>
        <input type="text" class="form-control" id="action_user" name="action_user" value="<%= log.getAction_user() %>" required>
    </div>

    <button type="submit" class="btn btn-success">Salvar Alterações</button>
</form>

</main>

</body>
</html>
