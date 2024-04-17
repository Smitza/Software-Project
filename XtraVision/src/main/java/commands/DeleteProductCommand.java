package commands;

import daos.ProductDao;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class DeleteProductCommand implements Command {

    private final HttpServletRequest request;
    private final HttpServletResponse response;

    public DeleteProductCommand(HttpServletRequest request, HttpServletResponse response) {
        this.request = request;
        this.response = response;
    }

    @Override
    public String execute() {
        String destination = "gameslist.jsp";
        int productId = Integer.parseInt(request.getParameter("productId"));

        ProductDao productDao = new ProductDao("xtra");
        boolean deleted = productDao.deleteProduct(productId);
        return destination;
    }
}
