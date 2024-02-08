package daos;

import business.Game;
import business.User;
import exceptions.DaoException;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class GameDao extends Dao implements GameDaoInterface {


    public GameDao(String dbName) {
        super(dbName);
    }

    @Override
    public boolean addGame(Game g) throws DaoException {
        int rowsAffected = -1;
        String query = "INSERT INTO games(gameid, publisher, platform, gameRating) VALUES ( ?, ?, ?, ?)";

        try (Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement(query)){

            ps.setInt(1, g.getProductId());
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
            throw new DaoException("Error adding game with ID " + g.getProductId() + ";: " + e.getMessage(), e);
        }
        return rowsAffected > 0;
    }
}
