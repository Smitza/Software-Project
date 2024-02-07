package daos;

import business.Payment;

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
    public int addPayment(int amount, String paymentDate, String paymentMethod){
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        int rowsAffected = -1;

        try{
            con = this.getConnection();

            String query = "INSERT INTO PAYMENT(amount, paymentdate, paymentmethod) VALUES (?, ?, ?)";
            ps = con.prepareStatement(query);

            ps.setInt(1, amount);
            ps.setString(2, paymentDate);
            ps.setString(3, paymentMethod);

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
            double amount = rs.getInt("amount");
            LocalDate paymentDate = rs.getDate("paymentDate").toLocalDate();
            String paymentMethod = rs.getString("paymentMethod");

            Payment p = new Payment(amount, paymentDate, paymentMethod);
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
                double amount = rs.getInt("amount");
                LocalDate paymentDate = rs.getDate("paymentDate").toLocalDate();
                String paymentMethod = rs.getString("paymentMethod");

                Payment p = new Payment(amount, paymentDate, paymentMethod);
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
