package business;

import java.time.LocalDate;
import java.util.Objects;

public class Game {

    private int id;
    private String name;
    private String description;
    private String genre;
    private String developer;
    private String publisher;
    private String platform;
    private LocalDate releaseDate;
    private double price;
    private Rating.GameRating gameRating;

    public Game() {
    }

    public Game(int id, String name, String description, String genre, String developer, String publisher, String platform, LocalDate releaseDate, double price, Rating.GameRating gameRating) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.genre = genre;
        this.developer = developer;
        this.publisher = publisher;
        this.platform = platform;
        this.releaseDate = releaseDate;
        this.price = price;
        this.gameRating = gameRating;
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

    public String getDeveloper() {
        return developer;
    }

    public void setDeveloper(String developer) {
        this.developer = developer;
    }

    public String getPublisher() {
        return publisher;
    }

    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }

    public String getPlatform() {
        return platform;
    }

    public void setPlatform(String platform) {
        this.platform = platform;
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

    public Rating.GameRating getGameRating() {
        return gameRating;
    }

    public void setGameRating(Rating.GameRating gameRating) {
        this.gameRating = gameRating;
    }

    @Override
    public String toString() {
        return "Game{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", description='" + description + '\'' +
                ", genre='" + genre + '\'' +
                ", developer='" + developer + '\'' +
                ", publisher='" + publisher + '\'' +
                ", platform='" + platform + '\'' +
                ", releaseDate=" + releaseDate +
                ", price=" + price +
                ", gameRating=" + gameRating +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Game game = (Game) o;
        return id == game.id;
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }
}