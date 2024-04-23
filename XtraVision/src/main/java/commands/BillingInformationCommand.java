package commands;

import business.BillingInformation;
import business.User;
import daos.Dao;
import daos.UserDao;
import exceptions.DaoException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.sql.Date;
import java.time.LocalDate;

public class BillingInformationCommand implements Command {

    private HttpServletRequest request;

    private HttpServletResponse response;

    public BillingInformationCommand(HttpServletRequest request, HttpServletResponse response){
        this.request = request;
        this.response = response;
    }

    @Override
    public String execute(){
        HttpSession session = request.getSession(true);
        UserDao userdao = new UserDao("xtra");
        User loggedUser = (User) request.getSession().getAttribute("loggedInUser");

        User u = userdao.getUserById(loggedUser.getId());


        String forwardToJsp = "index.jsp";
        int userId = loggedUser.getId();
        String addressline1 = request.getParameter("address1");
        String addressline2 = request.getParameter("address2");
        int cardNumber = Integer.parseInt(request.getParameter("cardNumber"));
        String cardHolder = request.getParameter("cardHolder");
        String expiry = request.getParameter("expiry");
        int secNumb =  Integer.parseInt(request.getParameter("secNumb"));

        BillingInformation bi = new BillingInformation(userId, addressline1, addressline2, cardHolder, cardNumber, expiry, secNumb);

        if (u == null) {
            String errorMessage = "No session detected. Please try again";
            session.setAttribute("loginErrorMessage", errorMessage);
            return "login.jsp";
        }

        boolean added = userdao.addBillingInformation(bi);

        if(!added){
            forwardToJsp = "error.jsp";
            String errorMessage = "Failed to store billing informaiton. please try again later ";
            session.setAttribute("BillinginfoErrorMessage", errorMessage);
        } else {
            forwardToJsp = "profile.jsp";
        }
       return forwardToJsp;
    }

}
