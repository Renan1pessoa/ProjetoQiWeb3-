<%@ page import="model.dao.LogsDAO" %>
<%@ page import="model.dao.UserDAO" %>
<%@ page import="model.dto.Logs" %>
<%@ page import="model.dto.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Excluir Log</title>
</head>
<body>
    <div>
        <h1>Excluir Log</h1>

        <%
            // Pega o ID do log da URL
            String logIdStr = request.getParameter("id");
            if (logIdStr != null) {
                try {
                    int logId = Integer.parseInt(logIdStr); // Converte o id para inteiro

                    LogsDAO logsDAO = new LogsDAO();
                    UserDAO userDAO = new UserDAO();

                    // Primeiro, buscamos o log correspondente ao id
                    Logs log = logsDAO.getLogById(logId);

                    // Verifica se o log foi encontrado
                    if (log != null) {
                        // Obtém o ID do usuário relacionado ao log
                        int userId = log.getFkuser_id();

                        // Exclui o log
                        logsDAO.deleteLog(logId);

                        // Caso queira, também pode excluir o usuário associado ao log
                        userDAO.deleteUser(userId);

                        out.println("<p>Log excluído com sucesso!</p>");
                    } else {
                        out.println("<p>Log não encontrado.</p>");
                    }
                } catch (NumberFormatException e) {
                    // Caso o ID não seja válido (não seja um número inteiro)
                    out.println("<p>Erro ao tentar excluir o log. ID inválido.</p>");
                }
            }

            // Redireciona de volta para a lista de logs após a exclusão
            response.sendRedirect("lista_logs.jsp");

        %>

    </div>
</body>
</html>
