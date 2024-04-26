package commands;

import business.User;
import daos.CartDao;
import daos.UserDao;
import exceptions.DaoException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class CheckoutCommand implements Command {

    private HttpServletRequest request;

    private HttpServletResponse response;

    public CheckoutCommand(HttpServletRequest request, HttpServletResponse response){
        this.request = request;
        this.response = response;
    }

    @Override
    public String execute(){
        HttpSession session = request.getSession(true);

        CartDao cartDao = new CartDao("xtra");
        UserDao userdao = new UserDao("xtra");
        User loggedUser = (User) request.getSession().getAttribute("loggedInUser");

        User u = userdao.getUserById(loggedUser.getId());

        String forwardToJsp = "index.jsp";
        int userId = loggedUser.getId();

        if(u != null){
            try{
                if(cartDao.checkoutCart(userId) == 1) {
                    forwardToJsp = "Order.jsp";
                } else {
                    forwardToJsp = "error.jsp";
                }
            } catch (DaoException e) {
                forwardToJsp = "error.jsp";
            }
        }

        return forwardToJsp;
    }

}
