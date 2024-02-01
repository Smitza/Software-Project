package business;

import java.time.LocalDate;
import java.util.Objects;

public abstract class MediaEntity {

    protected int id;
    protected String name;
    protected String description;
    protected String genre; // might add enum later for better organization
    protected String studio; //production studio / game devs, could change name in frontend to prevent confusion, if needed
    protected LocalDate releaseDate; //might consider how we handle future releases or upcoming titles
    protected double price; //should use Bigdecimal, may fix later?

    private static final int MAX_NAME_LENGTH = 100;
    private static final int MAX_DESCRIPTION_LENGTH = 500;
    private static final int MAX_GENRE_LENGTH = 50;
    private static final int MAX_STUDIO_LENGTH = 50;
    private static final double MAX_PRICE = 100.0;

    public MediaEntity() {
    }

    public MediaEntity(int id, String name, String description, String genre, String studio, LocalDate releaseDate, double price) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.genre = genre;
        this.studio = studio;
        this.releaseDate = releaseDate;
        this.price = price;
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        if (id <= 0) {
            throw new IllegalArgumentException("ID must be positive.");
        }
        this.id = id;
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

    @Override
    public String toString() {
        return "MediaEntity{" +
                "id=" + id +
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
        MediaEntity that = (MediaEntity) o;
        return id == that.id && Objects.equals(name, that.name) && Objects.equals(genre, that.genre) && Objects.equals(studio, that.studio) && Objects.equals(releaseDate, that.releaseDate);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, name, genre, studio, releaseDate);
    }
}