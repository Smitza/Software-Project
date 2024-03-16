import business.Movie;
import daos.MovieDao;
import daos.TvDao;
import exceptions.DaoException;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;

import java.util.ArrayList;

import static org.junit.jupiter.api.Assertions.*;

public class MovieDaoTests {

    private static MovieDao movieDao;

    @BeforeAll
    public static void setUp() {
        movieDao = new MovieDao("xtra");

    }

    @Test
    public void testGetAllMovies() {
        try {
            ArrayList<Movie> tvShows = movieDao.getAllMovies();
            assertNotNull(tvShows);
            assertFalse(tvShows.isEmpty());
        } catch (DaoException e) {
            fail("Exception thrown: " + e.getMessage());
        }
    }

}
