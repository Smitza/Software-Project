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
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String phone = request.getParameter("phone");
        String name = request.getParameter("name");
        int membership = request.getIntHeader("membership");
        int isAdmin = request.getIntHeader("isAdmin");

        if(username != null && email != null && password != null && phone != null && name != null && !username.isEmpty() && !email.isEmpty() && !password.isEmpty() && !phone.isEmpty() && !name.isEmpty()){
            UserDao userDao = new UserDao("xtra");
            boolean added = userDao.addUser(username, email, password, phone, name, membership, isAdmin);
            if(added == false){
                forwardToJsp = "error.jsp";
                String error = "Account creation failed, Please try again";
                session.setAttribute("errorMessage", error);
            } else {
                forwardToJsp = "index.jsp";
                session.setAttribute("username", username);
                User u = new User(username, email, password, phone, name);
                session.setAttribute("loggedInUser", u);
                forwardToJsp = "index.jsp";
            }
        } else {
            String errorMessage = "One or more fields were missing. Please try again";
            session.setAttribute("errorMessage", errorMessage);
            forwardToJsp = "error.jsp";
        }
        return forwardToJsp;
    }
}