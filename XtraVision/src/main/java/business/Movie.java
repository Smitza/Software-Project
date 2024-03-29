package business;

import java.time.LocalDate;
import java.util.Objects;

public class Movie extends Product {

    private String director;
    private String format; // streaming or dvd
    private String runtime;
    private String movieRating;

    private static final int MAX_DIRECTOR_LENGTH = 50;


    public Movie() {
    }

    /**
     * Constructs a new Movie instance with specified details including product attributes and movie-specific attributes.
     *
     * @param productid     the unique identifier for the product
     * @param name          the name of the movie
     * @param description   a brief description of the movie
     * @param genre         the genre of the movie
     * @param director      the director of the movie
     * @param studio        the studio that produced the movie
     * @param format        the format of the movie, such as streaming or DVD
     * @param releaseDate   the release date of the movie
     * @param price         the price of the movie
     * @param movieRating   the rating of the movie
     * @param runtime       the runtime of the movie in minutes
     * @param quantity      the available quantity of the movie
     */

    public Movie(int productid, String name, String description, String genre, String director, String studio, String format, LocalDate releaseDate, double price, String movieRating, String runtime, int quantity) {
        super(productid, name, description, genre, studio, releaseDate, price, quantity);
        this.director = director;
        this.format = format;
        this.runtime = runtime;
        this.movieRating = movieRating;
    }

    public Movie(int productid, String director, String format, String runtime, String movierating) {
        super(productid, null, null, null, null, null, 0, 0);
        this.director = director;
        this.format = format;
        this.runtime = runtime;
        this.movieRating = movierating;
    }

    public String getDirector() {
        return director;
    }

    /**
     * Sets the director of the movie. The director's name cannot be null, empty, or longer than 50 characters.
     *
     * @param director the director to set
     * @throws IllegalArgumentException if the director's name is invalid
     */

    public void setDirector(String director) {
        if (director == null || director.trim().isEmpty() || director.length() > MAX_DIRECTOR_LENGTH) {
            throw new IllegalArgumentException("Director cannot be null or empty or longer than " + MAX_DIRECTOR_LENGTH + " characters.");
        }
        this.director = director;
    }

    public String getFormat() {
        return format;
    }

    /**
     * Sets the format of the movie. The format cannot be null.
     *
     * @param format the format to set
     * @throws IllegalArgumentException if the format is null
     */

    public void setFormat(String format) {
        if (format == null) {
            throw new IllegalArgumentException("Format cannot be null.");
        }
        this.format = format;
    }

    public String getRuntime() {
        return runtime;
    }

    /**
     * Sets the runtime of the movie. The runtime must be a positive number.
     *
     * @param runtime the runtime to set in minutes
     * @throws IllegalArgumentException if the runtime is not positive
     */

    public void setRuntime(String runtime) {
        if (runtime.isEmpty()) {
            throw new IllegalArgumentException("Runtime cannot be null.");
        }
        this.runtime = runtime;
    }

    public String getMovieRating() {
        return movieRating;
    }

    /**
     * Sets the movie rating. The movie rating cannot be null.
     *
     * @param movieRating the movie rating to set
     * @throws IllegalArgumentException if the movie rating is null
     */

    public void setMovieRating(String movieRating) {
        if (movieRating == null) {
            throw new IllegalArgumentException("Movie rating cannot be null.");
        }
        this.movieRating = movieRating;
    }

    @Override
    public String toString() {
        return "Movie{" +
                super.toString() +
                "director='" + director + '\'' +
                ", format=" + format +
                ", runtime=" + runtime +
                ", movieRating=" + movieRating +
                "} ";
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Movie)) return false;
        if (!super.equals(o)) return false;
        Movie movie = (Movie) o;
        return Objects.equals(director, movie.director) && Objects.equals(format, movie.format) && Objects.equals(runtime, movie.runtime) && Objects.equals(movieRating, movie.movieRating);
    }

    @Override
    public int hashCode() {
        return Objects.hash(super.hashCode(), director, format, runtime, movieRating);
    }
}
