package business;

import java.time.LocalDate;
import java.util.Objects;

public class Movie {

    private int id;
    private String name;
    private String description;
    private String genre;
    private String director;
    private String studio;
    private String format; // streaming or dvd
    private LocalDate releaseDate;
    private double price;
    private Rating.MovieRating movieRating;

    public Movie() {
    }

    public Movie(int id, String name, String description, String genre, String director, String studio, String format, LocalDate releaseDate, double price, Rating.MovieRating movieRating) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.genre = genre;
        this.director = director;
        this.studio = studio;
        this.format = format;
        this.releaseDate = releaseDate;
        this.price = price;
        this.movieRating = movieRating;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getGenre() {
        return genre;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }

    public String getDirector() {
        return director;
    }

    public void setDirector(String director) {
        this.director = director;
    }

    public String getStudio() {
        return studio;
    }

    public void setStudio(String studio) {
        this.studio = studio;
    }

    public String getFormat() {
        return format;
    }

    public void setFormat(String format) {
        this.format = format;
    }

    public LocalDate getReleaseDate() {
        return releaseDate;
    }

    public void setReleaseDate(LocalDate releaseDate) {
        this.releaseDate = releaseDate;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public Rating.MovieRating getMovieRating() {
        return movieRating;
    }

    public void setMovieRating(Rating.MovieRating movieRating) {
        this.movieRating = movieRating;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Movie movie = (Movie) o;
        return id == movie.id;
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }
}
