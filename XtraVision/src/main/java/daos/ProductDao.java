package daos;

import business.*;
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

    public Product getProductById(int productId) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        Product p = null;

        try {
            con = this.getConnection();

            String query = "SELECT * FROM products where productid = ?";
            ps = con.prepareStatement(query);
            ps.setInt(1, productId);

            rs = ps.executeQuery();
            if (rs.next()) {
                int productID = rs.getInt("productid");
                String name = rs.getString("name");
                String description = rs.getString("description");
                String genre = rs.getString("genre");
                String studio = rs.getString("studio");
                LocalDate releaseDate = rs.getDate("releasedate").toLocalDate();
                double price = rs.getDouble("price");
                int quantity = rs.getInt("quantity");


                p = new Product(productID, name, description, genre, studio, releaseDate, price, quantity);

            }

        } catch (SQLException e) {
            System.out.println("An error occurred when requesting information on products by ID");
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
                System.out.println("An error occurred when shutting down the getProductById() method: " + e.getMessage());
            }
            return p;
        }
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

    private Movie extractMovie(ResultSet resultSet) throws SQLException {
        int movieId = resultSet.getInt("movieid");
        String name = resultSet.getString("name");
        String description = resultSet.getString("description");
        String genre = resultSet.getString("genre");
        String studio = resultSet.getString("studio");
        LocalDate releaseDate = resultSet.getDate("releasedate").toLocalDate();
        double price = resultSet.getDouble("price");
        int quantity = resultSet.getInt("quantity");
        String director = resultSet.getString("director");
        String format = resultSet.getString("format");
        String runtime = resultSet.getString("runtime");
        String movieRating = resultSet.getString("movierating");

        return new Movie(movieId, name, description, genre, director, studio, format, releaseDate, price, movieRating, runtime, quantity);
    }

    private Tv extractTvShow(ResultSet resultSet) throws SQLException {
        int tvId = resultSet.getInt("tvid");
        String name = resultSet.getString("name");
        String description = resultSet.getString("description");
        String genre = resultSet.getString("genre");
        String studio = resultSet.getString("studio");
        LocalDate releaseDate = resultSet.getDate("releasedate").toLocalDate();
        double price = resultSet.getDouble("price");
        int quantity = resultSet.getInt("quantity");
        String showrunner = resultSet.getString("showrunner");
        String format = resultSet.getString("format");
        int numberOfSeasons = resultSet.getInt("noofseasons");
        int numberOfEpisodes = resultSet.getInt("noofepisodes");
        String runtime = resultSet.getString("runtime");
        String tvRating = resultSet.getString("tvrating");

        return new Tv(tvId, name, description, genre, studio, releaseDate, price, quantity, showrunner, format, numberOfSeasons, numberOfEpisodes, runtime, tvRating);
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

    public List<Product> getMovieProducts() {
        List<Product> movieProducts = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM products INNER JOIN movies ON products.movieid = movies.movieid");
             ResultSet resultSet = preparedStatement.executeQuery()) {

            while (resultSet.next()) {
                movieProducts.add(extractMovie(resultSet));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return movieProducts;
    }

    public List<Product> getTvShowProducts() {
        List<Product> tvShowProducts = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM products INNER JOIN tvshows ON products.tvid = tvshows.tvid");
             ResultSet resultSet = preparedStatement.executeQuery()) {

            while (resultSet.next()) {
                tvShowProducts.add(extractTvShow(resultSet));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return tvShowProducts;
    }

    public boolean deleteProduct(int productId) {
        int rowsAffected = -1;
        String query = "DELETE FROM products WHERE productid = ?";

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setInt(1, productId);

            rowsAffected = ps.executeUpdate();

        } catch (SQLException e) {
            System.out.println("Unable to delete product: " +e.getMessage());
        }
        return rowsAffected > 0;
    }


}
