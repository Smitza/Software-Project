package daos;

import business.BillingInformation;
import business.User;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class UserDao extends Dao implements UserDaoInterface {
    public UserDao(String dbName) {
        super(dbName);
    }

    @Override
    public boolean addUser(String username, String email, String password, String phone, String name, int membership, int isAdmin, int isDeliverer){
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        int rowsAffected = -1;

        try{
            con = this.getConnection();

            String query = "INSERT INTO xtra.users(username, email, password, phone, name, membership, isAdmin, isDeliverer) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            ps = con.prepareStatement(query);

            ps.setString(1,username);
            ps.setString(2,email);
            ps.setString(3,password);
            ps.setString(4,phone);
            ps.setString(5,name);
            ps.setInt(6,membership);
            ps.setInt(7, isAdmin);
            ps.setInt(8, isDeliverer);

            rowsAffected = ps.executeUpdate();

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
        return rowsAffected > 0;
    }

    @Override
    public ArrayList<User> getAllUsers() {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<User> users = new ArrayList<>();

        try {
            con = this.getConnection();

            String query = "SELECT * FROM USERS";
            ps = con.prepareStatement(query);

            rs = ps.executeQuery();
            while (rs.next()) {
                int userId = rs.getInt("USERID");
                String username = rs.getString("USERNAME");
                String email = rs.getString("EMAIL");
                String password = rs.getString("PASSWORD");
                String phone = rs.getString("PHONE");
                String name = rs.getString("NAME");
                int membership = rs.getInt("MEMBERSHIP");
                int isAdmin = rs.getInt("ISADMIN");
                int isDeliverer = rs.getInt("ISDELIVERER");

                User user = new User(userId, username, email, password, phone, name, membership, isAdmin, isDeliverer);
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
    @Override
    public User getUserbyUserPass(String username, String password) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        User user = null;

        try {
            con = this.getConnection();

            String query = "SELECT * FROM USERS WHERE USERNAME = ? AND PASSWORD = ?";
            ps = con.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, password);

            rs = ps.executeQuery();
            if (rs.next()) {
                int userid = rs.getInt("USERID");
                String email = rs.getString("EMAIL");
                String phone = rs.getString("PHONE");
                String name = rs.getString("NAME");
                int membership = rs.getInt("MEMBERSHIP");
                int isAdmin = rs.getInt("ISADMIN");
                int isDeliverer = rs.getInt("ISDELIVERER");

                user = new User(userid, username, email, password, phone, name, membership, isAdmin, isDeliverer);
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

    @Override
    public int SetUserDetails(String username, String email, String phone, String name, String password, int id){
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        User u = null;

        int rowsAffected = -1;

        try {
            con = this.getConnection();
            String query = "UPDATE users SET username = ?, email = ?, phone = ?, name = ? WHERE userid = ? AND password = ? ";
            ps = con.prepareStatement(query);

            ps.setString(1, username);
            ps.setString(2, email);
            ps.setString(3, phone);
            ps.setString(4, name);
            ps.setInt(5, id);
            ps.setString(6, password);

            rowsAffected =  ps.executeUpdate();


            } catch (SQLException e) {
                System.err.println("Error occurred while changing user details. Try again later");
                return rowsAffected;
            }
            return rowsAffected;
        }


    @Override
    public User getUserById(int id) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        User u = null;

        try {
            con = this.getConnection();

            String query = "SELECT * FROM USERS WHERE USERID = ?";
            ps = con.prepareStatement(query);
            ps.setInt(1, id);

            rs = ps.executeQuery();
            if (rs.next()) {
                String username = rs.getString("USERNAME");
                String password = rs.getString("PASSWORD");
                String email = rs.getString("EMAIL");
                String phone = rs.getString("PHONE");
                String name = rs.getString("NAME");
                int membership = rs.getInt("MEMBERSHIP");
                int isAdmin = rs.getInt("ISADMIN");
                int isDeliverer = rs.getInt("ISDELIVERER");

                u = new User(id, username, email, password, phone, name, membership, isAdmin, isDeliverer);
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
        return u;
    }

    public User getUserByUsername(String username) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        User u = null;

        try {
            con = this.getConnection();
            String query = "SELECT * FROM USERS WHERE USERNAME = ?";
            ps = con.prepareStatement(query);
            ps.setString(1, username);

            rs = ps.executeQuery();
            if (rs.next()) {
                int userid = rs.getInt("USERID");
                String email = rs.getString("EMAIL");
                String phone = rs.getString("PHONE");
                String name = rs.getString("NAME");
                int membership = rs.getInt("MEMBERSHIP");
                int isAdmin = rs.getInt("ISADMIN");
                int isDeliverer = rs.getInt("ISDELIVERER");

                u = new User(userid, username, email, "", phone, name, membership, isAdmin, isDeliverer);
            }
        } catch (SQLException e) {
            System.out.println("An error occurred in the getUserByUsername() method: " + e.getMessage());
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
                System.out.println("An error occurred when shutting down the getUserByUsername() method: " + e.getMessage());
            }
        }
            return u;
        }


    public String getHashedPasswordByUsername(String username) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String hashedPassword = null;

        try {
            con = this.getConnection();
            String query = "SELECT password FROM USERS WHERE USERNAME = ?";
            ps = con.prepareStatement(query);
            ps.setString(1, username);

            rs = ps.executeQuery();
            if (rs.next()) {
                hashedPassword = rs.getString("PASSWORD");
            }
        } catch (SQLException e) {
            System.out.println("An error occurred in the getHashedPasswordByUsername() method: " + e.getMessage());
        }  finally {
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
                System.out.println("An error occurred when shutting down the getHashedPasswordByUsername() method: " + e.getMessage());
            }
        }

        return hashedPassword;
    }


    public void updateUser(User user) {
        try (Connection conn = getConnection();
             PreparedStatement statement = conn.prepareStatement("UPDATE users SET isAdmin = ? WHERE userid = ?")) {
            statement.setInt(1, user.isAdmin());
            statement.setInt(2, user.getId());
            statement.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error occurred: The selected user was not found" + e.getMessage());
        }
    }

    public void updateUserDelivery(User user) {
        try (Connection conn = getConnection();
             PreparedStatement statement = conn.prepareStatement("UPDATE users SET isDeliverer = ? WHERE userid = ?")) {
            statement.setInt(1, user.IsDeliverer());
            statement.setInt(2, user.getId());
            statement.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error occurred: The selected user was not found" + e.getMessage());
        }
    }

    @Override
    public boolean addBillingInformation(BillingInformation bi){
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        int rowsAffected = -1;

        try{
            con = this.getConnection();

            String query = "INSERT INTO billing_information(userId, addressline1, addressline2) VALUES (?, ?, ?)";
            ps = con.prepareStatement(query);

            ps.setInt(1,bi.getUserid());
            ps.setString(2,bi.getAddressLine1());
            ps.setString(3,bi.getAddressLine2());

            rowsAffected = ps.executeUpdate();

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
        return rowsAffected > 0;
    }

    @Override
    public BillingInformation getUserBillingInfo(int id) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        BillingInformation bi = null;

        try{
            con = this.getConnection();

            String query = "SELECT * FROM BILLING_INFORMATION WHERE USERID = ?";
            ps = con.prepareStatement(query);
            ps.setInt(1, id);

            rs = ps.executeQuery();

            if(rs.next()){
                int userId = rs.getInt("USERID");
                String addressline1 = rs.getString("ADDRESSLINE1");
                String addressline2 = rs.getString("ADDRESSLINE2");


                bi = new BillingInformation(userId, addressline1, addressline2);
            }
        } catch (SQLException e) {
            System.out.println("Error occurred getting billing information " + e.getMessage());
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
                System.out.println("An error occurred when shutting down the getUserBillingInfo() method: " + e.getMessage());
            }
        }
        return bi;
    }

    public void addMembership(User user) {
        try (Connection conn = getConnection();
             PreparedStatement statement = conn.prepareStatement("UPDATE users SET membership = ? WHERE userid = ?")) {
            statement.setInt(1, user.getMembership());
            statement.setInt(2, user.getId());
            statement.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error occurred: The selected user was not found" + e.getMessage());
        }
    }

}


