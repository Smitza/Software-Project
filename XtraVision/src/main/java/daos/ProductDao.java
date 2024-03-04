package daos;

import business.Game;
import business.Product;
import exceptions.DaoException;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class ProductDao extends Dao implements ProductDaoInterface {

    public ProductDao(String dbName) {
        super(dbName);
    }

    public boolean addProduct(Product p) throws DaoException {
        int rowsAffected = -1;
        String query = "INSERT INTO products(productid, name, description, genre, studio, releaseDate, price, quantity) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

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
            throw new DaoException("Error adding product with ID " + p.getProductId() + ": " + e.getMessage(), e);
        }
        return rowsAffected > 0;
    }


    private Game extractGame(ResultSet resultSet) throws SQLException {
        int gameId = resultSet.getInt("gameid");
        String name = resultSet.getString("name");
        String description = resultSet.getString("description");
        String genre = resultSet.getString("genre");
        String studio = resultSet.getString("studio");
        LocalDate releaseDate = resultSet.getDate("releasedate").toLocalDate();
        double price = resultSet.getDouble("price");
        int quantity = resultSet.getInt("quantity");
        String publisher = resultSet.getString("publisher");
        String platform = resultSet.getString("platform");
        String gameRating = resultSet.getString("gamerating");

        return new Game(gameId, name, description, genre, studio, publisher, platform, releaseDate, price, quantity, gameRating);
    }

    public List<Product> getGameProducts() {
        List<Product> gameProducts = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM products INNER JOIN games ON products.gameid = games.gameid");
             ResultSet resultSet = preparedStatement.executeQuery()) {

            while (resultSet.next()) {
                gameProducts.add(extractGame(resultSet));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return gameProducts;
    }


}
