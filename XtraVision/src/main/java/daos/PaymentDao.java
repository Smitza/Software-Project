package daos;

import business.Payment;
import exceptions.DaoException;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Locale;

public class PaymentDao extends Dao implements PaymentDaoInterface{

    public PaymentDao(String dbName){
        super(dbName);
    }


    @Override
    public int addPayment(int userId, double amount, String paymentDate, String paymentMethod) throws DaoException {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        int rowsAffected = -1;

        try {
            con = this.getConnection();
            String query = "INSERT INTO payment (userid, amount, paymentdate, paymentmethod) VALUES (?, ?, ?, ?)";
            ps = con.prepareStatement(query);
            ps.setInt(1, userId);
            ps.setDouble(2, amount);
            ps.setString(3, paymentDate);
            ps.setString(4, paymentMethod);

            rowsAffected = ps.executeUpdate();
        } catch (SQLException e) {
            throw new DaoException("Error occurred while adding payment", e);
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
                System.out.println("An error occurred when shutting down the addPayment() method: " + e.getMessage());
            }
        }

        return rowsAffected;
    }

    @Override
    public int deletePaymentById(int id){
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        int rowsAffected = -1;

        try{
            con = this.getConnection();

            String query = "DELETE FROM PAYMENT WHERE payid = ?";
            ps = con.prepareStatement(query);

            ps.setInt(1, id);

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
        return rowsAffected;
    }
    @Override
    public ArrayList<Payment> getPaymentById(int id) {
    Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<Payment> payment = new ArrayList<>();

        try {
            con = this.getConnection();

            String query = "SELECT * FROM PAYMENT WHERE payid = ?";
            ps = con.prepareStatement(query);

            ps.setInt(1, id);

            rs = ps.executeQuery();

            while (rs.next()) {
                int payid = rs.getInt("payid");
                double amount = rs.getInt("amount");
                LocalDate paymentDate = rs.getDate("paymentDate").toLocalDate();
                String paymentMethod = rs.getString("paymentMethod");

                Payment p = new Payment(payid, amount, paymentDate, paymentMethod);
                payment.add(p);

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
        return payment;
    }

    @Override
    public ArrayList<Payment> getPaymentByMethod(String method){
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<Payment> payment = new ArrayList<>();

        try {
            con = this.getConnection();

            String query = "SELECT * FROM PAYMENT WHERE paymentmethod = ?";
            ps = con.prepareStatement(query);

            ps.setString(1, method);

            rs = ps.executeQuery();

            while (rs.next()) {
                int payid = rs.getInt("payid");
                double amount = rs.getInt("amount");
                LocalDate paymentDate = rs.getDate("paymentDate").toLocalDate();
                String paymentMethod = rs.getString("paymentMethod");

                Payment p = new Payment(payid, amount, paymentDate, paymentMethod);
                payment.add(p);

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
        return payment;
    }

    @Override
    public ArrayList<Payment> getAllPayments(){
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<Payment> payment = new ArrayList<>();

        try {
            con = this.getConnection();

            String query = "SELECT * FROM PAYMENT";
            ps = con.prepareStatement(query);

            rs = ps.executeQuery();

            while (rs.next()) {
                int payid = rs.getInt("payid");
                double amount = rs.getInt("amount");
                LocalDate paymentDate = rs.getDate("paymentDate").toLocalDate();
                String paymentMethod = rs.getString("paymentMethod");

                Payment p = new Payment(payid,amount, paymentDate, paymentMethod);
                payment.add(p);

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
        return payment;
    }

}
