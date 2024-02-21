package daos;

import business.Movie;
import exceptions.DaoException;

import java.util.ArrayList;

public interface MovieDaoInterface {

    public ArrayList<Movie> getAllMovies() throws DaoException;
}
