package daos;

import business.Movie;
import business.Tv;
import exceptions.DaoException;

import java.util.ArrayList;

public interface TvDaoInterface {
    public ArrayList<Tv> getAllTvShows() throws DaoException;
}
