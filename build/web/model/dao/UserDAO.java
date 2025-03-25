package model.dao;

import java.sql.*;
import java.util.ArrayList;
import javax.swing.JOptionPane;
import model.conexaobd.ConexaoBD;
import model.dto.User;

public class UserDAO {
    private final Connection conexao;
    private PreparedStatement ps;
    private ResultSet resultado;

    public UserDAO() {
        this.conexao = new ConexaoBD().getConexao();
    }

    // Cria um novo usuário
    public void createUser(User user) {
        String sql = "INSERT INTO user (email_user, name_user, password_user, phonenumber_user, address_user) VALUES (?, ?, ?, ?, ?)";
        try {
            this.ps = conexao.prepareStatement(sql);
            this.ps.setString(1, user.getEmail_user());
            this.ps.setString(2, user.getName_user());
            this.ps.setString(3, user.getPassword_user());
            this.ps.setString(4, user.getPhonenumber_user());
            this.ps.setString(5, user.getAddress_user());
            this.ps.executeUpdate();
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Erro na classe UserDAO no método createUser(): " + e.getMessage());
        }
    }

    // Atualiza os dados de um usuário
    public void updateUser(User user) {
        String sql = "UPDATE user SET email_user=?, name_user=?, password_user=?, phonenumber_user=?, address_user=? WHERE id_user=?";
        try {
            this.ps = conexao.prepareStatement(sql);
            this.ps.setString(1, user.getEmail_user());
            this.ps.setString(2, user.getName_user());
            this.ps.setString(3, user.getPassword_user());
            this.ps.setString(4, user.getPhonenumber_user());
            this.ps.setString(5, user.getAddress_user());
            this.ps.setInt(6, user.getId_user());
            this.ps.executeUpdate();
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Erro na classe UserDAO no método updateUser(): " + e.getMessage());
        }
    }

    // Deleta um usuário
    public void deleteUser(int userId) {
        String sql = "DELETE FROM user WHERE id_user=?";
        try {
            this.ps = conexao.prepareStatement(sql);
            this.ps.setInt(1, userId);
            this.ps.executeUpdate();
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Erro na classe UserDAO no método deleteUser(): " + e.getMessage());
        }
    }

    // Obtém um usuário pelo ID
     // Obtém um usuário pelo ID
    public User getUserById(int userId) {
        String sql = "SELECT * FROM user WHERE id_user=?";
        try (PreparedStatement ps = conexao.prepareStatement(sql)) {
            ps.setInt(1, userId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return new User(
                        rs.getInt("id_user"),
                        rs.getString("email_user"),
                        rs.getString("name_user"),
                        rs.getString("password_user"),
                        rs.getString("phonenumber_user"),
                        rs.getString("address_user")
                    );
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Erro ao buscar usuário por ID: " + e.getMessage(), e);
        }
        return null;
    }

    // Lista todos os usuários
    public ArrayList<User> listAllUsers() {
        ArrayList<User> users = new ArrayList<>();
        String sql = "SELECT * FROM user";
        try {
            this.ps = conexao.prepareStatement(sql);
            resultado = ps.executeQuery();
            while (resultado.next()) {
                users.add(new User(
                        resultado.getInt("id_user"),
                        resultado.getString("email_user"),
                        resultado.getString("name_user"),
                        resultado.getString("password_user"),
                        resultado.getString("phonenumber_user"),
                        resultado.getString("address_user")
                ));
            }
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Erro na classe UserDAO no método listAllUsers(): " + e.getMessage());
        }
        return users;
    }
    public User getUserByEmail(String email) {
    String sql = "SELECT * FROM user WHERE email_user=?";
    try {
        this.ps = conexao.prepareStatement(sql);
        this.ps.setString(1, email);
        resultado = ps.executeQuery();
        if (resultado.next()) {
            return new User(
                resultado.getInt("id_user"),
                resultado.getString("email_user"),
                resultado.getString("name_user"),
                resultado.getString("password_user"),
                resultado.getString("phonenumber_user"),
                resultado.getString("address_user")
            );
        }
    } 
    catch (SQLException e) {
        e.printStackTrace();
    }
    return null;
    }
}
