package commands;

import business.User;
import daos.DeliveryDao;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class DeliveryCommand implements Command{

    private HttpServletRequest request;
    private HttpServletResponse response;

    public DeliveryCommand(HttpServletRequest request, HttpServletResponse response) {
        this.request = request;
        this.response = response;
    }

    @Override
    public String execute(){
        String destination = "index.jsp";
        HttpSession session = request.getSession(true);

        String delivery = request.getParameter("delivery");

        DeliveryDao d= new DeliveryDao("xtra");

        User loggedInUser = (User) request.getSession().getAttribute("loggedInUser");

        int userId = loggedInUser.getId();

        if(userId != 0){
            d.addDelivery(userId, "Processing");
        } else {
            destination = "error.jsp";
            String error = "Error processing your order. You have not been charged";
            session.setAttribute("errorMessage", error);
        }

        return destination;
    }

}
