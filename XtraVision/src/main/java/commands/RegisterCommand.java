package commands;

import business.User;
import daos.UserDao;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.mindrot.jbcrypt.BCrypt;

public class RegisterCommand implements Command {

    private HttpServletRequest request;
    private HttpServletResponse response;

    public RegisterCommand(HttpServletRequest request, HttpServletResponse response) {
        this.request = request;
        this.response = response;
    }

    @Override
    public String execute() {
        String forwardToJsp = "index.jsp";
        HttpSession session = request.getSession(true);
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String phone = request.getParameter("phone");
        String name = request.getParameter("name");
        int membership = 1; //Default to free
        int isAdmin = 0; //Default to non admin

        if (username != null && email != null && password != null && phone != null && name != null && !username.isEmpty() && !email.isEmpty() && !password.isEmpty() && !phone.isEmpty() && !name.isEmpty()) {
            // Hash the password
            String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());

            UserDao userDao = new UserDao("xtra");
            // Make sure to pass the hashedPassword instead of password
            boolean added = userDao.addUser(username, email, hashedPassword, phone, name, membership, isAdmin);

            if(!added){
                forwardToJsp = "register.jsp";
                String error = "Account creation failed, Please try again";
                session.setAttribute("registerErrorMessage", error);
            } else {
                //Gets new user we created
                User newUser = userDao.getUserByUsername(username);
                // Set the fetched user as the loggedInUser
                session.setAttribute("loggedInUser", newUser);

                forwardToJsp = "index.jsp";
            }
        } else {
            String errorMessage = "One or more fields were missing. Please try again";
            session.setAttribute("registerErrorMessage", errorMessage);
            forwardToJsp = "error.jsp";
        }
        return forwardToJsp;
    }
}