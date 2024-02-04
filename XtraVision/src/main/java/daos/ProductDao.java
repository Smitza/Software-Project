package daos;

import business.Product;
import exceptions.DaoException;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ProductDao extends Dao implements ProductDaoInterface {

    public ProductDao(String dbName) {
        super(dbName);
    }

    public boolean addProduct(Product p) throws DaoException {
        int rowsAffected = -1;
        String query = "INSERT INTO products(productid, name, description, genre, studio,  releaseDate, price, quantity) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setInt(1, p.getProductId());
            ps.setString(2, p.getName());
            ps.setString(3, p.getDescription());
            ps.setString(4, p.getGenre());
            ps.setString(5, p.getStudio());
            ps.setDate(6, Date.valueOf(p.getReleaseDate()));
            ps.setDouble(7, p.getPrice());
            ps.setInt(8, p.getQuantity());

            rowsAffected = ps.executeUpdate();

        } catch (SQLException e) {
            throw new DaoException("Error adding game with ID " + p.getProductId() + ";: " + e.getMessage(), e);
        }
        return rowsAffected > 0;
    }
}
