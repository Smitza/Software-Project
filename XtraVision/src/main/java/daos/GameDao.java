package daos;

import business.Game;
import exceptions.DaoException;

import java.sql.*;

public class GameDao extends Dao implements GameDaoInterface {


    public GameDao(String dbName) {
        super(dbName);
    }

    public boolean addGame(Game g) throws DaoException {
        int rowsAffected = -1;
        String query = "INSERT INTO games(gameid, name, description, genre, studio, publisher, platform, releaseDate, price, gameRating) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement(query)){

            ps.setInt(1, g.getId());
            ps.setString(2, g.getName());
            ps.setString(3, g.getDescription());
            ps.setString(4, g.getGenre());
            ps.setString(5, g.getStudio());
            ps.setString(6, g.getPublisher());
            ps.setString(7, g.getPlatform().name());
            ps.setDate(8, Date.valueOf(g.getReleaseDate()));
            ps.setDouble(9, g.getPrice());
            ps.setString(10, g.getGameRating().name());

            rowsAffected = ps.executeUpdate();

        } catch (SQLException e) {
            // Optionally log the exception here
            throw new DaoException("Error adding game with ID " + g.getId() + ";: " + e.getMessage(), e);
        }
        return rowsAffected > 0;
    }
}
