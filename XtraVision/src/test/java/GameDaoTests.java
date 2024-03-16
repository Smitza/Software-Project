import business.Game;
import daos.GameDao;
import exceptions.DaoException;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;

import java.util.ArrayList;

import static org.junit.jupiter.api.Assertions.*;

public class GameDaoTests {

    private static GameDao gameDao;

    @BeforeAll
    public static void setUp() {
        gameDao = new GameDao("xtra");

    }

    @Test
    public void testGetAllGames() {
        try {
            ArrayList<Game> tvShows = gameDao.getAllGames();
            assertNotNull(tvShows);
            assertFalse(tvShows.isEmpty());
        } catch (DaoException e) {
            fail("Exception thrown: " + e.getMessage());
        }
    }

}
