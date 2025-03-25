package model.dto;

public class User {
    private int id_user;
    private String email_user;
    private String name_user;
    private String password_user;
    private String phonenumber_user;
    private String address_user;

    // Construtor padrão para compatibilidade com JDK 8 e anterior
    public User() {}

    // Construtor com parâmetros
    public User(int id_user, String email_user, String name_user, String password_user,
                String phonenumber_user, String address_user) {
        this.id_user = id_user;
        this.email_user = email_user;
        this.name_user = name_user;
        this.password_user = password_user;
        this.phonenumber_user = phonenumber_user;
        this.address_user = address_user;
    }

    // Getters e Setters
    public int getId_user() {
        return id_user;
    }

    public void setId_user(int id_user) {
        this.id_user = id_user;
    }

    public String getEmail_user() {
        return email_user;
    }

    public void setEmail_user(String email_user) {
        this.email_user = email_user;
    }

    public String getName_user() {
        return name_user;
    }

    public void setName_user(String name_user) {
        this.name_user = name_user;
    }

    public String getPassword_user() {
        return password_user;
    }

    public void setPassword_user(String password_user) {
        this.password_user = password_user;
    }

    public String getPhonenumber_user() {
        return phonenumber_user;
    }

    public void setPhonenumber_user(String phonenumber_user) {
        this.phonenumber_user = phonenumber_user;
    }

    public String getAddress_user() {
        return address_user;
    }

    public void setAddress_user(String address_user) {
        this.address_user = address_user;
    }

    @Override
    public String toString() {
        return "User{" +
                "id_user=" + id_user +
                ", email_user='" + email_user + '\'' +
                ", name_user='" + name_user + '\'' +
                ", password_user='" + password_user + '\'' +
                ", phonenumber_user='" + phonenumber_user + '\'' +
                ", address_user='" + address_user + '\'' +
                '}';
    }
}
