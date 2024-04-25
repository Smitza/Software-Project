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
        int quantity = 0;

        ProductDao productDao = new ProductDao("xtra");


        try {
            Product product;
            switch (productType) {
                case "Game":
                    String publisher = request.getParameter("publisher");
                    String platform = request.getParameter("platform");
                    String gameRating = request.getParameter("gameRating");
                    product = new Game(0, name, description, genre, studio, publisher, platform, releaseDate, price, quantity, gameRating);
                    productDao.addProduct(product);
                    break;
                case "Movie":
                    String director = request.getParameter("director");
                    String movieFormat = request.getParameter("movieFormat");
                    String movieRuntime = request.getParameter("movieRuntime");
                    String movieRating = request.getParameter("movieRating");
                    product = new Movie(0, name, description, genre, director, studio, movieFormat, releaseDate, price, movieRating, movieRuntime, quantity);
                    productDao.addProduct(product);
                    break;
                case "Tv":
                    String showrunner = request.getParameter("showrunner");
                    String tvFormat = request.getParameter("tvFormat");
                    String tvRuntime = request.getParameter("tvRuntime");
                    int noOfSeasons = Integer.parseInt(request.getParameter("noOfSeasons"));
                    int noOfEpisodes = Integer.parseInt(request.getParameter("noOfEpisodes"));
                    String tvRating = request.getParameter("tvRating");
                    product = new Tv(0, name, description, genre, studio, releaseDate, price, quantity, showrunner, tvFormat, noOfSeasons, noOfEpisodes, tvRuntime, tvRating);
                    productDao.addProduct(product);
                    break;
                default:
                    return "error.jsp"; // Redirect to error page
            }

            // Add product to the database
            if (productDao.addProduct(product)) {
                return "admincontrol.jsp";
            } else {
                // Failed to add product
                return "error.jsp"; // Redirect to error page
            }
        } catch (DaoException e) {
            System.out.println("An exception occured when trying to add the product: " +e.getMessage());
            return "error.jsp"; // Redirect to error page
        }
    }
}
