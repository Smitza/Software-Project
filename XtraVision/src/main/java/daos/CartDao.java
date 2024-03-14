package daos;

import business.Product;
import exceptions.DaoException;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CartDao extends Dao implements CartDaoInterface{

    public CartDao(String dbName){ super(dbName); }

    @Override
    public boolean addProductToCart(int userId, int productId, int quantity) throws DaoException{
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        int rowsAffected = -1;

        try{
            con = this.getConnection();

            String query = "INSERT INTO xtra.cart ( userid,  productid,  quantity) VALUES (?,?,?)";
            ps = con.prepareStatement(query);

            ps.setInt(1, userId);
            ps.setInt(2, productId);
            ps.setInt(3, quantity);

            rowsAffected = ps.executeUpdate();


        } catch (SQLException e){
            System.out.println("An error occured adding an item to your cart");
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
    public List<Product> getCartByUserId(int userId){
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<Product> cartProducts = new ArrayList<>();

        try{
            con = this.getConnection();

            String query = "SELECT productid, quantity from xtra.cart WHERE userid = ?";
            ps = con.prepareStatement(query);
            ps.setInt(1, userId);

            rs = ps.executeQuery();

            while(rs.next()){
                int prodcutid = rs.getInt("productid");
                int quantity = rs.getInt("quantity");
                Product p = new Product(prodcutid, quantity);
                cartProducts.add(p);
            }

        } catch (SQLException e){
            System.out.println("Error Occured requesting Cart. Please try again later");
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
                System.out.println("An error occurred when shutting down the GetCartByuserId method: " + e.getMessage());
            }
        }
        return cartProducts;
    }

    @Override
    public boolean updateCartQuantity(int cartId, int quantity, int productiId){
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        int rowsAffected = -1;

        try{
            con = this.getConnection();

            String query = "UPDATE xtra.cart SET quantity = ? WHERE cartId = ? AND productid= ?";
            ps = con.prepareStatement(query);

            ps.setInt(1, quantity);
            ps.setInt(2, cartId);
            ps.setInt(3, productiId);

            rowsAffected = ps.executeUpdate();


        } catch (SQLException e){
            System.out.println("An error occured adding an item to your cart");
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
                System.out.println("An error occurred when shutting down the updateCartQuantity method: " + e.getMessage());
            }
        }
        return rowsAffected > 0;
    }

    @Override
    public void checkoutCart(int userId){
        Connection con = null;
        PreparedStatement ps = null;
        PreparedStatement ps2 = null;
        PreparedStatement ps3 = null;
        ResultSet rs = null;

        try{
            con = this.getConnection();

            String deleteQuery = "DELETE FROM xtra.cart WHERE userid = ?";
            ps = con.prepareStatement(deleteQuery);
            ps.setInt(1, userId);

            String InsertQuery = "INSERT INTO xtra.products_users (userid, productid, quantity,  orderDate) VALUES (?, ?, ?, NOW())";
            ps2 = con.prepareStatement(InsertQuery);


            String getCartInfoQuery = "SELECT productid, quantity from xtra.cart WHERE userid = ?";
            ps3.setInt(1, userId);
            ps3 = con.prepareStatement(getCartInfoQuery);

            rs = ps3.executeQuery();

            while(rs.next()){
                int productId = rs.getInt("productid");
                int quantity = rs.getInt("quantity");

                ps2.setInt(1,userId);
                ps2.setInt(2, productId);
                ps2.setInt(3, quantity);
                ps2.executeQuery();
            }

            ps.executeQuery();

        } catch (SQLException e){
            System.out.println("An error occured adding an item to your cart");
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

    }

}
