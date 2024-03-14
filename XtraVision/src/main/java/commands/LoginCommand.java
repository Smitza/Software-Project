package commands;

import business.User;
import daos.UserDao;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.mindrot.jbcrypt.BCrypt;

public class LoginCommand implements Command {

    private HttpServletRequest request;
    private HttpServletResponse response;

    public LoginCommand(HttpServletRequest request, HttpServletResponse response) {
        this.request = request;
        this.response = response;
    }

    @Override
    public String execute() {
        String destination = "index.jsp";
        HttpSession session = request.getSession(true);
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        if (username != null && password != null && !username.isEmpty() && !password.isEmpty()) {
            UserDao userDao = new UserDao("xtra");

            // Get the hashed password from the database using the username
            String storedHash = userDao.getHashedPasswordByUsername(username);

            if (storedHash != null && BCrypt.checkpw(password, storedHash)) {
                // If the password is correct, get the user details without the password
                User user = userDao.getUserByUsername(username);

                if (user != null) {
                    session.setAttribute("loggedInUser", user);
                    destination = "index.jsp";
                } else {
                    String errorMessage = "Incorrect username or password.";
                    session.setAttribute("loginErrorMessage", errorMessage);
                    destination = "login.jsp";
                }
            } else {
                String errorMessage = "One or more fields are missing please try again";
                session.setAttribute("loginErrorMessage", errorMessage);
                destination = "login.jsp";
            }
        }
        return destination;

    }
}
