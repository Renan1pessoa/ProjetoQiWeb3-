<%@ page import="model.dao.LogsDAO" %>
<%@ page import="model.dao.UserDAO" %>
<%@ page import="model.dto.Logs" %>
<%@ page import="model.dto.User" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Logs</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../css/lista_logs.css" rel="stylesheet" type="text/css"/>
</head>
<body>

<header id="topo" class="container jumbotron">
    <a href="../index.jsp" class="btn btn-danger">Voltar</a>
    <h1>Dados dos Usuários</h1>
</header>

<main id="geral">

<%
    LogsDAO logsDAO = new LogsDAO();
    UserDAO userDAO = new UserDAO();
    ArrayList<Logs> logs = null;

    try {
        // Lista todos os logs
        logs = logsDAO.listAllLogs(); 

        // Verifica o número de logs retornados para depuração
        out.println("<p>Logs encontrados: " + (logs != null ? logs.size() : 0) + "</p>");
    } catch (Exception e) {
        e.printStackTrace();
        out.println("<p>Erro ao carregar logs. Tente novamente mais tarde.</p>");
        return;
    }

    if (logs != null && !logs.isEmpty()) {
        out.println("<p>Exibindo " + logs.size() + " logs.</p>");  // Depuração para confirmar o número de logs

        for (Logs log : logs) {
            
            // Aqui buscamos o usuário relacionado ao log
            User user = userDAO.getUserById(log.getFkuser_id());  // Buscando o usuário pelo fkuser_id
            
%>

    <div class="container jumbotron">
        <!-- Exibe informações do log -->
        <h4><strong>ID:</strong> <%= log.getId_log() %></h4>
        <p><strong>Ação:</strong> <%= log.getAction_user() %></p>
        <p><strong>Data e Hora:</strong> <%= log.getData_time() %></p>

        <!-- Exibe informações do usuário relacionado -->
        <h5><strong>Informações do Usuário</strong></h5>
        <p><strong>Nome:</strong> <%= user.getName_user() %></p>
        <p><strong>Email:</strong> <%= user.getEmail_user() %></p>
        <p><strong>Telefone:</strong> <%= user.getPhonenumber_user() %></p>
        <p><strong>Endereço:</strong> <%= user.getAddress_user() %></p>

        <!-- Botões de Alterar e Excluir -->
        <div class="mt-3">
            <a href="editar_log.jsp?id=<%= log.getId_log() %>" class="btn btn-warning">Editar</a>
            <a href="deletar_log.jsp?id=<%= log.getId_log() %>" class="btn btn-danger" onclick="return confirm('Tem certeza que deseja excluir este log?')">Excluir</a>
        </div>
    </div>

<%
        }
    } else {
        out.println("<p>Não há logs para exibir.</p>");
    }
%>

</main>

</body>
</html>
