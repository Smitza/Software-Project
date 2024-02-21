package commands;

import business.User;
import daos.UserDao;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

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
        String password = request.getParameter("password");

        if(username != null && password != null && !username.isEmpty() && !password.isEmpty()){
            UserDao userDao = new UserDao("xtra");
            User user = userDao.getUserbyUserPass(username,password);
            if(user != null){
                //User is now logged in
                session.setAttribute("loggedInUser", user);
                forwardToJsp = "index.jsp";
            } else {
                //No user with specified credentials
                String errorMessage = "No user exists for this username/password combination. Please try again.";
                session.setAttribute("errorMessage", errorMessage);
                forwardToJsp = "error.jsp";
            }
        } else {
            String errorMessage = "One or more fields were missing. Please try again";
            session.setAttribute("errorMessage", errorMessage);
            forwardToJsp = "error.jsp";
        }
        return forwardToJsp;
    }
}