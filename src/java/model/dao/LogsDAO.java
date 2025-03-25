package model.dao;

import java.sql.*;
import java.util.ArrayList;
import model.dto.Logs;
import model.conexaobd.ConexaoBD;

public class LogsDAO {
    private final Connection conexao;
    
    public LogsDAO() {
        this.conexao = new ConexaoBD().getConexao();
    }
    
     // Lista todos os logs
    public ArrayList<Logs> listAllLogs() {
        ArrayList<Logs> logs = new ArrayList<>();
        String sql = "SELECT * FROM logs"; // SQL para listar todos os logs
        try (PreparedStatement ps = conexao.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            
            while (rs.next()) {
                Logs log = new Logs(
                        rs.getInt("id_log"),
                        rs.getInt("fkuser_id"),
                        rs.getString("action_user"),
                        rs.getString("data_time")
                );
                logs.add(log);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Erro ao buscar logs: " + e.getMessage(), e);
        }
        return logs;
    }

    // Cria um novo log
    public void createLog(Logs log) {
        String sql = "INSERT INTO logs (fkuser_id, action_user, data_time) VALUES (?, ?, ?)";
        try (PreparedStatement ps = conexao.prepareStatement(sql)) {
            ps.setInt(1, log.getFkuser_id());
            ps.setString(2, log.getAction_user());
            ps.setString(3, log.getData_time());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();  // Imprime o erro no console
            throw new RuntimeException("Erro ao criar log: " + e.getMessage(), e); // Lançando exceção
        }
    }

    // Atualiza um log existente
    public void updateLog(Logs log) {
        String sql = "UPDATE logs SET action_user=?, data_time=? WHERE id_log=?";
        try (PreparedStatement ps = conexao.prepareStatement(sql)) {
            ps.setString(1, log.getAction_user());
            ps.setString(2, log.getData_time());
            ps.setInt(3, log.getId_log());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Erro ao atualizar log: " + e.getMessage(), e);
        }
    }

    // Deleta um log
    public void deleteLog(int logId) {
        String sql = "DELETE FROM logs WHERE id_log=?";
        try (PreparedStatement ps = conexao.prepareStatement(sql)) {
            ps.setInt(1, logId);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Erro ao excluir log: " + e.getMessage(), e);
        }
    }

    // Obtém um log pelo ID
    public Logs getLogById(int logId) {
        String sql = "SELECT * FROM logs WHERE id_log=?";
        try (PreparedStatement ps = conexao.prepareStatement(sql)) {
            ps.setInt(1, logId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return new Logs(
                            rs.getInt("id_log"),
                            rs.getInt("fkuser_id"),
                            rs.getString("action_user"),
                            rs.getString("data_time")
                    );
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Erro ao buscar log por ID: " + e.getMessage(), e);
        }
        return null;
    }
}
