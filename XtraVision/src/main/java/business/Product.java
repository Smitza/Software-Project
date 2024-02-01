package business;

import java.time.LocalDate;
import java.util.Objects;

public class Product {

    private int productid;
    private String name;
    private String description;
    private String genre;
    private String studio;
    private LocalDate releaseDate;
    private double price;
    private int quantity;

    private static final int MAX_NAME_LENGTH = 100;
    private static final int MAX_DESCRIPTION_LENGTH = 500;
    private static final int MAX_GENRE_LENGTH = 50;
    private static final int MAX_STUDIO_LENGTH = 50;
    private static final double MAX_PRICE = 100.0;
    private static final int MAX_PRODUCT = 1000;


    public Product() {
    }

    public Product(int productid, String name, String description, String genre, String studio, LocalDate releaseDate, double price, int quantity) {
        this.productid = productid;
        this.name = name;
        this.description = description;
        this.genre = genre;
        this.studio = studio;
        this.releaseDate = releaseDate;
        this.price = price;
        this.quantity = quantity;
    }


    public int getProductId() {
        return productid;
    }

    public void setProductId(int productid) {
        if (Product.this.productid <= 0) {
            throw new IllegalArgumentException("ID must be positive.");
        }
        this.productid = productid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        if (name == null || name.trim().isEmpty() || name.length() > MAX_NAME_LENGTH) {
            throw new IllegalArgumentException("Name cannot be null, empty, or longer than " + MAX_NAME_LENGTH + " characters.");
        }
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        if (description == null || description.trim().isEmpty() || description.length() > MAX_DESCRIPTION_LENGTH) {
            throw new IllegalArgumentException("Description cannot be null, empty or longer than " + MAX_DESCRIPTION_LENGTH + " characters.");
        }
        this.description = description;
    }

    public String getGenre() {
        return genre;
    }

    public void setGenre(String genre) {
        if (genre == null || genre.trim().isEmpty() || genre.length() > MAX_GENRE_LENGTH) {
            throw new IllegalArgumentException("Genre cannot be null, empty or longer than " + MAX_GENRE_LENGTH + " characters.");
        }
        this.genre = genre;
    }

    public String getStudio() {
        return studio;
    }

    public void setStudio(String studio) {
        if (studio == null || studio.trim().isEmpty() || studio.length() > MAX_STUDIO_LENGTH) {
            throw new IllegalArgumentException("Studio cannot be null, empty or longer than " + MAX_STUDIO_LENGTH + " characters.");
        }
        this.studio = studio;
    }

    public LocalDate getReleaseDate() {
        return releaseDate;
    }

    public void setReleaseDate(LocalDate releaseDate) {
        if (releaseDate == null || releaseDate.isAfter(LocalDate.now())) { //should we allow for upcoming releases?
            throw new IllegalArgumentException("Release date cannot be null or in the future.");
        }
        this.releaseDate = releaseDate;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        if (price < 0.0 || price > MAX_PRICE) {
            throw new IllegalArgumentException("Price must be positive and not exceed €" + MAX_PRICE);
        }
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        if (quantity < 0 || quantity > MAX_PRODUCT) {
            throw new IllegalArgumentException("Product must be positive and not exceed " + MAX_PRODUCT);
        }
    }
    }

    @Override
    public String toString() {
        return "MediaEntity{" +
                "id=" + productid +
                ", name='" + name + '\'' +
                ", description='" + description + '\'' +
                ", genre='" + genre + '\'' +
                ", studio='" + studio + '\'' +
                ", releaseDate=" + releaseDate +
                ", price=" + price +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Product that = (Product) o;
        return productid == that.productid && Objects.equals(name, that.name) && Objects.equals(genre, that.genre) && Objects.equals(studio, that.studio) && Objects.equals(releaseDate, that.releaseDate);
    }

    @Override
    public int hashCode() {
        return Objects.hash(productid, name, genre, studio, releaseDate);
    }




