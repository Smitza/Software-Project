package daos;
import business.User;
import exceptions.DaoException;

import java.util.ArrayList;

public interface UserDaoInterface {

    /**
     * Adds a user to the database
     * @param u all the information of the user
     * @return true or false depending on if the user was created or not
     * @throws DaoException
     */
    public boolean addUser(String username, String email, String password, String phone, String name, int membership, int isAdmin) throws DaoException;

    public boolean deleteUserById(int id) throws DaoException;

    /**
     * Gets a users by their username
     * @param name the username of the user
     * @return An array list of information about the user
     * @throws DaoException
     */
    public ArrayList<User> getUser(String name, String password) throws DaoException;

    /**
     * Gets all users
     * @return an array list of all users
     * @throws DaoException
     */
    public ArrayList<User> getAllUsers() throws DaoException;

    /**
     * Gets a users by their ID
     * @param id the ID of the user
     * @return Information of the user
     * @throws DaoException
     */
    public ArrayList<User> getUserById(int id) throws DaoException;

    /**
     * Get a user by their phone number
     * @param phone the phone number of the user
     * @return the phone number of the user
     * @throws DaoException
     */
    public ArrayList<User> getUserByPhone(String phone) throws DaoException;

}
