package commands;

import daos.UserDao;
import business.User;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
public class EditUserCommand implements Command{

    private HttpServletRequest request;
    private HttpServletResponse response;

    public EditUserCommand(HttpServletRequest request, HttpServletResponse response) {
        this.request = request;
        this.response = response;
    }

    @Override
    public String execute(){
        String destination = "index.jsp";
        HttpSession session = request.getSession(true);
        String currentUsername = request.getParameter("currentUsername");
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String name = request.getParameter("name");
        String password = request.getParameter("password");
        if(username != null && !username.isEmpty() && email != null && !email.isEmpty() && phone != null && !phone.isEmpty() && name != null && !name.isEmpty() && password != null && !password.isEmpty()){
            UserDao userDao = new UserDao("xtra");
            User u = userDao.getUserbyUserPass(currentUsername, password);
            if(u == null){
                destination = "error.jsp";
                String error = "No user session detected. Please <a href=\"login.jsp\">login .</a>";
                session.setAttribute("errorMessage", error);
            } else {
                int deetsChanged = userDao.SetUserDetails(username, email, phone, name, password, u.getId());

                if(deetsChanged == -1){
                    destination = "error.jsp";
                    String error = "Incorrect credentials supplied. Please <a href=\"EditUser.jsp\">try again.</a>";
                    session.setAttribute("errorMessage", error);
                } else {
                    destination = "profile.jsp";
                    session.setAttribute("loggedInUser", u);
                }

            }
        }
        return destination;
    }

}
