package business;

import java.time.LocalDate;
import java.util.Objects;

/**
 * Represents a television show product, extending the generic Product class with TV-specific attributes.
 * This class includes details about the showrunner, format, number of seasons and episodes, runtime, and TV rating.
 */

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

    /**
     * Constructs a Tv instance with specified details including inherited product attributes and TV-specific attributes.
     *
     * @param productid         The unique identifier for the product.
     * @param name              The name of the TV show.
     * @param description       A brief description of the TV show.
     * @param genre             The genre of the TV show.
     * @param studio            The studio that produced the TV show.
     * @param releaseDate       The release date of the TV show.
     * @param price             The price of the TV show.
     * @param quantity          The available quantity of the TV show.
     * @param showrunner        The showrunner of the TV show.
     * @param format            The format of the TV show (streaming or DVD).
     * @param numberOfSeasons   The number of seasons of the TV show.
     * @param numberOfEpisodes  The number of episodes of the TV show.
     * @param runtime           The runtime of episodes.
     * @param tvRating          The TV rating of the show.
     */

    public Tv(int productid, String name, String description, String genre, String studio, LocalDate releaseDate, double price, int quantity, String showrunner, Format.TvFormat format, int numberOfSeasons, int numberOfEpisodes, int runtime, Rating.TvRating tvRating) {
        super(productid, name, description, genre, studio, releaseDate, price, quantity);
        this.showrunner = showrunner;
        this.format = format;
        this.numberOfSeasons = numberOfSeasons;
        this.numberOfEpisodes = numberOfEpisodes;
        this.runtime = runtime;
        this.tvRating = tvRating;
    }

    public Tv(int productid, String showrunner, String format, int noofseasons, int noofepisodes, String runtime, String tvrating) {
    }

    public String getShowrunner() {
        return showrunner;
    }

    /**
     * Sets the showrunner of the TV show. The showrunner's name cannot be null, empty, or exceed a maximum length.
     *
     * @param showrunner The showrunner to set.
     * @throws IllegalArgumentException If the showrunner's name is null, empty, or longer than the maximum allowed length.
     */

    public void setShowrunner(String showrunner) {
        if (showrunner == null || showrunner.trim().isEmpty() || showrunner.length() > MAX_SHOWRUNNER_LENGTH) {
            throw new IllegalArgumentException("Showrunner cannot be null, empty, or longer than " + MAX_SHOWRUNNER_LENGTH + " characters.");
        }
        this.showrunner = showrunner;
    }

    public Format.TvFormat getFormat() {
        return format;
    }

    /**
     * Sets the format of the TV show. The format must not be null.
     *
     * @param format The format to set.
     * @throws IllegalArgumentException If the format is null.
     */

    public void setFormat(Format.TvFormat format) {
        if (format == null) {
            throw new IllegalArgumentException("Format cannot be null.");
        }
        this.format = format;
    }

    public int getNumberOfSeasons() {
        return numberOfSeasons;
    }

    /**
     * Sets the number of seasons of the TV show. The number of seasons must be positive.
     *
     * @param numberOfSeasons The number of seasons to set.
     * @throws IllegalArgumentException If the number of seasons is less than or equal to 0.
     */

    public void setNumberOfSeasons(int numberOfSeasons) {
        if (numberOfSeasons <= 0) {
            throw new IllegalArgumentException("Number of seasons must be positive.");
        }
        this.numberOfSeasons = numberOfSeasons;
    }

    public int getNumberOfEpisodes() {
        return numberOfEpisodes;
    }

    /**
     * Sets the number of episodes of the TV show. The number of episodes must be positive.
     *
     * @param numberOfEpisodes The number of episodes to set.
     * @throws IllegalArgumentException If the number of episodes is less than or equal to 0.
     */

    public void setNumberOfEpisodes(int numberOfEpisodes) {
        if (numberOfEpisodes <= 0) {
            throw new IllegalArgumentException("Number of episodes must be positive.");
        }
        this.numberOfEpisodes = numberOfEpisodes;
    }

    public int getRuntime() {
        return runtime;
    }

    /**
     * Sets the runtime of the TV show episodes. The runtime must be positive.
     *
     * @param runtime The runtime of the episodes to set.
     * @throws IllegalArgumentException If the runtime is less than or equal to 0.
     */
    
    public void setRuntime(int runtime) {
        if (runtime <= 0) {
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
