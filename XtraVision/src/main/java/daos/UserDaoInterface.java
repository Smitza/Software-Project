package daos;
import business.BillingInformation;
import business.User;
import exceptions.DaoException;

import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;

public interface UserDaoInterface {


    /**
     *
     * Adds a user into the system
     *
     * @param username
     * @param email
     * @param password
     * @param phone
     * @param name
     * @return
     * @throws DaoException
     */
    public boolean addUser(String username, String email, String password, String phone, String name, int membership, int isAdmin, int isDeliverer) throws DaoException;

    /**
     * Gets all users
     * @return an array list of all users
     * @throws DaoException
     */
    public ArrayList<User> getAllUsers() throws DaoException;

    /**
     * Gets a users by their username
     * @param username the username of the user
     * @param password the password of the user
     * @return An array list of information about the user
     * @throws DaoException
     */
    public User getUserbyUserPass(String username, String password) throws DaoException;


    /**
     * Gets a user by their ID
     * @param id the ID of the user
     * @return Information of the user
     * @throws DaoException
     */
    public User getUserById(int id) throws DaoException;

    public int SetUserDetails(String username, String email, String phone, String name, String password, int id) throws DaoException;

    public void updateUser(User u) throws SQLException;

    public boolean addBillingInformation(BillingInformation bi) throws DaoException;

    public BillingInformation getUserBillingInfo(int id) throws DaoException;

}
