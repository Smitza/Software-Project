package commands;

import business.User;
import daos.UserDao;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class SubscribeCommand implements Command {

    private HttpServletRequest request;
    private HttpServletResponse response;
    public SubscribeCommand(HttpServletRequest request, HttpServletResponse response) {
        String destination = "subscribe.jsp";
        this.request = request;
        this.response = response;
    }

    @Override
    public String execute() {
        HttpSession session = request.getSession(true);
        String destination = "subscribe.jsp";
        String subscription =request.getParameter("subscription");
        User loggedInUser = (User) request.getSession().getAttribute("loggedInUser");
        int userId = loggedInUser.getId();
        UserDao userDao = new UserDao("xtra");
        User u = userDao.getUserById(userId);
        if(subscription.equals("gold")) {
            u.setMembership(3);
            userDao.addMembership(u);
        } else if (subscription.equals("silver")) {
            u.setMembership(2);
            userDao.addMembership(u);
        } else {
            destination = "error.jsp";
            String error = "Unexpected membership type";
            session.setAttribute("errorMessage", error);
        }
        return destination;
    }
}
