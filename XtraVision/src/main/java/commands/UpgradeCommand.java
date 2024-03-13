package commands;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class UpgradeCommand implements Command {

    private HttpServletRequest request;
    private HttpServletResponse response;
    public UpgradeCommand(HttpServletRequest request, HttpServletResponse response) {
        this.request = request;
        this.response = response;
    }

    @Override
    public String execute() {
        return null;
    }
}
