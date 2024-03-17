package commands;

import business.User;
import daos.CartDao;
import exceptions.DaoException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class AddCartCommand  implements Command {
    private HttpServletRequest request;
    private HttpServletResponse response;
    private String errorMessage;

    public AddCartCommand(HttpServletRequest request, HttpServletResponse response) {
        this.request = request;
        this.response = response;
    }
    @Override
    public String execute() {
        HttpSession session = request.getSession(true);
        int gameId = Integer.parseInt(request.getParameter("gameId"));

        User loggedInUser = (User) request.getSession().getAttribute("loggedInUser");

        if (loggedInUser == null) {
            String errorMessage = "Please login to purchase products";
            session.setAttribute("loginErrorMessage", errorMessage);
            return "login.jsp";
        }

        int userId = loggedInUser.getId();

        CartDao cartDao = new CartDao("xtra");
        try {
            cartDao.addProductToCart(userId, gameId, 1);
            return "gameslist.jsp";
        } catch (DaoException e) {
            String errorMessage = e.getMessage();
            session.setAttribute("errorMessage", errorMessage);
            return "error.jsp";
        }
    }
}
