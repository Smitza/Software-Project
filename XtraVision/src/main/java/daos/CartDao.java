package daos;

import business.Product;
import exceptions.DaoException;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CartDao extends Dao implements CartDaoInterface {

    public CartDao(String dbName) {
        super(dbName);
    }

    @Override
    public boolean addProductToCart(int userId, int productId) throws DaoException {
        Connection con = null;
        PreparedStatement ps = null;
        int rowsAffected = 0;

        try {
            con = this.getConnection();

            String query = "INSERT INTO cart (userid, productid) VALUES (?, ?)";
            ps = con.prepareStatement(query);

            ps.setInt(1, userId);
            ps.setInt(2, productId);

            rowsAffected = ps.executeUpdate();

        } catch (SQLException e) {
            throw new DaoException("An error occurred adding an item to your cart", e);
        } finally {
            closeResources(con, ps, null);
        }
        return rowsAffected > 0;
    }

    @Override
    public List<Product> getCartByUserId(int userId) throws DaoException {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<Product> cartProducts = new ArrayList<>();

        try {
            con = this.getConnection();

            String query = "SELECT productid, quantity FROM cart WHERE userid = ?";
            ps = con.prepareStatement(query);
            ps.setInt(1, userId);

            rs = ps.executeQuery();

            while (rs.next()) {
                int productId = rs.getInt("productid");
                int quantity = rs.getInt("quantity");
                Product p = new Product(productId, quantity);
                cartProducts.add(p);
            }

        } catch (SQLException e) {
            throw new DaoException("Error occurred requesting Cart. Please try again later", e);
        } finally {
            closeResources(con, ps, rs);
        }
        return cartProducts;
    }

    @Override
    public boolean updateCartQuantity(int cartId, int quantity, int productId) throws DaoException {
        Connection con = null;
        PreparedStatement ps = null;
        int rowsAffected = 0;

        try {
            con = this.getConnection();

            String query = "UPDATE cart SET quantity = ? WHERE cartid = ? AND productid = ?";
            ps = con.prepareStatement(query);

            ps.setInt(1, quantity);
            ps.setInt(2, cartId);
            ps.setInt(3, productId);

            rowsAffected = ps.executeUpdate();

        } catch (SQLException e) {
            throw new DaoException("An error occurred updating cart quantity", e);
        } finally {
            closeResources(con, ps, null);
        }
        return rowsAffected > 0;
    }

    @Override
    public void checkoutCart(int userId) throws DaoException {
        Connection con = null;
        PreparedStatement psDelete = null;
        PreparedStatement psInsert = null;
        PreparedStatement psSelect = null;
        ResultSet rs = null;

        try {
            con = this.getConnection();

            String deleteQuery = "DELETE FROM cart WHERE userid = ?";
            psDelete = con.prepareStatement(deleteQuery);
            psDelete.setInt(1, userId);
            psDelete.executeUpdate();

            String insertQuery = "INSERT INTO products_users (userid, productid, quantity, orderdate) " +
                    "SELECT ?, productid, quantity, NOW() FROM cart WHERE userid = ?";
            psInsert = con.prepareStatement(insertQuery);
            psInsert.setInt(1, userId);
            psInsert.setInt(2, userId);
            psInsert.executeUpdate();

        } catch (SQLException e) {
            throw new DaoException("An error occurred during checkout", e);
        } finally {
            closeResources(con, psDelete, null);
            closeResources(null, psInsert, null);
            closeResources(null, psSelect, rs);
        }
    }

    private void closeResources(Connection con, PreparedStatement ps, ResultSet rs) throws DaoException {
        try {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        } catch (SQLException e) {
            throw new DaoException("Error occurred while closing resources", e);
        }
    }
}
