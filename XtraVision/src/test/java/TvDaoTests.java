import business.Tv;
import daos.TvDao;
import exceptions.DaoException;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;

import java.util.ArrayList;

import static org.junit.jupiter.api.Assertions.*;

public class TvDaoTests {

    private static TvDao tvDao;

    @BeforeAll
    public static void setUp() {
        tvDao = new TvDao("xtra");

    }

    @Test
    public void testGetAllTvShows() {
        try {
            ArrayList<Tv> tvShows = tvDao.getAllTvShows();
            assertNotNull(tvShows);
            assertFalse(tvShows.isEmpty());
        } catch (DaoException e) {
            fail("Exception thrown: " + e.getMessage());
        }
    }
}