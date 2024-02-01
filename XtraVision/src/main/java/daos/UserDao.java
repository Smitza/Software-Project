package daos;

import business.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserDao extends Dao {
    public UserDao(String dbName) {
        super(dbName);
    }

    public List<User> findAllUsers() {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<User> users = new ArrayList<>();

        try {
            con = this.getConnection();

            String query = "SELECT * FROM USER";
            ps = con.prepareStatement(query);

            rs = ps.executeQuery();
            while (rs.next()) {
                int userId = rs.getInt("ID");
                String username = rs.getString("USERNAME");
                String email = rs.getString("EMAIL");
                String password = rs.getString("PASSWORD");
                String phone = rs.getString("PHONE");
                String firstname = rs.getString("FIRSTNAME");
                String lastname = rs.getString("LASTNAME");
                String membership = rs.getString("MEMBERSHIP");

                User user = new User(userId, username, email, password, phone, firstname, lastname, membership);
                users.add(user);
            }
        } catch (SQLException e) {
            System.out.println("An error occurred in the findAllUsers() method: " + e.getMessage());
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (con != null) {
                    freeConnection(con);
                }
            } catch (SQLException e) {
                System.out.println("An error occurred when shutting down the findAllUsers() method: " + e.getMessage());
            }
        }
        return users;
    }

    //Returns a Username and Password for the specified user
    public User findUserByUsernamePassword(String username, String password) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        User user = null;

        try {
            con = this.getConnection();

            String query = "SELECT * FROM USER WHERE USERNAME = ? AND PASSWORD = ?";
            ps = con.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, password);

            rs = ps.executeQuery();
            if (rs.next()) {
                int userId = rs.getInt("ID");
                String email = rs.getString("EMAIL");
                String phone = rs.getString("PHONE");
                String firstname = rs.getString("FIRSTNAME");
                String lastname = rs.getString("LASTNAME");
                String membership = rs.getString("MEMBERSHIP");

                user = new User(userId, username, email, password, phone, firstname, lastname, membership);
            }
        } catch (SQLException e) {
            System.out.println("An error occurred in the findUserByUsernamePassword() method: " + e.getMessage());
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (con != null) {
                    freeConnection(con);
                }
            } catch (SQLException e) {
                System.out.println("An error occurred when shutting down the findUserByUsernamePassword() method: " + e.getMessage());
            }
        }
        return user;
    }
}


