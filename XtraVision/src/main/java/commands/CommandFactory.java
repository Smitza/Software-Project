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
                case "addproductcart":
                    c = new AddCartCommand(request,response);
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
