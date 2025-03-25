package model.dto;

public class Logs {
    private int id_log;
    private int fkuser_id;
    private String action_user;
    private String data_time;
    
    // Construtor
    public Logs(int id_log, int fkuser_id, String action_user, String data_time) {
        this.id_log = id_log;
        this.fkuser_id = fkuser_id;
        this.action_user = action_user;
        this.data_time = data_time;
    }

    // Construtor padrão (compatível com JDK 8)
    public Logs() {}

    // Getters e Setters
    public int getId_log() {
        return id_log;
    }

    public void setId_log(int id_log) {
        this.id_log = id_log;
    }

    public int getFkuser_id() {
        return fkuser_id;
    }

    public void setFkuser_id(int fkuser_id) {
        this.fkuser_id = fkuser_id;
    }

    public String getAction_user() {
        return action_user;
    }

    public void setAction_user(String action_user) {
        this.action_user = action_user;
    }

    public String getData_time() {
        return data_time;
    }

    public void setData_time(String data_time) {
        this.data_time = data_time;
    }
    
      // Métodos que você está tentando acessar no JSP
    public String getAction() {
        return this.action_user;  // Retorna a ação registrada
    }

    public String getAction_time() {
        return this.data_time;  // Retorna a data e hora da ação
    }


    @Override
    public String toString() {
        return "Logs{id_log=" + id_log + ", fkuser_id=" + fkuser_id + ", action_user='" + action_user + "', data_time='" + data_time + "'}";
    }
}
