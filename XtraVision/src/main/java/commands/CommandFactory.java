package commands;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class CommandFactory {
    public static Command getCommand(String action, HttpServletRequest request, HttpServletResponse response){
        Command c;
        if(action != null) {
            switch(action){
                //Write link to each command (login, register, rental etc...)
                case "login":
                    c = new LoginCommand(request,response);
                    break;
                case "register":
                    c = new RegisterCommand(request,response);
                    break;
                case "editUser":
                    c = new EditUserCommand(request, response);
                    break;
                case "logout":
                    c = new LogoutCommand(request,response);
                    break;
                case "upgradeuser":
                    c = new UpgradeCommand(request,response);
                    break;
                case "removeadmin":
                    c = new RemoveAdminCommand(request,response);
                    break;
                case "upgradeuserDriver":
                    c = new AddDriverCommand(request,response);
                    break;
                case "removeDriver":
                    c = new RemoveDriverCommand(request,response);
                    break;
                case "addproductcart":
                    c = new AddCartCommand(request,response);
                    break;
                case "removeproductcart":
                    c = new RemoveCartCommand(request,response);
                    break;
                case "subscribe":
                    c = new SubscribeCommand(request,response);
                    break;
                case "finishCheck":
                    c = new CheckoutCommand(request, response);
                    break;
                case "delivery":
                    c = new DeliveryCommand(request, response);
                    break;
                case "addBillingInformation":
                    c = new BillingInformationCommand(request, response);
                    break;
                case "addProduct":
                    c = new AddProductCommand(request, response);
                    break;
                case "deleteProduct":
                    c = new DeleteProductCommand(request, response);
                    break;
                case "searchGames":
                    c = new SearchGamesCommand(request, response);
                    break;
                case "searchMovies":
                    c = new SearchMoviesCommand(request, response);
                    break;
                case "searchTvShows":
                    c = new SearchTvShowsCommand(request, response);
                    break;

                default:
                    String errormessage = "No action value provided in controller";
                    c = new ErrorCommand(request,response,errormessage);
            }
        } else {
            String errormessage = "No action value provided";
            c = new ErrorCommand(request,response,errormessage);
        }
        return c;
    }
}
