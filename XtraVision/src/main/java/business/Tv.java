package business;

import java.time.LocalDate;
import java.util.Objects;

public class Tv {
    private int id;
    private String name;
    private String description;
    private String genre;
    private String showrunner;
    private String studio;
    private String format; // streaming or dvd
    private LocalDate releaseDate;
    private double price;
    private int numberOfSeasons;
    private int numberOfEpisodes;
    private int runtime;
    private Rating.TvRating tvRating;

    public Tv() {
    }

    public Tv(int id, String name, String description, String genre, String showrunner, String studio, String format, LocalDate releaseDate, double price, int numberOfSeasons, int numberOfEpisodes, int runtime, Rating.TvRating tvRating) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.genre = genre;
        this.showrunner = showrunner;
        this.studio = studio;
        this.format = format;
        this.releaseDate = releaseDate;
        this.price = price;
        this.numberOfSeasons = numberOfSeasons;
        this.numberOfEpisodes = numberOfEpisodes;
        this.runtime = runtime;
        this.tvRating = tvRating;
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

    public String getShowrunner() {
        return showrunner;
    }

    public void setShowrunner(String showrunner) {
        this.showrunner = showrunner;
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

    public int getNumberOfSeasons() {
        return numberOfSeasons;
    }

    public void setNumberOfSeasons(int numberOfSeasons) {
        this.numberOfSeasons = numberOfSeasons;
    }

    public int getNumberOfEpisodes() {
        return numberOfEpisodes;
    }

    public void setNumberOfEpisodes(int numberOfEpisodes) {
        this.numberOfEpisodes = numberOfEpisodes;
    }

    public int getRuntime() {
        return runtime;
    }

    public void setRuntime(int runtime) {
        this.runtime = runtime;
    }

    public Rating.TvRating getTvRating() {
        return tvRating;
    }

    public void setTvRating(Rating.TvRating tvRating) {
        this.tvRating = tvRating;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Tv tv = (Tv) o;
        return id == tv.id;
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }
}
