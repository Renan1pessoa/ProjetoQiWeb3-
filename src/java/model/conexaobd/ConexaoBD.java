package model.conexaobd;

import java.sql.*;
import javax.swing.JOptionPane;

public class ConexaoBD {

    private Connection conexao;

    public Connection getConexao() {
        try {
            // Driver JDBC antigo, compatível com JDK 8
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/banco_cadastro?user=root&password=";
            this.conexao = DriverManager.getConnection(url);
        } catch (ClassNotFoundException | SQLException e) {
            JOptionPane.showMessageDialog(null, "Erro na classe ConexaoBD no método getConexao(): " + e.getMessage());
        }

        return conexao;
    }
}
