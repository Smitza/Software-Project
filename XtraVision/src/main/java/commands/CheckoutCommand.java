package commands;

import business.User;
import daos.CartDao;
import daos.PaymentDao;
import daos.UserDao;
import exceptions.DaoException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class CheckoutCommand implements Command {

    private HttpServletRequest request;
    private HttpServletResponse response;

    public CheckoutCommand(HttpServletRequest request, HttpServletResponse response){
        this.request = request;
        this.response = response;
    }

    @Override
    public String execute() {
        HttpSession session = request.getSession(true);

        CartDao cartDao = new CartDao("xtra");
        UserDao userDao = new UserDao("xtra");
        PaymentDao paymentDao = new PaymentDao("xtra");

        User loggedUser = (User) request.getSession().getAttribute("loggedInUser");
        int userId = loggedUser.getId();

        String forwardToJsp = "index.jsp";

        try {
            // Checkout the cart
            if (cartDao.checkoutCart(userId) == 1) {
                // Get total amount from the cart
                double totalPrice = Double.parseDouble(request.getParameter("totalPrice"));

                // Insert payment record
                LocalDateTime now = LocalDateTime.now();
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                String paymentDate = now.format(formatter);
                String paymentMethod = "Credit Card";
                paymentDao.addPayment(userId, totalPrice, paymentDate, paymentMethod);

                forwardToJsp = "Order.jsp";
            } else {
                forwardToJsp = "error.jsp";
            }
        } catch (DaoException e) {
            forwardToJsp = "error.jsp";
        }

        return forwardToJsp;
    }
}