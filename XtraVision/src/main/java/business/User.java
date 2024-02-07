 package business;

import java.util.Objects;

public class User {

    private int userid;
    private String username;
    private String email;
    private String password;
    private String phone;
    private String name;

    private String membership; //Can be three states: Free, Silver or Gold

    public User() {
    }

    public User(int userid, String username, String email, String password, String phone, String name, String membership) {
        this.userid = userid;
        this.username = username;
        this.email = email;
        this.password = password;
        this.phone = phone;
        this.name = name;
        this.membership = membership;
    }

    public User(String username, String email, String password, String phone, String name) {
        this.username = username;
        this.email = email;
        this.password = password;
        this.phone = phone;
        this.name = name;
    }

    public int getId() {
        return userid;
    }

    public void setId(int userid) {
        this.userid = userid;
    }

    public String getName() {
        return username;
    }

    public void setName(String name) {
        this.username = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getMembership() {
        return membership;
    }

    public void setMembership(String membership) {
        this.membership = membership;
    }



    @java.lang.Override
    public java.lang.String toString() {
        return "User{" +
                "userid=" + userid +
                ", username='" + username + '\'' +
                ", email='" + email + '\'' +
                ", password='" + password + '\'' +
                ", phone='" + phone + '\'' +
                ", name='" + name + '\'' +
                ", membership='" + membership + '\'' +
                '}';
    }

    @Override
    public boolean equals(Object obj) {
        return super.equals(obj);
    }

    @Override
    public int hashCode() {
        return Objects.hash(super.hashCode(), userid);
    }
}