package commands;

import business.User;
import daos.UserDao;
import daos.UserDaoInterface;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class UpgradeCommand implements Command {

    private HttpServletRequest request;
    private HttpServletResponse response;
    public UpgradeCommand(HttpServletRequest request, HttpServletResponse response) {
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
            u.setAdmin(1);
            userDao.updateUser(u); // Update user in the database
        }
        return destination;
    }
}
