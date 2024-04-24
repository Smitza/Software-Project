package commands;

import business.*;
import daos.ProductDao;
import exceptions.DaoException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalDate;

public class AddProductCommand implements Command {

    private HttpServletRequest request;
    private HttpServletResponse response;

    public AddProductCommand(HttpServletRequest request, HttpServletResponse response) {
        this.request = request;
        this.response = response;
    }

    @Override
    public String execute() {
        // Retrieve form data
        String productType = request.getParameter("productType");
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String genre = request.getParameter("genre");
        String studio = request.getParameter("studio");
        LocalDate releaseDate = LocalDate.parse(request.getParameter("releaseDate"));
        double price = Double.parseDouble(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("quantity")); // You need to add quantity field in the form

        ProductDao productDao = new ProductDao("your_db_name");

        try {
            // Depending on the product type, create an appropriate instance of Product subclass
            Product product;
            switch (productType) {
                case "Game":
                    String publisher = request.getParameter("publisher");
                    String platform = request.getParameter("platform");
                    String gameRating = request.getParameter("gameRating");
                    product = new Game(0, name, description, genre, studio, publisher, platform, releaseDate, price, quantity, gameRating);
                    break;
                case "Movie":
                    String director = request.getParameter("director");
                    String format = request.getParameter("format");
                    String runtime = request.getParameter("runtime");
                    String movieRating = request.getParameter("movieRating");
                    product = new Movie(0, name, description, genre, director, studio, format, releaseDate, price, movieRating, runtime, quantity);
                    break;
                case "Tv":
                    String showrunner = request.getParameter("showrunner");
                    int noOfSeasons = Integer.parseInt(request.getParameter("noOfSeasons"));
                    int noOfEpisodes = Integer.parseInt(request.getParameter("noOfEpisodes"));
                    String tvRating = request.getParameter("tvRating");
                    product = new Tv(0, name, description, genre, studio, releaseDate, price, quantity, showrunner, format, noOfSeasons, noOfEpisodes, runtime, tvRating);
                    break;
                default:
                    // Handle unknown product type
                    return "error.jsp"; // Redirect to error page
            }

            // Add product to the database
            if (productDao.addProduct(product)) {
                // Product added successfully
                return "success.jsp"; // Redirect to success page
            } else {
                // Failed to add product
                return "error.jsp"; // Redirect to error page
            }
        } catch (DaoException e) {
            e.printStackTrace(); // Log the exception
            return "error.jsp"; // Redirect to error page
        }
    }
}
