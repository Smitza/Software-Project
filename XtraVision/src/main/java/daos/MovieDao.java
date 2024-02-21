package daos;

import business.Game;
import business.Movie;
import exceptions.DaoException;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import static java.sql.DriverManager.getConnection;

public class MovieDao extends Dao implements MovieDaoInterface {

    public MovieDao(String dbName) {
        super(dbName);
    }

    public ArrayList<Movie> getAllMovies() throws DaoException {
        ArrayList<Movie> movies = new ArrayList<>();
        String query = "SELECT * FROM movies";

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                int productid = rs.getInt("movieid");
                String director = rs.getString("director");
                String format = rs.getString("format");
                String runtime = rs.getString("runtime");
                String movierating = rs.getString("movierating");

                Movie movie = new Movie(productid, director, format, runtime,movierating);
                movies.add(movie);
            }
        } catch (SQLException e) {
            throw new DaoException("Error listing all movies: " + e.getMessage(), e);
        }

        return movies;
    }
}
