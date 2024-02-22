package daos;

import business.Game;
import exceptions.DaoException;

import java.sql.*;
import java.util.ArrayList;

public class GameDao extends Dao implements GameDaoInterface {


    public GameDao(String dbName) {
        super(dbName);
    }

    @Override
    public boolean addGame(Game g) throws DaoException {
        int rowsAffected = -1;
        String query = "INSERT INTO games(gameid, publisher, platform, gameRating) VALUES ( ?, ?, ?, ?)";

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setInt(1, g.getProductId());
            ps.setString(2, g.getPublisher());
            ps.setString(3, g.getPlatform());
            ps.setString(4, g.getGameRating());

            rowsAffected = ps.executeUpdate();

        } catch (SQLException e) {
            throw new DaoException("Error adding game with ID " + g.getProductId() + ";: " + e.getMessage(), e);
        }
        return rowsAffected > 0;
    }

    public ArrayList<Game> getAllGames() throws DaoException {
        ArrayList<Game> games = new ArrayList<>();
        String query = "SELECT * FROM games";

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                int productid = rs.getInt("gameid");
                String publisher = rs.getString("Publisher");
                String platform = rs.getString("Platform");
                String gameRating = rs.getString("gameRating");


                Game game = new Game(productid, publisher, platform, gameRating);
            }
        } catch (SQLException e) {
            throw new DaoException("Error listing all games: " + e.getMessage(), e);
        }

        return games;
    }
}



