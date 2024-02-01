package commands;

import business.User;
import daos.UserDao;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class LoginCommand implements Command{

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
        if(username != null && password != null && !username.isEmpty() && !password.isEmpty()){
            UserDao userDao = new UserDao("user_database");
            User user = userDao.findUserByUsernamePassword(username, password);
            if(user != null){
                session.setAttribute("loggedInUser", user);
                destination = "index.jsp";
            }else{
                String errorMessage = "No user found.";
                session.setAttribute("errorMessage", errorMessage);
                destination = "error.jsp";
            }
        }else{
            String errorMessage = "One or more fields are missing please try again";
            session.setAttribute("errorMessage", errorMessage);
            destination = "error.jsp";
        }
        return destination;
    }
}
