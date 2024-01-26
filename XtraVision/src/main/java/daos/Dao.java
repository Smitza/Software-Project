package daos;

import exceptions.DaoException;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Dao {

    private String dbName;

    public Dao(String dbName){
        this.dbName = dbName;
    }

    /**
     * Establish a database connection.
     *
     * @return A database connection object.
     * @throws DaoException If a data access error occurs.
     */

    public Connection getConnection() throws DaoException {

        String driver = "com.mysql.cj.jdbc.Driver";
        String url = "jdbc:mysql://localhost:3306/" + dbName;
        String username = "root";
        String password = "";
        Connection con = null;
        try {
            Class.forName(driver);
            con = DriverManager.getConnection(url, username, password);
        } catch (ClassNotFoundException ex1) {
            System.out.println("Failed to find driver class " + ex1.getMessage());
            System.exit(1);
        } catch (SQLException ex2) {
            System.out.println("Connection failed " + ex2.getMessage());
            System.exit(2);
        }
        return con;
    }

    /**
     * Free and close the database connection.
     *
     * @param con The database connection to be closed.
     * @throws DaoException If an error occurs while closing the connection.
     */

    public void freeConnection(Connection con) throws DaoException {
        try {
            if (con != null) {
                con.close();
                con = null;
            }
        } catch (SQLException e) {
            System.out.println("Failed to free connection: " + e.getMessage());
            System.exit(1);
        }
    }
}
