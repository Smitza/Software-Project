package business;

import java.time.LocalDate;

public class Game extends MediaEntity{

    private String publisher;
    private Platform.GamePlatform platform; // 4 possible platforms
    private Rating.GameRating gameRating;

    private static final int MAX_PUBLISHER_LENGTH = 50;

    public Game() {
    }

    public Game(int id, String name, String description, String genre, String studio, String publisher, Platform.GamePlatform platform, LocalDate releaseDate, double price, Rating.GameRating gameRating) {
        super(id, name, description, genre, studio, releaseDate, price);
        this.publisher = publisher;
        this.platform = platform;
        this.gameRating = gameRating;

    }

    public String getPublisher() {
        return publisher;
    }

    public void setPublisher(String publisher) {
        if (publisher == null || publisher.trim().isEmpty() || publisher.length() > MAX_PUBLISHER_LENGTH){
            throw new IllegalArgumentException("Publisher cannot be null, empty or longer than " + MAX_PUBLISHER_LENGTH + " characters");
        }
        this.publisher = publisher;
    }

    public Platform.GamePlatform getPlatform() {
        return platform;
    }

    public void setPlatform(Platform.GamePlatform platform) {
        if (platform == null) {
            throw new IllegalArgumentException("Platform cannot be null");
        }
        this.platform = platform;
    }

    public Rating.GameRating getGameRating() {
        return gameRating;
    }

    public void setGameRating(Rating.GameRating gameRating) {
        if (gameRating == null ) {
            throw new IllegalArgumentException("Game rating cannot be null");
        }
        this.gameRating = gameRating;
    }

    @Override
    public String toString() {
        return "Game{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", description='" + description + '\'' +
                ", genre='" + genre + '\'' +
                ", studio='" + studio + '\'' + // ", developer='" + developer + '\'' + put this here??
                ", publisher='" + publisher + '\'' +
                ", platform=" + platform + '\'' +
                ", releaseDate=" + releaseDate +
                ", price=" + price +
                ", gameRating=" + gameRating +
                '}';
    }
}

