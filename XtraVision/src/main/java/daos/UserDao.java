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

    @Override
    public boolean addUser(String username, String email, String password, String phone, String name, int membership, int isAdmin){
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        boolean rowsAffected = false;

        try{
            con = this.getConnection();

            String query = "INSERT INTO USERS(username, email, password, phone, name, membership, isAdmin) VALUES (?, ?, ?, ?, ?, ?, ?)";
            ps = con.prepareStatement(query);

            ps.setString(1,username);
            ps.setString(2,email);
            ps.setString(3,password);
            ps.setString(4,phone);
            ps.setString(5,name);
            ps.setInt(6,membership);
            ps.setInt(7,isAdmin);


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
return rowsAffected;
    }

    public ArrayList<User> getAllUsers() {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<User> users = new ArrayList<>();

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
    public User getUser(String username, String password) {
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
                int id = rs.getInt("ID");
                String email = rs.getString("EMAIL");
                String phone = rs.getString("PHONE");
                String firstname = rs.getString("FIRSTNAME");
                String lastname = rs.getString("LASTNAME");
                String membership = rs.getString("MEMBERSHIP");

                user = new User(userId, username, email, password, phone, firstname, lastname, membership);
            }
        } catch (SQLException e) {
            System.out.println("An error occurred in the getUser() method: " + e.getMessage());
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

    public ArrayList<User> getUserById(int id) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<User> users = new ArrayList<>();

        try {
            con = this.getConnection();

            String query = "SELECT * FROM USER WHERE ID = ?";
            ps = con.prepareStatement(query);
            ps.setInt(1, id);

            rs = ps.executeQuery();
            if (rs.next()) {
                String username = rs.getString("USERNAME");
                String password = rs.getString("PASSWORD");
                String email = rs.getString("EMAIL");
                String phone = rs.getString("PHONE");
                String firstname = rs.getString("FIRSTNAME");
                String lastname = rs.getString("LASTNAME");
                String membership = rs.getString("MEMBERSHIP");

                User u = new User(id, username, email, password, phone, firstname, lastname, membership);
                users.add(u);
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
        return users;
    }
}


