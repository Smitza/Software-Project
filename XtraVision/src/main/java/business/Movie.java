package business;

import java.time.LocalDate;
import java.util.Objects;

public class Movie extends MediaEntity {

    private String director;
    private Platform.MoviePlatform format; // streaming or dvd
    private int runtime;
    private Rating.MovieRating movieRating;

    private static final int MAX_DIRECTOR_LENGTH = 50;


    public Movie() {
    }

    public Movie(int id, String name, String description, String genre, String director, String studio, Platform.MoviePlatform format, LocalDate releaseDate, double price, Rating.MovieRating movieRating, int runtime) {
        super(id, name, description, genre, studio, releaseDate, price);
        this.director = director;
        this.format = format;
        this.runtime = runtime;
        this.movieRating = movieRating;
    }

    public String getDirector() {
        return director;
    }

    public void setDirector(String director) {
        if (director == null || director.trim().isEmpty() || director.length() > MAX_DIRECTOR_LENGTH) {
            throw new IllegalArgumentException("Director cannot be null or empty or longer than " + MAX_DIRECTOR_LENGTH + " characters.");
        }
        this.director = director;
    }

    public Platform.MoviePlatform getFormat() {
        return format;
    }

    public void setFormat(Platform.MoviePlatform format) {
        if (format == null) {
            throw new IllegalArgumentException("Format cannot be null.");
        }
        this.format = format;
    }

    public int getRuntime() {
        return runtime;
    }

    public void setRuntime(int runtime) {
        if (runtime <= 0) {
            throw new IllegalArgumentException("Runtime must be positive.");
        }
        this.runtime = runtime;
    }

    public Rating.MovieRating getMovieRating() {
        return movieRating;
    }

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
