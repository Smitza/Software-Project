package business;

import java.time.LocalDate;
import java.util.Objects;

public class Movie extends Product {

    private String director;
    private Platform.MoviePlatform format; // streaming or dvd
    private int runtime;
    private Rating.MovieRating movieRating;

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

    public Movie(int productid, String name, String description, String genre, String director, String studio, Platform.MoviePlatform format, LocalDate releaseDate, double price, Rating.MovieRating movieRating, int runtime, int quantity) {
        super(productid, name, description, genre, studio, releaseDate, price, quantity);
        this.director = director;
        this.format = format;
        this.runtime = runtime;
        this.movieRating = movieRating;
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

    public Platform.MoviePlatform getFormat() {
        return format;
    }

    /**
     * Sets the format of the movie. The format cannot be null.
     *
     * @param format the format to set
     * @throws IllegalArgumentException if the format is null
     */

    public void setFormat(Platform.MoviePlatform format) {
        if (format == null) {
            throw new IllegalArgumentException("Format cannot be null.");
        }
        this.format = format;
    }

    public int getRuntime() {
        return runtime;
    }

    /**
     * Sets the runtime of the movie. The runtime must be a positive number.
     *
     * @param runtime the runtime to set in minutes
     * @throws IllegalArgumentException if the runtime is not positive
     */

    public void setRuntime(int runtime) {
        if (runtime <= 0) {
            throw new IllegalArgumentException("Runtime must be positive.");
        }
        this.runtime = runtime;
    }

    public Rating.MovieRating getMovieRating() {
        return movieRating;
    }

    /**
     * Sets the movie rating. The movie rating cannot be null.
     *
     * @param movieRating the movie rating to set
     * @throws IllegalArgumentException if the movie rating is null
     */

    public void setMovieRating(Rating.MovieRating movieRating) {
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
        if (o == null || getClass() != o.getClass()) return false;
        if (!super.equals(o)) return false;
        Movie movie = (Movie) o;
        return runtime == movie.runtime && Objects.equals(director, movie.director) && format == movie.format && movieRating == movie.movieRating;
    }

    @Override
    public int hashCode() {
        return Objects.hash(super.hashCode(), director, format, runtime, movieRating);
    }
}
