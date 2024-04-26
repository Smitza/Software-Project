package daos;

import business.Product;
import exceptions.DaoException;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class CartDao extends Dao implements CartDaoInterface {

    public CartDao(String dbName) {
        super(dbName);
    }

    @Override
    public boolean addProductToCart(int userId, int productId, int quantity) throws DaoException {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        int rowsAffected = -1;

        try {
            con = this.getConnection();

            // Check if the product already exists in the cart
            String checkQuery = "SELECT quantity FROM cart WHERE userid = ? AND productid = ?";
            ps = con.prepareStatement(checkQuery);
            ps.setInt(1, userId);
            ps.setInt(2, productId);
            rs = ps.executeQuery();

            if (rs.next()) {
                // If the product already exists, update the quantity
                int existingQuantity = rs.getInt("quantity");
                int newQuantity = existingQuantity + quantity;

                String updateQuery = "UPDATE cart SET quantity = ? WHERE userid = ? AND productid = ?";
                ps = con.prepareStatement(updateQuery);
                ps.setInt(1, newQuantity);
                ps.setInt(2, userId);
                ps.setInt(3, productId);

                rowsAffected = ps.executeUpdate();
            } else {
                // If the product doesn't exist, insert a new record
                String insertQuery = "INSERT INTO cart (userid, productid, quantity) VALUES (?, ?, ?)";
                ps = con.prepareStatement(insertQuery);
                ps.setInt(1, userId);
                ps.setInt(2, productId);
                ps.setInt(3, quantity);

                rowsAffected = ps.executeUpdate();
            }
        } catch (SQLException e) {
            throw new DaoException("An error occurred adding an item to your cart", e);
        } finally {
            closeResources(con, ps, rs);
        }

        return rowsAffected > 0;
    }


    @Override
    public void removeProductFromCart(int userId, int productId) throws DaoException {
        Connection con = null;
        PreparedStatement ps = null;

        try {
            con = this.getConnection();

            String query = "DELETE FROM cart WHERE userid = ? AND productid = ?";
            ps = con.prepareStatement(query);

            ps.setInt(1, userId);
            ps.setInt(2, productId);

            ps.executeUpdate();

        } catch (SQLException e) {
            throw new DaoException("An error occurred removing the product from your cart", e);
        } finally {
            closeResources(con, ps, null);
        }
    }

    @Override
    public List<Product> getCartByUserId(int userId) throws DaoException {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<Product> cartProducts = new ArrayList<>();

        try {
            con = this.getConnection();

            String query = "SELECT p.productid, p.name, p.description, p.genre, p.studio, p.releasedate, p.price, c.quantity " +
                    "FROM cart c INNER JOIN products p ON c.productid = p.productid " +
                    "WHERE c.userid = ?";
            ps = con.prepareStatement(query);
            ps.setInt(1, userId);

            rs = ps.executeQuery();

            while (rs.next()) {
                int productId = rs.getInt("productid");
                String name = rs.getString("name");
                String genre = rs.getString("genre");
                String studio = rs.getString("studio");
                LocalDate releaseDate = rs.getDate("releaseDate").toLocalDate();
                String description = rs.getString("description");
                double price = rs.getDouble("price");
                int quantity = rs.getInt("quantity");
                Product p = new Product(productId, name, description, genre, studio, releaseDate, price, quantity);
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
        int rowsAffected = -1;

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
    public int checkoutCart(int userId) throws DaoException {
        Connection con = null;
        PreparedStatement psDelete = null;
        PreparedStatement psInsert = null;
        PreparedStatement psSelect = null;
        ResultSet rs = null;
        int rowsAffected = -1;

        try {
            con = this.getConnection();

            String insertQuery = "INSERT INTO products_users (userid, productid, quantity, orderdate) SELECT userid, productid, quantity, NOW() FROM cart WHERE userid = ?" ;
            psInsert = con.prepareStatement(insertQuery);
            psInsert.setInt(1, userId);
            psInsert.executeUpdate();

            String deleteQuery = "DELETE FROM cart WHERE userid = ?";
            psDelete = con.prepareStatement(deleteQuery);
            psDelete.setInt(1, userId);
            psDelete.executeUpdate();

            rowsAffected = 1;

        } catch (SQLException e) {
            throw new DaoException("An error occurred during checkout", e);
        } finally {
            closeResources(con, psDelete, null);
            closeResources(null, psInsert, null);
            closeResources(null, psSelect, rs);
        }
        return rowsAffected;
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
