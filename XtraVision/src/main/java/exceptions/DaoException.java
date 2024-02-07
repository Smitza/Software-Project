package exceptions;

import java.sql.SQLException;

/**
 * Represents an exception specific to DAO operations.
 */
public class DaoException extends SQLException {

    /**
     * Default constructor.
     */
    public DaoException() {
        super();
    }

    /**
     * Constructor with a message.
     *
     * @param message Error message.
     */
    public DaoException(String message) {
        super(message);
    }

    /**
     * Constructor with a message and cause.
     *
     * @param message Error message.
     * @param cause   Cause of the exception.
     */
    public DaoException(String message, Throwable cause) {
        super(message, cause);
    }

    /**
     * Constructor with a cause.
     *
     * @param cause Cause of the exception.
     */
    public DaoException(Throwable cause) {
        super(cause);
    }
}
