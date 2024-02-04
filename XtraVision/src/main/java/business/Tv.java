package business;

import java.time.LocalDate;
import java.util.Objects;

public class Tv extends Product {
    private String showrunner;
    private Format.TvFormat format; // streaming or dvd
    private int numberOfSeasons;
    private int numberOfEpisodes;
    private int runtime; //should we do max runtime??
    private Rating.TvRating tvRating;

    private static final int MAX_SHOWRUNNER_LENGTH = 50;


    public Tv() {
    }

    public Tv(int id, String name, String description, String genre, String studio, LocalDate releaseDate, double price, String showrunner, Format.TvFormat format, int numberOfSeasons, int numberOfEpisodes, int runtime, Rating.TvRating tvRating) {
        super(id, name, description, genre, studio, releaseDate, price);
        this.showrunner = showrunner;
        this.format = format;
        this.numberOfSeasons = numberOfSeasons;
        this.numberOfEpisodes = numberOfEpisodes;
        this.runtime = runtime;
        this.tvRating = tvRating;
    }

    public String getShowrunner() {
        return showrunner;
    }

    public void setShowrunner(String showrunner) {
        if (showrunner == null || showrunner.trim().isEmpty() || showrunner.length() > MAX_SHOWRUNNER_LENGTH) {
            throw new IllegalArgumentException("Showrunner cannot be null, empty, or longer than " + MAX_SHOWRUNNER_LENGTH + " characters.");
        }
        this.showrunner = showrunner;
    }

    public Format.TvFormat getFormat() {
        return format;
    }

    public void setFormat(Format.TvFormat format) {
        if (format == null) {
            throw new IllegalArgumentException("Format cannot be null.");
        }
        this.format = format;
    }

    public int getNumberOfSeasons() {
        return numberOfSeasons;
    }

    public void setNumberOfSeasons(int numberOfSeasons) {
        if (numberOfSeasons <= 0) {
            throw new IllegalArgumentException("Number of seasons must be positive.");
        }
        this.numberOfSeasons = numberOfSeasons;
    }

    public int getNumberOfEpisodes() {
        return numberOfEpisodes;
    }

    public void setNumberOfEpisodes(int numberOfEpisodes) {
        if (numberOfEpisodes <= 0) {
            throw new IllegalArgumentException("Number of episodes must be positive.");
        }
        this.numberOfEpisodes = numberOfEpisodes;
    }

    public int getRuntime() {
        return runtime;
    }

    public void setRuntime(int runtime) {
        if (id <= 0) {
            throw new IllegalArgumentException("Runtime must be positive.");
        }
    }

    public Rating.TvRating getTvRating() {
        return tvRating;
    }

    public void setTvRating(Rating.TvRating tvRating) {
        if (tvRating == null) {
            throw new IllegalArgumentException("Tv rating cannot be null.");
        }
        this.tvRating = tvRating;
    }

    @Override
    public String toString() {
        return "Tv{" +
                super.toString() +
                "showrunner='" + showrunner + '\'' +
                ", format=" + format +
                ", numberOfSeasons=" + numberOfSeasons +
                ", numberOfEpisodes=" + numberOfEpisodes +
                ", runtime=" + runtime +
                ", tvRating=" + tvRating +
                "} ";
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        if (!super.equals(o)) return false;
        Tv tv = (Tv) o;
        return numberOfSeasons == tv.numberOfSeasons && numberOfEpisodes == tv.numberOfEpisodes && runtime == tv.runtime && Objects.equals(showrunner, tv.showrunner) && format == tv.format && tvRating == tv.tvRating;
    }

    @Override
    public int hashCode() {
        return Objects.hash(super.hashCode(), showrunner, format, numberOfSeasons, numberOfEpisodes, runtime, tvRating);
    }
}
