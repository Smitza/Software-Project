package commands;

import business.Product;
import daos.ProductDao;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

public class SearchMoviesCommand implements Command {
    private final HttpServletRequest request;
    private final HttpServletResponse response;

    public SearchMoviesCommand(HttpServletRequest request, HttpServletResponse response) {
        this.request = request;
        this.response = response;
    }

    @Override
    public String execute() {
        HttpSession session = request.getSession();
        String destination = "moviesResults.jsp";
        String searchQuery = request.getParameter("searchQuery");

        if (searchQuery == null || searchQuery.trim().isEmpty()) {
            session.setAttribute("errorMessage", "Search query cannot be empty.");
            return "error.jsp";
        }

        try {
            ProductDao productDao = new ProductDao("xtra");
            List<Product> movieProducts = productDao.searchMoviesByTitle(searchQuery.trim());

            if (movieProducts.isEmpty()) {
                session.setAttribute("noResultsMessage", "No movies found matching '" + searchQuery.trim() + "'.");
            } else {
                session.setAttribute("movieProducts", movieProducts);
            }
        } catch (Exception e) {
            session.setAttribute("errorMessage", "Error during the search process: " + e.getMessage());
            destination = "error.jsp";
        }

        return destination;
    }
}

