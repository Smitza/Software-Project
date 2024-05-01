package daos;

import business.Delivery;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class DeliveryDao extends Dao implements DeliveryDaoInterface {

    public DeliveryDao(String dbName) {super(dbName);}

    @Override
    public boolean addDelivery(int userId, String status){
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        int rowsAffected = -1;

        try {
            con = this.getConnection();

            String query = "INSERT INTO xtra.delivery (userId, status) VALUES (?, ?)";
            ps = con.prepareStatement(query);

            ps.setInt(1, userId);
            ps.setString(2, status);

            rowsAffected = ps.executeUpdate();

        } catch (SQLException e) {

            System.out.println("Error Processing delivery data");

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

                System.out.println("Error closing connection");

            }
        }
        return rowsAffected > 0;
    }

    public int getDeliveryId(int useId){
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        int id = 0;

        try {
            con = this.getConnection();

            String query = "select distinct id from products_users where userid = ?";
            ps = con.prepareStatement(query);
            ps.setInt(1, useId);

            rs = ps.executeQuery();

            while(rs.next()){
                id = rs.getInt("ID");
            }

        } catch (SQLException e) {

            System.out.println("Error Processing delivery data");

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

                System.out.println("Error closing connection");

            }
        }
        return id;
    }

    public String getDeliveryStatus(int DeliveryId){
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String status = null;

        try {
            con = this.getConnection();

            String query = "select delivery.status from delivery where delivery.deliveryid in ( select products_users.id from products_users where products_users.id = ? )";
            ps = con.prepareStatement(query);

            ps.setInt(1, DeliveryId);

            rs = ps.executeQuery();

            while (rs.next()){
                status = rs.getString("STATUS");
            }

        } catch (SQLException e) {

            System.out.println("Error Processing delivery data");

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

                System.out.println("Error closing connection");

            }
        }
        return status;
    }

    public List<Delivery> getOrdersForUser(int userId) {
        List<Delivery> orders = new ArrayList<>();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            con = this.getConnection();

            String query = "SELECT * FROM xtra.delivery WHERE userId = ?";
            ps = con.prepareStatement(query);
            ps.setInt(1, userId);

            rs = ps.executeQuery();
            while (rs.next()) {
                int deliveryId = rs.getInt("deliveryid");
                LocalDate deliveryDate = rs.getDate("deliverydate").toLocalDate();
                String status = rs.getString("status");

                // Create a Delivery object and add it to the list
                Delivery order = new Delivery(deliveryId, userId, deliveryDate, status);
                orders.add(order);
            }
        } catch (SQLException e) {
            System.out.println("Error retrieving delivery orders for user: " + e.getMessage());
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

                System.out.println("Error closing connection");

            }
        }

        return orders;
    }

}
