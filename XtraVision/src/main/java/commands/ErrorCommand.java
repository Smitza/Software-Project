package commands;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class ErrorCommand implements Command{
    private HttpServletRequest request;
    private HttpServletResponse response;
    private String errorMessage;

    public ErrorCommand(HttpServletRequest request, HttpServletResponse response, String errorMessage) {
        this.request = request;
        this.response = response;
        this.errorMessage = errorMessage;
    }

    @Override
    public String execute() {
        HttpSession session = request.getSession(true);
        session.setAttribute("errorMessage", errorMessage);
        return "error.jsp";
    }
}
