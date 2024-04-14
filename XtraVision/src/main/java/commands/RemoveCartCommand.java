package commands;

import business.User;
import daos.CartDao;
import exceptions.DaoException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class RemoveCartCommand implements Command {

    private HttpServletRequest request;
    private HttpServletResponse response;

    public RemoveCartCommand(HttpServletRequest request, HttpServletResponse response) {
        this.request = request;
        this.response = response;
    }

    @Override
    public String execute() {
        HttpSession session = request.getSession(true);
        int productId = Integer.parseInt(request.getParameter("productId"));

        User loggedInUser = (User) request.getSession().getAttribute("loggedInUser");

        if (loggedInUser == null) {
            String errorMessage = "Please login to remove products from the cart";
            session.setAttribute("loginErrorMessage", errorMessage);
            return "login.jsp";
        }

        int userId = loggedInUser.getId();

        CartDao cartDao = new CartDao("xtra");
        try {
            cartDao.removeProductFromCart(userId, productId);
            return "cart.jsp";
        } catch (DaoException e) {
            String errorMessage = e.getMessage();
            session.setAttribute("errorMessage", errorMessage);
            return "error.jsp";
        }
    }
}
