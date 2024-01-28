package daos;

import business.Game;
import exceptions.DaoException;

public interface GameDaoInterface {

    public boolean addGame(Game g) throws DaoException;
}
