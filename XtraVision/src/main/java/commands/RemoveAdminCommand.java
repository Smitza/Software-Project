package commands;

import business.User;
import daos.UserDao;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class RemoveAdminCommand implements Command {

    private HttpServletRequest request;
    private HttpServletResponse response;

    public RemoveAdminCommand(HttpServletRequest request, HttpServletResponse response) {
        this.request = request;
        this.response = response;
    }

    @Override
    public String execute() {
        String destination = "admincontrol.jsp";
        int userId = Integer.parseInt(request.getParameter("userId"));
        UserDao userDao = new UserDao("xtra");
        User u = userDao.getUserById(userId);
        if (u!= null) {
            u.setAdmin(0);
            userDao.updateUser(u); // Update user in the database
        }
        return destination;
    }
}
