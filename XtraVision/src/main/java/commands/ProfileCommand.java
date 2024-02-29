package commands;

import business.User;
import daos.UserDao;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.ServletException;

import java.io.IOException;

public class ProfileCommand implements Command {

    private HttpServletRequest request;
    private HttpServletResponse response;

    public ProfileCommand(HttpServletRequest request, HttpServletResponse response) {
        this.request = request;
        this.response = response;
    }

    @Override
    public String execute(){
        String destination = "index.jsp";
        HttpSession session = request.getSession(true);
        String userId = request.getParameter("userId");
        if (userId != null && !userId.isEmpty()) {
            try {
                int Id = Integer.parseInt(userId);
                UserDao userService = new UserDao("xtra");
                User user = userService.getUserById(Id);
                if (user != null) {
                    session.setAttribute("userId", user);
                    destination = "profile.jsp";
                } else {
                    destination = "error.jsp";
                    String error = "No user session detected.";
                    session.setAttribute("errorMessage", error);
                }
            } catch (NumberFormatException e) {
                destination = "error.jsp";
                String error = "No user ID found!.";
                session.setAttribute("errorMessage", error);
            }
        } else {

            destination = "error.jsp";
        }
        return destination;
    }
}