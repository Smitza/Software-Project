package daos;

import business.Delivery;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.Date;

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

}
